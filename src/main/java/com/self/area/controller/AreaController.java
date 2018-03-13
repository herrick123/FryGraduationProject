package com.self.area.controller;

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

import com.alibaba.fastjson.JSONObject;
import com.core.constant.GlobalCodeConstant;
import com.core.util.MisLog;
import com.core.util.Page;
import com.github.pagehelper.PageInfo;
import com.self.area.entity.AreaEntity;
import com.self.area.service.AreaService;


@Controller
@RequestMapping("/area")
public class AreaController {
	private static final Logger log = LoggerFactory.getLogger(AreaController.class);
	private static String AREA_LIST_PAGE = "/area/areaList";//分区列表页面
	private static String AREA_EDIT_PAGE = "/area/editArea";//编辑分区列表页面
	private static String AREA_ADD_PAGE = "/area/addArea";//新增分区列表页面
	@Autowired
	private AreaService areaService;
	/**
	 * 展示分区列表数据
	 * @return
	 */
	@RequestMapping(value="/page")
	public String AreaPage(){
		return AREA_LIST_PAGE;
	}
	
	
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/pageList")
	public String findAreaList(HttpServletRequest request , Model model,String gridPager){
		MisLog.info(log,"查询分区列表分页数据");
		JSONObject json = JSONObject.parseObject(gridPager);
		JSONObject areajson = json.getJSONObject("parameters");
		MisLog.info(log, json.toJSONString());
		Page<AreaEntity> page = JSONObject.toJavaObject(json,Page.class);
		AreaEntity area = (AreaEntity)JSONObject.toJavaObject(areajson, AreaEntity.class);
		List<AreaEntity> areaList = this.areaService.getAreaList(area,page);
		PageInfo<AreaEntity> pageInfo = new PageInfo<AreaEntity>(areaList);
		page = new Page<AreaEntity>(pageInfo);
		String result  = JSONObject.toJSONString(page);
		MisLog.info(log,result);
		return result;

	}
	/**
	 * 新增分区数据
	 * @return
	 */
	@RequestMapping(value="/addArea",method = RequestMethod.POST)
	public String saveArea(AreaEntity area,Model model){
		MisLog.info(log,"新增分区数据");
		areaService.saveArea(area);
		return "redirect:/pages/area/areaList.jsp";		
	}
	/**
	 * 删除分区数据
	 * @return
	 */
	
	
	@ResponseBody
	@RequestMapping(value="/deleteArea",method = RequestMethod.POST)
	public String deleteArea(String[] ids){
		MisLog.info(log, "删除分区数据");
		JSONObject json = JSONObject.parseObject("{}");
		try {
			areaService.deleteArea(ids);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage());
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}	
		return json.toJSONString();
	}
	/**
	 * 编辑分区数据
	 * @return
	 */
	@RequestMapping(value="/editArea/{id}",method = RequestMethod.GET)
	public String editArea(Model model,@PathVariable("id") String id){
		MisLog.info(log, "查询分区数据");
		try {
			AreaEntity areaEntity = this.areaService.findAreatEntityInfo(id);
			model.addAttribute("areaEntity", areaEntity);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(),e);
		}
		
		return AREA_EDIT_PAGE;	
	}
	/**
	 * 修改分区数据
	 * @return
	 */
	@RequestMapping(value="updataArea",method = RequestMethod.POST)
	public String updataArea(AreaEntity areaEntity,Model model){
		MisLog.info(log, "修改分区数据");
		try {
			areaService.updateArea(areaEntity);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(),e);
			model.addAttribute("error", "修改应用信息出错！");
			return "/exception";
		}
		
		return AREA_LIST_PAGE;
		
	}
	/**
	 * 数据校验
	 * @param areaName
	 * @param id
	 * @param areaCode
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/check",method = RequestMethod.POST)
	public String dataCheck(String areaName,String id,String areaCode){
		MisLog.info(log, "数据字典数据检验");
		JSONObject json = JSONObject.parseObject("{}");
		json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		Map<String,String> params = new HashMap<String,String>();
		Map<String, String> notIn = new HashMap<String,String>();
		notIn.put("id", id);
		if (areaName != null && id == null) {
			params.put("areaName", areaName);
			params.put("flag", "0");
			if (areaService.findAreaEntityByParams(params) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该分区名称已经存在，请重新填写！");
			}
		}
		if (areaCode != null && id == null) {
			params.clear();
			params.put("areaCode", areaCode);
			params.put("flag", "0");
			if (areaService.findAreaEntityByParams(params) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该分区编号已经存在，请重新填写！");
			}
		}
		if (areaName != null && id != null) {
			params.clear();
			params.put("areaName", areaName);
			params.put("flag", "0");
			if (areaService.findAreaEntityByParams(params, notIn) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该分区名称已经存在，请重新填写！");
			}
		}
		if (areaCode != null && id != null) {
			params.clear();
			params.put("areaCode", areaCode);
			params.put("flag", "0");
			if (areaService.findAreaEntityByParams(params, notIn) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该分区编号已经存在，请重新填写！");
			}
		}
		return json.toJSONString();
	}
	

	
	
	
	

}
