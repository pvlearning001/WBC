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

-- Dumping structure for table wbc.course
CREATE TABLE IF NOT EXISTS `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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

-- Dumping structure for table wbc.introduce
CREATE TABLE IF NOT EXISTS `introduce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history` varchar(2056) DEFAULT NULL,
  `hierarchy_map` varchar(255) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.introduce: ~0 rows (approximately)

-- Dumping structure for table wbc.invalidated_token
CREATE TABLE IF NOT EXISTS `invalidated_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token_guid` varchar(255) DEFAULT NULL,
  `expiry_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` date DEFAULT NULL,
  `ins_by` int(11) DEFAULT 1,
  `upd_at` date DEFAULT NULL,
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.invalidated_token: ~0 rows (approximately)

-- Dumping structure for table wbc.mark_result
CREATE TABLE IF NOT EXISTS `mark_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `cate_id` int(11) NOT NULL DEFAULT 0,
  `subject` varchar(512) DEFAULT NULL,
  `Content` varchar(1028) DEFAULT NULL,
  `content_ex_01` varchar(1028) DEFAULT NULL,
  `content_ex_02` varchar(1028) DEFAULT NULL,
  `content_ex_03` varchar(1028) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_userext_user` (`cate_id`) USING BTREE,
  CONSTRAINT `FK_news_category` FOREIGN KEY (`cate_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.news: ~0 rows (approximately)

-- Dumping structure for table wbc.permission
CREATE TABLE IF NOT EXISTS `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` date DEFAULT NULL,
  `ins_by` int(11) DEFAULT 1,
  `upd_at` date DEFAULT NULL,
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.permission: ~0 rows (approximately)

-- Dumping structure for table wbc.register_form
CREATE TABLE IF NOT EXISTS `register_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `name` varchar(255) DEFAULT NULL,
  `name_lower_cases` varchar(255) DEFAULT NULL,
  `descriptions` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `ins_at` date DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` date DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.role: ~2 rows (approximately)
REPLACE INTO `role` (`id`, `name`, `name_lower_cases`, `descriptions`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, 'User', 'user', 'User Role', NULL, b'0', NULL, 0, NULL, 0),
	(2, 'Admin', 'admin', 'Admin Role', NULL, b'0', NULL, 0, NULL, 0);

-- Dumping structure for table wbc.role_permission
CREATE TABLE IF NOT EXISTS `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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

-- Dumping structure for table wbc.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  `ins_at` date DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` date DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.user: ~1 rows (approximately)
REPLACE INTO `user` (`id`, `user_name`, `password`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, 'admin', '$2a$10$/6xtSoThmwYQHH/3U2CEjuDh6MQJ2izDNYmgaqgGkCPDB2L10UN.2', NULL, b'0', NULL, 0, NULL, 0);

-- Dumping structure for table wbc.user_ext
CREATE TABLE IF NOT EXISTS `user_ext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(255) DEFAULT NULL,
  `m_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `phone01` varchar(64) DEFAULT NULL,
  `phone02` varchar(64) DEFAULT NULL,
  `phone03` varchar(64) DEFAULT NULL,
  `remark` varchar(1028) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.user_role: ~2 rows (approximately)
REPLACE INTO `user_role` (`id`, `user_id`, `role_id`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, 1, 2, NULL, b'0', '2024-07-21 07:52:35', 1, '2024-07-21 07:52:35', 1),
	(2, 1, 1, NULL, b'0', '2024-07-21 07:52:35', 1, '2024-07-21 07:52:35', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
