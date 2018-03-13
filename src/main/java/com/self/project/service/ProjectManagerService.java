package com.self.project.service;

import java.util.List;

import com.core.util.Page;
import com.self.project.vo.projectManagerVo;


public interface ProjectManagerService {


	List<projectManagerVo> findProjectManagerLeavePage(projectManagerVo pro,
			Page<projectManagerVo> page);


}
