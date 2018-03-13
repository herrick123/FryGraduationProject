package com.self.sys.log.service.Impl;
/**
 * @author 王雅楠
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.exception.BaseException;
import com.core.util.Page;
import com.github.pagehelper.PageHelper;
import com.self.sys.log.dao.LogMapper;
import com.self.sys.log.entity.LogEntity;
import com.self.sys.log.service.LogService;

import fr.opensagres.xdocreport.utils.StringUtils;
import tk.mybatis.mapper.entity.Example;
@Service("logService")
public class LogServiceImpl implements LogService {
	
	@Autowired
	private LogMapper logmapper;
	
	/**
	 * 添加日志
	 */
	@Override
	public void addLog(LogEntity logEntity) {
		try {
			logmapper.insert(logEntity);
		} catch (Exception e) {
			throw new BaseException("添加日志出错",e);
		}
	}
	
	/**
	 * 分页查询所有日志
	 */
	@Override
	public List<LogEntity> findLogPage(LogEntity log, Page<LogEntity> page) {
		Example example = new Example(LogEntity.class);
		example.setOrderByClause("operation_time DESC");//排序
		
		Example.Criteria criteria = example.createCriteria();
		if(StringUtils.isNotEmpty(log.getOperator())){
			criteria.andLike("operator","%"+log.getOperator()+"%");
		}if(StringUtils.isNotEmpty(log.getLogLevel())){
			criteria.andEqualTo("logLevel",log.getLogLevel());
		}
		PageHelper.startPage(page.getNowPage(),page.getPageSize());
		List<LogEntity> result = null;
		try{
			result = logmapper.selectByCondition(example);
		}catch(Exception e){
			throw new BaseException("分页查询出错",e);
		}
		return result;
	}
}
