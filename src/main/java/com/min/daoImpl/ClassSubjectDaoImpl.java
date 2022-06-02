package com.min.daoImpl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.dao.IClassSubjectDao;
import com.min.vo.ClassBoardVo;
import com.min.vo.ClassSubjectVo;

@Repository
public class ClassSubjectDaoImpl implements IClassSubjectDao{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	private String NS = "com.min.daoImpl.Class.";

	
}
