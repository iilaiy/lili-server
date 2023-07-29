/*
Navicat MySQL Data Transfer

Source Server         : lyd
Source Server Version : 50737
Source Host           : localhost:3306
Source Database       : lilishiguang

Target Server Type    : MYSQL
Target Server Version : 50737
File Encoding         : 65001

Date: 2023-07-29 23:25:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `markname` varchar(255) DEFAULT NULL COMMENT '备注',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `friend_id` bigint(20) NOT NULL COMMENT '好友id',
  `create_time` date NOT NULL COMMENT '生成时间',
  `status` int(11) NOT NULL COMMENT '状态（0：已为好友，1：申请中，2：未同意，3：已删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friend
-- ----------------------------
INSERT INTO `friend` VALUES ('1', '小黎', '7090285809957339000', '7090803498295493000', '2023-07-29', '0');

-- ----------------------------
-- Table structure for groupmember
-- ----------------------------
DROP TABLE IF EXISTS `groupmember`;
CREATE TABLE `groupmember` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL COMMENT '群id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `group_name` varchar(255) NOT NULL COMMENT '群内名',
  `tip` int(11) NOT NULL DEFAULT '0' COMMENT '未读消息数',
  `shield` int(11) NOT NULL DEFAULT '0' COMMENT '是否屏蔽群消息(0:不屏蔽，1:屏蔽)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态（0：正常，1：已退出）',
  `add_time` date NOT NULL COMMENT '加入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groupmember
-- ----------------------------

-- ----------------------------
-- Table structure for groupmessage
-- ----------------------------
DROP TABLE IF EXISTS `groupmessage`;
CREATE TABLE `groupmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL COMMENT '群id',
  `user_id` bigint(20) NOT NULL COMMENT '发送者id',
  `content` varchar(255) NOT NULL COMMENT '发送内容',
  `types` int(11) NOT NULL COMMENT '内容类型',
  `sending_time` date NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groupmessage
-- ----------------------------

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `group_id` bigint(20) NOT NULL COMMENT '群id',
  `user_id` bigint(20) NOT NULL COMMENT '群创建者id',
  `name` varchar(255) NOT NULL COMMENT '群名称',
  `imgurl` varchar(255) NOT NULL DEFAULT 'group_default.png' COMMENT '群封面链接',
  `notice` varchar(255) DEFAULT NULL COMMENT '群公告',
  `create_time` date NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES ('7090285809957339000', '7090285809957339000', '不知道', 'group_default.png', '123', '2023-07-29');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '发送者id',
  `friend_id` bigint(20) NOT NULL COMMENT '接收者id',
  `content` varchar(255) NOT NULL COMMENT '发送内容',
  `types` int(11) NOT NULL COMMENT '内容类型',
  `time` date NOT NULL COMMENT '发送时间',
  `status` int(11) NOT NULL COMMENT '状态（0：已读，1：未读）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `gender` varchar(255) DEFAULT 'asexual' COMMENT '性别',
  `birth` date DEFAULT NULL COMMENT '生日',
  `phone` int(11) DEFAULT NULL COMMENT '手机号',
  `explain` varchar(255) DEFAULT NULL COMMENT '签名',
  `imgurl` varchar(255) DEFAULT 'avatar_default.png' COMMENT '头像',
  `register_time` date NOT NULL COMMENT '注册时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '用户状态（0：正常，1：已注销）',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('7090285809957339000', '佳佳', '$2a$10$TJlfseYnvcN9roFsdi.pLOAaSlCtxtriK.PXxF/JMOzd5ItlO7faS', '226894038@qq.com', 'asexual', null, null, null, 'avatar_default.png', '2023-07-27', '0');
INSERT INTO `users` VALUES ('7090802247277216000', '黎黎', '$2a$10$9ajqP0GX2fLImQoW37cckefP38L71tEfTFxHWTpvn7utQClLVgeDO', '1469854373@qq.com', 'asexual', null, null, null, 'avatar_default.png', '2023-07-29', '0');
INSERT INTO `users` VALUES ('7090803498295493000', '小黎', '$2a$10$7K/r7vgC76tjYpx..JWDde9Rpi7Pl55SlZDmN2e57Z3zaplb5nCxO', '2469854373@qq.com', 'asexual', null, null, null, 'avatar_default.png', '2023-07-29', '0');
INSERT INTO `users` VALUES ('7090803751052640000', '小屁孩', '$2a$10$//k50MJqp7PGR7hgsQRRGefqjeqVED33TiVIoHDwRCffztieiONQy', '3469854373@qq.com', 'asexual', null, null, null, 'avatar_default.png', '2023-07-29', '0');
