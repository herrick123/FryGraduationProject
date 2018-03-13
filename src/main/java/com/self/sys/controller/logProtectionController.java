package com.self.sys.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.core.util.MisLog;

/**
 * 
 * @author mashiguo
 * 日志维护
 */
@Controller
@RequestMapping("/logProtection")
public class logProtectionController {
	
private static final Logger log = LoggerFactory.getLogger(logProtectionController.class);
	
	private static String LOG_LIST_PAGE = "/sys/logManagement/logProtection/logProtection";//日志维护页面

	/**
	 * 显示日志维护
	 */
	@RequestMapping(value="/page")
	public String logPage(){
		MisLog.info(log, "展现应用列表数据！");
		return LOG_LIST_PAGE;
	}

}
