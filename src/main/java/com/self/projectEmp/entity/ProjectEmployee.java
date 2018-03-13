package com.self.projectEmp.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 
 * 员工—项目表
 * 员工技能、评语等
 * @author donghc
 * 
 * */
@Table(name="tbl_project_employee")
public class ProjectEmployee {
	/**
	 * 主键
	 * */
	@Id
	private String id;
	/**
	 * 项目id 查询项目名称
	 * */
	@Column(name="project_id")
	private String projectId;
	
	@Transient
	private String projectName;
	/**
	 * 员工id 查询员工名称
	 * */
	@Column(name="employee_id")
	private String employeeId;
	
	@Transient
	private String employeeName;
	/**
	 * ‘0’不在该项目组，‘1’在当前项目组
	 * */
	@Column(name="status")
	private String status;
	/**
	 * 人员评价
	 * */
	@Column(name="judge")
	private String judge;
	/**
	 * 评价时间
	 * */
	@Column(name="judge_time")
	private Date judgeTime;
	/**
	 * 加入项目组的开始时间
	 * 
	 **/
	@Column(name="add_time")
	private String addTime;
	/**
	 * 离开项目组的时间
	 * */
	@Column(name="end_time")
	private String endTime;
	/**
	 * 在本项目中使用的技能
	 * 
	 * */
	@Column(name="skill")
	private String skill;
	
	public ProjectEmployee() {
		
	}

	

	public ProjectEmployee(String id, String projectId, String projectName, String employeeId, String employeeName,
			String status, String judge, Date judgeTime, String addTime, String endTime, String skill) {
		super();
		this.id = id;
		this.projectId = projectId;
		this.projectName = projectName;
		this.employeeId = employeeId;
		this.employeeName = employeeName;
		this.status = status;
		this.judge = judge;
		this.judgeTime = judgeTime;
		this.addTime = addTime;
		this.endTime = endTime;
		this.skill = skill;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getJudge() {
		return judge;
	}

	public void setJudge(String judge) {
		this.judge = judge;
	}

	public Date getJudgeTime() {
		return judgeTime;
	}

	public void setJudgeTime(Date judgeTime) {
		this.judgeTime = judgeTime;
	}

	public String getAddTime() {
		return addTime;
	}

	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	
	
	
	
}





