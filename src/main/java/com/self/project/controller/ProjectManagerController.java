package com.self.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.core.util.MisLog;
import com.core.util.Page;
import com.github.pagehelper.PageInfo;
import com.self.project.entity.ProjectManageEntity;
import com.self.project.service.ProjectManagerService;
import com.self.project.vo.projectManagerVo;


@Controller
@RequestMapping("/projectManager")
public class ProjectManagerController {
	private static final Logger log =LoggerFactory.getLogger(ProjectManageEntity.class);
	
	@Autowired
	 private ProjectManagerService projectManagerService;
	
	/**
	 * 展示项目经理首页请假页面
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/projectManagerLeaveList")
	public String projectManageList(HttpServletRequest request , Model model , String gridPager){
		MisLog.info(log, "展示项目经理首页");
		JSONObject json = JSONObject.parseObject(gridPager);
		JSONObject projson = json.getJSONObject("parameters");
		MisLog.info(log, json.toJSONString());
		Page<projectManagerVo> page =JSONObject.toJavaObject(json, Page.class);
		projectManagerVo pro = (projectManagerVo)JSONObject.toJavaObject(projson, projectManagerVo.class);
		List<projectManagerVo> proList = this.projectManagerService.findProjectManagerLeavePage(pro, page);
		PageInfo<projectManagerVo> pageInfo = new PageInfo<projectManagerVo>(proList);
		page = new Page<projectManagerVo>(pageInfo);
		String result = JSONObject.toJSONString(page);
		MisLog.info(log, result);
		return result;
		
	}
	

}
