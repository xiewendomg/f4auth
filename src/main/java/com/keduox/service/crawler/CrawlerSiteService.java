package com.keduox.service.crawler;

import com.keduox.entity.crawler.CrawlerSite;
import com.keduox.entity.crawler.CrawlerSiteVO;
import com.keduox.service.base.BaseService;

public interface CrawlerSiteService extends BaseService{
	
	CrawlerSiteVO  queryByTaskId(Integer taskId);
	CrawlerSite  queryByTaskId1(Integer taskId);
}

