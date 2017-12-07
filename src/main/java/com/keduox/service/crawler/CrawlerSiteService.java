package com.keduox.service.crawler;

import com.keduox.entity.crawler.CrawlerSite;
import com.keduox.service.base.BaseService;

public interface CrawlerSiteService extends BaseService{
	
	CrawlerSite  queryByTaskId(Integer taskId);
}

