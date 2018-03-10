package com.mengma.mis.self.sys.leave.vo;

import java.sql.Date;

/**
 * 
 * @author 董宏超
 * 学员项目期间请假信息列表
 * 
 * */
public class EmployeeLeaveVo {
	
	/**
	 * 
	 * 请假id
	 * */
	private Integer id;
	
	/**
	 * 员工id
	 * 
	 * */
	private String employeeId;
	
	/**
	 * 项目id
	 * 
	 * */
	private String projectId;

	/**
	 * 
	 * 员工编号
	 * 
	 * */
	private String employeeCode;
	/**
	 * 员工名称
	 * 
	 * */
	private String employeeName;
	
	/**
	 * 请假时长
	 * 
	 * */
	private String length;
	
	/**
	 * 是否批准
	 * 
	 * */
	private String operation;
	
	/**
	 * 请假原因
	 * 
	 * */
	private String reason;
	
	/**
	 * 请假开始时间
	 * 
	 * */
	private Date startTime;
	
	/**
	 * 请假结束时间
	 * 
	 * */
	private Date endTime;
	/**
	 * 项目的起始时间
	 * 
	 * */
	private Date proStartTime;
	
	/**
	 * 项目的结束时间
	 * 
	 * */
	private Date proEndTime;
	
	/**
	 * 请假类型
	 * 
	 * */
	private String type;

	public EmployeeLeaveVo() {
		
	}

	public EmployeeLeaveVo(Integer id, String employeeId, String projectId, String employeeCode, String employeeName,
			String length, String operation, String reason, Date startTime, Date endTime, Date proStartTime,
			Date proEndTime, String type) {
		super();
		this.id = id;
		this.employeeId = employeeId;
		this.projectId = projectId;
		this.employeeCode = employeeCode;
		this.employeeName = employeeName;
		this.length = length;
		this.operation = operation;
		this.reason = reason;
		this.startTime = startTime;
		this.endTime = endTime;
		this.proStartTime = proStartTime;
		this.proEndTime = proEndTime;
		this.type = type;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
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

	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
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

	public Date getProStartTime() {
		return proStartTime;
	}

	public void setProStartTime(Date proStartTime) {
		this.proStartTime = proStartTime;
	}

	public Date getProEndTime() {
		return proEndTime;
	}

	public void setProEndTime(Date proEndTime) {
		this.proEndTime = proEndTime;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	
	
}
