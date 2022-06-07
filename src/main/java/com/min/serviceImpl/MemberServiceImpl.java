package com.min.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.dao.IMemberDao;
import com.min.service.IMemberService;
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
		log.info("MemberVo loginTra");
		return dao.loginTra(map);
	}

	@Override
	public int traSignUp(Map<String, Object> map) {
		log.info("MemberVo traSignUp");
		return dao.traSignUp(map);
	}

	@Override
	public MemberVo loginIns(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.loginIns(map);
	}

	@Override
	public int InsSignUp(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.InsSignUp(map);
	}

	@Override
	public List<MemberVo> adminUserListRow(RowNumVo rvo) {
		log.info("MemberServiceImpl adminUserListRow {}", rvo);
		return dao.adminUserListRow(rvo);
	}

	@Override
	public int adminUserListTotal() {
		log.info("MemberServiceImpl adminUserListTotal");
		return dao.adminUserListTotal();
	}


}
