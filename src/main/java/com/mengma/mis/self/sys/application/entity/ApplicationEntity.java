package com.mengma.mis.self.sys.application.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "sys_applications")
public class ApplicationEntity {
	
	/**
	 * 主键id
	 */
	@Id
	@Column(name = "APP_ID")
	private String id;
	
	/**
	 * 应用名称
	 */
	@Column(name = "APP_NAME")
	private String appName;
	
	/**
	 * 应用简介
	 */
	@Column(name = "APP_DESC")
	private String appDesc;
	
	/**
	 * 应用创建时间
	 */
	@Column(name = "CREATE_TIME")
	private Date createTime;
	
	/**
	 * 应用状态
	 */
	@Column(name = "APP_STATE")
	private Integer appState;
	
	/**
	 * 显示顺序
	 */
	@Column(name = "DISPLAY_INDEX")
	private Integer displayIndex;
	
	/**
	 * 上线文根
	 */
	@Column(name = "APP_CONTEXT")
	private String appContext;
	
	/**
	 * 创建人
	 */
	@Column(name = "CREATOR")
	private String creator;
	
	/**
	 * 修改人
	 */
	@Column(name = "MODIFIER")
	private String modifier;
	
	/**
	 * 修改时间
	 */
	@Column(name = "UPDATE_TIME")
	private Date updateTime;

	/**
	 * 操作
	 */
	@Transient
	private String operation;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public String getAppDesc() {
		return appDesc;
	}

	public void setAppDesc(String appDesc) {
		this.appDesc = appDesc;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getAppState() {
		return appState;
	}

	public void setAppState(Integer appState) {
		this.appState = appState;
	}

	public Integer getDisplayIndex() {
		return displayIndex;
	}

	public void setDisplayIndex(Integer displayIndex) {
		this.displayIndex = displayIndex;
	}

	public String getAppContext() {
		return appContext;
	}

	public void setAppContext(String appContext) {
		this.appContext = appContext;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
}
