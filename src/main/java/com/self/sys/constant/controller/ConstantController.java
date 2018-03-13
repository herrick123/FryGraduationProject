package com.self.sys.constant.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.core.constant.GlobalCodeConstant;
import com.core.util.DateTimeConverter;
import com.core.util.ExcelImportUtil;
import com.core.util.MisLog;
import com.core.util.Page;
import com.core.util.UuidUtil;
import com.github.pagehelper.PageInfo;
import com.self.employee.entity.EmployeeEntity;
import com.self.sys.constant.entity.ConstantEntity;
import com.self.sys.constant.service.ConstantService;
import com.self.sys.dictionary.entity.DictionaryEntity;
import com.self.sys.dictionary.service.DictionaryService;

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

import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * 数据字典分类对应值controller
 * @author SAMSUNG
 * @version 1.0
 * @email 1635335126@qq.com
 */

@Controller()
@RequestMapping("/constant")
public class ConstantController {

private static final Logger log = LoggerFactory.getLogger(ConstantController.class);
	
	private static String CONSTANT_LIST_PAGE = "/sys/constant/constantList";//应用列表页面
	private static String CONSTANT_ADD_PAGE = "/sys/constant/addConstant";//新增应用页面
	private static String CONSTANT_EDIT_PAGE = "/sys/constant/editConstant";//编辑应用页面
	
	@Autowired
	private ConstantService contService;
	
	@Autowired
	private DictionaryService dictionaryService;
	
	/**
	 * 展示数据字典分类对应值
	 * @return
	 */
	@RequestMapping(value = "/page")
	public String constantPage(Model model){
		MisLog.info(log, "展示数据字典分类对应值！");
		try {
			List<DictionaryEntity> dictList = dictionaryService.findAllDict();
			model.addAttribute("dictList", dictList);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(),e);
		}
		
