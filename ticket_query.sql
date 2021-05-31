/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : ticket_query

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 02/05/2021 22:08:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add user profile', 7, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (26, 'Can change user profile', 7, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (27, 'Can delete user profile', 7, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (28, 'Can view user profile', 7, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (29, 'Can add place type', 8, 'add_placetype');
INSERT INTO `auth_permission` VALUES (30, 'Can change place type', 8, 'change_placetype');
INSERT INTO `auth_permission` VALUES (31, 'Can delete place type', 8, 'delete_placetype');
INSERT INTO `auth_permission` VALUES (32, 'Can view place type', 8, 'view_placetype');
INSERT INTO `auth_permission` VALUES (33, 'Can add ticket', 9, 'add_ticket');
INSERT INTO `auth_permission` VALUES (34, 'Can change ticket', 9, 'change_ticket');
INSERT INTO `auth_permission` VALUES (35, 'Can delete ticket', 9, 'delete_ticket');
INSERT INTO `auth_permission` VALUES (36, 'Can view ticket', 9, 'view_ticket');
INSERT INTO `auth_permission` VALUES (37, 'Can add position type', 10, 'add_positiontype');
INSERT INTO `auth_permission` VALUES (38, 'Can change position type', 10, 'change_positiontype');
INSERT INTO `auth_permission` VALUES (39, 'Can delete position type', 10, 'delete_positiontype');
INSERT INTO `auth_permission` VALUES (40, 'Can view position type', 10, 'view_positiontype');
INSERT INTO `auth_permission` VALUES (41, 'Can add train type', 11, 'add_traintype');
INSERT INTO `auth_permission` VALUES (42, 'Can change train type', 11, 'change_traintype');
INSERT INTO `auth_permission` VALUES (43, 'Can delete train type', 11, 'delete_traintype');
INSERT INTO `auth_permission` VALUES (44, 'Can view train type', 11, 'view_traintype');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (8, 'ticket_manage', 'placetype');
INSERT INTO `django_content_type` VALUES (10, 'ticket_manage', 'positiontype');
INSERT INTO `django_content_type` VALUES (9, 'ticket_manage', 'ticket');
INSERT INTO `django_content_type` VALUES (11, 'ticket_manage', 'traintype');
INSERT INTO `django_content_type` VALUES (7, 'users', 'userprofile');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2021-05-01 10:13:11.553786');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2021-05-01 10:13:11.673467');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2021-05-01 10:13:12.007606');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2021-05-01 10:13:12.072400');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2021-05-01 10:13:12.080379');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2021-05-01 10:13:12.140219');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2021-05-01 10:13:12.179115');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2021-05-01 10:13:12.216016');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2021-05-01 10:13:12.223995');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2021-05-01 10:13:12.257935');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2021-05-01 10:13:12.260898');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2021-05-01 10:13:12.268876');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2021-05-01 10:13:12.302407');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2021-05-01 10:13:12.336341');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2021-05-01 10:13:12.371222');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2021-05-01 10:13:12.379242');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2021-05-01 10:13:12.414107');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2021-05-01 10:13:12.432067');
INSERT INTO `django_migrations` VALUES (19, 'users', '0001_initial', '2021-05-01 10:13:12.462976');
INSERT INTO `django_migrations` VALUES (20, 'ticket_manage', '0001_initial', '2021-05-01 11:35:35.168827');
INSERT INTO `django_migrations` VALUES (21, 'ticket_manage', '0002_auto_20210501_1135', '2021-05-01 11:35:35.335383');
INSERT INTO `django_migrations` VALUES (22, 'ticket_manage', '0003_auto_20210501_1314', '2021-05-01 13:14:57.273710');
INSERT INTO `django_migrations` VALUES (23, 'users', '0002_userprofile_user_type', '2021-05-01 13:14:57.343555');
INSERT INTO `django_migrations` VALUES (24, 'users', '0003_auto_20210501_1321', '2021-05-01 13:21:32.873049');
INSERT INTO `django_migrations` VALUES (25, 'users', '0004_auto_20210501_2241', '2021-05-01 22:41:20.042666');
INSERT INTO `django_migrations` VALUES (26, 'ticket_manage', '0004_auto_20210502_1430', '2021-05-02 14:30:32.018549');
INSERT INTO `django_migrations` VALUES (27, 'users', '0005_auto_20210502_2017', '2021-05-02 20:17:31.997710');
INSERT INTO `django_migrations` VALUES (28, 'users', '0006_auto_20210502_2020', '2021-05-02 20:20:23.853285');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ticket_manage_placetype
-- ----------------------------
DROP TABLE IF EXISTS `ticket_manage_placetype`;
CREATE TABLE `ticket_manage_placetype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `place_name`(`place_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_manage_placetype
-- ----------------------------
INSERT INTO `ticket_manage_placetype` VALUES (3, '');
INSERT INTO `ticket_manage_placetype` VALUES (7, '上海');
INSERT INTO `ticket_manage_placetype` VALUES (6, '南京');
INSERT INTO `ticket_manage_placetype` VALUES (4, '无');
INSERT INTO `ticket_manage_placetype` VALUES (5, '海南');
INSERT INTO `ticket_manage_placetype` VALUES (1, '深圳');
INSERT INTO `ticket_manage_placetype` VALUES (2, '湖南');

