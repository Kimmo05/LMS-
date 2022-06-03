package com.min.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.dao.IStatisticsDao;
import com.min.vo.SubjectCodeVo;

@Repository
public class StatisticsDaoImpl implements IStatisticsDao {

	private final String NS = "com.min.StatisticsDaoImpl.";
	@Autowired
	private SqlSessionTemplate session ;
	@Override
	public String selectSubjectCode() {
		return session.selectOne(NS+"selectSubjectCode");
	}

}
