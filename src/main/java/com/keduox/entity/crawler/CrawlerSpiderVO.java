package com.keduox.entity.crawler;

public class CrawlerSpiderVO {
	private String url;
	private Integer thread;
	private Integer runStatus;
	private Integer download;
	private Integer scheduler;
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
	
}
