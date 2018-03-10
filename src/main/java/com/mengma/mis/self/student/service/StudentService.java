package com.mengma.mis.self.student.service;

import com.github.pagehelper.PageHelper;
import com.mengma.mis.core.util.Page;
import com.mengma.mis.self.student.dao.StudentMapper;
import com.mengma.mis.self.student.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Map;

/**
 * Created by  liujs  2017/09/29
 */
@Service
public class StudentService {
    @Autowired
    StudentMapper studentMapper;


    public List userPageList(Page<Student> page){
        Example example = new Example(Student.class);
//        example.setOrderByClause(" entrance_time desc");
        Example.Criteria criteria= example.createCriteria();
        if (!page.getParameters().isEmpty()){
            for (Map.Entry entry:page.getParameters().entrySet()) {
                criteria.andEqualTo(entry.getKey().toString(), entry.getValue());
            }
        }
        PageHelper.startPage(page.getNowPage(),page.getPageSize());

        return  studentMapper.selectByCondition(example);
    }

}
