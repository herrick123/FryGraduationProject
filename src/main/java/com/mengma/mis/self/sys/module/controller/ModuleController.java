package com.mengma.mis.self.sys.module.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mengma.mis.core.constant.GlobalCodeConstant;
import com.mengma.mis.core.exception.SaveException;
import com.mengma.mis.core.exception.UpdateException;
import com.mengma.mis.core.util.MisLog;
import com.mengma.mis.core.util.Page;
import com.mengma.mis.self.sys.application.entity.ApplicationEntity;
import com.mengma.mis.self.sys.application.service.ApplicationService;
import com.mengma.mis.self.sys.module.entity.ModuleEntity;
import com.mengma.mis.self.sys.module.service.ModuleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;

/**
 * 模块管理controller
 * @author penglh
 * @version 1.0
 * @email 1670064261@qq.com
 */
@Controller
@RequestMapping("/module")
public class ModuleController {
	private static final Logger log = LoggerFactory.getLogger(ModuleController.class);
	
	private static String MODULE_LIST_PAGE = "/sys/module/moduleList";//模块列表页面
	private static String MODULE_ADD_PAGE = "/sys/module/addModule";//新增模块页面
	private static String MODULE_EDIT_PAGE = "/sys/module/editModule";//编辑模块页面
	
	@Autowired
	private ModuleService moduleService;
	@Autowired
	ApplicationService applicationService;

	/**
	 * 展现模块列表 数据
	 * @return
	 */
	@RequestMapping(value="/page")
	public String modulePage(Model model){
		//查询模块名字
		List<ApplicationEntity> ApplicationNames = applicationService.selectNames();
		model.addAttribute("ApplicationNames",ApplicationNames);
		return MODULE_LIST_PAGE;
	}
	
	/**
	 * 分页查询模块数据
	 * @param model
	 * @param gridPager
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/pageList",method = RequestMethod.POST)
	@SuppressWarnings("unchecked")
	public String findModulePageList(Model model,String gridPager){
		MisLog.info(log, "查询模块分页数据！");
		JSONObject json = JSONObject.parseObject(gridPager);
		JSONObject moduleJson = json.getJSONObject("parameters");
		MisLog.info(log, json.toJSONString());
		Page<ModuleEntity> page = JSONObject.toJavaObject(json, Page.class);
		ModuleEntity moduleEntity = JSONObject.toJavaObject(moduleJson, ModuleEntity.class);
		List<ModuleEntity> moduleList = this.moduleService.findModulePage(moduleEntity, page);
		//查询每个模块所属的应用
		String appName = "";
		for(ModuleEntity module:moduleList){
			appName = applicationService.findAppEntityInfo(module.getAppId()).getAppName();
			module.setAppName(appName);
		}
		PageInfo<ModuleEntity> pageInfo = new PageInfo<ModuleEntity>(moduleList);
		page = new Page<ModuleEntity>(pageInfo);
		
		return JSONObject.toJSONString(page);
	}
	
	/**
	 * 新增模块
	 * @return
	 */
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public String addModule(Model model,String appId){
		ApplicationEntity app = applicationService.findAppEntityInfo(appId);
		model.addAttribute("app", app);
		return MODULE_ADD_PAGE;
	}
	
	/**
	 * 存储模块数据-新增
	 * @param module
	 * @return
	 */
	@RequestMapping(value="/save",method = RequestMethod.POST)
	private String saveModule(Model model, ModuleEntity moduleEntity) {
		MisLog.info(log, "存储新增模块！");
		try {
			moduleService.saveModule(moduleEntity);
		} catch (SaveException e) {
			MisLog.error(log, e.getMessage());
			model.addAttribute("error","新增模块失败!");
			return "/exception";
		}
		return "redirect:/module/page";
	}
	
