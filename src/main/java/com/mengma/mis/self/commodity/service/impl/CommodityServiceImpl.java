package com.mengma.mis.self.commodity.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mengma.mis.core.constant.GlobalCodeConstant;
import com.mengma.mis.core.exception.SaveException;
import com.mengma.mis.core.util.UuidUtil;
import com.mengma.mis.self.area.entity.AreaEntity;
import com.mengma.mis.self.commodity.dao.CommodityMapper;
import com.mengma.mis.self.commodity.entity.CommodityEntity;
import com.mengma.mis.self.commodity.service.CommodityService;

import tk.mybatis.mapper.entity.Example;

@Service("commodityService")
public class CommodityServiceImpl implements CommodityService {
	@Autowired
	private CommodityMapper commodityMapper;
	/**
	 * 上传商品压缩包
	 */
	@Override
	public Integer saveCommodityZip(CommodityEntity commodityEntity) {
		String id = UuidUtil.getUuid36();
		commodityEntity.setUuid(id);
		commodityEntity.setReleaseTime(new Date());
		int result = GlobalCodeConstant.BASE_ERROR_CODE;
		try {
			result = commodityMapper.insert(commodityEntity);
		} catch (Exception e) {
			throw new SaveException("新增商品失败"+e);
		}
		return result;
	}
	@Override
	public Integer  findCommodityEntityByParams(Map<String, String> params) {
		Example example = new Example(CommodityEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
		}
		return commodityMapper.selectCountByCondition(example);
	}
	@Override
	public Integer findCommodityEntityByParams(Map<String, String> params,
			Map<String, String> notIn) {
		Example example = new Example(CommodityEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
			
		}
		for (String key:notIn.keySet()) {
			criteria.andNotEqualTo(key, notIn.get(key));
		}
		return commodityMapper.selectCountByCondition(example);
	}

}
