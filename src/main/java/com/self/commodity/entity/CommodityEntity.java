package com.self.commodity.entity;



import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author 18710
 *
 */
@Table(name="commodity_table")
public class CommodityEntity {
	/**
	 * 主键uuid
	 */
	@Id
	private String uuid;
	/**
	 * 商品主图
	 */
	private String productPicture;
	/**
	 * 商品货号
	 */
	private String commodityNumber;
	/**
	 * 商品名称
	 */
	private String commodityName;
	/**
	 * 分类
	 */
	private String classification;
	/**
	 * 大小（迷你、小、中、大）
	 */
	private String size;
	/**
	 * 质地
	 */
	private String place;
	/**
	 * 闭合方式
	 */
	private String closedWay;
	/**
	 * 流行元素
	 */
	private String popular;
	/**
	 * 价格
	 */
	private String price;
	/**
	 * 状态（0下架/1上架）
	 */
	private String staus;
	/**
	 * 标签
	 */
	private String label;
	/**
	 * 颜色
	 */
	private String color;
	/**
	 * 压缩包
	 */
	private String uploadCompression;
	/**
	 * 发布时间
	 */
	private Date releaseTime;
	/**
	 * 产品藐视
	 */
	private String commodityDecribe;
	/**
	 * 所属用户id
	 */
	private String userId;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
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
