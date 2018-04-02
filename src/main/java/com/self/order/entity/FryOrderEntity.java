package com.self.order.entity;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.self.commodity.entity.CommodityEntity;

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
	 * 代发商ID
	 */
	@Column(name = "DISTRIBUTOR_ID")
	private String distributorId;
	
	/**
	 * 代发商姓名
	 */
	@Transient
	private String distributorName;
	
	/**
	 * 代发商服务费
	 */
	@Transient
	private String serviceCharge;
	
	/**
	 * 代发商支付宝账号
	 */
	@Transient
	private String alipay;
	
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
	 * 转账记录
	 */
	@Column(name = "ALIPAY_RECORD")
	private String alipayRecord;
	
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

	/**
	 * 商品列表
	 */
	@Transient
	List<CommodityEntity> commodityList; 
	
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

	public String getDistributorId() {
		return distributorId;
	}

	public void setDistributorId(String distributorId) {
		this.distributorId = distributorId;
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

	public String getDistributorName() {
		return distributorName;
	}

	public void setDistributorName(String distributorName) {
		this.distributorName = distributorName;
	}

	public String getServiceCharge() {
		return serviceCharge;
	}

	public void setServiceCharge(String serviceCharge) {
		this.serviceCharge = serviceCharge;
	}

	public List<CommodityEntity> getCommodityList() {
		return commodityList;
	}

	public void setCommodityList(List<CommodityEntity> commodityList) {
		this.commodityList = commodityList;
	}

	public String getAlipay() {
		return alipay;
	}

	public void setAlipay(String alipay) {
		this.alipay = alipay;
	}

	public String getAlipayRecord() {
		return alipayRecord;
	}

	public void setAlipayRecord(String alipayRecord) {
		this.alipayRecord = alipayRecord;
	}
	
}
