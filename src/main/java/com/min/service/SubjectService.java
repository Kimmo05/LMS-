package com.min.service;

import java.util.List;
import java.util.Map;

import com.min.vo.MemberVo;
import com.min.vo.RowNumVo;
import com.min.vo.SubjectVo;

public interface SubjectService {
	

	//1) 과목 등록
	public int InsertSubject(Map<String, Object> map);
	public int UpdateSubIns(Map<String, Object> map);
	

	
	//과목 조회
	//0) 페이징 처리를 위한 전체 갯수 출력
	public int subjectTotalAdmin();
	public int subjectTotalUser();
	
	//2-1) 관리자의 과목 전체목록 조회
	public List<SubjectVo> subSelectAllAdmin(RowNumVo rVo);
	public List<SubjectVo> subSelectStatusAdmin(RowNumVo rVo);
	//2-2) 관리자의 과목 상세 조회
	public SubjectVo adminSubjectDetail(String sub_num);
	//2-3) 일반회원의 과목 전체목록 조회
	public List<SubjectVo> subSelectAllUser(RowNumVo rVo);
	//2-4) 일반회원의 과목 상세 조회
	public SubjectVo userSubjectDetail(String subnum);

	public List<SubjectVo> subSelectMySubject(SubjectVo sVo);
	
	
	//과목 상태변경
	public boolean subUpdateStatusA(Map<String, Object> map);

}
