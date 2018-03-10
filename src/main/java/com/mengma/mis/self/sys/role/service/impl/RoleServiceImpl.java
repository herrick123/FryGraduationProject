package com.mengma.mis.self.sys.role.service.impl;

import com.github.pagehelper.PageHelper;
import com.mengma.mis.core.constant.GlobalCodeConstant;
import com.mengma.mis.core.exception.BaseException;
import com.mengma.mis.core.exception.DeleteException;
import com.mengma.mis.core.exception.SaveException;
import com.mengma.mis.core.util.Page;
import com.mengma.mis.core.util.UuidUtil;
import com.mengma.mis.self.sys.dictionary.entity.DictionaryEntity;
import com.mengma.mis.self.sys.role.dao.RoleMapper;
import com.mengma.mis.self.sys.role.entity.RoleEntity;
import com.mengma.mis.self.sys.role.service.RoleService;
import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 
 * @author 黄青山
 *
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleMapper roleMapper;
	
	@Autowired
    SqlSessionTemplate sqlSession;
	/**
	 * 保存角色
	 */
	@Override
	public Integer add(RoleEntity role) {
		String id = UuidUtil.getUuid36();
		Date date = new Date();
		long currentTime = date.getTime();
		role.setRoleId(id);
		role.setUpdateTime(new Date(currentTime));
		Integer result = GlobalCodeConstant.BASE_SUCCESS_CODE;
		try {
			roleMapper.insert(role);
		} catch (Exception e) {
			result = GlobalCodeConstant.BASE_ERROR_CODE;
			throw new SaveException("保存角色出错"+e);
		}
		return result;
	}
	/**
	 * 删除角色
	 */
	@Override
	public Integer delete(String id) {
		Integer result = GlobalCodeConstant.BASE_SUCCESS_CODE;
		try {
			//删除模块与角色的关联
			sqlSession.delete("sodb.role.module.delete_role_module_mapper_by_role",id);
		} catch (Exception e) {
			result = GlobalCodeConstant.BASE_ERROR_CODE;
			throw new DeleteException("删除角色与模块关联出错"+e);
		}
		try {
			roleMapper.deleteByPrimaryKey(id);
		} catch (Exception e) {
			result = GlobalCodeConstant.BASE_ERROR_CODE;
			throw new DeleteException("删除角色出错"+e);
		}
		return result;
	}
	/**
	 * 更新角色
	 */
	@Override
	public Integer update(RoleEntity role) {
		Integer result = GlobalCodeConstant.BASE_SUCCESS_CODE;
		try {
			roleMapper.updateByPrimaryKeySelective(role);
		} catch (Exception e) {
			result = GlobalCodeConstant.BASE_ERROR_CODE;
			throw new DeleteException("更新角色出错"+e);
		}
		return result;
	}
	/**
	 * 不分页查询角色
	 */
	@Override
	public List<RoleEntity> listRole() {
		Example example = new Example(RoleEntity.class);
		example.setOrderByClause("UPDATE_TIME DESC");
		List<RoleEntity> result = null;
		try {
			result = roleMapper.selectByCondition(example);
		} catch (Exception e) {
			throw new BaseException("查询角色出错",e);
		}
		return result;
	}
	/**
	 * 分页查询角色
	 */
	@Override
	public List<RoleEntity> findRolePage(RoleEntity role, Page<RoleEntity> page) {
		Example example = new Example(RoleEntity.class);
		example.setOrderByClause("UPDATE_TIME DESC");
		Example.Criteria criteria = example.createCriteria();
		if(StringUtils.isNotEmpty(role.getRoleName())){
			criteria.andLike("roleName", "%" + role.getRoleName() + "%");
		}
		PageHelper.startPage(page.getNowPage(),page.getPageSize());
		List<RoleEntity> roleList = null;
		try {
			roleList = roleMapper.selectByCondition(example);
		} catch (Exception e) {
			throw new BaseException("分页查询角色出错"+e);
		}
		return roleList;
	}
	/**
	 * 通过传入的一组角色id查询所有的角色名
	 */
	@Override
	public List<String> selectAllRoleName(List<String> ids) {
		List<String> result = new ArrayList<>();
		try {
			result = sqlSession.selectList("sodb.role.search_all_roleName_info", ids);
		} catch (Exception e) {
			throw new BaseException("查询角色名出错"+e);
		}
		return result;
	}
	/**
	 * 根据id查询角色
	 */
	@Override
	public RoleEntity selectOneEntity(String id) {
		RoleEntity result = null;
		try {
			result = roleMapper.selectByPrimaryKey(id);
		} catch (Exception e) {
			throw new BaseException("查询角色出错"+e);
		}
		return result;
	}
	/**
	 * 根据role_code查询角色
	 */
	@Override
	public RoleEntity selectOneEntityByRoleCode(String roleCode) {
		List<RoleEntity> result = null;
		Example example = new Example(RoleEntity.class);
		Example.Criteria criteria = example.createCriteria();
		if (StringUtils.isNotEmpty(roleCode)) {
			criteria.andEqualTo("roleCode", roleCode );
		}
		try {
			result = roleMapper.selectByCondition(example);
		} catch (Exception e) {
			throw new BaseException("根据 Map<String, String> params查询对象出错"+e);
		}
		RoleEntity roleEntity = result.get(0);
		return roleEntity;
	}
	/**
	 * 通过传入的参数查询用户
	 * 参数params以map形式传入，每一个条件用and连接
	 * 返回值是查询到数据的数量
	 */
	@Override
	public Integer findRoleEntityByParams(Map<String, String> params) {
		Example example = new Example(RoleEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for(String key:params.keySet()){
			criteria.andEqualTo(key, params.get(key));
		}
		try {
			return roleMapper.selectCountByCondition(example);
		} catch (Exception e) {
			throw new BaseException("根据 Map<String, String> params查询对象出错"+e);
		}
	}
	/**
	 * 通过传入的参数查询用户
	 * 参数params以map形式传入，每一个条件用and连接
	 * 参数notEqual以map形式传入，条件是<>,例如：roleid<>1;
	 * 返回值是查询到数据的数量
	 */
	@Override
	public Integer findRoleEntityByParams(Map<String, String> params, Map<String, String> notEq) {
		Example example = new Example(RoleEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for(String key:params.keySet()){
			criteria.andEqualTo(key, params.get(key));
		}
		for(String key:notEq.keySet()){
			criteria.andNotEqualTo(key, notEq.get(key));
		}
		try {
			return roleMapper.selectCountByCondition(example);
		} catch (Exception e) {
			throw new BaseException("params,notEq查询对象出错"+e);
		}
	}
	/**
	 * 查询所有的模块名
	 */
	@Override
	public List<String> selectAllModuleName(String id) {
		List<String> result = new ArrayList<>();
		try {
			result = sqlSession.selectList("sodb.role.module.search_all_moduleName_info", id);
		} catch (Exception e) {
			throw new BaseException("查询模块名出错"+e);
		}
		return result;
	}
		
	/**
	 * 通过角色id集合判断是否有管理员角色
	 * 如果集合里有code为管理员的返回true(不能删除)
	 */
	@Override
	public Boolean selectRoleCode(List<String> roleIds) {
		Example example = new Example(RoleEntity.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andIn("roleId", roleIds);
		criteria.andEqualTo("roleCode",GlobalCodeConstant.SYS_MANAGER_CODE);
		List<RoleEntity> roleList = roleMapper.selectByCondition(example);
		//不等于空，说明有管理员用户
		if (roleList != null && !roleList.isEmpty() ) {
			return Boolean.TRUE;
		}
		return Boolean.FALSE;
	}
}
