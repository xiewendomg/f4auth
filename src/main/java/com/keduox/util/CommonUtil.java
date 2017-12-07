package com.keduox.util;

import java.util.ArrayList;
import java.util.List;

/**
 * 系统中一些基础操作方法工具类
 * @author administrator_yds
 *
 */
public class CommonUtil {
	
	/**
	 * 将以逗号隔开的数据，转换到list<String>中
	 * @param str
	 * @return
	 */
	public static List<Integer> stringToList(String str){
		String [] strArray=str.split(",");
		List<Integer> list=new ArrayList<Integer>();
		for(String s:strArray){
			list.add(Integer.parseInt(s));
		}
		return list;
	}
}