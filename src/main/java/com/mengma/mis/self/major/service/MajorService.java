package com.mengma.mis.self.major.service;

import com.github.pagehelper.PageHelper;
import com.mengma.mis.core.util.Page;
import com.mengma.mis.self.major.dao.MajorMapper;
import com.mengma.mis.self.major.entity.Major;
import com.mengma.mis.self.school.entity.School;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Map;

/**
 * Created by  liujs  2017/10/12
 */
@Service
public class MajorService {
    @Autowired
    MajorMapper majorMapper;

    public Integer createMajor(Major major){
        return majorMapper.insert(major);
    }


    public Integer updateMajor(Major major){
        return majorMapper.updateByPrimaryKeySelective(major);
    }


    public Integer deleteMajor(String id){
        return majorMapper.deleteByPrimaryKey(id);
    }


    public List<Major> majorList(Page<Major> page){
        Example example = new Example(Major.class);
        Example.Criteria criteria= example.createCriteria();
        if (!page.getParameters().isEmpty()){
            for (Map.Entry entry:page.getParameters().entrySet()) {
                criteria.andEqualTo(entry.getKey().toString(), entry.getValue());
            }
        }
        PageHelper.startPage(page.getNowPage(),page.getPageSize());
        return majorMapper.selectByCondition(example);
    }


    public Major majorInfo(String id){
        return majorMapper.selectByPrimaryKey(id);
    }

}
