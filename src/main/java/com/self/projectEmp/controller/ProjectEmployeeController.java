package com.self.projectEmp.controller;

import java.sql.Date;
import java.util.List;

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
import com.core.util.MisLog;
import com.core.util.Page;
import com.core.util.TimeUtil;
import com.github.pagehelper.PageInfo;
import com.self.projectEmp.entity.ProjectEmployee;
import com.self.projectEmp.service.ProjectEmployeeService;
import com.self.sys.constant.entity.ConstantEntity;
import com.self.sys.constant.service.ConstantService;
/**
 * 
 * 项目—员工controller
 * @author donghc
 * 
 * */
@Controller
@RequestMapping("/proEmp")
public class ProjectEmployeeController {
	private static final Logger log = LoggerFactory.getLogger(ProjectEmployeeController.class);
	private static String MODULE_LIST_PAGE = "/projectEmp/projectEmpList";// 查询列表页面
	private static String MODULE_LIST_ADDPAGE = "/projectEmp/addProjectEmployee";// 查询列表页面
	private static String EXCEPTION_PAGE = "/exception";// 报错页面
	@Autowired
	private ProjectEmployeeService projectEmployeeService;
	@Autowired
	private ConstantService constantService;
	/**
	 * 
	 * 项目成员列表
	 * @param id
	 * @param projectName
	 * 
	 * */
	@RequestMapping(value="/page",method=RequestMethod.GET)
	public String empPage(String id,String projectName,Model model){
		//项目id
		model.addAttribute("ids", id);
		model.addAttribute("projectName", projectName);
		return MODULE_LIST_PAGE ;
	}
	/**
	 * 传入项目id 查询项目成员
	 * @param id
	 * */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/pageList",method=RequestMethod.POST)
	public String queryEmp(Model model, String gridPager){
		MisLog.info(log, "查询分页数据！");
		JSONObject json=JSONObject.parseObject(gridPager);
		JSONObject empjson = json.getJSONObject("parameters");
		MisLog.info(log, json.toJSONString());
		Page<ProjectEmployee> page=JSONObject.toJavaObject(json,Page.class);
		ProjectEmployee projectEmp=JSONObject.toJavaObject(empjson, ProjectEmployee.class);
		List<ProjectEmployee> empList=this.projectEmployeeService.findProjectEmployeePage(projectEmp, page);
		//转换技能
		for (ProjectEmployee projectEmployee : empList) {
			/*if(projectEmployee.getJudgeTime()==null){
				
			}*/
			if(projectEmployee.getSkill()!=null&&projectEmployee.getSkill()!=""){
				String constantVoSkill = ""; 
				String skill = projectEmployee.getSkill();
				constantVoSkill = constantService.returnDictNameAndCode(skill,GlobalCodeConstant.Skills_CODE);
				projectEmployee.setSkill(constantVoSkill);
			}
		}
		PageInfo<ProjectEmployee> pageInfo = new PageInfo<ProjectEmployee>(empList);
		page = new Page<ProjectEmployee>(pageInfo);
		String result = JSONObject.toJSONString(page);
		MisLog.info(log, result);
		MisLog.info(log, "查询结束");
		return result;
	}
	/**
	 * 添加评语页面
	 * 查询一个信息传入
	 * 
	 * */
	@RequestMapping(value="/savePage",method=RequestMethod.GET)
	public String saveProjectEmployee(String id,String employeeId,String projectId,String projectName,Model model){
		//获得技能的所有标签
		List<ConstantEntity> skills = constantService.searchConstantByCode(GlobalCodeConstant.Skills_CODE);
		model.addAttribute("id", id);
		model.addAttribute("skills", skills);
		model.addAttribute("projectId", projectId);
		model.addAttribute("employeeId", employeeId);
		model.addAttribute("projectName", projectName);
		return MODULE_LIST_ADDPAGE;
	}
	/**
	 * 添加评语
	 * @param projectEmp
	 * */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public String addProjectEmployee(ProjectEmployee projectEmp,Model model){
		MisLog.info(log,"添加评语");
		MisLog.info(log,projectEmp.toString());
		try {
			MisLog.info(log,"开始添加评语");
			projectEmployeeService.addProjectEmployee(projectEmp);
			model.addAttribute("ids",projectEmp.getProjectId());
			model.addAttribute("projectName", projectEmp.getProjectName());
			return MODULE_LIST_PAGE;
		} catch (Exception e) {
			MisLog.info(log,"添加失败");
			return EXCEPTION_PAGE;
		}
	}
}
