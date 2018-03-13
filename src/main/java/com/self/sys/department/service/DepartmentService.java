package com.self.sys.department.service;

import java.util.List;

import com.self.sys.department.entity.Department;



public interface DepartmentService {
	/**
	 * 查询部门名
	 * @param department
	 * @return
	 */
	public String selectDepartmentName(String department);
	/**
	 * 查询部门列表
	 * @return
	 */
	public List<Department> listDepartment();

}
