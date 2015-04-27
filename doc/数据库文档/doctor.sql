/*
Navicat MySQL Data Transfer

Source Server         : 2.19
Source Server Version : 50022
Source Host           : 192.168.2.19:3306
Source Database       : doctor

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2015-04-21 17:41:09
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
INSERT INTO tab_activity VALUES ('1', '2', '111', '1', '1', '2015-03-13 09:32:32', '2015-03-13', '2015-03-13', null, null);
INSERT INTO tab_activity VALUES ('2', '2', '2', '4<img src=\"/yhxt//upload/201503/20150313170913409_家具产品.png\" alt=\"\" />', '1', '2015-03-13 17:08:53', '2015-03-12', '2015-03-13', '3', null);
INSERT INTO tab_activity VALUES ('3', '2', '22', '23232', '1', '2015-03-13 18:25:50', '2015-03-18', '2015-03-27', '232', '/upload/201503/20150313183023149_家具简介.png');
INSERT INTO tab_activity VALUES ('4', '1', 'dfs', 'dfsdfsdf', '2', '2015-03-24 09:45:02', '2015-03-24', '2015-03-24', 'dfs', '');
INSERT INTO tab_activity VALUES ('6', '1', '国际老年产业博览会线上线下活动精彩纷呈', '<p style=\"padding: 0px; margin: 26px 0px; text-indent: 2em; color: rgb(37, 37, 37); font-family: 宋体, sans-serif; line-height: 28px;\"><span style=\"font-size:32px;\"></span></p><p class=\"detailPic\" style=\"margin: 0px auto 10px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: center; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px;\"><img alt=\"\" src=\"http://y2.ifengimg.com/cmpp/2015/04/02/17/9f9e0f7f-e9e1-4316-b7b8-6e0b7b214d63_size100_w550_h367.jpg\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto;\" /></p><p style=\"margin: 0px 0px 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px;\">4月2日，河北元航·第二届中国(河北)国际老年产业博览会新闻发布会召开。长城网 吕晓红 摄</p><p style=\"margin: 0px 0px 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px;\">长城网4月2日讯(记者 吕晓红)4月2日，河北元航·第二届中国(河北)国际老年产业博览会新闻发布会在河北省民政厅召开。记者从会上获悉，本届博览会采用线上线下相结合的方式，不仅活动丰富多彩，而且幸运礼品等优惠多多，惊喜连连。</p><p style=\"margin: 0px 0px 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px;\">据悉，此次博览会将于2015年5月10日至12日在石家庄市人民会堂举办，分为医疗康复、食药养生、养老福地、休闲养老、政策服务五大展区，200余家企业参展。</p><p style=\"margin: 0px 0px 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px;\">此次博览会在长城网专门设置了专题页，将老博会现场运用720°全景展示的方式让您身临其境在网上观展，同时还将举办老年产业发展论坛，聚焦老年产业、养老模式、老年文化发展等议题。</p><p style=\"padding: 0px; margin: 26px 0px; text-indent: 2em; color: rgb(37, 37, 37); font-family: 宋体, sans-serif; line-height: 28px;\"><span style=\"font-size:32px;\"></span></p>', '2', '2015-03-24 10:52:56', '2015-03-24', '2015-03-24', '323', '');

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
INSERT INTO tab_activity_doctor VALUES ('2', '4', '1');
INSERT INTO tab_activity_doctor VALUES ('3', '4', '2');
INSERT INTO tab_activity_doctor VALUES ('4', '5', '1');
INSERT INTO tab_activity_doctor VALUES ('5', '5', '2');
INSERT INTO tab_activity_doctor VALUES ('6', '6', '1');

-- ----------------------------
-- Table structure for `tab_blood_glucose`
-- ----------------------------
DROP TABLE IF EXISTS `tab_blood_glucose`;
CREATE TABLE `tab_blood_glucose` (
  `id` int(11) NOT NULL,
  `userId` int(11) default NULL COMMENT '用户编号',
  `bloodGlucose1` smallint(6) default NULL COMMENT '血糖值  空腹值=实际值*10',
  `bloodGlucose2` smallint(6) default '0' COMMENT '血糖值  饭后值=实际值*10',
  `takeTime` date default NULL COMMENT '测量时间',
  `takeTime1` datetime default NULL,
  `takeTime2` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='血糖测试记录表';

-- ----------------------------
-- Records of tab_blood_glucose
-- ----------------------------
INSERT INTO tab_blood_glucose VALUES ('1', '1', '10', '12', '2015-04-20', '2015-04-20 11:58:05', '2015-04-20 11:49:12');
INSERT INTO tab_blood_glucose VALUES ('2', '1', '14', '34', '2015-04-21', '2015-04-21 11:58:20', '2015-04-21 12:58:23');
INSERT INTO tab_blood_glucose VALUES ('3', '1', '21', '45', '2015-04-19', '2015-04-19 11:58:29', '2015-04-19 11:58:34');
INSERT INTO tab_blood_glucose VALUES ('4', '1', '24', '34', '2015-04-18', '2015-04-18 11:58:38', '2015-04-18 11:58:41');

-- ----------------------------
-- Table structure for `tab_comment`
-- ----------------------------
DROP TABLE IF EXISTS `tab_comment`;
CREATE TABLE `tab_comment` (
  `commentId` int(11) NOT NULL auto_increment COMMENT '帖子评论ID',
  `commentPostId` int(11) default NULL COMMENT '评论关联的帖子ID',
  `commentContent` varchar(1500) default NULL COMMENT '评论内容',
  `commentTime` datetime default NULL COMMENT '评论时间',
  `commentUserId` int(11) default NULL COMMENT '评论人编号',
  `commentUserName` varchar(255) default NULL COMMENT '用户账号（不是真实姓名）',
  PRIMARY KEY  (`commentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛帖子评论表';

-- ----------------------------
-- Records of tab_comment
-- ----------------------------
INSERT INTO tab_comment VALUES ('1', '1', 'cczxcxcxczx', '2015-04-21 09:38:08', '1', 'wcl');
INSERT INTO tab_comment VALUES ('2', '1', 'dsdfsdfsdfsfsffsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfs', '2015-04-21 09:38:32', '3', 'wfp');

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
INSERT INTO tab_device VALUES ('2', '1', '100001', 'BT01', '123456');
INSERT INTO tab_device VALUES ('3', '1', '100002', 'BT01', '123456');
INSERT INTO tab_device VALUES ('4', '2', '200001', 'BT02', '13913812345');
INSERT INTO tab_device VALUES ('5', '2', '200002', 'BT02', '13713812345');
INSERT INTO tab_device VALUES ('6', '3', '300001', 'BT03', '13113212345');
INSERT INTO tab_device VALUES ('7', '3', '300002', 'BT03', '13413512345');

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
INSERT INTO tab_dict_device_type VALUES ('1', '耳温计');
INSERT INTO tab_dict_device_type VALUES ('2', '血糖仪');
INSERT INTO tab_dict_device_type VALUES ('3', '血压仪');

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
INSERT INTO tab_dict_doctor_advice_type VALUES ('1', '1', '用药建议');
INSERT INTO tab_dict_doctor_advice_type VALUES ('2', '2', '饮食建议');
INSERT INTO tab_dict_doctor_advice_type VALUES ('3', '3', '运动建议');
INSERT INTO tab_dict_doctor_advice_type VALUES ('4', '4', '就诊建议');

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
-- Table structure for `tab_dict_food`
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_food`;
CREATE TABLE `tab_dict_food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foodName` varchar(50) DEFAULT NULL COMMENT '食品名称',
  `caloriePerHundredGram` smallint(6) DEFAULT NULL COMMENT '每百克的卡路里',
  `foodType` int(11) DEFAULT NULL COMMENT '食品类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='饮食食品选项';

-- ----------------------------
-- Table structure for `tab_dict_food_type`
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_food_type`;
CREATE TABLE `tab_dict_food_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '食品类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='食品类型';

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
INSERT INTO tab_dict_nationality VALUES ('1', '汉族');

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
INSERT INTO tab_dict_politicsstatus VALUES ('1', '中共党员');
INSERT INTO tab_dict_politicsstatus VALUES ('2', '共青团员');
INSERT INTO tab_dict_politicsstatus VALUES ('3', '民主党派成员');
INSERT INTO tab_dict_politicsstatus VALUES ('4', '群众');

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
-- Table structure for `tab_dict_sport_item`
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_sport_item`;
CREATE TABLE `tab_dict_sport_item` (
  `id` int(11) NOT NULL COMMENT '自增id',
  `sportName` varchar(20) DEFAULT NULL COMMENT '运动名称',
  `caloriePerMinute` smallint(6) DEFAULT NULL COMMENT '每分钟消耗的卡路里',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运动项目字典表';

-- ----------------------------
-- Table structure for `tab_dict_ver`
-- ----------------------------
DROP TABLE IF EXISTS `tab_dict_ver`;
CREATE TABLE `tab_dict_ver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag` int(11) DEFAULT NULL COMMENT '字典版本  1：运动项目  2：饮食食品项目 ...',
  `version` datetime DEFAULT NULL COMMENT '版本日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='基础数据版本标识';

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
  `userId` int(12) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='疾病史';

-- ----------------------------
-- Records of tab_disease_history
-- ----------------------------
INSERT INTO tab_disease_history VALUES ('2', '24444', '2015-03-09', '2015-03-10', '344', '4', '5', '1');
INSERT INTO tab_disease_history VALUES ('4', '44', '2015-03-10', '2015-03-10', '4', '4', '5', '1');
INSERT INTO tab_disease_history VALUES ('5', '121212', '2015-03-18', '2015-03-19', '121', '2123', '333', '1');
INSERT INTO tab_disease_history VALUES ('6', '33', '2015-03-18', '2015-03-20', '33', '23', '232', '1');
INSERT INTO tab_disease_history VALUES ('7', 'eweww', '2015-03-19', '2015-03-21', 'wewwww', 'weww', 'qqwwww', '3');

-- ----------------------------
-- Table structure for `tab_doctor`
-- ----------------------------
DROP TABLE IF EXISTS `tab_doctor`;
CREATE TABLE `tab_doctor` (
  `doctorId` int(11) NOT NULL auto_increment,
  `doctorName` varchar(20) default NULL,
  `doctorGender` tinyint(4) default NULL,
  `doctorPhoto` varchar(150) default NULL,
  `doctorHospitalId` int(11) default NULL,
  `doctorDeptId` int(11) default NULL,
  `doctorTitle` varchar(100) default NULL,
  `doctorEducation` tinyint(4) default NULL,
  `doctorSkill` varchar(200) default NULL,
  `doctorDetailDescription` varchar(500) default NULL,
  `doctorTeachingTitle` varchar(200) default NULL,
  PRIMARY KEY  (`doctorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_doctor
-- ----------------------------
INSERT INTO tab_doctor VALUES ('1', '王若光', '1', null, '1', '1', '主任医师', '1', '多囊卵巢综合征、月经失调、不孕不育、盆腔炎、功能性子宫出血、卵巢早衰、子宫内膜异位症、子宫内膜息肉、妇科炎症、子宫...', null, null);
INSERT INTO tab_doctor VALUES ('2', '李小小', '2', '/upload/201504/20150402220029709_0a97b82b12e9b19bace2ba81bd2d8d73.jpg', '2', '1', '主任医师', '3', '122', '森', '教授');
INSERT INTO tab_doctor VALUES ('3', '杨过', '1', '', '2', '1', '主任医师', '1', '大运村', '夺要', '教授');

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
INSERT INTO tab_doctor_advice VALUES ('1', '1', '1', '2015-03-05 22:51:31', '11111');
INSERT INTO tab_doctor_advice VALUES ('2', '1', '2', '2015-03-04 22:51:42', '222222');
INSERT INTO tab_doctor_advice VALUES ('4', '3', '4', '2015-03-18 05:43:05', 'rtrtree22rtrtree22rtrtree22rtrtree22rtrtree22rtrtree22rtrtree22rtrtree22rtrtree22rtrtree22rtrtree22');

-- ----------------------------
-- Table structure for `tab_doctor_advice_performace`
-- ----------------------------
DROP TABLE IF EXISTS `tab_doctor_advice_performace`;
CREATE TABLE `tab_doctor_advice_performace` (
  `id` int(12) NOT NULL auto_increment,
  `doctorAdviceId` int(12) default NULL,
  `doctorAdvicePerformace` varchar(500) default NULL,
  `recordTime` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_doctor_advice_performace` (`doctorAdviceId`,`recordTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_doctor_advice_performace
-- ----------------------------
INSERT INTO tab_doctor_advice_performace VALUES ('1', '1', '2222', '2015-03-04 22:59:31');
INSERT INTO tab_doctor_advice_performace VALUES ('2', '1', '2212121', '2015-03-05 22:59:42');
INSERT INTO tab_doctor_advice_performace VALUES ('3', '2', '21212121212', '2015-03-03 23:34:46');
INSERT INTO tab_doctor_advice_performace VALUES ('4', '1', '333333333333333333333', '2015-03-02 23:34:58');

-- ----------------------------
-- Table structure for `tab_ear_thermometer`
-- ----------------------------
DROP TABLE IF EXISTS `tab_ear_thermometer`;
CREATE TABLE `tab_ear_thermometer` (
  `id` int(11) NOT NULL,
  `userId` int(11) default NULL COMMENT '用户编号',
  `temperature` smallint(11) default NULL COMMENT '耳温  实际值*10， 378表示37.8°',
  `takeTime` datetime default NULL COMMENT '测温时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='耳温测量记录';

-- ----------------------------
-- Records of tab_ear_thermometer
-- ----------------------------

-- ----------------------------
-- Table structure for `tab_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `tab_feedback`;
CREATE TABLE `tab_feedback` (
  `id` int(11) NOT NULL auto_increment COMMENT '反馈表自增ID',
  `feedbackType` tinyint(255) default '0' COMMENT '反馈类型  0：网站建设反馈  1：服务反馈',
  `feedbackContent` varchar(500) default '' COMMENT '反馈内容',
  `feedbackUserId` int(11) default '0' COMMENT '反馈用户编号',
  `feedbackTime` datetime default NULL COMMENT '反馈时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_feedback
-- ----------------------------
INSERT INTO tab_feedback VALUES ('1', '0', 'dfsdfsd', '1', '2015-04-07 18:04:57');
INSERT INTO tab_feedback VALUES ('2', '0', 'dfsfsdfsdfsdfsdfsdfsdfs', '1', '2015-04-07 18:06:16');
INSERT INTO tab_feedback VALUES ('3', '0', 'fgdgdfgdfgdfgdfgdfg', '2', '2015-04-07 18:10:40');
INSERT INTO tab_feedback VALUES ('4', '1', 'dfsdfsdfsdfs', '2', '2015-04-07 18:10:58');
INSERT INTO tab_feedback VALUES ('5', '1', 'dfdfsdfsdfsdf', '1', '2015-04-07 19:07:14');

-- ----------------------------
-- Table structure for `tab_food_record`
-- ----------------------------
DROP TABLE IF EXISTS `tab_food_record`;
CREATE TABLE `tab_food_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL COMMENT '用户编号',
  `foodItem` int(11) DEFAULT NULL COMMENT '食品项目',
  `amount` smallint(6) DEFAULT NULL COMMENT '食量',
  `mealFlag` tinyint(4) DEFAULT NULL COMMENT '餐别  1：早餐  2：中餐  3：晚餐  4：加餐',
  `mealTime` datetime DEFAULT NULL COMMENT '用餐时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='饮食记录';

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
INSERT INTO tab_genetic_disease VALUES ('1', '1', '1', '1', '1', '2', '1');
INSERT INTO tab_genetic_disease VALUES ('2', '3', '1', '-1', '-1', '-1', '-1');

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
  `smokeFrequency` tinyint(4) default NULL,
  `drinkFrequency` tinyint(4) default NULL,
  `drinkType` tinyint(4) default NULL,
  `exerciseFrequency` tinyint(4) default NULL,
  `exerciseDuration` tinyint(4) default NULL,
  `sleepDuration` tinyint(4) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户生活习惯';

-- ----------------------------
-- Records of tab_habbit
-- ----------------------------
INSERT INTO tab_habbit VALUES ('2', '1', '2', '2', '2', '2', '2', '2', '2', '2', '2', '3', '6', '4');
INSERT INTO tab_habbit VALUES ('3', '3', '1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1');

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
INSERT INTO tab_hospital VALUES ('1', '南京市第一医院', '光华路一号');
INSERT INTO tab_hospital VALUES ('2', '军区部院', '白下路');

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
INSERT INTO tab_hospital_dept VALUES ('1', '妇科');

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
-- Table structure for `tab_mental_record`
-- ----------------------------
DROP TABLE IF EXISTS `tab_mental_record`;
CREATE TABLE `tab_mental_record` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL COMMENT '用户编号',
  `mentalStatus` tinyint(4) DEFAULT NULL COMMENT '心理状态  1：开心 2：平静 3：沮丧  4：烦躁',
  `recordTime` datetime DEFAULT NULL COMMENT '记录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户心理状态记录';

-- ----------------------------
-- Table structure for `tab_msg`
-- ----------------------------
DROP TABLE IF EXISTS `tab_msg`;
CREATE TABLE `tab_msg` (
  `id` int(11) NOT NULL auto_increment,
  `senderId` int(11) default NULL COMMENT '发送者',
  `receiverId` int(11) default NULL COMMENT '接收者',
  `sendTime` datetime default NULL COMMENT '发送时间',
  `status` tinyint(4) default NULL COMMENT '消息状态',
  `readTime` datetime default NULL COMMENT '阅读时间',
  `msg` varchar(300) default NULL COMMENT '消息内容',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户之间互动的消息';

-- ----------------------------
-- Records of tab_msg
-- ----------------------------
INSERT INTO tab_msg VALUES ('1', '2', '1', '2015-03-19 09:59:17', '1', '2015-03-20 05:08:24', '212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121');
INSERT INTO tab_msg VALUES ('2', '1', '2', '2015-03-19 11:49:04', '1', '2015-04-04 15:49:25', '22323232');
INSERT INTO tab_msg VALUES ('3', '1', '2', '2015-03-19 11:59:24', '1', '2015-03-24 19:07:32', 'dfsdfsd');
INSERT INTO tab_msg VALUES ('4', '1', '2', '2015-03-19 12:00:32', '1', '2015-03-31 23:53:06', 'dfsdfsd');
INSERT INTO tab_msg VALUES ('5', '1', '2', '2015-03-19 12:01:14', '1', '2015-03-24 18:13:00', 'dfsdfsdfsd');
INSERT INTO tab_msg VALUES ('6', '1', '2', '2015-03-20 05:50:40', '1', '2015-03-24 18:11:39', '212121');
INSERT INTO tab_msg VALUES ('7', '1', '2', '2015-03-20 05:50:44', '1', '2015-03-24 13:56:40', '21212121');
INSERT INTO tab_msg VALUES ('8', '1', '2', '2015-03-20 05:59:17', '1', '2015-03-23 18:31:45', 'dfdfs');
INSERT INTO tab_msg VALUES ('9', '1', '2', '2015-03-20 06:01:44', '1', '2015-03-23 18:21:55', 'w22w2');
INSERT INTO tab_msg VALUES ('10', '1', '2', '2015-03-21 14:52:39', '1', '2015-03-23 18:20:43', '323232');
INSERT INTO tab_msg VALUES ('11', '1', '2', null, '1', '2015-03-23 18:35:09', '333');
INSERT INTO tab_msg VALUES ('12', '2', '1', '2015-03-23 14:12:45', '0', null, '2232323');
INSERT INTO tab_msg VALUES ('13', '2', '0', '2015-03-23 18:36:13', '0', null, '12121');
INSERT INTO tab_msg VALUES ('14', '1', '2', null, '1', '2015-04-04 15:51:22', 'fsdfsdfsdfsdfsdf');
INSERT INTO tab_msg VALUES ('15', '1', '2', null, '1', '2015-04-04 15:52:21', 'dddd');
INSERT INTO tab_msg VALUES ('16', '1', '2', null, '1', '2015-04-02 21:14:14', 'ddfdfd');
INSERT INTO tab_msg VALUES ('17', '1', '2', '2015-03-24 09:53:45', '1', '2015-03-24 17:52:17', 'fsdfsdfs');
INSERT INTO tab_msg VALUES ('18', '2', '1', '2015-03-24 13:56:46', '0', null, 'efwfewwfwfwefwfwefwefwefwefwefwefwefe');
INSERT INTO tab_msg VALUES ('19', '2', '1', '2015-03-24 13:57:02', '0', null, 'ddfddss');
INSERT INTO tab_msg VALUES ('20', '2', '1', '2015-03-24 13:58:03', '0', null, 'dsfsdfsdfsdfsdf444444444');
INSERT INTO tab_msg VALUES ('21', '2', '1', '2015-03-24 18:13:12', '0', null, '21212121212121212121323234343443434343434343434343434343');
INSERT INTO tab_msg VALUES ('22', '3', '2', '2015-04-02 18:30:34', '1', '2015-04-02 21:14:03', '何时回家');
INSERT INTO tab_msg VALUES ('23', '2', '1', '2015-04-02 21:14:20', '0', null, 'ad');

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
  `stime` datetime default NULL COMMENT '点评时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_nurser_score
-- ----------------------------
INSERT INTO tab_nurser_score VALUES ('1', '2', '1', '3', '4', null, null);
INSERT INTO tab_nurser_score VALUES ('2', '2', '1', '1', '0', '0', null);
INSERT INTO tab_nurser_score VALUES ('3', '2', '1', '1', '0', '0', null);
INSERT INTO tab_nurser_score VALUES ('4', '2', '1', '3', '0', '0', null);
INSERT INTO tab_nurser_score VALUES ('5', '2', '1', '3', '0', '0', null);
INSERT INTO tab_nurser_score VALUES ('6', '2', '1', '5', '0', '0', null);
INSERT INTO tab_nurser_score VALUES ('7', '2', '1', '5', '0', '0', null);
INSERT INTO tab_nurser_score VALUES ('8', '2', '1', '4', '0', '0', null);
INSERT INTO tab_nurser_score VALUES ('9', '2', '1', '5', '0', '0', null);
INSERT INTO tab_nurser_score VALUES ('10', '2', '1', '5', '0', '0', null);
INSERT INTO tab_nurser_score VALUES ('11', '2', '1', '0', '0', '0', '2015-03-24 15:21:18');
INSERT INTO tab_nurser_score VALUES ('12', '2', '1', '5', '0', '0', '2015-04-03 15:00:24');

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
-- Table structure for `tab_post`
-- ----------------------------
DROP TABLE IF EXISTS `tab_post`;
CREATE TABLE `tab_post` (
  `postId` int(11) NOT NULL auto_increment COMMENT '论坛帖子自增编号',
  `postTitle` varchar(255) default NULL COMMENT '帖子标题 限长255字节',
  `postContent` mediumtext COMMENT '帖子内容  html格式  限长16777215 字节',
  `postTime` datetime default NULL COMMENT '发帖时间',
  `postUserId` int(11) default NULL COMMENT '发帖人编号',
  `postUserName` varchar(255) default NULL COMMENT '发帖人账号（不是真实姓名）',
  PRIMARY KEY  (`postId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛帖子基本表';

-- ----------------------------
-- Records of tab_post
-- ----------------------------
INSERT INTO tab_post VALUES ('1', 'aa', 'adfafs', '2015-04-09 21:29:24', '1', '');

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
INSERT INTO tab_relative_phone VALUES ('1', '1', '张智', '1', '13913823453', '87655361', '杭州市西湖区某某路45号花园小区');
INSERT INTO tab_relative_phone VALUES ('2', '1', '张睿', '1', '13813923876', '83174848', '杭州市西湖区某某路45号花园小区');
INSERT INTO tab_relative_phone VALUES ('5', '1', '李小龙', '3', '13770727896', '333', '444');

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
INSERT INTO tab_service VALUES ('2', '2', '推拿按摩', '<p>专业人士为您推拿按摩，活经通络。</p><p>联系电话：<strong><span style=\"font-size:32px;color:#009900;\">13498897886</span></strong></p>', '1', '2015-03-03 14:45:44', '2015-03-03', '2016-04-01', '', '/upload/201503/20150316220953930_家具down.png');
INSERT INTO tab_service VALUES ('4', '2', '棋牌交友', '<p>这里有众多志趣相投的棋友、牌友等待您的加入，相互切磋技艺。</p><p><br /></p><p>报名热线：13918312345</p><p>联系人：王女士</p>', '1', '2015-03-03 14:51:04', '2015-03-03', '2015-03-27', '222', '/upload/201503/20150303145054080_木制品.jpg');
INSERT INTO tab_service VALUES ('7', '1', '足底按摩', '<p><span style=\"font-size:48px;\">正宗扬州足疗师傅精心为您服务。</span></p><p><span style=\"font-size:48px;\"><br /></span></p><p><span style=\"font-size:48px;\">联系电话：13913858588</span></p><p><span style=\"font-size:48px;\">联系人：张先生</span></p>', '2', '2015-03-24 10:47:57', '2015-03-24', '2015-03-24', '大运村', '');
INSERT INTO tab_service VALUES ('8', '3', 'aa', 'fasfsafasfd', '2', '2015-04-01 09:23:38', '2015-04-01', '2015-05-01', 'aa', '');
INSERT INTO tab_service VALUES ('9', '1', '家庭保洁', '<span style=\"font-size:48px;\">工作时间 9-11，14-17</span>', '2', '2015-04-02 21:35:31', '2015-04-01', '2015-04-30', '', '');
INSERT INTO tab_service VALUES ('10', '2', 'testa', 'adfafaf', '2', '2015-04-03 12:25:05', '2015-04-08', '2015-04-30', '', '');
INSERT INTO tab_service VALUES ('11', '1', 'aabb', '<span style=\"font-size:32px;\">afdsafafadsfdsa</span>', '0', '2015-04-07 13:55:42', '2015-04-07', '2015-04-08', 'aa', '0');

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
INSERT INTO tab_service_doctor_relation VALUES ('2', '5', '1');
INSERT INTO tab_service_doctor_relation VALUES ('7', '6', '1');
INSERT INTO tab_service_doctor_relation VALUES ('8', '6', '2');
INSERT INTO tab_service_doctor_relation VALUES ('9', '7', '2');
INSERT INTO tab_service_doctor_relation VALUES ('10', '8', '1');
INSERT INTO tab_service_doctor_relation VALUES ('11', '8', '2');

-- ----------------------------
-- Table structure for `tab_sport_record`
-- ----------------------------
DROP TABLE IF EXISTS `tab_sport_record`;
CREATE TABLE `tab_sport_record` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL COMMENT '用户编号',
  `sportItemId` int(11) DEFAULT NULL COMMENT '运动项目',
  `sportDuration` smallint(6) DEFAULT NULL COMMENT '运动时长',
  `sportTime` datetime DEFAULT NULL COMMENT '运动时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运动记录';

-- ----------------------------
-- Table structure for `tab_user`
-- ----------------------------
DROP TABLE IF EXISTS `tab_user`;
CREATE TABLE `tab_user` (
  `userId` int(12) NOT NULL auto_increment,
  `userName` varchar(30) default NULL,
  `userPass` varchar(32) default NULL,
  `userSysId` int(2) default NULL,
  `isChild` tinyint(4) default '0' COMMENT '是否子女帐户 1:是 其他:不是',
  `userParentId` int(12) default NULL,
  `name` varchar(30) default NULL,
  `gender` tinyint(4) default NULL,
  `birthdate` date default NULL,
  `cellphone` varchar(11) default NULL,
  `email` varchar(40) default NULL,
  `credentialType` tinyint(4) default NULL,
  `credentialNo` varchar(50) default NULL,
  `isSoldier` tinyint(4) default NULL,
  `isDisablity` tinyint(4) default NULL,
  `height` int(4) default NULL,
  `weight` int(4) default NULL,
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
  `achievement` varchar(500) default NULL COMMENT '工作成就',
  `spouseName` varchar(250) default NULL COMMENT '配偶姓名',
  `spousePhone` varchar(250) default NULL COMMENT '配偶手机',
  PRIMARY KEY  (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tab_user
-- ----------------------------
INSERT INTO tab_user VALUES ('1', 'wcl', '1234', '1', '0', '0', '张瑞明', '1', '1950-03-01', '13817639238', null, '0', null, '0', '0', '175', '70', '0', null, '0', '0', '0', '0', '87518483', '杭州市西湖区某某路12号花园小区', '0', '0', null, null, '/upload/201504/20150402182723507_qq_v01.gif', null, null, null);
INSERT INTO tab_user VALUES ('2', 'wangcl', '1234', '2', '0', '0', '叶慧娴', '2', '1965-03-04', '212121', null, '-1', '', '0', '0', '162', '50', '-1', '', '-1', '-1', '-1', '-1', '87472829', '杭州市余杭区光明路45号阳光小区', '-1', '-1', '', '', '/upload/201504/20150402213322411_0a97b82b12e9b19bace2ba81bd2d8d73.jpg', '', '', '');
INSERT INTO tab_user VALUES ('3', 'wfp', '1234', '1', '0', null, '李峰', '1', '1997-03-13', '212', '222333', '1', '12333', '0', '0', '0', '0', '-1', '', '-1', '-1', '-1', '-1', '', '', null, null, null, null, '', null, null, null);
INSERT INTO tab_user VALUES ('5', 'abc', '567890', '1', '0', '0', '', '1', '1899-12-31', '', null, '0', null, '0', '0', '0', '0', '0', null, '0', '0', '0', '0', '', '', '0', '0', null, null, '0', null, null, null);

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
INSERT INTO tab_user_bind_nurse_request VALUES ('1', '3', '1', '1', '2015-03-13 10:02:00', null, '2121');
INSERT INTO tab_user_bind_nurse_request VALUES ('2', '1', '2', '1', '2015-03-22 06:28:16', null, '');
INSERT INTO tab_user_bind_nurse_request VALUES ('3', '4', '2', '1', '2015-04-12 22:29:10', null, 'hello');
INSERT INTO tab_user_bind_nurse_request VALUES ('4', '5', '2', '2', '2015-04-12 22:31:47', null, 'adfa');

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
INSERT INTO tab_user_device VALUES ('6', '1', '2', '2015-03-08 11:00:40');
INSERT INTO tab_user_device VALUES ('7', '1', '3', '2015-03-30 11:13:35');

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
INSERT INTO tab_user_nurse_relation VALUES ('3', '2');
INSERT INTO tab_user_nurse_relation VALUES ('2', '1');
INSERT INTO tab_user_nurse_relation VALUES ('1', '2');
INSERT INTO tab_user_nurse_relation VALUES ('4', '2');

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
INSERT INTO tab_user_service VALUES ('1', '1', '4', '2015-03-08 11:03:46');
INSERT INTO tab_user_service VALUES ('2', '1', '2', '2015-03-08 11:03:52');
INSERT INTO tab_user_service VALUES ('3', '1', '0', '2015-03-08 23:12:54');
INSERT INTO tab_user_service VALUES ('4', '1', '0', '2015-03-08 23:13:35');
INSERT INTO tab_user_service VALUES ('5', '1', '10', '2015-04-03 14:20:46');
INSERT INTO tab_user_service VALUES ('6', '1', '8', '2015-04-03 14:57:13');
INSERT INTO tab_user_service VALUES ('7', '1', '9', '2015-04-03 16:04:42');
INSERT INTO tab_user_service VALUES ('8', '1', '7', '2015-04-03 17:10:46');
