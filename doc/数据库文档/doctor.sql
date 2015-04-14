/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : doctor

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2015-04-07 17:39:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tab_activity
-- ----------------------------
DROP TABLE IF EXISTS `tab_activity`;
CREATE TABLE `tab_activity` (
  `activityId` int(11) NOT NULL AUTO_INCREMENT,
  `activityType` tinyint(4) DEFAULT NULL,
  `activityName` varchar(255) DEFAULT NULL,
  `activityContent` longtext,
  `activityCreatorId` int(11) DEFAULT NULL,
  `activityCreateTime` datetime DEFAULT NULL,
  `activityStartDate` date DEFAULT NULL,
  `activityDuration` date DEFAULT NULL,
  `activityMemo` varchar(200) DEFAULT NULL,
  `activityIcon` varchar(150) DEFAULT NULL COMMENT '活动的图标',
  PRIMARY KEY (`activityId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='活动信息表';

-- ----------------------------
-- Table structure for tab_activity_doctor
-- ----------------------------
DROP TABLE IF EXISTS `tab_activity_doctor`;
CREATE TABLE `tab_activity_doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activityId` int(11) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='活动与医生关联，用户统计医生的绩效';

-- ----------------------------
-- Table structure for tab_blood_glucose
-- ----------------------------
CREATE TABLE `tab_blood_glucose` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL COMMENT '用户编号',
  `bloodGlucose` smallint(6) DEFAULT NULL COMMENT '血糖值  存储值=实际值*10',
  `flag` smallint(6) DEFAULT '0' COMMENT '空腹、饭后标识    0：空腹  1：饭后',
  `takeTime` datetime DEFAULT NULL COMMENT '测量时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='血糖测试记录表';

-- ----------------------------
-- Table structure for tab_comment
-- ----------------------------
DROP TABLE IF EXISTS `tab_comment`;
CREATE TABLE `tab_comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子评论ID',
  `commentPostId` int(11) DEFAULT NULL COMMENT '评论关联的帖子ID',
  `commentContent` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `commentTime` datetime DEFAULT NULL COMMENT '评论时间',
  `commentUserId` int(11) DEFAULT NULL COMMENT '评论人编号',
  `commentUserName` varchar(255) DEFAULT NULL COMMENT '用户账号（不是真实姓名）',
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛帖子评论表';

-- ----------------------------
-- Table structure for tab_device
-- ----------------------------
DROP TABLE IF EXISTS `tab_device`;
CREATE TABLE `tab_device` (
  `deviceId` int(12) NOT NULL AUTO_INCREMENT,
  `deviceType` tinyint(4) DEFAULT NULL,
  `deviceNo` varchar(30) DEFAULT NULL,
  `deviceModel` varchar(30) DEFAULT NULL,
  `deviceSim` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`deviceId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='穿戴设备表';

-- ----------------------------
-- Table structure for tab_dict_credential
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_credential`;
CREATE TABLE `tab_dict_credential` (
  `id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '证件类型',
  `name` varchar(30) DEFAULT NULL COMMENT '证件名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 证件类型\r\n\r\n1：身份证 2：驾驶证 3：学';

-- ----------------------------
-- Table structure for tab_dict_device_type
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_device_type`;
CREATE TABLE `tab_dict_device_type` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '设备类型编号',
  `name` varchar(50) DEFAULT NULL COMMENT '设备类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='字典 - 设备类型';

-- ----------------------------
-- Table structure for tab_dict_disease
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_disease`;
CREATE TABLE `tab_dict_disease` (
  `diseaseId` int(11) NOT NULL AUTO_INCREMENT COMMENT '疾病ID',
  `diseaseName` varchar(50) DEFAULT NULL COMMENT '疾病名称',
  PRIMARY KEY (`diseaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 疾病名称';

-- ----------------------------
-- Table structure for tab_dict_disease_sub
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_disease_sub`;
CREATE TABLE `tab_dict_disease_sub` (
  `diseaseId` int(11) DEFAULT NULL COMMENT '疾病ID',
  `subDiseaseId` int(11) NOT NULL AUTO_INCREMENT COMMENT '细分疾病ID',
  `subDiseaseName` varchar(50) DEFAULT NULL COMMENT '细分疾病名称',
  PRIMARY KEY (`subDiseaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 疾病细分';

-- ----------------------------
-- Table structure for tab_dict_doctor_advice_type
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_doctor_advice_type`;
CREATE TABLE `tab_dict_doctor_advice_type` (
  `id` int(11) NOT NULL DEFAULT '0',
  `typeId` tinyint(4) DEFAULT NULL COMMENT '医嘱类型编号',
  `typeName` varchar(50) DEFAULT NULL COMMENT '医嘱类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tab_dict_education
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_education`;
CREATE TABLE `tab_dict_education` (
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(20) DEFAULT NULL COMMENT '学历名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 学历\r\n\r\n\r\n1：小学 2：初中 3：高中 3：';

-- ----------------------------
-- Table structure for tab_dict_household
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_household`;
CREATE TABLE `tab_dict_household` (
  `id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型编号',
  `name` varchar(20) DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 户籍类型\r\n\r\n1：城市  2：农村';

-- ----------------------------
-- Table structure for tab_dict_marriage_status
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_marriage_status`;
CREATE TABLE `tab_dict_marriage_status` (
  `id` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tab_dict_nationality
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_nationality`;
CREATE TABLE `tab_dict_nationality` (
  `id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '民族编号',
  `name` varchar(20) DEFAULT NULL COMMENT '民族名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 民族';

-- ----------------------------
-- Table structure for tab_dict_politicsstatus
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_politicsstatus`;
CREATE TABLE `tab_dict_politicsstatus` (
  `id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '面貌类型',
  `name` varchar(20) DEFAULT NULL COMMENT '面貌名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 政治面貌\r\n\r\n1：中共党员 2：共青团员 3';

-- ----------------------------
-- Table structure for tab_dict_salary
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_salary`;
CREATE TABLE `tab_dict_salary` (
  `id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '字典 - 疾病细分',
  `name` varchar(20) DEFAULT NULL COMMENT '薪资范围名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 薪资范围';

-- ----------------------------
-- Table structure for tab_dict_workingage
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_workingage`;
CREATE TABLE `tab_dict_workingage` (
  `id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '年限类型',
  `name` varchar(20) DEFAULT NULL COMMENT '年限名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 工作年限\r\n\r\n\r\n1：1年以下       2：1-3年  ';

-- ----------------------------
-- Table structure for tab_disease_history
-- ----------------------------
DROP TABLE IF EXISTS `tab_disease_history`;
CREATE TABLE `tab_disease_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diseaseName` varchar(100) DEFAULT NULL COMMENT '疾病名称',
  `startDate` date DEFAULT NULL COMMENT '开始时间',
  `endDate` date DEFAULT NULL COMMENT '结束时间',
  `descInHospital` varchar(500) DEFAULT NULL COMMENT '住院情况',
  `descObserve` varchar(500) DEFAULT NULL COMMENT '转归情况',
  `memo` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='疾病史';

-- ----------------------------
-- Table structure for tab_doctor
-- ----------------------------
DROP TABLE IF EXISTS `tab_doctor`;
CREATE TABLE `tab_doctor` (
  `doctorId` int(11) NOT NULL AUTO_INCREMENT,
  `doctorName` varchar(20) DEFAULT NULL,
  `doctorGender` tinyint(4) DEFAULT NULL,
  `doctorPhoto` varchar(150) DEFAULT NULL,
  `doctorHospitalId` int(11) DEFAULT NULL,
  `doctorDeptld` int(11) DEFAULT NULL,
  `doctorTitle` varchar(100) DEFAULT NULL COMMENT '临床职称',
  `doctorTeachingTitle` varchar(100) DEFAULT NULL COMMENT '教学职称',
  `doctorEducation` tinyint(4) DEFAULT NULL,
  `doctorSkill` varchar(200) DEFAULT NULL,
  `doctorDetailDescriptior` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`doctorId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='医生信息表';

-- ----------------------------
-- Table structure for tab_doctor_advice
-- ----------------------------
DROP TABLE IF EXISTS `tab_doctor_advice`;
CREATE TABLE `tab_doctor_advice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `adviceTypId` tinyint(4) DEFAULT NULL,
  `adviceTime` datetime DEFAULT NULL,
  `adviceContent` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='医生建议表（医嘱）';

-- ----------------------------
-- Table structure for tab_doctor_advice_performace
-- ----------------------------
DROP TABLE IF EXISTS `tab_doctor_advice_performace`;
CREATE TABLE `tab_doctor_advice_performace` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `doctorAdviceId` int(12) DEFAULT NULL,
  `doctorAdvicePerformace` varchar(500) DEFAULT NULL,
  `recordTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生建议执行效果';

-- ----------------------------
-- Table structure for tab_ear_thermometer
-- ----------------------------
CREATE TABLE `tab_ear_thermometer` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL COMMENT '用户编号',
  `temperature` smallint(11) DEFAULT NULL COMMENT '耳温  实际值*10， 378表示37.8°',
  `takeTime` datetime DEFAULT NULL COMMENT '测温时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='耳温测量记录';

-- ----------------------------
-- Table structure for tab_feedback
-- ----------------------------
DROP TABLE IF EXISTS `tab_feedback`;
CREATE TABLE `tab_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '反馈表自增ID',
  `feedbackType` tinyint(255) DEFAULT '0' COMMENT '反馈类型  0：网站建设反馈  1：服务反馈',
  `feedbackContent` varchar(500) DEFAULT '' COMMENT '反馈内容',
  `feedbackUserId` int(11) DEFAULT '0' COMMENT '反馈用户编号',
  `feedbackTime` datetime DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户反馈表';

-- ----------------------------
-- Table structure for tab_genetic_disease
-- ----------------------------
DROP TABLE IF EXISTS `tab_genetic_disease`;
CREATE TABLE `tab_genetic_disease` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `isHeartDisease` tinyint(4) DEFAULT NULL,
  `isHypertension` tinyint(4) DEFAULT NULL,
  `isHyperlipemia` tinyint(4) DEFAULT NULL,
  `isDiabetesMellitus` tinyint(4) DEFAULT NULL,
  `isCoronaryDisease` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tab_habbit
-- ----------------------------
DROP TABLE IF EXISTS `tab_habbit`;
CREATE TABLE `tab_habbit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `workType` tinyint(4) DEFAULT NULL,
  `workPressure` tinyint(4) DEFAULT NULL,
  `bloodType` tinyint(4) DEFAULT NULL,
  `weight` tinyint(4) DEFAULT NULL,
  `waist` tinyint(4) DEFAULT NULL,
  `smokeType` tinyint(4) DEFAULT NULL,
  `somkeFrequency` tinyint(4) DEFAULT NULL,
  `drinkFrequency` tinyint(4) DEFAULT NULL,
  `diinkType` tinyint(4) DEFAULT NULL,
  `exerciseFrequency` tinyint(4) DEFAULT NULL,
  `exerciseDuration` tinyint(4) DEFAULT NULL,
  `sleepDuration` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户生活习惯';

-- ----------------------------
-- Table structure for tab_hospital
-- ----------------------------
DROP TABLE IF EXISTS `tab_hospital`;
CREATE TABLE `tab_hospital` (
  `hospitalId` int(11) NOT NULL AUTO_INCREMENT,
  `hospitalName` varchar(50) DEFAULT NULL COMMENT '医院名称',
  `hospitalAddr` varchar(50) DEFAULT NULL COMMENT '医院名称',
  PRIMARY KEY (`hospitalId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='字典 - 医院';

-- ----------------------------
-- Table structure for tab_hospital_dept
-- ----------------------------
DROP TABLE IF EXISTS `tab_hospital_dept`;
CREATE TABLE `tab_hospital_dept` (
  `deptId` int(11) NOT NULL AUTO_INCREMENT,
  `deptName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`deptId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='字典 - 医院科室';

-- ----------------------------
-- Table structure for tab_log4j
-- ----------------------------
DROP TABLE IF EXISTS `tab_log4j`;
CREATE TABLE `tab_log4j` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `class` varchar(255) DEFAULT NULL COMMENT '类名',
  `stamp` varchar(255) DEFAULT NULL COMMENT '时间',
  `thread` varchar(255) DEFAULT NULL COMMENT '线程',
  `info_level` varchar(255) DEFAULT NULL COMMENT '日志级别',
  `message` varchar(4000) DEFAULT NULL COMMENT '日志信息',
  PRIMARY KEY (`ID`),
  KEY `INDEX_LOG4J` (`stamp`,`info_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LOG4J日志记录表';

-- ----------------------------
-- Table structure for tab_msg
-- ----------------------------
DROP TABLE IF EXISTS `tab_msg`;
CREATE TABLE `tab_msg` (
  `id` int(11) DEFAULT NULL,
  `senderId` int(11) DEFAULT NULL COMMENT '发送者',
  `receiverId` int(11) DEFAULT NULL COMMENT '接收者',
  `sendTime` datetime DEFAULT NULL COMMENT '发送时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '消息状态',
  `readTime` datetime DEFAULT NULL COMMENT '阅读时间',
  `msg` varchar(300) DEFAULT NULL COMMENT '消息内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户之间互动的消息';

-- ----------------------------
-- Table structure for tab_nurser_score
-- ----------------------------
DROP TABLE IF EXISTS `tab_nurser_score`;
CREATE TABLE `tab_nurser_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nurserId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `score1` tinyint(4) DEFAULT NULL,
  `score2` tinyint(4) DEFAULT NULL,
  `score3` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医护人员评分';

-- ----------------------------
-- Table structure for tab_platform
-- ----------------------------
DROP TABLE IF EXISTS `tab_platform`;
CREATE TABLE `tab_platform` (
  `id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '系统编号',
  `name` varchar(50) DEFAULT NULL COMMENT '系统名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 平台系统类型\r\n1：用户平台\r\n2：医护联';

-- ----------------------------
-- Table structure for tab_post
-- ----------------------------
DROP TABLE IF EXISTS `tab_post`;
CREATE TABLE `tab_post` (
  `postId` int(11) NOT NULL AUTO_INCREMENT COMMENT '论坛帖子自增编号',
  `postTitle` varchar(255) DEFAULT NULL COMMENT '帖子标题 限长255字节',
  `postContent` mediumtext COMMENT '帖子内容  html格式  限长16777215 字节',
  `postTime` datetime DEFAULT NULL COMMENT '发帖时间',
  `postUserId` int(11) DEFAULT NULL COMMENT '发帖人编号',
  `postUserName` varchar(255) DEFAULT NULL COMMENT '发帖人账号（不是真实姓名）',
  PRIMARY KEY (`postId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛帖子基本表';

-- ----------------------------
-- Table structure for tab_relative_phone
-- ----------------------------
DROP TABLE IF EXISTS `tab_relative_phone`;
CREATE TABLE `tab_relative_phone` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) DEFAULT NULL,
  `relativeName` varchar(20) DEFAULT NULL,
  `relativeType` tinyint(4) DEFAULT NULL,
  `relativeCellPhone` varchar(20) DEFAULT NULL,
  `relativeTel` varchar(20) DEFAULT NULL,
  `relativeAddr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='亲情号码表';

-- ----------------------------
-- Table structure for tab_service
-- ----------------------------
DROP TABLE IF EXISTS `tab_service`;
CREATE TABLE `tab_service` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `serviceType` int(1) DEFAULT '1',
  `serviceName` varchar(50) DEFAULT NULL,
  `serviceContent` varchar(5000) DEFAULT NULL,
  `serviceCreatorId` int(12) DEFAULT NULL,
  `serviceCreateTime` datetime DEFAULT NULL,
  `serviceStartDate` date DEFAULT NULL,
  `serviceDuration` date DEFAULT NULL,
  `serviceMemo` varchar(500) DEFAULT NULL,
  `serviceIcon` varchar(150) DEFAULT NULL COMMENT '服务的图标URL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tab_service_doctor_relation
-- ----------------------------
DROP TABLE IF EXISTS `tab_service_doctor_relation`;
CREATE TABLE `tab_service_doctor_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serviceId` int(11) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='服务于医生关联信息表';

-- ----------------------------
-- Table structure for tab_user
-- ----------------------------
DROP TABLE IF EXISTS `tab_user`;
CREATE TABLE `tab_user` (
  `userId` int(12) NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) DEFAULT NULL,
  `userPass` varchar(32) DEFAULT NULL,
  `userSysId` int(2) DEFAULT NULL,
  `isChild` tinyint(255) DEFAULT '0' COMMENT '是否子女账号  1：是  其他：否',
  `userParentId` int(12) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `cellphone` varchar(11) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `credentialType` tinyint(4) DEFAULT NULL,
  `credentialNo` varchar(50) DEFAULT NULL,
  `isSoldier` tinyint(4) DEFAULT NULL,
  `isDisablity` tinyint(4) DEFAULT NULL,
  `height` smallint(4) DEFAULT NULL,
  `weight` smallint(4) DEFAULT NULL,
  `nationality` tinyint(4) DEFAULT NULL,
  `nativePlace` varchar(80) DEFAULT NULL,
  `marriageStatus` tinyint(4) DEFAULT NULL,
  `householdType` tinyint(4) DEFAULT NULL,
  `education` tinyint(4) DEFAULT NULL,
  `policticsStatus` tinyint(4) DEFAULT NULL,
  `homePhone` varchar(15) DEFAULT NULL,
  `homeAddress` varchar(80) DEFAULT NULL,
  `workingAge` tinyint(4) DEFAULT NULL,
  `salary` tinyint(4) DEFAULT NULL,
  `companyName` varchar(80) DEFAULT NULL,
  `companyAddress` varchar(80) DEFAULT NULL,
  `photo` varchar(150) DEFAULT NULL,
  `achievement` varchar(500) DEFAULT NULL COMMENT '工作成就',
  `spouseName` varchar(255) DEFAULT NULL COMMENT '配偶姓名',
  `spousePhone` varchar(255) DEFAULT NULL COMMENT '配偶手机',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tab_userlogin_logs
-- ----------------------------
DROP TABLE IF EXISTS `tab_userlogin_logs`;
CREATE TABLE `tab_userlogin_logs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `USER_ID` int(11) DEFAULT NULL COMMENT '用户ID',
  `IP` varchar(30) DEFAULT NULL COMMENT '访问的IP地址',
  `OPER_FLAG` smallint(1) DEFAULT '1' COMMENT '登录状态（1：登录，0退出）,默认为1',
  `STIME` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`ID`),
  KEY `INDEX_TAB_USERLOGIN_LOGS` (`USER_ID`,`OPER_FLAG`,`STIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录日志表';

-- ----------------------------
-- Table structure for tab_useroper_logs
-- ----------------------------
DROP TABLE IF EXISTS `tab_useroper_logs`;
CREATE TABLE `tab_useroper_logs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `USER_ID` int(11) DEFAULT NULL COMMENT '用户ID',
  `IP` varchar(30) DEFAULT NULL COMMENT '操作IP',
  `STIME` datetime DEFAULT NULL COMMENT '操作时间',
  `OPER_FUN` varchar(100) DEFAULT NULL COMMENT '操作功能',
  `OPER_MED` varchar(100) DEFAULT NULL COMMENT '调用方法',
  `OPER_CLASS` varchar(200) DEFAULT NULL COMMENT '调用类',
  `OPER_PARAM` longtext COMMENT '传入参数',
  PRIMARY KEY (`ID`),
  KEY `INDEX_TAB_USEROPER_LOGS` (`USER_ID`,`STIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户操作日志';

-- ----------------------------
-- Table structure for tab_user_bind_nurse_request
-- ----------------------------
DROP TABLE IF EXISTS `tab_user_bind_nurse_request`;
CREATE TABLE `tab_user_bind_nurse_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL COMMENT '用户编号',
  `nurseId` int(11) DEFAULT NULL COMMENT '医护联系人编号',
  `status` tinyint(4) DEFAULT NULL COMMENT '请求状态',
  `requestTime` datetime DEFAULT NULL COMMENT '请求时间',
  `responseTime` datetime DEFAULT NULL COMMENT '回复时间',
  `memo` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户签约医护联系人申请';

-- ----------------------------
-- Table structure for tab_user_device
-- ----------------------------
DROP TABLE IF EXISTS `tab_user_device`;
CREATE TABLE `tab_user_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL COMMENT '用户编号',
  `deviceId` int(11) DEFAULT NULL COMMENT '设备编号',
  `buyTime` datetime DEFAULT NULL COMMENT '购买时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户购买的设备';

-- ----------------------------
-- Table structure for tab_user_info
-- ----------------------------
DROP TABLE IF EXISTS `tab_user_info`;
CREATE TABLE `tab_user_info` (
  `userId` int(12) NOT NULL DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `cellphone` varchar(11) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `credentialType` tinyint(4) DEFAULT NULL,
  `credentialNo` varchar(50) DEFAULT NULL,
  `isSoldier` tinyint(4) DEFAULT NULL,
  `isDisablity` tinyint(4) DEFAULT NULL,
  `height` tinyint(4) DEFAULT NULL,
  `weight` tinyint(4) DEFAULT NULL,
  `nationality` tinyint(4) DEFAULT NULL,
  `nativePlace` varchar(80) DEFAULT NULL,
  `marriageStatus` tinyint(4) DEFAULT NULL,
  `householdType` tinyint(4) DEFAULT NULL,
  `education` tinyint(4) DEFAULT NULL,
  `policticsStatus` tinyint(4) DEFAULT NULL,
  `homePhone` varchar(15) DEFAULT NULL,
  `homeAddress` varchar(80) DEFAULT NULL,
  `workingAge` tinyint(4) DEFAULT NULL,
  `salary` tinyint(4) DEFAULT NULL,
  `companyName` varchar(80) DEFAULT NULL,
  `companyAddress` varchar(80) DEFAULT NULL,
  `photo` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tab_user_nurse_relation
-- ----------------------------
DROP TABLE IF EXISTS `tab_user_nurse_relation`;
CREATE TABLE `tab_user_nurse_relation` (
  `userId` int(11) DEFAULT NULL,
  `nurseId` int(11) DEFAULT NULL COMMENT '医护联系人编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与医护联系人关联';

-- ----------------------------
-- Table structure for tab_user_service
-- ----------------------------
DROP TABLE IF EXISTS `tab_user_service`;
CREATE TABLE `tab_user_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购买时间',
  `userId` int(11) DEFAULT NULL COMMENT '用户编号',
  `serviceId` int(11) DEFAULT NULL COMMENT '服务编号',
  `buyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户已购买的服务';