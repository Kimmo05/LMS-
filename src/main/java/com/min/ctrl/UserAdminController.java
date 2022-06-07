package com.min.ctrl;

import java.text.DateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.min.service.IMemberService;
import com.min.vo.MemberVo;
import com.min.vo.RowNumVo;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
@RequestMapping(value = "/user/*")
public class UserAdminController {

	@Autowired
	IMemberService service;
	
	//관리자 페이지
	@RequestMapping(value = "/adminPage.do", method = RequestMethod.GET)
	public String adminPage(Model model) {
		System.out.println("관리자 페이지");
		System.out.println();
		return "admin/admin_main";
	}
	
	//관리자 일반회원 페이징목록
	@RequestMapping(value = "/adminTraList.do", method = RequestMethod.GET)
	public String adminTraPage(Authentication user, Model model , HttpSession session) {
		log.info("UserAdminController adminTraList 세션 확인 : {}",user);
	
	
		List<MemberVo> lists = null;
		RowNumVo rVo = null;
		if(session.getAttribute("row")==null) {
			rVo = new RowNumVo();
		}else {
		rVo =(RowNumVo) session.getAttribute("row");
		}
		rVo.setTotal(service.adminUserListTotal());
		lists = service.adminUserListRow(rVo);
		model.addAttribute("lists",lists);
		model.addAttribute("row",rVo);
		
		return "admin/admin_traList";
	}
	

}
