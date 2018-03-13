package com.self.major.controller;

import com.alibaba.fastjson.JSONObject;
import com.core.constant.GlobalCodeConstant;
import com.core.exception.UpdateException;
import com.core.util.MisLog;
import com.core.util.Page;
import com.github.pagehelper.PageInfo;
import com.self.major.entity.Major;
import com.self.major.service.MajorService;
import com.self.school.controller.SchoolController;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * Created by  liujs  2017/10/12
 */
@Controller
@RequestMapping("/major")
public class MajorController {
    private static final Logger log = LoggerFactory.getLogger(MajorController.class);

    private static String EXCEPTION_PAGE = "/exception";
    private static String MAJOR_LIST_PAGE = "/major/majorList";//专业列表页面
    private static String MAJOR_ADD_PAGE = "/major/addMajor";//新增专业页面
    private static String MAJOR_EDIT_PAGE = "/major/editMajor";//编辑专业页面

    @Autowired
    MajorService majorService;


    @PostMapping("/save")
    public String createMajor(Model model, Major major){
        MisLog.info(log,"新增专业");
        if (majorService.createMajor(major)>0)return MAJOR_LIST_PAGE;
        return EXCEPTION_PAGE;
    }


    @RequestMapping("/page")
    public String pageMajor(Model model){
        return MAJOR_LIST_PAGE;
    }


    @RequestMapping("/add")
    public String addMajor(Model model){
        return MAJOR_ADD_PAGE;
    }


    @RequestMapping("/update")
    public String updateMajor(Model model,Major major){
        MisLog.info(log,"更新专业信息");
        try {
            if (majorService.updateMajor(major) > 0) return MAJOR_LIST_PAGE;
        }catch (UpdateException e){
            MisLog.error(log,"专业信息更新错误", e);
            return EXCEPTION_PAGE;
        }
        return EXCEPTION_PAGE;
    }


    @GetMapping("/edit/{id}")
    public String editMajor(Model model, @PathVariable("id") String id){
        Major major = majorService.majorInfo(id);
        if (major != null){
            model.addAttribute("major",major);
        }
        return MAJOR_EDIT_PAGE;
    }


    @ResponseBody
    @PostMapping("/pageList")
    public String majorPageList(String gridPager){
        JSONObject json = JSONObject.parseObject(gridPager);
        Page<Major> page = JSONObject.toJavaObject(json,Page.class);
        PageInfo<Major> pageInfo = new PageInfo<>(majorService.majorList(page));
        return JSONObject.toJSONString(new Page<Major>(pageInfo));
    }

    @ResponseBody
    @PostMapping("/check")
    public Object checkSubmitData(){
        MisLog.info(log, "major提交数据检验");
        JSONObject json = JSONObject.parseObject("{}");
        json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
        return json.toJSONString();
    }


}
