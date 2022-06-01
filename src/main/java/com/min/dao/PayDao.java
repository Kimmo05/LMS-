package com.min.dao;

import java.util.List;
import java.util.Map;

import com.min.vo.PayVo;

public interface PayDao {
	
	public List<PayVo> paySelect();
	
	public int payInsert(Map<String, Object> map);
}
