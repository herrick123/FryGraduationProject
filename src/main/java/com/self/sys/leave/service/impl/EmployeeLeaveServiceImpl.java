package com.self.sys.leave.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.exception.BaseException;
import com.core.util.Page;
import com.github.pagehelper.PageHelper;
import com.self.sys.leave.service.EmployeeLeaveService;
import com.self.sys.leave.vo.EmployeeLeaveVo;
import com.self.training.entity.TrainingEntity;
/**
 * 
 * 学员项目期间请假查询
 * @author 董宏超
 * 
 * */
@Service("employeeLeaveService")
public class EmployeeLeaveServiceImpl implements EmployeeLeaveService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 查询请假信息
	 * 
	 * */
	@Override
	public List<EmployeeLeaveVo> findEmployeeLeave(EmployeeLeaveVo employeeLeaveVo,Page<EmployeeLeaveVo> page) {
		
		Map<String,Object> param=new HashMap<String,Object>();
		param.put("employeeId", employeeLeaveVo.getEmployeeId());
		PageHelper.startPage(page.getNowPage(),page.getPageSize());
		List<EmployeeLeaveVo> result = null;
		try {
			result = sqlSession.selectList("search_leave_employee_info", param);
		} catch (Exception e) {
			throw new BaseException("查询训练营信息失败"+e);
		}
			return result;

	}
}
