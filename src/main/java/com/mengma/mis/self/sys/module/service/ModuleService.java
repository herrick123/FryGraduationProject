package com.mengma.mis.self.sys.module.service;

import com.mengma.mis.core.util.Page;
import com.mengma.mis.self.sys.module.entity.ModuleEntity;

import java.util.List;
import java.util.Map;


public interface ModuleService {

	public List<ModuleEntity> findModulePage(ModuleEntity module, Page<ModuleEntity> page);

	public Integer saveModule(ModuleEntity moduleEntity);

	public ModuleEntity findModduleEntityInfo(String moduleId);

	public Integer deleteModule(String[] moduleIds);

	public Integer updateModule(ModuleEntity module);

	public String selectModuleName(String id);
	/**
	 * 根据参数查询module实体 条件之间用and连接
	 * @param params查询条件
	 * @return 返回查询到的数量
	 */
	public int findModuleEntityByParams(Map<String, String> params);
	/**
	 * 根据参数查询module实体 条件之间用and和or连接,此方法耦合性很高，如果调用请重写
	 * @param arr
	 * @param notEqual
	 * @return
	 */
	public int findmoduleEntityByOr(String[] arr, Map<String, String> notEqual);
	/**
	 * 根据应用id删除模块
	 * @param ids
	 */
	public void deleteModuleByAppid(String[] ids);
	/**
	 * 根据应用id查询模块列表
	 * @param id
	 */
	public List<ModuleEntity> listModulesByAppid(String id);
	
	/**
	 * 根据组和权限id查询所有的模块
	 * @return
	 */
	public List<ModuleEntity> listModules(String roleId, String node);
}
