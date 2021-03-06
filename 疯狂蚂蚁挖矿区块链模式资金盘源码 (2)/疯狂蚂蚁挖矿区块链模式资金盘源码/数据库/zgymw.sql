/*
Navicat MySQL Data Transfer

Source Server         : zgymw.com
Source Server Version : 50529
Source Host           : 127.0.0.1:3306
Source Database       : zgymw

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2020-01-13 15:17:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `uid` char(10) NOT NULL COMMENT '账户编号',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '账户类型，0：未认证，1：普通',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '账户状态，1：正常，0：冻结',
  `username` char(11) NOT NULL COMMENT '登录账号',
  `password` char(32) NOT NULL COMMENT '登录密码',
  `safeword` char(32) DEFAULT NULL COMMENT '安全密码',
  `authen` tinyint(4) NOT NULL DEFAULT '0' COMMENT '账户状态，1：通过，0：未认证，2：审核中，3：被拒绝',
  `inviter` char(11) DEFAULT NULL COMMENT '邀请人',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `registerip` varchar(50) DEFAULT NULL,
  `loginip` varchar(50) DEFAULT NULL,
  `qiandao` int(11) DEFAULT NULL,
  `jiefeng` tinyint(1) DEFAULT '0',
  `qnum` int(11) DEFAULT '0',
  `buynums` decimal(30,12) DEFAULT '0.000000000000',
  `buyaward` tinyint(1) DEFAULT '0',
  `nolimit` tinyint(1) NOT NULL DEFAULT '0',
  `buydate` int(11) NOT NULL DEFAULT '1554048000',
  `qiandao1` int(11) DEFAULT NULL,
  `qnum1` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `inviter` (`inviter`),
  KEY `update_at` (`update_at`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='账户';

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'K343243', '1', '1', '18888888888', 'e67b36ddd09a671967939cfe2b0255cf', 'e67b36ddd09a671967939cfe2b0255cf', '1', '', '2019-04-15 23:11:44', '2019-04-17 14:14:04', '', '', '1555435535', '0', '1', '0.000000000000', '0', '0', '1554048000', '1555434248', '1');
INSERT INTO `account` VALUES ('2', 'I960431', '0', '1', '13588967304', 'a6c2c793278fc3b92631558ca8bcf146', 'a6c2c793278fc3b92631558ca8bcf146', '1', '18888888888', '2019-04-17 01:51:33', '2019-04-17 01:53:42', '', '221.225.202.28', '1555437222', '0', '1', '0.000000000000', '0', '0', '1554048000', '1555437215', '1');
INSERT INTO `account` VALUES ('3', 'V921410', '0', '1', '15821899104', '3472469e8b9872d68ed318536b39e588', '3472469e8b9872d68ed318536b39e588', '1', '18888888888', '2019-04-17 03:05:51', '2020-01-13 15:12:20', '', '90.0.2.168', '1578899540', '0', '1', '0.000000000000', '0', '0', '1554048000', '1578899534', '1');
INSERT INTO `account` VALUES ('4', 'I301535', '0', '1', '18005151538', 'cd7f7cacd4fc2f9074a68380bb7107b8', 'e67b36ddd09a671967939cfe2b0255cf', '1', '18888888888', '2019-06-23 14:03:43', '2019-11-24 20:28:21', '', '39.190.244.132', '0', '0', '0', '0.000000000000', '0', '0', '1554048000', '0', '0');

-- ----------------------------
-- Table structure for account_audit
-- ----------------------------
DROP TABLE IF EXISTS `account_audit`;
CREATE TABLE `account_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：未通过，1：已通过',
  `username` char(11) NOT NULL COMMENT '登录账号',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `status` (`status`),
  KEY `create_at` (`create_at`),
  KEY `update_at` (`update_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='账户审核';

-- ----------------------------
-- Records of account_audit
-- ----------------------------

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排列顺序',
  `top` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `type` tinyint(4) DEFAULT NULL COMMENT '文章类型，1：新闻，8：帮助',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `image` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `content` text NOT NULL COMMENT '内容',
  `date` timestamp NULL DEFAULT NULL COMMENT '显示的时间',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文章';

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '0', '0', '1', '资源来自中国源码网', null, '<p>资源来自www.zgymw.com<br/></p>', '2019-11-16 12:12:12', '2019-11-15 23:42:38', '2019-11-24 20:23:50');
INSERT INTO `article` VALUES ('2', '0', '0', '8', '帮助文档', null, '<p>资源来自www-zgymw-com<br/></p>', '2019-11-15 23:46:34', '2019-11-15 23:46:34', '2020-01-13 14:52:51');

-- ----------------------------
-- Table structure for clock
-- ----------------------------
DROP TABLE IF EXISTS `clock`;
CREATE TABLE `clock` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `username` char(11) NOT NULL COMMENT '用户账号',
  `mid` char(10) NOT NULL COMMENT '矿机编号',
  `money` decimal(30,12) DEFAULT '0.000000000000' COMMENT '本次收益',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `mid` (`mid`),
  KEY `date` (`create_at`),
  KEY `m_m` (`mid`,`money`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='打卡表';

-- ----------------------------
-- Records of clock
-- ----------------------------
INSERT INTO `clock` VALUES ('1', '18888888888', 'T3484419', '0.020833340000', '2019-04-16 23:45:36');
INSERT INTO `clock` VALUES ('2', '18888888888', 'G8079594', '0.020833340000', '2019-04-16 23:45:36');
INSERT INTO `clock` VALUES ('3', '18888888888', 'G8307315', '0.020833340000', '2019-04-16 23:45:36');
INSERT INTO `clock` VALUES ('4', '18888888888', 'T3484419', '0.010416670000', '2019-04-17 00:47:54');
INSERT INTO `clock` VALUES ('5', '18888888888', 'G8079594', '0.010416670000', '2019-04-17 00:47:54');
INSERT INTO `clock` VALUES ('6', '18888888888', 'G8307315', '0.010416670000', '2019-04-17 00:47:54');
INSERT INTO `clock` VALUES ('7', '18888888888', 'T3484419', '0.010416670000', '2019-04-17 01:55:58');
INSERT INTO `clock` VALUES ('8', '18888888888', 'G8079594', '0.010416670000', '2019-04-17 01:55:58');
INSERT INTO `clock` VALUES ('9', '18888888888', 'G8307315', '0.010416670000', '2019-04-17 01:55:58');
INSERT INTO `clock` VALUES ('10', '18888888888', 'T3484419', '0.010416670000', '2019-04-17 03:03:07');
INSERT INTO `clock` VALUES ('11', '18888888888', 'G8079594', '0.010416670000', '2019-04-17 03:03:07');
INSERT INTO `clock` VALUES ('12', '18888888888', 'G8307315', '0.010416670000', '2019-04-17 03:03:07');
INSERT INTO `clock` VALUES ('13', '13588967304', 'E7195721', '0.010416670000', '2019-04-17 03:07:14');
INSERT INTO `clock` VALUES ('14', '13588967304', 'V7783772', '0.010416670000', '2019-04-17 03:07:14');
INSERT INTO `clock` VALUES ('15', '13588967304', 'X8757517', '0.010416670000', '2019-04-17 03:07:14');
INSERT INTO `clock` VALUES ('16', '13588967304', 'I8706072', '0.010416670000', '2019-04-17 03:07:14');
INSERT INTO `clock` VALUES ('17', '13588967304', 'Y6857185', '0.010416670000', '2019-04-17 03:07:14');
INSERT INTO `clock` VALUES ('18', '13588967304', 'W6218911', '0.033333330000', '2019-04-17 03:07:14');
INSERT INTO `clock` VALUES ('19', '18888888888', 'A4807733', '0.118055560000', '2019-04-17 05:03:32');
INSERT INTO `clock` VALUES ('20', '18888888888', 'T3484419', '0.020833340000', '2019-04-17 05:03:32');
INSERT INTO `clock` VALUES ('21', '18888888888', 'G8079594', '0.020833340000', '2019-04-17 05:03:32');
INSERT INTO `clock` VALUES ('22', '18888888888', 'G8307315', '0.020833340000', '2019-04-17 05:03:32');
INSERT INTO `clock` VALUES ('23', '18888888888', 'A4807733', '0.944444480000', '2019-04-17 12:22:33');
INSERT INTO `clock` VALUES ('24', '18888888888', 'T3484419', '0.083333360000', '2019-04-17 12:22:33');
INSERT INTO `clock` VALUES ('25', '18888888888', 'G8079594', '0.083333360000', '2019-04-17 12:22:33');
INSERT INTO `clock` VALUES ('26', '18888888888', 'G8307315', '0.083333360000', '2019-04-17 12:22:33');
INSERT INTO `clock` VALUES ('27', '18888888888', 'A4807733', '0.118055560000', '2019-04-17 14:00:52');
INSERT INTO `clock` VALUES ('28', '18888888888', 'T3484419', '0.010416670000', '2019-04-17 14:00:52');
INSERT INTO `clock` VALUES ('29', '18888888888', 'G8079594', '0.010416670000', '2019-04-17 14:00:52');
INSERT INTO `clock` VALUES ('30', '18888888888', 'G8307315', '0.010416670000', '2019-04-17 14:00:52');
INSERT INTO `clock` VALUES ('31', '13588967304', 'E7195721', '0.114583370000', '2019-04-17 14:04:21');
INSERT INTO `clock` VALUES ('32', '13588967304', 'V7783772', '0.114583370000', '2019-04-17 14:04:21');
INSERT INTO `clock` VALUES ('33', '13588967304', 'X8757517', '0.114583370000', '2019-04-17 14:04:21');
INSERT INTO `clock` VALUES ('34', '13588967304', 'I8706072', '0.114583370000', '2019-04-17 14:04:21');
INSERT INTO `clock` VALUES ('35', '13588967304', 'Y6857185', '0.114583370000', '2019-04-17 14:04:21');
INSERT INTO `clock` VALUES ('36', '13588967304', 'W6218911', '0.366666630000', '2019-04-17 14:04:21');
INSERT INTO `clock` VALUES ('37', '15821899104', 'Z2098211', '0.114583370000', '2019-04-17 14:07:10');
INSERT INTO `clock` VALUES ('38', '15821899104', 'W1237836', '0.114583370000', '2019-04-17 14:07:10');
INSERT INTO `clock` VALUES ('39', '15821899104', 'F5526054', '0.114583370000', '2019-04-17 14:07:10');
INSERT INTO `clock` VALUES ('40', '15821899104', 'L5632162', '0.114583370000', '2019-04-17 14:07:10');
INSERT INTO `clock` VALUES ('41', '15821899104', 'E4074306', '0.114583370000', '2019-04-17 14:07:10');
INSERT INTO `clock` VALUES ('42', '15821899104', 'X9825201', '0.366666630000', '2019-04-17 14:07:10');
INSERT INTO `clock` VALUES ('43', '15821899104', 'Z2098211', '0.010416670000', '2019-04-17 16:02:04');
INSERT INTO `clock` VALUES ('44', '15821899104', 'W1237836', '0.010416670000', '2019-04-17 16:02:04');
INSERT INTO `clock` VALUES ('45', '15821899104', 'F5526054', '0.010416670000', '2019-04-17 16:02:04');
INSERT INTO `clock` VALUES ('46', '15821899104', 'L5632162', '0.010416670000', '2019-04-17 16:02:04');
INSERT INTO `clock` VALUES ('47', '15821899104', 'E4074306', '0.010416670000', '2019-04-17 16:02:04');
INSERT INTO `clock` VALUES ('48', '15821899104', 'X9825201', '0.033333330000', '2019-04-17 16:02:04');
INSERT INTO `clock` VALUES ('49', '13588967304', 'E7195721', '0.062500020000', '2019-04-17 20:07:25');
INSERT INTO `clock` VALUES ('50', '13588967304', 'V7783772', '0.062500020000', '2019-04-17 20:07:25');
INSERT INTO `clock` VALUES ('51', '13588967304', 'X8757517', '0.062500020000', '2019-04-17 20:07:25');
INSERT INTO `clock` VALUES ('52', '13588967304', 'I8706072', '0.062500020000', '2019-04-17 20:07:25');
INSERT INTO `clock` VALUES ('53', '13588967304', 'Y6857185', '0.062500020000', '2019-04-17 20:07:25');
INSERT INTO `clock` VALUES ('54', '13588967304', 'W6218911', '0.199999980000', '2019-04-17 20:07:25');
INSERT INTO `clock` VALUES ('55', '18888888888', 'K8400398', '0.266666640000', '2019-04-17 22:23:58');
INSERT INTO `clock` VALUES ('56', '18888888888', 'A4807733', '1.062500040000', '2019-04-17 22:23:58');
INSERT INTO `clock` VALUES ('57', '18888888888', 'T3484419', '0.093750030000', '2019-04-17 22:23:58');
INSERT INTO `clock` VALUES ('58', '18888888888', 'G8079594', '0.093750030000', '2019-04-17 22:23:58');
INSERT INTO `clock` VALUES ('59', '18888888888', 'G8307315', '0.093750030000', '2019-04-17 22:23:58');
INSERT INTO `clock` VALUES ('60', '15821899104', 'Z2098211', '14.874999960000', '2019-11-15 23:39:32');
INSERT INTO `clock` VALUES ('61', '15821899104', 'W1237836', '14.874999960000', '2019-11-15 23:39:32');
INSERT INTO `clock` VALUES ('62', '15821899104', 'F5526054', '14.874999960000', '2019-11-15 23:39:32');
INSERT INTO `clock` VALUES ('63', '15821899104', 'L5632162', '14.874999960000', '2019-11-15 23:39:32');
INSERT INTO `clock` VALUES ('64', '15821899104', 'E4074306', '14.874999960000', '2019-11-15 23:39:32');
INSERT INTO `clock` VALUES ('65', '15821899104', 'X9825201', '47.600000040000', '2019-11-15 23:39:32');

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:字符，2:数值，3:布尔，4:文件，5:json，6:数组',
  `parent` int(11) DEFAULT '0' COMMENT '上级编号',
  `token` varchar(50) NOT NULL COMMENT '唯一标志',
  `name` varchar(30) NOT NULL COMMENT '配置名称',
  `value` text COMMENT '配置的数据',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='配置';

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', '5', '0', 'hello.popup', 'hello.popup', '{\"switch\":true,\"content\":\"<p>\\u8d44\\u6e90\\u6765\\u81ea\\u4e2d\\u56fd\\u6e90\\u7801\\u7f51www.zgymw.com\\uff0c\\u8bf7\\u52ff\\u76d7\\u7528\\u6f14\\u793a\\u7ad9\\u3002<br\\/><\\/p>\",\"date\":\"2019-11-15 23:47:09\"}', '2019-03-08 23:21:19', '2019-11-15 23:47:09');

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排列顺序',
  `visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可见，1：可见，0：隐藏',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，1：空闲，2：有主，3：瓜分',
  `agent` char(11) DEFAULT NULL COMMENT '代理商',
  `owner` char(11) DEFAULT NULL COMMENT '归属人',
  `catalog` tinyint(4) NOT NULL DEFAULT '1' COMMENT '项目分类',
  `title` varchar(50) NOT NULL COMMENT '合约名称',
  `image` varchar(100) NOT NULL COMMENT '合约图片',
  `content` text COMMENT '合约介绍',
  `base_price` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '基础价格',
  `now_price` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '当前价格',
  `inc` decimal(30,12) NOT NULL DEFAULT '1.000000000000' COMMENT '增幅比例',
  `charge` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '手续费比例',
  `loop` int(11) NOT NULL DEFAULT '1' COMMENT '当前第几轮',
  `profit` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '每秒收益',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `agent` (`agent`),
  KEY `owner` (`owner`),
  KEY `create_at` (`create_at`),
  KEY `update_at` (`update_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='合约';

-- ----------------------------
-- Records of contract
-- ----------------------------

-- ----------------------------
-- Table structure for contract_log
-- ----------------------------
DROP TABLE IF EXISTS `contract_log`;
CREATE TABLE `contract_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `cid` int(11) NOT NULL COMMENT '具体合约的编号',
  `username` char(11) NOT NULL COMMENT '用户账号',
  `action` tinyint(4) NOT NULL DEFAULT '1' COMMENT '动作类型，很重要',
  `loop` int(11) NOT NULL DEFAULT '0' COMMENT '当前操作是在第几轮执行的',
  `money` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '本次操作花的钱，或是赚的钱',
  `charge` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '本次操作的手续费',
  `target` char(11) DEFAULT NULL COMMENT '转让对象的账号',
  `ratio` float NOT NULL DEFAULT '0' COMMENT '涨跌比例',
  `remark` text COMMENT '备注信息',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `username` (`username`),
  KEY `loop` (`loop`),
  KEY `action` (`action`),
  KEY `target` (`target`),
  KEY `ratio` (`ratio`),
  KEY `create_at` (`create_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='合约记录';

-- ----------------------------
-- Records of contract_log
-- ----------------------------

-- ----------------------------
-- Table structure for contract_percent
-- ----------------------------
DROP TABLE IF EXISTS `contract_percent`;
CREATE TABLE `contract_percent` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `cid` int(11) NOT NULL COMMENT '具体合约的编号',
  `username` char(11) NOT NULL COMMENT '用户账号',
  `loop` int(11) NOT NULL DEFAULT '1' COMMENT '哪一轮买入的',
  `ratio` float NOT NULL DEFAULT '0' COMMENT '所占比例',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cid_username_loop` (`cid`,`username`,`loop`),
  KEY `cid` (`cid`),
  KEY `username` (`username`),
  KEY `loop` (`loop`),
  KEY `ratio` (`ratio`),
  KEY `create_at` (`create_at`),
  KEY `update_at` (`update_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='合约比例';

-- ----------------------------
-- Records of contract_percent
-- ----------------------------

-- ----------------------------
-- Table structure for dashboard
-- ----------------------------
DROP TABLE IF EXISTS `dashboard`;
CREATE TABLE `dashboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `username` char(11) NOT NULL COMMENT '用户账户',
  `power` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '个人算力（包含个人、矿机、团队等所有）',
  `team_power` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '团队算力',
  `team_count` int(11) NOT NULL DEFAULT '0' COMMENT '团队总人数',
  `authen` int(11) NOT NULL DEFAULT '0' COMMENT '实名认证人数',
  `machine_count` int(11) NOT NULL DEFAULT '0' COMMENT '矿机数量',
  `machine_power` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '矿机算力',
  `machine_expire` int(11) NOT NULL DEFAULT '0' COMMENT '过期矿机数量',
  `one` int(11) NOT NULL DEFAULT '0' COMMENT '1代数量',
  `two` int(11) NOT NULL DEFAULT '0' COMMENT '2代数量',
  `three` int(11) NOT NULL DEFAULT '0' COMMENT '3代数量',
  `four` int(11) NOT NULL DEFAULT '0' COMMENT '4代数量',
  `five` int(11) NOT NULL DEFAULT '0' COMMENT '5代数量',
  `six` int(11) NOT NULL DEFAULT '0' COMMENT '6代数量',
  `seven` int(11) NOT NULL DEFAULT '0' COMMENT '7代数量',
  `eight` int(11) NOT NULL DEFAULT '0' COMMENT '8代数量',
  `lv0` int(11) NOT NULL DEFAULT '0' COMMENT '未认证用户数量',
  `lv1` int(11) NOT NULL DEFAULT '0' COMMENT '1级用户数量',
  `lv2` int(11) NOT NULL DEFAULT '0' COMMENT '2级用户数量',
  `lv3` int(11) NOT NULL DEFAULT '0' COMMENT '3级用户数量',
  `lv4` int(11) NOT NULL DEFAULT '0' COMMENT '4级用户数量',
  `lv5` int(11) NOT NULL DEFAULT '0' COMMENT '5级用户数量',
  `lv6` int(11) NOT NULL DEFAULT '0' COMMENT '6级用户数量',
  `lv7` int(11) NOT NULL DEFAULT '0' COMMENT '7级用户数量',
  `lv8` int(11) NOT NULL DEFAULT '0' COMMENT '8级用户数量',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='仪表盘';

-- ----------------------------
-- Records of dashboard
-- ----------------------------
INSERT INTO `dashboard` VALUES ('1', '18888888888', '16.000000000000', '0.000000000000', '3', '0', '5', '16.000000000000', '0', '3', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '2019-04-15 23:11:44', '2019-06-23 14:03:43');
INSERT INTO `dashboard` VALUES ('2', '13588967304', '8.000000000000', '0.000000000000', '0', '0', '6', '8.000000000000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2019-04-17 01:51:33', '2019-04-17 01:51:33');
INSERT INTO `dashboard` VALUES ('3', '15821899104', '8.000000000000', '0.000000000000', '0', '0', '6', '8.000000000000', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2019-04-17 03:05:51', '2019-11-15 23:39:32');
INSERT INTO `dashboard` VALUES ('4', '18005151538', '3.000000000000', '0.000000000000', '0', '0', '3', '3.000000000000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2019-06-23 14:03:43', '2019-06-23 14:03:43');

-- ----------------------------
-- Table structure for event_log
-- ----------------------------
DROP TABLE IF EXISTS `event_log`;
CREATE TABLE `event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `username` char(11) NOT NULL COMMENT '用户账号',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型，1：刮刮卡',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，0：待提货，1：已发货，2：待发货',
  `hit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否中奖，0：没有，1：中奖',
  `reward` int(11) NOT NULL DEFAULT '0' COMMENT '中的具体奖品的编号',
  `reward_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '奖品类型，1：矿机，2：实物，3：话费',
  `receive` text COMMENT '收货地址信息',
  `send` text COMMENT '发货信息',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `type` (`type`),
  KEY `status` (`status`),
  KEY `hit` (`hit`),
  KEY `reward` (`reward`),
  KEY `reward_type` (`reward_type`),
  KEY `create_at` (`create_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动记录';

-- ----------------------------
-- Records of event_log
-- ----------------------------

-- ----------------------------
-- Table structure for funding
-- ----------------------------
DROP TABLE IF EXISTS `funding`;
CREATE TABLE `funding` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排列顺序',
  `visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可见，1：可见，0：隐藏',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型，1：普通项目，8：官方项目',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，1：进行中，2：审核中，3：已结束',
  `currency` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1：可用资金，8：RMB',
  `owner` char(11) DEFAULT NULL COMMENT '项目归属人',
  `catalog` tinyint(4) NOT NULL DEFAULT '1' COMMENT '项目分类',
  `title` varchar(50) NOT NULL COMMENT '项目名称',
  `image` varchar(100) NOT NULL COMMENT '项目图片',
  `content` text COMMENT '项目介绍',
  `target` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '目标金额',
  `current` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '当前金额',
  `people` int(11) NOT NULL DEFAULT '0' COMMENT '参与人数',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '参与次数',
  `expire_at` timestamp NULL DEFAULT NULL COMMENT '到期时间',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`),
  KEY `visible` (`visible`),
  KEY `type` (`type`),
  KEY `status` (`status`),
  KEY `owner` (`owner`),
  KEY `catalog` (`catalog`),
  KEY `title` (`title`),
  KEY `people` (`people`),
  KEY `count` (`count`),
  KEY `create_at` (`create_at`),
  KEY `update_at` (`update_at`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='众筹';

-- ----------------------------
-- Records of funding
-- ----------------------------
INSERT INTO `funding` VALUES ('1', '0', '1', '8', '1', '1', '', '1', '内排中心', '201902154c250140abb44943ebac37fca39edacb.png', '<p>阿萨德</p>', '100000.000000000000', '0.000000000000', '0', '0', '2019-03-02 16:35:47', '2019-02-15 16:35:47', '2019-02-16 00:44:08');

-- ----------------------------
-- Table structure for funding_audit
-- ----------------------------
DROP TABLE IF EXISTS `funding_audit`;
CREATE TABLE `funding_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `fid` int(11) NOT NULL COMMENT '项目编号',
  `username` char(11) DEFAULT NULL COMMENT '用户账号',
  `money` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '投资金额',
  `price` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '手续费',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `status` tinyint(1) DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fid` (`fid`),
  KEY `username` (`username`),
  KEY `money` (`money`),
  KEY `create_at` (`create_at`),
  KEY `update_at` (`update_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内排审核';

-- ----------------------------
-- Records of funding_audit
-- ----------------------------

-- ----------------------------
-- Table structure for funding_log
-- ----------------------------
DROP TABLE IF EXISTS `funding_log`;
CREATE TABLE `funding_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `fid` int(11) NOT NULL COMMENT '项目编号',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型，1：普通项目，8：官方项目',
  `currency` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1：可用资金，8：RMB',
  `action` tinyint(4) NOT NULL DEFAULT '1' COMMENT '操作类型，1：投资，8：结束',
  `username` char(11) DEFAULT NULL COMMENT '用户账号',
  `money` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '投资金额',
  `charge` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '手续费',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `fid` (`fid`),
  KEY `type` (`type`),
  KEY `action` (`action`),
  KEY `username` (`username`),
  KEY `money` (`money`),
  KEY `create_at` (`create_at`),
  KEY `update_at` (`update_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='众筹记录';

-- ----------------------------
-- Records of funding_log
-- ----------------------------

-- ----------------------------
-- Table structure for global_bonus
-- ----------------------------
DROP TABLE IF EXISTS `global_bonus`;
CREATE TABLE `global_bonus` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `date` date NOT NULL COMMENT '具体日期',
  `charge` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '本次手续费',
  `rate` text NOT NULL COMMENT '各级别的比例配置',
  `people` int(11) NOT NULL DEFAULT '0' COMMENT '总发放人数',
  `money` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '总发放金额',
  `lv0` text COMMENT 'lv0的情况',
  `lv1` text COMMENT 'lv1的情况',
  `lv2` text COMMENT 'lv2的情况',
  `lv3` text COMMENT 'lv3的情况',
  `lv4` text COMMENT 'lv4的情况',
  `lv5` text COMMENT 'lv5的情况',
  `lv6` text COMMENT 'lv6的情况',
  `lv7` text COMMENT 'lv7的情况',
  `lv8` text COMMENT 'lv8的情况',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='全球分红';

-- ----------------------------
-- Records of global_bonus
-- ----------------------------

-- ----------------------------
-- Table structure for imtoken
-- ----------------------------
DROP TABLE IF EXISTS `imtoken`;
CREATE TABLE `imtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `tid` char(10) NOT NULL COMMENT '订单编号',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1充值，2提现',
  `status` tinyint(4) NOT NULL DEFAULT '2' COMMENT '1成功，2待审核，0失败',
  `username` char(11) NOT NULL COMMENT '自己的账号',
  `number` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '数量',
  `charge` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '手续费',
  `address` varchar(100) DEFAULT NULL COMMENT '我的钱包地址',
  `qrcode` varchar(100) DEFAULT NULL COMMENT '我的钱包二维码',
  `certificate` text COMMENT '凭证，图片列表',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tid` (`tid`),
  KEY `type` (`type`),
  KEY `status` (`status`),
  KEY `username` (`username`),
  KEY `create_at` (`create_at`),
  KEY `update_at` (`update_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='imtoken';

-- ----------------------------
-- Records of imtoken
-- ----------------------------

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `username` char(11) NOT NULL COMMENT '用户账号',
  `type` tinyint(4) NOT NULL COMMENT '类型',
  `text` text COMMENT '描述',
  `ip` char(20) DEFAULT NULL COMMENT 'IP地址',
  `ua` text COMMENT 'UserAgent',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `type` (`type`),
  KEY `ip` (`ip`),
  KEY `create_at` (`create_at`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', '18888888888', '2', '', '42.185.176.91', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '2019-04-15 23:11:44');
INSERT INTO `log` VALUES ('2', '18888888888', '3', '', '117.136.67.177', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/2G Language/zh_CN', '2019-04-15 23:17:50');
INSERT INTO `log` VALUES ('3', '18888888888', '3', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X; zh-CN) AppleWebKit/537.51.1 (KHTML, like Gecko) Mobile/16D57 UCBrowser/12.3.8.1154 Mobile  AliApp(TUnionSDK/0.1.20.3)', '2019-04-16 00:11:01');
INSERT INTO `log` VALUES ('4', '18888888888', '3', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-16 21:07:17');
INSERT INTO `log` VALUES ('5', '18888888888', '61', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-16 21:13:02');
INSERT INTO `log` VALUES ('6', '18888888888', '61', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-16 21:13:41');
INSERT INTO `log` VALUES ('7', '18888888888', '3', '', '111.29.70.238', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16B92 AliApp(QN/7.0.50)  QNIOS/201200@tbsellerworkbench_iphone_1.0.0 WindVane/8.5.0 1242x2208', '2019-04-16 21:17:31');
INSERT INTO `log` VALUES ('8', '18888888888', '3', '', '42.185.176.91', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '2019-04-16 21:17:37');
INSERT INTO `log` VALUES ('9', '18888888888', '9', '', '42.185.176.91', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '2019-04-16 21:40:04');
INSERT INTO `log` VALUES ('10', '18888888888', '3', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/2G Language/zh_CN', '2019-04-16 23:45:05');
INSERT INTO `log` VALUES ('11', '18888888888', '31', '0.06250002', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-16 23:45:36');
INSERT INTO `log` VALUES ('12', '18888888888', '3', '', '221.225.151.129', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X; zh-CN) AppleWebKit/537.51.1 (KHTML, like Gecko) Mobile/16D57 UCBrowser/12.3.8.1154 Mobile  AliApp(TUnionSDK/0.1.20.3)', '2019-04-17 00:16:21');
INSERT INTO `log` VALUES ('13', '18888888888', '31', '0.03125001', '111.29.70.238', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1', '2019-04-17 00:47:54');
INSERT INTO `log` VALUES ('14', '18888888888', '3', '', '221.225.151.129', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 01:27:36');
INSERT INTO `log` VALUES ('15', '18888888888', '9', '', '42.185.176.91', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '2019-04-17 01:32:38');
INSERT INTO `log` VALUES ('16', '18888888888', '9', '', '221.225.151.129', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 01:41:47');
INSERT INTO `log` VALUES ('17', '18888888888', '3', '', '221.225.151.129', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 01:49:19');
INSERT INTO `log` VALUES ('18', '13588967304', '1', '来自于推荐人Array', '221.225.151.129', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 QQ/8.0.0.472 V1_IPH_SQ_8.0.0_1_APP_A Pixel/1242 Core/UIWebView Device/Apple(iPhone XS Max) NetType/WIFI QBWebViewType/1', '2019-04-17 01:51:33');
INSERT INTO `log` VALUES ('19', '13588967304', '3', '', '221.225.151.129', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 QQ/8.0.0.472 V1_IPH_SQ_8.0.0_1_APP_A Pixel/1242 Core/UIWebView Device/Apple(iPhone XS Max) NetType/WIFI QBWebViewType/1', '2019-04-17 01:51:43');
INSERT INTO `log` VALUES ('20', '18888888888', '31', '0.03125001', '221.225.151.129', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 01:55:58');
INSERT INTO `log` VALUES ('21', '18888888888', '31', '0.03125001', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 03:03:07');
INSERT INTO `log` VALUES ('22', '15821899104', '1', '来自于推荐人Array', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16A366 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 03:05:51');
INSERT INTO `log` VALUES ('23', '15821899104', '3', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16A366 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 03:06:04');
INSERT INTO `log` VALUES ('24', '18888888888', '9', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 03:07:04');
INSERT INTO `log` VALUES ('25', '13588967304', '3', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 03:07:12');
INSERT INTO `log` VALUES ('26', '13588967304', '31', '0.08541668', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 03:07:14');
INSERT INTO `log` VALUES ('27', '13588967304', '9', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 03:09:14');
INSERT INTO `log` VALUES ('28', '13588967304', '3', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 03:09:22');
INSERT INTO `log` VALUES ('29', '13588967304', '9', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 03:09:26');
INSERT INTO `log` VALUES ('30', '18888888888', '3', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 03:09:35');
INSERT INTO `log` VALUES ('31', '18888888888', '9', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 03:15:12');
INSERT INTO `log` VALUES ('32', '18888888888', '3', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 03:15:23');
INSERT INTO `log` VALUES ('33', '18888888888', '31', '0.18055558', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X; zh-CN) AppleWebKit/537.51.1 (KHTML, like Gecko) Mobile/16D57 UCBrowser/12.3.8.1154 Mobile  AliApp(TUnionSDK/0.1.20.3)', '2019-04-17 05:03:32');
INSERT INTO `log` VALUES ('34', '18888888888', '31', '1.19444456', '111.29.71.244', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1', '2019-04-17 12:22:33');
INSERT INTO `log` VALUES ('35', '18888888888', '3', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 14:00:50');
INSERT INTO `log` VALUES ('36', '18888888888', '31', '0.14930557', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 14:00:52');
INSERT INTO `log` VALUES ('37', '18888888888', '9', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 14:04:07');
INSERT INTO `log` VALUES ('38', '13588967304', '3', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 14:04:20');
INSERT INTO `log` VALUES ('39', '13588967304', '31', '0.93958348', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 14:04:21');
INSERT INTO `log` VALUES ('40', '13588967304', '9', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 14:06:56');
INSERT INTO `log` VALUES ('41', '15821899104', '3', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 14:07:09');
INSERT INTO `log` VALUES ('42', '15821899104', '31', '0.93958348', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 14:07:10');
INSERT INTO `log` VALUES ('43', '15821899104', '11', '原可用：0.000000000000，现可用：1000，原冻结：0.000000000000，现冻结：0，原积分：0.000000000000，现积分：0，原冻结积分：0.000000000000，现冻结积分：0', '221.225.202.28', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '2019-04-17 14:30:27');
INSERT INTO `log` VALUES ('44', '15821899104', '11', '原可用：1000.000000000000，现可用：1000，原冻结：0.000000000000，现冻结：0，原积分：0.000000000000，现积分：1000，原冻结积分：0.000000000000，现冻结积分：0', '221.225.202.28', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '2019-04-17 14:30:38');
INSERT INTO `log` VALUES ('45', '15821899104', '31', '0.08541668', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 16:02:04');
INSERT INTO `log` VALUES ('46', '13588967304', '3', '', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 20:07:04');
INSERT INTO `log` VALUES ('47', '13588967304', '31', '0.51250008', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 20:07:25');
INSERT INTO `log` VALUES ('48', '18888888888', '31', '1.61041677', '111.29.71.244', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1', '2019-04-17 22:23:58');
INSERT INTO `log` VALUES ('49', '18005151538', '1', '来自于推荐人Array', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1', '2019-06-23 14:03:43');
INSERT INTO `log` VALUES ('50', '18005151538', '3', '', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1', '2019-06-23 14:04:10');
INSERT INTO `log` VALUES ('51', '18005151538', '3', '', '39.190.244.132', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '2019-08-18 20:45:55');
INSERT INTO `log` VALUES ('52', '15821899104', '13', '登录密码：15821899104，安全密码：15821899104', '36.22.239.40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko/20100101 Firefox/70.0', '2019-11-15 23:39:20');
INSERT INTO `log` VALUES ('53', '15821899104', '3', null, '36.22.239.40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko/20100101 Firefox/70.0', '2019-11-15 23:39:29');
INSERT INTO `log` VALUES ('54', '15821899104', '31', '121.97499984', '36.22.239.40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko/20100101 Firefox/70.0', '2019-11-15 23:39:32');
INSERT INTO `log` VALUES ('55', '15821899104', '3', null, '36.22.239.40', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) CriOS/56.0.2924.75 Mobile/14E5239e Safari/602.1', '2019-11-15 23:39:52');
INSERT INTO `log` VALUES ('56', '18005151538', '12', null, '36.22.239.40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:70.0) Gecko/20100101 Firefox/70.0', '2019-11-15 23:50:46');
INSERT INTO `log` VALUES ('57', '15821899104', '10', '{\"nickname\":\"\\u8da3\\u6a21\\u677f\\u6e90\\u7801\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '2019-11-24 20:24:24');
INSERT INTO `log` VALUES ('58', '15821899104', '13', '登录密码：15821899104，安全密码：15821899104', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '2019-11-24 20:25:08');
INSERT INTO `log` VALUES ('59', '15821899104', '3', null, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) CriOS/56.0.2924.75 Mobile/14E5239e Safari/602.1', '2019-11-24 20:25:19');
INSERT INTO `log` VALUES ('60', '18005151538', '12', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '2019-11-24 20:28:21');
INSERT INTO `log` VALUES ('61', '15821899104', '12', null, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '2019-11-24 20:29:35');
INSERT INTO `log` VALUES ('62', '15821899104', '3', null, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) CriOS/56.0.2924.75 Mobile/14E5239e Safari/602.1', '2019-11-24 20:29:43');
INSERT INTO `log` VALUES ('63', '15821899104', '10', '{\"wechat\":\"76891828\",\"qq\":\"76891828\"}', '90.0.2.168', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36', '2020-01-13 14:54:18');
INSERT INTO `log` VALUES ('64', '15821899104', '13', '登录密码：zgymwcom，安全密码：zgymwcom', '90.0.2.168', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36', '2020-01-13 14:58:51');
INSERT INTO `log` VALUES ('65', '15821899104', '3', null, '90.0.2.168', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36', '2020-01-13 15:03:57');
INSERT INTO `log` VALUES ('66', '15821899104', '3', null, '90.0.2.168', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '2020-01-13 15:07:31');
INSERT INTO `log` VALUES ('67', '15821899104', '3', null, '90.0.2.168', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '2020-01-13 15:09:35');

-- ----------------------------
-- Table structure for machine
-- ----------------------------
DROP TABLE IF EXISTS `machine`;
CREATE TABLE `machine` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `mid` char(10) NOT NULL COMMENT '矿机编号',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态，1：正常，0：停止',
  `source` tinyint(4) DEFAULT '1' COMMENT '来源，1：购买，2：赠送',
  `username` char(11) NOT NULL COMMENT '用户账号',
  `product` int(11) NOT NULL COMMENT '产品编号',
  `divide` tinyint(4) DEFAULT '0' COMMENT '级别，0：仅自己收益，1：1级也能获益，2：2级也能获益，以此类推',
  `name` varchar(30) NOT NULL COMMENT '产品名称',
  `cycle` int(11) NOT NULL COMMENT '周期，单位小时',
  `income` decimal(30,12) NOT NULL COMMENT '预计收益',
  `power` decimal(30,12) NOT NULL COMMENT '算力，hash/h',
  `price` decimal(30,12) NOT NULL COMMENT '价格',
  `profit` decimal(30,12) DEFAULT '0.000000000000' COMMENT '累计收益',
  `count` int(11) DEFAULT '0' COMMENT '收矿次数',
  `profit_at` timestamp NULL DEFAULT NULL COMMENT '上次收矿时间',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `username` (`username`),
  KEY `product` (`product`),
  KEY `p_id` (`profit_at`,`id`),
  KEY `p_m` (`product`,`mid`),
  KEY `m_p` (`mid`,`product`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='矿机表';

-- ----------------------------
-- Records of machine
-- ----------------------------
INSERT INTO `machine` VALUES ('1', 'T3484419', '1', '2', '18888888888', '1', '5', 'Lv1蚁后', '1440', '15.000000000000', '1.000000000000', '10.000000000000', '0.260416750000', '8', '2019-04-17 22:23:58', '2019-04-16 21:12:52', '2019-04-17 22:23:58');
INSERT INTO `machine` VALUES ('2', 'G8079594', '1', '2', '18888888888', '1', '5', 'Lv1蚁后', '1440', '15.000000000000', '1.000000000000', '10.000000000000', '0.260416750000', '8', '2019-04-17 22:23:58', '2019-04-16 21:12:52', '2019-04-17 22:23:58');
INSERT INTO `machine` VALUES ('3', 'G8307315', '1', '2', '18888888888', '1', '5', 'Lv1蚁后', '1440', '15.000000000000', '1.000000000000', '10.000000000000', '0.260416750000', '8', '2019-04-17 22:23:58', '2019-04-16 21:12:52', '2019-04-17 22:23:58');
INSERT INTO `machine` VALUES ('4', 'E7195721', '1', '2', '13588967304', '1', '5', 'Lv1蚁后', '1440', '15.000000000000', '1.000000000000', '10.000000000000', '0.187500060000', '3', '2019-04-17 20:07:25', '2019-04-17 01:51:33', '2019-04-17 20:07:25');
INSERT INTO `machine` VALUES ('5', 'V7783772', '1', '2', '13588967304', '1', '5', 'Lv1蚁后', '1440', '15.000000000000', '1.000000000000', '10.000000000000', '0.187500060000', '3', '2019-04-17 20:07:25', '2019-04-17 01:51:33', '2019-04-17 20:07:25');
INSERT INTO `machine` VALUES ('6', 'X8757517', '1', '2', '13588967304', '1', '5', 'Lv1蚁后', '1440', '15.000000000000', '1.000000000000', '10.000000000000', '0.187500060000', '3', '2019-04-17 20:07:25', '2019-04-17 01:51:33', '2019-04-17 20:07:25');
INSERT INTO `machine` VALUES ('7', 'I8706072', '1', '2', '13588967304', '1', '5', 'Lv1蚁后', '1440', '15.000000000000', '1.000000000000', '10.000000000000', '0.187500060000', '3', '2019-04-17 20:07:25', '2019-04-17 01:51:33', '2019-04-17 20:07:25');
INSERT INTO `machine` VALUES ('8', 'Y6857185', '1', '2', '13588967304', '1', '5', 'Lv1蚁后', '1440', '15.000000000000', '1.000000000000', '10.000000000000', '0.187500060000', '3', '2019-04-17 20:07:25', '2019-04-17 01:51:33', '2019-04-17 20:07:25');
INSERT INTO `machine` VALUES ('9', 'W6218911', '1', '2', '13588967304', '2', '5', 'Lv2蚁后', '1440', '48.000000000000', '3.000000000000', '30.000000000000', '0.599999940000', '3', '2019-04-17 20:07:25', '2019-04-17 01:51:33', '2019-04-17 20:07:25');
INSERT INTO `machine` VALUES ('10', 'Z2098211', '1', '2', '15821899104', '1', '5', 'Lv1蚁后', '1440', '15.000000000000', '1.000000000000', '10.000000000000', '15.000000000000', '3', '2019-11-15 23:39:32', '2019-04-17 03:05:51', '2019-11-15 23:39:32');
INSERT INTO `machine` VALUES ('11', 'W1237836', '1', '2', '15821899104', '1', '5', 'Lv1蚁后', '1440', '15.000000000000', '1.000000000000', '10.000000000000', '15.000000000000', '3', '2019-11-15 23:39:32', '2019-04-17 03:05:51', '2019-11-15 23:39:32');
INSERT INTO `machine` VALUES ('12', 'F5526054', '1', '2', '15821899104', '1', '5', 'Lv1蚁后', '1440', '15.000000000000', '1.000000000000', '10.000000000000', '15.000000000000', '3', '2019-11-15 23:39:32', '2019-04-17 03:05:51', '2019-11-15 23:39:32');
INSERT INTO `machine` VALUES ('13', 'L5632162', '1', '2', '15821899104', '1', '5', 'Lv1蚁后', '1440', '15.000000000000', '1.000000000000', '10.000000000000', '15.000000000000', '3', '2019-11-15 23:39:32', '2019-04-17 03:05:51', '2019-11-15 23:39:32');
INSERT INTO `machine` VALUES ('14', 'E4074306', '1', '2', '15821899104', '1', '5', 'Lv1蚁后', '1440', '15.000000000000', '1.000000000000', '10.000000000000', '15.000000000000', '3', '2019-11-15 23:39:32', '2019-04-17 03:05:51', '2019-11-15 23:39:32');
INSERT INTO `machine` VALUES ('15', 'X9825201', '1', '2', '15821899104', '2', '5', 'Lv2蚁后', '1440', '48.000000000000', '3.000000000000', '30.000000000000', '48.000000000000', '3', '2019-11-15 23:39:32', '2019-04-17 03:05:51', '2019-11-15 23:39:32');
INSERT INTO `machine` VALUES ('16', 'A4807733', '1', '2', '18888888888', '3', '5', 'Lv3蚁后', '1440', '170.000000000000', '10.000000000000', '100.000000000000', '2.243055640000', '4', '2019-04-17 22:23:58', '2019-04-17 03:14:15', '2019-04-17 22:23:58');
INSERT INTO `machine` VALUES ('17', 'K8400398', '1', '2', '18888888888', '2', '5', 'Lv2蚁后', '1440', '48.000000000000', '3.000000000000', '30.000000000000', '0.266666640000', '1', '2019-04-17 22:23:58', '2019-04-17 14:14:04', '2019-04-17 22:23:58');
INSERT INTO `machine` VALUES ('18', 'Z2524197', '1', '2', '18005151538', '1', '5', 'Lv1蚁后', '1440', '15.000000000000', '1.000000000000', '10.000000000000', '0.000000000000', '0', '0000-00-00 00:00:00', '2019-06-23 14:03:43', '2019-06-23 14:03:43');
INSERT INTO `machine` VALUES ('19', 'B8477778', '1', '2', '18005151538', '1', '5', 'Lv1蚁后', '1440', '15.000000000000', '1.000000000000', '10.000000000000', '0.000000000000', '0', '0000-00-00 00:00:00', '2019-06-23 14:03:43', '2019-06-23 14:03:43');
INSERT INTO `machine` VALUES ('20', 'S3695540', '1', '2', '18005151538', '1', '5', 'Lv1蚁后', '1440', '15.000000000000', '1.000000000000', '10.000000000000', '0.000000000000', '0', '0000-00-00 00:00:00', '2019-06-23 14:03:43', '2019-06-23 14:03:43');

-- ----------------------------
-- Table structure for market
-- ----------------------------
DROP TABLE IF EXISTS `market`;
CREATE TABLE `market` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `date` date NOT NULL COMMENT '具体日期',
  `price` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '指导价格',
  `high` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '最高价格',
  `low` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '最低价格',
  `buy_count` int(11) NOT NULL DEFAULT '0' COMMENT '买入订单数量',
  `buy_money` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '买入货币数量',
  `sell_count` int(11) NOT NULL DEFAULT '0' COMMENT '卖出订单数量',
  `sell_money` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '卖入货币数量',
  `success_count` int(11) NOT NULL DEFAULT '0' COMMENT '成交订单数量',
  `success_money` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '成交金额数量',
  `charge` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '总收取手续费',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='行情';

-- ----------------------------
-- Records of market
-- ----------------------------
INSERT INTO `market` VALUES ('1', '2019-03-02', '3.000000000000', '3.000000000000', '3.000000000000', '3', '15.000000000000', '0', '0.000000000000', '1', '5.000000000000', '1.000000000000', '2019-03-02 23:09:14', '2019-03-02 23:15:24');
INSERT INTO `market` VALUES ('2', '2019-03-03', '3.100000000000', '3.100000000000', '3.100000000000', '6', '75.000000000000', '0', '0.000000000000', '3', '15.000000000000', '3.000000000000', '2019-03-03 11:42:04', '2019-03-03 12:09:57');
INSERT INTO `market` VALUES ('3', '2019-03-04', '3.000000000000', '3.000000000000', '3.000000000000', '0', '0.000000000000', '0', '0.000000000000', '0', '0.000000000000', '0.000000000000', '2019-03-04 23:50:45', '2019-03-04 23:50:45');
INSERT INTO `market` VALUES ('4', '2019-03-05', '3.000000000000', '3.000000000000', '3.000000000000', '4', '20.000000000000', '0', '0.000000000000', '1', '5.000000000000', '1.000000000000', '2019-03-05 10:14:25', '2019-03-05 19:13:08');
INSERT INTO `market` VALUES ('5', '2019-03-06', '3.100000000000', '3.100000000000', '3.100000000000', '1', '5.000000000000', '0', '0.000000000000', '0', '0.000000000000', '0.000000000000', '2019-03-06 13:26:14', '2019-03-06 15:37:21');
INSERT INTO `market` VALUES ('6', '2019-03-07', '3.000000000000', '3.000000000000', '3.000000000000', '1', '5.000000000000', '0', '0.000000000000', '0', '0.000000000000', '0.000000000000', '2019-03-07 15:12:18', '2019-03-07 15:12:25');
INSERT INTO `market` VALUES ('7', '2019-03-08', '3.000000000000', '3.000000000000', '3.000000000000', '6', '345.000000000000', '0', '0.000000000000', '2', '35.000000000000', '7.000000000000', '2019-03-08 19:12:48', '2019-03-08 19:28:27');
INSERT INTO `market` VALUES ('8', '2019-03-09', '3.500000000000', '3.500000000000', '3.500000000000', '73', '1025.000000000000', '0', '0.000000000000', '0', '0.000000000000', '0.000000000000', '2019-03-09 13:37:57', '2019-03-09 21:56:29');
INSERT INTO `market` VALUES ('9', '2019-03-10', '3.600000000000', '3.600000000000', '3.600000000000', '3689', '92510.000000000000', '0', '0.000000000000', '0', '0.000000000000', '0.000000000000', '2019-03-10 09:04:46', '2019-03-10 21:58:58');
INSERT INTO `market` VALUES ('10', '2019-03-11', '3.700000000000', '3.700000000000', '3.700000000000', '3318', '62990.000000000000', '0', '0.000000000000', '0', '0.000000000000', '0.000000000000', '2019-03-11 09:01:19', '2019-03-11 21:59:43');
INSERT INTO `market` VALUES ('11', '2019-03-12', '3.800000000000', '3.800000000000', '3.800000000000', '3065', '57230.000000000000', '0', '0.000000000000', '0', '0.000000000000', '0.000000000000', '2019-03-12 09:22:01', '2019-03-12 21:57:02');
INSERT INTO `market` VALUES ('12', '2019-03-13', '3.900000000000', '3.900000000000', '3.900000000000', '2376', '40240.000000000000', '0', '0.000000000000', '0', '0.000000000000', '0.000000000000', '2019-03-13 08:58:37', '2019-03-13 21:57:59');
INSERT INTO `market` VALUES ('13', '2019-03-14', '4.000000000000', '4.000000000000', '4.000000000000', '3789', '72970.000000000000', '0', '0.000000000000', '54', '340.000000000000', '68.000000000000', '2019-03-14 09:03:42', '2019-03-14 21:59:34');
INSERT INTO `market` VALUES ('14', '2019-03-15', '4.100000000000', '4.100000000000', '4.100000000000', '5362', '71670.000000000000', '0', '0.000000000000', '101', '945.000000000000', '189.000000000000', '2019-03-15 08:59:40', '2019-03-15 22:10:57');
INSERT INTO `market` VALUES ('15', '2019-03-16', '4.200000000000', '4.200000000000', '4.200000000000', '2752', '36170.000000000000', '0', '0.000000000000', '103', '1095.000000000000', '219.000000000000', '2019-03-16 11:15:13', '2019-03-16 22:10:52');
INSERT INTO `market` VALUES ('16', '2019-03-17', '4.300000000000', '4.300000000000', '4.300000000000', '1565', '17275.000000000000', '0', '0.000000000000', '120', '1260.000000000000', '252.000000000000', '2019-03-17 12:38:35', '2019-03-17 21:58:25');
INSERT INTO `market` VALUES ('17', '2019-03-18', '4.400000000000', '4.400000000000', '4.400000000000', '3754', '41965.000000000000', '0', '0.000000000000', '205', '1985.000000000000', '397.000000000000', '2019-03-18 08:58:40', '2019-03-18 22:00:27');
INSERT INTO `market` VALUES ('18', '2019-03-19', '4.500000000000', '4.500000000000', '4.500000000000', '8167', '89415.000000000000', '0', '0.000000000000', '268', '2545.000000000000', '509.000000000000', '2019-03-19 08:59:17', '2019-03-19 21:57:10');
INSERT INTO `market` VALUES ('19', '2019-03-20', '4.600000000000', '4.600000000000', '4.600000000000', '10724', '123900.000000000000', '0', '0.000000000000', '314', '3075.000000000000', '615.000000000000', '2019-03-20 09:00:01', '2019-03-20 21:59:56');
INSERT INTO `market` VALUES ('20', '2019-03-21', '4.700000000000', '4.700000000000', '4.700000000000', '14267', '178435.000000000000', '0', '0.000000000000', '469', '5545.000000000000', '1109.000000000000', '2019-03-21 08:59:20', '2019-03-21 22:10:23');
INSERT INTO `market` VALUES ('21', '2019-03-22', '4.800000000000', '4.800000000000', '4.800000000000', '16043', '204450.000000000000', '0', '0.000000000000', '487', '5910.000000000000', '1182.000000000000', '2019-03-22 08:59:32', '2019-03-22 22:44:04');
INSERT INTO `market` VALUES ('22', '2019-03-23', '4.900000000000', '4.900000000000', '4.900000000000', '19988', '213860.000000000000', '0', '0.000000000000', '631', '6755.000000000000', '1351.000000000000', '2019-03-23 09:00:01', '2019-03-23 21:59:58');
INSERT INTO `market` VALUES ('23', '2019-03-24', '5.000000000000', '5.000000000000', '5.000000000000', '21306', '236894.000000000000', '0', '0.000000000000', '796', '9955.000000000000', '1991.000000000000', '2019-03-24 09:00:03', '2019-03-24 21:59:44');
INSERT INTO `market` VALUES ('24', '2019-03-25', '5.100000000000', '5.100000000000', '5.100000000000', '21784', '264150.000000000000', '0', '0.000000000000', '963', '11965.000000000000', '2393.000000000000', '2019-03-25 09:00:03', '2019-03-25 22:06:14');
INSERT INTO `market` VALUES ('25', '2019-03-26', '5.200000000000', '5.200000000000', '5.200000000000', '20975', '268870.000000000000', '0', '0.000000000000', '1196', '13545.000000000000', '2709.000000000000', '2019-03-26 08:58:07', '2019-03-26 22:18:55');
INSERT INTO `market` VALUES ('26', '2019-03-27', '1.680000000000', '1.680000000000', '1.680000000000', '20553', '255230.000000000000', '0', '0.000000000000', '1551', '18825.000000000000', '3765.000000000000', '2019-03-27 08:56:12', '2019-04-12 09:02:53');
INSERT INTO `market` VALUES ('27', '2019-03-28', '1.680000000000', '1.680000000000', '1.680000000000', '19295', '277885.000000000000', '0', '0.000000000000', '1599', '16665.000000000000', '3333.000000000000', '2019-03-28 08:55:10', '2019-04-12 09:02:36');
INSERT INTO `market` VALUES ('28', '2019-03-29', '1.680000000000', '1.680000000000', '1.680000000000', '12820', '180855.000000000000', '0', '0.000000000000', '1612', '16070.000000000000', '3214.000000000000', '2019-03-29 08:56:01', '2019-04-12 09:02:17');
INSERT INTO `market` VALUES ('29', '2019-04-09', '1.680000000000', '1.680000000000', '1.680000000000', '45', '746.000000000000', '0', '0.000000000000', '1', '3.000000000000', '0.900000000000', '2019-04-09 15:33:22', '2019-04-09 21:21:21');
INSERT INTO `market` VALUES ('30', '2019-04-10', '1.680000000000', '1.680000000000', '1.680000000000', '480', '10838.000000000000', '0', '0.000000000000', '1', '100.000000000000', '30.000000000000', '2019-04-10 10:02:31', '2019-04-10 21:25:37');
INSERT INTO `market` VALUES ('31', '2019-04-11', '1.680000000000', '1.680000000000', '1.680000000000', '578', '10174.000000000000', '0', '0.000000000000', '3', '300.000000000000', '90.000000000000', '2019-04-10 12:22:42', '2019-04-11 21:25:03');
INSERT INTO `market` VALUES ('32', '2019-04-12', '1.680000000000', '1.680000000000', '1.680000000000', '597', '9802.000000000000', '0', '0.000000000000', '0', '0.000000000000', '0.000000000000', '2019-04-10 12:22:58', '2019-04-12 21:27:59');
INSERT INTO `market` VALUES ('33', '2019-04-13', '1.680000000000', '1.680000000000', '1.680000000000', '634', '7068.000000000000', '0', '0.000000000000', '0', '0.000000000000', '0.000000000000', '2019-04-12 09:03:26', '2019-04-13 21:10:24');
INSERT INTO `market` VALUES ('34', '2019-04-14', '1.680000000000', '1.680000000000', '1.680000000000', '887', '8421.000000000000', '0', '0.000000000000', '0', '0.000000000000', '0.000000000000', '2019-04-12 09:04:48', '2019-04-14 21:18:42');
INSERT INTO `market` VALUES ('35', '2019-04-15', '1.680000000000', '1.680000000000', '1.680000000000', '2998', '32942.000000000000', '0', '0.000000000000', '26', '244.000000000000', '73.200000000000', '2019-04-12 10:12:19', '2019-04-15 21:28:06');
INSERT INTO `market` VALUES ('36', '2019-04-16', '1.000000000000', '1.500000000000', '1.000000000000', '2', '6.000000000000', '0', '0.000000000000', '0', '0.000000000000', '0.000000000000', '2019-04-15 02:54:21', '2019-04-16 21:13:41');
INSERT INTO `market` VALUES ('37', '2019-04-17', '1.700000000000', '1.700000000000', '1.700000000000', '0', '0.000000000000', '0', '0.000000000000', '0', '0.000000000000', '0.000000000000', '2019-04-15 22:42:26', '2019-04-15 22:42:26');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `username` char(11) NOT NULL COMMENT '用户账号',
  `title` varchar(50) DEFAULT NULL,
  `content` text COMMENT '具体内容',
  `reply` text COMMENT '系统回复',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `create_at` (`create_at`),
  KEY `update_at` (`update_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言';

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for oauth
-- ----------------------------
DROP TABLE IF EXISTS `oauth`;
CREATE TABLE `oauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `oid` char(32) NOT NULL COMMENT '唯一编号，md5(p+a+o)',
  `platform` tinyint(4) NOT NULL DEFAULT '1' COMMENT '平台，1：微信，2：QQ',
  `appid` varchar(50) NOT NULL COMMENT 'AppID',
  `openid` varchar(50) NOT NULL COMMENT 'OpenID',
  `unionid` varchar(50) DEFAULT NULL COMMENT 'UnionID',
  `username` char(11) DEFAULT NULL COMMENT '用户账号，没有代表仅授权但并未注册成功',
  `avatar` varchar(100) DEFAULT NULL COMMENT '头像',
  `nickname` varchar(30) DEFAULT NULL COMMENT '昵称',
  `gender` tinyint(4) NOT NULL DEFAULT '1' COMMENT '性别，1：男，2：女',
  `province` varchar(20) DEFAULT NULL COMMENT '省份',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `county` varchar(20) DEFAULT NULL COMMENT '区县',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oid` (`oid`),
  UNIQUE KEY `platform_appid_openid` (`platform`,`appid`,`openid`),
  UNIQUE KEY `platform_appid_unionid` (`platform`,`appid`,`unionid`),
  UNIQUE KEY `platform_appid_openid_username` (`platform`,`appid`,`openid`,`username`),
  UNIQUE KEY `platform_appid_unionid_username` (`platform`,`appid`,`unionid`,`username`),
  KEY `platform` (`platform`),
  KEY `appid` (`appid`),
  KEY `openid` (`openid`),
  KEY `username` (`username`),
  KEY `create_at` (`create_at`),
  KEY `update_at` (`update_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方授权登录';

-- ----------------------------
-- Records of oauth
-- ----------------------------

-- ----------------------------
-- Table structure for pool
-- ----------------------------
DROP TABLE IF EXISTS `pool`;
CREATE TABLE `pool` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `username` char(11) NOT NULL COMMENT '用户账号',
  `action` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型，1：领取收益，2：使用道具，3：加入矿池',
  `power` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '当前的算力是多少，使用道具之前的',
  `prop` varchar(30) DEFAULT NULL COMMENT '当前使用的道具名称',
  `spend` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '花费了多少',
  `reward` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '奖励了多少',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `action` (`action`),
  KEY `prop` (`prop`),
  KEY `create_at` (`create_at`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='共享矿池';

-- ----------------------------
-- Records of pool
-- ----------------------------
INSERT INTO `pool` VALUES ('1', '13664963300', '3', '0.000000000000', '', '0.000000000000', '0.000000000000', '2018-08-29 11:38:14');

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `username` char(11) NOT NULL COMMENT '用户账户',
  `nickname` varchar(10) DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(100) DEFAULT NULL COMMENT '头像',
  `wechat` varchar(32) DEFAULT NULL COMMENT '微信账号',
  `qq` varchar(11) DEFAULT NULL COMMENT 'QQ号码',
  `alipay` varchar(32) DEFAULT NULL COMMENT '支付宝',
  `realname` char(4) DEFAULT NULL COMMENT '真实姓名',
  `idcard` char(18) DEFAULT NULL COMMENT '身份证号码',
  `certificate` text COMMENT '证件图片',
  `authen_reason` text COMMENT '实名拒绝认证理由',
  `bankname` varchar(10) DEFAULT NULL COMMENT '银行名称',
  `bankcard` varchar(30) DEFAULT NULL COMMENT '银行卡号',
  `bankaddress` varchar(30) DEFAULT NULL COMMENT '分行地址',
  `phone` char(11) DEFAULT NULL COMMENT '预留手机号',
  `province` int(11) DEFAULT NULL COMMENT '省',
  `city` int(11) DEFAULT NULL COMMENT '市',
  `county` int(11) DEFAULT NULL COMMENT '区',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `alipay_image` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `idcard` (`idcard`),
  KEY `province` (`province`),
  KEY `city` (`city`),
  KEY `county` (`county`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='档案';

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('1', '18888888888', 'K343243', '', '18888888888', '', '13588967304', '超哥', '232323199206183618', '[]', '', '', '3344445422227654', '', '', '0', '0', '0', '2019-04-15 23:11:44', '2019-04-16 21:12:52', '');
INSERT INTO `profile` VALUES ('2', '13588967304', 'I960431', '', '13588967304', '', '13588967304', '李超', '342623199806183618', '', '', '', '6214852102274258', '', '', '0', '0', '0', '2019-04-17 01:51:33', '2019-04-17 01:51:33', '');
INSERT INTO `profile` VALUES ('3', '15821899104', '中国源码网', '', '76891828', '76891828', '15821899104', '菜鸟阁', '341003199207230225', '', '', '', '6228412004500312074', '', '', '0', '0', '0', '2019-04-17 03:05:51', '2020-01-13 14:54:18', '');
INSERT INTO `profile` VALUES ('4', '18005151538', 'I301535', '', '18005151538', '', '18005151538', '菜鸟阁', '320923198801132122', '', '', '', '6214831218885555', '', '', '0', '0', '0', '2019-06-23 14:03:43', '2019-11-24 20:28:21', '');

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `rid` char(32) NOT NULL COMMENT '对外编号',
  `username` char(11) NOT NULL COMMENT '用户账号',
  `currency` tinyint(4) NOT NULL COMMENT '具体货币',
  `business` tinyint(4) NOT NULL COMMENT '具体业务',
  `before` decimal(30,12) DEFAULT '0.000000000000' COMMENT '原本货币数量',
  `now` decimal(30,12) DEFAULT '0.000000000000' COMMENT '本次货币数量',
  `after` decimal(30,12) DEFAULT '0.000000000000' COMMENT '最后货币数量',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rid_currency` (`rid`,`currency`),
  KEY `username` (`username`),
  KEY `currency` (`currency`),
  KEY `business` (`business`),
  KEY `now` (`now`),
  KEY `create_at` (`create_at`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='流水';

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('1', 'F19041657093034', '18888888888', '8', '88', '0.000000000000', '1000.000000000000', '1000.000000000000', '2019-04-16 21:12:52');
INSERT INTO `record` VALUES ('2', 'N19041610086621', '18888888888', '7', '21', '0.000000000000', '0.062500020000', '0.062500020000', '2019-04-16 23:45:36');
INSERT INTO `record` VALUES ('3', 'E19041741260665', '18888888888', '7', '21', '0.062500020000', '0.031250010000', '0.093750030000', '2019-04-17 00:47:54');
INSERT INTO `record` VALUES ('4', 'O19041723479403', '18888888888', '9', '103', '0.000000000000', '0.500000000000', '0.500000000000', '2019-04-17 01:04:08');
INSERT INTO `record` VALUES ('5', 'J19041743276321', '18888888888', '1', '103', '0.000000000000', '2.000000000000', '2.000000000000', '2019-04-17 01:25:35');
INSERT INTO `record` VALUES ('6', 'J19041743276321', '18888888888', '8', '103', '1000.000000000000', '-2.000000000000', '998.000000000000', '2019-04-17 01:25:35');
INSERT INTO `record` VALUES ('7', 'D19041764842992', '13588967304', '8', '88', '0.000000000000', '800.000000000000', '800.000000000000', '2019-04-17 01:51:33');
INSERT INTO `record` VALUES ('8', 'X19041712763287', '13588967304', '9', '103', '0.000000000000', '0.500000000000', '0.500000000000', '2019-04-17 01:53:35');
INSERT INTO `record` VALUES ('9', 'P19041789224086', '13588967304', '1', '103', '0.000000000000', '1.600000000000', '1.600000000000', '2019-04-17 01:53:42');
INSERT INTO `record` VALUES ('10', 'P19041789224086', '13588967304', '8', '103', '800.000000000000', '-1.600000000000', '798.400000000000', '2019-04-17 01:53:42');
INSERT INTO `record` VALUES ('11', 'W19041785391554', '18888888888', '7', '21', '0.093750030000', '0.031250010000', '0.125000040000', '2019-04-17 01:55:58');
INSERT INTO `record` VALUES ('12', 'U19041778790090', '18888888888', '7', '21', '0.125000040000', '0.031250010000', '0.156250050000', '2019-04-17 03:03:07');
INSERT INTO `record` VALUES ('13', 'Z19041736685926', '15821899104', '8', '88', '0.000000000000', '800.000000000000', '800.000000000000', '2019-04-17 03:05:51');
INSERT INTO `record` VALUES ('14', 'L19041770807156', '13588967304', '7', '21', '0.000000000000', '0.085416680000', '0.085416680000', '2019-04-17 03:07:14');
INSERT INTO `record` VALUES ('15', 'B19041757056470', '18888888888', '7', '21', '0.156250050000', '0.180555580000', '0.336805630000', '2019-04-17 05:03:32');
INSERT INTO `record` VALUES ('16', 'I19041753330050', '18888888888', '7', '21', '0.336805630000', '1.194444560000', '1.531250190000', '2019-04-17 12:22:33');
INSERT INTO `record` VALUES ('17', 'O19041745509221', '18888888888', '7', '21', '1.531250190000', '0.149305570000', '1.680555760000', '2019-04-17 14:00:53');
INSERT INTO `record` VALUES ('18', 'O19041788323457', '13588967304', '7', '21', '0.085416680000', '0.939583480000', '1.025000160000', '2019-04-17 14:04:21');
INSERT INTO `record` VALUES ('19', 'Q19041751049907', '15821899104', '7', '21', '0.000000000000', '0.939583480000', '0.939583480000', '2019-04-17 14:07:10');
INSERT INTO `record` VALUES ('20', 'Q19041766130349', '18888888888', '8', '50', '998.000000000000', '500.000000000000', '1498.000000000000', '2019-04-17 14:14:04');
INSERT INTO `record` VALUES ('21', 'K19041760665044', '15821899104', '1', '88', '0.000000000000', '1000.000000000000', '1000.000000000000', '2019-04-17 14:30:27');
INSERT INTO `record` VALUES ('22', 'K19041775049494', '15821899104', '3', '88', '0.000000000000', '1000.000000000000', '1000.000000000000', '2019-04-17 14:30:38');
INSERT INTO `record` VALUES ('23', 'Z19041790584459', '15821899104', '7', '21', '0.939583480000', '0.085416680000', '1.025000160000', '2019-04-17 16:02:04');
INSERT INTO `record` VALUES ('24', 'U19041732245577', '13588967304', '7', '21', '1.025000160000', '0.512500080000', '1.537500240000', '2019-04-17 20:07:25');
INSERT INTO `record` VALUES ('25', 'W19041716649125', '18888888888', '7', '21', '1.680555760000', '1.610416770000', '3.290972530000', '2019-04-17 22:23:58');
INSERT INTO `record` VALUES ('26', 'D19062312997350', '18005151538', '8', '88', '0.000000000000', '800.000000000000', '800.000000000000', '2019-06-23 14:03:43');
INSERT INTO `record` VALUES ('27', 'B19111538242540', '15821899104', '7', '21', '1.025000160000', '121.974999840000', '123.000000000000', '2019-11-15 23:39:32');
INSERT INTO `record` VALUES ('28', 'R19111584268277', '15821899104', '1', '103', '1000.000000000000', '1.600000000000', '1001.600000000000', '2019-11-15 23:42:59');
INSERT INTO `record` VALUES ('29', 'R19111584268277', '15821899104', '8', '103', '800.000000000000', '-1.600000000000', '798.400000000000', '2019-11-15 23:42:59');
INSERT INTO `record` VALUES ('30', 'K19112421636136', '15821899104', '1', '103', '1001.600000000000', '1.596800000000', '1003.196800000000', '2019-11-24 20:32:12');
INSERT INTO `record` VALUES ('31', 'K19112421636136', '15821899104', '8', '103', '798.400000000000', '-1.596800000000', '796.803200000000', '2019-11-24 20:32:12');
INSERT INTO `record` VALUES ('32', 'Z19112474489793', '15821899104', '9', '103', '0.000000000000', '0.500000000000', '0.500000000000', '2019-11-24 20:32:14');
INSERT INTO `record` VALUES ('34', 'Q20011379725386', '15821899104', '7', '20', '123.000000000000', '-100.000000000000', '23.000000000000', '2020-01-13 15:11:19');
INSERT INTO `record` VALUES ('35', 'U20011357079551', '15821899104', '1', '20', '1003.196800000000', '-100.000000000000', '903.196800000000', '2020-01-13 15:11:23');
INSERT INTO `record` VALUES ('36', 'N20011378349741', '15821899104', '1', '20', '903.196800000000', '-10.000000000000', '893.196800000000', '2020-01-13 15:11:35');
INSERT INTO `record` VALUES ('37', 'A20011315173602', '15821899104', '1', '20', '893.196800000000', '-10.000000000000', '883.196800000000', '2020-01-13 15:12:09');
INSERT INTO `record` VALUES ('38', 'R20011336984952', '15821899104', '9', '103', '0.500000000000', '0.500000000000', '1.000000000000', '2020-01-13 15:12:14');
INSERT INTO `record` VALUES ('39', 'K20011319661767', '15821899104', '1', '103', '883.196800000000', '1.593606400000', '884.790406400000', '2020-01-13 15:12:20');
INSERT INTO `record` VALUES ('40', 'K20011319661767', '15821899104', '8', '103', '796.803200000000', '-1.593606400000', '795.209593600000', '2020-01-13 15:12:20');
INSERT INTO `record` VALUES ('41', 'M20011370578670', '15821899104', '7', '20', '23.000000000000', '-10.000000000000', '13.000000000000', '2020-01-13 15:12:39');
INSERT INTO `record` VALUES ('42', 'D20011341520996', '15821899104', '7', '20', '13.000000000000', '-10.000000000000', '3.000000000000', '2020-01-13 15:13:07');

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `code` int(11) NOT NULL COMMENT '地区编码',
  `type` tinyint(4) NOT NULL DEFAULT '3' COMMENT '类型，1省，2市，3区',
  `province` int(11) DEFAULT NULL COMMENT '省编码',
  `province_name` varchar(30) DEFAULT NULL COMMENT '省名字',
  `city` int(11) DEFAULT NULL COMMENT '市编码',
  `city_name` varchar(30) DEFAULT NULL COMMENT '市名字',
  `name` varchar(30) DEFAULT NULL COMMENT '地区名字',
  `address` varchar(90) DEFAULT NULL COMMENT '完整地区',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='地区';

-- ----------------------------
-- Records of region
-- ----------------------------

-- ----------------------------
-- Table structure for sms
-- ----------------------------
DROP TABLE IF EXISTS `sms`;
CREATE TABLE `sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `type` int(11) NOT NULL COMMENT '验证类型，取自模板编号',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，1：正常，0：已使用',
  `mobile` char(11) NOT NULL COMMENT '手机号码',
  `data` text COMMENT '数据内容',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `ua` text COMMENT 'UserAgent',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='短信';

-- ----------------------------
-- Records of sms
-- ----------------------------
INSERT INTO `sms` VALUES ('1', '424406', '1', '13555554461', 'a:2:{i:0;i:441375;i:1;s:8:\"30分钟\";}', '42.185.176.91', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '2019-04-17 01:33:07', '2019-04-17 01:33:07');
INSERT INTO `sms` VALUES ('2', '424406', '1', '13588967304', 'a:2:{i:0;i:356515;i:1;s:8:\"30分钟\";}', '221.225.151.129', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16D57 QQ/8.0.0.472 V1_IPH_SQ_8.0.0_1_APP_A Pixel/1242 Core/UIWebView Device/Apple(iPhone XS Max) NetType/WIFI QBWebViewType/1', '2019-04-17 01:51:11', '2019-04-17 01:51:11');
INSERT INTO `sms` VALUES ('3', '424406', '1', '15821899104', 'a:2:{i:0;i:727156;i:1;s:8:\"30分钟\";}', '221.225.202.28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16A366 MicroMessenger/7.0.3(0x17000321) NetType/WIFI Language/zh_CN', '2019-04-17 03:05:32', '2019-04-17 03:05:32');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `sort` int(11) DEFAULT '0' COMMENT '排列顺序，数字越大越靠前',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态，1：在售，0：停售',
  `audit` tinyint(4) DEFAULT '1' COMMENT '审核，1：通过，0：待审核',
  `catalog` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类目，1：矿机',
  `username` char(11) DEFAULT NULL COMMENT '用户账号，为空表示管理员发布',
  `divide` tinyint(4) DEFAULT '0' COMMENT '级别，0：仅自己收益，1：1级也能获益，2：2级也能获益，以此类推',
  `title` varchar(30) NOT NULL COMMENT '产品名称',
  `image` varchar(100) DEFAULT NULL COMMENT '产品图片',
  `cycle` int(11) NOT NULL COMMENT '周期，单位小时',
  `income` decimal(30,12) NOT NULL COMMENT '预计收益',
  `power` decimal(30,12) NOT NULL COMMENT '奖励的算力',
  `price` decimal(30,12) NOT NULL COMMENT '价格',
  `price_score` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '积分价格',
  `limit` int(11) DEFAULT '0' COMMENT '每人限购，0为不限制',
  `day` int(11) DEFAULT '0' COMMENT '每天限购，0为不限制',
  `sales` int(11) DEFAULT '0' COMMENT '销量',
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `content` text COMMENT '产品介绍',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `username` (`username`),
  KEY `divide` (`divide`),
  KEY `title` (`title`),
  KEY `create_at` (`create_at`),
  KEY `update_at` (`update_at`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='商城表';

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('1', '6', '1', '1', '1', '', '5', 'Lv1蚁后', '20190416/1f755dfb57157787bd8b5f030041b04f.png', '1440', '15.000000000000', '1.000000000000', '10.000000000000', '0.000000000000', '20', '0', '113', '99887', '', '2018-11-07 09:48:43', '2019-04-16 21:06:43');
INSERT INTO `store` VALUES ('2', '5', '1', '1', '1', '', '5', 'Lv2蚁后', '20190416/661438c7f15d1d13325767cc1328690d.png', '1440', '48.000000000000', '3.000000000000', '30.000000000000', '0.000000000000', '15', '0', '2', '99998', '', '2018-11-07 09:52:15', '2019-04-16 21:07:35');
INSERT INTO `store` VALUES ('3', '4', '1', '1', '1', '', '5', 'Lv3蚁后', '20190416/c9c6232a33b673f5705c0917ff828116.png', '1440', '170.000000000000', '10.000000000000', '100.000000000000', '0.000000000000', '10', '0', '7', '99993', '', '2018-11-07 09:48:43', '2019-04-16 21:07:55');
INSERT INTO `store` VALUES ('4', '3', '1', '1', '1', '', '5', 'Lv4蚁后', '20190416/8e2576addbac2029e46010de9726ea28.png', '1440', '900.000000000000', '50.000000000000', '500.000000000000', '0.000000000000', '5', '0', '0', '100000', '', '2018-11-07 09:53:49', '2019-04-16 21:08:10');
INSERT INTO `store` VALUES ('5', '2', '1', '1', '1', '', '5', 'Lv5蚁后', '20190416/97dd49e1a5816f3f9499bbf93a4bf9ed.png', '1440', '1900.000000000000', '100.000000000000', '1000.000000000000', '0.000000000000', '3', '0', '2', '99998', '', '2018-11-07 10:01:55', '2019-04-16 21:08:28');

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `type` char(10) NOT NULL DEFAULT '1' COMMENT '券的类型，1：注册，Mxx开头为矿机购买',
  `username` char(11) DEFAULT NULL COMMENT '使用者账号',
  `token` char(32) NOT NULL COMMENT '具体票券',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `type` (`type`),
  KEY `username` (`username`),
  KEY `create_at` (`create_at`),
  KEY `update_at` (`update_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='票券';

-- ----------------------------
-- Records of ticket
-- ----------------------------

-- ----------------------------
-- Table structure for trade
-- ----------------------------
DROP TABLE IF EXISTS `trade`;
CREATE TABLE `trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `tid` char(10) NOT NULL COMMENT '订单编号',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型，1：买入，2：出售',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，0：失败，1：匹配中，2：待付款，3：待确认，8：成功，4：投诉中',
  `number` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '数量',
  `price` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '价格',
  `charge` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '手续费',
  `owner` char(11) NOT NULL COMMENT '自己的账号',
  `target` char(11) DEFAULT NULL COMMENT '对方的账号',
  `secret` char(10) DEFAULT NULL COMMENT '当前暗号，三十六进制的当前时间戳，每次别人退出交易后更新暗号',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `pzimg` varchar(255) DEFAULT NULL,
  `pztime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tid` (`tid`),
  KEY `owner` (`owner`),
  KEY `target` (`target`),
  KEY `type` (`type`),
  KEY `status` (`status`),
  KEY `create_at` (`create_at`),
  KEY `update_at` (`update_at`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='交易';

-- ----------------------------
-- Records of trade
-- ----------------------------
INSERT INTO `trade` VALUES ('1', 'I726252819', '1', '1', '3.000000000000', '1.000000000000', '0.900000000000', '18888888888', '', 'PQ221Q', '2019-04-16 21:13:02', '2019-04-16 21:13:02', '', '0');
INSERT INTO `trade` VALUES ('2', 'C353782900', '1', '1', '3.000000000000', '1.000000000000', '0.900000000000', '18888888888', '', 'PQ222T', '2019-04-16 21:13:41', '2019-04-16 21:13:41', '', '0');

-- ----------------------------
-- Table structure for trade_audit
-- ----------------------------
DROP TABLE IF EXISTS `trade_audit`;
CREATE TABLE `trade_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `tid` char(10) NOT NULL COMMENT '订单编号',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，1：通过，0：待审核',
  `remark` text COMMENT '备注',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `status` (`status`),
  KEY `create_at` (`create_at`),
  KEY `update_at` (`update_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='交易审核';

-- ----------------------------
-- Records of trade_audit
-- ----------------------------

-- ----------------------------
-- Table structure for trade_log
-- ----------------------------
DROP TABLE IF EXISTS `trade_log`;
CREATE TABLE `trade_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `tid` char(10) NOT NULL COMMENT '订单编号',
  `secret` char(10) NOT NULL COMMENT '暗号',
  `command` tinyint(4) NOT NULL DEFAULT '1' COMMENT '命令，此次执行的具体操作',
  `username` char(11) NOT NULL COMMENT '用户账号',
  `content` text COMMENT '内容，如文字或图片',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `secret` (`secret`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='交易记录';

-- ----------------------------
-- Records of trade_log
-- ----------------------------

-- ----------------------------
-- Table structure for transfer
-- ----------------------------
DROP TABLE IF EXISTS `transfer`;
CREATE TABLE `transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `tid` char(10) NOT NULL COMMENT '订单编号',
  `owner` char(11) NOT NULL COMMENT '自己的账号',
  `target` char(11) DEFAULT NULL COMMENT '对方的账号',
  `number` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '数量',
  `charge` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '手续费',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tid` (`tid`),
  KEY `owner` (`owner`),
  KEY `target` (`target`),
  KEY `create_at` (`create_at`),
  KEY `update_at` (`update_at`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='转账';

-- ----------------------------
-- Records of transfer
-- ----------------------------
INSERT INTO `transfer` VALUES ('1', 'C166574271', '18554077111', '13181504493', '10.000000000000', '2.000000000000', '2018-10-31 21:32:35', '2018-10-31 21:32:35');

-- ----------------------------
-- Table structure for upgrade
-- ----------------------------
DROP TABLE IF EXISTS `upgrade`;
CREATE TABLE `upgrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `username` char(11) NOT NULL COMMENT '用户账户',
  `level` tinyint(4) NOT NULL DEFAULT '1' COMMENT '具体级别',
  `money` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '赠送的可用货币',
  `machine` text COMMENT '赠送的矿机',
  `power` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '赠送的算力',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_level` (`username`,`level`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='升级';

-- ----------------------------
-- Records of upgrade
-- ----------------------------
INSERT INTO `upgrade` VALUES ('1', '18888888888', '1', '0.000000000000', '[2]', '0.000000000000', '2019-04-17 14:14:04');

-- ----------------------------
-- Table structure for uuid
-- ----------------------------
DROP TABLE IF EXISTS `uuid`;
CREATE TABLE `uuid` (
  `id` char(32) NOT NULL COMMENT '具体编号',
  `type` tinyint(4) NOT NULL COMMENT '业务类型',
  PRIMARY KEY (`id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='UUID';

-- ----------------------------
-- Records of uuid
-- ----------------------------
INSERT INTO `uuid` VALUES ('A20011315173602', '8');
INSERT INTO `uuid` VALUES ('A4807733', '2');
INSERT INTO `uuid` VALUES ('B19041757056470', '8');
INSERT INTO `uuid` VALUES ('B19111538242540', '8');
INSERT INTO `uuid` VALUES ('B8477778', '2');
INSERT INTO `uuid` VALUES ('C353782900', '3');
INSERT INTO `uuid` VALUES ('D19041764842992', '8');
INSERT INTO `uuid` VALUES ('D19062312997350', '8');
INSERT INTO `uuid` VALUES ('D20011341520996', '8');
INSERT INTO `uuid` VALUES ('E19041741260665', '8');
INSERT INTO `uuid` VALUES ('E4074306', '2');
INSERT INTO `uuid` VALUES ('E7195721', '2');
INSERT INTO `uuid` VALUES ('F19041657093034', '8');
INSERT INTO `uuid` VALUES ('F5526054', '2');
INSERT INTO `uuid` VALUES ('G8079594', '2');
INSERT INTO `uuid` VALUES ('G8307315', '2');
INSERT INTO `uuid` VALUES ('I19041753330050', '8');
INSERT INTO `uuid` VALUES ('I301535', '1');
INSERT INTO `uuid` VALUES ('I526041295', '8');
INSERT INTO `uuid` VALUES ('I726252819', '3');
INSERT INTO `uuid` VALUES ('I8706072', '2');
INSERT INTO `uuid` VALUES ('I960431', '1');
INSERT INTO `uuid` VALUES ('J163502719', '8');
INSERT INTO `uuid` VALUES ('J19041743276321', '8');
INSERT INTO `uuid` VALUES ('K19041760665044', '8');
INSERT INTO `uuid` VALUES ('K19041775049494', '8');
INSERT INTO `uuid` VALUES ('K19112421636136', '8');
INSERT INTO `uuid` VALUES ('K20011319661767', '8');
INSERT INTO `uuid` VALUES ('K343243', '1');
INSERT INTO `uuid` VALUES ('K8400398', '2');
INSERT INTO `uuid` VALUES ('L19041770807156', '8');
INSERT INTO `uuid` VALUES ('L274553082', '8');
INSERT INTO `uuid` VALUES ('L336033584', '8');
INSERT INTO `uuid` VALUES ('L5632162', '2');
INSERT INTO `uuid` VALUES ('M132821094', '8');
INSERT INTO `uuid` VALUES ('M20011370578670', '8');
INSERT INTO `uuid` VALUES ('N19041610086621', '8');
INSERT INTO `uuid` VALUES ('N20011378349741', '8');
INSERT INTO `uuid` VALUES ('O19041723479403', '8');
INSERT INTO `uuid` VALUES ('O19041745509221', '8');
INSERT INTO `uuid` VALUES ('O19041788323457', '8');
INSERT INTO `uuid` VALUES ('P19041789224086', '8');
INSERT INTO `uuid` VALUES ('Q19041751049907', '8');
INSERT INTO `uuid` VALUES ('Q19041766130349', '8');
INSERT INTO `uuid` VALUES ('Q20011379725386', '8');
INSERT INTO `uuid` VALUES ('R19111584268277', '8');
INSERT INTO `uuid` VALUES ('R20011336984952', '8');
INSERT INTO `uuid` VALUES ('R744410079', '8');
INSERT INTO `uuid` VALUES ('S3695540', '2');
INSERT INTO `uuid` VALUES ('T3484419', '2');
INSERT INTO `uuid` VALUES ('U19041732245577', '8');
INSERT INTO `uuid` VALUES ('U19041778790090', '8');
INSERT INTO `uuid` VALUES ('U20011357079551', '8');
INSERT INTO `uuid` VALUES ('V278299763', '8');
INSERT INTO `uuid` VALUES ('V7783772', '2');
INSERT INTO `uuid` VALUES ('V921410', '1');
INSERT INTO `uuid` VALUES ('W1237836', '2');
INSERT INTO `uuid` VALUES ('W19041716649125', '8');
INSERT INTO `uuid` VALUES ('W19041785391554', '8');
INSERT INTO `uuid` VALUES ('W19112497316353', '8');
INSERT INTO `uuid` VALUES ('W6218911', '2');
INSERT INTO `uuid` VALUES ('X19041712763287', '8');
INSERT INTO `uuid` VALUES ('X8757517', '2');
INSERT INTO `uuid` VALUES ('X9825201', '2');
INSERT INTO `uuid` VALUES ('Y6857185', '2');
INSERT INTO `uuid` VALUES ('Z19041736685926', '8');
INSERT INTO `uuid` VALUES ('Z19041790584459', '8');
INSERT INTO `uuid` VALUES ('Z19112474489793', '8');
INSERT INTO `uuid` VALUES ('Z2098211', '2');
INSERT INTO `uuid` VALUES ('Z2524197', '2');

-- ----------------------------
-- Table structure for wallet
-- ----------------------------
DROP TABLE IF EXISTS `wallet`;
CREATE TABLE `wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `username` char(11) NOT NULL COMMENT '用户账户',
  `money` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '可用货币，账户余额',
  `deposit` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '冻结货币，账户存款',
  `score` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '可用积分',
  `score_deposit` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '冻结积分',
  `spend` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '商城消费额',
  `profit` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '矿机收益',
  `team_profit` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '团队矿机收益',
  `bonus` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '全球分红',
  `trade` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '交易分红',
  `sell` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '成功卖出的数量',
  `buy` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '成功买入的数量',
  `ts_in` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '转账转入的数量',
  `ts_out` decimal(30,12) NOT NULL DEFAULT '0.000000000000' COMMENT '转账转出的数量',
  `create_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `macmoney` decimal(30,12) NOT NULL DEFAULT '0.000000000000',
  `cansell` decimal(30,12) DEFAULT '0.000000000000',
  `poll` decimal(30,12) DEFAULT '0.000000000000',
  `mpocket` decimal(30,12) DEFAULT '0.000000000000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `money` (`money`),
  KEY `u_m` (`username`,`money`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='钱包';

-- ----------------------------
-- Records of wallet
-- ----------------------------
INSERT INTO `wallet` VALUES ('1', '18888888888', '2.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '2019-04-15 23:11:44', '2019-04-17 22:23:58', '0.000000000000', '0.500000000000', '1498.000000000000', '3.290972530000');
INSERT INTO `wallet` VALUES ('2', '13588967304', '1.600000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '2019-04-17 01:51:33', '2019-04-17 20:07:25', '0.000000000000', '0.500000000000', '798.400000000000', '1.537500240000');
INSERT INTO `wallet` VALUES ('3', '15821899104', '884.790406400000', '0.000000000000', '1000.000000000000', '0.000000000000', '120.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '2019-04-17 03:05:51', '2020-01-13 15:13:07', '0.000000000000', '1.000000000000', '795.209593600000', '3.000000000000');
INSERT INTO `wallet` VALUES ('4', '18005151538', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '2019-06-23 14:03:43', '2019-06-23 14:03:43', '0.000000000000', '0.000000000000', '800.000000000000', '0.000000000000');

-- ----------------------------
-- Procedure structure for addBet
-- ----------------------------
DROP PROCEDURE IF EXISTS `addBet`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addBet`(`_uid` INT, `_amount` FLOAT, `_username` VARCHAR(16) CHARACTER SET utf8)
begin
	declare parentId1 int;      -- 上级ID
	declare parentId2 int;      -- 上上级ID
	declare pname varchar(16) character set utf8;  -- 上级用户名



	declare CommissionBase float(10,2);                -- 佣金目标
	declare CommissionParentAmount float(10,2);        -- 上级金额
	declare CommissionParentAmount2 float(10,2);       -- 上上级金额



	declare cur Decimal(12,4);
	declare _commisioned tinyint(1);
	select bet into cur from ssc_member_bet where uid=_uid and date=date_format(now(),'%Y%m%d');
	
	if cur is null THEN
		INSERT into ssc_member_bet(uid, username, date, bet, commisioned) values(_uid, _username, date_format(now(),'%Y%m%d'), _amount, 0);
	end if;
	if cur is not null THEN
		update ssc_member_bet set bet=bet+_amount where uid=_uid and date=date_format(now(),'%Y%m%d');
	end if;

	select bet into cur from ssc_member_bet where uid=_uid and date=date_format(now(),'%Y%m%d');
	select commisioned into _commisioned from ssc_member_bet where uid=_uid and date=date_format(now(),'%Y%m%d');
	select `value` into CommissionBase from ssc_params where name='conCommissionBase' limit 1;

	if cur >= CommissionBase and _commisioned=0 then
		select `value` into CommissionParentAmount from ssc_params where name='conCommissionParentAmount' limit 1;
		select `value` into CommissionParentAmount2 from ssc_params where name='conCommissionParentAmount2' limit 1;

		select `parentId` into parentId1 from ssc_members where uid=_uid;
		if parentId1 is not null and CommissionParentAmount>0 THEN
			call setCoin(CommissionParentAmount, 0, parentId1, 53, 0, concat('[', _username, ']消费佣金'), 0, '', '');
			select `parentId` into parentId2 from ssc_members where uid=parentId1;
			if parentId2 is not null and CommissionParentAmount2>0 THEN
				select `username` into pname from ssc_members where uid=parentId1;
				call setCoin(CommissionParentAmount2, 0, parentId2, 53, 0, concat('[', pname,'->', _username, ']消费佣金'), 0, '', '');
			end if;
			update ssc_member_bet set commisioned=1 where uid=_uid and date=date_format(now(),'%Y%m%d');
		end if;
	end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for addRecharge
-- ----------------------------
DROP PROCEDURE IF EXISTS `addRecharge`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addRecharge`(`_uid` INT, `_username` VARCHAR(16) CHARACTER SET utf8)
begin
	declare parentId1 int;      -- 上级ID
	declare parentId2 int;      -- 上上级ID
	declare pname varchar(16) character set utf8;  -- 上级用户名



	declare _rechargeCommissionAmount float(10,2);                -- 佣金目标
	declare _rechargeCommission float(10,2);        -- 上级金额
	declare _rechargeCommission2 float(10,2);       -- 上上级金额



	declare _commisioned TINYINT(1);     -- 是否已经派发

	declare cur float(10,2);
	select sum(amount) into cur from ssc_member_recharge where state!=0 and isDelete=0 and uid=_uid and actionTime BETWEEN UNIX_TIMESTAMP(DATE(NOW())) and UNIX_TIMESTAMP(NOW());
	
	select `value` into _rechargeCommissionAmount from ssc_params where name='rechargeCommissionAmount' limit 1;
	select rechargeCommisioned into _commisioned from ssc_member_bet where uid=_uid and date=date_format(now(),'%Y%m%d');

	if cur is not null and cur >=_rechargeCommissionAmount and _commisioned=0 THEN
		select `value` into _rechargeCommission from ssc_params where name='rechargeCommission' limit 1;
		select `value` into _rechargeCommission2 from ssc_params where name='rechargeCommission2' limit 1;

		select `parentId` into parentId1 from ssc_members where uid=_uid;
		if parentId1 is not null and _rechargeCommission>0 THEN
			call setCoin(_rechargeCommission, 0, parentId1, 53, 0, concat('[', _username, ']充值佣金'), 0, '', '');
			select `parentId` into parentId2 from ssc_members where uid=parentId1;
			if parentId2 is not null and _rechargeCommission2>0 THEN
				select `username` into pname from ssc_members where uid=parentId1;
				call setCoin(_rechargeCommission2, 0, parentId2, 53, 0, concat('[', pname,'->', _username, ']充值佣金'), 0, '', '');
			end if;
			update ssc_member_bet set rechargeCommisioned=1 where uid=_uid and date=date_format(now(),'%Y%m%d');
		end if;
	end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for addScore
-- ----------------------------
DROP PROCEDURE IF EXISTS `addScore`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addScore`(`_uid` INT, `_amount` FLOAT)
begin
	
	declare bonus float;
	select `value` into bonus from ssc_params where name='scoreProp' limit 1;
	
	set bonus=bonus*_amount;
	
	if bonus then
		update ssc_members u, ssc_params p set u.score = u.score+bonus, u.scoreTotal=u.scoreTotal+bonus where u.`uid`=_uid;
	end if;
	
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for clearData
-- ----------------------------
DROP PROCEDURE IF EXISTS `clearData`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clearData`(`dateInt` INT(11))
begin

	declare endDate int;
	set endDate = dateInt;
	-- set endDate = unix_timestamp(dateString)+24*3600;

	-- 投注
	delete from ssc_bets where kjTime < endDate and lotteryNo <> '';
	-- 帐变
	delete from ssc_coin_log where actionTime < endDate;
	-- 管理员日志
	delete from ssc_admin_log where actionTime < endDate;
	-- 会员登录session
	delete from ssc_member_session where accessTime < endDate;
	-- 提现
	delete from ssc_member_cash where actionTime < endDate and state <> 1;
	-- 充值
	delete from ssc_member_recharge where actionTime < endDate and state <> 0;
	delete from ssc_member_recharge where actionTime < endDate-24*3600 and state = 0;
		
	-- select 1, _fanDian, _parentId;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for conComAll
-- ----------------------------
DROP PROCEDURE IF EXISTS `conComAll`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `conComAll`(`baseAmount` FLOAT, `parentAmount` FLOAT, `parentLevel` INT)
begin

	declare conUid int;
	declare conUserName varchar(255);
	declare tjAmount float;
	declare done int default 0;	
	declare dateTime int default unix_timestamp(curdate());

	declare cur cursor for
	select b.uid, b.username, sum(b.`mode` * b.actionNum * b.beiShu) _tjAmount from ssc_bets b where b.kjTime>=dateTime and b.uid not in(select distinct l.extfield0 from ssc_coin_log l where l.liqType=53 and l.actionTime>=dateTime and l.extfield2=parentLevel) group by b.uid having _tjAmount>=baseAmount;
	declare continue HANDLER for not found set done=1;

	-- select baseAmount , parentAmount , parentLevel;
	
	open cur;
		repeat fetch cur into conUid, conUserName, tjAmount;
		-- select conUid, conUserName, tjAmount;
		if not done then
			call conComSingle(conUid, parentAmount, parentLevel);
		end if;
		until done end repeat;
	close cur;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for conComSingle
-- ----------------------------
DROP PROCEDURE IF EXISTS `conComSingle`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `conComSingle`(`conUid` INT, `parentAmount` FLOAT, `parentLevel` INT)
begin

	declare parentId int;
	declare superParentId int;
	declare conUserName varchar(255) character set utf8;
	declare p_username varchar(255) character set utf8;

	declare liqType int default 53;
	declare info varchar(255) character set utf8;

	declare done int default 0;
	declare cur cursor for
	select p.uid, p.parentId, p.username, u.username from ssc_members p, ssc_members u where u.parentId=p.uid and u.`uid`=conUid; 
	declare continue HANDLER for not found set done=1;

	open cur;
		repeat fetch cur into parentId, superParentId, p_username, conUserName;
		-- select parentId, superParentId, p_username, conUserName, parentLevel;
		if not done then
			if parentLevel=1 then
				if parentId and parentAmount then
					set info=concat('下级[', conUserName, ']消费佣金');
					call setCoin(parentAmount, 0, parentId, liqType, 0, info, conUid, conUserName, parentLevel);
				end if;
			end if;
			
			if parentLevel=2 then
				if superParentId and parentAmount then
					set info=concat('下级[', conUserName, '<=', p_username, ']消费佣金');
					call setCoin(parentAmount, 0, superParentId, liqType, 0, info, conUid, conUserName, parentLevel);
				end if;
			end if;
		end if;
		until done end repeat;
	close cur;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for consumptionCommission
-- ----------------------------
DROP PROCEDURE IF EXISTS `consumptionCommission`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consumptionCommission`()
begin

	declare baseAmount float;
	declare baseAmount2 float;
	declare parentAmount float;
	declare superParentAmount float;

	call readConComSet(baseAmount, baseAmount2, parentAmount, superParentAmount);
	-- select baseAmount, baseAmount2, parentAmount, superParentAmount;

	if baseAmount>0 then
		call conComAll(baseAmount, parentAmount, 1);
	end if;
	if baseAmount2>0 then
		call conComAll(baseAmount2, superParentAmount, 2);
	end if;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for delUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `delUser`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delUser`(`_uid` INT)
begin
	-- 投注
	delete from ssc_bets where `uid`=_uid;
	-- 帐变
	delete from ssc_coin_log where `uid`=_uid;
	-- 管理员日志
	delete from ssc_admin_log where `uid`=_uid;
	-- 会员登录session
	delete from ssc_member_session where `uid`=_uid;
	-- 提现
	delete from ssc_member_cash where `uid`=_uid;
	-- 充值
	delete from ssc_member_recharge where `uid`=_uid;
	-- 银行
	delete from ssc_member_bank where `uid`=_uid;
	-- 用户
	delete from ssc_members where `uid`=_uid;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for delUsers
-- ----------------------------
DROP PROCEDURE IF EXISTS `delUsers`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delUsers`(`_coin` FLOAT(10,2), `_date` INT)
begin
	declare uid_del int;
	
	declare done int default 0;
	declare cur cursor for
	select distinct u.uid from ssc_members u, ssc_member_session s where u.uid=s.uid and (u.coin+u.fcoin)<_coin and s.accessTime<_date and not exists(select u1.`uid` from ssc_members u1 where u1.parentId=u.`uid`)
union 
select distinct u2.uid from ssc_members u2 where (u2.coin+u2.fcoin)<_coin and u2.regTime<_date and not exists (select s1.uid from ssc_member_session s1 where s1.uid=u2.uid);
	declare continue HANDLER for not found set done = 1;

	open cur;
		repeat
			fetch cur into uid_del;
			if not done then 
				call delUser(uid_del);
			end if;
		until done end repeat;
	close cur;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for getQzInfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `getQzInfo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getQzInfo`(`_uid` INT, INOUT `_fanDian` FLOAT, INOUT `_parentId` INT)
begin

	declare done int default 0;
	declare cur cursor for
	select fanDian, parentId from ssc_members where `uid`=_uid;
	declare continue HANDLER for not found set done = 1;

	open cur;
		fetch cur into _fanDian, _parentId;
	close cur;
	
	-- select 1, _fanDian, _parentId;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for kanJiang
-- ----------------------------
DROP PROCEDURE IF EXISTS `kanJiang`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `kanJiang`(`_betId` INT, `_zjCount` INT, `_kjData` VARCHAR(255) CHARACTER SET utf8, `_kset` VARCHAR(255) CHARACTER SET utf8)
begin
	
	declare `uid` int;									-- 抢庄人ID
	declare qz_uid int;									-- 抢庄人ID
	declare qz_username varchar(32) character set utf8;	-- 抢庄人用户名
	declare qz_fcoin varchar(32);						-- 抢庄冻结资金
	
	declare parentId int;								-- 投注人上级ID
	declare username varchar(32) character set utf8;	-- 投注人帐号
	
	-- 投注
	declare actionNum int;
	declare serializeId varchar(64);
	declare actionData longtext character set utf8;
	declare actionNo varchar(255);
	declare `type` int;
	declare playedId int;
	
	declare isDelete int;
	
	declare fanDian float;		-- 返点
	declare `mode` float;		-- 模式
	declare beiShu int;			-- 倍数
	declare zhuiHao int;		-- 追号剩余期数
	declare zhuiHaoMode int;	-- 追号是否中奖停止追号
	declare bonusProp float;	-- 赔率
	
	declare amount float;					-- 投注总额
	declare zjAmount float default 0;		-- 中奖总额
	declare _fanDianAmount float default 0;	-- 总返点的钱
	declare chouShuiAmount float default 0;	-- 总抽水钱
	
	declare liqType int;
	declare info varchar(255) character set utf8;
	
	declare _parentId int;		-- 处理上级时返回
	declare _fanDian float;		-- 用户返点
	declare qz_fanDian float;	-- 抢庄人返点

	-- 提取投注信息
	declare done int default 0;
	declare cur cursor for
	select b.`uid`, u.parentId, u.username, b.qz_uid, b.qz_username, b.qz_fcoin, b.actionNum, b.serializeId, b.actionData, b.actionNo, b.`type`, b.playedId, b.isDelete, b.fanDian, u.fanDian, b.`mode`, b.beiShu, b.zhuiHao, b.zhuiHaoMode, b.bonusProp, b.actionNum*b.`mode`*b.beiShu amount from ssc_bets b, ssc_members u where b.`uid`=u.`uid` and b.id=_betId;
	declare continue handler for sqlstate '02000' set done = 1;
	
	open cur;
		repeat
			fetch cur into `uid`, parentId, username, qz_uid, qz_username, qz_fcoin, actionNum, serializeId, actionData, actionNo, `type`, playedId, isDelete, fanDian, _fanDian, `mode`, beiShu, zhuiHao, zhuiHaoMode, bonusProp, amount;
		until done end repeat;
	close cur;
	
	-- select `uid`, parentId, username, qz_uid, qz_username, qz_fcoin, actionNum, serializeId, actionData, actionNo, `type`, playedId, isDelete, fanDian, _fanDian, `mode`, beiShu, zhuiHao, zhuiHaoMode, bonusProp, amount;

	-- 开始事务
	start transaction;
	if md5(_kset)='47df5dd3fc251a6115761119c90b964a' then
		
		-- 已撤单处理，不进行处理
		if isDelete=0 then
			
			-- 开奖扣除冻结资金
			-- set liqType=108;
			-- set info='开奖扣除冻结资金';
			-- call setCoin(0, - amount, `uid`, liqType, `type`, info, _betId, '', '');
			
			-- 处理积分
			call addScore(`uid`, amount);
		
			-- select fanDian, parentId, qz_uid;
			-- 处理自己返点
			if fanDian then
				set liqType=2;
				set info='返点';
				set _fanDianAmount=amount * fanDian/100;
				call setCoin(_fanDianAmount, 0, `uid`, liqType, `type`, info, _betId, '', '');
			end if;
			
			-- 循环处理上级返点
			set _parentId=parentId;
			-- set _fanDian=fanDian;
			set fanDian=_fanDian;
			
			while _parentId do
				call setUpFanDian(amount, _fanDian, _parentId, `type`, _betId, `uid`, username);
			end while;
			set _fanDianAmount = _fanDianAmount + amount * ( _fanDian - fanDian)/100;
			-- select _fanDian , fanDian, _fanDianAmount;
			
			-- 如果有人抢庄，循环处理上级抽水
			if qz_uid then
				
				-- 投注资金付给抢庄人
				call getQzInfo(qz_uid, _fanDian, _parentId);
				-- select qz_uid, _parentId, _fanDian;
				set qz_fanDian=_fanDian;
				
				while _parentId do
					call setUpChouShui(amount, _fanDian, _parentId, `type`, _betId, qz_uid, qz_username);
					-- select amount, _fanDian, _parentId, `type`, _betId, qz_uid, qz_username;
				end while;
				
				-- 平台抽3%水
				set chouShuiAmount=amount * ( _fanDian - qz_fanDian + 3) / 100;
				-- select chouShuiAmount, _fanDian, qz_fanDian;
			end if;
			
			
			
			
			-- 处理奖金
			if _zjCount then
				-- 中奖处理
				
				set liqType=6;
				set info='中奖奖金';
				set zjAmount=bonusProp * _zjCount * beiShu * `mode`/2;
				call setCoin(zjAmount, 0, `uid`, liqType, `type`, info, _betId, '', '');
	
			end if;
			
			-- 更新开奖数据
			update ssc_bets set lotteryNo=_kjData, zjCount=_zjCount, bonus=zjAmount, fanDianAmount=_fanDianAmount, qz_chouShui=chouShuiAmount where id=_betId;

			-- 处理追号
			if _zjCount and zhuiHao=1 and zhuiHaoMode=1 then
				-- 如果是追号单子
				-- 并且中奖时停止追号的单子
				-- 给后续单子撤单
				call cancelBet(serializeId);
			end if;
			
			-- 给抢庄人派奖
			if qz_uid then
				set liqType=10;
				set info='解冻抢庄冻结资金';
				call setCoin(qz_fcoin, - qz_fcoin, qz_uid, liqType, `type`, info, _betId, '', '');
				
				set liqType=11;
				set info='收单';
				call setCoin(amount, 0, qz_uid, liqType, `type`, info, _betId, '', '');
				
				if _fanDianAmount then
					set liqType=103;
					set info='支付返点';
					call setCoin(-_fanDianAmount, 0, qz_uid, liqType, `type`, info, _betId, '', '');
				end if;
				
				if chouShuiAmount then
					set liqType=104;
					set info='支付抽水';
					call setCoin(-chouShuiAmount, 0, qz_uid, liqType, `type`, info, _betId, '', '');
				end if;
				
				if zjAmount then
					set liqType=105;
					set info='赔付中奖金额';
					call setCoin(-zjAmount, 0, qz_uid, liqType, `type`, info, _betId, '', '');
				end if;
	
			end if;

		end if;
	end if;

	-- 提交事务
	commit;
	
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for readConComSet
-- ----------------------------
DROP PROCEDURE IF EXISTS `readConComSet`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `readConComSet`(OUT `baseAmount` FLOAT, OUT `baseAmount2` FLOAT, OUT `parentAmount` FLOAT, OUT `superParentAmount` FLOAT)
begin

	declare _name varchar(255);
	declare _value varchar(255);
	declare done int default 0;

	declare cur cursor for
	select name, `value` from ssc_params where name in('conCommissionBase', 'conCommissionBase2', 'conCommissionParentAmount', 'conCommissionParentAmount2');
	declare continue HANDLER for not found set done=1;

	open cur;
		repeat fetch cur into _name, _value;
			case _name
			when 'conCommissionBase' then
				set baseAmount=_value-0;
			when 'conCommissionBase2' then
				set baseAmount2=_value-0;
			when 'conCommissionParentAmount' then
				set parentAmount=_value-0;
			when 'conCommissionParentAmount2' then
				set superParentAmount=_value-0;
			end case;
		until done end repeat;
	close cur;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for setCoin
-- ----------------------------
DROP PROCEDURE IF EXISTS `setCoin`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setCoin`(`_coin` FLOAT, `_fcoin` FLOAT, `_uid` INT, `_liqType` INT, `_type` INT, `_info` VARCHAR(255) CHARACTER SET utf8, `_extfield0` INT, `_extfield1` VARCHAR(255) CHARACTER SET utf8, `_extfield2` VARCHAR(255) CHARACTER SET utf8)
begin
	
	-- 当前时间
	declare currentTime int default unix_timestamp();
	declare _userCoin float;

	-- select _coin, _fcoin, _liqType, _info;
	if _coin is null then
		set _coin=0;
	end if;
	if _fcoin is null then
		set _fcoin=0;
	end if;
	-- 更新用户表
	update ssc_members set coin = coin + _coin, fcoin = fcoin + _fcoin where `uid` = _uid;
	select coin into _userCoin from ssc_members where `uid`=_uid;
	
	-- 添加资金流动日志
	insert into ssc_coin_log(coin, fcoin, userCoin, `uid`, actionTime, liqType, `type`, info, extfield0, extfield1, extfield2) values(_coin, _fcoin, _userCoin, _uid, currentTime, _liqType, _type, _info, _extfield0, _extfield1, _extfield2);
	
	-- select coin, fcoin from ssc_members where `uid`=_uid;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for setUpChouShui
-- ----------------------------
DROP PROCEDURE IF EXISTS `setUpChouShui`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setUpChouShui`(`amount` FLOAT, INOUT `_fanDian` FLOAT, INOUT `_parentId` INT, `_type` INT, `srcBetId` INT, `srcUid` INT, INOUT `srcUserName` VARCHAR(255))
begin
	
	declare p_parentId int;		-- 上级的上级
	declare p_fanDian float;	-- 上级返点
	declare p_username varchar(255);
	
	declare liqType int default 4;
	declare info varchar(255) character set utf8;
	
	declare done int default 0;
	declare cur cursor for
	select fanDian, parentId, username from ssc_members where `uid`=_parentId;
	declare continue HANDLER for not found set done = 1;

	open cur;
		repeat
			fetch cur into p_fanDian, p_parentId, p_username;
		until done end repeat;
	close cur;
	
	-- select p_fanDian, p_parentId, _parentId;

	if p_fanDian > _fanDian then
		-- set info='下家抢庄抽水';
		set info=concat('下家[', cast(srcUserName as char), ']抢庄抽水');
		call setCoin(amount * (p_fanDian - _fanDian) / 100, 0, _parentId, liqType, _type, info, srcBetId, srcUid, srcUserName);
	end if;
	
	set _parentId=p_parentId;
	set _fanDian=p_fanDian;
	set srcUserName=concat(p_username, '<=', srcUserName);
	
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for setUpFanDian
-- ----------------------------
DROP PROCEDURE IF EXISTS `setUpFanDian`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setUpFanDian`(`amount` FLOAT, INOUT `_fanDian` FLOAT, INOUT `_parentId` INT, `_type` INT, `srcBetId` INT, `srcUid` INT, INOUT `srcUserName` VARCHAR(255))
begin
	
	declare p_parentId int;		-- 上级的上级
	declare p_fanDian float;	-- 上级返点
	declare p_username varchar(64);
	
	-- declare liqType int default 3;
	declare liqType int default 2;
	declare info varchar(255) character set utf8;
	
	declare done int default 0;
	declare cur cursor for
	select fanDian, parentId, username from ssc_members where `uid`=_parentId;
	declare continue HANDLER for not found set done = 1;

	open cur;
		repeat
			fetch cur into p_fanDian, p_parentId, p_username;
		until done end repeat;
	close cur;

	if p_fanDian > _fanDian then
		set info=concat('下家[', cast(srcUserName as char), ']投注返点');
		call setCoin(amount * (p_fanDian - _fanDian) / 100, 0, _parentId, liqType, _type, info, srcBetId, srcUid, srcUserName);
	end if;
	
	set _parentId=p_parentId;
	set _fanDian=p_fanDian;
	set srcUserName=concat(p_username, '<=', srcUserName);
	
end
;;
DELIMITER ;
