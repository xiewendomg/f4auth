package com.keduox.entity.crawler;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.keduox.entity.base.BaseEntity;
@SuppressWarnings("serial")
@Table(name="header")
@Entity
public class CrawlerHeader extends BaseEntity{
	
	@Column(name="header_name")
	private String headerName;
	@Column(name="header_value")
	private String headerValue;
	@ManyToOne
	@JoinColumn(name="site_id")
	private CrawlerSite crawlerSite;
	public String getHeaderName() {
		return headerName;
	}
	public void setHeaderName(String headerName) {
		this.headerName = headerName;
	}
	public String getHeaderValue() {
		return headerValue;
	}
	public void setHeaderValue(String headerValue) {
		this.headerValue = headerValue;
	}
	public CrawlerSite getCrawlerSite() {
		return crawlerSite;
	}
	public void setCrawlerSite(CrawlerSite crawlerSite) {
		this.crawlerSite = crawlerSite;
	}
	public final String[] QUERY_FILTER=new String[]{"headerName","headerValue"};
}
