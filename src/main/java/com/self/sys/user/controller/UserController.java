package com.self.sys.user.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.core.constant.GlobalCodeConstant;
import com.core.exception.BaseException;
import com.core.exception.SaveException;
import com.core.exception.UpdateException;
import com.core.util.DBLog;
import com.core.util.MD5Util;
import com.core.util.MisLog;
import com.core.util.MisUtil;
import com.core.util.Page;
import com.github.pagehelper.PageInfo;
import com.self.employee.entity.EmployeeEntity;
import com.self.employee.service.EmployeeService;
import com.self.sys.log.entity.LogEntity;
import com.self.sys.log.service.LogService;
import com.self.sys.module.entity.ModuleEntity;
import com.self.sys.module.service.ModuleService;
import com.self.sys.role.entity.RoleEntity;
import com.self.sys.role.service.RoleService;
import com.self.sys.roleModuleMapper.servise.RoleModuleMapperService;
import com.self.sys.tree.dao.DirectoryTreeMapper;
import com.self.sys.tree.entity.DirectoryTree;
import com.self.sys.tree.entity.Tree;
import com.self.sys.tree.entity.TreeState;
import com.self.sys.tree.service.DirectoryTreeService;
import com.self.sys.user.dao.UserMapper;
import com.self.sys.user.entity.UserEntity;
import com.self.sys.user.service.UserService;
import com.self.sys.user.userVo.UserVo;

import tk.mybatis.mapper.entity.Example;

/**
 * 用户管理controller
 * @author 黄青山
 * @version 1.0
 */
@Controller
@RequestMapping("/user")
public class UserController {
	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	private static String USER_LIST_PAGE = "/sys/user/userList";//用户列表页面
	private static String USER_ADD_PAGE = "/sys/user/adduser";//新增用户页面
	private static String USER_EDIT_PAGE = "/sys/user/edituser";//编辑用户页面
	private static String USER_DET_PAGE = "/sys/user/userDetails";//用户详情页面
	
	private static String MANAGER_HOMEPAGE = "/managerIndex";//管理员首页
	private static String EMPLOYEE_HOMEPAGE = "/employeeIndex";//员工首页
	
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private DirectoryTreeService directoryTreeService;
	@Autowired
    private UserMapper userMapper;
	@Autowired
	private DirectoryTreeMapper directoryTreeMapper;
	@Autowired
    private RoleModuleMapperService roleModuleMapperService;
	@Autowired
    private ModuleService moduleService;
	@Autowired
	private LogService logService;
	
	/**
	 * 跳转到管理员首页
	 * @return
	 */
	@RequestMapping(value="/manager")
	public String managerHomepage(){
		return MANAGER_HOMEPAGE;
	}
	
	/**
	 * 跳转到员工首页
	 * @return
	 */
	@RequestMapping(value="/employee")
	public String employeeHomepage(){
		return EMPLOYEE_HOMEPAGE;
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
		
		Page<UserEntity> page = JSONObject.toJavaObject(json,Page.class);
		UserEntity user = JSONObject.toJavaObject(userJson, UserEntity.class);
		List<UserEntity> userList = new ArrayList<UserEntity>();
		if(user.getDepartmentId() != "" && user.getDepartmentId() != null) {
		    MisLog.info(log, "user.getDepartmentId()"+user.getDepartmentId());
		    //查询所有字部门ID
            List<String> childsId = directoryTreeService.getAllChildsId(user.getDepartmentId());
            //childsId.size()为零说明没有子部门 
            if(childsId.size()==0) {
                childsId.add(user.getDepartmentId());
            }
            Example example = new Example(UserEntity.class);
            Example.Criteria criteria = example.createCriteria();
            criteria.andIn("departmentId", childsId);
            userList = userMapper.selectByCondition(example);
		}else { 
		   userList = this.userService.findUserPage(user, page);
		}
		for(UserEntity oneUser:userList){
			String roleName = "";
			if(oneUser.getRole() != null){
				String[] roleID = oneUser.getRole().split("/");
				List<String> nameList = roleService.selectAllRoleName(MisUtil.arrayTransList(roleID));
				MisLog.info(log, "nameList" + nameList);
				for(String name:nameList){
					 roleName = roleName +"|" + name;
				}
			}
			oneUser.setRole(roleName);
		}
		PageInfo<UserEntity> pageInfo = new PageInfo<UserEntity>(userList);
		page = new Page<UserEntity>(pageInfo);
		String result = JSONObject.toJSONString(page);
		MisLog.info(log, result);
		return result;
	}
	
