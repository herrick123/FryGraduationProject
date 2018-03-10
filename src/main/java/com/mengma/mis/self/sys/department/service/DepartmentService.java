package com.mengma.mis.self.sys.department.service;

import com.mengma.mis.self.sys.department.entity.Department;

import java.util.List;



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
