package com.min.dao;


import java.util.List;
import java.util.Map;

public interface IStatisticsDao {
    //자동완성을 위한 과목코드 가져오는 쿼리
    public String selectSubjectCode();

    //회원의 선호조사 또는 추천 결과를 업데이트 하는 쿼리
    public int updatePrefer(Map<String, Object> map);

    //지정 사용자의 선호조사, 추천 리스트를 가져오는 쿼리
    public String selectPreferW(String id);

    //전체 사용자의 선호조사, 추천 리스트를 가져오는 쿼리
    public List<String> selectPreferAll();

    //사용자 좋아요 업데이트
    public int updateUserLike(Map<String, Object> map);

    // 과정 좋아요 업데이트
    public int updateClassLike(Map<String, Object> map);

    //사용자 좋아요 목록
    public String selectUserLike(String id);

    //과정 좋아요 목록
    public String selectClassLike(String num);
}
