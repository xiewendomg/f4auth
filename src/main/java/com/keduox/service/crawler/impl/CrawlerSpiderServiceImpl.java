package com.keduox.service.crawler.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keduox.dao.crawler.CrawlerSpiderDao;
import com.keduox.entity.crawler.CrawlerSpider;
import com.keduox.entity.crawler.CrawlerSpiderVO;
import com.keduox.service.base.impl.BaseServiceImpl;
import com.keduox.service.crawler.CrawlerSpiderService;
import com.keduox.util.FixedFieldUtil;
import com.keduox.util.ReflectUtil;
@Service
public class CrawlerSpiderServiceImpl extends BaseServiceImpl implements CrawlerSpiderService {

	@Autowired
	private CrawlerSpiderDao crawlerSpiderDao;
	@Override
	public CrawlerSpiderVO queryByTaskId(Integer taskId) {
		return  (CrawlerSpiderVO) crawlerSpiderDao.queryByTaskId(CrawlerSpiderVO.class,"crawlerTask.id", taskId,(String[])ReflectUtil.getClassByProperty(CrawlerSpider.class, FixedFieldUtil.QUERY_FILTER));
	}

}
