package com.min.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.min.service.IClassService;
import com.min.vo.ClassVo;
import com.min.vo.SubjectVo;

@Transactional
@Controller
public class ClassController {

	@Autowired
	private IClassService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/classListForm.do", method = RequestMethod.GET)
	public String classListForm(Model model) {
		List<ClassVo> lists = service.classSelectAll();
		model.addAttribute("lists", lists);
		return "admin/admin_classList";
	}
	
	@RequestMapping(value = "/classListed.do", method = RequestMethod.GET)
	public String classListed(Model model) {
		List<ClassVo> lists = service.classSelectAll();
		model.addAttribute("lists", lists);
		return "admin/admin_classList";
	}
	
	@RequestMapping(value = "/classSelectDetail.do", method = RequestMethod.GET)
	public String classSelectDetail(@RequestParam String cla_num, Model model, HttpSession session) {
		session.setAttribute("cla_num", cla_num);
		ClassVo result = service.classSelectDetail(cla_num);
		model.addAttribute("result", result);
		System.out.println(result);
		return "admin/admin_classDetail";
	}
	
	
	@RequestMapping(value = "/classInsertForm.do", method = RequestMethod.GET)
	public String classInsertForm(Model model) {
		List<SubjectVo> lists = service.subjectSelected();
		model.addAttribute("lists", lists);
		return "admin/admin_classInsertForm";
	}
	
	@RequestMapping(value = "/classInsert.do", method = RequestMethod.POST)
	public String classInsert(@RequestParam String title, @RequestParam String content, @RequestParam List<String> subList) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cla_title", title);
		map.put("cla_content", content);
		int n = service.classFormInsert(map);
		map.clear();
		for (String listed : subList) {
			map.put("csu_sub_num", listed);
			int m = service.classSubjectInsert(map);
			map.clear();
		}
		return "redirect:/classListed.do";
	}
	
	@RequestMapping(value = "/classModifyForm.do", method = RequestMethod.GET)
	public String classModifyForm(@SessionAttribute("cla_num") String cla_num) {
		logger.info("classModifyForm : 과정 수정 화면이동");
		return "admin/admin_classModifyForm";
	}
	
	@RequestMapping(value = "/classModify.do", method = RequestMethod.POST)
	public String classModify(@RequestParam Map<String,Object> map, @SessionAttribute("cla_num") String cla_num) {
		map.put("cla_num", cla_num);
		service.classUpdate(map);
		return "redirect:/classListed.do";
	}
	
}
