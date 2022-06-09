package com.min.dao;

import java.util.List;
import java.util.Map;

import com.min.vo.RowNumVo;
import com.min.vo.SubjectVo;

public interface SubjectDao {
	
	//1) 과목 등록
		//1-1) 과목 등록시 과목정보(과목명, 과목설명, 과목카테고리코드, 과목등록자ID)입력
		public int subInsertSubject(Map<String, Object> map);
		//1-2) 과목 등록시 등록자정보(등록자 코드, 등록자 권한, 과목등록자ID)입력
		public int subInsertRegister(Map<String, Object> map);
		//1-3) 과목 등록시 커리큘럼정보(과목번호,기타내용,상세내용,버전,시간,난이도,첨부파일)입력
		public int subInsertCurriculum(Map<String, Object> map);
		//1-4) 과목 등록시 등록자 회원/강사 구분 후 강사일시 담당강사 등록, 일반회원일시 담당강사 null
		public int subUpdateInstructor(Map<String, Object> map);
		
		
		//2) 과목 조회
		//0) 페이징 처리를 위한 전체 갯수 출력
		public int subjectTotalAdmin();
		public int subjectTotalUser();
		//2-1) 관리자의 과목 전체목록 조회
		public List<SubjectVo> subSelectAllAdmin(RowNumVo rVo);
		//2-4) 관리자의 과목 상세 조회
		public SubjectVo adminSubjectDetail(String sub_num);
		//2-3) 일반회원의 과목 전체목록 조회
		public List<SubjectVo> subSelectAllUser(RowNumVo rVo);
		//2-4) 일반회원의 과목 상세 조회
		public SubjectVo comSubjectDetail(String sub_num);
		
		
		//3) 과목 등록 후 관리자의 과목 검수 후 과목상태를 승인'A'으로 변경
		public boolean subUpdateStatusA(Map<String, Object> map);
}
