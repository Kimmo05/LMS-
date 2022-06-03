package com.min.daoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.dao.IClassBoardDao;
import com.min.vo.ClassBoardVo;

@Repository
public class ClassBoardDaoImpl implements IClassBoardDao{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	private String NS = "com.min.daoImpl.Class.";

	@Override
	public List<ClassBoardVo> classBoardSelectAll() {
		return sqlSession.selectList(null);
	}

	@Override
	public ClassBoardVo classBoardSelectDetail() {
		return null;
	}
	
	
	
}
