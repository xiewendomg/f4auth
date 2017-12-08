package com.keduox.entity.crawler;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.keduox.entity.base.BaseEntity;
@SuppressWarnings("serial")
@Entity
@Table(name="cookies")
public class CrawlerCookie extends BaseEntity {

	@Column(name="cookie_name")
	private String cookieName;
	@Column(name="cookie_value")
	private String cookieValue;
	@ManyToOne
	@JoinColumn(name="site_id")
	private CrawlerSite crawlerSite;
	public String getCookieName() {
		return cookieName;
	}
	public void setCookieName(String cookieName) {
		this.cookieName = cookieName;
	}
	public String getCookieValue() {
		return cookieValue;
	}
	public void setCookieValue(String cookieValue) {
		this.cookieValue = cookieValue;
	}
	public CrawlerSite getCrawlerSite() {
		return crawlerSite;
	}
	public void setCrawlerSite(CrawlerSite crawlerSite) {
		this.crawlerSite = crawlerSite;
	}
	@Transient
	public final String[] QUERY_FILTER=new String[]{"cookieName","cookieValue"};
}
