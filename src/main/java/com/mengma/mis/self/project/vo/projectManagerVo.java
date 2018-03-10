package com.mengma.mis.self.project.vo;

import java.util.Date;

/**
 * 王子珩
 */

public class projectManagerVo {
	/**
	 * 请假列表id
	 */
	private String id;
	
	/**
	 * 学生编号
	 */
	private String employeeCode;
	
	/**
	 * 学生姓名
	 */
	private String employeeName;
	
	/**
	 * 请假类型
	 */
	private String type;
	
	/**
	 * 开始时间
	 */
	private Date startTime;
	
	/**
	 * 结束时间
	 */
	private Date endTime;
	
	
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

	/**
	 * 请假时长
	 */
	private String timeLength;
	
	/**
	 * 请假原因
	 */
	private String reason;
	
	private String projectLeader;
	
	public String getProjectLeader() {
		return projectLeader;
	}

	public void setProjectLeader(String projectLeader) {
		this.projectLeader = projectLeader;
	}

	private String operation;

	private String employeeProjectStatus;
	private String employeeId;
	
	public String getEmployeeProjectStatus() {
		return employeeProjectStatus;
	}

	public void setEmployeeProjectStatus(String employeeProjectStatus) {
		this.employeeProjectStatus = employeeProjectStatus;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmployeeCode() {
		return employeeCode;
	}

	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}


	public String getTimeLength() {
		return timeLength;
	}

	public void setTimeLength(String timeLength) {
		this.timeLength = timeLength;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	/**
	 * 审批状态
	 */
	private String status;
	
	/**
	 * 所在项目名称
	 */
	private String projectName;
}
