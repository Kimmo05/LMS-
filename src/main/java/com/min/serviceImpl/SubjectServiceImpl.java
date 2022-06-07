package com.min.serviceImpl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.dao.SubjectDao;
import com.min.service.SubjectService;
import com.min.vo.RowNumVo;
import com.min.vo.SubjectVo;

@Service
public class SubjectServiceImpl implements SubjectService{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SubjectDao sDao;

	@Override
	public int subInsertSubject1(Map<String, Object> map) {
		logger.info("========== SubjectServiceImpl/subInsertSubject ==========");
		int s = sDao.subInsertSubject(map);
		int r = sDao.subInsertRegister(map);
		return (s>0||r>0)?1:0;
	}

	@Override
	public int subInsertSubject2(Map<String, Object> map) {
		logger.info("========== SubjectServiceImpl/subInsertSubject ==========");
		int c = sDao.subInsertCurriculum(map);
		int i = sDao.subUpdateInstructor(map);
		return (c>0||i>0)?1:0;
	}

	//2) 과목 조회
	//0) 전체목록 갯수 조회
	@Override
	public int subjectTotalAdmin() {
		logger.info("========== SubjectServiceImpl/subjectTotalAdmin 관리자의 과목 전체목록 갯수 ==========");
		return sDao.subjectTotalAdmin();
	}

	@Override
	public int subjectTotalUser() {
		logger.info("========== SubjectServiceImpl/subjectTotalUser 관리자의 과목 전체목록 갯수 ==========");
		return sDao.subjectTotalUser();
	}
	//2-1) 관리자의 과목 전체목록 조회
		@Override
		public List<SubjectVo> subSelectAllAdmin(RowNumVo rVo) {
			logger.info("========== SubjectServiceImpl/subSelectAllAdmin 일반회원의 과목 전체목록 갯수 ==========");
			return sDao.subSelectAllAdmin(rVo);
		}
		//2-1) 관리자의 과목 상세 조회
		@Override
		public SubjectVo adminSubjectDetail(String sub_num) {
			logger.info("========== SubjectServiceImpl/adminSubjectDetail 관리자의 과목 상세 조회 ==========");
			return sDao.adminSubjectDetail(sub_num);
		}
		//2-3) 일반회원의 과목 전체목록 조회
		@Override
		public List<SubjectVo> subSelectAllUser(RowNumVo rVo) {
			logger.info("========== SubjectServiceImpl/subSelectAllUser 일반회원의 과목 전체목록 조회 ==========");
			return sDao.subSelectAllUser(rVo);
		}
		//2-4) 일반회원의 과목 상세 조회
		@Override
		public SubjectVo comSubjectDetail(String sub_num) {
			logger.info("========== SubjectServiceImpl/comSubjectDetail 일반회원의 과목 상세 조회 ==========");
			return sDao.comSubjectDetail(sub_num);
		}
}
