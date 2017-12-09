package com.keduox.dao.crawler.impl;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.keduox.dao.base.BaseTest;
import com.keduox.entity.crawler.CrawlerCookie;
import com.keduox.entity.crawler.CrawlerCookieVO;
import com.keduox.entity.crawler.CrawlerSite;
import com.keduox.entity.crawler.CrawlerSiteVO;
import com.keduox.entity.crawler.CrawlerSpider;
import com.keduox.service.crawler.CrawlerSiteService;
import com.keduox.util.ClassUtil;

public class CrawlerSiteDaoImplTest extends BaseTest{
	@Autowired
	private CrawlerSiteService crawlerSpiderService;
	@Test
	public void test() {
		CrawlerSiteVO f=crawlerSpiderService.queryByTaskId(1);
		System.out.println(f.getCrawlerCookies());
		for(CrawlerCookieVO d:f.getCrawlerCookies()){
			System.out.println(d.getCookieName());
		}
		
	}

	@Test
	public void test2() {
		Class cls=ClassUtil.getClassbyCls(CrawlerSpider.class);
		System.out.println(cls.getName());
	}

}
