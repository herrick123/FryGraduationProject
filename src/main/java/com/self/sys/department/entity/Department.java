package com.self.sys.department.entity;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="sys_department")
public class Department {
	@Id
	private String departmentId;
	private String departmentName;
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	
}
