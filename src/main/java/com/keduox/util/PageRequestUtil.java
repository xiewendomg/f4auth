package com.keduox.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
/**
* @ClassName: RequestUtil
* @Description: 得到请的request对象
* @author 谢文东
* @date 2015年7月1日 下午2:24:02
*
 */
@Component
public class PageRequestUtil {
	/**
	 * 当前页数
	 */
	private final String PAGE="page";
	/**
	 * 每页显示数
	 */
	private final String ROWS="rows";
	/**
	 * request对象
	 */
	@SuppressWarnings("unused")
	private HttpServletRequest request;
	/**
	 * 开始记录数
	 */
	@SuppressWarnings("unused")
	private int firstResult;
	
	@SuppressWarnings("unused")
	private int maxResults;
	
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		return request;
	}

	public int getFirstResult() {
		String page=this.getRequest().getParameter(PAGE);
		if(StringUtils.isEmpty(page)){
			return 0;
		}else{
			return (Integer.parseInt(page)-1)*this.getMaxResults();
		}
	}


	public int getMaxResults() {
		String rows=this.getRequest().getParameter(ROWS);
		if(StringUtils.isEmpty(rows)){
			return 10;
		}
		return Integer.parseInt(rows);
	}

}
