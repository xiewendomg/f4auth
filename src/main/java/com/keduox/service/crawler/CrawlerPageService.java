package com.keduox.service.crawler;

import java.util.List;

import com.keduox.entity.crawler.CrawlerPage;
import com.keduox.service.base.BaseService;

public interface CrawlerPageService extends BaseService{
	List<CrawlerPage>  queryByForeignKey(Integer taskId);
}

