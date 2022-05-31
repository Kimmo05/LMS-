package com.min.daoImpl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.dao.PayDao;
import com.min.vo.PayVo;

@Repository
public class PayDaoImpl implements PayDao{
	
	private final String NS="com.min.daoImpl.PayDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//주문 전체조회
	@Override
	public List<PayVo> paySelect() {
		return sqlSession.selectList(NS+"paySelect");
	}
	
	
	//결제 insert
	@Override
	public int payInsert(Map<String, Object> map) {
		return sqlSession.insert(NS+"payInsert",map);
	}

	
}
