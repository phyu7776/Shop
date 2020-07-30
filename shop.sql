-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.4-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.6047
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- shop 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `shop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `shop`;

-- 테이블 shop.goods_category 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods_category` (
  `cateName` varchar(20) NOT NULL,
  `cateCode` varchar(30) NOT NULL,
  `cateCodeRef` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cateCode`),
  KEY `cateCodeRef` (`cateCodeRef`),
  CONSTRAINT `goods_category_ibfk_1` FOREIGN KEY (`cateCodeRef`) REFERENCES `goods_category` (`cateCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 함수 shop.nextval 구조 내보내기
DELIMITER //
CREATE FUNCTION `nextval`(the_name varchar(32)) RETURNS bigint(20) unsigned
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE ret BIGINT UNSIGNED;
    UPDATE TB_SEQUENCES SET currval=currval+1 WHERE name=the_name;
    SELECT currval INTO ret FROM TB_SEQUENCES WHERE name=the_name limit 1;
    RETURN ret;
END//
DELIMITER ;

-- 테이블 shop.tbl_cart 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_cart` (
  `cartNum` int(11) NOT NULL,
  `userId` varchar(50) NOT NULL,
  `gdsNum` int(11) NOT NULL,
  `cartStock` int(11) NOT NULL,
  `addDATE` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`cartNum`,`userId`),
  KEY `tbl_cart_userId` (`userId`),
  KEY `tbl_cart_gdsNum` (`gdsNum`),
  CONSTRAINT `tbl_cart_gdsNum` FOREIGN KEY (`gdsNum`) REFERENCES `tbl_goods` (`gdsNum`),
  CONSTRAINT `tbl_cart_userId` FOREIGN KEY (`userId`) REFERENCES `tbl_member` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.tbl_cart_seq 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_cart_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.tbl_goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_goods` (
  `gdsNum` int(11) NOT NULL AUTO_INCREMENT,
  `gdsName` varchar(50) NOT NULL,
  `cateCode` varchar(30) NOT NULL,
  `gdsPrice` int(11) DEFAULT NULL,
  `gdsStock` int(11) DEFAULT NULL,
  `gdsDes` varchar(500) NOT NULL,
  `gdsImg` varchar(200) DEFAULT NULL,
  `gdsDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `gdsThumbImg` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`gdsNum`),
  KEY `fk_goos_category` (`cateCode`),
  CONSTRAINT `fk_goos_category` FOREIGN KEY (`cateCode`) REFERENCES `goods_category` (`cateCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2015 DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.tbl_goods_seq 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_goods_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.tbl_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_member` (
  `userId` varchar(50) NOT NULL,
  `userPass` varchar(100) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `userPhon` varchar(20) NOT NULL,
  `userAddr` varchar(20) DEFAULT NULL,
  `userAddr2` varchar(20) DEFAULT NULL,
  `userAddr3` varchar(20) DEFAULT NULL,
  `regiDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `verify` int(11) DEFAULT 0,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.tbl_order 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_order` (
  `orderId` varchar(50) NOT NULL,
  `userId` varchar(50) NOT NULL,
  `orderRec` varchar(50) NOT NULL,
  `userAddr1` varchar(100) DEFAULT NULL,
  `userAddr2` varchar(100) DEFAULT NULL,
  `userAddr3` varchar(100) DEFAULT NULL,
  `orderPhon` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `delivery` varchar(20) DEFAULT '배송준비',
  PRIMARY KEY (`orderId`),
  KEY `tbl_order_userId` (`userId`),
  CONSTRAINT `tbl_order_userId` FOREIGN KEY (`userId`) REFERENCES `tbl_member` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.tbl_order_details 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_order_details` (
  `orderDetailsNum` int(11) NOT NULL,
  `orderId` varchar(50) NOT NULL,
  `gdsNum` int(11) NOT NULL,
  `cartStock` int(11) NOT NULL,
  PRIMARY KEY (`orderDetailsNum`),
  KEY `tbl_order_details_orderId` (`orderId`),
  CONSTRAINT `tbl_order_details_orderId` FOREIGN KEY (`orderId`) REFERENCES `tbl_order` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.tbl_order_details_seq 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_order_details_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.tbl_reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_reply` (
  `gdsNum` int(11) NOT NULL,
  `userId` varchar(50) NOT NULL,
  `repNum` int(11) NOT NULL,
  `repCon` varchar(2000) NOT NULL,
  `repDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`gdsNum`,`repNum`),
  KEY `tbl_reply_userId` (`userId`),
  CONSTRAINT `tbl_reply_gdsNum` FOREIGN KEY (`gdsNum`) REFERENCES `tbl_goods` (`gdsNum`),
  CONSTRAINT `tbl_reply_userId` FOREIGN KEY (`userId`) REFERENCES `tbl_member` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 shop.tbl_reply_seq 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_reply_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
