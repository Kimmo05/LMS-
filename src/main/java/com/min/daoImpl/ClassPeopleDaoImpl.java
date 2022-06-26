package com.min.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.dao.IClassPeopleDao;

@Repository
public class ClassPeopleDaoImpl implements IClassPeopleDao{

	@SuppressWarnings("unused")
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@SuppressWarnings("unused")
	@Autowired 
	private SqlSessionTemplate sqlSession;
}
