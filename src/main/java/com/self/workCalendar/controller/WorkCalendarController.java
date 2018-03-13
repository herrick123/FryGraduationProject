package com.self.workCalendar.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.core.constant.GlobalCodeConstant;
import com.core.util.MisLog;
import com.core.util.TimeUtil;
import com.self.sys.user.entity.UserEntity;
import com.self.sys.user.userVo.UserVo;
import com.self.workCalendar.entity.WorkCalendar;
import com.self.workCalendar.service.WorkCalendarService;
/**
 * 猛码员工工作日历
 * 
 * */
@Controller
@RequestMapping("/calendar")
public class WorkCalendarController {
	private static final Logger log = LoggerFactory.getLogger(WorkCalendar.class);
	private static String EXCEPTION_PAGE = "/exception";// 报错页面
	private static String MODULE_LIST_PAGE = "/empLeave/workCalendar";// 查询列表页面
	
	@Autowired
	private WorkCalendarService workCalendarService;
	
	/**
	 * 根据项目id、员工id查询项目信息
	 * 
	 * */
	@ResponseBody
	@RequestMapping(value = "/page",method = RequestMethod.POST)
	public String pageList(String projectId,String employeeId,String date){
		
		MisLog.info(log, "数据字典数据检验");
		Date now=TimeUtil.toFormatDate(date);
		Date fristDay=TimeUtil.getFristDay(now);
		Date lastDay=TimeUtil.getLastDay(now);
		JSONObject json = JSONObject.parseObject("{}");
		json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		WorkCalendar workCalendar=new WorkCalendar();
		workCalendar.setProjectId(projectId);
		workCalendar.setEmployeeId(employeeId);
		List<WorkCalendar> tastList=workCalendarService.findWorkCalendarByParams(workCalendar,fristDay,lastDay);
		JSONArray jsonArray = new JSONArray();
			
		for (WorkCalendar workCalendar2 : tastList) {
			JSONObject jo = new JSONObject();
			jo.put("id",workCalendar2.getId() );
			jo.put("title", workCalendar2.getTast());
			jo.put("start", workCalendar2.getStime().toString());
			jo.put("end", workCalendar2.getEtime().toString());
			jsonArray.add(jo);
		}
		
		MisLog.info(log,jsonArray.toJSONString());
		
		/*if (!tastList.isEmpty()) {
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
			json.put("info", jsonArray);
		}*/
		return jsonArray.toJSONString();
	}
	/**
	 * 
	 * 添加员工信息
	 * 
	 * */
	@ResponseBody
	@RequestMapping(value = "/save",method = RequestMethod.POST)
	public String addWorkCalendar(WorkCalendar workCalendar,Model model){
		MisLog.info(log,"添加员工信息");
		MisLog.info(log,workCalendar.toString());
		JSONObject json = JSONObject.parseObject("{}");
		json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		try {
			workCalendarService.addWorkCalendar(workCalendar);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
			json.put("info", "添加成功");
			
		} catch (Exception e) {
			json.put("info", "添加失败");
		}
			return json.toJSONString();
	}
	/**
	 * 修改任务信息
	 * */
	@ResponseBody
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public String updateWorkCalendar(WorkCalendar workCalendar,Model model){
		JSONObject json = JSONObject.parseObject("{}");
		try {
			if(workCalendarService.updateWorkCalendar(workCalendar)>0){
				json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
				json.put("info", "修改成功");
				}
		} catch (Exception e) {
				e.printStackTrace();
				return EXCEPTION_PAGE;
		}
			return json.toJSONString();
	}
	/**
	 * 学员登陆查看工作日历
	 * 
	 * */
	@RequestMapping(value="/workCalendar")
	public 	String employeeWork(Model model,HttpServletRequest request){
		UserVo loginUser = (UserVo)request.getSession().getAttribute(GlobalCodeConstant.LOGIN_USER);
		String employeeId=loginUser.getId();
		model.addAttribute("employeeId", employeeId);
		return MODULE_LIST_PAGE;
		
	}
}
