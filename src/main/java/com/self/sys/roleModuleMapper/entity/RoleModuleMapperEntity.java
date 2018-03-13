package com.self.sys.roleModuleMapper.entity;

import javax.persistence.Id;
import javax.persistence.Table;
@Table(name="sys_module_role_rel")
public class RoleModuleMapperEntity {
	@Id
	private String id;
	private String roleId;
	private String moduleId;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getModuleId() {
		return moduleId;
	}
	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}
	
}
