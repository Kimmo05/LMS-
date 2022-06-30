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
import org.springframework.web.servlet.ModelAndView;

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
	
	//관리자 강사 페이징목록
	/*
	 * @RequestMapping(value = "/adminInsList.do", method = RequestMethod.GET)
	 * public String adminInsPage(Authentication user, Model model , HttpSession
	 * session) { log.info("UserAdminController adminInsList 세션 확인 : {}",user);
	 * 
	 * 
	 * List<MemberVo> lists = null; RowNumVo rVo = null;
	 * if(session.getAttribute("row")==null) { rVo = new RowNumVo(); }else { rVo
	 * =(RowNumVo) session.getAttribute("row"); }
	 * rVo.setTotal(service.adminInsListTotal()); lists =
	 * service.adminInsListRow(rVo); model.addAttribute("lists",lists);
	 * model.addAttribute("row",rVo);
	 * 
	 * return "admin/admin_insList"; }
	 */
	
		
		@RequestMapping(value = "/adminInsList.do", method = {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView adminInsPage(RowNumVo row) {
			ModelAndView mav = new ModelAndView();
			log.info(" adminInsPage {}", row);
			// dao, service 에 전체 인원 / dao,service 파라미터 처리
			row.setTotal(service.adminInsListTotal());
			List<MemberVo> lists = service.adminInsListRow(row);
			System.out.println(lists.toString());
			// ModelAndView 객체는 Model(전달 값) + View(바인딩이 될 페이지)를 한객체에 담아서 DispatcherServlet 으로 보내줌
			mav.addObject("lists", lists);
			mav.addObject("row", row);
			mav.setViewName("admin/admin_insList");
			return mav;
		}
		
		// -------------------------------------------------------------------------------------
		
		
		
		// TODO 011 회원 상태 변경 Ajax
		// 값은 id Map 으로 처리
		// SQL 문은 Simple Case 문을 사용해서 N > Y , Y > N 으로 변경되게 만듬
		// 반환 값은 Map -> Jackson databind -> JSON
		
		  @RequestMapping(value = "/changeUser.do", method = RequestMethod.POST) 
		  @ResponseBody public Map<String, String> changeUser(@RequestParam Map<String,Object> map) { 
			  log.info("Welcome! Member_Controller changeUser {} : ",map); 
			  Map<String, String> rMap = new HashMap<String, String>(); 
			  boolean isc =service.changeIns(map); 
			  rMap.put("isc", String.valueOf(isc)); return rMap;
		  }
		  
		 
}
