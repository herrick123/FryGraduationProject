package com.self.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.core.constant.GlobalCodeConstant;
import com.core.exception.SaveException;
import com.core.exception.UpdateException;
import com.core.util.MisLog;
import com.core.util.Page;
import com.github.pagehelper.PageInfo;
import com.self.user.entity.UserEntity;
import com.self.user.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	private static String INDEX_LIST_PAGE = "/index";//用户列表页面
	private static String USER_LIST_PAGE = "/user/userList";//用户列表页面
	private static String USER_ADD_PAGE = "/user/addUser";//新增用户页面
	private static String USER_EDIT_PAGE = "/user/editUser";//编辑用户页面
	private static String USER_EDIT_PASSWORD_PAGE = "/user/editPasswordUser";//编辑用户密码页面
	private static String USER_DET_PAGE = "/user/userDetails";//用户详情页面
	
	@Autowired
	private UserService userService;
	
	/**
	 * 首页
	 */
	@RequestMapping(value="/index")
	public String indexPage(Model model, HttpServletRequest request, String to){
		UserEntity user = (UserEntity) request.getSession().getAttribute(GlobalCodeConstant.LOGIN_USER);
		model.addAttribute("to", to);
		model.addAttribute("loginUser", user);
		return INDEX_LIST_PAGE;
	}
	
	/**
	 * 展示用户列表数据
	 * @return
	 */
	@RequestMapping(value="/page")
	public String userPage(){
		
		return USER_LIST_PAGE;
	}
	
	/**
	 * 分页查询用户数据
	 * @param model
	 * @param getidpager
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/pageList",method = RequestMethod.POST)
	public String findUserPageList(Model model,String gridPager){
		MisLog.info(log, "查询用户分页数据！");
		JSONObject json = JSONObject.parseObject(gridPager);
		JSONObject userJson = json.getJSONObject("parameters");
		MisLog.info(log, json.toJSONString());
		Page<UserEntity> page = JSONObject.toJavaObject(json, Page.class);
		UserEntity user = JSONObject.toJavaObject(userJson, UserEntity.class);
		List<UserEntity> userList = this.userService.findUserPage(user, page);
		PageInfo<UserEntity> pageInfo = new PageInfo<UserEntity>(userList);
		page = new Page<UserEntity>(pageInfo);
		
		return JSONObject.toJSONString(page);
	}
	
	/**
	 * 新增用户
	 * @return
	 */

	@RequestMapping(value="/add",method = RequestMethod.GET)
	public String addUser(Model model){

		return USER_ADD_PAGE;
	}
	
	/**
	 * check新增用户
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/check",method = RequestMethod.POST)
	public String checkUserName(String userId, String userName){
		JSONObject json = JSONObject.parseObject("{}");
		json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		Map<String,String> params = new HashMap<String,String>();
		if(userName != null && userId == null){
			params.put("userName",userName);
			if(userService.findUserEntityByParams(params)>0){
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "用户名已存在");
			}
		}
		if(userName != null && userId != null ){
			params.clear();
			params.put("userName",userName);
			Map<String, String> notEqual = new HashMap<>();
			notEqual.put("uuid", userId);
			if(userService.findUserEntityByAnd(params, notEqual)>0){
				json.put("returncode",GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "更改后的用户名已存在");
			}
		}
		return json.toJSONString();
	}
	/**
	 * 存储新增用户
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/save", method = RequestMethod.POST)
	public String saveUserEntity(Model model,UserEntity user){
		MisLog.info(log, "存储新增用户！");
		try {
			userService.saveUserEntity(user);
		} catch (SaveException e) {
			MisLog.error(log, e.getMessage());
			model.addAttribute("error", "新增用户出错！");
			return "/exception";
		}
		return "redirect:/user/index";
	}
	
	/**
	 * 编辑用户
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/edit",method = RequestMethod.GET)
	public String editUser(Model model, HttpServletRequest request){
		UserEntity user = (UserEntity) request.getSession().getAttribute(GlobalCodeConstant.LOGIN_USER);
		model.addAttribute("user", user);
		
		return USER_EDIT_PAGE;
	}
	
	/**
	 * 更新用户
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public String updateUser(Model model,UserEntity user, HttpServletRequest request){
		MisLog.info(log, "修改用户信息!");
		try {
			userService.updateUserEntity(user);
			request.getSession().setAttribute(GlobalCodeConstant.LOGIN_USER, user);
		} catch (UpdateException e) {
			MisLog.error(log, e.getMessage());
		}
		return "redirect:/user/edit";
	}
	
	/**
	 * 编辑用户密码
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/editPassword",method = RequestMethod.GET)
	public String editPassword(Model model, HttpServletRequest request){
		UserEntity user = (UserEntity) request.getSession().getAttribute(GlobalCodeConstant.LOGIN_USER);
		model.addAttribute("user", user);
		
		return USER_EDIT_PASSWORD_PAGE;
	}
	
	/**
	 * 修改用户密码
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="/updatePassword",method=RequestMethod.POST)
	public String updatePassword(UserEntity user, HttpServletRequest request){
		MisLog.info(log, "修改用户密码!");
		try{
			userService.updateUserEntity(user);
			request.getSession().setAttribute(GlobalCodeConstant.LOGIN_USER, user);
		}catch(UpdateException e){
			MisLog.error(log, e.getMessage());
		}
		return "redirect:/user/editPassword";
	}
	
	/**
	 * 用户审核
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/userAudit",method=RequestMethod.POST)
	public String updateUserStatus(String id){
		JSONObject json = JSONObject.parseObject("{}");
		UserEntity user = new UserEntity();
		user.setUuid(id);
		user.setUserStatus("1");
		try{
			userService.updateUserEntity(user);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		}catch(UpdateException e){
			MisLog.error(log, e.getMessage());
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}
	
	 /**
     * 用户详情页面
     */
    @RequestMapping(value="/details",method = RequestMethod.GET)
	public String UserDetails(Model model, String id){
		UserEntity user = userService.findUserEntityInfo(id);
		model.addAttribute("user", user);
		
		return USER_DET_PAGE;
	}
    
	/**
	 * 用户登录
	 * @param request
	 * @param userName
	 * @param password
	 * @return
	 */
    @ResponseBody
    @RequestMapping(value="/fryLogin")
	public String login(HttpServletRequest request,String userName,String password){
    	JSONObject json = JSONObject.parseObject("{}");
		boolean result = false;
		List<UserEntity> userList = userService.login(userName);
		if(userList.size() == 1 && userList.get(0).getPassword().equals(password)){
			result = true;
		}
		if(result){
			UserEntity user = userList.get(0);
			request.getSession().setAttribute(GlobalCodeConstant.LOGIN_USER, user);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		}else{
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
    }
    
    /**
	 * 用户注销
	 * @param request
	 * @return
	 */
    @ResponseBody
    @RequestMapping(value="/fryLogout")
	public String logout(HttpServletRequest request,String userName,String password){
    	JSONObject json = JSONObject.parseObject("{}");
		request.getSession().removeAttribute(GlobalCodeConstant.LOGIN_USER);
		UserEntity user = (UserEntity) request.getSession().getAttribute(GlobalCodeConstant.LOGIN_USER);
		if(user == null){
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		}else{
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
    }
}
