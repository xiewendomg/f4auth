package com.keduox.entity.crawler;

import java.util.List;
public class CrawlerPageVO{
	private String url;
	private List<CrawlerTargetRequest> crawlerTargetRequest;
	private List<CrawlerPutFiled> crawlerPutFileds;
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public List<CrawlerTargetRequest> getCrawlerTargetRequest() {
		return crawlerTargetRequest;
	}
	public void setCrawlerTargetRequest(List<CrawlerTargetRequest> crawlerTargetRequest) {
		this.crawlerTargetRequest = crawlerTargetRequest;
	}
	public List<CrawlerPutFiled> getCrawlerPutFileds() {
		return crawlerPutFileds;
	}
	public void setCrawlerPutFileds(List<CrawlerPutFiled> crawlerPutFileds) {
		this.crawlerPutFileds = crawlerPutFileds;
	}
	
} 
