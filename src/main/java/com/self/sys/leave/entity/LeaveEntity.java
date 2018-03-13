package com.self.sys.leave.entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name="tab_leave")
public class LeaveEntity {
	
	@Id
	private int id;
	
	/**
	 * 姓名
	 */
	private String name;
	
	/**
	 * 学生编号
	 */
	private  String employeeId;
	
	/**
	 * 开始时间
	 */
	private java.sql.Date startTime;
	
	/**
	 * 结束时间
	 */
	private java.sql.Date endTime;
	
	/**
	 * 假期类型
	 */
	private String type;
	
	/**
	 * 请假审核操作
	 */
	private String operation;
	
	/**
	 * 请假时长
	 */
	private int timeLength;
	
	/**
	 * 备注
	 */
	private String remark;
	
	/**
	 * 原因
	 */
	private String reason;
	
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	/**
	 * 请假状态
	 */
	@Transient
	private String state;
	
	@Transient
	private String startDate;
	
	@Transient
	private String endDate;
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getTimeLength() {
		return timeLength;
	}

	public void setTimeLength(int timeLength) {
		this.timeLength = timeLength;
	}

	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public java.sql.Date getStartTime() {
		return startTime;
	}

	public void setStartTime(java.sql.Date startTime) {
		this.startTime = startTime;
	}

	public java.sql.Date getEndTime() {
		return endTime;
	}

	public void setEndTime(java.sql.Date endTime) {
		this.endTime = endTime;
	}


	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}