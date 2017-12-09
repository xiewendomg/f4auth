package com.keduox.entity.crawler;

import java.util.List;

public class CrawlerSiteVO {
	private Integer sleepTime;
	private String charset;
	private String userAgent;
	private String domain;
	private Integer timeOut;
	private Integer retryTime;
	private Integer cycleRetryTime;
	private List<CrawlerHeaderVO> crawlerHeaders;
	private List<CrawlerCookieVO> crawlerCookies;
	public Integer getSleepTime() {
		return sleepTime;
	}
	public void setSleepTime(Integer sleepTime) {
		this.sleepTime = sleepTime;
	}
	public String getCharset() {
		return charset;
	}
	public void setCharset(String charset) {
		this.charset = charset;
	}
	public String getUserAgent() {
		return userAgent;
	}
	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public Integer getTimeOut() {
		return timeOut;
	}
	public void setTimeOut(Integer timeOut) {
		this.timeOut = timeOut;
	}
	public Integer getRetryTime() {
		return retryTime;
	}
	public void setRetryTime(Integer retryTime) {
		this.retryTime = retryTime;
	}
	public Integer getCycleRetryTime() {
		return cycleRetryTime;
	}
	public void setCycleRetryTime(Integer cycleRetryTime) {
		this.cycleRetryTime = cycleRetryTime;
	}
	public List<CrawlerHeaderVO> getCrawlerHeaders() {
		return crawlerHeaders;
	}
	public void setCrawlerHeaders(List<CrawlerHeaderVO> crawlerHeaders) {
		this.crawlerHeaders = crawlerHeaders;
	}
	public List<CrawlerCookieVO> getCrawlerCookies() {
		return crawlerCookies;
	}
	public void setCrawlerCookies(List<CrawlerCookieVO> crawlerCookies) {
		this.crawlerCookies = crawlerCookies;
	}
	@Override
	public String toString() {
		return "CrawlerSiteVO [sleepTime=" + sleepTime + ", charset=" + charset + ", userAgent=" + userAgent
				+ ", domain=" + domain + ", timeOut=" + timeOut + ", retryTime=" + retryTime + ", cycleRetryTime="
				+ cycleRetryTime + ", crawlerHeaders=" + crawlerHeaders + ", crawlerCookies=" + crawlerCookies + "]";
	}
	
}
