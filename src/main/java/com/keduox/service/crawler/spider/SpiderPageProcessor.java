package com.keduox.service.crawler.spider;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.keduox.entity.crawler.CrawlerPage;
import com.keduox.entity.crawler.CrawlerPutFiled;
import com.keduox.entity.crawler.CrawlerTargetRequest;
import com.keduox.service.crawler.CrawlerPageService;

import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;
@Component(value="spiderPageProcessor")
public class SpiderPageProcessor implements PageProcessor{

	@Autowired
	private CrawlerPageService	 crawlerPageService;
	 
	private Site site;
	private Integer taskId;
	
	public Integer getTaskId() {
		return taskId;
	}

	public void setTaskId(Integer taskId) {
		this.taskId = taskId;
	}

	public void setSite(Site site) {
		this.site = site;
	}

	@Override
	public void process(Page page) {		
		System.out.println("开始。。。。。。。。。");
		List<CrawlerPage> crawlerPages=crawlerPageService.queryByForeignKey(taskId);
		for(CrawlerPage crawlerPage:crawlerPages){		   			
				if(page.getUrl().regex(crawlerPage.getUrl()).match()) {
					Set<CrawlerTargetRequest> crawlerTargetRequests=crawlerPage.getCrawlerTargetRequest();
					Set<CrawlerPutFiled> crawlerPutFileds=crawlerPage.getCrawlerPutFileds();
					if(crawlerTargetRequests!=null){
						for(CrawlerTargetRequest crawlerTargetRequest:crawlerTargetRequests)
							page.addTargetRequests(page.getHtml().xpath(crawlerTargetRequest.getXpathSelector()).links().all());	
					}
					if(crawlerPutFileds!=null){
						for(CrawlerPutFiled crawlerPutFiled:crawlerPutFileds)
						    page.putField(crawlerPutFiled.getNameSelector(), crawlerPutFiled.getXpathSelector());	
					}					
                    break;				
			}
		}
		
		System.out.println("结束。。。。。。。。。");
			
		}										
		
		
		
	

	@Override
	public Site getSite() {	
		
		return this.site;
	}

}
