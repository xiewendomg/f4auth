package com.keduox.entity.crawler;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.keduox.entity.base.BaseEntity;
@Entity
@Table(name="crawler_task")
public class CrawlerTask extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5988047580961003751L;
	
	@Column(name="name")
	private String taskName;

	public CrawlerSite getCrawlerSite() {
		return crawlerSite;
	}

	public void setCrawlerSite(CrawlerSite crawlerSite) {
		this.crawlerSite = crawlerSite;
	}

	public CrawlerSpider getCrawlerSpider() {
		return crawlerSpider;
	}

	public void setCrawlerSpider(CrawlerSpider crawlerSpider) {
		this.crawlerSpider = crawlerSpider;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	@OneToOne(mappedBy="crawlerTask")
	private CrawlerSite crawlerSite;
	@OneToOne(mappedBy="crawlerTask")
	private CrawlerSpider crawlerSpider;
}

