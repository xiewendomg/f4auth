package com.keduox.util.projectVo;

import java.util.HashMap;
import java.util.Map;

public class TaskAuditUtil {

	/**通过**/
	public static final Integer STATUS_YI=1;
	/**未通过**/
	public static final Integer STATUS_ER=2;			
	
	public static Map<Integer,String> taskAuditStatus=new HashMap<Integer,String>();
	static{
		taskAuditStatus.put(STATUS_YI, "通过");
		taskAuditStatus.put(STATUS_ER, "未通过");
		
	}
	/**
	 * 根据key得到value值
	 * @param key
	 * @return
	 */
	public static String getValue(Integer key){
		return taskAuditStatus.get(key);
		
	}
}
