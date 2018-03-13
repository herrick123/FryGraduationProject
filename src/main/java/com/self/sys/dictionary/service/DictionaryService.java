package com.self.sys.dictionary.service;


import java.util.List;
import java.util.Map;

import com.core.util.Page;
import com.self.sys.dictionary.entity.DictionaryEntity;

public interface DictionaryService {

	/**
	 * 分页查询数据字典信息
	 * @param dictionary
	 * @param page
	 * @return
	 */
	public List<DictionaryEntity> findDictionaryPage(DictionaryEntity dictionary, Page<DictionaryEntity> page);

	/**
	 * 查询所有的数据字典信息
	 * @return
	 */
	public List<DictionaryEntity> findAllDict();

	/**
	 * 增加新应用
	 * @param dict
	 * @return
	 */
	public Integer saveDictionary(DictionaryEntity dict);

	/**
	 * 批量删除应用信息
	 * @param ids
	 * @return
	 */
	public Integer deleteDict(String[] ids);

	/**
	 * 通过id查询应用信息
	 * @param id
	 * @return
	 */
	public DictionaryEntity findDictEntityInfo(String id);

	/**
	 * 通过传入的条件查询应用信息
	 * @param id
	 * @return
	 */
	public List<DictionaryEntity> findDictTypeCode(String typeCode);

	/**
	 * 修改字典分类信息
	 * @param app
	 * @return
	 */
	public Integer updateDictionary(DictionaryEntity dict);

	/**
	 * 根据传入的条件查询数据字典分类信息
	 * @param params
	 * @param notIn
	 * @return
	 */
	public Integer findDictEntityByParams(Map<String, String> params, Map<String, String> notIn);
	
	/**
	 * 根据传入的条件查询数据字典分类信息
	 * @param params
	 * @return
	 */
	public Integer findDictEntityByParams(Map<String, String> params);
	/**
	 * 不分页查询所有的字典分类
	 * @return
	 */
	public List<DictionaryEntity> listAllDictionary();
}
