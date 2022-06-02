package com.min.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.dao.IClassSubjectDao;
import com.min.service.IClassSubjectService;
import com.min.vo.ClassSubjectVo;
@Service
public class ClassSubjectServiceImpl implements IClassSubjectService {

	@Autowired
	private IClassSubjectDao dao;
	
}
