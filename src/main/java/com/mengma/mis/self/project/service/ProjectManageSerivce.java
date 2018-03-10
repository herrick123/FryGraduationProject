package com.mengma.mis.self.project.service;

import java.util.List;
import java.util.Map;

import com.mengma.mis.core.util.Page;
import com.mengma.mis.self.project.entity.ProjectManageEntity;
import com.mengma.mis.self.project.vo.projectManageVo;
import com.mengma.mis.self.projectEmp.entity.ProjectEmployee;

public interface ProjectManageSerivce {

	List<ProjectManageEntity> getProManageList(ProjectManageEntity    proManage,
			Page<ProjectManageEntity> page);
	Integer saveProjectManage(ProjectManageEntity proManage);
	
	Integer saveProjectEmployee(ProjectEmployee projectEmployee);

	Integer findProjectManageByParams(Map<String, String> params,
			Map<String, String> notIn);

	Integer findProjectManageEntityByParams(Map<String,String> params);
	
	Integer deleteProjectManage(String[] ids);
	Integer updateProjectManage(ProjectManageEntity upProjectManage);
	Integer updateProjectManage(ProjectEmployee projectEmployee);
	
	String findProjectManageSkill(String id);

	List<projectManageVo> findProjectManageStudent(String[]skills, projectManageVo proManage,
			Page<projectManageVo> page);
	ProjectManageEntity findProjectEntityInfo(String id);
	List<projectManageVo> getEmployeeName(String proId,projectManageVo proManageVo);

}
