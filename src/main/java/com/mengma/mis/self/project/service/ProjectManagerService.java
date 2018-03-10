package com.mengma.mis.self.project.service;

import java.util.List;

import com.mengma.mis.core.util.Page;
import com.mengma.mis.self.project.vo.projectManagerVo;


public interface ProjectManagerService {


	List<projectManagerVo> findProjectManagerLeavePage(projectManagerVo pro,
			Page<projectManagerVo> page);


}
