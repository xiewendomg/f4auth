package com.keduox.service.crawler.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keduox.dao.crawler.CrawlerPageDao;
import com.keduox.dao.crawler.CrawlerPutFiledDao;
import com.keduox.dao.crawler.CrawlerTargetRequestDao;
import com.keduox.entity.crawler.CrawlerPage;
import com.keduox.entity.crawler.CrawlerPageVO;
import com.keduox.entity.crawler.CrawlerPutFiled;
import com.keduox.entity.crawler.CrawlerPutFiledVO;
import com.keduox.entity.crawler.CrawlerTargetRequest;
import com.keduox.entity.crawler.CrawlerTargetRequestVO;
import com.keduox.service.base.impl.BaseServiceImpl;
import com.keduox.service.crawler.CrawlerPageService;
import com.keduox.util.FixedFieldUtil;
import com.keduox.util.ReflectUtil;
@Service
public class CrawlerPageServiceImpl extends BaseServiceImpl implements CrawlerPageService {

	@Autowired
	private CrawlerPageDao crawlerPageDao;
	@Autowired
	private CrawlerTargetRequestDao crawlerTargetRequestDao;
	@Autowired
	private CrawlerPutFiledDao crawlerPutFiledDao;
	@SuppressWarnings("unchecked")
	@Override
	public List<CrawlerPageVO> queryByForeignKey(Integer taskId) {
	List<CrawlerPageVO>	cpvs=new ArrayList<CrawlerPageVO>();
	List<CrawlerPage> cps= crawlerPageDao.queryByForeignKey(CrawlerPage.class, "crawlerTask.id", taskId,
			(String[]) ReflectUtil.getClassByProperty(CrawlerPage.class, FixedFieldUtil.QUERY_FILTER));
	for(CrawlerPage cp:cps){
		CrawlerPageVO cpv=new CrawlerPageVO();
		cpv.setUrl(cp.getUrl());
		List<CrawlerTargetRequestVO> ctrvs=crawlerTargetRequestDao.queryByForeignKey(CrawlerTargetRequestVO.class, "crawlerPage.id",
			cp.getId(),(String[]) ReflectUtil.getClassByProperty(CrawlerTargetRequest.class, FixedFieldUtil.QUERY_FILTER));
		List<CrawlerPutFiledVO> cpfvs=crawlerPutFiledDao.queryByForeignKey(CrawlerPutFiledVO.class, "crawlerPage.id",
			cp.getId(),(String[]) ReflectUtil.getClassByProperty(CrawlerPutFiled.class, FixedFieldUtil.QUERY_FILTER)	);
		cpv.setCrawlerPutFileds(cpfvs);
		cpv.setCrawlerTargetRequest(ctrvs);
	}
	return cpvs;
	}

}
