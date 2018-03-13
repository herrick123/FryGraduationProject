package com.self.training.controller;

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
import com.self.area.entity.AreaEntity;
import com.self.area.service.AreaService;
import com.self.employee.entity.EmployeeEntity;
import com.self.student.entity.Student;
import com.self.training.entity.TrainingEntity;
import com.self.training.service.TrainingService;


/**
 * 训练营controller
 * 
 * @author donghc
 * 
 * */
@Controller
@RequestMapping("/train")
public class TrainingController {
	
	private static final Logger log = LoggerFactory.getLogger(TrainingController.class);
	private static String MODULE_ADD_PAGE = "/training/addTrain";// 添加信息的页面
	private static String MODULE_LIST_PAGE = "/training/trainList";// 查询列表页面
	private static String MODULE_LIST_EMPPAGE = "/training/employeeList";// 查询列表页面
	private static String MODULE_EDIT_PAGE = "/training/editTrain";// 编辑页面
	private static String EXCEPTION_PAGE = "/exception";// 报错页面
	
	@Autowired
	private TrainingService trainingService;
	@Autowired
	private AreaService areaService;
	/**
	 * 展示列表数据
	 * @return
	 */
	@RequestMapping("/page")
	public String trainPage(){
		return MODULE_LIST_PAGE;
	}
	/**
	 * 展示员工列表数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "/emp/{id}")
	public String employeePage(@PathVariable("id") String id,Model model) {
		model.addAttribute("ids", id);
		return MODULE_LIST_EMPPAGE;
	}
	/**
	 * 添加信息页面
	 * 传入分区信息
	 * 
	 * 
	 * @return
	 * */
	@RequestMapping("/add")
	public String addTrain(Model model){
		List<AreaEntity> areaList=null;
		try {
			areaList=areaService.getAllArea();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("areaList",areaList);
		return MODULE_ADD_PAGE;
	}
	
	/**
	 * 验证分区与训练营期数
	 * 
	 * */
	@ResponseBody
	@RequestMapping(value = "/check",method = RequestMethod.POST)
	public String trainDataCheck(String issue,String id,String areaId){
		MisLog.info(log, "数据字典数据检验");
		JSONObject json = JSONObject.parseObject("{}");
		json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		Map<String,String> params = new HashMap<String,String>();
		Map<String, String> notIn = new HashMap<String,String>();
		notIn.put("id", id);
		if (issue != null && areaId != null&& id == null) {
			params.put("issue", issue);
			params.put("areaId", areaId);
			params.put("del_flag", "0");
			if (trainingService.findTrainEntityByParams(params)>0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该训练营期数已经存在，请重新填写！");
			}
		}
		if (issue != null && areaId != null && id != null) {
			params.clear();
			params.put("issue", issue);
			params.put("areaId", areaId);
			if (trainingService.findTrainEntityByParams(params, notIn) > 0) {
				
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该训练营期数已经存在，请重新填写！");
			}
		}
		
		return json.toJSONString();
	}
	/**
	 * 
	 * 编辑信息页面
	 * @return
	 * */
	@RequestMapping(value="/edit/{id}",method=RequestMethod.GET)
	public String editTrain(Model model,@PathVariable("id") String id){
		MisLog.info(log, "编辑更新！");
		TrainingEntity train=null;
		try {
			train=trainingService.findTrainingEntityInfo(id);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage());
		}
		model.addAttribute("train",train);
		return MODULE_EDIT_PAGE;
	}
	/**
	 * 添加信息
	 * @return
	 * */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public String saveTrain(TrainingEntity train,Model model){
		MisLog.info(log,"添加训练营");
		MisLog.info(log,train.toString());
		try {
			trainingService.saveTrainingEntity(train);
			return "redirect:/pages/training/trainList.jsp";
		} catch (Exception e) {
			MisLog.info(log,"添加失败");
			return EXCEPTION_PAGE;
		}
		
	}
	/**
	 * 
	 * 编辑信息
	 * @return
	 * */
	@RequestMapping(value="/editOne",method=RequestMethod.POST)
	public String checkTrain(Model model,TrainingEntity train){
		trainingService.updateTrainingEntity(train);
		MisLog.info(log,"编辑训练营");
		return MODULE_LIST_PAGE;
	}
	/**
	 * 
	 * 查询训练营分页数据
	 * 
	 * */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/pageList",method=RequestMethod.POST)
	public String queryTrain(Model model, String gridPager){
		MisLog.info(log, "查询训练营分页数据！");
		JSONObject json=JSONObject.parseObject(gridPager);
		JSONObject trainjson = json.getJSONObject("parameters");
		MisLog.info(log, json.toJSONString());
		Page<TrainingEntity> page=JSONObject.toJavaObject(json,Page.class);
		TrainingEntity train=JSONObject.toJavaObject(trainjson, TrainingEntity.class);
		List<TrainingEntity> trainList=this.trainingService.findTrainingPage(train, page);
		PageInfo<TrainingEntity> pageInfo = new PageInfo<TrainingEntity>(trainList);
		page = new Page<TrainingEntity>(pageInfo);
		String result = JSONObject.toJSONString(page);
		MisLog.info(log, result);
		MisLog.info(log, "查询结束");
		return result;
	}
	/**
	 * 查询训练营成员
	 * 
	 * */
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/pageEmpList",method=RequestMethod.POST)
	public String queryEmp(Model model, String gridPager,String issueId){
		MisLog.info(log, "查询分页数据！");
		JSONObject json=JSONObject.parseObject(gridPager);
		//String xsxh= request.getParameter("xsxh");
		JSONObject empjson = json.getJSONObject("parameters");
		MisLog.info(log, json.toJSONString());
		Page<EmployeeEntity> page=JSONObject.toJavaObject(json,Page.class);
		EmployeeEntity emp=JSONObject.toJavaObject(empjson, EmployeeEntity.class);
		List<EmployeeEntity> empList=this.trainingService.findEmployeeEntityInfo(emp,page);
		PageInfo<EmployeeEntity> pageInfo = new PageInfo<EmployeeEntity>(empList);
		page = new Page<EmployeeEntity>(pageInfo);
		String result = JSONObject.toJSONString(page);
		MisLog.info(log, result);
		MisLog.info(log, "查询结束");
		return result;
	}
	
	/**
	 * 删除
	 * 
	 * */
	@ResponseBody
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String deleteTrain(Model model,String[] ids){
		MisLog.info(log, "开始删除数据");
		JSONObject json = JSONObject.parseObject("{}");
		try {
			trainingService.deleteTrainingEntity(ids);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage());
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}	
		return json.toJSONString();
	}
}
