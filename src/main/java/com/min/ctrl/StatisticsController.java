package com.min.ctrl;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.min.dao.IStatisticsDao;
import com.min.vo.SubjectCodeVo;

@Controller
public class StatisticsController {

	private static final Logger logger = LoggerFactory.getLogger(StatisticsController.class);
	@Autowired
	private IStatisticsDao sDao;
	
	@RequestMapping(value = "/getSubjectList.do",method = RequestMethod.GET, produces = "application/text; charset=utf-8")
	@ResponseBody
	public String getSubject() throws ParseException {
		String res = sDao.selectSubjectCode();
		JSONParser parser = new JSONParser();
		JSONArray json = (JSONArray)parser.parse(res);
		System.out.println(res);
		return res;
	}
}
