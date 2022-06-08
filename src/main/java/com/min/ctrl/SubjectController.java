package com.min.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.service.SubjectService;
import com.min.vo.InfoUser;
import com.min.vo.MemberVo;
import com.min.vo.RowNumVo;
import com.min.vo.SubjectVo;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class SubjectController {
	

	@Autowired
	private SubjectService sService;
	
	//1) 과목 등록양식 페이지로 이동
	@RequestMapping(value = "/user/user_subjectInsertForm.do", method = RequestMethod.GET)
	public String subInsertForm(Authentication user, Model model) {
		log.info("********* Welcome SubjectController! subInsertForm 과목 등록양식 페이지로 이동합니다. subjectInsertForm *********");

		return "user/user_subjectInsertForm";
	}
	//1-2)과목 등록하기
	@RequestMapping(value = "/user/subInsertSubject.do", method = RequestMethod.POST)
	public String subInsertSubject(@RequestParam Map<String, Object> map, @RequestParam SubjectVo sVo, Authentication user,
								HttpServletResponse response,HttpSession session, Model model) {
		MemberVo mvo =new MemberVo();
	       InfoUser infouser = (InfoUser) user.getDetails();
			mvo.setAuth(infouser.getAuth());
//			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("sub_title", sub_title);
//			map.put("sub_content", sub_content);
//			map.put("cur_version", cur_version);
//			map.put("cur_time", cur_time);
//			map.put("cur_level", cur_level);
//			map.put("cur_detail", cur_detail);
//			map.put("cur_subcontent", cur_subcontent);
		
		if(user.getAuthorities().toString().indexOf("USER")!=-1) {
			System.out.println(user.getAuthorities());
			sService.subUpdateInstructor(map);
			map.put("sub_ins", sVo.getReg_id());
		}
		int n = sService.subInsertSubject(map);
		System.out.println(n);
		return "redirect:user/user_subjectList.do";
	}
//	@RequestMapping(value = "/subInsertSubject.do", method = RequestMethod.POST)
//	public String subInsertSubject(@RequestParam Map<String, Object> map) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("sub_title", sub_title);
//		map.put("sub_content", sub_content);
//		map.put("cur_version", cur_version);
//		map.put("cur_time", cur_time);
//		map.put("cur_level", cur_level);
//		map.put("cur_detail", cur_detail);
//		map.put("cur_subcontent", cur_subcontent);
//		
//		int n = sService.subInsertSubject1(map);
//		int m = sService.subInsertSubject2(map);
//		System.out.println(n,m);
//		return "redirect:/commons/comSubList.do";
//	}
	
	//2) 과목 조회
	//2-1) 관리자 과목 전체조회 페이지로 이동
//	@RequestMapping(value = "/subjectList.do", method = RequestMethod.GET)
//	public String subjectList(MemberVo mVo, Model model) {
//		log.info("********* Welcome SubjectController ! subjectList 관리자 과목전체조회페이지로 이동합니다. subSelectAllAdmin *********");
//		List<SubjectVo> lists = sService.subSelectAllAdmin(mVo);
//		model.addAttribute("lists",lists);
//		return "subjectList";
//	}
	//mpa
//	@RequestMapping(value = "/subjectList.do", method = {RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView selectSubjectAdmin(RowNumVo rVo) {
//		ModelAndView mav = new ModelAndView();
//		log.info("********* Welcome SubjectController ! selectSubjectAdmin 관리자 페이징처리 과목전체조회페이지로 이동합니다. selectSubjectAdmin *********");
//		rVo.setTotal(sService.subjectTotal());
//		List<SubjectVo> subLists = sService.subSelectAllAdmin(rVo);
//		mav.addObject("subLists", subLists);
//		mav.addObject("paging", rVo);
//		mav.setViewName("subjectList");
//		return mav;
//	}
	//2-1) 관리자 과목 전체조회 페이지로 이동 spa방식 페이징까지
	@SuppressWarnings("unlikely-arg-type")
	@RequestMapping(value = "/user/admin_subjectList.do", method = RequestMethod.GET)
	public String subjectListAdmin(HttpSession session, Model model,Authentication user) {
		MemberVo mVo = (MemberVo) session.getAttribute("mem");
		log.info("SubjectController subjectList");
		log.info("SubjectController subjectList 세션확인 : {}", user);
		MemberVo mvo =new MemberVo();
       InfoUser infouser = (InfoUser) user.getDetails();
		mvo.setAuth(infouser.getAuth());
		
		List<SubjectVo> lists = null;
		RowNumVo rowVo = null;
		
		if(session.getAttribute("row")==null) {
			rowVo = new  RowNumVo();
		}else {
			rowVo=(RowNumVo) session.getAttribute("row");
		}
		System.out.println(rowVo);
//		user.getPrincipal();//아이디
//		if(mVo.getAuth().equals("ROLE_ADMIN")) {
		if(user.getAuthorities().toString().indexOf("ADMIN")!=-1) {
			System.out.println(user.getAuthorities());
			rowVo.setTotal(sService.subjectTotalAdmin());
			lists=sService.subSelectAllAdmin(rowVo);
		}
			System.out.println(lists);
		model.addAttribute("lists",lists);
		model.addAttribute("row",rowVo);
		
		return "admin/admin_subjectList";
	}
	
	
	
	//2-2) 관리자 과목 상세조회
//	@RequestMapping(value = "/adminSubjectDetail.do", method = RequestMethod.GET)
//	public String adminSubjectDetail(@RequestParam String sub_num, String id, Model model, HttpSession session) {
//		log.info("********* Welcome SubjectController! adminSubjectDetail 상세조회 subSelectDetail *********");
//		session.setAttribute("sub_num", sub_num);
//		SubjectVo results = sService.adminSubjectDetail(sub_num);
//		model.addAttribute("results", results);
//		System.out.println(results);
//		return "adminSubjectDetail";
//	}
	
	
	//2-3) 일반회원 과목 전체조회 페이지로 이동
//	@RequestMapping(value = "/comSubList.do", method = RequestMethod.GET)
//	public String comSubList(MemberVo mVo, Model model) {
//		log.info("********* Welcome SubjectController! comSubList 일반회원 과목전체조회페이지로 이동합니다. subSelectAllUser *********");
//		List<SubjectVo> list = sService.subSelectAllUser(rVo);
//		model.addAttribute("list",list);
//		return "commons/comSubList";
//	}
	//2-3) 관리자 과목 전체조회 페이지로 이동 spa방식 페이징까지
	@SuppressWarnings("unlikely-arg-type")
	@RequestMapping(value = "/user/user_subjectList.do", method = RequestMethod.GET)
	public String subjectListUser(HttpSession session, Model model,Authentication user) {
		MemberVo mVo = (MemberVo) session.getAttribute("mem");
		log.info("SubjectController subjectList");
		log.info("SubjectController subjectList 세션확인 : {}", user);
		MemberVo mvo =new MemberVo();
       InfoUser infouser = (InfoUser) user.getDetails();
		mvo.setAuth(infouser.getAuth());
		
		List<SubjectVo> lists = null;
		RowNumVo rowVo = null;
		
		if(session.getAttribute("row")==null) {
			rowVo = new  RowNumVo();
		}else {
			rowVo=(RowNumVo) session.getAttribute("row");
		}
		System.out.println(rowVo);
//		user.getPrincipal();//아이디
		if(user.getAuthorities().toString().indexOf("USER")!=-1) {
			System.out.println(user.getAuthorities());
			rowVo.setTotal(sService.subjectTotalAdmin());
			lists=sService.subSelectAllAdmin(rowVo);
		}
		
			System.out.println(lists);
		model.addAttribute("lists",lists);
		model.addAttribute("row",rowVo);
		
		return "user/user_subjectList";
	}
	//2-4) 일반회원 과목 상세조회
	@RequestMapping(value = "/comSubjectDetail.do", method = RequestMethod.GET)
	public String comSubjectDetail(@RequestParam String sub_num, String id, Model model, HttpSession session) {
		log.info("********* Welcome SubjectController! comSubjectDetail 상세조회 subSelectDetail *********");
		session.setAttribute("sub_num", sub_num);
		SubjectVo result = sService.comSubjectDetail(sub_num);
		model.addAttribute("result", result);
		System.out.println(result);
		return "commons/comSubjectDetail";
	}




	

}

