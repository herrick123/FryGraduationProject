package com.mengma.mis.self.sys.controller;

import com.mengma.mis.core.util.MisLog;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author mashiguo
 * 日志分析统计
 */
@Controller
@RequestMapping("/logAnalysistics")
public class logAnalysisStatisticsController {
	
	private static final Logger log = LoggerFactory.getLogger(logAnalysisStatisticsController.class);
	
	//日志分析统计页面
	private static String LOG_LIST_PAGE = "/sys/logManagement/logAnalysisStatistics/logAnalysisStatistics";

	/**
	 * 显示日志分析统计
	 */
	@RequestMapping(value="/page")
	public String logPage(){
		MisLog.info(log, "展现应用列表数据！");
		return LOG_LIST_PAGE;
	}

}
