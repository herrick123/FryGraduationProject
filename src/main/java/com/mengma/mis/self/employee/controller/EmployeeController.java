package com.mengma.mis.self.employee.controller;

import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.mengma.mis.core.constant.GlobalCodeConstant;
import com.mengma.mis.core.util.DateTimeConverter;
import com.mengma.mis.core.util.ExcelImportUtil;
import com.mengma.mis.core.util.FileUtil;
import com.mengma.mis.core.util.MD5Util;
import com.mengma.mis.core.util.MisLog;
import com.mengma.mis.core.util.Page;
import com.mengma.mis.core.util.UuidUtil;
import com.mengma.mis.self.area.entity.AreaEntity;
import com.mengma.mis.self.area.service.AreaService;
import com.mengma.mis.self.employee.employeeVo.EmployeeVo;
import com.mengma.mis.self.employee.entity.EmployeeEntity;
import com.mengma.mis.self.employee.service.EmployeeService;
import com.mengma.mis.self.sys.constant.entity.ConstantEntity;
import com.mengma.mis.self.sys.constant.service.ConstantService;
import com.mengma.mis.self.sys.role.entity.RoleEntity;
import com.mengma.mis.self.sys.role.service.RoleService;
import com.mengma.mis.self.sys.user.entity.UserEntity;
import com.mengma.mis.self.sys.user.service.UserService;
import com.mengma.mis.self.training.entity.TrainingEntity;
import com.mengma.mis.self.training.service.TrainingService;


/**
 * 录入员工信息的controller
 * 
 * @author mafei
 *
 */

@Controller
@RequestMapping("/employee")
public class EmployeeController {

	private static final Logger log = LoggerFactory.getLogger(EmployeeController.class);

	private static String MODULE_ADD_PAGE = "/employee/addEmployee";// 录入学员信息的页面
	private static String MODULE_LIST_PAGE = "/employee/employeeList";// 员工的列表页面
	private static String MODULE_EDIT_PAGE = "/employee/editEmployee";// 编辑员工页面
	private static String MODULE_INFO_PAGE = "/employee/employeeInfo";// 查看员工信息页面

	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private TrainingService trainingService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private ConstantService constantService;
	@Autowired
	private UserService userService;

	/**
	 * 展示员工列表数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "/page")
	public String employeePage() {
		return MODULE_LIST_PAGE;
	}

	/**
	 * 新增员工列表数据
	 * @return
	 */
	@RequestMapping(value = "/add",method = RequestMethod.GET)
	public String aadEmployee(Model model) {
		//获得技能的所有标签
		List<ConstantEntity> skills = constantService.searchConstantByCode(GlobalCodeConstant.Skills_CODE);
		//获得能力级别的标签
		List<ConstantEntity> abilities = constantService.searchConstantByCode(GlobalCodeConstant.AbilityLevel_CODE);
		//获得民族
		List<ConstantEntity> nations = constantService.searchConstantByCode(GlobalCodeConstant.Nation_CODE);
		//获得学历
		List<ConstantEntity> educations = constantService.searchConstantByCode(GlobalCodeConstant.Education_CODE);
		//获得学校
		List<ConstantEntity> schoolNames = constantService.searchConstantByCode(GlobalCodeConstant.SchoolName_CODE);
		//获取分区
		List<AreaEntity> areas = areaService.getAllArea();
		//获取默认状态下的分区
		List<TrainingEntity> trainingEntities = trainingService.findTrainingEntityByAreaId(areas.get(0).getId());		
		//获取角色
		List<RoleEntity> roleList = roleService.listRole();
		
		model.addAttribute("abilityLevels", abilities);
		model.addAttribute("skills", skills);
		model.addAttribute("nations", nations);
		model.addAttribute("educations", educations);
		model.addAttribute("schoolNames", schoolNames);
		model.addAttribute("areas", areas);
		model.addAttribute("trainingEntities", trainingEntities);
		model.addAttribute("roleList", roleList);
		
		return MODULE_ADD_PAGE;
	}
	
	/**
	 * 根据选择的分区code来查询期数
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getIssue", method = RequestMethod.POST)
	public String getEmployeeIssue(String areaId) {
		JSONObject json = JSONObject.parseObject("{}");
		//获取期数
		try {
			List<TrainingEntity> trainingEntities = trainingService.findTrainingEntityByAreaId(areaId);
			json.put("trainingEntities",trainingEntities);
		} catch (Exception e) {
			// TODO: handle exception
			MisLog.error(log, "根据选择的分区code来查询期数失败",e);
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}

	/**
	 * 分页查询员工数据
	 * 
	 * @param model
	 * @param getidpager
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/pageList", method = RequestMethod.POST)
	public String findEmployeePageList(Model model, String gridPager) {
		MisLog.info(log, "查询员工分页数据！");
		JSONObject json = JSONObject.parseObject(gridPager);
		JSONObject employeeJson = json.getJSONObject("parameters");
		
		Page<EmployeeEntity> page = JSONObject.toJavaObject(json, Page.class);
		try {
			EmployeeEntity employee = JSONObject.toJavaObject(employeeJson, EmployeeEntity.class);
			List<EmployeeEntity> employeeList = employeeService.findEmployeePage(employee, page);
			//循环判断由SQL来做的
			for (EmployeeEntity employeeEntity : employeeList) {
				columnTransformation(employeeEntity);
			}
			PageInfo<EmployeeEntity> pageInfo = new PageInfo<EmployeeEntity>(employeeList);
			page = new Page<EmployeeEntity>(pageInfo);
		} catch (Exception e) {
			// TODO: handle exception
			MisLog.error(log, "分页查询员工失败！",e);
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		String result = JSONObject.toJSONString(page);
		MisLog.info(log, result);
		return result;
	}
	
	

	/**
	 * check新增员工
	 * 
	 * @param user
	 * @return
	 */

