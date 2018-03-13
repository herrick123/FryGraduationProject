package com.self.project.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.core.exception.BaseException;
import com.core.util.Page;
import com.self.project.dao.projectManagerMapper;
import com.self.project.service.ProjectManagerService;
import com.self.project.vo.projectManagerVo;

@Service("projectManagerService")
public class ProjectManagerServiceImpl implements ProjectManagerService {
	@Autowired
	projectManagerMapper projectManagerMapper;
	@Autowired
	private SqlSessionTemplate sqlSession;
	/**
	 * 分页项目经理首页
	 */
	@Override
	public List<projectManagerVo> findProjectManagerLeavePage(projectManagerVo pro,Page<projectManagerVo> page){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("projectName", pro.getProjectName());
		List<projectManagerVo> result = null;
		try {
			result = sqlSession.selectList("mengma.projectManage.search_projectName_projectManagerVo_info", param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new BaseException("查询信息失败!",e);
		}
		
		return result;
		
	}
}
