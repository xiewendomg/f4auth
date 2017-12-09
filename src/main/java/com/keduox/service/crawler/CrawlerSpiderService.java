package com.keduox.service.crawler;

import com.keduox.entity.crawler.CrawlerSpiderVO;
import com.keduox.service.base.BaseService;

public interface CrawlerSpiderService extends BaseService{
	CrawlerSpiderVO  queryByTaskId(Integer taskId);
}

