package com.keduox.service.crawler;

import com.keduox.entity.crawler.CrawlerSpider;
import com.keduox.service.base.BaseService;

public interface CrawlerSpiderService extends BaseService{
	CrawlerSpider  queryByTaskId(Integer taskId);
}

