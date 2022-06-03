package com.min;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.min.dao.SubjectDao;
import com.min.vo.SubjectVo;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/*.xml"})
public class Subject_test {
	
	@Autowired
	private SubjectDao sDao;

	private Logger logger = LoggerFactory.getLogger(Subject_test.class);
	
//	@Test
	public void test() {
		logger.info("Subject_test JUnit Test 실행");
	}
	
	@Test
	public void subInsertSubject() {
		logger.info("subInsertSubject JUnit Test 실행");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sub_title", "subInsertSubject/sub_title JUnit Test");
		map.put("sub_content", "subInsertSubject/sub_content JUnit Test");
		map.put("sub_cod_code", "SUB101");
		map.put("sub_reg_id", "dsoutter2f731");
		
		int result = sDao.subInsertSubject(map);
		logger.info("---------- JUnit Test/Subject_test/subInsertSubject ----------");
		System.out.println(result);
		logger.info("---------- subInsertSubject 입력된 과목 수 : "+result+" ----------");
		
	}
	
//	@Test
	public void subInsertRegister() {
		logger.info("subInsertRegister JUnit Test 실행");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reg_code", "REG115");
		map.put("reg_auth", "ROLE_USER");
		map.put("reg_id", "dsoutter2f731");
		
		int result = sDao.subInsertRegister(map);
		logger.info("---------- JUnit Test/Subject_test/subInsertRegister ----------");
		System.out.println(result);
		logger.info("---------- subInsertRegister 입력된 등록자 수 : "+result+" ----------");
	}
	

}















