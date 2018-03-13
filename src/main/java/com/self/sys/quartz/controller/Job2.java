package com.self.sys.quartz.controller;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.core.util.MisLog;

public class Job2 implements Job{
	
	private static final Logger log = LoggerFactory.getLogger(Job2.class);
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		MisLog.info(log, "job2");
		
	}
	
}
