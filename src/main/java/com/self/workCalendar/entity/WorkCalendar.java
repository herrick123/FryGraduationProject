package com.self.workCalendar.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 
 * 员工工作日历
 * @author dhc
 * 
 * */
@Table(name="tbl_employee_project_task")
public class WorkCalendar {
	/**
	 * 任务主键
	 * 
	 * */
	@Id
	private String Id;
	/**
	 * 任务详细
	 * 
	 * */
	private String tast;
	/**
	 * 员工id
	 * 
	 * */
	private String employeeId;
	/**
	 * 
	 * 员工姓名
	 * 
	 * */
	
	@Transient
	private String employeeName;
	/**
	 * 项目id
	 * 
	 * */
	
	@Column(name="project_id")
	private String projectId;
	/**
	 * 项目开始时间
	 * 
	 * */
	@Transient
	private Date startTime;
	/**
	 * 项目结束时间
	 * 
	 * */
	@Transient
	private Date endTime;
	/**
	 * 任务开始时间
	 * 
	 * */
	private Date stime;
	/**
	 * 任务结束时间
	 * 
	 * */
	private Date etime;
	public WorkCalendar() {
		// TODO Auto-generated constructor stub
	}
	public WorkCalendar(String id, String tast, String employeeId, String employeeName, String projectId,
			Date startTime, Date endTime, Date stime, Date etime) {
		super();
		Id = id;
		this.tast = tast;
		this.employeeId = employeeId;
		this.employeeName = employeeName;
		this.projectId = projectId;
		this.startTime = startTime;
		this.endTime = endTime;
		this.stime = stime;
		this.etime = etime;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getTast() {
		return tast;
	}
	public void setTast(String tast) {
		this.tast = tast;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
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
	public Date getStime() {
		return stime;
	}
	public void setStime(Date stime) {
		this.stime = stime;
	}
	public Date getEtime() {
		return etime;
	}
	public void setEtime(Date etime) {
		this.etime = etime;
	}
	

	
	
}
