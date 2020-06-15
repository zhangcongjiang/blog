/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2020-06-15 16:16:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account_emailaddress
-- ----------------------------
DROP TABLE IF EXISTS `account_emailaddress`;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_oauth_ouser_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_emailaddress
-- ----------------------------

-- ----------------------------
-- Table structure for account_emailconfirmation
-- ----------------------------
DROP TABLE IF EXISTS `account_emailconfirmation`;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `sent` datetime DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirmation_email_address_id_5b7f8c58_fk` (`email_address_id`),
  CONSTRAINT `account_emailconfirmation_email_address_id_5b7f8c58_fk` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_emailconfirmation
-- ----------------------------

-- ----------------------------
-- Table structure for album_album
-- ----------------------------
DROP TABLE IF EXISTS `album_album`;
CREATE TABLE `album_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` longtext NOT NULL,
  `img_url` varchar(200) NOT NULL,
  `loves` int(11) NOT NULL,
  `upload_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of album_album
-- ----------------------------
INSERT INTO `album_album` VALUES ('1', '1', '1', 'StormSha的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好', '/static/images/6.jpg', '0', '2020-04-07 17:21:32.792960');
INSERT INTO `album_album` VALUES ('2', '3', '巴厘岛希尔顿酒店', '巴厘岛希尔顿酒店', '/static/images/balidao_hilton.jpg', '2', '2020-05-09 15:41:27.000000');
INSERT INTO `album_album` VALUES ('4', '2', '风景1', '风景1', '/static/images/title1.jpg', '0', '2020-06-12 15:28:02.964089');
INSERT INTO `album_album` VALUES ('5', '4', '风景', '风景', '/static/images/title2.jpg', '0', '2020-06-12 15:28:44.198060');
INSERT INTO `album_album` VALUES ('6', '5', '风景', '风景', '/static/images/title3.jpg', '0', '2020-06-12 15:28:59.820176');
INSERT INTO `album_album` VALUES ('7', '6', '风景', '风景', '/static/images/title4.jpg', '0', '2020-06-12 15:29:13.318972');
INSERT INTO `album_album` VALUES ('8', '7', '风景', '风景', '/static/images/title4.jpg', '0', '2020-06-12 15:29:33.615185');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add 文章', '6', 'add_article');
INSERT INTO `auth_permission` VALUES ('17', 'Can change 文章', '6', 'change_article');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete 文章', '6', 'delete_article');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 图片轮播', '7', 'add_carousel');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 图片轮播', '7', 'change_carousel');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 图片轮播', '7', 'delete_carousel');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 分类', '8', 'add_category');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 分类', '8', 'change_category');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 分类', '8', 'delete_category');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 友情链接', '9', 'add_friendlink');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 友情链接', '9', 'change_friendlink');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 友情链接', '9', 'delete_friendlink');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 关键词', '10', 'add_keyword');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 关键词', '10', 'change_keyword');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 关键词', '10', 'delete_keyword');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 死链', '11', 'add_silian');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 死链', '11', 'change_silian');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 死链', '11', 'delete_silian');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 标签', '12', 'add_tag');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 标签', '12', 'change_tag');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 标签', '12', 'delete_tag');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 时间线', '13', 'add_timeline');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 时间线', '13', 'change_timeline');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 时间线', '13', 'delete_timeline');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 大分类', '14', 'add_bigcategory');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 大分类', '14', 'change_bigcategory');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 大分类', '14', 'delete_bigcategory');
INSERT INTO `auth_permission` VALUES ('43', 'Can add 用户', '15', 'add_ouser');
INSERT INTO `auth_permission` VALUES ('44', 'Can change 用户', '15', 'change_ouser');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete 用户', '15', 'delete_ouser');
INSERT INTO `auth_permission` VALUES ('46', 'Can add 关于自己评论', '16', 'add_aboutcomment');
INSERT INTO `auth_permission` VALUES ('47', 'Can change 关于自己评论', '16', 'change_aboutcomment');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete 关于自己评论', '16', 'delete_aboutcomment');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 文章评论', '17', 'add_articlecomment');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 文章评论', '17', 'change_articlecomment');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 文章评论', '17', 'delete_articlecomment');
INSERT INTO `auth_permission` VALUES ('52', 'Can add comment user', '18', 'add_commentuser');
INSERT INTO `auth_permission` VALUES ('53', 'Can change comment user', '18', 'change_commentuser');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete comment user', '18', 'delete_commentuser');
INSERT INTO `auth_permission` VALUES ('55', 'Can add 给我留言', '19', 'add_messagecomment');
INSERT INTO `auth_permission` VALUES ('56', 'Can change 给我留言', '19', 'change_messagecomment');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete 给我留言', '19', 'delete_messagecomment');
INSERT INTO `auth_permission` VALUES ('58', 'Can add site', '20', 'add_site');
INSERT INTO `auth_permission` VALUES ('59', 'Can change site', '20', 'change_site');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete site', '20', 'delete_site');
INSERT INTO `auth_permission` VALUES ('61', 'Can add email address', '21', 'add_emailaddress');
INSERT INTO `auth_permission` VALUES ('62', 'Can change email address', '21', 'change_emailaddress');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete email address', '21', 'delete_emailaddress');
INSERT INTO `auth_permission` VALUES ('64', 'Can add email confirmation', '22', 'add_emailconfirmation');
INSERT INTO `auth_permission` VALUES ('65', 'Can change email confirmation', '22', 'change_emailconfirmation');
INSERT INTO `auth_permission` VALUES ('66', 'Can delete email confirmation', '22', 'delete_emailconfirmation');
INSERT INTO `auth_permission` VALUES ('67', 'Can add social account', '23', 'add_socialaccount');
INSERT INTO `auth_permission` VALUES ('68', 'Can change social account', '23', 'change_socialaccount');
INSERT INTO `auth_permission` VALUES ('69', 'Can delete social account', '23', 'delete_socialaccount');
INSERT INTO `auth_permission` VALUES ('70', 'Can add social application', '24', 'add_socialapp');
INSERT INTO `auth_permission` VALUES ('71', 'Can change social application', '24', 'change_socialapp');
INSERT INTO `auth_permission` VALUES ('72', 'Can delete social application', '24', 'delete_socialapp');
INSERT INTO `auth_permission` VALUES ('73', 'Can add social application token', '25', 'add_socialtoken');
INSERT INTO `auth_permission` VALUES ('74', 'Can change social application token', '25', 'change_socialtoken');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete social application token', '25', 'delete_socialtoken');
INSERT INTO `auth_permission` VALUES ('76', 'Can add 公告', '26', 'add_activate');
INSERT INTO `auth_permission` VALUES ('77', 'Can change 公告', '26', 'change_activate');
INSERT INTO `auth_permission` VALUES ('78', 'Can delete 公告', '26', 'delete_activate');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for comment_aboutcomment
-- ----------------------------
DROP TABLE IF EXISTS `comment_aboutcomment`;
CREATE TABLE `comment_aboutcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `content` longtext NOT NULL,
  `author_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `rep_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_aboutcomment_author_id_d11e841e_fk_comment_c` (`author_id`),
  KEY `comment_aboutcomment_parent_id_a12294ac_fk_comment_a` (`parent_id`),
  KEY `comment_aboutcomment_rep_to_id_e44ab5ad_fk_comment_a` (`rep_to_id`),
  CONSTRAINT `comment_aboutcomment_author_id_d11e841e_fk_comment_c` FOREIGN KEY (`author_id`) REFERENCES `comment_commentuser` (`id`),
  CONSTRAINT `comment_aboutcomment_parent_id_a12294ac_fk_comment_a` FOREIGN KEY (`parent_id`) REFERENCES `comment_aboutcomment` (`id`),
  CONSTRAINT `comment_aboutcomment_rep_to_id_e44ab5ad_fk_comment_a` FOREIGN KEY (`rep_to_id`) REFERENCES `comment_aboutcomment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment_aboutcomment
-- ----------------------------

-- ----------------------------
-- Table structure for comment_articlecomment
-- ----------------------------
DROP TABLE IF EXISTS `comment_articlecomment`;
CREATE TABLE `comment_articlecomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `content` longtext NOT NULL,
  `author_id` int(11) NOT NULL,
  `belong_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `rep_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_articlecomme_author_id_46e6fdb8_fk_comment_c` (`author_id`),
  KEY `comment_articlecomment_belong_id_58e0232c_fk_storm_article_id` (`belong_id`),
  KEY `comment_articlecomme_parent_id_f0ab594d_fk_comment_a` (`parent_id`),
  KEY `comment_articlecomme_rep_to_id_84dab3d5_fk_comment_a` (`rep_to_id`),
  CONSTRAINT `comment_articlecomme_author_id_46e6fdb8_fk_comment_c` FOREIGN KEY (`author_id`) REFERENCES `comment_commentuser` (`id`),
  CONSTRAINT `comment_articlecomme_parent_id_f0ab594d_fk_comment_a` FOREIGN KEY (`parent_id`) REFERENCES `comment_articlecomment` (`id`),
  CONSTRAINT `comment_articlecomme_rep_to_id_84dab3d5_fk_comment_a` FOREIGN KEY (`rep_to_id`) REFERENCES `comment_articlecomment` (`id`),
  CONSTRAINT `comment_articlecomment_belong_id_58e0232c_fk_storm_article_id` FOREIGN KEY (`belong_id`) REFERENCES `storm_article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment_articlecomment
-- ----------------------------
INSERT INTO `comment_articlecomment` VALUES ('21', '2020-05-13 11:05:04', 'asdafsaf', '26', '13', null, null);
INSERT INTO `comment_articlecomment` VALUES ('22', '2020-05-13 11:12:23', 'hjhj', '26', '13', '21', null);
INSERT INTO `comment_articlecomment` VALUES ('23', '2020-05-13 15:30:48', 'zhangcongjiang', '26', '13', null, null);
INSERT INTO `comment_articlecomment` VALUES ('24', '2020-05-13 15:40:04', 'bbbb', '26', '12', null, null);
INSERT INTO `comment_articlecomment` VALUES ('25', '2020-05-13 16:26:12', 'rui', '27', '13', '22', null);
INSERT INTO `comment_articlecomment` VALUES ('26', '2020-05-13 16:26:33', 'fgkk', '26', '13', '25', null);
INSERT INTO `comment_articlecomment` VALUES ('27', '2020-05-14 15:50:37', ' :cool: ', '26', '14', null, null);
INSERT INTO `comment_articlecomment` VALUES ('28', '2020-06-15 08:54:34', '54yt', '28', '16', null, null);

