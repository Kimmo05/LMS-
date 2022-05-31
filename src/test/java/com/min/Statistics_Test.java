package com.min;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.min.dao.ITagDao;
import com.min.vo.TagVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/*.xml"})
public class Statistics_Test {
	
	private Logger logger = LoggerFactory.getLogger(Statistics_Test.class);
	@Autowired
	private ITagDao dao;
	
	
	@Test
	public void selectTagTest() {
		logger.info("selectTagTest 실행");
		List<TagVo> lists = dao.selectTagClassAndSubject();
		System.out.println("LISTS="+lists.get(1));
	}
}
