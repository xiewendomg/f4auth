package com.keduox.service.crawler.spider;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.keduox.dao.base.BaseTest;

public class SpiderCreateServiceTest extends BaseTest{

	@Autowired
	private SpiderCreateService spiderCreateService;
	@Test
	public void test() {
		spiderCreateService.RunSpider(new Integer []{1});
	}

}
