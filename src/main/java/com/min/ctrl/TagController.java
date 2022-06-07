package com.min.ctrl;

import com.min.service.ITagService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TagController {

    private static final Logger logger = LoggerFactory.getLogger(TagController.class);

    @Autowired
    private ITagService tagService;

    @RequestMapping(value = "/tag.do",method = RequestMethod.GET)
    public String tagPage(String tag){

        return "tag";
    }


    @RequestMapping(value = "/getTags.do",method = RequestMethod.GET,produces = "application/json; charset=utf-8")
    @ResponseBody
    public String getTags(){
        String tags = tagService.selectTagAll();
        return tags;
    }

    @RequestMapping(value = "/searchTag.do",method = RequestMethod.POST,produces = "application/text; charset=utf-8")
    @ResponseBody
    public String searchTag( String tag){
        logger.info(tag);
        String ids = tagService.selectTagJson(tag);
        logger.info("ids: {}",ids);
        //TODO 과정,과목 상세보기가 완료되면 주소를 매핑해주기
        return "";
    }

}
