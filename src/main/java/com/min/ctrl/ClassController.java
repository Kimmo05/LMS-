package com.min.ctrl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;

import javax.servlet.http.HttpSession;

import com.min.service.ITagService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.min.service.IClassService;
import com.min.vo.ClassVo;
import com.min.vo.InstructorVo;
import com.min.vo.SubjectVo;
import com.min.vo.VoteVo;

@Controller
@RequestMapping(value = "/user/*")
public class ClassController {

	@Autowired
	private IClassService service;
	@Autowired
	private ITagService tagService;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/classListForm.do", method = RequestMethod.GET)
	public String classListForm(Model model) {
		List<ClassVo> lists = service.classSelectAll();
		model.addAttribute("lists", lists);
		return "admin/admin_classList";
	}
	
//	@RequestMapping(value = "/classListed.do", method = RequestMethod.GET)
//	public String classListed(Model model) {
//		List<ClassVo> lists = service.classSelectAll();
//		model.addAttribute("lists", lists);
//		return "admin/admin_classList";
//	}
	
	@RequestMapping(value = "/classSelectDetail.do", method = RequestMethod.GET)
	public String classSelectDetail(@RequestParam String cla_num, Model model, HttpSession session) throws ParseException {
		JSONParser parser = new JSONParser();
		session.setAttribute("cla_num", cla_num);
		ClassVo result = service.classSelectDetail(cla_num);
		String like = result.getCla_like();
		JSONArray likeArr = (JSONArray) parser.parse(like);
		result.setCla_like(String.valueOf(likeArr.size()));
		List<SubjectVo> lists = service.classSelectedSub(cla_num);
		
		model.addAttribute("result", result);
		model.addAttribute("lists", lists);
		System.out.println(result);
		
		List<InstructorVo> insList = service.classInsInfo(cla_num);
		model.addAttribute("insList", insList);
		System.out.println(insList);
		
		
		return "admin/admin_classDetail";
	}
	
	
	@RequestMapping(value = "/classInsertForm.do", method = RequestMethod.GET)
	public String classInsertForm(Model model) {
		logger.info("classInsertForm : 과정 생성폼");
		List<SubjectVo> lists = service.subjectSelected();
		model.addAttribute("lists", lists);
		return "admin/admin_classInsertForm";
	}
	
	@RequestMapping(value = "/classInsert.do", method = RequestMethod.POST)
	public String classInsert(@RequestParam String title, @RequestParam String content, @RequestParam List<String> subList) throws ParseException {
		JSONParser parser = new JSONParser();
		logger.info("classInsert : 과정 생성");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cla_title", title);
		map.put("cla_content", content);
		int n = service.classFormInsert(map);
		ClassVo classVo = service.classSelectLastInsert();
		String classNum = classVo.getCla_num();
		map.clear();
		for (String listed : subList) {
			map.put("csu_sub_num", listed);
			map.put("vot_sub_num", listed);
			int m = service.classSubjectInsert(map);
			map.clear();
			String tag = tagService.selectSubjectTag(listed);
			Matcher matcher = TagController.TAG_REGEX.matcher(tag);
			while (matcher.find()){
				String temp = matcher.group().replace(" ", "_").replace("#", "").toString().toLowerCase();
				JSONObject object = (JSONObject) parser.parse(tagService.selectTagJson(temp));
				JSONArray array = (JSONArray) object.get("class");
				array.add(classNum);
				object.replace("class",array);
				map.put("id",object.toJSONString());
				map.put("name",temp);
				tagService.updateTag(map);
			}
			map.clear();
		}
		service.classTimeUpdate();
		return "redirect:/classListed.do";
	}
	
	
	@RequestMapping(value = "/classModifyForm.do", method = RequestMethod.GET)
	public String classModifyForm(@SessionAttribute("cla_num") String cla_num) {
		logger.info("classModifyForm : 과정 수정 화면이동");
		return "admin/admin_classModifyForm";
	}
	
