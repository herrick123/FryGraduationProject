package com.self.sys.module.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.constant.GlobalCodeConstant;
import com.core.exception.BaseException;
import com.core.exception.DeleteException;
import com.core.exception.SaveException;
import com.core.exception.UpdateException;
import com.core.util.MisUtil;
import com.core.util.Page;
import com.core.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.self.sys.module.dao.ModuleMapper;
import com.self.sys.module.entity.ModuleEntity;
import com.self.sys.module.service.ModuleService;

import tk.mybatis.mapper.entity.Example;

@Service("moduleService")
public class ModuleServiceImpl implements ModuleService {
	
	@Autowired
	private ModuleMapper moduleMapper;
	@Autowired
	private SqlSessionTemplate sqlSession;
	/**
	 * 分页查询模块数据
	 */
	@Override
	public List<ModuleEntity> findModulePage(ModuleEntity module, Page<ModuleEntity> page){
		
		Example example = new Example(ModuleEntity.class);
		example.setOrderByClause("APP_ID,display_index ASC");
		Example.Criteria criteria = example.createCriteria();
		if(StringUtils.isNotEmpty(module.getModuleName())){
			criteria.andLike("moduleName", "%" + module.getModuleName() + "%");
		}
		if (StringUtils.isNotEmpty(module.getModuleUrl())) {
			criteria.andLike("moduleUrl", "%" + module.getModuleUrl() + "%");
		}
		if (StringUtils.isNotEmpty(module.getAppId())) {
			criteria.andLike("appId", "%" + module.getAppId() + "%");
		}
		PageHelper.startPage(page.getNowPage(), page.getPageSize());
		return moduleMapper.selectByCondition(example);
	}

	/**
	 * 存储新增模块
	 */
	@Override
	public Integer saveModule(ModuleEntity moduleEntity) {
		
		String id = UuidUtil.getUuid36();
		Date date = new Date();
		long currentTime = date.getTime();
		moduleEntity.setId(id);
		moduleEntity.setModuleState(0);
		moduleEntity.setCreater(id);
		moduleEntity.setModifier(id);
		moduleEntity.setCreateTime(new Date(currentTime));
		moduleEntity.setUpdateTime(new Date(currentTime));
		int result = GlobalCodeConstant.BASE_SUCCESS_CODE;
		try {
			result = moduleMapper.insert(moduleEntity);
		} catch (Exception e) {
			throw new SaveException("添加模块失败！" + e);
		}
		return result;
	}

	/**
	 * 查询模块信息
	 */
	@Override
	public ModuleEntity findModduleEntityInfo(String moduleId) {
		
		return moduleMapper.selectByPrimaryKey(moduleId);
	}

	/**
	 * 修改模块信息
	 */
	@Override
	public Integer updateModule(ModuleEntity module) {
		
		int result = GlobalCodeConstant.BASE_SUCCESS_CODE;
		try {
			result = moduleMapper.updateByPrimaryKeySelective(module);
		} catch (Exception e) {
			throw new UpdateException("修改模块失败！" + e);
		}
		return result;
	}
	
	/**
	 * 批量删除模块
	 * @param moduleIds
	 */
	@Override
	public Integer deleteModule(String[] moduleIds) {
		List<String> params = MisUtil.arrayTransList(moduleIds);
		Example example = new Example(ModuleEntity.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andIn("moduleId", params);
		//删除模块与角色的关联
		sqlSession.delete("sodb.role.module.delete_role_module_mapper_by_modules", moduleIds);
		return moduleMapper.deleteByCondition(example);
	}
	/**
	 * 根据ID查询模块名
	 */
	@Override
	public String selectModuleName(String id) {
		return findModduleEntityInfo(id).getModuleName();
	}
	
	/**
	 * 根据参数查询module实体
	 */
	@Override
	public int findModuleEntityByParams(Map<String, String> params) {
		Example example = new Example(ModuleEntity.class);
		Example.Criteria criteria = example.createCriteria();
		int result = 0;
		for(String key:params.keySet()){
			criteria.andEqualTo(key, params.get(key));
		}
		try {
			result = moduleMapper.selectCountByCondition(example);
		} catch (Exception e) {
			throw new BaseException("根据参数查询module实体出错"+e);
		}
		return result;
	}
	/**
	 * 根据参数查询module实体
	 */
	@Override
	public int findmoduleEntityByOr(String[] arr, Map<String, String> notEqual) {
		Example example = new Example(ModuleEntity.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andCondition("("+arr[0].toString()+"= '"+arr[1].toString()+"' or "+arr[2].toString()+" = '"+arr[3].toString()+"')");
		for (String key:notEqual.keySet()) {
			criteria.andNotEqualTo(key, notEqual.get(key));
		}
		Integer result = null;
		try {
			result = moduleMapper.selectCountByCondition(example);
		} catch (Exception e) {
			throw new BaseException("模块查重出错"+e);
		}
		return result;
	}
	/**
	 * 根据应用id删除模块
	 */
	@Override
	public void deleteModuleByAppid(String[] ids) {
		try {
			sqlSession.delete("sodb.module.delete_module_by_Appid", ids);
		} catch (Exception e) {
			throw new DeleteException("根据应用id删除模块出错"+e);
		}
	}
	/**
	 * 根据应用id查询模块列表
	 * @return 
	 */
	@Override
	public List<ModuleEntity> listModulesByAppid(String id) {
		List<ModuleEntity> moduleList = null;
		Example example = new Example(ModuleEntity.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("appId", id);
		try {
			moduleList = moduleMapper.selectByCondition(example);
		} catch (Exception e) {
			throw new BaseException("根据应用appid查询模块列表出错"+e);
		}
		return moduleList;
	}

	/**
	 * 根据角色id和模块组查询模块
	 */
	@Override
	public List<ModuleEntity> listModules(String roleId, String group) {
		Map<String, String> param = new HashMap<>();
		param.put("roleId", roleId);
		param.put("group", group);
		List<ModuleEntity> moduleList = null;
		try {
			moduleList = sqlSession.selectList("sodb.role.module.search_all_module_info", param);
		} catch (Exception e) {
			System.out.println(e);
			throw new BaseException("查询模块列表出错"+e,e);
		}
		return moduleList;
	}
}
