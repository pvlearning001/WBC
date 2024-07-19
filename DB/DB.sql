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
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Remark` varchar(1028) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InsAt` datetime DEFAULT utc_timestamp(),
  `InsBy` int(11) DEFAULT 1,
  `UpdAt` datetime DEFAULT utc_timestamp(),
  `UpdBy` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table wbc.course
CREATE TABLE IF NOT EXISTS `course` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ModuleId` int(11) NOT NULL DEFAULT 0,
  `DateFrom` date DEFAULT NULL,
  `DateTo` date DEFAULT NULL,
  `Duration` varchar(255) DEFAULT NULL,
  `Remark` varchar(1028) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InsAt` datetime DEFAULT utc_timestamp(),
  `InsBy` int(11) DEFAULT 1,
  `UpdAt` datetime DEFAULT utc_timestamp(),
  `UpdBy` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table wbc.exam
CREATE TABLE IF NOT EXISTS `exam` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ModuleId` int(11) NOT NULL DEFAULT 0,
  `DateFrom` date DEFAULT NULL,
  `TimeTo` time DEFAULT NULL,
  `Duration` varchar(255) DEFAULT NULL,
  `Remark` varchar(1028) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InsAt` datetime DEFAULT utc_timestamp(),
  `InsBy` int(11) DEFAULT 1,
  `UpdAt` datetime DEFAULT utc_timestamp() ON UPDATE current_timestamp(),
  `UpdBy` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table wbc.introduce
CREATE TABLE IF NOT EXISTS `introduce` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `History` varchar(2056) DEFAULT NULL,
  `HierarchyMap` varchar(255) DEFAULT NULL,
  `Remark` varchar(1028) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InsAt` datetime DEFAULT utc_timestamp(),
  `InsBy` int(11) DEFAULT 1,
  `UpdAt` datetime DEFAULT utc_timestamp(),
  `UpdBy` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table wbc.invalidatedtoken
CREATE TABLE IF NOT EXISTS `invalidatedtoken` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ModuleId` int(11) NOT NULL DEFAULT 0,
  `DateFrom` date DEFAULT NULL,
  `TimeTo` time DEFAULT NULL,
  `Duration` varchar(255) DEFAULT NULL,
  `Remark` varchar(1028) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InsAt` datetime DEFAULT utc_timestamp(),
  `InsBy` int(11) DEFAULT 1,
  `UpdAt` datetime DEFAULT utc_timestamp() ON UPDATE current_timestamp(),
  `UpdBy` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table wbc.invalidated_token
CREATE TABLE IF NOT EXISTS `invalidated_token` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `tokenguid` varchar(255) DEFAULT NULL,
  `ExpiryTime` datetime DEFAULT NULL,
  `Remark` varchar(1028) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InsAt` datetime DEFAULT utc_timestamp(),
  `InsBy` int(11) DEFAULT 1,
  `UpdAt` datetime DEFAULT utc_timestamp() ON UPDATE current_timestamp(),
  `UpdBy` int(11) DEFAULT 1,
  `expiry_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table wbc.markresult
CREATE TABLE IF NOT EXISTS `markresult` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `ExamId` int(11) DEFAULT NULL,
  `MarkTypeId` int(11) DEFAULT NULL,
  `Mark` float DEFAULT NULL,
  `Remark` varchar(1028) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InsAt` datetime DEFAULT utc_timestamp(),
  `InsBy` int(11) DEFAULT 1,
  `UpdAt` datetime DEFAULT utc_timestamp(),
  `UpdBy` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table wbc.markresultsum
CREATE TABLE IF NOT EXISTS `markresultsum` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `Mark` float DEFAULT NULL,
  `Remark` varchar(1028) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InsAt` datetime DEFAULT utc_timestamp(),
  `InsBy` int(11) DEFAULT 1,
  `UpdAt` datetime DEFAULT utc_timestamp(),
  `UpdBy` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table wbc.marktype
CREATE TABLE IF NOT EXISTS `marktype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Remark` varchar(1028) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InsAt` datetime DEFAULT utc_timestamp(),
  `InsBy` int(11) DEFAULT 1,
  `UpdAt` datetime DEFAULT utc_timestamp(),
  `UpdBy` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table wbc.marktypehistory
CREATE TABLE IF NOT EXISTS `marktypehistory` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Remark` varchar(1028) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InsAt` datetime DEFAULT utc_timestamp(),
  `InsBy` int(11) DEFAULT 1,
  `UpdAt` datetime DEFAULT utc_timestamp(),
  `UpdBy` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table wbc.module
CREATE TABLE IF NOT EXISTS `module` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Remark` varchar(1028) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InsAt` datetime DEFAULT utc_timestamp(),
  `InsBy` int(11) DEFAULT 1,
  `UpdAt` datetime DEFAULT utc_timestamp(),
  `UpdBy` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table wbc.news
