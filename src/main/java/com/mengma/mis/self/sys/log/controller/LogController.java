package com.mengma.mis.self.sys.log.controller;

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
import com.github.pagehelper.PageInfo;
import com.mengma.mis.core.util.MisLog;
import com.mengma.mis.core.util.Page;
import com.mengma.mis.self.sys.log.entity.LogEntity;
import com.mengma.mis.self.sys.log.service.LogService;


/**
 * 日志管理controller
 * @author 王雅楠
 * @version 1.0
 */

@Controller
@RequestMapping("/log")
public class LogController {
	
	private static final Logger log = LoggerFactory.getLogger(LogController.class);
	private static String LOG_LIST_PAGE = "/sys/log/logList";//日志列表页面
	
	@Autowired
	private LogService logService;
	
    /**
     * 展示日志列表
     * @return
     */
    @RequestMapping(value="/page")
	public String getLogList(){
		return LOG_LIST_PAGE;
	}
    
    /**
     * 查询日志分页
     * @param request
     * @param model
     * @param gridPager
     * @return
     */
    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping(value="/pageList",method=RequestMethod.POST)
	public String findLogPageList(HttpServletRequest request,Model model,String gridPager){
    	MisLog.info(log, "查询日志分页数据");
    	String result = null;
		try {
			JSONObject json = JSONObject.parseObject(gridPager);
			JSONObject LogJson = json.getJSONObject("parameters");
			MisLog.info(log, json.toJSONString());
			Page<LogEntity> page = JSONObject.toJavaObject(json,Page.class);
			LogEntity log = JSONObject.toJavaObject(LogJson, LogEntity.class);
			List<LogEntity> logList = this.logService.findLogPage(log, page);
			PageInfo<LogEntity> pageInfo = new PageInfo<LogEntity>(logList);
			page = new Page<LogEntity>(pageInfo);
			result = JSONObject.toJSONString(page);
		} catch (Exception e) {
			MisLog.error(log, e.getMessage());
		}
		return result;
    }
}
