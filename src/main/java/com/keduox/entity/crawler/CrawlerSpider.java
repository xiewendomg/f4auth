package com.keduox.entity.crawler;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.keduox.entity.base.BaseEntity;
@SuppressWarnings("serial")
@Entity
@Table(name="spider")
public class CrawlerSpider extends BaseEntity{

	@OneToOne
	@JoinColumn(name="task_id")
	private CrawlerTask crawlerTask;
	@Column(name="url")
	private String url;
	@Column(name="thread")
	private Integer thread;
	@Column(name="runStatus")
	private Integer runStatus;
	@Column(name="download")
	private Integer download;
	@Column(name="scheduler")
	private Integer scheduler;
	
	public CrawlerTask getCrawlerTask() {
		return crawlerTask;
	}
	public void setCrawlerTask(CrawlerTask crawlerTask) {
		this.crawlerTask = crawlerTask;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Integer getThread() {
		return thread;
	}
	public void setThread(Integer thread) {
		this.thread = thread;
	}
	public Integer getRunStatus() {
		return runStatus;
	}
	public void setRunStatus(Integer runStatus) {
		this.runStatus = runStatus;
	}
	public Integer getDownload() {
		return download;
	}
	public void setDownload(Integer download) {
		this.download = download;
	}
	public Integer getScheduler() {
		return scheduler;
	}
	public void setScheduler(Integer scheduler) {
		this.scheduler = scheduler;
	}
	@Transient//修改时不需要修改的字段
	private final String[] UPDATE_FILTER={"createDatetime"};
	
	@Transient//查询时需要修改的字段
	private final String[] QUERY_FILTER={"scheduler","download","url","thread","runStatus"};

	@Override
	public String toString() {
		return "CrawlerSpider [crawlerTask=" + crawlerTask + ", url=" + url + ", thread=" + thread + ", runStatus="
				+ runStatus + ", download=" + download + ", scheduler=" + scheduler + ", UPDATE_FILTER="
				+ Arrays.toString(UPDATE_FILTER) + ", QUERY_FILTER=" + Arrays.toString(QUERY_FILTER) + "]";
	}
	
	
}
