package com.keduox.service.crawler.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keduox.dao.crawler.CrawlerCookieDao;
import com.keduox.dao.crawler.CrawlerHeaderDao;
import com.keduox.dao.crawler.CrawlerSiteDao;
import com.keduox.entity.crawler.CrawlerCookie;
import com.keduox.entity.crawler.CrawlerCookieVO;
import com.keduox.entity.crawler.CrawlerHeader;
import com.keduox.entity.crawler.CrawlerHeaderVO;
import com.keduox.entity.crawler.CrawlerSite;
import com.keduox.entity.crawler.CrawlerSiteVO;
import com.keduox.service.base.impl.BaseServiceImpl;
import com.keduox.service.crawler.CrawlerSiteService;
import com.keduox.util.FixedFieldUtil;
import com.keduox.util.ReflectUtil;
@Service
public class CrawlerSiteServiceImpl extends BaseServiceImpl implements CrawlerSiteService {

	@Autowired
	private CrawlerSiteDao crawlerSiteDao;
	@Autowired
	private CrawlerCookieDao crawlerCookieDao;
	@Autowired
	private CrawlerHeaderDao crawlerHeaderDao;
	@SuppressWarnings("unchecked")
	@Override
	public CrawlerSiteVO queryByTaskId(Integer taskId) {
		CrawlerSiteVO csv=new CrawlerSiteVO();
		CrawlerSite cs=(CrawlerSite)crawlerSiteDao.queryByTaskId(CrawlerSite.class,"crawlerTask.id", taskId,(String[])ReflectUtil.getClassByProperty(CrawlerSite.class, FixedFieldUtil.QUERY_FILTER));
		List<CrawlerCookieVO> ccv= crawlerCookieDao.queryByForeignKey(CrawlerCookieVO.class,"CrawlerSite.id", cs.getId(),(String[])ReflectUtil.getClassByProperty(CrawlerCookie.class, FixedFieldUtil.QUERY_FILTER));
		List<CrawlerHeaderVO> chv= crawlerHeaderDao.queryByForeignKey(CrawlerHeaderVO.class,"CrawlerSite.id", cs.getId(),(String[])ReflectUtil.getClassByProperty(CrawlerHeader.class, FixedFieldUtil.QUERY_FILTER));
		csv.setCharset(cs.getCharset());
		csv.setCrawlerCookies(ccv);
		csv.setCycleRetryTime(cs.getCycleRetryTime());
		csv.setDomain(cs.getDomain());
		csv.setRetryTime(cs.getRetryTime());
		csv.setSleepTime(cs.getSleepTime());
		csv.setTimeOut(cs.getTimeOut());
		csv.setUserAgent(cs.getUserAgent());
		csv.setCrawlerHeaders(chv);
		return  csv;		 
	}
	
   
	
}