-- ----------------------------
-- Table structure for ticket_manage_positiontype
-- ----------------------------
DROP TABLE IF EXISTS `ticket_manage_positiontype`;
CREATE TABLE `ticket_manage_positiontype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_manage_positiontype
-- ----------------------------
INSERT INTO `ticket_manage_positiontype` VALUES (1, '商务座');
INSERT INTO `ticket_manage_positiontype` VALUES (2, '一等座');
INSERT INTO `ticket_manage_positiontype` VALUES (3, '二等包座');
INSERT INTO `ticket_manage_positiontype` VALUES (4, '高级软卧');
INSERT INTO `ticket_manage_positiontype` VALUES (5, '软卧');
INSERT INTO `ticket_manage_positiontype` VALUES (6, '动卧');
INSERT INTO `ticket_manage_positiontype` VALUES (7, '硬卧');
INSERT INTO `ticket_manage_positiontype` VALUES (8, '软座');
INSERT INTO `ticket_manage_positiontype` VALUES (9, '硬座');
INSERT INTO `ticket_manage_positiontype` VALUES (10, '无座');
INSERT INTO `ticket_manage_positiontype` VALUES (11, '其他');

-- ----------------------------
-- Table structure for ticket_manage_ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket_manage_ticket`;
CREATE TABLE `ticket_manage_ticket`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime(6) NOT NULL,
  `arrive_time` datetime(6) NOT NULL,
  `arrive_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `position_type_id` int(11) DEFAULT NULL,
  `start_place_id` int(11) DEFAULT NULL,
  `train_type_id` int(11) DEFAULT NULL,
  `target_place_id` int(11) DEFAULT NULL,
  `dong_wo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `er_deng` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gao_ji_ruan_wo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qi_ta` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ruan_zuo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shang_wu` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `wu_zuo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `yi_deng` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ying_wo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ying_zuo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ticket_manage_ticket_position_type_id_d01864cc_fk_ticket_ma`(`position_type_id`) USING BTREE,
  INDEX `ticket_manage_ticket_target_place_id_cace8781_fk_ticket_ma`(`target_place_id`) USING BTREE,
  INDEX `ticket_manage_ticket_start_place_id_f64b27d7_fk_ticket_ma`(`start_place_id`) USING BTREE,
  INDEX `ticket_manage_ticket_train_type_id_04d60d2a_fk_ticket_ma`(`train_type_id`) USING BTREE,
  CONSTRAINT `ticket_manage_ticket_position_type_id_d01864cc_fk_ticket_ma` FOREIGN KEY (`position_type_id`) REFERENCES `ticket_manage_positiontype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ticket_manage_ticket_start_place_id_f64b27d7_fk_ticket_ma` FOREIGN KEY (`start_place_id`) REFERENCES `ticket_manage_placetype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ticket_manage_ticket_target_place_id_cace8781_fk_ticket_ma` FOREIGN KEY (`target_place_id`) REFERENCES `ticket_manage_placetype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ticket_manage_ticket_train_type_id_04d60d2a_fk_ticket_ma` FOREIGN KEY (`train_type_id`) REFERENCES `ticket_manage_traintype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_manage_ticket
-- ----------------------------
INSERT INTO `ticket_manage_ticket` VALUES (4, '2021-05-01 12:37:34.396487', '2021-05-01 12:37:34.396487', '晚点', 1, 2, 14, 1, '-', '-', '-', '-', '-', '-', '-', '-', '-', '-');
INSERT INTO `ticket_manage_ticket` VALUES (5, '2021-05-01 12:37:34.396487', '2021-05-01 12:37:34.396487', '晚点', 1, 2, 14, 1, '-', '-', '-', '-', '-', '-', '-', '-', '-', '-');
INSERT INTO `ticket_manage_ticket` VALUES (10, '2021-05-01 12:37:34.396487', '2021-05-01 12:37:34.396487', '晚点', 1, 2, 14, 1, '-', '-', '-', '-', '-', '-', '-', '-', '-', '-');
INSERT INTO `ticket_manage_ticket` VALUES (11, '2021-05-01 12:37:34.396487', '2021-05-01 12:37:34.396487', '晚点', 1, 2, 14, 1, '-', '-', '-', '-', '-', '-', '-', '-', '-', '-');
INSERT INTO `ticket_manage_ticket` VALUES (12, '2021-05-01 12:37:34.396487', '2021-05-01 12:37:34.396487', '晚点', 1, 2, 14, 1, '-', '-', '-', '-', '-', '-', '-', '-', '-', '-');
INSERT INTO `ticket_manage_ticket` VALUES (13, '2021-05-01 12:37:34.396487', '2021-05-01 12:37:34.396487', '晚点', 1, 2, 14, 1, '-', '-', '-', '-', '-', '-', '-', '-', '-', '-');
INSERT INTO `ticket_manage_ticket` VALUES (14, '2021-05-01 12:37:34.396487', '2021-05-01 12:37:34.396487', '晚点', 1, 2, 14, 1, '-', '-', '-', '-', '-', '-', '-', '-', '-', '-');
INSERT INTO `ticket_manage_ticket` VALUES (15, '2021-05-01 12:37:34.396487', '2021-05-01 12:37:34.396487', '晚点', 1, 2, 14, 1, '-', '-', '-', '-', '-', '-', '-', '-', '-', '-');
INSERT INTO `ticket_manage_ticket` VALUES (16, '2021-03-15 00:00:00.000000', '2021-05-11 00:00:00.000000', '43', 1, 1, 14, 1, '-', '-', '-', '-', '-', '-', '-', '-', '-', '-');
INSERT INTO `ticket_manage_ticket` VALUES (19, '2021-03-15 00:00:00.000000', '2021-05-11 00:00:00.000000', '231', 3, 4, 16, 1, '-', '-', '-', '-', '-', '-', '-', '-', '-', '-');
INSERT INTO `ticket_manage_ticket` VALUES (20, '2021-05-03 00:00:00.000000', '2021-05-08 00:00:00.000000', '正点', 3, 5, 16, 1, '-', '20', '无', '-', '-', '233', '-', '有', '-', '-');
INSERT INTO `ticket_manage_ticket` VALUES (21, '2021-05-03 00:00:00.000000', '2021-05-11 00:00:00.000000', '正点', 2, 5, 15, 5, '-', '20', '13', '-', '-', '-', '-', '-', '-', '-');
INSERT INTO `ticket_manage_ticket` VALUES (22, '2021-03-15 00:00:00.000000', '2021-05-11 00:00:00.000000', '正点', 3, 5, 14, 5, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `ticket_manage_ticket` VALUES (24, '2021-05-14 02:02:00.000000', '2021-05-15 00:00:00.000000', '正点', 2, 5, 16, 6, '4', '无', '3', '2', '5', '12', '7', '13', '2', '6');
INSERT INTO `ticket_manage_ticket` VALUES (25, '2021-05-02 00:00:00.000000', '2021-05-22 00:00:00.000000', '正点', 3, 2, 16, 5, '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for ticket_manage_traintype
-- ----------------------------
DROP TABLE IF EXISTS `ticket_manage_traintype`;
CREATE TABLE `ticket_manage_traintype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type_name`(`type_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_manage_traintype
-- ----------------------------
INSERT INTO `ticket_manage_traintype` VALUES (19, '321');
INSERT INTO `ticket_manage_traintype` VALUES (15, 'D321');
INSERT INTO `ticket_manage_traintype` VALUES (16, 'G321');
INSERT INTO `ticket_manage_traintype` VALUES (14, 'K12');
INSERT INTO `ticket_manage_traintype` VALUES (17, 'T32');
INSERT INTO `ticket_manage_traintype` VALUES (18, 'Z32');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nick_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_type` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `full_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `head_img_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `personal` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES (8, 'admin', 'admin', '小鬼', 0, 0, '1111@qq.com', '哈哈哈哈', '', '打开链接发的卡就发的撒酒疯打开撒附近的萨洛克埃里克森 附近的卢萨卡附件在校园里', '18222222222', '男');
INSERT INTO `users_userprofile` VALUES (9, 'ceshi', 'ceshi', '普通用户', 99, 18, '4444@qq.com', '普通用户', '', '老百晓越中览古要艾跃进打开撒酒疯的考虑时间', '18222222222', '男');

SET FOREIGN_KEY_CHECKS = 1;
