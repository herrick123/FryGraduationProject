package com.self.workCalendar.service.Impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.constant.GlobalCodeConstant;
import com.core.exception.BaseException;
import com.core.exception.UpdateException;
import com.core.util.MisLog;
import com.core.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.self.training.entity.TrainingEntity;
import com.self.workCalendar.dao.WorkCalendarMapper;
import com.self.workCalendar.entity.WorkCalendar;
import com.self.workCalendar.service.WorkCalendarService;

import tk.mybatis.mapper.entity.Example;
/**
 * 查询员工任务
 * @author dhc
 * 
 * */
@Service("workCalendarService")
public class WorkCalendarServiceImpl implements WorkCalendarService{
	
	@Autowired
	private WorkCalendarMapper workCalendarMapper;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 按项目id，员工id查询任务信息
	 * 
	 * */
	@Override
	public List<WorkCalendar> findWorkCalendarByParams(WorkCalendar workCalendar,Date fristDay,Date lastDay) {
		Map<String,Object> param=new HashMap<String,Object>();
		param.put("projectId", workCalendar.getProjectId());
		param.put("employeeId", workCalendar.getEmployeeId());
		param.put("fristDay", fristDay);
		param.put("lastDay", lastDay);
		List<WorkCalendar> result = null;
		try {
			result = sqlSession.selectList("self.workCalendar.search_tast_project_info", param);
		} catch (Exception e) {
			throw new BaseException("查询任务信息失败"+e);
		}
			return result;
	}
	/**
	 * 
	 * 添加任务信息
	 * 
	 * */
	@Override
	public Integer addWorkCalendar(WorkCalendar workCalendar) {
		String id = UuidUtil.getUuid36();
		workCalendar.setId(id);
		int result=GlobalCodeConstant.SAVE_ERROR_CODE;
		try {
			result=workCalendarMapper.insert(workCalendar);
		} catch (Exception e) {
			throw new BaseException("添加任务信息失败"+e);
		}
		return result;
	}
	/**
	 * 
	 * 修改任务信息
	 * */
	@Override
	public Integer updateWorkCalendar(WorkCalendar workCalendar) {
		int result=GlobalCodeConstant.UPDATE_ERROR_CODE;
		try {
			result=workCalendarMapper.updateByPrimaryKeySelective(workCalendar);
		} catch (Exception e) {
			throw new UpdateException("修改失败"+e);
		}
		return result;
	}
	
	
}