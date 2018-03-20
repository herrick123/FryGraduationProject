package com.self.sys.leave.controller;

import java.sql.Date;
import java.util.Calendar;
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
import com.core.exception.BaseException;
import com.core.util.MisLog;
import com.core.util.Page;
import com.github.pagehelper.PageInfo;
import com.self.sys.leave.entity.LeaveEntity;
import com.self.sys.leave.service.LeaveService;
import com.self.sys.leave.vo.LeaveVo;
import com.self.sys.module.controller.ModuleController;
import com.self.sys.user.entity.SysUserEntity;
import com.self.sys.user.service.SysUserService;




/**
 * 猛码学员管理
 * @author 王雅楠
 *
 */
@Controller
@RequestMapping("/leave")
public class LeaveController {
private static final Logger log = LoggerFactory.getLogger(ModuleController.class);

	/*学员*/
	private static String LEAVE_ADD_PAGE = "/sys/leave/addLeave";//请假申请页面
	
	/*管理员*/
	private static String LEAVE_LIST_PAGE = "/sys/leave/leaveList";//请假列表页面
	//private static String LEAVE_TOTAL_PAGE = "/sys/leave/leaveTotal";//请假统计页面
	
	@Autowired
	private LeaveService leaveService;
	@Autowired
	private SysUserService userService;
	
	/**
	 * 展示请假列表数据
	 * @return
	 */
	@RequestMapping(value="/page")
	public String leavePage(){
		MisLog.info(log, "查询请假列表！");
		return LEAVE_LIST_PAGE;
	}
	
	/**
	 * 检查请假日期是否冲突
	 * @param request
	 * @param model
	 * @param leave
	 * @return
	 */
	@RequestMapping(value = "/check",method= RequestMethod.POST)
	@ResponseBody
	public String checkExistLeave(Date startTime,Date endTime,String name){
		MisLog.info(log, "检查请假日期是否冲突");
		int count = 0;
		try {
			count = leaveService.selectExistLeave(name, startTime, endTime);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject json = JSONObject.parseObject("{}");
		if(count>0){
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}else{
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		}
		return json.toJSONString();
	}
	
	/**
	 * 转到请假申请界面
	 * @return
	 */
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public String addLeave(Model model){
		MisLog.info(log, "转到请假申请界面");
		return LEAVE_ADD_PAGE;
	}
	
	/**
	 * 存储新增请假信息
	 * @param leave
	 * @return
	 */
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String saveLeaveEntity(HttpServletRequest request,Model model,LeaveEntity leave){
		MisLog.info(log, "存储新增请假申请");
		try {
			leaveService.saveLeaveEntity(leave);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage(),e);
			model.addAttribute("error", "新增请假信息出错！");
			return "/exception";
		}
		return "redirect:/leave/page";
	}
	
	
	/**
	 * 分页查询请假列表
	 * @param request
	 * @param model
	 * @param gridPager
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/pageList",method = RequestMethod.POST)
	public String findLeavePageList(HttpServletRequest request,Model model,String gridPager){
		String result = null;
		try {
			MisLog.info(log, "分页查询请假列表");
			JSONObject json = JSONObject.parseObject(gridPager);
			JSONObject leaveJson = json.getJSONObject("parameters");
			MisLog.info(log, json.toJSONString());
			LeaveEntity leave = JSONObject.toJavaObject(leaveJson, LeaveEntity.class);
			SysUserEntity user = (SysUserEntity) request.getSession().getAttribute("loginUser");
			/*如果是员工，只能查看自己的请假列表*/
			if("S0002".equals(user.getRole())){
				leave.setName(user.getUserName());
			}
			Page<LeaveEntity> page = JSONObject.toJavaObject(json,Page.class);
			List<LeaveEntity> leaves =  leaveService.findLeavePage(leave, page);
			PageInfo<LeaveEntity> pageInfo = new PageInfo<LeaveEntity>(leaves);
			page = new Page<LeaveEntity>(pageInfo);
			result = JSONObject.toJSONString(page);
			MisLog.info(log, result);
		} catch (BaseException e) {
			MisLog.error(log, e.getMessage());
		}
		return result;
	}
	
	/**
	 * 编辑请假审核状态
	 * @param model
	 * @param id
	 * @param value
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/editLeaveStatus",method=RequestMethod.GET)
	public String editLeaveStatus(HttpServletRequest request, String id,String operation,String type,String timeLength,String name){
		MisLog.info(log, "修改请假状态");
		JSONObject json = JSONObject.parseObject("{}");
		try{
			leaveService.editLeaveStatus(id,operation);
			json.put("returncode", GlobalCodeConstant.BASE_SUCCESS_CODE);
		}catch(Exception e){
			MisLog.error(log, e.getMessage());
			json.put("returncode", GlobalCodeConstant.BASE_ERROR_CODE);
		}
		return json.toJSONString();
	}
	
	/**
	 * 查询请假统计
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/pageTotalList",method = RequestMethod.GET)
	public String findLeaveTotalPageList(Model model,String time){
		MisLog.info(log, "查询请假统计");
		List<LeaveVo> result =null;
		if("".equals(time)||time==null){
			Calendar now = Calendar.getInstance();
			int year = now.get(Calendar.YEAR); 
			time = String.valueOf(year);
		}
		try {
			result = leaveService.findLeaveTotalPage(time);
			model.addAttribute("leaveTotal", result);
			model.addAttribute("time", time);
		} catch (BaseException e) {
			e.printStackTrace();
		}
		return "/sys/leave/totalList";
	}
}
