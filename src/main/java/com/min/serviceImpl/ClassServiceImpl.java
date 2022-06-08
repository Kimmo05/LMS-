package com.min.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.min.dao.IClassDao;
import com.min.service.IClassService;
import com.min.vo.ClassSubjectVo;
import com.min.vo.ClassVo;
import com.min.vo.SubjectVo;
import com.min.vo.VoteVo;

@Service
@Transactional
public class ClassServiceImpl implements IClassService {
	
	@Autowired
	private IClassDao dao;
	
	@Override
	public List<ClassVo> classSelectAll() {
		return dao.classSelectAll();
	}

	@Override
	public List<ClassVo> classSelected() {
		return dao.classSelected();
	}
	
	@Override
	public ClassVo classSelectDetail(String vo) {
		return dao.classSelectDetail(vo);
	}
	
	@Override
	public List<SubjectVo> classSelectedSub(String cla_num) {
		return dao.classSelectedSub(cla_num);
	}
	
	@Override
	public int classFormInsert(Map<String, Object> vo) {
		return dao.classFormInsert(vo);
	}

	@Override
	public int classSubjectInsert(Map<String, Object> vo) {
		int n = dao.classSubjectInsert(vo);
		int m = dao.voteBoxInsert(vo);
		return (n>0||m>0)? 1:0; 
	}
	
	
	
	@Override
	public int classUpdate(Map<String, Object> vo) {
		return dao.classUpdate(vo);
	}
	
	@Override
	public int classTimeUpdate() {
		return dao.classTimeUpdate();
	}
	
	@Override
	public int classTimeSearch(String cla_num) {
		return dao.classTimeSearch(cla_num);
	}
	
	@Override
	public int insApply(VoteVo vo) {
		return dao.insApply(vo);
	}
	
	@Override
	public List<SubjectVo> subjectSelected() {
		return dao.subjectSelected();
	}
	
}
