package com.min.dao;

import java.util.List;
import com.min.vo.TagVo;

public interface ITagDao {

	public List<TagVo> selectTagClassAndSubject();
	public String selectTagAll();
	public int updateTag();
	public int insertTagNew(String tag);
	
}
