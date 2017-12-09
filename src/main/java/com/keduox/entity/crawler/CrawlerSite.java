package com.keduox.entity.crawler;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.keduox.entity.base.BaseEntity;
@SuppressWarnings("serial")
@Table(name="site")
@Entity
public class CrawlerSite extends BaseEntity{
	
	/**
	 * 睡眠时间
	 */
	@Column(name="sleep_time")
	private Integer sleepTime;
    public Integer getSleepTime() {
		return sleepTime;
	}
	public void setSleepTime(Integer sleepTime) {
		this.sleepTime = sleepTime;
	}
	public CrawlerTask getCrawlerTask() {
		return crawlerTask;
	}
	public void setCrawlerTask(CrawlerTask crawlerTask) {
		this.crawlerTask = crawlerTask;
	}
	@Column(name="charset")
	private String charset;
    @Column(name="user_agent")
	private String userAgent;
    @Column(name="domain")
	private String domain;
    @Column(name="time_out")
	private Integer timeOut;
    @Column(name="retry_time")
	private Integer retryTime;
    @Column(name="cycle_retry_time")
	private Integer cycleRetryTime;
    @OneToMany(mappedBy="crawlerSite")
	private Set<CrawlerHeader> crawlerHeaders;
    @OneToMany(mappedBy="crawlerSite")
	private Set<CrawlerCookie> crawlerCookies;
    @OneToOne
    @JoinColumn(name="task_id")
    private CrawlerTask crawlerTask;
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
	public Set<CrawlerHeader> getCrawlerHeaders() {
		return crawlerHeaders;
	}
	public void setCrawlerHeaders(Set<CrawlerHeader> crawlerHeaders) {
		this.crawlerHeaders = crawlerHeaders;
	}
	public Set<CrawlerCookie> getCrawlerCookies() {
		return crawlerCookies;
	}
	public void setCrawlerCookies(Set<CrawlerCookie> crawlerCookies) {
		this.crawlerCookies = crawlerCookies;
	}
    
	@Transient//修改时不需要修改的字段
	private final String[] UPDATE_FILTER={"createDatetime"};
	
	@Transient//查询时需要的字段
	private final String[] QUERY_FILTER={"sleepTime","userAgent","charset","do"
			+ "main","timeOut","retryTime","cycleRetryTime","id"};
}
