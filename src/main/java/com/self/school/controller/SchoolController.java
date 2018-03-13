package com.self.school.controller;

import com.alibaba.fastjson.JSONObject;
import com.core.constant.GlobalCodeConstant;
import com.core.util.MisLog;
import com.core.util.Page;
import com.github.pagehelper.PageInfo;
import com.self.school.entity.School;
import com.self.school.service.SchoolService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * Created by  liujs  2017/10/10
 */
@Controller
@RequestMapping("/school")
public class SchoolController {
    private static final Logger log = LoggerFactory.getLogger(SchoolController.class);
    @Autowired
    SchoolService schoolService;



    private static String EXCEPTION_PAGE = "/exception";
    private static String MODULE_LIST_PAGE = "/school/schoolList";//学校列表页面
    private static String MODULE_ADD_PAGE = "/school/addSchool";//新增学校页面
    private static String MODULE_EDIT_PAGE = "/school/editSchool";//编辑学校页面


    @RequestMapping("/page")
    public String pageSchool( Model model ){
        return MODULE_LIST_PAGE;
    }

    @RequestMapping("/add")
    public String addSchool(Model model){
        return MODULE_ADD_PAGE;
    }

    @PostMapping("/save")
    public String saveSchool(Model model, School school){
        MisLog.info(log,"新增高校");
        int result = schoolService.saveSchool(school);
        if (result > 0) return MODULE_LIST_PAGE;
        return EXCEPTION_PAGE;
    }

    @ResponseBody
    @PostMapping("/pageList")
    public Object querySchoolPageList(String gridPager){
        JSONObject json = JSONObject.parseObject(gridPager);
//        JSONObject schoolJson = json.getJSONObject("parameters");
//        MisLog.info(log, schoolJson.toJSONString());
        Page<School> page = JSONObject.toJavaObject(json, Page.class);
        PageInfo<School> pageInfo = new PageInfo<School>(schoolService.querySchoolPageList(page));
        return  JSONObject.toJSONString(new Page<School>(pageInfo));
    }

    @ResponseBody
    @PostMapping("/check")
    public Object checkSubmitData(){
        MisLog.info(log, "school提交数据检验");
        JSONObject json = JSONObject.parseObject("{}");
        json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
        return json.toJSONString();
    }


    @GetMapping("/edit/{id}")
    public String saveSchool(Model model, @PathVariable("id") String id){
        MisLog.info(log,"修改高校");
        School school = schoolService.querySchoolInfo(id);
        model.addAttribute("school", school);
        return MODULE_EDIT_PAGE;
    }




}
