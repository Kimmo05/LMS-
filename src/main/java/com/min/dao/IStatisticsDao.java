package com.min.dao;

import com.min.vo.SubjectCodeVo;

import java.util.Map;

public interface IStatisticsDao {
	public String selectSubjectCode();
	public int updatePrefer(Map<String,Object> map);
}
