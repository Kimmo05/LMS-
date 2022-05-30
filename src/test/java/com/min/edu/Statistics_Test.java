package com.min.edu;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:/src/main/webapp/WEB-INF/spring/appServlet/*.xml"})
public class Statistics_Test {

	private Logger logger = LoggerFactory.getLogger(Statistics_Test.class);
	@Test
	public void test() {
		logger.info("JUnit Test");
	}

}
