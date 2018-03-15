package com.self.commodity.service;

import java.util.List;
import java.util.Map;

import com.core.util.Page;
import com.self.commodity.entity.CommodityEntity;

public interface CommodityService  {
	/**
	 * 上床压缩包
	 * 
	 * **/
	 public Integer saveCommodityZip(CommodityEntity commodityEntity);

	Integer findCommodityEntityByParams(Map<String, String> params, Map<String, String> notIn);

	Integer findCommodityEntityByParams(Map<String, String> params);

	List<CommodityEntity> getCommodityList(CommodityEntity commodityEntity, Page<CommodityEntity> page);

	Integer deleteCommodity(String[] ids);
	

}
