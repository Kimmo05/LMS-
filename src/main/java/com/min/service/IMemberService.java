package com.min.service;

import java.util.List;
import java.util.Map;

import com.min.vo.MemberVo;
import com.min.vo.RowNumVo;


public interface IMemberService{

	//일반회원 로그인
	public MemberVo loginTra(Map<String, Object> map);
	//일반회원 회원가입
	public int traSignUp(Map<String, Object> map);
	//시큐리티 강사 로그인
	public MemberVo loginIns(Map<String, Object> map);
	//강사 회원가입
	public int InsSignUp(Map<String, Object> map);
	
	public List<MemberVo> adminUserListRow(RowNumVo rvo);
	public int adminUserListTotal();
}
