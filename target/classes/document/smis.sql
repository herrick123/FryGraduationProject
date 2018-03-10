/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : smis

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2017-10-12 11:07:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `name` varchar(150) DEFAULT NULL COMMENT '公司名称',
  `introduction` varchar(1000) DEFAULT NULL COMMENT '简介',
  `recruit_email` varchar(50) DEFAULT NULL COMMENT '招聘邮箱',
  `ioc` varchar(255) DEFAULT NULL COMMENT '公司logo地址',
  `remark` varchar(150) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of company
-- ----------------------------

-- ----------------------------
-- Table structure for curriculum
-- ----------------------------
DROP TABLE IF EXISTS `curriculum`;
CREATE TABLE `curriculum` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `course_name` varchar(150) DEFAULT NULL COMMENT '课程名称',
  `introduction` varchar(1000) DEFAULT NULL COMMENT '课程简介',
  `lecturer_id` varchar(40) DEFAULT NULL COMMENT '主讲人',
  `del_flag` varchar(2) DEFAULT '0' COMMENT '是否删除 0 未删除 1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of curriculum
-- ----------------------------

-- ----------------------------
-- Table structure for leave
-- ----------------------------
DROP TABLE IF EXISTS `leave`;
CREATE TABLE `leave` (
  `id` varchar(40) NOT NULL COMMENT 'id',
  `student_id` varchar(40) DEFAULT NULL COMMENT '学生id',
  `start_time` datetime(6) DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(6) DEFAULT NULL COMMENT '结束时间',
  `leave_long` decimal(10,1) DEFAULT NULL COMMENT '请假时长',
  `reason` varchar(1000) DEFAULT NULL COMMENT '请假原因',
  `checker` varchar(40) DEFAULT NULL COMMENT '审核人',
  `type` int(2) DEFAULT NULL COMMENT '类型',
  `status` varchar(2) DEFAULT NULL COMMENT '请假状态',
  `remark` varchar(150) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of leave
-- ----------------------------

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `id` varchar(40) DEFAULT NULL COMMENT '主键',
  `user_id` varchar(40) DEFAULT NULL COMMENT '用户id',
  `type` varchar(2) DEFAULT NULL COMMENT '用户类型',
  `login_time` datetime(6) DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `remark` varchar(150) DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of login_log
-- ----------------------------

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `code` varchar(10) NOT NULL COMMENT '专业编码',
  `name` varchar(100) DEFAULT NULL COMMENT '专业名称',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of major
-- ----------------------------

-- ----------------------------
-- Table structure for practical_training
-- ----------------------------
DROP TABLE IF EXISTS `practical_training`;
CREATE TABLE `practical_training` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `student_id` varchar(40) DEFAULT NULL COMMENT '学员id',
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目id',
  `process_id` varchar(40) DEFAULT NULL COMMENT '项目过程id',
  `job_content` varchar(1000) DEFAULT NULL COMMENT '工作内容',
  `evaluate` varchar(1000) DEFAULT NULL COMMENT '评价',
  `remark` varchar(150) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of practical_training
-- ----------------------------

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `project_name` varchar(150) DEFAULT NULL COMMENT '项目名称',
  `introduction` varchar(1000) DEFAULT NULL COMMENT '简介',
  `start_time` datetime(6) DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(6) DEFAULT NULL COMMENT '结束时间',
  `first_party` varchar(150) DEFAULT NULL COMMENT '甲方',
  `second_party` varchar(150) DEFAULT NULL COMMENT '乙方',
  `a_contact` varchar(150) DEFAULT NULL COMMENT '甲方负责人',
  `b_contact` varchar(150) DEFAULT NULL COMMENT '乙方负责人',
  `technology` varchar(150) DEFAULT NULL COMMENT '项目采用技术',
  `project_amount` decimal(10,0) DEFAULT '0' COMMENT '项目金额',
  `head` varchar(40) DEFAULT NULL COMMENT '项目负责人',
  `del_flag` varchar(2) DEFAULT '0' COMMENT '是否删除 0 未删除 1已删除',
  `remark` varchar(150) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of project
-- ----------------------------

-- ----------------------------
-- Table structure for project_process
-- ----------------------------
DROP TABLE IF EXISTS `project_process`;
CREATE TABLE `project_process` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `process_name` varchar(150) DEFAULT NULL COMMENT '过程名称',
  `introduce` varchar(1000) DEFAULT NULL COMMENT '过程介绍',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `students` varchar(1000) DEFAULT NULL COMMENT '参与学员',
  `head` varchar(40) DEFAULT NULL COMMENT '负责人',
  `produce` varchar(1000) DEFAULT NULL COMMENT '产出',
  `evaluate` varchar(1000) DEFAULT NULL COMMENT '评价',
  `remark` varchar(150) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of project_process
-- ----------------------------

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `name` varchar(150) DEFAULT NULL COMMENT '学校名称',
  `introduction` varchar(1000) DEFAULT NULL COMMENT '简介',
  `web_url` varchar(150) DEFAULT NULL COMMENT '官网地址',
  `badge` varchar(150) DEFAULT NULL COMMENT '校徽',
  `remark` varchar(150) DEFAULT NULL COMMENT '备注',
  `school_code` varchar(5) DEFAULT NULL COMMENT '高校编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES ('c01b38ea-0904-4f57-bab9-a3de17affc05', '北京大学', '北京大学创办于1898年，初名京师大学堂，是中国第一所国立综合性大学，也是当时中国最高教育行政机关。辛亥革命后，于1912年改为现名。', 'http://www.pku.edu.cn', null, null, '10001');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `student_id` varchar(20) DEFAULT NULL COMMENT '学员id',
  `student_name` varchar(150) DEFAULT NULL COMMENT '学员名称',
  `birthday` datetime(6) DEFAULT NULL COMMENT '生日',
  `gender` int(11) DEFAULT NULL COMMENT '性别',
  `picture` varchar(150) DEFAULT NULL COMMENT '照片',
  `school_id` varchar(40) DEFAULT NULL COMMENT '学校id',
  `department_id` varchar(40) DEFAULT NULL COMMENT '所在院系',
  `introduction` varchar(1000) DEFAULT NULL COMMENT '简介',
  `phone` varchar(12) DEFAULT NULL COMMENT '联系方式',
  `remark` varchar(150) DEFAULT NULL COMMENT '备注',
  `entrance_time` datetime(6) DEFAULT NULL COMMENT '入学时间',
  `del_flag` varchar(2) DEFAULT '0' COMMENT '是否删除 0 未删除 1已删除',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '1002', '宋金学', '2017-10-09 14:14:55.000000', '0', null, null, null, null, null, null, null, '0');

