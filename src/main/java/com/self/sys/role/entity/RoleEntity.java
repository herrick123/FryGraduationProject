package com.self.sys.role.entity;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 角色实体
 * @author 黄青山
 *
 */
@Table(name="sys_role")
public class RoleEntity {
	@Id
	private String roleId;
	private String roleName;
	private String roleCode;
	private Date updateTime;
	/**
	 * 模块id，是对个id组成的字符串
	 */
	@Transient
	private String modulesIds;
	@Transient
	private String modulesName;
	
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	public String getModulesIds() {
		return modulesIds;
	}
	public void setModulesIds(String modulesIds) {
		this.modulesIds = modulesIds;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	public String getModulesName() {
		return modulesName;
	}
	public void setModulesName(String modulesName) {
		this.modulesName = modulesName;
	}
	
}
