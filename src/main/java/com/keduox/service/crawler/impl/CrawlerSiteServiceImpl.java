package com.keduox.service.crawler.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keduox.dao.crawler.CrawlerSiteDao;
import com.keduox.entity.crawler.CrawlerSite;
import com.keduox.service.base.impl.BaseServiceImpl;
import com.keduox.service.crawler.CrawlerSiteService;
@Service
public class CrawlerSiteServiceImpl extends BaseServiceImpl implements CrawlerSiteService {

	@Autowired
	private CrawlerSiteDao crawlerSiteDao;
	@Override
	public CrawlerSite queryByTaskId(Integer taskId) {
		//return null;
		return  (CrawlerSite) crawlerSiteDao.queryByTaskId("crawlerTask.id", taskId);		 
	}
	
   
	
}
