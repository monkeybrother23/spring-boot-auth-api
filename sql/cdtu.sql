/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : cdtu

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 15/01/2022 11:04:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_authority
-- ----------------------------
DROP TABLE IF EXISTS `sys_authority`;
CREATE TABLE `sys_authority`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `authority_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名',
  ` version` int(0) NOT NULL COMMENT '数据版本号',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_authority
-- ----------------------------
INSERT INTO `sys_authority` VALUES ('1', 'demo:read', 1, '2021-10-18 20:32:23', 'system', '2021-10-18 20:32:30', 'ystem');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_no` int(0) NULL DEFAULT NULL,
  `pid` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` int(0) NOT NULL COMMENT '数据版本号',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '软件工程', 1, NULL, 1, '2022-01-15 11:01:58', 'System', '2022-01-15 11:04:25', 'System');
INSERT INTO `sys_menu` VALUES ('2', '高中', 2, NULL, 1, '2022-01-15 11:02:00', 'System', '2022-01-15 11:04:27', 'System');
INSERT INTO `sys_menu` VALUES ('3', 'java', 1, '1', 1, '2022-01-15 11:02:02', 'System', '2022-01-15 11:04:28', 'System');
INSERT INTO `sys_menu` VALUES ('4', '算法', 2, '1', 1, '2022-01-15 11:02:05', 'System', '2022-01-15 11:04:29', 'System');
INSERT INTO `sys_menu` VALUES ('5', '高中英语', 1, '2', 1, '2022-01-15 11:02:02', 'System', '2022-01-15 11:04:31', 'System');
INSERT INTO `sys_menu` VALUES ('6', 'hah', 1, '10', 1, '2022-01-15 11:02:02', 'System', '2022-01-15 11:04:33', 'System');
INSERT INTO `sys_menu` VALUES ('7', '排序算法', 1, '4', 1, '2022-01-15 11:02:02', 'System', '2022-01-15 11:04:35', 'System');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限角色名',
  `version` int(0) NOT NULL COMMENT '数据版本号',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'ROLE_test', 1, '2021-10-18 20:30:18', 'system', '2021-10-18 20:30:32', 'system');
INSERT INTO `sys_role` VALUES ('2', 'ROLE_Admin', 1, '2022-01-15 10:56:28', 'system', '2022-01-15 10:56:44', 'system');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `version` int(0) NOT NULL COMMENT '数据版本号',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'albert', '$2a$10$v1R4ufaet6nJwUBaFM0I4OTCXUXCtvPrdpSfyMn5dOJ8LPWgKWPqK', 1, '2020-07-09 16:30:51', '10', '2020-12-16 10:37:03', '10');

-- ----------------------------
-- Table structure for sys_user_authority_link
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_authority_link`;
CREATE TABLE `sys_user_authority_link`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户id',
  `authority_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限id',
  `version` int(0) NOT NULL COMMENT '数据版本号',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_authority_link
-- ----------------------------
INSERT INTO `sys_user_authority_link` VALUES ('1', '1', '1', 1, '2021-10-18 20:37:53', 'system', '2021-10-18 20:37:55', 'system');

-- ----------------------------
-- Table structure for sys_user_role_link
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role_link`;
CREATE TABLE `sys_user_role_link`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role_link
-- ----------------------------
INSERT INTO `sys_user_role_link` VALUES ('1', '1', '1');

SET FOREIGN_KEY_CHECKS = 1;
