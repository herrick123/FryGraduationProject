package com.self.sys.quartz.service.impl;

import com.core.constant.GlobalCodeConstant;
import com.core.exception.BaseException;
import com.core.exception.DeleteException;
import com.core.exception.SaveException;
import com.core.exception.UpdateException;
import com.core.util.Page;
import com.core.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.self.sys.quartz.dao.QuartzMapper;
import com.self.sys.quartz.entity.QuartzEntity;
import com.self.sys.quartz.service.QuartzService;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

/**
 * 定时任务
 * @author liuyu
 *
 */
@Service("quartzService")
public class QuartzServiceImpl implements QuartzService {
	
	@Autowired
	private QuartzMapper quartzMapper;
	
	/**
	 * 添加任务信息到数据库
	 */
	@Override
	public Integer addJob(QuartzEntity quartzEntity) {
		String id = UuidUtil.getUuid36();
		quartzEntity.setId(id);
		quartzEntity.setJobStatus("1");
		quartzEntity.setCreateTime(new Timestamp(System.currentTimeMillis()));
		quartzEntity.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		Integer result = GlobalCodeConstant.BASE_SUCCESS_CODE;
		try {
			result = quartzMapper.insertSelective(quartzEntity);
		} catch (Exception e) {
			result = GlobalCodeConstant.BASE_ERROR_CODE;
			throw new SaveException("保存任务出错"+e);
		}
		return result;
	}
	
	/**
	 * 修改任务信息到数据库
	 */
	@Override
	public Integer updateJob(QuartzEntity quartzEntity) {
		quartzEntity.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		Integer result = GlobalCodeConstant.BASE_SUCCESS_CODE;
		try {
			result = quartzMapper.updateByPrimaryKeySelective(quartzEntity);
		} catch (Exception e) {
			result = GlobalCodeConstant.BASE_ERROR_CODE;
			throw new UpdateException("修改任务出错"+e);
		}
		return result;
	}
	
	/**
	 * 进行暂停、恢复操作时 修改任务状态
	 */
	@Override
	public Integer updateJobState(String state,QuartzEntity quartzEntity) {
		if("暂停".equals(state)){
			quartzEntity.setJobStatus("0");
		}
		else if("恢复".equals(state)){
			quartzEntity.setJobStatus("1");
		}
		int result = GlobalCodeConstant.BASE_SUCCESS_CODE;
		try {
			result = quartzMapper.updateByPrimaryKeySelective(quartzEntity);
		} catch (Exception e) {
			result = GlobalCodeConstant.BASE_ERROR_CODE;
			throw new UpdateException("修改任务状态出错"+e);
		}
		return result;
	}
	
	/**
	 * 分页查询所有定时任务
	 */
	@Override
	public List<QuartzEntity> findQuartzList(QuartzEntity quartzEntity, Page<QuartzEntity> page) {
		Example example = new Example(QuartzEntity.class);
		Example.Criteria criteria = example.createCriteria();
		if (StringUtils.isNotEmpty(quartzEntity.getJobName())) {
			criteria.andLike("jobName", "%" + quartzEntity.getJobName() + "%");
		}
		PageHelper.startPage(page.getNowPage(), page.getPageSize());
		example.setOrderByClause("update_time desc");
		List<QuartzEntity> quartzList = null;
		try {
			quartzList = quartzMapper.selectByCondition(example);
		} catch (Exception e) {
			throw new BaseException("分页查询任务出错"+e);
		}
		return quartzList;
	}
	
	/**
	 * 查询单个定时任务
	 */
	@Override
	public QuartzEntity findQuartzById(String id) {
		QuartzEntity quartzEntity = null;
		try {
			quartzEntity = quartzMapper.selectByPrimaryKey(id);
		} catch (Exception e) {
			throw new BaseException("查询单个任务出错"+e);
		}
		return quartzEntity;
	}
	
	/**
	 * 删除定时任务
	 */
	@Override
	public Integer deleteJob(QuartzEntity quartzEntity) {
		int result = GlobalCodeConstant.BASE_SUCCESS_CODE;
		try {
			result = quartzMapper.deleteByPrimaryKey(quartzEntity);
		} catch (Exception e) {
			throw new DeleteException("删除任务出错"+e);
		}
		return result;
	}
	
	/**
	 * 查询所有的定时任务
	 */
	@Override
	public List<QuartzEntity> findAllJob() {
		List<QuartzEntity> quartzList = null;
		try {
			quartzList = quartzMapper.selectAll();
		} catch (Exception e) {
			throw new BaseException("查询所有任务出错"+e);
		}
		return quartzList;
	}

	/**
	 * 通过传入的参数查询用户
	 * 参数params以map形式传入，每一个条件用and连接
	 * 返回值是查询到数据的数量
	 */
	@Override
	public Integer findQuartzEntityByParams(Map<String, String> params) {
		Example example = new Example(QuartzEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for(String key:params.keySet()){
			criteria.andEqualTo(key, params.get(key));
		}
		try {
			return quartzMapper.selectCountByCondition(example);
		} catch (Exception e) {
			throw new BaseException("根据 Map<String, String> params查询对象出错"+e);
		}
	}
	
	/**
	 * 通过传入的参数查询用户
	 * 参数params以map形式传入，每一个条件用and连接
	 * 返回值是查询到数据的数量
	 */
	@Override
	public Integer findQuartzEntityByParams(Map<String, String> params, Map<String, String> notIn) {
		Example example = new Example(QuartzEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
			
		}
		for (String key:notIn.keySet()) {
			criteria.andNotEqualTo(key, notIn.get(key));
		}
		return quartzMapper.selectCountByCondition(example);
	}

	@Override
	public Integer findQuartzEntityByAnd(Map<String, String> params, Map<String, String> notEqual) {
		Example example = new Example(QuartzEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for(String key:params.keySet()){
			criteria.andEqualTo(key, params.get(key));
		}
		for(String key:notEqual.keySet()){
			criteria.andNotEqualTo(key, notEqual.get(key));
		}
		try {
			return quartzMapper.selectCountByCondition(example);
		} catch (Exception e) {
			throw new BaseException("验证查询定时任务出错"+e);
		}
	}
}
