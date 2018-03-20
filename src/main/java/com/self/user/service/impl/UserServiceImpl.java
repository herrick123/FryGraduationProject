package com.self.user.service.impl;


import com.core.exception.BaseException;
import com.core.util.Page;
import com.core.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.self.user.dao.UserMapper;
import com.self.user.entity.UserEntity;
import com.self.user.service.UserService;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.*;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper usermapper;
	
	/**
	 * 分页查询用户
	 */
	@Override
	public List<UserEntity> findUserPage(UserEntity user, Page<UserEntity> page) {
		Example example = new Example(UserEntity.class);
		Example.Criteria criteria = example.createCriteria();
		if(StringUtils.isNotEmpty(user.getUserName())){
			criteria.andLike("userName", "%" + user.getUserName() + "%");
		}
		if(StringUtils.isNotEmpty(user.getRole())){
			criteria.andEqualTo("role", user.getRole());
		}
		PageHelper.startPage(page.getNowPage(),page.getPageSize());
		
		return usermapper.selectByCondition(example);
	}
	
	/**
	 * 保存用户
	 */
	@Override
	public Integer saveUserEntity(UserEntity user) {
		String id = UuidUtil.getUuid36();
		user.setUuid(id);
		user.setUserStatus("0");
		
		return usermapper.insertSelective(user);
	}
	
	/**
	 * 更新用户
	 */
	@Override
	public Integer updateUserEntity(UserEntity user) {
		
		return usermapper.updateByPrimaryKeySelective(user);
	}
	
	/**
	 * 通过用户id查询用户信息
	 */
	@Override
	public UserEntity findUserEntityInfo(String id) {
		
		return usermapper.selectByPrimaryKey(id);
	}
	
	/**
	 * 通过传入的参数查询用户
	 * 参数以map形式传入，每一个条件用and连接
	 * 返回值是查询到数据的数量
	 */
	@Override
	public Integer findUserEntityByParams(Map<String, String> params) {
		Example example = new Example(UserEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
		}
		return usermapper.selectCountByCondition(example);
	}
	
	/**
	 * 通过传入的参数查询用户
	 * 参数params以map形式传入，每一个条件用and连接
	 * 参数notEqual以map形式传入，条件是<>,例如：userid<>1;
	 * 返回值是查询到数据的数量
	 */
	@Override
	public Integer findUserEntityByAnd(Map<String, String> params, Map<String, String> notEqual) {
		Example example = new Example(UserEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
		}
		for (String key:notEqual.keySet()) {
			criteria.andNotEqualTo(key, notEqual.get(key));
		}
		Integer result = null;
		try {
			result = usermapper.selectCountByCondition(example);
		} catch (Exception e) {
			throw new BaseException("用户查重出错"+e);
		}
		return result;
	}
	
	/**
	 * 用户登录
	 */
    @Override
    public List<UserEntity> login(String userName) {
        Example example = new Example(UserEntity.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("userName",userName);
        
        return usermapper.selectByCondition(example);
    }
    
}
