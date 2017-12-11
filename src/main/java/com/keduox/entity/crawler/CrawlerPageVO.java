package com.keduox.entity.crawler;

import java.util.List;
public class CrawlerPageVO {
	private String url;
	private List<CrawlerTargetRequestVO> crawlerTargetRequest;
	private List<CrawlerPutFiledVO> crawlerPutFileds;
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public List<CrawlerTargetRequestVO> getCrawlerTargetRequest() {
		return crawlerTargetRequest;
	}
	public void setCrawlerTargetRequest(List<CrawlerTargetRequestVO> crawlerTargetRequest) {
		this.crawlerTargetRequest = crawlerTargetRequest;
	}
	public List<CrawlerPutFiledVO> getCrawlerPutFileds() {
		return crawlerPutFileds;
	}
	public void setCrawlerPutFileds(List<CrawlerPutFiledVO> crawlerPutFileds) {
		this.crawlerPutFileds = crawlerPutFileds;
	}
	
	
} 
