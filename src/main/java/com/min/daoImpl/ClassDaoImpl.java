package com.min.daoImpl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.dao.IClassDao;
import com.min.vo.ClassSubjectVo;
import com.min.vo.ClassVo;
import com.min.vo.SubjectVo;

@Repository
public class ClassDaoImpl implements IClassDao{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	private String NS = "com.min.daoImpl.Class.";
	
	@Override
	public List<ClassVo> classSelectAll() {
		logger.info("ClassDaoImpl classSelectAll / 전체조회");
		return sqlSession.selectList(NS+"classSelectAll");
	}
	
	@Override
	public List<ClassVo> classSelected() {
		logger.info("ClassDaoImpl classSelectAll / 구분조회");
		return sqlSession.selectList(NS+"classSelected");
	}
	
	@Override
	public ClassVo classSelectDetail(String vo) {
		logger.info("ClassDaoImpl classSelectDetail / 상세조회 : ",vo);
		return sqlSession.selectOne(NS+"classSelectDetail",vo);
	}

	@Override
	public int classFormInsert(Map<String, Object> vo) {
		logger.info("ClassDaoImpl classFormInsert / 과정등록폼 생성 : ",vo);
		return sqlSession.insert(NS+"classFormInsert",vo);
	}

	@Override
	public int classSubjectInsert(Map<String, Object> vo) {
		logger.info("ClassDaoImpl classSubjectInsert / 과정 과목리스트 생성 : ",vo);
		return sqlSession.insert(NS+"classSubjectInsert",vo);
	}
	
	
	@Override
	public int classUpdate(Map<String, Object> vo) {
		return sqlSession.update(NS+"classUpdate", vo);
	}
	
	@Override
	public int classTimeUpdate() {
		return sqlSession.update(NS+"classTimeUpdate");
	}
	
	@Override
	public int classTimeSearch(String cla_num) {
		return sqlSession.selectOne(NS+"classTimeSearch",cla_num);
	}
	
	// 임시
	@Override
	public List<SubjectVo> subjectSelected() {
//	public List<String> subjectSelected() {
		return sqlSession.selectList(NS+"subjectSelected");
	}
	
}
