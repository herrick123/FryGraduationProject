package com.self.sys.quartz.service;


import java.util.List;
import java.util.Map;

import com.core.util.Page;
import com.self.sys.quartz.entity.QuartzEntity;

public interface QuartzService {
	
	Integer addJob(QuartzEntity quartzEntity);

	Integer updateJob(QuartzEntity quartzEntity);

	Integer updateJobState(String string, QuartzEntity quartzEntity);

	List<QuartzEntity> findQuartzList(QuartzEntity quartzEntity, Page<QuartzEntity> page);

	QuartzEntity findQuartzById(String id);

	Integer deleteJob(QuartzEntity quartzEntity);

	public List<QuartzEntity> findAllJob();

	Integer findQuartzEntityByParams(Map<String, String> params);

	public Integer findQuartzEntityByParams(Map<String, String> params, Map<String, String> notIn);

	/**
	 * 根据传入的条件查询user对象
	 * @param params 查询条件是键值相等
	 * @param notEqual	查询条件是键值不等
	 * @return
	 */
	public Integer findQuartzEntityByAnd(Map<String, String> params, Map<String, String> notEqual);
	
}
