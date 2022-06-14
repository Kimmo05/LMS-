package com.min.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.min.dao.IClassBoardDao;
import com.min.service.IClassBoardService;
import com.min.vo.ClassBoardVo;

@Service
@Transactional
public class ClassBoardServiceImpl implements IClassBoardService {

	@Autowired
	IClassBoardDao dao;

	@Override
	public List<ClassBoardVo> classBoardSelectedAll(ClassBoardVo vo) {
		return dao.classBoardSelectedAll(vo);
	}
	
	@Override
	public ClassBoardVo classBoardSelectDetail(int seq) {
		return dao.classBoardSelectDetail(seq);
	}

	@Override
	public int classVideoInsert(Map<String, Object> map) {
		return dao.classVideoInsert(map);
	}

	@Override
	public int classDocInsert(Map<String, Object> map) {
		int n = dao.classDocInsert(map);
		int m = dao.classBoardDocInsert(map);
		return (n>0||m>0)? 1:0;
	}

	@Override
	public String findFile(int seq) {
		return dao.findFile(seq);
	}
	
	@Override
	public int documentUpdate(Map<String, Object> map) {
		int n = dao.documentModify(map);
		int m = dao.classBoardDocModify(map);
		return (n>0||m>0)? 1:0;
	}
	
	@Override
	public int classBoardDocDelete(int seq) {
		int n = dao.classBoardDocDelete(seq);
		int m = dao.documentDelete(seq);
		return (n>0||m>0)? 1:0;
	}
}

