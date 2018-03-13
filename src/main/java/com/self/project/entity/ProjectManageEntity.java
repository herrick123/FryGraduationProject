package com.self.project.entity;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;




/**
 * 项目管理列表
 * @author 王子珩
 *
 */
@Table(name="tbl_project")
public class ProjectManageEntity {
	
	
	@Transient
	private String employeeName;
	@Transient
	private String employeeId;

/*	*//**
	 * 项目学员关系列表中 prject_id
	 *//*
	private String tpeId;
	
	*//**
	 * 项目学员关系列表中emoloyee_id
	 *//*
	private String tpeEmoloyeeId;
	
	*//**
	 * 学员列表中id
	 *//*
	private String teId;
	*//**
	 * 学员列表中employee_name
	 *//*
	private String employeeName;
	
	
	*/
	
	
	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	/*public String getTpeId() {
		return tpeId;
	}

	public void setTpeId(String tpeId) {
		this.tpeId = tpeId;
	}

	public String getTpeEmoloyeeId() {
		return tpeEmoloyeeId;
	}

	public void setTpeEmoloyeeId(String tpeEmoloyeeId) {
		this.tpeEmoloyeeId = tpeEmoloyeeId;
	}

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
*/
	/**
	 * 项目列表id
	 */
	@Id
	private String id;
	
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
	 * 项目负责人
	 */
	private String projectLeader;

	public String getProjectLeader() {
		return projectLeader;
	}

	public void setProjectLeader(String projectLeader) {
		this.projectLeader = projectLeader;
	}
}
