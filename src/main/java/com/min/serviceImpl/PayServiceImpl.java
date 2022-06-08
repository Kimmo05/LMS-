package com.min.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.dao.PayDao;
import com.min.service.IPayService;
import com.min.vo.CouponVo;
import com.min.vo.PayVo;

@Service
public class PayServiceImpl implements IPayService{

	@Autowired
	PayDao dao;
	
	@Override
	public List<PayVo> paySelectAll() {
		return dao.paySelectAll();
	}

	@Override
	public List<PayVo> paySelectStatus(Map<String, Object> map) {
		return dao.paySelectStatus(map);
	}

	@Override
	public int payInsert(Map<String, Object> map) {
		return dao.payInsert(map);
	}

	@Override
	public List<CouponVo> couponSelect(Map<String, Object> map) {
		return dao.couponSelect(map);
	}

	@Override
	public int updateCoupon(Map<String, Object> map) {
		return dao.updateCoupon(map);
	}

	@Override
	public int updateMileage(Map<String, Object> map) {
		return dao.updateMileage(map);
	}

	@Override
	public PayVo getPayDetail(Map<String, Object> map) {
		return dao.getPayDetail(map);
	}

}
