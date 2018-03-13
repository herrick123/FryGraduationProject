package com.self.workCalendar.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.self.workCalendar.entity.WorkCalendar;

public interface WorkCalendarService {
	/**
	 * 查询员工任务
	 * @author dhc
	 * 
	 * */
	public List<WorkCalendar> findWorkCalendarByParams(WorkCalendar workCalendar,Date fristDay,Date lastDay);
	/**
	 * 添加员工任务
	 * 
	 * */
	public Integer addWorkCalendar(WorkCalendar workCalendar);
	/**
	 * 修改员工任务
	 * 
	 * */
	public Integer updateWorkCalendar(WorkCalendar workCalendar);

}
