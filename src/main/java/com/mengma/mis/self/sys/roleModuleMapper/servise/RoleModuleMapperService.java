package com.mengma.mis.self.sys.roleModuleMapper.servise;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

public interface RoleModuleMapperService {
	/**
	 * 增加角色与模块关联
	 * @param moduleId
	 * @throws SQLIntegrityConstraintViolationException 
	 */
	public void addRoleModuleMapping(String roleId, List<String> moduleId) throws SQLIntegrityConstraintViolationException;
	/**
	 * 根据roleId和moduleId删除角色与模块关联
	 * @param moduleId
	 */
	public void deleteRoleModuleMappingByRole(String roleId, List<String> moduleId);
	/**
	 * 根据roleId查询角色与模块关联
	 * @param moduleId
	 */
	public List<String> selectALLRoleModuleMappingByRole(String roleId);
	
	/**
	 * 根据roleID查询角色下所有的模块组
	 * @param roleId
	 * @return
	 */
	public List<String> listGroupsByRoleId(String roleId);
}
