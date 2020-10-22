/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.1.24-MariaDB : Database - mammography
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mammography` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mammography`;

/*Table structure for table `beneficiary` */

DROP TABLE IF EXISTS `beneficiary`;

CREATE TABLE `beneficiary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `location_id` bigint(20) DEFAULT NULL,
  `mammography` tinyint(1) DEFAULT NULL,
  `pap_smear` tinyint(1) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `mobile_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_code` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deliveries_no` int(11) DEFAULT NULL,
  `abortion` int(11) DEFAULT NULL,
  `last_menses` date DEFAULT NULL,
  `personal_history` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `family_history` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_LOC_ID` (`location_id`),
  CONSTRAINT `beneficiary___fk_loc_id` FOREIGN KEY (`location_id`) REFERENCES `location_code` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `beneficiary` */

insert  into `beneficiary`(`id`,`first_name`,`last_name`,`age`,`address`,`location_id`,`mammography`,`pap_smear`,`created_by`,`updated_by`,`created_at`,`updated_at`,`mobile_no`,`location_code`,`deliveries_no`,`abortion`,`last_menses`,`personal_history`,`family_history`) values 
(13,'ASKLJDK','AHASJ',12,'YASDlasdfkkasl;',NULL,0,1,NULL,NULL,'2018-06-13 10:46:51','2018-06-19 05:53:34','9655656512',NULL,0,0,'2018-06-05','sdasdadsaas','asdasdas'),
(15,'aaaaa','Deshmukh',22,'Ghanshyam Nagar, Saturna ,Amravati.',NULL,0,1,NULL,NULL,'2018-06-17 17:01:16','2018-06-20 08:25:18','9405430795',NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `beneficiary_details` */

DROP TABLE IF EXISTS `beneficiary_details`;

CREATE TABLE `beneficiary_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `beneficiary_id` bigint(20) NOT NULL,
  `mamo_report` set('positive','negative','Not applicable') COLLATE utf8_unicode_ci DEFAULT NULL,
  `pap_report` set('positive','negative','Not applicable') COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo.1` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo.2` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo.3` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo.4` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bus_dr_desc` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bus_dr_updated_by` bigint(20) DEFAULT NULL,
  `pdmmc_dr_updated_by` bigint(20) DEFAULT NULL,
  `pdmmc_dr_updated_at` datetime DEFAULT NULL,
  `pdmmc_dr_mamo_desc` text COLLATE utf8_unicode_ci,
  `pdmmc_dr_pap_desc` text COLLATE utf8_unicode_ci,
  `pap_slide_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_BENE_ID` (`beneficiary_id`),
  CONSTRAINT `FK_BENE_ID` FOREIGN KEY (`beneficiary_id`) REFERENCES `beneficiary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `beneficiary_details` */

/*Table structure for table `designation` */

DROP TABLE IF EXISTS `designation`;

CREATE TABLE `designation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `designation` */

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `designation_id` bigint(20) NOT NULL,
  `mobile_no` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` set('Male','Female') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DESG_ID` (`designation_id`),
  CONSTRAINT `FK_DESG_ID` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee` */

/*Table structure for table `location_code` */

DROP TABLE IF EXISTS `location_code`;

CREATE TABLE `location_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `loc_code` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `location_code` */

insert  into `location_code`(`id`,`location`,`date`,`loc_code`,`updated_at`,`created_at`) values 
(18,'varud','2018-06-18','VAR_18_06_2018','2018-06-20 08:38:08','2018-06-17 14:11:30'),
(19,'Varud','2018-06-20','VAR_20_06_2018','2018-06-17 14:12:04','2018-06-17 14:12:04'),
(21,'Achalpur','2018-06-14','ACH_14_06_2018','2018-06-18 16:02:13','2018-06-18 16:02:13'),
(22,'qwert','2018-06-15','QWE_15_06_2018','2018-06-18 16:02:43','2018-06-18 16:02:43');

/*Table structure for table `organizer_details` */

DROP TABLE IF EXISTS `organizer_details`;

CREATE TABLE `organizer_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) NOT NULL,
  `organizer` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coordinate_name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_OD_LOC_ID` (`location_id`),
  CONSTRAINT `FK_OD_LOC_ID` FOREIGN KEY (`location_id`) REFERENCES `location_code` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `organizer_details` */

insert  into `organizer_details`(`id`,`location_id`,`organizer`,`coordinate_name`,`mobile_no`,`address`,`updated_at`,`created_at`) values 
(11,18,'ABC','XYZ','1234567890','Sainagar','2018-06-20 08:38:08','2018-06-17 14:11:30'),
(12,19,'qwe','asd','7889999999','rajapeth','2018-06-17 14:12:04','2018-06-17 14:12:04'),
(14,21,'qwer rty','asdf hjk','5625689562','cukhbfm huwfhm hi','2018-06-18 16:02:13','2018-06-18 16:02:13'),
(15,22,'xcvb utrd','jyht','132156516','gb  rt nt','2018-06-18 16:02:43','2018-06-18 16:02:43');

/*Table structure for table `report_summary` */

DROP TABLE IF EXISTS `report_summary`;

CREATE TABLE `report_summary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) NOT NULL,
  `total_beneficiaries` int(11) DEFAULT NULL,
  `mamo_count` int(11) DEFAULT NULL,
  `pap_count` int(11) DEFAULT NULL,
  `mamo_positives` int(11) DEFAULT NULL,
  `pap_positives` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_RS_LOC_ID` (`location_id`),
  CONSTRAINT `FK_RS_LOC_ID` FOREIGN KEY (`location_id`) REFERENCES `location_code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `report_summary` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
