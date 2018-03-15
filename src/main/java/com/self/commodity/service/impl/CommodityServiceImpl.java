package com.self.commodity.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.constant.GlobalCodeConstant;
import com.core.exception.BaseException;
import com.core.exception.SaveException;
import com.core.exception.UpdateException;
import com.core.util.Page;
import com.core.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.self.area.entity.AreaEntity;
import com.self.commodity.dao.CommodityMapper;
import com.self.commodity.entity.CommodityEntity;
import com.self.commodity.service.CommodityService;

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
		commodityEntity.setStaus("1");
		commodityEntity.setReleaseTime(new Date());
		int result = GlobalCodeConstant.BASE_ERROR_CODE;
		try {
			result = commodityMapper.insert(commodityEntity);
		} catch (Exception e) {
			throw new SaveException("新增商品失败"+e);
		}
		return result;
	}
	/**
	 * 分页查询所有商品
	 */
	@Override
	public List<CommodityEntity> getCommodityList(CommodityEntity commodityEntity,Page<CommodityEntity> page){
		Example example = new Example(CommodityEntity.class);
		Example.Criteria criteria = example.createCriteria();
		/*criteria.andEqualTo("staus", 1);*/
		if(StringUtils.isNotEmpty(commodityEntity.getCommodityNumber())) {
			criteria.andLike("commodityNumber", "%" + commodityEntity.getCommodityNumber()+ "%");
		}
		if(StringUtils.isNotEmpty(commodityEntity.getCommodityName())) {
			criteria.andLike("commodityName", "%" + commodityEntity.getCommodityName()+ "%");
		}
		PageHelper.startPage(page.getNowPage(),page.getPageSize());
		List<CommodityEntity> result = null;
		try {
			result = commodityMapper.selectByCondition(example);
		} catch (Exception e) {
			throw new BaseException("分页查询上架商品失败",e);
		}
		
		return result;
		
	}
	/**
	 * 逻辑下架产品
	 */
	@Override
	public Integer deleteCommodity(String[] uuids) {
		CommodityEntity commodityEndity = new CommodityEntity();
		int result=GlobalCodeConstant.UPDATE_ERROR_CODE;
		try {
			for(int i = 0; i<uuids.length;i++) {
				commodityEndity.setUuid(uuids[i]);
				commodityEndity.setStaus("0");
				result=commodityMapper.updateByPrimaryKeySelective(commodityEndity);
			}
		} catch (Exception e) {
			throw new UpdateException("下架失败"+e);
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
