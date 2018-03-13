package com.self.school.service;

import com.core.util.Page;
import com.core.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.self.school.dao.SchoolMapper;
import com.self.school.entity.School;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Map;

/**
 * Created by  liujs  2017/10/10
 */
@Service
public class SchoolService {
    @Autowired
    SchoolMapper schoolMapper;

    public Integer saveSchool(School school){
        String id = UuidUtil.getUuid36().toString();
        school.setId(id);
        return schoolMapper.insert(school);
    }

    public Integer updateSchool(School school){
        return schoolMapper.updateByPrimaryKeySelective(school);
    }

    public Integer deleteSchool(String id){
        return  schoolMapper.deleteByPrimaryKey(id);
    }

    public List<School> querySchoolPageList(Page<School> page){
        Example example = new Example(School.class);
        Example.Criteria criteria= example.createCriteria();
        if (!page.getParameters().isEmpty()){
            for (Map.Entry entry:page.getParameters().entrySet()) {
                criteria.andEqualTo(entry.getKey().toString(), entry.getValue());
            }
        }
        PageHelper.startPage(page.getNowPage(),page.getPageSize());
        return schoolMapper.selectByCondition(example);
    }


    public School querySchoolInfo(String id){
        return schoolMapper.selectByPrimaryKey(id);
    }


}
