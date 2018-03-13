package com.self.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.self.company.dao.CompanyMapper;

/**
 * Created by  liujs  2017/10/14
 */
@Service
public class CompanyService {
    @Autowired
    CompanyMapper companyMapper;


}
