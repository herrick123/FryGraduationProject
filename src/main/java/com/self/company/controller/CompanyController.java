package com.self.company.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.self.company.service.CompanyService;



/**
 * Created by  liujs  2017/10/14
 */
@Controller
@RequestMapping("/company")
public class CompanyController {
    private static final Logger log = LoggerFactory.getLogger(CompanyController.class);

    @Autowired
    CompanyService companyService;



}
