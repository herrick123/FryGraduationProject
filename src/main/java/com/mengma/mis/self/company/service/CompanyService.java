package com.mengma.mis.self.company.service;

import com.mengma.mis.self.company.dao.CompanyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by  liujs  2017/10/14
 */
@Service
public class CompanyService {
    @Autowired
    CompanyMapper companyMapper;


}
