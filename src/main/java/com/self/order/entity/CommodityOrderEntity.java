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
}
