package com.mengma.mis.self.sys.dictionary.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.mengma.mis.core.constant.GlobalCodeConstant;
import com.mengma.mis.core.exception.DeleteException;
import com.mengma.mis.core.util.MisLog;
import com.mengma.mis.core.util.Page;
import com.mengma.mis.self.sys.constant.service.ConstantService;
import com.mengma.mis.self.sys.dictionary.entity.DictionaryEntity;
import com.mengma.mis.self.sys.dictionary.service.DictionaryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 数据字典管理controller
 * @author SAMSUNG
 * @version 1.0
 * @email 1635335126@qq.com
 */
@Controller
@RequestMapping("/dictionary")
public class DictionaryController {
	
	private static final Logger log = LoggerFactory.getLogger(DictionaryController.class);
	
	private static String DICT_LIST_PAGE = "/sys/dictionary/dictionaryList";//数据字典列表页面
	private static String DICT_ADD_PAGE = "/sys/dictionary/addDictionary";//新增数据字典页面
	private static String DICT_EDIT_PAGE = "/sys/dictionary/editDictionary";//编辑数据字典页面
	
	@Autowired
	private DictionaryService dictService;
	@Autowired
	private ConstantService constantService;
	/**
	 * 展现数据字典列表数据
	 * @return
	 */
	@RequestMapping(value = "/page")
	public String dictPage(){
		MisLog.info(log, "展现数据字典列表数据！");
		return DICT_LIST_PAGE;
	}
	
	/**
	 * 分页查询数据字典信息数据
	 * @param model
	 * @param gridPager
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/pageList",method = RequestMethod.POST)
	@SuppressWarnings("unchecked")
	public String findAllPageList(Model model,String gridPager){
		MisLog.info(log, "分页查询数据字典信息！");
		JSONObject json = JSONObject.parseObject(gridPager);
		JSONObject dictJson = json.getJSONObject("parameters");
		MisLog.info(log, dictJson.toJSONString());
		Page<DictionaryEntity> page = JSONObject.toJavaObject(json, Page.class);
		DictionaryEntity dict = JSONObject.toJavaObject(dictJson, DictionaryEntity.class);
		List<DictionaryEntity> dictList = this.dictService.findDictionaryPage(dict, page);
		PageInfo<DictionaryEntity> pageInfo = new PageInfo<DictionaryEntity>(dictList);
		page = new Page<DictionaryEntity>(pageInfo);
		return JSONObject.toJSONString(page);
	}
	
	/**
	 * 新增数据字典
	 * @return
	 */
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public String addDemo(){
		MisLog.info(log, "新增数据字典！");
		return DICT_ADD_PAGE;
	}
	
	/**
	 * 存储应用数据-新增
	 * @param dict
	 * @return
	 */
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String saveDictDemo(DictionaryEntity dict,Model model){
		MisLog.info(log, "存储新增数据字！");
		try {
			dictService.saveDictionary(dict);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(),e);
			model.addAttribute("error", "新增数据字典出错！");
			return "/exception";
		}
		return "redirect:/dictionary/page";
	}
	
	/**
	 * 批量删除数据字典信息
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete",method = RequestMethod.POST)
	public String deleteDemo(String[] ids){
		MisLog.info(log, " 批量删除数据字典信息！");
		JSONObject json = JSONObject.parseObject("{}");
		try{
			//删除字典分类之前应该删除分类中的数据
			constantService.deleteConstantsByDictionnaryId(ids);
			dictService.deleteDict(ids);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		}catch(DeleteException e){
			MisLog.error(log, e.getMessage());
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}
	
	/**
	 * 编辑数据字典
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/edit/{id}",method = RequestMethod.GET)
	public String editDemo(Model model,@PathVariable("id") String id){
		MisLog.info(log, "查询应用信息！");
		try {
			DictionaryEntity dict = this.dictService.findDictEntityInfo(id);
			model.addAttribute("dict", dict);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(),e);
		}
		return DICT_EDIT_PAGE;
	}
	
	/**
	 * 修改数据字典信息
	 * @param demo
	 * @return
	 */
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public String updateDemo(DictionaryEntity dict,Model model){
		MisLog.info(log, "修改应用信息！");
		try {
			dictService.updateDictionary(dict);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(),e);
			model.addAttribute("error", "修改应用信息出错！");
			return "/exception";
		}
		return "redirect:/dictionary/page";
	}
	
	/**
	 * 数据校验
	 * @param typeName
	 * @param id
	 * @param typeCode
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/check",method = RequestMethod.POST)
	public String dataCheck(String typeName,String id,String typeCode){
		MisLog.info(log, "数据字典数据检验");
		JSONObject json = JSONObject.parseObject("{}");
		json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		Map<String,String> params = new HashMap<String,String>();
		Map<String, String> notIn = new HashMap<String,String>();
		notIn.put("id", id);
		if (typeCode != null && id == null) {
			params.clear();
			params.put("typeCode", typeCode);
			if (dictService.findDictEntityByParams(params) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该字典类别值已经存在，请重新填写！");
			}
		}
		if (typeName != null && id == null) {
			params.clear();
			params.put("typeName", typeName);
			if (dictService.findDictEntityByParams(params) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该字典类别名称已经存在，请重新填写！");
			}
		}
		if (typeCode != null && id != null) {
			params.clear();
			params.put("typeCode", typeCode);
			if (dictService.findDictEntityByParams(params, notIn) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该字典类别值已经存在，请重新填写！");
			}
		}
		if (typeName != null && id != null) {
			params.clear();
			params.put("typeName", typeName);
			if (dictService.findDictEntityByParams(params, notIn) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该字典类别名称已经存在，请重新填写！");
			}
		}
		
		return json.toJSONString();
	}
	
}
