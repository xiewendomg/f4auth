package com.keduox.util.projectVo;

import java.util.HashMap;
import java.util.Map;

public class ProjectUtil {

	/**发布前**/
	public static final Integer STATUS_YI=1;
	/**待领取**/
	public static final Integer STATUS_ER=2;		
	/**执行中**/
	public static final Integer STATUS_SAN=3;
	/**待审核**/
	public static final Integer STATUS_SI=4;
	/**已完成**/
	public static final Integer STATUS_WU=5;
	/**失效项目**/
	public static final Integer STATUS_LING=null;
	public static Map<Integer,String> projectStatus=new HashMap<Integer,String>();
	static{
		projectStatus.put(STATUS_YI, "发布前");
		projectStatus.put(STATUS_ER, "待领取");
		projectStatus.put(STATUS_SAN, "执行中");
		projectStatus.put(STATUS_SI, "待审核");
		projectStatus.put(STATUS_WU, "已完成");		
		projectStatus.put(STATUS_LING, "全部");
	}
	/**
	 * 根据key得到value值
	 * @param key
	 * @return
	 */
	public static String getValue(Integer key){
		return projectStatus.get(key);
		
	}
}
