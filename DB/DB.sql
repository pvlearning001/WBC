-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for wbc
CREATE DATABASE IF NOT EXISTS `wbc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `wbc`;

-- Dumping structure for table wbc.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.category: ~0 rows (approximately)
REPLACE INTO `category` (`id`, `guid`, `name`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, '24a03984-b06e-4810-86c3-30f456f7bbe1', 'Announcement', NULL, b'0', '2024-08-19 02:25:40', 1, '2024-08-19 02:25:40', 1);

-- Dumping structure for table wbc.course
CREATE TABLE IF NOT EXISTS `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT NULL,
  `module_id` int(11) NOT NULL DEFAULT 0,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.course: ~0 rows (approximately)

-- Dumping structure for table wbc.exam
CREATE TABLE IF NOT EXISTS `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `module_id` int(11) NOT NULL DEFAULT 0,
  `date_from` date DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp() ON UPDATE current_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.exam: ~0 rows (approximately)

-- Dumping structure for table wbc.file_upload
CREATE TABLE IF NOT EXISTS `file_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ext_name` varchar(255) DEFAULT NULL,
  `unique_name` varchar(255) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `hash_content` varchar(255) DEFAULT NULL,
  `descriptions` varchar(1024) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.file_upload: ~0 rows (approximately)

-- Dumping structure for table wbc.introduce
CREATE TABLE IF NOT EXISTS `introduce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `history` varchar(2056) DEFAULT NULL,
  `hierarchy_map` varchar(255) DEFAULT NULL,
  `info_01` varchar(1024) DEFAULT NULL,
  `info_02` varchar(1024) DEFAULT NULL,
  `info_03` varchar(1024) DEFAULT NULL,
  `info_04` varchar(1024) DEFAULT NULL,
  `info_05` varchar(1024) DEFAULT NULL,
  `info_06` varchar(1024) DEFAULT NULL,
  `info_07` varchar(1024) DEFAULT NULL,
  `info_08` varchar(1024) DEFAULT NULL,
  `info_09` varchar(1024) DEFAULT NULL,
  `info_10` varchar(1024) DEFAULT NULL,
  `info_11` varchar(1024) DEFAULT NULL,
  `info_12` varchar(1024) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.introduce: ~0 rows (approximately)
