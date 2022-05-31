package com.min.daoImpl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.dao.SubjectDao;
import com.min.vo.SubjectVo;

@Repository
public class SubjectDaoImpl implements SubjectDao{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	private final String NS = "com.min.daoImpl.SubjectDaoImpl.";

	//1) 과목 등록
	//1-1) 과목 등록시 과목정보(과목명, 과목설명, 과목카테고리코드, 과목등록자ID)입력
	@Override
	public int subInsertSubject(Map<String, Object> map) {
		logger.info("========== SubjectDaoImpl/subInsertSubject ==========");
		logger.info("========== subInsertSubject : "+map+" ==========");
		return sqlSession.insert(NS+"subInsertSubject", map);
	}

	//1-2) 과목 등록시 등록자정보(등록자 코드, 등록자 권한, 과목등록자ID)입력
	@Override
	public int subInsertRegister(Map<String, Object> map) {
		logger.info("========== SubjectDaoImpl/subInsertRegister ==========");
		logger.info("========== subInsertRegister : "+map+" ==========");
		return sqlSession.insert(NS+"subInsertRegister", map);
	}


	}




	


