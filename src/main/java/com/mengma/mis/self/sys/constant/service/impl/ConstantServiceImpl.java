package com.mengma.mis.self.sys.constant.service.impl;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.mengma.mis.core.constant.GlobalCodeConstant;
import com.mengma.mis.core.exception.BaseException;
import com.mengma.mis.core.exception.DeleteException;
import com.mengma.mis.core.exception.ParamsException;
import com.mengma.mis.core.exception.SaveException;
import com.mengma.mis.core.exception.UpdateException;
import com.mengma.mis.core.util.MisUtil;
import com.mengma.mis.core.util.Page;
import com.mengma.mis.core.util.UuidUtil;
import com.mengma.mis.self.sys.constant.constantVo.ConstantVo;
import com.mengma.mis.self.sys.constant.dao.ConstantMapper;
import com.mengma.mis.self.sys.constant.entity.ConstantEntity;
import com.mengma.mis.self.sys.constant.service.ConstantService;

import tk.mybatis.mapper.entity.Example;

@Service("constant")
public class ConstantServiceImpl implements ConstantService {

	@Autowired
	private ConstantMapper constMapper;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**
	 * 分页查询所有的数据字典分类对应值
	 */
	@Override
	public List<ConstantEntity> findConstantEntity(ConstantEntity cEntity, Page<ConstantEntity> page) {
		Example example = new Example(ConstantEntity.class);
		example.setOrderByClause("DICTIONARY_ID ASC");
		Example.Criteria criteria = example.createCriteria();
		if (StringUtils.isNotEmpty(cEntity.getValueName())) {
			criteria.andLike("valueName", "%" + cEntity.getValueName() + "%");
		}
		if (StringUtils.isNotEmpty(cEntity.getValueCode())) {
			criteria.andLike("valueCode", "%" + cEntity.getValueCode() + "%");
		}
		if (StringUtils.isNotEmpty(cEntity.getdictionaryId())) {
			criteria.andLike("dictionaryId", "%" + cEntity.getdictionaryId() + "%");
		}
		PageHelper.startPage(page.getNowPage(), page.getPageSize());
		return constMapper.selectByCondition(example);
	}
	
	/**
	 * 不分页查询所有的数据字典分类对应值
	 */
	@Override
	public List<ConstantEntity> findConstantEntityNoPage(ConstantEntity cEntity) {
		Example example = new Example(ConstantEntity.class);
		example.setOrderByClause("DICTIONARY_ID ASC");
		Example.Criteria criteria = example.createCriteria();
		if (StringUtils.isNotEmpty(cEntity.getValueName())) {
			criteria.andLike("valueName", "%" + cEntity.getValueName() + "%");
		}
		if (StringUtils.isNotEmpty(cEntity.getValueCode())) {
			criteria.andLike("valueCode", "%" + cEntity.getValueCode() + "%");
		}
		if (StringUtils.isNotEmpty(cEntity.getdictionaryId())) {
			criteria.andLike("dictionaryId", "%" + cEntity.getdictionaryId() + "%");
		}
		return constMapper.selectByCondition(example);
	}

	/**
	 * 通过dictionaryId来查询对应数据字典
	 */
	@Override
	public List<ConstantEntity> findConstantByDictId(String dictionaryId) {
		Example example = new Example(ConstantEntity.class);
		example.setOrderByClause("VALUE_CODE ASC");
		Example.Criteria criteria = example.createCriteria();
		if (StringUtils.isNotEmpty(dictionaryId)) {
			criteria.andEqualTo("dictionaryId", dictionaryId );
		}
		return constMapper.selectByCondition(example);
	}

	/**
	 * 新增数据字典分类对应值
	 */
	@Override
	public Integer saveConstant(ConstantEntity cEntity) {
		String id = UuidUtil.getUuid36();
		cEntity.setId(id);
		cEntity.setCreateTime(new Timestamp(System.currentTimeMillis()));
		cEntity.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		int result = GlobalCodeConstant.SAVE_ERROR_CODE;
		try {
			result = constMapper.insert(cEntity);
		} catch (Exception e) {
			throw new SaveException("添加数据字典分类值失败！" + e);
		}
		return result;
	}

