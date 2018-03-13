package com.self.sys.application.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.core.constant.GlobalCodeConstant;
import com.core.util.MisLog;
import com.core.util.Page;
import com.github.pagehelper.PageInfo;
import com.self.sys.application.entity.ApplicationEntity;
import com.self.sys.application.service.ApplicationService;
import com.self.sys.module.service.ModuleService;

/**
 * 应用管理controller
 * @author lip
 * @version 1.0
 * @email 1635335126@qq.com
 */
@Controller
@RequestMapping("/application")
public class ApplicationController {
	
	private static final Logger log = LoggerFactory.getLogger(ApplicationController.class);
	
	private static String APP_LIST_PAGE = "/sys/application/appList";//应用列表页面
	private static String APP_ADD_PAGE = "/sys/application/addApp";//新增应用页面
	private static String APP_EDIT_PAGE = "/sys/application/editApp";//编辑应用页面
	
	@Autowired
	private ApplicationService appService;
	@Autowired
	private ModuleService moduleService;
	/**
	 * 展现应用列表数据
	 * @return
	 */
	@RequestMapping(value="/page")
	public String appPage(){
		MisLog.info(log, "展现应用列表数据！");
		return APP_LIST_PAGE;
	}
	
	/**
	 * 分页查询应用数据
	 * @param model
	 * @param gridPager
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/pageList",method = RequestMethod.POST)
	@SuppressWarnings("unchecked")
	public String findAppPageList(Model model,String gridPager){
		MisLog.info(log, "查询应用分页数据！");
		JSONObject json = JSONObject.parseObject(gridPager);
		JSONObject appJson = json.getJSONObject("parameters");
		MisLog.info(log, appJson.toJSONString());
		Page<ApplicationEntity> page = JSONObject.toJavaObject(json, Page.class);
		ApplicationEntity app = JSONObject.toJavaObject(appJson, ApplicationEntity.class);
		List<ApplicationEntity> appList = this.appService.findAppPage(app, page);
		PageInfo<ApplicationEntity> pageInfo = new PageInfo<ApplicationEntity>(appList);
		page = new Page<ApplicationEntity>(pageInfo);
		return JSONObject.toJSONString(page);
	}
	
	/**
	 * 新增应用
	 * @return
	 */
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public String addApp(){
		MisLog.info(log, "新增应用数据！");
		return APP_ADD_PAGE;
	}
	
	/**
	 * 存储应用数据-新增
	 * @param app
	 * @return
	 */
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String saveApp(ApplicationEntity app,Model model){
		MisLog.info(log, "存储新增应用！");
		try {
			appService.saveApplication(app);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(),e);
			model.addAttribute("error", "新增应用出错！");
			return "/exception";
		}
		return "redirect:/application/page";
	}
	
	/**
	 * 编辑应用
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/edit/{id}",method = RequestMethod.GET)
	public String editApp(Model model,@PathVariable("id") String id){
		MisLog.info(log, "查询应用信息！");
		try {
			ApplicationEntity app = this.appService.findAppEntityInfo(id);
			model.addAttribute("app", app);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(),e);
		}
		return APP_EDIT_PAGE;
	}
	
	/**
	 * 修改应用信息
	 * @param demo
	 * @return
	 */
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public String updateApp(ApplicationEntity app,Model model){
		MisLog.info(log, "修改应用信息！");
		try {
			appService.updateApplication(app);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(),e);
			model.addAttribute("error", "修改应用信息出错！");
			return "/exception";
		}
		return "redirect:/application/page";
	}
	
	/**
	 * 批量删除应用信息
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete",method = RequestMethod.POST)
	public String deleteApp(String[] ids){
		MisLog.info(log, "批量删除应用信息！");
		JSONObject json = JSONObject.parseObject("{}");
		try{
			//删除应用之前应该删除模块
			moduleService.deleteModuleByAppid(ids);
			appService.deleteApplication(ids);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		}catch(Exception e){
			MisLog.error(log, "批量删除应用失败",e);
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}
	
	/**
	 * 数据检验
	 * @param appName
	 * @param appId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/check",method = RequestMethod.POST)
	public String dataCheck(String appName,String appId){
		MisLog.info(log, "app数据检验");
		JSONObject json = JSONObject.parseObject("{}");
		json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		Map<String,String> params = new HashMap<String,String>();
		if (appName != null && appId == null) {
			params.put("appName", appName);
			if (appService.findAppEntityByParams(params) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该应用名称已经存在，请重新填写！");
			}
		}
		if (appName != null && appId != null) {
			params.clear();
			params.put("appName", appName);
			Map<String, String> notIn = new HashMap<>();
			notIn.put("id", appId);
			if (appService.findAppEntityByParams(params,notIn) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该应用名称已经存在，请重新填写！");
			}
		}
		return json.toJSONString();
	}
}
