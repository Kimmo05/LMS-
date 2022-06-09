package com.min.serviceImpl;

import com.min.dao.IStatisticsDao;
import com.min.service.IStatisticsService;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class StatisticsServiceImpl implements IStatisticsService {

    private final Logger logger = LoggerFactory.getLogger(StatisticsServiceImpl.class);
    @Autowired
    private IStatisticsDao dao ;

    //과목코드를 조회하는 메소드
    @Override
    public String selectSubjectCode() {
        logger.info("STAT_001_HJM StatisticsServiceImpl selectSubjectCode");
        return dao.selectSubjectCode();
    }
    //사용자의 선호를 업데이트 하는 메소드
    @Override
    public int updatePrefer(Map<String, Object> map) {
        logger.info("STAT_001_HJM StatisticsServiceImpl updatePrefer {}",map);
        return updatePrefer(map);
    }

    @Override
    public int updateLike(String userId, String num) throws ParseException {
        String myLike = dao.selectUserLike(userId);
        String classLike = dao.selectClassLike(num);
        JSONParser parser = new JSONParser();
        JSONArray myArr = (JSONArray) parser.parse(myLike);
        JSONArray classArr = (JSONArray)parser.parse(classLike);
        Map<String,Object> userMap = new HashMap<String,Object>();
        userMap.put("like",num);
        userMap.put("id",userId);
        Map<String,Object> classMap = new HashMap<String,Object>();
        classMap.put("like",userId);
        classMap.put("num",num);
        dao.updateClassLike(classMap);
        dao.updateUserLike(userMap);
        return 0;
    }
}
