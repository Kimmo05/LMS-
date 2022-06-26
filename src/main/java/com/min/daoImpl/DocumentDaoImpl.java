package com.min.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.dao.IDocumentDao;

@Repository
public class DocumentDaoImpl implements IDocumentDao{
	
	@SuppressWarnings("unused")
	@Autowired 
	private SqlSessionTemplate sqlSession;
}
