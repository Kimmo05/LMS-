package com.min.ctrl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.min.dao.PayDao;
import com.min.service.IPayService;
import com.min.vo.CouponVo;
import com.min.vo.PayVo;


@Controller
@RequestMapping(value = "/user/*")
public class payController{
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@Autowired
	private IPayService service;
	
	//결제페이지 이동
	@RequestMapping(value = "/pay.do", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("----------- payments 이동 ---------");
		Map<String, Object> map = new HashMap<String, Object>();
		//세션의 로그인된 아이디로 값 변경 필요.
		map.put("cou_tra_id", "thdwndrl1234");
		List<CouponVo> lists = service.couponSelect(map);
		model.addAttribute("lists",lists);
		
		return "user/payments";
	}
	
	//결제완료시 결제완료 페이지로 이동
	@RequestMapping(value = "/paySuccess.do", method = RequestMethod.GET)
	public String paySuccess(Model model,String paynum,String finalAmount) {
		logger.info("--------결제성공 이동 ---------");
		System.out.println(paynum);
		System.out.println(finalAmount);
		model.addAttribute("paynum",paynum);
		model.addAttribute("finalAmount",finalAmount);
		return "user/paySuccess";
	}
	
	//관리자 결제정보 상세조회
	@RequestMapping(value = "/getPayDetail.do",method = RequestMethod.POST)
	@ResponseBody
	public PayVo getPayDetail(String paynum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pay_num", paynum);
		PayVo vo = service.getPayDetail(map);
		return vo;
	}
	
	//관리자 결제정보 전체조회로 이동
	@RequestMapping(value = "/adminSelectPay.do", method = RequestMethod.GET)
	public String adminSelectPay(Model model) {
		logger.info("--------adminSelectPay 이동--------");
		List<PayVo> lists = service.paySelectAll();
		model.addAttribute("lists",lists);
		return "admin/adminSelectPay";
	}
	
	//관리자 전체조회 상태별 조회
	@RequestMapping(value = "/changePage.do", method = RequestMethod.GET)
	public String changePage(String getText,Model model) {
		System.out.println(getText);
		
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("pay_status", getText);
		List<PayVo> lists = service.paySelectStatus(map);
		model.addAttribute("lists",lists);
		model.addAttribute("status",getText);
		return "admin/adminSelectPay";
	}
	
	//관리자 환불신청 페이지 이동
	@RequestMapping(value = "/changeStatus.do", method = RequestMethod.GET)
	public String changeStatus(Model model) {
		logger.info("-----changeStatus 이동 -------");
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("pay_status","환불대기");
		List<PayVo> lists = service.paySelectStatus(map);
		model.addAttribute("lists",lists);
		return "admin/changeStatus";
	}
	
	//관리자 환불신청 상태별 페이지 변경
	@RequestMapping(value = "/changeStatusSelect.do", method = RequestMethod.GET)
	public String changeStatusSelect(String getText,Model model) {
		System.out.println(getText);
			
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("pay_status", getText);
		List<PayVo> lists = service.paySelectStatus(map);
		model.addAttribute("lists",lists);
		model.addAttribute("status",getText);
		return "admin/changeStatus";
	}
	
	//관리자 환불요청 승인
	@RequestMapping(value = "/statusUpdate.do" , method = RequestMethod.GET)
	public String statusUpdate(String paynum) {
		System.out.println(paynum+"@!@!@!@!@!");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pay_num", paynum);
		int n = service.statusUpdate(map);
		System.out.println(n + "성공입니다~");
		return "redirect:/user/changeStatus.do";
	}
	
	//회원 결제조회 페이지
	@RequestMapping(value = "/user_Mypay.do" ,method = RequestMethod.GET)
	public String userMypay(Authentication user,Model model) {
		logger.info("-------------user_Mypay 이동 -------------");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pay_tra_buyer", user.getPrincipal());
		List<PayVo> list = service.selectMyPay(map);
		model.addAttribute("lists",list);
		return "user/user_Mypay";
	}
	
	//마이페이지 환불신청
	@RequestMapping(value = "/cancelUpdate.do", method = RequestMethod.POST)
	public void cancelUpdate(String pay_num,String pay_cancate,String pay_status,String pay_cancontent) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pay_cancate", pay_cancate);
		map.put("pay_status", pay_status);
		map.put("pay_cancontent", pay_cancontent);
		map.put("pay_num", pay_num);
		int n = service.cancelUpdate(map);
		System.out.println(n);
	}
	
}
