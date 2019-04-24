/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : sams

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-04-24 11:40:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for class_relation
-- ----------------------------
DROP TABLE IF EXISTS `class_relation`;
CREATE TABLE `class_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `class_id` int(11) DEFAULT '0' COMMENT '班级id',
  `student_id` int(11) DEFAULT '0' COMMENT '学生id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='学生课程关联表';

-- ----------------------------
-- Records of class_relation
-- ----------------------------
INSERT INTO `class_relation` VALUES ('11', '1', '1');
INSERT INTO `class_relation` VALUES ('12', '1', '4');
INSERT INTO `class_relation` VALUES ('13', '1', '5');
INSERT INTO `class_relation` VALUES ('14', '1', '6');
INSERT INTO `class_relation` VALUES ('15', '1', '2');

-- ----------------------------
-- Table structure for class_schedule
-- ----------------------------
DROP TABLE IF EXISTS `class_schedule`;
CREATE TABLE `class_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程表id',
  `schedule_name` varchar(255) DEFAULT '' COMMENT '课程名表名称',
  `class_id` int(11) DEFAULT '0' COMMENT '关联班级id',
  `user_id` int(11) DEFAULT '0' COMMENT '学生id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='学生课程表';

-- ----------------------------
-- Records of class_schedule
-- ----------------------------
INSERT INTO `class_schedule` VALUES ('5', '2017计算机科学与技术的专业课表', '1', '0');
INSERT INTO `class_schedule` VALUES ('6', '好好干活韩国国会的专业课表', '2', '0');
INSERT INTO `class_schedule` VALUES ('9', '超级管理员的选修课表', '0', '1');
INSERT INTO `class_schedule` VALUES ('10', '超级管理员的选修课表', '0', '1');

