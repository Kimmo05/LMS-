package com.min.daoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.dao.IMessageBoardDao;
import com.min.vo.MessageBoardVo;

@Repository
public class MessageBoardDaoImpl implements IMessageBoardDao{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	private String NS = "com.min.daoImpl.Class.";

	@Override
	public List<MessageBoardVo> messendBoardSelectAll(MessageBoardVo vo) {
		return sqlSession.selectList(NS+"messendBoardSelectAll",vo);
	}

	@Override
	public MessageBoardVo mesBoardSelectDetail(int seq) {
		return sqlSession.selectOne(NS+"mesBoardSelectDetail",seq);
	}
	
	
	
}
