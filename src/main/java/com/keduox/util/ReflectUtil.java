package com.keduox.util;

import java.lang.reflect.Field;

import javax.persistence.Column;

public class ReflectUtil {
	/**
	 * 
	* @Title: getClassByProperty
	* @Description: 根据指定类得到属性名称 
	* @param @param cls
	* @param @param propertyName
	* @param @return    设定文件
	* @return Object    返回类型
	* @throws
	 */
	public static Object getClassByProperty(Object object,String propertyName){
		try {
			Field field=object.getClass().getDeclaredField(propertyName);
			field.setAccessible(true);
			return field.get(object);
		} catch (Exception e) {
			e.printStackTrace();
			return  null;
		}
	}
	/**
	 * 
	* @Title: getClassByProperty
	* @Description: 根据指定类的父类得到属性名称 
	* @param @param cls
	* @param @param propertyName
	* @param @return    设定文件
	* @return Object    返回类型
	* @throws
	 */
	public static Object getSuperClassByProperty(Object object,String propertyName){
		try {
			Field field=object.getClass().getSuperclass().getDeclaredField(propertyName);
			field.setAccessible(true);
			return field.get(object);
		} catch (Exception e) {
			return  null;
		}
	}
	/**
	 * 
	* @Title: setClassByPropertyValue
	* @Description: 为指定对象设置相应的值
	* @param @param object
	* @param @param propertyName
	* @param @param value    设定文件
	* @return void    返回类型
	* @throws
	 */
	public static Object setSuperClassByPropertyValue(Object object,String propertyName,Object value){
		try {
			Field field=object.getClass().getSuperclass().getDeclaredField(propertyName);
			field.setAccessible(true);
			field.set(object, value);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return object;
	}
	
	/**
	 * 
	* @Title: setClassByPropertyValue
	* @Description: 为指定对象设置相应的值
	* @param @param object
	* @param @param propertyName
	* @param @param value    设定文件
	* @return void    返回类型
	* @throws
	 */
	public static Object setClassByPropertyValue(Object object,String propertyName,Object value){
		try {
			Field field=object.getClass().getDeclaredField(propertyName);
			field.setAccessible(true);
			field.set(object, value);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return object;
	}
    //通过属性名拿到属性值
	public static Object getClassByProperty(Class cls,String propertyName){
		try {
			Field field=cls.getDeclaredField(propertyName);
			field.setAccessible(true);
			return field.get(cls.newInstance());
		} catch (Exception e) {
			e.printStackTrace();
			return  null;
		}
	}
	 //通过属性名拿到属性的注解值
	public static String getAnnoValueByProperty(@SuppressWarnings("rawtypes") Class cls,String propertyName){
			String value=null;
	     	try {
				Field field=cls.getDeclaredField(propertyName);
				field.setAccessible(true);
				boolean fieldHasAnno = field.isAnnotationPresent(Column.class); 
				if(fieldHasAnno){
					Column fieldAnno = field.getAnnotation(Column.class);
					value=fieldAnno.name();
				}
                //输出注解属性  
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return value;
		}
}
