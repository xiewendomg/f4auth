package com.keduox.controller.base;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
/**
 * 
* @ClassName: BaseController
* @Description: Controller类需要用到的一些基本信息
* @author 余东山
*
 */
public class BaseController {
	
	/**
	 * 操作成功后统一的返回编码 
	 */
	protected final static String SUCCESS="success";
	/**
	 * 操作时系统出现异常情况
	 */
	protected final static String SERVER_ERROR="服务器异常,请稍后再试!";
	
	/**基础LOG管理的的对象*/
	protected Logger logger=Logger.getLogger(this.getClass());
	
	private  HttpServletRequest request;
	

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
}
