package com.keduox.exception;
/**
 * 
* @ClassName: ValidateException
* @Description: controller类验证时用到的类
* @author 余东山
* @date 2015年7月30日 下午3:01:00
 */
@SuppressWarnings("serial")
public class ValidateException extends Exception {

	public ValidateException(String msg){
		super(msg);
	}
}
