package com.self.commodity.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

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
	
	/**
	 * 商品主图
	 */
	@Transient
	private String productPicture;
	
	/**
	 * 商品货号
	 */
	@Transient
	private String commodityNumber;
	
	/**
	 * 商品名称
	 */
	@Transient
	private String commodityName;
	
	/**
	 * 分类
	 */
	@Transient
	private String classification;
	
	/**
	 * 大小（迷你、小、中、大）
	 */
	@Transient
	private String size;
	
	/**
	 * 价格
	 */
	@Transient
	private String price;
	
	/**
	 * 状态（0下架/1上架）
	 */
	@Transient
	private String status;
	
	/**
	 * 颜色
	 */
	@Transient
	private String color;
	
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
	public String getProductPicture() {
		return productPicture;
	}
	public void setProductPicture(String productPicture) {
		this.productPicture = productPicture;
	}
	public String getCommodityNumber() {
		return commodityNumber;
	}
	public void setCommodityNumber(String commodityNumber) {
		this.commodityNumber = commodityNumber;
	}
	public String getCommodityName() {
		return commodityName;
	}
	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
}
