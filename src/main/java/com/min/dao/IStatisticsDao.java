package com.min.dao;


import java.util.Map;

public interface IStatisticsDao {
	public String selectSubjectCode();
	public int updatePrefer(Map<String,Object> map);
}
