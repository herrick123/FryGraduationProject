package com.mengma.mis.self.sys.controller;

import com.mengma.mis.core.util.MisLog;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @
 * @author mashiguo
 * 日志记录
 */
@Controller
@RequestMapping("/logRecord")
public class logRecordController {
	
	private static final Logger log = LoggerFactory.getLogger(logRecordController.class);
	
	private static String LOG_LIST_PAGE = "/sys/logManagement/logRecord/logRecord";//日志记录页面

	/**
	 * 显示日志记录
	 */
	@RequestMapping(value="/page")
	public String logPage(){
		MisLog.info(log, "展现应用列表数据！");
		return LOG_LIST_PAGE;
	}
}
