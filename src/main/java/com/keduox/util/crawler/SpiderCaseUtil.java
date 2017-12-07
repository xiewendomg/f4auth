package com.keduox.util.crawler;

import redis.clients.jedis.JedisPool;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.downloader.Downloader;
import us.codecraft.webmagic.downloader.HttpClientDownloader;
import us.codecraft.webmagic.downloader.PhantomJSDownloader;
import us.codecraft.webmagic.downloader.selenium.SeleniumDownloader;
import us.codecraft.webmagic.scheduler.FileCacheQueueScheduler;
import us.codecraft.webmagic.scheduler.PriorityScheduler;
import us.codecraft.webmagic.scheduler.QueueScheduler;
import us.codecraft.webmagic.scheduler.RedisPriorityScheduler;
import us.codecraft.webmagic.scheduler.RedisScheduler;
import us.codecraft.webmagic.scheduler.Scheduler;

public class SpiderCaseUtil {
    /**
     * 页面下载器
     * @param downloan
     * @return
     */
	public static Downloader getDownload(Integer downloan) {				
		switch(downloan) {
		case 1:
			return new HttpClientDownloader();
		case 2:
			return new SeleniumDownloader();
		case 3:
			return new PhantomJSDownloader();
		}
		return new HttpClientDownloader();
	}
	/**
	 * url 管理器
	 * @param downloan
	 * @return
	 */
	public static Scheduler getSchwduler(Integer scheduler) {				
		switch(scheduler) {
		case 1:
			return new QueueScheduler();
		case 2:
			String str=null;
			return new FileCacheQueueScheduler(str);
		case 3:
			JedisPool pool=null;
			return new RedisScheduler(pool);
		case 4:
			JedisPool pool2=null;
			return new RedisPriorityScheduler(pool2);
		case 5:			
			return new PriorityScheduler();	
		}
		return new QueueScheduler();
	}
	public static void setRunStatus(Integer runStatus,Spider spider) {				
		switch(runStatus) {
		case 1:
			 spider.runAsync();
		case 2:
			spider.run();
		case 3:
			spider.start();	
		}
		
	}
}
