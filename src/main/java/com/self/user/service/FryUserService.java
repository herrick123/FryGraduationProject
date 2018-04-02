package com.self.user.service;


import java.util.List;
import java.util.Map;

import com.core.util.Page;
import com.self.user.entity.FryUserEntity;

public interface FryUserService {
	
	/**
	 * 分页查询用户
	 * @param user
	 * @param page
	 * @return
	 */
	public List<FryUserEntity> findFryUserPage(FryUserEntity user, Page<FryUserEntity> page);
	
	/**
	 * 查询用户
	 * @param user
	 * @return
	 */
	public List<FryUserEntity> findFryUserList(FryUserEntity user);

	/**
	 * 存储新增用户
	 * @param user
	 * @return
	 */
	public Integer saveFryUserEntity(FryUserEntity user);

	/**
	 * 查询用户信息
	 * @param id
	 * @return
	 */
	public FryUserEntity findFryUserEntityInfo(String id);

	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	public Integer updateFryUserEntity(FryUserEntity user);

	/**
	 * 根据传入的条件查询user对象
	 * @param params
	 * @return
	 */
	public Integer findFryUserEntityByParams(Map<String, String> params);

	/**
	 * 根据传入的条件查询user对象
	 * @param params 查询条件是键值相等
	 * @param notEqual	查询条件是键值不等
	 * @return
	 */
	public Integer findFryUserEntityByAnd(Map<String, String> params, Map<String, String> notEqual);

	/**
	 * 用户登录验证
	 * @param userAccount
	 * @param userPass
	 * @return
	 */
	public List<FryUserEntity> login(String userName);
	
}
