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
import com.min.vo.VoteVo;

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
		logger.info("ClassDaoImpl classSelectDetail / 상세조회 : {}",vo);
		return sqlSession.selectOne(NS+"classSelectDetail",vo);
	}

	@Override
	public List<SubjectVo> classSelectedSub(String cla_num) {
		return sqlSession.selectList(NS+"classSelectedSub",cla_num);
	}
	
	@Override
	public int classFormInsert(Map<String, Object> vo) {
		logger.info("ClassDaoImpl classFormInsert / 과정등록폼 생성 : {}",vo);
		return sqlSession.insert(NS+"classFormInsert",vo);
	}

	@Override
	public int classSubjectInsert(Map<String, Object> vo) {
		logger.info("ClassDaoImpl classSubjectInsert / 과정 과목리스트 생성 : {}",vo);
		return sqlSession.insert(NS+"classSubjectInsert",vo);
	}
	
	@Override
	public int voteBoxInsert(Map<String, Object> vo) {
		logger.info("ClassDaoImpl voteBoxInsert / 과정 투표박스 생성 : {}", vo);
		return sqlSession.insert(NS+"voteBoxInsert",vo);
	}
	
	@Override
	public int classUpdate(Map<String, Object> vo) {
		logger.info("ClassDaoImpl classUpdate / 과정 담당강사 과정 수정 : {}", vo);
		return sqlSession.update(NS+"classUpdate", vo);
	}
	
	@Override
	public int classTimeUpdate() {
		logger.info("ClassDaoImpl classUpdate / 과정 과목 총 수업시간 계산");
		return sqlSession.update(NS+"classTimeUpdate");
	}
	
	@Override
	public int classTimeSearch(String cla_num) {
		logger.info("ClassDaoImpl classTimeSearch / 과정 과목 총 수업시간 계산을 위한 계산");
		return sqlSession.selectOne(NS+"classTimeSearch",cla_num);
	}
	
	@Override
	public int insApply(VoteVo vo) {
		logger.info("ClassDaoImpl insApply / 과정 과목 당 강사 투표 : {}",vo);
		return sqlSession.insert(NS+"insApply",vo);
	}
	
	// 임시
	@Override
	public List<SubjectVo> subjectSelected() {
		logger.info("ClassDaoImpl subjectSelected / 과목 선택 리스트");
		return sqlSession.selectList(NS+"subjectSelected");
	}
	
}
