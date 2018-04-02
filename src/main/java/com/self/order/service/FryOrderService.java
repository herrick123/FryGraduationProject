package com.self.order.service;

import java.util.List;

import com.core.util.Page;
import com.self.commodity.entity.CommodityEntity;
import com.self.order.entity.FryOrderEntity;

public interface FryOrderService {
	
	public List<FryOrderEntity> findFryOrderPage(FryOrderEntity fryOrder, Page<FryOrderEntity> page);

	public List<CommodityEntity> findCommodityListByOrderId(String orderId);
	
	public Integer saveFryOrderEntity(FryOrderEntity fryOrder);

	public Integer updateFryOrderEntity(FryOrderEntity fryOrder);

	public Integer deleteFryOrderEntity(String uuid);

}
