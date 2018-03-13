package com.self.sys.quartz.loadTask;

import org.quartz.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

import com.core.util.MisLog;
import com.self.sys.quartz.entity.QuartzEntity;
import com.self.sys.quartz.service.QuartzService;

import java.util.List;

/**
 * 项目启动时，可执行的定时任务启动，按时执行相应的逻辑 
 * @author liuyu
 * @email liuyu@airsecurity.cn
 *
 */
public class loadTask {
	private static final Logger log = LoggerFactory.getLogger(loadTask.class);
	@Autowired  
	private SchedulerFactoryBean schedulerFactoryBean; 
	
	@Autowired
	private QuartzService quartzService;
	
	public void initTask(){
		 try {
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			List<QuartzEntity> list = this.quartzService.findAllJob();
			for (QuartzEntity quartzEntity : list) {
				TriggerKey triggerKey = TriggerKey.triggerKey(quartzEntity.getJobName(), quartzEntity.getJobGroup());
				//获取触发器trigger  
				CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);
				// 根据传入的类名来得到相应的class
				Class quartzClazz = Class.forName(quartzEntity.getClassName());
				//创建任务  
	            JobDetail jobDetail = JobBuilder.newJob(quartzClazz)  
	                    .withIdentity(quartzEntity.getJobName(), quartzEntity.getJobGroup())  
	                    .build();
	            jobDetail.getJobDataMap().put("quartzEntity", quartzEntity);
	            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(quartzEntity.getCronExpression())
	            		.withMisfireHandlingInstructionDoNothing(); 
	            //按新的cronExpression表达式构建一个新的trigger  
	            trigger = TriggerBuilder.newTrigger()  
	                .withIdentity(quartzEntity.getJobName(), quartzEntity.getJobGroup())  
	                .withSchedule(scheduleBuilder)  
	                .build(); 
	            scheduler.scheduleJob(jobDetail, trigger); 
	            if(quartzEntity.getJobStatus().equals("0")){
	            	JobKey jobKey = JobKey.jobKey(quartzEntity.getJobName(), quartzEntity.getJobGroup());  
	            	 scheduler.pauseJob(jobKey);
	            }
			} 
		} catch (Exception e) {
			MisLog.error(log, "定时任务加载出错!",e);
		}
	}
}
