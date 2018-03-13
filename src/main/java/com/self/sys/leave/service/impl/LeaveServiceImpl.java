package com.self.sys.leave.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.constant.GlobalCodeConstant;
import com.core.exception.BaseException;
import com.core.exception.SaveException;
import com.core.exception.UpdateException;
import com.core.util.Page;
import com.github.pagehelper.PageHelper;
import com.self.sys.leave.dao.LeaveMapper;
import com.self.sys.leave.entity.LeaveEntity;
import com.self.sys.leave.service.LeaveService;
import com.self.sys.leave.vo.LeaveVo;

import tk.mybatis.mapper.entity.Example;

/**
 * 猛码请假管理
 * @author 王雅楠
 *
 */
@Service("leaveService")
public class LeaveServiceImpl implements LeaveService {
	
	@Autowired
	private LeaveMapper leavemapper;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 分页查询请假列表
	 */
	@Override
	public List<LeaveEntity> findLeavePage(LeaveEntity leave, Page<LeaveEntity> page) {
		Example example = new Example(LeaveEntity.class);
		Example.Criteria criteria = example.createCriteria();
		if(StringUtils.isNotEmpty(leave.getName())){
			criteria.andLike("name", "%"+leave.getName()+"%");
		}
		PageHelper.startPage(page.getNowPage(),page.getPageSize());
		List<LeaveEntity> result = null;
		try {
			result = leavemapper.selectByCondition(example);
		} catch (Exception e) {
			throw new BaseException("分页查询请假列表出错"+e);
		}
		return result;
	}

	/**
	 * 增加请假申请
	 */
	@Override
	public Integer saveLeaveEntity(LeaveEntity leave) {
		int result= GlobalCodeConstant.BASE_SUCCESS_CODE;
		try {
			result = leavemapper.insert(leave);
		} catch (Exception e) {
			throw new SaveException("添加请假申请失败!",e);
		}
		return result;
	}

	/**
	 * 根据姓名和开始时间判断假期
	 */
	@Override
	public Integer selectExistLeave(String name, java.sql.Date startTime,java.sql.Date endTime) {
		int result = 0;
		Map<String, Object> param = new HashMap<>();
		param.put("name",name);
		param.put("startTime", startTime);
		param.put("endTime", endTime);
		try {
			result = sqlSession.selectOne("mengma.leave.selectExistLeave",param);
		} catch (Exception e) {
			throw new UpdateException("查询已存在假期出现错误", e);
		}
		return result;
	}
	
	/**
	 * 改变请假审核状态
	 */
	@Override
	public Integer editLeaveStatus(String id, String operation){
		Map<String, Object> param = new HashMap<>();
		param.put("id",id );
		param.put("operation", operation);
		try {
			sqlSession.update("mengma.leave.changeLeaveStatus",param);
		} catch (Exception e) {
			throw new UpdateException("改变假期审核状态出现错误", e);
		}
		return null;
	}
	
	/**
	 * 根据id查询请假信息
	 */
	@Override
	public LeaveEntity selectOneLeave(String id) {
		LeaveEntity leaveEntity = null;
		try {
			leaveEntity = leavemapper.selectByPrimaryKey(id);
		} catch (Exception e) {
			throw new BaseException("根据id查询请假信息失败"+e);
		}
		return leaveEntity;
	}
	
	/**
	 * 统计请假
	 */
	@Override
	public List<LeaveVo> findLeaveTotalPage(String time) {
		List<LeaveVo> result = null;
		Map<String, String> param = new HashMap<>();
		int endYear = Integer.parseInt(time)+1;
		String startTime = time+"-1-1";
		String endTime = String.valueOf(endYear)+"-1-1";
		param.put("startTime", startTime);
		param.put("endTime", endTime);
		try {
			result = sqlSession.selectList("mengma.leave.searchLeaveTotal",param);
		} catch (Exception e) {
			throw new BaseException("统计请假出错"+e);
		}
		return result;
	}

}
