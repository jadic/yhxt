/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : doctor

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2015-03-03 15:21:33
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tab_activity`
-- ----------------------------
DROP TABLE IF EXISTS `tab_activity`;
CREATE TABLE `tab_activity` (
  `activityId` int(11) NOT NULL auto_increment,
  `activityType` tinyint(4) default NULL,
  `activityName` varchar(255) default NULL,
  `activityContent` longtext,
  `activityCreatorId` int(11) default NULL,
  `activityCreateTime` datetime default NULL,
  `activityStartDate` date default NULL,
  `activityDuration` date default NULL,
  `activityMemo` varchar(200) default NULL,
  `activityIcon` varchar(150) default NULL COMMENT '活动的图标',
  PRIMARY KEY  (`activityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_activity
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_activity_doctor`
-- ----------------------------
DROP TABLE IF EXISTS `tab_activity_doctor`;
CREATE TABLE `tab_activity_doctor` (
  `id` int(11) NOT NULL auto_increment,
  `activityId` int(11) default NULL,
  `doctorId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动与医生关联，用户统计医生的绩效';

-- ----------------------------
-- Records of tab_activity_doctor
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_device`
-- ----------------------------
DROP TABLE IF EXISTS `tab_device`;
CREATE TABLE `tab_device` (
  `deviceId` int(12) NOT NULL auto_increment,
  `deviceType` tinyint(4) default NULL,
  `deviceNo` varchar(30) default NULL,
  `deviceModel` varchar(30) default NULL,
  `deviceSim` varchar(11) default NULL,
  PRIMARY KEY  (`deviceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_device
-- ----------------------------
INSERT INTO tab_device VALUES ('2', '1', '112', '223', '334');

