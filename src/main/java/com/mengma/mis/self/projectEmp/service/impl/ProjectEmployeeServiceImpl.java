package com.mengma.mis.self.projectEmp.service.impl;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.mengma.mis.core.constant.GlobalCodeConstant;
import com.mengma.mis.core.exception.BaseException;
import com.mengma.mis.core.exception.SaveException;
import com.mengma.mis.core.util.Page;
import com.mengma.mis.core.util.TimeUtil;
import com.mengma.mis.self.projectEmp.dao.ProjectEmployeeMapper;
import com.mengma.mis.self.projectEmp.entity.ProjectEmployee;
import com.mengma.mis.self.projectEmp.service.ProjectEmployeeService;

/**
 * 
 * @author donghc
 * 
 * */
@Service("projectEmployeeService")
public class ProjectEmployeeServiceImpl implements ProjectEmployeeService{
	
	@Autowired
	private ProjectEmployeeMapper projectEmployeeMapper;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 
	 * 分页查询项目员工表
	 * 
	 * */
	@Override
	public List<ProjectEmployee> findProjectEmployeePage(ProjectEmployee projectEmp, Page<ProjectEmployee> page) {
		Map<String,Object> param=new HashMap<String,Object>();
		/*if(StringUtils.isNotEmpty(projectEmp.getAreaId())){
			param.put("areaId", train.getAreaId());
		}
		if(StringUtils.isNotEmpty(train.getIssue())){
			param.put("issue",train.getIssue());
		}*/
		param.put("projectId",projectEmp.getProjectId());
		PageHelper.startPage(page.getNowPage(),page.getPageSize());
		List<ProjectEmployee> result = null;
		try {
			result = sqlSession.selectList("search_empName_projectName_info", param);
		} catch (Exception e) {
			throw new BaseException("查询项目学员信息失败"+e);
		}
			return result;
	}
	/**
	 * 添加评语
	 * 
	 * */
	@Override
	public Integer addProjectEmployee(ProjectEmployee projectEmp) {
		Map<String,Object> param=new HashMap<String,Object>();
		String date=TimeUtil.getStringDateShort();
		Date judgeTime=TimeUtil.toFormatDate(date);
		param.put("id", projectEmp.getId());
		param.put("projectId",projectEmp.getProjectId());
		param.put("employeeId",projectEmp.getEmployeeId());
		param.put("judgeTime", judgeTime);
		param.put("judge", projectEmp.getJudge());
		param.put("skill", projectEmp.getSkill());
		int result=GlobalCodeConstant.SAVE_ERROR_CODE;
		try {
			result=sqlSession.update("self.projectEmp.update_judge_info", param);
		} catch (Exception e) {
			throw new SaveException("保存数据失败" + e);
		}
		return result;
	}
	
	
	

}
