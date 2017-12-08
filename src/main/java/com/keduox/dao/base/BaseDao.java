package com.keduox.dao.base;

import java.io.Serializable;
import java.util.List;

import com.keduox.util.PagingData;
import com.keduox.util.QueryParams;

/**
 * 
* @ClassName: BaseDao
* @Description: 项目中基础DAO类
* @author 谢文东
* @date 2015年6月30日 下午1:51:21
*
 */
public interface BaseDao<T, ID extends Serializable> {
	 /**
     * <保存实体>
     * <完整保存实体>
     * @param t 实体参数
     */
    public abstract void save(T t);
 
    /**
     * <保存或者更新实体>
     * @param t 实体
     */
    public abstract void saveOrUpdate(T t);
    
    public abstract void merge(T t);
    
    /**
    * @Title: findByBatchListIds
    * @Description: TODO(这里用一句话描述这个方法的作用)
    * @param @return    设定文件
    * @return List<T>    返回类型
    * @throws
     */
    List<T> findByBatchListIds(Class<T> cls,List<Integer> list);
    /**
    * @Title: deleteBatch
    * @Description: 批量删除指定对象
    * @param     设定文件
    * @return void    返回类型
    * @throws
     */
    void deleteBatch(List<T> list);
    
    /**
     * 
    * @Title: pagingQuery
    * @Description: TODO(这里用一句话描述这个方法的作用)
    * @param @param hql
    * @param @param countQuery
    * @param @param params
    * @param @return    设定文件
    * @return PagingData    返回类型
    * @throws
     */
    public PagingData pagingQuery(String hql,String countQuery,QueryParams queryParamsMap);
    
    
    /**
     * 通过主键得到相应的对象值
    * @Title: get
    * @Description: TODO(这里用一句话描述这个方法的作用)
    * @param @param t
    * @param @param id    设定文件
    * @return void    返回类型
    * @throws
     */
    public abstract T get(T t,Integer id);
    
     public abstract T findById(Class cls,Integer id);
    /**
     * 通过字段名判断字段的值是否存在，id可为空，则表示新增
     * @param t
     * @param id
     * @param fieldName
     * @param filedValue
     * @return
     */
    public abstract Object get(Class cls,Integer id,String fieldName,Object fieldValue);

	/**
	 * 返回list集合
	 * 
	 */
    public abstract List<T> getList();
    /**
     * 通过taskId返回一对一对象
     * @param cls
     * @param fieldName
     * @param fieldValue
     * @param objs
     * @return
     */
    Object queryByTaskId(Class cls,String fieldName,Object fieldValue,String[] objs);
    /**
     * 通过外键返回List集合
     * @param cls
     * @param fieldName
     * @param fieldValue
     * @param objs
     * @return
     */
	List queryByForeignKey(Class cls, String fieldName, Object fieldValue, String[] objs);
}
