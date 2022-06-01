package com.min.daoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.dao.ITagDao;
import com.min.vo.TagVo;

@Repository
public class TagDaoImpl implements ITagDao {

	@Autowired 
	private SqlSessionTemplate session; 
	private final String NS = "com.min.daoImpl.TagDaoImpl.";
	
	@Override
	public List<TagVo> selectTagClassAndSubject() {
		return session.selectList(NS+"selectTagClassAndSubject");
	}
}
