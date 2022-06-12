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
	//2-3) 관리자의 과목 승인을위한 전체목록 조회
	public List<SubjectVo> subSelectToApproveAdmin(RowNumVo rVo);
	
	//3-1) 비회원/일반회원/강사의 과목 전체목록 조회
	public List<SubjectVo> subSelectAllUser(SubjectVo sVo);
	//3-2) 비회원/일반회원/강사의 과목 상세 조회
	public SubjectVo userSubjectDetail(String sub_num);
	//3-3) 일반회원/강사의 마이페이지에서의 과목 목록 조회
	public List<SubjectVo> subSelectMySubject(SubjectVo sVo);
	
	
	//4) 과목 등록 후 관리자의 과목 검수 후 과목상태를 승인'A'으로 변경
	public int subUpdateStatusA(Map<String, Object> map);

}
