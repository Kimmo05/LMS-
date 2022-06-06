package com.min.dao;

import java.util.List;
import java.util.Map;

import com.min.vo.CouponVo;
import com.min.vo.PayVo;

public interface PayDao {
	
	//관리자 전체조회
	public List<PayVo> paySelectAll();
	
	//관리자 결제상태별 조회
	public List<PayVo> paySelectStatus(Map<String, Object> map);
	
	//결제시 테이블 insert
	public int payInsert(Map<String, Object> map);
	
	//결제시 쿠폰조회
	public List<CouponVo> couponSelect(Map<String, Object> map);
	
	//쿠폰사용 결제시 보우큐폰 상태 수정
	public int updateCoupon(Map<String,Object> map);
	
	//마일리지사용 결제시 마일리지 차감
	public int updateMileage(Map<String,Object> map);
}
