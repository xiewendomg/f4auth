package com.keduox.util;

import java.util.HashMap;
import java.util.Map;

/**
 * 状态工具类
 * @author administrator_yds
 */
public class StatusUtil {

	/**一般情况下为正常状态**/
	public static final Integer STATUS_ONE=1;
	/**一般情况下为失效状态**/
	public static final Integer STATUS_ZERO=0;
	public static Map<Integer,String> statusMap=new HashMap<Integer,String>();
	static{
		statusMap.put(STATUS_ONE, "正常");
		statusMap.put(STATUS_ZERO, "失效");
	}
	/**
	 * 根据key得到value值
	 * @param key
	 * @return
	 */
	public static String getValue(Integer key){
		return statusMap.get(key);
	}
}
