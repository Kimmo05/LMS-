package com.min.service;

import java.util.List;

import com.min.vo.MessageBoardVo;

public interface IMessageBoardService {

	public List<MessageBoardVo> messendBoardSelectAll (MessageBoardVo vo);
	
	public MessageBoardVo mesBoardSelectDetail (int seq);
}
