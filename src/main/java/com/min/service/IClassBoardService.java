package com.min.service;

import java.util.List;
import java.util.Map;

import com.min.vo.ClassBoardVo;

public interface IClassBoardService {
	
	public List<ClassBoardVo> classBoardSelectedAll(ClassBoardVo vo);
	
	public ClassBoardVo classBoardSelectDetail(int seq);
	
	public int classVideoInsert(Map<String, Object> map);
	
	public int classDocInsert(Map<String, Object> map);
	
	public String findFile(int seq);
	
	public int documentUpdate(Map<String, Object> map);
	
	public int classBoardDocDelete(int seq);
	
	public int classBoardVideoDelete(int seq);
	
	public int classVideoUpdate(Map<String, Object> map);
}