CREATE TABLE IF NOT EXISTS `news` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CateId` int(11) NOT NULL DEFAULT 0,
  `Subject` varchar(512) DEFAULT NULL,
  `Content` varchar(1028) DEFAULT NULL,
  `ContentEx01` varchar(1028) DEFAULT NULL,
  `ContentEx02` varchar(1028) DEFAULT NULL,
  `ContentEx03` varchar(1028) DEFAULT NULL,
  `Remark` varchar(1028) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InsAt` datetime DEFAULT utc_timestamp(),
  `InsBy` int(11) DEFAULT 1,
  `UpdAt` datetime DEFAULT utc_timestamp(),
  `UpdBy` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK_userext_user` (`CateId`) USING BTREE,
  CONSTRAINT `FK_news_category` FOREIGN KEY (`CateId`) REFERENCES `category` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table wbc.permission
CREATE TABLE IF NOT EXISTS `permission` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `Remark` varchar(1028) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InsAt` datetime DEFAULT utc_timestamp(),
  `InsBy` int(11) DEFAULT 1,
  `UpdAt` datetime DEFAULT utc_timestamp(),
  `UpdBy` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table wbc.registerform
CREATE TABLE IF NOT EXISTS `registerform` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Info01` varchar(255) DEFAULT NULL,
  `Info02` varchar(255) DEFAULT NULL,
  `Info03` varchar(255) DEFAULT NULL,
  `Info04` varchar(255) DEFAULT NULL,
  `Info05` varchar(255) DEFAULT NULL,
  `Info06` varchar(255) DEFAULT NULL,
  `Info07` varchar(255) DEFAULT NULL,
  `Info08` varchar(255) DEFAULT NULL,
  `Info09` varchar(255) DEFAULT NULL,
  `Info10` varchar(255) DEFAULT NULL,
  `Info11` varchar(255) DEFAULT NULL,
  `Info12` varchar(255) DEFAULT NULL,
  `Remark` varchar(1028) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InsAt` datetime DEFAULT utc_timestamp(),
  `InsBy` int(11) DEFAULT 1,
  `UpdAt` datetime DEFAULT utc_timestamp(),
  `UpdBy` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table wbc.role
CREATE TABLE IF NOT EXISTS `role` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `name_lower_cases` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `Remark` varchar(1028) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InsAt` datetime DEFAULT utc_timestamp(),
  `InsBy` int(11) DEFAULT 1,
  `UpdAt` datetime DEFAULT utc_timestamp(),
  `UpdBy` int(11) DEFAULT 1,
  `is_deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table wbc.rolepermission
CREATE TABLE IF NOT EXISTS `rolepermission` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` int(11) DEFAULT NULL,
  `PermissionId` int(11) DEFAULT NULL,
  `Remark` varchar(1028) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InsAt` datetime DEFAULT utc_timestamp(),
  `InsBy` int(11) DEFAULT 1,
  `UpdAt` datetime DEFAULT utc_timestamp(),
  `UpdBy` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table wbc.user
CREATE TABLE IF NOT EXISTS `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Remark` varchar(1028) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InsAt` datetime NOT NULL DEFAULT utc_timestamp(),
  `InsBy` int(11) NOT NULL DEFAULT 1,
  `UpdAt` datetime NOT NULL DEFAULT utc_timestamp(),
  `UpdBy` int(11) DEFAULT 1,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table wbc.userext
CREATE TABLE IF NOT EXISTS `userext` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL DEFAULT 0,
  `FName` varchar(50) DEFAULT NULL,
  `MName` varchar(50) DEFAULT NULL,
  `LName` varchar(50) DEFAULT NULL,
  `Email` varchar(128) DEFAULT NULL,
  `Addr` varchar(512) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Thumb` varchar(512) DEFAULT NULL,
  `Remark` varchar(1028) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InsAt` datetime DEFAULT utc_timestamp(),
  `InsBy` int(11) DEFAULT 1,
  `UpdAt` datetime DEFAULT utc_timestamp(),
  `UpdBy` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK_userext_user` (`UserId`),
  CONSTRAINT `FK_userext_user` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table wbc.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `roles_id` int(11) NOT NULL,
  `Remark` varchar(1028) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InsAt` datetime DEFAULT utc_timestamp(),
  `InsBy` int(11) DEFAULT 1,
  `UpdAt` datetime DEFAULT utc_timestamp(),
  `UpdBy` int(11) DEFAULT 1,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK_userrole_user` (`user_id`) USING BTREE,
  KEY `FK_userrole_role` (`roles_id`) USING BTREE,
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`roles_id`) REFERENCES `role` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
