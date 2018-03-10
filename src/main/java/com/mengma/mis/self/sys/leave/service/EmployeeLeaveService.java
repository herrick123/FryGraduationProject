package com.mengma.mis.self.sys.leave.service;

import java.util.List;

import com.mengma.mis.core.util.Page;
import com.mengma.mis.self.sys.leave.vo.EmployeeLeaveVo;

/**
 * 学员项目期间请假查询
 * 
 * @author 董宏超
 * */
public interface EmployeeLeaveService {
	public List<EmployeeLeaveVo>  findEmployeeLeave(EmployeeLeaveVo employeeLeaveVo,Page<EmployeeLeaveVo> page);
}
