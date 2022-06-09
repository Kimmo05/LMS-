package com.min.ctrl;
import java.text.DateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
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

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class MainController {

	@Autowired
	IMemberService service;
	
	//첫 메인페이지
	@RequestMapping(value = "/main/main.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("로그인전 메인 {}.", locale);
		
		
		return "main";
	}
	//메인페이지 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String LoginHome(Locale locale, Model model) {
		log.info("로그인 후 메인 {}", locale);
		
		return "main";
	}
	
	// 로그인 페이지로 가는 매핑
		@RequestMapping(value = "/loginPage.do", method = {RequestMethod.GET})
		public String selectlogin(
				Locale locale, Model model,Authentication user) {
			System.out.println("로그인 선택창 이동");
			System.out.println("로그인 선택창으로 이동 합시다");

			return "loginForm";
		}

}
