package com.self.commodity.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.core.constant.GlobalCodeConstant;
import com.core.util.MisLog;
import com.core.util.Page;
import com.github.pagehelper.PageInfo;
import com.self.commodity.entity.CommodityEntity;
import com.self.commodity.entity.DownloadRecordEntity;
import com.self.commodity.service.CommodityService;
import com.self.user.entity.FryUserEntity;

@Controller
@RequestMapping("/commodity")
public class CommodityController {

	private static final Logger log = LoggerFactory.getLogger(CommodityEntity.class);
	private static String COMMODITY_LIST_PAGE = "/commodity/commodityList";// 商品列表页面
	private static String ADDCOMMODITY_LIST_PAGE = "/commodity/uploadZip";// 新增页面
	private static String COMMODITY_EDIT_PAGE = "/commodity/editCommodity";// 编辑页面
	private static String DOWNLOAD_LIST = "/commodity/downloadList";// 图片包页面

	@Autowired
	private CommodityService commodityService;

	/**
	 * 展示商品列表数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "/page")
	public String CommodityPage() {

		return COMMODITY_LIST_PAGE;
	}

	/**
	 * 商品列表数据
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/pageList")
	public String findCommodityList(HttpServletRequest request, Model model, String gridPager) {
		MisLog.info(log, "查询商品列表分页数据");
		JSONObject json = JSONObject.parseObject(gridPager);
		JSONObject commodityjson = json.getJSONObject("parameters");
		MisLog.info(log, json.toJSONString());
		Page<CommodityEntity> page = JSONObject.toJavaObject(json, Page.class);
		CommodityEntity commodityEntity = JSONObject.toJavaObject(commodityjson, CommodityEntity.class);
		FryUserEntity user = (FryUserEntity) request.getSession().getAttribute(GlobalCodeConstant.LOGIN_USER);
		if (user != null && "2".equals(user.getRole())) {
			commodityEntity.setUserId(user.getUuid());
		}
		List<CommodityEntity> commodityList = this.commodityService.getCommodityList(commodityEntity, page);
		PageInfo<CommodityEntity> pageInfo = new PageInfo<CommodityEntity>(commodityList);
		page = new Page<CommodityEntity>(pageInfo);
		String result = JSONObject.toJSONString(page);
		MisLog.info(log, result);
		return result;
	}

	/**
	 * 展示图片包列表数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "/downloadPage")
	public String downloadListPage() {

		return DOWNLOAD_LIST;
	}

	/**
	 * 图片包
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/downloadListPage", method = RequestMethod.POST)
	public String downloadList(Model model, HttpServletRequest request, String gridPager) {
		JSONObject json = JSONObject.parseObject(gridPager);
		JSONObject downloadjson = json.getJSONObject("parameters");
		MisLog.info(log, json.toJSONString());
		Page<DownloadRecordEntity> page = JSONObject.toJavaObject(json, Page.class);
		DownloadRecordEntity downloadRecordEntity = JSONObject.toJavaObject(downloadjson, DownloadRecordEntity.class);
		FryUserEntity user = (FryUserEntity) request.getSession().getAttribute(GlobalCodeConstant.LOGIN_USER);
		downloadRecordEntity.setUserId(user.getUuid());
		List<DownloadRecordEntity> downloadRecordList = this.commodityService.findDownloadRecord(downloadRecordEntity);
		PageInfo<DownloadRecordEntity> pageInfo = new PageInfo<DownloadRecordEntity>(downloadRecordList);
		page = new Page<DownloadRecordEntity>(pageInfo);

		return JSONObject.toJSONString(page);
	}

	/**
	 * 跳转新增页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/addCommodity")
	public String AddCommodity() {

		return ADDCOMMODITY_LIST_PAGE;
	}

	/**
	 * 新增
	 * 
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveCommodity(Model model, CommodityEntity commodityEntity,
			@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {
		MisLog.info(log, "新增分区数据");
		String fileName;// 获取文件名加后缀
		try {
			String basePath = request.getServletContext().getRealPath("/img/firstPicture/");
			//String basePath = "D://workspace-FryGradutionProject/FryGradutionProject/src/main/webapp/img/firstPicture/";
			File upFile = new File(basePath);
			if (!upFile.isDirectory()) {// 判断文件夹是否存在 不存在创建
				upFile.mkdirs();
			}
			fileName = file.getOriginalFilename();// 获取文件名加后缀
			fileName = file.getOriginalFilename();// 获取文件名加后缀
			if (fileName != null && fileName != "") {

				// 存储的路径
				String fileF = fileName.substring(fileName.lastIndexOf("."), fileName.length());// 文件后缀
				fileName = new Date().getTime() + "_" + new Random().nextInt(1000) + fileF;// 新的文件名
				String basePaths = "/img/firstPicture/";
				String picturePath = basePath + fileName;
				String picturePaths = basePaths + fileName;
				commodityEntity.setProductPicture(picturePaths);
				file.transferTo(new File(picturePath));
			}
		} catch (Exception e) {
			MisLog.error(log, "录入失败", e);
		}
		FryUserEntity user = (FryUserEntity) request.getSession().getAttribute(GlobalCodeConstant.LOGIN_USER);
		commodityEntity.setUserId(user.getUuid());
		commodityService.saveCommodityZip(commodityEntity);
		return "redirect:/commodity/page";
	}

	/**
	 * 逻辑删除产品
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteCommodity", method = RequestMethod.POST)
	public String deleteCommodity(String[] uuids) {
		MisLog.info(log, "下架产品");
		JSONObject json = JSONObject.parseObject("{}");
		try {
			commodityService.deleteCommodity(uuids);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage());
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}

	/**
	 * 删除分区数据
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/deletesCommodity", method = RequestMethod.POST)
	public String deletesCommodity(String[] uuids) {
		MisLog.info(log, "删除商品");
		JSONObject json = JSONObject.parseObject("{}");
		try {
			commodityService.deletesCommodity(uuids);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage());
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}

	/**
	 * 根据id查询产品信息跳转编辑页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/editCommodity/{uuid}", method = RequestMethod.GET)
	public String editCommodity(Model model, @PathVariable("uuid") String uuid) {
		MisLog.info(log, "编辑产品数据");
		try {
			CommodityEntity commodityEntity = this.commodityService.findCommodityEntityInfo(uuid);
			model.addAttribute("commodityEntity", commodityEntity);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(), e);
		}
		return COMMODITY_EDIT_PAGE;
	}

	/**
	 * 修改产品信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "updataCommodity", method = RequestMethod.POST)
	public String updataCommodity(CommodityEntity commodityEntity,
			@RequestParam(value = "file", required = false) MultipartFile file, Model model,
			HttpServletRequest request) {
		MisLog.info(log, "修改产品信息");
		String fileName;// 获取文件名加后缀
		try {
			String basePath = request.getServletContext().getRealPath("/img/firstPicture/");
			//String basePath = "D://workspace-FryGradutionProject/FryGradutionProject/src/main/webapp/img/firstPicture/";
			File upFile = new File(basePath);
			if (!upFile.isDirectory()) {// 判断文件夹是否存在 不存在创建
				upFile.mkdirs();
			}
			fileName = file.getOriginalFilename();// 获取文件名加后缀
			fileName = file.getOriginalFilename();// 获取文件名加后缀
			if (fileName != null && fileName != "") {
				// 存储的路径
				String fileF = fileName.substring(fileName.lastIndexOf("."), fileName.length());// 文件后缀
				fileName = new Date().getTime() + "_" + new Random().nextInt(1000) + fileF;// 新的文件名
				String basePaths = "/img/firstPicture/";
				String picturePath = basePath + fileName;
				String picturePaths = basePaths + fileName;
				commodityEntity.setProductPicture(picturePaths);
				file.transferTo(new File(picturePath));
			}
			commodityService.updataCommodity(commodityEntity);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(), e);
			model.addAttribute("error", "修改产品信息出错！");
			return "/exception";
		}
		return "redirect:/pages/commodity/commodityList.jsp";
	}

	/**
	 * 文件异步上传
	 * 
	 * @param uploadFile
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/async/upload", method = RequestMethod.POST)
	public String asyncUploadFile(@RequestParam(value = "uploadFiles") MultipartFile uploadFiles) {
		JSONObject json = JSONObject.parseObject("{}");
		try {
			String basePath = "d://tempDirectory/";
			File upFile = new File(basePath);
			if (!upFile.isDirectory()) {// 判断文件夹是否存在 不存在创建
				upFile.mkdirs();
			}
			String fileName = uploadFiles.getOriginalFilename();
			String filePath = basePath + fileName;
			uploadFiles.transferTo(new File(filePath));
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		} catch (Exception e) {
			MisLog.error(log, "批量删除用户失败", e);
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}

	/**
	 * 数据校验
	 * 
	 * @param areaName
	 * @param id
	 * @param areaCode
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public String dataCheck(String commodityName, String uuid, String commodityNumber) {
		MisLog.info(log, "数据字典数据检验");
		JSONObject json = JSONObject.parseObject("{}");
		json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String> notIn = new HashMap<String, String>();
		notIn.put("uuid", uuid);
		if (commodityName != null && uuid == null) {
			params.put("commodityName", commodityName);
			if (commodityService.findCommodityEntityByParams(params) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该商品名称已经存在，请重新填写！");
			}
		}
		if (commodityNumber != null && uuid == null) {
			params.clear();
			params.put("commodityNumber", commodityNumber);
			if (commodityService.findCommodityEntityByParams(params) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该分区编号已经存在，请重新填写！");
			}
		}
		if (commodityName != null && uuid != null) {
			params.clear();
			params.put("commodityName", commodityName);
			notIn.put("uuid", uuid);
			if (commodityService.findCommodityEntityByParams(params, notIn) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该分区名称已经存在，请重新填写！");
			}
		}
		if (commodityNumber != null && uuid != null) {
			params.clear();
			params.put("commodityNumber", commodityNumber);
			notIn.put("uuid", uuid);
			if (commodityService.findCommodityEntityByParams(params, notIn) > 0) {
				json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
				json.put("info", "该分区编号已经存在，请重新填写！");
			}
		}
		return json.toJSONString();
	}

	/**
	 * 显示图片
	 *
	 * @param url
	 * @param request
	 * @param response
	 * @return
	 */
	/*
	 * @RequestMapping(value = "/viewSignatureImage")
	 * 
	 * @ResponseBody public String viewSignatureImage(String imageURL,
	 * HttpServletRequest request, HttpServletResponse response) { if (imageURL
	 * == null || imageURL.equals("")) return null; ServletOutputStream out =
	 * null; FileInputStream in = null; try { in = new
	 * FileInputStream(imageURL); response.setContentType("image/*"); out =
	 * response.getOutputStream(); int i = 0; byte[] buffer = new byte[4096];
	 * while ((i = in.read(buffer)) != -1) { out.write(buffer, 0, i); }
	 * out.flush(); in.close(); } catch (Exception e) { e.printStackTrace(); }
	 * finally { if (out != null) { try { out.close(); } catch (Exception e) {
	 * e.printStackTrace(); } } if (in != null) { try { in.close(); } catch
	 * (Exception e) { e.printStackTrace(); } } } return null; }
	 */
}
