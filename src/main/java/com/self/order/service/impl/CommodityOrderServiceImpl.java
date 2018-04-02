package com.self.order.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.util.UuidUtil;
import com.self.order.dao.CommodityOrderMapper;
import com.self.order.entity.CommodityOrderEntity;
import com.self.order.service.CommodityOrderService;

import tk.mybatis.mapper.entity.Example;


@Service("commodityOrderService")
public class CommodityOrderServiceImpl implements CommodityOrderService {

	@Autowired
	private CommodityOrderMapper commodityOrdermapper;
	
	/**
	 * 新增订单关联的商品
	 */
	@Override
	public Integer saveCommodityOrderEntity(CommodityOrderEntity commodityOrder) {
		// TODO Auto-generated method stub
		commodityOrder.setUuid(UuidUtil.getUuid36());
		return commodityOrdermapper.insertSelective(commodityOrder);
	}

	/**
	 * 删除订单关联的商品
	 */
	@Override
	public Integer deleteCommodityOrderEntity(String orderId) {
		Example example = new Example(CommodityOrderEntity.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("orderId", orderId);

		return commodityOrdermapper.deleteByCondition(example);
	}

}
