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
	
	
	//2) 관리자의 과목 조회
	//2-0) 페이징 처리를 위한 전체 갯수 출력
	public int subjectTotalAdmin();
	public int subjectTotalUser();
	//2-1) 관리자의 과목 전체목록 조회
	public List<SubjectVo> subSelectAllAdmin(RowNumVo rVo);
	public List<SubjectVo> subSelectStatusAdmin(RowNumVo rVo);
	//2-2) 관리자의 과목 상세 조회
	public SubjectVo adminSubjectDetail(String sub_num);
	//2-3) 관리자의 과목 승인을위한 전체목록 조회
	public List<SubjectVo> subSelectToApproveAdmin(RowNumVo rVo);
	
	//3) 비회원/일반회원/강사의 과목 조회
	//3-1) 비회원/일반회원/강사의 과목 전체목록 조회
	public List<SubjectVo> subSelectAllUser(SubjectVo sVo);
	//3-2) 비회원/일반회원/강사의 과목 상세 조회
	public SubjectVo userSubjectDetail(String sub_num);
	//3-3) 일반회원/강사의 마이페이지에서의 과목 목록 조회
	public List<SubjectVo> subSelectMySubject(SubjectVo sVo);
	
	//4) 과목 승인
	//4-1) 과목 등록 후 관리자의 과목 검수 후 과목상태를 승인'A'으로 변경
	public int subUpdateStatusA(String sub_num);
	//4-2) 과목 등록 후 관리자의 과목 검수 후 과목상태를 삭제'D'으로 변경
	public int subUpdateStatusD(String sub_num);
	//4-3) 과목 등록 후 관리자의 과목 검수 후 과목상태를 반려'R'으로 변경
	//4-4) 과목 반려시 관리자의 과목 반려 사유 입력
	public int subReject(Map<String, Object> map);
	
	
	//5-1) 일반회원/강사 과목 수정시 과목 정보 수정
	public int subUpdateSubject(Map<String, Object> map);
	//5-2) 일반회원/강사 과목 수정시 커리큘럼 정보 수정
	public int subUpdateCurriculum(Map<String, Object> map);

}
