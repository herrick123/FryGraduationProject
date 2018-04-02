package com.self.order.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "COMMODITY_ORDER")
public class CommodityOrderEntity {

	/**
	 * 主键
	 */
	@Id
	private String uuid;
	
	/**
	 * 订单ID
	 */
	@Column(name = "ORDER_ID")
	private String orderId;
	
	/**
	 * 商品ID
	 */
	@Column(name = "COMMODITY_ID")
	private String commodityId;
	
	/**
	 * 尺寸
	 */
	@Column(name = "SIZE")
	private String size;
	
	/**
	 * 颜色
	 */
	@Column(name = "COLOR")
	private String color;
	
	/**
	 * 数量
	 */
	@Column(name = "NUMBER")
	private Integer number;

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(String commodityId) {
		this.commodityId = commodityId;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}
	
	
}
