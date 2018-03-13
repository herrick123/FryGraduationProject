package com.self.sys.constant.service;



import java.util.List;
import java.util.Map;

import com.core.util.Page;
import com.self.sys.constant.entity.ConstantEntity;

public interface ConstantService {

	/**
	 * 分页查询所有的数据字典分类对应值
	 * @param cEntity
	 * @param page
	 * @return
	 */
	public List<ConstantEntity> findConstantEntity(ConstantEntity cEntity, Page<ConstantEntity> page);
	
	/**
	 * 不分页查询所有的数据字典分类对应值
	 * @param cEntity
	 * @return
	 */
	public List<ConstantEntity> findConstantEntityNoPage(ConstantEntity cEntity);
	
	/**
	 * 根据dictionaryId来查询数据字典
	 * @param dictionaryId
	 * @return
	 */
	public List<ConstantEntity> findConstantByDictId(String dictionaryId);

	/**
	 * 根据传入的参数返回ConstantVo
	 * @param constantCode二级数据字典的valueCode
	 * @param typeCode一级数据字典的type_code
	 * @return
	 */
	public String returnDictNameAndCode(String constantCode,String typeCode);
	/**
	 * 新增数据字典分类对应值
	 * @param cEntity
	 * @return
	 */
	public Integer saveConstant(ConstantEntity cEntity);

	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	public Integer deleteConstants(String[] ids);

	/**
	 * 通过id查询数据字典分类对应值
	 * @param id
	 * @return
	 */
	public ConstantEntity searchConstantById(String id);
	
	/**
	 * 通过dictionary_code查询数据字典分类对应值
	 * @param id
	 * @return
	 */
	public List<ConstantEntity> searchConstantByCode(String dictionaryCode);

	/**
	 * 修改数据字典信息
	 * @param cEntity
	 * @return
	 */
	public Integer updateConstantEntity(ConstantEntity cEntity);

	/**
	 * 根据传入的条件查询数据字典分类值信息
	 * @param params
	 * @param notIn
	 * @return
	 */
	public Integer findConstantByParams(Map<String, String> params, Map<String, String> notIn);
	
	/**
	 * 根据传入的条件查询数据字典分类值信息
	 * @param params
	 * @return
	 */
	public Integer findConstantByParams(Map<String, String> params);

	public int findConstantEntityByOr(String[] arr, Map<String, String> notEqual);
	/**
	 * 根据字典分类id删除数据字典值
	 * @param ids
	 */
	public void deleteConstantsByDictionnaryId(String[] ids);
	
}