		return CONSTANT_LIST_PAGE;
	}
	
	/**
	 * 分页查询数据字典分类对应值
	 * @param gridPager
	 * @return
	 */
	@ResponseBody
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/pageList",method = RequestMethod.POST)
	public String findConstantPage(String gridPager){
		MisLog.info(log, "查询数据字典分类值分页信息！");
		JSONObject json = JSONObject.parseObject(gridPager);
		JSONObject constantJson = json.getJSONObject("parameters");
		MisLog.info(log, constantJson.toJSONString());
		Page<ConstantEntity> page = JSONObject.toJavaObject(json, Page.class);
		ConstantEntity constantEntity = JSONObject.toJavaObject(constantJson, ConstantEntity.class);
		//不知道为什么，这里通过json不能转换为对象，所有手动添加
		if(constantJson.get("dictionaryId")!=null){
			constantEntity.setdictionaryId(constantJson.get("dictionaryId").toString());
		}
		
		List<ConstantEntity> constantList = this.contService.findConstantEntity(constantEntity, page);
		PageInfo<ConstantEntity> pageInfo = new PageInfo<ConstantEntity>(constantList);
		page = new Page<ConstantEntity>(pageInfo);
		return JSONObject.toJSONString(page);
	}
	
	/**
	 * 新增数据字典
	 * @return
	 */
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public String addConstant(Model model,String dictionaryId){
		MisLog.info(log, "新增数据字典分类值！");
		try {
			DictionaryEntity dictionary = dictionaryService.findDictEntityInfo(dictionaryId);
			model.addAttribute("dictionary", dictionary);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage());
		}
		return CONSTANT_ADD_PAGE;
	}
	
	/**
	 * 存储数据字典信息-新增
	 * @param constant
	 * @return
	 */
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String saveConstant(ConstantEntity constant,Model model){
		MisLog.info(log, "存储新增数据字典信息！");
		try {
			contService.saveConstant(constant);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(),e);
			model.addAttribute("error", "新增数据字典信息出错！");
			return "/exception";
		}
		return "redirect:/constant/page";
	}
	
	/**
	 * 批量删除数据字典信息
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete",method = RequestMethod.POST)
	public String deleteConstant(String[] ids){
		MisLog.info(log, "批量删除数据字典信息！");
		JSONObject json = JSONObject.parseObject("{}");
		try{
			contService.deleteConstants(ids);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		}catch(Exception e){
			MisLog.error(log, "批量删除数据字典失败",e);
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}
	
	/**
	 * 编辑数据字典数据信息
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/edit/{id}",method = RequestMethod.GET)
	public String editConstant(Model model,@PathVariable("id") String id){
		MisLog.info(log, "查询数据字典数据信息！");
		try {
			ConstantEntity constant = this.contService.searchConstantById(id);
			DictionaryEntity dictionary = dictionaryService.findDictEntityInfo(constant.getdictionaryId());
			model.addAttribute("dictionary", dictionary);
			model.addAttribute("constant", constant);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(),e);
		}
		return CONSTANT_EDIT_PAGE;
	}
	
	/**
	 * 修改数据字典信息
	 * @param model
	 * @param constant
	 * @return
	 */
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public String updateApp(Model model,ConstantEntity constant){
		MisLog.info(log, "修改数据字典信息！");
		try {
			contService.updateConstantEntity(constant);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(), e);
			model.addAttribute("error", "修改数据字典信息出错！");
			return "/exception";
		}
		return "redirect:/constant/page";
	}
	
	/**
	 * 数据校验
	 * @param valueName
	 * @param id
	 * @param dispalyIndex
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/check",method = RequestMethod.POST)
	public String dataCheck(String valueName,String id,String dictionaryId,String valueCode){
		MisLog.info(log, "数据字典分类值数据检验");
		JSONObject json = JSONObject.parseObject("{}");
		json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		Map<String,String> params = new HashMap<String,String>();
		Map<String, String> notIn = new HashMap<String,String>();
		notIn.put("id", id);
		if (valueName != null && id == null) {
			//同一字典类别下不能重名，不同类别下可以重名
			params.put("valueName", valueName);
			params.put("dictionaryId", dictionaryId);
			if (contService.findConstantByParams(params) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该字典名称已经存在，请重新填写！");
			}
		}
		if(valueCode != null && id == null){
			params.clear();
			params.put("valueCode", valueCode);
			if (contService.findConstantByParams(params) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该字典类型编码已经存在，请重新填写！");
			}
		}
		if (valueName != null && dictionaryId != null && id != null) {
			String[] arr = {"value_Name",valueName,"DICTIONARY_ID",dictionaryId};
			Map<String, String> notEqual = new HashMap<>();
			notEqual.put("id", id);
			if(contService.findConstantEntityByOr(arr, notEqual)>0){
				json.put("returncode",GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "更改后的字典字典名已存在");
			}
		}
		if ( dictionaryId != null && valueCode != null && id != null) {
			String[] arr = {"value_Code",valueCode,"DICTIONARY_ID",dictionaryId};
			Map<String, String> notEqual = new HashMap<>();
			notEqual.put("id", id);
			if(contService.findConstantEntityByOr(arr, notEqual)>0){
				json.put("returncode",GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "更改后的字典类型编码已存在");
			}
		}
		return json.toJSONString();
	}
	/**
	 * 查询字典分类，转化为json格式返回
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
		json.put("text", "字典分类树");
		json.put("state", state);
		//从数据库中查出所有的应用
		List<DictionaryEntity> dicList = dictionaryService.listAllDictionary();
		JSONArray jsonArray = new JSONArray();
		for(DictionaryEntity dic:dicList){
			JSONObject json2 = JSONObject.parseObject("{}");
			json2.put("id", dic.getId());
			json2.put("text", dic.getTypeName());
			jsonArray.add(json2);
		}
		json.put("children", jsonArray);
		MisLog.info(log, json.toString());
		return "["+json.toJSONString()+"]";
	}
	
	/**
	 * 数据字典批量导入
	 * @param uploadFile
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/uploadExcel", method = RequestMethod.POST)
	public String asyncUploadFile(HttpServletRequest request,
			@RequestParam(value = "uploadFile") MultipartFile uploadFile) {
		MisLog.error(log, "数据字典的Excel上传");
		JSONObject json = JSONObject.parseObject("{}");
		try {
			InputStream in = uploadFile.getInputStream();
			ExcelImportUtil excel = new ExcelImportUtil();
			List<Map<String,Object>> constants = excel.getBankListMapByExcel(in,uploadFile.getOriginalFilename());
			for (Map map : constants) {
				ConstantEntity constantEntity = new ConstantEntity();
//				EmployeeEntity employeeEntity = new EmployeeEntity();
				//对date类型的转换
				ConvertUtils.register(new DateTimeConverter(), Date.class);
				//对应实体
                BeanUtils.populate(constantEntity,map);
                constantEntity.setId(UuidUtil.getUuid32().toString());
                contService.saveConstant(constantEntity);
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
}
