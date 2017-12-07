package com.keduox.util;

import java.util.ArrayList;
import java.util.List;

import com.keduox.util.vo.QueryParamsMapVo;

/**
 * 
* @ClassName: QueryParamsMap
* @Description: 用于参数封装的数据
* @author 谢文东
* @date 2015年7月29日 上午10:51:09
*
 */
public class QueryParams {
	
	private static QueryParams queryParamsMap;
	
	public static List<QueryParamsMapVo> list=new ArrayList<QueryParamsMapVo>();
	
	public static QueryParams getInstans(){
		if(queryParamsMap==null){
			queryParamsMap=new QueryParams();
		}
		list.clear();
		return queryParamsMap;
	}
	
	/**
	* @Title: mapAdd
	* @Description: 向Map中增加数据
	* @param @param field
	* @param @param value
	* @param @param type    设定文件
	* @return void    返回类型
	* @throws
	 */
	public void addParam(String field,Object value,HibernateTypeEnum type){
		list.add(new QueryParamsMapVo(field,value,type));
	}
}
