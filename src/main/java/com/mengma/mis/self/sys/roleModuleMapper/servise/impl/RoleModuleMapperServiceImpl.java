package com.mengma.mis.self.sys.roleModuleMapper.servise.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mengma.mis.core.exception.BaseException;
import com.mengma.mis.core.exception.DeleteException;
import com.mengma.mis.core.exception.SaveException;
import com.mengma.mis.core.util.UuidUtil;
import com.mengma.mis.self.sys.roleModuleMapper.dao.RoleModuleMapper;
import com.mengma.mis.self.sys.roleModuleMapper.entity.RoleModuleMapperEntity;
import com.mengma.mis.self.sys.roleModuleMapper.servise.RoleModuleMapperService;


@Service("roleModuleMapperService")
public class RoleModuleMapperServiceImpl implements RoleModuleMapperService {
	@Autowired
	private RoleModuleMapper roleModuleMapper;
	@Autowired
	private SqlSessionTemplate sqlSession;
	/**
	 * 增加角色与模块的关联
	 */
	@Override
	public void addRoleModuleMapping(String roleId, List<String> moduleId) {
		RoleModuleMapperEntity rm = null;
		for(String id : moduleId){
			try {
				rm = new RoleModuleMapperEntity();
				rm.setId(UuidUtil.getUuid36());
				rm.setModuleId(id);
				rm.setRoleId(roleId);
				roleModuleMapper.insert(rm);
			} catch (Exception e) {
				if(e.getMessage().indexOf("ORA-02291")>0){
					
				}else {
					throw new SaveException("增加角色与 模块的关联出错"+e.getMessage());
				}
			}
		}
	}
	/**
	 * 根据roleId删除角色与模块的关联
	 */
	@Override
	public void deleteRoleModuleMappingByRole(String roleId,List<String> moduleId){
		try {
			Map<String, Object> param = new HashMap<>();
			param.put("roleId", roleId);
			param.put("moduleId", moduleId);
			sqlSession.delete("sodb.role.module.deleteRoleModuleMapper", param);
		} catch (Exception e) {
			throw new DeleteException("根据roleId删除角色与模块的关联出错"+e);
		}
	}
	/**
	 * 根据roleId查询角色与模块的关联
	 * 返回模块id
	 */
	@Override
	public List<String> selectALLRoleModuleMappingByRole(String id) {
		List<String> roleModuleMapperList = null;
		roleModuleMapperList = sqlSession.selectList("sodb.role.module.search_all_moduleid_info", id);
		return roleModuleMapperList ;
	}
	
	@Override
	public List<String> listGroupsByRoleId(String roleId) {
		List<String> groups = null;
		try{
			groups = sqlSession.selectList("sodb.role.module.search_all_moduleGroups_info", roleId);
		}catch(Exception e){
			throw new BaseException("根据roleId查询所有模块列表出错"+e);
		}
		return groups ;
	}
}
