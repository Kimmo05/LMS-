package com.min;

import static org.junit.Assert.*;

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

import com.min.dao.ITagDao;
import com.min.vo.TagVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/*.xml"})
public class Statistics_Test {
	
	private Logger logger = LoggerFactory.getLogger(Statistics_Test.class);
	@Autowired
	private ITagDao dao;
	
	
	@SuppressWarnings("unchecked")
	@Test
	public void selectTagTest() throws ParseException {
		logger.info("selectTagTest 실행");
		List<TagVo> lists = dao.selectTagClassAndSubject();
		String temp;
		System.out.println("LISTS="+lists.get(1));
		Pattern p = Pattern.compile("#([a-zA-Z0-9가-힣]*)");
		JSONParser parser = new JSONParser();
		JSONArray arr = new JSONArray();
		for ( TagVo vo : lists) {
			arr = (JSONArray)parser.parse(vo.getTag());
			for (int i = 0; i < arr.size(); i++) {
				Matcher m = p.matcher(arr.get(i).toString());
				while(m.find()) {
					temp = m.group().replace(" ", "_").replace("#", "").toString().toLowerCase() ;
					if(!arr.contains(temp)) {
						arr.add(temp);
					}
				}
			}
		}
		System.out.println(arr.toString());
	//	System.out.println(tag);
	//	while(iter.hasNext()) {
	//		if(iter.next().equalsIgnoreCase(keyword)) {
	//			System.out.println("검색어 발견!");
	//			break;
	//		}
	//	}
	}
}
