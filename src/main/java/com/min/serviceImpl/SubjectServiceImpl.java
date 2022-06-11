package com.min.serviceImpl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.min.dao.SubjectDao;
import com.min.service.SubjectService;
import com.min.vo.MemberVo;
import com.min.vo.RowNumVo;
import com.min.vo.SubjectVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SubjectServiceImpl implements SubjectService{

	
	@Autowired
	private SubjectDao sDao;
	
	//1) 과목 등록
	@Override
	public int InsertSubject(Map<String, Object> map) {
		log.info("========== SubjectServiceImpl/InsertSubject ==========");
		log.info("========== SubjectServiceImpl/InsertSubject : {} "+map+"==========");
		int n = sDao.subInsertSubject(map);
		int m = sDao.subInsertCurriculum(map);
		return (n>0||m>0)?1:0;
	}
	@Override
	public int UpdateSubIns(Map<String, Object> map) {
		log.info("========== SubjectServiceImpl/UpdateSubIns : {} "+map+" ==========");
		int n = sDao.subInsertRegister(map);
		int m = sDao.subUpdateInstructor(map);
		return (n>0||m>0)?1:0;
	}


	//2) 과목 조회
	//0) 전체목록 갯수 조회
	@Override
	public int subjectTotalAdmin() {
		log.info("========== SubjectServiceImpl/subjectTotalAdmin 관리자의 과목 전체목록 갯수 ==========");
		return sDao.subjectTotalAdmin();
	}

	@Override
	public int subjectTotalUser() {
		log.info("========== SubjectServiceImpl/subjectTotalUser 관리자의 과목 전체목록 갯수 ==========");
		return sDao.subjectTotalUser();
	}
	//2-1) 관리자의 과목 전체목록 조회
		@Override
		public List<SubjectVo> subSelectAllAdmin(RowNumVo rVo) {
			log.info("========== SubjectServiceImpl/subSelectAllAdmin 일반회원의 과목 전체목록 갯수 ==========");
			return sDao.subSelectAllAdmin(rVo);
		}
		@Override
		public List<SubjectVo> subSelectStatusAdmin(RowNumVo rVo) {
			log.info("========== SubjectServiceImpl/subSelectAllAdmin 일반회원의 과목 전체목록 갯수 ==========");
			return sDao.subSelectStatusAdmin(rVo);
		}
		//2-1) 관리자의 과목 상세 조회
		@Override
		public SubjectVo adminSubjectDetail(String sub_num) {
			log.info("========== SubjectServiceImpl/adminSubjectDetail 관리자의 과목 상세 조회 ==========");
			log.info("========== SubjectServiceImpl/adminSubjectDetail 관리자의 과목 상세 조회 : "+sub_num+ " ==========");
			return sDao.adminSubjectDetail(sub_num);
		}
		//2-3) 비회원/일반회원/강사의 과목 전체목록 조회
		@Override
		public List<SubjectVo> subSelectAllUser(RowNumVo rVo) {
			log.info("========== SubjectServiceImpl/subSelectAllUser 일반회원의 과목 전체목록 조회 ==========");
			return sDao.subSelectAllUser(rVo);
		}
		//2-4) 일반회원의 과목 상세 조회
		@Override
		public SubjectVo userSubjectDetail(String subnum) {
			log.info("========== SubjectServiceImpl/comSubjectDetail 일반회원의 과목 상세 조회 ==========");
			log.info("========== SubjectServiceImpl/comSubjectDetail 일반회원의 과목 상세 조회 : "+subnum+ "==========");
			return sDao.userSubjectDetail(subnum);
		}
		//2-5) 일반회원/강사의 마이페이지에서의 등록 과목 목록 조회
		@Override
		public List<SubjectVo> subSelectMySubject(SubjectVo sVo) {
			log.info("========== SubjectServiceImpl/subSelectMySubject  마이페이지에서의 등록 과목 목록 조회 ==========");
			log.info("========== SubjectServiceImpl/subSelectMySubject  마이페이지에서의 등록 과목 목록 조회 : "+sVo+ "==========");
			return sDao.subSelectMySubject(sVo);
		}
		
		//3) 관리자의 과목 상태변경
		@Override
		public boolean subUpdateStatusA(Map<String, Object> map) {
			log.info("========== SubjectServiceImpl/comSubjectDetail 일반회원의 과목 상세 조회 ==========");
			log.info("========== SubjectServiceImpl/comSubjectDetail 일반회원의 과목 상세 조회 : {} "+map+"==========");
			return sDao.subUpdateStatusA(map);
		}



		


	
}
