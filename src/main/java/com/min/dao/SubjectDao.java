package com.min.dao;

import java.util.Map;

import com.min.vo.SubjectVo;

public interface SubjectDao {
	
	//1)과목 등록
	//1-1) 과목 등록시 과목정보(과목명, 과목설명, 과목카테고리코드, 과목등록자ID)입력
	public int subInsertSubject(Map<String, Object> map);
	//1-2) 과목 등록시 등록자정보(등록자 코드, 등록자 권한, 과목등록자ID)입력
	public int subInsertRegister(Map<String, Object> map);
}
