package com.min.dao;

import java.util.List;
import java.util.Map;

import com.min.vo.ClassBoardVo;

public interface IClassBoardDao {

	public List<ClassBoardVo> classBoardSelectedAll(ClassBoardVo vo);
	
	public ClassBoardVo classBoardSelectDetail(int seq);
	
	public int classVideoInsert(Map<String, Object> map);
	
	public int classDocInsert(Map<String, Object> map);
	
	public int classBoardDocInsert(Map<String, Object> map);
	
	public String findFile(int seq);
}
