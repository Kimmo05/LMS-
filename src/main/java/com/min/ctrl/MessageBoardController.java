package com.min.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.min.service.IMessageBoardService;

@Controller
public class MessageBoardController {

	@Autowired
	IMessageBoardService service;
	
	
	
}