	/**
	 * 编辑模块
	 * @param model
	 * @param moduleId
	 * @return
	 */
	@RequestMapping(value="/edit/{moduleId}",method = RequestMethod.GET)
	public String editMdule(Model model,@PathVariable("moduleId") String moduleId){
		ModuleEntity module=moduleService.findModduleEntityInfo(moduleId);
//		ApplicationEntity app = applicationService.findAppEntityInfo(module.getAppId());
//		model.addAttribute("app", app);
		model.addAttribute("module",module);
		return MODULE_EDIT_PAGE;
	}
	
	/**
	 * 修改模块信息
	 * @param module
	 * @return
	 */
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public String updateModule(Model model, ModuleEntity module){
		MisLog.info(log, "修改模块信息！");
		try {
			moduleService.updateModule(module);
		} catch (UpdateException e) {
			MisLog.error(log, e.getMessage());
			model.addAttribute("error","修改模块失败!");
			return "/exception";
		}
		return "redirect:/module/page";
	}
	
	/**
	 * 添加，更新时检查模块
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/check",method = RequestMethod.POST)
	public String checkmoduleName(String moduleId,String moduleName,String moduleUrl){
		MisLog.info(log, "添加，更新时检查模块！");
		JSONObject json = JSONObject.parseObject("{}");
		json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		Map<String,String> params = new HashMap<String,String>();
		try {
			if(moduleName!=null && moduleId==null){
				params.put("moduleName",moduleName);
				if(moduleService.findModuleEntityByParams(params)>0){
					json.put("returncode",GlobalCodeConstant.BASE_ERROR_CODE);
					json.put("info", "模块名已存在");
				}
			}
			if(moduleUrl!=null && moduleId==null){
				params.clear();
				params.put("moduleUrl",moduleUrl);
				if(moduleService.findModuleEntityByParams(params)>0){
					json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
					json.put("info", "模块URL已存在");
				}
			}
			if(moduleName!=null && moduleId!=null &&moduleUrl!=null){
				String[] arr = {"module_url",moduleUrl,"module_name",moduleName};
				Map<String, String> notEqual = new HashMap<>();
				notEqual.put("moduleId", moduleId);
				if(moduleService.findmoduleEntityByOr(arr, notEqual)>0){
					json.put("returncode",GlobalCodeConstant.BASE_ERROR_CODE);
					json.put("info", "更改后的登录名或者用户名已存在");
				}
			}
		} catch (Exception e) {
			json.put("returncode",GlobalCodeConstant.BASE_ERROR_CODE);
			json.put("info", "系统错误，请联系开发人员");
			MisLog.error(log, e.getMessage());
		}
		return json.toJSONString();
	}
	
	/**
	 * 批量删除模块
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete",method = RequestMethod.POST)
	public String deleteModule(String[] moduleIds){
		MisLog.info(log, "批量删除模块,删除模块首先删除模块与角色的关联！");
		JSONObject json =JSONObject.parseObject("{}");
		try{
			//删除模块首先删除模块与角色的关联
			moduleService.deleteModule(moduleIds);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		}catch (Exception e) {
			MisLog.error(log, e.getMessage());
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}
	/**
	 * 查询应用，转化为json格式返回
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/appTree")
	public Object showAppTree(){
		MisLog.info(log, "查询应用，转化为json格式返回");
		//树的状态
		JSONObject state = JSONObject.parseObject("{}");
		state.put("disabled", false);
		state.put("opened", true);
		state.put("selected", false);
		JSONObject json = JSONObject.parseObject("{}");
		json.put("id", "1");
		json.put("text", "应用树");
		json.put("state", state);
		//从数据库中查出所有的应用
		List<ApplicationEntity> apps = applicationService.listAllApp();
		JSONArray jsonArray = new JSONArray();
		for(ApplicationEntity app:apps){
			JSONObject json2 = JSONObject.parseObject("{}");
			json2.put("id", app.getId());
			json2.put("text", app.getAppName());
			jsonArray.add(json2);
		}
		json.put("children", jsonArray);
		MisLog.info(log, json.toString());
		return "["+json.toJSONString()+"]";
	}
}
