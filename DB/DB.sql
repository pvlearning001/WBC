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
  `remark` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.category: ~0 rows (approximately)
REPLACE INTO `category` (`id`, `guid`, `name`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, '46f0beb8-fa70-454c-bbe9-7efc968932e7', 'Announcement', NULL, b'0', '2024-08-17 02:25:31', 1, '2024-08-17 02:25:31', 1);

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
  `remark` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.file_upload: ~4 rows (approximately)
REPLACE INTO `file_upload` (`id`, `guid`, `name`, `path`, `ext_name`, `unique_name`, `content_type`, `hash_content`, `descriptions`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, '054979c3-6425-4b36-8ba5-c86b398c5102', 'CV-PhuongVu_20191014_2255.pdf', 'uploads\\documents\\messages', 'pdf', '054979c3-6425-4b36-8ba5-c86b398c5102.pdf', 'application/pdf', NULL, NULL, NULL, b'0', '2024-08-17 06:31:20', 1, '2024-08-17 06:31:20', 1),
	(2, '85169729-1e5c-4c19-b776-a66c8380b67d', 'STC - CNAT cho cong nhan mang luoi (2022).pdf', 'uploads\\documents\\messages', 'pdf', '85169729-1e5c-4c19-b776-a66c8380b67d.pdf', 'application/pdf', NULL, NULL, NULL, b'0', '2024-08-17 07:05:24', 1, '2024-08-17 07:05:24', 1),
	(3, '0e5175e0-c79a-4d2e-8671-e0e52c8f547a', 'STC - KT Thi Công Đường Ống(2022).pdf', 'uploads\\documents\\messages', 'pdf', '0e5175e0-c79a-4d2e-8671-e0e52c8f547a.pdf', 'application/pdf', NULL, NULL, NULL, b'0', '2024-08-17 07:05:24', 1, '2024-08-17 07:05:24', 1),
	(4, '6e5916f3-f4d7-4e91-a015-3208e013e352', 'STC - ATLD Khoi Cap nuoc 2022.pdf', 'uploads\\documents\\messages', 'pdf', '6e5916f3-f4d7-4e91-a015-3208e013e352.pdf', 'application/pdf', NULL, NULL, NULL, b'0', '2024-08-17 07:07:34', 1, '2024-08-17 07:07:34', 1),
	(5, 'e4e174d2-947f-4e13-924f-1c37609838d9', 'STC - QLML - 2022.pdf', 'uploads\\documents\\messages', 'pdf', 'e4e174d2-947f-4e13-924f-1c37609838d9.pdf', 'application/pdf', NULL, NULL, NULL, b'0', '2024-08-17 07:08:10', 1, '2024-08-17 07:08:10', 1);

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
  `remark` varchar(255) DEFAULT NULL,
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
  `remark` varchar(255) DEFAULT NULL,
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
  `remark` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.news: ~4 rows (approximately)
REPLACE INTO `news` (`id`, `guid`, `cate_id`, `subject`, `content`, `content_ex_01`, `content_ex_02`, `content_ex_03`, `content_ex_04`, `content_ex_05`, `content_ex_06`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, '20f31906-a661-4342-98fa-811f076cf78a', 1, 'sxsx', 'sxs', 'sxsx', NULL, NULL, NULL, NULL, NULL, NULL, b'0', '2024-08-17 06:31:20', 1, '2024-08-17 06:31:20', 1),
	(2, 'c0995b4c-203f-4164-893e-8eb59309e253', 1, 'xcxc', 'cxxc', 'cxxc', NULL, NULL, NULL, NULL, NULL, NULL, b'0', '2024-08-17 07:05:24', 1, '2024-08-17 07:05:24', 1),
	(3, '5946996d-3916-4562-876b-cba370790f9c', 1, 'xz', 'zxzx', 'xzzx', NULL, NULL, NULL, NULL, NULL, NULL, b'0', '2024-08-17 07:07:34', 1, '2024-08-17 07:07:34', 1),
	(4, 'e0ec34ac-7c10-4e5e-aeff-3a33eec6cc01', 1, 'zZ', 'ZZ', 'Zz', NULL, NULL, NULL, NULL, NULL, NULL, b'0', '2024-08-17 07:08:10', 1, '2024-08-17 07:08:10', 1);

