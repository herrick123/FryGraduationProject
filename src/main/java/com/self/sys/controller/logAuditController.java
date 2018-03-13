package com.self.sys.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.core.util.MisLog;

/**
 * 
 * @author mashiguo
 * 日志审计
 */
@Controller
@RequestMapping("/logAudit")
public class logAuditController {
	
private static final Logger log = LoggerFactory.getLogger(logAuditController.class);
	
	private static String LOG_LIST_PAGE = "/sys/logManagement/logAudit/logAudit";//日志审计页面

	/**
	 * 显示日志审计
	 */
	@RequestMapping(value="/page")
	public String logPage(){
		MisLog.info(log, "展现应用列表数据！");
		return LOG_LIST_PAGE;
	}

}
