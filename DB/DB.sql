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
  `descriptions` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `ins_at` datetime DEFAULT utc_timestamp(),
  `ins_by` int(11) DEFAULT 1,
  `upd_at` datetime DEFAULT utc_timestamp(),
  `upd_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.file_upload: ~6 rows (approximately)
REPLACE INTO `file_upload` (`id`, `guid`, `name`, `path`, `ext_name`, `unique_name`, `content_type`, `hash_content`, `descriptions`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, NULL, 'PhuongVu02.png', 'uploads\\images\\users', 'png', '7ae60592-5028-418c-bd23-e2a246565696.png', 'image/png', 'D41D8CD98F00B204E9800998ECF8427E', NULL, NULL, b'0', NULL, 0, NULL, 0),
	(2, NULL, 'FoxImage02.jpg', 'uploads\\images\\users', 'jpg', '7ae60592-5028-418c-bd23-e2a246565696.png.jpg', 'image/jpeg', 'D41D8CD98F00B204E9800998ECF8427E', NULL, NULL, b'0', NULL, 0, NULL, 0),
	(3, NULL, 'tin-nhE1BAAFn-blogtin-2.jpg', 'uploads\\images\\users', 'jpg', '7ae60592-5028-418c-bd23-e2a246565696.png.jpg', 'image/jpeg', 'D41D8CD98F00B204E9800998ECF8427E', NULL, NULL, b'0', NULL, 0, NULL, 0),
	(4, NULL, 'PhuongVu02.png', 'uploads\\images\\users', 'png', '2e8da0b5-ac8e-49d2-93f2-21c666e6f428.png', 'image/png', 'D41D8CD98F00B204E9800998ECF8427E', NULL, '', b'0', '2024-08-05 07:10:37', 1, '2024-08-05 07:10:37', 1),
	(5, NULL, 'FoxImage02.jpg', 'uploads\\images\\users', 'jpg', '2e8da0b5-ac8e-49d2-93f2-21c666e6f428.png.jpg', 'image/jpeg', 'D41D8CD98F00B204E9800998ECF8427E', NULL, '', b'0', '2024-08-05 07:10:37', 1, '2024-08-05 07:10:37', 1),
	(6, NULL, 'tin-nhE1BAAFn-blogtin-2.jpg', 'uploads\\images\\users', 'jpg', '2e8da0b5-ac8e-49d2-93f2-21c666e6f428.png.jpg', 'image/jpeg', 'D41D8CD98F00B204E9800998ECF8427E', NULL, '', b'0', '2024-08-05 07:10:37', 1, '2024-08-05 07:10:37', 1);

-- Dumping structure for table wbc.introduce
CREATE TABLE IF NOT EXISTS `introduce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `history` varchar(2056) DEFAULT NULL,
  `hierarchy_map` varchar(255) DEFAULT NULL,
  `info_01` varchar(255) DEFAULT NULL,
  `info_02` varchar(255) DEFAULT NULL,
  `info_03` varchar(1024) DEFAULT NULL,
  `info_04` varchar(255) DEFAULT NULL,
  `info_05` varchar(255) DEFAULT NULL,
  `info_06` varchar(255) DEFAULT NULL,
  `info_07` varchar(255) DEFAULT NULL,
  `info_08` varchar(255) DEFAULT NULL,
  `info_09` varchar(255) DEFAULT NULL,
  `info_10` varchar(255) DEFAULT NULL,
  `info_11` varchar(255) DEFAULT NULL,
  `info_12` varchar(255) DEFAULT NULL,
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
	(1, '607d9ef3-4ce1-11ef-b622-509a4cb5cc32', NULL, NULL, 'TRUNG TÂM BỒI DƯỠNG NGHIỆP VỤ CẤP NƯỚC', 'Tháng 02/2002, Trung tâm bồi dưỡng cán bộ Thuế (tiền thân của Trường Nghiệp vụ Thuế) được thành lập theo Quyết định số 36/2002/QĐ-BTC ngày 20/03/2002 của Bộ trưởng Bộ Tài chính.', 'Hiện nay, chức năng, nhiệm vụ, quyền hạn và cơ cấu tổ chức của Trường Nghiệp vụ Thuế được quy định tại Quyết định số 2157/QĐ-BTC ngày 15/11/2018 của Bộ trưởng Bộ Tài chính. Theo đó, Trường Nghiệp vụ Thuế là đơn vị thuộc Tổng cục thuế, Bộ Tài chính, có trụ sở tại Hà Nội và 01 Phân hiệu tại Thừa Thiên - Huế. Trường Nghiệp vụ Thuế có tư cách pháp nhân, con dấu riêng, được mở tài khoản tại Kho bạc Nhà nước và Ngân hàng theo quy định của pháp luật.', 'Quận Tân Bình - TP.HCM', '0909.111.111', 'wbc@hcm.uit.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0', '2024-07-28 13:00:34', 1, '2024-07-28 13:00:34', 1, NULL);

