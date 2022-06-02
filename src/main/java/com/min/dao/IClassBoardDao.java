package com.min.dao;

import java.util.List;

import com.min.vo.ClassBoardVo;

public interface IClassBoardDao {

	public List<ClassBoardVo> classBoardSelectAll();
	
	public ClassBoardVo classBoardSelectDetail();
}
