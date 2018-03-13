package com.self.sys.leave.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.core.util.MisLog;
import com.core.util.Page;
import com.github.pagehelper.PageInfo;
import com.self.sys.leave.service.EmployeeLeaveService;
import com.self.sys.leave.vo.EmployeeLeaveVo;
import com.self.training.entity.TrainingEntity;

/**
 * 项目期间请假成员Controller
 * @author dhc
 * 
 * */
@Controller
@RequestMapping("/empLeave")
public class EmployeeLeaveController {
	
	private static final Logger log = LoggerFactory.getLogger(EmployeeLeaveController.class);
	private static String MODULE_LIST_PAGE = "/workCalendar/workCalendarList";// 查询列表页面
	@Autowired
	private EmployeeLeaveService employeeLeaveService;
	
	/**
	 * 展示员工列表数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "/workCalendar")
	public String employeePage(String id,String projectId,Model model) {
		model.addAttribute("employeeId", id);
		model.addAttribute("projectId", projectId);
		return MODULE_LIST_PAGE;
	}
	/**
	 * 展示列表
	 * 
	 * */
	@ResponseBody
	@RequestMapping(value="/pageList",method=RequestMethod.POST)
	public String employeeLeavePage(Model model,String gridPager){
		MisLog.info(log, "查询训练营分页数据！");
		JSONObject json=JSONObject.parseObject(gridPager);
		JSONObject empjson = json.getJSONObject("parameters");
		MisLog.info(log, json.toJSONString());
		Page<EmployeeLeaveVo> page=JSONObject.toJavaObject(json,Page.class);
		EmployeeLeaveVo employeeLeaveVo=JSONObject.toJavaObject(empjson, EmployeeLeaveVo.class);
		List<EmployeeLeaveVo> empLeaveList=this.employeeLeaveService.findEmployeeLeave(employeeLeaveVo, page);
		PageInfo<EmployeeLeaveVo> pageInfo = new PageInfo<EmployeeLeaveVo>(empLeaveList);
		page = new Page<EmployeeLeaveVo>(pageInfo);
		String result = JSONObject.toJSONString(page);
		MisLog.info(log, result);
		MisLog.info(log, "查询结束");
		return result;
	}
}