-- Dumping structure for table wbc.news_file_upload
CREATE TABLE IF NOT EXISTS `news_file_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT NULL,
  `news_id` int(11) DEFAULT NULL,
  `file_upload_id` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.news_file_upload: ~4 rows (approximately)
REPLACE INTO `news_file_upload` (`id`, `guid`, `news_id`, `file_upload_id`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, '832ad5a7-38c3-4729-b9cc-66af0d48d2b7', 1, 1, NULL, b'0', '2024-08-17 06:31:20', 1, '2024-08-17 06:31:20', 1),
	(2, '5a2b33da-af09-4d29-8cab-863c5b093905', 2, 2, NULL, b'0', '2024-08-17 07:05:24', 1, '2024-08-17 07:05:24', 1),
	(3, '8fe45ec8-6491-4615-86ec-aceda585cf1f', 2, 3, NULL, b'0', '2024-08-17 07:05:24', 1, '2024-08-17 07:05:24', 1),
	(4, 'c331e903-03f0-4d68-a9e8-163666f93f82', 3, 4, NULL, b'0', '2024-08-17 07:07:34', 1, '2024-08-17 07:07:34', 1),
	(5, '34f056a9-2f37-4dc0-8143-3754726968f5', 4, 5, NULL, b'0', '2024-08-17 07:08:10', 1, '2024-08-17 07:08:10', 1);

-- Dumping structure for table wbc.permission
CREATE TABLE IF NOT EXISTS `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `name` varchar(255) DEFAULT NULL,
  `descriptions` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
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
  `remark` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `ins_at` datetime(6) DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime(6) DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.role: ~2 rows (approximately)
REPLACE INTO `role` (`id`, `guid`, `name`, `name_lower_cases`, `descriptions`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, '8355b7e1-ba93-4193-bb88-810f99e96fc6', 'User', 'user', 'User Role', 'Init User Role', b'0', '2024-08-17 02:25:31.000000', 1, '2024-08-17 02:25:31.000000', 1),
	(2, '68ee9dca-7f63-4608-a534-a4ef29c01c20', 'Admin', 'admin', 'Admin Role', 'Init Admin Role', b'0', '2024-08-17 02:25:31.000000', 1, '2024-08-17 02:25:31.000000', 1);

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
	INOUT `pageTotal` INT
)
BEGIN	
	SELECT * FROM user WHERE id > userIdIndex;
	SELECT * FROM user_ext WHERE user_id > userIdIndex;
	SELECT COUNT(id) INTO pageTotal FROM user WHERE id > userIdIndex;
END//
DELIMITER ;

