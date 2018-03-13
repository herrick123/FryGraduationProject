package com.self.project.service.Impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.mapper.entity.Example;

import com.core.constant.GlobalCodeConstant;
import com.core.exception.BaseException;
import com.core.exception.ParamsException;
import com.core.exception.SaveException;
import com.core.util.MisUtil;
import com.core.util.Page;
import com.core.util.UuidUtil;
import com.github.pagehelper.PageHelper;
import com.self.project.dao.ProjectManageMapper;
import com.self.project.entity.ProjectManageEntity;
import com.self.project.service.ProjectManageSerivce;
import com.self.project.vo.projectManageVo;
import com.self.projectEmp.dao.ProjectEmployeeMapper;
import com.self.projectEmp.entity.ProjectEmployee;


/**
 * 项目管理列表
 * @author 王子珩
 *
 */
@Service("projectManageService")
public class ProjectManageServiceImpl implements ProjectManageSerivce {
	@Autowired
	private ProjectManageMapper projectManageMapper;
	@Autowired
	private ProjectEmployeeMapper projectEmployeeMapper;
	
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	/**
	 * 分页查询项目管理中项目信息列表
	 * @author 王子珩
	 *
	 */
	
	@Override
	public List<ProjectManageEntity> getProManageList(
		ProjectManageEntity proManage, Page<ProjectManageEntity> page) {
		Example example = new Example(ProjectManageEntity.class);
		example.setOrderByClause("start_time");
		Example.Criteria criteria = example.createCriteria();
		if(StringUtils.isNotEmpty(proManage.getProjectName())){
			criteria.andLike("projectName", "%"+proManage.getProjectName()+"%");
		}
		PageHelper.startPage(page.getNowPage(), page.getPageSize());
		List<ProjectManageEntity> result = null;
		try {
			result = projectManageMapper.selectByCondition(example);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new BaseException("分页查询分区列表出错",e);
		}
		return result;
	}
	
	/**
	 * 分页查询项目管理中增加学员列表
	 * @author 王子珩
	 *
	 */	
	@Override
	public List<projectManageVo> findProjectManageStudent( String[]skills,projectManageVo proManage,Page<projectManageVo> page){
		Map<String,Object> param = new HashMap<String,Object>();
		if(StringUtils.isNotEmpty(proManage.getEmployeeName())){
			param.put("employeeName", proManage.getEmployeeName());
		}
		
		if(StringUtils.isNotEmpty(proManage.getAbilityLevel())){
			param.put("abilityLevel", proManage.getAbilityLevel());
		}
		param.put("skills",skills);
		List<projectManageVo> result = null;
		try {
			PageHelper.startPage(page.getNowPage(), page.getPageSize());
			result = sqlSession.selectList("mengma.projectManage.search_employeeName_projectManageVo_info",param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new BaseException("查询信息失败!",e);
		}
		return result;
		
	}
	
	/**
	 * 增加新建项目详情信息
	 * @author 王子珩
	 *
	 */
	public Integer saveProjectManage(ProjectManageEntity proManage) {
		
		String id = UuidUtil.getUuid32();	
		proManage.setId(id);
/*		String strEmployeeId = proManage.getEmployeeId().substring(1);
		String projectId =proManage.getId();
		String[] employeeId = strEmployeeId.split(",");
		for(int i=0 ; i<employeeId.length;i++){
			
		}*/	
		int result =GlobalCodeConstant.BASE_ERROR_CODE;
		try {
			result = projectManageMapper.insert(proManage);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new SaveException("新增项目基本信息失败"+e);
		}
		// TODO Auto-generated method stub
		return result;
	}
	
	
	/**
	 * 根据id查询数据信息
	 * @param id
	 * @return
	 */

	public Integer findProjectManageByParams(Map<String,String> params,
		Map<String , String> notIn){
		Example example = new Example(ProjectManageEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
			
		}
		for (String key:notIn.keySet()) {
			criteria.andNotEqualTo(key, notIn.get(key));
		}
		
		return projectManageMapper.selectCountByCondition(example);
		
	}
	@Override
	public Integer findProjectManageEntityByParams(Map<String, String> params) {
		Example example = new Example(ProjectManageEntity.class);
		Example.Criteria criteria = example.createCriteria();
		for (String key:params.keySet()) {
			criteria.andEqualTo(key, params.get(key));
		}
		// TODO Auto-generated method stub
		return projectManageMapper.selectCountByCondition(example);
	}
	/**
	 * 删除一条分区数据
	 */
	@Override
	public Integer deleteProjectManage(String[] ids) {
		List<String> params = MisUtil.arrayTransList(ids);
		Example example = new Example(ProjectManageEntity.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andIn("id", params);
		// TODO Auto-generated method stub
		return projectManageMapper.deleteByCondition(example);
	}
	/**
	 * 编辑项目基本信息
	 * @return
	 */
	
	public Integer updateProjectManage(ProjectManageEntity upProjectManage) {
		int result = GlobalCodeConstant.UPDATE_ERROR_CODE;
		try {
			result = projectManageMapper.updateByPrimaryKeySelective(upProjectManage);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new SaveException("修改项目基本详情数据失败" + e);
		}
		// TODO Auto-generated method stub
		return result;
	}
	/**
	 * 根据项目id项目的技能标签
	 * @param id
	 * @return
	 */
	public String  findProjectManageSkill(String id){
		String result=null;
		
		try {
			result = sqlSession.selectOne("self.projectManage.search_projectManage_projectManageSkill",id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new BaseException("项目技能标签出错"+e);
		}
		
		return result;
		
	}
	/**
	 * 根据id查询项目基本信息
	 * @param id
	 * @return
	 */
	@Override
	public ProjectManageEntity findProjectEntityInfo(String id) {
		try {
			projectManageMapper.selectByPrimaryKey(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ParamsException("查询项目基本信息"+e);
		}
		// TODO Auto-generated method stub
		return projectManageMapper.selectByPrimaryKey(id);
	}


	/**
	 * 
	 * @author 王子珩
	 *
	 */	

	@Override
	public List<projectManageVo> getEmployeeName(String proId,projectManageVo proManageVo) {
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("project_id", proId);
		List<projectManageVo> result =null;
		
		try {
			result=sqlSession.selectList("mengma.projectManage.search_projectEmployeeManage_projectManageVo_info", param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return result;
	}
	/**
	 * 增加新建项目详情信息(新增学员ID到项目学员关系表)
	 * @author 王子珩
	 *
	 */
	@Override
	public Integer saveProjectEmployee(ProjectEmployee projectEmployee) {
		String id = UuidUtil.getUuid32();	
		projectEmployee.setId(id);
		int result =GlobalCodeConstant.BASE_ERROR_CODE;
		
		try {
			result = projectEmployeeMapper.insert(projectEmployee);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 更改项目详情信息(新增学员ID到项目学员关系表)
	 * @author 王子珩
	 *
	 */
	@Override
	public Integer updateProjectManage(ProjectEmployee projectEmployee) {
		int result = GlobalCodeConstant.UPDATE_ERROR_CODE;
		try {
			result = projectEmployeeMapper.updateByPrimaryKeySelective(projectEmployee);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return result;
	}




	
	


	

	

}
