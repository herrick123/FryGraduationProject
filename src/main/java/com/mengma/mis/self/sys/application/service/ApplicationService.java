package com.mengma.mis.self.sys.application.service;

import com.mengma.mis.core.util.Page;
import com.mengma.mis.self.sys.application.entity.ApplicationEntity;

import java.util.List;
import java.util.Map;



public interface ApplicationService {
	
	/**
	 * 分页查询应用数据
	 */
	public List<ApplicationEntity> findAppPage(ApplicationEntity app, Page<ApplicationEntity> page);
	
	/**
	 * 增加新应用
	 */
	public Integer saveApplication(ApplicationEntity app);
	
	/**
	 * 通过id查询应用信息
	 * @param id
	 * @return
	 */
	public ApplicationEntity findAppEntityInfo(String id);
	/**
	 * 修改应用信息
	 * @param app
	 * @return
	 */
	public Integer updateApplication(ApplicationEntity app);
	
	/**
	 * 批量删除应用信息
	 * @param ids
	 * @return
	 */
	public Integer deleteApplication(String[] ids);

	/**
	 * 不分页查询所有应用
	 * @return
	 */
	public List<ApplicationEntity> selectNames();
	
	/**
	 * 根据传入的条件查询app信息
	 * @param params
	 * @param notIn
	 * @return
	 */
	public Integer findAppEntityByParams(Map<String, String> params, Map<String, String> notIn);
	
	/**
	 * 根据传入的条件查询app信息
	 * @param params
	 * @return
	 */
	public Integer findAppEntityByParams(Map<String, String> params);
	/**
	 * 查询所有的应用
	 * @return
	 */
	public List<ApplicationEntity> listAllApp();
}
