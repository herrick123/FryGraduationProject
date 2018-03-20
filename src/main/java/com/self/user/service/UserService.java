package com.self.user.service;


import java.util.List;
import java.util.Map;

import com.core.util.Page;
import com.self.user.entity.UserEntity;

public interface UserService {
	
	/**
	 * 分页查询用户
	 * @param user
	 * @param page
	 * @return
	 */
	public List<UserEntity> findUserPage(UserEntity user, Page<UserEntity> page);

	/**
	 * 存储新增用户
	 * @param user
	 * @return
	 */
	public Integer saveUserEntity(UserEntity user);

	/**
	 * 查询用户信息
	 * @param id
	 * @return
	 */
	public UserEntity findUserEntityInfo(String id);

	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	public Integer updateUserEntity(UserEntity user);

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
	 * 用户登录验证
	 * @param userAccount
	 * @param userPass
	 * @return
	 */
	public List<UserEntity> login(String userName);
	
}
