package com.self.sys.log.service;

import java.util.List;

import com.core.util.Page;
import com.self.sys.log.entity.LogEntity;

public interface LogService {
	
	/**
	 * 保存日志
	 * @param userEntity
	 */
	public void addLog(LogEntity logEntity);
	
	/**
	 * 分页显示所有日志
	 * @param role 
	 * @param page
	 * @return
	 */
	public List<LogEntity> findLogPage(LogEntity log, Page<LogEntity> page);
}