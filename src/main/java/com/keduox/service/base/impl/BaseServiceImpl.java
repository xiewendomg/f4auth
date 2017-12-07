package com.keduox.service.base.impl;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.keduox.dao.base.BaseDao;
import com.keduox.service.base.BaseService;
import com.keduox.util.DateUtils;
import com.keduox.util.FixedFieldUtil;
import com.keduox.util.ReflectUtil;
import com.keduox.util.StatusUtil;

public class BaseServiceImpl implements BaseService {

	@SuppressWarnings("rawtypes")
	@Autowired
	private BaseDao baseDao;
	
	@SuppressWarnings("unchecked")
	@Override
	public <T> void saveOrUpdate(T t) {
		/**
		 * 得到主键是否有值!默认情况下如果有值为修改，没有值为新增
		 */
		Object obj=ReflectUtil.getSuperClassByProperty(t, FixedFieldUtil.PK_FIELD);
		if(obj!=null){
			Object tObject=baseDao.get(t, (Integer)obj);
			ReflectUtil.setSuperClassByPropertyValue(t, FixedFieldUtil.LAST_UPDATETIME,DateUtils.getCurrentFullDatetime());
			
			String[] filter=(String[]) ReflectUtil.getClassByProperty(t, FixedFieldUtil.UPDATE_FILTER);
			BeanUtils.copyProperties(t, tObject, filter);
			baseDao.merge(tObject);
		}else{
			//设置创建时间
			ReflectUtil.setSuperClassByPropertyValue(t, FixedFieldUtil.CREATE_DATETIME,DateUtils.getCurrentFullDatetime());
			//默认保存为正常状态
			ReflectUtil.setSuperClassByPropertyValue(t, FixedFieldUtil.STATUS,StatusUtil.STATUS_ONE);
			baseDao.save(t);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> void delete(T t) {
		baseDao.save(t);
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> void batchDeleteByList(Class<T> cls, List<Integer> list) {
		List<T> listObj=baseDao.findByBatchListIds(cls,list);
		baseDao.deleteBatch(listObj);
	}


	@SuppressWarnings("unchecked")
	@Override
	public <T> T get(Class<T> cls, Integer id) {
		return (T) baseDao.findById(cls, id);
	}

	@Override
	public Object get(Class cls, Integer id, String fieldName, Object fieldValue) {
		return baseDao.get(cls, id, fieldName, fieldValue);
	}
	
	
}
