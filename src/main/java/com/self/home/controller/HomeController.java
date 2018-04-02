package com.self.home.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.core.util.FileUtil;
import com.core.util.MisLog;
import com.core.util.Page;
import com.github.pagehelper.PageInfo;
import com.self.commodity.entity.CommodityEntity;
import com.self.commodity.entity.DownloadRecordEntity;
import com.self.commodity.service.CommodityService;
import com.self.user.entity.FryUserEntity;
import com.self.user.service.FryUserService;

@Controller
@RequestMapping("/home")
public class HomeController {
	private static final Logger log = LoggerFactory.getLogger(CommodityEntity.class);
	
	private static String COMMODITYS_LIST_PAGE = "/home/home";// 首页
	private static String FIRM_LIST = "/home/firmList";// 网供信息页面
	private static String DISTRIBUTOR_LIST = "/home/distributorList";// 代发信息页面
	private static String COMMODITY_MESSAGE_PAGE = "/home/commodityMessage";// 产品信息页面
	private static String COMMODITYSS_LIST_PAGE = "/home/userIdCommodity";// 商品列表页面
	
	@Autowired
	private CommodityService commodityService;
	
	@Autowired
	private FryUserService userService;

	/**
	 * 首页商品列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/page")
	public String CommodityPages(Model model) {
		CommodityEntity commodityEntity = new CommodityEntity();
		commodityEntity.setStatus("1");
		List<CommodityEntity> commodityEntitis = commodityService.findCommodity(commodityEntity);
		model.addAttribute("commodityEntitis", commodityEntitis);
		return COMMODITYS_LIST_PAGE;
	}
	
	/**
	 * 跳转产品详情信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/commodityMessage/{uuid}", method = RequestMethod.GET)
	public String CommodityMessagePages(Model model, HttpServletRequest request, HttpServletResponse response,
			@PathVariable("uuid") String uuid) {
		CommodityEntity commodityEntity = commodityService.findCommodityEntityInfo(uuid);
		FryUserEntity userEntity = userService.findFryUserEntityInfo(commodityEntity.getUserId());
		DownloadRecordEntity downloadRecordEntity = new DownloadRecordEntity();
		downloadRecordEntity.setCommodityId(uuid);
		List<DownloadRecordEntity> downloadRecordList = this.commodityService.findDownloadRecord(downloadRecordEntity);
		model.addAttribute("downloadRecordList", downloadRecordList);
		model.addAttribute("userEntity", userEntity);
		model.addAttribute("commodityEntity", commodityEntity);
		FryUserEntity user = (FryUserEntity) request.getSession().getAttribute(GlobalCodeConstant.LOGIN_USER);
		if (user == null) {
			model.addAttribute("noUser", 0);
		}
		return COMMODITY_MESSAGE_PAGE;
	}
	
	/**
	 * 文件下载记录
	 * 
	 * @param response
	 */
	@ResponseBody
	@RequestMapping(value = "/downloadRecord", method = RequestMethod.POST)
	public String downloadRecord(HttpServletResponse response, String uuid, HttpServletRequest request) {
		JSONObject json = JSONObject.parseObject("{}");
		FryUserEntity user = (FryUserEntity) request.getSession().getAttribute(GlobalCodeConstant.LOGIN_USER);
		if (user != null) {
			DownloadRecordEntity downloadRecordEntity = new DownloadRecordEntity();
			downloadRecordEntity.setAccess("下载");
			downloadRecordEntity.setCommodityId(uuid);
			downloadRecordEntity.setUserId(user.getUuid());
			downloadRecordEntity.setUserName(user.getUserName());
			commodityService.saveDownloadRecordEntity(downloadRecordEntity);
		} else {
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}
	
	/**
	 * 文件下载
	 * 
	 * @param response
	 */
	@RequestMapping(value = "/download")
	public void downloadFile(Model model, HttpServletResponse response, String filename, String uuid,
			HttpServletRequest request) {
		try {
			filename = java.net.URLDecoder.decode(filename, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String path = "d://tempDirectory/" + filename;
		MisLog.debug(log, path + "");
		FileUtil.downloadFile(response, path, Boolean.FALSE);

	}
	
	/**
	 * 展示网供列表数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "/pageFirmList")
	public String FirmListPage() {

		return FIRM_LIST;
	}
	
	/**
	 * 展示代发列表数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "/distributorPage")
	public String distributorListPage() {

		return DISTRIBUTOR_LIST;
	}
	
	/**
	 * 分页查询厂商列表
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/firmListpages")
	public String findFirmList(HttpServletRequest request, Model model, String gridPager) {
		MisLog.info(log, "查询网供列表分页数据");
		JSONObject json = JSONObject.parseObject(gridPager);
		JSONObject firmjson = json.getJSONObject("parameters");
		MisLog.info(log, json.toJSONString());
		Page<FryUserEntity> page = JSONObject.toJavaObject(json, Page.class);
		FryUserEntity userEntity = JSONObject.toJavaObject(firmjson, FryUserEntity.class);
		userEntity.setUserStatus("1");
		List<FryUserEntity> firmList = this.commodityService.findFirmList(userEntity, page);
		PageInfo<FryUserEntity> pageInfo = new PageInfo<FryUserEntity>(firmList);
		page = new Page<FryUserEntity>(pageInfo);
		String result = JSONObject.toJSONString(page);
		MisLog.info(log, result);
		
		return result;
	}

	/**
	 * 某厂商的供货列表
	 */
	@RequestMapping(value = "/pageUserCommoditys/{uuid}", method = RequestMethod.GET)
	public String userIdCommoditys(Model model, @PathVariable("uuid") String uuid) {
		model.addAttribute("uuid", uuid);
		
		return COMMODITYSS_LIST_PAGE;
	}
	
	/**
	 * 
	 */
	/**
	 * 根据userId查询商品列表
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/pageUserCommodity/{uuid}", method = RequestMethod.POST)
	public String userIdCommodity(Model model, HttpServletRequest request, String gridPager,
			@PathVariable("uuid") String uuid) {
		JSONObject json = JSONObject.parseObject(gridPager);
		JSONObject commodityjson = json.getJSONObject("parameters");
		MisLog.info(log, json.toJSONString());
		Page<CommodityEntity> page = JSONObject.toJavaObject(json, Page.class);
		CommodityEntity commodityEntitys = JSONObject.toJavaObject(commodityjson, CommodityEntity.class);
		commodityEntitys.setUserId(uuid);
		List<CommodityEntity> commodityList = this.commodityService.getCommodityList(commodityEntitys, page);
		PageInfo<CommodityEntity> pageInfo = new PageInfo<CommodityEntity>(commodityList);
		page = new Page<CommodityEntity>(pageInfo);
		String result = JSONObject.toJSONString(page);
		MisLog.info(log, result);
		return result;

	}
}
