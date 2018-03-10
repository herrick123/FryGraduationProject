package com.mengma.mis.self.sys.quartz.controller;


import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.mengma.mis.core.constant.GlobalCodeConstant;
import com.mengma.mis.core.util.MisLog;
import com.mengma.mis.core.util.Page;
import com.mengma.mis.self.sys.quartz.entity.QuartzEntity;
import com.mengma.mis.self.sys.quartz.service.QuartzService;
import org.quartz.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 定时任务controller
 * 
 * @author liuyu
 * @version 1.0
 * @email liuyu@airsecurity.cn
 */
@Controller
@RequestMapping("/quartz")
public class QuartzController {
	private static final Logger log = LoggerFactory.getLogger(QuartzController.class);
	private static String QUARTZ_LIST_PAGE = "/sys/quartz/quartzList";// 定时任务列表页面
	private static String QUARTZ_ADD_PAGE = "/sys/quartz/addQuartz";// 新增定时任务列表
	private static String QUARTZ_EDIT_PAGE = "/sys/quartz/editQuartz";// 修改定时任务

	@Autowired
	private SchedulerFactoryBean schedulerFactoryBean;

	@Autowired
	private QuartzService quartzService;


	/**
	 * 返回定时任务列表页面
	 * 
	 * @return
	 */
	@RequestMapping("/page")
	public String listAll() {
		return QUARTZ_LIST_PAGE;
	}

	/**
	 * 展示所有定时任务
	 */
	@RequestMapping(value = "/quartzList", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	@SuppressWarnings("unchecked")
	public String getMapList(Model model, String gridPager) {
		MisLog.info(log, "获取定时任务列表");
		JSONObject json = JSONObject.parseObject(gridPager);
		JSONObject mapJson = json.getJSONObject("parameters");
		Page<QuartzEntity> page = JSONObject.toJavaObject(json, Page.class);
		QuartzEntity quartzEntity = JSONObject.toJavaObject(mapJson, QuartzEntity.class);
		List<QuartzEntity> quartzList = this.quartzService.findQuartzList(quartzEntity, page);
		PageInfo<QuartzEntity> pageInfo = new PageInfo<QuartzEntity>(quartzList);
		page = new Page<QuartzEntity>(pageInfo);
		return JSONObject.toJSONString(page);
	}

	/**
	 * 新增定时任务
	 * 
	 * @return
	 */
	@RequestMapping(value = "/add", method = { RequestMethod.POST, RequestMethod.GET })
	public String addQuartz() {
		MisLog.info(log, "新增定时任务！");
		return QUARTZ_ADD_PAGE;
	}

	/**
	 * 编辑定时任务
	 * 
	 * @return
	 */
	@RequestMapping(value = "/edit/{id}", method = { RequestMethod.POST, RequestMethod.GET })
	public String editQuartz(Model model, @PathVariable("id") String id) {
		MisLog.info(log, "根据id查询定时任务！");
		QuartzEntity quartzEntity = null;
		//UserEntity user = null;
		try {
			quartzEntity = this.quartzService.findQuartzById(id);
			//user = this.userService.findUserEntityInfo(quartzEntity.getCreateId());
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(), e);
			model.addAttribute("error", "根据id查询定时任务！");
			return "/exception";
		}
		model.addAttribute("quartzEntity", quartzEntity);
		//model.addAttribute("userName", user.getUserName());
		return QUARTZ_EDIT_PAGE;
	}

