package com.keduox.service.crawler.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keduox.dao.crawler.CrawlerPageDao;
import com.keduox.entity.crawler.CrawlerPage;
import com.keduox.service.base.impl.BaseServiceImpl;
import com.keduox.service.crawler.CrawlerPageService;
import com.keduox.util.FixedFieldUtil;
import com.keduox.util.ReflectUtil;
@Service
public class CrawlerPageServiceImpl extends BaseServiceImpl implements CrawlerPageService {

	@Autowired
	private CrawlerPageDao crawlerPageDao;
	@SuppressWarnings("unchecked")
	@Override
	public List<CrawlerPage> queryByForeignKey(Integer taskId) {
		return  crawlerPageDao.queryByForeignKey(CrawlerPage.class, "crawlerTask.id", taskId, (String[]) ReflectUtil.getClassByProperty(CrawlerPage.class, FixedFieldUtil.QUERY_FILTER));
	}

}
