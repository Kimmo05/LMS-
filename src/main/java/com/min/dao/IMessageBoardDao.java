package com.min.dao;

import java.util.List;

import com.min.vo.MessageBoardVo;

public interface IMessageBoardDao {

	public List<MessageBoardVo> messendBoardSelectAll (MessageBoardVo vo);
	
	public MessageBoardVo mesBoardSelectDetail (int seq);
}
