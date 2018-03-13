package com.self.student.controller;

import com.alibaba.fastjson.JSONObject;
import com.core.util.Page;
import com.github.pagehelper.PageInfo;
import com.self.student.entity.Student;
import com.self.student.service.StudentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * Created by  liujs  2017/09/29
 */

@Controller
@RequestMapping("/student")
public class SudentController {

    @Autowired
    StudentService studentService;

    @ResponseBody
    @PostMapping("/list")
    public Page<Student> studentList(@RequestBody JSONObject jsonObject){
        Page<Student> page = JSONObject.toJavaObject(jsonObject,Page.class);
        PageInfo<Student> pageInfo = new PageInfo<Student>(studentService.userPageList(page));
        return new Page<Student>(pageInfo);
    }



}
