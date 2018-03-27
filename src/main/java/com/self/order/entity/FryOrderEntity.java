package com.self.order.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "FRY_ORDER")
public class FryOrderEntity {
	
	/**
	 * 主键
	 */
	@Id
	private String uuid;
	
	/**
	 * 用户ID
	 */
	@Column(name = "USER_ID")
	private String userId;
	
	/**
	 * 收件人
	 */
	@Column(name = "ADDRESSEE")
	private String addressee;
	
	/**
	 * 联系电话
	 */
	@Column(name = "TELEPHONE")
	private String telephone;
	
	/**
	 * 物流
	 */
	@Column(name = "LOGISTICS")
	private String logistics;
	
	/**
	 * 收货地址
	 */
	@Column(name = "RECEIVE_ADDRESS")
	private String receiveAddress;
	
	/**
	 * 备注
	 */
	@Column(name = "REMARK")
	private String remark;
	
	/**
	 * 状态
	 */
	@Column(name = "STATUS")
	private String status;
	
	/**
	 * 创建时间
	 */
	@Column(name = "CREATE_TIME")
	private Timestamp createTime;

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAddressee() {
		return addressee;
	}

	public void setAddressee(String addressee) {
		this.addressee = addressee;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getLogistics() {
		return logistics;
	}

	public void setLogistics(String logistics) {
		this.logistics = logistics;
	}

	public String getReceiveAddress() {
		return receiveAddress;
	}

	public void setReceiveAddress(String receiveAddress) {
		this.receiveAddress = receiveAddress;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
}