	@ResponseBody
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public String checkEmployee(String userAccount) {
		//判断登录名是否重复
		String result = null;
		try {
			MisLog.info(log, "检查新增用户");
			JSONObject json = JSONObject.parseObject("{}");
			json.put("returncode",GlobalCodeConstant.BASE_SUCCESS_CODE);
			Map<String,String> params = new HashMap<String,String>();
			if(userAccount!=null){
				params.put("userAccount",userAccount);
				if(employeeService.findEmployeeEntityByParams(params)>0){
					json.put("returncode",GlobalCodeConstant.BASE_ERROR_CODE);
					json.put("info", "登录名已存在");
				}
			}
			result = json.toJSONString();
		} catch (Exception e) {
			MisLog.error(log, e.getMessage());
		}
		return result;
	}

	/**
	 * 保存录入的员工信息
	 * 
	 * @param model
	 * @param employee
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveEmployee(Model model, EmployeeEntity employee, HttpServletRequest request) {
		MisLog.info(log, "录入员工信息");
		//UserEntity userEntity = (UserEntity) request.getSession().getAttribute(GlobalCodeConstant.LOGIN_USER);
		JSONObject json = JSONObject.parseObject("{}");
		Integer result = null;
		try{
			/*@RequestParam(value = "uploadFile") MultipartFile uploadFile
			 * 上传员工照片
			String fileName = uploadFile.getOriginalFilename();
			System.out.println("文件名："+fileName);
			if(fileName != null && fileName!=""){
				String basePath = GlobalCodeConstant.BASE_UPLOADFILE_PATH;
				String filePath = basePath+fileName;
				File upFile = new File(basePath);
				if(!upFile.isDirectory()){//判断文件夹是否存在 不存在创建
					upFile.mkdirs();
		        }
				uploadFile.transferTo(new File(filePath));
				json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
				json.put("filePath", filePath);
				
				employee.setPicturePath(filePath);
			}*/
			String password = MD5Util.string2MD5(employee.getUserPass());
			employee.setUserPass(password);
			result = employeeService.addEmployee(employee);
			
