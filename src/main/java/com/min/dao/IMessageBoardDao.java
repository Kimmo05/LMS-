package com.min.dao;

import java.util.List;
import java.util.Map;

import com.min.vo.MessageBoardVo;

public interface IMessageBoardDao {

	public List<MessageBoardVo> messendBoardSelectAll (MessageBoardVo vo);
	
	public MessageBoardVo mesBoardSelectDetail (int seq);
	
	public int mesBoardInsert(Map<String, Object> map);
	
	public int mesBoardDelete(Map<String, Object> map);
	
	public int mesBoardReply(Map<String, Object> map);
}
