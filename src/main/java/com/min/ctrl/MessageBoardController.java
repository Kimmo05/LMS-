package com.min.ctrl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.maven.doxia.logging.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.test.context.annotation.SecurityTestExecutionListeners;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.min.service.IMessageBoardService;
import com.min.vo.MessageBoardVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/user/*")
public class MessageBoardController {

	@Autowired
	IMessageBoardService service;
	
	@RequestMapping(value = "/messendBoardSelectAll.do", method = RequestMethod.GET)
	public String mesBoardQSelectAll(@RequestParam(required = false) String mes_cate, Model model , Authentication user) {
		log.info("mesBoardQSelectAll : 쪽지 게시판 전체조회");
		MessageBoardVo vo = new MessageBoardVo();
		System.out.println(mes_cate);
		if(mes_cate==null) {
			
			vo.setMes_cate("R");
			
			vo.setMes_recipient(user.getPrincipal().toString());
			vo.setMes_sender(user.getPrincipal().toString());
			List<MessageBoardVo> lists = service.messendBoardSelectAll(vo);
			service.messendBoardSelectAll(vo);
			model.addAttribute("lists", lists);
			model.addAttribute("mes_cate", mes_cate);
		}else {
			System.out.println(mes_cate);
			
			vo.setMes_cate(mes_cate);
			
			vo.setMes_recipient(user.getPrincipal().toString());
			vo.setMes_sender(user.getPrincipal().toString());
			List<MessageBoardVo> lists = service.messendBoardSelectAll(vo);
			model.addAttribute("lists", lists);
			model.addAttribute("mes_cate", mes_cate);
		}
//		model.addAttribute("lists", lists);
//		model.addAttribute("mes_cate", mes_cate);
		return "admin/admin_messageBoardSelectAll";
	}
	
	@RequestMapping(value = "/messageSelectDetail.do", method = RequestMethod.GET)
	public String MessageSelectDetail(@RequestParam int mes_seq, Model model, HttpServletRequest req, HttpSession session) {
		log.info("MessageSelectDetail : 쪽지 게시판 상세조회");
		String query_string = req.getQueryString();
		System.out.println(query_string);
		String num = query_string.substring(8);
		int seq = Integer.parseInt(num);
		MessageBoardVo result = service.mesBoardSelectDetail(seq);
		model.addAttribute("result", result);
		session.setAttribute("mes_recipient", result.getMes_recipient());
		session.setAttribute("mes_reffer", result.getMes_reffer());
		return "admin/admin_messageBoardSelectDetail";
	}
	
	@RequestMapping(value = "/messageBoardInsertForm.do", method = RequestMethod.GET)
	public String classVideoInsertForm() {
		log.info("messageBoardInsertForm : 쪽지 게시판 등록 폼 이동");
		return "admin/admin_messageBoardInsertForm";
	}
	
	@RequestMapping(value = "/mesBoardInsert.do", method = RequestMethod.POST)
	public String mesBoardInsert(@RequestParam Map<String, Object> map, @RequestParam String mes_recipient, @SessionAttribute("mes_reffer") int mes_reffer, @RequestParam String mes_content,Authentication user) {
		log.info("mesBoardInsert : 쪽지 작성");
		map.put("mes_sender", user.getPrincipal().toString());
		map.put("mes_recipient", mes_recipient);
		map.put("mes_content", mes_content);
		map.put("mes_cate", "Q");
		service.mesBoardInsert(map);
		System.out.println("map : "+map);
		map.clear();
		map.put("mes_sender", user.getPrincipal().toString());
		map.put("mes_recipient", mes_recipient);
		map.put("mes_content",  mes_content);
		map.put("mes_cate", "R");
		service.mesBoardInsert(map);
		System.out.println("map : "+map);
		
		return "redirect:/user/messendBoardSelectAll.do";
	}
	
	
	@RequestMapping(value = "/mesBoardDelete.do", method = RequestMethod.GET)
	public String mesBoardDelete(@RequestParam int mes_seq) {
		log.info("mesBoardDelete : 쪽지 삭제");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mes_seq", mes_seq);
		service.mesBoardDelete(map);
		return "redirect:/user/messendBoardSelectAll.do";
	}
	
	@RequestMapping(value = "/mesBoardReplyForm.do", method = RequestMethod.GET)
	public String mesBoardReplyForm(Model model, @SessionAttribute("mes_recipient") String mes_recipient,HttpSession session ,@SessionAttribute("mes_reffer") int mes_reffer) {
		log.info("mesBoardReplyForm : 쪽지 답글 작성 폼");
		model.addAttribute("mes_recipient", mes_recipient);
		session.setAttribute("mes_reffer", mes_reffer);
		return "admin/admin_messageBoardReplyForm";
	}
	
	@RequestMapping(value = "/mesBoardReply.do", method = RequestMethod.POST)
	public String mesBoardReply(@RequestParam Map<String, Object> map,@RequestParam String mes_content ,@RequestParam String mes_recipient, Authentication user) {
		log.info("mesBoardReply : 쪽지 답글 작성");
		map.put("mes_sender", user.getPrincipal().toString());
		map.put("mes_recipient", mes_recipient);
		map.put("mes_content", mes_content);
		map.put("mes_cate", "Q");
		service.mesBoardInsert(map);
		System.out.println("map : "+map);
		map.clear();
		map.put("mes_sender", user.getPrincipal().toString());
		map.put("mes_recipient", mes_recipient);
		map.put("mes_content",  mes_content);
		map.put("mes_cate", "R");
		service.mesBoardInsert(map);
		System.out.println("map : "+map);
		
		return "redirect:/user/messendBoardSelectAll.do";
	}
	
}