	@RequestMapping(value = "/classModify.do", method = RequestMethod.POST)
	public String classModify(@RequestParam Map<String,Object> map,@RequestParam String cla_startdate,@SessionAttribute("cla_num") String cla_num) throws IOException, org.json.simple.parser.ParseException{
		logger.info("classModify : 과정 수정");
		map.put("cla_num", cla_num);
		List<String> res = new ArrayList<String>();
		int cla_addtime = 0;
		int ch = 2022;
		do {
		for (int j = 1; j < 13; j++) {
		String serviceKey = "zy%2FZZCSwzH2XN%2FGYNR%2FGFFKJ2z6s368WViy%2FwfzkHNxge5pG99WjgHiLmuFP9KQl60hNZPmAU9D8jExKOL9AiQ%3D%3D";
        String addr = "http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService";
        String query = "/getRestDeInfo?";
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(addr);
        stringBuffer.append(query);
        stringBuffer.append("solYear="+ch);
        stringBuffer.append("&solMonth="+String.format("%02d", j));
        stringBuffer.append("&_type=json");
        stringBuffer.append("&ServiceKey=" + serviceKey);
        
        try {
            URL url = new URL(stringBuffer.toString());
            URLConnection conn = url.openConnection();
            BufferedReader rd = null;
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
            
            String line= rd.readLine();
            
            JSONParser jsonParser = new JSONParser();//JSON데이터를 넣어 JSON Object 로 만들어 준다.
            JSONObject jsonObject = (JSONObject) jsonParser.parse(line);
            JSONObject obj = (JSONObject) jsonObject.get("response");
            JSONObject obj2 = (JSONObject) obj.get("body");
            
            try {
            	JSONObject obj3 = (JSONObject) obj2.get("items");
                JSONArray holidays = (JSONArray) obj3.get("item");
                
                System.out.println(holidays);
                
                System.out.println("■■■■■■■■■■■■■■■ 휴일 ■■■■■■■■■■■■■■■");
                for (int i = 0; i < holidays.size(); i++) {
                	JSONObject holiday = (JSONObject) holidays.get(i);
                	long selholi = (long) holiday.get("locdate");
                	res.add(String.valueOf(selholi));
                	System.out.println(selholi);
    			}
                System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
                System.out.println(res);
                
			} 
            catch (Exception e) {
            	try {
            		JSONObject obj3 = (JSONObject) obj2.get("items");
//    	            System.out.println(obj3);
    	            JSONObject obj4 = (JSONObject) obj3.get("item");
//    	            System.out.println(obj4);
    	            long selholi = (long) obj4.get("locdate");
    	            System.out.println("■■■■■■■■■■■■■■■ 휴일 ■■■■■■■■■■■■■■■");
    	            System.out.println(selholi);
    	            System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
				} catch (Exception e2) {
					System.out.println("==해당 월에는 공휴일이 없습니다==");
				}
			}
            rd.close();
        } 
        catch (IOException e) {
        	e.printStackTrace();
        }
    }
		ch++;	
		} while (ch<2024);
		
		 Calendar cal = Calendar.getInstance();
		// 사용자가 등록하는 월, 일을 여기다 매핑
 		// Calendar의 Month는 0부터 시작하므로 -1 해준다.
		
		String first = cla_startdate.substring(0, 4);
		int year = Integer.parseInt(first)-1;
		String second = cla_startdate.substring(5, 7);
		int month = Integer.parseInt(second)-1;
		String last = cla_startdate.substring(8, 10);
		int date = Integer.parseInt(last)-1;
 		cal.set(year , month, date);
// 		System.out.println(cal.getTime());
 		map.put("cla_addtime", cla_addtime);
 		service.classUpdate(map);
 		
 		int cnt = service.classTimeSearch(cla_num);
 		for (int i = 0; i < cnt; i++) {
 			// cal.set = 2022-10-20
 			// 실제 = 2022-11-21
 			cal.add(Calendar.DATE, 1); // one day increment
 			String result = String.valueOf(cal.get(Calendar.YEAR)) + String.format("%02d", cal.get(Calendar.MONTH)+1)+String.format("%02d", cal.get(Calendar.DATE));
 			
 			int day = cal.get(Calendar.DAY_OF_WEEK);
 			System.out.println("----------------------------");
 			System.out.println("최종 폼 : "+result);
 			System.out.println("월 : "+ cal.get(Calendar.MONTH));
 			System.out.println(cal.getTime());
 			System.out.println("----------------------------");
 			// 일요일 : 1 , 토요일 : 7
 			if(day == 1 || day == 7 || res.contains(result)) {
 				cla_addtime++;
 				i--;
 				System.out.println(cla_addtime+ "번째");
 			}
 		}
		map.put("cla_addtime", cla_addtime);
		service.classUpdate(map);
		System.out.println(year);
		System.out.println(month);
		System.out.println(date);
		return "redirect:/classListed.do";
	}
	
	@RequestMapping(value = "/voteBoxInsert.do", method = RequestMethod.POST)
	public String voteBoxInsert(@RequestParam String sub_num, @SessionAttribute("cla_num") String cla_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vot_sub_num", sub_num);
		map.put("vot_cla_num", cla_num);
		map.put("vot_ins_id", "thdwndrlrkdtk123");
		service.voteBoxInsert(map);
		return "redirect:/classSelectDetail.do";
	}
	
	@RequestMapping(value = "/updateVote.do", method = RequestMethod.POST)
	public String updateVote(@SessionAttribute("cla_num") String cla_num, @RequestParam String sub_num , Model model) {
		int cnt=0;
		VoteVo vo = new VoteVo();
		vo.setVot_cla_num(cla_num);
		vo.setVot_sub_num(sub_num);
		JSONArray json = new JSONArray();
		json.add("thdwndrl1234");
		vo.setVot_voter(json.toString());
		for (Object object : json) {
			cnt++;
		}
		System.out.println(cnt);
		model.addAttribute("cnt", cnt);
		service.updateVote(vo);
		return "redirect:/classSelectDetail.do";
	}
}
