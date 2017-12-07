package com.keduox.util;

import java.lang.reflect.Field;
import java.util.Arrays;

import javax.persistence.Column;

import org.junit.Test;

import com.keduox.entity.crawler.CrawlerSite;

public class ReflectUtilTest {

	@Test
	public void test() {
		String[] t=(String[]) ReflectUtil.getClassByProperty(CrawlerSite.class, FixedFieldUtil.QUERY_FILTER);
		System.out.println(Arrays.toString(t));
	} 
    @Test
	public void test2(){
    	// 此处要用反射将字段中的注解解析出来  
        Class<CrawlerSite> clz = CrawlerSite.class;  
        
        // 解析字段上是否有注解  
        // ps：getDeclaredFields会返回类所有声明的字段，包括private、protected、public，但是不包括父类的  
        // getFields:则会返回包括父类的所有的public字段，和getMethods()一样  
        Field[] fields = clz.getDeclaredFields();
        System.out.println(fields.length);
        for(Field field : fields){  
        field.setAccessible(true);
        Column fieldAnno = field.getAnnotation(Column.class);  
        //输出注解属性  
        String age = fieldAnno.name();  
        System.out.println(field.getName() + " age = " + age );  
        }  
    }  	
}
