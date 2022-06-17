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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.min.service.SubjectService;
import com.min.vo.InfoUser;
import com.min.vo.MemberVo;
import com.min.vo.PayVo;
import com.min.vo.RowNumVo;
import com.min.vo.SubjectVo;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class SubjectAdminController {
	

	@Autowired
	private SubjectService sService;
	
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
	@RequestMapping(value = "/user/admin_subjectList.do", method = RequestMethod.GET)
	public String subjectListAdmin(HttpSession session, Model model,Authentication user) {
		MemberVo mVo = (MemberVo) session.getAttribute("mem");
		log.info("SubjectController subjectList");
		log.info("SubjectController subjectList 세션확인 : {}", user);
		MemberVo mvo =(MemberVo) user.getDetails();

		
		List<SubjectVo> lists = null;
		RowNumVo rowVo = null;
		
		if(session.getAttribute("row")==null) {
			rowVo = new  RowNumVo();
		}else {
			rowVo=(RowNumVo) session.getAttribute("row");
		}
		System.out.println(rowVo);
//		user.getPrincipal();//아이디
		if(user.getAuthorities().toString().indexOf("ADMIN")!=-1) {
			System.out.println("***********************subjectAdminController"+user.getAuthorities());
			System.out.println("***********************subjectAdminController"+mvo);
			rowVo.setTotal(sService.subjectTotalAdmin());
			lists=sService.subSelectAllAdmin(rowVo);
		}
			System.out.println("***********************subjectAdminController"+lists);
		model.addAttribute("lists",lists);
		model.addAttribute("row",rowVo);
		
		return "admin/admin_subjectList";
	}
	
	//관리자 전체조회 상태별 조회
//	@RequestMapping(value = "/admin_subjectList.do", method = RequestMethod.GET)
//	public String subSelectStatusAdmin(String getStatus, Model model, HttpSession session,Authentication user) {
//		System.out.println("***********************subjectAdminController  *********");
//		System.out.println("***********************subjectAdminController"+getStatus);
//		MemberVo mvo =(MemberVo) user.getDetails();
//		
//		Map<String, Object> map= new HashMap<String, Object>();
//		map.put("pay_status", getStatus);
//		
//		List<SubjectVo> lists = null;
//		RowNumVo rowVo = null;
//		
//		if(session.getAttribute("row")==null) {
//			rowVo = new  RowNumVo();
//		}else {
//			rowVo=(RowNumVo) session.getAttribute("row");
//		
//			if(user.getAuthorities().toString().indexOf("ADMIN")!=-1) {
//				rowVo.setTotal(sService.subjectTotalAdmin());
//				lists=sService.subSelectStatusAdmin(rowVo);
//			}
//				System.out.println("***********************subjectAdminController"+lists);
//			model.addAttribute("lists",lists);
//			model.addAttribute("row",rowVo);
//			model.addAttribute("status",getStatus);
//			
//			
//	}
//		return "admin/admin_subjectList";
//	}
	//2-2) 관리자 과목 상세조회
	@RequestMapping(value = "/user/admin_subjectDetail.do", method = RequestMethod.GET)
	public String adminSubjectDetail(SubjectVo sVo, HttpSession session, Model model, @RequestParam String sub_num) {
		log.info("********* Welcome SubjectController! adminSubjectDetail 상세조회 adminSubjectDetail *********");
		SubjectVo results = sService.adminSubjectDetail(sub_num);
		model.addAttribute("results", results);
		
		return "admin/admin_subjectDetail";
	}
	
	//2-1) 관리자 과목 승인처리 위한 페이징 처리 목록
	@RequestMapping(value = "/user/admin_subjectApprove.do", method = RequestMethod.GET)
	public String subSelectToApproveAdmin(HttpSession session, Model model,Authentication user) {
		MemberVo mVo = (MemberVo) session.getAttribute("mem");
		log.info("SubjectController subjectList");
		log.info("SubjectController subjectList 세션확인 : {}", user);
		MemberVo mvo =(MemberVo) user.getDetails();

		List<SubjectVo> lists = null;
		RowNumVo rowVo = null;
		
		if(session.getAttribute("row")==null) {
			rowVo = new  RowNumVo();
		}else {
			rowVo=(RowNumVo) session.getAttribute("row");
		}
		System.out.println(rowVo);
//		user.getPrincipal();//아이디
		if(user.getAuthorities().toString().indexOf("ADMIN")!=-1) {
			System.out.println("***********************subjectAdminController"+user.getAuthorities());
			System.out.println("***********************subjectAdminController"+mvo);
			rowVo.setTotal(sService.subjectTotalAdmin());
			lists=sService.subSelectToApproveAdmin(rowVo);
		}
			System.out.println("***********************subjectAdminController"+lists);
		model.addAttribute("lists",lists);
		model.addAttribute("row",rowVo);
		
		return "admin/admin_subjectApprove";
	}
	
	
	//4) 과목 승인
	//4-1) 과목 등록 후 관리자의 과목 검수 후 과목상태를 승인'A'로 변경
	@RequestMapping(value = "/user/subUpdateStatusA.do", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public void subUpdateStatusA(@RequestParam(value="sub_num") String sub_num){
		log.info("********* Welcome SubjectController! subUpdateStatusA 관리자의 상태변경 subUpdateStatusA *********");
			int n =  sService.subUpdateStatusA(sub_num);
			System.out.println("상태가 승인으로 업데이트 된 과목 수 : "+ n);
	}
	//4-2) 과목 등록 후 관리자의 과목 검수 후 과목상태를 승인'D'로 변경
	@RequestMapping(value = "/user/subUpdateStatusD.do", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public void subUpdateStatusD(@RequestParam(value="sub_num") String sub_num){
		log.info("********* Welcome SubjectController! subUpdateStatusD 관리자의 상태변경 subUpdateStatusD *********");
			int n =  sService.subUpdateStatusD(sub_num);
			System.out.println("상태가 종료로 업데이트 된 과목 수 : "+ n);
	}
	
	//4-3) 
	@RequestMapping(value = "/user/subReject.do", method = RequestMethod.POST)
	public String subReject(@RequestParam Map<String, Object> map) {
		log.info("********* Welcome SubjectController! subReject 관리자의 과목 반려 subReject *********");
		SubjectVo sVo = new SubjectVo();
		map.put("sub_num", sVo.getSub_num());
		map.put("sub_rejection", sVo.getSub_rejection());
		int n = sService.subReject(map);
		System.out.println(map);
		System.out.println("상태가 반려로 업데이트 된 과목 수 : "+ n);
		return "";
	}

}
