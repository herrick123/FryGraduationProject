package com.self.sys.application.service.impl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
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
import com.self.sys.application.dao.ApplicationMapper;
import com.self.sys.application.entity.ApplicationEntity;
import com.self.sys.application.service.ApplicationService;

import tk.mybatis.mapper.entity.Example;



@Service("applicationService")
public class ApplicationServiceImpl implements ApplicationService {

	@Autowired
	private ApplicationMapper appMapper;
	
	/**
	 * 分页查询应用数据
	 */
	@Override
	public List<ApplicationEntity> findAppPage(ApplicationEntity app, Page<ApplicationEntity> page) {
		Example example = new Example(ApplicationEntity.class);
		example.setOrderByClause("display_index ASC");
		Example.Criteria criteria = example.createCriteria();
		if (StringUtils.isNotEmpty(app.getAppName())) {
			criteria.andLike("appName", "%" + app.getAppName() + "%");
		}
		String  displayIndex = String.valueOf(app.getDisplayIndex());
		if (StringUtils.isNotEmpty(displayIndex)) {
			criteria.andEqualTo("displayIndex", app.getDisplayIndex());
		}
		PageHelper.startPage(page.getNowPage(), page.getPageSize());
		return appMapper.selectByCondition(example);
	}

	/**
	 * 增加新的应用信息
	 */
	@Override
	public Integer saveApplication(ApplicationEntity app) {
		String id =  UuidUtil.getUuid36();
		app.setId(id);
		app.setAppState(0);
		app.setCreator(id);
		app.setModifier(id);
		app.setCreateTime(new Timestamp(System.currentTimeMillis()));
		app.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		int result = GlobalCodeConstant.SAVE_ERROR_CODE;
		try {
			result = appMapper.insert(app);
		} catch (Exception e) {
			throw new SaveException("添加应用失败" + e);
		}
		return result;
	}

	/**
	 * 查询应用信息
	 */
	@Override
	public ApplicationEntity findAppEntityInfo(String id) {
		try {
			appMapper.selectByPrimaryKey(id);
		} catch (Exception e) {
			throw new ParamsException("查询应用信息失败！" + e);
		}
		return appMapper.selectByPrimaryKey(id);
	}

	/**
	 * 修改应用信息
	 */
	@Override
	public Integer updateApplication(ApplicationEntity app) {
		String id =  UuidUtil.getUuid36();
		app.setModifier(id);
		app.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		int result = GlobalCodeConstant.UPDATE_ERROR_CODE;
		try {
			result = appMapper.updateByPrimaryKeySelective(app);
		} catch (Exception e) {
			throw new UpdateException("修改应用信息失败！" + e);
		}
		return result;
	}

	/**
	 * 批量删除应用信息
	 */
	@Override
	public Integer deleteApplication(String[] ids) {
		List<String> params = MisUtil.arrayTransList(ids);
		Example example = new Example(ApplicationEntity.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andIn("id",params);
		return appMapper.deleteByCondition(example);
	}

	/**
	 * 查询全部应用信息
	 */
	@Override
	public List<ApplicationEntity> selectNames() {
		List<ApplicationEntity> names = null;
		try {
			names = appMapper.selectAll();
		} catch (Exception e) {
			new Exception("查询应用名称失败！");
		}
 		return names;
	}

	/**
	 * 根据传入的条件查询app信息
	 */
	@Override
	public Integer findAppEntityByParams(Map<String, String> params, Map<String, String> notIn) {
		Example example = new Example(ApplicationEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
		}
		for (String key:notIn.keySet()) {
			criteria.andNotEqualTo(key, notIn.get(key));
		}
		return appMapper.selectCountByCondition(example);
	}

	/**
	 * 根据传入的条件查询app信息
	 */
	@Override
	public Integer findAppEntityByParams(Map<String, String> params) {
		Example example = new Example(ApplicationEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
		}
		return appMapper.selectCountByCondition(example);
	}
	/**
	 * 查询所有的应用
	 */
	@Override
	public List<ApplicationEntity> listAllApp() {
		Example example = new Example(ApplicationEntity.class);
		example.setOrderByClause("display_index ASC");
		List<ApplicationEntity> apps = null;
		try {
			apps = appMapper.selectByCondition(example);
		} catch (Exception e) {
			throw new BaseException("查询所有的应用出错",e);
		}
		return apps;
	}
 
}
