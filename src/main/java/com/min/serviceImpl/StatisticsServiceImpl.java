package com.min.serviceImpl;

import com.min.dao.IStatisticsDao;
import com.min.service.IStatisticsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