-- Dumping structure for table wbc.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `ins_at` datetime(6) DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime(6) DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.user: ~95 rows (approximately)
REPLACE INTO `user` (`id`, `guid`, `user_name`, `password`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, '26ad212c-105e-419e-b2b0-3ee6c2e1e3f2', 'admin', '$2a$10$nzwIkbFwCXysPIzzsUpFX.QOR5gToV9xoLYCu5V0Ipp8pF3xdUFQW', 'Init User', b'0', '2024-08-17 02:25:32.000000', 1, '2024-08-17 02:25:32.000000', 1),
	(2, 'fa84ffba-5c3f-11ef-a93d-509a4cb5cc32', 'user02', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:32.000000', 1, '2024-08-17 02:25:32.000000', 1),
	(3, 'fac1ac16-5c3f-11ef-a93d-509a4cb5cc32', 'user03', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:33.000000', 1, '2024-08-17 02:25:33.000000', 1),
	(4, 'fac62853-5c3f-11ef-a93d-509a4cb5cc32', 'user04', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:33.000000', 1, '2024-08-17 02:25:33.000000', 1),
	(5, 'fac963ce-5c3f-11ef-a93d-509a4cb5cc32', 'user05', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:33.000000', 1, '2024-08-17 02:25:33.000000', 1),
	(6, 'faeafa83-5c3f-11ef-a93d-509a4cb5cc32', 'user06', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:33.000000', 1, '2024-08-17 02:25:33.000000', 1),
	(7, 'faf3519b-5c3f-11ef-a93d-509a4cb5cc32', 'user07', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:33.000000', 1, '2024-08-17 02:25:33.000000', 1),
	(8, 'faf6b381-5c3f-11ef-a93d-509a4cb5cc32', 'user08', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:33.000000', 1, '2024-08-17 02:25:33.000000', 1),
	(9, 'faf9c40f-5c3f-11ef-a93d-509a4cb5cc32', 'user09', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:33.000000', 1, '2024-08-17 02:25:33.000000', 1),
	(10, 'fafd1778-5c3f-11ef-a93d-509a4cb5cc32', 'user10', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:33.000000', 1, '2024-08-17 02:25:33.000000', 1),
	(11, 'fb005159-5c3f-11ef-a93d-509a4cb5cc32', 'user11', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:33.000000', 1, '2024-08-17 02:25:33.000000', 1),
	(12, 'fb131974-5c3f-11ef-a93d-509a4cb5cc32', 'user12', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:33.000000', 1, '2024-08-17 02:25:33.000000', 1),
	(13, 'fb286c1b-5c3f-11ef-a93d-509a4cb5cc32', 'user13', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:33.000000', 1, '2024-08-17 02:25:33.000000', 1),
	(14, 'fb377b67-5c3f-11ef-a93d-509a4cb5cc32', 'user14', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:33.000000', 1, '2024-08-17 02:25:33.000000', 1),
	(15, 'fb3a888f-5c3f-11ef-a93d-509a4cb5cc32', 'user15', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:33.000000', 1, '2024-08-17 02:25:33.000000', 1),
	(16, 'fb3d8661-5c3f-11ef-a93d-509a4cb5cc32', 'user16', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:33.000000', 1, '2024-08-17 02:25:33.000000', 1),
	(17, 'fb408cb4-5c3f-11ef-a93d-509a4cb5cc32', 'user17', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:33.000000', 1, '2024-08-17 02:25:33.000000', 1),
	(18, 'fb45c912-5c3f-11ef-a93d-509a4cb5cc32', 'user18', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(19, 'fb847199-5c3f-11ef-a93d-509a4cb5cc32', 'user19', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(20, 'fb88faf5-5c3f-11ef-a93d-509a4cb5cc32', 'user20', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(21, 'fb8c41b1-5c3f-11ef-a93d-509a4cb5cc32', 'user21', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(22, 'fb906e65-5c3f-11ef-a93d-509a4cb5cc32', 'user22', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(23, 'fb93a62c-5c3f-11ef-a93d-509a4cb5cc32', 'user23', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(24, 'fb9690b2-5c3f-11ef-a93d-509a4cb5cc32', 'user24', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(25, 'fb99bea0-5c3f-11ef-a93d-509a4cb5cc32', 'user25', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(26, 'fb9cf697-5c3f-11ef-a93d-509a4cb5cc32', 'user26', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(27, 'fb9fc484-5c3f-11ef-a93d-509a4cb5cc32', 'user27', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(28, 'fba288e4-5c3f-11ef-a93d-509a4cb5cc32', 'user28', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(29, 'fba55ebe-5c3f-11ef-a93d-509a4cb5cc32', 'user29', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(30, 'fba81891-5c3f-11ef-a93d-509a4cb5cc32', 'user30', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(31, 'fbaab95d-5c3f-11ef-a93d-509a4cb5cc32', 'user31', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(32, 'fbad8b11-5c3f-11ef-a93d-509a4cb5cc32', 'user32', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(33, 'fbb03ab9-5c3f-11ef-a93d-509a4cb5cc32', 'user33', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(34, 'fbb32848-5c3f-11ef-a93d-509a4cb5cc32', 'user34', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(35, 'fbb6a0d3-5c3f-11ef-a93d-509a4cb5cc32', 'user35', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(36, 'fbbad717-5c3f-11ef-a93d-509a4cb5cc32', 'user36', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(37, 'fbbe7356-5c3f-11ef-a93d-509a4cb5cc32', 'user37', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(38, 'fbc2ef9d-5c3f-11ef-a93d-509a4cb5cc32', 'user38', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(39, 'fbc60863-5c3f-11ef-a93d-509a4cb5cc32', 'user39', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(40, 'fbc8f565-5c3f-11ef-a93d-509a4cb5cc32', 'user40', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(41, 'fbcbe9e1-5c3f-11ef-a93d-509a4cb5cc32', 'user41', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(42, 'fbceceff-5c3f-11ef-a93d-509a4cb5cc32', 'user42', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(43, 'fbd17eb7-5c3f-11ef-a93d-509a4cb5cc32', 'user43', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(44, 'fbd4c445-5c3f-11ef-a93d-509a4cb5cc32', 'user44', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(45, 'fbd7355b-5c3f-11ef-a93d-509a4cb5cc32', 'user45', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(46, 'fbd9eed4-5c3f-11ef-a93d-509a4cb5cc32', 'user46', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:34.000000', 1, '2024-08-17 02:25:34.000000', 1),
	(47, 'fbdd4846-5c3f-11ef-a93d-509a4cb5cc32', 'user47', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(48, 'fbdfcff9-5c3f-11ef-a93d-509a4cb5cc32', 'user48', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(49, 'fbe1dea7-5c3f-11ef-a93d-509a4cb5cc32', 'user49', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(50, 'fbe98f09-5c3f-11ef-a93d-509a4cb5cc32', 'user50', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(51, 'fbec9c5f-5c3f-11ef-a93d-509a4cb5cc32', 'user51', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(52, 'fbf0ac95-5c3f-11ef-a93d-509a4cb5cc32', 'user52', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(53, 'fbf5da21-5c3f-11ef-a93d-509a4cb5cc32', 'user53', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(54, 'fbfa9ebf-5c3f-11ef-a93d-509a4cb5cc32', 'user54', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(55, 'fbfd6fe4-5c3f-11ef-a93d-509a4cb5cc32', 'user55', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(56, 'fc020ecb-5c3f-11ef-a93d-509a4cb5cc32', 'user56', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(57, 'fc04ceb7-5c3f-11ef-a93d-509a4cb5cc32', 'user57', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(58, 'fc085ab6-5c3f-11ef-a93d-509a4cb5cc32', 'user58', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(59, 'fc0bbefd-5c3f-11ef-a93d-509a4cb5cc32', 'user59', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(60, 'fc0eeeba-5c3f-11ef-a93d-509a4cb5cc32', 'user60', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(61, 'fc121587-5c3f-11ef-a93d-509a4cb5cc32', 'user61', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(62, 'fc156d3b-5c3f-11ef-a93d-509a4cb5cc32', 'user62', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(63, 'fc1949c3-5c3f-11ef-a93d-509a4cb5cc32', 'user63', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(64, 'fc1c9b03-5c3f-11ef-a93d-509a4cb5cc32', 'user64', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(65, 'fc1f21e7-5c3f-11ef-a93d-509a4cb5cc32', 'user65', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(66, 'fc44b6d3-5c3f-11ef-a93d-509a4cb5cc32', 'user66', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(67, 'fc471e8a-5c3f-11ef-a93d-509a4cb5cc32', 'user67', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(68, 'fc49b807-5c3f-11ef-a93d-509a4cb5cc32', 'user68', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(69, 'fc4c2dee-5c3f-11ef-a93d-509a4cb5cc32', 'user69', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(70, 'fc4e78fa-5c3f-11ef-a93d-509a4cb5cc32', 'user70', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(71, 'fc50c1bb-5c3f-11ef-a93d-509a4cb5cc32', 'user71', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(72, 'fc534769-5c3f-11ef-a93d-509a4cb5cc32', 'user72', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(73, 'fc55c5f0-5c3f-11ef-a93d-509a4cb5cc32', 'user73', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(74, 'fc58cf47-5c3f-11ef-a93d-509a4cb5cc32', 'user74', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(75, 'fc5b64c1-5c3f-11ef-a93d-509a4cb5cc32', 'user75', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(76, 'fc5e07c3-5c3f-11ef-a93d-509a4cb5cc32', 'user76', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(77, 'fc608715-5c3f-11ef-a93d-509a4cb5cc32', 'user77', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(78, 'fc6304eb-5c3f-11ef-a93d-509a4cb5cc32', 'user78', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(79, 'fc655b9a-5c3f-11ef-a93d-509a4cb5cc32', 'user79', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(80, 'fc67d4df-5c3f-11ef-a93d-509a4cb5cc32', 'user80', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(81, 'fc6a65f7-5c3f-11ef-a93d-509a4cb5cc32', 'user81', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(82, 'fc6ccb3d-5c3f-11ef-a93d-509a4cb5cc32', 'user82', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(83, 'fc704a10-5c3f-11ef-a93d-509a4cb5cc32', 'user83', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(84, 'fc7334ca-5c3f-11ef-a93d-509a4cb5cc32', 'user84', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:35.000000', 1, '2024-08-17 02:25:35.000000', 1),
	(85, 'fc763415-5c3f-11ef-a93d-509a4cb5cc32', 'user85', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:36.000000', 1, '2024-08-17 02:25:36.000000', 1),
	(86, 'fc7ad217-5c3f-11ef-a93d-509a4cb5cc32', 'user86', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:36.000000', 1, '2024-08-17 02:25:36.000000', 1),
	(87, 'fca5bcd7-5c3f-11ef-a93d-509a4cb5cc32', 'user87', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:36.000000', 1, '2024-08-17 02:25:36.000000', 1),
	(88, 'fcc28081-5c3f-11ef-a93d-509a4cb5cc32', 'user88', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:36.000000', 1, '2024-08-17 02:25:36.000000', 1),
	(89, 'fd0fcdb3-5c3f-11ef-a93d-509a4cb5cc32', 'user89', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:37.000000', 1, '2024-08-17 02:25:37.000000', 1),
	(90, 'fd23b871-5c3f-11ef-a93d-509a4cb5cc32', 'user90', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:37.000000', 1, '2024-08-17 02:25:37.000000', 1),
	(91, 'fd27ba69-5c3f-11ef-a93d-509a4cb5cc32', 'user91', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:37.000000', 1, '2024-08-17 02:25:37.000000', 1),
	(92, 'fd2cce5f-5c3f-11ef-a93d-509a4cb5cc32', 'user92', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:37.000000', 1, '2024-08-17 02:25:37.000000', 1),
	(93, 'fd2f3afd-5c3f-11ef-a93d-509a4cb5cc32', 'user93', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:37.000000', 1, '2024-08-17 02:25:37.000000', 1),
	(94, 'fd3577cf-5c3f-11ef-a93d-509a4cb5cc32', 'user94', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:37.000000', 1, '2024-08-17 02:25:37.000000', 1),
	(95, 'fd3884b4-5c3f-11ef-a93d-509a4cb5cc32', 'user95', '$2a$10$nVz36o9NTHcebWiFbooVZOmP1nPL7VMncWplAGk4AC2UeqPUAkndG', NULL, b'0', '2024-08-17 02:25:37.000000', 1, '2024-08-17 02:25:37.000000', 1);

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
  `remark` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.user_ext: ~95 rows (approximately)
REPLACE INTO `user_ext` (`id`, `guid`, `user_id`, `f_name`, `m_name`, `l_name`, `email`, `addr`, `phone01`, `phone02`, `phone03`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, 'b8f4c42c-3e14-4ae3-b58f-73dc2b36aa87', 1, 'WBC', NULL, 'Admin', 'admin@wbc.com', NULL, '0903.123456', NULL, NULL, NULL, b'0', '2024-08-17 02:25:32', 1, '2024-08-17 02:25:32', 1),
	(2, '62e741ea-f0ac-4bf7-9584-5e0462605cc1', 2, 'WBC', NULL, 'User02', 'user02@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(3, '8ec3eec5-bd2e-41dc-ac9b-66cc0f365a5f', 3, 'WBC', NULL, 'User03', 'user03@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(4, '508ea986-21cc-4735-9da4-1e6645e993c4', 4, 'WBC', NULL, 'User04', 'user04@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(5, '5cc88ad6-1a0e-4d87-8103-aeddd27c435f', 5, 'WBC', NULL, 'User05', 'user05@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(6, 'c78e1399-edbb-4b44-b99c-94fd83062c6c', 6, 'WBC', NULL, 'User06', 'user06@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(7, '1a554f9d-80b6-46e5-8014-1efcba3dd50c', 7, 'WBC', NULL, 'User07', 'user07@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(8, 'bfd14efb-cd9e-46c1-b138-f53889fb8b8b', 8, 'WBC', NULL, 'User08', 'user08@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(9, '8703be9c-1564-4d32-9d05-682414f514ae', 9, 'WBC', NULL, 'User09', 'user09@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(10, '844bcbaf-0f4b-4c71-a091-4e80a633b396', 10, 'WBC', NULL, 'User10', 'user10@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(11, '682d86ba-65bb-4afd-99b2-25c13077239f', 11, 'WBC', NULL, 'User11', 'user11@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(12, 'aadb7736-db90-438c-9ea0-229cbc01d3a2', 12, 'WBC', NULL, 'User12', 'user12@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(13, '453882a7-ab0b-4205-890e-90341c70baea', 13, 'WBC', NULL, 'User13', 'user13@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(14, '1303a8b3-1a2e-4e6b-b664-c1d16fb510dd', 14, 'WBC', NULL, 'User14', 'user14@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(15, '9750867e-230f-473d-aa94-466167adadf5', 15, 'WBC', NULL, 'User15', 'user15@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(16, 'b0fc37fc-49eb-420f-89ba-141f2c33e3cc', 16, 'WBC', NULL, 'User16', 'user16@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(17, '3de14dbc-9650-4e2a-a990-7069bf7aae5d', 17, 'WBC', NULL, 'User17', 'user17@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(18, '1061d73c-4f58-4546-95f6-8cff7e0759b2', 18, 'WBC', NULL, 'User18', 'user18@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(19, '3f77aab1-a5e9-4c81-8875-31774a09dc5e', 19, 'WBC', NULL, 'User19', 'user19@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(20, '08926fcc-7454-4824-adb3-c2fbe128b277', 20, 'WBC', NULL, 'User20', 'user20@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(21, 'f8ebc3d3-8d5b-4784-8cd2-e7201c31293d', 21, 'WBC', NULL, 'User21', 'user21@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(22, '3d2721e8-f3a0-420d-98ad-0214d59b429b', 22, 'WBC', NULL, 'User22', 'user22@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(23, 'e62f8b6e-eeb9-4c72-8244-f9fb62356ab7', 23, 'WBC', NULL, 'User23', 'user23@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(24, '7ea34b9c-567b-4084-acfc-1d3cba92e237', 24, 'WBC', NULL, 'User24', 'user24@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(25, 'eef3f149-2550-45dc-aae9-403a16174ffa', 25, 'WBC', NULL, 'User25', 'user25@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(26, 'dec62a35-f2a5-42b3-9a63-0d967de58b67', 26, 'WBC', NULL, 'User26', 'user26@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(27, '7eba97ba-1e3e-4f29-b80c-47fde9a31592', 27, 'WBC', NULL, 'User27', 'user27@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(28, 'ace70d8c-2634-4060-85f8-3be17d662cd7', 28, 'WBC', NULL, 'User28', 'user28@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(29, '877d0755-a6da-4e59-9f03-91ef34b48591', 29, 'WBC', NULL, 'User29', 'user29@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(30, '909dd9a9-2c71-4699-8924-1367f0073a35', 30, 'WBC', NULL, 'User30', 'user30@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(31, '46dc8790-0da5-4482-887b-82394ca971bf', 31, 'WBC', NULL, 'User31', 'user31@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(32, 'ddcbddc0-1a40-421c-9da9-4f63e176e7a6', 32, 'WBC', NULL, 'User32', 'user32@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(33, 'cfcaf1cb-75c0-4c44-ace2-e8b380794c0e', 33, 'WBC', NULL, 'User33', 'user33@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(34, '6b3bf5c1-fd64-41ea-8585-52b1bcc8d580', 34, 'WBC', NULL, 'User34', 'user34@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(35, '390446ef-2161-4b3e-b67c-e6fc3039438b', 35, 'WBC', NULL, 'User35', 'user35@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(36, '71f90a0b-a49d-48d0-b1cb-61f7c1c4a581', 36, 'WBC', NULL, 'User36', 'user36@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(37, 'a674a7db-c570-492e-8025-caef7104d146', 37, 'WBC', NULL, 'User37', 'user37@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(38, 'c554f475-5f6a-441e-a885-3a32ad0377ce', 38, 'WBC', NULL, 'User38', 'user38@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(39, 'c203310a-4c37-47d3-a3e0-25e5b522b8d6', 39, 'WBC', NULL, 'User39', 'user39@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(40, '653915dd-6a5a-4ed6-9585-f8140ad71560', 40, 'WBC', NULL, 'User40', 'user40@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(41, 'a95de422-a043-4d57-9e61-db534bdbba2e', 41, 'WBC', NULL, 'User41', 'user41@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(42, 'f277ed2a-dbb6-469f-90eb-12611c9a4b2c', 42, 'WBC', NULL, 'User42', 'user42@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(43, '40466e36-33d0-41d5-9c6f-f0605e7b5ad3', 43, 'WBC', NULL, 'User43', 'user43@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(44, '7e04fc82-0581-40b3-b557-0870d511fd38', 44, 'WBC', NULL, 'User44', 'user44@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(45, '99f8a88d-a12e-494f-93a8-98287797eafc', 45, 'WBC', NULL, 'User45', 'user45@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(46, 'fc6ba657-4b98-4d2f-91e8-452ef13a7c16', 46, 'WBC', NULL, 'User46', 'user46@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(47, '3c8bfba8-aa4e-4966-9341-4e7e8850c5f0', 47, 'WBC', NULL, 'User47', 'user47@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(48, '4cf518a2-c8c6-402a-8278-907f1c5aba98', 48, 'WBC', NULL, 'User48', 'user48@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(49, '7ea761da-cd97-456f-9a51-8e57d328faf6', 49, 'WBC', NULL, 'User49', 'user49@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(50, '8651b87e-e975-4b18-9cf0-8d8693f04324', 50, 'WBC', NULL, 'User50', 'user50@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(51, '197fa1ac-b087-4811-b64b-0d6ecd8151b6', 51, 'WBC', NULL, 'User51', 'user51@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(52, '93ca87e5-0dc4-4741-af1a-45a90c96c09f', 52, 'WBC', NULL, 'User52', 'user52@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(53, '54dde12f-b48a-488d-8637-e3558e321b26', 53, 'WBC', NULL, 'User53', 'user53@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(54, '5a6bb3cf-3e5d-4c8b-be48-503abee31d05', 54, 'WBC', NULL, 'User54', 'user54@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(55, 'f80575ba-6e35-4fee-8a54-080b711c36ef', 55, 'WBC', NULL, 'User55', 'user55@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(56, '32b85e08-79f1-451f-8a80-96e3e78f67f1', 56, 'WBC', NULL, 'User56', 'user56@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(57, '56789044-fd58-4ebc-8127-09011dbf2ffd', 57, 'WBC', NULL, 'User57', 'user57@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(58, 'ced7ad93-aade-4ef6-9317-e443a4fb35ef', 58, 'WBC', NULL, 'User58', 'user58@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(59, '8a52f9d6-08a3-4139-b4b9-1322c8a8dc52', 59, 'WBC', NULL, 'User59', 'user59@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(60, '122b4b3a-7e0d-4219-9510-9e95d5d51e0c', 60, 'WBC', NULL, 'User60', 'user60@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(61, '83da0573-7375-40a0-b0b5-3bb586e495e6', 61, 'WBC', NULL, 'User61', 'user61@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(62, '84485d21-30dc-448f-a2d9-4ba2f77f7489', 62, 'WBC', NULL, 'User62', 'user62@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(63, '1f5fa8ea-6903-4265-8141-21c0a22f9622', 63, 'WBC', NULL, 'User63', 'user63@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(64, 'b3d085f0-d5dc-4a1e-a0fb-3caa7f71e44d', 64, 'WBC', NULL, 'User64', 'user64@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(65, 'e168680b-a5e3-4530-9592-0bf06b8c0712', 65, 'WBC', NULL, 'User65', 'user65@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(66, 'edc73b57-b5af-4512-97ed-01fc570e6b5c', 66, 'WBC', NULL, 'User66', 'user66@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(67, '018ac8d0-64ae-4d6d-bcad-491fe1f0ef2d', 67, 'WBC', NULL, 'User67', 'user67@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(68, 'd24d5ac0-c999-441e-8cdb-97b11bfad7e5', 68, 'WBC', NULL, 'User68', 'user68@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(69, '8b0b90ad-855c-48c3-b0a8-f4c03e43b596', 69, 'WBC', NULL, 'User69', 'user69@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(70, '4c758bca-3fb3-4a7e-94a3-35663048415c', 70, 'WBC', NULL, 'User70', 'user70@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(71, '9502d490-24a4-4f5a-a12a-450a32c91b8a', 71, 'WBC', NULL, 'User71', 'user71@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(72, 'afb0262d-a96f-41ad-acde-7a4ddcff9fc2', 72, 'WBC', NULL, 'User72', 'user72@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(73, '3fdaf672-afc7-4950-8a66-18126b47422f', 73, 'WBC', NULL, 'User73', 'user73@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(74, '0f893d73-d396-491f-8435-f91c9133df73', 74, 'WBC', NULL, 'User74', 'user74@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(75, 'cd32af83-6763-4cff-bb80-b6e074c66ed8', 75, 'WBC', NULL, 'User75', 'user75@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(76, '1cf9374c-39a4-4e51-86b6-27ad6569a0b5', 76, 'WBC', NULL, 'User76', 'user76@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(77, '09189e47-d5da-41f8-b2f2-3ee14060aca3', 77, 'WBC', NULL, 'User77', 'user77@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(78, '8df82eb4-ffe3-473e-affc-c43368b5d752', 78, 'WBC', NULL, 'User78', 'user78@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(79, '90640812-f9d1-4210-98d8-fa2c46b4d7cc', 79, 'WBC', NULL, 'User79', 'user79@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(80, '80bc793e-751f-4048-a5b6-748f61a0c3bf', 80, 'WBC', NULL, 'User80', 'user80@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(81, '0e4ea447-87cf-49ab-beb8-53ce199026e3', 81, 'WBC', NULL, 'User81', 'user81@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(82, '0b751003-231d-4e82-95a7-42eda2ba60a3', 82, 'WBC', NULL, 'User82', 'user82@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(83, 'ad482bd0-47bd-4e02-bcd6-b62d62d8b2b2', 83, 'WBC', NULL, 'User83', 'user83@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(84, '839f0476-b86c-47ca-ae75-fe991e63d4ab', 84, 'WBC', NULL, 'User84', 'user84@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(85, '0f1dd397-e679-4a84-8b1f-6b0c4ae679d3', 85, 'WBC', NULL, 'User85', 'user85@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:36', 1, '2024-08-17 02:25:36', 1),
	(86, '27340bfd-f8e6-4624-bdd0-bdc352ee2272', 86, 'WBC', NULL, 'User86', 'user86@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:36', 1, '2024-08-17 02:25:36', 1),
	(87, '4ef3d402-7f59-4659-aa67-a43652c9c05a', 87, 'WBC', NULL, 'User87', 'user87@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:36', 1, '2024-08-17 02:25:36', 1),
	(88, '250332a0-80c9-4863-8f7b-c02952f1b45e', 88, 'WBC', NULL, 'User88', 'user88@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:36', 1, '2024-08-17 02:25:36', 1),
	(89, '54bc40e6-321a-497f-8fb9-d1dbb75aa9b6', 89, 'WBC', NULL, 'User89', 'user89@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:37', 1, '2024-08-17 02:25:37', 1),
	(90, '0da0a886-f101-4a4b-9873-112fe35d89fb', 90, 'WBC', NULL, 'User90', 'user90@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:37', 1, '2024-08-17 02:25:37', 1),
	(91, '5e8fcbbc-590a-49f2-a767-3ea78e201ceb', 91, 'WBC', NULL, 'User91', 'user91@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:37', 1, '2024-08-17 02:25:37', 1),
	(92, '3b5fd4ed-d126-46d3-a22b-6324fa716b90', 92, 'WBC', NULL, 'User92', 'user92@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:37', 1, '2024-08-17 02:25:37', 1),
	(93, '71698f3e-3b61-4be6-82b7-21ff0c108445', 93, 'WBC', NULL, 'User93', 'user93@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:37', 1, '2024-08-17 02:25:37', 1),
	(94, 'd51772f3-dfe9-4a7f-acf2-1456d4da6043', 94, 'WBC', NULL, 'User94', 'user94@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:37', 1, '2024-08-17 02:25:37', 1),
	(95, '5cc54afd-499a-4e8b-92ab-d7347573a111', 95, 'WBC', NULL, 'User95', 'user95@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-08-17 02:25:37', 1, '2024-08-17 02:25:37', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.user_role: ~96 rows (approximately)
REPLACE INTO `user_role` (`id`, `guid`, `user_id`, `role_id`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, NULL, 1, 1, NULL, b'0', '2024-08-17 02:25:32', 1, '2024-08-17 02:25:32', 1),
	(2, NULL, 1, 2, NULL, b'0', '2024-08-17 02:25:32', 1, '2024-08-17 02:25:32', 1),
	(3, NULL, 2, 1, NULL, b'0', '2024-08-17 02:25:32', 1, '2024-08-17 02:25:32', 1),
	(4, NULL, 3, 1, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(5, NULL, 4, 1, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(6, NULL, 5, 1, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(7, NULL, 6, 1, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(8, NULL, 7, 1, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(9, NULL, 8, 1, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(10, NULL, 9, 1, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(11, NULL, 10, 1, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(12, NULL, 11, 1, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(13, NULL, 12, 1, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(14, NULL, 13, 1, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(15, NULL, 14, 1, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(16, NULL, 15, 1, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(17, NULL, 16, 1, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(18, NULL, 17, 1, NULL, b'0', '2024-08-17 02:25:33', 1, '2024-08-17 02:25:33', 1),
	(19, NULL, 18, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(20, NULL, 19, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(21, NULL, 20, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(22, NULL, 21, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(23, NULL, 22, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(24, NULL, 23, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(25, NULL, 24, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(26, NULL, 25, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(27, NULL, 26, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(28, NULL, 27, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(29, NULL, 28, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(30, NULL, 29, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(31, NULL, 30, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(32, NULL, 31, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(33, NULL, 32, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(34, NULL, 33, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(35, NULL, 34, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(36, NULL, 35, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(37, NULL, 36, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(38, NULL, 37, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(39, NULL, 38, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(40, NULL, 39, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(41, NULL, 40, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(42, NULL, 41, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(43, NULL, 42, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(44, NULL, 43, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(45, NULL, 44, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(46, NULL, 45, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(47, NULL, 46, 1, NULL, b'0', '2024-08-17 02:25:34', 1, '2024-08-17 02:25:34', 1),
	(48, NULL, 47, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(49, NULL, 48, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(50, NULL, 49, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(51, NULL, 50, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(52, NULL, 51, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(53, NULL, 52, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(54, NULL, 53, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(55, NULL, 54, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(56, NULL, 55, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(57, NULL, 56, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(58, NULL, 57, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(59, NULL, 58, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(60, NULL, 59, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(61, NULL, 60, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(62, NULL, 61, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(63, NULL, 62, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(64, NULL, 63, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(65, NULL, 64, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(66, NULL, 65, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(67, NULL, 66, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(68, NULL, 67, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(69, NULL, 68, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(70, NULL, 69, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(71, NULL, 70, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(72, NULL, 71, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(73, NULL, 72, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(74, NULL, 73, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(75, NULL, 74, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(76, NULL, 75, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(77, NULL, 76, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(78, NULL, 77, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(79, NULL, 78, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(80, NULL, 79, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(81, NULL, 80, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(82, NULL, 81, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(83, NULL, 82, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(84, NULL, 83, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(85, NULL, 84, 1, NULL, b'0', '2024-08-17 02:25:35', 1, '2024-08-17 02:25:35', 1),
	(86, NULL, 85, 1, NULL, b'0', '2024-08-17 02:25:36', 1, '2024-08-17 02:25:36', 1),
	(87, NULL, 86, 1, NULL, b'0', '2024-08-17 02:25:36', 1, '2024-08-17 02:25:36', 1),
	(88, NULL, 87, 1, NULL, b'0', '2024-08-17 02:25:36', 1, '2024-08-17 02:25:36', 1),
	(89, NULL, 88, 1, NULL, b'0', '2024-08-17 02:25:36', 1, '2024-08-17 02:25:36', 1),
	(90, NULL, 89, 1, NULL, b'0', '2024-08-17 02:25:37', 1, '2024-08-17 02:25:37', 1),
	(91, NULL, 90, 1, NULL, b'0', '2024-08-17 02:25:37', 1, '2024-08-17 02:25:37', 1),
	(92, NULL, 91, 1, NULL, b'0', '2024-08-17 02:25:37', 1, '2024-08-17 02:25:37', 1),
	(93, NULL, 92, 1, NULL, b'0', '2024-08-17 02:25:37', 1, '2024-08-17 02:25:37', 1),
	(94, NULL, 93, 1, NULL, b'0', '2024-08-17 02:25:37', 1, '2024-08-17 02:25:37', 1),
	(95, NULL, 94, 1, NULL, b'0', '2024-08-17 02:25:37', 1, '2024-08-17 02:25:37', 1),
	(96, NULL, 95, 1, NULL, b'0', '2024-08-17 02:25:37', 1, '2024-08-17 02:25:37', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
