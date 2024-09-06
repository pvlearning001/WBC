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
	(1, '8f85e1bd-7bff-41f5-9881-38ba40686a60', 'Announcement', NULL, b'0', '2024-09-06 12:10:20', 1, '2024-09-06 12:10:20', 1);

-- Dumping structure for table wbc.configs
CREATE TABLE IF NOT EXISTS `configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `page_size` int(11) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `ins_at` datetime(6) DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime(6) DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.configs: ~2 rows (approximately)
REPLACE INTO `configs` (`id`, `guid`, `page_size`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, 'be808b40-6c48-11ef-96f2-509a4cb5cc32', 10, NULL, b'0', '2024-09-06 12:08:38.000000', 1, '2024-09-06 12:08:38.000000', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.file_upload: ~0 rows (approximately)
REPLACE INTO `file_upload` (`id`, `guid`, `name`, `path`, `ext_name`, `unique_name`, `content_type`, `hash_content`, `descriptions`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, 'cb4fd567-8ede-4383-863c-472a4b97cb5a', 'STC - ATLD Khoi Cap nuoc 2022.pdf', 'uploads\\documents\\messages', 'pdf', 'cb4fd567-8ede-4383-863c-472a4b97cb5a.pdf', 'application/pdf', NULL, NULL, NULL, b'0', '2024-09-06 12:14:48', 1, '2024-09-06 12:14:48', 1),
	(2, 'ac43225a-e1e4-44f6-88a6-7ff232ac87a9', 'VuMinhPhuong_Degree.pdf', 'uploads\\documents\\messages', 'pdf', 'ac43225a-e1e4-44f6-88a6-7ff232ac87a9.pdf', 'application/pdf', NULL, NULL, NULL, b'0', '2024-09-06 12:15:38', 1, '2024-09-06 12:15:38', 1);

-- Dumping structure for function wbc.fn_CheckSameRoles
DELIMITER //
CREATE FUNCTION `fn_CheckSameRoles`(`userid` INT,
	`rolesId` VARCHAR(250)
) RETURNS tinyint(4)
BEGIN
	DECLARE result TINYINT;
	SET result = 0;
	SET @rolesIdAssigned = (SELECT GROUP_CONCAT(role_id SEPARATOR ',')
	FROM user_role
	WHERE user_id = userid AND is_deleted = 0
	ORDER BY role_id);
	SET result = STRCMP(@rolesIdAssigned, rolesId);
	RETURN result;
END//
DELIMITER ;

-- Dumping structure for function wbc.fn_GetFilesDisabled
DELIMITER //
CREATE FUNCTION `fn_GetFilesDisabled`(`newsid` INT
) RETURNS varchar(1500) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
	DECLARE result VARCHAR(1500);
	SET result = (SELECT GROUP_CONCAT(file_upload_id SEPARATOR ',')
	FROM news_file_upload
	WHERE (news_id = newsid) AND (is_disabled = 1) AND (is_deleted = 0)
	ORDER BY file_upload_id);
	RETURN result;
END//
DELIMITER ;

-- Dumping structure for function wbc.fn_GetPageSize
DELIMITER //
CREATE FUNCTION `fn_GetPageSize`() RETURNS int(11)
BEGIN
	DECLARE result INT;
	SELECT page_size INTO result FROM configs WHERE id = 1;
	RETURN result;
END//
DELIMITER ;

-- Dumping structure for function wbc.fn_GetPageTotal
DELIMITER //
CREATE FUNCTION `fn_GetPageTotal`(`totalRecord` INT,
	`pageSize` INT
) RETURNS int(11)
BEGIN
	DECLARE result INT;
	DECLARE pageMod INT;
	SET result = totalRecord DIV pageSize;
	SET pageMod = MOD(totalRecord, pageSize);
	SELECT IF(pageMod > 0, (result +1), result) INTO result;
	RETURN result;
END//
DELIMITER ;

-- Dumping structure for function wbc.fn_GetRolesId
DELIMITER //
CREATE FUNCTION `fn_GetRolesId`(`rolesName` VARCHAR(250)
) RETURNS varchar(250) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
	DECLARE result VARCHAR(250);
	SET result = (SELECT GROUP_CONCAT(id SEPARATOR ',')
	FROM role
	WHERE FIND_IN_SET(name,rolesName)
	ORDER BY id);
	RETURN result;
END//
DELIMITER ;

-- Dumping structure for function wbc.fn_GetRolesName
DELIMITER //
CREATE FUNCTION `fn_GetRolesName`(`rolesId` VARCHAR(250)
) RETURNS varchar(250) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
	DECLARE result VARCHAR(250);
	SET result = (SELECT GROUP_CONCAT(NAME SEPARATOR ',')
	FROM role
	WHERE FIND_IN_SET(id,rolesId)
	ORDER BY id);
	RETURN result;
END//
DELIMITER ;

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
  `files_id` varchar(250) DEFAULT NULL,
  `files_disabled` varchar(250) DEFAULT NULL,
  `is_show` bit(1) NOT NULL DEFAULT b'0',
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  `is_how` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.news: ~0 rows (approximately)

-- Dumping structure for table wbc.news_file_upload
CREATE TABLE IF NOT EXISTS `news_file_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT NULL,
  `news_id` int(11) DEFAULT NULL,
  `file_upload_id` int(11) DEFAULT NULL,
  `is_disabled` bit(1) NOT NULL DEFAULT b'0',
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
	(1, 'd44af326-04cf-4523-86c5-3d2977fdda20', 'User', 'user', 'User Role', 'Init User Role', b'0', '2024-09-06 12:10:20.000000', 1, '2024-09-06 12:10:20.000000', 1),
	(2, '471006bc-c34e-49f8-a0de-c494a269964a', 'Admin', 'admin', 'Admin Role', 'Init Admin Role', b'0', '2024-09-06 12:10:20.000000', 1, '2024-09-06 12:10:20.000000', 1);

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

-- Dumping structure for procedure wbc.sp_CleanData
DELIMITER //
CREATE PROCEDURE `sp_CleanData`()
BEGIN
	DELETE FROM user_role;
	DELETE FROM role;
	DELETE FROM user_ext;
	DELETE FROM user;
	DELETE FROM file_upload;
	DELETE FROM invalidated_token;
	DELETE FROM category;
	DELETE FROM news_file_upload;
	DELETE FROM news;
	DELETE FROM configs;
	
	ALTER TABLE user_role AUTO_INCREMENT = 1;
	ALTER TABLE role AUTO_INCREMENT = 1;
	ALTER TABLE user_ext AUTO_INCREMENT = 1;
	ALTER TABLE user AUTO_INCREMENT = 1;
	ALTER TABLE file_upload AUTO_INCREMENT = 1;
	ALTER TABLE invalidated_token AUTO_INCREMENT = 1;
	ALTER TABLE category AUTO_INCREMENT = 1;
	ALTER TABLE news_file_upload AUTO_INCREMENT = 1;
	ALTER TABLE news AUTO_INCREMENT = 1;
	ALTER TABLE configs AUTO_INCREMENT = 1;
	
	INSERT INTO configs(page_size) VALUES(10);
END//
DELIMITER ;

-- Dumping structure for procedure wbc.sp_NewsGetById
DELIMITER //
CREATE PROCEDURE `sp_NewsGetById`(
	IN `id` INT,
	OUT `outid` INT,
	OUT `cateId` INT,
	OUT `subject` VARCHAR(512),
	OUT `content` VARCHAR(1024),
	OUT `contentEx01` VARCHAR(1024),
	OUT `contentEx02` VARCHAR(1024),
	OUT `contentEx03` VARCHAR(1024),
	OUT `contentEx04` VARCHAR(1024),
	OUT `contentEx05` VARCHAR(1024),
	OUT `contentEx06` VARCHAR(1024),
	OUT `filesId` VARCHAR(250),
	OUT `filesDisabled` VARCHAR(250),
	OUT `isShow` BIT
)
BEGIN
	SELECT id
		, cate_id 
		, subject
		, content
		, content_ex_01
		, content_ex_02
		, content_ex_03
		, content_ex_04
		, content_ex_05
		, content_ex_06
		, files_id
		, files_disabled
		, is_show
	INTO outid
		, cateId 
		, subject
		, content
		, contentEx01
		, contentEx02
		, contentEx03
		, contentEx04
		, contentEx05
		, contentEx06
		, filesId
		, filesDisabled
		, isShow
	FROM news
	WHERE (id = id) AND (is_deleted = 0);
	
	SELECT fu.id
		, fu.name
		, fu.path
		, fu.ext_name
		, fu.unique_name
		, fu.content_type
		, fu.descriptions
		, nfu.is_disabled
	FROM file_upload fu
		INNER JOIN news_file_upload nfu ON fu.id = nfu.file_upload_id
	WHERE (fu.is_deleted = 0)
		AND (nfu.is_deleted = 0) 
		AND (nfu.news_id = id)
	ORDER BY fu.id DESC;
END//
DELIMITER ;

-- Dumping structure for procedure wbc.sp_NewsGetLatestShow
DELIMITER //
CREATE PROCEDURE `sp_NewsGetLatestShow`(
	IN `cateId` INT,
	OUT `outid` INT,
	OUT `outCateId` INT,
	OUT `subject` VARCHAR(512),
	OUT `content` VARCHAR(1024),
	OUT `contentEx01` VARCHAR(1024),
	OUT `contentEx02` VARCHAR(1024),
	OUT `contentEx03` VARCHAR(1024),
	OUT `contentEx04` VARCHAR(1024),
	OUT `contentEx05` VARCHAR(1024),
	OUT `contentEx06` VARCHAR(1024),
	OUT `filesId` VARCHAR(250),
	OUT `filesDisabled` VARCHAR(250),
	OUT `isShow` BIT
)
BEGIN
	DECLARE maxId INT;
	SET maxId = 0;
	SELECT MAX(id) INTO maxId
	FROM news 
	WHERE (cate_id = cateId) AND (is_deleted = 0);
	
	SELECT id
		, cate_id 
		, subject
		, content
		, content_ex_01
		, content_ex_02
		, content_ex_03
		, content_ex_04
		, content_ex_05
		, content_ex_06
		, files_id
		, files_disabled
		, is_show
	INTO outid
		, outCateId 
		, subject
		, content
		, contentEx01
		, contentEx02
		, contentEx03
		, contentEx04
		, contentEx05
		, contentEx06
		, filesId
		, filesDisabled
		, isShow
	FROM news
	WHERE (id = maxId);
	
	SELECT fu.id
		, fu.name
		, fu.path
		, fu.ext_name
		, fu.unique_name
		, fu.content_type
		, fu.descriptions
		, nfu.is_disabled
	FROM file_upload fu
		INNER JOIN news_file_upload nfu ON fu.id = nfu.file_upload_id
	WHERE (fu.is_deleted = 0)
		AND (nfu.is_deleted = 0) 
		AND (nfu.news_id = maxId)
	ORDER BY fu.id DESC;
END//
DELIMITER ;

-- Dumping structure for procedure wbc.sp_NewsGetList
DELIMITER //
CREATE PROCEDURE `sp_NewsGetList`(
	IN `cateId` INT,
	IN `findText` VARCHAR(1024),
	IN `sort` VARCHAR(50),
	IN `sortType` VARCHAR(10),
	IN `pageIndex` INT,
	OUT `pageTotal` INT
)
    SQL SECURITY INVOKER