	/**
	 * 批量删除数据字典数据信息
	 */
	@Override
	public Integer deleteConstants(String[] ids) {
		List<String> params = MisUtil.arrayTransList(ids);
		Example example = new Example(ConstantEntity.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andIn("id",params);
		return constMapper.deleteByCondition(example);
	}

	/**
	 * 根据id查询数据字典数据信息
	 */
	@Override
	public ConstantEntity searchConstantById(String id) {
		try {
			constMapper.selectByPrimaryKey(id);
		} catch (Exception e) {
			throw new ParamsException("查询数据字典数据信息失败！" + e);
		}
		return constMapper.selectByPrimaryKey(id);
	}

	/**
	 * 修改数据字典数据信息
	 */
	@Override
	public Integer updateConstantEntity(ConstantEntity cEntity) {
		String id = UuidUtil.getUuid36();
		cEntity.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		int result = GlobalCodeConstant.UPDATE_ERROR_CODE;
		try {
			result = constMapper.updateByPrimaryKeySelective(cEntity);
		} catch (Exception e) {
			throw new UpdateException("修改数据字典数据信息失败！" + e);
		}
		return result;
	}

	/**
	 * 根据传入的条件查询数据字典分类值信息
	 */
	@Override
	public Integer findConstantByParams(Map<String, String> params, Map<String, String> notIn) {
		Example example = new Example(ConstantEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
		}
		for (String key:notIn.keySet()) {
			criteria.andNotEqualTo(key, notIn.get(key));
		}
		return constMapper.selectCountByCondition(example);
	}

	/**
	 * 根据传入的条件查询数据字典分类值信息
	 */
	@Override
	public Integer findConstantByParams(Map<String, String> params) {
		Example example = new Example(ConstantEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
		}
		return constMapper.selectCountByCondition(example);
	}

	@Override
	public int findConstantEntityByOr(String[] arr, Map<String, String> notEqual) {
		Example example = new Example(ConstantEntity.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andCondition("("+arr[0].toString()+"= '"+arr[1].toString()+"') and "+arr[2].toString()+" = '"+arr[3].toString()+"'");
		for (String key:notEqual.keySet()) {
			criteria.andNotEqualTo(key, notEqual.get(key));
		}
		Integer result = null;
		try {
			result = constMapper.selectCountByCondition(example);
		} catch (Exception e) {
			throw new BaseException("constant查重出错"+e);
		}
		return result;
	}
	/**
	 *  根据字典分类id删除数据字典值
	 */
	@Override
	public void deleteConstantsByDictionnaryId(String[] ids) {
		Example example = new Example(ConstantEntity.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andIn("dictionaryId", Arrays.asList(ids));
		try {
			constMapper.deleteByCondition(example);
		} catch (Exception e) {
			throw new DeleteException("根据字典分类id删除数据字典值出错"+e);
		}
	}

	/**
	 * 根据传入的参数返回ConstantVo
	 * constantCode:二级数据字典的valueCode
	 * dictionaryId：一级数据字典的id
	 */
	@Override
	public String returnDictNameAndCode(String constantCode, String typeCode) {
		// TODO Auto-generated method stub
		String[] code = constantCode.split(",");
		//List codeList = Arrays.asList(code);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("typeCode", typeCode);
		param.put("code", code);
		List<ConstantVo> result = null;
		try {
			result = sqlSession.selectList("self.constant.search_constant_nameAndCode", param);
		} catch (Exception e) {
			throw new BaseException("根据传入的参数返回ConstantVo错误"+e);
		}
		String string = "";
		for (ConstantVo constantVo : result) {
			string += constantVo.getValueName() + ",";
		}
		string = string.substring(0,string.length()-1);
		return string;
	}

	@Override
	public List<ConstantEntity> searchConstantByCode(String dictionaryCode) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("dictionaryCode", dictionaryCode);
		List<ConstantEntity> result = null;
		try {
			result = sqlSession.selectList("self.constant.search_constant_byDictCode", param);
		} catch (Exception e) {
			throw new BaseException("根据传入的参数返回List<ConstantEntity>错误"+e);
		}
		return result;
	}
}
