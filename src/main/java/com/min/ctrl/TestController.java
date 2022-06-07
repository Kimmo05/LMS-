package com.min.ctrl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.min.vo.PayVo;


@Controller
public class TestController {

	
	@RequestMapping(value = "/index.do" , method = RequestMethod.GET)
	public String Test() {
		return "index";
	}

	
	@RequestMapping(value = "/adminMain.do", method = RequestMethod.GET)
	public String AdminMain() {
		return "admin/admin_main";
	}
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home() {
		return "user/payments";
	}

	
	@RequestMapping(value = "/prefer.do",method = RequestMethod.GET)
	public String prefer() {
		return "commons/prefercheck";
	}

}