	/**
	 * 任务创建
	 * 
	 * @param QuartzEntity
	 * @return
	 */
	@RequestMapping(value = "/save", method = { RequestMethod.POST, RequestMethod.GET })
	public String saveQuartz(@ModelAttribute("quartzEntity") QuartzEntity quartzEntity,Model model) {
		MisLog.info(log, "创建定时任务!");
		try {
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			if (null != quartzEntity) {
				// 获取触发器标识
				TriggerKey triggerKey = TriggerKey.triggerKey(quartzEntity.getJobName(), quartzEntity.getJobGroup());
				// 获取触发器trigger
				CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);
				// 根据传入的类名来得到相应的class
				Class quartzClazz = Class.forName(quartzEntity.getClassName());
				// 创建任务
				JobDetail jobDetail = JobBuilder.newJob(quartzClazz)
						.withIdentity(quartzEntity.getJobName(), quartzEntity.getJobGroup()).build();
				jobDetail.getJobDataMap().put("quartzEntity", quartzEntity);
				// 时间表达式调度构建器
				String cronExpression = "";
				//任务执行方案
				String scheme = "";
				if (String.valueOf(GlobalCodeConstant.EACH_MONTH_CODE).equals(quartzEntity.getCronType())) {// 每月第几号几时
					scheme = "每月" + quartzEntity.getDay() + "日" + quartzEntity.getHour() + "时" 
				+ quartzEntity.getMinute() + "分" + quartzEntity.getSecond() + "秒执行";
					cronExpression = quartzEntity.getSecond() + ' ' + quartzEntity.getMinute() + ' ' + 
							quartzEntity.getHour() + ' ' + quartzEntity.getDay() + " * ?";
					quartzEntity.setMonth("* ");
					quartzEntity.setYear("?");
				} else if (String.valueOf(GlobalCodeConstant.EACH_WEEK_CODE).equals(quartzEntity.getCronType())) {// 每周星期几几时
					String weekArray[] = {"星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
					scheme = "每周" + weekArray[Integer.valueOf(quartzEntity.getDay()) -1] + 
							quartzEntity.getHour() + "时" + quartzEntity.getMinute() + "分" + quartzEntity.getSecond() + "秒执行";
					cronExpression = quartzEntity.getSecond()+ ' ' + quartzEntity.getMinute() + ' ' + 
							quartzEntity.getHour() + " ? * " + quartzEntity.getDay();
					quartzEntity.setMonth("* ");
					quartzEntity.setDay("? ");
					quartzEntity.setMonth("*");
					quartzEntity.setYear("*");
				} else if (String.valueOf(GlobalCodeConstant.EACH_DAY_CODE).equals(quartzEntity.getCronType())) {// 每天几时
					scheme = "每天" + quartzEntity.getHour() + "时" + quartzEntity.getMinute() + "分" 
				+ quartzEntity.getSecond() + "秒执行";
					cronExpression = quartzEntity.getSecond()+ ' ' + quartzEntity.getMinute() + ' ' + 
							quartzEntity.getHour() + " * * ?";
					quartzEntity.setDay("* ");
					quartzEntity.setMonth("* ");
					quartzEntity.setYear("?");
				} else if (String.valueOf(GlobalCodeConstant.EACH_HOUR_CODE).equals(quartzEntity.getCronType())) {// 每隔几个小时
					scheme = "每隔" + quartzEntity.getHour() + "小时执行";
					cronExpression = "0 0 0/" + quartzEntity.getHour() + " * * ?";
					quartzEntity.setSecond("0 ");
					quartzEntity.setMinute("0 ");
					quartzEntity.setHour(quartzEntity.getHour());
					quartzEntity.setDay("* ");
					quartzEntity.setMonth("* ");
					quartzEntity.setYear("?");
				} else if (String.valueOf(GlobalCodeConstant.EACH_MINUTE_CODE).equals(quartzEntity.getCronType())) {// 每隔几分钟
					scheme = "每隔" + quartzEntity.getMinute() + "分钟执行";
					cronExpression = "0 0/" + quartzEntity.getMinute() + " * * * ?";
					quartzEntity.setSecond("0 ");
					quartzEntity.setHour("* ");
					quartzEntity.setDay("* ");
					quartzEntity.setMonth("* ");
					quartzEntity.setYear("?");
				} else if (String.valueOf(GlobalCodeConstant.EACH_SECOND_CODE).equals(quartzEntity.getCronType())) {// 每隔几秒
					scheme = "每隔" + quartzEntity.getSecond() + "秒执行";
					cronExpression = "0/" + quartzEntity.getSecond() + " * * * * ?";
					quartzEntity.setSecond(quartzEntity.getSecond());
					quartzEntity.setMinute("* ");
					quartzEntity.setHour("* ");
					quartzEntity.setDay("* ");
					quartzEntity.setMonth("* ");
					quartzEntity.setYear("?");
				} else {
					scheme = quartzEntity.getYear() + "年" + quartzEntity.getMonth() + "月" + quartzEntity.getDay() 
					+ "日" + quartzEntity.getHour() + "时" + quartzEntity.getMinute() + "分" 
							+ quartzEntity.getSecond() + "秒执行";
					cronExpression = quartzEntity.getSecond() + " " + quartzEntity.getMinute() + " ";
					cronExpression += quartzEntity.getHour() + " ";
					cronExpression += quartzEntity.getDay() + " ";
					cronExpression += quartzEntity.getMonth() + " ? " + quartzEntity.getYear();
				}
				CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(cronExpression);
				// 按新的cronExpression表达式构建一个新的trigger
				trigger = TriggerBuilder.newTrigger()
						.withIdentity(quartzEntity.getJobName(), quartzEntity.getJobGroup())
						.withSchedule(scheduleBuilder).build();

				scheduler.scheduleJob(jobDetail, trigger);
				
				// 把任务插入数据库
				quartzEntity.setScheme(scheme);
				quartzEntity.setCronExpression(cronExpression);
				int result = quartzService.addJob(quartzEntity);
				if (result > 0) {
					MisLog.info(log, "定时任务信息添加成功");
				} else {
					MisLog.error(log, "定时任务信息添加失败");
				}
			}
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(), e);
			model.addAttribute("error", "添加定时任务出错！");
			return "/exception";
		}
		return "redirect:/quartz/page";
	}

	/**
	 * 任务更新
	 * 
	 * @param QuartzEntity
	 * @return
	 */
	@RequestMapping(value = "/update", method = { RequestMethod.POST, RequestMethod.GET })
	public String updateQuartz(@ModelAttribute("quartzEntity") QuartzEntity quartzEntity,Model model) {
		MisLog.info(log, "修改定时任务!");
		try {
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			if (null != quartzEntity) {
				// 获取触发器标识
				TriggerKey triggerKey = TriggerKey.triggerKey(quartzEntity.getJobName(), quartzEntity.getJobGroup());
				// 获取触发器trigger
				CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);
				// Trigger已存在，那么更新相应的定时设置
				// 表达式调度构建器
				String cronExpression = "";

				String scheme = "";
				if (String.valueOf(GlobalCodeConstant.EACH_MONTH_CODE).equals(quartzEntity.getCronType())) {// 每月第几号几时
					scheme = "每月" + quartzEntity.getDay() + "日" + quartzEntity.getHour() + "时" 
				+ quartzEntity.getMinute() + "分" + quartzEntity.getSecond() + "秒执行";
					cronExpression = quartzEntity.getSecond() + ' ' + quartzEntity.getMinute() + ' ' + 
							quartzEntity.getHour() + ' ' + quartzEntity.getDay() + " * ?";
					quartzEntity.setMonth("* ");
					quartzEntity.setYear("?");
				} else if (String.valueOf(GlobalCodeConstant.EACH_WEEK_CODE).equals(quartzEntity.getCronType())) {// 每周星期几几时
					String weekArray[] = {"星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
					scheme = "每周" + weekArray[Integer.valueOf(quartzEntity.getDay()) -1] + 
							quartzEntity.getHour() + "时" + quartzEntity.getMinute() + "分" + quartzEntity.getSecond() + "秒执行";
					cronExpression = quartzEntity.getSecond()+ ' ' + quartzEntity.getMinute() + ' ' + 
							quartzEntity.getHour() + " ? * " + quartzEntity.getDay();
					quartzEntity.setMonth("* ");
					quartzEntity.setDay("? ");
					quartzEntity.setMonth("*");
					quartzEntity.setYear("*");
				} else if (String.valueOf(GlobalCodeConstant.EACH_DAY_CODE).equals(quartzEntity.getCronType())) {// 每天几时
					scheme = "每天" + quartzEntity.getHour() + "时" + quartzEntity.getMinute() + "分" 
				+ quartzEntity.getSecond() + "秒执行";
					cronExpression = quartzEntity.getSecond()+ ' ' + quartzEntity.getMinute() + ' ' + 
							quartzEntity.getHour() + " * * ?";
					quartzEntity.setDay("* ");
					quartzEntity.setMonth("* ");
					quartzEntity.setYear("?");
				} else if (String.valueOf(GlobalCodeConstant.EACH_HOUR_CODE).equals(quartzEntity.getCronType())) {// 每隔几个小时
					scheme = "每隔" + quartzEntity.getHour() + "小时执行";
					cronExpression = "0 0 0/" + quartzEntity.getHour() + " * * ?";
					quartzEntity.setSecond("0 ");
					quartzEntity.setMinute("0 ");
					quartzEntity.setHour(quartzEntity.getHour());
					quartzEntity.setDay("* ");
					quartzEntity.setMonth("* ");
					quartzEntity.setYear("?");
				} else if (String.valueOf(GlobalCodeConstant.EACH_MINUTE_CODE).equals(quartzEntity.getCronType())) {// 每隔几分钟
					scheme = "每隔" + quartzEntity.getMinute() + "分钟执行";
					cronExpression = "0 0/" + quartzEntity.getMinute() + " * * * ?";
					quartzEntity.setSecond("0 ");
					quartzEntity.setHour("* ");
					quartzEntity.setDay("* ");
					quartzEntity.setMonth("* ");
					quartzEntity.setYear("?");
				} else if (String.valueOf(GlobalCodeConstant.EACH_SECOND_CODE).equals(quartzEntity.getCronType())) {// 每隔几秒
					scheme = "每隔" + quartzEntity.getSecond() + "秒执行";
					cronExpression = "0/" + quartzEntity.getSecond() + " * * * * ?";
					quartzEntity.setSecond(quartzEntity.getSecond());
					quartzEntity.setMinute("* ");
					quartzEntity.setHour("* ");
					quartzEntity.setDay("* ");
					quartzEntity.setMonth("* ");
					quartzEntity.setYear("?");
				} else {
					scheme = quartzEntity.getYear() + "年" + quartzEntity.getMonth() + "月" + quartzEntity.getDay() 
					+ "日" + quartzEntity.getHour() + "时" + quartzEntity.getMinute() + "分" 
							+ quartzEntity.getSecond() + "秒执行";
					cronExpression = quartzEntity.getSecond() + " " + quartzEntity.getMinute() + " " 
					+ quartzEntity.getHour() + " " +quartzEntity.getDay() + " " +quartzEntity.getMonth() 
					+ " ? " + quartzEntity.getYear();
				}
				// withMisfireHandlingInstructionDoNothing()方法
				// 1，不触发立即执行
				// 2，等待下次cronExpression触发频率到达时刻开始按照cronExpression频率依次执行
				CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(cronExpression)
						.withMisfireHandlingInstructionDoNothing();
				// 按新的cronExpression表达式重新构建trigger
				trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();
				// 按新的trigger重新设置job执行
				scheduler.rescheduleJob(triggerKey, trigger);
				// 修改后的定时任务会立即执行
				// 如果之前储存的定时任务是停止状态的就改为停止的
				if ("0".equals(quartzEntity.getJobStatus())) {
					JobKey jobKey = JobKey.jobKey(quartzEntity.getJobName(), quartzEntity.getJobGroup());
					scheduler.pauseJob(jobKey);
				}
				// 更新数据库中的任务
				quartzEntity.setScheme(scheme);
				quartzEntity.setCronExpression(cronExpression);
				int result = quartzService.updateJob(quartzEntity);
				if (result > 0) {
					MisLog.info(log, "定时任务信息修改成功");
				} else {
					MisLog.error(log, "定时任务信息修改失败");
				}
			}
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(), e);
			model.addAttribute("error", "修改定时任务出错！");
			return "/exception";
		}
		return "redirect:/quartz/page";
	}

	/**
	 * 暂停任务
	 * 
	 * @param QuartzEntity
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/pause", method = { RequestMethod.POST, RequestMethod.GET })
	public String pauseQuartz(String id) {
		JSONObject json = JSONObject.parseObject("{}");
		QuartzEntity quartzEntity = this.quartzService.findQuartzById(id);
		MisLog.info(log, "暂停定时任务!");
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		JobKey jobKey = JobKey.jobKey(quartzEntity.getJobName(), quartzEntity.getJobGroup());
		try {
			scheduler.pauseJob(jobKey);
			quartzService.updateJobState("暂停", quartzEntity);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		} catch (Exception e) {
			MisLog.error(log, "暂停任务出错!", e);
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}

	/**
	 * 恢复任务
	 * 
	 * @param QuartzEntity
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/resume", method = { RequestMethod.POST, RequestMethod.GET })
	public String resumeQuartz(String id) {
		JSONObject json = JSONObject.parseObject("{}");
		QuartzEntity quartzEntity = this.quartzService.findQuartzById(id);
		MisLog.info(log, "恢复定时任务!");
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		JobKey jobKey = JobKey.jobKey(quartzEntity.getJobName(), quartzEntity.getJobGroup());
		try {
			scheduler.resumeJob(jobKey);
			quartzService.updateJobState("恢复", quartzEntity);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		} catch (Exception e) {
			MisLog.error(log, "恢复任务出错!", e);
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}

	/**
	 * 删除定时任务
	 * 
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/delete", method = { RequestMethod.POST, RequestMethod.GET })
	public String deleteQuartz(String[] ids) {
		JSONObject json = JSONObject.parseObject("{}");
		for (int i = 0; i < ids.length; i++) {
			QuartzEntity quartzEntity = this.quartzService.findQuartzById(ids[i]);
			MisLog.info(log, "删除定时任务!");
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			JobKey jobKey = JobKey.jobKey(quartzEntity.getJobName(), quartzEntity.getJobGroup());
			try {
				scheduler.deleteJob(jobKey);
				quartzService.deleteJob(quartzEntity);
				json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
			} catch (Exception e) {
				MisLog.error(log, "删除任务出错!", e);
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
			}
		}
		return json.toJSONString();
	}

	/**
	 * check新增定时任务
	 * 
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public String checkjobName(String jobName,String className,String id) {
		MisLog.info(log, "检测任务名任务全类名!");
		JSONObject json = JSONObject.parseObject("{}");
		json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		Map<String, String> params = new HashMap<String, String>();
		if (jobName != null && id == null) {
			params.put("jobName", jobName);
			if (quartzService.findQuartzEntityByParams(params) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "任务名已存在");
			}
		}
		if (className != null && id == null) {
			params.put("className", className);
			if (quartzService.findQuartzEntityByParams(params) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "任务全类名已存在");
			}
		}
		if(jobName != null && id != null ){
			params.put("jobName",jobName);
			Map<String, String> notEqual = new HashMap<>();
			notEqual.put("id", id);
			if(quartzService.findQuartzEntityByAnd(params, notEqual)>0){
				json.put("returncode",GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "更改后的任务名已存在");
			}
		}
		if(className != null && id != null ){
			params.put("className",className);
			Map<String, String> notEqual = new HashMap<>();
			notEqual.put("id", id);
			if(quartzService.findQuartzEntityByAnd(params, notEqual)>0){
				json.put("returncode",GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "更改后的任务全类名已存在");
			}
		}
		return json.toJSONString();
	}
}
