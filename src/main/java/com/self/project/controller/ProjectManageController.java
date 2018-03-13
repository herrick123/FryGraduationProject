package com.self.project.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.core.constant.GlobalCodeConstant;
import com.core.util.MisLog;
import com.core.util.Page;
import com.github.pagehelper.PageInfo;
import com.mysql.jdbc.StringUtils;
import com.self.project.entity.ProjectManageEntity;
import com.self.project.service.ProjectManageSerivce;
import com.self.project.vo.projectManageVo;
import com.self.projectEmp.entity.ProjectEmployee;
import com.self.sys.constant.entity.ConstantEntity;
import com.self.sys.constant.service.ConstantService;
import com.self.sys.dictionary.entity.DictionaryEntity;
import com.self.sys.dictionary.service.DictionaryService;

@Controller
@RequestMapping("/projectManage")
public class ProjectManageController {
	private static final Logger log = LoggerFactory.getLogger(projectManageVo.class);
	private static String PROJECTMANAGE_LIST_PAGE = "/project/projectManageIndex";//展示项目列表数据
	private static String PROJECTMANAGE_ADD_PAGE = "/project/addProjectManage";// 新增项目基本信息页面
	private static String PROJECTSKILL_ADD_PAGE = "/project/addProjectManageSkill";// 为项目添加技能标签的页面
	private static String Dictionary_ID = "753b3ff0-d4cd-4170-bc73-8574ae6f2c5f";// 技能标签id
	private static String AbilityLevel_ID = "a8e08b02-74f6-49e1-b868-10d9e8cbc6b8";// 技能等级id
	private static String ProjectTypeName_ID = "8599bb1d-0156-4653-bdcf-9032b5cb321b";//项目类型ID
	private static String PROJECTMANAGESTU_EDIT_PAGE = "/project/editProjectManageStu";//编辑分区列表页面
	@Autowired
	private ProjectManageSerivce projectManageService;
	@Autowired
	private DictionaryService dictionaryService;
	@Autowired
	private ConstantService constantService;

	
	/**
	 * 展示项目列表数据
	 * @return
	 */
	@RequestMapping(value="/page")
	public String ProjectPage(){
		return PROJECTMANAGE_LIST_PAGE;
	}
	
	
	/**
	 * 分页项目管理页面
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/projectManageList")
	public String projectManageList(HttpServletRequest request,Model model,String gridPager){
		MisLog.info(log, "展示项目管理页面");
		JSONObject json = JSONObject.parseObject(gridPager);
		JSONObject projson = json.getJSONObject("parameters");
		MisLog.info(log, json.toJSONString());
		Page<ProjectManageEntity> page = JSONObject.toJavaObject(json, Page.class);
		ProjectManageEntity proManage = (ProjectManageEntity)JSONObject.toJavaObject(projson, ProjectManageEntity.class);	
		projectManageVo proManageVo = (projectManageVo)JSONObject.toJavaObject(projson,projectManageVo.class);
		List<ProjectManageEntity> proManageList = this.projectManageService.getProManageList(proManage, page);		
		//迭代取出项目Id
		Iterator projectId = proManageList.iterator();
		List<String> employeeNameList = new ArrayList<>();
		while(projectId.hasNext()){
			 proManage = (ProjectManageEntity) projectId.next();
			 String proId = proManage.getId().toString();			 
			 //根据项目id 获取项目人员 list
			 List<projectManageVo> proManageVos = projectManageService.getEmployeeName(proId, proManageVo);
			 //循环拿出项目人员数据
			 for(int i = 0; i<proManageVos.size();i++){
				 	String strEmployeeName = proManageVos.get(i).getEmployeeName();
				 	employeeNameList.add(strEmployeeName);
				 	System.out.println("---------------"+employeeNameList);
				}
			 	String strStaff = org.apache.commons.lang.StringUtils.join(employeeNameList, ",");
			 	for(ProjectManageEntity proManageEntity : proManageList){
			 		if(proId.equals(proManageEntity.getId())){
			 			proManageEntity.setStaff(strStaff);
			 			projectManageService.updateProjectManage(proManageEntity);
			 		}
			 	}
			 	employeeNameList.clear();
			}
		//获得项目类型的标签
		String projecttypeId = ProjectTypeName_ID;
		DictionaryEntity dictionary_projecttypename = dictionaryService.findDictEntityInfo(projecttypeId);
		List<ConstantEntity> projecttypenames = constantService.findConstantByDictId(dictionary_projecttypename.getId());
		for(ConstantEntity constantEntity : projecttypenames){
			for(ProjectManageEntity proManageEntity : proManageList){
				if(proManageEntity.getType().equals(constantEntity.getValueCode())){
					proManageEntity.setType(constantEntity.getValueName());
				}
			}
		}
		//获得项目技术的标签
		String skillId = Dictionary_ID;
		DictionaryEntity dictionary_skill = dictionaryService.findDictEntityInfo(skillId);
		List<ConstantEntity> skills = constantService.findConstantByDictId(dictionary_skill.getId());
		for(ProjectManageEntity proManageEntity : proManageList){
			if(proManageEntity.getProjectSkill()!=null ){
				String flag="";
				String[] skilllist =  proManageEntity.getProjectSkill().split(",");
				for(int i =0 ;i<skilllist.length ;i++){					
					for(ConstantEntity constantEntity : skills){
						if (constantEntity.getValueCode().equals(skilllist[i])){
							if (i!=0){
								flag +=","+constantEntity.getValueName();
								System.out.print("-----------------"+flag);
							}else{
								flag =constantEntity.getValueName();
							}
						}
					}
					
				}
				proManageEntity.setProjectSkill(flag);
			}else{
				continue;
			}
		}		
		
		PageInfo<ProjectManageEntity> pageInfo = new PageInfo<ProjectManageEntity>(proManageList);
		page = new Page<ProjectManageEntity>(pageInfo);
		String result = JSONObject.toJSONString(page);
		MisLog.info(log, result);
		return result;
		
		
	}
	/**
	 * 新增项目管理列表数据
	 * @return
	 */
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public String addProjectManage(ProjectManageEntity projectManage, Model model){
		String skillId = Dictionary_ID;
		String ability = AbilityLevel_ID;
		String projecttypeId = ProjectTypeName_ID;
		//获得技能的所有标签
		DictionaryEntity dictionary_skill = dictionaryService.findDictEntityInfo(skillId);
		List<ConstantEntity> skills = constantService.findConstantByDictId(dictionary_skill.getId());
		//获得所有能力级别的标签
		DictionaryEntity dictionary_ability = dictionaryService.findDictEntityInfo(ability);
		List<ConstantEntity> abilities = constantService.findConstantByDictId(dictionary_ability.getId());
		//获得所有项目类型的标签
		DictionaryEntity dictionary_projecttypename = dictionaryService.findDictEntityInfo(projecttypeId);
		List<ConstantEntity> projecttypenames = constantService.findConstantByDictId(dictionary_projecttypename.getId());
		model.addAttribute("skills",skills);
		model.addAttribute("abilityLevels",abilities);
		model.addAttribute("types",projecttypenames);
		
		
		return PROJECTMANAGE_ADD_PAGE;
		
	}
/*	*//**
	 * 新增项目技能标签
	 * @return
	 */
	@RequestMapping(value="/addProjeceSkill/{id}",method = RequestMethod.GET)
	public String addProjectSkillManage(ProjectManageEntity projectManage, @PathVariable("id") String id,Model model){
		String projectSkillId = Dictionary_ID;
		//获得技能的所有标签
		DictionaryEntity dictionary_skill = dictionaryService.findDictEntityInfo(projectSkillId);
		List<ConstantEntity> projectSkills = constantService.findConstantByDictId(dictionary_skill.getId());
		for (ConstantEntity constantEntity : projectSkills) {
			System.out.println("项目类型"+constantEntity.getValueName());
		}
		/*List<ProjectManageEntity> projectManageSkill = projectManageService.findProjectManageSkill(projectManage);*/
		String projectSkillss = projectManageService.findProjectManageSkill(id);
		String[] str = null;
		
		if(projectSkillss == null ){
			model.addAttribute("projectSkills",projectSkills);
			model.addAttribute("id", id);
			return PROJECTSKILL_ADD_PAGE;
		}
		str = projectSkillss.split(",");
		List<String> strList = Arrays.asList(str);
		model.addAttribute("strList", strList);
		model.addAttribute("projectSkills",projectSkills);
		model.addAttribute("id", id);	
		return PROJECTSKILL_ADD_PAGE;
		
		
	}
	
	
	
	
	/**
	 * 分页查询员工数据
	 * 
	 * @param model
	 * @param getidpager
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/pageList",method = RequestMethod.POST)
	public String findProjectManageStuList(Model model,String gridPager){
		MisLog.info(log, "查询员工分页数据！");
		JSONObject json = JSONObject.parseObject(gridPager);
		JSONObject employeeJson = json.getJSONObject("parameters");
		Page<projectManageVo> page =  JSONObject.toJavaObject(json, Page.class);
		projectManageVo proManage = JSONObject.toJavaObject(employeeJson,projectManageVo.class);
		String[] skills;
		if(proManage.getSkill()==null){
			skills = null;
		}else{
			String str = proManage.getSkill().substring(1, proManage.getSkill().length()-1);
			String[] strr = str.split(",");
		    skills = new String[strr.length];
			for(int i = 0;i<strr.length;i++){
				skills[i] = strr[i].substring(1, strr[i].length()-1);
			}
		}
		List<projectManageVo> projectManageStuList = projectManageService.findProjectManageStudent(skills, proManage,page);
		

		//获得能力级别的标签
		String ability = AbilityLevel_ID;
		DictionaryEntity dictionary_ability = dictionaryService.findDictEntityInfo(ability);
		List<ConstantEntity> abilities = constantService.findConstantByDictId(dictionary_ability.getId());
		for(ConstantEntity constantEntity : abilities){
			for(projectManageVo proManageStuVo : projectManageStuList){
				if(proManageStuVo.getAbilityLevel().equals(constantEntity.getValueCode())){
					proManageStuVo.setAbilityLevel(constantEntity.getValueName());
				}
			}
		}
		//获得技能的标签
		String skillId = Dictionary_ID;
		DictionaryEntity dictionary_skill = dictionaryService.findDictEntityInfo(skillId);
		List<ConstantEntity> skillss = constantService.findConstantByDictId(dictionary_skill.getId());
		for(projectManageVo proManageStuVo : projectManageStuList){

				String flag="";
				String[] skilllist =  proManageStuVo.getSkill().split(",");
				for(int i =0 ;i<skilllist.length ;i++){
					
					for(ConstantEntity constantEntity : skillss){
						if (constantEntity.getValueCode().equals(skilllist[i])){
							if (i!=0){
								flag +=","+constantEntity.getValueName();
								System.out.print("-----------------"+flag);
							}else{
								flag =constantEntity.getValueName();
							}
						}
					}
					
				}
				proManageStuVo.setSkill(flag);			
		}		
		PageInfo<projectManageVo> pageInfo = new PageInfo<projectManageVo>(projectManageStuList);
		page = new Page<projectManageVo>(pageInfo);
		String result =  JSONObject.toJSONString(page);
		MisLog.info(log, result);
		return result;
		
	}
	/**
	 * 新增项目基本信息数据
	 * @return
	 */
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String saveProjectManage(ProjectManageEntity projectManage  ,Model model,@RequestParam("employeeId") String employeeId,String gridPager){
		String strEmployeeId = projectManage.getEmployeeId().substring(1);
		MisLog.info(log, "新增项目基本信息数据");
		projectManageService.saveProjectManage(projectManage);
		ProjectEmployee projectEmployee= new ProjectEmployee();
		String projectId = projectManage.getId();
		String[] employeeIds = strEmployeeId.split(",");
		for(int i = 0 ; i<employeeIds.length;i++){
			projectEmployee.setProjectId(projectId);
			projectEmployee.setEmployeeId(employeeIds[i]);
			projectEmployee.setStatus("1");			
			projectManageService.saveProjectEmployee(projectEmployee);
		}	
		return "redirect:/pages/project/projectManageIndex.jsp";
	}
	/**
	 * 删除分区数据
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteProjectManage",method = RequestMethod.POST)
	public String deleteProjectManage(String[] ids){
		MisLog.info(log, "删除分区数据");
		JSONObject json = JSONObject.parseObject("{}");
		try {
			projectManageService.deleteProjectManage(ids);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage());
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		
		return json.toJSONString();
	}
	/**
	 * 编辑项目基本详情数据
	 * @return
	 */
	@RequestMapping(value="/updataProjectManage{id}",method = RequestMethod.GET)
	public String editProjectManage(Model model,@RequestParam("id") String id){
		
		MisLog.info(log, "编辑项目基本详情数据");
		try {
			String projecttypeId = ProjectTypeName_ID;
			String skillId = Dictionary_ID;
			ProjectManageEntity projectManageEntity = this.projectManageService.findProjectEntityInfo(id);
			//获得所有项目类型的标签
			DictionaryEntity dictionary_projecttypename = dictionaryService.findDictEntityInfo(projecttypeId);
			List<ConstantEntity> projecttypenames = constantService.findConstantByDictId(dictionary_projecttypename.getId());
			for (ConstantEntity constantEntity : projecttypenames) {
				System.out.println("项目类型"+constantEntity.getValueName());
			}
			String[] str =null;
			str = projectManageEntity.getStaff().split("、");
			for(int i = 0 ;i<str.length;i++){
				System.out.println("----------------"+str[i]);	
			}
			List<String> sList = Arrays.asList(str);
			System.out.println("--------------:"+sList);
			if(projectManageEntity.getStaff()==null || projectManageEntity.getStaff().trim().equals("")){
				DictionaryEntity dictionary_skill = dictionaryService.findDictEntityInfo(skillId);
				List<ConstantEntity> skills = constantService.findConstantByDictId(dictionary_skill.getId());
				model.addAttribute("skills",skills);
				model.addAttribute("types",projecttypenames);
				model.addAttribute("projectManageEntity",projectManageEntity);
				return PROJECTMANAGESTU_EDIT_PAGE;
			}
			DictionaryEntity dictionary_skill = dictionaryService.findDictEntityInfo(skillId);
			List<ConstantEntity> skills = constantService.findConstantByDictId(dictionary_skill.getId());
			model.addAttribute("skills",skills);
			model.addAttribute("types",projecttypenames);
			model.addAttribute("projectManageEntity",projectManageEntity);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			MisLog.error(log, e.getMessage(),e);
		}
		return PROJECTMANAGESTU_EDIT_PAGE;
		
	}
	/**
	 * 编辑项目基本详情数据2
	 * @return
	 */
	@RequestMapping(value="/updataProjectManageSkill{id}",method = RequestMethod.GET)
	public String editProjectManageSkill(ProjectManageEntity projectManageEntity ,Model model,@RequestParam("id") String id){
		
		MisLog.info(log, "编辑项目基本详情数据");
		/*String projecttypeId = ProjectTypeName_ID;*/
		try {
			projectManageService.findProjectManageSkill(id);
			projectManageService.updateProjectManage(projectManageEntity);

			model.addAttribute("projectManageEntity",projectManageEntity);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			MisLog.error(log, e.getMessage(),e);
		}
		return PROJECTMANAGE_LIST_PAGE;
		
	}
	/**
	 * 修改项目数据
	 * @return
	 */
	@RequestMapping(value="updataStu",method = RequestMethod.POST)
	public String updataArea(ProjectManageEntity projectManageEntiy,ProjectEmployee projectEmployee  ,Model model,@RequestParam("employeeId") String employeeId,@RequestParam("id") String id){
		String strEmployeeId = projectManageEntiy.getEmployeeId().substring(1);
		String strProjectIds = projectManageEntiy.getId().substring(1);
		String[] employeeIds = strEmployeeId.split(",");
		String projectId = strProjectIds;
		for(int i = 0 ; i<employeeIds.length;i++){
			projectEmployee.setProjectId(projectId);
			projectEmployee.setEmployeeId(employeeIds[i]);
			projectManageService.saveProjectEmployee(projectEmployee);
		}
		MisLog.info(log, "修改分区数据");
		try {
			projectManageService.updateProjectManage(projectManageEntiy);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(),e);
			model.addAttribute("error", "修改应用信息出错！");
			return "/exception";
		}
		
