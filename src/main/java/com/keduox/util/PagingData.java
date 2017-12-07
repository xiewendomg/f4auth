package com.keduox.util;

import java.util.List;
/**
 * 
* @ClassName: Paging
* @Description: TODO(这里用一句话描述这个类的作用)
* @author 谢文东
* @date 2015年6月30日 上午11:34:25
*
 */
public class PagingData {

	/**
	 * 记录查询的总数
	 */
	private int total;
	
	/**
	 * 记录查询的数据 
	 */
	@SuppressWarnings("rawtypes")
	private List rows;

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@SuppressWarnings("rawtypes")
	public List getRows() {
		return rows;
	}

	@SuppressWarnings("rawtypes")
	public void setRows(List rows) {
		this.rows = rows;
	}
	
}
