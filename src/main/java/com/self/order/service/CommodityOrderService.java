package com.self.order.service;


import com.self.order.entity.CommodityOrderEntity;

public interface CommodityOrderService {

	public Integer saveCommodityOrderEntity(CommodityOrderEntity commodityOrder);
	
	public Integer deleteCommodityOrderEntity(String orderId);

}
