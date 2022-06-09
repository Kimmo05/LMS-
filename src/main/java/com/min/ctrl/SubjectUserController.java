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
import org.springframework.web.servlet.ModelAndView;

import com.min.service.SubjectService;
import com.min.vo.InfoUser;
import com.min.vo.MemberVo;
import com.min.vo.RowNumVo;
import com.min.vo.SubjectVo;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping(value = "/user/*")
public class SubjectUserController {
	

	@Autowired
	private SubjectService sService;
	
	//1) 과목 등록양식 페이지로 이동
	@RequestMapping(value = "/user_subjectInsertForm.do", method = RequestMethod.GET)
	public String subInsertForm(Authentication user, Model model) {
		log.info("********* Welcome SubjectController! subInsertForm 과목 등록양식 페이지로 이동합니다. subjectInsertForm *********");

		return "user/user_subjectInsertForm";
	}
	

	//1-2)과목 등록하기
	@RequestMapping(value = "/subjectInsert.do", method = RequestMethod.POST)
	public String insertSubject(@RequestParam Map<String, Object> map, Authentication user, HttpSession session) {
		MemberVo mvo = (MemberVo) user.getDetails();
		System.out.println(mvo);
		map.put("sub_reg_id", mvo.getId());
		int n = sService.InsertSubject(map);
		System.out.println(map);
		map.put("reg_auth",mvo.getAuth());
		map.put("reg_id", mvo.getId());
		if(mvo.getAuth().equals("ROLE_INSTRUCTOR")) {
			map.put("sub_ins_id", mvo.getId());
		}else {
			map.put("sub_ins_id", "USER");
		}
		int m = sService.UpdateSubIns(map);
		System.out.println("두번쨰 "+map);
		return "redirect:/user/user_subjectList.do";
	}
	
	//2) 과목 조회
	//2-3) 일반회원 과목 전체조회 페이지로 이동
	@RequestMapping(value = "/user_subjectList.do", method = RequestMethod.GET)
	public String usersubject(RowNumVo rVo, Model model) {
		log.info("********* Welcome SubjectController! usersubject 로 이동합니다. subjectInsertForm *********");

		List<SubjectVo> list = sService.subSelectAllUser(rVo);
		model.addAttribute("list",list);
		return "user/user_subjectList";
	}
	

	//2-3) 일반회원 과목 전체조회 페이지로 이동 spa방식 페이징까지
//	@RequestMapping(value = "/user/user_subjectList.do", method = RequestMethod.GET)
//	public String subjectListUser(HttpSession session, Model model,Authentication user) {
//		MemberVo mVo = (MemberVo) session.getAttribute("mem");
//		log.info("SubjectController subjectList");
//		log.info("SubjectController subjectList 세션확인 : {}", user);
//		MemberVo mvo = (MemberVo) user.getDetails();
//		
//		List<SubjectVo> lists = null;
//		RowNumVo rowVo = null;
//		
//		if(session.getAttribute("row")==null) {
//			rowVo = new  RowNumVo();
//		}else {
//			rowVo=(RowNumVo) session.getAttribute("row");
//		}
//		System.out.println(rowVo);
////		user.getPrincipal();//아이디
//		if(user.getAuthorities().toString().indexOf("USER")!=-1) {
//			System.out.println(user.getAuthorities());
//			rowVo.setTotal(sService.subjectTotalUser());
//			lists=sService.subSelectAllUser(rowVo);
//		}
//		
//			System.out.println(lists);
//		model.addAttribute("lists",lists);
//		model.addAttribute("row",rowVo);
//		
//		return "user/user_subjectList";
//	}
//	@RequestMapping(value = "/user/user_subjectList.do", method = {RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView selectSubjectUser(RowNumVo rVo) {
//		ModelAndView mav = new ModelAndView();
//		log.info("********* Welcome SubjectController ! selectSubjectUser 일반회원 페이징처리 과목전체조회페이지로 이동합니다. selectSubjectUser *********");
//		rVo.setTotal(sService.subjectTotalUser());
//		List<SubjectVo> subLists = sService.subSelectAllUser(rVo);
//		mav.addObject("subLists", subLists);
//		mav.addObject("paging", rVo);
//		mav.setViewName("user_subjectList");
//		return mav;
//	}
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
