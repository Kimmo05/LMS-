package com.min;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.min.dao.IStatisticsDao;
import com.min.dao.ITagDao;
import com.min.vo.SubjectCodeVo;
import com.min.vo.TagVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/*.xml"})
public class Statistics_Test {
	
	private Logger logger = LoggerFactory.getLogger(Statistics_Test.class);
	@Autowired
	private ITagDao tDao;
	@Autowired
	private IStatisticsDao sDao;
	
	
	@SuppressWarnings("unchecked")
//	@Test
	public void selectTagTest() throws ParseException {
		logger.info("selectTagTest 실행");
		List<TagVo> lists = tDao.selectTagClassAndSubject();
		String temp;
		
		Pattern p = Pattern.compile("#([a-zA-Z0-9가-힣]*)");
//		temp = dao.selectTagAll();
		JSONParser parser = new JSONParser();
		JSONArray tags = new JSONArray();
//		tags = (JSONArray)parser.parse(temp);
		JSONArray arr = new JSONArray();
		JSONArray addTags = new JSONArray();
		List<String> insertTags = new ArrayList<String>();
		for (TagVo vo : lists) {
			arr = (JSONArray)parser.parse(vo.getTag().toString());
			for (int i = 0; i < arr.size(); i++) {
				Matcher m = p.matcher(arr.get(i).toString());
				while(m.find()) {
					temp = m.group().replace(" ", "_").replace("#", "").toString().toLowerCase() ;
					System.out.println(temp);
					//만약에 기존 태그중에 없으면 새로운 태그 추가 
					if(!tags.contains(temp)&&!addTags.contains(temp)) {
						addTags.add(temp);
					}
				}
			}
		}
		for (int i = 0; i < addTags.size(); i++) {
			insertTags.add(addTags.get(i).toString());
		}
		
//		System.out.println(tags.toString());
		System.out.println(addTags.toString());
	//	System.out.println(tag);
	//	while(iter.hasNext()) {
	//		if(iter.next().equalsIgnoreCase(keyword)) {
	//			System.out.println("검색어 발견!");
	//			break;
	//		}
	//	}
	}
	@Test
	public void test(){
		System.out.println("테스트");
	}
}
