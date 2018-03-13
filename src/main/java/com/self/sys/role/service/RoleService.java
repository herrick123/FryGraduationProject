package com.self.sys.role.service;


import java.util.List;
import java.util.Map;

import com.core.util.Page;
import com.self.sys.role.entity.RoleEntity;

public interface RoleService {
	
	/**
	 * 增加一个角色
	 * @param role
	 * @return
	 */
	public Integer add(RoleEntity role);
	
	/**
	 * 删除一个角色
	 * @param ids
	 * @return
	 */
	public Integer delete(String ids);
	
	/**
	 * 更新一个角色
	 * @param role
	 * @return
	 */
	public Integer update(RoleEntity role);
	
	/**
	 * 不分页查询所有的角色
	 * @param role
	 * @param page
	 * @return
	 */
	public List<RoleEntity> listRole();
	
	/**
	 * 分页查询所有的角色
	 * @param role
	 * @param page
	 * @return
	 */
	public List<RoleEntity> findRolePage(RoleEntity role, Page<RoleEntity> page);
	
	/**
	 * 根据ID查询多条记录的角色名
	 * @param id
	 * @return 记录中的模块名
	 */
	public List<String> selectAllRoleName(List<String> ids);
	
	/**
	 * 根据ID查询单条记录
	 * @param id
	 * @return 记录中所有数据
	 */
	public RoleEntity selectOneEntity(String id);
	
	/**
	 * 根据role_code查询角色
	 * @param roleCode
	 * @return
	 */
	public RoleEntity selectOneEntityByRoleCode(String roleCode);
	
	/**
	 * 根据传入参数的键值对查询对象
	 * @param params
	 * @return
	 */
	public Integer findRoleEntityByParams(Map<String, String> params);
	
	/**
	 * 根据传入参数的键值对查询对象
	 * @param params 查询条件是键值相等
	 * @param notEq 查询条件是键值不等 
	 * @return
	 */
	public Integer findRoleEntityByParams(Map<String, String> params, Map<String, String> notEq);
	
	/**
	 * 根据传入参数查找查出所有的模块
	 * @param asList
	 * @return
	 */
	public List<String> selectAllModuleName(String asList);
	
	/**
	 * 根据传入的参数查找出角色code
	 */
	public Boolean selectRoleCode(List<String> roleIds);
}
