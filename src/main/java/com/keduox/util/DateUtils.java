package com.keduox.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * @ClassName: DateUtils
 * @Description: 项目中统一应用的日期时间工具类
 * @author 谢文东
 * @date 2015年7月1日 下午4:09:11
 *
 */
public class DateUtils {
	// 各种时间格式
	private static final SimpleDateFormat datetimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	/**
	* @Title: getCurrentFullDatetime
	* @Description: 得到当时日期时间，格式为yyyy-MM-dd HH:mm:ss
	* @param @return    设定文件
	* @return String    返回类型
	* @throws
	 */
	public static String getCurrentFullDatetime(){
		return datetimeFormat.format(Calendar.getInstance().getTime());
	}
	
}
