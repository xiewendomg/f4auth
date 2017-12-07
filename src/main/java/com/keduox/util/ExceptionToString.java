package com.keduox.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintStream;

import org.apache.commons.lang.StringUtils;



/**
* @ClassName: ExceptionToString
* @Description: 将异常信息转换为字符串
* @author 谢文东
* @date 2015年7月31日 上午11:27:56
*
 */
public class ExceptionToString {

	/**
	 * 将异常信息转化成字符串
	 * @param t
	 * @return
	 * @throws IOException 
	 */
	public static String exception(Throwable t) {
	    if(t == null)
	        return null;
	    ByteArrayOutputStream baos = new ByteArrayOutputStream();
	    try{
	        t.printStackTrace(new PrintStream(baos));
	    }finally{
	        try {
				baos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
	    }
	    return baos.toString().replace("'", "");
	}
	
	public static String exception(Throwable t,int len){
		String result=exception(t);
		if(StringUtils.isNotEmpty(result)&&result.length()>len){
			return result.substring(len-1);
		}
		return result;
	}
	
}
