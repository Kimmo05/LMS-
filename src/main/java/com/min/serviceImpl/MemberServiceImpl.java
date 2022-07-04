package com.min.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.dao.IMemberDao;
import com.min.service.IMemberService;
import com.min.vo.CareerVo;
import com.min.vo.MemberVo;
import com.min.vo.RowNumVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements IMemberService{
	
	@Autowired
	private IMemberDao dao;

	@Override
	public MemberVo loginTra(Map<String, Object> map) {
		log.info("MemberVo loginTra 로그인 서비스 실행");
		return dao.loginTra(map);
	}
	@Override
	public CareerVo loginCar(Map<String, Object> map) {
		log.info("MemberVo loginCar 강사 경력등록 서비스 실행");
		return dao.loginCar(map);
	}
	@Override
	public int traSignUp(Map<String, Object> map) {
		log.info("MemberVo traSignUp 일반회원 회원가입 서비스 실행");
		return dao.traSignUp(map);
	}

	@Override
	public MemberVo loginIns(Map<String, Object> map) {
		log.info("MemberVo loginIns 강사 로그인 서비스 실행");
		return dao.loginIns(map);
	}

	@Override
	public int InsSignUp(Map<String, Object> map) {
		log.info("MemberVo InsSignUp 강사 회원가입 서비스 실행");
		return dao.InsSignUp(map);
	}

	@Override
	public List<MemberVo> adminUserListRow(RowNumVo rvo) {
		log.info("MemberServiceImpl adminUserListRow 일반회원 리스트 {}", rvo);
		return dao.adminUserListRow(rvo);
	}

	@Override
	public int adminUserListTotal() {
		log.info("MemberServiceImpl adminUserListTotal");
		return dao.adminUserListTotal();
	}

	@Override
	public int adminDelTra(Map<String, Object> map) {
		log.info("MemberServiceImpl adminDelTra");
		return dao.adminDelTra(map);
	}

	@Override
	public MemberVo findTraId(Map<String, Object> map) {
		log.info("MemberServiceImpl findTraId 일반회원 아이디 찾기 서비스 실행");
		return dao.findTraId(map);
	}

	@Override
	public int delTra(Map<String, Object> map) {
		log.info("MemberServiceImpl delTra");
		return dao.delTra(map);
	}

	@Override
	public int updateTra(Map<String, Object> map) {
		log.info("MemberServiceImpl updateTra 일반회원 회원정보 수정 서비스 실행");
		return dao.updateTra(map);
	}

	@Override
	public MemberVo findInsId(Map<String, Object> map) {
		log.info("MemberServiceImpl findInsId 강사 아이디 찾기 서비스 실행");
		return dao.findInsId(map);
	}

	@Override
	public int delIns(Map<String, Object> map) {
		log.info("MemberServiceImpl delIns");
		return dao.delIns(map);
	}

	@Override
	public int updateIns(Map<String, Object> map) {
		log.info("MemberServiceImpl updateIns 강사 회원정보 수정 서비스 실행");
		return dao.updateIns(map);
	}

	@Override
	public int updateProfile(Map<String, Object> map) {
		log.info("MemberServiceImpl updateProfile");
		return dao.updateProfile(map);
	}

	@Override
	public int checkTraId(String id) {
		log.info("MemberServiceImpl CheckTraId 일반회원 아이디 중복 서비스 실행");
		return dao.checkTraId(id);
	}

	@Override
	public int checkInsId(String id) {
		log.info("MemberServiceImpl checkInsId 강사 아이디 중복 서비스 실행");
		return dao.checkInsId(id);
	}

	@Override
	public int insertCar(Map<String, Object> map) {
		log.info("MemberServiceImpl insertCar 강사 경력 등록 서비스 실행");

		int n = dao.insertCar(map);
		int m = dao.insCarUpdate(map);
		return (n>0 || m>0) ? 1:0 ;
	}

	@Override
	public int updateCar(Map<String, Object> map) {
		log.info("MemberServiceImpl updateCar");
		
		int n = dao.updateCar(map);
		int m = dao.updateCarDelflag(map);
		return (n>0 || m>0) ? 1:0 ;
	}
	@Override
	public int checkTraEmail(String id) {
		log.info("MemberServiceImpl checkTraEmail 일반회원 이메일발송 서비스 실행");
		return dao.checkTraEmail(id);
	}
	@Override
	public int checkInsEmail(String id) {
		log.info("MemberServiceImpl checkInsEmail 강사 이메일발송 서비스 실행");
		return dao.checkInsEmail(id);
	}
	@Override
	public MemberVo findTraPw(Map<String, Object> map) {
		log.info("MemberServiceImpl findTraPw 일반회원 비밀번호 찾기 서비스 실행");
		return dao.findTraPw(map);
	}
	@Override
	public int updateTraPw(Map<String, Object> map) {
		log.info("MemberServiceImpl updateTraPw 일반회원 비밀번호 변경 서비스 실행");
		return dao.updateTraPw(map);
	}
	@Override
	public MemberVo findInsPw(Map<String, Object> map) {
		log.info("MemberServiceImpl findInsPw 강사 비밀번호 찾기 서비스 실행");
		return dao.findInsPw(map);
	}
	@Override
	public int updateInsPw(Map<String, Object> map) {
		log.info("MemberServiceImpl updateInsPw 강사 비밀번호 변경 서비스 실행");
		return dao.updateInsPw(map);
	}
	@Override
	public List<MemberVo> adminInsListRow(RowNumVo rvo) {
		log.info("MemberServiceImpl adminInsListRow 강사 페이징 서비스 실행");
		return dao.adminInsListRow(rvo);
	}
	@Override
	public int adminInsListTotal() {
		log.info("MemberServiceImpl adminInsListTotal 강사 페이징 서비스 실행");
		return dao.adminInsListTotal();
	}
	@Override
	public boolean changeIns(Map<String, Object> map) {
		log.info("MemberServiceImpl changeIns 강사 회원상태 변경 서비스 실행");
		return dao.changeIns(map);
	}

	


}
