package com.self.commodity.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.constant.GlobalCodeConstant;
import com.core.exception.BaseException;
import com.core.exception.ParamsException;
import com.core.exception.SaveException;
import com.core.exception.UpdateException;
import com.core.util.MisUtil;
import com.core.util.Page;
import com.core.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.self.commodity.dao.CommodityMapper;
import com.self.commodity.dao.DownloadRecordMapper;
import com.self.commodity.entity.CommodityEntity;
import com.self.commodity.entity.DownloadRecordEntity;
import com.self.commodity.service.CommodityService;
import com.self.user.entity.FryUserEntity;
import com.self.user.service.FryUserService;

import tk.mybatis.mapper.entity.Example;



@Service("commodityService")
public class CommodityServiceImpl implements CommodityService {
	
	@Autowired
	private CommodityMapper commodityMapper;
	
	@Autowired
	private DownloadRecordMapper downloadRecordMapper;
	
	@Autowired
	private FryUserService fryUserService;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
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
		Map<String,Object> param=new HashMap<String,Object>();
		PageHelper.startPage(page.getNowPage(),page.getPageSize());
		List<CommodityEntity> result = null;
		param.put("commodityName",commodityEntity.getCommodityName());
		param.put("userId", commodityEntity.getUserId());
		try {
			result = sqlSession.selectList("com.commodityEntity.search_commodityName_commodityEntity_info", param);
		} catch (Exception e) {
			throw new BaseException("查询失败"+e);
		}
		return result;
		
	}
	/**
	 * 分页查询所有厂商列表
	 */
	@Override
	public List<FryUserEntity> findFirmList(FryUserEntity userEntity,Page<FryUserEntity> page){
		userEntity.setRole("2");
		List<FryUserEntity> result = fryUserService.findFryUserPage(userEntity, page);
		
		return result;
	}
	
	
	@Override
	public List<CommodityEntity> findCommodity(CommodityEntity commodityEntity){
		
		return commodityMapper.selectAll();
	}
	/**
	 * 根据uuid查询产品
	 */
	@Override
	public CommodityEntity findCommodityEntityInfo(String uuid) {
		try {
			commodityMapper.selectByPrimaryKey(uuid);
		} catch (Exception e) {
			throw new ParamsException("根据uuid查询产品信息失败!"+e);
		}
		return commodityMapper.selectByPrimaryKey(uuid);
	}
	/**
	 * 新增下载记录
	 */
	@Override
	public  Integer saveDownloadRecordEntity(DownloadRecordEntity downloadRecordEntity){
		String id = UuidUtil.getUuid36();
		downloadRecordEntity.setCreateTime(new Date());
		downloadRecordEntity.setUuid(id);
		int result = GlobalCodeConstant.BASE_ERROR_CODE;
		try {
			result = downloadRecordMapper.insert(downloadRecordEntity);
		} catch (Exception e) {
			throw new SaveException("新增记录失败"+e);
		}
		return result;
		
	}
	/**
	 * 根据产品Id查询下载记录
	 */
	@Override
	public List<DownloadRecordEntity> findDownloadRecord(DownloadRecordEntity downloadRecordEntity){
		Map<String,Object> param=new HashMap<String,Object>();
		List<DownloadRecordEntity> result = null;
		param.put("commodityId", downloadRecordEntity.getCommodityId());
		result = sqlSession.selectList("com.downloadRecordEntity.search_commodityId_downloadRecordEntity_info", param);
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
	/**
	 * 删除一件产品
	 */
	public Integer deletesCommodity(String[] uuids) {
		List<String> params = MisUtil.arrayTransList(uuids);
		Example example = new Example(CommodityEntity.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andIn("uuid", params);
		return commodityMapper.deleteByCondition(example);
		
	}
	/**
	 * 修改一件产品
	 */
	
	@Override
	public Integer updataCommodity(CommodityEntity commodity) {
		int result =GlobalCodeConstant.UPDATE_ERROR_CODE;
		try {
			result = commodityMapper.updateByPrimaryKeySelective(commodity);
		} catch (Exception e) {
			throw new SaveException("修改产品数据失败" + e);
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
	@Override
	public List<DownloadRecordEntity> downloadRecordEntity(DownloadRecordEntity downloadRecordEntity) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<DownloadRecordEntity> findDownloadRecord(String commodityId) {
		// TODO Auto-generated method stub
		return null;
	}

}
