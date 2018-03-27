package com.self.commodity.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name="COMMODITY")
public class CommodityEntity {
	
	/**
	 * 主键uuid
	 */
	@Id
	private String uuid;

	/**
	 * 所属用户id
	 */
	@Column(name="USER_ID")
	private String userId;
	
	/**
	 * 商品主图
	 */
	@Column(name="PRODUCT_PICTURE")
	private String productPicture;
	
	/**
	 * 商品货号
	 */
	@Column(name="COMMODITY_NUMBER")
	private String commodityNumber;
	
	/**
	 * 商品名称
	 */
	@Column(name="COMMODITY_NAME")
	private String commodityName;
	
	/**
	 * 分类
	 */
	@Column(name="CLASSIFICATION")
	private String classification;
	
	/**
	 * 大小（迷你、小、中、大）
	 */
	@Column(name="SIZE")
	private String size;
	
	/**
	 * 质地
	 */
	@Column(name="PLACE")
	private String place;
	
	/**
	 * 闭合方式
	 */
	@Column(name="CLOSED_WAY")
	private String closedWay;
	
	/**
	 * 流行元素
	 */
	@Column(name="POPULAR")
	private String popular;
	
	/**
	 * 价格
	 */
	@Column(name="PRICE")
	private String price;
	
	/**
	 * 状态（0下架/1上架）
	 */
	@Column(name="STAUS")
	private String staus;
	
	/**
	 * 标签
	 */
	@Column(name="LABEL")
	private String label;
	
	/**
	 * 颜色
	 */
	@Column(name="COLOR")
	private String color;
	
	/**
	 * 压缩包
	 */
	@Column(name="UPLOAD_COMPRESSION")
	private String uploadCompression;
	
	/**
	 * 发布时间
	 */
	@Column(name="RELEASE_TIME")
	private Date releaseTime;
	
	/**
	 * 产品描述
	 */
	@Column(name="COMMODITY_DECRIBE")
	private String commodityDecribe;
	
	/**
	 * 拿货地址
	 */
	@Transient
	private String deliveryAddress;

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

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getClosedWay() {
		return closedWay;
	}

	public void setClosedWay(String closedWay) {
		this.closedWay = closedWay;
	}

	public String getPopular() {
		return popular;
	}

	public void setPopular(String popular) {
		this.popular = popular;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getStaus() {
		return staus;
	}

	public void setStaus(String staus) {
		this.staus = staus;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getUploadCompression() {
		return uploadCompression;
	}

	public void setUploadCompression(String uploadCompression) {
		this.uploadCompression = uploadCompression;
	}

	public Date getReleaseTime() {
		return releaseTime;
	}

	public void setReleaseTime(Date releaseTime) {
		this.releaseTime = releaseTime;
	}

	public String getCommodityDecribe() {
		return commodityDecribe;
	}

	public void setCommodityDecribe(String commodityDecribe) {
		this.commodityDecribe = commodityDecribe;
	}
	
}
