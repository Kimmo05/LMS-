package com.min.ctrl;

import java.util.*;

import com.min.service.IStatisticsService;
import com.min.service.SubjectService;
import com.min.vo.ClassVo;
import com.min.vo.MemberVo;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/user/*")
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
    public String prefer(HttpServletRequest request, String time, String date, String[] subjects, Authentication authentication) {

        if (request.getMethod().equals("GET")) {
            logger.info("STAT_001_HJM StatisticsController prefer GET");
            return "prefercheck";
        } else {
            logger.info("STAT_001_HJM StatisticsController prefer POST {} {} {}", time, date, Arrays.toString(subjects));
            String id = (String) authentication.getPrincipal();
            Map<String, Object> map = new HashMap<String, Object>();
            JSONObject obj = new JSONObject();

            obj.put("subjects", Arrays.toString(subjects));
            String[] splitTime = time.split("-");
            obj.put("more_time", splitTime[0]);
            obj.put("less_time", splitTime[1]);
            obj.put("date", date);

            map.put("id", id);
            map.put("prefer", obj.toJSONString());

            service.updatePrefer(map);
            //TODO 다음페이지로 넘기기
            return "redirect:/main.do";
        }
    }

    //좋아요 클릭 시
    @RequestMapping(value = "/clickLike.do", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
    @ResponseBody
    public String clickLike(String claid, Authentication authentication) throws ParseException {
        String userid = (String) authentication.getPrincipal();
        MemberVo vo = (MemberVo) authentication.getDetails();
        String myLikelist = vo.getLike();
        JSONParser parser = new JSONParser();
        JSONArray myArr = (JSONArray) parser.parse(myLikelist);
        int result = service.updateLike(userid, claid);
        logger.info(userid);
        System.out.println(result);
        return String.valueOf(result);
    }

    //내 좋아요 목록보기
    @RequestMapping(value = "/myLikelist.do", method = RequestMethod.GET)
    public String myLikelist(Authentication authentication, Model model) throws ParseException {
        //TODO 좋아요를 누르면 세션에 있는 좋아요 리스트 값이 안바껴서 문제임
        MemberVo vo = (MemberVo) authentication.getDetails();
        String likeList = vo.getLike();
        JSONArray likeArr;
        JSONParser parser = new JSONParser();
        if (likeList != null) {
            likeArr = (JSONArray) parser.parse(likeList);
        } else {
            likeArr = new JSONArray();
        }

        List<String> ids = new ArrayList<String>();
        for (int i = 0; i < likeArr.size(); i++) {
            ids.add(likeArr.get(i).toString());
        }
        logger.info("{}",ids);
        List<ClassVo> lists = service.selectClassList(ids);
        model.addAttribute("lists", lists);
        return "user/myLikelist";
    }

    @RequestMapping(value = "/classCheckList.do", method = {RequestMethod.GET,RequestMethod.POST})
    public String classCheckList(@RequestParam Map<String,String> result, HttpServletRequest request,
                                 Authentication authentication,String sub_num,Model model) throws ParseException {
        if(request.getMethod().equals("GET")){
            logger.info("StatisticsController classCheckList GET");
            //TODO 과목 이름 주석 처리 해제
            String title = service.selectSubjectTitle(sub_num);
            model.addAttribute("title",title);
            model.addAttribute("sub_num",sub_num);

            return "/user/classCheckList";
        }else{
            //TODO 평가를 했던 회원과 강의를 듣지 않은 학생은 평가가 불가능 하도록 막기
            logger.info("StatisticsController classCheckList POST {}", result);
            String score = service.selectSubjectScore(sub_num);
            String id = (String)authentication.getPrincipal();
            //점수 넣기
            logger.info(score);
            JSONParser parser = new JSONParser();
            JSONObject jsonObject = (JSONObject) parser.parse(score);
            JSONArray scoreArray = (JSONArray) jsonObject.get("score");
            JSONObject jsonScore = new JSONObject();
            jsonScore.put("id",id);
            jsonScore.putAll(result);
            scoreArray.add(jsonScore);
            //점수 계산 하기
            int communicationTotal = Integer.parseInt(jsonObject.get("communicationTotal")+result.get("communication"));
            int curriculumTotal = Integer.parseInt(jsonObject.get("curriculumTotal")+result.get("curriculum"));
            int bookTotal = Integer.parseInt(jsonObject.get("bookTotal")+result.get("book"));
            int practiceTotal = Integer.parseInt(jsonObject.get("practiceTotal")+result.get("practice"));
            int immersionTotal = Integer.parseInt(jsonObject.get("immersionTotal")+result.get("immersion"));

            jsonObject.replace("score",scoreArray);
            jsonObject.replace("communicationTotal",communicationTotal);
            jsonObject.replace("curriculumTotal",curriculumTotal);
            jsonObject.replace("bookTotal",bookTotal);
            jsonObject.replace("practiceTotal",practiceTotal);
            jsonObject.replace("immersionTotal",immersionTotal);

            Map<String,Object> map = new HashMap<String,Object>();
            map.put("id",sub_num);
            map.put("score",jsonObject.toJSONString());
            service.updateSubjectScore(map);

            return "redirect:/main.do";
        }
    }

}
