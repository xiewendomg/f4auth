package com.keduox.dao.crawler.impl;

import java.io.Serializable;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

import com.keduox.dao.base.impl.BaseDaoImpl;
import com.keduox.dao.crawler.CrawlerSpiderDao;
import com.keduox.entity.crawler.CrawlerSite;
import com.keduox.entity.crawler.CrawlerSpider;
@Repository
public class CrawlerSpiderDaoImpl extends BaseDaoImpl<CrawlerSpider, Serializable> implements CrawlerSpiderDao{

	public void say(){
		String alias = "user_"; //查詢時的table別名  
		DetachedCriteria dc = DetachedCriteria.forClass(CrawlerSite.class,alias);  
		ProjectionList pList = Projections.projectionList();  
		pList.add(Projections.property(alias + "." + "id").as("id"));  
		pList.add(Projections.property(alias + "." + "name").as("name"));  
		pList.add(Projections.property(alias + "." + "age").as("age"));  
		pList.add(Projections.property(alias + "." + "sex").as("sex"));  
		dc.setProjection(pList);  
		dc.add(Restrictions.eq(null,null));
		dc.setResultTransformer(Transformers.aliasToBean(CrawlerSite.class));  
		//dc.li
		//resultList = memberService.findByDetached(dc).size();
	}

}
