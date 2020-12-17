/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.11-MariaDB : Database - cmss
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cmss` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cmss`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `admin_id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`admin_id`,`name`,`password`,`remarks`) values 
(1,'admin1','0000','temp');

/*Table structure for table `complain` */

DROP TABLE IF EXISTS `complain`;

CREATE TABLE `complain` (
  `complain_id` int(100) NOT NULL AUTO_INCREMENT,
  `complain_cat_id` int(10) DEFAULT NULL,
  `std_reg_id` int(10) DEFAULT NULL,
  `complain` varchar(400) DEFAULT NULL,
  `location` text DEFAULT NULL,
  `datetime` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `status` int(10) unsigned NOT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`complain_id`),
  KEY `std_reg_id` (`std_reg_id`),
  KEY `complain_cat_id` (`complain_cat_id`),
  CONSTRAINT `complain_ibfk_1` FOREIGN KEY (`std_reg_id`) REFERENCES `registration` (`std_reg_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `complain_ibfk_2` FOREIGN KEY (`complain_cat_id`) REFERENCES `complain_category` (`complain_cat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `complain` */

insert  into `complain`(`complain_id`,`complain_cat_id`,`std_reg_id`,`complain`,`location`,`datetime`,`status`,`remarks`) values 
(22,1,2,'1234','C:\\Users\\Adnan\\Desktop/uploads/1 sameerhussain/16-12-2020 10-48 AM/.classpath','2020-12-16 12:14:08.570297',0,NULL);

/*Table structure for table `complain_category` */

DROP TABLE IF EXISTS `complain_category`;

CREATE TABLE `complain_category` (
  `complain_cat_id` int(10) NOT NULL AUTO_INCREMENT,
  `category` varchar(20) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`complain_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `complain_category` */

insert  into `complain_category`(`complain_cat_id`,`category`,`remarks`) values 
(1,'Faculty','hello');

/*Table structure for table `registration` */

DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `std_reg_id` int(10) NOT NULL AUTO_INCREMENT,
  `std_id` int(10) DEFAULT NULL,
  `cnic` varchar(13) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `datetime` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`std_reg_id`),
  KEY `std_id` (`std_id`),
  CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `student` (`std_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `registration` */

insert  into `registration`(`std_reg_id`,`std_id`,`cnic`,`password`,`datetime`) values 
(1,2,'2147483647','1234','2020-12-01 15:04:48.000000'),
(2,1,'412049999','1234','2020-12-02 22:08:59.000000'),
(4,3,'23423','123','2020-12-03 12:13:40.000000');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `std_id` int(10) NOT NULL AUTO_INCREMENT,
  `std_name` varchar(40) DEFAULT NULL,
  `father_name` varchar(40) DEFAULT NULL,
  `surname` varchar(20) DEFAULT NULL,
  `religion` varchar(20) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `gender` varchar(13) DEFAULT NULL,
  `roll_num` varchar(13) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `program` varchar(10) DEFAULT NULL,
  `batch` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`std_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `student` */

insert  into `student`(`std_id`,`std_name`,`father_name`,`surname`,`religion`,`country`,`gender`,`roll_num`,`department`,`program`,`batch`) values 
(1,'sameerhussain','Tasleemhussain','syed','islam','pk','male','2k17/ite/1','InformatioTechnology','bs','2017'),
(2,'zafar','zafarkAbba','bhutto','islam','mars','female','2k17/bba/2','businessA','bs','2015'),
(3,'asad','fdasj','kori','islam','pk','male','2k10/eng/3','English','bs','2010');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
