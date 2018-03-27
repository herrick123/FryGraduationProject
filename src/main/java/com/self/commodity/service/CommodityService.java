package com.self.commodity.service;

import java.util.List;
import java.util.Map;

import com.core.util.Page;
import com.self.commodity.entity.CommodityEntity;
import com.self.commodity.entity.DownloadRecordEntity;
import com.self.user.entity.FryUserEntity;

public interface CommodityService  {
	/**
	 * 上床压缩包
	 * 
	 * **/
	 public Integer saveCommodityZip(CommodityEntity commodityEntity);

	public Integer findCommodityEntityByParams(Map<String, String> params, Map<String, String> notIn);

	public Integer findCommodityEntityByParams(Map<String, String> params);

	List<CommodityEntity> getCommodityList(CommodityEntity commodityEntity, Page<CommodityEntity> page);

	public Integer deleteCommodity(String[] ids);
	public Integer deletesCommodity(String[] ids);

	public Integer updataCommodity(CommodityEntity commodity);

	public CommodityEntity findCommodityEntityInfo(String uuid);

	List<CommodityEntity> findCommodity(CommodityEntity commodityEntity);

	List<DownloadRecordEntity> downloadRecordEntity(DownloadRecordEntity downloadRecordEntity);

	Integer saveDownloadRecordEntity(DownloadRecordEntity downloadRecordEntity);

	List<DownloadRecordEntity> findDownloadRecord(String commodityId);

	List<DownloadRecordEntity> findDownloadRecord(DownloadRecordEntity downloadRecordEntity);

	List<FryUserEntity> findFirmList(FryUserEntity userEntity, Page<FryUserEntity> page);
	

}
