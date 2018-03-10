package com.mengma.mis.self.sys.leave.service;

import java.util.List;

import com.mengma.mis.core.util.Page;
import com.mengma.mis.self.sys.leave.entity.LeaveEntity;
import com.mengma.mis.self.sys.leave.vo.LeaveVo;

/**
 * 猛码学员请假管理
 * @author 王雅楠
 *
 */
public interface LeaveService {
	
	/**
	 * 分页查询请假申请
	 * @param leave
	 * @param page
	 * @return
	 */
	public List<LeaveEntity> findLeavePage(LeaveEntity leave,Page<LeaveEntity> page);
	
	/**
	 * 存储新增请假
	 * @param leave
	 * @param operatorId
	 * @return
	 */
	public Integer saveLeaveEntity(LeaveEntity leave);
	
	/**
	 * 改变请假审核状态
	 * @param id
	 * @param status
	 * @return
	 */
	public Integer editLeaveStatus(String id,String operation);

	/**
	 * 根据id查询请假信息
	 * @param id
	 * @return
	 */
	public LeaveEntity selectOneLeave(String id);
	

	/**
	 * 根据姓名时间查假期
	 * @param name
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public Integer selectExistLeave(String name,java.sql.Date startTime,java.sql.Date endTime);
	
	/**
	 * 请假统计
	 * @param leave
	 * @return
	 */
	public List<LeaveVo>findLeaveTotalPage(String time);
}
