package com.keduox.service.base;

import java.util.List;

/**
* @ClassName: BaseService
* @Description:　项目service层base接口
* @author 余东山
* @date 2015年6月30日 下午1:47:04
 */
public interface BaseService {
	/**
	* @Title: saveOrUpdate
	* @Description: 新增或修改数据
	* @param @param t    设定文件
	* @return void    返回类型
	* @throws
	 */
	public <T> void saveOrUpdate(T t);
	
	
	/**
	* @Title: delete
	* @Description: 删除公共方法
	* @param @param t    设定文件
	* @return void    返回类型
	* @throws
	 */
	public <T> void delete(T t);
	
	/**
	 * @param <T>
	* @Title: batchDeleteByList
	* @Description: 批量删除List<String>的类型
	* @param @param list    设定文件
	* @return void    返回类型
	* @throws
	 */
	public <T> void batchDeleteByList(Class<T> cls,List<Integer> list);
	
	
	/**
     * 通过主键得到相应的对象值
    * @Title: get
    * @Description: TODO(这里用一句话描述这个方法的作用)
    * @param @param t
    * @param @param id    设定文件
    * @return void    返回类型
    * @throws
     */
    public abstract <T> T get(Class<T> cls,Integer id);
    /**
     * 通过字段名判断字段的值是否存在，id可为空，则表示新增
     * @param t
     * @param id
     * @param fieldName
     * @param filedValue
     * @return
     */
    public abstract Object get(Class t,Integer id,String fieldName,Object fieldValue);

}
