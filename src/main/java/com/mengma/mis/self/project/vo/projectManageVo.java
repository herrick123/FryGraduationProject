package com.mengma.mis.self.project.vo;

import java.util.Date;


/**
 * 王子珩
 */

public class projectManageVo {
	
	/**
	 * 项目列表id
	 */
	private String id;
	
	/**
	 * 项目编号
	 */
	private String projectCode; 
	
	/**
	 * 项目名称
	 */
	private String projectName;
	
	/**
	 * 开始时间
	 */
	private Date startTime;
	
	/**
	 * 结束时间
	 */
	private Date endTime;
	
	/**
	 * 技术标签
	 */
	private String projectSkill;
	
	/**
	 * 项目类型
	 */
	private String type;
	
	/**
	 * 项目所属
	 */
	private String owner;
	
	/**
	 * 项目参与人
	 */
	private String staff;
	
	/**
	 * 学生编号
	 */
	private String employeeCode;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProjectCode() {
		return projectCode;
	}
	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getProjectSkill() {
		return projectSkill;
	}
	public void setProjectSkill(String projectSkill) {
		this.projectSkill = projectSkill;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getStaff() {
		return staff;
	}
	public void setStaff(String staff) {
		this.staff = staff;
	}
	public String getEmployeeCode() {
		return employeeCode;
	}
	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public String getAbilityLevel() {
		return abilityLevel;
	}
	public void setAbilityLevel(String abilityLevel) {
		this.abilityLevel = abilityLevel;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getValueCode() {
		return valueCode;
	}
	public void setValueCode(String valueCode) {
		this.valueCode = valueCode;
	}
	public String getValueName() {
		return valueName;
	}
	public void setValueName(String valueName) {
		this.valueName = valueName;
	}
	public String getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(String creatTime) {
		this.creatTime = creatTime;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	/**
	 * 学生技能标签
	 */
	private String skill;
	
	/**
	 * 能力级别
	 */
	private String abilityLevel;
	
	/**
	 * 专业
	 */
	private String major;
	
	/**
	 * 标签编号
	 */
	private String valueCode;
	
	/**
	 * 标签名称
	 */
	private String valueName;
	
	/**
	 * 创建时间
	 */
	private String creatTime;
	
	/**
	 * 更新时间
	 */
	private String updateTime;
	
	/**
	 * tbl_employee表中的id
	 * 命名为teId
	 */
	private String teId;
	/**
	 * tbl_employee表中的employee_name;
	 */
	private String employeeName;
	
	/**
	 * tbl_project_employee表中的项目id；
	 */
	private String tbProjectId;
	/**
	 * tbl_project_employee表中的学员id；
	 */
	private String employeeId;
	public String getTeId() {
		return teId;
	}
	public void setTeId(String teId) {
		this.teId = teId;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getTbProjectId() {
		return tbProjectId;
	}
	public void setTbProjectId(String tbProjectId) {
		this.tbProjectId = tbProjectId;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}


	
	

}
