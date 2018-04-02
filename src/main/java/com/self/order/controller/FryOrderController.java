package com.self.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.core.exception.SaveException;
import com.core.exception.UpdateException;
import com.core.util.MisLog;
import com.core.util.Page;
import com.core.util.UuidUtil;
import com.github.pagehelper.PageInfo;
import com.self.commodity.entity.CommodityEntity;
import com.self.order.entity.CommodityOrderEntity;
import com.self.order.entity.FryOrderEntity;
import com.self.order.service.CommodityOrderService;
import com.self.order.service.FryOrderService;
import com.self.user.entity.FryUserEntity;
import com.self.user.service.FryUserService;

@Controller
@RequestMapping("/order")
public class FryOrderController {
	private static final Logger log = LoggerFactory.getLogger(FryOrderEntity.class);

	private static String FRY_ORDER_LIST_PAGE = "/order/fryOrderList";// 订单列表页面
	private static String FRY_ORDER_ADD_PAGE = "/order/addFryOrder";// 创建订单页面
	private static String FRY_ORDER_AUDIT_PAGE = "/order/auditOrderList";// 审核订单页面

	@Autowired
	private FryOrderService fryOrderService;

	@Autowired
	private CommodityOrderService commodityOrderService;

	@Autowired
	private FryUserService fryUserService;

	/**
	 * 展示订单列表数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "/page")
	public String fryOrderPage() {

		return FRY_ORDER_LIST_PAGE;
	}
	
	/**
	 * 审核订单列表数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "/audit")
	public String auditFryOrderPage() {

		return FRY_ORDER_AUDIT_PAGE;
	}

	/**
	 * 分页查询订单列表
	 * 
	 * @param model
	 * @param getidpager
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/pageList", method = RequestMethod.POST)
	public String findFryOrderPageList(Model model, String gridPager, HttpServletRequest request) {
		MisLog.info(log, "分页查询订单列表！");
		JSONObject json = JSONObject.parseObject(gridPager);
		JSONObject fryOrderJson = json.getJSONObject("parameters");
		MisLog.info(log, json.toJSONString());
		Page<FryOrderEntity> page = JSONObject.toJavaObject(json, Page.class);
		FryOrderEntity fryOrder = JSONObject.toJavaObject(fryOrderJson, FryOrderEntity.class);
		FryUserEntity user = (FryUserEntity) request.getSession().getAttribute(GlobalCodeConstant.LOGIN_USER);
		if (user != null) {
			if("1".equals(user.getRole())){
				fryOrder.setUserId(user.getUuid());
			}else if("3".equals(user.getRole())){
				fryOrder.setDistributorId(user.getUuid());
			}
		}
		List<FryOrderEntity> fryOrderList = this.fryOrderService.findFryOrderPage(fryOrder, page);
		for (FryOrderEntity fryOrderEntity : fryOrderList) {
			List<CommodityEntity> commodityList = this.fryOrderService
					.findCommodityListByOrderId(fryOrderEntity.getUuid());
			fryOrderEntity.setCommodityList(commodityList);

		}
		PageInfo<FryOrderEntity> pageInfo = new PageInfo<FryOrderEntity>(fryOrderList);
		page = new Page<FryOrderEntity>(pageInfo);

		return JSONObject.toJSONString(page);
	}

	/**
	 * 创建订单
	 * 
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addFryOrder(Model model) {
		FryUserEntity user = new FryUserEntity();
		user.setRole("3");
		user.setUserStatus("1");
		List<FryUserEntity> userList = fryUserService.findFryUserList(user);
		model.addAttribute("userList", userList);
		return FRY_ORDER_ADD_PAGE;
	}

	/**
	 * 存储订单
	 * 
	 * @param fryOrder
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveFryOrderEntity(Model model, HttpServletRequest request, FryOrderEntity fryOrder,
			String[] commodityId, Integer[] number) {
		MisLog.info(log, "存储订单！");
		try {
			String uuid = UuidUtil.getUuid36();
			FryUserEntity user = (FryUserEntity) request.getSession().getAttribute(GlobalCodeConstant.LOGIN_USER);
			fryOrder.setUuid(uuid);
			if (user != null) {
				fryOrder.setUserId(user.getUuid());
			}
			this.fryOrderService.saveFryOrderEntity(fryOrder);
			for (int i = 0; i < commodityId.length; i++) {
				CommodityOrderEntity commodityOrder = new CommodityOrderEntity();
				commodityOrder.setOrderId(uuid);
				commodityOrder.setCommodityId(commodityId[i]);
				commodityOrder.setNumber(number[i]);
				this.commodityOrderService.saveCommodityOrderEntity(commodityOrder);
			}
		} catch (SaveException e) {
			MisLog.error(log, e.getMessage());
			model.addAttribute("error", "新增订单出错！");
			return "/exception";
		}
		return "redirect:/order/page";
	}
	
	/**
	 * 修改订单状态
	 * @param uuid, status
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateStatus",method=RequestMethod.POST)
	public String updateFryOrderStatus(String uuid, String status){
		JSONObject json = JSONObject.parseObject("{}");
		FryOrderEntity order = new FryOrderEntity();
		order.setUuid(uuid);
		order.setStatus(status);
		try{
			fryOrderService.updateFryOrderEntity(order);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		}catch(UpdateException e){
			MisLog.error(log, e.getMessage());
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}
	
	/**
	 * 订单支付
	 * @param uuid,alipayRecord
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/alipay",method=RequestMethod.POST)
	public String alipay(String uuid, String alipayRecord){
		JSONObject json = JSONObject.parseObject("{}");
		FryOrderEntity order = new FryOrderEntity();
		order.setUuid(uuid);
		order.setStatus("2");
		order.setAlipayRecord(alipayRecord);
		try{
			fryOrderService.updateFryOrderEntity(order);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		}catch(UpdateException e){
			MisLog.error(log, e.getMessage());
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}
	
	/**
	 * 删除订单
	 * @param uuid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String delete(String uuid){
		JSONObject json = JSONObject.parseObject("{}");
		try{
			fryOrderService.deleteFryOrderEntity(uuid);
			commodityOrderService.deleteCommodityOrderEntity(uuid);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		}catch(UpdateException e){
			MisLog.error(log, e.getMessage());
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}
}
