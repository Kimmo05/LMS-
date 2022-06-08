package com.min.ctrl;

import java.util.*;

import com.min.service.IStatisticsService;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class StatisticsController {

    private static final Logger logger = LoggerFactory.getLogger(StatisticsController.class);
    @Autowired
    private IStatisticsService service;

    //선호 조사시 과목코드를 가져오는 메소드
    @RequestMapping(value = "/getSubjectList.do", method = RequestMethod.GET, produces = "application/text; charset=utf-8")
    @ResponseBody
    public String getSubject() {
        String res = service.selectSubjectCode();
        return res;
    }

    //선호 조사 페이지
    @RequestMapping(value = "/prefer.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String prefer(HttpServletRequest request, String time, String date, String[] subjects, HttpSession session) {

        if (request.getMethod().equals("GET")) {
            logger.info("STAT_001_HJM StatisticsController prefer GET");
            return "commons/prefercheck";
        }else {
            logger.info("STAT_001_HJM StatisticsController prefer POST {} {} {}",time,date, Arrays.toString(subjects));
            //TODO 회원 정보 가져오기
            String id = (String)session.getAttribute("userId");
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("id",id);
            JSONObject obj = new JSONObject();
            obj.put("subjects",Arrays.toString(subjects));
            String[] splitTime = time.split("-");
            obj.put("more_time",splitTime[0]);
            obj.put("less_time",splitTime[1]);
            obj.put("date",date);
            map.put("prefer",obj.toJSONString());
            logger.info(obj.toJSONString());


            //service.updatePrefer(map);
            //TODO 다음페이지로 넘기기
        	return "redirect:/";
		}
    }

    @RequestMapping(value = "/tag.do",method = RequestMethod.GET)
    public String tag(){
        return "commons/tag";
    }
}
