package com.min.daoImpl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.min.dao.IMemberDao;
import com.min.vo.MemberVo;
import com.min.vo.RowNumVo;


@Repository
public class MemberDaoImpl implements IMemberDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String NS = "com.min.daoImpl.MemberDaoImpl.";

	@Autowired
	private PasswordEncoder passwordEncoder;


	@Override
	public MemberVo loginTra(Map<String, Object> map) {
		// TODO Auto-generated method st
		return  sqlSession.selectOne(NS+"loginTra",map);
	}

	@Override
	public int traSignUp(Map<String, Object> map) {
		String enPassword = passwordEncoder.encode((String)map.get("pw"));
		map.put("pw", enPassword);
			
		return sqlSession.insert(NS+"traSignUp",map);
	}

	@Override
	public MemberVo loginIns(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+"loginIns",map);
	}

	@Override
	public int InsSignUp(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NS+"InsSignUp",map);
	}

	@Override
	public List<MemberVo> adminUserListRow(RowNumVo rvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS+"adminUserListRow",rvo);
	}

	@Override
	public int adminUserListTotal() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+"adminUserListTotal");
	}

}
