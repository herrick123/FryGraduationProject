package com.self.sys.department.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.exception.BaseException;
import com.self.sys.department.dao.DepartmentMapper;
import com.self.sys.department.entity.Department;
import com.self.sys.department.service.DepartmentService;



@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
	private DepartmentMapper departmentMapper;

	@Override
	public String selectDepartmentName(String department) {
		String result = "";
		try {
			result = departmentMapper.selectByPrimaryKey(department).getDepartmentName();
		} catch (Exception e) {
			throw new BaseException("查询部门出错",e);
		}
		return result;
	}

	@Override
	public List<Department> listDepartment() {
		List<Department> departments = null;
		try {
			departments = departmentMapper.selectAll();
		} catch (Exception e) {
			throw new BaseException("查询部门出错",e);
		}
		return departments;
	}
}
