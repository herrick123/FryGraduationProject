package com.self.training.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.constant.GlobalCodeConstant;
import com.core.exception.BaseException;
import com.core.exception.DeleteException;
import com.core.exception.SaveException;
import com.core.exception.UpdateException;
import com.core.util.Page;
import com.core.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.self.area.dao.AreaMapper;
import com.self.employee.dao.EmployeeMapper;
import com.self.employee.entity.EmployeeEntity;
import com.self.training.dao.TrainingMapper;
import com.self.training.entity.TrainingEntity;
import com.self.training.service.TrainingService;

import tk.mybatis.mapper.entity.Example;
/**
 * 
 * @author donghc
 * 
 * */
@Service("trainingService")
public class TrainingServiceImpl implements TrainingService {
	
	@Autowired
	private TrainingMapper trainingMapper;
	@Autowired
	private EmployeeMapper employeeMapper;
	@Autowired
	private AreaMapper areaMapper;
	@Autowired
	private SqlSessionTemplate sqlSession;
	/**
	 * 分页查询训练营
	 * */
	@Override
	public List<TrainingEntity> findTrainingPage(TrainingEntity train, Page<TrainingEntity> page) {
		Map<String,Object> param=new HashMap<String,Object>();
		if(StringUtils.isNotEmpty(train.getAreaName())){
			param.put("areaName", train.getAreaName());
		}
		if(StringUtils.isNotEmpty(train.getIssue())){
			param.put("issue",train.getIssue());
		}
		PageHelper.startPage(page.getNowPage(),page.getPageSize());
		List<TrainingEntity> result = null;
		try {
			result = sqlSession.selectList("self.training.search_areaName_info", param);
		} catch (Exception e) {
			throw new BaseException("查询训练营信息失败"+e);
		}
			return result;

		
		/**
		 * PageHelper.startPage(page.getNowPage(),page.getPageSize());
		 
		List<TrainingEntity> result=trainingMapper.selectAll();
		return result;*/
		
		
	}
	
	/**
	 * 查询所有训练营
	 */
	@Override
	public List<TrainingEntity> getAllTraining() {
		Example example = new Example(TrainingEntity.class);
		example.setOrderByClause("start_time ASC");
		Example.Criteria criteria = example.createCriteria();
		List<TrainingEntity> result = null;
		try {
			result = trainingMapper.selectAll();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new BaseException("查询所有训练营",e);
		}
		return result;
	}
	
	
	/**
	 * 保存训练营
	 * 
	 * */
	@Override
	public Integer saveTrainingEntity(TrainingEntity train) {
		String id = UuidUtil.getUuid36();
		train.setId(id);
		train.setDel_flag("0");
		int result=GlobalCodeConstant.SAVE_ERROR_CODE;
		try {
			result=trainingMapper.insert(train);
		} catch (Exception e) {
			throw new SaveException("保存数据失败" + e);
		}
		
		return result;
	}
	/**
	 * 修改训练营
	 * 
	 * */
	@Override
	public Integer updateTrainingEntity(TrainingEntity train) {
		int result=GlobalCodeConstant.UPDATE_ERROR_CODE;
		try {
			result=trainingMapper.updateByPrimaryKeySelective(train);
		} catch (Exception e) {
			throw new UpdateException("修改失败"+e);
		}
		return result;
	}
	/**
	 * 根据id查询
	 * 
	 * */
	@Override
	public TrainingEntity findTrainingEntityInfo(String id) {
		TrainingEntity train=null;
		try {
			train=trainingMapper.selectByPrimaryKey(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return train;
	}
	/**
	 * 
	 * 删除多个
	 * 
	 * */
	@Override
	public Integer deleteTrainingEntity(String[] ids) {
		TrainingEntity train=new TrainingEntity();
		int result=GlobalCodeConstant.UPDATE_ERROR_CODE;
		try {
			for (int i = 0; i < ids.length; i++) {
				train.setId(ids[i]);
				train.setDel_flag("1");
				result=trainingMapper.updateByPrimaryKeySelective(train);
			}
		} catch (Exception e) {
			throw new UpdateException("删除失败"+e);
		}
		return result;
	}
	/**
	 * 
	 * 删除单个
	 * 没用到
	 * 
	 * */
	@Override
	public Integer delectOneTrainingEntity(String ids) {
		int result=GlobalCodeConstant.DELETE_ERROR_CODE;
		try {
			result=trainingMapper.deleteByPrimaryKey(ids);
		} catch (Exception e) {
			throw new DeleteException("删除数据失败" + e);
		}
		return result;
	}
	/**
	 * 根据训练营id查询人数
	 * 
	 * */
	@Override
	public List<EmployeeEntity> findEmployeeEntityInfo(EmployeeEntity emp,Page<EmployeeEntity> page) {
			Example example = new Example(EmployeeEntity.class);
			Example.Criteria criteria = example.createCriteria();
			/*if(StringUtils.isNotEmpty(emp.getIssueId())){
				criteria.andLike("issueId",emp.getIssueId());
			}*/
			criteria.andEqualTo("issueId",emp.getIssueId());
			if(StringUtils.isNotEmpty(emp.getEmployeeName())){
				criteria.andLike("employeeName", "%" + emp.getEmployeeName() + "%");
			}
			if(StringUtils.isNotEmpty(emp.getEmployeeCode())){
				criteria.andEqualTo("employeeCode",emp.getEmployeeCode());
			}
			if(StringUtils.isNotEmpty(emp.getMajor())){
				criteria.andLike("major","%" + emp.getMajor() + "%");
			}
			PageHelper.startPage(page.getNowPage(),page.getPageSize());
			List<EmployeeEntity> result = null;
			try {
				result = employeeMapper.selectByCondition(example);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				throw new BaseException("分页查询分区列表出错",e);
			}
			return result;
	}
	/**
	 * 
	 * 根据分区id查询训练营期数是否重复
	 * 
	 * */
	@Override
	public Integer findTrainEntityByParams(Map<String, String> params) {
		Example example = new Example(TrainingEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
		}
		return trainingMapper.selectCountByCondition(example);
	}
	/**
	 * 修改查询是否重复
	 * 
	 * */
	@Override
	public Integer findTrainEntityByParams(Map<String, String> params,Map<String, String> notIn) {
		Example example = new Example(TrainingEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
			
		}
		for (String key:notIn.keySet()) {
			criteria.andNotEqualTo(key, notIn.get(key));
		}
		return trainingMapper.selectCountByCondition(example);
	}
	
	/**
	 * 根据分区的id查询训练营
	 * @author mafei
	 */
	@Override
	public List<TrainingEntity> findTrainingEntityByAreaId(String areaId) {
		// TODO Auto-generated method stub
		Example example = new Example(EmployeeEntity.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("areaId",areaId);
		List<TrainingEntity> result = null;
		try {
			result = trainingMapper.selectByCondition(example);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new BaseException("根据分区的code查询训练营出错",e);
		}
		return result;
	}
	
}