-- Dumping structure for table wbc.invalidated_token
CREATE TABLE IF NOT EXISTS `invalidated_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT NULL,
  `token_guid` varchar(255) DEFAULT NULL,
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
	(1, NULL, 'User', 'user', 'User Role', 'Init User Role', b'0', '2024-07-24 08:03:50.000000', 1, '2024-07-24 08:03:50.000000', 1),
	(2, NULL, 'Admin', 'admin', 'Admin Role', 'Init Admin Role', b'0', '2024-07-24 08:03:50.000000', 1, '2024-07-24 08:03:50.000000', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.user: ~13 rows (approximately)
REPLACE INTO `user` (`id`, `guid`, `user_name`, `password`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, '65db0682-94aa-4d9f-9b27-631d106ca3c7', 'admin', '$2a$10$73Rlz.7ybm3CblPZaM1j8eNktqjHTXluhLwkqd6yAqg6DY9WSZVe.', 'Init User', b'0', '2024-07-24 08:03:51.000000', 1, '2024-07-24 08:03:51.000000', 1),
	(2, '43af90ca-4993-11ef-aa02-509a4cb5cc32', 'user02', '$2a$10$t2pvj2mXHsQFlGRnIRX9H.e5YK25xnbP8H15NhSlGx6d3OXMYZFgS', NULL, b'0', '2024-07-24 08:03:51.000000', 1, '2024-07-24 08:03:51.000000', 1),
	(3, '43c04c35-4993-11ef-aa02-509a4cb5cc32', 'user03', '$2a$10$t2pvj2mXHsQFlGRnIRX9H.e5YK25xnbP8H15NhSlGx6d3OXMYZFgS', NULL, b'0', '2024-07-24 08:03:51.000000', 1, '2024-07-24 08:03:51.000000', 1),
	(4, '43cfc20b-4993-11ef-aa02-509a4cb5cc32', 'user04', '$2a$10$t2pvj2mXHsQFlGRnIRX9H.e5YK25xnbP8H15NhSlGx6d3OXMYZFgS', NULL, b'0', '2024-07-24 08:03:51.000000', 1, '2024-07-24 08:03:51.000000', 1),
	(5, '43deb532-4993-11ef-aa02-509a4cb5cc32', 'user05', '$2a$10$t2pvj2mXHsQFlGRnIRX9H.e5YK25xnbP8H15NhSlGx6d3OXMYZFgS', NULL, b'0', '2024-07-24 08:03:51.000000', 1, '2024-07-24 08:03:51.000000', 1),
	(6, '43ee3579-4993-11ef-aa02-509a4cb5cc32', 'user06', '$2a$10$t2pvj2mXHsQFlGRnIRX9H.e5YK25xnbP8H15NhSlGx6d3OXMYZFgS', NULL, b'0', '2024-07-24 08:03:52.000000', 1, '2024-07-24 08:03:52.000000', 1),
	(7, '43fd1461-4993-11ef-aa02-509a4cb5cc32', 'user07', '$2a$10$t2pvj2mXHsQFlGRnIRX9H.e5YK25xnbP8H15NhSlGx6d3OXMYZFgS', NULL, b'0', '2024-07-24 08:03:52.000000', 1, '2024-07-24 08:03:52.000000', 1),
	(8, '440ccaec-4993-11ef-aa02-509a4cb5cc32', 'user08', '$2a$10$t2pvj2mXHsQFlGRnIRX9H.e5YK25xnbP8H15NhSlGx6d3OXMYZFgS', NULL, b'0', '2024-07-24 08:03:52.000000', 1, '2024-07-24 08:03:52.000000', 1),
	(9, '441b5926-4993-11ef-aa02-509a4cb5cc32', 'user09', '$2a$10$t2pvj2mXHsQFlGRnIRX9H.e5YK25xnbP8H15NhSlGx6d3OXMYZFgS', NULL, b'0', '2024-07-24 08:03:52.000000', 1, '2024-07-24 08:03:52.000000', 1),
	(10, '443f0bca-4993-11ef-aa02-509a4cb5cc32', 'user10', '$2a$10$t2pvj2mXHsQFlGRnIRX9H.e5YK25xnbP8H15NhSlGx6d3OXMYZFgS', NULL, b'0', '2024-07-24 08:03:52.000000', 1, '2024-07-24 08:03:52.000000', 1),
	(11, '444b14e1-4993-11ef-aa02-509a4cb5cc32', 'user11', '$2a$10$t2pvj2mXHsQFlGRnIRX9H.e5YK25xnbP8H15NhSlGx6d3OXMYZFgS', NULL, b'0', '2024-07-24 08:03:52.000000', 1, '2024-07-24 08:03:52.000000', 1),
	(12, '4459852f-4993-11ef-aa02-509a4cb5cc32', 'user12', '$2a$10$t2pvj2mXHsQFlGRnIRX9H.e5YK25xnbP8H15NhSlGx6d3OXMYZFgS', NULL, b'0', '2024-07-24 08:03:52.000000', 1, '2024-07-24 08:03:52.000000', 1),
	(13, '4465e9ed-4993-11ef-aa02-509a4cb5cc32', 'user13', '$2a$10$t2pvj2mXHsQFlGRnIRX9H.e5YK25xnbP8H15NhSlGx6d3OXMYZFgS', NULL, b'0', '2024-07-24 08:03:52.000000', 1, '2024-07-24 08:03:52.000000', 1);

-- Dumping structure for table wbc.user_ext
CREATE TABLE IF NOT EXISTS `user_ext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT uuid(),
  `user_id` int(11) DEFAULT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `m_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.user_ext: ~0 rows (approximately)
REPLACE INTO `user_ext` (`id`, `guid`, `user_id`, `f_name`, `m_name`, `l_name`, `email`, `addr`, `phone01`, `phone02`, `phone03`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, NULL, 1, 'WBC', NULL, 'Admin', 'admin@wbc.com', NULL, '0903.123456', NULL, NULL, NULL, b'0', '2024-07-24 08:03:51', 1, '2024-07-24 08:03:51', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table wbc.user_role: ~14 rows (approximately)
REPLACE INTO `user_role` (`id`, `guid`, `user_id`, `role_id`, `remark`, `is_deleted`, `ins_at`, `ins_by`, `upd_at`, `upd_by`) VALUES
	(1, NULL, 1, 1, NULL, b'0', '2024-07-24 08:03:51', 1, '2024-07-24 08:03:51', 1),
	(2, NULL, 1, 2, NULL, b'0', '2024-07-24 08:03:51', 1, '2024-07-24 08:03:51', 1),
	(3, NULL, 2, 1, NULL, b'0', '2024-07-24 08:03:51', 1, '2024-07-24 08:03:51', 1),
	(4, NULL, 3, 1, NULL, b'0', '2024-07-24 08:03:51', 1, '2024-07-24 08:03:51', 1),
	(5, NULL, 4, 1, NULL, b'0', '2024-07-24 08:03:51', 1, '2024-07-24 08:03:51', 1),
	(6, NULL, 5, 1, NULL, b'0', '2024-07-24 08:03:51', 1, '2024-07-24 08:03:51', 1),
	(7, NULL, 6, 1, NULL, b'0', '2024-07-24 08:03:52', 1, '2024-07-24 08:03:52', 1),
	(8, NULL, 7, 1, NULL, b'0', '2024-07-24 08:03:52', 1, '2024-07-24 08:03:52', 1),
	(9, NULL, 8, 1, NULL, b'0', '2024-07-24 08:03:52', 1, '2024-07-24 08:03:52', 1),
	(10, NULL, 9, 1, NULL, b'0', '2024-07-24 08:03:52', 1, '2024-07-24 08:03:52', 1),
	(11, NULL, 10, 1, NULL, b'0', '2024-07-24 08:03:52', 1, '2024-07-24 08:03:52', 1),
	(12, NULL, 11, 1, NULL, b'0', '2024-07-24 08:03:52', 1, '2024-07-24 08:03:52', 1),
	(13, NULL, 12, 1, NULL, b'0', '2024-07-24 08:03:52', 1, '2024-07-24 08:03:52', 1),
	(14, NULL, 13, 1, NULL, b'0', '2024-07-24 08:03:52', 1, '2024-07-24 08:03:52', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
