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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.category: ~0 rows (approximately)

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

-- Dumping data for table wbc.configs: ~1 rows (approximately)
REPLACE INTO `configs` (`id`, `guid`, `page_size`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, '06384746-6aae-11ef-992a-509a4cb5cc32', 10, NULL, b'0', '2024-09-04 11:08:33.000000', 1, '2024-09-04 11:08:33.000000', 1);

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

-- Dumping data for table wbc.introduce: ~1 rows (approximately)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.role: ~0 rows (approximately)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.user: ~0 rows (approximately)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.user_ext: ~0 rows (approximately)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.user_role: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
