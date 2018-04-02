package com.self.order.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.util.Page;
import com.github.pagehelper.PageHelper;
import com.self.commodity.entity.CommodityEntity;
import com.self.order.dao.FryOrderMapper;
import com.self.order.entity.FryOrderEntity;
import com.self.order.service.FryOrderService;

@Service("fryOrderService")
public class FryOrderServiceImpl implements FryOrderService {

	@Autowired
	private FryOrderMapper fryOrdermapper;

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 分页查询订单列表
	 */
	@Override
	public List<FryOrderEntity> findFryOrderPage(FryOrderEntity fryOrder, Page<FryOrderEntity> page) {
		PageHelper.startPage(page.getNowPage(), page.getPageSize());
		List<FryOrderEntity> fryOrderList = sqlSession.selectList("com.fryOrder.findFryOrderList", fryOrder);

		return fryOrderList;
	}

	/**
	 * 通过订单ID查询商品列表
	 */
	@Override
	public List<CommodityEntity> findCommodityListByOrderId(String orderId) {
		List<CommodityEntity> commodityList = sqlSession.selectList("com.fryOrder.findCommodityListByOrderId", orderId);
		
		return commodityList;
	}

	/**
	 * 创建订单
	 */
	@Override
	public Integer saveFryOrderEntity(FryOrderEntity fryOrder) {
		fryOrder.setStatus("0");
		fryOrder.setCreateTime(new Timestamp(System.currentTimeMillis()));

		return fryOrdermapper.insertSelective(fryOrder);
	}

	/**
	 * 修改订单
	 */
	@Override
	public Integer updateFryOrderEntity(FryOrderEntity fryOrder) {

		return fryOrdermapper.updateByPrimaryKeySelective(fryOrder);
	}

	/**
	 * 删除订单
	 */
	@Override
	public Integer deleteFryOrderEntity(String uuid) {

		return fryOrdermapper.deleteByPrimaryKey(uuid);
	}

}
