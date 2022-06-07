package com.min.daoImpl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.dao.PayDao;
import com.min.vo.CouponVo;
import com.min.vo.PayVo;

@Repository
public class PayDaoImpl implements PayDao{
	
	private final String NS="com.min.daoImpl.PayDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//관리자 주문 전체조회
	@Override
	public List<PayVo> paySelectAll() {
		return sqlSession.selectList(NS+"paySelectAll");
	}
	
	//관리자페이지 상태별 조회
		@Override
		public List<PayVo> paySelectStatus(Map<String, Object> map) {
			return sqlSession.selectList(NS+"paySelectStatus",map);
		}
		
	//결제 insert
	@Override
	public int payInsert(Map<String, Object> map) {
		return sqlSession.insert(NS+"payInsert",map);
	}

	//결제시 쿠폰조회
	@Override
	public List<CouponVo> couponSelect(Map<String, Object> map) {
		return sqlSession.selectList(NS+"couponSelect",map);
	}

	//쿠폰사용 결제시 보유쿠폰 상태 변경
	@Override
	public int updateCoupon(Map<String, Object> map) {
		return sqlSession.update(NS+"updateCoupon",map);
	}

	//마일리지사용 결제시 마일리지 상태 변경
	@Override
	public int updateMileage(Map<String, Object> map) {
		return sqlSession.update(NS+"updateMileage",map);
	}
	
	//결제 상세조회
	@Override
	public PayVo getPayDetail(Map<String, Object> map) {
		return sqlSession.selectOne(NS+"getPayDetail",map);
	}

	
}
