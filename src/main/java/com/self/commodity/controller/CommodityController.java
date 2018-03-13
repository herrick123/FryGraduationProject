package com.self.commodity.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.core.constant.GlobalCodeConstant;
import com.core.util.MisLog;
import com.self.commodity.entity.CommodityEntity;
import com.self.commodity.service.CommodityService;


@Controller
@RequestMapping("/commodity")
public class CommodityController {
	private static final Logger log = LoggerFactory.getLogger(CommodityEntity.class);
	private static String AREA_LIST_PAGE = "/aass";//首页
	@Autowired
	private CommodityService commodityService;
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveCommodity(Model model , CommodityEntity commodityEntity,@RequestParam(value="file",required=false)MultipartFile file, HttpServletRequest request) {

		MisLog.info(log,"新增分区数据");
		String fileName;//获取文件名加后缀
		try {
			String basePath = "d://ss/";
			File upFile = new File(basePath);
			if(!upFile.isDirectory()){//判断文件夹是否存在 不存在创建
				upFile.mkdirs();
	        }
			fileName=file.getOriginalFilename();//获取文件名加后缀
			fileName=file.getOriginalFilename();//获取文件名加后缀
	        if(fileName!=null&&fileName!=""){ 
	        	
	        	//存储的路径
	            String fileF = fileName.substring(fileName.lastIndexOf("."), fileName.length());//文件后缀
	            fileName=new Date().getTime()+"_"+new Random().nextInt(1000)+fileF;//新的文件名
	            String picturePath = basePath + fileName;
	            commodityEntity.setProductPicture(picturePath);
	            file.transferTo(new File(picturePath)); 
	        }
			
		} catch (Exception e) {
			MisLog.error(log, "录入员工失败",e);
		}
		commodityService.saveCommodityZip(commodityEntity);
		return AREA_LIST_PAGE ;
	}
	/**
	 * 文件异步上传DEMO
	 * @param uploadFile
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/async/upload",method = RequestMethod.POST)
	public String asyncUploadFile(@RequestParam(value = "uploadFiles") MultipartFile[] uploadFiles){
		JSONObject json = JSONObject.parseObject("{}");
		List<Object> mlist=new ArrayList<>();
		for (int i = 0; i < uploadFiles.length; i++) {
	        mlist.add(uploadFiles[i]);
	    }
		uploadFiles[0].getSize();
		try{
			String basePath = "d://tempDirectory/";
			File upFile = new File(basePath);
			if(!upFile.isDirectory()){//判断文件夹是否存在 不存在创建
				upFile.mkdirs();
	        }
			for(int i = 0;i < uploadFiles.length; i ++) {
				String fileName = uploadFiles[i].getOriginalFilename();
				String filePath = basePath + fileName;
				uploadFiles[i].transferTo(new File(filePath));
			}
			MisLog.debug(log, ""+uploadFiles.length);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		}catch(Exception e){
			MisLog.error(log, "批量删除用户失败",e);
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
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
	public String dataCheck(String commodityName,String id,String commodityNumber){
		MisLog.info(log, "数据字典数据检验");
		JSONObject json = JSONObject.parseObject("{}");
		json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		Map<String,String> params = new HashMap<String,String>();
		Map<String, String> notIn = new HashMap<String,String>();
		notIn.put("id", id);
		if (commodityName != null && id == null) {
			params.put("commodityName", commodityName);
			if (commodityService.findCommodityEntityByParams(params) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该商品名称已经存在，请重新填写！");
			}
		}
		if (commodityNumber != null && id == null) {
			params.clear();
			params.put("commodityNumber", commodityNumber);
			if (commodityService.findCommodityEntityByParams(params) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该分区编号已经存在，请重新填写！");
			}
		}
		if (commodityName != null && id != null) {
			params.clear();
			params.put("commodityName", commodityName);
			if (commodityService.findCommodityEntityByParams(params) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该分区名称已经存在，请重新填写！");
			}
		}
		if (commodityNumber != null && id != null) {
			params.clear();
			params.put("commodityNumber", commodityNumber);
			if (commodityService.findCommodityEntityByParams(params)  > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该分区编号已经存在，请重新填写！");
			}
		}
		return json.toJSONString();
	}
	

}
