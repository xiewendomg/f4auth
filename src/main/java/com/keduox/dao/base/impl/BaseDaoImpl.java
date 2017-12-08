package com.keduox.dao.base.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Objects;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.annotations.ManyToAny;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.keduox.dao.base.BaseDao;
import com.keduox.entity.crawler.CrawlerCookie;
import com.keduox.entity.crawler.CrawlerSpider;
import com.keduox.util.FixedFieldUtil;
import com.keduox.util.HibernateTypeEnum;
import com.keduox.util.PageRequestUtil;
import com.keduox.util.PagingData;
import com.keduox.util.QueryParams;
import com.keduox.util.ReflectUtil;
import com.keduox.util.vo.QueryParamsMapVo;

@Repository("baseDao")
@Lazy(true)
public class BaseDaoImpl<T, ID extends Serializable>   implements BaseDao<T, ID> {

	@Autowired
    private SessionFactory sessionFactory;
    protected Class<T> entityClass;
    @Autowired
    private PageRequestUtil requestUtil;
 
    public BaseDaoImpl() {
 
    }
 

    /**
     * 得到类对象（T）
     * @return
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
	protected Class getEntityClass() {
        if (entityClass == null) {
            entityClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
        }
        return entityClass;
    }
 
    /**
     * <保存实体>
     * <完整保存实体>
     * @param t 实体参数
     * @see com.itv.launcher.util.IBaseDao#save(java.lang.Object)
     */
    @Override
    public void save(T t) {
        this.getSession().save(t);
        
    }
    
    
    /**
     * <保存或者更新实体>
     * @param t 实体
     * @see com.itv.launcher.util.IBaseDao#saveOrUpdate(java.lang.Object)
     */
    @Override
    public void saveOrUpdate(T t) {
        this.getSession().saveOrUpdate(t);
    }
    
    /**
     * @param sessionFactory the sessionFactory to set
     */
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
     
    /**
     * 
     * @return session
     */
    public Session getSession() {
        //需要开启事物，才能得到CurrentSession
        return sessionFactory.getCurrentSession();
    }

    /**
     * 通过参数List<integer> 和类对象返回多条记录
     */
	@SuppressWarnings("unchecked")
	@Override//通过参数list<id(主键)>和类对象返回多条记录
	public List<T> findByBatchListIds(Class<T> cls, List<Integer> list) {
		Criteria criteria=this.getSession().createCriteria(cls);
		criteria.add(Restrictions.in(FixedFieldUtil.PK_FIELD, list));
		return criteria.list();
	}


	/**
	 * 批量删除，满10提交删除方法
	 */
	@Override
	public void deleteBatch(List<T> list) {
		Session session = null;  
        int i=0;
        int size=list.size();
        for(T t:list){
        	i++;
        	session = this.getSession();
        	session.delete(t);
        	 if ((i % 10 == 0)||i>=size) {  
                 session.flush();  
                 session.clear();  
             }  
        }
	}

	@Override//得到分页的数据
	public PagingData pagingQuery(String hql, String countQuery,
			QueryParams queryParamsMap) {
		Session session=this.getSession();
				
		Query query=session.createQuery(hql);
		
		query.setFirstResult(requestUtil.getFirstResult());
		
		query.setMaxResults(requestUtil.getMaxResults());
		
		PagingData pd=new PagingData();
		//将查询条件加上
		parserParams(query,queryParamsMap);
		
		pd.setRows(query.list());
		pd.setTotal(pagingQueryCount(countQuery,queryParamsMap));
		return pd;
	}
	/**
	 * 
	* @Title: parserParams
	* @Description: 封装参数公共方法
	* @param @param query
	* @param @param queryParamsMap    设定文件
	* @return void    返回类型
	* @throws
	 */
	@SuppressWarnings({ "static-access", "rawtypes" })
	private void parserParams(Query query,QueryParams queryParamsMap){
		List<QueryParamsMapVo> list=queryParamsMap.list;
		for(QueryParamsMapVo vo:list){
			if(vo.getType().equals(HibernateTypeEnum.BASIC_TYPE)){
				
				query.setParameter(vo.getField(), vo.getValue());
				
			}else if(vo.getType().equals(HibernateTypeEnum.LIST_TYPE)){
				query.setParameterList(vo.getField(), (List)vo.getValue());
			}
		}
	}
	
	private Integer pagingQueryCount(String countQuery,QueryParams queryParamsMap){
		Session session=this.getSession();//得到数据库表的总条数
		Query query=session.createQuery(countQuery);
		parserParams(query,queryParamsMap);
		return ((Long)query.uniqueResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public T get(T t, Integer id) {
		 return (T) this.getSession().get(t.getClass(), id);
	}

	@Override
	public void merge(T t) {
		this.getSession().merge(t);
	}
	@SuppressWarnings("rawtypes")
	@Override//验证字段是否存在
	public Object get( Class cls, Integer id, String fieldName, Object fieldValue) {
		Criteria criteria=this.getSession().createCriteria(cls);	
		
		criteria.add(Restrictions.eq(fieldName,fieldValue));
		if(id!=null){
			criteria.add(Restrictions.ne("id", id));
		}
		return  criteria.uniqueResult();
	}

	@SuppressWarnings({"unchecked","rawtypes"})	
	@Override
	public T findById(Class cls, Integer id) {
		 return (T) this.getSession().get(cls, id);
	}

	@Override
	public List<T> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override//根据taskId返回对象
	public T queryByTaskId(Class cls,String fieldName,Object fieldValue,String[] objs) {
		Criteria criteria=this.getSession().createCriteria(getEntityClass());
		ProjectionList   proList   =   Projections.projectionList();
		//proList.add(Projections.property(obj),obj);后一个obj是as的对象 ，前一个是实体内的属性名不是数据库字段
		for(String obj:objs){
			proList.add(Projections.property(obj),obj);
		}
		criteria.add(Restrictions.eq(fieldName,fieldValue));
		criteria.setProjection(proList);
		criteria.setResultTransformer(Transformers.aliasToBean(cls));
		return  (T)criteria.uniqueResult();
	}

	@Override//根据外键返回对象集合lIST
	public List queryByForeignKey(Class cls,String fieldName,Object fieldValue,String[] objs) {
		Criteria criteria=this.getSession().createCriteria(getEntityClass());	
		ProjectionList   proList   =   Projections.projectionList();
		for(String obj:objs){
			proList.add(Projections.property(obj),obj);
		}	
		criteria.add(Restrictions.eq(fieldName,fieldValue));						
		criteria.setProjection(proList);
		criteria.setResultTransformer(Transformers.aliasToBean(cls));
		return  criteria.list();
	}
}
