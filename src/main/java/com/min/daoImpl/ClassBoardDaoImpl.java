package com.min.daoImpl;

import java.util.List;
import java.util.Map;

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
	public List<ClassBoardVo> classBoardSelectedAll(ClassBoardVo vo) {
		return sqlSession.selectList(NS+"classBoardSelectedAll",vo);
	}
	
	
	@Override
	public ClassBoardVo classBoardSelectDetail(int seq) {
		return sqlSession.selectOne(NS+"classBoardSelectDetail",seq);
	}


	@Override
	public int classVideoInsert(Map<String, Object> map) {
		return sqlSession.insert(NS+"classVideoInsert",map);
	}


	@Override
	public int classDocInsert(Map<String, Object> map) {
		return sqlSession.insert(NS+"classDocInsert",map);
	}


	@Override
	public int classBoardDocInsert(Map<String, Object> map) {
		return sqlSession.insert(NS+"classBoardDocInsert",map);
	}
	
	@Override
	public String findFile(int seq) {
		return sqlSession.selectOne(NS+"findFile",seq);
	}
	
}