-- ----------------------------
-- Table structure for comment_commentuser
-- ----------------------------
DROP TABLE IF EXISTS `comment_commentuser`;
CREATE TABLE `comment_commentuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment_commentuser
-- ----------------------------
INSERT INTO `comment_commentuser` VALUES ('26', 'songbo', '847634038@qq.com', '');
INSERT INTO `comment_commentuser` VALUES ('27', 'zhangcongjiang', '847634038@qq.com', '');
INSERT INTO `comment_commentuser` VALUES ('28', 'admin', '847634038@qq.com', '');

-- ----------------------------
-- Table structure for comment_messagecomment
-- ----------------------------
DROP TABLE IF EXISTS `comment_messagecomment`;
CREATE TABLE `comment_messagecomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `content` longtext NOT NULL,
  `author_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `rep_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_messagecomme_author_id_0bb97e6c_fk_comment_c` (`author_id`),
  KEY `comment_messagecomme_parent_id_d4633983_fk_comment_m` (`parent_id`),
  KEY `comment_messagecomme_rep_to_id_029597ed_fk_comment_m` (`rep_to_id`),
  CONSTRAINT `comment_messagecomme_author_id_0bb97e6c_fk_comment_c` FOREIGN KEY (`author_id`) REFERENCES `comment_commentuser` (`id`),
  CONSTRAINT `comment_messagecomme_parent_id_d4633983_fk_comment_m` FOREIGN KEY (`parent_id`) REFERENCES `comment_messagecomment` (`id`),
  CONSTRAINT `comment_messagecomme_rep_to_id_029597ed_fk_comment_m` FOREIGN KEY (`rep_to_id`) REFERENCES `comment_messagecomment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment_messagecomment
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_oauth_ouser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2019-03-02 14:12:49', '1', 'python', '1', '[{\"added\": {}}]', '8', '4');
INSERT INTO `django_admin_log` VALUES ('2', '2019-03-02 14:16:02', '1', 'python', '1', '[{\"added\": {}}]', '12', '4');
INSERT INTO `django_admin_log` VALUES ('3', '2019-03-02 14:17:30', '1', 'python', '1', '[{\"added\": {}}]', '10', '4');
INSERT INTO `django_admin_log` VALUES ('4', '2019-03-02 14:18:07', '1', '创建Python虚拟环境——下', '1', '[{\"added\": {}}]', '6', '4');
INSERT INTO `django_admin_log` VALUES ('5', '2019-03-02 15:21:45', '1', 'Python爬虫学习系列教程', '1', '[{\"added\": {}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('6', '2019-03-02 15:22:49', '2', '小白学爬虫系列教程', '1', '[{\"added\": {}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('7', '2019-03-02 15:50:00', '1', 'Python爬虫学习系列教程', '2', '[{\"changed\": {\"fields\": [\"number\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('8', '2019-03-02 15:50:17', '2', '小白学爬虫系列教程', '2', '[{\"changed\": {\"fields\": [\"number\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('9', '2020-04-02 15:19:37', '2', 'java进阶', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2020-04-02 15:20:08', '11', '创建Python虚拟环境——下', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2020-04-02 15:20:08', '10', '创建Python虚拟环境——下', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2020-04-02 15:20:08', '9', '创建Python虚拟环境——下', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2020-04-02 15:20:08', '8', '创建Python虚拟环境——下', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2020-04-02 15:20:08', '7', '创建Python虚拟环境——下', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2020-04-02 15:20:08', '6', '创建Python虚拟环境——下', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2020-04-02 15:20:08', '5', '创建Python虚拟环境——下', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2020-04-02 15:20:08', '4', '创建Python虚拟环境——下', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2020-04-02 15:20:08', '3', '创建Python虚拟环境——下', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2020-04-02 15:20:08', '2', '创建Python虚拟环境——下', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2020-04-02 15:20:08', '1', '创建Python虚拟环境——下', '3', '', '6', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2020-04-02 15:24:02', '2', 'java', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2020-04-02 15:24:34', '2', 'RPC', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2020-04-02 15:24:37', '12', '几张图帮你弄清楚什么是 RPC', '1', '[{\"added\": {}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('24', '2020-04-02 15:26:56', '3', '爬虫', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2020-04-02 15:27:22', '4', 'Django', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2020-04-02 16:00:47', '8', '我的博客', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2020-04-02 16:01:12', '8', '我的博客', '2', '[{\"changed\": {\"fields\": [\"\\u56fe\\u7247\\u5730\\u5740\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2020-04-07 17:21:33', '1', 'Album object (1)', '1', '[{\"added\": {}}]', '27', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2020-04-08 17:11:30', '4', 'OpenStack', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('30', '2020-04-08 17:11:31', '3', 'OpenDayLight', '3', '', '14', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2020-04-08 17:12:18', '5', 'OpenDayLight', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('32', '2020-04-08 17:12:52', '6', 'OpenStack', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2020-04-08 17:16:14', '11', '网络知识', '1', '[{\"added\": {}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('34', '2020-04-08 17:18:00', '7', 'java基础', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('35', '2020-04-09 11:17:29', '3', 'java', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('36', '2020-04-09 11:20:47', '13', '面向对象的语言', '1', '[{\"added\": {}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('37', '2020-04-09 14:25:25', '4', 'javabasic', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('38', '2020-04-09 14:25:31', '13', '面向对象的语言', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5173\\u952e\\u8bcd\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('39', '2020-04-09 14:25:52', '3', 'javaforward', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('40', '2020-04-09 14:26:01', '12', '几张图帮你弄清楚什么是 RPC', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u7b7e\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('41', '2020-04-09 15:31:47', '7', 'java基础', '2', '[]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('42', '2020-05-14 14:54:24', '8', '生活杂烩', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('43', '2020-05-14 14:55:04', '4', '其他', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('44', '2020-05-14 14:55:15', '5', 'markdown', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('45', '2020-05-14 14:55:17', '14', '测试MarkDown语法', '1', '[{\"added\": {}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('46', '2020-05-14 15:15:49', '14', '测试MarkDown语法', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('47', '2020-05-14 15:25:54', '14', '测试MarkDown语法', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('48', '2020-05-14 15:26:20', '14', '测试MarkDown语法', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('49', '2020-05-14 15:27:30', '14', '测试MarkDown语法', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('50', '2020-05-14 15:29:46', '14', '测试MarkDown语法', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('51', '2020-05-14 15:30:05', '14', '测试MarkDown语法', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('52', '2020-05-14 15:36:03', '14', '测试MarkDown语法', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('53', '2020-05-19 09:20:21', '3', 'Album object (3)', '1', '[{\"added\": {}}]', '27', '1');
INSERT INTO `django_admin_log` VALUES ('54', '2020-05-19 09:37:06', '15', 'Java类加载器(ClassLoader', '1', '[{\"added\": {}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('55', '2020-05-19 09:40:26', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('56', '2020-05-19 09:41:25', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('57', '2020-05-19 09:43:13', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('58', '2020-05-19 09:43:50', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('59', '2020-05-19 09:44:43', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('60', '2020-05-19 09:45:26', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('61', '2020-05-20 13:28:18', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('62', '2020-05-20 13:28:48', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('63', '2020-05-20 13:29:35', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('64', '2020-05-20 13:30:31', '3', 'javaforward', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u6807\\u7b7e\"]}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('65', '2020-05-20 13:31:53', '2', 'java进阶', '2', '[]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('66', '2020-05-20 13:36:37', '5', 'Java进阶', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('67', '2020-05-20 13:36:45', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u7b7e\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('68', '2020-05-20 13:37:40', '5', 'Java进阶', '3', '', '12', '1');
INSERT INTO `django_admin_log` VALUES ('69', '2020-05-20 13:38:15', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6807\\u7b7e\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('70', '2020-05-20 13:38:35', '3', 'java进阶', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u6807\\u7b7e\"]}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('71', '2020-05-20 15:41:08', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('72', '2020-05-20 15:41:43', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('73', '2020-05-20 15:43:27', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('74', '2020-05-20 15:43:44', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('75', '2020-05-20 15:46:13', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('76', '2020-05-20 15:48:15', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('77', '2020-05-20 15:50:45', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('78', '2020-05-20 15:51:07', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('79', '2020-05-20 15:54:10', '15', 'Java类加载器(ClassLoader', '2', '[]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('80', '2020-05-20 15:58:37', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('81', '2020-05-20 15:59:38', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('82', '2020-05-20 16:00:29', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('83', '2020-05-20 16:01:01', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('84', '2020-05-20 16:03:11', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('85', '2020-05-20 16:04:18', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('86', '2020-05-20 16:04:56', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('87', '2020-05-20 16:05:13', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('88', '2020-05-20 16:09:20', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('89', '2020-05-20 16:09:51', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('90', '2020-05-20 16:11:19', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('91', '2020-05-20 16:12:23', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('92', '2020-05-20 16:13:29', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('93', '2020-05-20 16:25:08', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('94', '2020-05-20 16:50:32', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('95', '2020-05-20 16:51:15', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('96', '2020-05-20 16:52:09', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('97', '2020-05-20 16:57:19', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('98', '2020-05-20 16:58:29', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('99', '2020-05-20 17:00:52', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('100', '2020-05-20 17:01:30', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('101', '2020-05-20 17:02:07', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('102', '2020-05-20 17:02:49', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('103', '2020-05-20 17:03:08', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('104', '2020-05-20 17:03:43', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('105', '2020-05-20 17:21:46', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('106', '2020-05-20 17:22:24', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('107', '2020-05-20 17:25:21', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('108', '2020-05-20 17:26:01', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('109', '2020-05-20 17:26:40', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('110', '2020-05-20 17:27:50', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('111', '2020-05-20 17:28:24', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('112', '2020-05-20 17:29:26', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('113', '2020-05-20 17:31:55', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('114', '2020-05-21 10:55:51', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('115', '2020-05-21 11:05:30', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('116', '2020-05-21 11:06:28', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('117', '2020-05-21 11:07:11', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('118', '2020-05-21 11:14:53', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('119', '2020-05-21 11:16:58', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('120', '2020-05-21 11:17:27', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('121', '2020-05-21 11:24:51', '15', 'Java类加载器(ClassLoader', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('122', '2020-05-21 19:33:08', '16', 'Java NIO：IO与NIO的区别', '1', '[{\"added\": {}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('123', '2020-05-21 19:33:43', '16', 'Java NIO：IO与NIO的区别', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('124', '2020-05-21 19:39:16', '16', 'Java NIO：IO与NIO的区别', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('125', '2020-05-21 19:42:43', '16', 'Java NIO：IO与NIO的区别', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('126', '2020-05-21 19:43:23', '16', 'Java NIO：IO与NIO的区别', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('127', '2020-05-21 19:54:39', '16', 'Java NIO：IO与NIO的区别', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('128', '2020-05-21 19:55:29', '16', 'Java NIO：IO与NIO的区别', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('129', '2020-05-21 19:56:12', '16', 'Java NIO：IO与NIO的区别', '2', '[]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('130', '2020-05-21 19:59:23', '16', 'Java NIO：IO与NIO的区别', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('131', '2020-05-21 20:01:02', '16', 'Java NIO：IO与NIO的区别', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('132', '2020-05-21 20:01:57', '16', 'Java NIO：IO与NIO的区别', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('133', '2020-06-08 16:38:19', '17', 'python使用paramiko配置交换', '1', '[{\"added\": {}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('134', '2020-06-08 16:47:14', '17', 'python使用paramiko配置交换', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u6807\\u9898\", \"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('135', '2020-06-08 16:47:49', '17', 'python使用paramiko配置交换', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('136', '2020-06-08 16:48:12', '17', 'python使用paramiko配置交换', '2', '[]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('137', '2020-06-08 16:48:25', '17', 'python使用paramiko配置交换', '2', '[]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('138', '2020-06-08 16:49:20', '17', 'python使用paramiko配置交换', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('139', '2020-06-08 16:52:21', '17', 'python使用paramiko配置交换', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('140', '2020-06-08 16:52:42', '17', 'python使用paramiko配置交换', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('141', '2020-06-08 16:53:33', '17', 'python使用paramiko配置交换', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('142', '2020-06-09 09:29:56', '9', '网络配置', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('143', '2020-06-09 09:30:28', '6', '网络配置', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('144', '2020-06-09 09:30:40', '6', 'Network', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('145', '2020-06-09 09:30:43', '18', '思科模拟器开局配置', '1', '[{\"added\": {}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('146', '2020-06-09 09:31:15', '18', '思科模拟器开局配置', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('147', '2020-06-09 09:35:11', '18', '思科模拟器开局配置', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('148', '2020-06-09 09:36:22', '18', '思科模拟器开局配置', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('149', '2020-06-09 13:30:32', '12', '游戏开发', '1', '[{\"added\": {}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('150', '2020-06-12 15:17:31', '10', 'Unity3d', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('151', '2020-06-12 15:17:53', '7', '游戏开发', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('152', '2020-06-12 15:18:49', '8', 'Unity3d', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('153', '2020-06-12 15:19:02', '7', 'Unity3d', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('154', '2020-06-12 15:19:05', '19', 'Unity3d学习路线', '1', '[{\"added\": {}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('155', '2020-06-12 15:22:41', '19', 'Unity3d开发贪吃蛇', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u6807\\u9898\", \"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('156', '2020-06-12 15:27:02', '3', 'Album object (3)', '3', '', '27', '1');
INSERT INTO `django_admin_log` VALUES ('157', '2020-06-12 15:28:03', '4', 'Album object (4)', '1', '[{\"added\": {}}]', '27', '1');
INSERT INTO `django_admin_log` VALUES ('158', '2020-06-12 15:28:44', '5', 'Album object (5)', '1', '[{\"added\": {}}]', '27', '1');
INSERT INTO `django_admin_log` VALUES ('159', '2020-06-12 15:29:00', '6', 'Album object (6)', '1', '[{\"added\": {}}]', '27', '1');
INSERT INTO `django_admin_log` VALUES ('160', '2020-06-12 15:29:13', '7', 'Album object (7)', '1', '[{\"added\": {}}]', '27', '1');
INSERT INTO `django_admin_log` VALUES ('161', '2020-06-12 15:29:34', '8', 'Album object (8)', '1', '[{\"added\": {}}]', '27', '1');
INSERT INTO `django_admin_log` VALUES ('162', '2020-06-15 10:48:55', '20', 'Java内存泄露是如何发生的', '1', '[{\"added\": {}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('163', '2020-06-15 10:49:43', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('164', '2020-06-15 10:50:47', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('165', '2020-06-15 10:52:15', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('166', '2020-06-15 10:52:54', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('167', '2020-06-15 10:53:58', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('168', '2020-06-15 10:54:33', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('169', '2020-06-15 10:55:01', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('170', '2020-06-15 11:01:37', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('171', '2020-06-15 11:01:57', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('172', '2020-06-15 11:02:17', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('173', '2020-06-15 11:02:47', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('174', '2020-06-15 11:03:45', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('175', '2020-06-15 11:04:03', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('176', '2020-06-15 11:05:26', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('177', '2020-06-15 11:05:48', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('178', '2020-06-15 11:08:34', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('179', '2020-06-15 11:08:45', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('180', '2020-06-15 11:09:12', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('181', '2020-06-15 11:14:05', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('182', '2020-06-15 11:14:35', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('183', '2020-06-15 11:17:58', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('184', '2020-06-15 11:19:10', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('185', '2020-06-15 11:19:36', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('186', '2020-06-15 11:20:04', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('187', '2020-06-15 13:42:18', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('188', '2020-06-15 13:43:07', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('189', '2020-06-15 13:44:06', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('190', '2020-06-15 13:49:06', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('191', '2020-06-15 14:12:48', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('192', '2020-06-15 15:31:06', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('193', '2020-06-15 16:03:35', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('194', '2020-06-15 16:04:04', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('195', '2020-06-15 16:04:40', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('196', '2020-06-15 16:06:14', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');
INSERT INTO `django_admin_log` VALUES ('197', '2020-06-15 16:06:52', '20', 'Java内存泄露是如何发生的', '2', '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]', '6', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('21', 'account', 'emailaddress');
INSERT INTO `django_content_type` VALUES ('22', 'account', 'emailconfirmation');
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('27', 'album', 'album');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('16', 'comment', 'aboutcomment');
INSERT INTO `django_content_type` VALUES ('17', 'comment', 'articlecomment');
INSERT INTO `django_content_type` VALUES ('18', 'comment', 'commentuser');
INSERT INTO `django_content_type` VALUES ('19', 'comment', 'messagecomment');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('15', 'oauth', 'ouser');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('20', 'sites', 'site');
INSERT INTO `django_content_type` VALUES ('23', 'socialaccount', 'socialaccount');
INSERT INTO `django_content_type` VALUES ('24', 'socialaccount', 'socialapp');
INSERT INTO `django_content_type` VALUES ('25', 'socialaccount', 'socialtoken');
INSERT INTO `django_content_type` VALUES ('26', 'storm', 'activate');
INSERT INTO `django_content_type` VALUES ('6', 'storm', 'article');
INSERT INTO `django_content_type` VALUES ('14', 'storm', 'bigcategory');
INSERT INTO `django_content_type` VALUES ('7', 'storm', 'carousel');
INSERT INTO `django_content_type` VALUES ('8', 'storm', 'category');
INSERT INTO `django_content_type` VALUES ('9', 'storm', 'friendlink');
INSERT INTO `django_content_type` VALUES ('10', 'storm', 'keyword');
INSERT INTO `django_content_type` VALUES ('11', 'storm', 'silian');
INSERT INTO `django_content_type` VALUES ('12', 'storm', 'tag');
INSERT INTO `django_content_type` VALUES ('13', 'storm', 'timeline');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-02-27 23:56:14');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2019-02-27 23:56:15');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2019-02-27 23:56:16');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2019-02-27 23:56:16');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2019-02-27 23:56:16');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2019-02-27 23:56:16');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2019-02-27 23:56:16');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2019-02-27 23:56:16');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2019-02-27 23:56:16');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2019-02-27 23:56:16');
INSERT INTO `django_migrations` VALUES ('11', 'oauth', '0001_initial', '2019-02-27 23:56:18');
INSERT INTO `django_migrations` VALUES ('12', 'account', '0001_initial', '2019-02-27 23:56:18');
INSERT INTO `django_migrations` VALUES ('13', 'account', '0002_email_max_length', '2019-02-27 23:56:19');
INSERT INTO `django_migrations` VALUES ('14', 'admin', '0001_initial', '2019-02-27 23:56:19');
INSERT INTO `django_migrations` VALUES ('15', 'admin', '0002_logentry_remove_auto_add', '2019-02-27 23:56:19');
INSERT INTO `django_migrations` VALUES ('16', 'storm', '0001_initial', '2019-02-27 23:56:22');
INSERT INTO `django_migrations` VALUES ('17', 'storm', '0002_islove', '2019-02-27 23:56:22');
INSERT INTO `django_migrations` VALUES ('18', 'storm', '0003_auto_20190224_1541', '2019-02-27 23:56:23');
INSERT INTO `django_migrations` VALUES ('19', 'storm', '0004_auto_20190224_1931', '2019-02-27 23:56:23');
INSERT INTO `django_migrations` VALUES ('20', 'storm', '0005_auto_20190225_2105', '2019-02-27 23:56:23');
INSERT INTO `django_migrations` VALUES ('21', 'storm', '0006_auto_20190225_2108', '2019-02-27 23:56:24');
INSERT INTO `django_migrations` VALUES ('22', 'storm', '0007_auto_20190225_2117', '2019-02-27 23:56:25');
INSERT INTO `django_migrations` VALUES ('23', 'storm', '0008_auto_20190225_2118', '2019-02-27 23:56:25');
INSERT INTO `django_migrations` VALUES ('24', 'storm', '0009_auto_20190225_2123', '2019-02-27 23:56:26');
INSERT INTO `django_migrations` VALUES ('25', 'comment', '0001_initial', '2019-02-27 23:56:30');
INSERT INTO `django_migrations` VALUES ('26', 'sessions', '0001_initial', '2019-02-27 23:56:30');
INSERT INTO `django_migrations` VALUES ('27', 'sites', '0001_initial', '2019-02-27 23:56:30');
INSERT INTO `django_migrations` VALUES ('28', 'sites', '0002_alter_domain_unique', '2019-02-27 23:56:30');
INSERT INTO `django_migrations` VALUES ('29', 'socialaccount', '0001_initial', '2019-02-27 23:56:32');
INSERT INTO `django_migrations` VALUES ('30', 'socialaccount', '0002_token_max_lengths', '2019-02-27 23:56:33');
INSERT INTO `django_migrations` VALUES ('31', 'socialaccount', '0003_extra_data_default_dict', '2019-02-27 23:56:33');
INSERT INTO `django_migrations` VALUES ('32', 'storm', '0010_activate', '2019-03-01 00:52:42');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('1fvzyorqtcy84cnx1hyz0lx6f8tc9sqs', 'ODFlZGRmNjExNGIzZTViZTU0MjFmOGZiOTcwZGMxMGIxODg5YzU0ZTp7ImlzX3JlYWRfMTUiOjE1ODk5NTU3OTUuMjEyMzc5NX0=', '2020-06-03 14:23:15');
INSERT INTO `django_session` VALUES ('37kr424pr348ji2cjj00s8yqipoqjnbb', 'NDQ1ZGUzYTgwOTg0MGIyNGI1MzVlNzY3MTUwNTY0YzA1MTA3MDVkNDp7ImlzX3JlYWRfMTMiOjE1ODkzNTQ0NjkuMDQ1NTIwNSwibmljayI6InNvbmdibyIsInRpZCI6MjYsImlzX3JlYWRfMTIiOjE1ODkzNTU1NzYuMDk2NzYzNH0=', '2020-05-27 15:40:04');
INSERT INTO `django_session` VALUES ('3jby4h249r0x71m22rrlgnl3jlqcpv2q', 'ZGM5NzU3NWFmZmVhNWEwNTY3NTkxODBmM2NhMDY2NmQzYTA3MDhhMjp7ImlzX3JlYWRfMTUiOjE1ODk5NjAzNzUuMDY3MDc1NSwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImZkZDZlZDYxYTE1OTg1ZTMyN2Q3NmJjNzE2YTBlMWU5MWYxNzUyMzMifQ==', '2020-06-03 15:40:48');
INSERT INTO `django_session` VALUES ('3wsc6krx3rz7ilxy1xvfqec717dqvtj0', 'YWYxZDA1YzFiMjllOTYwOGU2ZDYwOGUyMzI1NTI3MGI5YTYxZTFjYjp7InVzZXJuYW1lIjoiYXNkZmdoIiwiX2F1dGhfdXNlcl9pZCI6IjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjVjNWM5MDgwNTEyNjFiMmRkMGY0ZmJjOTczMTBiZTU1NzU2MDViNWIifQ==', '2019-03-16 00:26:58');
INSERT INTO `django_session` VALUES ('4fmgzh9r49kremalpvprwcyd0zukggp7', 'NjUwMDU5YTZkODNkMmJlZjZmNjIzYzI4YmM3ZTc3MjJjNTZiOTRkNzp7ImlzX3JlYWRfMTUiOjE1OTAwMjk3NTMuMjA2OTA2fQ==', '2020-06-04 10:55:53');
INSERT INTO `django_session` VALUES ('4o0jd40oh5uaom61myjktukt7qz56fnx', 'YTVlNDA5ZDIxNzE2ODFhNTBhYjliMGY4NTlkNGQ0ZTAwNzA1MDU1ZDp7ImlzX3JlYWRfMTciOjE1OTE2ODY1NjIuNjc3NTYyLCJpc19yZWFkXzE4IjoxNTkxNjg2NTcyLjg2ODM4NSwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImZkZDZlZDYxYTE1OTg1ZTMyN2Q3NmJjNzE2YTBlMWU5MWYxNzUyMzMifQ==', '2020-06-23 15:44:58');
INSERT INTO `django_session` VALUES ('4tq0bbxh2ovebrbuwmrbb50jjb3gvs4i', 'NmU1NWE4MWMyM2RmZmEwODRjOGQ0YTIxYjhlN2RlMWQ5YTc5MjJkNDp7ImlzX3JlYWRfMTUiOjE1ODk5NjI2MDAuMjcxOTM4OCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImZkZDZlZDYxYTE1OTg1ZTMyN2Q3NmJjNzE2YTBlMWU5MWYxNzUyMzMifQ==', '2020-06-03 16:24:52');
INSERT INTO `django_session` VALUES ('7so32iowwy0rlslhffcfwi18m4004kyx', 'YWY3ZGE2NTAwODgwMjQxMzNlOWNmNDRjNTE5ZTYzNGY5M2IzMDU5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZGQ2ZWQ2MWExNTk4NWUzMjdkNzZiYzcxNmEwZTFlOTFmMTc1MjMzIn0=', '2020-06-04 11:12:04');
INSERT INTO `django_session` VALUES ('9buqd5bujox2h4hia1j8zw0b1q1373ip', 'NTkxMTJiOGY4MWE0ZTY5ZDY3MjJlOWI0MGM1NzljMThhMjlkNmM4Njp7ImlzX3JlYWRfMTUiOjE1ODk5Njc0MDkuMDE2OTkxLCJpc19yZWFkXzEyIjoxNTg5OTY4MTYxLjU2Mzg5NjcsImlzX3JlYWRfMTQiOjE1ODk5NjgxOTcuMTEyMjkzfQ==', '2020-06-03 17:49:57');
INSERT INTO `django_session` VALUES ('9ltmqzzvz8cz9w8doou5gc1msq76uy8a', 'Y2E2MjA2ZGQxZWQ1YTYzYzc4MmE5NjYwMTNjNTkxYWJhYmYwZDAxYzp7ImlzX3JlYWRfMTUiOjE1ODk5NTY4OTguNjU5Njc5Mn0=', '2020-06-03 14:41:39');
INSERT INTO `django_session` VALUES ('9nebrg7p8ka3r4krnqmuncly7kkvo00w', 'ZDQ3OTVmZWVjNTUyNWVkMWRiZmVkMWU3MGNiMjg1N2FkZDhjNzhiNTp7ImlzX3JlYWRfMTIiOjE1ODU4OTYxMzkuODg2MTc1NH0=', '2020-04-17 14:42:20');
INSERT INTO `django_session` VALUES ('b6dgdzlusyz7gf25usjjphxhm0zrxfoe', 'YzJmYmMxNjlkNjI5OTg4ZmFiYzQ0ZDdiMTY0NzBlMjAzMGU3ODdkYTp7ImlzX3JlYWRfMTQiOjE1ODk0MzkzMjUuNzUzMDE3MiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImZkZDZlZDYxYTE1OTg1ZTMyN2Q3NmJjNzE2YTBlMWU5MWYxNzUyMzMifQ==', '2020-05-28 15:14:10');
INSERT INTO `django_session` VALUES ('b78k09ji2epez6puu791krmla2djzecn', 'MGJjOWFhNmNmMDFiZjY3ZmNjNjdjM2JkMzg2MDE0OWZjY2Y5ZTIzNjp7ImlzX3JlYWRfMSI6MTU1MTU5ODI4MC43MjYxOTI1LCJfYXV0aF91c2VyX2lkIjoiNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDUzMzc5ZTU2OWZkNzZmNWI0MTA5YzZiMGRiYjU4OGFiNzEyYzRiMSIsIm5pY2siOiJjcmVhdCIsInRpZCI6MjN9', '2019-03-17 15:31:20');
INSERT INTO `django_session` VALUES ('bort5pmwug37uo5by5s7pux72erceba4', 'MDg3NzBiMjE0MTNiMzc4M2Q2ZTM5ZjZiZDBkMjYxNTA2MGYwYzJiZjp7ImlzX3JlYWRfMTIiOjE1ODkzNTM3ODEuOTQ5ODE3MiwiaXNfcmVhZF8xMyI6MTU4OTM1Mzg4NS41NzU4MzY0fQ==', '2020-05-27 15:11:26');
INSERT INTO `django_session` VALUES ('ccvvec2pgcyh9m5b8d70fslxlq68tzf0', 'NzgxNzcyN2IwODc4NTMzZGU3Y2I0ZjcwM2UwYjgyODBhMTkzODJkYzp7ImlzX3JlYWRfMTMiOjE1ODkzNTc2OTAuMDY1NTU2MywibmljayI6InNvbmdibyIsInRpZCI6MjYsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZGQ2ZWQ2MWExNTk4NWUzMjdkNzZiYzcxNmEwZTFlOTFmMTc1MjMzIn0=', '2020-05-28 14:49:43');
INSERT INTO `django_session` VALUES ('ciu13el26rrbjidcga21g4g9zydg1080', 'NmFiZTA3MjY4ODA3ZjBhYWQzOTg5MGE4MzdkMDAzNmVhYmJjNDE5ZDp7ImlzX3JlYWRfMTMiOjE1ODkzNTM5OTEuMjg4MjYwNSwiaXNfcmVhZF8xMiI6MTU4OTM1NDAwNC4wNjcwOTg2LCJpc19yZWFkXzE1IjoxNTkwMDQxOTY3Ljg4MDYyNjR9', '2020-06-04 14:19:28');
INSERT INTO `django_session` VALUES ('ew8pnjwrfmof6sehyrv90w2qm0wkymtl', 'YWY3ZGE2NTAwODgwMjQxMzNlOWNmNDRjNTE5ZTYzNGY5M2IzMDU5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZGQ2ZWQ2MWExNTk4NWUzMjdkNzZiYzcxNmEwZTFlOTFmMTc1MjMzIn0=', '2020-06-22 16:33:40');
INSERT INTO `django_session` VALUES ('f7m8bnnhtwcqjs2nva2fpy5tz4i1bp6z', 'OTdhODg5ZDc4NDQzYTIzYTM3MDFlNDY2Mzc3ZmU4ZjNjMDU5MDA0NTp7ImlzX3JlYWRfMTMiOjE1ODg4MzIxMTMuNzc4MzE3fQ==', '2020-05-21 14:15:14');
INSERT INTO `django_session` VALUES ('fb5rykbmd5u6je7ui8o7cdb7aw9vftzm', 'YWY3ZGE2NTAwODgwMjQxMzNlOWNmNDRjNTE5ZTYzNGY5M2IzMDU5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZGQ2ZWQ2MWExNTk4NWUzMjdkNzZiYzcxNmEwZTFlOTFmMTc1MjMzIn0=', '2020-04-16 15:16:17');
INSERT INTO `django_session` VALUES ('fj86g0tgmmvjt3p958qjkl6y6y1r7xt3', 'YTYwOWUyY2YwYzVlMzc2Y2ZiODA2OWI5NzI3YmZkOTg4YTU2ZDQ3MDp7ImlzX3JlYWRfMTYiOjE1OTA3Mjk3NzYuMDg0NzEwOCwiaXNfcmVhZF8xMiI6MTU5MDcyOTg0Ny44NzQ2NjJ9', '2020-06-12 13:24:08');
INSERT INTO `django_session` VALUES ('gnx1va3xie6b24jvb1schuo714as26qa', 'NmVlZDA1Y2Y0MWY2ODMxMTE5OTk4Mzc3MDQ2NThlYzNmN2JhMGJiNjp7ImlzX3JlYWRfMTQiOjE1ODk0NDE5NDkuNjEyMDg5NiwiaXNfcmVhZF8xMyI6MTU4OTQ0MjA5OS41ODYyNTk2LCJpc19yZWFkXzEyIjoxNTg5NDQyMTQzLjg1MTAzMiwibmljayI6InNvbmdibyIsInRpZCI6MjZ9', '2020-05-28 15:50:37');
INSERT INTO `django_session` VALUES ('hb9a0x0xo4cs46cxybjpyb4ehm6ll9co', 'YmFmNWI5OTRiZTU2MjEyOGNjMGE3MmNhYzc5M2NkOGUwNDU3YzU5MTp7ImlzX3JlYWRfMTUiOjE1ODk5Njc3OTkuODM1ODMzNX0=', '2020-06-03 17:43:20');
INSERT INTO `django_session` VALUES ('hs4jjdgc1ndsh1qb48d1h8gdye1ymrvg', 'YWY3ZGE2NTAwODgwMjQxMzNlOWNmNDRjNTE5ZTYzNGY5M2IzMDU5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZGQ2ZWQ2MWExNTk4NWUzMjdkNzZiYzcxNmEwZTFlOTFmMTc1MjMzIn0=', '2020-06-02 09:19:13');
INSERT INTO `django_session` VALUES ('iuyy1u45t3zzbdsbhb28x4v4czdbyjw4', 'MTYyNjY4YjAxNGI5NGUzYzVhNGIyOWI3Y2Q5YWZmMDFiZGUwMmU1OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZGQ2ZWQ2MWExNTk4NWUzMjdkNzZiYzcxNmEwZTFlOTFmMTc1MjMzIiwibmljayI6ImFkbWluIiwidGlkIjoyOH0=', '2020-06-29 08:54:34');
INSERT INTO `django_session` VALUES ('la5zrtmcex0ljs2ww75hcc2j50c0s37i', 'YWY3ZGE2NTAwODgwMjQxMzNlOWNmNDRjNTE5ZTYzNGY5M2IzMDU5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZGQ2ZWQ2MWExNTk4NWUzMjdkNzZiYzcxNmEwZTFlOTFmMTc1MjMzIn0=', '2020-05-21 16:29:06');
INSERT INTO `django_session` VALUES ('na6z8p84bwxndlqrv9qcliwb2ksl0vfc', 'NTZhNmY3OGMzYTYwYWRlYWM3NWMzYTcwMmI5NWQ5YjdhNTExNGQ4Zjp7ImlzX3JlYWRfMTMiOjE1ODkzNTU4MTMuODYxOTg0NywiaXNfcmVhZF8xMiI6MTU4OTM1NTgzMS41NDc3MjN9', '2020-05-27 15:43:52');
INSERT INTO `django_session` VALUES ('oaua1waqtm0mgimsp3s80chnxy3w4rck', 'MDczYTkyZDg4OWRjNWM5NzhhZjI3YTJjOTFlNmZmOTk4NDkxMjQxYzp7ImlzX3JlYWRfMSI6MTU1MTUzMDY4Ni44MzMwNTl9', '2019-03-16 20:44:47');
INSERT INTO `django_session` VALUES ('olpdrbn5ajxjfglc7b4z7fsusyf5qlwi', 'ZDNiMzJjZDAwNjRjYjNiMTIwMmZjOGU5YzI1YzhmMjJiMDQxNTIzNDp7ImlzX3JlYWRfMTMiOjE1ODkzMzkwOTcuMDYxNzU5NywiaXNfcmVhZF8xMiI6MTU4OTE4OTA5Mi4xOTYyMzMsIm5pY2siOiJzb25nYm8iLCJ0aWQiOjI2fQ==', '2020-05-27 11:12:23');
INSERT INTO `django_session` VALUES ('oq8oj0rh7tw4cakb8ctzdhq4uck1mkwy', 'MWQ5YTRjNTRlM2UwZDE3ZDcyMWNjN2YyMDYzNDVhODM0NTI0NTk4ZTp7ImlzX3JlYWRfMSI6MTU1MTYxNjEwMC40MzQ1MDgsImlzX3JlYWRfNiI6MTU1MTYxNjEyMC43NDYxNzIyLCJpc19yZWFkXzMiOjE1NTE2MTgyNDIuMzU5NDg5NywibmljayI6Ilx1NWY5N1x1NTIwNiIsInRpZCI6MTB9', '2019-03-17 21:04:02');
INSERT INTO `django_session` VALUES ('qw2y9tgt61k93fpvwx7zqj69yhg2wec1', 'NmZkNDE0YmVlMDk5NWI0MWE1MDYxNGYxNGQ0ODI1ZDBhZjkwOWMzYTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNTMzNzllNTY5ZmQ3NmY1YjQxMDljNmIwZGJiNTg4YWI3MTJjNGIxIiwidXNlcm5hbWUiOiJjcmVhdGVzdXBlcnVzZXIiLCJ1aWQiOjQsIm5pY2siOm51bGwsInRpZCI6bnVsbCwiaXNfcmVhZF8xIjoxNTUxNjk0OTU0LjIxMDk3MDJ9', '2019-03-18 18:22:34');
INSERT INTO `django_session` VALUES ('r0z116h0bcvt6gz46bdqkg9zpctgxkdd', 'YTAzNzIzNzE5MDlkOTdiNmRkODA5ZjgxNGZhODlmYzJiMTVjMGYxYjp7ImlzX3JlYWRfMTUiOjE1ODk5NjIxMTIuMTg2Njk5OSwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImZkZDZlZDYxYTE1OTg1ZTMyN2Q3NmJjNzE2YTBlMWU5MWYxNzUyMzMifQ==', '2020-06-03 16:08:57');
INSERT INTO `django_session` VALUES ('syvv63tdq6h2n30jbtjd65z1nzqbwtol', 'ZDIwZDQyMTEwMTM5NzY2ZDhmY2ExMjBiNDYxNGRhNTJmNjhhNjA2OTp7ImlzX3JlYWRfMTMiOjE1ODkzNDY4MjkuODc2MzE5Mn0=', '2020-05-27 13:13:50');
INSERT INTO `django_session` VALUES ('t4d2m6tfq5soo4si2din95s5iqhn90ys', 'YWI2NTUzNDhhZTgwYmEwODE0N2YzZWM2N2QyNDUyYjYzMDdmM2M1NTp7ImlzX3JlYWRfMSI6MTU1MTYxNTc1My4wNjE0NTE3LCJpc19yZWFkXzQiOjE1NTE2MTU3NjMuNzE3NDgxMSwiaXNfcmVhZF82IjoxNTUxNjE1ODM1LjI2Mzk5Nzh9', '2019-03-17 20:23:55');
INSERT INTO `django_session` VALUES ('uubd4a6ncokojs2h6tu94h50snnihvz7', 'MDFlOTA2NjgzZjkzYjgxMTYwZTZmMWI1MTYyNDVmM2JhZTVjNTY2ODp7ImlzX3JlYWRfMTIiOjE1ODkzNTU1MTkuNjA0ODIwNywiaXNfcmVhZF8xMyI6MTU4OTM1NTUyMi4yMTI4NDY1fQ==', '2020-05-27 15:38:42');
INSERT INTO `django_session` VALUES ('uw0xjg2rhi2flcvaw1ntkwtmgosqthbk', 'Y2ViZDNhMWVmNmMyMWM2NGVlZGNlZGM5YjVkNzVjZTE3ODdhY2JmOTp7ImlzX3JlYWRfMSI6MTU1MTUyNDA2Ny41OTIxNTc4LCJuaWNrIjpudWxsLCJ0aWQiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNTMzNzllNTY5ZmQ3NmY1YjQxMDljNmIwZGJiNTg4YWI3MTJjNGIxIiwidXNlcm5hbWUiOiJjcmVhdGVzdXBlcnVzZXIiLCJ1aWQiOjR9', '2019-03-16 18:55:27');
INSERT INTO `django_session` VALUES ('v81oyx39hpstr47df2dnmxrnztl86mxc', 'ZWZhNWZiMzMwNzQ3NDQzMTZlZWY1ODc3YjI5Njc0NDI1NTVhYzMyMzp7ImlzX3JlYWRfMTMiOjE1ODkzNTM0OTcuODA5MTQyNCwiaXNfcmVhZF8xMiI6MTU4OTM1MzkxMy44ODQxNzE3fQ==', '2020-05-27 15:11:54');
INSERT INTO `django_session` VALUES ('vtj1yeefotdgiajny3yneujvduy1biso', 'YWY3ZGE2NTAwODgwMjQxMzNlOWNmNDRjNTE5ZTYzNGY5M2IzMDU5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZGQ2ZWQ2MWExNTk4NWUzMjdkNzZiYzcxNmEwZTFlOTFmMTc1MjMzIn0=', '2020-04-22 17:11:16');
INSERT INTO `django_session` VALUES ('wj4jm5y61ey2rs96v13lsfakp100lhrj', 'NTE4ODkxMDQ0ODdjMjcwMjk1NzljMmU0OGUzNWI2ZDEzY2Q2MWE0YTp7ImlzX3JlYWRfMTUiOjE1ODk5NTQwNzkuNjkyOTI4M30=', '2020-06-03 13:54:40');
INSERT INTO `django_session` VALUES ('xclmi1o9txv3a05swbfj10aleegdb1tq', 'ODFlYTJjYzU4MjE2NDI4MWQyNjE1N2FlYWEzOTI5OTQxYTdkNTNmNDp7ImlzX3JlYWRfMTIiOjE1ODcyMDAxNDAuNDk0ODY2NH0=', '2020-05-02 16:55:41');
INSERT INTO `django_session` VALUES ('y46xv4b8i4dtlnyicke42i2g3wbheu65', 'YWY3ZGE2NTAwODgwMjQxMzNlOWNmNDRjNTE5ZTYzNGY5M2IzMDU5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZGQ2ZWQ2MWExNTk4NWUzMjdkNzZiYzcxNmEwZTFlOTFmMTc1MjMzIn0=', '2020-04-21 17:16:24');
INSERT INTO `django_session` VALUES ('y5l1ftb17432scjdh0mj5o6gk762lagd', 'NjRmZTIxYjVmNWQyYmZiNTk5OGEwNzdkYWViNTBjNDcyMDkyODYwMTp7ImlzX3JlYWRfMTMiOjE1ODkwMDkzMzcuNzkxMjQzNiwiaXNfcmVhZF8xMiI6MTU4OTAwOTUxMi42NjA5MDZ9', '2020-05-23 15:31:53');
INSERT INTO `django_session` VALUES ('y7vkt8tigyj0dlnfa6zka866fkje9dpl', 'OWJjNmQ0ZTY2NzE0NDFhYWUwN2I4NDc5Y2UyOWM4ZmM3YTlhNzdjYjp7ImlzX3JlYWRfMTUiOjE1ODk5NjUyMDUuMjQ0Nzk3NywiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImZkZDZlZDYxYTE1OTg1ZTMyN2Q3NmJjNzE2YTBlMWU5MWYxNzUyMzMifQ==', '2020-06-03 17:00:32');
INSERT INTO `django_session` VALUES ('ykbpsv6fomzw40pzi4cvsp0se2sv15ky', 'ZjczOGJiNmZhMWQ0NzVkYjVkM2M5ZTU0ZWQ2MmZlZGZjYmJlOTVkODp7ImlzX3JlYWRfMTUiOjE1OTAwMzE1MzkuNjY0NDMwMX0=', '2020-06-04 11:25:40');
INSERT INTO `django_session` VALUES ('ywn2ge2u2xx9u0ygntnrmf2gsic56eji', 'MWI2YTgyMGVmNTJiNDRmYTc4YjYzNWJhYmRmYTYxYzBjZTI0YWZiNzp7ImlzX3JlYWRfMTYiOjE1OTAwNjEwMTQuMTczNjUsImlzX3JlYWRfMTUiOjE1OTAwNjEwMjIuMDM5NjQyMywiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImZkZDZlZDYxYTE1OTg1ZTMyN2Q3NmJjNzE2YTBlMWU5MWYxNzUyMzMifQ==', '2020-06-04 19:39:03');
INSERT INTO `django_session` VALUES ('zq2cs065x0rqwpiijgn2tqug9vkmfpke', 'NmNiMTIyOGQyMjU4ZDZjZjMzN2Y1Zjg1ZDVlYjNkNzdiODZjZTM3Yzp7ImlzX3JlYWRfMTUiOjE1OTAwMzQwNjMuMzUxMTM4OH0=', '2020-06-04 12:07:43');

-- ----------------------------
-- Table structure for django_site
-- ----------------------------
DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_site
-- ----------------------------
INSERT INTO `django_site` VALUES ('1', 'example.com', 'example.com');

-- ----------------------------
-- Table structure for oauth_ouser
-- ----------------------------
DROP TABLE IF EXISTS `oauth_ouser`;
CREATE TABLE `oauth_ouser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `link` varchar(200) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_ouser
-- ----------------------------
INSERT INTO `oauth_ouser` VALUES ('1', 'pbkdf2_sha256$36000$P2Mt91Hx3fg2$c0VBYH+zIB2shdRrNT3OidoluZgta/2uTFjAZPfBVIU=', '2019-03-02 00:16:48', '0', 'stormsha', '', '', '1414749109@qq.com', '0', '1', '2019-03-02 00:16:47', '', 'avatar/default.png');
INSERT INTO `oauth_ouser` VALUES ('2', 'pbkdf2_sha256$36000$ZZmzUMz2lTpm$0xadcPRoeFUHZWxNkvh18mklwhjizMAQbhlsUAx0tJ8=', '2019-03-02 00:26:14', '0', 'storm', '', '', '1414749110@qq.com', '0', '1', '2019-03-02 00:22:46', '', 'avatar/default.png');
INSERT INTO `oauth_ouser` VALUES ('3', 'pbkdf2_sha256$36000$O8WvIJBxZqOR$0KbWOH6FUiwk8kFjQ/sGye2riwYi3nJEpXT3VWcGe+8=', '2019-03-02 13:55:17', '0', 'asdfgh', '', '', 'stormsha6@gmail.com', '0', '1', '2019-03-02 00:26:58', '', 'avatar/default.png');
INSERT INTO `oauth_ouser` VALUES ('4', 'pbkdf2_sha256$36000$zNEBARjVIhN3$BXXLsLtWIxfhmEyvOnTmtWFbiQeCnrtW0Jy02Try2jU=', '2019-03-04 15:52:55', '1', 'createsuperuser', '', '', '1414749109@qq.com', '1', '1', '2019-03-02 14:08:45', '', 'avatar/2019/03/02/微信图片_20190301204333.jpg');

-- ----------------------------
-- Table structure for oauth_ouser_groups
-- ----------------------------
DROP TABLE IF EXISTS `oauth_ouser_groups`;
CREATE TABLE `oauth_ouser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ouser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_ouser_groups_ouser_id_group_id_4a9e5409_uniq` (`ouser_id`,`group_id`),
  KEY `oauth_ouser_groups_group_id_ee861e08_fk_auth_group_id` (`group_id`),
  CONSTRAINT `oauth_ouser_groups_group_id_ee861e08_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `oauth_ouser_groups_ouser_id_c543bcdc_fk_oauth_ouser_id` FOREIGN KEY (`ouser_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_ouser_groups
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_ouser_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `oauth_ouser_user_permissions`;
CREATE TABLE `oauth_ouser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ouser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_ouser_user_permiss_ouser_id_permission_id_ab6b2ccc_uniq` (`ouser_id`,`permission_id`),
  KEY `oauth_ouser_user_per_permission_id_2b5b927f_fk_auth_perm` (`permission_id`),
  CONSTRAINT `oauth_ouser_user_per_permission_id_2b5b927f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `oauth_ouser_user_permissions_ouser_id_12e23549_fk_oauth_ouser_id` FOREIGN KEY (`ouser_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_ouser_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for socialaccount_socialaccount
-- ----------------------------
DROP TABLE IF EXISTS `socialaccount_socialaccount`;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_oauth_ouser_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of socialaccount_socialaccount
-- ----------------------------

-- ----------------------------
-- Table structure for socialaccount_socialapp
-- ----------------------------
DROP TABLE IF EXISTS `socialaccount_socialapp`;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of socialaccount_socialapp
-- ----------------------------

-- ----------------------------
-- Table structure for socialaccount_socialapp_sites
-- ----------------------------
DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of socialaccount_socialapp_sites
-- ----------------------------

-- ----------------------------
-- Table structure for socialaccount_socialtoken
-- ----------------------------
DROP TABLE IF EXISTS `socialaccount_socialtoken`;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of socialaccount_socialtoken
-- ----------------------------

-- ----------------------------
-- Table structure for storm_activate
-- ----------------------------
DROP TABLE IF EXISTS `storm_activate`;
CREATE TABLE `storm_activate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext,
  `is_active` tinyint(1) NOT NULL,
  `add_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storm_activate
-- ----------------------------
INSERT INTO `storm_activate` VALUES ('1', '本站相关博客内容仅供参考，若涉及商业内容，请核实后再参考！', '1', '2019-03-06 00:53:46');

-- ----------------------------
-- Table structure for storm_article
-- ----------------------------
DROP TABLE IF EXISTS `storm_article`;
CREATE TABLE `storm_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `summary` longtext NOT NULL,
  `body` longtext NOT NULL,
  `img_link` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `views` int(11) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `loves` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `storm_article_author_id_113892f7_fk_oauth_ouser_id` (`author_id`),
  KEY `storm_article_category_id_c56e32c4_fk_storm_category_id` (`category_id`),
  CONSTRAINT `storm_article_author_id_113892f7_fk_oauth_ouser_id` FOREIGN KEY (`author_id`) REFERENCES `oauth_ouser` (`id`),
  CONSTRAINT `storm_article_category_id_c56e32c4_fk_storm_category_id` FOREIGN KEY (`category_id`) REFERENCES `storm_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storm_article
-- ----------------------------
INSERT INTO `storm_article` VALUES ('12', '几张图帮你弄清楚什么是 RPC', 'RPC（Remote Procedure Call）远程过程调用，简单的理解是一个节点请求另一个节点提供的服务。', 'RPC：Remote Procedure Call，中文意思就是远程过程调用。\r\n\r\n远程是相对于本地来说的，有远程调用就有本地调用，那么先说说本地调用是什么，这个就简单了；\r\n\r\n比如下图，我们的代码在同一个进程中（或者说同一个地址空间）调用另外一个方法，得到我们需要的结果，这就是本地调用：\r\n\r\n\r\n\r\n那么想象一下，如果这里的add方法是一个很复杂的方法，很多系统都想用这个方法，那么我们可以把这个方法单独拆成一个服务，提供给各个系统进行调用，那么本地就会变成远程，就会变成这样：\r\n\r\n\r\n\r\n01\r\n\r\nRPC：让远程调用变得和本地调用一样\r\n\r\n\r\n那么在 Server_A 中怎么调用 Server_B 中的 add 方法呢？\r\n\r\n很多人都会想到 Server_B 封装一个接口，通过服务把这个方法暴露出去，比如通过 HTTP 请求，那么 Server_A 就可以调用 Server_B 中的 add 方法了。\r\n\r\n通过这种方法实现起来没有问题，也是一个不错的解决方法，就是在每次调用的时候，都要发起 HTTP 请求，代码里面要写 HttpClient.sendRequest 这样的代码，那么我们有没有可能像调用本地一样，去发起远程调用呢？让程序员不知道这是调用的远程方法呢？这时候就要提到RPC了（并不是说 RPC 优于 HTTP 请求，关于这两个概念我们在下文中讨论）。\r\n\r\n完整的RPC过程，如图：\r\n\r\n\r\n\r\n\r\n服务调用方（Client）调用以本地调用方式调用服务；\r\nClient stub 负责将方法名、参数组装成消息体并进行序列化，找到服务地址，将消息发送到服务端；\r\nServer stub 收到消息后进行反序列化后调用本地的服务；\r\n本地服务执行，将结果返回给 Server stub；\r\nServer stub 将运行结果打包成消息序列化后，发送调用方；\r\nClient stub接收到消息，并进行反序列化，调用方最终得到调用结果。\r\n\r\n总结来说，RPC 用于服务之间的调用问题，特别是分布式环境；RPC 让远程调用时，像调用本地方法一样方便和无感知；RPC框架屏蔽了很多底层的细节，不需要开发人员关注这些细节，比如序列化和反序列化、网络传输协议的细节。\r\n\r\n02\r\n\r\n既然有 HTTP ，为什么还要用 RPC ？\r\n\r\n其实，这个问题本身就是有问题的！\r\n\r\nHTTP 和 RPC 并不是两个并行的概念，虽然很多书或文章，都介绍 HTTP 和 RPC 是在“应用层”，但实际上可以把应用层细分成多层，RPC 的所处的位置是高于 HTTP 的；HTTP 是网络协议，而RPC 可以看做是一种编程模式或实现方案；\r\n\r\nRPC 通常包含传输协议和序列化协议，单说传输协议，RPC 可以建立在 TCP 协议之上（比如 Dubbo），也可以建立在 HTTP 协议之上（比如 gRPC）；如果是基于数据形式分类，RPC 又可以分成基于二进制、XML 和 JSON 三种；\r\n\r\n而现在非常流行的开源 RPC 框架，比如上文中提到的Dubbo 和 gRPC 分别出身于阿里和谷歌，它们更多地是封装了服务注册发现、负载均衡、链路跟踪等功能，也可以这么理解，RPC 框架是对服务更高级的封装。\r\n\r\n03\r\n\r\nRPC VS Restful 风格的 API\r\n\r\n\r\nRPC：面向过程，也就是要做一件什么事情，只发送 GET 和 POST 请求；GET 用来查询信息，其他情况下一律用 POST；请求参数是动词。\r\n\r\nRESTful：面向资源，这里的资源可以是一段文字、一个文件、一张图片，总之是一个具体的存在，可以使用 GET、POST、DELETE、PUT 请求，对应了增删查改的操作；请求参数是名词。\r\n\r\n比如按照id 查找用户：\r\n\r\n如果是 RPC 风格的 url 应该是这样的：GET /queryUser?userid=xxx；\r\n而 RESTful 风格通常是这样的：GET /user/{userid}\r\n\r\n当然，对于遵守接口风格这一点，我个人是保留意见的，在实际的项目开发过程中，很多时候这些接口风格过于理想化；有些东西借鉴一下可以，更多的还需要结合项目实际使用。', '/static/images/rpc.jpg', '2020-04-02 15:24:36', '2020-06-09 11:08:54', '13', 'what_is_rpc', '1', '2', '33');
INSERT INTO `storm_article` VALUES ('13', '面向对象的语言', '面向对象语言（Object-Oriented Language）是一类以对象作为基本程序结构单位的程序设计语言，指用于描述的设计是以对象为核心，而对象是程序运行时刻的基本成分。', '对象的含义是指具体的某一个事物，即在现实生活中能够看得见摸得着的事物。而编程本质上是一种通过建模来解决实际问题的过程，面向对象的编程也就是以对象为最小的元模型来进行建模。\r\n在面向对象程序设计中，对象包含两个含义，其中一个是数据，另外一个是动作，对应到类里就是属性和方法，方法是指对象能够进行的操作。', '/static/images/面向对象编程.png', '2020-04-09 11:20:46', '2020-05-13 15:09:27', '15', '2', '1', '7', '31');
INSERT INTO `storm_article` VALUES ('14', '测试MarkDown语法', 'MarkDown语法初步使用', '---\r\n**关关雎鸠，在河之洲。窈窕淑女，君子好逑。**\r\n\r\n参差荇菜，左右流之。窈窕淑女，寤寐求之。\r\n\r\n---\r\n+ 列表一\r\n+ 列表二\r\n    + 列表二-1\r\n    + 列表二-2\r\n---\r\n\r\n![blockchain](/static/images/WechatIMG257-e1491842259390.jpeg \"区块链\")\r\n\r\n```\r\n    function fun(){\r\n         echo \"这是一句非常牛逼的代码\";\r\n    }\r\n    fun();\r\n```', '/static/images/WechatIMG257-e1491842259390.jpeg', '2020-05-14 14:55:17', '2020-06-09 11:08:53', '3', 'markdown', '1', '8', '2');
INSERT INTO `storm_article` VALUES ('15', 'Java类加载器(ClassLoader)', '首先需要了解一下类的加载过程。\r\n类加载器的任务是根据一个类的全限定名来读取此类的二进制字节流到JVM中，然后转换为一个与目标类对应的java.lang.Class对象实例\r\n在虚拟机提供了3种类加载器，引导（Bootstrap）类加载器、扩展（Extension）类加载器、系统（System）类加载器（也称应用类加载器）', '###1、启动（Bootstrap）类加载器  \r\n      启动类加载器主要加载的是JVM自身需要的类，这个类加载使用C++语言实现的，是虚拟机自身的一部分，它负责将 <JAVA_HOME>/lib路径下的核心类库或-Xbootclasspath参数指定的路径下的jar包加载到内存中，注意必由于虚拟机是按照文件名识别加载jar包的，如rt.jar，如果文件名不被虚拟机识别，即使把jar包丢到lib目录下也是没有作用的(出于安全考虑，Bootstrap启动类加载器只加载包名为java、javax、sun等开头的类)。\r\n\r\n###2、扩展（Extension）类加载器  \r\n      扩展类加载器是指Sun公司(已被Oracle收购)实现的sun.misc.Launcher$ExtClassLoader类，由Java语言实现的，是Launcher的静态内部类，它负责加载<JAVA_HOME>/lib/ext目录下或者由系统变量-Djava.ext.dir指定位路径中的类库，开发者可以直接使用标准扩展类加载器。\r\n\r\n###3、系统（System）类加载器  \r\n      也称应用程序加载器，是指Sun公司实现的sun.misc.Launcher$AppClassLoader。它负责加载系统类路径java -classpath或-D java.class.path 指定路径下的类库，也就是我们经常用到的classpath路径，开发者可以直接使用系统类加载器，一般情况下该类加载是程序中默认的类加载器，通过ClassLoader.getSystemClassLoader()方法可以获取到该类加载器。  \r\n\r\n      应用程序类加载器，该加载器是由sun.misc.Launcher$AppClassLoader实现，该类加载器负责加载用户类路径上所指定的类库。开发者可通过ClassLoader.getSystemClassLoader()方法直接获取，故又称为系统类加载器。当应用程序没有自定义类加载器时，默认采用该类加载器。\r\n\r\nClassLoader.java\r\n```\r\npublic static ClassLoader getSystemClassLoader() {\r\n    initSystemClassLoader(); //初始化系统类加载器 【见下文】\r\n    if (scl == null) {\r\n        return null;\r\n    }\r\n    SecurityManager sm = System.getSecurityManager();\r\n    if (sm != null) {\r\n        ClassLoader ccl = getCallerClassLoader();\r\n        if (ccl != null && ccl != scl && !scl.isAncestor(ccl)) {\r\n            sm.checkPermission(SecurityConstants.GET_CLASSLOADER_PERMISSION);\r\n        }\r\n    }\r\n    return scl;\r\n}\r\n```\r\n---\r\n系统类加载器初始化：\r\n```\r\nprivate static synchronized void initSystemClassLoader() {\r\n    if (!sclSet) {\r\n        if (scl != null)\r\n            throw new IllegalStateException(\"recursive invocation\");\r\n        sun.misc.Launcher l = sun.misc.Launcher.getLauncher();\r\n        if (l != null) {\r\n            Throwable oops = null;\r\n            scl = l.getClassLoader();\r\n            try {\r\n                scl = AccessController.doPrivileged(\r\n                    new SystemClassLoaderAction(scl));\r\n            } catch (PrivilegedActionException pae) {\r\n                oops = pae.getCause();\r\n                if (oops instanceof InvocationTargetException) {\r\n                    oops = oops.getCause();\r\n                }\r\n            }\r\n            if (oops != null) {\r\n                if (oops instanceof Error) {\r\n                    throw (Error) oops;\r\n                } else {\r\n                    throw new Error(oops);\r\n                }\r\n            }\r\n        }\r\n        sclSet = true;\r\n    }\r\n}\r\n```\r\n---\r\n###4、自定义类加载器\r\n      每一个ClassLoader都拥有自己独立的类名称空间，类是由ClassLoader将其加载到Java虚拟机中，故类是由加载它的ClassLoader和该类本身一起确定其在Java 运行时环境的唯一性；故只有同一个ClassLoader加载的同一个类，才能算是Java 运行时环境中的相同的两个类。哪怕是来自同一个Class文件，即使被同一个虚拟机加载的两个类，只要ClassLoader不同，那么也属于不同的类；对于equals()、isinstanceof()等方法来判断对象的相等或所属关系都是需要基于同一个ClassLoader。\r\n\r\n自定义类加载器示例：\r\n```\r\npublic class ClassLoadDemo{\r\n\r\n    public static void main(String[] args) throws Exception {\r\n\r\n        ClassLoader clazzLoader = new ClassLoader() {\r\n            @Override\r\n            public Class<?> loadClass(String name) throws ClassNotFoundException {\r\n                try {\r\n                    String clazzName = name.substring(name.lastIndexOf(\".\") + 1) + \".class\";\r\n\r\n                    InputStream is = getClass().getResourceAsStream(clazzName);\r\n                    if (is == null) {\r\n                        return super.loadClass(name);\r\n                    }\r\n                    byte[] b = new byte[is.available()];\r\n                    is.read(b);\r\n                    return defineClass(name, b, 0, b.length);\r\n                } catch (IOException e) {\r\n                    throw new ClassNotFoundException(name);\r\n                }\r\n            }\r\n        };\r\n\r\n        String currentClass = \"com.yuanhh.classloader.ClassLoadDemo\";\r\n        Class<?> clazz = clazzLoader.loadClass(currentClass);\r\n        Object obj = clazz.newInstance();\r\n\r\n        System.out.println(obj.getClass());\r\n        System.out.println(obj instanceof com.yuanhh.classloader.ClassLoadDemo);\r\n    }\r\n}\r\n```\r\n上面代码的输出结果：\r\n```\r\nclass com.yuanhh.classloader.ClassLoadDemo\r\nfalse\r\n```\r\n\r\n      输出结果的第一行，可以看出这个对象的确是com.yuanhh.classloader.ClassLoadDemo实例化的对象；但第二句是false，这是由于代码中的obj是由用户自定义的类加载器clazzLoader来加载的，可通过obj.getClass().getClassLoader()获取该对象的类加载器为com.yuanhh.classloader.ClassLoadDemoAppClassLoader@XXX。\r\n      所以可得出结论：即使都是来自同一个Class文件，加载器不同，仍然是两个不同的类，所以返回值是false；通过Class.forName()方法加载的类，采用的是系统类加载器。\r\n\r\n###5、class文件的显示加载与隐式加载的概念\r\n      所谓class文件的显示加载与隐式加载的方式是指JVM加载class文件到内存的方式，显示加载指的是在代码中通过调用ClassLoader加载class对象，如直接使用Class.forName(name)或this.getClass().getClassLoader().loadClass()加载class对象。隐式加载则是不直接在代码中调用ClassLoader的方法加载class对象，而是通过虚拟机自动加载到内存中，如在加载某个类的class文件时，该类的class文件中引用了另外一个类的对象，此时额外引用的类将通过JVM自动加载到内存中。\r\n\r\n###6、双亲委派模型\r\n      双亲委派模式要求除了顶层的启动类加载器外，其余的类加载器都应当有自己的父类加载器，请注意双亲委派模式中的父子关系并非通常所说的类继承关系，而是采用组合关系来复用父类加载器的相关代码，类加载器间的关系如下：\r\n![双亲模式](/static/images/classloader.png)  \r\n\r\n      双亲委派模式是在Java 1.2后引入的，其工作原理的是，如果一个类加载器收到了类加载请求，它并不会自己先去加载，而是把这个请求委托给父类的加载器去执行，如果父类加载器还存在其父类加载器，则进一步向上委托，依次递归，请求最终将到达顶层的启动类加载器，如果父类加载器可以完成类加载任务，就成功返回，倘若父类加载器无法完成此加载任务，子加载器才会尝试自己去加载，这就是双亲委派模式。  \r\n\r\n      双亲委派模式优势：\r\n+ 采用双亲委派模式的是好处是Java类随着它的类加载器一起具备了一种带有优先级的层次关系，通过这种层级关可以避免类的重复加载，当父亲已经加载了该类时，就没有必要子ClassLoader再加载一次。\r\n+ 其次是考虑到安全因素，java核心api中定义类型不会被随意替换，假设通过网络传递一个名为java.lang.Integer的类，通过双亲委托模式传递到启动类加载器，而启动类加载器在核心Java API发现这个名字的类，发现该类已被加载，并不会重新加载网络传递的过来的java.lang.Integer，而直接返回已加载过的Integer.class，这样便可以防止核心API库被随意篡改。\r\n+ 可能你会想，如果我们在classpath路径下自定义一个名为java.lang.SingleInterge类(该类是胡编的)呢？该类并不存在java.lang中，经过双亲委托模式，传递到启动类加载器中，由于父类加载器路径下并没有该类，所以不会加载，将反向委托给子类加载器加载，最终会通过系统类加载器加载该类。但是这样做是不允许，因为java.lang是核心API包，需要访问权限，强制加载将会报出如下异常java.lang.SecurityException: Prohibited package name: java.lang。\r\n\r\n###7、类加载器间的关系  \r\n      我们进一步了解类加载器间的关系(并非指继承关系)，主要可以分为以下4点:\r\n- 启动类加载器，由C++实现，没有父类。\r\n- 拓展类加载器(ExtClassLoader)，由Java语言实现，父类加载器为null。\r\n- 系统类加载器(AppClassLoader)，由Java语言实现，父类加载器为ExtClassLoader。\r\n- 自定义类加载器，父类加载器肯定为AppClassLoader。\r\n\r\n###8、两个class对象是否为同一个类对象  \r\n      在JVM中表示两个class对象是否为同一个类对象存在两个必要条件:\r\n+ 类的完整类名必须一致，包括包名。<br/>\r\n+ 加载这个类的ClassLoader(指ClassLoader实例对象)必须相同。<br/>\r\n---\r\n      也就是说，在JVM中，即使这个两个类对象(class对象)来源同一个Class文件，被同一个虚拟机所加载，但只要加载它们的ClassLoader实例对象不同，那么这两个类对象也是不相等的，这是因为不同的ClassLoader实例对象都拥有不同的独立的类名称空间，所以加载的class对象也会存在不同的类名空间中,但前提是覆写loadclass方法，从前面双亲委派模式对loadClass()方法的源码分析中可以知，在方法第一步会通过Class<?> c = findLoadedClass(name);从缓存查找，类名完整名称相同则不会再次被加载，因此我们必须绕过缓存查询才能重新加载class对象。当然也可直接调用findClass()方法，这样也避免从缓存查找，如下:\r\n```\r\nString rootDir=\"/Users/zejian/Downloads/Java8_Action/src/main/java/\";\r\n//创建两个不同的自定义类加载器实例\r\nFileClassLoader loader1 = new FileClassLoader(rootDir);\r\nFileClassLoader loader2 = new FileClassLoader(rootDir);\r\n//通过findClass创建类的Class对象\r\nClass<?> object1=loader1.findClass(\"com.zejian.classloader.DemoObj\");\r\nClass<?> object2=loader2.findClass(\"com.zejian.classloader.DemoObj\");\r\n\r\nSystem.out.println(\"findClass->obj1:\"+object1.hashCode());\r\nSystem.out.println(\"findClass->obj2:\"+object2.hashCode());\r\n\r\n/**\r\n  * 直接调用findClass方法输出结果:\r\n  * findClass->obj1:723074861\r\n    findClass->obj2:895328852\r\n    生成不同的实例\r\n  */\r\n```\r\n      如果调用父类的loadClass方法，结果如下，除非重写loadClass()方法去掉缓存查找步骤，不过现在一般都不建议重写loadClass()方法。\r\n```\r\n//直接调用父类的loadClass()方法\r\nClass<?> obj1 =loader1.loadClass(\"com.zejian.classloader.DemoObj\");\r\nClass<?> obj2 =loader2.loadClass(\"com.zejian.classloader.DemoObj\");\r\n\r\n//不同实例对象的自定义类加载器\r\nSystem.out.println(\"loadClass->obj1:\"+obj1.hashCode());\r\nSystem.out.println(\"loadClass->obj2:\"+obj2.hashCode());\r\n//系统类加载器\r\nSystem.out.println(\"Class->obj3:\"+DemoObj.class.hashCode());\r\n\r\n/**\r\n* 直接调用loadClass方法的输出结果,注意并没有重写loadClass方法\r\n* loadClass->obj1:1872034366\r\n  loadClass->obj2:1872034366\r\n  Class->    obj3:1872034366\r\n  都是同一个实例\r\n*/\r\n```\r\n      所以如果不从缓存查询相同完全类名的class对象，那么只有classLoader的实例对象不同，同一字节码文件创建的class对象自然也不会相同。', '/static/images/classloader.jpg', '2020-05-19 09:37:05', '2020-05-26 11:04:06', '20', 'classloader', '1', '2', '1');
INSERT INTO `storm_article` VALUES ('16', 'Java NIO：IO与NIO的区别', 'NIO即New IO，这个库是在JDK1.4中才引入的。NIO和IO有相同的作用和目的，但实现方式不同，NIO主要用到的是块，所以NIO的效率要比IO高很多。在Java API中提供了两套NIO，一套是针对标准输入输出NIO，另一套就是网络编程NIO。', '###1、概念\r\n      NIO即New IO，这个库是在JDK1.4中才引入的。NIO和IO有相同的作用和目的，但实现方式不同，NIO主要用到的是块，所以NIO的效率要比IO高很多。在Java API中提供了两套NIO，一套是针对标准输入输出NIO，另一套就是网络编程NIO。\r\n###2、NIO和IO的主要区别\r\n      下表总结了Java IO和NIO之间的主要区别：\r\n|IO|NIO|\r\n|:----:|:----:|\r\n|面向流|面向缓冲|\r\n阻塞IO|非阻塞IO|\r\n|无|选择器|  \r\n\r\n####1、面向流与面向缓冲\r\n      Java IO和NIO之间第一个最大的区别是，IO是面向流的，NIO是面向缓冲区的。 Java IO面向流意味着每次从流中读一个或多个字节，直至读取所有字节，它们没有被缓存在任何地方。此外，它不能前后移动流中的数据。如果需要前后移动从流中读取的数据，需要先将它缓存到一个缓冲区。 Java NIO的缓冲导向方法略有不同。数据读取到一个它稍后处理的缓冲区，需要时可在缓冲区中前后移动。这就增加了处理过程中的灵活性。但是，还需要检查是否该缓冲区中包含所有您需要处理的数据。而且，需确保当更多的数据读入缓冲区时，不要覆盖缓冲区里尚未处理的数据。\r\n####2、阻塞与非阻塞IO\r\n      Java IO的各种流是阻塞的。这意味着，当一个线程调用read() 或 write()时，该线程被阻塞，直到有一些数据被读取，或数据完全写入。该线程在此期间不能再干任何事情了。Java NIO的非阻塞模式，使一个线程从某通道发送请求读取数据，但是它仅能得到目前可用的数据，如果目前没有数据可用时，就什么都不会获取，而不是保持线程阻塞，所以直至数据变的可以读取之前，该线程可以继续做其他的事情。 非阻塞写也是如此。一个线程请求写入一些数据到某通道，但不需要等待它完全写入，这个线程同时可以去做别的事情。 线程通常将非阻塞IO的空闲时间用于在其它通道上执行IO操作，所以一个单独的线程现在可以管理多个输入和输出通道（channel）。 \r\n      IO的各种流是阻塞的，就是当一个线程调用读写方法时，该线程会被阻塞，直到读写完，在这期间该线程不能干其他事，CPU转而去处理其他线程，假如一个线程监听一个端口，一天只会有几次请求进来，但是CPU却不得不为该线程不断的做上下文切换，并且大部分切换以阻塞告终。\r\n      NIO通讯是将整个任务切换成许多小任务，由一个线程负责处理所有io事件，并负责分发。它是利用事件驱动机制，而不是监听机制，事件到的时候再触发。NIO线程之间通过wait，notify等方式通讯。保证了每次上下文切换都有意义，减少无谓的进程切换。\r\n####3、选择器（Selectors）\r\n      Java NIO的选择器允许一个单独的线程来监视多个输入通道，你可以注册多个通道使用一个选择器，然后使用一个单独的线程来“选择”通道：这些通道里已经有可以处理的输入，或者选择已准备写入的通道。这种选择机制，使得一个单独的线程很容易来管理多个通道。\r\n###3、NIO和IO如何影响应用程序的设计\r\n+ 对NIO或IO类的API调用\r\n+ 数据处理\r\n+ 用来处理数据的线程数\r\n####①、API调用\r\n      当然，使用NIO的API调用时看起来与使用IO时有所不同，但这并不意外，因为并不是仅从一个InputStream逐字节读取，而是数据必须先读入缓冲区再处理。\r\n####②、数据处理\r\n      使用纯粹的NIO设计相较IO设计，数据处理也受到影响。\r\n在IO设计中，我们从InputStream或 Reader逐字节读取数据。假设你正在处理一基于行的文本数据流，例如：\r\n```\r\nName: Anna \r\nAge: 25\r\nEmail: anna@mailserver.com \r\nPhone: 1234567890 \r\n```\r\n该文本行的流可以这样处理：\r\n```\r\nInputStream input = ... ; // get the InputStream from the client socket   \r\n\r\nBufferedReader reader = new BufferedReader(new InputStreamReader(input));   \r\n\r\nString nameLine   = reader.readLine(); \r\nString ageLine    = reader.readLine(); \r\nString emailLine  = reader.readLine(); \r\nString phoneLine  = reader.readLine(); \r\n```\r\n\r\n      请注意处理状态由程序执行多久决定。换句话说，一旦reader.readLine()方法返回，你就知道肯定文本行就已读完， readline()阻塞直到整行读完，这就是原因。你也知道此行包含名称；同样，第二个readline()调用返回的时候，你知道这行包含年龄等。 正如你可以看到，该处理程序仅在有新数据读入时运行，并知道每步的数据是什么。一旦正在运行的线程已处理过读入的某些数据，该线程不会再回退数据（大多如此）。下图也说明了这条原则：\r\n<div align=center>![IO数据处理](/static/images/io1.png)</div>  \r\n\r\n而一个NIO的实现会有所不同，下面是一个简单的例子：\r\n```\r\nByteBuffer buffer = ByteBuffer.allocate(48); \r\nint bytesRead = inChannel.read(buffer);\r\n```\r\n      注意第二行，从通道读取字节到ByteBuffer。当这个方法调用返回时，你不知道你所需的所有数据是否在缓冲区内。你所知道的是，该缓冲区包含一些字节，这使得处理有点困难。假设第一次 read(buffer)调用后，读入缓冲区的数据只有半行，例如，“Name:An”，你能处理数据吗？显然不能，需要等待，直到整行数据读入缓存，在此之前，对数据的任何处理毫无意义。所以，你怎么知道是否该缓冲区包含足够的数据可以处理呢？好了，你不知道。发现的方法只能查看缓冲区中的数据。其结果是，在你知道所有数据都在缓冲区里之前，你必须检查几次缓冲区的数据。这不仅效率低下，而且可以使程序设计方案杂乱不堪。例如：\r\n```\r\nByteBuffer buffer = ByteBuffer.allocate(48);   \r\n\r\nint bytesRead = inChannel.read(buffer);   \r\n\r\nwhile(! bufferFull(bytesRead) ) {   \r\n       bytesRead = inChannel.read(buffer);   \r\n}\r\n```\r\n      bufferFull()方法必须跟踪有多少数据读入缓冲区，并返回真或假，这取决于缓冲区是否已满。换句话说，如果缓冲区准备好被处理，那么表示缓冲区满了。\r\n      bufferFull()方法扫描缓冲区，但必须保持在bufferFull（）方法被调用之前状态相同。如果没有，下一个读入缓冲区的数据可能无法读到正确的位置。这是不可能的，但却是需要注意的又一问题。如果缓冲区已满，它可以被处理。如果它不满，并且在你的实际案例中有意义，你或许能处理其中的部分数据。但是许多情况下并非如此。下图展示了“缓冲区数据循环就绪”：\r\n<div align=center>![缓冲区数据处理](/static/images/io2.png)</div>  \r\n\r\n###4、总结\r\n      NIO可让您只使用一个（或几个）单线程管理多个通道（网络连接或文件），但付出的代价是解析数据可能会比从一个阻塞流中读取数据更复杂。\r\n      如果需要管理同时打开的成千上万个连接，这些连接每次只是发送少量的数据，例如聊天服务器，实现NIO的服务器可能是一个优势。同样，如果你需要维持许多打开的连接到其他计算机上，如P2P网络中，使用一个单独的线程来管理你所有出站连接，可能是一个优势。一个线程多个连接的设计方案如下图所示：\r\n<div align=center>![一个线程多个连接](/static/images/io3.png)</div>  \r\n\r\n      Java NIO: 单线程管理多个连接\r\n      如果你有少量的连接使用非常高的带宽，一次发送大量的数据，也许典型的IO服务器实现可能非常契合。下图说明了一个典型的IO服务器设计：\r\n<div align=center>![典型的IO服务器设计](/static/images/io4.png)</div>', '/static/images/summary.jpg', '2020-05-21 19:33:08', '2020-06-09 11:08:52', '2', 'io', '1', '2', '2');
INSERT INTO `storm_article` VALUES ('17', 'python使用paramiko配置交换机执行多条命令', '我们知道，通过SSH服务可以远程连接到Linux服务器，查看上面的日志状态，批量配置远程服务器，文件上传，文件下载等，Python的paramiko模块同样实现了这一功能。', '###paramiko是用python语言写的一个模块，遵循SSH2协议，支持以加密和认证的方式，进行远程服务器的连接。\r\n\r\n        由于使用的是python这样的能够跨平台运行的语言，所以所有python支持的平台，如Linux, Solaris, BSD, MacOS X, Windows等，paramiko都可以支持，因此，如果需要使用SSH从一个平台连接到另外一个平台，进行一系列的操作时，paramiko可以说是最佳工具。\r\n        如下代码展示了通过Python给交换机下发创建vrf的配置，主要用来测试交换机能够配置vrf的最大条目数以及配置所用时长。\r\n\r\n```\r\nimport paramiko\r\nimport datetime\r\n\r\nfor i in range(223,65535):\r\n#创建SSH对象\r\n    ssh = paramiko.SSHClient()\r\n\r\n    #把要连接的机器添加到known_hosts文件中\r\n    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())\r\n\r\n    #连接服务器\r\n    ssh.connect(hostname=\'172.20.1.142\', port=22, username=\'admin\', password=\'admin\')\r\n\r\n    cmds = []\r\n    cmd = \'configure terminal\'\r\n    cmds.append(cmd)\r\n    cmd = \'vrf context test_\'+str(i)\r\n    cmds.append(cmd)\r\n    cmd = \'end\'\r\n    cmds.append(cmd)\r\n\r\n    str_value = \' ;\'.join(cmds)\r\n    print(str_value)\r\n    # #cmd = \'ls -l;ifconfig\'       #多个命令用;隔开\r\n    try:\r\n        start = datetime.datetime.now()\r\n        stdin, stdout, stderr = ssh.exec_command(str_value) \r\n        result = stdout.read()\r\n\r\n        if not result:\r\n            result = stderr.read()  \r\n        ssh.close()\r\n        end = datetime.datetime.now()\r\n        print(end- start)\r\n        print(result.decode())\r\n    except EOFError:\r\n        print(\"EOFError\")\r\n\r\n\r\n```', '/static/images/summary.jpg', '2020-06-08 16:38:17', '2020-06-09 11:08:55', '1', 'paramiko', '1', '1', '1');
INSERT INTO `storm_article` VALUES ('18', '思科模拟器开局配置', '作为一名网络工程师，经常需要调试各种设备，面对各种设备的开局配置，下面就思科的CSR-1000V模拟器为例，展示一下一个全新的模拟器需要经过哪些配置才能使用CRT远程连接。', '###1、配置IP地址\r\n<div align=center>![配置IP地址](/static/images/configIp.png)</div>  \r\n\r\n###2、配置用户名密码\r\n<div align=center>![配置用户名密码](/static/images/configUser.png)</div>  \r\n\r\n##3、配置SSH\r\n<div align=center>![配置SSH](/static/images/configSSH.png)</div>\r\n\r\n        如果还是无法通过SSH连接上，可能就是本地PC和模拟器不在同一个IP地址段，那么需要添加静态路由配置。\r\n        ip route 0.0.0.0/0 172.20.0.1', '/static/images/summary.jpg', '2020-06-09 09:30:43', '2020-06-09 11:08:52', '1', 'configCSR1000v', '1', '9', '1');
INSERT INTO `storm_article` VALUES ('19', 'Unity3d开发贪吃蛇', 'Unity3D是一个让你轻松创作的多平台的游戏开发工具，是一个全面整合的专业游戏引擎。《王者荣耀》、《神庙逃亡》、《炉石传说》等优秀的游戏均是采用Unity3d引擎进行开发的，下面我们使用Unity3d开发一款经典的游戏“贪吃蛇”，并对Unity3d做一个简单的介绍。', '###1、Unity3d引擎简介\r\n###2、游戏边框\r\n###3、游戏脚本', '/static/images/summary.jpg', '2020-06-12 15:19:04', '2020-06-12 15:22:40', '0', 'u3d_snake', '1', '10', '1');
INSERT INTO `storm_article` VALUES ('20', 'Java内存泄露是如何发生的', 'JVM是Java程序的核心优势之一，它是一种开箱即用的内存管理。在编写Java程序时，我们可以自由创建对象，Java Garbage Collector（垃圾回收器）负责为我们分配和释放内存。但是，Java应用程序中仍然可能发生内存泄漏。', '## **1. 什么是内存泄露？**\r\n\r\n内存泄漏的标准定义是**当应用程序不再使用对象，但是垃圾回收器无法将它们从工作内存中删除时**发生的一种情况， 因为它们仍在被引用。结果，应用程序消耗了越来越多的资源，最终导致致命的OutOfMemoryError。\r\n\r\n为了更好地理解该概念，下面是一个简单的视觉表示：\r\n<div align=center>![内训溢出](/static/images/oom.jpg)</div>\r\n\r\n如我们所见，我们有两种类型的对象–引用对象和未引用对象；垃圾收集器可以删除未引用的对象。引用的对象将不会被收集，即使应用程序实际上不再使用它们也是如此。  \r\n检测内存泄漏可能很困难。许多工具执行静态分析来确定潜在的泄漏，但是这些技术并不完美，因为最重要的方面是正在运行的系统的实际运行时行为。  \r\n所以，让我们的一些标准做法，专注的神情避免了内存泄露，通过分析一些常见的场景。\r\n\r\n## **2. 内存泄漏是如何发生的？**\r\n        接下来我们将介绍几种经典的内存泄露发生场景，首先我们需要修改JVM的堆内存大小，使用“Xms<size>”和“-Xmx<size>”分别指定初始Java堆大小以及最大堆大小，我们调小这些参数有助于制造出内存泄露异常。\r\n### ①. static关键字的错误使用\r\n我们看一个例子：\r\n\r\n```\r\nprivate Random random = new Random();\r\npublic static final ArrayList<Double> list = new ArrayList<Double>(1000000);\r\n\r\n@Test\r\npublic void givenStaticField_whenLotsOfOperations_thenMemoryLeak() throws InterruptedException {\r\n    for (int i = 0; i < 1000000; i++) {\r\n        list.add(random.nextDouble());\r\n    }\r\n    \r\n    System.gc();\r\n    Thread.sleep(10000); // to allow GC do its job\r\n}\r\n```  \r\n        我们定义了一个静态链表并初始化了其容量为1000000，并向其中添加了一百万条数据，众所周知，静态变量不会被gc回收，会存在于JVM的整个生命周期，此种方法很容易造成内存泄露，要避免static参数带来的内存泄露风险，我们需要着重关注static关键字修饰的集合和重对象。\r\n\r\n### ②. 在长字符串上调用String.intern()  \r\n我们看一个例子\r\n```\r\n@Test\r\npublic void givenLengthString_whenIntern_thenOutOfMemory() throws IOException, InterruptedException {\r\n    Thread.sleep(15000);\r\n    String str = new Scanner(new File(\"src/test/resources/large.txt\"), \"UTF-8\").useDelimiter(\"\\\\A\").next();\r\n    str.intern();\r\n    \r\n    System.gc(); \r\n    Thread.sleep(15000);\r\n}\r\n```\r\n        以上代码中，我们试图读取一个大文件，并调用String.intern()方法规范化，这步操作将会文件读取到永久代内存PermGen中，导致gc获取不到足够的内存，由此引发内存溢出，如果我们的程序中需要大量处理很长的字符串，我们可以在JVM中通过如下参数“-XX:MaxPermSize=<size>XX:MaxPermSize=<size>”增加永久代内存的大小；\r\n        在Java-8中，永久代内存空间被元空间Metaspace取代，调用String.intern()方法将不会造成内存溢出。\r\n\r\n### ③. 未封闭的流\r\n我们看一个例子：\r\n```\r\n@Test(expected = OutOfMemoryError.class)\r\npublic void givenURL_whenUnclosedStream_thenOutOfMemory() throws IOException, URISyntaxException  {\r\n    String str = \"\";\r\n    URLConnection conn = new URL(\"http://norvig.com/big.txt\").openConnection();\r\n    BufferedReader br = new BufferedReader(\r\n      new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));\r\n    while (br.readLine() != null)  {\r\n        str += br.readLine();\r\n    } \r\n}\r\n```\r\n        上述代码中，我们使用Stream去获取big.txt的内容，但是没有关闭Stream,这种内存泄露在Java8中引入了自动关闭功能，如下：BufferedReader将在try语句的末尾自动关闭。\r\n```\r\ntry (BufferedReader br = new BufferedReader( \r\n  new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {\r\n    // further implementation\r\n} catch (IOException e) {\r\n    e.printStackTrace();\r\n}\r\n```\r\n\r\n### ④. 未关闭的链接\r\n这种情况与前一种情况非常相似，主要区别是处理未关闭的连接（例如，到数据库，到FTP服务器等）。再次，不正确的实现会造成很多危害，从而导致内存问题。让我们看一个简单的例子：\r\n```\r\n@Test(expected = OutOfMemoryError.class)\r\npublic void givenConnection_whenUnclosed_thenOutOfMemory() throws IOException, URISyntaxException {\r\n    \r\n    URL url = new URL(\"ftp://speedtest.tele2.net\");\r\n    URLConnection urlc = url.openConnection();\r\n    InputStream is = urlc.getInputStream();\r\n    String str = \"\";\r\n    //\r\n}\r\n```\r\n### ⑤. 将没有hashCode（）和equals（）的对象添加到HashSet中\r\n首先我们创建一个不包含equals或hashCode的简单类：\r\n```\r\npublic class Key { \r\n    public String key;\r\n    \r\n    public Key(String key) {\r\n        Key.key = key;\r\n    }\r\n}\r\n```\r\n然后我们看一下使用场景：\r\n```\r\n@Test(expected = OutOfMemoryError.class)\r\npublic void givenMap_whenNoEqualsNoHashCodeMethods_thenOutOfMemory()\r\n  throws IOException, URISyntaxException {\r\n    Map<Object, Object> map = System.getProperties();\r\n    while (true) {\r\n        map.put(new Key(\"key\"), \"value\");\r\n    }\r\n}\r\n```\r\n        在这个例子中，我们无限往Map中写入Key，因为Key没有重写hashCode和toString()方法，所以Map无法忽略重复项，Map中的数据会无限增长，由此导致内存溢出。\r\n\r\n## ** 3. 如何在您的应用程序中查找泄漏源？**\r\n详情可以参考：[定位内存泄露](https://blog.csdn.net/bigtree_3721/article/details/50550248).', '/static/images/summary.jpg', '2020-06-15 10:48:54', '2020-06-15 16:06:52', '0', 'oom', '1', '2', '0');

-- ----------------------------
-- Table structure for storm_article_keywords
-- ----------------------------
DROP TABLE IF EXISTS `storm_article_keywords`;
CREATE TABLE `storm_article_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `storm_article_keywords_article_id_keyword_id_7510b8d6_uniq` (`article_id`,`keyword_id`),
  KEY `storm_article_keywords_keyword_id_a563777a_fk_storm_keyword_id` (`keyword_id`),
  CONSTRAINT `storm_article_keywords_article_id_5df25258_fk_storm_article_id` FOREIGN KEY (`article_id`) REFERENCES `storm_article` (`id`),
  CONSTRAINT `storm_article_keywords_keyword_id_a563777a_fk_storm_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `storm_keyword` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storm_article_keywords
-- ----------------------------
INSERT INTO `storm_article_keywords` VALUES ('2', '12', '2');
INSERT INTO `storm_article_keywords` VALUES ('4', '13', '4');
INSERT INTO `storm_article_keywords` VALUES ('5', '14', '5');
INSERT INTO `storm_article_keywords` VALUES ('6', '15', '3');
INSERT INTO `storm_article_keywords` VALUES ('7', '16', '3');
INSERT INTO `storm_article_keywords` VALUES ('8', '17', '1');
INSERT INTO `storm_article_keywords` VALUES ('9', '18', '6');
INSERT INTO `storm_article_keywords` VALUES ('10', '19', '7');
INSERT INTO `storm_article_keywords` VALUES ('11', '20', '3');

-- ----------------------------
-- Table structure for storm_article_tags
-- ----------------------------
DROP TABLE IF EXISTS `storm_article_tags`;
CREATE TABLE `storm_article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `storm_article_tags_article_id_tag_id_c71bf3b2_uniq` (`article_id`,`tag_id`),
  KEY `storm_article_tags_tag_id_e8380d38_fk_storm_tag_id` (`tag_id`),
  CONSTRAINT `storm_article_tags_article_id_15b9f147_fk_storm_article_id` FOREIGN KEY (`article_id`) REFERENCES `storm_article` (`id`),
  CONSTRAINT `storm_article_tags_tag_id_e8380d38_fk_storm_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `storm_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storm_article_tags
-- ----------------------------
INSERT INTO `storm_article_tags` VALUES ('8', '12', '3');
INSERT INTO `storm_article_tags` VALUES ('7', '13', '2');
INSERT INTO `storm_article_tags` VALUES ('9', '14', '4');
INSERT INTO `storm_article_tags` VALUES ('12', '15', '3');
INSERT INTO `storm_article_tags` VALUES ('13', '16', '3');
INSERT INTO `storm_article_tags` VALUES ('14', '17', '1');
INSERT INTO `storm_article_tags` VALUES ('15', '18', '6');
INSERT INTO `storm_article_tags` VALUES ('16', '19', '8');
INSERT INTO `storm_article_tags` VALUES ('17', '20', '3');

-- ----------------------------
-- Table structure for storm_bigcategory
-- ----------------------------
DROP TABLE IF EXISTS `storm_bigcategory`;
CREATE TABLE `storm_bigcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `keywords` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storm_bigcategory
-- ----------------------------
INSERT INTO `storm_bigcategory` VALUES ('1', 'Java', 'java', '生活笔记', '生活笔记');
INSERT INTO `storm_bigcategory` VALUES ('2', 'Python', 'python', '技术杂谈', '技术杂谈');
INSERT INTO `storm_bigcategory` VALUES ('3', '网络知识', 'network', 'SDN、交换机、路由器、园区网、DNA等相关知识', '网络');
INSERT INTO `storm_bigcategory` VALUES ('4', '游戏开发', 'game', 'unity3d游戏开发经验总结', '网络,IT,技术,博客,Python');
INSERT INTO `storm_bigcategory` VALUES ('5', '生活杂烩', 'life', '生活杂烩', '生活杂烩');
INSERT INTO `storm_bigcategory` VALUES ('7', '相册', 'album', '精彩生活', '精彩生活');
INSERT INTO `storm_bigcategory` VALUES ('8', '关于作者', 'about', '关于作者', '关于作者');

-- ----------------------------
-- Table structure for storm_carousel
-- ----------------------------
DROP TABLE IF EXISTS `storm_carousel`;
CREATE TABLE `storm_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `content` varchar(80) NOT NULL,
  `img_url` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storm_carousel
-- ----------------------------
INSERT INTO `storm_carousel` VALUES ('1', '1', '小白学爬虫系列教程', '小白学爬虫系列教程', '/static/images/index1.jpg', 'http://127.0.0.1:8080/article/123/');
INSERT INTO `storm_carousel` VALUES ('2', '2', '小白学爬虫系列教程', '小白学爬虫系列教程', '/static/images/index2.jpg', 'http://127.0.0.1:8080/article/123/');
INSERT INTO `storm_carousel` VALUES ('3', '3', '小白学爬虫系列教程', '小白学爬虫系列教程', '/static/images/index3.jpg', 'http://127.0.0.1:8080/article/123/');
INSERT INTO `storm_carousel` VALUES ('4', '4', '小白学爬虫系列教程', '小白学爬虫系列教程', '/static/images/index4.jpg', 'http://127.0.0.1:8080/article/123/');
INSERT INTO `storm_carousel` VALUES ('5', '5', '小白学爬虫系列教程', '小白学爬虫系列教程', '/static/images/index5.jpg', 'http://127.0.0.1:8080/article/123/');

-- ----------------------------
-- Table structure for storm_category
-- ----------------------------
DROP TABLE IF EXISTS `storm_category`;
CREATE TABLE `storm_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `bigcategory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `storm_category_bigcategory_id_aa573836_fk_storm_bigcategory_id` (`bigcategory_id`),
  CONSTRAINT `storm_category_bigcategory_id_aa573836_fk_storm_bigcategory_id` FOREIGN KEY (`bigcategory_id`) REFERENCES `storm_bigcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storm_category
-- ----------------------------
INSERT INTO `storm_category` VALUES ('1', 'python', 'python', 'StormSha的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好', '2');
INSERT INTO `storm_category` VALUES ('2', 'java进阶', 'javaforward', '分享java进阶技术', '1');
INSERT INTO `storm_category` VALUES ('3', '爬虫', 'spider', '分享爬虫相关知识', '2');
INSERT INTO `storm_category` VALUES ('4', 'Django', 'django', '分享Django相关知识', '2');
INSERT INTO `storm_category` VALUES ('5', 'OpenDayLight', 'odl', 'ODL相关技术交流、分享', '1');
INSERT INTO `storm_category` VALUES ('6', 'OpenStack', 'openstack', 'OpenStack相关技术交流、分享', '2');
INSERT INTO `storm_category` VALUES ('7', 'java基础', 'javabasic', 'Java基础知识', '1');
INSERT INTO `storm_category` VALUES ('8', '生活杂烩', 'others', '其他', '5');
INSERT INTO `storm_category` VALUES ('9', '网络配置', 'NetConfig', '网络设备配置相关', '3');
INSERT INTO `storm_category` VALUES ('10', 'Unity3d', 'unity3d', 'Unity3d游戏开发', '4');

-- ----------------------------
-- Table structure for storm_friendlink
-- ----------------------------
DROP TABLE IF EXISTS `storm_friendlink`;
CREATE TABLE `storm_friendlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `link` varchar(200) NOT NULL,
  `logo` varchar(200) NOT NULL,
  `create_date` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storm_friendlink
-- ----------------------------

-- ----------------------------
-- Table structure for storm_keyword
-- ----------------------------
DROP TABLE IF EXISTS `storm_keyword`;
CREATE TABLE `storm_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storm_keyword
-- ----------------------------
INSERT INTO `storm_keyword` VALUES ('1', 'python');
INSERT INTO `storm_keyword` VALUES ('2', 'RPC');
INSERT INTO `storm_keyword` VALUES ('3', 'java');
INSERT INTO `storm_keyword` VALUES ('4', 'javabasic');
INSERT INTO `storm_keyword` VALUES ('5', 'markdown');
INSERT INTO `storm_keyword` VALUES ('6', 'Network');
INSERT INTO `storm_keyword` VALUES ('7', 'Unity3d');

-- ----------------------------
-- Table structure for storm_silian
-- ----------------------------
DROP TABLE IF EXISTS `storm_silian`;
CREATE TABLE `storm_silian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badurl` varchar(200) NOT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `add_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storm_silian
-- ----------------------------

-- ----------------------------
-- Table structure for storm_tag
-- ----------------------------
DROP TABLE IF EXISTS `storm_tag`;
CREATE TABLE `storm_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storm_tag
-- ----------------------------
INSERT INTO `storm_tag` VALUES ('1', 'python', 'python', 'StormSha的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好');
INSERT INTO `storm_tag` VALUES ('2', 'java基础', 'java', 'StormSha的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好');
INSERT INTO `storm_tag` VALUES ('3', 'java进阶', '1', 'StormSha的个人网站，记录生活的瞬间，分享学习的心得，感悟生活，留住感动，静静寻觅生活的美好');
INSERT INTO `storm_tag` VALUES ('4', '其他', 'others', '其他');
INSERT INTO `storm_tag` VALUES ('6', '网络配置', 'NetConfig', '网络配置');
INSERT INTO `storm_tag` VALUES ('7', '游戏开发', 'game', '游戏开发');
INSERT INTO `storm_tag` VALUES ('8', 'Unity3d', 'unity3d', 'Unity3d游戏开发');

-- ----------------------------
-- Table structure for storm_timeline
-- ----------------------------
DROP TABLE IF EXISTS `storm_timeline`;
CREATE TABLE `storm_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `side` varchar(1) NOT NULL,
  `star_num` int(11) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `icon_color` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `update_date` datetime NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storm_timeline
-- ----------------------------

-- ----------------------------
-- Table structure for user_ouser
-- ----------------------------
DROP TABLE IF EXISTS `user_ouser`;
CREATE TABLE `user_ouser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `link` varchar(200) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_ouser
-- ----------------------------
INSERT INTO `user_ouser` VALUES ('1', 'pbkdf2_sha256$180000$YV3w8ftRF4bs$x8MIlaxLLkmrhZCO4CorTNzAJDDqB8CL3Je1uKnXLUc=', '2020-06-12 15:42:39.954436', '1', 'admin', '', '', '', '1', '1', '2020-04-02 15:16:11.712600', '', 'avatar/default.png');

-- ----------------------------
-- Table structure for user_ouser_groups
-- ----------------------------
DROP TABLE IF EXISTS `user_ouser_groups`;
CREATE TABLE `user_ouser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ouser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_ouser_groups_ouser_id_group_id_03bce0cb_uniq` (`ouser_id`,`group_id`),
  KEY `user_ouser_groups_group_id_12001949_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_ouser_groups_group_id_12001949_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_ouser_groups_ouser_id_ad1b57d3_fk_user_ouser_id` FOREIGN KEY (`ouser_id`) REFERENCES `user_ouser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_ouser_groups
-- ----------------------------

-- ----------------------------
-- Table structure for user_ouser_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `user_ouser_user_permissions`;
CREATE TABLE `user_ouser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ouser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_ouser_user_permissions_ouser_id_permission_id_ef5c908e_uniq` (`ouser_id`,`permission_id`),
  KEY `user_ouser_user_perm_permission_id_da78e996_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_ouser_user_perm_permission_id_da78e996_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_ouser_user_permissions_ouser_id_a820347f_fk_user_ouser_id` FOREIGN KEY (`ouser_id`) REFERENCES `user_ouser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_ouser_user_permissions
-- ----------------------------