-- ----------------------------
-- Table structure for student_group
-- ----------------------------
DROP TABLE IF EXISTS `student_group`;
CREATE TABLE `student_group` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `leader` varchar(40) DEFAULT NULL COMMENT '组长',
  `students` varchar(500) DEFAULT NULL COMMENT '学员',
  `remark` varchar(150) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of student_group
-- ----------------------------

-- ----------------------------
-- Table structure for sys_applications
-- ----------------------------
DROP TABLE IF EXISTS `sys_applications`;
CREATE TABLE `sys_applications` (
  `app_id` varchar(36) NOT NULL,
  `app_name` varchar(150) DEFAULT NULL,
  `app_desc` varchar(255) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `app_state` int(2) DEFAULT NULL,
  `display_index` int(2) DEFAULT NULL,
  `app_context` varchar(255) DEFAULT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `modifier` varchar(36) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_applications
-- ----------------------------
INSERT INTO `sys_applications` VALUES ('6d5b29c0-2cf8-4365-85d9-6fb8ea0a1a53', '学员管理系统', '学员管理系统		', '2017-10-10 10:21:51.000000', '0', '1', '/index', '6d5b29c0-2cf8-4365-85d9-6fb8ea0a1a53', '3e494139-2c2b-43ac-8133-20c13cec107d', '2017-10-10 10:27:10.193000');

-- ----------------------------
-- Table structure for sys_modules
-- ----------------------------
DROP TABLE IF EXISTS `sys_modules`;
CREATE TABLE `sys_modules` (
  `module_id` varchar(36) NOT NULL COMMENT '主键',
  `module_name` varchar(50) DEFAULT NULL COMMENT '模块名称',
  `module_url` varchar(128) DEFAULT NULL,
  `module_state` varchar(3) DEFAULT NULL,
  `app_id` varchar(36) DEFAULT NULL,
  `display_index` int(1) DEFAULT NULL,
  `module_group` varchar(30) DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `creater` varchar(36) DEFAULT NULL,
  `modifier` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_modules
-- ----------------------------
INSERT INTO `sys_modules` VALUES ('ac28aab2-0cd0-441a-9997-3a0c1546063f', '学员管理', '/student/page', '0', '6d5b29c0-2cf8-4365-85d9-6fb8ea0a1a53', '2', '', '2017-10-10 10:52:36.759000', '2017-10-10 10:52:36.759000', 'ac28aab2-0cd0-441a-9997-3a0c1546063f', 'ac28aab2-0cd0-441a-9997-3a0c1546063f');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` varchar(36) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `role_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_modules_mapper
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_modules_mapper`;
CREATE TABLE `sys_role_modules_mapper` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `role_id` varchar(36) DEFAULT NULL COMMENT '角色id',
  `modules` varchar(36) DEFAULT NULL COMMENT '模块Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_modules_mapper
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` varchar(36) NOT NULL COMMENT '用户id',
  `user_account` varchar(30) DEFAULT NULL COMMENT '登录名',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名称',
  `user_pass` varchar(50) DEFAULT NULL COMMENT '用户密码',
  `user_status` int(3) DEFAULT NULL COMMENT '用户状态',
  `telphone` varchar(12) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `idno` varchar(20) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `gender` int(2) DEFAULT NULL COMMENT '性别',
  `head` int(2) DEFAULT NULL COMMENT '是否管理员',
  `createid` varchar(36) DEFAULT NULL COMMENT '创建者id',
  `updateid` varchar(36) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `department_id` varchar(36) DEFAULT NULL COMMENT '部门id',
  `role` varchar(36) DEFAULT NULL COMMENT '角色',
  `department_name` varchar(36) DEFAULT NULL COMMENT '单位名称',
  `department` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('65241756-3a98-4359-b4d8-dbfb96e298df', 'user', 'user001', 'e10adc3949ba59abbe56e057f20f883e', '0', '17600146292', '33@22.com', 'kj23', '0', '1', '1', '1', 'ceshi-id', '2017-10-09 18:20:24.000000', '2017-10-09 18:20:24.000000', '10010101', '909a175d-23e8-4927-925e-9dc8c18096ea', '开发1科  ', null);

-- ----------------------------
-- Table structure for training_record
-- ----------------------------
DROP TABLE IF EXISTS `training_record`;
CREATE TABLE `training_record` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `student_id` varchar(40) DEFAULT NULL COMMENT '学员id',
  `curriculum_id` varchar(40) DEFAULT NULL COMMENT '课程id',
  `training_time` datetime DEFAULT NULL COMMENT '培训时间',
  `achievement` varchar(1000) DEFAULT NULL COMMENT '学习成果',
  `evaluate` varchar(1000) DEFAULT NULL COMMENT '评价',
  `remark` varchar(150) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of training_record
-- ----------------------------
