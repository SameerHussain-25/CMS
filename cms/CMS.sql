/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.37-MariaDB : Database - cmss
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cmss` /*!40100 DEFAULT CHARACTER SET latin1 */;

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

insert  into `admin`(`admin_id`,`name`,`password`,`remarks`) values (1,'admin1','0000','temp');

/*Table structure for table `complain` */

DROP TABLE IF EXISTS `complain`;

CREATE TABLE `complain` (
  `complain_id` int(100) NOT NULL AUTO_INCREMENT,
  `complain_cat_id` int(10) DEFAULT NULL,
  `std_reg_id` int(10) DEFAULT NULL,
  `complain` varchar(400) DEFAULT NULL,
  `location` text,
  `datetime` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `status` int(10) unsigned NOT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`complain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `complain` */

insert  into `complain`(`complain_id`,`complain_cat_id`,`std_reg_id`,`complain`,`location`,`datetime`,`status`,`remarks`) values (1,1,1,'12312312123',NULL,'2020-12-15 16:23:53.011553',1,NULL),(2,1,2,'2',NULL,'2020-12-12 14:43:38.672996',0,NULL),(3,2,1,'3333333',NULL,'2020-12-12 15:16:24.798223',0,NULL),(4,3,2,'asdfjklladks','C:\\Users\\MY-Laptop\\Downloads\\eclipse/uploads/2k17/ite/1/2020 12 15 13_23_39/CMS.sql','2020-12-15 08:23:39.000000',0,NULL),(5,1,2,'ok ok','C:\\Users\\MY-Laptop\\Downloads\\eclipse/uploads/2k17/ite/1/2020 12 15 13_39_25/query.sql','2020-12-15 08:39:25.000000',0,NULL),(6,2,1,'78','C:\\Users\\MY-Laptop\\Downloads\\eclipse/uploads/2k17/bba/2/2020 12 15 16_16_45/query.sql','2020-12-15 16:24:32.994096',1,NULL),(7,1,2,'hgjh','C:\\Users\\MY-Laptop\\Downloads\\eclipse/uploads/2k17/ite/1/15-12-2020 11-29 PM/query.sql','2020-12-16 10:55:16.314887',1,NULL),(8,3,2,'ashdjkfhksdjhfjlhs','C:\\Users\\MY-Laptop\\Downloads\\eclipse/uploads/1 sameerhussain/18-12-2020 03-49 PM/query.sql','2020-12-18 15:52:52.059733',1,NULL),(9,3,2,'hhhjhjh','C:\\Users\\MY-Laptop\\Downloads\\eclipse/uploads/1 sameerhussain/18-12-2020 05-31 PM/CMS.sql','2020-12-18 17:35:57.555533',1,NULL),(10,2,1,'jsldfhjash','C:\\Users\\MY-Laptop\\Downloads\\eclipse/uploads/2 zafar/22-12-2020 01-44 PM/CMS.sql','2020-12-22 13:45:30.952909',1,NULL),(11,1,2,'xyz','C:\\Users\\MY-Laptop\\Downloads\\eclipse/uploads/1 sameerhussain/28-12-2020 04-20 PM/CMS.sql','2020-12-28 16:23:42.781187',1,NULL);

/*Table structure for table `complain_category` */

DROP TABLE IF EXISTS `complain_category`;

CREATE TABLE `complain_category` (
  `complain_cat_id` int(10) NOT NULL AUTO_INCREMENT,
  `category` varchar(20) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`complain_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `complain_category` */

insert  into `complain_category`(`complain_cat_id`,`category`,`remarks`) values (1,'faculty',NULL),(2,'transport',NULL),(3,'managment',NULL),(4,'others',NULL);

/*Table structure for table `registration` */

DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `std_reg_id` int(10) NOT NULL AUTO_INCREMENT,
  `std_id` int(10) DEFAULT NULL,
  `cnic` int(30) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `datetime` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`std_reg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `registration` */

insert  into `registration`(`std_reg_id`,`std_id`,`cnic`,`password`,`datetime`) values (1,2,2147483647,'1234','2020-12-01 15:04:48.000000'),(2,1,412049999,'1234','2020-12-02 22:08:59.000000'),(3,4,12330914,'1111','2020-12-02 22:19:36.000000'),(4,3,23423,'123','2020-12-03 12:13:40.000000'),(5,5,7789,'123','2020-12-03 12:19:33.000000');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `student` */

insert  into `student`(`std_id`,`std_name`,`father_name`,`surname`,`religion`,`country`,`gender`,`roll_num`,`department`,`program`,`batch`) values (1,'sameerhussain','Tasleemhussain','syed','islam','pk','male','2k17/ite/1','InformatioTechnology','bs','2017'),(2,'zafar','zafarkAbba','bhutto','islam','mars','female','2k17/bba/2','businessA','bs','2015'),(3,'asad','fdasj','kori','islam','pk','male','2k10/eng/3','English','bs','2010'),(4,'sumair','tasleemhussain','syed','islam','pk','make','2k17/swe/4','software','en','2020'),(5,'ali','hjh','hjh','kj','jk','kl','2','jkk','kl','09'),(6,'kjk',NULL,NULL,NULL,NULL,NULL,'3','islamiyat','bs','2019'),(7,'sheraz',NULL,NULL,NULL,NULL,NULL,'4','urdu','bs','2020'),(8,'asad',NULL,NULL,NULL,NULL,NULL,'5','textile','bs','2012'),(9,'anas','ahmed',NULL,'islam',NULL,NULL,'6',NULL,NULL,NULL),(10,'ahmed',NULL,NULL,NULL,NULL,NULL,'7',NULL,NULL,NULL),(12,'newstd',NULL,NULL,NULL,NULL,NULL,'9',NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
