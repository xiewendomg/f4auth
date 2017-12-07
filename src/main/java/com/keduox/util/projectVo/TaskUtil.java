package com.keduox.util.projectVo;

import java.util.HashMap;
import java.util.Map;

public class TaskUtil {
	/**未领取**/
	public static final Integer STATUS_YI=1;
	/**已领取**/
	public static final Integer STATUS_ER=2;		
	/**待完成**/
	public static final Integer STATUS_SAN=3;
	/**待审核**/
	public static final Integer STATUS_SI=4;
	/**已完成**/
	public static final Integer STATUS_WU=5;
	/**失效任务**/
	public static final Integer STATUS_LING=0;
	public static Map<Integer,String> taskStatus=new HashMap<Integer,String>();
	static{
		taskStatus.put(STATUS_YI, "未领取");
		taskStatus.put(STATUS_ER, "已领取");
		taskStatus.put(STATUS_SAN, "待完成");
		taskStatus.put(STATUS_SI, "待审核");
		taskStatus.put(STATUS_WU, "已完成");		
		taskStatus.put(STATUS_LING, "已失效");
	}
	/**
	 * 根据key得到value值
	 * @param key
	 * @return
	 */
	public static String getValue(Integer key){
		return taskStatus.get(key);
		
	}
}
