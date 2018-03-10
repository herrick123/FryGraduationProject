package com.mengma.mis.self.sys.module.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "sys_module")
public class ModuleEntity implements Serializable{

	/**
    * 主键ID
    */
	@Id
	private String id;
	
	/**
    * 模块名
    */
	@Column(name = "module_name")
	private String moduleName;
	
	/**
    * 模块路径
    */
	@Column(name = "module_url")
	private String moduleUrl;
	
	/**
    * 模块状态
    */
	@Column(name = "module_state")
	private int moduleState;
	
	/**
    * 应用id
    */
	@Column(name = "app_id")
	private String appId;
	/**
	 * 所属应用，不存入数据了，为了界面传值
	 */
	@Transient
	private String appName;
	
	/**
    * 显示顺序
    */
	@Column(name = "display_index")
	private int displayIndex;
	
	/**
    * 模块组
    */
	@Column(name = "module_group")
	private String moduleGroup;
	
	/**
    * 创建时间
    */
	@Column(name = "create_time")
	private Date createTime;
	
	/**
    * 修改时间
    */
	@Column(name = "update_time")
	private Date updateTime;
	
	/**
    * 创建人
    */
	private String creater;
	
	/**
    * 修改人
    */
	private String modifier;
	
	/**
    * 操作
    */
	

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getModuleUrl() {
		return moduleUrl;
	}

	public void setModuleUrl(String moduleUrl) {
		this.moduleUrl = moduleUrl;
	}

	public int getModuleState() {
		return moduleState;
	}

	public void setModuleState(int moduleState) {
		this.moduleState = moduleState;
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public int getDisplayIndex() {
		return displayIndex;
	}

	public void setDisplayIndex(int displayIndex) {
		this.displayIndex = displayIndex;
	}

	public String getModuleGroup() {
		return moduleGroup;
	}

	public void setModuleGroup(String moduleGroup) {
		this.moduleGroup = moduleGroup;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}
	
	
}
