package com.min.service;

import java.util.Map;

public interface IStatisticsService {
    public String selectSubjectCode();
    public int updatePrefer(Map<String,Object> map);
}
