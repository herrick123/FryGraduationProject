package com.self.sys.log.entity;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;
@Table(name="sys_log")
public class LogEntity {
	/**
	 * 主键
	 */
	@Id
	private String id;
	/**
	 * 登录账户
	 */
	private String loginAccount;
	/**
	 * 日志级别
	 */
	private String logLevel;
	/**
	 * 操作内容
	 */
	private String operation;
	/**
	 * 操作人姓名
	 */
	private String operator;
	/**
	 * 操作时间
	 */
	private Date operationTime;
	/**
	 * 操作对象
	 */
	private String operateObj;
	/**
	 * 操作ip
	 */
	private String ip;
	/**
	 * 备注
	 */
	private String remark;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLoginAccount() {
		return loginAccount;
	}
	public void setLoginAccount(String loginAccount) {
		this.loginAccount = loginAccount;
	}
	public String getLogLevel() {
		return logLevel;
	}
	public void setLogLevel(String logLevel) {
		this.logLevel = logLevel;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public Date getOperationTime() {
		return operationTime;
	}
	public void setOperationTime(Date operationTime) {
		this.operationTime = operationTime;
	}
	public String getOperateObj() {
		return operateObj;
	}
	public void setOperateObj(String operateObj) {
		this.operateObj = operateObj;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
