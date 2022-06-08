package com.min.ctrl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.service.IMessageBoardService;
import com.min.vo.MessageBoardVo;

@Controller
public class MessageBoardController {

	@Autowired
	IMessageBoardService service;
	
	@RequestMapping(value = "/messendBoardSelectAll.do", method = RequestMethod.GET)
	public String mesBoardQSelectAll(@RequestParam(required = false) String mes_cate, Model model) {
		MessageBoardVo vo = new MessageBoardVo();
		System.out.println(mes_cate);
		if(mes_cate==null) {
			System.out.println(mes_cate);
			vo.setMes_cate("Q");
			vo.setMes_sender("ghkdwoaks1234");
			List<MessageBoardVo> lists = service.messendBoardSelectAll(vo);
			model.addAttribute("lists", lists);
			model.addAttribute("mes_cate", mes_cate);
		}else {
			vo.setMes_cate(mes_cate);
			vo.setMes_recipient("ghkdwoaks1234");
			vo.setMes_sender("ghkdwoaks1234");
			List<MessageBoardVo> lists = service.messendBoardSelectAll(vo);
			service.messendBoardSelectAll(vo);
			model.addAttribute("lists", lists);
			model.addAttribute("mes_cate", mes_cate);
		}
//		model.addAttribute("lists", lists);
//		model.addAttribute("mes_cate", mes_cate);
		return "admin/admin_messageBoardSelectAll";
	}
	
	@RequestMapping(value = "/messageSelectDetail.do", method = RequestMethod.GET)
	public String MessageSelectDetail(@RequestParam int mes_seq, Model model, HttpServletRequest req) {
		String query_string = req.getQueryString();
		System.out.println(query_string);
		String num = query_string.substring(8);
		int seq = Integer.parseInt(num);
		MessageBoardVo result = service.mesBoardSelectDetail(seq);
		model.addAttribute("result", result);
		return "admin/admin_messageBoardSelectDetail";
	}
	
}
