package com.keduox.entity.crawler;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.keduox.entity.base.BaseEntity;
@Entity
@Table(name="request")
public class CrawlerTargetRequest extends BaseEntity {

	@JoinColumn(name="page_id")
	@ManyToOne
	private CrawlerPage crawlerPage;
	/**
	 * xpath选择器
	 */
	private String xpathSelector;
	public CrawlerPage getCrawlerPage() {
		return crawlerPage;
	}
	public void setCrawlerPage(CrawlerPage crawlerPage) {
		this.crawlerPage = crawlerPage;
	}
	public String getXpathSelector() {
		return xpathSelector;
	}
	public void setXpathSelector(String xpathSelector) {
		this.xpathSelector = xpathSelector;
	}
	@Transient//查询时需要修改的字段
	private final String[] QUERY_FILTER={"xpathSelector","id"};
	
}
