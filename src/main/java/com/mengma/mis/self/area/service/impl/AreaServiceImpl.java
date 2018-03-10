package com.mengma.mis.self.area.service.impl;

import java.awt.geom.Area;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hslf.record.ExMCIMovie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.mapper.entity.Example;

import com.github.pagehelper.PageHelper;
import com.mengma.mis.core.constant.GlobalCodeConstant;
import com.mengma.mis.core.exception.BaseException;
import com.mengma.mis.core.exception.ParamsException;
import com.mengma.mis.core.exception.SaveException;
import com.mengma.mis.core.exception.UpdateException;
import com.mengma.mis.core.util.MisUtil;
import com.mengma.mis.core.util.Page;
import com.mengma.mis.core.util.UuidUtil;
import com.mengma.mis.self.area.dao.AreaMapper;
import com.mengma.mis.self.area.entity.AreaEntity;
import com.mengma.mis.self.area.service.AreaService;

/**
 * 分区管理列表
 * @author 王子珩
 *
 */

@Service("areaService")
public class AreaServiceImpl implements AreaService {
	@Autowired
	private AreaMapper areaMapper;
	
	/**
	 * 分页查询所有分区列表
	 */
	@Override
	public List<AreaEntity> getAreaList(AreaEntity area, Page<AreaEntity> page) {
		Example example = new Example(AreaEntity.class);
		example.setOrderByClause("start_time");
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("flag", 0);
		if(StringUtils.isNotEmpty(area.getAreaName())){
			criteria.andLike("areaName", "%" + area.getAreaName() + "%");
		}

		PageHelper.startPage(page.getNowPage(),page.getPageSize());
		List<AreaEntity> result = null;
		try {
			result = areaMapper.selectByCondition(example);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new BaseException("分页查询分区列表出错",e);
		}
		return result;
	}
	
	/**
	 * 查询所有分区
	 */
	@Override
	public List<AreaEntity> getAllArea() {
		Example example = new Example(AreaEntity.class);
		example.setOrderByClause("start_time ASC");
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("flag", 0);
		List<AreaEntity> result = null;
		try {
			result = areaMapper.selectByCondition(example);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new BaseException("查询所有分区",e);
		}
		return result;
	}
	
	/**
	 * 增加新建分区
	 */
	@Override
	public Integer saveArea(AreaEntity sarea) {
		String id = UuidUtil.getUuid32();
		sarea.setId(id);
		sarea.setFlag("0");
		sarea.setStartTime(new Timestamp(System.currentTimeMillis()));
		int result = GlobalCodeConstant.BASE_ERROR_CODE;
		try {
			result = areaMapper.insert(sarea);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new SaveException("新增分区失败"+e);
		}
		return result;
	}
	/**
	 * 删除一条分区数据
	 */
	@Override
	public Integer deleteArea(String[] ids) {
		AreaEntity updArea=new AreaEntity();
		int result=GlobalCodeConstant.UPDATE_ERROR_CODE;
		try {
			for (int i = 0; i < ids.length; i++) {
				updArea.setId(ids[i]);
				updArea.setFlag("1");
				result=areaMapper.updateByPrimaryKeySelective(updArea);
			}
		} catch (Exception e) {
			throw new UpdateException("删除失败"+e);
		}
		return result;
	}
	/**
	 * 编辑分区数据
	 */
	@Override
	public Integer updateArea(AreaEntity updArea) {
		int result = GlobalCodeConstant.UPDATE_ERROR_CODE;
		try {
			result = areaMapper.updateByPrimaryKeySelective(updArea);
		} catch (Exception e) {
			throw new SaveException("修改分区数据失败" + e);
		}
		
		return result;
	}
	
	/**
	 * 根据id查询分区数据信息
	 * @param id
	 * @return
	 */
	@Override
	public AreaEntity findAreatEntityInfo(String id) {
		try {
			areaMapper.selectByPrimaryKey(id);
		} catch (Exception e) {
			throw new ParamsException("查询分区数据信息失败!"+e);
		}
		
		return areaMapper.selectByPrimaryKey(id);
	}
	@Override
	public List<AreaEntity> findAreaCode(String areaCode) {
		Example example = new Example(AreaEntity.class);
		Example.Criteria criteria = example.createCriteria();
		if (StringUtils.isNotEmpty(areaCode)) {
			criteria.andLike("areaCode","%"+ areaCode +"%");
		}
		return areaMapper.selectByCondition(example);
	}
	@Override
	public Integer findAreaEntityByParams(Map<String, String> params) {
		Example example = new Example(AreaEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
		}
		return areaMapper.selectCountByCondition(example);
	}
	@Override
	public Integer findAreaEntityByParams(Map<String, String> params,
			Map<String, String> notIn) {
		Example example = new Example(AreaEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
			
		}
		for (String key:notIn.keySet()) {
			criteria.andNotEqualTo(key, notIn.get(key));
		}
		return areaMapper.selectCountByCondition(example);
	}

	
	
	

}
