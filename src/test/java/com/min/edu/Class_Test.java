package com.min.edu;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.min.dao.IClassDao;
import com.min.dao.IClassSubjectDao;
import com.min.vo.ClassBoardVo;
import com.min.vo.ClassSubjectVo;
import com.min.vo.ClassVo;
import com.min.vo.SubjectVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/*.xml"})
public class Class_Test {

	@Autowired
	private IClassDao dao;
	
	@Autowired
	private IClassSubjectDao dao2;
	
//	@Test
	public void classSelectAll() {
		List<ClassVo> lists = dao.classSelectAll();
		System.out.println(lists);
	}

//	@Test
	public void classSelectDetail() {
		ClassVo vo = new ClassVo();
//		String like = vo.cla_like.toString();
		ClassVo list = dao.classSelectDetail("CLA001");
		System.out.println(list);
	}
	
//	@Test
	public void classFormInsert() {
		Map<String, Object> lists = new HashMap<String, Object>();
		lists.put("cla_title", "JAVA 전문가 과정 배우기");
		lists.put("cla_content", "JAVA 전문가 과정을 통해 현장에서도 문제없이!");
		int n = dao.classFormInsert(lists);
	}
	
//	@Test
	public void classSubjectInsert() {
		Map<String, Object> lists = new HashMap<String, Object>();
		lists.put("csu_sub_num", "20220523SUB100");
		int n = dao.classSubjectInsert(lists);
	}
	
//	@Test
	public void subjectSelected() {
		List<SubjectVo> lists = dao.subjectSelected();
		System.out.println(lists);
	}
	
	
	
	
}