-- ----------------------------
-- Table structure for `tab_dict_credential`
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_credential`;
CREATE TABLE `tab_dict_credential` (
  `id` tinyint(4) NOT NULL default '0' COMMENT '证件类型',
  `name` varchar(30) default NULL COMMENT '证件名称',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 证件类型\r\n\r\n1：身份证 2：驾驶证 3：学';

-- ----------------------------
-- Records of tab_dict_credential
-- ----------------------------
INSERT INTO tab_dict_credential VALUES ('1', '身份证');
INSERT INTO tab_dict_credential VALUES ('2', '驾驶证');
INSERT INTO tab_dict_credential VALUES ('3', '学生证');
INSERT INTO tab_dict_credential VALUES ('4', '护照');
INSERT INTO tab_dict_credential VALUES ('5', '军官证');
INSERT INTO tab_dict_credential VALUES ('6', '港澳通行证');

-- ----------------------------
-- Table structure for `tab_dict_device_type`
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_device_type`;
CREATE TABLE `tab_dict_device_type` (
  `id` tinyint(4) NOT NULL auto_increment COMMENT '设备类型编号',
  `name` varchar(50) default NULL COMMENT '设备类型名称',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 设备类型';

-- ----------------------------
-- Records of tab_dict_device_type
-- ----------------------------
INSERT INTO tab_dict_device_type VALUES ('1', 'sdfsfddd22');

-- ----------------------------
-- Table structure for `tab_dict_disease`
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_disease`;
CREATE TABLE `tab_dict_disease` (
  `diseaseId` int(11) NOT NULL auto_increment COMMENT '疾病ID',
  `diseaseName` varchar(50) default NULL COMMENT '疾病名称',
  PRIMARY KEY  (`diseaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 疾病名称';

-- ----------------------------
-- Records of tab_dict_disease
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_dict_disease_sub`
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_disease_sub`;
CREATE TABLE `tab_dict_disease_sub` (
  `diseaseId` int(11) default NULL COMMENT '疾病ID',
  `subDiseaseId` int(11) NOT NULL auto_increment COMMENT '细分疾病ID',
  `subDiseaseName` varchar(50) default NULL COMMENT '细分疾病名称',
  PRIMARY KEY  (`subDiseaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 疾病细分';

-- ----------------------------
-- Records of tab_dict_disease_sub
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_dict_doctor_advice_type`
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_doctor_advice_type`;
CREATE TABLE `tab_dict_doctor_advice_type` (
  `id` int(11) NOT NULL default '0',
  `typeId` tinyint(4) default NULL COMMENT '医嘱类型编号',
  `typeName` varchar(50) default NULL COMMENT '医嘱类型名称',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_dict_doctor_advice_type
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_dict_education`
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_education`;
CREATE TABLE `tab_dict_education` (
  `id` tinyint(4) NOT NULL default '0',
  `name` varchar(20) default NULL COMMENT '学历名称',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 学历\r\n\r\n\r\n1：小学 2：初中 3：高中 3：';

-- ----------------------------
-- Records of tab_dict_education
-- ----------------------------
INSERT INTO tab_dict_education VALUES ('1', '小学');
INSERT INTO tab_dict_education VALUES ('2', '初中');
INSERT INTO tab_dict_education VALUES ('3', '高中');
INSERT INTO tab_dict_education VALUES ('4', '中专');
INSERT INTO tab_dict_education VALUES ('5', '大专');
INSERT INTO tab_dict_education VALUES ('6', '本科');
INSERT INTO tab_dict_education VALUES ('7', '硕士');
INSERT INTO tab_dict_education VALUES ('8', '博士');
INSERT INTO tab_dict_education VALUES ('9', '其它');

-- ----------------------------
-- Table structure for `tab_dict_household`
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_household`;
CREATE TABLE `tab_dict_household` (
  `id` tinyint(4) NOT NULL default '0' COMMENT '类型编号',
  `name` varchar(20) default NULL COMMENT '类型名称',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 户籍类型\r\n\r\n1：城市  2：农村';

-- ----------------------------
-- Records of tab_dict_household
-- ----------------------------
INSERT INTO tab_dict_household VALUES ('1', '城市');
INSERT INTO tab_dict_household VALUES ('2', '农村');

-- ----------------------------
-- Table structure for `tab_dict_marriage_status`
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_marriage_status`;
CREATE TABLE `tab_dict_marriage_status` (
  `id` tinyint(4) NOT NULL default '0',
  `name` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_dict_marriage_status
-- ----------------------------
INSERT INTO tab_dict_marriage_status VALUES ('1', '未婚');
INSERT INTO tab_dict_marriage_status VALUES ('2', '已婚');
INSERT INTO tab_dict_marriage_status VALUES ('3', '离异');

-- ----------------------------
-- Table structure for `tab_dict_nationality`
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_nationality`;
CREATE TABLE `tab_dict_nationality` (
  `id` tinyint(4) NOT NULL default '0' COMMENT '民族编号',
  `name` varchar(20) default NULL COMMENT '民族名称',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 民族';

-- ----------------------------
-- Records of tab_dict_nationality
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_dict_politicsstatus`
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_politicsstatus`;
CREATE TABLE `tab_dict_politicsstatus` (
  `id` tinyint(4) NOT NULL default '0' COMMENT '面貌类型',
  `name` varchar(20) default NULL COMMENT '面貌名称',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 政治面貌\r\n\r\n1：中共党员 2：共青团员 3';

-- ----------------------------
-- Records of tab_dict_politicsstatus
-- ----------------------------
INSERT INTO tab_dict_politicsStatus VALUES ('1', '中共党员');
INSERT INTO tab_dict_politicsStatus VALUES ('2', '共青团员');
INSERT INTO tab_dict_politicsStatus VALUES ('3', '民主党派成员');
INSERT INTO tab_dict_politicsStatus VALUES ('4', '群众');

-- ----------------------------
-- Table structure for `tab_dict_salary`
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_salary`;
CREATE TABLE `tab_dict_salary` (
  `id` tinyint(4) NOT NULL default '0' COMMENT '字典 - 疾病细分',
  `name` varchar(20) default NULL COMMENT '薪资范围名称',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 薪资范围';

-- ----------------------------
-- Records of tab_dict_salary
-- ----------------------------
INSERT INTO tab_dict_salary VALUES ('1', '2万以下');
INSERT INTO tab_dict_salary VALUES ('2', '2-5万');
INSERT INTO tab_dict_salary VALUES ('3', '其它');

-- ----------------------------
-- Table structure for `tab_dict_workingage`
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_workingage`;
CREATE TABLE `tab_dict_workingage` (
  `id` tinyint(4) NOT NULL default '0' COMMENT '年限类型',
  `name` varchar(20) default NULL COMMENT '年限名称',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 工作年限\r\n\r\n\r\n1：1年以下       2：1-3年  ';

-- ----------------------------
-- Records of tab_dict_workingage
-- ----------------------------
INSERT INTO tab_dict_workingage VALUES ('1', '1年以下');
INSERT INTO tab_dict_workingage VALUES ('2', '1-3年');
INSERT INTO tab_dict_workingage VALUES ('3', '3-5年');
INSERT INTO tab_dict_workingage VALUES ('4', '5-10年');
INSERT INTO tab_dict_workingage VALUES ('5', '10-20年');
INSERT INTO tab_dict_workingage VALUES ('6', '20年以上');

-- ----------------------------
-- Table structure for `tab_disease_history`
-- ----------------------------
DROP TABLE IF EXISTS `tab_disease_history`;
CREATE TABLE `tab_disease_history` (
  `id` int(11) NOT NULL auto_increment,
  `diseaseName` varchar(100) default NULL COMMENT '疾病名称',
  `startDate` date default NULL COMMENT '开始时间',
  `endDate` date default NULL COMMENT '结束时间',
  `descInHospital` varchar(500) default NULL COMMENT '住院情况',
  `descObserve` varchar(500) default NULL COMMENT '转归情况',
  `memo` varchar(500) default NULL COMMENT '备注',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='疾病史';

-- ----------------------------
-- Records of tab_disease_history
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_doctor`
-- ----------------------------
DROP TABLE IF EXISTS `tab_doctor`;
CREATE TABLE `tab_doctor` (
  `doctorId` int(11) NOT NULL auto_increment,
  `doctorName` varchar(20) default NULL,
  `doctorGender` tinyint(4) default NULL,
  `doctorPhoto` varchar(150) default NULL,
  `doctorHospitalld` int(11) default NULL,
  `doctorDeptld` int(11) default NULL,
  `doctorTitle` varchar(100) default NULL,
  `doctorEducation` tinyint(4) default NULL,
  `doctorSkill` varchar(200) default NULL,
  `doctorDetailDescriptior` varchar(500) default NULL,
  PRIMARY KEY  (`doctorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_doctor
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_doctor_advice`
-- ----------------------------
DROP TABLE IF EXISTS `tab_doctor_advice`;
CREATE TABLE `tab_doctor_advice` (
  `id` int(11) NOT NULL auto_increment,
  `userId` int(11) default NULL,
  `adviceTypId` tinyint(4) default NULL,
  `adviceTime` datetime default NULL,
  `adviceContent` longtext,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_doctor_advice
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_doctor_advice_performace`
-- ----------------------------
DROP TABLE IF EXISTS `tab_doctor_advice_performace`;
CREATE TABLE `tab_doctor_advice_performace` (
  `id` int(12) NOT NULL auto_increment,
  `doctorAdviceId` int(12) default NULL,
  `doctorAdvicePerformace` varchar(500) default NULL,
  `recordTime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_doctor_advice_performace
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_genetic_disease`
-- ----------------------------
DROP TABLE IF EXISTS `tab_genetic_disease`;
CREATE TABLE `tab_genetic_disease` (
  `id` int(11) NOT NULL auto_increment,
  `userId` int(11) default NULL,
  `isHeartDisease` tinyint(4) default NULL,
  `isHypertension` tinyint(4) default NULL,
  `isHyperlipemia` tinyint(4) default NULL,
  `isDiabetesMellitus` tinyint(4) default NULL,
  `isCoronaryDisease` tinyint(4) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_genetic_disease
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_habbit`
-- ----------------------------
DROP TABLE IF EXISTS `tab_habbit`;
CREATE TABLE `tab_habbit` (
  `id` int(11) NOT NULL auto_increment,
  `userId` int(11) default NULL,
  `workType` tinyint(4) default NULL,
  `workPressure` tinyint(4) default NULL,
  `bloodType` tinyint(4) default NULL,
  `weight` tinyint(4) default NULL,
  `waist` tinyint(4) default NULL,
  `smokeType` tinyint(4) default NULL,
  `somkeFrequency` tinyint(4) default NULL,
  `drinkFrequency` tinyint(4) default NULL,
  `diinkType` tinyint(4) default NULL,
  `exerciseFrequency` tinyint(4) default NULL,
  `exerciseDuration` tinyint(4) default NULL,
  `sleepDuration` tinyint(4) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户生活习惯';

-- ----------------------------
-- Records of tab_habbit
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_hospital`
-- ----------------------------
DROP TABLE IF EXISTS `tab_hospital`;
CREATE TABLE `tab_hospital` (
  `hospitalId` int(11) NOT NULL auto_increment,
  `hospitalName` varchar(50) default NULL COMMENT '医院名称',
  `hospitalAddr` varchar(50) default NULL COMMENT '医院名称',
  PRIMARY KEY  (`hospitalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 医院';

-- ----------------------------
-- Records of tab_hospital
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_hospital_dept`
-- ----------------------------
DROP TABLE IF EXISTS `tab_hospital_dept`;
CREATE TABLE `tab_hospital_dept` (
  `deptId` int(11) NOT NULL auto_increment,
  `deptName` varchar(50) default NULL,
  PRIMARY KEY  (`deptId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 医院科室';

-- ----------------------------
-- Records of tab_hospital_dept
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_log4j`
-- ----------------------------
DROP TABLE IF EXISTS `tab_log4j`;
CREATE TABLE `tab_log4j` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT '自增ID',
  `class` varchar(255) default NULL COMMENT '类名',
  `stamp` varchar(255) default NULL COMMENT '时间',
  `thread` varchar(255) default NULL COMMENT '线程',
  `info_level` varchar(255) default NULL COMMENT '日志级别',
  `message` varchar(4000) default NULL COMMENT '日志信息',
  PRIMARY KEY  (`ID`),
  KEY `INDEX_LOG4J` (`stamp`,`info_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LOG4J日志记录表';

-- ----------------------------
-- Records of tab_log4j
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_msg`
-- ----------------------------
DROP TABLE IF EXISTS `tab_msg`;
CREATE TABLE `tab_msg` (
  `id` int(11) default NULL,
  `senderId` int(11) default NULL COMMENT '发送者',
  `receiverId` int(11) default NULL COMMENT '接收者',
  `sendTime` datetime default NULL COMMENT '发送时间',
  `status` tinyint(4) default NULL COMMENT '消息状态',
  `readTime` datetime default NULL COMMENT '阅读时间',
  `msg` varchar(300) default NULL COMMENT '消息内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户之间互动的消息';

-- ----------------------------
-- Records of tab_msg
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_nurser_score`
-- ----------------------------
DROP TABLE IF EXISTS `tab_nurser_score`;
CREATE TABLE `tab_nurser_score` (
  `id` int(11) NOT NULL auto_increment,
  `nurserId` int(11) default NULL,
  `userId` int(11) default NULL,
  `score1` tinyint(4) default NULL,
  `score2` tinyint(4) default NULL,
  `score3` tinyint(4) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_nurser_score
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_platform`
-- ----------------------------
DROP TABLE IF EXISTS `tab_platform`;
CREATE TABLE `tab_platform` (
  `id` tinyint(4) NOT NULL default '0' COMMENT '系统编号',
  `name` varchar(50) default NULL COMMENT '系统名称',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典 - 平台系统类型\r\n1：用户平台\r\n2：医护联';

-- ----------------------------
-- Records of tab_platform
-- ----------------------------
INSERT INTO tab_platform VALUES ('1', '用户平台');
INSERT INTO tab_platform VALUES ('2', '医护联系人平台');
INSERT INTO tab_platform VALUES ('3', '运营管理平台');

-- ----------------------------
-- Table structure for `tab_relative_phone`
-- ----------------------------
DROP TABLE IF EXISTS `tab_relative_phone`;
CREATE TABLE `tab_relative_phone` (
  `id` int(12) NOT NULL auto_increment,
  `userId` int(12) default NULL,
  `relativeName` varchar(20) default NULL,
  `relativeType` tinyint(4) default NULL,
  `relativeCellPhone` varchar(20) default NULL,
  `relativeTel` varchar(20) default NULL,
  `relativeAddr` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_relative_phone
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_service`
-- ----------------------------
DROP TABLE IF EXISTS `tab_service`;
CREATE TABLE `tab_service` (
  `id` int(12) NOT NULL auto_increment,
  `serviceType` int(1) default '1',
  `serviceName` varchar(50) default NULL,
  `serviceContent` varchar(500) default NULL,
  `serviceCreatorId` int(12) default NULL,
  `serviceCreateTime` datetime default NULL,
  `serviceStartDate` date default NULL,
  `serviceDuration` date default NULL,
  `serviceMemo` varchar(500) default NULL,
  `serviceIcon` varchar(150) default NULL COMMENT '服务的图标URL',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_service
-- ----------------------------
INSERT INTO tab_service VALUES ('2', '1', '33', '22', '1', '2015-03-03 14:45:44', '2015-03-03', '2015-03-27', '222', '0');
INSERT INTO tab_service VALUES ('3', '1', '2', '22', '1', '2015-03-03 14:45:44', '2015-03-03', '2015-03-03', '222', '0');
INSERT INTO tab_service VALUES ('4', '1', '2', '222<img src=\"/yhxt//upload/201503/20150303145102098_家具产品.png\" alt=\"\" />', '1', '2015-03-03 14:51:04', '2015-03-03', '2015-03-27', '222', '/upload/201503/20150303145054080_木制品.jpg');

-- ----------------------------
-- Table structure for `tab_service_doctor_relation`
-- ----------------------------
DROP TABLE IF EXISTS `tab_service_doctor_relation`;
CREATE TABLE `tab_service_doctor_relation` (
  `id` int(11) NOT NULL auto_increment,
  `serviceId` int(11) default NULL,
  `doctorId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_service_doctor_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_user`
-- ----------------------------
DROP TABLE IF EXISTS `tab_user`;
CREATE TABLE `tab_user` (
  `userId` int(12) NOT NULL auto_increment,
  `userName` varchar(30) default NULL,
  `userPass` varchar(32) default NULL,
  `userSysId` int(2) default NULL,
  `userParentId` int(12) default NULL,
  PRIMARY KEY  (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_user
-- ----------------------------
INSERT INTO tab_user VALUES ('1', 'wcl', '1234', '1', null);

-- ----------------------------
-- Table structure for `tab_userlogin_logs`
-- ----------------------------
DROP TABLE IF EXISTS `tab_userlogin_logs`;
CREATE TABLE `tab_userlogin_logs` (
  `ID` int(11) NOT NULL auto_increment COMMENT '自增ID',
  `USER_ID` int(11) default NULL COMMENT '用户ID',
  `IP` varchar(30) default NULL COMMENT '访问的IP地址',
  `OPER_FLAG` smallint(1) default '1' COMMENT '登录状态（1：登录，0退出）,默认为1',
  `STIME` datetime default NULL COMMENT '操作时间',
  PRIMARY KEY  (`ID`),
  KEY `INDEX_TAB_USERLOGIN_LOGS` (`USER_ID`,`OPER_FLAG`,`STIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录日志表';

-- ----------------------------
-- Records of tab_userlogin_logs
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_useroper_logs`
-- ----------------------------
DROP TABLE IF EXISTS `tab_useroper_logs`;
CREATE TABLE `tab_useroper_logs` (
  `ID` int(11) NOT NULL auto_increment COMMENT '自增ID',
  `USER_ID` int(11) default NULL COMMENT '用户ID',
  `IP` varchar(30) default NULL COMMENT '操作IP',
  `STIME` datetime default NULL COMMENT '操作时间',
  `OPER_FUN` varchar(100) default NULL COMMENT '操作功能',
  `OPER_MED` varchar(100) default NULL COMMENT '调用方法',
  `OPER_CLASS` varchar(200) default NULL COMMENT '调用类',
  `OPER_PARAM` longtext COMMENT '传入参数',
  PRIMARY KEY  (`ID`),
  KEY `INDEX_TAB_USEROPER_LOGS` (`USER_ID`,`STIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户操作日志';

-- ----------------------------
-- Records of tab_useroper_logs
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_user_bind_nurse_request`
-- ----------------------------
DROP TABLE IF EXISTS `tab_user_bind_nurse_request`;
CREATE TABLE `tab_user_bind_nurse_request` (
  `id` int(11) NOT NULL auto_increment,
  `userId` int(11) default NULL COMMENT '用户编号',
  `nurseId` int(11) default NULL COMMENT '医护联系人编号',
  `status` tinyint(4) default NULL COMMENT '请求状态',
  `requestTime` datetime default NULL COMMENT '请求时间',
  `responseTime` datetime default NULL COMMENT '回复时间',
  `memo` varchar(50) default NULL COMMENT '备注',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户签约医护联系人申请';

-- ----------------------------
-- Records of tab_user_bind_nurse_request
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_user_device`
-- ----------------------------
DROP TABLE IF EXISTS `tab_user_device`;
CREATE TABLE `tab_user_device` (
  `id` int(11) NOT NULL auto_increment,
  `userId` int(11) default NULL COMMENT '用户编号',
  `deviceId` int(11) default NULL COMMENT '设备编号',
  `buyTime` datetime default NULL COMMENT '购买时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户购买的设备';

-- ----------------------------
-- Records of tab_user_device
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_user_info`
-- ----------------------------
DROP TABLE IF EXISTS `tab_user_info`;
CREATE TABLE `tab_user_info` (
  `userId` int(12) NOT NULL default '0',
  `name` varchar(30) default NULL,
  `gender` tinyint(4) default NULL,
  `birthdate` date default NULL,
  `cellphone` varchar(11) default NULL,
  `email` varchar(40) default NULL,
  `credentialType` tinyint(4) default NULL,
  `credentialNo` varchar(50) default NULL,
  `isSoldier` tinyint(4) default NULL,
  `isDisablity` tinyint(4) default NULL,
  `height` tinyint(4) default NULL,
  `weight` tinyint(4) default NULL,
  `nationality` tinyint(4) default NULL,
  `nativePlace` varchar(80) default NULL,
  `marriageStatus` tinyint(4) default NULL,
  `householdType` tinyint(4) default NULL,
  `education` tinyint(4) default NULL,
  `policticsStatus` tinyint(4) default NULL,
  `homePhone` varchar(15) default NULL,
  `homeAddress` varchar(80) default NULL,
  `workingAge` tinyint(4) default NULL,
  `salary` tinyint(4) default NULL,
  `companyName` varchar(80) default NULL,
  `companyAddress` varchar(80) default NULL,
  `photo` varchar(150) default NULL,
  PRIMARY KEY  (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_user_info
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_user_nurse_relation`
-- ----------------------------
DROP TABLE IF EXISTS `tab_user_nurse_relation`;
CREATE TABLE `tab_user_nurse_relation` (
  `userId` int(11) default NULL,
  `nurseId` int(11) default NULL COMMENT '医护联系人编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与医护联系人关联';

-- ----------------------------
-- Records of tab_user_nurse_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_user_service`
-- ----------------------------
DROP TABLE IF EXISTS `tab_user_service`;
CREATE TABLE `tab_user_service` (
  `id` int(11) NOT NULL auto_increment COMMENT '购买时间',
  `userId` int(11) default NULL COMMENT '用户编号',
  `serviceId` int(11) default NULL COMMENT '服务编号',
  `buyTime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户已购买的服务';

-- ----------------------------
-- Records of tab_user_service
-- ----------------------------
