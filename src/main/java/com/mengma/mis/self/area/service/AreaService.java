package com.mengma.mis.self.area.service;

import java.util.List;


import java.util.Map;

import com.mengma.mis.core.util.Page;
import com.mengma.mis.self.area.entity.AreaEntity;

/**
 * 分区管理列表
 * @author 王子珩
 *
 */
public interface AreaService {
	
	/**
	 * 分区列表
	 * @return
	 */
	public List<AreaEntity> getAreaList(AreaEntity area, Page<AreaEntity> page);
	
	/**
	 * 查询所有分区
	 * @param area
	 * @return
	 */
	public List<AreaEntity> getAllArea();
	
	/**
	 * 管理员添加分区信息
	 * @return
	 */
	public Integer saveArea(AreaEntity sarea);
	
	/**
	 * 管理员删除分区信息
	 * @return
	 */
	
	public Integer deleteArea(String[] ids);
	
	/**
	 * 管理员修改分区信息
	 */
	public Integer updateArea(AreaEntity updArea);
	
	/**
	 * 通过id查询分区信息
	 */
	public AreaEntity findAreatEntityInfo(String id);
	
	/**
	 * 通过传入的条件查询分区信息
	 * @param id
	 * @return
	 */
	public List<AreaEntity> findAreaCode(String area);
	/**
	 * 根据传入的条件查询分区分类信息
	 * @param params
	 * @param notIn
	 * @return
	 */
	public Integer findAreaEntityByParams(Map<String, String> params,Map<String, String> notIn);
	
	/**
	 * 根据传入的条件查询分区分类信息
	 * @param params
	 * @return
	 */
	public Integer findAreaEntityByParams(Map<String, String> params);

}