	/**
	 * 新增用户
	 * @return
	 */

	@RequestMapping(value="/add",method = RequestMethod.GET)
	public String addDemo(Model model,String departmentId){
		List<RoleEntity> roles = null;
		try {
			roles = roleService.listRole();
			String department = userService.selectDepartmentName(departmentId);
			model.addAttribute("departmentName",department);	
			model.addAttribute("departmentId",departmentId);
					
		} catch (Exception e) {
			MisLog.error(log,e.getMessage());
		}
		model.addAttribute("roles",roles);
		return USER_ADD_PAGE;
	}
	/**
	 * check新增用户
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/check",method = RequestMethod.POST)
	public String checkAccountAnduserName(String userId,String userName,String userAccount){
		JSONObject json = JSONObject.parseObject("{}");
		json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		Map<String,String> params = new HashMap<String,String>();
		if(userAccount != null && userId == null){
			params.put("userAccount",userAccount);
			if(userService.findUserEntityByParams(params)>0){
				json.put("returncode",GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "登录名已存在");
			}
		}
		if(userName != null && userId == null){
			params.clear();
			params.put("userName",userName);
			if(userService.findUserEntityByParams(params)>0){
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "用户名已存在");
			}
		}
		if(userAccount != null && userId != null ){
			params.clear();
			params.put("userAccount",userAccount);
			Map<String, String> notEqual = new HashMap<>();
			notEqual.put("userId", userId);
			if(userService.findUserEntityByAnd(params, notEqual)>0){
				json.put("returncode",GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "更改后的登录名已存在");
			}
		}
		if(userName != null && userId != null ){
			params.clear();
			params.put("userName",userName);
			Map<String, String> notEqual = new HashMap<>();
			notEqual.put("userId", userId);
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
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String saveUserEntity(Model model,UserEntity user){
		
		MisLog.info(log, "存储新增用户！");
		try {
		    MisLog.debug(log, "******"+user.getDepartmentId());
			user.setUserPass(MD5Util.string2MD5(GlobalCodeConstant.DEFAULT_PASSWORD));
			userService.saveUserEntity(user);
		
		} catch (SaveException e) {
			MisLog.error(log, e.getMessage());
			model.addAttribute("error", "新增用户出错！");
			return "/exception";
		}
		return "redirect:/user/page";
	}
	/**
	 * 批量删除用户
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String deleteUserEntity(String[] ids){
		JSONObject json = JSONObject.parseObject("{}");
			Boolean result = userService.deleteUserEntity(ids);
			if (result) {
				json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
			}else {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
			}
			
		return json.toJSONString();
	}
	/**
	 * 编辑用户
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/edit",method = RequestMethod.GET)
	public String editDemo(Model model,String id,String departmentId){
		//查询出所有角色
	    List<String> departmentIdList = null;
		List<RoleEntity> roles = null;
		try {
			roles = roleService.listRole();
			departmentIdList = userService.listDepartment();
		} catch (Exception e) {
			MisLog.error(log,e.getMessage());
		}
	      Example example = new Example(DirectoryTree.class);
	      Example.Criteria criteria=example.createCriteria();
	      criteria.andIn("id", departmentIdList);
	      List<DirectoryTree> departmentList = directoryTreeMapper.selectByCondition(example);
	      model.addAttribute("departments",departmentList);
	      model.addAttribute("roles",roles);
		UserEntity user = userService.findUserEntityInfo(id);
		model.addAttribute("user", user);
		return USER_EDIT_PAGE;
	}
	
	/**
	 * 更新用户
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public String updateUser(Model model,UserEntity user){
		
		MisLog.info(log, "修改用户信息!");
		try {
			if(!user.getUserPass().equals("******")){
				user.setUserPass(MD5Util.string2MD5(user.getUserPass()));
			}else {
				user.setUserPass(null);
			}
			userService.updateUserEntity(user);
		} catch (UpdateException e) {
			MisLog.error(log, e.getMessage());
			model.addAttribute("error", "更新用户出错！");
			return "/exception";
		}
		return "redirect:/user/page";
	}
	/**
	 * 批量重置用户密码
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/reset",method=RequestMethod.POST)
	public String resetUserEntity(String[] ids){
		JSONObject json = JSONObject.parseObject("{}");
		try{
			userService.resetUserEntity(ids);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		}catch(UpdateException e){
			MisLog.error(log, e.getMessage());
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}
	
	/**
	 * 通过department查询所有用户信息
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/getDepartment", method = RequestMethod.POST)
	public String getAllUser(Model model,String gridPager) {
		MisLog.info(log, "查询用户分页数据！");
		JSONObject json = JSONObject.parseObject(gridPager);
		JSONObject userJson = json.getJSONObject("parameters");
		MisLog.info(log, json.toJSONString());
		Page<UserEntity> page = JSONObject.toJavaObject(json, Page.class);
		UserEntity users = JSONObject.toJavaObject(userJson, UserEntity.class);
		MisLog.info(log, users.getDepartmentId());
		List<UserEntity> userList = this.userService.findUserPage(users, page);
		
		/*for(UserEntity oneUser:userList){
			String roleName = "";
			if(oneUser.getRole() != null){
				String[] roleID = oneUser.getRole().split("/");
				List<String> nameList = this.roleService.selectAllRoleName(SodbUtil.arrayTransList(roleID));
				for(String name:nameList){
					 roleName = name;
				}
			}
			oneUser.setRole(roleName);
		}*/
		
		
	    //把查到所有的角色信息返回
	    PageInfo<UserEntity> pageInfo = new PageInfo<UserEntity>(userList);
		page = new Page<UserEntity>(pageInfo);
	    return JSON.toJSONString(page);
	}
	
	/**
	 * 创建部门树
	 */
	@ResponseBody
	@RequestMapping(value="/getTree",method=RequestMethod.GET)
	public String getTree() {
	    DirectoryTree directoryTree=new DirectoryTree();
	    directoryTree.setTreeCode(GlobalCodeConstant.DEPARTMENT_TREE_CODE);
	    List<DirectoryTree> nodes = directoryTreeService.findAllResourceByTreeCode(directoryTree.getTreeCode());
	    List<Tree> treeList = new ArrayList<Tree>();
	    if(!nodes.isEmpty()) {
	        for(DirectoryTree node : nodes) {  
	            if(node.getLeve() == 1) {
	                Tree root = new Tree();
	                root.setId(node.getId());
	                root.setParent(node.getParentId());
	                root.setText(node.getName());
	                root.setState(new TreeState(true,false,true));
	                treeList.add(root);
	            }else {
	                Tree tree = new Tree();
	                tree.setId(node.getId());
	                tree.setParent(node.getParentId());
	                tree.setText(node.getName());
	                tree.setState(new TreeState());
	                treeList.add(tree);
	            }
	        }
	    }
        return JSON.toJSONString(treeList, true);
	}
	
	/**
	 * 用户登录
	 * @param request
	 * @param userAccount
	 * @param userPass
	 * @return
	 */
    @RequestMapping(value="/login",method = RequestMethod.POST)
	public String login(HttpServletRequest request,String userAccount,String userPass,Model model){
    	try {
			UserEntity userEntity = userService.login(userAccount);
			String MdPassword = MD5Util.string2MD5(userPass);
			if(userEntity.getUserStatus() == 1){
				//密码错误或者登录名不存在
				model.addAttribute("loginMessage","您目前没有权限访问，请联系管理员");
				return "/login";
			}
			if(userEntity==null||!MdPassword.equals(userEntity.getUserPass())){
				//密码错误或者登录名不存在
				model.addAttribute("loginMessage","用户名或者密码错误");
				return "/login";
			}else{
				//登录验证通过，查询用户角色
				String roleName = "";
				if(userEntity.getRole()!=null){
					String[] roleID = userEntity.getRole().split("/");
					List<String> nameList = roleService.selectAllRoleName( Arrays.asList(roleID));
					for(String name:nameList){
						 roleName = roleName + name;
					}
				}
				userEntity.setRoleName(roleName);

				LogEntity logEntity = DBLog.createLog(request,GlobalCodeConstant.LOG_LEVE_INFO, "用户用户登录",
						userEntity.getUserName(),"备注");
				logService.addLog(logEntity);
				//加载用户用户拥有的模块
				Map<String, Object> modules = loadUserModuleByRole(userEntity.getRole());
				//通过当前登陆者的userAccount来查询对应的employee
				String acccount = userEntity.getUserAccount();
				EmployeeEntity employee = employeeService.findEmployeeByUserAccount(acccount);
				//将employee和user两个表的vo作为session
				UserVo userVo = new UserVo();
				userVo.setId(employee.getId());
				userVo.setUserAccount(employee.getUserAccount());
				userVo.setUserPass(employee.getUserPass());
				userVo.setRole(employee.getRole());
				userVo.setEmployeeCode(employee.getEmployeeCode());
				userVo.setEmployeeName(employee.getEmployeeName());
				userVo.setBirthday(employee.getBirthday());
				userVo.setGender(employee.getGender());
				userVo.setMajor(employee.getMajor());
				userVo.setIntroduction(employee.getIntroduction());
				userVo.setPhone(employee.getPhone());
				userVo.setJoinTime(employee.getJoinTime());
				userVo.setAreaId(employee.getAreaId());
				userVo.setIssueId(employee.getIssueId());
				userVo.setAbilityLevel(employee.getAbilityLevel());
				userVo.setSkill(employee.getSkill());
				userVo.setNation(employee.getNation());
				userVo.setEducation(employee.getEducation());
				userVo.setIdentityNum(employee.getIdentityNum());
				userVo.setBankCard(employee.getBankCard());
				userVo.setUrgentPerson(employee.getUrgentPerson());
				userVo.setUrgentPhone(employee.getUrgentPhone());
				userVo.setAddress(employee.getAddress());
				userVo.setSchoolName(employee.getSchoolName());
				userVo.setUserId(userEntity.getUserId());
				userVo.setUserName(employee.getEmployeeName());
				
				request.getSession().setAttribute(GlobalCodeConstant.LOGIN_USER, userVo);
				request.getSession().setAttribute("modules",modules);
				return "redirect:/pages/index.jsp";
			}
		} catch (IndexOutOfBoundsException e) {
			//当用户名不存在的时候会抛出此异常
			model.addAttribute("loginMessage",e.getMessage());
			return "/login";
		}catch (Exception e) {
			MisLog.error(log, e.getMessage());
			model.addAttribute("loginMessage","登录出现异常");
			return "/login";
		}
    } 
    
    /**
	 * 根据用户的角色查询拥有的模块
	 * @param roleId
	 * @return
	 */
	public Map<String, Object> loadUserModuleByRole(String roleId){
		Map<String, Object> module = new HashMap<>();
		List<String> group = roleModuleMapperService.listGroupsByRoleId(roleId);
		for(String node:group){
		    List<ModuleEntity> nodes = null;
			try {
				nodes = this.moduleService.listModules(roleId,node);
			} catch (BaseException e) {
				MisLog.error(log, e.getErrorMsg());
			}
		    module.put(node, nodes);
		}
		MisLog.info(log, "查找当前用户拥有的模块");
		return module;
	}

    
    /**
     * 用户详情页面
     */
    @RequestMapping(value="/details/{id}",method = RequestMethod.GET)
	public String UserDetails(Model model,@PathVariable("id") String id){
		//查询出所有角色
	    List<String> departmentIdList = null;
		List<RoleEntity> roles = null;
		try {
			roles = roleService.listRole();
			departmentIdList = userService.listDepartment();
		} catch (Exception e) {
			MisLog.error(log,e.getMessage());
		}
	      Example example = new Example(DirectoryTree.class);
	      Example.Criteria criteria=example.createCriteria();
	      criteria.andIn("id", departmentIdList);
	      List<DirectoryTree> departmentList = directoryTreeMapper.selectByCondition(example);
	      model.addAttribute("departments",departmentList);
	      model.addAttribute("roles",roles);
		UserEntity user = userService.findUserEntityInfo(id);
		model.addAttribute("user", user);
		return USER_DET_PAGE;
	}
}
