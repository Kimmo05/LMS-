package com.min.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.dao.IMessageBoardDao;
import com.min.service.IMessageBoardService;
import com.min.vo.MessageBoardVo;
@Service
public class MessageBoardServiceImpl implements IMessageBoardService {

	@Autowired
	IMessageBoardDao dao;
	
	@Override
	public List<MessageBoardVo> messendBoardSelectAll(MessageBoardVo vo) {
		return dao.messendBoardSelectAll(vo);
	}

	@Override
	public MessageBoardVo mesBoardSelectDetail(int seq) {
		return dao.mesBoardSelectDetail(seq);
	}

	@Override
	public int mesBoardInsert(Map<String, Object> map) {
		return dao.mesBoardInsert(map);
	}

	@Override
	public int mesBoardDelete(Map<String, Object> map) {
		return dao.mesBoardDelete(map);
	}

	@Override
	public int mesBoardReply(Map<String, Object> map) {
		return dao.mesBoardReply(map);
	}
	
	
}