BEGIN
	DECLARE startIndex INT;
	DECLARE totalRecord INT;
	DECLARE pageSize INT;
	
	DECLARE stmSelectCount VARCHAR(1024);
	DECLARE stmSelectColumn VARCHAR(2048);
	DECLARE stmFrom VARCHAR(1024);
	DECLARE stmWhere VARCHAR(2048); 
	DECLARE stmSort VARCHAR(512);
	DECLARE stmLimit VARCHAR(512);
		
	DECLARE findValue VARCHAR(512);
	DECLARE findCondition VARCHAR(1024);
	
	SET stmSelectCount = 'SELECT COUNT(id) INTO @totalRecord';
	SET stmSelectColumn = '
		SELECT id AS id
		, subject
		, SUBSTRING(IF(ISNULL(content), "", content), 1, 100)
		, is_show
		, files_id';
		
	SET stmFrom = '
	FROM news
	';
	
	SET stmWhere = '
	WHERE (is_deleted = 0)
	';
	
	IF (cateId IS NOT NULL) THEN
		SET stmWhere = CONCAT(stmWhere, ' AND (cate_id = ', CONVERT(cateId, VARCHAR(12)), ')');
	END IF;

	IF (findText IS NOT NULL AND findText <> '') THEN
		SET findValue = CONCAT('\'%', findText, '%\'');
		SET findCondition = CONCAT(' 
		AND((subject LIKE ', findValue, ')
			OR (content LIKE ',  findValue, ')
			OR (content_ex_01 LIKE ', findValue, ')
			OR (content_ex_02 LIKE ', findValue, ')
			OR (content_ex_03 LIKE ', findValue, ')
			OR (content_ex_04 LIKE ', findValue, ')
			OR (content_ex_05 LIKE ', findValue, ')
			OR (content_ex_06 LIKE ', findValue, '))');
	ELSE
		SET findCondition = ' AND(1=1)';
	END IF;
	
	IF (sort IS NULL) THEN
		SET sort = 'id';
	END IF;
	
	IF (sortType IS NULL) THEN
		SET sortType = 'desc';
	END IF;
	
	SET stmSort = CONCAT('
	ORDER BY ', sort, ' ', sortType);
	
	SET stmWhere = CONCAT(stmWhere, findCondition);
	
	SET @sqlCount = CONCAT(stmSelectCount, stmFrom, stmWhere, ';');
	
	PREPARE stm FROM @sqlCount;
 	EXECUTE stm;
 	
 	SELECT @totalRecord INTO totalRecord;
	
	SELECT fn_GetPageSize() INTO pageSize;	
	SELECT fn_GetPageTotal(totalRecord, pageSize) INTO pageTotal;
	SET startIndex = (pageIndex - 1) * pageSize;	
	
	SET stmLimit = CONCAT('
	LIMIT ', startIndex, ', ', pageSize);
	
	SET @sqlColumn = CONCAT(stmSelectColumn, stmFrom, stmWhere, stmSort, stmLimit, ';');
	
	PREPARE stm FROM @sqlColumn;
 	EXECUTE stm;
 	DEALLOCATE PREPARE stm;
END//
DELIMITER ;

-- Dumping structure for procedure wbc.sp_NewsSave
DELIMITER //
CREATE PROCEDURE `sp_NewsSave`(
	IN `id` INT,
	IN `userChanged` INT,
	IN `cateId` INT,
	IN `subject` VARCHAR(512),
	IN `content` VARCHAR(1028),
	IN `contentEx01` VARCHAR(1024),
	IN `contentEx02` VARCHAR(1024),
	IN `contentEx03` VARCHAR(1024),
	IN `contentEx04` VARCHAR(1024),
	IN `contentEx05` VARCHAR(1024),
	IN `contentEx06` VARCHAR(1024),
	IN `filesId` VARCHAR(512),
	OUT `outid` INT
)
BEGIN
	SELECT * FROM user LIMIT 10;
	IF (id = 0 OR id IS NULL) THEN #INSERT NEW
		INSERT INTO news(
			cate_id
			, subject
			, content
			, content_ex_01
			, content_ex_02
			, content_ex_03
			, content_ex_04
			, content_ex_04
			, content_ex_05
			, content_ex_06
			, files_id
			, ins_at
			, ins_by	
			, upd_at		
			, upd_by
		) VALUES(
			cateId
			, subject
			, content
			, contentEx01
			, contentEx02
			, contentEx03
			, contentEx04
			, contentEx05
			, contentEx06
			, filesId
			, UTC_TIMESTAMP()
			, userChanged
			, UTC_TIMESTAMP()
			, userChanged
		);
		SELECT LAST_INSERT_ID() INTO id;
		SET outid = id;
	
	ELSE #UPDATE
		SET outid = id;
		
		UPDATE news SET
			cate_id = cateId
			, subject = subject
			, content = content
			, content_ex_01 = contentEx01
			, content_ex_02 = contentEx02
			, content_ex_03 = contentEx03
			, content_ex_04 = contentEx04
			, content_ex_05 = contentEx05
			, content_ex_06 = contentEx06
			, upd_at = UTC_TIMESTAMP()
			, upd_by = userChanged
		WHERE id = id;	
		
	END IF;
	
		
	IF (filesId IS NOT NULL AND filesId <> '') THEN
		UPDATE news_file_upload 
		SET is_disabled = 1
		WHERE news_id = id;
		
		INSERT INTO news_file_upload(
			news_id
			, file_upload_id
			, ins_at
			, ins_by
			, upd_at
			, upd_by
		) 
		SELECT id AS news_id
			, f.id AS file_upload_id
			, UTC_TIMESTAMP() AS ins_at
			, userChanged AS ins_by
			, UTC_TIMESTAMP() AS upd_at
			, userChanged AS upd_by
		FROM file_upload f
		WHERE FIND_IN_SET(f.id, filesId);
		
		SELECT fn_GetFilesDisabled(id) INTO @disableList;
		
		UPDATE news SET 
			files_id = filesId
			, files_disabled = @disableList 
		WHERE id = outid;
		
	END IF;
	
	SELECT * FROM file_upload
	WHERE ((is_deleted = 0) 
		AND (id IN (SELECT file_upload_id FROM news_file_upload WHERE news_id = outid)))
	ORDER BY id DESC;
END//
DELIMITER ;

-- Dumping structure for procedure wbc.sp_NewsSetDelete
DELIMITER //
CREATE PROCEDURE `sp_NewsSetDelete`(
	IN `newsid` INT,
	IN `userChanged` INT,
	IN `deletedValue` BIT
)
BEGIN
	CALL sp_TableSetDelete('news', newsid, userChanged, deletedValue);
	
	UPDATE file_upload SET 
		is_deleted = 1
		, upd_by = userChanged
		, upd_at = utc_timestamp()
	WHERE id IN (SELECT file_upload_id FROM news_file_upload WHERE news_id = newsid);
		
	CALL sp_TableRelationSetDelete('news_file_upload', 'news_id', newsid, userChanged, deletedValue);
END//
DELIMITER ;

-- Dumping structure for procedure wbc.sp_NewsSetShow
DELIMITER //
CREATE PROCEDURE `sp_NewsSetShow`(
	IN `id` INT,
	IN `cateId` INT
)
BEGIN
	UPDATE news SET is_show = 0
	WHERE (cate_id = cateId) AND (id <> id);
	
	UPDATE news SET is_show = 1
	WHERE id = id;  
END//
DELIMITER ;

-- Dumping structure for procedure wbc.sp_TableRelationSetDelete
DELIMITER //
CREATE PROCEDURE `sp_TableRelationSetDelete`(
	IN `tableName` VARCHAR(1028),
	IN `columnName` VARCHAR(1028),
	IN `id` INT,
	IN `userChanged` INT,
	IN `deletedValue` INT
)
BEGIN
	SET @sql = CONCAT('UPDATE ', tableName, '
		SET is_deleted = ?
		, upd_by = ?
		, upd_at=utc_timestamp() 
		WHERE ', columnName, '=?');	
	PREPARE stm FROM @sql;
 	EXECUTE stm USING deletedValue, userChanged, id;
 	DEALLOCATE PREPARE stm;
END//
DELIMITER ;

-- Dumping structure for procedure wbc.sp_TableSetDelete
DELIMITER //
CREATE PROCEDURE `sp_TableSetDelete`(
	IN `tableName` VARCHAR(1028),
	IN `id` INT,
	IN `userChanged` INT,
	IN `deletedValue` BIT
)
BEGIN
	SET @sqlStm = CONCAT('UPDATE ', tableName, '
		SET is_deleted = ?
			, upd_by = ?
			, upd_at=utc_timestamp() 
		WHERE id = ?');
	PREPARE stm FROM @sqlStm;
 	EXECUTE stm USING deletedValue, userChanged, id;
 	DEALLOCATE PREPARE stm;
END//
DELIMITER ;

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

-- Dumping structure for procedure wbc.sp_TestGetUserList
DELIMITER //
CREATE PROCEDURE `sp_TestGetUserList`(
	IN `findText` VARCHAR(250),
	IN `sort` VARCHAR(50),
	IN `sortType` VARCHAR(10),
	IN `pageIndex` INT,
	OUT `pageTotal` INT
)
BEGIN
	DECLARE startIndex INT;
	DECLARE totalRecord INT;
	DECLARE pageSize INT;
	
	DECLARE stmSelectCount VARCHAR(1024);
	DECLARE stmSelectColumn VARCHAR(2048);
	DECLARE stmFrom VARCHAR(1024);
	DECLARE stmWhere VARCHAR(2048); 
	DECLARE stmSort VARCHAR(512);
	DECLARE stmLimit VARCHAR(512);
		
	DECLARE findValue VARCHAR(512);
	DECLARE findCondition VARCHAR(1024);
	
	SET stmSelectCount = 'SELECT COUNT(u.id) INTO @totalRecord';
	SET stmSelectColumn = '
		SELECT u.id AS id
		, u.user_name
		, ue.f_name
		, ue.m_name
		, ue.l_name
		, ue.email
		, u.pw_reset
		, u.roles_id
		, u.roles_name';
		
	SET stmFrom = '
	FROM user u		
		LEFT JOIN user_ext ue ON u.id = ue.user_id
	';
	
	SET stmWhere = '
	WHERE (u.is_deleted = 0) AND (u.id > 1)
	';

	IF (findText IS NOT NULL) THEN
		SET findValue = CONCAT('\'%', findText, '%\'');
		SET findCondition = CONCAT(' 
		AND((u.user_name LIKE ', findValue, ')
			OR (ue.f_name LIKE ',  findValue, ')
			OR (ue.m_name LIKE ', findValue, ')
			OR (ue.l_name LIKE ', findValue, ')
			OR (ue.email LIKE ', findValue, '))');
	ELSE
		SET findCondition = ' AND(1=1)';
	END IF;
	
	IF (sort IS NULL) THEN
		SET sort = 'u.id';
	END IF;
	
	IF (sortType IS NULL) THEN
		SET sortType = 'desc';
	END IF;
	
	SET stmSort = CONCAT('
	ORDER BY ', sort, ' ', sortType);
	
	SET stmWhere = CONCAT(stmWhere, findCondition);
	
	SET @sqlCount = CONCAT(stmSelectCount, stmFrom, stmWhere, ';');
	
	PREPARE stm FROM @sqlCount;
 	EXECUTE stm;
 	
 	SELECT @totalRecord INTO totalRecord;
	
	SELECT fn_GetPageSize() INTO pageSize;	
	SELECT fn_GetPageTotal(totalRecord, pageSize) INTO pageTotal;
	SET startIndex = (pageIndex - 1) * pageSize;	
	
	SET stmLimit = CONCAT('
	LIMIT ', startIndex, ', ', pageSize);
	
	SET @sqlColumn = CONCAT(stmSelectColumn, stmFrom, stmWhere, stmSort, stmLimit, ';');
	
	PREPARE stm FROM @sqlColumn;
 	EXECUTE stm;
 	DEALLOCATE PREPARE stm;
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

-- Dumping structure for procedure wbc.sp_TestWhileLoop
DELIMITER //
CREATE PROCEDURE `sp_TestWhileLoop`(
	IN `input` VARCHAR(1028)
)
BEGIN
	SET @len = LENGTH(input);
	SET @posFirstComma = POSITION(',' IN input);
	WHILE (@len > 0 AND @posFirstComma > 0) DO
		SET @posFirstComma = POSITION(',' IN input);		
	   SET @val01 = SUBSTRING(input, 1, @posFirstComma - 1);
	   SET input = SUBSTRING(input, @posFirstComma + 1);
	   SET @len = LENGTH(input);
	   SELECT @val01, input;	 
	END WHILE;
END//
DELIMITER ;

-- Dumping structure for procedure wbc.sp_UserGetList
DELIMITER //
CREATE PROCEDURE `sp_UserGetList`(
	IN `findText` VARCHAR(250),
	IN `sort` VARCHAR(50),
	IN `sortType` VARCHAR(10),
	IN `pageIndex` INT,
	OUT `pageTotal` INT
)
BEGIN
	DECLARE startIndex INT;
	DECLARE totalRecord INT;
	DECLARE pageSize INT;
	
	DECLARE stmSelectCount VARCHAR(1024);
	DECLARE stmSelectColumn VARCHAR(2048);
	DECLARE stmFrom VARCHAR(1024);
	DECLARE stmWhere VARCHAR(2048); 
	DECLARE stmSort VARCHAR(512);
	DECLARE stmLimit VARCHAR(512);
		
	DECLARE findValue VARCHAR(512);
	DECLARE findCondition VARCHAR(1024);
	
	SET stmSelectCount = 'SELECT COUNT(u.id) INTO @totalRecord';
	SET stmSelectColumn = '
		SELECT u.id AS id
		, u.user_name
		, ue.f_name
		, ue.m_name
		, ue.l_name
		, ue.email
		, ue.phone01
		, u.is_reset_pw
		, u.pw_reset
		, u.roles_id
		, u.roles_name';
		
	SET stmFrom = '
	FROM user u		
		LEFT JOIN user_ext ue ON u.id = ue.user_id
	';
	
	SET stmWhere = '
	WHERE (u.is_deleted = 0) AND (ue.is_deleted = 0) AND (u.id > 1)
	';

	IF (findText IS NOT NULL AND findText <> '') THEN
		SET findValue = CONCAT('\'%', findText, '%\'');
		SET findCondition = CONCAT(' 
		AND((u.user_name LIKE ', findValue, ')
			OR (ue.f_name LIKE ',  findValue, ')
			OR (ue.m_name LIKE ', findValue, ')
			OR (ue.l_name LIKE ', findValue, ')
			OR (ue.email LIKE ', findValue, '))');
	ELSE
		SET findCondition = ' AND(1=1)';
	END IF;
	
	IF (sort IS NULL) THEN
		SET sort = 'u.id';
	END IF;
	
	IF (sortType IS NULL) THEN
		SET sortType = 'desc';
	END IF;
	
	SET stmSort = CONCAT('
	ORDER BY ', sort, ' ', sortType);
	
	SET stmWhere = CONCAT(stmWhere, findCondition);
	
	SET @sqlCount = CONCAT(stmSelectCount, stmFrom, stmWhere, ';');
	
	PREPARE stm FROM @sqlCount;
 	EXECUTE stm;
 	
 	SELECT @totalRecord INTO totalRecord;
	
	SELECT fn_GetPageSize() INTO pageSize;	
	SELECT fn_GetPageTotal(totalRecord, pageSize) INTO pageTotal;
	SET startIndex = (pageIndex - 1) * pageSize;	
	
	SET stmLimit = CONCAT('
	LIMIT ', startIndex, ', ', pageSize);
	
	SET @sqlColumn = CONCAT(stmSelectColumn, stmFrom, stmWhere, stmSort, stmLimit, ';');
	
	PREPARE stm FROM @sqlColumn;
 	EXECUTE stm;
 	DEALLOCATE PREPARE stm;
END//
DELIMITER ;

-- Dumping structure for procedure wbc.sp_UserSave
DELIMITER //
CREATE PROCEDURE `sp_UserSave`(
	IN `userid` INT,
	IN `userChanged` INT,
	IN `uName` VARCHAR(50),
	IN `pw` VARCHAR(100),
	IN `fName` VARCHAR(50),
	IN `mName` VARCHAR(50),
	IN `lName` VARCHAR(50),
	IN `email` VARCHAR(50),
	IN `phone` VARCHAR(20),
	IN `roles_id` VARCHAR(150),
	OUT `outid` INT
)
BEGIN
	SELECT fn_GetRolesName(roles_id) INTO @roles_name;
	SELECT fn_CheckSameRoles(userid, roles_id) INTO @isDiffRoles;
	IF (userid = 0 OR userid IS NULL) THEN #INSERT NEW
		INSERT INTO user(
			user_name
			, password
			, roles_id
			, roles_name
			, ins_at
			, ins_by	
			, upd_at		
			, upd_by
		) 
		VALUES(
			uName
			, pw
			, roles_id
			, @roles_name
			, UTC_TIMESTAMP()
			, userChanged
			, UTC_TIMESTAMP()
			, userChanged
		);
			
		SELECT LAST_INSERT_ID() INTO userid;
		SET outid = userid;
		
		IF (userChanged = 0) THEN
			SET userChanged = userid;
			UPDATE user SET
				ins_at = UTC_TIMESTAMP()
				, ins_by = userChanged
				, upd_at = UTC_TIMESTAMP()
				, upd_by = userChanged
			WHERE id = userid;
		END IF;
		
		INSERT INTO user_ext(
			user_id
			, f_name
			, m_name
			, l_name
			, email
			, phone01
			, ins_at
			, ins_by	
			, upd_at		
			, upd_by
		) 
		VALUES(
			userid
			, fName
			, mName
			, lName
			, email
			, phone
			, UTC_TIMESTAMP()
			, userChanged
			, UTC_TIMESTAMP()
			, userChanged
		);
		
		INSERT INTO user_role(
			user_id
			, role_id
			, ins_at
			, ins_by	
			, upd_at		
			, upd_by
		)
		SELECT userid AS user_id
			, r.id AS role_id
			, UTC_TIMESTAMP() AS ins_at
			, userChanged AS ins_by
			, UTC_TIMESTAMP() AS upd_at
			, userChanged AS upd_by
		FROM role r
		WHERE FIND_IN_SET(r.id, roles_id);
	
	ELSE #UPDATE
		SET outid = userid;
		
		UPDATE user SET
			user_name = uName
			, upd_at = UTC_TIMESTAMP()
			, upd_by = userChanged
		WHERE id = userid;
		
		UPDATE user_ext SET
			f_name = fName
			, m_name = mName
			, l_name = lName
			, email = email
			, phone01 = phone
			, upd_at = UTC_TIMESTAMP()
			, upd_by = userChanged
		WHERE user_id = userid;
		
		IF (@isDiffRoles <> 0) THEN
			UPDATE user SET
				roles_id = roles_id
				, roles_name = @roles_name
				, upd_at = UTC_TIMESTAMP()
				, upd_by = userChanged
			WHERE id = userid;
			
			CALL sp_TableRelationSetDelete('user_role', 'user_id', userid, userChanged, 1);
			
			INSERT INTO user_role(
				user_id
				, role_id
				, ins_at
				, ins_by	
				, upd_at		
				, upd_by
			)
			SELECT userid AS user_id
				, r.id AS role_id
				, UTC_TIMESTAMP() AS ins_at
				, userChanged AS ins_by
				, UTC_TIMESTAMP() AS upd_at
				, userChanged AS upd_by
			FROM role r
			WHERE FIND_IN_SET(r.id, roles_id);			
		END IF;			
	END IF;
END//
DELIMITER ;

-- Dumping structure for procedure wbc.sp_UserSetDelete
DELIMITER //
CREATE PROCEDURE `sp_UserSetDelete`(
	IN `userid` INT,
	IN `userChanged` INT,
	IN `deletedValue` BIT
)
BEGIN
	CALL sp_TableSetDelete('user', userid, userChanged, deletedValue);
	CALL sp_TableRelationSetDelete('user_ext', 'user_id', userid, userChanged, deletedValue); 
	CALL sp_TableRelationSetDelete('user_role', 'user_id', userid, userChanged, deletedValue);
	
END//
DELIMITER ;

-- Dumping structure for table wbc.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_reset_pw` bit(1) DEFAULT b'0',
  `pw_reset` varchar(255) DEFAULT NULL,
  `roles_id` varchar(255) DEFAULT NULL,
  `roles_name` varchar(512) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `ins_at` datetime(6) DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime(6) DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.user: ~0 rows (approximately)
REPLACE INTO `user` (`id`, `guid`, `user_name`, `password`, `is_reset_pw`, `pw_reset`, `roles_id`, `roles_name`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, 'fb712fa0-6c48-11ef-96f2-509a4cb5cc32', 'admin', '$2a$10$3G7ei35mQznSQWVpbvAqzewxU.CMRPQ21Xz3wac9MAx5SvuLOBwqK', b'0', NULL, '1,2', 'User,Admin', NULL, b'0', '2024-09-06 12:10:20.000000', 1, '2024-09-06 12:10:20.000000', 1),
	(2, 'fb812142-6c48-11ef-96f2-509a4cb5cc32', 'user002', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 2, '2024-09-06 12:10:20.000000', 2),
	(3, 'fb849e37-6c48-11ef-96f2-509a4cb5cc32', 'user003', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 3, '2024-09-06 12:10:20.000000', 3),
	(4, 'fb870525-6c48-11ef-96f2-509a4cb5cc32', 'user004', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 4, '2024-09-06 12:10:20.000000', 4),
	(5, 'fb890cb0-6c48-11ef-96f2-509a4cb5cc32', 'user005', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 5, '2024-09-06 12:10:20.000000', 5),
	(6, 'fb8b2c31-6c48-11ef-96f2-509a4cb5cc32', 'user006', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 6, '2024-09-06 12:10:20.000000', 6),
	(7, 'fb8d944e-6c48-11ef-96f2-509a4cb5cc32', 'user007', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 7, '2024-09-06 12:10:20.000000', 7),
	(8, 'fb8f93fc-6c48-11ef-96f2-509a4cb5cc32', 'user008', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 8, '2024-09-06 12:10:20.000000', 8),
	(9, 'fb919f70-6c48-11ef-96f2-509a4cb5cc32', 'user009', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 9, '2024-09-06 12:10:20.000000', 9),
	(10, 'fb93fc6e-6c48-11ef-96f2-509a4cb5cc32', 'user010', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 10, '2024-09-06 12:10:20.000000', 10),
	(11, 'fb961c4d-6c48-11ef-96f2-509a4cb5cc32', 'user011', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 11, '2024-09-06 12:10:20.000000', 11),
	(12, 'fb9887b7-6c48-11ef-96f2-509a4cb5cc32', 'user012', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 12, '2024-09-06 12:10:20.000000', 12),
	(13, 'fb9b4d41-6c48-11ef-96f2-509a4cb5cc32', 'user013', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 13, '2024-09-06 12:10:20.000000', 13),
	(14, 'fb9d3514-6c48-11ef-96f2-509a4cb5cc32', 'user014', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 14, '2024-09-06 12:10:20.000000', 14),
	(15, 'fb9f5d1b-6c48-11ef-96f2-509a4cb5cc32', 'user015', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 15, '2024-09-06 12:10:20.000000', 15),
	(16, 'fba13ad3-6c48-11ef-96f2-509a4cb5cc32', 'user016', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 16, '2024-09-06 12:10:20.000000', 16),
	(17, 'fba3322e-6c48-11ef-96f2-509a4cb5cc32', 'user017', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 17, '2024-09-06 12:10:20.000000', 17),
	(18, 'fba5ff94-6c48-11ef-96f2-509a4cb5cc32', 'user018', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 18, '2024-09-06 12:10:20.000000', 18),
	(19, 'fbaaf83b-6c48-11ef-96f2-509a4cb5cc32', 'user019', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 19, '2024-09-06 12:10:20.000000', 19),
	(20, 'fbad4712-6c48-11ef-96f2-509a4cb5cc32', 'user020', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 20, '2024-09-06 12:10:20.000000', 20),
	(21, 'fbaf627c-6c48-11ef-96f2-509a4cb5cc32', 'user021', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 21, '2024-09-06 12:10:20.000000', 21),
	(22, 'fbb1879f-6c48-11ef-96f2-509a4cb5cc32', 'user022', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 22, '2024-09-06 12:10:20.000000', 22),
	(23, 'fbb3bd03-6c48-11ef-96f2-509a4cb5cc32', 'user023', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:20.000000', 23, '2024-09-06 12:10:20.000000', 23),
	(24, 'fbb7cd5b-6c48-11ef-96f2-509a4cb5cc32', 'user024', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 24, '2024-09-06 12:10:21.000000', 24),
	(25, 'fbbae020-6c48-11ef-96f2-509a4cb5cc32', 'user025', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 25, '2024-09-06 12:10:21.000000', 25),
	(26, 'fbbcfdb4-6c48-11ef-96f2-509a4cb5cc32', 'user026', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 26, '2024-09-06 12:10:21.000000', 26),
	(27, 'fbbf243b-6c48-11ef-96f2-509a4cb5cc32', 'user027', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 27, '2024-09-06 12:10:21.000000', 27),
	(28, 'fbc18a98-6c48-11ef-96f2-509a4cb5cc32', 'user028', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 28, '2024-09-06 12:10:21.000000', 28),
	(29, 'fbc3b354-6c48-11ef-96f2-509a4cb5cc32', 'user029', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 29, '2024-09-06 12:10:21.000000', 29),
	(30, 'fbc66cfd-6c48-11ef-96f2-509a4cb5cc32', 'user030', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 30, '2024-09-06 12:10:21.000000', 30),
	(31, 'fbc93171-6c48-11ef-96f2-509a4cb5cc32', 'user031', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 31, '2024-09-06 12:10:21.000000', 31),
	(32, 'fbcb4f28-6c48-11ef-96f2-509a4cb5cc32', 'user032', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 32, '2024-09-06 12:10:21.000000', 32),
	(33, 'fbcd34a6-6c48-11ef-96f2-509a4cb5cc32', 'user033', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 33, '2024-09-06 12:10:21.000000', 33),
	(34, 'fbcf8154-6c48-11ef-96f2-509a4cb5cc32', 'user034', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 34, '2024-09-06 12:10:21.000000', 34),
	(35, 'fbd25dab-6c48-11ef-96f2-509a4cb5cc32', 'user035', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 35, '2024-09-06 12:10:21.000000', 35),
	(36, 'fbd52b13-6c48-11ef-96f2-509a4cb5cc32', 'user036', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 36, '2024-09-06 12:10:21.000000', 36),
	(37, 'fbd79772-6c48-11ef-96f2-509a4cb5cc32', 'user037', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 37, '2024-09-06 12:10:21.000000', 37),
	(38, 'fbd98a8e-6c48-11ef-96f2-509a4cb5cc32', 'user038', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 38, '2024-09-06 12:10:21.000000', 38),
	(39, 'fbdbc5b3-6c48-11ef-96f2-509a4cb5cc32', 'user039', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 39, '2024-09-06 12:10:21.000000', 39),
	(40, 'fbdda46f-6c48-11ef-96f2-509a4cb5cc32', 'user040', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 40, '2024-09-06 12:10:21.000000', 40),
	(41, 'fbdf48fb-6c48-11ef-96f2-509a4cb5cc32', 'user041', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 41, '2024-09-06 12:10:21.000000', 41),
	(42, 'fbe16357-6c48-11ef-96f2-509a4cb5cc32', 'user042', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 42, '2024-09-06 12:10:21.000000', 42),
	(43, 'fbe375d1-6c48-11ef-96f2-509a4cb5cc32', 'user043', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 43, '2024-09-06 12:10:21.000000', 43),
	(44, 'fbe58159-6c48-11ef-96f2-509a4cb5cc32', 'user044', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 44, '2024-09-06 12:10:21.000000', 44),
	(45, 'fbe77b92-6c48-11ef-96f2-509a4cb5cc32', 'user045', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 45, '2024-09-06 12:10:21.000000', 45),
	(46, 'fbe9f173-6c48-11ef-96f2-509a4cb5cc32', 'user046', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 46, '2024-09-06 12:10:21.000000', 46),
	(47, 'fbf014b0-6c48-11ef-96f2-509a4cb5cc32', 'user047', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 47, '2024-09-06 12:10:21.000000', 47),
	(48, 'fbf4a609-6c48-11ef-96f2-509a4cb5cc32', 'user048', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 48, '2024-09-06 12:10:21.000000', 48),
	(49, 'fbf76aa5-6c48-11ef-96f2-509a4cb5cc32', 'user049', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 49, '2024-09-06 12:10:21.000000', 49),
	(50, 'fbfa7f27-6c48-11ef-96f2-509a4cb5cc32', 'user050', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 50, '2024-09-06 12:10:21.000000', 50),
	(51, 'fbfd13c9-6c48-11ef-96f2-509a4cb5cc32', 'user051', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 51, '2024-09-06 12:10:21.000000', 51),
	(52, 'fc001e2c-6c48-11ef-96f2-509a4cb5cc32', 'user052', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 52, '2024-09-06 12:10:21.000000', 52),
	(53, 'fc01eab6-6c48-11ef-96f2-509a4cb5cc32', 'user053', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 53, '2024-09-06 12:10:21.000000', 53),
	(54, 'fc0381b8-6c48-11ef-96f2-509a4cb5cc32', 'user054', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 54, '2024-09-06 12:10:21.000000', 54),
	(55, 'fc04fd40-6c48-11ef-96f2-509a4cb5cc32', 'user055', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 55, '2024-09-06 12:10:21.000000', 55),
	(56, 'fc0671a3-6c48-11ef-96f2-509a4cb5cc32', 'user056', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 56, '2024-09-06 12:10:21.000000', 56),
	(57, 'fc080426-6c48-11ef-96f2-509a4cb5cc32', 'user057', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 57, '2024-09-06 12:10:21.000000', 57),
	(58, 'fc097b38-6c48-11ef-96f2-509a4cb5cc32', 'user058', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 58, '2024-09-06 12:10:21.000000', 58),
	(59, 'fc0b4422-6c48-11ef-96f2-509a4cb5cc32', 'user059', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 59, '2024-09-06 12:10:21.000000', 59),
	(60, 'fc0d0993-6c48-11ef-96f2-509a4cb5cc32', 'user060', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 60, '2024-09-06 12:10:21.000000', 60),
	(61, 'fc0ef66a-6c48-11ef-96f2-509a4cb5cc32', 'user061', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 61, '2024-09-06 12:10:21.000000', 61),
	(62, 'fc10c880-6c48-11ef-96f2-509a4cb5cc32', 'user062', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 62, '2024-09-06 12:10:21.000000', 62),
	(63, 'fc14796f-6c48-11ef-96f2-509a4cb5cc32', 'user063', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 63, '2024-09-06 12:10:21.000000', 63),
	(64, 'fc18c2a5-6c48-11ef-96f2-509a4cb5cc32', 'user064', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 64, '2024-09-06 12:10:21.000000', 64),
	(65, 'fc1cdfbc-6c48-11ef-96f2-509a4cb5cc32', 'user065', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 65, '2024-09-06 12:10:21.000000', 65),
	(66, 'fc1e9e33-6c48-11ef-96f2-509a4cb5cc32', 'user066', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 66, '2024-09-06 12:10:21.000000', 66),
	(67, 'fc205b09-6c48-11ef-96f2-509a4cb5cc32', 'user067', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 67, '2024-09-06 12:10:21.000000', 67),
	(68, 'fc2207e4-6c48-11ef-96f2-509a4cb5cc32', 'user068', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 68, '2024-09-06 12:10:21.000000', 68),
	(69, 'fc23a3a9-6c48-11ef-96f2-509a4cb5cc32', 'user069', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 69, '2024-09-06 12:10:21.000000', 69),
	(70, 'fc25495b-6c48-11ef-96f2-509a4cb5cc32', 'user070', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 70, '2024-09-06 12:10:21.000000', 70),
	(71, 'fc26ca63-6c48-11ef-96f2-509a4cb5cc32', 'user071', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 71, '2024-09-06 12:10:21.000000', 71),
	(72, 'fc282f42-6c48-11ef-96f2-509a4cb5cc32', 'user072', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 72, '2024-09-06 12:10:21.000000', 72),
	(73, 'fc299483-6c48-11ef-96f2-509a4cb5cc32', 'user073', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 73, '2024-09-06 12:10:21.000000', 73),
	(74, 'fc2ae7b7-6c48-11ef-96f2-509a4cb5cc32', 'user074', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 74, '2024-09-06 12:10:21.000000', 74),
	(75, 'fc2c9caf-6c48-11ef-96f2-509a4cb5cc32', 'user075', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 75, '2024-09-06 12:10:21.000000', 75),
	(76, 'fc3006a4-6c48-11ef-96f2-509a4cb5cc32', 'user076', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 76, '2024-09-06 12:10:21.000000', 76),
	(77, 'fc34c899-6c48-11ef-96f2-509a4cb5cc32', 'user077', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 77, '2024-09-06 12:10:21.000000', 77),
	(78, 'fc37da21-6c48-11ef-96f2-509a4cb5cc32', 'user078', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 78, '2024-09-06 12:10:21.000000', 78),
	(79, 'fc39c463-6c48-11ef-96f2-509a4cb5cc32', 'user079', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 79, '2024-09-06 12:10:21.000000', 79),
	(80, 'fc3c0690-6c48-11ef-96f2-509a4cb5cc32', 'user080', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 80, '2024-09-06 12:10:21.000000', 80),
	(81, 'fc3e09b2-6c48-11ef-96f2-509a4cb5cc32', 'user081', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 81, '2024-09-06 12:10:21.000000', 81),
	(82, 'fc4018ef-6c48-11ef-96f2-509a4cb5cc32', 'user082', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 82, '2024-09-06 12:10:21.000000', 82),
	(83, 'fc43a3fd-6c48-11ef-96f2-509a4cb5cc32', 'user083', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 83, '2024-09-06 12:10:21.000000', 83),
	(84, 'fc456de5-6c48-11ef-96f2-509a4cb5cc32', 'user084', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 84, '2024-09-06 12:10:21.000000', 84),
	(85, 'fc474124-6c48-11ef-96f2-509a4cb5cc32', 'user085', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 85, '2024-09-06 12:10:21.000000', 85),
	(86, 'fc4935fd-6c48-11ef-96f2-509a4cb5cc32', 'user086', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 86, '2024-09-06 12:10:21.000000', 86),
	(87, 'fc4ab4ce-6c48-11ef-96f2-509a4cb5cc32', 'user087', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 87, '2024-09-06 12:10:21.000000', 87),
	(88, 'fc4c445c-6c48-11ef-96f2-509a4cb5cc32', 'user088', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 88, '2024-09-06 12:10:21.000000', 88),
	(89, 'fc4e5165-6c48-11ef-96f2-509a4cb5cc32', 'user089', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:21.000000', 89, '2024-09-06 12:10:21.000000', 89),
	(90, 'fc506111-6c48-11ef-96f2-509a4cb5cc32', 'user090', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 90, '2024-09-06 12:10:22.000000', 90),
	(91, 'fc5216e2-6c48-11ef-96f2-509a4cb5cc32', 'user091', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 91, '2024-09-06 12:10:22.000000', 91),
	(92, 'fc53c4d3-6c48-11ef-96f2-509a4cb5cc32', 'user092', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 92, '2024-09-06 12:10:22.000000', 92),
	(93, 'fc55f207-6c48-11ef-96f2-509a4cb5cc32', 'user093', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 93, '2024-09-06 12:10:22.000000', 93),
	(94, 'fc58d517-6c48-11ef-96f2-509a4cb5cc32', 'user094', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 94, '2024-09-06 12:10:22.000000', 94),
	(95, 'fc5b58e0-6c48-11ef-96f2-509a4cb5cc32', 'user095', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 95, '2024-09-06 12:10:22.000000', 95),
	(96, 'fc5d6b33-6c48-11ef-96f2-509a4cb5cc32', 'user096', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 96, '2024-09-06 12:10:22.000000', 96),
	(97, 'fc5f3214-6c48-11ef-96f2-509a4cb5cc32', 'user097', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 97, '2024-09-06 12:10:22.000000', 97),
	(98, 'fc60db31-6c48-11ef-96f2-509a4cb5cc32', 'user098', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 98, '2024-09-06 12:10:22.000000', 98),
	(99, 'fc626cb0-6c48-11ef-96f2-509a4cb5cc32', 'user99', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 99, '2024-09-06 12:10:22.000000', 99),
	(100, 'fc64828e-6c48-11ef-96f2-509a4cb5cc32', 'user100', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 100, '2024-09-06 12:10:22.000000', 100),
	(101, 'fc6635bb-6c48-11ef-96f2-509a4cb5cc32', 'user101', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 101, '2024-09-06 12:10:22.000000', 101),
	(102, 'fc67d3b9-6c48-11ef-96f2-509a4cb5cc32', 'user102', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 102, '2024-09-06 12:10:22.000000', 102),
	(103, 'fc6b08e1-6c48-11ef-96f2-509a4cb5cc32', 'user103', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 103, '2024-09-06 12:10:22.000000', 103),
	(104, 'fc6cd892-6c48-11ef-96f2-509a4cb5cc32', 'user104', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 104, '2024-09-06 12:10:22.000000', 104),
	(105, 'fc6e8b74-6c48-11ef-96f2-509a4cb5cc32', 'user105', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 105, '2024-09-06 12:10:22.000000', 105),
	(106, 'fc70263e-6c48-11ef-96f2-509a4cb5cc32', 'user106', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 106, '2024-09-06 12:10:22.000000', 106),
	(107, 'fc71f7c9-6c48-11ef-96f2-509a4cb5cc32', 'user107', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 107, '2024-09-06 12:10:22.000000', 107),
	(108, 'fc73df4c-6c48-11ef-96f2-509a4cb5cc32', 'user108', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 108, '2024-09-06 12:10:22.000000', 108),
	(109, 'fc757ab9-6c48-11ef-96f2-509a4cb5cc32', 'user109', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 109, '2024-09-06 12:10:22.000000', 109),
	(110, 'fc771b04-6c48-11ef-96f2-509a4cb5cc32', 'user110', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 110, '2024-09-06 12:10:22.000000', 110),
	(111, 'fc78ee4e-6c48-11ef-96f2-509a4cb5cc32', 'user111', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 111, '2024-09-06 12:10:22.000000', 111),
	(112, 'fc7a7aa4-6c48-11ef-96f2-509a4cb5cc32', 'user112', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 112, '2024-09-06 12:10:22.000000', 112),
	(113, 'fc7c1179-6c48-11ef-96f2-509a4cb5cc32', 'user113', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 113, '2024-09-06 12:10:22.000000', 113),
	(114, 'fc7d9ef9-6c48-11ef-96f2-509a4cb5cc32', 'user114', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 114, '2024-09-06 12:10:22.000000', 114),
	(115, 'fc7f0fe7-6c48-11ef-96f2-509a4cb5cc32', 'user115', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 115, '2024-09-06 12:10:22.000000', 115),
	(116, 'fc806f1e-6c48-11ef-96f2-509a4cb5cc32', 'user116', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 116, '2024-09-06 12:10:22.000000', 116),
	(117, 'fc81ce2f-6c48-11ef-96f2-509a4cb5cc32', 'user117', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 117, '2024-09-06 12:10:22.000000', 117),
	(118, 'fc832d91-6c48-11ef-96f2-509a4cb5cc32', 'user118', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 118, '2024-09-06 12:10:22.000000', 118),
	(119, 'fc8491c3-6c48-11ef-96f2-509a4cb5cc32', 'user119', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 119, '2024-09-06 12:10:22.000000', 119),
	(120, 'fc85f74a-6c48-11ef-96f2-509a4cb5cc32', 'user120', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 120, '2024-09-06 12:10:22.000000', 120),
	(121, 'fc875ada-6c48-11ef-96f2-509a4cb5cc32', 'user121', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 121, '2024-09-06 12:10:22.000000', 121),
	(122, 'fc88aff9-6c48-11ef-96f2-509a4cb5cc32', 'user122', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 122, '2024-09-06 12:10:22.000000', 122),
	(123, 'fc8a60e6-6c48-11ef-96f2-509a4cb5cc32', 'user123', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 123, '2024-09-06 12:10:22.000000', 123),
	(124, 'fc8c1dfc-6c48-11ef-96f2-509a4cb5cc32', 'user124', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 124, '2024-09-06 12:10:22.000000', 124),
	(125, 'fc8dc99c-6c48-11ef-96f2-509a4cb5cc32', 'user125', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 125, '2024-09-06 12:10:22.000000', 125),
	(126, 'fc8f9fdc-6c48-11ef-96f2-509a4cb5cc32', 'user126', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 126, '2024-09-06 12:10:22.000000', 126),
	(127, 'fc9171d4-6c48-11ef-96f2-509a4cb5cc32', 'user127', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 127, '2024-09-06 12:10:22.000000', 127),
	(128, 'fc9381fa-6c48-11ef-96f2-509a4cb5cc32', 'user128', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 128, '2024-09-06 12:10:22.000000', 128),
	(129, 'fc960e1c-6c48-11ef-96f2-509a4cb5cc32', 'user129', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 129, '2024-09-06 12:10:22.000000', 129),
	(130, 'fc97f578-6c48-11ef-96f2-509a4cb5cc32', 'user130', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 130, '2024-09-06 12:10:22.000000', 130),
	(131, 'fc99c7d4-6c48-11ef-96f2-509a4cb5cc32', 'user131', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 131, '2024-09-06 12:10:22.000000', 131),
	(132, 'fc9d1f02-6c48-11ef-96f2-509a4cb5cc32', 'user132', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 132, '2024-09-06 12:10:22.000000', 132),
	(133, 'fc9ec06f-6c48-11ef-96f2-509a4cb5cc32', 'user133', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 133, '2024-09-06 12:10:22.000000', 133),
	(134, 'fca05357-6c48-11ef-96f2-509a4cb5cc32', 'user134', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 134, '2024-09-06 12:10:22.000000', 134),
	(135, 'fca1db97-6c48-11ef-96f2-509a4cb5cc32', 'user135', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 135, '2024-09-06 12:10:22.000000', 135),
	(136, 'fca32b0f-6c48-11ef-96f2-509a4cb5cc32', 'user136', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 136, '2024-09-06 12:10:22.000000', 136),
	(137, 'fca48ff2-6c48-11ef-96f2-509a4cb5cc32', 'user137', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 137, '2024-09-06 12:10:22.000000', 137),
	(138, 'fca5e9ca-6c48-11ef-96f2-509a4cb5cc32', 'user138', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 138, '2024-09-06 12:10:22.000000', 138),
	(139, 'fca743e0-6c48-11ef-96f2-509a4cb5cc32', 'user139', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 139, '2024-09-06 12:10:22.000000', 139),
	(140, 'fca8b1eb-6c48-11ef-96f2-509a4cb5cc32', 'user140', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 140, '2024-09-06 12:10:22.000000', 140),
	(141, 'fcaa07d0-6c48-11ef-96f2-509a4cb5cc32', 'user141', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 141, '2024-09-06 12:10:22.000000', 141),
	(142, 'fcab4b45-6c48-11ef-96f2-509a4cb5cc32', 'user142', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 142, '2024-09-06 12:10:22.000000', 142),
	(143, 'fcacba83-6c48-11ef-96f2-509a4cb5cc32', 'user143', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 143, '2024-09-06 12:10:22.000000', 143),
	(144, 'fcaea7a4-6c48-11ef-96f2-509a4cb5cc32', 'user144', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 144, '2024-09-06 12:10:22.000000', 144),
	(145, 'fcb08f86-6c48-11ef-96f2-509a4cb5cc32', 'user145', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 145, '2024-09-06 12:10:22.000000', 145),
	(146, 'fcb22a83-6c48-11ef-96f2-509a4cb5cc32', 'user146', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 146, '2024-09-06 12:10:22.000000', 146),
	(147, 'fcb3e464-6c48-11ef-96f2-509a4cb5cc32', 'user147', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 147, '2024-09-06 12:10:22.000000', 147),
	(148, 'fcb56981-6c48-11ef-96f2-509a4cb5cc32', 'user148', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 148, '2024-09-06 12:10:22.000000', 148),
	(149, 'fcb6c0bf-6c48-11ef-96f2-509a4cb5cc32', 'user149', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 149, '2024-09-06 12:10:22.000000', 149),
	(150, 'fcb877ef-6c48-11ef-96f2-509a4cb5cc32', 'user150', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 150, '2024-09-06 12:10:22.000000', 150),
	(151, 'fcba37b0-6c48-11ef-96f2-509a4cb5cc32', 'user151', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 151, '2024-09-06 12:10:22.000000', 151),
	(152, 'fcbbb6c8-6c48-11ef-96f2-509a4cb5cc32', 'user152', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 152, '2024-09-06 12:10:22.000000', 152),
	(153, 'fcbd6f60-6c48-11ef-96f2-509a4cb5cc32', 'user153', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 153, '2024-09-06 12:10:22.000000', 153),
	(154, 'fcbef521-6c48-11ef-96f2-509a4cb5cc32', 'user154', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 154, '2024-09-06 12:10:22.000000', 154),
	(155, 'fcc085fc-6c48-11ef-96f2-509a4cb5cc32', 'user155', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 155, '2024-09-06 12:10:22.000000', 155),
	(156, 'fcc24302-6c48-11ef-96f2-509a4cb5cc32', 'user156', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 156, '2024-09-06 12:10:22.000000', 156),
	(157, 'fcc3fe30-6c48-11ef-96f2-509a4cb5cc32', 'user157', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 157, '2024-09-06 12:10:22.000000', 157),
	(158, 'fcc5b50e-6c48-11ef-96f2-509a4cb5cc32', 'user158', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 158, '2024-09-06 12:10:22.000000', 158),
	(159, 'fcc7873e-6c48-11ef-96f2-509a4cb5cc32', 'user159', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 159, '2024-09-06 12:10:22.000000', 159),
	(160, 'fcc93320-6c48-11ef-96f2-509a4cb5cc32', 'user160', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 160, '2024-09-06 12:10:22.000000', 160),
	(161, 'fccaed0c-6c48-11ef-96f2-509a4cb5cc32', 'user161', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 161, '2024-09-06 12:10:22.000000', 161),
	(162, 'fcd14c0a-6c48-11ef-96f2-509a4cb5cc32', 'user162', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 162, '2024-09-06 12:10:22.000000', 162),
	(163, 'fcd34e42-6c48-11ef-96f2-509a4cb5cc32', 'user163', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 163, '2024-09-06 12:10:22.000000', 163),
	(164, 'fcd55361-6c48-11ef-96f2-509a4cb5cc32', 'user164', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 164, '2024-09-06 12:10:22.000000', 164),
	(165, 'fcd7d9a7-6c48-11ef-96f2-509a4cb5cc32', 'user165', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 165, '2024-09-06 12:10:22.000000', 165),
	(166, 'fcd9676f-6c48-11ef-96f2-509a4cb5cc32', 'user166', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 166, '2024-09-06 12:10:22.000000', 166),
	(167, 'fcdb4e9d-6c48-11ef-96f2-509a4cb5cc32', 'user167', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 167, '2024-09-06 12:10:22.000000', 167),
	(168, 'fcde8978-6c48-11ef-96f2-509a4cb5cc32', 'user168', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 168, '2024-09-06 12:10:22.000000', 168),
	(169, 'fce01b74-6c48-11ef-96f2-509a4cb5cc32', 'user169', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 169, '2024-09-06 12:10:22.000000', 169),
	(170, 'fce1844a-6c48-11ef-96f2-509a4cb5cc32', 'user170', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 170, '2024-09-06 12:10:22.000000', 170),
	(171, 'fce2f857-6c48-11ef-96f2-509a4cb5cc32', 'user171', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 171, '2024-09-06 12:10:22.000000', 171),
	(172, 'fce45d98-6c48-11ef-96f2-509a4cb5cc32', 'user172', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 172, '2024-09-06 12:10:22.000000', 172),
	(173, 'fce5fd51-6c48-11ef-96f2-509a4cb5cc32', 'user173', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 173, '2024-09-06 12:10:22.000000', 173),
	(174, 'fce78ad2-6c48-11ef-96f2-509a4cb5cc32', 'user174', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:22.000000', 174, '2024-09-06 12:10:22.000000', 174),
	(175, 'fce924ee-6c48-11ef-96f2-509a4cb5cc32', 'user175', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 175, '2024-09-06 12:10:23.000000', 175),
	(176, 'fceacfbd-6c48-11ef-96f2-509a4cb5cc32', 'user176', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 176, '2024-09-06 12:10:23.000000', 176),
	(177, 'fcec7077-6c48-11ef-96f2-509a4cb5cc32', 'user177', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 177, '2024-09-06 12:10:23.000000', 177),
	(178, 'fceea27b-6c48-11ef-96f2-509a4cb5cc32', 'user178', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 178, '2024-09-06 12:10:23.000000', 178),
	(179, 'fcf0e970-6c48-11ef-96f2-509a4cb5cc32', 'user179', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 179, '2024-09-06 12:10:23.000000', 179),
	(180, 'fcf28e53-6c48-11ef-96f2-509a4cb5cc32', 'user180', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 180, '2024-09-06 12:10:23.000000', 180),
	(181, 'fcf4173b-6c48-11ef-96f2-509a4cb5cc32', 'user181', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 181, '2024-09-06 12:10:23.000000', 181),
	(182, 'fcf5cabe-6c48-11ef-96f2-509a4cb5cc32', 'user182', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 182, '2024-09-06 12:10:23.000000', 182),
	(183, 'fcf81ebb-6c48-11ef-96f2-509a4cb5cc32', 'user183', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 183, '2024-09-06 12:10:23.000000', 183),
	(184, 'fcf9a8b3-6c48-11ef-96f2-509a4cb5cc32', 'user184', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 184, '2024-09-06 12:10:23.000000', 184),
	(185, 'fcfbbb1b-6c48-11ef-96f2-509a4cb5cc32', 'user185', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 185, '2024-09-06 12:10:23.000000', 185),
	(186, 'fcfd7096-6c48-11ef-96f2-509a4cb5cc32', 'user186', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 186, '2024-09-06 12:10:23.000000', 186),
	(187, 'fcff1c2a-6c48-11ef-96f2-509a4cb5cc32', 'user187', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 187, '2024-09-06 12:10:23.000000', 187),
	(188, 'fd0107c5-6c48-11ef-96f2-509a4cb5cc32', 'user188', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 188, '2024-09-06 12:10:23.000000', 188),
	(189, 'fd02d4b3-6c48-11ef-96f2-509a4cb5cc32', 'user189', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 189, '2024-09-06 12:10:23.000000', 189),
	(190, 'fd046b55-6c48-11ef-96f2-509a4cb5cc32', 'user190', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 190, '2024-09-06 12:10:23.000000', 190),
	(191, 'fd0604e5-6c48-11ef-96f2-509a4cb5cc32', 'user191', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 191, '2024-09-06 12:10:23.000000', 191),
	(192, 'fd07b810-6c48-11ef-96f2-509a4cb5cc32', 'user192', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 192, '2024-09-06 12:10:23.000000', 192),
	(193, 'fd095dc3-6c48-11ef-96f2-509a4cb5cc32', 'user193', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 193, '2024-09-06 12:10:23.000000', 193),
	(194, 'fd0afe1a-6c48-11ef-96f2-509a4cb5cc32', 'user194', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 194, '2024-09-06 12:10:23.000000', 194),
	(195, 'fd0c8bb2-6c48-11ef-96f2-509a4cb5cc32', 'user195', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 195, '2024-09-06 12:10:23.000000', 195),
	(196, 'fd0e257c-6c48-11ef-96f2-509a4cb5cc32', 'user196', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 196, '2024-09-06 12:10:23.000000', 196),
	(197, 'fd10040f-6c48-11ef-96f2-509a4cb5cc32', 'user197', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 197, '2024-09-06 12:10:23.000000', 197),
	(198, 'fd11b64b-6c48-11ef-96f2-509a4cb5cc32', 'user198', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 198, '2024-09-06 12:10:23.000000', 198),
	(199, 'fd1368bc-6c48-11ef-96f2-509a4cb5cc32', 'user199', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 199, '2024-09-06 12:10:23.000000', 199),
	(200, 'fd14fe13-6c48-11ef-96f2-509a4cb5cc32', 'user200', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 200, '2024-09-06 12:10:23.000000', 200),
	(201, 'fd16898e-6c48-11ef-96f2-509a4cb5cc32', 'user201', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 201, '2024-09-06 12:10:23.000000', 201),
	(202, 'fd18fdcc-6c48-11ef-96f2-509a4cb5cc32', 'user202', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 202, '2024-09-06 12:10:23.000000', 202),
	(203, 'fd1a7f29-6c48-11ef-96f2-509a4cb5cc32', 'user203', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 203, '2024-09-06 12:10:23.000000', 203),
	(204, 'fd1c703e-6c48-11ef-96f2-509a4cb5cc32', 'user204', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 204, '2024-09-06 12:10:23.000000', 204),
	(205, 'fd1ddee6-6c48-11ef-96f2-509a4cb5cc32', 'user205', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 205, '2024-09-06 12:10:23.000000', 205),
	(206, 'fd1f275c-6c48-11ef-96f2-509a4cb5cc32', 'user206', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 206, '2024-09-06 12:10:23.000000', 206),
	(207, 'fd209d42-6c48-11ef-96f2-509a4cb5cc32', 'user207', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 207, '2024-09-06 12:10:23.000000', 207),
	(208, 'fd222cdb-6c48-11ef-96f2-509a4cb5cc32', 'user208', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 208, '2024-09-06 12:10:23.000000', 208),
	(209, 'fd23861f-6c48-11ef-96f2-509a4cb5cc32', 'user209', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 209, '2024-09-06 12:10:23.000000', 209),
	(210, 'fd24d72e-6c48-11ef-96f2-509a4cb5cc32', 'user210', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 210, '2024-09-06 12:10:23.000000', 210),
	(211, 'fd263ac4-6c48-11ef-96f2-509a4cb5cc32', 'user211', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 211, '2024-09-06 12:10:23.000000', 211),
	(212, 'fd279de2-6c48-11ef-96f2-509a4cb5cc32', 'user212', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 212, '2024-09-06 12:10:23.000000', 212),
	(213, 'fd28e5f0-6c48-11ef-96f2-509a4cb5cc32', 'user213', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 213, '2024-09-06 12:10:23.000000', 213),
	(214, 'fd2a3121-6c48-11ef-96f2-509a4cb5cc32', 'user214', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 214, '2024-09-06 12:10:23.000000', 214),
	(215, 'fd2b8711-6c48-11ef-96f2-509a4cb5cc32', 'user215', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 215, '2024-09-06 12:10:23.000000', 215),
	(216, 'fd2d22ec-6c48-11ef-96f2-509a4cb5cc32', 'user216', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 216, '2024-09-06 12:10:23.000000', 216),
	(217, 'fd2e8fce-6c48-11ef-96f2-509a4cb5cc32', 'user217', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 217, '2024-09-06 12:10:23.000000', 217),
	(218, 'fd302c8f-6c48-11ef-96f2-509a4cb5cc32', 'user218', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 218, '2024-09-06 12:10:23.000000', 218),
	(219, 'fd3199bd-6c48-11ef-96f2-509a4cb5cc32', 'user219', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 219, '2024-09-06 12:10:23.000000', 219),
	(220, 'fd3308d2-6c48-11ef-96f2-509a4cb5cc32', 'user220', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 220, '2024-09-06 12:10:23.000000', 220),
	(221, 'fd349191-6c48-11ef-96f2-509a4cb5cc32', 'user221', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 221, '2024-09-06 12:10:23.000000', 221),
	(222, 'fd364aa0-6c48-11ef-96f2-509a4cb5cc32', 'user222', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 222, '2024-09-06 12:10:23.000000', 222),
	(223, 'fd37f078-6c48-11ef-96f2-509a4cb5cc32', 'user223', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 223, '2024-09-06 12:10:23.000000', 223),
	(224, 'fd3988ba-6c48-11ef-96f2-509a4cb5cc32', 'user224', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 224, '2024-09-06 12:10:23.000000', 224),
	(225, 'fd3b3323-6c48-11ef-96f2-509a4cb5cc32', 'user225', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 225, '2024-09-06 12:10:23.000000', 225),
	(226, 'fd3cda39-6c48-11ef-96f2-509a4cb5cc32', 'user226', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 226, '2024-09-06 12:10:23.000000', 226),
	(227, 'fd3e6c0b-6c48-11ef-96f2-509a4cb5cc32', 'user227', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 227, '2024-09-06 12:10:23.000000', 227),
	(228, 'fd40045c-6c48-11ef-96f2-509a4cb5cc32', 'user228', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 228, '2024-09-06 12:10:23.000000', 228),
	(229, 'fd4188d3-6c48-11ef-96f2-509a4cb5cc32', 'user229', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 229, '2024-09-06 12:10:23.000000', 229),
	(230, 'fd431bf3-6c48-11ef-96f2-509a4cb5cc32', 'user230', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 230, '2024-09-06 12:10:23.000000', 230),
	(231, 'fd44a3be-6c48-11ef-96f2-509a4cb5cc32', 'user231', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 231, '2024-09-06 12:10:23.000000', 231),
	(232, 'fd4622c8-6c48-11ef-96f2-509a4cb5cc32', 'user232', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 232, '2024-09-06 12:10:23.000000', 232),
	(233, 'fd47c217-6c48-11ef-96f2-509a4cb5cc32', 'user233', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 233, '2024-09-06 12:10:23.000000', 233),
	(234, 'fd4950f2-6c48-11ef-96f2-509a4cb5cc32', 'user234', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 234, '2024-09-06 12:10:23.000000', 234),
	(235, 'fd4b96dd-6c48-11ef-96f2-509a4cb5cc32', 'user235', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 235, '2024-09-06 12:10:23.000000', 235),
	(236, 'fd5085ca-6c48-11ef-96f2-509a4cb5cc32', 'user236', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 236, '2024-09-06 12:10:23.000000', 236),
	(237, 'fd5234e4-6c48-11ef-96f2-509a4cb5cc32', 'user237', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 237, '2024-09-06 12:10:23.000000', 237),
	(238, 'fd54c001-6c48-11ef-96f2-509a4cb5cc32', 'user238', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 238, '2024-09-06 12:10:23.000000', 238),
	(239, 'fd568fd0-6c48-11ef-96f2-509a4cb5cc32', 'user239', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 239, '2024-09-06 12:10:23.000000', 239),
	(240, 'fd585fba-6c48-11ef-96f2-509a4cb5cc32', 'user240', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 240, '2024-09-06 12:10:23.000000', 240),
	(241, 'fd59ec67-6c48-11ef-96f2-509a4cb5cc32', 'user241', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 241, '2024-09-06 12:10:23.000000', 241),
	(242, 'fd5ba9b2-6c48-11ef-96f2-509a4cb5cc32', 'user242', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 242, '2024-09-06 12:10:23.000000', 242),
	(243, 'fd5d0eb4-6c48-11ef-96f2-509a4cb5cc32', 'user243', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 243, '2024-09-06 12:10:23.000000', 243),
	(244, 'fd5e638f-6c48-11ef-96f2-509a4cb5cc32', 'user244', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 244, '2024-09-06 12:10:23.000000', 244),
	(245, 'fd5feb6f-6c48-11ef-96f2-509a4cb5cc32', 'user245', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 245, '2024-09-06 12:10:23.000000', 245),
	(246, 'fd6149fc-6c48-11ef-96f2-509a4cb5cc32', 'user246', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 246, '2024-09-06 12:10:23.000000', 246),
	(247, 'fd62ae4a-6c48-11ef-96f2-509a4cb5cc32', 'user247', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 247, '2024-09-06 12:10:23.000000', 247),
	(248, 'fd6409e8-6c48-11ef-96f2-509a4cb5cc32', 'user248', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 248, '2024-09-06 12:10:23.000000', 248),
	(249, 'fd658ab0-6c48-11ef-96f2-509a4cb5cc32', 'user249', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 249, '2024-09-06 12:10:23.000000', 249),
	(250, 'fd670597-6c48-11ef-96f2-509a4cb5cc32', 'user250', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 250, '2024-09-06 12:10:23.000000', 250),
	(251, 'fd6896eb-6c48-11ef-96f2-509a4cb5cc32', 'user251', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 251, '2024-09-06 12:10:23.000000', 251),
	(252, 'fd6a0aad-6c48-11ef-96f2-509a4cb5cc32', 'user252', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 252, '2024-09-06 12:10:23.000000', 252),
	(253, 'fd6b7de0-6c48-11ef-96f2-509a4cb5cc32', 'user253', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 253, '2024-09-06 12:10:23.000000', 253),
	(254, 'fd6ce4fc-6c48-11ef-96f2-509a4cb5cc32', 'user254', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 254, '2024-09-06 12:10:23.000000', 254),
	(255, 'fd6e56c1-6c48-11ef-96f2-509a4cb5cc32', 'user255', '$2a$10$.AE2AZ6WPeib6PC2q8bP8e5HnQGI.POtq0Qx.4bv4idUf6jG6kz7C', b'0', NULL, '1', 'User', NULL, b'0', '2024-09-06 12:10:23.000000', 255, '2024-09-06 12:10:23.000000', 255);

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
  `is_deleted` bit(1) DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.user_ext: ~0 rows (approximately)
REPLACE INTO `user_ext` (`id`, `guid`, `user_id`, `f_name`, `m_name`, `l_name`, `email`, `addr`, `phone01`, `phone02`, `phone03`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, 'fb716d34-6c48-11ef-96f2-509a4cb5cc32', 1, 'WBC', NULL, 'Admin', 'admin@wbc.com', NULL, '0903.123456', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 1, '2024-09-06 12:10:20', 1),
	(2, 'fb820277-6c48-11ef-96f2-509a4cb5cc32', 2, 'WBC', NULL, 'User002', 'user002@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 2, '2024-09-06 12:10:20', 2),
	(3, 'fb8534d9-6c48-11ef-96f2-509a4cb5cc32', 3, 'WBC', NULL, 'User003', 'user003@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 3, '2024-09-06 12:10:20', 3),
	(4, 'fb877f56-6c48-11ef-96f2-509a4cb5cc32', 4, 'WBC', NULL, 'User004', 'user004@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 4, '2024-09-06 12:10:20', 4),
	(5, 'fb897066-6c48-11ef-96f2-509a4cb5cc32', 5, 'WBC', NULL, 'User005', 'user005@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 5, '2024-09-06 12:10:20', 5),
	(6, 'fb8bd52f-6c48-11ef-96f2-509a4cb5cc32', 6, 'WBC', NULL, 'User006', 'user006@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 6, '2024-09-06 12:10:20', 6),
	(7, 'fb8e0b10-6c48-11ef-96f2-509a4cb5cc32', 7, 'WBC', NULL, 'User007', 'user007@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 7, '2024-09-06 12:10:20', 7),
	(8, 'fb8ff63d-6c48-11ef-96f2-509a4cb5cc32', 8, 'WBC', NULL, 'User008', 'user008@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 8, '2024-09-06 12:10:20', 8),
	(9, 'fb91f977-6c48-11ef-96f2-509a4cb5cc32', 9, 'WBC', NULL, 'User009', 'user009@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 9, '2024-09-06 12:10:20', 9),
	(10, 'fb9474d3-6c48-11ef-96f2-509a4cb5cc32', 10, 'WBC', NULL, 'User010', 'user010@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 10, '2024-09-06 12:10:20', 10),
	(11, 'fb967e51-6c48-11ef-96f2-509a4cb5cc32', 11, 'WBC', NULL, 'User011', 'user011@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 11, '2024-09-06 12:10:20', 11),
	(12, 'fb98fa98-6c48-11ef-96f2-509a4cb5cc32', 12, 'WBC', NULL, 'User012', 'user012@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 12, '2024-09-06 12:10:20', 12),
	(13, 'fb9baaad-6c48-11ef-96f2-509a4cb5cc32', 13, 'WBC', NULL, 'User013', 'user013@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 13, '2024-09-06 12:10:20', 13),
	(14, 'fb9d9ca7-6c48-11ef-96f2-509a4cb5cc32', 14, 'WBC', NULL, 'User014', 'user014@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 14, '2024-09-06 12:10:20', 14),
	(15, 'fb9fb945-6c48-11ef-96f2-509a4cb5cc32', 15, 'WBC', NULL, 'User015', 'user015@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 15, '2024-09-06 12:10:20', 15),
	(16, 'fba1983b-6c48-11ef-96f2-509a4cb5cc32', 16, 'WBC', NULL, 'User016', 'user016@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 16, '2024-09-06 12:10:20', 16),
	(17, 'fba3be6b-6c48-11ef-96f2-509a4cb5cc32', 17, 'WBC', NULL, 'User017', 'user017@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 17, '2024-09-06 12:10:20', 17),
	(18, 'fba8f5a1-6c48-11ef-96f2-509a4cb5cc32', 18, 'WBC', NULL, 'User018', 'user018@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 18, '2024-09-06 12:10:20', 18),
	(19, 'fbab64f7-6c48-11ef-96f2-509a4cb5cc32', 19, 'WBC', NULL, 'User019', 'user019@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 19, '2024-09-06 12:10:20', 19),
	(20, 'fbadce95-6c48-11ef-96f2-509a4cb5cc32', 20, 'WBC', NULL, 'User020', 'user020@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 20, '2024-09-06 12:10:20', 20),
	(21, 'fbafe5f7-6c48-11ef-96f2-509a4cb5cc32', 21, 'WBC', NULL, 'User021', 'user021@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 21, '2024-09-06 12:10:20', 21),
	(22, 'fbb1f2f3-6c48-11ef-96f2-509a4cb5cc32', 22, 'WBC', NULL, 'User022', 'user022@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 22, '2024-09-06 12:10:20', 22),
	(23, 'fbb4df08-6c48-11ef-96f2-509a4cb5cc32', 23, 'WBC', NULL, 'User023', 'user023@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:20', 23, '2024-09-06 12:10:20', 23),
	(24, 'fbb8dfcd-6c48-11ef-96f2-509a4cb5cc32', 24, 'WBC', NULL, 'User024', 'user024@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 24, '2024-09-06 12:10:21', 24),
	(25, 'fbbb6358-6c48-11ef-96f2-509a4cb5cc32', 25, 'WBC', NULL, 'User025', 'user025@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 25, '2024-09-06 12:10:21', 25),
	(26, 'fbbd86b3-6c48-11ef-96f2-509a4cb5cc32', 26, 'WBC', NULL, 'User026', 'user026@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 26, '2024-09-06 12:10:21', 26),
	(27, 'fbbff469-6c48-11ef-96f2-509a4cb5cc32', 27, 'WBC', NULL, 'User027', 'user027@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 27, '2024-09-06 12:10:21', 27),
	(28, 'fbc20100-6c48-11ef-96f2-509a4cb5cc32', 28, 'WBC', NULL, 'User028', 'user028@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 28, '2024-09-06 12:10:21', 28),
	(29, 'fbc44962-6c48-11ef-96f2-509a4cb5cc32', 29, 'WBC', NULL, 'User029', 'user029@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 29, '2024-09-06 12:10:21', 29),
	(30, 'fbc713c3-6c48-11ef-96f2-509a4cb5cc32', 30, 'WBC', NULL, 'User030', 'user030@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 30, '2024-09-06 12:10:21', 30),
	(31, 'fbc9927b-6c48-11ef-96f2-509a4cb5cc32', 31, 'WBC', NULL, 'User031', 'user031@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 31, '2024-09-06 12:10:21', 31),
	(32, 'fbcbbbd8-6c48-11ef-96f2-509a4cb5cc32', 32, 'WBC', NULL, 'User032', 'user032@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 32, '2024-09-06 12:10:21', 32),
	(33, 'fbcda9b7-6c48-11ef-96f2-509a4cb5cc32', 33, 'WBC', NULL, 'User033', 'user033@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 33, '2024-09-06 12:10:21', 33),
	(34, 'fbcfe9ca-6c48-11ef-96f2-509a4cb5cc32', 34, 'WBC', NULL, 'User034', 'user034@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 34, '2024-09-06 12:10:21', 34),
	(35, 'fbd36b93-6c48-11ef-96f2-509a4cb5cc32', 35, 'WBC', NULL, 'User035', 'user035@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 35, '2024-09-06 12:10:21', 35),
	(36, 'fbd59eaf-6c48-11ef-96f2-509a4cb5cc32', 36, 'WBC', NULL, 'User036', 'user036@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 36, '2024-09-06 12:10:21', 36),
	(37, 'fbd7ff8d-6c48-11ef-96f2-509a4cb5cc32', 37, 'WBC', NULL, 'User037', 'user037@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 37, '2024-09-06 12:10:21', 37),
	(38, 'fbd9f730-6c48-11ef-96f2-509a4cb5cc32', 38, 'WBC', NULL, 'User038', 'user038@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 38, '2024-09-06 12:10:21', 38),
	(39, 'fbdc33d2-6c48-11ef-96f2-509a4cb5cc32', 39, 'WBC', NULL, 'User039', 'user039@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 39, '2024-09-06 12:10:21', 39),
	(40, 'fbde0260-6c48-11ef-96f2-509a4cb5cc32', 40, 'WBC', NULL, 'User040', 'user040@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 40, '2024-09-06 12:10:21', 40),
	(41, 'fbdfe22b-6c48-11ef-96f2-509a4cb5cc32', 41, 'WBC', NULL, 'User041', 'user041@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 41, '2024-09-06 12:10:21', 41),
	(42, 'fbe1d8ea-6c48-11ef-96f2-509a4cb5cc32', 42, 'WBC', NULL, 'User042', 'user042@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 42, '2024-09-06 12:10:21', 42),
	(43, 'fbe3f567-6c48-11ef-96f2-509a4cb5cc32', 43, 'WBC', NULL, 'User043', 'user043@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 43, '2024-09-06 12:10:21', 43),
	(44, 'fbe5f1ca-6c48-11ef-96f2-509a4cb5cc32', 44, 'WBC', NULL, 'User044', 'user044@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 44, '2024-09-06 12:10:21', 44),
	(45, 'fbe7e0e8-6c48-11ef-96f2-509a4cb5cc32', 45, 'WBC', NULL, 'User045', 'user045@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 45, '2024-09-06 12:10:21', 45),
	(46, 'fbea522a-6c48-11ef-96f2-509a4cb5cc32', 46, 'WBC', NULL, 'User046', 'user046@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 46, '2024-09-06 12:10:21', 46),
	(47, 'fbf08d62-6c48-11ef-96f2-509a4cb5cc32', 47, 'WBC', NULL, 'User047', 'user047@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 47, '2024-09-06 12:10:21', 47),
	(48, 'fbf53a51-6c48-11ef-96f2-509a4cb5cc32', 48, 'WBC', NULL, 'User048', 'user048@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 48, '2024-09-06 12:10:21', 48),
	(49, 'fbf81c24-6c48-11ef-96f2-509a4cb5cc32', 49, 'WBC', NULL, 'User049', 'user049@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 49, '2024-09-06 12:10:21', 49),
	(50, 'fbfb1f6f-6c48-11ef-96f2-509a4cb5cc32', 50, 'WBC', NULL, 'User050', 'user050@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 50, '2024-09-06 12:10:21', 50),
	(51, 'fbfdb527-6c48-11ef-96f2-509a4cb5cc32', 51, 'WBC', NULL, 'User051', 'user051@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 51, '2024-09-06 12:10:21', 51),
	(52, 'fc0088c7-6c48-11ef-96f2-509a4cb5cc32', 52, 'WBC', NULL, 'User052', 'user052@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 52, '2024-09-06 12:10:21', 52),
	(53, 'fc02498d-6c48-11ef-96f2-509a4cb5cc32', 53, 'WBC', NULL, 'User053', 'user053@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 53, '2024-09-06 12:10:21', 53),
	(54, 'fc03dee1-6c48-11ef-96f2-509a4cb5cc32', 54, 'WBC', NULL, 'User054', 'user054@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 54, '2024-09-06 12:10:21', 54),
	(55, 'fc055658-6c48-11ef-96f2-509a4cb5cc32', 55, 'WBC', NULL, 'User055', 'user055@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 55, '2024-09-06 12:10:21', 55),
	(56, 'fc06cee5-6c48-11ef-96f2-509a4cb5cc32', 56, 'WBC', NULL, 'User056', 'user056@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 56, '2024-09-06 12:10:21', 56),
	(57, 'fc0863ea-6c48-11ef-96f2-509a4cb5cc32', 57, 'WBC', NULL, 'User057', 'user057@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 57, '2024-09-06 12:10:21', 57),
	(58, 'fc09d582-6c48-11ef-96f2-509a4cb5cc32', 58, 'WBC', NULL, 'User058', 'user058@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 58, '2024-09-06 12:10:21', 58),
	(59, 'fc0ba682-6c48-11ef-96f2-509a4cb5cc32', 59, 'WBC', NULL, 'User059', 'user059@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 59, '2024-09-06 12:10:21', 59),
	(60, 'fc0d6ed4-6c48-11ef-96f2-509a4cb5cc32', 60, 'WBC', NULL, 'User060', 'user060@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 60, '2024-09-06 12:10:21', 60),
	(61, 'fc0f5a67-6c48-11ef-96f2-509a4cb5cc32', 61, 'WBC', NULL, 'User061', 'user061@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 61, '2024-09-06 12:10:21', 61),
	(62, 'fc1183e0-6c48-11ef-96f2-509a4cb5cc32', 62, 'WBC', NULL, 'User062', 'user062@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 62, '2024-09-06 12:10:21', 62),
	(63, 'fc14e508-6c48-11ef-96f2-509a4cb5cc32', 63, 'WBC', NULL, 'User063', 'user063@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 63, '2024-09-06 12:10:21', 63),
	(64, 'fc1b386d-6c48-11ef-96f2-509a4cb5cc32', 64, 'WBC', NULL, 'User064', 'user064@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 64, '2024-09-06 12:10:21', 64),
	(65, 'fc1d42c0-6c48-11ef-96f2-509a4cb5cc32', 65, 'WBC', NULL, 'User065', 'user065@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 65, '2024-09-06 12:10:21', 65),
	(66, 'fc1f0046-6c48-11ef-96f2-509a4cb5cc32', 66, 'WBC', NULL, 'User066', 'user066@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 66, '2024-09-06 12:10:21', 66),
	(67, 'fc20b989-6c48-11ef-96f2-509a4cb5cc32', 67, 'WBC', NULL, 'User067', 'user067@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 67, '2024-09-06 12:10:21', 67),
	(68, 'fc226931-6c48-11ef-96f2-509a4cb5cc32', 68, 'WBC', NULL, 'User068', 'user068@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 68, '2024-09-06 12:10:21', 68),
	(69, 'fc24101e-6c48-11ef-96f2-509a4cb5cc32', 69, 'WBC', NULL, 'User069', 'user069@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 69, '2024-09-06 12:10:21', 69),
	(70, 'fc25a71f-6c48-11ef-96f2-509a4cb5cc32', 70, 'WBC', NULL, 'User070', 'user070@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 70, '2024-09-06 12:10:21', 70),
	(71, 'fc272415-6c48-11ef-96f2-509a4cb5cc32', 71, 'WBC', NULL, 'User071', 'user071@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 71, '2024-09-06 12:10:21', 71),
	(72, 'fc288b34-6c48-11ef-96f2-509a4cb5cc32', 72, 'WBC', NULL, 'User072', 'user072@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 72, '2024-09-06 12:10:21', 72),
	(73, 'fc29ef06-6c48-11ef-96f2-509a4cb5cc32', 73, 'WBC', NULL, 'User073', 'user073@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 73, '2024-09-06 12:10:21', 73),
	(74, 'fc2b47ce-6c48-11ef-96f2-509a4cb5cc32', 74, 'WBC', NULL, 'User074', 'user074@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 74, '2024-09-06 12:10:21', 74),
	(75, 'fc2d3152-6c48-11ef-96f2-509a4cb5cc32', 75, 'WBC', NULL, 'User075', 'user075@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 75, '2024-09-06 12:10:21', 75),
	(76, 'fc30e29a-6c48-11ef-96f2-509a4cb5cc32', 76, 'WBC', NULL, 'User076', 'user076@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 76, '2024-09-06 12:10:21', 76),
	(77, 'fc353232-6c48-11ef-96f2-509a4cb5cc32', 77, 'WBC', NULL, 'User077', 'user077@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 77, '2024-09-06 12:10:21', 77),
	(78, 'fc383e96-6c48-11ef-96f2-509a4cb5cc32', 78, 'WBC', NULL, 'User078', 'user078@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 78, '2024-09-06 12:10:21', 78),
	(79, 'fc3a28e4-6c48-11ef-96f2-509a4cb5cc32', 79, 'WBC', NULL, 'User079', 'user079@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 79, '2024-09-06 12:10:21', 79),
	(80, 'fc3c7539-6c48-11ef-96f2-509a4cb5cc32', 80, 'WBC', NULL, 'User080', 'user080@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 80, '2024-09-06 12:10:21', 80),
	(81, 'fc3e6682-6c48-11ef-96f2-509a4cb5cc32', 81, 'WBC', NULL, 'User081', 'user081@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 81, '2024-09-06 12:10:21', 81),
	(82, 'fc423eb9-6c48-11ef-96f2-509a4cb5cc32', 82, 'WBC', NULL, 'User082', 'user082@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 82, '2024-09-06 12:10:21', 82),
	(83, 'fc44109e-6c48-11ef-96f2-509a4cb5cc32', 83, 'WBC', NULL, 'User083', 'user083@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 83, '2024-09-06 12:10:21', 83),
	(84, 'fc45f8a6-6c48-11ef-96f2-509a4cb5cc32', 84, 'WBC', NULL, 'User084', 'user084@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 84, '2024-09-06 12:10:21', 84),
	(85, 'fc47ad11-6c48-11ef-96f2-509a4cb5cc32', 85, 'WBC', NULL, 'User085', 'user085@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 85, '2024-09-06 12:10:21', 85),
	(86, 'fc499b88-6c48-11ef-96f2-509a4cb5cc32', 86, 'WBC', NULL, 'User086', 'user086@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 86, '2024-09-06 12:10:21', 86),
	(87, 'fc4b1565-6c48-11ef-96f2-509a4cb5cc32', 87, 'WBC', NULL, 'User087', 'user087@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 87, '2024-09-06 12:10:21', 87),
	(88, 'fc4ca07d-6c48-11ef-96f2-509a4cb5cc32', 88, 'WBC', NULL, 'User088', 'user088@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 88, '2024-09-06 12:10:21', 88),
	(89, 'fc4eb8c5-6c48-11ef-96f2-509a4cb5cc32', 89, 'WBC', NULL, 'User089', 'user089@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:21', 89, '2024-09-06 12:10:21', 89),
	(90, 'fc50c954-6c48-11ef-96f2-509a4cb5cc32', 90, 'WBC', NULL, 'User090', 'user090@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 90, '2024-09-06 12:10:22', 90),
	(91, 'fc5281b3-6c48-11ef-96f2-509a4cb5cc32', 91, 'WBC', NULL, 'User091', 'user091@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 91, '2024-09-06 12:10:22', 91),
	(92, 'fc5442ae-6c48-11ef-96f2-509a4cb5cc32', 92, 'WBC', NULL, 'User092', 'user092@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 92, '2024-09-06 12:10:22', 92),
	(93, 'fc568d72-6c48-11ef-96f2-509a4cb5cc32', 93, 'WBC', NULL, 'User093', 'user093@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 93, '2024-09-06 12:10:22', 93),
	(94, 'fc5935f4-6c48-11ef-96f2-509a4cb5cc32', 94, 'WBC', NULL, 'User094', 'user094@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 94, '2024-09-06 12:10:22', 94),
	(95, 'fc5bc0cc-6c48-11ef-96f2-509a4cb5cc32', 95, 'WBC', NULL, 'User095', 'user095@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 95, '2024-09-06 12:10:22', 95),
	(96, 'fc5dcefc-6c48-11ef-96f2-509a4cb5cc32', 96, 'WBC', NULL, 'User096', 'user096@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 96, '2024-09-06 12:10:22', 96),
	(97, 'fc5f9305-6c48-11ef-96f2-509a4cb5cc32', 97, 'WBC', NULL, 'User097', 'user097@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 97, '2024-09-06 12:10:22', 97),
	(98, 'fc61408b-6c48-11ef-96f2-509a4cb5cc32', 98, 'WBC', NULL, 'User098', 'user098@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 98, '2024-09-06 12:10:22', 98),
	(99, 'fc62cdf2-6c48-11ef-96f2-509a4cb5cc32', 99, 'WBC', NULL, 'User99', 'user99@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 99, '2024-09-06 12:10:22', 99),
	(100, 'fc64e796-6c48-11ef-96f2-509a4cb5cc32', 100, 'WBC', NULL, 'User100', 'user100@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 100, '2024-09-06 12:10:22', 100),
	(101, 'fc6698bc-6c48-11ef-96f2-509a4cb5cc32', 101, 'WBC', NULL, 'User101', 'user101@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 101, '2024-09-06 12:10:22', 101),
	(102, 'fc688a4a-6c48-11ef-96f2-509a4cb5cc32', 102, 'WBC', NULL, 'User102', 'user102@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 102, '2024-09-06 12:10:22', 102),
	(103, 'fc6b6f99-6c48-11ef-96f2-509a4cb5cc32', 103, 'WBC', NULL, 'User103', 'user103@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 103, '2024-09-06 12:10:22', 103),
	(104, 'fc6d3be7-6c48-11ef-96f2-509a4cb5cc32', 104, 'WBC', NULL, 'User104', 'user104@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 104, '2024-09-06 12:10:22', 104),
	(105, 'fc6eeaaf-6c48-11ef-96f2-509a4cb5cc32', 105, 'WBC', NULL, 'User105', 'user105@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 105, '2024-09-06 12:10:22', 105),
	(106, 'fc709f25-6c48-11ef-96f2-509a4cb5cc32', 106, 'WBC', NULL, 'User106', 'user106@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 106, '2024-09-06 12:10:22', 106),
	(107, 'fc7276ac-6c48-11ef-96f2-509a4cb5cc32', 107, 'WBC', NULL, 'User107', 'user107@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 107, '2024-09-06 12:10:22', 107),
	(108, 'fc7445bc-6c48-11ef-96f2-509a4cb5cc32', 108, 'WBC', NULL, 'User108', 'user108@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 108, '2024-09-06 12:10:22', 108),
	(109, 'fc75efd6-6c48-11ef-96f2-509a4cb5cc32', 109, 'WBC', NULL, 'User109', 'user109@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 109, '2024-09-06 12:10:22', 109),
	(110, 'fc7780f7-6c48-11ef-96f2-509a4cb5cc32', 110, 'WBC', NULL, 'User110', 'user110@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 110, '2024-09-06 12:10:22', 110),
	(111, 'fc79572e-6c48-11ef-96f2-509a4cb5cc32', 111, 'WBC', NULL, 'User111', 'user111@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 111, '2024-09-06 12:10:22', 111),
	(112, 'fc7ae869-6c48-11ef-96f2-509a4cb5cc32', 112, 'WBC', NULL, 'User112', 'user112@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 112, '2024-09-06 12:10:22', 112),
	(113, 'fc7c6b8e-6c48-11ef-96f2-509a4cb5cc32', 113, 'WBC', NULL, 'User113', 'user113@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 113, '2024-09-06 12:10:22', 113),
	(114, 'fc7dfe9d-6c48-11ef-96f2-509a4cb5cc32', 114, 'WBC', NULL, 'User114', 'user114@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 114, '2024-09-06 12:10:22', 114),
	(115, 'fc7f67d8-6c48-11ef-96f2-509a4cb5cc32', 115, 'WBC', NULL, 'User115', 'user115@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 115, '2024-09-06 12:10:22', 115),
	(116, 'fc80c32e-6c48-11ef-96f2-509a4cb5cc32', 116, 'WBC', NULL, 'User116', 'user116@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 116, '2024-09-06 12:10:22', 116),
	(117, 'fc8231e6-6c48-11ef-96f2-509a4cb5cc32', 117, 'WBC', NULL, 'User117', 'user117@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 117, '2024-09-06 12:10:22', 117),
	(118, 'fc8388d7-6c48-11ef-96f2-509a4cb5cc32', 118, 'WBC', NULL, 'User118', 'user118@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 118, '2024-09-06 12:10:22', 118),
	(119, 'fc84f084-6c48-11ef-96f2-509a4cb5cc32', 119, 'WBC', NULL, 'User119', 'user119@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 119, '2024-09-06 12:10:22', 119),
	(120, 'fc865444-6c48-11ef-96f2-509a4cb5cc32', 120, 'WBC', NULL, 'User120', 'user120@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 120, '2024-09-06 12:10:22', 120),
	(121, 'fc87bdb6-6c48-11ef-96f2-509a4cb5cc32', 121, 'WBC', NULL, 'User121', 'user121@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 121, '2024-09-06 12:10:22', 121),
	(122, 'fc890c6e-6c48-11ef-96f2-509a4cb5cc32', 122, 'WBC', NULL, 'User122', 'user122@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 122, '2024-09-06 12:10:22', 122),
	(123, 'fc8abcfb-6c48-11ef-96f2-509a4cb5cc32', 123, 'WBC', NULL, 'User123', 'user123@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 123, '2024-09-06 12:10:22', 123),
	(124, 'fc8c845a-6c48-11ef-96f2-509a4cb5cc32', 124, 'WBC', NULL, 'User124', 'user124@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 124, '2024-09-06 12:10:22', 124),
	(125, 'fc8e306f-6c48-11ef-96f2-509a4cb5cc32', 125, 'WBC', NULL, 'User125', 'user125@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 125, '2024-09-06 12:10:22', 125),
	(126, 'fc9006a9-6c48-11ef-96f2-509a4cb5cc32', 126, 'WBC', NULL, 'User126', 'user126@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 126, '2024-09-06 12:10:22', 126),
	(127, 'fc91dc31-6c48-11ef-96f2-509a4cb5cc32', 127, 'WBC', NULL, 'User127', 'user127@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 127, '2024-09-06 12:10:22', 127),
	(128, 'fc93e34d-6c48-11ef-96f2-509a4cb5cc32', 128, 'WBC', NULL, 'User128', 'user128@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 128, '2024-09-06 12:10:22', 128),
	(129, 'fc967850-6c48-11ef-96f2-509a4cb5cc32', 129, 'WBC', NULL, 'User129', 'user129@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 129, '2024-09-06 12:10:22', 129),
	(130, 'fc9867fc-6c48-11ef-96f2-509a4cb5cc32', 130, 'WBC', NULL, 'User130', 'user130@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 130, '2024-09-06 12:10:22', 130),
	(131, 'fc9a2aad-6c48-11ef-96f2-509a4cb5cc32', 131, 'WBC', NULL, 'User131', 'user131@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 131, '2024-09-06 12:10:22', 131),
	(132, 'fc9d86f3-6c48-11ef-96f2-509a4cb5cc32', 132, 'WBC', NULL, 'User132', 'user132@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 132, '2024-09-06 12:10:22', 132),
	(133, 'fc9f1fa0-6c48-11ef-96f2-509a4cb5cc32', 133, 'WBC', NULL, 'User133', 'user133@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 133, '2024-09-06 12:10:22', 133),
	(134, 'fca0c258-6c48-11ef-96f2-509a4cb5cc32', 134, 'WBC', NULL, 'User134', 'user134@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 134, '2024-09-06 12:10:22', 134),
	(135, 'fca230a3-6c48-11ef-96f2-509a4cb5cc32', 135, 'WBC', NULL, 'User135', 'user135@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 135, '2024-09-06 12:10:22', 135),
	(136, 'fca3896b-6c48-11ef-96f2-509a4cb5cc32', 136, 'WBC', NULL, 'User136', 'user136@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 136, '2024-09-06 12:10:22', 136),
	(137, 'fca4e7b2-6c48-11ef-96f2-509a4cb5cc32', 137, 'WBC', NULL, 'User137', 'user137@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 137, '2024-09-06 12:10:22', 137),
	(138, 'fca6452c-6c48-11ef-96f2-509a4cb5cc32', 138, 'WBC', NULL, 'User138', 'user138@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 138, '2024-09-06 12:10:22', 138),
	(139, 'fca79d78-6c48-11ef-96f2-509a4cb5cc32', 139, 'WBC', NULL, 'User139', 'user139@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 139, '2024-09-06 12:10:22', 139),
	(140, 'fca90d51-6c48-11ef-96f2-509a4cb5cc32', 140, 'WBC', NULL, 'User140', 'user140@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 140, '2024-09-06 12:10:22', 140),
	(141, 'fcaa5f0a-6c48-11ef-96f2-509a4cb5cc32', 141, 'WBC', NULL, 'User141', 'user141@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 141, '2024-09-06 12:10:22', 141),
	(142, 'fcaba094-6c48-11ef-96f2-509a4cb5cc32', 142, 'WBC', NULL, 'User142', 'user142@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 142, '2024-09-06 12:10:22', 142),
	(143, 'fcad18d1-6c48-11ef-96f2-509a4cb5cc32', 143, 'WBC', NULL, 'User143', 'user143@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 143, '2024-09-06 12:10:22', 143),
	(144, 'fcaf0e6a-6c48-11ef-96f2-509a4cb5cc32', 144, 'WBC', NULL, 'User144', 'user144@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 144, '2024-09-06 12:10:22', 144),
	(145, 'fcb0ea25-6c48-11ef-96f2-509a4cb5cc32', 145, 'WBC', NULL, 'User145', 'user145@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 145, '2024-09-06 12:10:22', 145),
	(146, 'fcb299a1-6c48-11ef-96f2-509a4cb5cc32', 146, 'WBC', NULL, 'User146', 'user146@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 146, '2024-09-06 12:10:22', 146),
	(147, 'fcb44ac7-6c48-11ef-96f2-509a4cb5cc32', 147, 'WBC', NULL, 'User147', 'user147@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 147, '2024-09-06 12:10:22', 147),
	(148, 'fcb5cc17-6c48-11ef-96f2-509a4cb5cc32', 148, 'WBC', NULL, 'User148', 'user148@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 148, '2024-09-06 12:10:22', 148),
	(149, 'fcb72543-6c48-11ef-96f2-509a4cb5cc32', 149, 'WBC', NULL, 'User149', 'user149@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 149, '2024-09-06 12:10:22', 149),
	(150, 'fcb8e0ee-6c48-11ef-96f2-509a4cb5cc32', 150, 'WBC', NULL, 'User150', 'user150@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 150, '2024-09-06 12:10:22', 150),
	(151, 'fcbaae34-6c48-11ef-96f2-509a4cb5cc32', 151, 'WBC', NULL, 'User151', 'user151@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 151, '2024-09-06 12:10:22', 151),
	(152, 'fcbc1984-6c48-11ef-96f2-509a4cb5cc32', 152, 'WBC', NULL, 'User152', 'user152@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 152, '2024-09-06 12:10:22', 152),
	(153, 'fcbdca64-6c48-11ef-96f2-509a4cb5cc32', 153, 'WBC', NULL, 'User153', 'user153@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 153, '2024-09-06 12:10:22', 153),
	(154, 'fcbf5628-6c48-11ef-96f2-509a4cb5cc32', 154, 'WBC', NULL, 'User154', 'user154@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 154, '2024-09-06 12:10:22', 154),
	(155, 'fcc0eb98-6c48-11ef-96f2-509a4cb5cc32', 155, 'WBC', NULL, 'User155', 'user155@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 155, '2024-09-06 12:10:22', 155),
	(156, 'fcc2a0bb-6c48-11ef-96f2-509a4cb5cc32', 156, 'WBC', NULL, 'User156', 'user156@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 156, '2024-09-06 12:10:22', 156),
	(157, 'fcc46501-6c48-11ef-96f2-509a4cb5cc32', 157, 'WBC', NULL, 'User157', 'user157@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 157, '2024-09-06 12:10:22', 157),
	(158, 'fcc615c7-6c48-11ef-96f2-509a4cb5cc32', 158, 'WBC', NULL, 'User158', 'user158@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 158, '2024-09-06 12:10:22', 158),
	(159, 'fcc7e832-6c48-11ef-96f2-509a4cb5cc32', 159, 'WBC', NULL, 'User159', 'user159@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 159, '2024-09-06 12:10:22', 159),
	(160, 'fcc9924c-6c48-11ef-96f2-509a4cb5cc32', 160, 'WBC', NULL, 'User160', 'user160@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 160, '2024-09-06 12:10:22', 160),
	(161, 'fccb54ea-6c48-11ef-96f2-509a4cb5cc32', 161, 'WBC', NULL, 'User161', 'user161@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 161, '2024-09-06 12:10:22', 161),
	(162, 'fcd1f648-6c48-11ef-96f2-509a4cb5cc32', 162, 'WBC', NULL, 'User162', 'user162@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 162, '2024-09-06 12:10:22', 162),
	(163, 'fcd3ca66-6c48-11ef-96f2-509a4cb5cc32', 163, 'WBC', NULL, 'User163', 'user163@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 163, '2024-09-06 12:10:22', 163),
	(164, 'fcd647bc-6c48-11ef-96f2-509a4cb5cc32', 164, 'WBC', NULL, 'User164', 'user164@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 164, '2024-09-06 12:10:22', 164),
	(165, 'fcd83c9b-6c48-11ef-96f2-509a4cb5cc32', 165, 'WBC', NULL, 'User165', 'user165@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 165, '2024-09-06 12:10:22', 165),
	(166, 'fcd9cd11-6c48-11ef-96f2-509a4cb5cc32', 166, 'WBC', NULL, 'User166', 'user166@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 166, '2024-09-06 12:10:22', 166),
	(167, 'fcdd25fc-6c48-11ef-96f2-509a4cb5cc32', 167, 'WBC', NULL, 'User167', 'user167@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 167, '2024-09-06 12:10:22', 167),
	(168, 'fcdef263-6c48-11ef-96f2-509a4cb5cc32', 168, 'WBC', NULL, 'User168', 'user168@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 168, '2024-09-06 12:10:22', 168),
	(169, 'fce08e0d-6c48-11ef-96f2-509a4cb5cc32', 169, 'WBC', NULL, 'User169', 'user169@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 169, '2024-09-06 12:10:22', 169),
	(170, 'fce1fce9-6c48-11ef-96f2-509a4cb5cc32', 170, 'WBC', NULL, 'User170', 'user170@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 170, '2024-09-06 12:10:22', 170),
	(171, 'fce35b54-6c48-11ef-96f2-509a4cb5cc32', 171, 'WBC', NULL, 'User171', 'user171@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 171, '2024-09-06 12:10:22', 171),
	(172, 'fce4c75c-6c48-11ef-96f2-509a4cb5cc32', 172, 'WBC', NULL, 'User172', 'user172@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 172, '2024-09-06 12:10:22', 172),
	(173, 'fce66963-6c48-11ef-96f2-509a4cb5cc32', 173, 'WBC', NULL, 'User173', 'user173@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 173, '2024-09-06 12:10:22', 173),
	(174, 'fce805f2-6c48-11ef-96f2-509a4cb5cc32', 174, 'WBC', NULL, 'User174', 'user174@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:22', 174, '2024-09-06 12:10:22', 174),
	(175, 'fce99a14-6c48-11ef-96f2-509a4cb5cc32', 175, 'WBC', NULL, 'User175', 'user175@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 175, '2024-09-06 12:10:23', 175),
	(176, 'fceb4920-6c48-11ef-96f2-509a4cb5cc32', 176, 'WBC', NULL, 'User176', 'user176@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 176, '2024-09-06 12:10:23', 176),
	(177, 'fcecee42-6c48-11ef-96f2-509a4cb5cc32', 177, 'WBC', NULL, 'User177', 'user177@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 177, '2024-09-06 12:10:23', 177),
	(178, 'fcef58dc-6c48-11ef-96f2-509a4cb5cc32', 178, 'WBC', NULL, 'User178', 'user178@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 178, '2024-09-06 12:10:23', 178),
	(179, 'fcf151e3-6c48-11ef-96f2-509a4cb5cc32', 179, 'WBC', NULL, 'User179', 'user179@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 179, '2024-09-06 12:10:23', 179),
	(180, 'fcf301cd-6c48-11ef-96f2-509a4cb5cc32', 180, 'WBC', NULL, 'User180', 'user180@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 180, '2024-09-06 12:10:23', 180),
	(181, 'fcf4850d-6c48-11ef-96f2-509a4cb5cc32', 181, 'WBC', NULL, 'User181', 'user181@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 181, '2024-09-06 12:10:23', 181),
	(182, 'fcf6793f-6c48-11ef-96f2-509a4cb5cc32', 182, 'WBC', NULL, 'User182', 'user182@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 182, '2024-09-06 12:10:23', 182),
	(183, 'fcf8962d-6c48-11ef-96f2-509a4cb5cc32', 183, 'WBC', NULL, 'User183', 'user183@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 183, '2024-09-06 12:10:23', 183),
	(184, 'fcfa4882-6c48-11ef-96f2-509a4cb5cc32', 184, 'WBC', NULL, 'User184', 'user184@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 184, '2024-09-06 12:10:23', 184),
	(185, 'fcfc2c2e-6c48-11ef-96f2-509a4cb5cc32', 185, 'WBC', NULL, 'User185', 'user185@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 185, '2024-09-06 12:10:23', 185),
	(186, 'fcfdd8ea-6c48-11ef-96f2-509a4cb5cc32', 186, 'WBC', NULL, 'User186', 'user186@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 186, '2024-09-06 12:10:23', 186),
	(187, 'fcffc4db-6c48-11ef-96f2-509a4cb5cc32', 187, 'WBC', NULL, 'User187', 'user187@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 187, '2024-09-06 12:10:23', 187),
	(188, 'fd0174f3-6c48-11ef-96f2-509a4cb5cc32', 188, 'WBC', NULL, 'User188', 'user188@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 188, '2024-09-06 12:10:23', 188),
	(189, 'fd033ed7-6c48-11ef-96f2-509a4cb5cc32', 189, 'WBC', NULL, 'User189', 'user189@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 189, '2024-09-06 12:10:23', 189),
	(190, 'fd04d8eb-6c48-11ef-96f2-509a4cb5cc32', 190, 'WBC', NULL, 'User190', 'user190@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 190, '2024-09-06 12:10:23', 190),
	(191, 'fd067628-6c48-11ef-96f2-509a4cb5cc32', 191, 'WBC', NULL, 'User191', 'user191@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 191, '2024-09-06 12:10:23', 191),
	(192, 'fd081f8f-6c48-11ef-96f2-509a4cb5cc32', 192, 'WBC', NULL, 'User192', 'user192@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 192, '2024-09-06 12:10:23', 192),
	(193, 'fd09cbfb-6c48-11ef-96f2-509a4cb5cc32', 193, 'WBC', NULL, 'User193', 'user193@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 193, '2024-09-06 12:10:23', 193),
	(194, 'fd0b68b8-6c48-11ef-96f2-509a4cb5cc32', 194, 'WBC', NULL, 'User194', 'user194@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 194, '2024-09-06 12:10:23', 194),
	(195, 'fd0ceb5d-6c48-11ef-96f2-509a4cb5cc32', 195, 'WBC', NULL, 'User195', 'user195@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 195, '2024-09-06 12:10:23', 195),
	(196, 'fd0ecb08-6c48-11ef-96f2-509a4cb5cc32', 196, 'WBC', NULL, 'User196', 'user196@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 196, '2024-09-06 12:10:23', 196),
	(197, 'fd107140-6c48-11ef-96f2-509a4cb5cc32', 197, 'WBC', NULL, 'User197', 'user197@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 197, '2024-09-06 12:10:23', 197),
	(198, 'fd121cc5-6c48-11ef-96f2-509a4cb5cc32', 198, 'WBC', NULL, 'User198', 'user198@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 198, '2024-09-06 12:10:23', 198),
	(199, 'fd13dfed-6c48-11ef-96f2-509a4cb5cc32', 199, 'WBC', NULL, 'User199', 'user199@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 199, '2024-09-06 12:10:23', 199),
	(200, 'fd155dde-6c48-11ef-96f2-509a4cb5cc32', 200, 'WBC', NULL, 'User200', 'user200@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 200, '2024-09-06 12:10:23', 200),
	(201, 'fd16eab7-6c48-11ef-96f2-509a4cb5cc32', 201, 'WBC', NULL, 'User201', 'user201@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 201, '2024-09-06 12:10:23', 201),
	(202, 'fd19606c-6c48-11ef-96f2-509a4cb5cc32', 202, 'WBC', NULL, 'User202', 'user202@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 202, '2024-09-06 12:10:23', 202),
	(203, 'fd1b100c-6c48-11ef-96f2-509a4cb5cc32', 203, 'WBC', NULL, 'User203', 'user203@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 203, '2024-09-06 12:10:23', 203),
	(204, 'fd1cd110-6c48-11ef-96f2-509a4cb5cc32', 204, 'WBC', NULL, 'User204', 'user204@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 204, '2024-09-06 12:10:23', 204),
	(205, 'fd1e3461-6c48-11ef-96f2-509a4cb5cc32', 205, 'WBC', NULL, 'User205', 'user205@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 205, '2024-09-06 12:10:23', 205),
	(206, 'fd1f835f-6c48-11ef-96f2-509a4cb5cc32', 206, 'WBC', NULL, 'User206', 'user206@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 206, '2024-09-06 12:10:23', 206),
	(207, 'fd210944-6c48-11ef-96f2-509a4cb5cc32', 207, 'WBC', NULL, 'User207', 'user207@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 207, '2024-09-06 12:10:23', 207),
	(208, 'fd229b34-6c48-11ef-96f2-509a4cb5cc32', 208, 'WBC', NULL, 'User208', 'user208@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 208, '2024-09-06 12:10:23', 208),
	(209, 'fd23e7c3-6c48-11ef-96f2-509a4cb5cc32', 209, 'WBC', NULL, 'User209', 'user209@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 209, '2024-09-06 12:10:23', 209),
	(210, 'fd253404-6c48-11ef-96f2-509a4cb5cc32', 210, 'WBC', NULL, 'User210', 'user210@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 210, '2024-09-06 12:10:23', 210),
	(211, 'fd269371-6c48-11ef-96f2-509a4cb5cc32', 211, 'WBC', NULL, 'User211', 'user211@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 211, '2024-09-06 12:10:23', 211),
	(212, 'fd280117-6c48-11ef-96f2-509a4cb5cc32', 212, 'WBC', NULL, 'User212', 'user212@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 212, '2024-09-06 12:10:23', 212),
	(213, 'fd2945f3-6c48-11ef-96f2-509a4cb5cc32', 213, 'WBC', NULL, 'User213', 'user213@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 213, '2024-09-06 12:10:23', 213),
	(214, 'fd2a89da-6c48-11ef-96f2-509a4cb5cc32', 214, 'WBC', NULL, 'User214', 'user214@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 214, '2024-09-06 12:10:23', 214),
	(215, 'fd2be310-6c48-11ef-96f2-509a4cb5cc32', 215, 'WBC', NULL, 'User215', 'user215@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 215, '2024-09-06 12:10:23', 215),
	(216, 'fd2d8ed9-6c48-11ef-96f2-509a4cb5cc32', 216, 'WBC', NULL, 'User216', 'user216@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 216, '2024-09-06 12:10:23', 216),
	(217, 'fd2ef415-6c48-11ef-96f2-509a4cb5cc32', 217, 'WBC', NULL, 'User217', 'user217@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 217, '2024-09-06 12:10:23', 217),
	(218, 'fd309bee-6c48-11ef-96f2-509a4cb5cc32', 218, 'WBC', NULL, 'User218', 'user218@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 218, '2024-09-06 12:10:23', 218),
	(219, 'fd32007c-6c48-11ef-96f2-509a4cb5cc32', 219, 'WBC', NULL, 'User219', 'user219@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 219, '2024-09-06 12:10:23', 219),
	(220, 'fd336dc5-6c48-11ef-96f2-509a4cb5cc32', 220, 'WBC', NULL, 'User220', 'user220@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 220, '2024-09-06 12:10:23', 220),
	(221, 'fd35031b-6c48-11ef-96f2-509a4cb5cc32', 221, 'WBC', NULL, 'User221', 'user221@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 221, '2024-09-06 12:10:23', 221),
	(222, 'fd36bf94-6c48-11ef-96f2-509a4cb5cc32', 222, 'WBC', NULL, 'User222', 'user222@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 222, '2024-09-06 12:10:23', 222),
	(223, 'fd3857ef-6c48-11ef-96f2-509a4cb5cc32', 223, 'WBC', NULL, 'User223', 'user223@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 223, '2024-09-06 12:10:23', 223),
	(224, 'fd3a0b7a-6c48-11ef-96f2-509a4cb5cc32', 224, 'WBC', NULL, 'User224', 'user224@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 224, '2024-09-06 12:10:23', 224),
	(225, 'fd3b9949-6c48-11ef-96f2-509a4cb5cc32', 225, 'WBC', NULL, 'User225', 'user225@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 225, '2024-09-06 12:10:23', 225),
	(226, 'fd3d3dbf-6c48-11ef-96f2-509a4cb5cc32', 226, 'WBC', NULL, 'User226', 'user226@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 226, '2024-09-06 12:10:23', 226),
	(227, 'fd3ed61b-6c48-11ef-96f2-509a4cb5cc32', 227, 'WBC', NULL, 'User227', 'user227@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 227, '2024-09-06 12:10:23', 227),
	(228, 'fd40616f-6c48-11ef-96f2-509a4cb5cc32', 228, 'WBC', NULL, 'User228', 'user228@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 228, '2024-09-06 12:10:23', 228),
	(229, 'fd41eaeb-6c48-11ef-96f2-509a4cb5cc32', 229, 'WBC', NULL, 'User229', 'user229@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 229, '2024-09-06 12:10:23', 229),
	(230, 'fd437da0-6c48-11ef-96f2-509a4cb5cc32', 230, 'WBC', NULL, 'User230', 'user230@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 230, '2024-09-06 12:10:23', 230),
	(231, 'fd45028e-6c48-11ef-96f2-509a4cb5cc32', 231, 'WBC', NULL, 'User231', 'user231@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 231, '2024-09-06 12:10:23', 231),
	(232, 'fd4686aa-6c48-11ef-96f2-509a4cb5cc32', 232, 'WBC', NULL, 'User232', 'user232@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 232, '2024-09-06 12:10:23', 232),
	(233, 'fd48233c-6c48-11ef-96f2-509a4cb5cc32', 233, 'WBC', NULL, 'User233', 'user233@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 233, '2024-09-06 12:10:23', 233),
	(234, 'fd49b2f3-6c48-11ef-96f2-509a4cb5cc32', 234, 'WBC', NULL, 'User234', 'user234@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 234, '2024-09-06 12:10:23', 234),
	(235, 'fd4cd438-6c48-11ef-96f2-509a4cb5cc32', 235, 'WBC', NULL, 'User235', 'user235@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 235, '2024-09-06 12:10:23', 235),
	(236, 'fd50f398-6c48-11ef-96f2-509a4cb5cc32', 236, 'WBC', NULL, 'User236', 'user236@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 236, '2024-09-06 12:10:23', 236),
	(237, 'fd529d42-6c48-11ef-96f2-509a4cb5cc32', 237, 'WBC', NULL, 'User237', 'user237@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 237, '2024-09-06 12:10:23', 237),
	(238, 'fd552953-6c48-11ef-96f2-509a4cb5cc32', 238, 'WBC', NULL, 'User238', 'user238@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 238, '2024-09-06 12:10:23', 238),
	(239, 'fd56f599-6c48-11ef-96f2-509a4cb5cc32', 239, 'WBC', NULL, 'User239', 'user239@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 239, '2024-09-06 12:10:23', 239),
	(240, 'fd58c3f6-6c48-11ef-96f2-509a4cb5cc32', 240, 'WBC', NULL, 'User240', 'user240@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 240, '2024-09-06 12:10:23', 240),
	(241, 'fd5a5698-6c48-11ef-96f2-509a4cb5cc32', 241, 'WBC', NULL, 'User241', 'user241@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 241, '2024-09-06 12:10:23', 241),
	(242, 'fd5c03b1-6c48-11ef-96f2-509a4cb5cc32', 242, 'WBC', NULL, 'User242', 'user242@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 242, '2024-09-06 12:10:23', 242),
	(243, 'fd5d7453-6c48-11ef-96f2-509a4cb5cc32', 243, 'WBC', NULL, 'User243', 'user243@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 243, '2024-09-06 12:10:23', 243),
	(244, 'fd5ec955-6c48-11ef-96f2-509a4cb5cc32', 244, 'WBC', NULL, 'User244', 'user244@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 244, '2024-09-06 12:10:23', 244),
	(245, 'fd604751-6c48-11ef-96f2-509a4cb5cc32', 245, 'WBC', NULL, 'User245', 'user245@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 245, '2024-09-06 12:10:23', 245),
	(246, 'fd61a1e9-6c48-11ef-96f2-509a4cb5cc32', 246, 'WBC', NULL, 'User246', 'user246@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 246, '2024-09-06 12:10:23', 246),
	(247, 'fd630b51-6c48-11ef-96f2-509a4cb5cc32', 247, 'WBC', NULL, 'User247', 'user247@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 247, '2024-09-06 12:10:23', 247),
	(248, 'fd645f9d-6c48-11ef-96f2-509a4cb5cc32', 248, 'WBC', NULL, 'User248', 'user248@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 248, '2024-09-06 12:10:23', 248),
	(249, 'fd65eb12-6c48-11ef-96f2-509a4cb5cc32', 249, 'WBC', NULL, 'User249', 'user249@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 249, '2024-09-06 12:10:23', 249),
	(250, 'fd67665a-6c48-11ef-96f2-509a4cb5cc32', 250, 'WBC', NULL, 'User250', 'user250@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 250, '2024-09-06 12:10:23', 250),
	(251, 'fd68f01e-6c48-11ef-96f2-509a4cb5cc32', 251, 'WBC', NULL, 'User251', 'user251@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 251, '2024-09-06 12:10:23', 251),
	(252, 'fd6a6789-6c48-11ef-96f2-509a4cb5cc32', 252, 'WBC', NULL, 'User252', 'user252@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 252, '2024-09-06 12:10:23', 252),
	(253, 'fd6bde8a-6c48-11ef-96f2-509a4cb5cc32', 253, 'WBC', NULL, 'User253', 'user253@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 253, '2024-09-06 12:10:23', 253),
	(254, 'fd6d3fe0-6c48-11ef-96f2-509a4cb5cc32', 254, 'WBC', NULL, 'User254', 'user254@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 254, '2024-09-06 12:10:23', 254),
	(255, 'fd6eb308-6c48-11ef-96f2-509a4cb5cc32', 255, 'WBC', NULL, 'User255', 'user255@wbc.com', NULL, '0903.111111', NULL, NULL, NULL, b'0', '2024-09-06 12:10:23', 255, '2024-09-06 12:10:23', 255);

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
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.user_role: ~0 rows (approximately)
REPLACE INTO `user_role` (`id`, `guid`, `user_id`, `role_id`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, NULL, 1, 1, NULL, b'0', '2024-09-06 12:10:20', 1, '2024-09-06 12:10:20', 1),
	(2, NULL, 1, 2, NULL, b'0', '2024-09-06 12:10:20', 1, '2024-09-06 12:10:20', 1),
	(4, NULL, 2, 1, NULL, b'0', '2024-09-06 12:10:20', 2, '2024-09-06 12:10:20', 2),
	(5, NULL, 3, 1, NULL, b'0', '2024-09-06 12:10:20', 3, '2024-09-06 12:10:20', 3),
	(6, NULL, 4, 1, NULL, b'0', '2024-09-06 12:10:20', 4, '2024-09-06 12:10:20', 4),
	(7, NULL, 5, 1, NULL, b'0', '2024-09-06 12:10:20', 5, '2024-09-06 12:10:20', 5),
	(8, NULL, 6, 1, NULL, b'0', '2024-09-06 12:10:20', 6, '2024-09-06 12:10:20', 6),
	(9, NULL, 7, 1, NULL, b'0', '2024-09-06 12:10:20', 7, '2024-09-06 12:10:20', 7),
	(10, NULL, 8, 1, NULL, b'0', '2024-09-06 12:10:20', 8, '2024-09-06 12:10:20', 8),
	(11, NULL, 9, 1, NULL, b'0', '2024-09-06 12:10:20', 9, '2024-09-06 12:10:20', 9),
	(12, NULL, 10, 1, NULL, b'0', '2024-09-06 12:10:20', 10, '2024-09-06 12:10:20', 10),
	(13, NULL, 11, 1, NULL, b'0', '2024-09-06 12:10:20', 11, '2024-09-06 12:10:20', 11),
	(14, NULL, 12, 1, NULL, b'0', '2024-09-06 12:10:20', 12, '2024-09-06 12:10:20', 12),
	(15, NULL, 13, 1, NULL, b'0', '2024-09-06 12:10:20', 13, '2024-09-06 12:10:20', 13),
	(16, NULL, 14, 1, NULL, b'0', '2024-09-06 12:10:20', 14, '2024-09-06 12:10:20', 14),
	(17, NULL, 15, 1, NULL, b'0', '2024-09-06 12:10:20', 15, '2024-09-06 12:10:20', 15),
	(18, NULL, 16, 1, NULL, b'0', '2024-09-06 12:10:20', 16, '2024-09-06 12:10:20', 16),
	(19, NULL, 17, 1, NULL, b'0', '2024-09-06 12:10:20', 17, '2024-09-06 12:10:20', 17),
	(20, NULL, 18, 1, NULL, b'0', '2024-09-06 12:10:20', 18, '2024-09-06 12:10:20', 18),
	(21, NULL, 19, 1, NULL, b'0', '2024-09-06 12:10:20', 19, '2024-09-06 12:10:20', 19),
	(22, NULL, 20, 1, NULL, b'0', '2024-09-06 12:10:20', 20, '2024-09-06 12:10:20', 20),
	(23, NULL, 21, 1, NULL, b'0', '2024-09-06 12:10:20', 21, '2024-09-06 12:10:20', 21),
	(24, NULL, 22, 1, NULL, b'0', '2024-09-06 12:10:20', 22, '2024-09-06 12:10:20', 22),
	(25, NULL, 23, 1, NULL, b'0', '2024-09-06 12:10:20', 23, '2024-09-06 12:10:20', 23),
	(26, NULL, 24, 1, NULL, b'0', '2024-09-06 12:10:21', 24, '2024-09-06 12:10:21', 24),
	(27, NULL, 25, 1, NULL, b'0', '2024-09-06 12:10:21', 25, '2024-09-06 12:10:21', 25),
	(28, NULL, 26, 1, NULL, b'0', '2024-09-06 12:10:21', 26, '2024-09-06 12:10:21', 26),
	(29, NULL, 27, 1, NULL, b'0', '2024-09-06 12:10:21', 27, '2024-09-06 12:10:21', 27),
	(30, NULL, 28, 1, NULL, b'0', '2024-09-06 12:10:21', 28, '2024-09-06 12:10:21', 28),
	(31, NULL, 29, 1, NULL, b'0', '2024-09-06 12:10:21', 29, '2024-09-06 12:10:21', 29),
	(32, NULL, 30, 1, NULL, b'0', '2024-09-06 12:10:21', 30, '2024-09-06 12:10:21', 30),
	(33, NULL, 31, 1, NULL, b'0', '2024-09-06 12:10:21', 31, '2024-09-06 12:10:21', 31),
	(34, NULL, 32, 1, NULL, b'0', '2024-09-06 12:10:21', 32, '2024-09-06 12:10:21', 32),
	(35, NULL, 33, 1, NULL, b'0', '2024-09-06 12:10:21', 33, '2024-09-06 12:10:21', 33),
	(36, NULL, 34, 1, NULL, b'0', '2024-09-06 12:10:21', 34, '2024-09-06 12:10:21', 34),
	(37, NULL, 35, 1, NULL, b'0', '2024-09-06 12:10:21', 35, '2024-09-06 12:10:21', 35),
	(38, NULL, 36, 1, NULL, b'0', '2024-09-06 12:10:21', 36, '2024-09-06 12:10:21', 36),
	(39, NULL, 37, 1, NULL, b'0', '2024-09-06 12:10:21', 37, '2024-09-06 12:10:21', 37),
	(40, NULL, 38, 1, NULL, b'0', '2024-09-06 12:10:21', 38, '2024-09-06 12:10:21', 38),
	(41, NULL, 39, 1, NULL, b'0', '2024-09-06 12:10:21', 39, '2024-09-06 12:10:21', 39),
	(42, NULL, 40, 1, NULL, b'0', '2024-09-06 12:10:21', 40, '2024-09-06 12:10:21', 40),
	(43, NULL, 41, 1, NULL, b'0', '2024-09-06 12:10:21', 41, '2024-09-06 12:10:21', 41),
	(44, NULL, 42, 1, NULL, b'0', '2024-09-06 12:10:21', 42, '2024-09-06 12:10:21', 42),
	(45, NULL, 43, 1, NULL, b'0', '2024-09-06 12:10:21', 43, '2024-09-06 12:10:21', 43),
	(46, NULL, 44, 1, NULL, b'0', '2024-09-06 12:10:21', 44, '2024-09-06 12:10:21', 44),
	(47, NULL, 45, 1, NULL, b'0', '2024-09-06 12:10:21', 45, '2024-09-06 12:10:21', 45),
	(48, NULL, 46, 1, NULL, b'0', '2024-09-06 12:10:21', 46, '2024-09-06 12:10:21', 46),
	(49, NULL, 47, 1, NULL, b'0', '2024-09-06 12:10:21', 47, '2024-09-06 12:10:21', 47),
	(50, NULL, 48, 1, NULL, b'0', '2024-09-06 12:10:21', 48, '2024-09-06 12:10:21', 48),
	(51, NULL, 49, 1, NULL, b'0', '2024-09-06 12:10:21', 49, '2024-09-06 12:10:21', 49),
	(52, NULL, 50, 1, NULL, b'0', '2024-09-06 12:10:21', 50, '2024-09-06 12:10:21', 50),
	(53, NULL, 51, 1, NULL, b'0', '2024-09-06 12:10:21', 51, '2024-09-06 12:10:21', 51),
	(54, NULL, 52, 1, NULL, b'0', '2024-09-06 12:10:21', 52, '2024-09-06 12:10:21', 52),
	(55, NULL, 53, 1, NULL, b'0', '2024-09-06 12:10:21', 53, '2024-09-06 12:10:21', 53),
	(56, NULL, 54, 1, NULL, b'0', '2024-09-06 12:10:21', 54, '2024-09-06 12:10:21', 54),
	(57, NULL, 55, 1, NULL, b'0', '2024-09-06 12:10:21', 55, '2024-09-06 12:10:21', 55),
	(58, NULL, 56, 1, NULL, b'0', '2024-09-06 12:10:21', 56, '2024-09-06 12:10:21', 56),
	(59, NULL, 57, 1, NULL, b'0', '2024-09-06 12:10:21', 57, '2024-09-06 12:10:21', 57),
	(60, NULL, 58, 1, NULL, b'0', '2024-09-06 12:10:21', 58, '2024-09-06 12:10:21', 58),
	(61, NULL, 59, 1, NULL, b'0', '2024-09-06 12:10:21', 59, '2024-09-06 12:10:21', 59),
	(62, NULL, 60, 1, NULL, b'0', '2024-09-06 12:10:21', 60, '2024-09-06 12:10:21', 60),
	(63, NULL, 61, 1, NULL, b'0', '2024-09-06 12:10:21', 61, '2024-09-06 12:10:21', 61),
	(64, NULL, 62, 1, NULL, b'0', '2024-09-06 12:10:21', 62, '2024-09-06 12:10:21', 62),
	(65, NULL, 63, 1, NULL, b'0', '2024-09-06 12:10:21', 63, '2024-09-06 12:10:21', 63),
	(66, NULL, 64, 1, NULL, b'0', '2024-09-06 12:10:21', 64, '2024-09-06 12:10:21', 64),
	(67, NULL, 65, 1, NULL, b'0', '2024-09-06 12:10:21', 65, '2024-09-06 12:10:21', 65),
	(68, NULL, 66, 1, NULL, b'0', '2024-09-06 12:10:21', 66, '2024-09-06 12:10:21', 66),
	(69, NULL, 67, 1, NULL, b'0', '2024-09-06 12:10:21', 67, '2024-09-06 12:10:21', 67),
	(70, NULL, 68, 1, NULL, b'0', '2024-09-06 12:10:21', 68, '2024-09-06 12:10:21', 68),
	(71, NULL, 69, 1, NULL, b'0', '2024-09-06 12:10:21', 69, '2024-09-06 12:10:21', 69),
	(72, NULL, 70, 1, NULL, b'0', '2024-09-06 12:10:21', 70, '2024-09-06 12:10:21', 70),
	(73, NULL, 71, 1, NULL, b'0', '2024-09-06 12:10:21', 71, '2024-09-06 12:10:21', 71),
	(74, NULL, 72, 1, NULL, b'0', '2024-09-06 12:10:21', 72, '2024-09-06 12:10:21', 72),
	(75, NULL, 73, 1, NULL, b'0', '2024-09-06 12:10:21', 73, '2024-09-06 12:10:21', 73),
	(76, NULL, 74, 1, NULL, b'0', '2024-09-06 12:10:21', 74, '2024-09-06 12:10:21', 74),
	(77, NULL, 75, 1, NULL, b'0', '2024-09-06 12:10:21', 75, '2024-09-06 12:10:21', 75),
	(78, NULL, 76, 1, NULL, b'0', '2024-09-06 12:10:21', 76, '2024-09-06 12:10:21', 76),
	(79, NULL, 77, 1, NULL, b'0', '2024-09-06 12:10:21', 77, '2024-09-06 12:10:21', 77),
	(80, NULL, 78, 1, NULL, b'0', '2024-09-06 12:10:21', 78, '2024-09-06 12:10:21', 78),
	(81, NULL, 79, 1, NULL, b'0', '2024-09-06 12:10:21', 79, '2024-09-06 12:10:21', 79),
	(82, NULL, 80, 1, NULL, b'0', '2024-09-06 12:10:21', 80, '2024-09-06 12:10:21', 80),
	(83, NULL, 81, 1, NULL, b'0', '2024-09-06 12:10:21', 81, '2024-09-06 12:10:21', 81),
	(84, NULL, 82, 1, NULL, b'0', '2024-09-06 12:10:21', 82, '2024-09-06 12:10:21', 82),
	(85, NULL, 83, 1, NULL, b'0', '2024-09-06 12:10:21', 83, '2024-09-06 12:10:21', 83),
	(86, NULL, 84, 1, NULL, b'0', '2024-09-06 12:10:21', 84, '2024-09-06 12:10:21', 84),
	(87, NULL, 85, 1, NULL, b'0', '2024-09-06 12:10:21', 85, '2024-09-06 12:10:21', 85),
	(88, NULL, 86, 1, NULL, b'0', '2024-09-06 12:10:21', 86, '2024-09-06 12:10:21', 86),
	(89, NULL, 87, 1, NULL, b'0', '2024-09-06 12:10:21', 87, '2024-09-06 12:10:21', 87),
	(90, NULL, 88, 1, NULL, b'0', '2024-09-06 12:10:21', 88, '2024-09-06 12:10:21', 88),
	(91, NULL, 89, 1, NULL, b'0', '2024-09-06 12:10:21', 89, '2024-09-06 12:10:21', 89),
	(92, NULL, 90, 1, NULL, b'0', '2024-09-06 12:10:22', 90, '2024-09-06 12:10:22', 90),
	(93, NULL, 91, 1, NULL, b'0', '2024-09-06 12:10:22', 91, '2024-09-06 12:10:22', 91),
	(94, NULL, 92, 1, NULL, b'0', '2024-09-06 12:10:22', 92, '2024-09-06 12:10:22', 92),
	(95, NULL, 93, 1, NULL, b'0', '2024-09-06 12:10:22', 93, '2024-09-06 12:10:22', 93),
	(96, NULL, 94, 1, NULL, b'0', '2024-09-06 12:10:22', 94, '2024-09-06 12:10:22', 94),
	(97, NULL, 95, 1, NULL, b'0', '2024-09-06 12:10:22', 95, '2024-09-06 12:10:22', 95),
	(98, NULL, 96, 1, NULL, b'0', '2024-09-06 12:10:22', 96, '2024-09-06 12:10:22', 96),
	(99, NULL, 97, 1, NULL, b'0', '2024-09-06 12:10:22', 97, '2024-09-06 12:10:22', 97),
	(100, NULL, 98, 1, NULL, b'0', '2024-09-06 12:10:22', 98, '2024-09-06 12:10:22', 98),
	(101, NULL, 99, 1, NULL, b'0', '2024-09-06 12:10:22', 99, '2024-09-06 12:10:22', 99),
	(102, NULL, 100, 1, NULL, b'0', '2024-09-06 12:10:22', 100, '2024-09-06 12:10:22', 100),
	(103, NULL, 101, 1, NULL, b'0', '2024-09-06 12:10:22', 101, '2024-09-06 12:10:22', 101),
	(104, NULL, 102, 1, NULL, b'0', '2024-09-06 12:10:22', 102, '2024-09-06 12:10:22', 102),
	(105, NULL, 103, 1, NULL, b'0', '2024-09-06 12:10:22', 103, '2024-09-06 12:10:22', 103),
	(106, NULL, 104, 1, NULL, b'0', '2024-09-06 12:10:22', 104, '2024-09-06 12:10:22', 104),
	(107, NULL, 105, 1, NULL, b'0', '2024-09-06 12:10:22', 105, '2024-09-06 12:10:22', 105),
	(108, NULL, 106, 1, NULL, b'0', '2024-09-06 12:10:22', 106, '2024-09-06 12:10:22', 106),
	(109, NULL, 107, 1, NULL, b'0', '2024-09-06 12:10:22', 107, '2024-09-06 12:10:22', 107),
	(110, NULL, 108, 1, NULL, b'0', '2024-09-06 12:10:22', 108, '2024-09-06 12:10:22', 108),
	(111, NULL, 109, 1, NULL, b'0', '2024-09-06 12:10:22', 109, '2024-09-06 12:10:22', 109),
	(112, NULL, 110, 1, NULL, b'0', '2024-09-06 12:10:22', 110, '2024-09-06 12:10:22', 110),
	(113, NULL, 111, 1, NULL, b'0', '2024-09-06 12:10:22', 111, '2024-09-06 12:10:22', 111),
	(114, NULL, 112, 1, NULL, b'0', '2024-09-06 12:10:22', 112, '2024-09-06 12:10:22', 112),
	(115, NULL, 113, 1, NULL, b'0', '2024-09-06 12:10:22', 113, '2024-09-06 12:10:22', 113),
	(116, NULL, 114, 1, NULL, b'0', '2024-09-06 12:10:22', 114, '2024-09-06 12:10:22', 114),
	(117, NULL, 115, 1, NULL, b'0', '2024-09-06 12:10:22', 115, '2024-09-06 12:10:22', 115),
	(118, NULL, 116, 1, NULL, b'0', '2024-09-06 12:10:22', 116, '2024-09-06 12:10:22', 116),
	(119, NULL, 117, 1, NULL, b'0', '2024-09-06 12:10:22', 117, '2024-09-06 12:10:22', 117),
	(120, NULL, 118, 1, NULL, b'0', '2024-09-06 12:10:22', 118, '2024-09-06 12:10:22', 118),
	(121, NULL, 119, 1, NULL, b'0', '2024-09-06 12:10:22', 119, '2024-09-06 12:10:22', 119),
	(122, NULL, 120, 1, NULL, b'0', '2024-09-06 12:10:22', 120, '2024-09-06 12:10:22', 120),
	(123, NULL, 121, 1, NULL, b'0', '2024-09-06 12:10:22', 121, '2024-09-06 12:10:22', 121),
	(124, NULL, 122, 1, NULL, b'0', '2024-09-06 12:10:22', 122, '2024-09-06 12:10:22', 122),
	(125, NULL, 123, 1, NULL, b'0', '2024-09-06 12:10:22', 123, '2024-09-06 12:10:22', 123),
	(126, NULL, 124, 1, NULL, b'0', '2024-09-06 12:10:22', 124, '2024-09-06 12:10:22', 124),
	(127, NULL, 125, 1, NULL, b'0', '2024-09-06 12:10:22', 125, '2024-09-06 12:10:22', 125),
	(128, NULL, 126, 1, NULL, b'0', '2024-09-06 12:10:22', 126, '2024-09-06 12:10:22', 126),
	(129, NULL, 127, 1, NULL, b'0', '2024-09-06 12:10:22', 127, '2024-09-06 12:10:22', 127),
	(130, NULL, 128, 1, NULL, b'0', '2024-09-06 12:10:22', 128, '2024-09-06 12:10:22', 128),
	(131, NULL, 129, 1, NULL, b'0', '2024-09-06 12:10:22', 129, '2024-09-06 12:10:22', 129),
	(132, NULL, 130, 1, NULL, b'0', '2024-09-06 12:10:22', 130, '2024-09-06 12:10:22', 130),
	(133, NULL, 131, 1, NULL, b'0', '2024-09-06 12:10:22', 131, '2024-09-06 12:10:22', 131),
	(134, NULL, 132, 1, NULL, b'0', '2024-09-06 12:10:22', 132, '2024-09-06 12:10:22', 132),
	(135, NULL, 133, 1, NULL, b'0', '2024-09-06 12:10:22', 133, '2024-09-06 12:10:22', 133),
	(136, NULL, 134, 1, NULL, b'0', '2024-09-06 12:10:22', 134, '2024-09-06 12:10:22', 134),
	(137, NULL, 135, 1, NULL, b'0', '2024-09-06 12:10:22', 135, '2024-09-06 12:10:22', 135),
	(138, NULL, 136, 1, NULL, b'0', '2024-09-06 12:10:22', 136, '2024-09-06 12:10:22', 136),
	(139, NULL, 137, 1, NULL, b'0', '2024-09-06 12:10:22', 137, '2024-09-06 12:10:22', 137),
	(140, NULL, 138, 1, NULL, b'0', '2024-09-06 12:10:22', 138, '2024-09-06 12:10:22', 138),
	(141, NULL, 139, 1, NULL, b'0', '2024-09-06 12:10:22', 139, '2024-09-06 12:10:22', 139),
	(142, NULL, 140, 1, NULL, b'0', '2024-09-06 12:10:22', 140, '2024-09-06 12:10:22', 140),
	(143, NULL, 141, 1, NULL, b'0', '2024-09-06 12:10:22', 141, '2024-09-06 12:10:22', 141),
	(144, NULL, 142, 1, NULL, b'0', '2024-09-06 12:10:22', 142, '2024-09-06 12:10:22', 142),
	(145, NULL, 143, 1, NULL, b'0', '2024-09-06 12:10:22', 143, '2024-09-06 12:10:22', 143),
	(146, NULL, 144, 1, NULL, b'0', '2024-09-06 12:10:22', 144, '2024-09-06 12:10:22', 144),
	(147, NULL, 145, 1, NULL, b'0', '2024-09-06 12:10:22', 145, '2024-09-06 12:10:22', 145),
	(148, NULL, 146, 1, NULL, b'0', '2024-09-06 12:10:22', 146, '2024-09-06 12:10:22', 146),
	(149, NULL, 147, 1, NULL, b'0', '2024-09-06 12:10:22', 147, '2024-09-06 12:10:22', 147),
	(150, NULL, 148, 1, NULL, b'0', '2024-09-06 12:10:22', 148, '2024-09-06 12:10:22', 148),
	(151, NULL, 149, 1, NULL, b'0', '2024-09-06 12:10:22', 149, '2024-09-06 12:10:22', 149),
	(152, NULL, 150, 1, NULL, b'0', '2024-09-06 12:10:22', 150, '2024-09-06 12:10:22', 150),
	(153, NULL, 151, 1, NULL, b'0', '2024-09-06 12:10:22', 151, '2024-09-06 12:10:22', 151),
	(154, NULL, 152, 1, NULL, b'0', '2024-09-06 12:10:22', 152, '2024-09-06 12:10:22', 152),
	(155, NULL, 153, 1, NULL, b'0', '2024-09-06 12:10:22', 153, '2024-09-06 12:10:22', 153),
	(156, NULL, 154, 1, NULL, b'0', '2024-09-06 12:10:22', 154, '2024-09-06 12:10:22', 154),
	(157, NULL, 155, 1, NULL, b'0', '2024-09-06 12:10:22', 155, '2024-09-06 12:10:22', 155),
	(158, NULL, 156, 1, NULL, b'0', '2024-09-06 12:10:22', 156, '2024-09-06 12:10:22', 156),
	(159, NULL, 157, 1, NULL, b'0', '2024-09-06 12:10:22', 157, '2024-09-06 12:10:22', 157),
	(160, NULL, 158, 1, NULL, b'0', '2024-09-06 12:10:22', 158, '2024-09-06 12:10:22', 158),
	(161, NULL, 159, 1, NULL, b'0', '2024-09-06 12:10:22', 159, '2024-09-06 12:10:22', 159),
	(162, NULL, 160, 1, NULL, b'0', '2024-09-06 12:10:22', 160, '2024-09-06 12:10:22', 160),
	(163, NULL, 161, 1, NULL, b'0', '2024-09-06 12:10:22', 161, '2024-09-06 12:10:22', 161),
	(164, NULL, 162, 1, NULL, b'0', '2024-09-06 12:10:22', 162, '2024-09-06 12:10:22', 162),
	(165, NULL, 163, 1, NULL, b'0', '2024-09-06 12:10:22', 163, '2024-09-06 12:10:22', 163),
	(166, NULL, 164, 1, NULL, b'0', '2024-09-06 12:10:22', 164, '2024-09-06 12:10:22', 164),
	(167, NULL, 165, 1, NULL, b'0', '2024-09-06 12:10:22', 165, '2024-09-06 12:10:22', 165),
	(168, NULL, 166, 1, NULL, b'0', '2024-09-06 12:10:22', 166, '2024-09-06 12:10:22', 166),
	(169, NULL, 167, 1, NULL, b'0', '2024-09-06 12:10:22', 167, '2024-09-06 12:10:22', 167),
	(170, NULL, 168, 1, NULL, b'0', '2024-09-06 12:10:22', 168, '2024-09-06 12:10:22', 168),
	(171, NULL, 169, 1, NULL, b'0', '2024-09-06 12:10:22', 169, '2024-09-06 12:10:22', 169),
	(172, NULL, 170, 1, NULL, b'0', '2024-09-06 12:10:22', 170, '2024-09-06 12:10:22', 170),
	(173, NULL, 171, 1, NULL, b'0', '2024-09-06 12:10:22', 171, '2024-09-06 12:10:22', 171),
	(174, NULL, 172, 1, NULL, b'0', '2024-09-06 12:10:22', 172, '2024-09-06 12:10:22', 172),
	(175, NULL, 173, 1, NULL, b'0', '2024-09-06 12:10:22', 173, '2024-09-06 12:10:22', 173),
	(176, NULL, 174, 1, NULL, b'0', '2024-09-06 12:10:22', 174, '2024-09-06 12:10:22', 174),
	(177, NULL, 175, 1, NULL, b'0', '2024-09-06 12:10:23', 175, '2024-09-06 12:10:23', 175),
	(178, NULL, 176, 1, NULL, b'0', '2024-09-06 12:10:23', 176, '2024-09-06 12:10:23', 176),
	(179, NULL, 177, 1, NULL, b'0', '2024-09-06 12:10:23', 177, '2024-09-06 12:10:23', 177),
	(180, NULL, 178, 1, NULL, b'0', '2024-09-06 12:10:23', 178, '2024-09-06 12:10:23', 178),
	(181, NULL, 179, 1, NULL, b'0', '2024-09-06 12:10:23', 179, '2024-09-06 12:10:23', 179),
	(182, NULL, 180, 1, NULL, b'0', '2024-09-06 12:10:23', 180, '2024-09-06 12:10:23', 180),
	(183, NULL, 181, 1, NULL, b'0', '2024-09-06 12:10:23', 181, '2024-09-06 12:10:23', 181),
	(184, NULL, 182, 1, NULL, b'0', '2024-09-06 12:10:23', 182, '2024-09-06 12:10:23', 182),
	(185, NULL, 183, 1, NULL, b'0', '2024-09-06 12:10:23', 183, '2024-09-06 12:10:23', 183),
	(186, NULL, 184, 1, NULL, b'0', '2024-09-06 12:10:23', 184, '2024-09-06 12:10:23', 184),
	(187, NULL, 185, 1, NULL, b'0', '2024-09-06 12:10:23', 185, '2024-09-06 12:10:23', 185),
	(188, NULL, 186, 1, NULL, b'0', '2024-09-06 12:10:23', 186, '2024-09-06 12:10:23', 186),
	(189, NULL, 187, 1, NULL, b'0', '2024-09-06 12:10:23', 187, '2024-09-06 12:10:23', 187),
	(190, NULL, 188, 1, NULL, b'0', '2024-09-06 12:10:23', 188, '2024-09-06 12:10:23', 188),
	(191, NULL, 189, 1, NULL, b'0', '2024-09-06 12:10:23', 189, '2024-09-06 12:10:23', 189),
	(192, NULL, 190, 1, NULL, b'0', '2024-09-06 12:10:23', 190, '2024-09-06 12:10:23', 190),
	(193, NULL, 191, 1, NULL, b'0', '2024-09-06 12:10:23', 191, '2024-09-06 12:10:23', 191),
	(194, NULL, 192, 1, NULL, b'0', '2024-09-06 12:10:23', 192, '2024-09-06 12:10:23', 192),
	(195, NULL, 193, 1, NULL, b'0', '2024-09-06 12:10:23', 193, '2024-09-06 12:10:23', 193),
	(196, NULL, 194, 1, NULL, b'0', '2024-09-06 12:10:23', 194, '2024-09-06 12:10:23', 194),
	(197, NULL, 195, 1, NULL, b'0', '2024-09-06 12:10:23', 195, '2024-09-06 12:10:23', 195),
	(198, NULL, 196, 1, NULL, b'0', '2024-09-06 12:10:23', 196, '2024-09-06 12:10:23', 196),
	(199, NULL, 197, 1, NULL, b'0', '2024-09-06 12:10:23', 197, '2024-09-06 12:10:23', 197),
	(200, NULL, 198, 1, NULL, b'0', '2024-09-06 12:10:23', 198, '2024-09-06 12:10:23', 198),
	(201, NULL, 199, 1, NULL, b'0', '2024-09-06 12:10:23', 199, '2024-09-06 12:10:23', 199),
	(202, NULL, 200, 1, NULL, b'0', '2024-09-06 12:10:23', 200, '2024-09-06 12:10:23', 200),
	(203, NULL, 201, 1, NULL, b'0', '2024-09-06 12:10:23', 201, '2024-09-06 12:10:23', 201),
	(204, NULL, 202, 1, NULL, b'0', '2024-09-06 12:10:23', 202, '2024-09-06 12:10:23', 202),
	(205, NULL, 203, 1, NULL, b'0', '2024-09-06 12:10:23', 203, '2024-09-06 12:10:23', 203),
	(206, NULL, 204, 1, NULL, b'0', '2024-09-06 12:10:23', 204, '2024-09-06 12:10:23', 204),
	(207, NULL, 205, 1, NULL, b'0', '2024-09-06 12:10:23', 205, '2024-09-06 12:10:23', 205),
	(208, NULL, 206, 1, NULL, b'0', '2024-09-06 12:10:23', 206, '2024-09-06 12:10:23', 206),
	(209, NULL, 207, 1, NULL, b'0', '2024-09-06 12:10:23', 207, '2024-09-06 12:10:23', 207),
	(210, NULL, 208, 1, NULL, b'0', '2024-09-06 12:10:23', 208, '2024-09-06 12:10:23', 208),
	(211, NULL, 209, 1, NULL, b'0', '2024-09-06 12:10:23', 209, '2024-09-06 12:10:23', 209),
	(212, NULL, 210, 1, NULL, b'0', '2024-09-06 12:10:23', 210, '2024-09-06 12:10:23', 210),
	(213, NULL, 211, 1, NULL, b'0', '2024-09-06 12:10:23', 211, '2024-09-06 12:10:23', 211),
	(214, NULL, 212, 1, NULL, b'0', '2024-09-06 12:10:23', 212, '2024-09-06 12:10:23', 212),
	(215, NULL, 213, 1, NULL, b'0', '2024-09-06 12:10:23', 213, '2024-09-06 12:10:23', 213),
	(216, NULL, 214, 1, NULL, b'0', '2024-09-06 12:10:23', 214, '2024-09-06 12:10:23', 214),
	(217, NULL, 215, 1, NULL, b'0', '2024-09-06 12:10:23', 215, '2024-09-06 12:10:23', 215),
	(218, NULL, 216, 1, NULL, b'0', '2024-09-06 12:10:23', 216, '2024-09-06 12:10:23', 216),
	(219, NULL, 217, 1, NULL, b'0', '2024-09-06 12:10:23', 217, '2024-09-06 12:10:23', 217),
	(220, NULL, 218, 1, NULL, b'0', '2024-09-06 12:10:23', 218, '2024-09-06 12:10:23', 218),
	(221, NULL, 219, 1, NULL, b'0', '2024-09-06 12:10:23', 219, '2024-09-06 12:10:23', 219),
	(222, NULL, 220, 1, NULL, b'0', '2024-09-06 12:10:23', 220, '2024-09-06 12:10:23', 220),
	(223, NULL, 221, 1, NULL, b'0', '2024-09-06 12:10:23', 221, '2024-09-06 12:10:23', 221),
	(224, NULL, 222, 1, NULL, b'0', '2024-09-06 12:10:23', 222, '2024-09-06 12:10:23', 222),
	(225, NULL, 223, 1, NULL, b'0', '2024-09-06 12:10:23', 223, '2024-09-06 12:10:23', 223),
	(226, NULL, 224, 1, NULL, b'0', '2024-09-06 12:10:23', 224, '2024-09-06 12:10:23', 224),
	(227, NULL, 225, 1, NULL, b'0', '2024-09-06 12:10:23', 225, '2024-09-06 12:10:23', 225),
	(228, NULL, 226, 1, NULL, b'0', '2024-09-06 12:10:23', 226, '2024-09-06 12:10:23', 226),
	(229, NULL, 227, 1, NULL, b'0', '2024-09-06 12:10:23', 227, '2024-09-06 12:10:23', 227),
	(230, NULL, 228, 1, NULL, b'0', '2024-09-06 12:10:23', 228, '2024-09-06 12:10:23', 228),
	(231, NULL, 229, 1, NULL, b'0', '2024-09-06 12:10:23', 229, '2024-09-06 12:10:23', 229),
	(232, NULL, 230, 1, NULL, b'0', '2024-09-06 12:10:23', 230, '2024-09-06 12:10:23', 230),
	(233, NULL, 231, 1, NULL, b'0', '2024-09-06 12:10:23', 231, '2024-09-06 12:10:23', 231),
	(234, NULL, 232, 1, NULL, b'0', '2024-09-06 12:10:23', 232, '2024-09-06 12:10:23', 232),
	(235, NULL, 233, 1, NULL, b'0', '2024-09-06 12:10:23', 233, '2024-09-06 12:10:23', 233),
	(236, NULL, 234, 1, NULL, b'0', '2024-09-06 12:10:23', 234, '2024-09-06 12:10:23', 234),
	(237, NULL, 235, 1, NULL, b'0', '2024-09-06 12:10:23', 235, '2024-09-06 12:10:23', 235),
	(238, NULL, 236, 1, NULL, b'0', '2024-09-06 12:10:23', 236, '2024-09-06 12:10:23', 236),
	(239, NULL, 237, 1, NULL, b'0', '2024-09-06 12:10:23', 237, '2024-09-06 12:10:23', 237),
	(240, NULL, 238, 1, NULL, b'0', '2024-09-06 12:10:23', 238, '2024-09-06 12:10:23', 238),
	(241, NULL, 239, 1, NULL, b'0', '2024-09-06 12:10:23', 239, '2024-09-06 12:10:23', 239),
	(242, NULL, 240, 1, NULL, b'0', '2024-09-06 12:10:23', 240, '2024-09-06 12:10:23', 240),
	(243, NULL, 241, 1, NULL, b'0', '2024-09-06 12:10:23', 241, '2024-09-06 12:10:23', 241),
	(244, NULL, 242, 1, NULL, b'0', '2024-09-06 12:10:23', 242, '2024-09-06 12:10:23', 242),
	(245, NULL, 243, 1, NULL, b'0', '2024-09-06 12:10:23', 243, '2024-09-06 12:10:23', 243),
	(246, NULL, 244, 1, NULL, b'0', '2024-09-06 12:10:23', 244, '2024-09-06 12:10:23', 244),
	(247, NULL, 245, 1, NULL, b'0', '2024-09-06 12:10:23', 245, '2024-09-06 12:10:23', 245),
	(248, NULL, 246, 1, NULL, b'0', '2024-09-06 12:10:23', 246, '2024-09-06 12:10:23', 246),
	(249, NULL, 247, 1, NULL, b'0', '2024-09-06 12:10:23', 247, '2024-09-06 12:10:23', 247),
	(250, NULL, 248, 1, NULL, b'0', '2024-09-06 12:10:23', 248, '2024-09-06 12:10:23', 248),
	(251, NULL, 249, 1, NULL, b'0', '2024-09-06 12:10:23', 249, '2024-09-06 12:10:23', 249),
	(252, NULL, 250, 1, NULL, b'0', '2024-09-06 12:10:23', 250, '2024-09-06 12:10:23', 250),
	(253, NULL, 251, 1, NULL, b'0', '2024-09-06 12:10:23', 251, '2024-09-06 12:10:23', 251),
	(254, NULL, 252, 1, NULL, b'0', '2024-09-06 12:10:23', 252, '2024-09-06 12:10:23', 252),
	(255, NULL, 253, 1, NULL, b'0', '2024-09-06 12:10:23', 253, '2024-09-06 12:10:23', 253),
	(256, NULL, 254, 1, NULL, b'0', '2024-09-06 12:10:23', 254, '2024-09-06 12:10:23', 254),
	(257, NULL, 255, 1, NULL, b'0', '2024-09-06 12:10:23', 255, '2024-09-06 12:10:23', 255);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
