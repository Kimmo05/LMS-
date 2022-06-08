package com.min.edu;


import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.min.dao.IClassBoardDao;
import com.min.dao.IClassDao;
import com.min.dao.IMessageBoardDao;
import com.min.service.IClassService;
import com.min.vo.ClassBoardVo;
import com.min.vo.ClassVo;
import com.min.vo.MessageBoardVo;
import com.min.vo.SubjectVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/*.xml"})
public class Class_Test {

	@Autowired
	private IClassDao dao;
	
	@Autowired
	private IClassBoardDao bDao;
	
	@Autowired
	private IMessageBoardDao mDao;
	
	@Autowired
	private IClassService service;
	
	
//	@Test
	public void classSelectAll() {
		List<ClassVo> lists = dao.classSelectAll();
		System.out.println(lists);
	}

//	@Test
	public void classSelectDetail() {
		ClassVo vo = new ClassVo();
//		String like = vo.cla_like.toString();
		ClassVo list = dao.classSelectDetail("CLA001");
		System.out.println(list);
	}
	
//	@Test
	public void classFormInsert() {
		Map<String, Object> lists = new HashMap<String, Object>();
		lists.put("cla_title", "JAVA 전문가 과정 배우기");
		lists.put("cla_content", "JAVA 전문가 과정을 통해 현장에서도 문제없이!");
		int n = dao.classFormInsert(lists);
	}
	
//	@Test
	public void classSubjectInsert() {
		Map<String, Object> lists = new HashMap<String, Object>();
		lists.put("csu_sub_num", "20220523SUB100");
		int n = dao.classSubjectInsert(lists);
	}
	
//	@Test
//	public void subjectSelected() {
//		List<SubjectVo> lists = dao.subjectSelected();
//		System.out.println(lists);
//	}
	
//	@Test
	public void subjectSelected() {
		List<SubjectVo> lists = dao.subjectSelected();
		System.out.println(lists);
	}
	
//	@Test
	public void classTimeUpdate() {
		dao.classTimeUpdate();
	}
	
	
	
//	@Test
//	public void classBoardSelectAll() {
//		ClassBoardVo vo = new ClassBoardVo();
//		vo.setCbo_cate("동영상");
//		vo.setCbo_cla_num("CLA001");
//		List<ClassBoardVo> lists = bDao.classBoardSelectAll(vo);
//		System.out.println(lists);
//	}
	
//	@Test
	public void classBoardSelectDetail() {
		ClassBoardVo vo = bDao.classBoardSelectDetail(1);
		System.out.println(vo);
	}
	
//	@Test
	public void classVideoInsert() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cbo_cla_num", "CLA001");
		map.put("cbo_cate", "동영상");
		map.put("cbo_ins_id", "thdwndrlrkdtk123");
		map.put("cbo_title", "대충 제목");
		map.put("cbo_content", "대충 내용");
		map.put("cbo_youtubeadd", "어떤 주소");
		bDao.classVideoInsert(map);
	}
//	@Test
	public void classDocInsert() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("doc_file", "강의계획서054");
		map.put("doc_originname", "강의계획서00054");
		map.put("doc_savename", "강의자료54");
		map.put("doc_path", "C:/Users/user/Desktop/강의계획서pdf_files");
		map.put("doc_extention", ".png");
		bDao.classDocInsert(map);
	}
//	@Test
	public void classBoardDocInsert() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cbo_cla_num", "CLA001");
		map.put("cbo_cate", "자료");
		map.put("cbo_ins_id", "thdwndrlrkdtk123");
		map.put("cbo_title", "제목");
		map.put("cbo_content", "내용");
		bDao.classBoardDocInsert(map);
		System.out.println(map);
	}
	
//	@Test
	public void test() throws ParseException, org.json.simple.parser.ParseException {
		for (int j = 1; j < 13; j++) {
		String serviceKey = "zy%2FZZCSwzH2XN%2FGYNR%2FGFFKJ2z6s368WViy%2FwfzkHNxge5pG99WjgHiLmuFP9KQl60hNZPmAU9D8jExKOL9AiQ%3D%3D";
        String addr = "http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService";
        String query = "/getHoliDeInfo?";
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(addr);
        stringBuffer.append(query);
        stringBuffer.append("solYear=2022");
        stringBuffer.append("&solMonth="+String.format("%02d", j));
//        stringBuffer.append("&solMonth=06");
        stringBuffer.append("&_type=json");
        stringBuffer.append("&ServiceKey=" + serviceKey);
        
        int cnt = 0;
        
        System.out.println("stringBuffer.toString() "+ stringBuffer.toString());
        
		
        
        try {
            URL url = new URL(stringBuffer.toString());
            URLConnection conn = url.openConnection();
            BufferedReader rd = null;
            
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
            
            String line= rd.readLine();
            
            JSONParser jsonParser = new JSONParser();//JSON데이터를 넣어 JSON Object 로 만들어 준다.
            JSONObject jsonObject = (JSONObject) jsonParser.parse(line);
            System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
            System.out.println(jsonObject);
            System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
            JSONObject obj = (JSONObject) jsonObject.get("response");
            System.out.println(obj);
            JSONObject obj2 = (JSONObject) obj.get("body");
            System.out.println(obj2);
            
            try {
            	JSONObject obj3 = (JSONObject) obj2.get("items");
                JSONArray holidays = (JSONArray) obj3.get("item");
                System.out.println(holidays);
                
                List<String> res = new ArrayList<String>();
                for (int i = 0; i < holidays.size(); i++) {
                	JSONObject holiday = (JSONObject) holidays.get(i);
                	long selholi = (long) holiday.get("locdate");
                	res.add(String.valueOf(selholi));
                	System.out.println(selholi);
    			}
                System.out.println(res);
                
                Calendar cal = Calendar.getInstance();
        		// Calendar의 Month는 0부터 시작하므로 -1 해준다.
        		cal.set(2022, 5, 20);
        		System.out.println(cal.getTime());
        		
        		for (int i = 0; i < 10; i++) {
        			String result = cal.get(Calendar.YEAR)+""+String.format("%02d", cal.get(Calendar.MONTH))+String.format("%02d", cal.get(Calendar.DATE));
        			
        			cal.add(Calendar.DATE, 1); // one day increment
        			int day = cal.get(Calendar.DAY_OF_WEEK);
        			
        			System.out.println("최종 폼 : "+result);
        			System.out.println("월 : "+ cal.get(Calendar.MONTH));
        			System.out.println(cal.getTime());
        			System.out.println(day);
        			System.out.println(cnt + "번째");
        			
        			// 일요일 : 1 , 토요일 : 7
        			if(day == 1 || day == 7) {
        				i--;
        			}
        			if(res.contains(result)) {
        				i--;
        			}
        			
        			cnt++;
        		}
                
                
                
			} 
            
            catch (Exception e) {
            	try {
            		JSONObject obj3 = (JSONObject) obj2.get("items");
    	            System.out.println(obj3);
    	            JSONObject obj4 = (JSONObject) obj3.get("item");
    	            System.out.println(obj4);
    	            long selholi = (long) obj4.get("locdate");
    	            String res = String.valueOf(selholi);
    	            System.out.println(selholi);
    	            
    	            
    	            Calendar cal = Calendar.getInstance();
    	    		// Calendar의 Month는 0부터 시작하므로 -1 해준다.
    	    		cal.set(2022, 5, 20);
    	    		System.out.println(cal.getTime());
    	    		
    	    		for (int i = 0; i < 10; i++) {
    	    			String result = cal.get(Calendar.YEAR)+""+String.format("%02d", cal.get(Calendar.MONTH))+String.format("%02d", cal.get(Calendar.DATE));
    	    			
    	    			cal.add(Calendar.DATE, 1); // one day increment
    	    			int day = cal.get(Calendar.DAY_OF_WEEK);
    	    			
    	    			System.out.println("최종 폼 : "+result);
    	    			System.out.println("월 : "+ cal.get(Calendar.MONTH));
    	    			System.out.println(cal.getTime());
    	    			System.out.println(day);
    	    			System.out.println(cnt + "번째");
    	    			
    	    			// 일요일 : 1 , 토요일 : 7
    	    			if(day == 1 || day == 7) {
    	    				i--;
    	    			}
    	    			if(res.contains(result)) {
    	    				i--;
    	    			}
    	    			cnt++;
    	    			
    	    			
    	    		}
    	            
				} catch (Exception e2) {
					System.out.println("해당 월에는 공휴일이 없습니다");
				}
            		
			}
//            Calendar cal = Calendar.getInstance();
//    		// Calendar의 Month는 0부터 시작하므로 -1 해준다.
//    		cal.set(2022, 5, 20);
//    		System.out.println(cal.getTime());
//    		
//    		for (int i = 0; i < 10; i++) {
//    			String result = cal.get(Calendar.YEAR)+""+String.format("%02d", cal.get(Calendar.MONTH))+String.format("%02d", cal.get(Calendar.DATE));
//    			
//    			cal.add(Calendar.DATE, 1); // one day increment
//    			int day = cal.get(Calendar.DAY_OF_WEEK);
//    			
//    			System.out.println("최종 폼 : "+result);
//    			System.out.println("월 : "+ cal.get(Calendar.MONTH));
//    			System.out.println(cal.getTime());
//    			System.out.println(day);
//    			System.out.println(cnt + "번째");
//    			
//    			// 일요일 : 1 , 토요일 : 7
//    			if(day == 1 || day == 7) {
//    				i--;
//    			}
//    			if(res.contains(result)) {
//    				i--;
//    			}
//    			cnt++;
//    			
//    			
//    		}
    		
            rd.close();
            
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	}
	
	
	
//	@Test
	public void calDate() throws IOException, org.json.simple.parser.ParseException {
		List<String> res = new ArrayList<String>();
		int cnt = 0;
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
//        stringBuffer.append("&solMonth=01");
        stringBuffer.append("&_type=json");
        stringBuffer.append("&ServiceKey=" + serviceKey);
        
//        System.out.println("stringBuffer.toString() "+ stringBuffer.toString());
        
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
 		cal.set(2022, 12-1, 24-1);
// 		System.out.println(cal.getTime());
 		
 		for (int i = 0; i < 30; i++) {
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
 				cnt++;
 				i--;
 				System.out.println(cnt+ "번째");
 			}
 			
 		}
		
		
	}
	
	
//	@Test
	public void Stringsub() {
		String end= "2022-06-15";
		String first = end.substring(0, 4);
		String second = end.substring(5, 7);
		String last = end.substring(8, 10);
		
		System.out.println(first);
		System.out.println(Integer.parseInt(first)-1);
		System.out.println(second);
		System.out.println(last);
	}

//	@Test
	public void Upload() {
		String originalFile = "C:/upload/tmp/Spring표.jpg";
		String originalFileExtention = originalFile.substring(originalFile.indexOf("."));
		String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtention;
//		String filePath = "C:/upload/tmp";
		System.out.println("originalFile :" + originalFile);
		System.out.println("originalFileExtention :" + originalFileExtention);
		System.out.println("storedFileName :" + storedFileName);
//		System.out.println("filename :" + filename);

//		File file = new File(filePath + storedFileName);

//		filename.transferTo(file);
	}
	
//	@Test
	public void test4(){
		String filePath = "C:/upload/tmp/";
		String result = filePath.substring(14);
		System.out.println(result);
	}
	
//	@Test
	public void test3() {
		String result = bDao.findFile(95);
		System.out.println(result);
	}
	
	@Test
	public void mesBoardQSelectAll() {
			MessageBoardVo vo = new MessageBoardVo();
			List<MessageBoardVo> lists = mDao.messendBoardSelectAll(vo);
			vo.setMes_cate("Q");
			if(vo.getMes_cate() == "Q") {
				vo.setMes_sender("ghkdwoaks1234");
				System.out.println(lists);
			}else {
				vo.setMes_recipient("ghkdwoaks1234");
				System.out.println(lists);
			}
	}
	
//	@Test
	public void mesBoardSelectDetail() {
		int seq = 1;
		MessageBoardVo one = mDao.mesBoardSelectDetail(seq);
		System.out.println(one);
	}
}

