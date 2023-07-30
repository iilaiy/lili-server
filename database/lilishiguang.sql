/*
Navicat MySQL Data Transfer

Source Server         : lyd
Source Server Version : 50737
Source Host           : localhost:3306
Source Database       : lilishiguang

Target Server Type    : MYSQL
Target Server Version : 50737
File Encoding         : 65001

Date: 2023-07-30 08:01:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `markname` varchar(255) DEFAULT NULL COMMENT '备注',
  `user_id` varchar(255) NOT NULL COMMENT '用户id',
  `friend_id` varchar(255) NOT NULL COMMENT '好友id',
  `create_time` date NOT NULL COMMENT '生成时间',
  `status` int(11) NOT NULL COMMENT '状态（0：已为好友，1：申请中，2：未同意，3：已删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friend
-- ----------------------------
INSERT INTO `friend` VALUES ('2', '小屁孩', '7091176191624740864', '7091176498379358208', '2023-07-30', '0');
INSERT INTO `friend` VALUES ('3', 'pp', '7091176498379358208', '7091176191624740864', '2023-07-30', '0');

-- ----------------------------
-- Table structure for friendmessage
-- ----------------------------
DROP TABLE IF EXISTS `friendmessage`;
CREATE TABLE `friendmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL COMMENT '发送者id',
  `friend_id` varchar(255) NOT NULL COMMENT '接收者id',
  `content` varchar(255) NOT NULL COMMENT '发送内容',
  `types` int(11) NOT NULL COMMENT '内容类型',
  `time` date NOT NULL COMMENT '发送时间',
  `status` int(11) NOT NULL COMMENT '状态（0：已读，1：未读）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friendmessage
-- ----------------------------

-- ----------------------------
-- Table structure for groupmembers
-- ----------------------------
DROP TABLE IF EXISTS `groupmembers`;
CREATE TABLE `groupmembers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL COMMENT '用户id',
  `group_id` varchar(255) NOT NULL COMMENT '群id',
  `group_name` varchar(255) NOT NULL COMMENT '群内名',
  `tip` int(11) NOT NULL DEFAULT '0' COMMENT '未读消息数',
  `shield` int(11) NOT NULL DEFAULT '0' COMMENT '是否屏蔽消息（0：不屏蔽，1：屏蔽）',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态（0：正常，1：已退出）',
  `add_time` date NOT NULL COMMENT '加入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groupmembers
-- ----------------------------
INSERT INTO `groupmembers` VALUES ('2', '7091176191624740864', '7091176191624740999', 'it交流群', '0', '0', '0', '2023-07-30');

-- ----------------------------
-- Table structure for groupmessage
-- ----------------------------
DROP TABLE IF EXISTS `groupmessage`;
CREATE TABLE `groupmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL COMMENT '群id',
  `user_id` varchar(255) NOT NULL COMMENT '发送者id',
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
  `group_id` varchar(255) NOT NULL COMMENT '群id',
  `user_id` varchar(255) NOT NULL COMMENT '群创建者id',
  `name` varchar(255) NOT NULL COMMENT '群名称',
  `imgurl` varchar(255) NOT NULL DEFAULT 'group_default.png' COMMENT '群封面链接',
  `notice` varchar(255) DEFAULT NULL COMMENT '群公告',
  `create_time` date NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES ('7091176191624740999', '7091176191624740864', 'it交流群', 'group_default.png', '还没公告，看什么看', '2023-07-30');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` varchar(255) NOT NULL COMMENT '用户id',
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
INSERT INTO `users` VALUES ('7091176129368686592', '小屁孩', '$2a$10$JotE7wjGyafdJmCcSnz1Juj8ghnf5oH22O1I4OPZPW1KtSIWNe8CC', '3469854373@qq.com', 'asexual', null, null, null, 'avatar_default.png', '2023-07-30', '0');
INSERT INTO `users` VALUES ('7091176191624740864', '小黎', '$2a$10$wlP1.MrSCfrVt58e/ALE2O5kmheqfA5uudqp9.Q33HlyxGfW9SaGm', '2469854373@qq.com', 'asexual', null, null, null, 'avatar_default.png', '2023-07-30', '0');
INSERT INTO `users` VALUES ('7091176498379358208', '佳佳', '$2a$10$l74n9jVqDmeuN5ew/EWva.SdoyDXsAxV7BDRcYu8DOt053JXpAiLG', '1813235179@qq.com', 'asexual', null, null, null, 'avatar_default.png', '2023-07-30', '0');
