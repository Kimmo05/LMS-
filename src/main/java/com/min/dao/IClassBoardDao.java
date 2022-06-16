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
	
	public int documentModify(Map<String, Object> map);
	
	public int classBoardDocModify(Map<String, Object> map);
	//과정 자료게시판 삭제 (파일 자료 삭제)
	public int classBoardDocDelete(int seq);
	public int documentDelete(int seq);
	//과정 자료게시판 삭제 (비디오 자료 삭제)
	public int classBoardVideoDelete(int seq);
	
	
}
