package com.mengma.mis.core.util;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.mengma.mis.self.sys.log.entity.LogEntity;
import com.mengma.mis.self.sys.user.entity.UserEntity;
import com.mengma.mis.self.sys.user.userVo.UserVo;

/**
 * 创建存入数据库的日志类
 * @author 黄青山
 *
 */
public class DBLog {
	/**
	 * @param request 网络请求
	 * @param logLevel 日志级别
	 * @param operation 操作内容说明
	 * @param operateObj 操作对象
	 * @param remark 备注 可以为空 -->""
	 * @return
	 */
	public static LogEntity createLog(HttpServletRequest request,String logLevel,
			String operation,String operateObj,String remark){
		LogEntity logEntity = new LogEntity();
		UserVo loginUser = null;
		if(request.getSession().getAttribute("loginUser")!=null){
			loginUser = (UserVo)request.getSession().getAttribute("loginUser");
		}else {
			loginUser = new UserVo();
			loginUser.setUserName("未登录用户");
		}
		String id = UuidUtil.getUuid36();
		Date date = new Date();
		long currentTime = date.getTime();
		logEntity.setId(id);
		logEntity.setLoginAccount(loginUser.getUserAccount());
		logEntity.setOperator(loginUser.getUserName());
		logEntity.setLogLevel(logLevel);
		logEntity.setOperateObj(operateObj);
		logEntity.setOperation(operation);
		logEntity.setIp(NetworkUtil.getUserIp(request));
		logEntity.setOperationTime(new Date(currentTime));
		logEntity.setRemark(remark);
		return logEntity;
	}
}
