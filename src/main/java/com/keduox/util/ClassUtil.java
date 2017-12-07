package com.keduox.util;

public class ClassUtil {

	@SuppressWarnings("rawtypes")
	public static Class getClassbyCls(Class cls){
		Class newCls;
		try {
			newCls=Class.forName(cls.getName()+"VO");
			return newCls;
		} catch (ClassNotFoundException e) {
			return null;
		}
	}
}
