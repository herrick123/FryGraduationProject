package com.mengma.mis.self.sys.quartz.controller;

import com.mengma.mis.core.util.MisLog;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Job3 implements Job{
	
	private static final Logger log = LoggerFactory.getLogger(Job3.class);
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		MisLog.info(log, "job3");
		
	}
	
}
