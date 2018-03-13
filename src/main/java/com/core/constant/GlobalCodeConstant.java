package com.core.constant;

import java.nio.charset.Charset;

public class GlobalCodeConstant {

	public static final Integer BASE_ERROR_CODE = Integer.valueOf(10000);
	public static final String BASE_ERROR_CODE_NAME = "错误";

	public static final Integer LOGIN_ERROR_CODE = Integer.valueOf(11000);
	public static final String LOGIN_ERROR_CODE_NAME = "登录错误";

	public static final Integer SAVE_ERROR_CODE = Integer.valueOf(12001);
	public static final String SAVE_ERROR_CODE_NAME = "添加错误";

	public static final Integer UPDATE_ERROR_CODE = Integer.valueOf(12002);
	public static final String UPDATE_ERROR_CODE_NAME = "编辑错误";

	public static final Integer DELETE_ERROR_CODE = Integer.valueOf(12003);
	public static final String DELETE_ERROR_CODE_NAME = "删除错误";

	public static final Integer SEARCH_ERROR_CODE = Integer.valueOf(12004);
	public static final String SEARCH_ERROR_CODE_NAME = "查询错误";

	public static final Integer PARAMS_ERROR_CODE = Integer.valueOf(12005);
	public static final String PARAMS_ERROR_CODE_NAME = "参数错误";

	public static final Integer FILE_ERROR_CODE = Integer.valueOf(12006);
	public static final String FILE_ERROR_CODE_NAME = "文件错误";

	public static final Integer AUTH_ERROR_CODE = Integer.valueOf(13000);
	public static final String AUTH_ERROR_CODE_NAME = "权限错误";

	public static final Integer BASE_SUCCESS_CODE = Integer.valueOf(200);
	public static final String BASE_SUCCESS_CODE_NAME = "成功";
	
	/**
	 * 一级数据字典中的Code
	 */
	public static final String AbilityLevel_CODE = "001";// 能力级别的code
	public static final String Skills_CODE = "005";// 技能的code
	public static final String SchoolName_CODE = "006";// 学校的code
	public static final String Education_CODE = "007";// 学历的code
	public static final String Nation_CODE = "008";// 民族的code

	/**
	 * 全局编码UTF-8
	 */
	public static final Charset GLOBAL_CHARSET = Charset.forName("UTF-8");

	/**
	 * 定时任务时间类型
	 */
	public static final Integer EACH_MONTH_CODE = Integer.valueOf(1);
	public static final String EACH_MONTH_CODE_NAME = "每月几时几分几秒";

	public static final Integer EACH_WEEK_CODE = Integer.valueOf(2);
	public static final String EACH_WEEK_CODE_NAME = "每周几时几分几秒";

	public static final Integer EACH_DAY_CODE = Integer.valueOf(3);
	public static final String EACH_DAY_CODE_NAME = "每日几时几分几秒";

	public static final Integer EACH_HOUR_CODE = Integer.valueOf(4);
	public static final String EACH_HOUR_CODE_NAME = "每几时";

	public static final Integer EACH_MINUTE_CODE = Integer.valueOf(5);
	public static final String EACH_MINUTE_CODE_NAME = "每几分";

	public static final Integer EACH_SECOND_CODE = Integer.valueOf(6);
	public static final String EACH_SECOND_CODE_NAME = "每几秒";

	/**
	 * 组织机构的目录树的treeCode
	 */
	public static final String DEPARTMENT_TREE_CODE = "org_ma";
	//添加用户和重置密码时的默认密码
	public static final String DEFAULT_PASSWORD = "qdsodb2017";
	//删除时判断是不是管理员角色的code
	public static final String SYS_MANAGER_CODE = "sysAdmin";
	//添加修改时请输入的编号
	public static final Integer BASE_INPUT_CODE = Integer.valueOf(201);
	public static final String BASE_INPUT_CODE_NAME = "请输入";
	
	public static final String LOG_LEVE_DEBUG = "DEBUG";
	public static final String LOG_LEVE_INFO = "INFO";
	public static final String LOG_LEVE_WARN = "WARN";
	public static final String LOG_LEVE_ERROR = "ERROR";
	//登录用户信息
	public static final String LOGIN_USER = "loginUser";
	
	//猛码员工信息管理保存的文件根路经
	public static final String BASE_ROOT_PATH = "C:/files/";
	//上传文件的路径
	public static final String BASE_UPLOADFILE_PATH = BASE_ROOT_PATH + "upload/";
	//二维码的存放路径
	public static final String BASE_QRCODE_PATH = BASE_ROOT_PATH + "qrCode/";
	
	
}
