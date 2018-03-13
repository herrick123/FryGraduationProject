package com.self.employee.service;

import java.util.List;
import java.util.Map;

import com.core.util.Page;
import com.self.employee.employeeVo.EmployeeVo;
import com.self.employee.entity.EmployeeEntity;

public interface EmployeeService {
	
	/**
	 * 录入员工信息
	 * @param employee
	 */
	public Integer addEmployee(EmployeeEntity employee);
	
	/**
	 * 分页查询员工信息
	 * @param employee
	 * @param page
	 * @return
	 */
	public List<EmployeeEntity> findEmployeePage(EmployeeEntity employee,Page<EmployeeEntity> page);
	
	/**
	 * 编辑员工信息
	 * @param employee
	 * @return
	 */
	public Integer updateEmployee(EmployeeEntity employee);
	
	/**
	 * 删除员工信息
	 * @param ids
	 * @return
	 */
	public Integer deleteEmployee(String ids);

	/**
	 * 查询单个员工信息
	 * @param id
	 * @return
	 */
	public EmployeeEntity findEmployeeById(String id);
	
	/**
	 * 根据员工的登录名来查询员工
	 * @param userAcccount
	 * @return
	 */
	public EmployeeEntity findEmployeeByUserAccount(String userAcccount);

	/**
	 * 根据传入的条件查询employee对象
	 * @param params
	 * @return
	 */
	public int findEmployeeEntityByParams(Map<String, String> params);
 
	/**
	 * 批量导入时对员工数据的检查
	 * @param employeeEntity
	 * @return
	 */
	public Integer findEmployeeEntity(EmployeeEntity employeeEntity);

	/**
	 * 保存多条员工记录
	 * @param users
	 */
	public void saveEmployeeEntitys(List<EmployeeEntity> users);
	
	/**
	 * 根据员工id查询文件名和上传文件名
	 * @param id
	 * @return
	 */
	public List<EmployeeVo> findFileNameAndTime(String id);

}