		return "redirect:/pages/project/projectManageIndex.jsp";
		
	}
	
	
	
	/**
	 * 数据校验
	 * @param projectName
	 * @param id
	 * @param projectCode
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/check",method = RequestMethod.POST)
	public String dataCheck(String projectName,String id,String projectCode,String type){
		MisLog.info(log, "数据字典数据检验");
		JSONObject json = JSONObject.parseObject("{}");
		json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		Map<String,String> params = new HashMap<String,String>();
		Map<String, String> notIn = new HashMap<String,String>();
		notIn.put("id", id);
		if(projectName != null && id ==null){
			params.put("projectName", projectName);
			if(projectManageService.findProjectManageEntityByParams(params)>0){
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该项目名称已经存在，请重新填写！");
			}
		}
		if(projectCode != null && id ==null){
			params.put("projectCode", projectCode);
			if(projectManageService.findProjectManageEntityByParams(params)>0){
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该项目编号已经存在，请重新填写！");
			}
		}
		if (projectName != null && id != null) {
			params.clear();
			params.put("projectName", projectName);
			if (projectManageService.findProjectManageByParams(params, notIn) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该分区名称已经存在，请重新填写！");
			}
		}
		if (projectCode != null && id != null) {
			params.clear();
			params.put("projectCode", projectCode);
			if (projectManageService.findProjectManageByParams(params, notIn) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该分区名称已经存在，请重新填写！");
			}
		}
		return json.toJSONString();
	}
}
