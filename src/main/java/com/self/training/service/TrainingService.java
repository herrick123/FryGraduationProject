package com.self.training.service;

import java.util.List;
import java.util.Map;

import com.core.util.Page;
import com.self.employee.entity.EmployeeEntity;
import com.self.training.entity.TrainingEntity;

public interface TrainingService {
	/**
	 * 分页查询
	 * @param train
	 * @param page
	 * @return
	 * */
	public List<TrainingEntity> findTrainingPage(TrainingEntity train, Page<TrainingEntity> page);
	
	/**
	 * 查询所有训练营
	 * @return
	 */
	public List<TrainingEntity> getAllTraining();
	
	/**
	 * 添加训练营
	 * @param train
	 * @ruturn
	 * */
	public Integer saveTrainingEntity(TrainingEntity train);
	/**
	 * 更新训练营
	 * @param train
	 * @return
	 * */
	public Integer updateTrainingEntity(TrainingEntity train);
	/**
	 * 查询训练营
	 * @param id
	 * @return
	 * */
	public TrainingEntity findTrainingEntityInfo(String id);
	/**
	 * 根据分区的code查询训练营
	 * @param id
	 * @return
	 * */
	public List<TrainingEntity> findTrainingEntityByAreaId(String areaId);
	/**
	 * 删除多个用户
	 * @param ids
	 * @return
	 * */
	public Integer deleteTrainingEntity(String[] ids);
	/**
	 * 删除单个
	 * @param ids
	 * @return
	 * */
	public Integer delectOneTrainingEntity(String ids);
	/**
	 * 查询训练营成员
	 * @param student
	 * @return
	 * */
	public List<EmployeeEntity> findEmployeeEntityInfo(EmployeeEntity emp,Page<EmployeeEntity> page);
	/**
	 * 根据传入的条件查询训练营分类信息
	 * @param params
	 * @param notIn
	 * @return
	 */
	public Integer findTrainEntityByParams(Map<String, String> params,Map<String, String> notIn);
	
	public Integer findTrainEntityByParams(Map<String, String> params);
}
