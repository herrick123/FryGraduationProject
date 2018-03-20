package com.self.sys.user.service;


import java.util.List;
import java.util.Map;

import com.core.util.Page;
import com.self.sys.user.entity.SysUserEntity;

public interface SysUserService {
	
	/**
	 * 分页查询用户
	 * @param user
	 * @param page
	 * @return
	 */
	public List<SysUserEntity> findUserPage(SysUserEntity user, Page<SysUserEntity> page);

	/**
	 * 存储新增用户
	 * @param user
	 * @return
	 */
	public Integer saveUserEntity(SysUserEntity user);

	/**
	 * 查询用户信息
	 * @param id
	 * @return
	 */
	public SysUserEntity findUserEntityInfo(String id);

	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	public Integer updateUserEntity(SysUserEntity user);

	/**
	 * 删除用户
	 * @param ids
	 * @return
	 */
	public Boolean deleteUserEntity(String[] ids);

	/**
	 * 通过传入的id,改变user表中的userStatus的状态
	 * @param id
	 * @return
	 */
	public Integer deleteOneUserEntity(String id);
	/**
	 * 根据传入的条件查询user对象
	 * @param params
	 * @return
	 */
	public Integer findUserEntityByParams(Map<String, String> params);

	/**
	 * 根据传入的条件查询user对象
	 * @param params 查询条件是键值相等
	 * @param notEqual	查询条件是键值不等
	 * @return
	 */
	public Integer findUserEntityByAnd(Map<String, String> params, Map<String, String> notEqual);

	/**
	 * 根据传入的条件查询user对象(此方法并没有抽象出个统一的方法，不能随便调用)
	 * @param params 查询条件是键值相等
	 * @param notEqual	查询条件是键值不等
	 * @return
	 */
	public Integer findUserEntityByOr(String[] arr, Map<String, String> notEqual);
	
	/**
	 * 批量重置密码
	 * @param ids
	 */
	public void resetUserEntity(String[] ids);
	
	public String selectDepartmentName(String departmentId);
	
	public List<String> listDepartment();
	
	/**
	 * 用户登录验证
	 * @param userAccount
	 * @param userPass
	 * @return
	 */
	public SysUserEntity login(String userAccount);
	
	/**
	 * 删除树的部门时，检查该部门是否有用户存在
	 */
	public boolean findIsHaveUser(List<String> idList);

	
}
