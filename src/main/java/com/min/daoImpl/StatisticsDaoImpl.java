package com.min.daoImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.dao.IStatisticsDao;

import java.util.List;
import java.util.Map;

@Repository
public class StatisticsDaoImpl implements IStatisticsDao {

    private final String NS = "com.min.StatisticsDaoImpl.";
    @Autowired
    private SqlSessionTemplate session;

    @Override
    public String selectSubjectCode() {
        return session.selectOne(NS + "selectSubjectCode");
    }

    @Override
    public int updatePrefer(Map<String, Object> map) {
        return session.update(NS + "updatePrefer", map);
    }

    @Override
    public String selectPreferW(String id) {
        return session.selectOne(NS+"selectPreferW",id);
    }

    @Override
    public List<String> selectPreferAll() {
        return session.selectList(NS+"selectPreferAll");
    }

    @Override
    public int updateUserLike(Map<String, Object> map) {
        return session.update(NS+"updateUserLike",map);
    }

    @Override
    public int updateClassLike(Map<String, Object> map) {
        return session.update(NS+"updateClassLike",map);
    }

    @Override
    public String selectUserLike(String id) {
        return session.selectOne(NS+"selectUserLike",id);
    }

    @Override
    public String selectClassLike(String num) {
        return session.selectOne(NS+"selectClassLike",num);
    }
}
