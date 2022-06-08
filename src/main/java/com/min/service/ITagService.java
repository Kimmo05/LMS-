package com.min.service;

import org.json.simple.parser.ParseException;

import java.util.List;

public interface ITagService {
    public int insertTagNew(List<String> addTags);
    public List<String> insertClassTag(List<String> sub_num) throws ParseException;

    public String selectTagJson(String name);
}
