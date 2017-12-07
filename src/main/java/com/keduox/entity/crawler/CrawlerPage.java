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
@Table(name="page")
@Entity
public class CrawlerPage extends BaseEntity{
	@Column(name="url")
	private String url;
	@OneToMany(mappedBy="crawlerPage")
	private Set<CrawlerTargetRequest> crawlerTargetRequest;
	@OneToMany(mappedBy="crawlerPage")
	private Set<CrawlerPutFiled> crawlerPutFileds;
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Set<CrawlerTargetRequest> getCrawlerTargetRequest() {
		return crawlerTargetRequest;
	}
	public void setCrawlerTargetRequest(Set<CrawlerTargetRequest> crawlerTargetRequest) {
		this.crawlerTargetRequest = crawlerTargetRequest;
	}
	public Set<CrawlerPutFiled> getCrawlerPutFileds() {
		return crawlerPutFileds;
	}
	public void setCrawlerPutFileds(Set<CrawlerPutFiled> crawlerPutFileds) {
		this.crawlerPutFileds = crawlerPutFileds;
	}
	@Transient//修改时不需要修改的字段
	private final String[] UPDATE_FILTER={"createDatetime"};
	
	@Transient//查询时不需要修改的字段
	private final String[] QUERY_FILTER={"createDatetime","lastUpdatetime"};
} 
