package com.min.serviceImpl;

import com.min.dao.ITagDao;
import com.min.service.ITagService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ITagServiceImpl implements ITagService {

    private final Logger logger = LoggerFactory.getLogger(ITagServiceImpl.class);

    @Autowired
    private ITagDao dao ;
    @Transactional
    @Override
    public int insertTagNew(List<String> addTags) {
        int cnt = 0;
        for (int i =0 ; i<addTags.size();i++){
            dao.insertTagNew(addTags.get(i));
            cnt++;
        }
        return cnt;
    }
}
