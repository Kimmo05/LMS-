package com.min.service;

import java.util.List;
import java.util.Map;

import com.min.vo.RowNumVo;
import com.min.vo.SubjectVo;

public interface SubjectService {
	

	//1) 과목 등록
	//1-1) 과목 등록시 과목정보(과목명, 과목설명, 과목카테고리코드, 과목등록자ID)입력
	//1-2) 과목 등록시 등록자정보(등록자 코드, 등록자 권한, 과목등록자ID)입력
	public int subInsertSubject(Map<String, Object> map);
	public int subUpdateInstructor(Map<String, Object> map);

	//과목 조회
	//0) 페이징 처리를 위한 전체 갯수 출력
	public int subjectTotalAdmin();
	public int subjectTotalUser();
	//2-1) 관리자의 과목 전체목록 조회
	public List<SubjectVo> subSelectAllAdmin(RowNumVo rVo);
	//2-2) 관리자의 과목 상세 조회
	public SubjectVo adminSubjectDetail(String sub_num);
	//2-3) 일반회원의 과목 전체목록 조회
	public List<SubjectVo> subSelectAllUser(RowNumVo rVo);
	//2-4) 일반회원의 과목 상세 조회
	public SubjectVo comSubjectDetail(String sub_num);

}
