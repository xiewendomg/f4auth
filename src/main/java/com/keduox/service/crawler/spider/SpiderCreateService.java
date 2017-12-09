package com.keduox.service.crawler.spider;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keduox.entity.crawler.CrawlerCookieVO;
import com.keduox.entity.crawler.CrawlerHeaderVO;
import com.keduox.entity.crawler.CrawlerSiteVO;
import com.keduox.entity.crawler.CrawlerSpiderVO;
import com.keduox.service.crawler.CrawlerSiteService;
import com.keduox.service.crawler.CrawlerSpiderService;
import com.keduox.util.crawler.SpiderCaseUtil;

import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.pipeline.ConsolePipeline;

@Service(value="spiderCreateService")
public class SpiderCreateService {

   /* @Autowired
    private SpiderPageProcessor spiderPageProcessor;*/
    @Autowired
	private CrawlerSiteService	 crawlerSiteService;
    @Autowired
   	private CrawlerSpiderService	crawlerSpiderService;
    
    
	public void RunSpider(Integer[] taskIds) {
		if(taskIds==null){
			
		}else{
		for(Integer taskId:taskIds){
				SpiderPageProcessor spiderPageProcessor =new SpiderPageProcessor();
				CrawlerSpiderVO crawlerSpider=crawlerSpiderService.queryByTaskId(taskId);	
				CrawlerSiteVO crawlerSite=crawlerSiteService.queryByTaskId(taskId);	               
				//site 参数
				Integer sleepTime=crawlerSite.getSleepTime();
				String charset=crawlerSite.getCharset();
				Integer cycleRetryTime=crawlerSite.getCycleRetryTime();
				List<CrawlerCookieVO> cookies=crawlerSite.getCrawlerCookies();
				List<CrawlerHeaderVO> headers=crawlerSite.getCrawlerHeaders();
				Integer retryTime=crawlerSite.getRetryTime();
				String userAgent=crawlerSite.getUserAgent();
				Integer timeOut=crawlerSite.getTimeOut();
				String domain=crawlerSite.getDomain();
				Site site=new Site().setUserAgent(userAgent).setTimeOut(timeOut).setRetryTimes(retryTime);
				if (sleepTime!=null)
					site.setSleepTime(sleepTime);
				if (domain!=null) 
					site.setDomain(domain);		
				if (charset!=null) 
					site.setCharset(charset);
				if(cycleRetryTime!=null)
					site.setCycleRetryTimes(cycleRetryTime);
				if(cookies!=null) {
					for(CrawlerCookieVO cookie:cookies) {
						site.addCookie(cookie.getCookieName(), cookie.getCookieValue());
					}
				}
				if(headers!=null) {
					for(CrawlerHeaderVO header:headers) {
						site.addCookie(header.getHeaderName(), header.getHeaderValue());
					}
				}	
				spiderPageProcessor.setSite(site);							
				spiderPageProcessor.getSite();
				
				Spider spider=new Spider(spiderPageProcessor)
						.addUrl(crawlerSpider.getUrl())
						.thread(crawlerSpider.getThread())
						.addPipeline(new ConsolePipeline())
						.setScheduler(SpiderCaseUtil.getSchwduler(crawlerSpider.getScheduler()))
						.setDownloader(SpiderCaseUtil.getDownload(crawlerSpider.getDownload()));
				SpiderCaseUtil.setRunStatus(crawlerSpider.getRunStatus(), spider);	
			
		}
		
	}
	}	
}