REPLACE INTO `introduce` (`id`, `guid`, `history`, `hierarchy_map`, `info_01`, `info_02`, `info_03`, `info_04`, `info_05`, `info_06`, `info_07`, `info_08`, `info_09`, `info_10`, `info_11`, `info_12`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`, `name`) VALUES
	(1, '607d9ef3-4ce1-11ef-b622-509a4cb5cc32', NULL, NULL, 'TRUNG TÂM BỒI DƯỠNG NGHIỆP VỤ CẤP NƯỚC', 'Tháng 02/2002, Trung tâm bồi dưỡng cán bộ Thuế (tiền thân của Trường Nghiệp vụ Thuế) được thành lập theo Quyết định số 36/2002/QĐ-BTC ngày 20/03/2002 của Bộ trưởng Bộ Tài chính.', 'Hiện nay, chức năng, nhiệm vụ, quyền hạn và cơ cấu tổ chức của Trường Nghiệp vụ Thuế được quy định tại Quyết định số 2157/QĐ-BTC ngày 15/11/2018 của Bộ trưởng Bộ Tài chính. Theo đó, Trường Nghiệp vụ Thuế là đơn vị thuộc Tổng cục thuế, Bộ Tài chính, có trụ', 'Quận Tân Bình - TP.HCM', '0909.111.111', 'wbc@hcm.uit.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0', '2024-07-28 13:00:34', 1, '2024-07-28 13:00:34', 1, NULL);

-- Dumping structure for table wbc.invalidated_token
CREATE TABLE IF NOT EXISTS `invalidated_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT NULL,
  `expiry_time` datetime DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime(6) DEFAULT NULL,
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime(6) DEFAULT NULL,
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.invalidated_token: ~0 rows (approximately)

-- Dumping structure for table wbc.mark_result
CREATE TABLE IF NOT EXISTS `mark_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `mark_type_id` int(11) DEFAULT NULL,
  `mark` float DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.mark_result: ~0 rows (approximately)

-- Dumping structure for table wbc.mark_result_sum
CREATE TABLE IF NOT EXISTS `mark_result_sum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `user_id` int(11) DEFAULT NULL,
  `mark` float DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.mark_result_sum: ~0 rows (approximately)

-- Dumping structure for table wbc.mark_type
CREATE TABLE IF NOT EXISTS `mark_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.mark_type: ~0 rows (approximately)

-- Dumping structure for table wbc.mark_type_history
CREATE TABLE IF NOT EXISTS `mark_type_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.mark_type_history: ~0 rows (approximately)

-- Dumping structure for table wbc.module
CREATE TABLE IF NOT EXISTS `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.module: ~0 rows (approximately)

-- Dumping structure for table wbc.news
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `cate_id` int(11) NOT NULL DEFAULT 0,
  `subject` varchar(512) DEFAULT NULL,
  `content` varchar(1028) DEFAULT NULL,
  `content_ex_01` varchar(1028) DEFAULT NULL,
  `content_ex_02` varchar(1024) DEFAULT NULL,
  `content_ex_03` varchar(1024) DEFAULT NULL,
  `content_ex_04` varchar(1024) DEFAULT NULL,
  `content_ex_05` varchar(1024) DEFAULT NULL,
  `content_ex_06` varchar(1024) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.news: ~0 rows (approximately)

-- Dumping structure for table wbc.news_file_upload
CREATE TABLE IF NOT EXISTS `news_file_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT NULL,
  `news_id` int(11) DEFAULT NULL,
  `file_upload_id` int(11) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.news_file_upload: ~0 rows (approximately)

-- Dumping structure for table wbc.permission
CREATE TABLE IF NOT EXISTS `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `name` varchar(255) DEFAULT NULL,
  `descriptions` varchar(255) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime(6) DEFAULT NULL,
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime(6) DEFAULT NULL,
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.permission: ~0 rows (approximately)

-- Dumping structure for table wbc.register_form
CREATE TABLE IF NOT EXISTS `register_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `info_01` varchar(255) DEFAULT NULL,
  `info_02` varchar(255) DEFAULT NULL,
  `info_03` varchar(255) DEFAULT NULL,
  `info_04` varchar(255) DEFAULT NULL,
  `info_05` varchar(255) DEFAULT NULL,
  `info_06` varchar(255) DEFAULT NULL,
  `info_07` varchar(255) DEFAULT NULL,
  `info_08` varchar(255) DEFAULT NULL,
  `info_09` varchar(255) DEFAULT NULL,
  `info_10` varchar(255) DEFAULT NULL,
  `info_11` varchar(255) DEFAULT NULL,
  `info_12` varchar(255) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.register_form: ~0 rows (approximately)

-- Dumping structure for table wbc.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `name` varchar(255) DEFAULT NULL,
  `name_lower_cases` varchar(255) DEFAULT NULL,
  `descriptions` varchar(255) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `ins_at` datetime(6) DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime(6) DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.role: ~0 rows (approximately)
REPLACE INTO `role` (`id`, `guid`, `name`, `name_lower_cases`, `descriptions`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, '9cde214e-34ac-47b1-967f-0ad53a472d30', 'User', 'user', 'User Role', 'Init User Role', b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(2, '5ba6cca1-5644-4c49-839e-c5e461e7d833', 'Admin', 'admin', 'Admin Role', 'Init Admin Role', b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1);

-- Dumping structure for table wbc.role_permission
CREATE TABLE IF NOT EXISTS `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `role_id` int(11) DEFAULT NULL,
  `permision_id` int(11) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKf8yllw1ecvwqy3ehyxawqa1qp` (`permission_id`),
  KEY `FKa6jx8n8xkesmjmv6jqug6bg68` (`role_id`),
  CONSTRAINT `FKa6jx8n8xkesmjmv6jqug6bg68` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKf8yllw1ecvwqy3ehyxawqa1qp` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.role_permission: ~0 rows (approximately)

-- Dumping structure for procedure wbc.sp_TestGetUserByRole
DELIMITER //
CREATE PROCEDURE `sp_TestGetUserByRole`(
	IN `roleId` INT
)
BEGIN
	SELECT u.* FROM user u 
	WHERE EXISTS (SELECT 1 FROM user_role ur WHERE u.id = ur.user_id AND ur.role_id = roleId LIMIT 1);
END//
DELIMITER ;

-- Dumping structure for procedure wbc.sp_TestGetUsersData
DELIMITER //
CREATE PROCEDURE `sp_TestGetUsersData`(
	IN `userIdIndex` INT,
	INOUT `pageTotal` INT,
	OUT `pageTotal2` INT
)
BEGIN	
	SELECT * FROM user WHERE id > userIdIndex;
	SELECT * FROM user_ext WHERE user_id > userIdIndex;
	SELECT COUNT(id) INTO pageTotal FROM user WHERE id > userIdIndex;
	SET pageTotal2 = 12;
END//
DELIMITER ;

-- Dumping structure for table wbc.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_reset_pw` bit(1) DEFAULT b'0',
  `roles_id` varchar(255) DEFAULT NULL,
  `roles_name` varchar(512) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `ins_at` datetime(6) DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime(6) DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.user: ~0 rows (approximately)
REPLACE INTO `user` (`id`, `guid`, `user_name`, `password`, `is_reset_pw`, `roles_id`, `roles_name`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, '61acfec7-46c9-4ae0-98e7-4fcc13a308d8', 'admin', '$2a$10$rUI5gLaOznzIyKraE4adAOaKtEP3m3gUVXbfH13FwLqAOjLa7OcQ2', b'0', '2,1', 'Admin,User', 'Init User', b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(2, '5496563d-5dd2-11ef-b984-509a4cb5cc32', 'user02', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(3, '549928b1-5dd2-11ef-b984-509a4cb5cc32', 'user03', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(4, '549b90e5-5dd2-11ef-b984-509a4cb5cc32', 'user04', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(5, '549df95c-5dd2-11ef-b984-509a4cb5cc32', 'user05', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(6, '54a1f1c3-5dd2-11ef-b984-509a4cb5cc32', 'user06', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(7, '54a51fce-5dd2-11ef-b984-509a4cb5cc32', 'user07', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(8, '54a961fd-5dd2-11ef-b984-509a4cb5cc32', 'user08', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(9, '54adae3f-5dd2-11ef-b984-509a4cb5cc32', 'user09', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(10, '54b1fd76-5dd2-11ef-b984-509a4cb5cc32', 'user10', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(11, '54b5cc4c-5dd2-11ef-b984-509a4cb5cc32', 'user11', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(12, '54b8e64e-5dd2-11ef-b984-509a4cb5cc32', 'user12', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(13, '54bc2920-5dd2-11ef-b984-509a4cb5cc32', 'user13', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(14, '54c046ef-5dd2-11ef-b984-509a4cb5cc32', 'user14', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(15, '54c5d723-5dd2-11ef-b984-509a4cb5cc32', 'user15', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(16, '54c976a2-5dd2-11ef-b984-509a4cb5cc32', 'user16', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(17, '54cc8be1-5dd2-11ef-b984-509a4cb5cc32', 'user17', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(18, '54cee085-5dd2-11ef-b984-509a4cb5cc32', 'user18', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(19, '54d10102-5dd2-11ef-b984-509a4cb5cc32', 'user19', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(20, '54d36db6-5dd2-11ef-b984-509a4cb5cc32', 'user20', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(21, '54d5fa1f-5dd2-11ef-b984-509a4cb5cc32', 'user21', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(22, '54d878d1-5dd2-11ef-b984-509a4cb5cc32', 'user22', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(23, '54daba6b-5dd2-11ef-b984-509a4cb5cc32', 'user23', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:41.000000', 1, '2024-08-19 02:25:41.000000', 1),
	(24, '54e154d7-5dd2-11ef-b984-509a4cb5cc32', 'user24', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(25, '54e60f3d-5dd2-11ef-b984-509a4cb5cc32', 'user25', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(26, '54e9ca31-5dd2-11ef-b984-509a4cb5cc32', 'user26', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(27, '54ecb18a-5dd2-11ef-b984-509a4cb5cc32', 'user27', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(28, '54ef360d-5dd2-11ef-b984-509a4cb5cc32', 'user28', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(29, '54f1e216-5dd2-11ef-b984-509a4cb5cc32', 'user29', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(30, '54f466e9-5dd2-11ef-b984-509a4cb5cc32', 'user30', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(31, '54f6ebaa-5dd2-11ef-b984-509a4cb5cc32', 'user31', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(32, '54f9a81f-5dd2-11ef-b984-509a4cb5cc32', 'user32', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(33, '54fc4234-5dd2-11ef-b984-509a4cb5cc32', 'user33', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(34, '54ffdb21-5dd2-11ef-b984-509a4cb5cc32', 'user34', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(35, '550396f3-5dd2-11ef-b984-509a4cb5cc32', 'user35', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(36, '5507f153-5dd2-11ef-b984-509a4cb5cc32', 'user36', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(37, '550c63c8-5dd2-11ef-b984-509a4cb5cc32', 'user37', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(38, '550ec3b9-5dd2-11ef-b984-509a4cb5cc32', 'user38', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(39, '551117ba-5dd2-11ef-b984-509a4cb5cc32', 'user39', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(40, '55135884-5dd2-11ef-b984-509a4cb5cc32', 'user40', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(41, '551572a2-5dd2-11ef-b984-509a4cb5cc32', 'user41', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(42, '55179449-5dd2-11ef-b984-509a4cb5cc32', 'user42', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(43, '5519d4e3-5dd2-11ef-b984-509a4cb5cc32', 'user43', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(44, '551c7492-5dd2-11ef-b984-509a4cb5cc32', 'user44', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(45, '552034af-5dd2-11ef-b984-509a4cb5cc32', 'user45', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(46, '55257523-5dd2-11ef-b984-509a4cb5cc32', 'user46', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(47, '552b1d27-5dd2-11ef-b984-509a4cb5cc32', 'user47', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(48, '552e09b7-5dd2-11ef-b984-509a4cb5cc32', 'user48', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(49, '55304b90-5dd2-11ef-b984-509a4cb5cc32', 'user49', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(50, '5532b5ea-5dd2-11ef-b984-509a4cb5cc32', 'user50', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(51, '5534e57c-5dd2-11ef-b984-509a4cb5cc32', 'user51', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(52, '553702a7-5dd2-11ef-b984-509a4cb5cc32', 'user52', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(53, '55397703-5dd2-11ef-b984-509a4cb5cc32', 'user53', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(54, '553c3e3d-5dd2-11ef-b984-509a4cb5cc32', 'user54', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(55, '553fd863-5dd2-11ef-b984-509a4cb5cc32', 'user55', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(56, '5546b97f-5dd2-11ef-b984-509a4cb5cc32', 'user56', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(57, '554abcf6-5dd2-11ef-b984-509a4cb5cc32', 'user57', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(58, '554d0719-5dd2-11ef-b984-509a4cb5cc32', 'user58', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(59, '554f5fdb-5dd2-11ef-b984-509a4cb5cc32', 'user59', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(60, '5551dccc-5dd2-11ef-b984-509a4cb5cc32', 'user60', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(61, '55546b07-5dd2-11ef-b984-509a4cb5cc32', 'user61', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(62, '555715e0-5dd2-11ef-b984-509a4cb5cc32', 'user62', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(63, '5559b848-5dd2-11ef-b984-509a4cb5cc32', 'user63', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(64, '555cca95-5dd2-11ef-b984-509a4cb5cc32', 'user64', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(65, '555ffe60-5dd2-11ef-b984-509a4cb5cc32', 'user65', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(66, '55663545-5dd2-11ef-b984-509a4cb5cc32', 'user66', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(67, '55696a1b-5dd2-11ef-b984-509a4cb5cc32', 'user67', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(68, '556b9cb5-5dd2-11ef-b984-509a4cb5cc32', 'user68', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(69, '556dc57b-5dd2-11ef-b984-509a4cb5cc32', 'user69', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(70, '556ffcbb-5dd2-11ef-b984-509a4cb5cc32', 'user70', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(71, '55724372-5dd2-11ef-b984-509a4cb5cc32', 'user71', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(72, '55747bf9-5dd2-11ef-b984-509a4cb5cc32', 'user72', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:42.000000', 1, '2024-08-19 02:25:42.000000', 1),
	(73, '55794c62-5dd2-11ef-b984-509a4cb5cc32', 'user73', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(74, '557dc2db-5dd2-11ef-b984-509a4cb5cc32', 'user74', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(75, '5580c79b-5dd2-11ef-b984-509a4cb5cc32', 'user75', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(76, '5584af04-5dd2-11ef-b984-509a4cb5cc32', 'user76', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(77, '55875bd7-5dd2-11ef-b984-509a4cb5cc32', 'user77', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(78, '5589cff6-5dd2-11ef-b984-509a4cb5cc32', 'user78', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(79, '558bea26-5dd2-11ef-b984-509a4cb5cc32', 'user79', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(80, '558e14fa-5dd2-11ef-b984-509a4cb5cc32', 'user80', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(81, '559061db-5dd2-11ef-b984-509a4cb5cc32', 'user81', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(82, '559222f5-5dd2-11ef-b984-509a4cb5cc32', 'user82', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(83, '55940d7e-5dd2-11ef-b984-509a4cb5cc32', 'user83', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(84, '55961315-5dd2-11ef-b984-509a4cb5cc32', 'user84', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(85, '55998607-5dd2-11ef-b984-509a4cb5cc32', 'user85', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(86, '559cb3f6-5dd2-11ef-b984-509a4cb5cc32', 'user86', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(87, '55a19abe-5dd2-11ef-b984-509a4cb5cc32', 'user87', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(88, '55a7896e-5dd2-11ef-b984-509a4cb5cc32', 'user88', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(89, '55aa6759-5dd2-11ef-b984-509a4cb5cc32', 'user89', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(90, '55ad06e9-5dd2-11ef-b984-509a4cb5cc32', 'user90', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(91, '55af4d84-5dd2-11ef-b984-509a4cb5cc32', 'user91', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(92, '55b17a74-5dd2-11ef-b984-509a4cb5cc32', 'user92', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(93, '55b3c6a9-5dd2-11ef-b984-509a4cb5cc32', 'user93', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(94, '55b702c9-5dd2-11ef-b984-509a4cb5cc32', 'user94', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(95, '55b9fc30-5dd2-11ef-b984-509a4cb5cc32', 'user95', '$2a$10$9KOR6iGYyLo3s5gtwe/g6edmSQxvplish3x4PhcgurSF4/QvcL4ku', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:25:43.000000', 1, '2024-08-19 02:25:43.000000', 1),
	(96, '7096d74f-d7de-468c-9b62-e14b8d941407', 'user96', '$2a$10$GgZj87ZwK4TnBI3SyYULR.MC/9IA9XOlr.Z/t9//u0HbtSzZpF46q', b'0', '1', 'User', NULL, b'0', '2024-08-19 02:27:00.000000', 96, '2024-08-19 02:27:00.000000', 96);

-- Dumping structure for table wbc.user_ext
CREATE TABLE IF NOT EXISTS `user_ext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `user_id` int(11) DEFAULT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `m_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `addr` varchar(1024) DEFAULT NULL,
  `phone01` varchar(255) DEFAULT NULL,
  `phone02` varchar(255) DEFAULT NULL,
  `phone03` varchar(255) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.user_ext: ~0 rows (approximately)
REPLACE INTO `user_ext` (`id`, `guid`, `user_id`, `f_name`, `m_name`, `l_name`, `email`, `addr`, `phone01`, `phone02`, `phone03`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, 'c156a0f9-231a-45d4-961a-7bbe3b370bd4', 1, 'WBC', NULL, 'Admin', 'admin@wbc.com', NULL, '0903.123456', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(2, '0602f924-eb95-4e5d-9ce5-81f6e3f87b31', 2, 'WBC', NULL, 'User02', 'user02@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(3, 'cbf4881f-cd06-4fdd-9d75-f7056167ae73', 3, 'WBC', NULL, 'User03', 'user03@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(4, '1e891175-e6dd-4966-beca-799d1ef7b558', 4, 'WBC', NULL, 'User04', 'user04@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(5, '4ef185ad-ebb1-4b16-90b2-e47b984f94d3', 5, 'WBC', NULL, 'User05', 'user05@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(6, '92b3ff13-0fcb-49b0-8c22-2f149240891a', 6, 'WBC', NULL, 'User06', 'user06@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(7, '44ec8b3d-ff3d-413c-9105-1fd5709b3e19', 7, 'WBC', NULL, 'User07', 'user07@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(8, 'a8473fe0-9521-473f-990d-bb4c3574ee04', 8, 'WBC', NULL, 'User08', 'user08@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(9, '2017fb90-9981-4a99-8ec8-577428f28b55', 9, 'WBC', NULL, 'User09', 'user09@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(10, 'ce1a929b-2aac-46b4-ae7c-343cc1939ef3', 10, 'WBC', NULL, 'User10', 'user10@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(11, '5cc708e4-026e-44c9-8493-3aaa80b7a283', 11, 'WBC', NULL, 'User11', 'user11@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(12, '6578e1ef-4bc0-4eec-91a6-d194a1e4ca30', 12, 'WBC', NULL, 'User12', 'user12@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(13, 'dbbbabd1-e51c-4637-b1aa-7738781be2b0', 13, 'WBC', NULL, 'User13', 'user13@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(14, '4171b914-3907-4206-8a45-0524fc852a23', 14, 'WBC', NULL, 'User14', 'user14@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(15, '16d24bdf-3223-4bf3-93aa-5fa85a61a29d', 15, 'WBC', NULL, 'User15', 'user15@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(16, 'a050fb9b-03e3-45ff-ba9c-45f181b8ac0b', 16, 'WBC', NULL, 'User16', 'user16@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(17, '56c82c63-fe9f-47d3-ba04-b2b9faf7e157', 17, 'WBC', NULL, 'User17', 'user17@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(18, 'f6fe50f9-0ddb-4258-ada5-5a40e779dcb0', 18, 'WBC', NULL, 'User18', 'user18@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(19, '73962822-d471-4c66-befa-31305ff1bb92', 19, 'WBC', NULL, 'User19', 'user19@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(20, '2fae17a0-0e4b-4fae-895d-5721925ec409', 20, 'WBC', NULL, 'User20', 'user20@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(21, 'd4684fe9-0ef7-45c5-b693-34de3a0f3c83', 21, 'WBC', NULL, 'User21', 'user21@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(22, '30f8e6d1-c8d3-4456-86c0-a2e9c05a7b2f', 22, 'WBC', NULL, 'User22', 'user22@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(23, '1f48661a-cc23-4f57-b59a-e88757cc947b', 23, 'WBC', NULL, 'User23', 'user23@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(24, '9acdaff4-b3a1-40d2-881b-866902044195', 24, 'WBC', NULL, 'User24', 'user24@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(25, '46b3615e-63ef-4763-ac26-3ad931daed35', 25, 'WBC', NULL, 'User25', 'user25@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(26, 'e93fee88-f143-4747-ba08-e146be770234', 26, 'WBC', NULL, 'User26', 'user26@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(27, '20527c9c-2656-4833-a681-3de8c6da6c3e', 27, 'WBC', NULL, 'User27', 'user27@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(28, 'b2a0265b-429f-47d3-8b20-65810ee4daa5', 28, 'WBC', NULL, 'User28', 'user28@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(29, 'b55c4f64-9a8d-441a-8816-1168a1c84ad5', 29, 'WBC', NULL, 'User29', 'user29@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(30, '757d0afb-4241-4cc4-93ca-33ba930f04bf', 30, 'WBC', NULL, 'User30', 'user30@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(31, 'e8f12bc9-fb43-40e5-b100-6012b268fe51', 31, 'WBC', NULL, 'User31', 'user31@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(32, 'be0ae7ed-9733-4901-ba16-6d46ba7d6bd2', 32, 'WBC', NULL, 'User32', 'user32@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(33, '5e3a4d11-3d65-4563-99c7-a5292519844e', 33, 'WBC', NULL, 'User33', 'user33@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(34, 'c6ddea73-eed2-40c8-8dec-2dd871909e98', 34, 'WBC', NULL, 'User34', 'user34@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(35, '02b430fd-b804-4f54-868c-930cccc87a75', 35, 'WBC', NULL, 'User35', 'user35@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(36, '2d16fe0c-d7be-4b00-a88b-e6f7b3717075', 36, 'WBC', NULL, 'User36', 'user36@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(37, '41eb8659-9337-4e28-8cec-c1145519580f', 37, 'WBC', NULL, 'User37', 'user37@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(38, '03216923-ac4c-45f2-89c8-982ef1042401', 38, 'WBC', NULL, 'User38', 'user38@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(39, 'df271e54-8ec3-4303-8a32-ab9f93e3b4cc', 39, 'WBC', NULL, 'User39', 'user39@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(40, '179a4b07-ca68-4750-a819-6d9d5a73eeca', 40, 'WBC', NULL, 'User40', 'user40@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(41, '994b5d0a-b9db-49ec-96b2-bd9c2399407f', 41, 'WBC', NULL, 'User41', 'user41@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(42, 'b290b114-09e7-4ec8-bf6d-08c1f9568e49', 42, 'WBC', NULL, 'User42', 'user42@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(43, '77cd2286-f16e-4eb7-bc14-388812bb5c0a', 43, 'WBC', NULL, 'User43', 'user43@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(44, '5673b7fb-6aaa-44ed-8ddc-4d8a32a6d5a0', 44, 'WBC', NULL, 'User44', 'user44@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(45, '0344a390-1dd3-4576-8624-d0f547fc8a90', 45, 'WBC', NULL, 'User45', 'user45@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(46, '78f8267d-1999-467c-b5f3-9cf2c0cfd1aa', 46, 'WBC', NULL, 'User46', 'user46@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(47, 'a75952a3-da91-4520-9ac4-8f809ce8aca8', 47, 'WBC', NULL, 'User47', 'user47@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(48, '0d7615de-c745-4c32-95a3-a1d9b33da012', 48, 'WBC', NULL, 'User48', 'user48@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(49, 'e9ef6d17-761a-4dd3-9b10-9733063ca36d', 49, 'WBC', NULL, 'User49', 'user49@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(50, '6abd317d-a567-49e2-b5dc-3d4bee2c6377', 50, 'WBC', NULL, 'User50', 'user50@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(51, '5d10c6d6-3782-49dc-bb95-dd10c85ed52c', 51, 'WBC', NULL, 'User51', 'user51@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(52, 'ccb3b2b1-bbc9-4c4e-9292-977fd70e5962', 52, 'WBC', NULL, 'User52', 'user52@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(53, 'e6212faf-a459-4500-b732-514c4ce1c365', 53, 'WBC', NULL, 'User53', 'user53@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(54, '74ef46d2-2b61-46e6-b504-3336ae298059', 54, 'WBC', NULL, 'User54', 'user54@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(55, 'd58f0118-7183-466a-9f85-a8f625c50268', 55, 'WBC', NULL, 'User55', 'user55@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(56, 'c79aeb98-96dd-45db-8111-663da69dcde4', 56, 'WBC', NULL, 'User56', 'user56@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(57, '0f07c151-dab6-4c8b-8b67-145a3f9d66ab', 57, 'WBC', NULL, 'User57', 'user57@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(58, '38533f76-b47e-49b3-8f83-aff185da66cc', 58, 'WBC', NULL, 'User58', 'user58@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(59, '6c2a82b4-6018-4f58-bee2-d2ee40bb5c7d', 59, 'WBC', NULL, 'User59', 'user59@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(60, '468f6790-bf50-4a28-83a5-d3bf80b68286', 60, 'WBC', NULL, 'User60', 'user60@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(61, '68244b93-211a-42b7-9144-25f1581b4ebb', 61, 'WBC', NULL, 'User61', 'user61@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(62, 'b335c50c-5750-402b-8efc-28745d991a32', 62, 'WBC', NULL, 'User62', 'user62@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(63, 'bdb56f40-ad22-4db2-94b9-e89faed70a14', 63, 'WBC', NULL, 'User63', 'user63@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(64, 'c9cce880-2b1b-4164-babf-dbdcf583eab6', 64, 'WBC', NULL, 'User64', 'user64@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(65, '40cd0440-ad91-4bb0-a339-ce607e3c487f', 65, 'WBC', NULL, 'User65', 'user65@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(66, '3a2cc760-352a-442f-b922-e46c3a97d8dc', 66, 'WBC', NULL, 'User66', 'user66@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(67, '327070f2-3c89-4353-b104-53344805e85e', 67, 'WBC', NULL, 'User67', 'user67@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(68, '0f6e9119-47cd-4bdc-8356-cc656dcbfc22', 68, 'WBC', NULL, 'User68', 'user68@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(69, '1daf8b9a-8ece-4d1b-880a-666688e17645', 69, 'WBC', NULL, 'User69', 'user69@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(70, 'e2b2ca44-54e7-470e-beae-9bc9b5cf4656', 70, 'WBC', NULL, 'User70', 'user70@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(71, 'e859ab02-b5a2-4c7f-9181-35bada143cb9', 71, 'WBC', NULL, 'User71', 'user71@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(72, '4be06161-979a-48b9-9941-b2659e72a03a', 72, 'WBC', NULL, 'User72', 'user72@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(73, 'b370011f-a25d-41b9-9990-e0d552a0c4bb', 73, 'WBC', NULL, 'User73', 'user73@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(74, '9d0bcbd5-cec6-421e-b390-d929e0f92192', 74, 'WBC', NULL, 'User74', 'user74@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(75, 'c802956f-7e8b-42e1-b9f7-a30069089ce3', 75, 'WBC', NULL, 'User75', 'user75@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(76, 'ff54612d-b1c4-47c1-a82e-50aefcf9a0ea', 76, 'WBC', NULL, 'User76', 'user76@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(77, '1518f2c3-2246-480f-9f27-feaeedecc5fd', 77, 'WBC', NULL, 'User77', 'user77@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(78, '3a60d287-2c7e-4441-8419-1d8e8f73ce27', 78, 'WBC', NULL, 'User78', 'user78@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(79, 'ae283bb2-ff08-4e76-ad78-eb347a6454a9', 79, 'WBC', NULL, 'User79', 'user79@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(80, '1e50d310-3565-4189-bcd1-18ecb6f52352', 80, 'WBC', NULL, 'User80', 'user80@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(81, '3f1e28dc-5cd8-4714-9dd7-79c29dceaa7a', 81, 'WBC', NULL, 'User81', 'user81@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(82, '367b5b92-8fa2-4353-818f-5d7fd1732ae9', 82, 'WBC', NULL, 'User82', 'user82@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(83, 'b3b14785-24fb-45de-93de-5749c35d5a09', 83, 'WBC', NULL, 'User83', 'user83@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(84, '89365fee-a21f-43c0-8309-4661e2f6b1a3', 84, 'WBC', NULL, 'User84', 'user84@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(85, 'e832887a-6dc0-4651-bcf1-b87a2f8cb671', 85, 'WBC', NULL, 'User85', 'user85@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(86, '66bb9eaa-35e4-46c0-b8b7-28f0f0a53066', 86, 'WBC', NULL, 'User86', 'user86@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(87, 'b17c2c5f-5896-4c67-8d74-7b36802732b9', 87, 'WBC', NULL, 'User87', 'user87@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(88, '4d61aa6d-6dd4-47d7-a31d-80b55b463901', 88, 'WBC', NULL, 'User88', 'user88@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(89, '3243cce4-c9a1-4dcb-bcf6-5c05903b9597', 89, 'WBC', NULL, 'User89', 'user89@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(90, 'e6cf90b4-1575-4080-a55d-53058fcf97f1', 90, 'WBC', NULL, 'User90', 'user90@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(91, '5e4a4949-d9c8-4b22-a3c0-cd7cad207301', 91, 'WBC', NULL, 'User91', 'user91@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(92, '73397567-feeb-4246-b464-86e2d561ec88', 92, 'WBC', NULL, 'User92', 'user92@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(93, '5df2a10a-933c-4be3-8e96-486286451dd6', 93, 'WBC', NULL, 'User93', 'user93@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(94, '9395f136-36f9-4ddc-88dd-d02b29e7325b', 94, 'WBC', NULL, 'User94', 'user94@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(95, '44496c63-7407-4e61-93ea-b4054ebb3b2a', 95, 'WBC', NULL, 'User95', 'user95@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(96, '6d7309cd-a1d4-46f0-bc79-ead0f548fb91', 96, 'Vu', 'Minh', 'Phuong', 'vmp@gmail.com', NULL, '0909.111.111', NULL, NULL, NULL, b'0', '2024-08-19 02:27:00', 96, '2024-08-19 02:27:00', 96);

-- Dumping structure for table wbc.user_role
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  KEY `FK859n2jvi8ivhui0rl0esws6o` (`user_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.user_role: ~0 rows (approximately)
REPLACE INTO `user_role` (`id`, `guid`, `user_id`, `role_id`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, NULL, 1, 2, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(2, NULL, 1, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(3, NULL, 2, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(4, NULL, 3, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(5, NULL, 4, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(6, NULL, 5, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(7, NULL, 6, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(8, NULL, 7, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(9, NULL, 8, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(10, NULL, 9, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(11, NULL, 10, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(12, NULL, 11, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(13, NULL, 12, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(14, NULL, 13, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(15, NULL, 14, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(16, NULL, 15, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(17, NULL, 16, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(18, NULL, 17, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(19, NULL, 18, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(20, NULL, 19, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(21, NULL, 20, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(22, NULL, 21, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(23, NULL, 22, 1, NULL, b'0', '2024-08-19 02:25:41', 1, '2024-08-19 02:25:41', 1),
	(24, NULL, 23, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(25, NULL, 24, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(26, NULL, 25, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(27, NULL, 26, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(28, NULL, 27, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(29, NULL, 28, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(30, NULL, 29, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(31, NULL, 30, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(32, NULL, 31, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(33, NULL, 32, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(34, NULL, 33, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(35, NULL, 34, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(36, NULL, 35, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(37, NULL, 36, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(38, NULL, 37, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(39, NULL, 38, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(40, NULL, 39, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(41, NULL, 40, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(42, NULL, 41, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(43, NULL, 42, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(44, NULL, 43, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(45, NULL, 44, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(46, NULL, 45, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(47, NULL, 46, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(48, NULL, 47, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(49, NULL, 48, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(50, NULL, 49, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(51, NULL, 50, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(52, NULL, 51, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(53, NULL, 52, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(54, NULL, 53, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(55, NULL, 54, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(56, NULL, 55, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(57, NULL, 56, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(58, NULL, 57, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(59, NULL, 58, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(60, NULL, 59, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(61, NULL, 60, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(62, NULL, 61, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(63, NULL, 62, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(64, NULL, 63, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(65, NULL, 64, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(66, NULL, 65, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(67, NULL, 66, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(68, NULL, 67, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(69, NULL, 68, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(70, NULL, 69, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(71, NULL, 70, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(72, NULL, 71, 1, NULL, b'0', '2024-08-19 02:25:42', 1, '2024-08-19 02:25:42', 1),
	(73, NULL, 72, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(74, NULL, 73, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(75, NULL, 74, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(76, NULL, 75, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(77, NULL, 76, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(78, NULL, 77, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(79, NULL, 78, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(80, NULL, 79, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(81, NULL, 80, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(82, NULL, 81, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(83, NULL, 82, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(84, NULL, 83, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(85, NULL, 84, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(86, NULL, 85, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(87, NULL, 86, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(88, NULL, 87, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(89, NULL, 88, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(90, NULL, 89, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(91, NULL, 90, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(92, NULL, 91, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(93, NULL, 92, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(94, NULL, 93, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(95, NULL, 94, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(96, NULL, 95, 1, NULL, b'0', '2024-08-19 02:25:43', 1, '2024-08-19 02:25:43', 1),
	(97, NULL, 96, 1, NULL, b'0', '2024-08-19 02:27:00', 1, '2024-08-19 02:27:00', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
