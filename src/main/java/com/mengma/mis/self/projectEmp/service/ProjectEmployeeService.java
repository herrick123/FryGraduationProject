package com.mengma.mis.self.projectEmp.service;

import java.util.List;

import com.mengma.mis.core.util.Page;
import com.mengma.mis.self.projectEmp.entity.ProjectEmployee;


public interface ProjectEmployeeService {
	/**
	 * 分页查询项目员工表
	 * @param projectEmp
	 * @param page
	 * @return
	 * */
	public List<ProjectEmployee> findProjectEmployeePage(ProjectEmployee projectEmp, Page<ProjectEmployee> page);
	/**
	 * 添加评价
	 * @param projectEmp
	 * @return
	 * */
	public Integer addProjectEmployee(ProjectEmployee projectEmp);
}