-- ----------------------------
-- Table structure for job_execution_log
-- ----------------------------
DROP TABLE IF EXISTS `job_execution_log`;
CREATE TABLE `job_execution_log` (
  `id` varchar(40) NOT NULL,
  `job_name` varchar(100) NOT NULL,
  `task_id` varchar(255) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `sharding_item` int(11) NOT NULL,
  `execution_source` varchar(20) NOT NULL,
  `failure_cause` varchar(4000) DEFAULT NULL,
  `is_success` int(11) NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `complete_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='任务日志表';

-- ----------------------------
-- Records of job_execution_log
-- ----------------------------

-- ----------------------------
-- Table structure for job_status_trace_log
-- ----------------------------
DROP TABLE IF EXISTS `job_status_trace_log`;
CREATE TABLE `job_status_trace_log` (
  `id` varchar(40) NOT NULL,
  `job_name` varchar(100) NOT NULL,
  `original_task_id` varchar(255) NOT NULL,
  `task_id` varchar(255) NOT NULL,
  `slave_id` varchar(50) NOT NULL,
  `source` varchar(50) NOT NULL,
  `execution_type` varchar(20) NOT NULL,
  `sharding_item` varchar(100) NOT NULL,
  `state` varchar(20) NOT NULL,
  `message` varchar(4000) DEFAULT NULL,
  `creation_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='任务轨迹表';

-- ----------------------------
-- Records of job_status_trace_log
-- ----------------------------

-- ----------------------------
-- Table structure for sams_class_information
-- ----------------------------
DROP TABLE IF EXISTS `sams_class_information`;
CREATE TABLE `sams_class_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `grade` varchar(255) DEFAULT '' COMMENT '年级',
  `class_name` varchar(255) DEFAULT '' COMMENT '班级',
  `year_system` varchar(255) DEFAULT '' COMMENT '年制',
  `headmaster` varchar(255) DEFAULT '' COMMENT '班主任',
  `remarks` text COMMENT '备注',
  `profession` varchar(255) DEFAULT '' COMMENT '专业',
  `semester` varchar(255) DEFAULT '' COMMENT '学期',
  `title` varchar(255) DEFAULT '' COMMENT '所属学院',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='班级信息表';

-- ----------------------------
-- Records of sams_class_information
-- ----------------------------
INSERT INTO `sams_class_information` VALUES ('1', '', '2017计算机科学与技术', '四年', '嘟嘟嘟毒', '无', '计算机科学', '2017-2022', '紫金花校区', '0');
INSERT INTO `sams_class_information` VALUES ('2', '', '好好干活韩国国会', '三年', '很尴尬的哈哈', ' 韩国代', '改好d', '更换的', '更好的共和国', '0');

-- ----------------------------
-- Table structure for sams_course_elective
-- ----------------------------
DROP TABLE IF EXISTS `sams_course_elective`;
CREATE TABLE `sams_course_elective` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `course_name` varchar(255) DEFAULT '' COMMENT '课程名称',
  `course_teacher` varchar(255) DEFAULT '' COMMENT '课程老师',
  `duration` varchar(255) DEFAULT '0' COMMENT '教学时长',
  `number` int(11) DEFAULT '0' COMMENT '课程人数',
  `course_type` varchar(255) DEFAULT '' COMMENT '课程类型',
  `credits` varchar(255) DEFAULT '0' COMMENT '学分',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `subject_time` int(11) DEFAULT '0' COMMENT '上课时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='选修课程表';

-- ----------------------------
-- Records of sams_course_elective
-- ----------------------------
INSERT INTO `sams_course_elective` VALUES ('1', '计算机英语', '超级管理员', '24课时', '40', '公共/选修课', '2分', '0', '2');
INSERT INTO `sams_course_elective` VALUES ('2', '体育与健康', '超级管理员', '24', '35', '公共/选修课', '4分', '0', '2');

-- ----------------------------
-- Table structure for sams_course_major
-- ----------------------------
DROP TABLE IF EXISTS `sams_course_major`;
CREATE TABLE `sams_course_major` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专业课程id',
  `course_name` varchar(255) DEFAULT '' COMMENT '课程名称',
  `course_teacher` varchar(255) DEFAULT '' COMMENT '课程老师',
  `course_type` varchar(255) DEFAULT '' COMMENT '课程类型',
  `credits` varchar(255) DEFAULT '' COMMENT '学分',
  `class_id` int(11) DEFAULT '0' COMMENT '关联班级id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='专业课程';

-- ----------------------------
-- Records of sams_course_major
-- ----------------------------
INSERT INTO `sams_course_major` VALUES ('1', '语文', '超级管理员', '公共/必修课', '5分', '1');
INSERT INTO `sams_course_major` VALUES ('2', '数学', '超级管理员', '公共/必修课', '4分', '1');
INSERT INTO `sams_course_major` VALUES ('3', '物理', '超级管理员', '公共/必修课', '4分', '1');
INSERT INTO `sams_course_major` VALUES ('4', '生物', '超级管理员', '公共/必修课', '4分', '2');
INSERT INTO `sams_course_major` VALUES ('5', '心理', '超级管理员', '公共/必修课', '4分', '2');

-- ----------------------------
-- Table structure for sams_score
-- ----------------------------
DROP TABLE IF EXISTS `sams_score`;
CREATE TABLE `sams_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `course_id` int(11) DEFAULT '0' COMMENT '所属课程',
  `course_name` varchar(255) DEFAULT '' COMMENT '课程名称',
  `user_id` int(11) DEFAULT '0' COMMENT '所属学生',
  `exam_grade` varchar(255) DEFAULT '0.00' COMMENT '考试成绩',
  `part_grade` varchar(255) DEFAULT '0.00' COMMENT '平时成绩',
  `grade` varchar(255) DEFAULT '0.00' COMMENT '期评',
  `course_type` varchar(255) DEFAULT '' COMMENT '课程类型',
  `credits` varchar(255) DEFAULT '' COMMENT '学分',
  `course_teacher` varchar(255) DEFAULT '' COMMENT '教学老师',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='学生成绩管理表';

-- ----------------------------
-- Records of sams_score
-- ----------------------------
INSERT INTO `sams_score` VALUES ('20', '1', '计算机英语', '1', '66', '75', '66', '公共/选修课', '2分', '超级管理员');

-- ----------------------------
-- Table structure for sams_student_archives
-- ----------------------------
DROP TABLE IF EXISTS `sams_student_archives`;
CREATE TABLE `sams_student_archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `real_name` varchar(150) DEFAULT '' COMMENT '学生姓名',
  `nation` varchar(255) DEFAULT '' COMMENT '民族',
  `student_id` varchar(255) DEFAULT '' COMMENT '学号',
  `sex` varchar(150) DEFAULT '' COMMENT '性别',
  `birth_date` varchar(255) DEFAULT '' COMMENT '出生年月',
  `personal_information` text COMMENT '个人信息',
  `honor` text COMMENT '个人荣誉',
  `contact_address` varchar(255) DEFAULT '' COMMENT '联系地址',
  `enrollment` varchar(255) DEFAULT '' COMMENT '入学日期',
  `head_image` varchar(255) DEFAULT '' COMMENT '个人头像',
  `user_id` int(11) DEFAULT '0' COMMENT '关联用户id',
  `class_id` int(11) DEFAULT '0' COMMENT '所属班级',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='学生档案管理表';

-- ----------------------------
-- Records of sams_student_archives
-- ----------------------------
INSERT INTO `sams_student_archives` VALUES ('3', '超级管理员', '汉族', '341190001', '男', '2007-07-10', '法国发生过的', '规范化规定', '鬼画符恢复是v', '2016-04-15', 'files-7d8d4bd8246f49a88dddd24e98256694.JPG', '1', '1', '0');
INSERT INTO `sams_student_archives` VALUES ('7', '王五', '', '341190005', '', '', null, null, '', '', '', '4', '1', '0');
INSERT INTO `sams_student_archives` VALUES ('8', '张塞', '', '341190006', '', '', null, null, '', '', '', '5', '1', '0');
INSERT INTO `sams_student_archives` VALUES ('9', '阿荼', '汉族', '341190007', '女', '2018-09-30', '刚刚', '规范', '发广告', '2019-03-31', '', '6', '1', '0');
INSERT INTO `sams_student_archives` VALUES ('10', '李四', '汉', '341190003', '男', '2012-08-09', '无', '无', '浙江省舟山市', '2019-08-20', 'files-5ea0fa398dc44593980760fb336ceab5.JPG', '2', '1', '0');

-- ----------------------------
-- Table structure for sams_student_transcript
-- ----------------------------
DROP TABLE IF EXISTS `sams_student_transcript`;
CREATE TABLE `sams_student_transcript` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `student_id` int(11) DEFAULT '0' COMMENT '学号',
  `semester` varchar(255) DEFAULT '' COMMENT '学期',
  `type` varchar(255) DEFAULT '' COMMENT '类型（期中/期末）',
  `course_title` varchar(255) DEFAULT '' COMMENT '课程名称',
  `grade` varchar(5) DEFAULT '0.00' COMMENT '成绩',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sams_student_transcript
-- ----------------------------

-- ----------------------------
-- Table structure for student_selection
-- ----------------------------
DROP TABLE IF EXISTS `student_selection`;
CREATE TABLE `student_selection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '学生id',
  `course_id` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `class_id` int(11) NOT NULL DEFAULT '0' COMMENT '学生所属班级',
  `subject_time` int(11) NOT NULL DEFAULT '0' COMMENT '上课时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='学生选课关联表';

-- ----------------------------
-- Records of student_selection
-- ----------------------------
INSERT INTO `student_selection` VALUES ('1', '1', '1', '1', '0');

-- ----------------------------
-- Table structure for subject_schedule_relation
-- ----------------------------
DROP TABLE IF EXISTS `subject_schedule_relation`;
CREATE TABLE `subject_schedule_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `schedule_id` int(11) NOT NULL DEFAULT '0' COMMENT '课程表ID',
  `subject_id` int(11) NOT NULL DEFAULT '0' COMMENT '课程ID',
  `subject_time` int(11) NOT NULL DEFAULT '0' COMMENT '上课时间',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是专业课（0是专业课，1是选修课）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1582 DEFAULT CHARSET=utf8mb4 COMMENT='课程与课程表关联表';

-- ----------------------------
-- Records of subject_schedule_relation
-- ----------------------------
INSERT INTO `subject_schedule_relation` VALUES ('38', '0', '0', '2', '0');
INSERT INTO `subject_schedule_relation` VALUES ('39', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('40', '0', '1', '8', '0');
INSERT INTO `subject_schedule_relation` VALUES ('41', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('42', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('43', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('44', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('45', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('46', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('47', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('48', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('49', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('50', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('51', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('52', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('53', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('54', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('55', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('56', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('57', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('58', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('59', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('60', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('61', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('62', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('63', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('64', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('65', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('66', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('67', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('68', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('69', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('70', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('71', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('72', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('73', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('74', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('75', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('76', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('77', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('78', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('79', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('80', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('81', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('82', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('83', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('84', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('85', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('86', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('87', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('88', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('89', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('90', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('91', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('92', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('93', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('94', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('95', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('96', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('97', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('98', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('99', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('100', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('101', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('102', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('103', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('104', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('105', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('106', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('107', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('108', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('109', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('110', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('111', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('112', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('113', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('114', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('115', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('116', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('117', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('118', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('119', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('120', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('121', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('122', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('123', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('124', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('125', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('126', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('127', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('128', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('129', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('130', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('131', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('132', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('133', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('134', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('135', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('136', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('137', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('138', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('139', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('140', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('141', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('142', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('143', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('144', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('145', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('146', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('147', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('148', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('149', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('150', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('151', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('152', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('153', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('154', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('155', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('156', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('157', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('158', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('159', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('160', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('161', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('162', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('163', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('164', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('165', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('166', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('167', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('168', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('169', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('170', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('171', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('172', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('173', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('174', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('175', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('176', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('177', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('178', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('179', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('180', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('181', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('182', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('183', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('184', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('185', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('186', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('187', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('188', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('189', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('190', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('191', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('192', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('193', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('194', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('195', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('196', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('197', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('198', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('199', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('200', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('201', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('202', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('203', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('204', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('205', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('206', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('207', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('208', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('209', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('210', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('211', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('212', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('213', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('214', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('215', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('216', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('217', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('218', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('219', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('220', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('221', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('222', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('223', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('224', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('225', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('226', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('227', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('228', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('229', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('230', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('231', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('232', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('233', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('234', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('235', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('236', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('237', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('238', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('239', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('240', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('241', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('242', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('243', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('244', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('245', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('246', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('247', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('248', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('249', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('250', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('251', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('252', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('253', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('254', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('255', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('256', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('257', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('258', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('259', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('260', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('261', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('262', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('263', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('264', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('265', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('266', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('267', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('268', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('269', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('270', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('271', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('272', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('273', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('274', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('275', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('276', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('277', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('278', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('279', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('280', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('281', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('282', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('283', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('284', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('285', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('286', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('287', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('288', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('289', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('290', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('291', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('292', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('293', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('294', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('295', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('296', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('297', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('298', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('299', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('300', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('301', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('302', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('303', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('304', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('305', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('306', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('307', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('308', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('309', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('310', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('311', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('312', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('313', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('314', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('315', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('316', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('317', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('318', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('319', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('320', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('321', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('322', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('323', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('324', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('325', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('326', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('327', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('328', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('329', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('330', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('331', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('332', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('333', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('334', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('335', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('336', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('337', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('338', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('339', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('340', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('341', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('342', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('343', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('344', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('345', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('346', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('347', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('348', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('349', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('350', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('351', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('352', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('353', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('354', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('355', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('356', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('357', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('358', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('359', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('360', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('361', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('362', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('363', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('364', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('365', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('366', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('367', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('368', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('369', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('370', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('371', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('372', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('373', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('374', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('375', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('376', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('377', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('378', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('379', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('380', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('381', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('382', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('383', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('384', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('385', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('386', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('387', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('388', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('389', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('390', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('391', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('392', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('393', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('394', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('395', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('396', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('397', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('398', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('399', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('400', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('401', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('402', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('403', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('404', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('405', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('406', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('407', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('408', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('409', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('410', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('411', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('412', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('413', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('414', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('415', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('416', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('417', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('418', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('419', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('420', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('421', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('422', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('423', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('424', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('425', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('426', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('427', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('428', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('429', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('430', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('431', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('432', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('433', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('434', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('435', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('436', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('437', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('438', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('439', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('440', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('441', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('442', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('443', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('444', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('445', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('446', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('447', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('448', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('449', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('450', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('451', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('452', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('453', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('454', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('455', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('456', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('457', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('458', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('459', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('460', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('461', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('462', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('463', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('464', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('465', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('466', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('467', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('468', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('469', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('470', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('471', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('472', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('473', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('474', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('475', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('476', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('477', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('478', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('479', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('480', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('481', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('482', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('483', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('484', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('485', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('486', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('487', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('488', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('489', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('490', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('491', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('492', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('493', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('494', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('495', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('496', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('497', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('498', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('499', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('500', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('501', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('502', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('503', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('504', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('505', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('506', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('507', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('508', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('509', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('510', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('511', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('512', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('513', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('514', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('515', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('516', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('517', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('518', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('519', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('520', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('521', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('522', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('523', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('524', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('525', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('526', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('527', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('528', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('529', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('530', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('531', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('532', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('533', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('534', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('535', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('536', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('537', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('538', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('539', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('540', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('541', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('542', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('543', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('544', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('545', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('546', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('547', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('548', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('549', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('550', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('551', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('552', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('553', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('554', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('555', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('556', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('557', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('558', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('559', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('560', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('561', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('562', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('563', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('564', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('565', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('566', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('567', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('568', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('569', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('570', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('571', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('572', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('573', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('574', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('575', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('576', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('577', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('578', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('579', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('580', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('581', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('582', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('583', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('584', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('585', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('586', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('587', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('588', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('589', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('590', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('591', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('592', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('593', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('594', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('595', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('596', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('597', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('598', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('599', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('600', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('601', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('602', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('603', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('604', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('605', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('606', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('607', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('608', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('609', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('610', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('611', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('612', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('613', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('614', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('615', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('616', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('617', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('618', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('619', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('620', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('621', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('622', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('623', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('624', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('625', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('626', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('627', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('628', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('629', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('630', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('631', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('632', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('633', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('634', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('635', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('636', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('637', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('638', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('639', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('640', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('641', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('642', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('643', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('644', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('645', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('646', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('647', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('648', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('649', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('650', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('651', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('652', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('653', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('654', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('655', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('656', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('657', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('658', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('659', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('660', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('661', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('662', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('663', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('664', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('665', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('666', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('667', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('668', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('669', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('670', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('671', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('672', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('673', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('674', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('675', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('676', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('677', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('678', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('679', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('680', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('681', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('682', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('683', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('684', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('685', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('686', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('687', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('688', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('689', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('690', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('691', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('692', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('693', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('694', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('695', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('696', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('697', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('698', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('699', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('700', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('701', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('702', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('703', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('704', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('705', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('706', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('707', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('708', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('709', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('710', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('711', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('712', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('713', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('714', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('715', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('716', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('717', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('718', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('719', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('720', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('721', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('722', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('723', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('724', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('725', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('726', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('727', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('728', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('729', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('730', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('731', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('732', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('733', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('734', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('735', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('736', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('737', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('738', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('739', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('740', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('741', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('742', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('743', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('744', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('745', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('746', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('747', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('748', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('749', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('750', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('751', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('752', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('753', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('754', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('755', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('756', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('757', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('758', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('759', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('760', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('761', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('762', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('763', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('764', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('765', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('766', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('767', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('768', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('769', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('770', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('771', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('772', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('773', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('774', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('775', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('776', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('777', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('778', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('779', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('780', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('781', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('782', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('783', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('784', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('785', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('786', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('787', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('788', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('789', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('790', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('791', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('792', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('793', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('794', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('795', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('796', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('797', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('798', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('799', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('800', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('801', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('802', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('803', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('804', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('805', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('806', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('807', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('808', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('809', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('810', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('811', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('812', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('813', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('814', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('815', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('816', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('817', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('818', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('819', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('820', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('821', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('822', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('823', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('824', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('825', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('826', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('827', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('828', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('829', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('830', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('831', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('832', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('833', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('834', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('835', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('836', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('837', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('838', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('839', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('840', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('841', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('842', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('843', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('844', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('845', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('846', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('847', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('848', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('849', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('850', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('851', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('852', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('853', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('854', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('855', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('856', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('857', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('858', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('859', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('860', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('861', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('862', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('863', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('864', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('865', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('866', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('867', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('868', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('869', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('870', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('871', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('872', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('873', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('874', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('875', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('876', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('877', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('878', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('879', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('880', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('881', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('882', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('883', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('884', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('885', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('886', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('887', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('888', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('889', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('890', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('891', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('892', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('893', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('894', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('895', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('896', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('897', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('898', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('899', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('900', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('901', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('902', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('903', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('904', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('905', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('906', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('907', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('908', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('909', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('910', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('911', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('912', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('913', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('914', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('915', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('916', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('917', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('918', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('919', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('920', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('921', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('922', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('923', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('924', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('925', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('926', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('927', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('928', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('929', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('930', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('931', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('932', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('933', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('934', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('935', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('936', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('937', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('938', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('939', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('940', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('941', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('942', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('943', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('944', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('945', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('946', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('947', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('948', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('949', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('950', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('951', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('952', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('953', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('954', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('955', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('956', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('957', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('958', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('959', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('960', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('961', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('962', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('963', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('964', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('965', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('966', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('967', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('968', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('969', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('970', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('971', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('972', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('973', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('974', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('975', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('976', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('977', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('978', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('979', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('980', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('981', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('982', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('983', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('984', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('985', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('986', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('987', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('988', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('989', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('990', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('991', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('992', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('993', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('994', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('995', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('996', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('997', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('998', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('999', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1000', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1001', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1002', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1003', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1004', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1005', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1006', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1007', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1008', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1009', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1010', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1011', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1012', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1013', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1014', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1015', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1016', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1017', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1018', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1019', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1020', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1021', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1022', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1023', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1024', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1025', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1026', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1027', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1028', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1029', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1030', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1031', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1032', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1033', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1034', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1035', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1036', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1037', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1038', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1039', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1040', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1041', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1042', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1043', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1044', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1045', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1046', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1047', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1048', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1049', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1050', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1051', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1052', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1053', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1054', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1055', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1056', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1057', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1058', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1059', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1060', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1061', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1062', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1063', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1064', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1065', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1066', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1067', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1068', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1069', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1070', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1071', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1072', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1073', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1074', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1075', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1076', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1077', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1078', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1079', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1080', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1081', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1082', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1083', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1084', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1085', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1086', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1087', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1088', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1089', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1090', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1091', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1092', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1093', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1094', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1095', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1096', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1097', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1098', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1099', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1100', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1101', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1102', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1103', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1104', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1105', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1106', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1107', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1108', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1109', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1110', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1111', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1112', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1113', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1114', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1115', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1116', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1117', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1118', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1119', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1120', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1121', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1122', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1123', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1124', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1125', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1126', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1127', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1128', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1129', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1130', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1131', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1132', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1133', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1134', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1135', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1136', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1137', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1138', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1139', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1140', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1141', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1142', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1143', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1144', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1145', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1146', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1147', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1148', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1149', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1150', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1151', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1152', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1153', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1154', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1155', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1156', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1157', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1158', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1159', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1160', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1161', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1162', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1163', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1164', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1165', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1166', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1167', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1168', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1169', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1170', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1171', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1172', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1173', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1174', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1175', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1176', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1177', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1178', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1179', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1180', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1181', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1182', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1183', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1184', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1185', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1186', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1187', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1188', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1189', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1190', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1191', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1192', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1193', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1194', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1195', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1196', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1197', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1198', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1199', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1200', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1201', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1202', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1203', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1204', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1205', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1206', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1207', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1208', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1209', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1210', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1211', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1212', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1213', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1214', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1215', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1216', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1217', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1218', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1219', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1220', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1221', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1222', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1223', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1224', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1225', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1226', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1227', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1228', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1229', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1230', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1231', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1232', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1233', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1234', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1235', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1236', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1237', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1238', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1239', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1240', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1241', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1242', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1243', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1244', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1245', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1246', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1247', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1248', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1249', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1250', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1251', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1252', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1253', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1254', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1255', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1256', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1257', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1258', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1259', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1260', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1261', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1262', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1263', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1264', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1265', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1266', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1267', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1268', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1269', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1270', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1271', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1272', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1273', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1274', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1275', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1276', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1277', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1278', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1279', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1280', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1281', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1282', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1283', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1284', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1285', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1286', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1287', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1288', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1289', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1290', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1291', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1292', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1293', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1294', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1295', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1296', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1297', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1298', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1299', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1300', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1301', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1302', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1303', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1304', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1305', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1306', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1307', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1308', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1309', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1310', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1311', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1312', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1313', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1314', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1315', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1316', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1317', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1318', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1319', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1320', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1321', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1322', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1323', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1324', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1325', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1326', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1327', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1328', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1329', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1330', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1331', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1332', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1333', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1334', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1335', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1336', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1337', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1338', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1339', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1340', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1341', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1342', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1343', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1344', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1345', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1346', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1347', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1348', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1349', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1350', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1351', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1352', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1353', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1354', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1355', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1356', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1357', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1358', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1359', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1360', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1361', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1362', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1363', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1364', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1365', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1366', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1367', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1368', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1369', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1370', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1371', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1372', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1373', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1374', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1375', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1376', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1377', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1378', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1379', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1380', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1381', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1382', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1383', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1384', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1385', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1386', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1387', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1388', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1389', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1390', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1391', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1392', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1393', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1394', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1395', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1396', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1397', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1398', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1399', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1400', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1401', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1402', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1403', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1404', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1405', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1406', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1407', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1408', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1409', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1410', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1411', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1412', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1413', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1414', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1415', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1416', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1417', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1418', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1419', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1420', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1421', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1422', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1423', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1424', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1425', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1426', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1427', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1428', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1429', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1430', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1431', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1432', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1433', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1434', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1435', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1436', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1437', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1438', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1439', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1440', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1441', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1442', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1443', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1444', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1445', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1446', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1447', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1448', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1449', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1450', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1451', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1452', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1453', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1454', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1455', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1456', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1457', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1458', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1459', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1460', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1461', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1462', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1463', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1464', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1465', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1466', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1467', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1468', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1469', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1470', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1471', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1472', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1473', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1474', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1475', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1476', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1477', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1478', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1479', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1480', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1481', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1482', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1483', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1484', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1485', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1486', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1487', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1488', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1489', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1490', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1491', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1492', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1493', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1494', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1495', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1496', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1497', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1498', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1499', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1500', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1501', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1502', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1503', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1504', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1505', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1506', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1507', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1508', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1509', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1510', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1511', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1512', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1513', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1514', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1515', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1516', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1517', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1518', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1519', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1520', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1521', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1522', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1523', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1524', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1525', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1526', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1527', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1528', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1529', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1530', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1531', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1532', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1533', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1534', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1535', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1536', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1537', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1538', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1539', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1540', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1541', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1542', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1543', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1544', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1545', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1546', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1547', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1548', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1549', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1550', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1551', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1552', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1553', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1554', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1555', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1556', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1557', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1558', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1559', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1560', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1561', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1562', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1563', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1564', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1565', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1566', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1567', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1568', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1569', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1570', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1571', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1572', '5', '1', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1573', '5', '1', '11', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1574', '5', '1', '13', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1575', '5', '1', '14', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1576', '5', '1', '17', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1577', '5', '3', '10', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1578', '5', '3', '12', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1579', '5', '1', '3', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1580', '5', '3', '7', '0');
INSERT INTO `subject_schedule_relation` VALUES ('1581', '5', '2', '17', '0');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  `parent_id` int(11) DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '山东农信', null, '2018-01-22 19:00:23', '2018-09-13 01:46:29', '0', '0', '1');
INSERT INTO `sys_dept` VALUES ('2', '沙县国际', null, '2018-01-22 19:00:38', '2018-09-13 01:46:30', '0', '0', '1');
INSERT INTO `sys_dept` VALUES ('3', '潍坊农信', null, '2018-01-22 19:00:44', '2018-09-13 01:46:31', '0', '1', '1');
INSERT INTO `sys_dept` VALUES ('4', '高新农信', null, '2018-01-22 19:00:52', '2018-10-06 10:41:52', '0', '3', '1');
INSERT INTO `sys_dept` VALUES ('5', '院校农信', null, '2018-01-22 19:00:57', '2018-10-06 10:42:51', '0', '4', '1');
INSERT INTO `sys_dept` VALUES ('6', '潍院农信', null, '2018-01-22 19:01:06', '2019-01-09 10:58:18', '1', '5', '1');
INSERT INTO `sys_dept` VALUES ('7', '山东沙县', null, '2018-01-22 19:01:57', '2018-09-13 01:46:42', '0', '2', '1');
INSERT INTO `sys_dept` VALUES ('8', '潍坊沙县', null, '2018-01-22 19:02:03', '2018-09-13 01:46:43', '0', '7', '1');
INSERT INTO `sys_dept` VALUES ('9', '高新沙县', null, '2018-01-22 19:02:14', '2018-09-13 01:46:44', '1', '8', '1');
INSERT INTO `sys_dept` VALUES ('10', '租户2', null, '2018-11-18 13:27:11', '2018-11-18 13:42:19', '0', '0', '2');
INSERT INTO `sys_dept` VALUES ('11', '院校沙县', null, '2018-12-10 21:19:26', null, '0', '8', '1');

-- ----------------------------
-- Table structure for sys_dept_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_relation`;
CREATE TABLE `sys_dept_relation` (
  `ancestor` int(11) NOT NULL COMMENT '祖先节点',
  `descendant` int(11) NOT NULL COMMENT '后代节点',
  PRIMARY KEY (`ancestor`,`descendant`) USING BTREE,
  KEY `idx1` (`ancestor`) USING BTREE,
  KEY `idx2` (`descendant`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='部门关系表';

-- ----------------------------
-- Records of sys_dept_relation
-- ----------------------------
INSERT INTO `sys_dept_relation` VALUES ('1', '1');
INSERT INTO `sys_dept_relation` VALUES ('1', '3');
INSERT INTO `sys_dept_relation` VALUES ('1', '4');
INSERT INTO `sys_dept_relation` VALUES ('1', '5');
INSERT INTO `sys_dept_relation` VALUES ('2', '2');
INSERT INTO `sys_dept_relation` VALUES ('2', '7');
INSERT INTO `sys_dept_relation` VALUES ('2', '8');
INSERT INTO `sys_dept_relation` VALUES ('2', '11');
INSERT INTO `sys_dept_relation` VALUES ('3', '3');
INSERT INTO `sys_dept_relation` VALUES ('3', '4');
INSERT INTO `sys_dept_relation` VALUES ('3', '5');
INSERT INTO `sys_dept_relation` VALUES ('4', '4');
INSERT INTO `sys_dept_relation` VALUES ('4', '5');
INSERT INTO `sys_dept_relation` VALUES ('5', '5');
INSERT INTO `sys_dept_relation` VALUES ('7', '7');
INSERT INTO `sys_dept_relation` VALUES ('7', '8');
INSERT INTO `sys_dept_relation` VALUES ('7', '11');
INSERT INTO `sys_dept_relation` VALUES ('8', '8');
INSERT INTO `sys_dept_relation` VALUES ('8', '11');
INSERT INTO `sys_dept_relation` VALUES ('10', '10');
INSERT INTO `sys_dept_relation` VALUES ('11', '11');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `number` varchar(100) NOT NULL DEFAULT '' COMMENT '字典编码',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '字典名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `system` varchar(100) NOT NULL DEFAULT '' COMMENT '所属系统',
  `del_flag` char(1) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0' COMMENT '刪除标记（0正常，1删除）',
  `tenant_id` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', 'log_type', '日志异常', '2018-07-09 06:16:14', '2018-07-09 06:16:14', 'GDS', '0', '1');

-- ----------------------------
-- Table structure for sys_dict_value
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_value`;
CREATE TABLE `sys_dict_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dict_key` varchar(100) NOT NULL DEFAULT '' COMMENT '字典键',
  `dict_value` varchar(100) NOT NULL DEFAULT '' COMMENT '字典值',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `dict_id` bigint(20) NOT NULL COMMENT '所属字典id',
  `parent_id` bigint(20) NOT NULL COMMENT '父类id',
  `sort` int(8) NOT NULL COMMENT '排序',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '刪除标记（0正常，1删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='字段值域表';

-- ----------------------------
-- Records of sys_dict_value
-- ----------------------------
INSERT INTO `sys_dict_value` VALUES ('1', '1', '正常', '2018-07-09 06:16:14', '2018-07-09 06:16:14', '1', '0', '1', '1');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `time` mediumtext COMMENT '执行时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `exception` text COMMENT '异常信息',
  `tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_log_create_by` (`create_by`) USING BTREE,
  KEY `sys_log_request_uri` (`request_uri`) USING BTREE,
  KEY `sys_log_type` (`type`) USING BTREE,
  KEY `sys_log_create_date` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '0', '新增字典', 'test', 'admin', '2019-02-13 15:50:19', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '/dict', 'POST', '', '17', '0', null, '1');
INSERT INTO `sys_log` VALUES ('2', '0', '新增子字典', 'test', 'admin', '2019-02-13 15:51:53', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '/sysdictvalue', 'POST', '', '14', '0', null, '1');
INSERT INTO `sys_log` VALUES ('3', '0', '新增子字典', 'test', 'admin', '2019-02-13 15:52:04', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '/sysdictvalue', 'POST', '', '8', '0', null, '1');
INSERT INTO `sys_log` VALUES ('4', '0', '新增子字典', 'test', 'admin', '2019-02-13 15:53:06', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '/sysdictvalue', 'POST', '', '10', '0', null, '1');
INSERT INTO `sys_log` VALUES ('5', '0', '修改字典', 'gds', 'admin', '2019-02-14 09:18:28', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict', 'PUT', '', '22', '0', null, '1');
INSERT INTO `sys_log` VALUES ('6', '0', '新增字典', 'gds', 'admin', '2019-02-14 09:29:32', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict', 'POST', '', '9', '0', null, '1');
INSERT INTO `sys_log` VALUES ('7', '0', '删除字典', 'gds', 'admin', '2019-02-14 09:34:54', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/2', 'DELETE', '', '12', '0', null, '1');
INSERT INTO `sys_log` VALUES ('8', '0', '新增字典', 'gds', 'admin', '2019-02-14 09:35:02', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict', 'POST', '', '10', '0', null, '1');
INSERT INTO `sys_log` VALUES ('9', '0', '删除字典', 'gds', 'admin', '2019-02-14 09:36:28', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/3', 'DELETE', '', '13', '0', null, '1');
INSERT INTO `sys_log` VALUES ('10', '0', '新增字典', 'gds', 'admin', '2019-02-14 09:36:32', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict', 'POST', '', '10', '0', null, '1');
INSERT INTO `sys_log` VALUES ('11', '0', '修改字典', 'gds', 'admin', '2019-02-14 09:36:40', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict', 'PUT', '', '5', '0', null, '1');
INSERT INTO `sys_log` VALUES ('12', '0', '删除字典', 'gds', 'admin', '2019-02-14 09:48:45', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/1', 'DELETE', '', '8', '0', null, '1');
INSERT INTO `sys_log` VALUES ('13', '0', '删除字典', 'gds', 'admin', '2019-02-14 10:32:02', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/1', 'DELETE', '', '47', '0', null, '1');
INSERT INTO `sys_log` VALUES ('14', '0', '新增字典', 'gds', 'admin', '2019-02-14 10:32:34', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict', 'POST', '', '9', '0', null, '1');
INSERT INTO `sys_log` VALUES ('15', '0', '新增子字典', 'gds', 'admin', '2019-02-14 10:40:19', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/create', 'POST', '', '6', '0', null, '1');
INSERT INTO `sys_log` VALUES ('16', '0', '新增子字典', 'gds', 'admin', '2019-02-14 10:42:45', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/create', 'POST', '', '5', '0', null, '1');
INSERT INTO `sys_log` VALUES ('17', '0', '修改子字典', 'gds', 'admin', '2019-02-14 10:42:58', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/update', 'POST', '', '9', '0', null, '1');
INSERT INTO `sys_log` VALUES ('18', '0', '删除子字典', 'gds', 'admin', '2019-02-14 10:43:04', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/delete/5', 'POST', '', '26', '0', null, '1');
INSERT INTO `sys_log` VALUES ('19', '0', '新增字典', 'gds', 'admin', '2019-02-14 10:49:22', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict', 'POST', '', '12', '0', null, '1');
INSERT INTO `sys_log` VALUES ('20', '0', '新增子字典', 'gds', 'admin', '2019-02-14 10:49:37', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/create', 'POST', '', '6', '0', null, '1');
INSERT INTO `sys_log` VALUES ('21', '0', '新增子字典', 'gds', 'admin', '2019-02-14 10:49:43', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/create', 'POST', '', '5', '0', null, '1');
INSERT INTO `sys_log` VALUES ('22', '0', '新增子字典', 'gds', 'admin', '2019-02-14 10:49:48', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/create', 'POST', '', '5', '0', null, '1');
INSERT INTO `sys_log` VALUES ('23', '0', '新增子字典', 'gds', 'admin', '2019-02-14 10:50:37', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/create', 'POST', '', '5', '0', null, '1');
INSERT INTO `sys_log` VALUES ('24', '0', '新增子字典', 'gds', 'admin', '2019-02-14 10:50:42', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/create', 'POST', '', '5', '0', null, '1');
INSERT INTO `sys_log` VALUES ('25', '0', '新增子字典', 'gds', 'admin', '2019-02-14 10:51:14', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/create', 'POST', '', '5', '0', null, '1');
INSERT INTO `sys_log` VALUES ('26', '0', '删除字典', 'gds', 'admin', '2019-02-14 10:55:37', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/6', 'DELETE', '', '47', '0', null, '1');
INSERT INTO `sys_log` VALUES ('27', '0', '修改字典', 'gds', 'admin', '2019-02-14 11:19:28', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict', 'PUT', '', '15', '0', null, '1');
INSERT INTO `sys_log` VALUES ('28', '0', '修改子字典', 'gds', 'admin', '2019-02-14 11:25:56', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/update', 'POST', '', '6', '0', null, '1');
INSERT INTO `sys_log` VALUES ('29', '0', '修改子字典', 'gds', 'admin', '2019-02-14 11:26:00', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/update', 'POST', '', '4', '0', null, '1');
INSERT INTO `sys_log` VALUES ('30', '0', '修改子字典', 'gds', 'admin', '2019-02-14 11:26:06', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/update', 'POST', '', '5', '0', null, '1');
INSERT INTO `sys_log` VALUES ('31', '0', '修改子字典', 'gds', 'admin', '2019-02-14 11:26:15', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/update', 'POST', '', '5', '0', null, '1');
INSERT INTO `sys_log` VALUES ('32', '0', '删除子字典', 'gds', 'admin', '2019-02-14 11:26:21', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/delete/8', 'POST', '', '7', '0', null, '1');
INSERT INTO `sys_log` VALUES ('33', '0', '删除子字典', 'gds', 'admin', '2019-02-14 11:26:23', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/delete/7', 'POST', '', '7', '0', null, '1');
INSERT INTO `sys_log` VALUES ('34', '0', '新增子字典', 'gds', 'admin', '2019-02-14 11:29:18', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/create', 'POST', '', '4', '0', null, '1');
INSERT INTO `sys_log` VALUES ('35', '0', '新增子字典', 'gds', 'admin', '2019-02-14 11:30:16', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/create', 'POST', '', '4', '0', null, '1');
INSERT INTO `sys_log` VALUES ('36', '0', '修改子字典', 'gds', 'admin', '2019-02-14 11:30:25', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/update', 'POST', '', '4', '0', null, '1');
INSERT INTO `sys_log` VALUES ('37', '0', '删除子字典', 'gds', 'admin', '2019-02-14 11:31:33', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/delete/6', 'POST', '', '7', '0', null, '1');
INSERT INTO `sys_log` VALUES ('38', '0', '新增子字典', 'gds', 'admin', '2019-02-14 11:36:54', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/create', 'POST', '', '15', '0', null, '1');
INSERT INTO `sys_log` VALUES ('39', '0', '新增字典', 'gds', 'admin', '2019-02-14 11:37:01', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict', 'POST', '', '9', '0', null, '1');
INSERT INTO `sys_log` VALUES ('40', '0', '删除子字典', 'gds', 'admin', '2019-02-14 11:37:22', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/delete/6', 'POST', '', '12', '0', null, '1');
INSERT INTO `sys_log` VALUES ('41', '0', '删除子字典', 'gds', 'admin', '2019-02-14 11:37:23', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/delete/14', 'POST', '', '9', '0', null, '1');
INSERT INTO `sys_log` VALUES ('42', '0', '新增子字典', 'gds', 'admin', '2019-02-14 11:37:37', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/create', 'POST', '', '4', '0', null, '1');
INSERT INTO `sys_log` VALUES ('43', '0', '修改字典', 'gds', 'admin', '2019-02-14 11:37:46', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict', 'PUT', '', '6', '0', null, '1');
INSERT INTO `sys_log` VALUES ('44', '0', '新增字典', 'gds', 'admin', '2019-02-14 11:37:47', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict', 'POST', '', '5', '0', null, '1');
INSERT INTO `sys_log` VALUES ('45', '0', '新增子字典', 'gds', 'admin', '2019-02-14 11:39:17', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/create', 'POST', '', '5', '0', null, '1');
INSERT INTO `sys_log` VALUES ('46', '0', '新增子字典', 'gds', 'admin', '2019-02-14 11:39:26', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/create', 'POST', '', '6', '0', null, '1');
INSERT INTO `sys_log` VALUES ('47', '0', '新增子字典', 'gds', 'admin', '2019-02-14 11:40:39', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/create', 'POST', '', '5', '0', null, '1');
INSERT INTO `sys_log` VALUES ('48', '0', '删除子字典', 'gds', 'admin', '2019-02-14 11:40:46', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '/dict/child/delete/15', 'POST', '', '6', '0', null, '1');
INSERT INTO `sys_log` VALUES ('49', '0', '新增菜单', 'pig', 'admin', '2019-04-13 15:12:42', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '7', '0', null, '0');
INSERT INTO `sys_log` VALUES ('50', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:13:06', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '14', '0', null, '0');
INSERT INTO `sys_log` VALUES ('51', '0', '新增菜单', 'pig', 'admin', '2019-04-13 15:14:06', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '6', '0', null, '0');
INSERT INTO `sys_log` VALUES ('52', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:14:42', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '15', '0', null, '0');
INSERT INTO `sys_log` VALUES ('53', '0', '新增菜单', 'pig', 'admin', '2019-04-13 15:15:07', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '13', '0', null, '0');
INSERT INTO `sys_log` VALUES ('54', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:15:22', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '15', '0', null, '0');
INSERT INTO `sys_log` VALUES ('55', '0', '新增菜单', 'pig', 'admin', '2019-04-13 15:16:16', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('56', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:16:22', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '8', '0', null, '0');
INSERT INTO `sys_log` VALUES ('57', '0', '新增菜单', 'pig', 'admin', '2019-04-13 15:17:13', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '14', '0', null, '0');
INSERT INTO `sys_log` VALUES ('58', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:17:42', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '6', '0', null, '0');
INSERT INTO `sys_log` VALUES ('59', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:17:49', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '15', '0', null, '0');
INSERT INTO `sys_log` VALUES ('60', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:17:53', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '15', '0', null, '0');
INSERT INTO `sys_log` VALUES ('61', '0', '新增菜单', 'pig', 'admin', '2019-04-13 15:18:29', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '14', '0', null, '0');
INSERT INTO `sys_log` VALUES ('62', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:18:45', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '12', '0', null, '0');
INSERT INTO `sys_log` VALUES ('63', '0', '新增菜单', 'pig', 'admin', '2019-04-13 15:19:56', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '6', '0', null, '0');
INSERT INTO `sys_log` VALUES ('64', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:20:03', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '13', '0', null, '0');
INSERT INTO `sys_log` VALUES ('65', '0', '新增菜单', 'pig', 'admin', '2019-04-13 15:21:09', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '13', '0', null, '0');
INSERT INTO `sys_log` VALUES ('66', '0', '新增菜单', 'pig', 'admin', '2019-04-13 15:21:43', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '12', '0', null, '0');
INSERT INTO `sys_log` VALUES ('67', '0', '新增菜单', 'pig', 'admin', '2019-04-13 15:23:33', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '6', '0', null, '0');
INSERT INTO `sys_log` VALUES ('68', '0', '新增菜单', 'pig', 'admin', '2019-04-13 15:24:40', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '14', '0', null, '0');
INSERT INTO `sys_log` VALUES ('69', '0', '新增菜单', 'pig', 'admin', '2019-04-13 15:25:03', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '12', '0', null, '0');
INSERT INTO `sys_log` VALUES ('70', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:25:18', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '16', '0', null, '0');
INSERT INTO `sys_log` VALUES ('71', '0', '更新角色菜单', 'pig', 'admin', '2019-04-13 15:25:34', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2401%2C2402%2C2403%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C3100%2C3200%2C3300%2C3400%2C3500%2C3600%2C3601%2C3700%2C3800%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C7000%2C7100%2C7200%2C8000%2C8100%2C8200%2C9000%2C9100%2C9200%2C10000%2C11000%2C12000%2C3000%5D', '62', '0', null, '0');
INSERT INTO `sys_log` VALUES ('72', '0', '添加角色', 'pig', 'admin', '2019-04-13 15:26:26', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/role', 'POST', '', '7', '0', null, '0');
INSERT INTO `sys_log` VALUES ('73', '0', '修改角色', 'pig', 'admin', '2019-04-13 15:26:41', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/role', 'PUT', '', '15', '0', null, '0');
INSERT INTO `sys_log` VALUES ('74', '0', '更新角色菜单', 'pig', 'admin', '2019-04-13 15:26:55', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B3%5D&menuIds=%5B7100%2C8100%2C9200%2C12000%2C7000%2C8000%2C9000%2C10000%5D', '25', '0', null, '0');
INSERT INTO `sys_log` VALUES ('75', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:27:43', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '15', '0', null, '0');
INSERT INTO `sys_log` VALUES ('76', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:27:48', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('77', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:27:50', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '14', '0', null, '0');
INSERT INTO `sys_log` VALUES ('78', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:28:24', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '6', '0', null, '0');
INSERT INTO `sys_log` VALUES ('79', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:28:32', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '13', '0', null, '0');
INSERT INTO `sys_log` VALUES ('80', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:28:36', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '15', '0', null, '0');
INSERT INTO `sys_log` VALUES ('81', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:28:40', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '14', '0', null, '0');
INSERT INTO `sys_log` VALUES ('82', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:29:22', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '14', '0', null, '0');
INSERT INTO `sys_log` VALUES ('83', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:29:24', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '18', '0', null, '0');
INSERT INTO `sys_log` VALUES ('84', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:29:27', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '13', '0', null, '0');
INSERT INTO `sys_log` VALUES ('85', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:29:29', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '15', '0', null, '0');
INSERT INTO `sys_log` VALUES ('86', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:31:12', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '6', '0', null, '0');
INSERT INTO `sys_log` VALUES ('87', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:31:15', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '12', '0', null, '0');
INSERT INTO `sys_log` VALUES ('88', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:31:17', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('89', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:31:19', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '13', '0', null, '0');
INSERT INTO `sys_log` VALUES ('90', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:36:33', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '10', '0', null, '0');
INSERT INTO `sys_log` VALUES ('91', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:36:39', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '14', '0', null, '0');
INSERT INTO `sys_log` VALUES ('92', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:36:44', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '15', '0', null, '0');
INSERT INTO `sys_log` VALUES ('93', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:36:50', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '14', '0', null, '0');
INSERT INTO `sys_log` VALUES ('94', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:36:55', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('95', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:36:59', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '12', '0', null, '0');
INSERT INTO `sys_log` VALUES ('96', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:37:05', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '14', '0', null, '0');
INSERT INTO `sys_log` VALUES ('97', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:37:09', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '13', '0', null, '0');
INSERT INTO `sys_log` VALUES ('98', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:41:35', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '15', '0', null, '0');
INSERT INTO `sys_log` VALUES ('99', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:41:45', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '7', '0', null, '0');
INSERT INTO `sys_log` VALUES ('100', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:41:53', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '16', '0', null, '0');
INSERT INTO `sys_log` VALUES ('101', '0', '更新菜单', 'pig', 'admin', '2019-04-13 15:41:59', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '15', '0', null, '0');
INSERT INTO `sys_log` VALUES ('102', '0', '修改学生档案管理表', 'pig', 'admin', '2019-04-13 15:57:47', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/archives/update', 'POST', '', '8', '0', null, '0');
INSERT INTO `sys_log` VALUES ('103', '0', '修改课程管理表', 'pig', 'admin', '2019-04-13 16:02:25', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/update', 'POST', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('104', '0', '更新菜单', 'pig', 'admin', '2019-04-13 16:03:10', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '15', '0', null, '0');
INSERT INTO `sys_log` VALUES ('105', '0', '更新菜单', 'pig', 'admin', '2019-04-13 16:03:19', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '4', '0', null, '0');
INSERT INTO `sys_log` VALUES ('106', '0', '新增菜单', 'pig', 'admin', '2019-04-13 16:04:01', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '9', '0', null, '0');
INSERT INTO `sys_log` VALUES ('107', '0', '更新菜单', 'pig', 'admin', '2019-04-13 16:04:33', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '7', '0', null, '0');
INSERT INTO `sys_log` VALUES ('108', '0', '新增菜单', 'pig', 'admin', '2019-04-13 16:05:39', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '4', '0', null, '0');
INSERT INTO `sys_log` VALUES ('109', '0', '更新菜单', 'pig', 'admin', '2019-04-13 16:05:48', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '9', '0', null, '0');
INSERT INTO `sys_log` VALUES ('110', '0', '更新菜单', 'pig', 'admin', '2019-04-13 16:05:53', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '9', '0', null, '0');
INSERT INTO `sys_log` VALUES ('111', '0', '更新菜单', 'pig', 'admin', '2019-04-13 16:05:57', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '8', '0', null, '0');
INSERT INTO `sys_log` VALUES ('112', '0', '更新菜单', 'pig', 'admin', '2019-04-13 16:07:40', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '8', '0', null, '0');
INSERT INTO `sys_log` VALUES ('113', '0', '更新菜单', 'pig', 'admin', '2019-04-13 16:07:45', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '6', '0', null, '0');
INSERT INTO `sys_log` VALUES ('114', '0', '更新角色菜单', 'pig', 'admin', '2019-04-14 19:27:20', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2401%2C2402%2C2403%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C3100%2C3200%2C3300%2C3400%2C3500%2C3600%2C3601%2C3700%2C3800%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C7000%2C7100%2C7200%2C8000%2C8100%2C8200%2C9000%2C9100%2C9200%2C9300%2C9400%2C10000%2C11000%2C12000%2C3000%5D', '71', '0', null, '0');
INSERT INTO `sys_log` VALUES ('115', '0', '更新角色菜单', 'pig', 'admin', '2019-04-14 19:27:27', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B3%5D&menuIds=%5B7100%2C8100%2C9200%2C9300%2C9400%2C12000%2C7000%2C8000%2C9000%2C10000%5D', '17', '0', null, '0');
INSERT INTO `sys_log` VALUES ('116', '0', '修改课程管理表', 'pig', 'admin', '2019-04-15 21:46:53', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/update', 'POST', '', '34', '0', null, '0');
INSERT INTO `sys_log` VALUES ('117', '0', '修改课程管理表', 'pig', 'admin', '2019-04-15 21:47:18', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/update', 'POST', '', '7', '0', null, '0');
INSERT INTO `sys_log` VALUES ('118', '0', '修改课程管理表', 'pig', 'admin', '2019-04-15 21:47:56', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/update', 'POST', '', '6', '0', null, '0');
INSERT INTO `sys_log` VALUES ('119', '0', '新增学生课程表', 'pig', 'admin', '2019-04-18 14:00:04', null, '192.168.11.135', 'PostmanRuntime/7.6.1', '/schedule/create/1', 'POST', '', '56', '0', null, '0');
INSERT INTO `sys_log` VALUES ('120', '0', '修改专业课程', 'pig', 'admin', '2019-04-18 15:43:40', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/major/update', 'POST', '', '18', '0', null, '0');
INSERT INTO `sys_log` VALUES ('121', '0', '新增专业课程', 'pig', 'admin', '2019-04-18 16:59:25', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/major/create', 'POST', '', '19', '0', null, '0');
INSERT INTO `sys_log` VALUES ('122', '0', '修改专业课程', 'pig', 'admin', '2019-04-18 16:59:30', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/major/update', 'POST', '', '14', '0', null, '0');
INSERT INTO `sys_log` VALUES ('123', '0', '新增专业课程', 'pig', 'admin', '2019-04-18 16:59:51', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/major/create', 'POST', '', '6', '0', null, '0');
INSERT INTO `sys_log` VALUES ('124', '0', '新增专业课程', 'pig', 'admin', '2019-04-18 17:00:25', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/major/create', 'POST', '', '6', '0', null, '0');
INSERT INTO `sys_log` VALUES ('125', '0', '新增专业课程', 'pig', 'admin', '2019-04-18 17:00:53', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/major/create', 'POST', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('126', '0', '修改专业课程', 'pig', 'admin', '2019-04-18 17:01:14', null, '192.168.11.135', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/major/update', 'POST', '', '6', '0', null, '0');
INSERT INTO `sys_log` VALUES ('127', '0', '修改学生课程表', 'pig', 'admin', '2019-04-18 17:04:17', null, '192.168.11.135', 'PostmanRuntime/7.6.1', '/schedule/update', 'POST', '', '42', '0', null, '0');
INSERT INTO `sys_log` VALUES ('128', '0', '修改学生课程表', 'pig', 'admin', '2019-04-18 17:04:35', null, '192.168.11.135', 'PostmanRuntime/7.6.1', '/schedule/update', 'POST', '', '17', '0', null, '0');
INSERT INTO `sys_log` VALUES ('129', '0', '新增学生课程表', 'pig', 'admin', '2019-04-18 21:37:07', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/create/2', 'POST', '', '54', '0', null, '0');
INSERT INTO `sys_log` VALUES ('130', '0', '修改专业课程', 'pig', 'admin', '2019-04-18 22:00:30', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/major/update', 'POST', '', '11', '0', null, '0');
INSERT INTO `sys_log` VALUES ('131', '0', '修改专业课程', 'pig', 'admin', '2019-04-18 22:00:33', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/major/update', 'POST', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('132', '0', '修改专业课程', 'pig', 'admin', '2019-04-18 22:00:39', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/major/update', 'POST', '', '7', '0', null, '0');
INSERT INTO `sys_log` VALUES ('133', '0', '修改专业课程', 'pig', 'admin', '2019-04-18 22:01:11', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/major/update', 'POST', '', '9', '0', null, '0');
INSERT INTO `sys_log` VALUES ('134', '0', '修改学生课程表', 'pig', 'admin', '2019-04-18 22:42:22', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '29', '0', null, '0');
INSERT INTO `sys_log` VALUES ('135', '0', '修改学生课程表', 'pig', 'admin', '2019-04-18 22:43:47', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '33', '0', null, '0');
INSERT INTO `sys_log` VALUES ('136', '0', '修改专业课程', 'pig', 'admin', '2019-04-18 22:44:24', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/major/update', 'POST', '', '13', '0', null, '0');
INSERT INTO `sys_log` VALUES ('137', '0', '修改学生课程表', 'pig', 'admin', '2019-04-18 22:44:35', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '19', '0', null, '0');
INSERT INTO `sys_log` VALUES ('138', '0', '修改学生课程表', 'pig', 'admin', '2019-04-18 22:45:06', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '29', '0', null, '0');
INSERT INTO `sys_log` VALUES ('139', '0', '修改学生课程表', 'pig', 'admin', '2019-04-18 22:45:31', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '20', '0', null, '0');
INSERT INTO `sys_log` VALUES ('140', '0', '更新菜单', 'pig', 'admin', '2019-04-19 16:58:43', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '17', '0', null, '0');
INSERT INTO `sys_log` VALUES ('141', '0', '更新菜单', 'pig', 'admin', '2019-04-19 16:58:52', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '3', '0', null, '0');
INSERT INTO `sys_log` VALUES ('142', '0', '新增菜单', 'pig', 'admin', '2019-04-19 17:05:50', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '4', '0', null, '0');
INSERT INTO `sys_log` VALUES ('143', '0', '更新菜单', 'pig', 'admin', '2019-04-19 17:06:04', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '3', '0', null, '0');
INSERT INTO `sys_log` VALUES ('144', '0', '更新菜单', 'pig', 'admin', '2019-04-19 17:06:14', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '4', '0', null, '0');
INSERT INTO `sys_log` VALUES ('145', '0', '删除菜单', 'pig', 'admin', '2019-04-19 17:06:30', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu/12100', 'DELETE', '', '70', '0', null, '0');
INSERT INTO `sys_log` VALUES ('146', '0', '新增菜单', 'pig', 'admin', '2019-04-19 17:06:55', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '3', '0', null, '0');
INSERT INTO `sys_log` VALUES ('147', '0', '更新菜单', 'pig', 'admin', '2019-04-19 17:07:06', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('148', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:12:40', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '25', '0', null, '0');
INSERT INTO `sys_log` VALUES ('149', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:13:32', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '27', '0', null, '0');
INSERT INTO `sys_log` VALUES ('150', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:13:49', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '29', '0', null, '0');
INSERT INTO `sys_log` VALUES ('151', '0', '修改课程管理表', 'pig', 'admin', '2019-04-19 17:16:33', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/update', 'POST', '', '8', '0', null, '0');
INSERT INTO `sys_log` VALUES ('152', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:18:57', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '25', '0', null, '0');
INSERT INTO `sys_log` VALUES ('153', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:19:16', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '13', '0', null, '0');
INSERT INTO `sys_log` VALUES ('154', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:19:28', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '31', '0', null, '0');
INSERT INTO `sys_log` VALUES ('155', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:20:39', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '7', '0', null, '0');
INSERT INTO `sys_log` VALUES ('156', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:23:19', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '27', '0', null, '0');
INSERT INTO `sys_log` VALUES ('157', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:23:55', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '23', '0', null, '0');
INSERT INTO `sys_log` VALUES ('158', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:24:13', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '28', '0', null, '0');
INSERT INTO `sys_log` VALUES ('159', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:24:39', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '7', '0', null, '0');
INSERT INTO `sys_log` VALUES ('160', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:27:56', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '11', '0', null, '0');
INSERT INTO `sys_log` VALUES ('161', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:28:53', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '7', '0', null, '0');
INSERT INTO `sys_log` VALUES ('162', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:29:31', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '7', '0', null, '0');
INSERT INTO `sys_log` VALUES ('163', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:40:28', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '14', '0', null, '0');
INSERT INTO `sys_log` VALUES ('164', '0', '新增学生课程表', 'pig', 'admin', '2019-04-19 17:41:41', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/create/1', 'POST', '', '8', '0', null, '0');
INSERT INTO `sys_log` VALUES ('165', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:41:51', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '6', '0', null, '0');
INSERT INTO `sys_log` VALUES ('166', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:44:41', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '19', '0', null, '0');
INSERT INTO `sys_log` VALUES ('167', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:44:49', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '14', '0', null, '0');
INSERT INTO `sys_log` VALUES ('168', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:46:29', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '9', '0', null, '0');
INSERT INTO `sys_log` VALUES ('169', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:47:31', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '12', '0', null, '0');
INSERT INTO `sys_log` VALUES ('170', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:49:23', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '20', '0', null, '0');
INSERT INTO `sys_log` VALUES ('171', '0', '新增学生课程表', 'pig', 'admin', '2019-04-19 17:55:34', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/create/1', 'POST', '', '8', '0', null, '0');
INSERT INTO `sys_log` VALUES ('172', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:55:40', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '15', '0', null, '0');
INSERT INTO `sys_log` VALUES ('173', '0', '新增学生课程表', 'pig', 'admin', '2019-04-19 17:57:20', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/create/1', 'POST', '', '6', '0', null, '0');
INSERT INTO `sys_log` VALUES ('174', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:59:00', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '10', '0', null, '0');
INSERT INTO `sys_log` VALUES ('175', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 17:59:12', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '9', '0', null, '0');
INSERT INTO `sys_log` VALUES ('176', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 18:00:56', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '13', '0', null, '0');
INSERT INTO `sys_log` VALUES ('177', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 20:36:26', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '30', '0', null, '0');
INSERT INTO `sys_log` VALUES ('178', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 20:37:16', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '12', '0', null, '0');
INSERT INTO `sys_log` VALUES ('179', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 20:39:58', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '21', '0', null, '0');
INSERT INTO `sys_log` VALUES ('180', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 20:40:04', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '31', '0', null, '0');
INSERT INTO `sys_log` VALUES ('181', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 20:40:14', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '19', '0', null, '0');
INSERT INTO `sys_log` VALUES ('182', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 20:40:18', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '33', '0', null, '0');
INSERT INTO `sys_log` VALUES ('183', '0', '更新角色菜单', 'pig', 'admin', '2019-04-19 20:43:43', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2401%2C2402%2C2403%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C3100%2C3200%2C3300%2C3400%2C3500%2C3600%2C3601%2C3700%2C3800%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C7000%2C7100%2C7200%2C8000%2C8100%2C8200%2C9000%2C9100%2C9200%2C9300%2C9400%2C10000%2C11000%2C12000%2C13000%2C3000%5D', '152', '0', null, '0');
INSERT INTO `sys_log` VALUES ('184', '0', '添加角色', 'pig', 'admin', '2019-04-19 20:44:25', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/role', 'POST', '', '9', '0', null, '0');
INSERT INTO `sys_log` VALUES ('185', '0', '更新角色菜单', 'pig', 'admin', '2019-04-19 20:44:46', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B4%5D&menuIds=%5B7200%2C8200%2C9100%2C9200%2C11000%2C13000%2C7000%2C8000%2C9000%2C10000%5D', '26', '0', null, '0');
INSERT INTO `sys_log` VALUES ('186', '0', '更新角色菜单', 'pig', 'admin', '2019-04-19 20:45:06', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B3%5D&menuIds=%5B7100%2C8100%2C9300%2C9400%2C12000%2C7000%2C8000%2C9000%2C10000%5D', '33', '0', null, '0');
INSERT INTO `sys_log` VALUES ('187', '0', '更新菜单', 'pig', 'admin', '2019-04-19 21:13:44', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '30', '0', null, '0');
INSERT INTO `sys_log` VALUES ('188', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 21:14:15', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '62', '0', null, '0');
INSERT INTO `sys_log` VALUES ('189', '0', '修改学生课程表', 'pig', 'admin', '2019-04-19 21:21:25', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '55', '0', null, '0');
INSERT INTO `sys_log` VALUES ('190', '0', '新增学生课程关联表', 'pig', 'admin', '2019-04-19 21:22:48', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/classrelation/create', 'POST', '', '67', '0', null, '0');
INSERT INTO `sys_log` VALUES ('191', '0', '新增学生课程表', 'pig', 'admin', '2019-04-19 21:22:52', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/create/2', 'POST', '', '23', '0', null, '0');
INSERT INTO `sys_log` VALUES ('192', '0', '修改专业课程', 'pig', 'admin', '2019-04-19 21:23:47', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/major/update', 'POST', '', '16', '0', null, '0');
INSERT INTO `sys_log` VALUES ('193', '0', '修改专业课程', 'pig', 'admin', '2019-04-19 21:23:51', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/major/update', 'POST', '', '6', '0', null, '0');
INSERT INTO `sys_log` VALUES ('194', '0', '修改专业课程', 'pig', 'admin', '2019-04-19 21:23:54', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/major/update', 'POST', '', '8', '0', null, '0');
INSERT INTO `sys_log` VALUES ('195', '0', '修改专业课程', 'pig', 'admin', '2019-04-19 21:23:58', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/major/update', 'POST', '', '4', '0', null, '0');
INSERT INTO `sys_log` VALUES ('196', '0', '修改课程管理表', 'pig', 'admin', '2019-04-19 21:24:03', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/update', 'POST', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('197', '0', '新增课程管理表', 'pig', 'admin', '2019-04-19 21:24:24', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/create', 'POST', '', '11', '0', null, '0');
INSERT INTO `sys_log` VALUES ('198', '0', '新增学生成绩管理表', 'pig', 'admin', '2019-04-19 22:51:36', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/create', 'POST', '', '9', '0', null, '0');
INSERT INTO `sys_log` VALUES ('199', '0', '新增学生成绩管理表', 'pig', 'admin', '2019-04-19 22:53:02', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/create', 'POST', '', '8', '0', null, '0');
INSERT INTO `sys_log` VALUES ('200', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-19 22:54:55', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '14', '0', null, '0');
INSERT INTO `sys_log` VALUES ('201', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-19 22:56:31', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '3', '0', null, '0');
INSERT INTO `sys_log` VALUES ('202', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-19 23:07:37', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '8', '0', null, '0');
INSERT INTO `sys_log` VALUES ('203', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-19 23:09:32', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('204', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-19 23:16:36', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '9', '0', null, '0');
INSERT INTO `sys_log` VALUES ('205', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-21 19:19:45', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '18', '0', null, '0');
INSERT INTO `sys_log` VALUES ('206', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-21 19:20:01', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '15', '0', null, '0');
INSERT INTO `sys_log` VALUES ('207', '0', '添加用户', 'pig', 'admin', '2019-04-21 19:41:12', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/user', 'POST', '', '136', '0', null, '0');
INSERT INTO `sys_log` VALUES ('208', '0', '新增学生课程关联表', 'pig', 'admin', '2019-04-21 19:42:51', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/classrelation/create', 'POST', '', '32', '0', null, '0');
INSERT INTO `sys_log` VALUES ('209', '0', '修改学生课程表', 'pig', 'admin', '2019-04-22 20:01:05', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '48', '0', null, '0');
INSERT INTO `sys_log` VALUES ('210', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-22 20:01:49', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '7', '0', null, '0');
INSERT INTO `sys_log` VALUES ('211', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-22 20:03:37', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('212', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-22 20:04:00', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '4', '0', null, '0');
INSERT INTO `sys_log` VALUES ('213', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-22 20:04:29', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('214', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-22 20:05:16', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '4', '0', null, '0');
INSERT INTO `sys_log` VALUES ('215', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-22 20:05:29', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('216', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-22 20:06:51', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '4', '0', null, '0');
INSERT INTO `sys_log` VALUES ('217', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-22 20:08:05', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '4', '0', null, '0');
INSERT INTO `sys_log` VALUES ('218', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-22 20:11:47', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('219', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-22 20:12:46', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '7', '0', null, '0');
INSERT INTO `sys_log` VALUES ('220', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-22 20:14:35', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '7', '0', null, '0');
INSERT INTO `sys_log` VALUES ('221', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-22 20:18:30', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '11', '0', null, '0');
INSERT INTO `sys_log` VALUES ('222', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-22 20:19:07', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('223', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-22 20:26:32', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '15', '0', null, '0');
INSERT INTO `sys_log` VALUES ('224', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-22 20:28:33', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '7', '0', null, '0');
INSERT INTO `sys_log` VALUES ('225', '0', '新增学生课程关联表', 'pig', 'admin', '2019-04-23 20:39:40', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/selection/create', 'POST', '', '1498', '0', null, '0');
INSERT INTO `sys_log` VALUES ('226', '0', '新增学生课程关联表', 'pig', 'admin', '2019-04-23 20:41:39', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/selection/create', 'POST', '', '3148', '0', null, '0');
INSERT INTO `sys_log` VALUES ('227', '0', '修改学生成绩管理表', 'pig', 'admin', '2019-04-23 20:56:34', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/score/update', 'POST', '', '14', '0', null, '0');
INSERT INTO `sys_log` VALUES ('228', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:05:14', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/2', 'POST', '', '15', '0', null, '0');
INSERT INTO `sys_log` VALUES ('229', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:05:35', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/7', 'POST', '', '2', '0', null, '0');
INSERT INTO `sys_log` VALUES ('230', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:05:39', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/8', 'POST', '', '2', '0', null, '0');
INSERT INTO `sys_log` VALUES ('231', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:05:41', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/2', 'POST', '', '2', '0', null, '0');
INSERT INTO `sys_log` VALUES ('232', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:05:44', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/12', 'POST', '', '3', '0', null, '0');
INSERT INTO `sys_log` VALUES ('233', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:05:47', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/12', 'POST', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('234', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:05:49', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/2', 'POST', '', '3', '0', null, '0');
INSERT INTO `sys_log` VALUES ('235', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:05:53', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/2', 'POST', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('236', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:05:56', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/17', 'POST', '', '2', '0', null, '0');
INSERT INTO `sys_log` VALUES ('237', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:05:59', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/17', 'POST', '', '3', '0', null, '0');
INSERT INTO `sys_log` VALUES ('238', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:06:01', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/18', 'POST', '', '3', '0', null, '0');
INSERT INTO `sys_log` VALUES ('239', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:24:34', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/4', 'POST', '', '35', '0', null, '0');
INSERT INTO `sys_log` VALUES ('240', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:24:43', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/2', 'POST', '', '8', '0', null, '0');
INSERT INTO `sys_log` VALUES ('241', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:24:46', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/1', 'POST', '', '6', '0', null, '0');
INSERT INTO `sys_log` VALUES ('242', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:24:51', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/2', 'POST', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('243', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:24:53', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/2', 'POST', '', '7', '0', null, '0');
INSERT INTO `sys_log` VALUES ('244', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:24:55', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/3', 'POST', '', '2', '0', null, '0');
INSERT INTO `sys_log` VALUES ('245', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:25:06', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/1', 'POST', '', '3', '0', null, '0');
INSERT INTO `sys_log` VALUES ('246', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:25:37', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/1', 'POST', '', '4', '0', null, '0');
INSERT INTO `sys_log` VALUES ('247', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:25:39', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/1', 'POST', '', '3', '0', null, '0');
INSERT INTO `sys_log` VALUES ('248', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:25:45', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/3', 'POST', '', '7', '0', null, '0');
INSERT INTO `sys_log` VALUES ('249', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:25:47', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/0', 'POST', '', '4', '0', null, '0');
INSERT INTO `sys_log` VALUES ('250', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:25:50', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/1', 'POST', '', '3', '0', null, '0');
INSERT INTO `sys_log` VALUES ('251', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:25:52', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/2', 'POST', '', '2', '0', null, '0');
INSERT INTO `sys_log` VALUES ('252', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:25:54', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/3', 'POST', '', '2', '0', null, '0');
INSERT INTO `sys_log` VALUES ('253', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:25:56', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/4', 'POST', '', '2', '0', null, '0');
INSERT INTO `sys_log` VALUES ('254', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:25:59', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/5', 'POST', '', '9', '0', null, '0');
INSERT INTO `sys_log` VALUES ('255', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:26:02', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/0', 'POST', '', '3', '0', null, '0');
INSERT INTO `sys_log` VALUES ('256', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:26:06', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/1', 'POST', '', '2', '0', null, '0');
INSERT INTO `sys_log` VALUES ('257', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:39:35', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/3', 'POST', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('258', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:39:41', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/0', 'POST', '', '3', '0', null, '0');
INSERT INTO `sys_log` VALUES ('259', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:41:49', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/0', 'POST', '', '2', '0', null, '0');
INSERT INTO `sys_log` VALUES ('260', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:41:51', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/1', 'POST', '', '4', '0', null, '0');
INSERT INTO `sys_log` VALUES ('261', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:41:56', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/0', 'POST', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('262', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:42:02', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/1', 'POST', '', '1', '0', null, '0');
INSERT INTO `sys_log` VALUES ('263', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:42:04', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/2', 'POST', '', '2', '0', null, '0');
INSERT INTO `sys_log` VALUES ('264', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:42:06', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/3', 'POST', '', '3', '0', null, '0');
INSERT INTO `sys_log` VALUES ('265', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:42:08', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/4', 'POST', '', '2', '0', null, '0');
INSERT INTO `sys_log` VALUES ('266', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:45:43', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/4', 'POST', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('267', '0', '修改课程管理表', 'pig', 'admin', '2019-04-23 21:45:56', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/update', 'POST', '', '10', '0', null, '0');
INSERT INTO `sys_log` VALUES ('268', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:46:04', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/2', 'POST', '', '2', '0', null, '0');
INSERT INTO `sys_log` VALUES ('269', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:48:31', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/1', 'POST', '', '4', '0', null, '0');
INSERT INTO `sys_log` VALUES ('270', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:48:37', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/1', 'POST', '', '4', '0', null, '0');
INSERT INTO `sys_log` VALUES ('271', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:48:45', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/2', 'POST', '', '2', '0', null, '0');
INSERT INTO `sys_log` VALUES ('272', '0', '修改学生课程表', 'pig', 'admin', '2019-04-23 21:50:11', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '991', '0', null, '0');
INSERT INTO `sys_log` VALUES ('273', '0', '修改学生课程表', 'pig', 'admin', '2019-04-23 21:50:17', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/schedule/update', 'POST', '', '1086', '0', null, '0');
INSERT INTO `sys_log` VALUES ('274', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:53:59', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/2', 'POST', '', '3', '0', null, '0');
INSERT INTO `sys_log` VALUES ('275', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:55:53', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/2', 'POST', '', '21', '0', null, '0');
INSERT INTO `sys_log` VALUES ('276', '0', '修改学生课程关联表', 'pig', 'admin', '2019-04-23 21:55:53', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/selection/update', 'POST', '', '7', '0', null, '0');
INSERT INTO `sys_log` VALUES ('277', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:56:24', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/2', 'POST', '', '3', '0', null, '0');
INSERT INTO `sys_log` VALUES ('278', '0', '修改学生课程关联表', 'pig', 'admin', '2019-04-23 21:56:27', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/selection/update', 'POST', '', '7', '0', null, '0');
INSERT INTO `sys_log` VALUES ('279', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:58:03', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/2', 'POST', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('280', '0', '修改学生课程关联表', 'pig', 'admin', '2019-04-23 21:58:05', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/selection/update', 'POST', '', '4', '0', null, '0');
INSERT INTO `sys_log` VALUES ('281', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 21:58:21', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/2', 'POST', '', '5', '0', null, '0');
INSERT INTO `sys_log` VALUES ('282', '0', '根据时间查询选修课程', 'pig', 'admin', '2019-04-23 22:04:34', null, '192.168.43.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/course/getElectiveList/2', 'POST', '', '18', '0', null, '0');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `name` varchar(32) NOT NULL COMMENT '菜单名称',
  `permission` varchar(32) DEFAULT NULL COMMENT '菜单权限标识',
  `path` varchar(128) DEFAULT NULL COMMENT '前端URL',
  `parent_id` int(11) DEFAULT NULL COMMENT '父菜单ID',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `component` varchar(64) DEFAULT NULL COMMENT 'VUE页面',
  `sort` int(11) DEFAULT '1' COMMENT '排序值',
  `keep_alive` char(1) DEFAULT '0' COMMENT '0-开启，1- 关闭',
  `type` char(1) DEFAULT NULL COMMENT '菜单类型 （0菜单 1按钮）',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除标记(0--正常 1--删除)',
  `tenant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1000', '权限管理', null, '/upms', '-1', 'icon-quanxianguanli', 'Layout', '0', '0', '0', '2018-09-28 08:29:53', '2018-09-28 08:53:01', '0', '1');
INSERT INTO `sys_menu` VALUES ('1100', '用户管理', null, 'user', '1000', 'icon-yonghuguanli', 'views/admin/user/index', '1', '0', '0', '2017-11-02 22:24:37', '2018-09-28 09:00:41', '0', '1');
INSERT INTO `sys_menu` VALUES ('1101', '用户新增', 'sys_user_add', null, '1100', null, null, null, '0', '1', '2017-11-08 09:52:09', '2018-09-28 09:06:34', '0', '1');
INSERT INTO `sys_menu` VALUES ('1102', '用户修改', 'sys_user_edit', null, '1100', null, null, null, '0', '1', '2017-11-08 09:52:48', '2018-09-28 09:06:37', '0', '1');
INSERT INTO `sys_menu` VALUES ('1103', '用户删除', 'sys_user_del', null, '1100', null, null, null, '0', '1', '2017-11-08 09:54:01', '2018-09-28 09:06:42', '0', '1');
INSERT INTO `sys_menu` VALUES ('1200', '菜单管理', null, 'menu', '1000', 'icon-caidanguanli', 'views/admin/menu/index', '2', '0', '0', '2017-11-08 09:57:27', '2018-09-28 09:00:45', '0', '1');
INSERT INTO `sys_menu` VALUES ('1201', '菜单新增', 'sys_menu_add', null, '1200', null, null, null, '0', '1', '2017-11-08 10:15:53', '2018-09-28 09:07:16', '0', '1');
INSERT INTO `sys_menu` VALUES ('1202', '菜单修改', 'sys_menu_edit', null, '1200', null, null, null, '0', '1', '2017-11-08 10:16:23', '2018-09-28 09:07:18', '0', '1');
INSERT INTO `sys_menu` VALUES ('1203', '菜单删除', 'sys_menu_del', null, '1200', null, null, null, '0', '1', '2017-11-08 10:16:43', '2018-09-28 09:07:22', '0', '1');
INSERT INTO `sys_menu` VALUES ('1300', '角色管理', null, 'role', '1000', 'icon-jiaoseguanli', 'views/admin/role/index', '3', '0', '0', '2017-11-08 10:13:37', '2018-09-28 09:00:48', '0', '1');
INSERT INTO `sys_menu` VALUES ('1301', '角色新增', 'sys_role_add', null, '1300', null, null, null, '0', '1', '2017-11-08 10:14:18', '2018-09-28 09:07:46', '0', '1');
INSERT INTO `sys_menu` VALUES ('1302', '角色修改', 'sys_role_edit', null, '1300', null, null, null, '0', '1', '2017-11-08 10:14:41', '2018-09-28 09:07:49', '0', '1');
INSERT INTO `sys_menu` VALUES ('1303', '角色删除', 'sys_role_del', null, '1300', null, null, null, '0', '1', '2017-11-08 10:14:59', '2018-09-28 09:07:53', '0', '1');
INSERT INTO `sys_menu` VALUES ('1304', '分配权限', 'sys_role_perm', null, '1300', null, null, null, '0', '1', '2018-04-20 07:22:55', '2018-09-28 09:13:23', '0', '1');
INSERT INTO `sys_menu` VALUES ('1400', '部门管理', null, 'dept', '1000', 'icon-web-icon-', 'views/admin/dept/index', '4', '0', '0', '2018-01-20 13:17:19', '2018-12-09 16:35:12', '0', '1');
INSERT INTO `sys_menu` VALUES ('1401', '部门新增', 'sys_dept_add', null, '1400', null, null, null, '0', '1', '2018-01-20 14:56:16', '2018-09-28 09:08:13', '0', '1');
INSERT INTO `sys_menu` VALUES ('1402', '部门修改', 'sys_dept_edit', null, '1400', null, null, null, '0', '1', '2018-01-20 14:56:59', '2018-09-28 09:08:16', '0', '1');
INSERT INTO `sys_menu` VALUES ('1403', '部门删除', 'sys_dept_del', null, '1400', null, null, null, '0', '1', '2018-01-20 14:57:28', '2018-09-28 09:08:18', '0', '1');
INSERT INTO `sys_menu` VALUES ('2000', '系统管理', null, '/admin', '-1', 'icon-xitongguanli', 'Layout', '1', '0', '0', '2017-11-07 20:56:00', '2018-09-28 08:53:18', '0', '1');
INSERT INTO `sys_menu` VALUES ('2100', '日志管理', null, 'log', '2000', 'icon-rizhiguanli', 'views/admin/log/index', '5', '0', '0', '2017-11-20 14:06:22', '2018-09-28 09:01:52', '0', '1');
INSERT INTO `sys_menu` VALUES ('2101', '日志删除', 'sys_log_del', null, '2100', null, null, null, '0', '1', '2017-11-20 20:37:37', '2018-09-28 09:08:44', '0', '1');
INSERT INTO `sys_menu` VALUES ('2200', '字典管理', null, 'dict', '2000', 'icon-navicon-zdgl', 'views/admin/dict/index', '6', '0', '0', '2017-11-29 11:30:52', '2018-09-28 09:01:47', '0', '1');
INSERT INTO `sys_menu` VALUES ('2201', '字典删除', 'sys_dict_del', null, '2200', null, null, null, '0', '1', '2017-11-29 11:30:11', '2018-09-28 09:09:10', '0', '1');
INSERT INTO `sys_menu` VALUES ('2202', '字典新增', 'sys_dict_add', null, '2200', null, null, null, '0', '1', '2018-05-11 22:34:55', '2018-09-28 09:09:12', '0', '1');
INSERT INTO `sys_menu` VALUES ('2203', '字典修改', 'sys_dict_edit', null, '2200', null, null, null, '0', '1', '2018-05-11 22:36:03', '2018-09-28 09:09:16', '0', '1');
INSERT INTO `sys_menu` VALUES ('2300', '代码生成', '', 'gen', '2000', 'icon-weibiaoti46', 'views/gen/index', '8', '0', '0', '2018-01-20 13:17:19', '2018-11-24 05:21:01', '0', '1');
INSERT INTO `sys_menu` VALUES ('2400', '终端管理', '', 'client', '2000', 'icon-shouji', 'views/admin/client/index', '9', '0', '0', '2018-01-20 13:17:19', '2018-09-28 09:01:43', '0', '1');
INSERT INTO `sys_menu` VALUES ('2401', '客户端新增', 'sys_client_add', null, '2400', '1', null, null, '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:10:25', '0', '1');
INSERT INTO `sys_menu` VALUES ('2402', '客户端修改', 'sys_client_edit', null, '2400', null, null, null, '0', '1', '2018-05-15 21:37:06', '2018-09-28 09:10:27', '0', '1');
INSERT INTO `sys_menu` VALUES ('2403', '客户端删除', 'sys_client_del', null, '2400', null, null, null, '0', '1', '2018-05-15 21:39:16', '2018-09-28 09:10:30', '0', '1');
INSERT INTO `sys_menu` VALUES ('2500', '密钥管理', '', 'social', '2000', 'icon-miyue', 'views/admin/social/index', '10', '0', '0', '2018-01-20 13:17:19', '2018-09-28 09:01:41', '0', '1');
INSERT INTO `sys_menu` VALUES ('2501', '密钥新增', 'generator_syssocialdetails_add', null, '2500', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:11:02', '0', '1');
INSERT INTO `sys_menu` VALUES ('2502', '密钥修改', 'generator_syssocialdetails_edit', null, '2500', '1', null, '1', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:11:04', '0', '1');
INSERT INTO `sys_menu` VALUES ('2503', '密钥删除', 'generator_syssocialdetails_del', null, '2500', '1', null, '2', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:11:06', '0', '1');
INSERT INTO `sys_menu` VALUES ('2600', '令牌管理', null, 'token', '2000', 'icon-denglvlingpai', 'views/admin/token/index', '11', '0', '0', '2018-09-04 05:58:41', '2018-09-28 09:01:38', '0', '1');
INSERT INTO `sys_menu` VALUES ('2601', '令牌删除', 'sys_token_del', null, '2600', null, null, '1', '0', '1', '2018-09-04 05:59:50', '2018-09-28 09:11:24', '0', '1');
INSERT INTO `sys_menu` VALUES ('2700', '动态路由', null, 'route', '2000', 'icon-luyou', 'views/admin/route/index', '12', '0', '0', '2018-09-04 05:58:41', '2018-09-28 09:01:38', '0', '1');
INSERT INTO `sys_menu` VALUES ('3000', '系统监控', null, '/daemon', '-1', 'icon-msnui-supervise', 'Layout', '2', '0', '0', '2018-07-27 01:13:21', '2018-09-28 08:53:24', '0', '1');
INSERT INTO `sys_menu` VALUES ('3100', '服务监控', null, 'http://139.224.200.249:15001', '3000', 'icon-server', null, '0', '0', '0', '2018-06-26 10:50:32', '2018-12-11 17:17:07', '0', '1');
INSERT INTO `sys_menu` VALUES ('3200', '接口文档', null, 'http://139.224.200.249:19999/swagger-ui.html', '3000', 'icon-wendang', null, '1', '0', '0', '2018-06-26 10:50:32', '2018-09-28 09:05:16', '0', '1');
INSERT INTO `sys_menu` VALUES ('3300', '事务监控', null, 'tx', '3000', 'icon-gtsquanjushiwufuwuGTS', 'views/tx/index', '5', '0', '0', '2018-08-19 11:02:39', '2018-11-23 14:25:08', '0', '1');
INSERT INTO `sys_menu` VALUES ('3400', '在线事务', null, 'model', '3000', 'icon-online', 'views/tx/model', '6', '0', '0', '2018-08-19 11:32:04', '2018-11-23 14:25:14', '0', '1');
INSERT INTO `sys_menu` VALUES ('3500', '任务监控', null, 'http://139.224.200.249:8899', '3000', 'icon-msnui-supervise', null, '7', '0', '0', '2018-06-26 10:50:32', '2018-09-28 09:03:33', '0', '1');
INSERT INTO `sys_menu` VALUES ('3600', '任务轨迹', '', 'status-trace-log', '3000', 'icon-guiji', 'views/daemon/status-trace-log/index', '8', '0', '0', '2018-01-20 13:17:19', '2018-11-24 06:34:52', '0', '1');
INSERT INTO `sys_menu` VALUES ('3601', '删除任务轨迹', 'daemon_status_trace_log_del', null, '3600', '1', null, '2', '0', '1', '2018-05-15 21:35:18', '2018-11-24 06:37:31', '0', '1');
INSERT INTO `sys_menu` VALUES ('3700', '调用拓扑', null, 'http://139.224.200.249:8081', '3000', 'icon-line', null, '10', '0', '0', '2018-01-25 11:08:52', '2018-09-28 09:04:29', '0', '1');
INSERT INTO `sys_menu` VALUES ('3800', '缓存状态', null, 'http://139.224.200.249:8585', '3000', 'icon-qingchuhuancun', null, '12', '0', '0', '2018-01-23 10:56:11', '2018-09-28 09:13:56', '0', '1');
INSERT INTO `sys_menu` VALUES ('3900', '任务日志', '', 'execution-log', '3000', 'icon-guiji', 'views/daemon/execution-log/index', '8', '0', '0', '2018-01-20 13:17:19', '2018-11-24 06:34:52', '0', '1');
INSERT INTO `sys_menu` VALUES ('3901', '删除日志', 'daemon_execution_log_del', null, '3900', '1', null, '2', '0', '1', '2018-05-15 21:35:18', '2018-11-24 06:39:03', '0', '1');
INSERT INTO `sys_menu` VALUES ('4000', '协同管理', null, '/activti', '-1', 'icon-kuaisugongzuoliu_o', 'Layout', '3', '0', '0', '2018-09-26 01:38:13', '2018-09-28 08:58:24', '0', '1');
INSERT INTO `sys_menu` VALUES ('4100', '模型管理', null, 'activiti', '4000', 'icon-weibiaoti13', 'views/activiti/index', '1', '0', '0', '2018-09-26 01:39:07', '2018-12-09 16:35:16', '0', '1');
INSERT INTO `sys_menu` VALUES ('4101', '模型管理', 'act_model_manage', null, '4100', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0', '1');
INSERT INTO `sys_menu` VALUES ('4200', '流程管理', null, 'process', '4000', 'icon-liucheng', 'views/activiti/process', '2', '0', '0', '2018-09-26 06:41:05', '2018-11-23 14:25:33', '0', '1');
INSERT INTO `sys_menu` VALUES ('4201', '流程管理', 'act_process_manage', null, '4200', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0', '1');
INSERT INTO `sys_menu` VALUES ('4300', '请假管理', '', 'leavebill', '4000', 'icon-qingjia', 'views/activiti/leave', '3', '0', '0', '2018-01-20 13:17:19', '2018-12-09 16:35:20', '0', '1');
INSERT INTO `sys_menu` VALUES ('4301', '请假新增', 'act_leavebill_add', null, '4300', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0', '1');
INSERT INTO `sys_menu` VALUES ('4302', '请假修改', 'act_leavebill_edit', null, '4300', '1', null, '1', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:09', '0', '1');
INSERT INTO `sys_menu` VALUES ('4303', '请假删除', 'act_leavebill_del', null, '4300', '1', null, '2', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:14', '0', '1');
INSERT INTO `sys_menu` VALUES ('4400', '待办任务', null, 'task', '4000', 'icon-renwu', 'views/activiti/task', '4', '0', '0', '2018-09-27 09:52:31', '2018-12-09 16:35:26', '0', '1');
INSERT INTO `sys_menu` VALUES ('4401', '流程管理', 'act_task_manage', null, '4400', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0', '1');
INSERT INTO `sys_menu` VALUES ('5000', '多级菜单', null, '/crud', '-1', 'icon-caidanguanli', '', '4', '0', '0', '2018-08-28 01:50:22', '2018-09-28 08:58:20', '0', '1');
INSERT INTO `sys_menu` VALUES ('5001', '一级菜单', null, 'index', '5000', 'icon-caidanguanli', 'views/crud/index', '1', '0', '0', '2018-08-28 01:50:48', '2018-11-21 17:48:19', '1', '1');
INSERT INTO `sys_menu` VALUES ('5002', '二级菜单', null, 'crud', '5001', 'icon-caidanguanli', 'views/crud/index', '1', '0', '0', '2018-08-28 01:51:23', '2018-11-21 17:47:40', '1', '1');
INSERT INTO `sys_menu` VALUES ('5003', '一级菜单', null, '', '5000', 'icon-caidanguanli', '', '1', '0', '0', '2018-11-21 17:49:18', '2018-11-21 17:53:25', '0', null);
INSERT INTO `sys_menu` VALUES ('5004', '二级菜单', null, 'index', '5003', 'icon-caidanguanli', 'views/crud/index', '1', '0', '0', '2018-11-21 17:53:51', '2018-12-20 14:26:53', '1', null);
INSERT INTO `sys_menu` VALUES ('6000', '系统官网', null, 'https://pig4cloud.com#', '-1', 'icon-guanwang', '', '5', '0', '0', '2018-09-27 02:26:36', '2018-11-17 16:18:50', '1', '1');
INSERT INTO `sys_menu` VALUES ('7000', '班级管理', null, '/upms/class', '-1', null, 'Layout', '0', '0', '0', '2019-04-13 15:12:41', '2019-04-13 15:13:06', '0', null);
INSERT INTO `sys_menu` VALUES ('7100', '班级信息', null, 'classView', '7000', null, 'views/admin/class/classView/index', '6', '0', '0', '2019-04-13 15:14:06', '2019-04-13 15:14:42', '0', null);
INSERT INTO `sys_menu` VALUES ('7200', '班级添加', null, 'classCreate', '7000', null, 'views/admin/class/classCreate/index', '5', '0', '0', '2019-04-13 15:15:07', '2019-04-13 15:15:22', '0', null);
INSERT INTO `sys_menu` VALUES ('8000', '学生档案', null, '/upms/archives', '-1', null, 'Layout', '0', '0', '0', '2019-04-13 15:16:16', '2019-04-13 15:16:22', '0', null);
INSERT INTO `sys_menu` VALUES ('8100', '个人档案信息', null, 'basicStudent', '8000', null, 'views/admin/archives/basicStudent/index', '5', '0', '0', '2019-04-13 15:17:13', '2019-04-13 15:17:42', '0', null);
INSERT INTO `sys_menu` VALUES ('8200', '学生档案管理', null, 'editArchives', '8000', null, 'views/admin/archives/editArchives/index', '5', '0', '0', '2019-04-13 15:18:29', '2019-04-13 15:18:45', '0', null);
INSERT INTO `sys_menu` VALUES ('9000', '相关课程', null, '/upms/course', '-1', null, 'Layout', '0', '0', '0', '2019-04-13 15:19:56', '2019-04-13 15:20:03', '0', null);
INSERT INTO `sys_menu` VALUES ('9100', '班级专业课程管理', null, 'professionalCourse', '9000', null, 'views/admin/course/professionalCourse/index', '1', '0', '0', '2019-04-13 15:21:09', '2019-04-13 15:36:55', '0', null);
INSERT INTO `sys_menu` VALUES ('9200', '选修课程管理', null, 'classCourse', '9000', null, 'views/admin/course/classCourse/index', '2', '0', '0', '2019-04-13 15:21:09', '2019-04-13 15:36:55', '0', null);
INSERT INTO `sys_menu` VALUES ('9300', '学生选课', null, 'courseSelect', '9000', '', 'views/admin/course/courseSelect/index', '3', '0', '0', '2019-04-13 16:04:01', '2019-04-13 16:05:57', '0', null);
INSERT INTO `sys_menu` VALUES ('9400', '个人课程', null, 'basicCourse', '9000', '4', 'views/admin/course/basicCourse/index', '1', '0', '0', '2019-04-13 16:05:39', '2019-04-13 16:05:48', '0', null);
INSERT INTO `sys_menu` VALUES ('10000', '学生成绩', null, '/upms/soure', '-1', null, 'Layout', '0', '0', '0', '2019-04-13 15:23:33', '2019-04-13 15:27:50', '0', null);
INSERT INTO `sys_menu` VALUES ('11000', '专业课程成绩管理', null, 'examMajorCreate', '10000', null, 'views/admin/soure/examMajorCreate/index', '1', '0', '0', '2019-04-13 15:24:40', '2019-04-13 15:37:05', '0', null);
INSERT INTO `sys_menu` VALUES ('12000', '个人成绩', null, 'basicScore', '10000', null, 'views/admin/soure/basicScore/index', '1', '0', '0', '2019-04-13 15:25:03', '2019-04-13 15:25:18', '0', null);
INSERT INTO `sys_menu` VALUES ('12100', '选修课程成绩管理', null, null, '12000', null, 'views/admin/soure/examCreate/index', '1', '0', '0', '2019-04-19 17:05:50', '2019-04-19 17:06:30', '1', null);
INSERT INTO `sys_menu` VALUES ('13000', '选修课程成绩管理', null, null, '10000', null, 'views/admin/soure/examCreate/index', '1', '0', '0', '2019-04-19 17:06:55', '2019-04-19 17:07:06', '0', null);

-- ----------------------------
-- Table structure for sys_oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_details`;
CREATE TABLE `sys_oauth_client_details` (
  `client_id` varchar(32) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  `tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属租户',
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='终端信息表';

-- ----------------------------
-- Records of sys_oauth_client_details
-- ----------------------------
INSERT INTO `sys_oauth_client_details` VALUES ('app', null, 'app', 'server', 'password,refresh_token', null, null, null, null, null, 'true', '1');
INSERT INTO `sys_oauth_client_details` VALUES ('daemon', null, 'daemon', 'server', 'password,refresh_token', null, null, null, null, null, 'true', '1');
INSERT INTO `sys_oauth_client_details` VALUES ('gds', null, 'gds', 'server', 'password,refresh_token,authorization_code', 'http://localhost:4040/sso1/login,http://localhost:4041/sso1/login', null, null, null, null, 'true', '1');
INSERT INTO `sys_oauth_client_details` VALUES ('gen', null, 'gen', 'server', 'password,refresh_token', null, null, null, null, null, 'true', '1');
INSERT INTO `sys_oauth_client_details` VALUES ('pig', null, 'pig', 'server', 'password,refresh_token,authorization_code', 'http://localhost:4040/sso1/login,http://localhost:4041/sso1/login', null, null, null, null, 'true', '1');
INSERT INTO `sys_oauth_client_details` VALUES ('test', null, 'test', 'server', 'password,refresh_token', null, null, null, null, null, 'true', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `role_code` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `role_desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ds_type` char(1) COLLATE utf8mb4_bin NOT NULL DEFAULT '2' COMMENT '数据权限类型',
  `ds_scope` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据权限范围',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  `tenant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE KEY `role_idx1_role_code` (`role_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'ROLE_ADMIN', '管理员', '2', '2', '2017-10-29 15:45:51', '2018-12-26 14:09:11', '0', '1');
INSERT INTO `sys_role` VALUES ('2', 'ROLE_CQQ', 'ROLE_CQQ', 'ROLE_CQQ', '2', null, '2018-11-11 19:42:26', '2018-12-26 14:09:07', '0', '2');
INSERT INTO `sys_role` VALUES ('3', '普通用户', 'ROLE_NORMAL', '普通角色', '2', null, '2019-04-13 15:26:26', '2019-04-13 15:26:41', '0', null);
INSERT INTO `sys_role` VALUES ('4', '管理员', 'ROLE_TEACHER', '普通管理员', '2', null, '2019-04-19 20:44:25', null, '0', null);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色菜单表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1000');
INSERT INTO `sys_role_menu` VALUES ('1', '1100');
INSERT INTO `sys_role_menu` VALUES ('1', '1101');
INSERT INTO `sys_role_menu` VALUES ('1', '1102');
INSERT INTO `sys_role_menu` VALUES ('1', '1103');
INSERT INTO `sys_role_menu` VALUES ('1', '1200');
INSERT INTO `sys_role_menu` VALUES ('1', '1201');
INSERT INTO `sys_role_menu` VALUES ('1', '1202');
INSERT INTO `sys_role_menu` VALUES ('1', '1203');
INSERT INTO `sys_role_menu` VALUES ('1', '1300');
INSERT INTO `sys_role_menu` VALUES ('1', '1301');
INSERT INTO `sys_role_menu` VALUES ('1', '1302');
INSERT INTO `sys_role_menu` VALUES ('1', '1303');
INSERT INTO `sys_role_menu` VALUES ('1', '1304');
INSERT INTO `sys_role_menu` VALUES ('1', '1400');
INSERT INTO `sys_role_menu` VALUES ('1', '1401');
INSERT INTO `sys_role_menu` VALUES ('1', '1402');
INSERT INTO `sys_role_menu` VALUES ('1', '1403');
INSERT INTO `sys_role_menu` VALUES ('1', '2000');
INSERT INTO `sys_role_menu` VALUES ('1', '2100');
INSERT INTO `sys_role_menu` VALUES ('1', '2101');
INSERT INTO `sys_role_menu` VALUES ('1', '2200');
INSERT INTO `sys_role_menu` VALUES ('1', '2201');
INSERT INTO `sys_role_menu` VALUES ('1', '2202');
INSERT INTO `sys_role_menu` VALUES ('1', '2203');
INSERT INTO `sys_role_menu` VALUES ('1', '2300');
INSERT INTO `sys_role_menu` VALUES ('1', '2400');
INSERT INTO `sys_role_menu` VALUES ('1', '2401');
INSERT INTO `sys_role_menu` VALUES ('1', '2402');
INSERT INTO `sys_role_menu` VALUES ('1', '2403');
INSERT INTO `sys_role_menu` VALUES ('1', '2500');
INSERT INTO `sys_role_menu` VALUES ('1', '2501');
INSERT INTO `sys_role_menu` VALUES ('1', '2502');
INSERT INTO `sys_role_menu` VALUES ('1', '2503');
INSERT INTO `sys_role_menu` VALUES ('1', '2600');
INSERT INTO `sys_role_menu` VALUES ('1', '2601');
INSERT INTO `sys_role_menu` VALUES ('1', '2700');
INSERT INTO `sys_role_menu` VALUES ('1', '3000');
INSERT INTO `sys_role_menu` VALUES ('1', '3100');
INSERT INTO `sys_role_menu` VALUES ('1', '3200');
INSERT INTO `sys_role_menu` VALUES ('1', '3300');
INSERT INTO `sys_role_menu` VALUES ('1', '3400');
INSERT INTO `sys_role_menu` VALUES ('1', '3500');
INSERT INTO `sys_role_menu` VALUES ('1', '3600');
INSERT INTO `sys_role_menu` VALUES ('1', '3601');
INSERT INTO `sys_role_menu` VALUES ('1', '3700');
INSERT INTO `sys_role_menu` VALUES ('1', '3800');
INSERT INTO `sys_role_menu` VALUES ('1', '4000');
INSERT INTO `sys_role_menu` VALUES ('1', '4100');
INSERT INTO `sys_role_menu` VALUES ('1', '4101');
INSERT INTO `sys_role_menu` VALUES ('1', '4200');
INSERT INTO `sys_role_menu` VALUES ('1', '4201');
INSERT INTO `sys_role_menu` VALUES ('1', '4300');
INSERT INTO `sys_role_menu` VALUES ('1', '4301');
INSERT INTO `sys_role_menu` VALUES ('1', '4302');
INSERT INTO `sys_role_menu` VALUES ('1', '4303');
INSERT INTO `sys_role_menu` VALUES ('1', '4400');
INSERT INTO `sys_role_menu` VALUES ('1', '4401');
INSERT INTO `sys_role_menu` VALUES ('1', '7000');
INSERT INTO `sys_role_menu` VALUES ('1', '7100');
INSERT INTO `sys_role_menu` VALUES ('1', '7200');
INSERT INTO `sys_role_menu` VALUES ('1', '8000');
INSERT INTO `sys_role_menu` VALUES ('1', '8100');
INSERT INTO `sys_role_menu` VALUES ('1', '8200');
INSERT INTO `sys_role_menu` VALUES ('1', '9000');
INSERT INTO `sys_role_menu` VALUES ('1', '9100');
INSERT INTO `sys_role_menu` VALUES ('1', '9200');
INSERT INTO `sys_role_menu` VALUES ('1', '9300');
INSERT INTO `sys_role_menu` VALUES ('1', '9400');
INSERT INTO `sys_role_menu` VALUES ('1', '10000');
INSERT INTO `sys_role_menu` VALUES ('1', '11000');
INSERT INTO `sys_role_menu` VALUES ('1', '12000');
INSERT INTO `sys_role_menu` VALUES ('1', '13000');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1100');
INSERT INTO `sys_role_menu` VALUES ('2', '1101');
INSERT INTO `sys_role_menu` VALUES ('2', '1102');
INSERT INTO `sys_role_menu` VALUES ('2', '1103');
INSERT INTO `sys_role_menu` VALUES ('2', '1200');
INSERT INTO `sys_role_menu` VALUES ('2', '1201');
INSERT INTO `sys_role_menu` VALUES ('2', '1202');
INSERT INTO `sys_role_menu` VALUES ('2', '1203');
INSERT INTO `sys_role_menu` VALUES ('2', '1300');
INSERT INTO `sys_role_menu` VALUES ('2', '1301');
INSERT INTO `sys_role_menu` VALUES ('2', '1302');
INSERT INTO `sys_role_menu` VALUES ('2', '1303');
INSERT INTO `sys_role_menu` VALUES ('2', '1304');
INSERT INTO `sys_role_menu` VALUES ('2', '1400');
INSERT INTO `sys_role_menu` VALUES ('2', '1401');
INSERT INTO `sys_role_menu` VALUES ('2', '1402');
INSERT INTO `sys_role_menu` VALUES ('2', '1403');
INSERT INTO `sys_role_menu` VALUES ('3', '7000');
INSERT INTO `sys_role_menu` VALUES ('3', '7100');
INSERT INTO `sys_role_menu` VALUES ('3', '8000');
INSERT INTO `sys_role_menu` VALUES ('3', '8100');
INSERT INTO `sys_role_menu` VALUES ('3', '9000');
INSERT INTO `sys_role_menu` VALUES ('3', '9300');
INSERT INTO `sys_role_menu` VALUES ('3', '9400');
INSERT INTO `sys_role_menu` VALUES ('3', '10000');
INSERT INTO `sys_role_menu` VALUES ('3', '12000');
INSERT INTO `sys_role_menu` VALUES ('4', '7000');
INSERT INTO `sys_role_menu` VALUES ('4', '7200');
INSERT INTO `sys_role_menu` VALUES ('4', '8000');
INSERT INTO `sys_role_menu` VALUES ('4', '8200');
INSERT INTO `sys_role_menu` VALUES ('4', '9000');
INSERT INTO `sys_role_menu` VALUES ('4', '9100');
INSERT INTO `sys_role_menu` VALUES ('4', '9200');
INSERT INTO `sys_role_menu` VALUES ('4', '10000');
INSERT INTO `sys_role_menu` VALUES ('4', '11000');
INSERT INTO `sys_role_menu` VALUES ('4', '13000');

-- ----------------------------
-- Table structure for sys_route_conf
-- ----------------------------
DROP TABLE IF EXISTS `sys_route_conf`;
CREATE TABLE `sys_route_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `route_name` varchar(30) DEFAULT NULL COMMENT '路由名称',
  `route_id` varchar(30) NOT NULL DEFAULT '' COMMENT '路由ID',
  `predicates` json DEFAULT NULL COMMENT '断言',
  `filters` json DEFAULT NULL COMMENT '过滤器',
  `uri` varchar(50) DEFAULT NULL,
  `order` int(2) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='路由配置表';

-- ----------------------------
-- Records of sys_route_conf
-- ----------------------------
INSERT INTO `sys_route_conf` VALUES ('1', '工作流管理模块', 'gds-activiti', '[{\"args\": {\"_genkey_0\": \"/act/**\"}, \"name\": \"Path\"}]', '[]', 'lb://gds-activiti', '0', '2018-11-28 15:56:10', '2019-02-11 15:38:40', '0');
INSERT INTO `sys_route_conf` VALUES ('2', '认证中心', 'gds-auth', '[{\"args\": {\"_genkey_0\": \"/auth/**\"}, \"name\": \"Path\"}]', '[{\"args\": {}, \"name\": \"ValidateCodeGatewayFilter\"}, {\"args\": {}, \"name\": \"PasswordDecoderFilter\"}]', 'lb://gds-auth', '0', '2018-11-28 15:56:10', '2019-02-11 15:38:43', '0');
INSERT INTO `sys_route_conf` VALUES ('3', '代码生成模块', 'gds-codegen', '[{\"args\": {\"_genkey_0\": \"/gen/**\"}, \"name\": \"Path\"}]', '[]', 'lb://gds-codegen', '0', '2018-11-28 15:56:10', '2019-02-11 15:38:45', '0');
INSERT INTO `sys_route_conf` VALUES ('4', '定时任务模块', 'gds-daemon', '[{\"args\": {\"_genkey_0\": \"/daemon/**\"}, \"name\": \"Path\"}]', '[]', 'lb://gds-daemon', '0', '2018-11-28 15:56:10', '2019-02-11 15:38:48', '0');
INSERT INTO `sys_route_conf` VALUES ('5', '分布式事务模块', 'gds-tx-manager', '[{\"args\": {\"_genkey_0\": \"/tx/**\"}, \"name\": \"Path\"}]', '[]', 'lb://gds-tx-manager', '0', '2018-11-28 15:56:10', '2019-02-11 15:38:51', '0');
INSERT INTO `sys_route_conf` VALUES ('6', '通用权限模块', 'gds-upms-biz', '[{\"args\": {\"_genkey_0\": \"/admin/**\"}, \"name\": \"Path\"}]', '[{\"args\": {\"key-resolver\": \"#{@remoteAddrKeyResolver}\", \"redis-rate-limiter.burstCapacity\": \"20\", \"redis-rate-limiter.replenishRate\": \"10\"}, \"name\": \"RequestRateLimiter\"}, {\"args\": {\"name\": \"default\", \"fallbackUri\": \"forward:/fallback\"}, \"name\": \"Hystrix\"}]', 'lb://gds-upms-biz', '0', '2018-11-28 15:56:10', '2019-02-11 15:38:54', '0');

-- ----------------------------
-- Table structure for sys_social_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_social_details`;
CREATE TABLE `sys_social_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主鍵',
  `type` varchar(16) NOT NULL COMMENT '类型',
  `remark` varchar(64) DEFAULT NULL COMMENT '描述',
  `app_id` varchar(64) NOT NULL COMMENT 'appid',
  `app_secret` varchar(64) NOT NULL COMMENT 'app_secret',
  `redirect_url` varchar(128) DEFAULT NULL COMMENT '回调地址',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(50) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统社交登录账号表';

-- ----------------------------
-- Records of sys_social_details
-- ----------------------------
INSERT INTO `sys_social_details` VALUES ('1', 'WX', '微信互联参数', 'wxd1678d3f83b1d83a', '6ddb043f94da5d2172926abe8533504f', 'daoweicloud.com', '2018-08-16 14:24:25', '2018-12-04 11:50:57', '0', '1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `salt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '随机盐',
  `phone` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '简介',
  `avatar` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `lock_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，9-锁定',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  `wx_openid` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '微信openid',
  `qq_openid` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'QQ openid',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `user_wx_openid` (`wx_openid`) USING BTREE,
  KEY `user_qq_openid` (`qq_openid`) USING BTREE,
  KEY `user_idx1_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '$2a$10$QOfWxxFyAMmEEmnuw9UI/..1s4B4eF/u9PzE2ZaGO.ij9YfmcUy.u', null, '17034642888', 'lengleng-oxjkuoy361p6x5snlogo.png', '1', '2018-04-20 07:15:18', '2019-01-05 17:11:20', '0', '0', 'o_0FT0uyg_H1vVy2H0JpSwlVGhWQ', null);
INSERT INTO `sys_user` VALUES ('2', 'lisi', '$2a$10$YjM6xHi7h.CFOq4wFGLYRO/l.7qN5GI5xnDdrGKO4/u2L3gviUgiy', null, null, null, '1', '2019-04-21 19:41:12', null, '0', '0', null, null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('2', '3');