			//添加一条员工记录对应的要添加一条user表的记录
			UserEntity user = new UserEntity();
			user.setUserAccount(employee.getUserAccount());
			user.setUserName(employee.getEmployeeName());
			user.setUserPass(employee.getUserPass());
			user.setTelPhone(employee.getPhone());
			String roleId = roleService.selectOneEntityByRoleCode(employee.getRole()).getRoleId();
			user.setRole(roleId);
			userService.saveUserEntity(user);
			
		}catch(Exception e){
			MisLog.error(log, "录入员工失败",e);
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		if (result > 0)
			return "redirect:/pages/employee/employeeList.jsp";
		return "redirect:/exception.jsp";
	}
	
	/**
	 * 编辑员工信息
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String editEmployee(Model model, @PathVariable("id") String id) {
		MisLog.info(log, "编辑员工信息");
		
		aadEmployee(model);
	
		try {
			EmployeeEntity employee = employeeService.findEmployeeById(id);
			//以逗号分割skills
			String[] skillList = employee.getSkill().split(",");
			
			model.addAttribute("employee", employee);
			model.addAttribute("skillLists", skillList);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return MODULE_EDIT_PAGE;
	}
	
	/**
	 * 查看员工信息
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/employeeInfo/{id}", method = RequestMethod.GET)
	public String employeeInfo(Model model, @PathVariable("id") String id) {
		MisLog.info(log, "查看员工信息");
		
		aadEmployee(model);
		
		List<EmployeeVo> employeeVos = employeeService.findFileNameAndTime(id);
		try {
			EmployeeEntity employee = employeeService.findEmployeeById(id);
			TrainingEntity train = trainingService.findTrainingEntityInfo(id);
			columnTransformation(employee);
			
			model.addAttribute("employee", employee);
			model.addAttribute("employeeVos", employeeVos);
			model.addAttribute("train", train);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return MODULE_INFO_PAGE;
	}

	/**
	 * 修改分区数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "updataEmployee", method = RequestMethod.POST)
	public String updataArea(EmployeeEntity employee, Model model) {
		MisLog.info(log, "修改员工数据");
		try {
			employeeService.updateEmployee(employee);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(), e);
			model.addAttribute("error", "修改应用信息出错！");
			return "redirect:/pages/exception";
		}

		return "redirect:/pages/employee/employeeList.jsp";

	}

	/**
	 * 删除员工数据
	 * 
	 * @return
	 */

	@ResponseBody
	@RequestMapping(value = "/deleteEmployee", method = RequestMethod.POST)
	public String deleteEmployee(String ids) {
		MisLog.info(log, "删除分区数据");
		JSONObject json = JSONObject.parseObject("{}");
		try {
			employeeService.deleteEmployee(ids);
			//修改user表中对应员工的状态
			EmployeeEntity employeeEntity = employeeService.findEmployeeById(ids);
			String userAccount = employeeEntity.getUserAccount();
			UserEntity user = userService.login(userAccount);
			userService.deleteOneUserEntity(user.getUserId());
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage());
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}

	/**
	 * 文件下载
	 * 
	 * @param request
	 *            httpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @param fileName
	 *            文件名
	 * @return
	 */
	@RequestMapping(value = "/downloadExcel")
	public String downloadExcel(HttpServletRequest request, HttpServletResponse response, String fileName) {
		String filePath = request.getServletContext().getRealPath("") + "\\download\\" + fileName;
		System.out.println(filePath);
		FileUtil.downloadFile(response, filePath, Boolean.FALSE);
		return null;
	}

	/**
	 * 用户批量导入
	 * 
	 * @param uploadFile
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/uploadExcel", method = RequestMethod.POST)
	public String asyncUploadFile(HttpServletRequest request,
			@RequestParam(value = "uploadFile") MultipartFile uploadFile) {
		MisLog.error(log, "文件上传");
		JSONObject json = JSONObject.parseObject("{}");
		try {
			InputStream in = uploadFile.getInputStream();
			ExcelImportUtil excel = new ExcelImportUtil();
			List<Map<String,Object>> employees = excel.getBankListMapByExcel(in,uploadFile.getOriginalFilename());
			for (Map map : employees) {
				EmployeeEntity employeeEntity = new EmployeeEntity();
				//对date类型的转换
				ConvertUtils.register(new DateTimeConverter(), Date.class);
				//对应实体
                BeanUtils.populate(employeeEntity,map);
                employeeEntity.setId(UuidUtil.getUuid32().toString());
                employeeService.addEmployee(employeeEntity);
			}
			
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
			json.put("msg", "成功导入条数据");
		} catch (Exception e) {
			MisLog.error(log, "批量导入用户到数据库出现错误", e);
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
			json.put("msg", "批量导入用户到数据库出现错误");
		}
		MisLog.info(log, json.toJSONString());
		return json.toJSONString();
	}
	
	//将表中存的code转换成name
		public void columnTransformation(EmployeeEntity employeeEntity) {
			//循环和判断由SQL来做的
			String constantVoAbilityLevel = ""; 
			String constantVoSkill = ""; 
			String constantVoSchool = "";
			String constantVoNation = "";
			String constantVoEducation = "";
			
			//转换能力级别
			String abilityLevel = employeeEntity.getAbilityLevel(); 
			constantVoAbilityLevel = constantService.returnDictNameAndCode(abilityLevel,GlobalCodeConstant.AbilityLevel_CODE);
			employeeEntity.setAbilityLevel(constantVoAbilityLevel);
			//转换技能
			String skill = employeeEntity.getSkill();
			constantVoSkill = constantService.returnDictNameAndCode(skill,GlobalCodeConstant.Skills_CODE);
			employeeEntity.setSkill(constantVoSkill);
			//转换学校
			String schoolName = employeeEntity.getSchoolName();
			constantVoSchool = constantService.returnDictNameAndCode(schoolName,GlobalCodeConstant.SchoolName_CODE);
			employeeEntity.setSchoolName(constantVoSchool);
			//转换民族
			String nation = employeeEntity.getNation();
			constantVoNation = constantService.returnDictNameAndCode(nation,GlobalCodeConstant.Nation_CODE);
			employeeEntity.setNation(constantVoNation);
			//转换学历
			String eduction = employeeEntity.getEducation();
			constantVoEducation = constantService.returnDictNameAndCode(eduction,GlobalCodeConstant.Education_CODE);
			employeeEntity.setEducation(constantVoEducation);
			//转换角色
			String role = employeeEntity.getRole();
			String roleCode = roleService.selectOneEntityByRoleCode(role).getRoleName();
			employeeEntity.setRole(roleCode);
			//转换期数
			String issueId = employeeEntity.getIssueId();
			String issue = trainingService.findTrainingEntityInfo(issueId).getIssue();
			employeeEntity.setIssueId(issue);
			//转换分区
			String areaId = employeeEntity.getAreaId();
			String area = areaService.findAreatEntityInfo(areaId).getAreaName();
			employeeEntity.setAreaId(area);
		}
}
