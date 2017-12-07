package com.keduox.service.crawler.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keduox.dao.crawler.CrawlerSpiderDao;
import com.keduox.entity.crawler.CrawlerSpider;
import com.keduox.service.base.impl.BaseServiceImpl;
import com.keduox.service.crawler.CrawlerSpiderService;
@Service
public class CrawlerSpiderServiceImpl extends BaseServiceImpl implements CrawlerSpiderService {

	@Autowired
	private CrawlerSpiderDao crawlerSpiderDao;
	@Override
	public CrawlerSpider queryByTaskId(Integer taskId) {
		
		return  (CrawlerSpider) crawlerSpiderDao.queryByTaskId("crawlerTask.id", taskId);
	}

}
