package com.min.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
}
