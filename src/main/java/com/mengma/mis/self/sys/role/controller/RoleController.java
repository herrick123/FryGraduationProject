package com.mengma.mis.self.sys.role.controller;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mengma.mis.core.constant.GlobalCodeConstant;
import com.mengma.mis.core.exception.SaveException;
import com.mengma.mis.core.util.ListUtil;
import com.mengma.mis.core.util.MisLog;
import com.mengma.mis.core.util.Page;
import com.mengma.mis.self.sys.application.entity.ApplicationEntity;
import com.mengma.mis.self.sys.application.service.ApplicationService;
import com.mengma.mis.self.sys.module.entity.ModuleEntity;
import com.mengma.mis.self.sys.module.service.ModuleService;
import com.mengma.mis.self.sys.role.entity.RoleEntity;
import com.mengma.mis.self.sys.role.service.RoleService;
import com.mengma.mis.self.sys.roleModuleMapper.servise.RoleModuleMapperService;
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
 * 角色管理
 * @author 黄青山
 *
 */
@Controller
@RequestMapping("/role")
public class RoleController {

	@Autowired
	ApplicationService applicationService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private ModuleService moduleService;
	@Autowired
	private RoleModuleMapperService roleModuleMapperService;
	
	private static final Logger log = LoggerFactory.getLogger(RoleController.class);
	private static String ROLE_LIST_PAGE = "/sys/role/roleList";//角色列表页面
	private static String ROLE_ADD_PAGE = "/sys/role/addRole";//新增角色页面
	private static String ROLE_EDIT_PAGE = "/sys/role/editRole";//编辑角色页面
	private static String ROLE_AUTH_PAGE = "/sys/role/authRole";//给角色授权页面
	/**
	 * 返回角色列表页面
	 * @return
	 */
	@RequestMapping("/page")
	public String listAll(){
		return ROLE_LIST_PAGE;
	}
	/**
	 * 异步查询角色信息
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/asyncRoleList",method = RequestMethod.POST)
	public String listShow(Model model,String gridPager) {
		MisLog.info(log, "查询角色分页数据！");
		JSONObject json = JSONObject.parseObject(gridPager);
		JSONObject roleJson = json.getJSONObject("parameters");
		MisLog.info(log, json.toJSONString());
		
		Page<RoleEntity> page = JSONObject.toJavaObject(json,Page.class);
		RoleEntity role = JSONObject.toJavaObject(roleJson, RoleEntity.class);
		List<RoleEntity> roleList = this.roleService.findRolePage(role, page);
		for(RoleEntity oneRole:roleList){
			String ModuleName = "";
			List<String> ModuleList = roleService.selectAllModuleName(oneRole.getRoleId());
			for(String name:ModuleList){
				ModuleName = ModuleName +"|" + name;
			}
			oneRole.setModulesName(ModuleName);
		}
		PageInfo<RoleEntity> pageInfo = new PageInfo<RoleEntity>(roleList);
		page = new Page<RoleEntity>(pageInfo);
		return JSONObject.toJSONString(page);
	}
	/**
	 * 获得待更新角色，转到更新界面
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/edit/{id}",method = RequestMethod.GET)
	public String getRole(Model model,@PathVariable("id") String id){
		MisLog.info(log, "编辑更新角色！");
		RoleEntity roleEntity = null;
		try {
			roleEntity = roleService.selectOneEntity(id);
			//查询角色与模块的关联表，得到已关联模块id
		} catch (Exception e) {
			MisLog.error(log, e.getMessage());
		}
		model.addAttribute("roleEntity",roleEntity);
		return ROLE_EDIT_PAGE;
	}
	/**
	 * 获得待授权角色，转到授权界面
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/auth/{id}",method = RequestMethod.GET)
	public String authRole(Model model,@PathVariable("id") String id){
		RoleEntity roleEntity = null;
		String moduleId = "";
		try {
			//得到已拥有的模块id
			List<String> oldId = roleModuleMapperService.selectALLRoleModuleMappingByRole(id);
			for(String string :oldId){
				moduleId  = moduleId + string+",";
			}
			roleEntity = roleService.selectOneEntity(id);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage());
		}
		model.addAttribute("roleEntity",roleEntity);
		model.addAttribute("moduleId",moduleId);
		return ROLE_AUTH_PAGE;
	}
	/**
	 * 构建权限树，转化为json格式返回
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/authTree")
	public Object showAppTree(){
		MisLog.info(log, "构建权限树，转化为json格式返回");
		//树的状态
		JSONObject state = JSONObject.parseObject("{}");
		state.put("disabled", false);
		state.put("opened", true);
		
		//从数据库中查出所有的应用，模块构建应用树
		List<ApplicationEntity> apps = applicationService.listAllApp();
		JSONArray jsonArray = new JSONArray();
		//遍历应用，查询应用下的模块
		for(ApplicationEntity app:apps){
			List<ModuleEntity> moduleEntities = moduleService.listModulesByAppid(app.getId());
			JSONArray jsonArray2 = new JSONArray();
			//如果应用中模块不为空，遍历模块
			if(moduleEntities!=null){
				//遍历模块，得到未授权模块
				for(ModuleEntity module:moduleEntities){
					JSONObject json3 = JSONObject.parseObject("{}");
					json3.put("id", module.getId());
					json3.put("text", module.getModuleName());
					JSONObject state2 = JSONObject.parseObject("{}");
					state.put("disabled", false);
					state.put("opened", true);
					json3.put("state", state2);
					jsonArray2.add(json3);
				}
			}
			JSONObject json2 = JSONObject.parseObject("{}");
			json2.put("id", app.getId());
			json2.put("text", app.getAppName());
			json2.put("children", jsonArray2);
			jsonArray.add(json2);
		}
		//树的最外层
		JSONObject json = JSONObject.parseObject("{}");
		json.put("id", "root");
		json.put("text", "权限树");
		json.put("state", state);
		json.put("children", jsonArray);
		MisLog.info(log, json.toString());
		return "["+json.toJSONString()+"]";
	}
	/**
	 * 保存更新角色
	 * @param roleEntity
	 * @return
	 */
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public String update(RoleEntity roleEntity){
		MisLog.info(log, "保存更新角色");
		try {
			roleService.update(roleEntity);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage());
		}
		return ROLE_LIST_PAGE;
	}
	/**
	 * 给角色授权
	 * @param roleEntity
	 * @return
	 */
	@RequestMapping(value="/authSave",method = RequestMethod.POST)
	public String adddRole(RoleEntity roleEntity){
		MisLog.info(log, "保存授权角色");
		String moduleIds = roleEntity.getModulesIds();
		String[] ids = moduleIds.split(",");
		try {
			//查询当前角色已有的模块
			List<String> oldId = roleModuleMapperService.selectALLRoleModuleMappingByRole(roleEntity.getRoleId());
			//得到更新后的模块
			List<String> newId = Arrays.asList(ids);
			//得到需要保存的模块
			List<String> save = ListUtil.listCompare(newId, oldId);
			//得到需要删除的模块
			List<String> del = ListUtil.listCompare(oldId, newId);
			
			if(save.size()>0){
				roleModuleMapperService.addRoleModuleMapping(roleEntity.getRoleId(), save);
			}
			//得到需要删除的模块
			if(del.size()>0){
				roleModuleMapperService.deleteRoleModuleMappingByRole(roleEntity.getRoleId(),del);
			}
		} catch (Exception e) {
			MisLog.error(log, e.getMessage());
		}
		return ROLE_LIST_PAGE;
	}
	/**
	 * 转到新增界面
	 * @param roleEntity
	 * @return
	 */
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public String addRole(){
		return ROLE_ADD_PAGE;
	}
	/**
	 * 保存新增
	 * @return
	 */
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String saveRole(Model model,RoleEntity role){
		MisLog.info(log, "保存新增角色");
		try {
			roleService.add(role);
			String moduleIds = role.getModulesIds();
			String[] ids = moduleIds.split(",");
			List<String> save =  Arrays.asList(ids);
			if(save.size()>0){
				roleModuleMapperService.addRoleModuleMapping(role.getRoleId(), save);
			}
		} catch (SQLIntegrityConstraintViolationException e) {
			
		} catch (SaveException e) {
			MisLog.error(log, e.getMessage());
			model.addAttribute("error","添加角色出错！");
			return "/exception";
		}
		return "redirect:/role/page";
	}
	/**
	 * 检查新增角色
	 * @param 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/check",method = RequestMethod.POST)
	public String checkAccountAnduserName(String roleName,String roleId){
		MisLog.info(log, "检查重名角色");
		JSONObject json = JSONObject.parseObject("{}");
		json.put("returncode",GlobalCodeConstant.BASE_SUCCESS_CODE);
		Map<String,String> params = new HashMap<String,String>();
		if(roleName!=null && roleId==null){
			params.put("roleName",roleName);
			try {
				int result = roleService.findRoleEntityByParams(params);
				if(result>0){
					json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
					json.put("info", "角色名已存在");
				}
			} catch (Exception e) {
				json.put("returncode",GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "系统出现错误");
				MisLog.info(log, e.getMessage());
			}
		}
		if(roleName!=null && roleId!=null){
			params.put("roleName",roleName);
			Map<String, String> notEq = new HashMap<>();
			notEq.put("roleId", roleId);
			try {
				int result = roleService.findRoleEntityByParams(params,notEq);
				if(result>0){
					json.put("returncode",GlobalCodeConstant.BASE_ERROR_CODE);
					json.put("info", "角色名已存在");
				}
			} catch (Exception e) {
				json.put("returncode",GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "系统出现错误");
				MisLog.info(log, e.getMessage());
			}
		}
		return json.toJSONString();
	}
	/**
	 * 删除角色
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String deleteUserEntity(String id){
		MisLog.info(log, "删除角色");
		JSONObject json = JSONObject.parseObject("{}");
		try{
			roleService.delete(id);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		}catch(Exception e){
			MisLog.error(log, e.getMessage());
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}
	
}
