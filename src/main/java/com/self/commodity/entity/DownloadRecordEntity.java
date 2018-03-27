package com.self.commodity.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="DOWNLOAD_RECORD")
public class DownloadRecordEntity {
	
	/**
	 * UUID
	 */
	@Id
	private String uuid;
	
	/**
	 * 产品ID
	 */
	@Column(name="COMMODITY_ID")
	private String commodityId;
	
	/**
	 * 厂家ID
	 */
	@Column(name="USER_ID")
	private String userId;
	
	/**
	 * 创建时间
	 */
	@Column(name="CREATE_TIME")
	private Date createTime;
	
	/**
	 * 获取方式
	 */
	@Column(name="ACCESS")
	private String access;
	
	/**
	 * 用户名
	 */
	@Column(name="USER_NAME")
	private String userName;
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getCommodityId() {
		return commodityId;
	}
	public void setCommodityId(String commodityId) {
		this.commodityId = commodityId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAccess() {
		return access;
	}
	public void setAccess(String access) {
		this.access = access;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
