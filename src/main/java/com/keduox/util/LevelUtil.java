package com.keduox.util;

import java.util.HashMap;
import java.util.Map;

/**
 * 日志级别工具类
 * @author administrator_yds
 */
public class LevelUtil {

	/**一般情况下为正常状态**/
	public static final String INFO_LEVEL="INFO";
	/**一般情况下为失效状态**/
	public static final String ERROR_LEVEL="ERROR";
	public static Map<String,String> levelMap=new HashMap<String,String>();
	static{
		levelMap.put(INFO_LEVEL, INFO_LEVEL);
		levelMap.put(ERROR_LEVEL, ERROR_LEVEL);
	}
	/**
	 * 根据key得到value值
	 * @param key
	 * @return
	 */
	public static String getValue(String key){
		return levelMap.get(key);
	}
}
