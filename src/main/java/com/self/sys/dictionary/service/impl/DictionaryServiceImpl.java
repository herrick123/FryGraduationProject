package com.self.sys.dictionary.service.impl;

import com.core.constant.GlobalCodeConstant;
import com.core.exception.BaseException;
import com.core.exception.ParamsException;
import com.core.exception.SaveException;
import com.core.util.MisLog;
import com.core.util.MisUtil;
import com.core.util.Page;
import com.core.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.self.sys.constant.dao.ConstantMapper;
import com.self.sys.constant.entity.ConstantEntity;
import com.self.sys.dictionary.dao.DictionaryMapper;
import com.self.sys.dictionary.entity.DictionaryEntity;
import com.self.sys.dictionary.service.DictionaryService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

@Service("dictionary")
public class DictionaryServiceImpl implements DictionaryService {

	@Autowired
	private DictionaryMapper dictMapper;
	@Autowired
	private ConstantMapper constantMapper;
	
	
	private static final Logger log = LoggerFactory.getLogger(DictionaryServiceImpl.class);
	
	/**
	 * 分页查询数据字典信息
	 */
	@Override
	public List<DictionaryEntity> findDictionaryPage(DictionaryEntity dictionary, Page<DictionaryEntity> page) {
		Example example = new Example(DictionaryEntity.class);
		example.setOrderByClause("TYPE_CODE ASC");
		Example.Criteria criteria = example.createCriteria();
		if (StringUtils.isNotEmpty(dictionary.getTypeCode())) {
			criteria.andLike("typeCode","%"+ dictionary.getTypeCode() +"%");
		}
		if (StringUtils.isNotEmpty(dictionary.getTypeName())) {
			criteria.andLike("typeName", "%"+dictionary.getTypeName()+"%");
		}
		PageHelper.startPage(page.getNowPage(), page.getPageSize());
		return dictMapper.selectByCondition(example);
	}

	/**
	 * 增加新的数据字典信息
	 */
	@Override
	public Integer saveDictionary(DictionaryEntity dict) {
		String id = UuidUtil.getUuid36();
		dict.setId(id);
		dict.setCreateTime(new Timestamp(System.currentTimeMillis()));
		dict.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		int result = GlobalCodeConstant.SAVE_ERROR_CODE;
		try {
			result = dictMapper.insert(dict);
		} catch (Exception e) {
			throw new SaveException("添加数据字典失败" + e);
		}
		return result ;
	}

	/**
	 * 删除数据字典信息
	 */
	@Override
	public Integer deleteDict(String[] ids) {
		MisLog.info(log, "删除数据字典信息");
		List<String> params = MisUtil.arrayTransList(ids);
		Example example = new Example(DictionaryEntity.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andIn("id",params);
		return dictMapper.deleteByCondition(example);
	}

	/**
	 * 根据id查询数据字典信息
	 * @param id
	 * @return
	 */
	@Override
	public DictionaryEntity findDictEntityInfo(String id) {
		try {
			dictMapper.selectByPrimaryKey(id);
		} catch (Exception e) {
			throw new ParamsException("查询数据字典信息失败！" + e);
		}
		return dictMapper.selectByPrimaryKey(id);
	}

	/**
	 * 修改数据字典信息
	 * @param dict
	 * @return
	 */
	@Override
	public Integer updateDictionary(DictionaryEntity dict) {
		String id = UuidUtil.getUuid36();
		dict.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		int result = GlobalCodeConstant.UPDATE_ERROR_CODE;
		try {
			result = dictMapper.updateByPrimaryKeySelective(dict);
		} catch (Exception e) {
			throw new SaveException("修改数据字典失败" + e);
		}
		return result;
	}

	/**
	 * 查询所有的数据字典信息
	 */
	@Override
	public List<DictionaryEntity> findAllDict() {
		return dictMapper.selectAll();
	}

	/**
	 * 根据传入的条件查询数据字典信息
	 */
	@Override
	public Integer findDictEntityByParams(Map<String, String> params, Map<String, String> notIn) {
		Example example = new Example(DictionaryEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
			
		}
		for (String key:notIn.keySet()) {
			criteria.andNotEqualTo(key, notIn.get(key));
		}
		return dictMapper.selectCountByCondition(example);
	}

	/**
	 * 根据传入的条件查询数据字典信息
	 */
	@Override
	public Integer findDictEntityByParams(Map<String, String> params) {
		Example example = new Example(DictionaryEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
		}
		return dictMapper.selectCountByCondition(example);
	}
	
	/**
	 * 通过数据字典的code得到记录
	 */
	@Override
	public List<DictionaryEntity> findDictTypeCode(String typeCode) {
		Example example = new Example(DictionaryEntity.class);
		Example.Criteria criteria = example.createCriteria();
		if (StringUtils.isNotEmpty(typeCode)) {
			criteria.andEqualTo("typeCode", typeCode );
		}
		return dictMapper.selectByCondition(example);
	}
	
	/**
	 * 不分页查询所有的字典分类名
	 */
	@Override
	public List<DictionaryEntity> listAllDictionary() {
		Example example = new Example(DictionaryEntity.class);
		example.setOrderByClause("TYPE_NAME ASC");
		List<DictionaryEntity> dicList = null;
		try {
			dicList = dictMapper.selectByCondition(example);
		} catch (Exception e) {
			throw new BaseException("不分页查询所有的字典分类名构建树出错",e);
		}
		return dicList;
	}

}
