/*
SQLyog - Free MySQL GUI v5.02
Host - 5.6.10 : Database - lockit
*********************************************************************
Server version : 5.6.10
*/


create database if not exists `lockit`;

USE `lockit`;

SET FOREIGN_KEY_CHECKS=0;

/*Table structure for table `deletefiles_history` */

DROP TABLE IF EXISTS `deletefiles_history`;

CREATE TABLE `deletefiles_history` (
  `FileID` int(4) DEFAULT NULL,
  `UserID` varchar(128) DEFAULT NULL,
  `DeletedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(128) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `deletefiles_history` */

LOCK TABLES `deletefiles_history` WRITE;

insert into `deletefiles_history` values 
(24,'aaa@amail.com','2013-12-04 14:39:53','aaa@amail.com','2013-12-04 14:39:53'),
(1,'aaa@amail.com','2013-12-04 17:26:48','aaa@amail.com','2013-12-04 17:26:48'),
(30,'aaa@amail.com','2013-12-04 17:26:51','aaa@amail.com','2013-12-04 17:26:51'),
(25,'aaa@amail.com','2013-12-04 17:26:54','aaa@amail.com','2013-12-04 17:26:54'),
(31,'aaa@amail.com','2013-12-04 17:49:56','aaa@amail.com','2013-12-04 17:49:56'),
(31,'aaa@amail.com','2013-12-04 18:14:03','aaa@amail.com','2013-12-04 18:14:03'),
(31,'aaa@amail.com','2013-12-04 18:15:13','aaa@amail.com','2013-12-04 18:15:13'),
(58,'aditya@verudix.com','2013-12-04 21:07:57','aditya@verudix.com','2013-12-04 21:07:57'),
(88,'nag@nag.com','2013-12-06 18:12:13','nag@nag.com','2013-12-06 18:12:13'),
(179,'rukmini.keerthi02@gmail.com','2013-12-11 18:25:22','rukmini.keerthi02@gmail.com','2013-12-11 18:25:22'),
(180,'rukmini.keerthi02@gmail.com','2013-12-11 18:31:03','rukmini.keerthi02@gmail.com','2013-12-11 18:31:03'),
(179,'rukmini.keerthi02@gmail.com','2013-12-11 18:31:13','rukmini.keerthi02@gmail.com','2013-12-11 18:31:13');

UNLOCK TABLES;

/*Table structure for table `file_share` */

DROP TABLE IF EXISTS `file_share`;

CREATE TABLE `file_share` (
  `UserID` varchar(128) DEFAULT NULL,
  `FileID` int(11) DEFAULT NULL,
  `Print` tinyint(1) DEFAULT NULL,
  `Download` tinyint(1) DEFAULT NULL,
  `Sharing` tinyint(1) DEFAULT NULL,
  `Annotate` tinyint(1) DEFAULT NULL,
  `PrintScreen` tinyint(1) DEFAULT NULL,
  `RedAct` tinyint(1) DEFAULT NULL,
  `IsFolder` int(1) DEFAULT '0',
  `SharedDatetime` datetime DEFAULT NULL,
  `ExpiredDatetime` datetime DEFAULT NULL,
  `ViewStatus` tinyint(1) DEFAULT '0',
  `CreatedBy` varchar(128) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(128) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `file_share` */

LOCK TABLES `file_share` WRITE;

insert into `file_share` values 
('hhh@hmail.com',2,1,1,1,1,1,1,0,'2013-11-28 13:46:26','1969-01-01 00:00:00',0,'hhh@hmail.com','2013-11-28 13:46:26',NULL,NULL),
('hhh@hmail.com',3,1,1,1,1,1,1,0,'2013-11-28 13:54:38','1969-01-01 00:00:00',0,'hhh@hmail.com','2013-11-28 13:54:38',NULL,NULL),
('hhh@hmail.com',4,1,1,1,1,1,1,0,'2013-11-28 14:36:58','1969-01-01 00:00:00',0,'hhh@hmail.com','2013-11-28 14:36:58',NULL,NULL),
('hhh@hmail.com',5,1,1,1,1,1,1,0,'2013-11-28 14:52:24','1969-01-01 00:00:00',0,'hhh@hmail.com','2013-11-28 14:52:24',NULL,NULL),
('bbb@bmail.com',6,1,1,1,1,1,1,0,'2013-11-28 16:56:40','1969-01-01 00:00:00',0,'bbb@bmail.com','2013-11-28 16:56:40',NULL,NULL),
('bbb@bmail.com',7,1,1,1,1,1,1,0,'2013-11-28 17:21:57','1969-01-01 00:00:00',0,'bbb@bmail.com','2013-11-28 17:21:57',NULL,NULL),
('bbb@bmail.com',8,1,1,1,1,1,1,0,'2013-11-29 10:18:13','1969-01-01 00:00:00',0,'bbb@bmail.com','2013-11-29 10:18:13',NULL,NULL),
('aaa@amail.com',8,1,1,1,1,1,1,0,'2013-11-29 10:40:04','2013-11-29 11:40:04',0,'bbb@bmail.com','2013-11-29 10:40:04',NULL,NULL),
('keerthiv@gmail.com',9,1,1,1,1,1,1,0,'2013-11-29 10:51:10','1969-01-01 00:00:00',0,'keerthiv@gmail.com','2013-11-29 10:51:10',NULL,NULL),
('keerthiv@gmail.com',10,1,1,1,1,1,1,0,'2013-11-29 10:51:22','1969-01-01 00:00:00',0,'keerthiv@gmail.com','2013-11-29 10:51:22',NULL,NULL),
('aaa@amail.com',10,1,1,1,1,1,1,0,'2013-11-29 10:52:14','2013-11-30 11:52:14',0,'keerthiv@gmail.com','2013-11-29 10:52:14',NULL,NULL),
('eee@email.com',11,1,1,1,1,1,1,0,'2013-11-29 12:59:50','1969-01-01 00:00:00',0,'eee@email.com','2013-11-29 12:59:50',NULL,NULL),
('eee@email.com',12,1,1,1,1,1,1,0,'2013-11-29 13:16:13','1969-01-01 00:00:00',0,'eee@email.com','2013-11-29 13:16:13',NULL,NULL),
('eee@email.com',13,1,1,1,1,1,1,0,'2013-11-29 14:15:26','1969-01-01 00:00:00',0,'eee@email.com','2013-11-29 14:15:26',NULL,NULL),
('eee@email.com',14,1,1,1,1,1,1,0,'2013-11-29 16:45:48','1969-01-01 00:00:00',0,'eee@email.com','2013-11-29 16:45:48',NULL,NULL),
('helluvanag@gmail.com',15,1,1,1,1,1,1,0,'2013-11-29 18:51:20','1969-01-01 00:00:00',0,'helluvanag@gmail.com','2013-11-29 18:51:20',NULL,NULL),
('aaa@amail.com',16,1,1,1,1,1,1,0,'2013-12-02 11:35:11','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-02 11:35:11',NULL,NULL),
('aaa@amail.com',17,1,1,1,1,1,1,0,'2013-12-02 11:53:09','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-02 11:53:09',NULL,NULL),
('aaa@amail.com',18,1,1,1,1,1,1,0,'2013-12-02 12:19:11','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-02 12:19:11',NULL,NULL),
('aaa@amail.com',19,1,1,1,1,1,1,0,'2013-12-02 12:20:22','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-02 12:20:22',NULL,NULL),
('aaa@amail.com',20,1,1,1,1,1,1,0,'2013-12-02 12:20:41','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-02 12:20:41',NULL,NULL),
('eee@email.com',21,1,1,1,1,1,1,0,'2013-12-02 12:37:39','1969-01-01 00:00:00',0,'eee@email.com','2013-12-02 12:37:39',NULL,NULL),
('eee@email.com',22,1,1,1,1,1,1,0,'2013-12-02 12:37:53','1969-01-01 00:00:00',0,'eee@email.com','2013-12-02 12:37:53',NULL,NULL),
('bbb@bmail.com',18,0,0,0,1,1,1,0,'2013-12-02 18:18:00','2013-12-20 10:10:00',0,'aaa@amail.com','2013-12-02 18:18:00',NULL,NULL),
('bbb@bmail.com',17,0,0,0,1,1,1,0,'2013-12-03 12:21:33','2013-12-04 12:21:33',0,'aaa@amail.com','2013-12-03 12:21:33',NULL,NULL),
('bbb@bmail.com',20,1,1,1,1,1,1,0,'2013-12-03 15:23:39','2013-12-14 15:23:39',0,'aaa@amail.com','2013-12-03 15:23:39',NULL,NULL),
('helluvanag@gmail.com',18,1,1,1,1,1,1,0,'2013-12-03 16:09:56','2013-12-15 16:09:56',0,'aaa@amail.com','2013-12-03 16:09:56',NULL,NULL),
('eee@email.com',18,1,1,1,1,1,1,0,'2013-12-03 16:10:19','2013-12-03 16:10:19',0,'aaa@amail.com','2013-12-03 16:10:19',NULL,NULL),
('eee@email.com',17,1,1,1,1,1,1,0,'2013-12-03 16:10:57','2013-12-03 16:10:57',0,'aaa@amail.com','2013-12-03 16:10:57',NULL,NULL),
('a1@gmail.com',17,1,1,1,1,1,1,0,'2013-12-03 16:11:20','2013-12-04 16:11:20',0,'aaa@amail.com','2013-12-03 16:11:20',NULL,NULL),
('ccc@cmail.com',6,0,0,0,1,1,1,0,'2013-12-03 16:17:38','2013-12-03 16:17:38',0,'bbb@bmail.com','2013-12-03 16:17:38',NULL,NULL),
('ddd@dmail.com',6,0,0,0,1,1,1,0,'2013-12-03 16:20:56','2013-12-03 16:20:56',0,'bbb@bmail.com','2013-12-03 16:20:56',NULL,NULL),
('jj@gmail.com',6,0,0,0,1,1,1,0,'2013-12-03 16:32:38','2013-12-03 16:32:38',0,'bbb@bmail.com','2013-12-03 16:32:38',NULL,NULL),
('aaa@amail.com',23,1,1,1,1,1,1,0,'2013-12-04 14:21:21','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-04 14:21:21',NULL,NULL),
('aaa@amail.com',30,1,1,1,1,1,1,0,'2013-12-04 17:27:01','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-04 17:27:01',NULL,NULL),
('aaa@amail.com',31,1,1,1,1,1,1,0,'2013-12-04 18:15:39','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-04 18:15:39',NULL,NULL),
('aaa@amail.com',32,1,1,1,1,1,1,0,'2013-12-04 18:16:30','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-04 18:16:30',NULL,NULL),
('nag@nag.com',33,1,1,1,1,1,1,0,'2013-12-04 18:18:40','1969-01-01 00:00:00',0,'nag@nag.com','2013-12-04 18:18:40',NULL,NULL),
('nag@nag.com',34,1,1,1,1,1,1,0,'2013-12-04 18:19:55','1969-01-01 00:00:00',0,'nag@nag.com','2013-12-04 18:19:55',NULL,NULL),
('venu@verudix.com',35,1,1,1,1,1,1,0,'2013-12-04 18:22:26','1969-01-01 00:00:00',0,'venu@verudix.com','2013-12-04 18:22:26',NULL,NULL),
('venu@verudix.com',36,1,1,1,1,1,1,0,'2013-12-04 18:22:54','1969-01-01 00:00:00',0,'venu@verudix.com','2013-12-04 18:22:54',NULL,NULL),
('vishnu@verudix.com',38,1,1,1,1,1,1,0,'2013-12-04 18:55:15','1969-01-01 00:00:00',0,'vishnu@verudix.com','2013-12-04 18:55:15',NULL,NULL),
('aaa@amail.com',40,1,1,1,1,1,1,0,'2013-12-04 19:58:45','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-04 19:58:45',NULL,NULL),
('aaa@amail.com',41,1,1,1,1,1,1,0,'2013-12-04 19:58:54','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-04 19:58:54',NULL,NULL),
('aaa@amail.com',42,1,1,1,1,1,1,0,'2013-12-04 19:59:05','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-04 19:59:05',NULL,NULL),
('aaa@amail.com',43,1,1,1,1,1,1,0,'2013-12-04 19:59:36','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-04 19:59:36',NULL,NULL),
('aaa@amail.com',44,1,1,1,1,1,1,0,'2013-12-04 20:00:38','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-04 20:00:38',NULL,NULL),
('vishnu@verudix.com',46,1,1,1,1,1,1,0,'2013-12-04 20:10:48','1969-01-01 00:00:00',0,'vishnu@verudix.com','2013-12-04 20:10:48',NULL,NULL),
('vishnu@verudix.com',47,1,1,1,1,1,1,0,'2013-12-04 20:25:34','1969-01-01 00:00:00',0,'vishnu@verudix.com','2013-12-04 20:25:34',NULL,NULL),
('vishnu@verudix.com',48,1,1,1,1,1,1,0,'2013-12-04 20:51:56','1969-01-01 00:00:00',0,'vishnu@verudix.com','2013-12-04 20:51:56',NULL,NULL),
('vishnu@verudix.com',49,1,1,1,1,1,1,0,'2013-12-04 20:54:33','1969-01-01 00:00:00',0,'vishnu@verudix.com','2013-12-04 20:54:33',NULL,NULL),
('vishnu@verudix.com',50,1,1,1,1,1,1,0,'2013-12-04 20:59:22','1969-01-01 00:00:00',0,'vishnu@verudix.com','2013-12-04 20:59:22',NULL,NULL),
('vishnu@verudix.com',51,1,1,1,1,1,1,0,'2013-12-04 20:59:45','1969-01-01 00:00:00',0,'vishnu@verudix.com','2013-12-04 20:59:45',NULL,NULL),
('vishnu@verudix.com',52,1,1,1,1,1,1,0,'2013-12-04 21:00:04','1969-01-01 00:00:00',0,'vishnu@verudix.com','2013-12-04 21:00:04',NULL,NULL),
('aditya@verudix.com',53,1,1,1,1,1,1,0,'2013-12-04 21:04:33','1969-01-01 00:00:00',0,'aditya@verudix.com','2013-12-04 21:04:33',NULL,NULL),
('aditya@verudix.com',54,1,1,1,1,1,1,0,'2013-12-04 21:05:06','1969-01-01 00:00:00',0,'aditya@verudix.com','2013-12-04 21:05:06',NULL,NULL),
('aditya@verudix.com',55,1,1,1,1,1,1,0,'2013-12-04 21:05:25','1969-01-01 00:00:00',0,'aditya@verudix.com','2013-12-04 21:05:25',NULL,NULL),
('aditya@verudix.com',56,1,1,1,1,1,1,0,'2013-12-04 21:05:49','1969-01-01 00:00:00',0,'aditya@verudix.com','2013-12-04 21:05:49',NULL,NULL),
('aditya@verudix.com',57,1,1,1,1,1,1,0,'2013-12-04 21:06:01','1969-01-01 00:00:00',0,'aditya@verudix.com','2013-12-04 21:06:01',NULL,NULL),
('aditya@verudix.com',59,1,1,1,1,1,1,0,'2013-12-04 21:07:18','1969-01-01 00:00:00',0,'aditya@verudix.com','2013-12-04 21:07:18',NULL,NULL),
('aditya@verudix.com',60,1,1,1,1,1,1,0,'2013-12-04 21:08:05','1969-01-01 00:00:00',0,'aditya@verudix.com','2013-12-04 21:08:05',NULL,NULL),
('aaa@amail.com',61,1,1,1,1,1,1,0,'2013-12-04 21:08:38','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-04 21:08:38',NULL,NULL),
('aaa@amail.com',62,1,1,1,1,1,1,0,'2013-12-04 21:08:59','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-04 21:08:59',NULL,NULL),
('aaa@amail.com',63,1,1,1,1,1,1,0,'2013-12-04 21:09:30','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-04 21:09:30',NULL,NULL),
('aaa@amail.com',64,1,1,1,1,1,1,0,'2013-12-04 21:09:52','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-04 21:09:52',NULL,NULL),
('aditya@verudix.com',65,1,1,1,1,1,1,0,'2013-12-04 21:25:30','1969-01-01 00:00:00',0,'aditya@verudix.com','2013-12-04 21:25:30',NULL,NULL),
('aditya@verudix.com',66,1,1,1,1,1,1,0,'2013-12-04 21:27:10','1969-01-01 00:00:00',0,'aditya@verudix.com','2013-12-04 21:27:10',NULL,NULL),
('aditya@verudix.com',67,1,1,1,1,1,1,0,'2013-12-04 21:31:01','1969-01-01 00:00:00',0,'aditya@verudix.com','2013-12-04 21:31:01',NULL,NULL),
('aditya@verudix.com',68,1,1,1,1,1,1,0,'2013-12-04 21:31:17','1969-01-01 00:00:00',0,'aditya@verudix.com','2013-12-04 21:31:17',NULL,NULL),
('aditya@verudix.com',69,1,1,1,1,1,1,0,'2013-12-04 21:31:25','1969-01-01 00:00:00',0,'aditya@verudix.com','2013-12-04 21:31:25',NULL,NULL),
('aditya@verudix.com',70,1,1,1,1,1,1,0,'2013-12-04 21:31:58','1969-01-01 00:00:00',0,'aditya@verudix.com','2013-12-04 21:31:58',NULL,NULL),
('aditya@verudix.com',71,1,1,1,1,1,1,0,'2013-12-04 21:34:26','1969-01-01 00:00:00',0,'aditya@verudix.com','2013-12-04 21:34:26',NULL,NULL),
('aditya@verudix.com',72,1,1,1,1,1,1,0,'2013-12-04 21:34:36','1969-01-01 00:00:00',0,'aditya@verudix.com','2013-12-04 21:34:36',NULL,NULL),
('aditya@verudix.com',73,1,1,1,1,1,1,0,'2013-12-04 21:35:48','1969-01-01 00:00:00',0,'aditya@verudix.com','2013-12-04 21:35:48',NULL,NULL),
('aditya@verudix.com',74,1,1,1,1,1,1,0,'2013-12-04 21:35:57','1969-01-01 00:00:00',0,'aditya@verudix.com','2013-12-04 21:35:57',NULL,NULL),
('aaa@amail.com',75,1,1,1,1,1,1,0,'2013-12-05 14:28:44','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-05 14:28:44',NULL,NULL),
('aaa@amail.com',76,1,1,1,1,1,1,0,'2013-12-05 14:29:10','1969-01-01 00:00:00',0,'aaa@amail.com','2013-12-05 14:29:10',NULL,NULL),
('sreedhar@verudix.com',80,1,1,1,1,1,1,0,'2013-12-05 18:02:45','1969-01-01 00:00:00',0,'sreedhar@verudix.com','2013-12-05 18:02:45',NULL,NULL),
('helluvanag@gmail.com',34,1,1,1,1,1,1,0,'2013-12-05 19:14:51','2013-12-05 19:27:51',0,'nag@nag.com','2013-12-05 19:14:51',NULL,NULL),
('keerthi@verudix.com',82,1,1,1,1,1,1,0,'2013-12-06 10:44:38','1969-01-01 00:00:00',0,'keerthi@verudix.com','2013-12-06 10:44:38',NULL,NULL),
('keerthi@verudix.com',83,1,1,1,1,1,1,0,'2013-12-06 10:45:14','1969-01-01 00:00:00',0,'keerthi@verudix.com','2013-12-06 10:45:14',NULL,NULL),
('sreedhar@verudix.com',84,1,1,1,1,1,1,0,'2013-12-06 11:11:35','1969-01-01 00:00:00',0,'sreedhar@verudix.com','2013-12-06 11:11:35',NULL,NULL),
('nag@nag.com',85,1,1,1,1,1,1,0,'2013-12-06 14:31:01','1969-01-01 00:00:00',0,'nag@nag.com','2013-12-06 14:31:01',NULL,NULL),
('nag@nag.com',86,1,1,1,1,1,1,0,'2013-12-06 17:57:07','1969-01-01 00:00:00',0,'nag@nag.com','2013-12-06 17:57:07',NULL,NULL),
('nag@nag.com',87,1,1,1,1,1,1,0,'2013-12-06 17:57:15','1969-01-01 00:00:00',0,'nag@nag.com','2013-12-06 17:57:15',NULL,NULL),
('nag@nag.com',88,1,1,1,1,1,1,0,'2013-12-06 18:12:29','1969-01-01 00:00:00',0,'nag@nag.com','2013-12-06 18:12:29',NULL,NULL),
('nag@nag.com',89,1,1,1,1,1,1,0,'2013-12-06 18:13:32','1969-01-01 00:00:00',0,'nag@nag.com','2013-12-06 18:13:32',NULL,NULL),
('nag@nag.com',90,1,1,1,1,1,1,0,'2013-12-06 18:29:00','1969-01-01 00:00:00',0,'nag@nag.com','2013-12-06 18:29:00',NULL,NULL),
('nag@nag.com',91,1,1,1,1,1,1,0,'2013-12-06 18:38:06','1969-01-01 00:00:00',0,'nag@nag.com','2013-12-06 18:38:06',NULL,NULL),
('nag@nag.com',92,1,1,1,1,1,1,0,'2013-12-06 18:46:28','1969-01-01 00:00:00',0,'nag@nag.com','2013-12-06 18:46:28',NULL,NULL),
('nag@nag.com',93,1,1,1,1,1,1,0,'2013-12-06 18:46:37','1969-01-01 00:00:00',0,'nag@nag.com','2013-12-06 18:46:37',NULL,NULL),
('kv@gmail.com',96,1,1,1,1,1,1,0,'2013-12-06 19:36:42','1969-01-01 00:00:00',0,'kv@gmail.com','2013-12-06 19:36:42',NULL,NULL),
('ravi@gmail.com',97,1,1,1,1,1,1,0,'2013-12-06 19:46:25','1969-01-01 00:00:00',0,'ravi@gmail.com','2013-12-06 19:46:25',NULL,NULL),
('seshu@gmail.com',98,1,1,1,1,1,1,0,'2013-12-06 20:33:28','1969-01-01 00:00:00',0,'seshu@gmail.com','2013-12-06 20:33:28',NULL,NULL),
('seshu@gmail.com',99,1,1,1,1,1,1,0,'2013-12-06 20:35:38','1969-01-01 00:00:00',0,'seshu@gmail.com','2013-12-06 20:35:38',NULL,NULL),
('seshu@gmail.com',102,1,1,1,1,1,1,0,'2013-12-06 20:38:16','1969-01-01 00:00:00',0,'seshu@gmail.com','2013-12-06 20:38:16',NULL,NULL),
('seshu@gmail.com',103,1,1,1,1,1,1,0,'2013-12-06 21:20:12','1969-01-01 00:00:00',0,'seshu@gmail.com','2013-12-06 21:20:12',NULL,NULL),
('seshu@gmail.com',104,1,1,1,1,1,1,0,'2013-12-06 21:42:53','1969-01-01 00:00:00',0,'seshu@gmail.com','2013-12-06 21:42:53',NULL,NULL),
('nag@nag.com',105,1,1,1,1,1,1,0,'2013-12-09 11:17:14','1969-01-01 00:00:00',0,'nag@nag.com','2013-12-09 11:17:14',NULL,NULL),
('nag@nag.com',106,1,1,1,1,1,1,0,'2013-12-09 11:17:26','1969-01-01 00:00:00',0,'nag@nag.com','2013-12-09 11:17:26',NULL,NULL),
('nag@nag.com',107,1,1,1,1,1,1,0,'2013-12-09 11:17:34','1969-01-01 00:00:00',0,'nag@nag.com','2013-12-09 11:17:34',NULL,NULL),
('nag@nag.com',108,1,1,1,1,1,1,0,'2013-12-09 11:17:59','1969-01-01 00:00:00',0,'nag@nag.com','2013-12-09 11:17:59',NULL,NULL),
('helluvanag@gmail.com',90,1,1,1,1,1,1,0,'2013-12-09 11:40:52','2013-12-11 11:40:52',0,'nag@nag.com','2013-12-09 11:40:52',NULL,NULL),
('nag@nag.com',109,1,1,1,1,1,1,0,'2013-12-09 12:15:30','1969-01-01 00:00:00',0,'nag@nag.com','2013-12-09 12:15:30',NULL,NULL),
('venu@verudix.com',110,1,1,1,1,1,1,0,'2013-12-09 13:32:56','1969-01-01 00:00:00',0,'venu@verudix.com','2013-12-09 13:32:56',NULL,NULL),
('venu@verudix.com',111,1,1,1,1,1,1,0,'2013-12-09 13:33:06','1969-01-01 00:00:00',0,'venu@verudix.com','2013-12-09 13:33:06',NULL,NULL),
('venu@verudix.com',112,1,1,1,1,1,1,0,'2013-12-09 13:33:33','1969-01-01 00:00:00',0,'venu@verudix.com','2013-12-09 13:33:33',NULL,NULL),
('venu@verudix.com',113,1,1,1,1,1,1,0,'2013-12-09 13:33:44','1969-01-01 00:00:00',0,'venu@verudix.com','2013-12-09 13:33:44',NULL,NULL),
('venu@verudix.com',91,1,0,0,1,1,1,0,'2013-12-09 14:49:32','2013-12-09 15:49:32',0,'nag@nag.com','2013-12-09 14:49:32',NULL,NULL),
('venu@verudix.com',114,1,1,1,1,1,1,0,'2013-12-09 15:47:36','1969-01-01 00:00:00',0,'venu@verudix.com','2013-12-09 15:47:36',NULL,NULL),
('vishnu@verudix.com',115,1,1,1,1,1,1,0,'2013-12-09 15:47:46','1969-01-01 00:00:00',0,'vishnu@verudix.com','2013-12-09 15:47:46',NULL,NULL),
('venu@verudix.com',116,1,1,1,1,1,1,0,'2013-12-09 15:47:48','1969-01-01 00:00:00',0,'venu@verudix.com','2013-12-09 15:47:48',NULL,NULL),
('vishnu@verudix.com',117,1,1,1,1,1,1,0,'2013-12-09 15:47:56','1969-01-01 00:00:00',0,'vishnu@verudix.com','2013-12-09 15:47:56',NULL,NULL),
('venu@verudix.com',118,1,1,1,1,1,1,0,'2013-12-09 15:48:01','1969-01-01 00:00:00',0,'venu@verudix.com','2013-12-09 15:48:01',NULL,NULL),
('vishnu@verudix.com',119,1,1,1,1,1,1,0,'2013-12-09 15:48:02','1969-01-01 00:00:00',0,'vishnu@verudix.com','2013-12-09 15:48:02',NULL,NULL),
('vishnu@verudix.com',120,1,1,1,1,1,1,0,'2013-12-09 15:48:11','1969-01-01 00:00:00',0,'vishnu@verudix.com','2013-12-09 15:48:11',NULL,NULL),
('venu@verudix.com',121,1,1,1,1,1,1,0,'2013-12-09 15:48:12','1969-01-01 00:00:00',0,'venu@verudix.com','2013-12-09 15:48:12',NULL,NULL),
('vishnu@verudix.com',122,1,1,1,1,1,1,0,'2013-12-09 15:48:19','1969-01-01 00:00:00',0,'vishnu@verudix.com','2013-12-09 15:48:19',NULL,NULL),
('vishnu@verudix.com',123,1,1,1,1,1,1,0,'2013-12-09 15:48:26','1969-01-01 00:00:00',0,'vishnu@verudix.com','2013-12-09 15:48:26',NULL,NULL),
('vishnu@verudix.com',124,1,1,1,1,1,1,0,'2013-12-09 15:48:33','1969-01-01 00:00:00',0,'vishnu@verudix.com','2013-12-09 15:48:33',NULL,NULL),
('vishnu@verudix.com',125,1,1,1,1,1,1,0,'2013-12-09 15:48:42','1969-01-01 00:00:00',0,'vishnu@verudix.com','2013-12-09 15:48:42',NULL,NULL),
('vishnu@verudix.com',126,1,1,1,1,1,1,0,'2013-12-09 15:48:54','1969-01-01 00:00:00',0,'vishnu@verudix.com','2013-12-09 15:48:54',NULL,NULL),
('vishnu@verudix.com',127,1,1,1,1,1,1,0,'2013-12-09 15:49:00','1969-01-01 00:00:00',0,'vishnu@verudix.com','2013-12-09 15:49:00',NULL,NULL),
('two@two.com',128,1,1,1,1,1,1,0,'2013-12-09 15:58:45','1969-01-01 00:00:00',0,'two@two.com','2013-12-09 15:58:45',NULL,NULL),
('two@two.com',129,1,1,1,1,1,1,0,'2013-12-09 15:58:51','1969-01-01 00:00:00',0,'two@two.com','2013-12-09 15:58:51',NULL,NULL),
('one@one.com',130,1,1,1,1,1,1,0,'2013-12-09 15:58:54','1969-01-01 00:00:00',0,'one@one.com','2013-12-09 15:58:54',NULL,NULL),
('two@two.com',131,1,1,1,1,1,1,0,'2013-12-09 15:59:00','1969-01-01 00:00:00',0,'two@two.com','2013-12-09 15:59:00',NULL,NULL),
('one@one.com',132,1,1,1,1,1,1,0,'2013-12-09 15:59:00','1969-01-01 00:00:00',0,'one@one.com','2013-12-09 15:59:00',NULL,NULL),
('two@two.com',133,1,1,1,1,1,1,0,'2013-12-09 15:59:05','1969-01-01 00:00:00',0,'two@two.com','2013-12-09 15:59:05',NULL,NULL),
('one@one.com',134,1,1,1,1,1,1,0,'2013-12-09 15:59:09','1969-01-01 00:00:00',0,'one@one.com','2013-12-09 15:59:09',NULL,NULL),
('two@two.com',135,1,1,1,1,1,1,0,'2013-12-09 15:59:15','1969-01-01 00:00:00',0,'two@two.com','2013-12-09 15:59:15',NULL,NULL),
('one@one.com',136,1,1,1,1,1,1,0,'2013-12-09 15:59:20','1969-01-01 00:00:00',0,'one@one.com','2013-12-09 15:59:20',NULL,NULL),
('two@two.com',137,1,1,1,1,1,1,0,'2013-12-09 15:59:21','1969-01-01 00:00:00',0,'two@two.com','2013-12-09 15:59:21',NULL,NULL),
('two@two.com',138,1,1,1,1,1,1,0,'2013-12-09 15:59:31','1969-01-01 00:00:00',0,'two@two.com','2013-12-09 15:59:31',NULL,NULL),
('one@one.com',139,1,1,1,1,1,1,0,'2013-12-09 15:59:32','1969-01-01 00:00:00',0,'one@one.com','2013-12-09 15:59:32',NULL,NULL),
('two@two.com',140,1,1,1,1,1,1,0,'2013-12-09 15:59:53','1969-01-01 00:00:00',0,'two@two.com','2013-12-09 15:59:53',NULL,NULL),
('one@one.com',141,1,1,1,1,1,1,0,'2013-12-09 15:59:56','1969-01-01 00:00:00',0,'one@one.com','2013-12-09 15:59:56',NULL,NULL),
('one@one.com',142,1,1,1,1,1,1,0,'2013-12-09 16:00:13','1969-01-01 00:00:00',0,'one@one.com','2013-12-09 16:00:13',NULL,NULL),
('two@two.com',143,1,1,1,1,1,1,0,'2013-12-09 16:00:13','1969-01-01 00:00:00',0,'two@two.com','2013-12-09 16:00:13',NULL,NULL),
('two@two.com',144,1,1,1,1,1,1,0,'2013-12-09 16:00:18','1969-01-01 00:00:00',0,'two@two.com','2013-12-09 16:00:18',NULL,NULL),
('two@two.com',145,1,1,1,1,1,1,0,'2013-12-09 16:00:31','1969-01-01 00:00:00',0,'two@two.com','2013-12-09 16:00:31',NULL,NULL),
('two@two.com',146,1,1,1,1,1,1,0,'2013-12-09 16:00:37','1969-01-01 00:00:00',0,'two@two.com','2013-12-09 16:00:37',NULL,NULL),
('one@one.com',147,1,1,1,1,1,1,0,'2013-12-09 16:00:58','1969-01-01 00:00:00',0,'one@one.com','2013-12-09 16:00:58',NULL,NULL),
('two@two.com',148,1,1,1,1,1,1,0,'2013-12-09 16:01:39','1969-01-01 00:00:00',0,'two@two.com','2013-12-09 16:01:39',NULL,NULL),
('one@one.com',148,1,1,1,1,1,1,0,'2013-12-09 17:07:17','2013-12-17 17:11:23',0,'two@two.com','2013-12-09 17:07:17','two@two.com','2013-12-11 10:37:48'),
('one@one.com',129,1,1,1,1,1,1,1,'2013-12-09 17:11:23','2013-12-17 17:11:23',0,'two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-11 10:37:48'),
('one@one.com',131,1,1,1,1,1,1,0,'2013-12-09 17:11:23','2013-12-17 17:11:23',0,'two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-11 10:37:48'),
('one@one.com',133,1,1,1,1,1,1,1,'2013-12-09 17:11:23','2013-12-17 17:11:23',0,'two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-11 10:37:48'),
('one@one.com',135,1,1,1,1,1,1,0,'2013-12-09 17:11:23','2013-12-17 17:11:23',0,'two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-11 10:37:48'),
('one@one.com',137,1,1,1,1,1,1,1,'2013-12-09 17:11:23','2013-12-17 17:11:23',0,'two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-11 10:37:48'),
('one@one.com',138,1,1,1,1,1,1,0,'2013-12-09 17:11:23','2013-12-17 17:11:23',0,'two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-11 10:37:48'),
('one@one.com',140,1,1,1,1,1,1,1,'2013-12-09 17:11:23','2013-12-17 17:11:23',0,'two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-11 10:37:48'),
('one@one.com',143,1,1,1,1,1,1,0,'2013-12-09 17:11:23','2013-12-17 17:11:23',0,'two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-11 10:37:48'),
('one@one.com',144,1,1,1,1,1,1,1,'2013-12-09 17:11:23','2013-12-17 17:11:23',0,'two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-11 10:37:48'),
('one@one.com',145,1,1,1,1,1,1,0,'2013-12-09 17:11:23','2013-12-17 17:11:23',0,'two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-11 10:37:48'),
('one@one.com',146,1,1,1,1,1,1,1,'2013-12-09 17:11:23','2013-12-17 17:11:23',0,'two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-11 10:37:48'),
('one@one.com',148,1,1,1,1,1,1,0,'2013-12-09 17:11:23','2013-12-17 17:11:23',0,'two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-11 10:37:48'),
('venugopal@gmail.com',35,0,0,0,1,1,1,0,'2013-12-09 19:18:28','2013-12-10 19:18:28',0,'venu@verudix.com','2013-12-09 19:18:28',NULL,NULL),
('one@one.com',128,1,1,1,1,1,1,0,'2013-12-09 20:07:56','2013-12-10 20:07:56',0,'two@two.com','2013-12-09 20:07:56',NULL,NULL),
('nag@nag.com',128,1,1,1,1,1,1,0,'2013-12-09 20:09:06','2013-12-09 22:09:06',0,'one@one.com','2013-12-09 20:09:06',NULL,NULL),
('keerthi.rukmini02@gmail.com',91,1,1,1,1,1,1,0,'2013-12-09 20:41:06','2013-12-11 20:41:06',0,'nag@nag.com','2013-12-09 20:41:06',NULL,NULL),
('keerthi.rukmini02@gmail.com',110,1,1,1,1,1,1,1,'2013-12-09 21:04:14','2013-12-10 21:04:14',0,'venu@verudix.com','2013-12-09 21:04:14',NULL,NULL),
('keerthi.rukmini02@gmail.com',111,1,1,1,1,1,1,1,'2013-12-09 21:04:14','2013-12-10 21:04:14',0,'venu@verudix.com','2013-12-09 21:04:14',NULL,NULL),
('keerthi.rukmini02@gmail.com',112,1,1,1,1,1,1,1,'2013-12-09 21:04:14','2013-12-10 21:04:14',0,'venu@verudix.com','2013-12-09 21:04:14',NULL,NULL),
('keerthi.rukmini02@gmail.com',113,1,1,1,1,1,1,1,'2013-12-09 21:04:14','2013-12-10 21:04:14',0,'venu@verudix.com','2013-12-09 21:04:14',NULL,NULL),
('venu@verudix.com',149,1,1,1,1,1,1,0,'2013-12-09 21:05:44','1969-01-01 00:00:00',0,'venu@verudix.com','2013-12-09 21:05:44',NULL,NULL),
('keerthi.rukmini02@gmail.com',149,1,1,1,1,1,1,0,'2013-12-09 21:06:18','2013-12-10 21:06:18',0,'venu@verudix.com','2013-12-09 21:06:18',NULL,NULL),
('venu@verudix.com',150,1,1,1,1,1,1,0,'2013-12-09 21:08:46','1969-01-01 00:00:00',0,'venu@verudix.com','2013-12-09 21:08:46',NULL,NULL),
('keerthi.rukmini02@gmail.com',150,1,1,1,1,1,1,0,'2013-12-09 21:08:57','2013-12-10 21:08:57',0,'venu@verudix.com','2013-12-09 21:08:57',NULL,NULL),
('venu@verudix.com',151,1,1,1,1,1,1,0,'2013-12-09 21:26:15','1969-01-01 00:00:00',0,'venu@verudix.com','2013-12-09 21:26:15',NULL,NULL),
('one@one.com',151,1,1,1,1,1,1,0,'2013-12-09 21:26:25','2013-12-10 21:26:25',0,'venu@verudix.com','2013-12-09 21:26:25',NULL,NULL),
('venu@verudix.com',128,1,1,1,1,1,1,0,'2013-12-10 10:56:14','2013-12-11 10:56:14',0,'one@one.com','2013-12-10 10:56:14',NULL,NULL),
('alekya@gmail.com',151,1,1,1,1,1,1,0,'2013-12-10 12:03:35','2013-12-22 12:03:35',0,'one@one.com','2013-12-10 12:03:35',NULL,NULL),
('venuuverudix@gmail.com',152,1,1,1,1,1,1,0,'2013-12-10 12:05:51','1969-01-01 00:00:00',0,'venuuverudix@gmail.com','2013-12-10 12:05:51',NULL,NULL),
('venuuverudix@gmail.com',153,1,1,1,1,1,1,0,'2013-12-10 12:05:56','1969-01-01 00:00:00',0,'venuuverudix@gmail.com','2013-12-10 12:05:56',NULL,NULL),
('venuuverudix@gmail.com',154,1,1,1,1,1,1,0,'2013-12-10 12:06:01','1969-01-01 00:00:00',0,'venuuverudix@gmail.com','2013-12-10 12:06:01',NULL,NULL),
('venuuverudix@gmail.com',155,1,1,1,1,1,1,0,'2013-12-10 12:06:07','1969-01-01 00:00:00',0,'venuuverudix@gmail.com','2013-12-10 12:06:07',NULL,NULL),
('venuuverudix@gmail.com',156,1,1,1,1,1,1,0,'2013-12-10 12:06:14','1969-01-01 00:00:00',0,'venuuverudix@gmail.com','2013-12-10 12:06:14',NULL,NULL),
('venuuverudix@gmail.com',157,1,1,1,1,1,1,0,'2013-12-10 12:06:25','1969-01-01 00:00:00',0,'venuuverudix@gmail.com','2013-12-10 12:06:25',NULL,NULL),
('bhanu@gmail.com',151,1,1,1,1,1,1,0,'2013-12-10 12:06:52','2013-12-21 12:06:52',0,'one@one.com','2013-12-10 12:06:52',NULL,NULL),
('venuuverudix@gmail.com',158,1,1,1,1,1,1,0,'2013-12-10 12:08:23','1969-01-01 00:00:00',0,'venuuverudix@gmail.com','2013-12-10 12:08:23',NULL,NULL),
('venuuverudix@gmail.com',159,1,1,1,1,1,1,0,'2013-12-10 12:09:09','1969-01-01 00:00:00',0,'venuuverudix@gmail.com','2013-12-10 12:09:09',NULL,NULL),
('venuuverudix@gmail.com',160,1,1,1,1,1,1,0,'2013-12-10 12:09:37','1969-01-01 00:00:00',0,'venuuverudix@gmail.com','2013-12-10 12:09:37',NULL,NULL),
('venuuverudix@gmail.com',161,1,1,1,1,1,1,0,'2013-12-10 12:10:18','1969-01-01 00:00:00',0,'venuuverudix@gmail.com','2013-12-10 12:10:18',NULL,NULL),
('one@one.com',162,1,1,1,1,1,1,0,'2013-12-10 12:10:36','2013-12-17 17:11:23',0,'one@one.com','2013-12-10 12:10:36','two@two.com','2013-12-11 10:37:48'),
('nag@nag.com',161,1,1,1,1,1,1,0,'2013-12-10 12:10:39','2013-12-21 12:10:39',0,'venuuverudix@gmail.com','2013-12-10 12:10:39',NULL,NULL),
('one@one.com',160,1,1,1,1,1,1,0,'2013-12-10 12:11:04','2013-12-21 12:11:04',0,'venuuverudix@gmail.com','2013-12-10 12:11:04',NULL,NULL),
('keerthi.rukmini02@gmail.com',160,0,0,0,1,1,1,0,'2013-12-10 12:11:27','2013-12-10 12:11:27',0,'venuuverudix@gmail.com','2013-12-10 12:11:27',NULL,NULL),
('keerthi.rukmini02@gmail.com',161,1,1,1,1,1,1,0,'2013-12-10 12:11:52','2013-12-21 12:11:52',0,'venuuverudix@gmail.com','2013-12-10 12:11:52',NULL,NULL),
('keerthi@verudix.com',161,1,1,1,1,1,1,0,'2013-12-10 12:12:13','2013-12-21 13:12:13',0,'venuuverudix@gmail.com','2013-12-10 12:12:13',NULL,NULL),
('abc@abc.com',163,1,1,1,1,1,1,0,'2013-12-10 12:31:49','1969-01-01 00:00:00',0,'abc@abc.com','2013-12-10 12:31:49',NULL,NULL),
('abc@abc.com',164,1,1,1,1,1,1,0,'2013-12-10 12:32:25','1969-01-01 00:00:00',0,'abc@abc.com','2013-12-10 12:32:25',NULL,NULL),
('abc@abc.com',165,1,1,1,1,1,1,0,'2013-12-10 12:32:40','1969-01-01 00:00:00',0,'abc@abc.com','2013-12-10 12:32:40',NULL,NULL),
('abc@abc.com',166,1,1,1,1,1,1,0,'2013-12-10 12:40:31','1969-01-01 00:00:00',0,'abc@abc.com','2013-12-10 12:40:31',NULL,NULL),
('mailkeert@gmail.com',167,1,1,1,1,1,1,0,'2013-12-10 12:44:24','1969-01-01 00:00:00',0,'mailkeert@gmail.com','2013-12-10 12:44:24',NULL,NULL),
('mailkeert@gmail.com',168,1,1,1,1,1,1,0,'2013-12-10 12:44:36','1969-01-01 00:00:00',0,'mailkeert@gmail.com','2013-12-10 12:44:36',NULL,NULL),
('mailkeert@gmail.com',169,1,1,1,1,1,1,0,'2013-12-10 12:46:01','1969-01-01 00:00:00',0,'mailkeert@gmail.com','2013-12-10 12:46:01',NULL,NULL),
('mailkeert@gmail.com',170,1,1,1,1,1,1,0,'2013-12-10 12:46:22','1969-01-01 00:00:00',0,'mailkeert@gmail.com','2013-12-10 12:46:22',NULL,NULL),
('kk@gmail.com',171,1,1,1,1,1,1,0,'2013-12-10 15:49:03','1969-01-01 00:00:00',0,'kk@gmail.com','2013-12-10 15:49:03',NULL,NULL),
('kk@gmail.com',172,1,1,1,1,1,1,0,'2013-12-10 15:49:17','1969-01-01 00:00:00',0,'kk@gmail.com','2013-12-10 15:49:17',NULL,NULL),
('one@one.com',173,1,1,1,1,1,1,0,'2013-12-11 10:38:17','1969-01-01 00:00:00',0,'one@one.com','2013-12-11 10:38:17',NULL,NULL),
('two@two.com',174,1,1,1,1,1,1,0,'2013-12-11 10:39:18','1969-01-01 00:00:00',0,'two@two.com','2013-12-11 10:39:18',NULL,NULL),
('two@two.com',175,1,1,1,1,1,1,0,'2013-12-11 10:41:17','1969-01-01 00:00:00',0,'two@two.com','2013-12-11 10:41:17',NULL,NULL),
('one@one.com',176,1,1,1,1,1,1,0,'2013-12-11 14:04:29','1969-01-01 00:00:00',0,'one@one.com','2013-12-11 14:04:29',NULL,NULL),
('one@one.com',177,1,1,1,1,1,1,0,'2013-12-11 14:08:05','1969-01-01 00:00:00',0,'one@one.com','2013-12-11 14:08:05',NULL,NULL),
('two@two.com',176,1,1,1,1,1,1,0,'2013-12-11 16:21:04','2013-12-22 16:21:04',0,'one@one.com','2013-12-11 16:21:04',NULL,NULL),
('rukmini.keerthi02@gmail.com',178,1,1,1,1,1,1,0,'2013-12-11 18:32:03','1969-01-01 00:00:00',0,'rukmini.keerthi02@gmail.com','2013-12-11 18:32:03',NULL,NULL),
('rukmini.keerthi02@gmail.com',179,1,1,1,1,1,1,0,'2013-12-11 18:32:57','1969-01-01 00:00:00',0,'rukmini.keerthi02@gmail.com','2013-12-11 18:32:57',NULL,NULL),
('rukmini.keerthi02@gmail.com',180,1,1,1,1,1,1,0,'2013-12-11 18:36:03','1969-01-01 00:00:00',0,'rukmini.keerthi02@gmail.com','2013-12-11 18:36:03',NULL,NULL),
('rukmini.keerthi02@gmail.com',181,1,1,1,1,1,1,0,'2013-12-11 18:37:13','1969-01-01 00:00:00',0,'rukmini.keerthi02@gmail.com','2013-12-11 18:37:13',NULL,NULL),
('rukmini.keerthi02@gmail.com',182,1,1,1,1,1,1,0,'2013-12-11 18:38:34','1969-01-01 00:00:00',0,'rukmini.keerthi02@gmail.com','2013-12-11 18:38:34',NULL,NULL),
('two@two.com',177,1,1,1,1,1,1,1,'2013-12-13 19:41:09','2013-12-24 19:41:09',0,'one@one.com','2013-12-13 19:41:09',NULL,NULL),
('three@three.com',160,1,1,1,1,1,1,0,'2013-12-13 19:41:37','2013-12-24 19:41:37',0,'one@one.com','2013-12-13 19:41:37',NULL,NULL),
('helluvanag@gmail.com',176,1,1,1,1,1,1,0,'2013-12-13 20:07:00','2013-12-24 20:07:00',0,'one@one.com','2013-12-13 20:07:00',NULL,NULL),
('helluvanag@gmail.com',177,1,1,1,1,1,1,1,'2013-12-13 20:07:57','2013-12-24 20:07:57',0,'one@one.com','2013-12-13 20:07:57',NULL,NULL),
('sandhya@gmail.com',183,1,1,1,1,1,1,0,'2013-12-16 18:57:00','1969-01-01 00:00:00',0,'sandhya@gmail.com','2013-12-16 18:57:00',NULL,NULL),
('vgpoloju@gmail.com',184,1,1,1,1,1,1,0,'2013-12-16 19:46:59','1969-01-01 00:00:00',0,'vgpoloju@gmail.com','2013-12-16 19:46:59',NULL,NULL),
('vgpoloju@gmail.com',185,1,1,1,1,1,1,0,'2013-12-16 19:54:19','1969-01-01 00:00:00',0,'vgpoloju@gmail.com','2013-12-16 19:54:19',NULL,NULL),
('vgpoloju@gmail.com',186,1,1,1,1,1,1,0,'2013-12-16 19:54:38','1969-01-01 00:00:00',0,'vgpoloju@gmail.com','2013-12-16 19:54:38',NULL,NULL),
('vgpoloju@gmail.com',187,1,1,1,1,1,1,0,'2013-12-16 20:46:49','1969-01-01 00:00:00',0,'vgpoloju@gmail.com','2013-12-16 20:46:49',NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `files` */

DROP TABLE IF EXISTS `files`;

CREATE TABLE `files` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FileID` int(11) NOT NULL,
  `FileName` varchar(128) DEFAULT NULL,
  `DateUploaded` datetime DEFAULT NULL,
  `UserID` varchar(128) NOT NULL,
  `FilePath` varchar(1024) NOT NULL,
  `OwnerID` varchar(128) NOT NULL,
  `SharedBy` varchar(128) NOT NULL,
  `IsFolder` int(1) NOT NULL,
  `IsSecure` int(1) NOT NULL DEFAULT '0',
  `SharedDatetime` datetime NOT NULL,
  `ExpiryDatetime` datetime DEFAULT NULL,
  `CreatedBy` varchar(128) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(128) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`,`FileID`,`UserID`,`OwnerID`,`SharedBy`,`SharedDatetime`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=latin1;

/*Data for the table `files` */

LOCK TABLES `files` WRITE;

insert into `files` values 
(2,2,'mysql.sql','2013-11-28 13:46:26','hhh@hmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$hhh@hmail.com$My Files$','hhh@hmail.com','hhh@hmail.com',0,1,'2013-11-28 13:46:26','1969-01-01 00:00:00','hhh@hmail.com','2013-11-28 13:46:26',NULL,NULL),
(3,3,'CreateBearerTokenFromClientCredentials.docx','2013-11-28 13:54:38','hhh@hmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$hhh@hmail.com$My Files$','hhh@hmail.com','hhh@hmail.com',0,1,'2013-11-28 13:54:38','1969-01-01 00:00:00','hhh@hmail.com','2013-11-28 13:54:38',NULL,NULL),
(4,4,'On-boarding validations.xlsx','2013-11-28 14:36:58','hhh@hmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$hhh@hmail.com$My Files$','hhh@hmail.com','hhh@hmail.com',0,1,'2013-11-28 14:36:58','1969-01-01 00:00:00','hhh@hmail.com','2013-11-28 14:36:58',NULL,NULL),
(5,5,'WeeklyReport_NAGENDER_11102013.docx','2013-11-28 14:52:24','hhh@hmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$hhh@hmail.com$My Files$','hhh@hmail.com','hhh@hmail.com',0,1,'2013-11-28 14:52:24','1969-01-01 00:00:00','hhh@hmail.com','2013-11-28 14:52:24',NULL,NULL),
(6,6,'unib_intuit_test_users.xlsx','2013-11-28 16:56:40','bbb@bmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$bbb@bmail.com$My Files$','bbb@bmail.com','bbb@bmail.com',0,1,'2013-11-28 16:56:40','1969-01-01 00:00:00','bbb@bmail.com','2013-11-28 16:56:40',NULL,NULL),
(7,7,'photonbill.docx','2013-11-28 17:21:57','bbb@bmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$bbb@bmail.com$My Files$','bbb@bmail.com','bbb@bmail.com',0,1,'2013-11-28 17:21:57','1969-01-01 00:00:00','bbb@bmail.com','2013-11-28 17:21:57',NULL,NULL),
(8,8,'WeeklyReport_NAGENDER_11102013.docx','2013-11-29 10:18:13','bbb@bmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$bbb@bmail.com$My Files$','bbb@bmail.com','bbb@bmail.com',0,1,'2013-11-29 10:18:13','1969-01-01 00:00:00','bbb@bmail.com','2013-11-29 10:18:13',NULL,NULL),
(9,8,'WeeklyReport_NAGENDER_11102013.docx','2013-11-29 10:40:04','aaa@amail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$bbb@bmail.com$My Files$','bbb@bmail.com','bbb@bmail.com',0,1,'2013-11-29 10:40:04','2013-11-29 11:40:04','bbb@bmail.com','2013-11-29 10:40:04','bbb@bmail.com','2013-11-29 10:40:04'),
(10,9,'Lockit_Refactored-servlet.xml','2013-11-29 10:51:10','keerthiv@gmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$keerthiv@gmail.com$My Files$','keerthiv@gmail.com','keerthiv@gmail.com',0,1,'2013-11-29 10:51:10','1969-01-01 00:00:00','keerthiv@gmail.com','2013-11-29 10:51:10',NULL,NULL),
(11,10,'Nagender.txt','2013-11-29 10:51:22','keerthiv@gmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$keerthiv@gmail.com$My Files$','keerthiv@gmail.com','keerthiv@gmail.com',0,1,'2013-11-29 10:51:22','1969-01-01 00:00:00','keerthiv@gmail.com','2013-11-29 10:51:22',NULL,NULL),
(12,10,'Nagender.txt','2013-11-29 10:52:14','aaa@amail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$keerthiv@gmail.com$My Files$','keerthiv@gmail.com','keerthiv@gmail.com',0,1,'2013-11-29 10:52:14','2013-11-30 10:52:14','keerthiv@gmail.com','2013-11-29 10:52:14','keerthiv@gmail.com','2013-11-29 10:52:14'),
(13,11,'Jersey Guide.docx','2013-11-29 12:59:50','eee@email.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$eee@email.com$My Files$','eee@email.com','eee@email.com',0,1,'2013-11-29 12:59:50','1969-01-01 00:00:00','eee@email.com','2013-11-29 12:59:50',NULL,NULL),
(14,12,'sapvenkat (1).docx','2013-11-29 13:16:13','eee@email.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$eee@email.com$My Files$','eee@email.com','eee@email.com',0,1,'2013-11-29 13:16:13','1969-01-01 00:00:00','eee@email.com','2013-11-29 13:16:13',NULL,NULL),
(15,13,'Node JS Web Service API Specification.docx','2013-11-29 14:15:26','eee@email.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$eee@email.com$My Files$','eee@email.com','eee@email.com',0,1,'2013-11-29 14:15:26','1969-01-01 00:00:00','eee@email.com','2013-11-29 14:15:26',NULL,NULL),
(16,14,'git.txt','2013-11-29 16:45:48','eee@email.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$eee@email.com$My Files$','eee@email.com','eee@email.com',0,1,'2013-11-29 16:45:48','1969-01-01 00:00:00','eee@email.com','2013-11-29 16:45:48',NULL,NULL),
(17,15,'dev_restapi.docx','2013-11-29 18:51:20','helluvanag@gmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$helluvanag@gmail.com$My Files$','helluvanag@gmail.com','helluvanag@gmail.com',0,1,'2013-11-29 18:51:20','1969-01-01 00:00:00','helluvanag@gmail.com','2013-11-29 18:51:20',NULL,NULL),
(18,16,'On-boarding validations.xlsx','2013-12-02 11:35:11','aaa@amail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-02 11:35:11','1969-01-01 00:00:00','aaa@amail.com','2013-12-02 11:35:11',NULL,NULL),
(19,17,'photonbill.docx','2013-12-02 11:53:09','aaa@amail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-02 11:53:09','1969-01-01 00:00:00','aaa@amail.com','2013-12-02 11:53:09',NULL,NULL),
(20,18,'CreateBearerTokenFromClientCredentials.docx','2013-12-02 12:19:11','aaa@amail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-02 12:19:11','1969-01-01 00:00:00','aaa@amail.com','2013-12-02 12:19:11',NULL,NULL),
(21,19,'Nag','2013-12-02 12:20:22','aaa@amail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',1,0,'2013-12-02 12:20:22','1969-01-01 00:00:00','aaa@amail.com','2013-12-02 12:20:22',NULL,NULL),
(22,20,'httpclient-tutorial.pdf','2013-12-02 12:20:41','aaa@amail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$Nag$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-02 12:20:41','1969-01-01 00:00:00','aaa@amail.com','2013-12-02 12:20:41',NULL,NULL),
(23,21,'EEE','2013-12-02 12:37:39','eee@email.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$eee@email.com$My Files$','eee@email.com','eee@email.com',1,0,'2013-12-02 12:37:39','1969-01-01 00:00:00','eee@email.com','2013-12-02 12:37:39',NULL,NULL),
(24,22,'UNI_B_Process_Definitions_TimeOff_Nag.docx','2013-12-02 12:37:53','eee@email.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$eee@email.com$My Files$EEE$','eee@email.com','eee@email.com',0,1,'2013-12-02 12:37:53','1969-01-01 00:00:00','eee@email.com','2013-12-02 12:37:53',NULL,NULL),
(25,1,'mysql.sql','2013-12-02 18:01:43','bbb@bmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-02 18:01:43','2013-12-12 18:01:43','aaa@amail.com','2013-12-02 18:01:43','aaa@amail.com','2013-12-02 18:01:43'),
(26,18,'CreateBearerTokenFromClientCredentials.docx','2013-12-02 18:18:00','bbb@bmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-02 18:18:00','2013-12-14 18:18:00','aaa@amail.com','2013-12-02 18:18:00','aaa@amail.com','2013-12-02 18:18:00'),
(27,17,'photonbill.docx','2013-12-03 12:21:33','bbb@bmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-03 12:21:33','2013-12-04 12:21:33','aaa@amail.com','2013-12-03 12:21:33','aaa@amail.com','2013-12-03 12:21:33'),
(28,20,'httpclient-tutorial.pdf','2013-12-03 15:23:39','bbb@bmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$Nag$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-03 15:23:39','2013-12-14 15:23:39','aaa@amail.com','2013-12-03 15:23:39','aaa@amail.com','2013-12-03 15:23:39'),
(29,18,'CreateBearerTokenFromClientCredentials.docx','2013-12-03 16:09:56','helluvanag@gmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-03 16:09:56','2013-12-15 16:09:56','aaa@amail.com','2013-12-03 16:09:56','aaa@amail.com','2013-12-03 16:09:56'),
(30,18,'CreateBearerTokenFromClientCredentials.docx','2013-12-03 16:10:19','eee@email.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-03 16:10:19','2013-12-03 16:10:19','aaa@amail.com','2013-12-03 16:10:19','aaa@amail.com','2013-12-03 16:10:19'),
(31,17,'photonbill.docx','2013-12-03 16:10:57','eee@email.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-03 16:10:57','2013-12-03 16:10:57','aaa@amail.com','2013-12-03 16:10:57','aaa@amail.com','2013-12-03 16:10:57'),
(32,17,'photonbill.docx','2013-12-03 16:11:20','a1@gmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-03 16:11:20','2013-12-04 16:11:20','aaa@amail.com','2013-12-03 16:11:20','aaa@amail.com','2013-12-03 16:11:20'),
(33,1,'mysql.sql','2013-12-03 16:11:43','a1@gmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-03 16:11:43','2013-12-04 16:11:43','aaa@amail.com','2013-12-03 16:11:43','aaa@amail.com','2013-12-03 16:11:43'),
(34,1,'mysql.sql','2013-12-03 16:15:29','eee@email.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-03 16:15:29','2013-12-03 16:15:29','aaa@amail.com','2013-12-03 16:15:29','aaa@amail.com','2013-12-03 16:15:29'),
(35,6,'unib_intuit_test_users.xlsx','2013-12-03 16:17:38','ccc@cmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$bbb@bmail.com$My Files$','bbb@bmail.com','bbb@bmail.com',0,1,'2013-12-03 16:17:38','2013-12-03 16:17:38','bbb@bmail.com','2013-12-03 16:17:38','bbb@bmail.com','2013-12-03 16:17:38'),
(36,6,'unib_intuit_test_users.xlsx','2013-12-03 16:20:56','ddd@dmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$bbb@bmail.com$My Files$','bbb@bmail.com','bbb@bmail.com',0,1,'2013-12-03 16:20:56','2013-12-03 16:20:56','bbb@bmail.com','2013-12-03 16:20:56','bbb@bmail.com','2013-12-03 16:20:56'),
(37,6,'unib_intuit_test_users.xlsx','2013-12-03 16:32:38','jj@gmail.com','D:$verudix_ws$.metadata$.plugins$org.eclipse.wst.server.core$tmp1$wtpwebapps$Lockit_Refactored$Userfiles$bbb@bmail.com$My Files$','bbb@bmail.com','bbb@bmail.com',0,1,'2013-12-03 16:32:38','2013-12-03 16:32:38','bbb@bmail.com','2013-12-03 16:32:38','bbb@bmail.com','2013-12-03 16:32:38'),
(38,23,'One','2013-12-04 14:21:21','aaa@amail.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',1,0,'2013-12-04 14:21:21','1969-01-01 00:00:00','aaa@amail.com','2013-12-04 14:21:21',NULL,NULL),
(40,25,'mysql.sql','2013-12-04 14:31:41','nag@nag.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$','nag@nag.com','nag@nag.com',0,1,'2013-12-04 14:31:41','1969-01-01 00:00:00','nag@nag.com','2013-12-04 14:31:41',NULL,NULL),
(47,30,'skynet.sql','2013-12-04 17:27:01','aaa@amail.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-04 17:27:01','1969-01-01 00:00:00','aaa@amail.com','2013-12-04 17:27:01',NULL,NULL),
(51,31,'mysql.sql','2013-12-04 18:15:39','aaa@amail.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-04 18:15:39','1969-01-01 00:00:00','aaa@amail.com','2013-12-04 18:15:39',NULL,NULL),
(52,32,'unib_intuit_test_users.xlsx','2013-12-04 18:16:30','aaa@amail.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-04 18:16:30','1969-01-01 00:00:00','aaa@amail.com','2013-12-04 18:16:30',NULL,NULL),
(53,33,'skynet.sql','2013-12-04 18:18:40','nag@nag.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$','nag@nag.com','nag@nag.com',0,1,'2013-12-04 18:18:40','1969-01-01 00:00:00','nag@nag.com','2013-12-04 18:18:40',NULL,NULL),
(54,34,'Feature_BUG_UNI_B_Functional_Specification.docx','2013-12-04 18:19:55','nag@nag.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$','nag@nag.com','nag@nag.com',0,1,'2013-12-04 18:19:55','1969-01-01 00:00:00','nag@nag.com','2013-12-04 18:19:55',NULL,NULL),
(55,35,'skynet.sql','2013-12-04 18:22:26','venu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$','venu@verudix.com','venu@verudix.com',0,1,'2013-12-04 18:22:26','1969-01-01 00:00:00','venu@verudix.com','2013-12-04 18:22:26',NULL,NULL),
(56,36,'mysql.sql','2013-12-04 18:22:54','venu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$','venu@verudix.com','venu@verudix.com',0,1,'2013-12-04 18:22:54','1969-01-01 00:00:00','venu@verudix.com','2013-12-04 18:22:54',NULL,NULL),
(58,38,'airtelbill.docx','2013-12-04 18:55:15','vishnu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vishnu@verudix.com$My Files$','vishnu@verudix.com','vishnu@verudix.com',0,1,'2013-12-04 18:55:15','1969-01-01 00:00:00','vishnu@verudix.com','2013-12-04 18:55:15',NULL,NULL),
(60,40,'AAA','2013-12-04 19:58:45','aaa@amail.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',1,0,'2013-12-04 19:58:45','1969-01-01 00:00:00','aaa@amail.com','2013-12-04 19:58:45',NULL,NULL),
(61,41,'BBB','2013-12-04 19:58:54','aaa@amail.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$AAA$','aaa@amail.com','aaa@amail.com',1,0,'2013-12-04 19:58:54','1969-01-01 00:00:00','aaa@amail.com','2013-12-04 19:58:54',NULL,NULL),
(62,42,'CCC','2013-12-04 19:59:05','aaa@amail.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$AAA$BBB$','aaa@amail.com','aaa@amail.com',1,0,'2013-12-04 19:59:05','1969-01-01 00:00:00','aaa@amail.com','2013-12-04 19:59:05',NULL,NULL),
(63,43,'LockitBugs.txt','2013-12-04 19:59:36','aaa@amail.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$AAA$BBB$CCC$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-04 19:59:36','1969-01-01 00:00:00','aaa@amail.com','2013-12-04 19:59:36',NULL,NULL),
(64,44,'AAA','2013-12-04 20:00:38','aaa@amail.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$AAA$BBB$CCC$','aaa@amail.com','aaa@amail.com',1,0,'2013-12-04 20:00:38','1969-01-01 00:00:00','aaa@amail.com','2013-12-04 20:00:38',NULL,NULL),
(66,46,'Password Management Findings (1).docx','2013-12-04 20:10:48','vishnu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vishnu@verudix.com$My Files$','vishnu@verudix.com','vishnu@verudix.com',0,1,'2013-12-04 20:10:48','1969-01-01 00:00:00','vishnu@verudix.com','2013-12-04 20:10:48',NULL,NULL),
(67,47,'unib_intuit_test_users.xlsx','2013-12-04 20:25:34','vishnu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vishnu@verudix.com$My Files$','vishnu@verudix.com','vishnu@verudix.com',0,1,'2013-12-04 20:25:34','1969-01-01 00:00:00','vishnu@verudix.com','2013-12-04 20:25:34',NULL,NULL),
(68,48,'Unified_User_Experience_Keywords.csv.xlsx','2013-12-04 20:51:56','vishnu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vishnu@verudix.com$My Files$','vishnu@verudix.com','vishnu@verudix.com',0,1,'2013-12-04 20:51:56','1969-01-01 00:00:00','vishnu@verudix.com','2013-12-04 20:51:56',NULL,NULL),
(69,49,'UNI_B_Proxy (1).pptx','2013-12-04 20:54:33','vishnu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vishnu@verudix.com$My Files$','vishnu@verudix.com','vishnu@verudix.com',0,1,'2013-12-04 20:54:33','1969-01-01 00:00:00','vishnu@verudix.com','2013-12-04 20:54:33',NULL,NULL),
(70,50,'Nag','2013-12-04 20:59:22','vishnu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vishnu@verudix.com$My Files$','vishnu@verudix.com','vishnu@verudix.com',1,0,'2013-12-04 20:59:22','1969-01-01 00:00:00','vishnu@verudix.com','2013-12-04 20:59:22',NULL,NULL),
(71,51,'Password Management Findings (1).docx','2013-12-04 20:59:45','vishnu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vishnu@verudix.com$My Files$Nag$','vishnu@verudix.com','vishnu@verudix.com',0,1,'2013-12-04 20:59:45','1969-01-01 00:00:00','vishnu@verudix.com','2013-12-04 20:59:45',NULL,NULL),
(72,52,'Unified_User_Experience_Keywords.csv.xlsx','2013-12-04 21:00:04','vishnu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vishnu@verudix.com$My Files$Nag$','vishnu@verudix.com','vishnu@verudix.com',0,0,'2013-12-04 21:00:04','1969-01-01 00:00:00','vishnu@verudix.com','2013-12-04 21:00:04',NULL,NULL),
(74,53,'Nag','2013-12-04 21:04:33','aditya@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aditya@verudix.com$My Files$','aditya@verudix.com','aditya@verudix.com',1,0,'2013-12-04 21:04:33','1969-01-01 00:00:00','aditya@verudix.com','2013-12-04 21:04:33',NULL,NULL),
(75,54,'One','2013-12-04 21:05:06','aditya@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aditya@verudix.com$My Files$Nag$','aditya@verudix.com','aditya@verudix.com',1,0,'2013-12-04 21:05:06','1969-01-01 00:00:00','aditya@verudix.com','2013-12-04 21:05:06',NULL,NULL),
(76,55,'On-boarding validations.xlsx','2013-12-04 21:05:25','aditya@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aditya@verudix.com$My Files$Nag$One$','aditya@verudix.com','aditya@verudix.com',0,1,'2013-12-04 21:05:25','1969-01-01 00:00:00','aditya@verudix.com','2013-12-04 21:05:25',NULL,NULL),
(77,56,'Rao','2013-12-04 21:05:49','aditya@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aditya@verudix.com$My Files$Nag$One$','aditya@verudix.com','aditya@verudix.com',1,0,'2013-12-04 21:05:49','1969-01-01 00:00:00','aditya@verudix.com','2013-12-04 21:05:49',NULL,NULL),
(78,57,'UNI_B_Proxy (1).pptx','2013-12-04 21:06:01','aditya@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aditya@verudix.com$My Files$Nag$One$Rao$','aditya@verudix.com','aditya@verudix.com',0,1,'2013-12-04 21:06:01','1969-01-01 00:00:00','aditya@verudix.com','2013-12-04 21:06:01',NULL,NULL),
(80,59,'UNI_B_Process_Definition_Proxy.docx','2013-12-04 21:07:18','aditya@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aditya@verudix.com$My Files$Nag$','aditya@verudix.com','aditya@verudix.com',0,1,'2013-12-04 21:07:18','1969-01-01 00:00:00','aditya@verudix.com','2013-12-04 21:07:18',NULL,NULL),
(81,60,'unibSqlMapConfig.xml','2013-12-04 21:08:05','aditya@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aditya@verudix.com$My Files$','aditya@verudix.com','aditya@verudix.com',0,1,'2013-12-04 21:08:05','1969-01-01 00:00:00','aditya@verudix.com','2013-12-04 21:08:05',NULL,NULL),
(82,61,'Aditya','2013-12-04 21:08:38','aaa@amail.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$AAA$','aaa@amail.com','aaa@amail.com',1,0,'2013-12-04 21:08:38','1969-01-01 00:00:00','aaa@amail.com','2013-12-04 21:08:38',NULL,NULL),
(83,62,'Password Management Findings (1).docx','2013-12-04 21:08:59','aaa@amail.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$AAA$Aditya$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-04 21:08:59','1969-01-01 00:00:00','aaa@amail.com','2013-12-04 21:08:59',NULL,NULL),
(84,63,'Vishnu','2013-12-04 21:09:30','aaa@amail.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$AAA$Aditya$','aaa@amail.com','aaa@amail.com',1,0,'2013-12-04 21:09:30','1969-01-01 00:00:00','aaa@amail.com','2013-12-04 21:09:30',NULL,NULL),
(85,64,'Forgot Password Mgmt Text.docx','2013-12-04 21:09:52','aaa@amail.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$AAA$Aditya$Vishnu$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-04 21:09:52','1969-01-01 00:00:00','aaa@amail.com','2013-12-04 21:09:52',NULL,NULL),
(86,65,'AAA','2013-12-04 21:25:30','aditya@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aditya@verudix.com$My Files$Nag$','aditya@verudix.com','aditya@verudix.com',1,0,'2013-12-04 21:25:30','1969-01-01 00:00:00','aditya@verudix.com','2013-12-04 21:25:30',NULL,NULL),
(87,66,'BBB','2013-12-04 21:27:10','aditya@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aditya@verudix.com$My Files$Nag$AAA$','aditya@verudix.com','aditya@verudix.com',1,0,'2013-12-04 21:27:10','1969-01-01 00:00:00','aditya@verudix.com','2013-12-04 21:27:10',NULL,NULL),
(88,67,'Test','2013-12-04 21:31:01','aditya@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aditya@verudix.com$My Files$','aditya@verudix.com','aditya@verudix.com',1,0,'2013-12-04 21:31:01','1969-01-01 00:00:00','aditya@verudix.com','2013-12-04 21:31:01',NULL,NULL),
(89,68,'unibSqlMapConfig.xml','2013-12-04 21:31:17','aditya@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aditya@verudix.com$My Files$Test$','aditya@verudix.com','aditya@verudix.com',0,1,'2013-12-04 21:31:17','1969-01-01 00:00:00','aditya@verudix.com','2013-12-04 21:31:17',NULL,NULL),
(90,69,'One','2013-12-04 21:31:25','aditya@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aditya@verudix.com$My Files$Test$','aditya@verudix.com','aditya@verudix.com',1,0,'2013-12-04 21:31:25','1969-01-01 00:00:00','aditya@verudix.com','2013-12-04 21:31:25',NULL,NULL),
(91,70,'JAVA_Web_Service_API_Specification (1).docx','2013-12-04 21:31:58','aditya@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aditya@verudix.com$My Files$Test$One$','aditya@verudix.com','aditya@verudix.com',0,1,'2013-12-04 21:31:58','1969-01-01 00:00:00','aditya@verudix.com','2013-12-04 21:31:58',NULL,NULL),
(92,71,'Ver','2013-12-04 21:34:26','aditya@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aditya@verudix.com$My Files$','aditya@verudix.com','aditya@verudix.com',1,0,'2013-12-04 21:34:26','1969-01-01 00:00:00','aditya@verudix.com','2013-12-04 21:34:26',NULL,NULL),
(93,72,'Forgot Password Mgmt Text.docx','2013-12-04 21:34:36','aditya@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aditya@verudix.com$My Files$Ver$','aditya@verudix.com','aditya@verudix.com',0,1,'2013-12-04 21:34:36','1969-01-01 00:00:00','aditya@verudix.com','2013-12-04 21:34:36',NULL,NULL),
(94,73,'AAA','2013-12-04 21:35:48','aditya@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aditya@verudix.com$My Files$Ver$','aditya@verudix.com','aditya@verudix.com',1,0,'2013-12-04 21:35:48','1969-01-01 00:00:00','aditya@verudix.com','2013-12-04 21:35:48',NULL,NULL),
(95,74,'DocuSign - U.S. Templates Matrix 20130701.xlsx','2013-12-04 21:35:57','aditya@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aditya@verudix.com$My Files$Ver$AAA$','aditya@verudix.com','aditya@verudix.com',0,1,'2013-12-04 21:35:57','1969-01-01 00:00:00','aditya@verudix.com','2013-12-04 21:35:57',NULL,NULL),
(96,75,'git.pdf','2013-12-05 14:28:44','aaa@amail.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',0,1,'2013-12-05 14:28:44','1969-01-01 00:00:00','aaa@amail.com','2013-12-05 14:28:44',NULL,NULL),
(97,76,'FolderNew','2013-12-05 14:29:10','aaa@amail.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$aaa@amail.com$My Files$','aaa@amail.com','aaa@amail.com',1,0,'2013-12-05 14:29:10','1969-01-01 00:00:00','aaa@amail.com','2013-12-05 14:29:10',NULL,NULL),
(102,80,'CreateBearerTokenFromClientCredentials.docx','2013-12-05 18:02:45','sreedhar@verudix.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$sreedhar@verudix.com$My Files$','sreedhar@verudix.com','sreedhar@verudix.com',0,1,'2013-12-05 18:02:45','1969-01-01 00:00:00','sreedhar@verudix.com','2013-12-05 18:02:45',NULL,NULL),
(104,34,'Feature_BUG_UNI_B_Functional_Specification.docx','2013-12-05 19:14:51','helluvanag@gmail.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$','nag@nag.com','nag@nag.com',0,1,'2013-12-05 19:14:51','2013-12-05 19:27:51','nag@nag.com','2013-12-05 19:14:51','nag@nag.com','2013-12-05 19:14:51'),
(105,82,'keerthi','2013-12-06 10:44:38','keerthi@verudix.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$keerthi@verudix.com$My Files$','keerthi@verudix.com','keerthi@verudix.com',1,0,'2013-12-06 10:44:38','1969-01-01 00:00:00','keerthi@verudix.com','2013-12-06 10:44:38',NULL,NULL),
(106,83,'CreateBearerTokenFromClientCredentials.docx','2013-12-06 10:45:14','keerthi@verudix.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$keerthi@verudix.com$My Files$','keerthi@verudix.com','keerthi@verudix.com',0,1,'2013-12-06 10:45:14','1969-01-01 00:00:00','keerthi@verudix.com','2013-12-06 10:45:14',NULL,NULL),
(107,84,'Test','2013-12-06 11:11:35','sreedhar@verudix.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$sreedhar@verudix.com$My Files$','sreedhar@verudix.com','sreedhar@verudix.com',1,0,'2013-12-06 11:11:35','1969-01-01 00:00:00','sreedhar@verudix.com','2013-12-06 11:11:35',NULL,NULL),
(108,85,'ABC','2013-12-06 14:31:01','nag@nag.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$','nag@nag.com','nag@nag.com',1,0,'2013-12-06 14:31:01','1969-01-01 00:00:00','nag@nag.com','2013-12-06 14:31:01',NULL,NULL),
(109,86,'Keerthi','2013-12-06 17:57:07','nag@nag.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$','nag@nag.com','nag@nag.com',1,0,'2013-12-06 17:57:07','1969-01-01 00:00:00','nag@nag.com','2013-12-06 17:57:07',NULL,NULL),
(110,87,'One','2013-12-06 17:57:15','nag@nag.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$Keerthi$','nag@nag.com','nag@nag.com',1,0,'2013-12-06 17:57:15','1969-01-01 00:00:00','nag@nag.com','2013-12-06 17:57:15',NULL,NULL),
(118,88,'Monday','2013-12-06 18:12:29','nag@nag.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$','nag@nag.com','nag@nag.com',1,0,'2013-12-06 18:12:29','1969-01-01 00:00:00','nag@nag.com','2013-12-06 18:12:29',NULL,NULL),
(119,89,'unib_intuit_test_users_all.xls','2013-12-06 18:13:32','nag@nag.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$Monday$','nag@nag.com','nag@nag.com',0,1,'2013-12-06 18:13:32','1969-01-01 00:00:00','nag@nag.com','2013-12-06 18:13:32',NULL,NULL),
(120,90,'mysql.sql','2013-12-06 18:29:00','nag@nag.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$Monday$','nag@nag.com','nag@nag.com',0,1,'2013-12-06 18:29:00','1969-01-01 00:00:00','nag@nag.com','2013-12-06 18:29:00',NULL,NULL),
(121,91,'mysql.sql','2013-12-06 18:38:06','nag@nag.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$','nag@nag.com','nag@nag.com',0,1,'2013-12-06 18:38:06','1969-01-01 00:00:00','nag@nag.com','2013-12-06 18:38:06',NULL,NULL),
(122,92,'a1','2013-12-06 18:46:28','nag@nag.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$ABC$','nag@nag.com','nag@nag.com',1,0,'2013-12-06 18:46:28','1969-01-01 00:00:00','nag@nag.com','2013-12-06 18:46:28',NULL,NULL),
(123,93,'a2','2013-12-06 18:46:37','nag@nag.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$ABC$a1$','nag@nag.com','nag@nag.com',1,0,'2013-12-06 18:46:37','1969-01-01 00:00:00','nag@nag.com','2013-12-06 18:46:37',NULL,NULL),
(129,96,'Nagender.txt','2013-12-06 19:36:42','kv@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$kv@gmail.com$My Files$','kv@gmail.com','kv@gmail.com',0,1,'2013-12-06 19:36:42','1969-01-01 00:00:00','kv@gmail.com','2013-12-06 19:36:42',NULL,NULL),
(134,97,'AMD','2013-12-06 19:46:25','ravi@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$ravi@gmail.com$My Files$','ravi@gmail.com','ravi@gmail.com',1,0,'2013-12-06 19:46:25','1969-01-01 00:00:00','ravi@gmail.com','2013-12-06 19:46:25',NULL,NULL),
(135,98,'Babloo','2013-12-06 20:33:28','seshu@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$seshu@gmail.com$My Files$','seshu@gmail.com','seshu@gmail.com',1,0,'2013-12-06 20:33:28','1969-01-01 00:00:00','seshu@gmail.com','2013-12-06 20:33:28',NULL,NULL),
(136,99,'AMD','2013-12-06 20:35:38','seshu@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$seshu@gmail.com$My Files$Babloo$','seshu@gmail.com','seshu@gmail.com',1,0,'2013-12-06 20:35:38','1969-01-01 00:00:00','seshu@gmail.com','2013-12-06 20:35:38',NULL,NULL),
(139,102,'DocuSign - U.S. Templates Matrix 20130701.xlsx','2013-12-06 20:38:16','seshu@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$seshu@gmail.com$My Files$','seshu@gmail.com','seshu@gmail.com',0,1,'2013-12-06 20:38:16','1969-01-01 00:00:00','seshu@gmail.com','2013-12-06 20:38:16',NULL,NULL),
(140,103,'Two','2013-12-06 21:20:12','seshu@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$seshu@gmail.com$My Files$Babloo$AMD$','seshu@gmail.com','seshu@gmail.com',1,0,'2013-12-06 21:20:12','1969-01-01 00:00:00','seshu@gmail.com','2013-12-06 21:20:12',NULL,NULL),
(141,104,'Three','2013-12-06 21:42:53','seshu@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$seshu@gmail.com$My Files$Babloo$AMD$Two$','seshu@gmail.com','seshu@gmail.com',1,0,'2013-12-06 21:42:53','1969-01-01 00:00:00','seshu@gmail.com','2013-12-06 21:42:53',NULL,NULL),
(142,105,'Tuesday','2013-12-09 11:17:14','nag@nag.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$Monday$','nag@nag.com','nag@nag.com',1,0,'2013-12-09 11:17:14','1969-01-01 00:00:00','nag@nag.com','2013-12-09 11:17:14',NULL,NULL),
(143,106,'Wednesday','2013-12-09 11:17:26','nag@nag.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$Monday$Tuesday$','nag@nag.com','nag@nag.com',1,0,'2013-12-09 11:17:26','1969-01-01 00:00:00','nag@nag.com','2013-12-09 11:17:26',NULL,NULL),
(144,107,'Thursday','2013-12-09 11:17:34','nag@nag.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$Monday$Tuesday$Wednesday$','nag@nag.com','nag@nag.com',1,0,'2013-12-09 11:17:34','1969-01-01 00:00:00','nag@nag.com','2013-12-09 11:17:34',NULL,NULL),
(145,108,'UNI_B_Proxy (1).pptx','2013-12-09 11:17:59','nag@nag.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$Monday$Tuesday$Wednesday$','nag@nag.com','nag@nag.com',0,1,'2013-12-09 11:17:59','1969-01-01 00:00:00','nag@nag.com','2013-12-09 11:17:59',NULL,NULL),
(146,90,'mysql.sql','2013-12-09 11:40:52','helluvanag@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$Monday$','nag@nag.com','nag@nag.com',0,1,'2013-12-09 11:40:52','2013-12-11 11:40:52','nag@nag.com','2013-12-09 11:40:52','nag@nag.com','2013-12-09 11:40:52'),
(147,109,'Password Management Findings (1).docx','2013-12-09 12:15:30','nag@nag.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$Monday$Tuesday$Wednesday$Thursday$','nag@nag.com','nag@nag.com',0,1,'2013-12-09 12:15:30','1969-01-01 00:00:00','nag@nag.com','2013-12-09 12:15:30',NULL,NULL),
(148,110,'Monday','2013-12-09 13:32:56','venu@verudix.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$','venu@verudix.com','venu@verudix.com',1,0,'2013-12-09 13:32:56','1969-01-01 00:00:00','venu@verudix.com','2013-12-09 13:32:56',NULL,NULL),
(149,111,'Tuesday','2013-12-09 13:33:06','venu@verudix.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$Monday$','venu@verudix.com','venu@verudix.com',1,0,'2013-12-09 13:33:06','1969-01-01 00:00:00','venu@verudix.com','2013-12-09 13:33:06',NULL,NULL),
(150,112,'Wednesday','2013-12-09 13:33:33','venu@verudix.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$Monday$Tuesday$','venu@verudix.com','venu@verudix.com',1,0,'2013-12-09 13:33:33','1969-01-01 00:00:00','venu@verudix.com','2013-12-09 13:33:33',NULL,NULL),
(151,113,'Thursday','2013-12-09 13:33:44','venu@verudix.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$Monday$Tuesday$Wednesday$','venu@verudix.com','venu@verudix.com',1,0,'2013-12-09 13:33:44','1969-01-01 00:00:00','venu@verudix.com','2013-12-09 13:33:44',NULL,NULL),
(152,91,'mysql.sql','2013-12-09 14:49:32','venu@verudix.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$','nag@nag.com','nag@nag.com',0,1,'2013-12-09 14:49:32','2013-12-09 15:49:32','nag@nag.com','2013-12-09 14:49:32','nag@nag.com','2013-12-09 14:49:32'),
(153,114,'keerthi folder','2013-12-09 15:47:36','venu@verudix.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$','venu@verudix.com','venu@verudix.com',1,0,'2013-12-09 15:47:36','1969-01-01 00:00:00','venu@verudix.com','2013-12-09 15:47:36',NULL,NULL),
(154,115,'One','2013-12-09 15:47:46','vishnu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vishnu@verudix.com$My Files$Nag$','vishnu@verudix.com','vishnu@verudix.com',1,0,'2013-12-09 15:47:46','1969-01-01 00:00:00','vishnu@verudix.com','2013-12-09 15:47:46',NULL,NULL),
(155,116,'java','2013-12-09 15:47:48','venu@verudix.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$keerthi folder$','venu@verudix.com','venu@verudix.com',1,0,'2013-12-09 15:47:48','1969-01-01 00:00:00','venu@verudix.com','2013-12-09 15:47:48',NULL,NULL),
(156,117,'Two','2013-12-09 15:47:56','vishnu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vishnu@verudix.com$My Files$Nag$One$','vishnu@verudix.com','vishnu@verudix.com',1,0,'2013-12-09 15:47:56','1969-01-01 00:00:00','vishnu@verudix.com','2013-12-09 15:47:56',NULL,NULL),
(157,118,'lockit java','2013-12-09 15:48:01','venu@verudix.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$keerthi folder$java$','venu@verudix.com','venu@verudix.com',1,0,'2013-12-09 15:48:01','1969-01-01 00:00:00','venu@verudix.com','2013-12-09 15:48:01',NULL,NULL),
(158,119,'Three','2013-12-09 15:48:02','vishnu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vishnu@verudix.com$My Files$Nag$One$Two$','vishnu@verudix.com','vishnu@verudix.com',1,0,'2013-12-09 15:48:02','1969-01-01 00:00:00','vishnu@verudix.com','2013-12-09 15:48:02',NULL,NULL),
(159,120,'Four','2013-12-09 15:48:11','vishnu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vishnu@verudix.com$My Files$Nag$One$Two$Three$','vishnu@verudix.com','vishnu@verudix.com',1,0,'2013-12-09 15:48:11','1969-01-01 00:00:00','vishnu@verudix.com','2013-12-09 15:48:11',NULL,NULL),
(160,121,'testing','2013-12-09 15:48:12','venu@verudix.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$keerthi folder$java$lockit java$','venu@verudix.com','venu@verudix.com',1,0,'2013-12-09 15:48:12','1969-01-01 00:00:00','venu@verudix.com','2013-12-09 15:48:12',NULL,NULL),
(161,122,'Monday','2013-12-09 15:48:19','vishnu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vishnu@verudix.com$My Files$Nag$','vishnu@verudix.com','vishnu@verudix.com',1,0,'2013-12-09 15:48:19','1969-01-01 00:00:00','vishnu@verudix.com','2013-12-09 15:48:19',NULL,NULL),
(162,123,'Tuesday','2013-12-09 15:48:26','vishnu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vishnu@verudix.com$My Files$Nag$Monday$','vishnu@verudix.com','vishnu@verudix.com',1,0,'2013-12-09 15:48:26','1969-01-01 00:00:00','vishnu@verudix.com','2013-12-09 15:48:26',NULL,NULL),
(163,124,'Wednesday','2013-12-09 15:48:33','vishnu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vishnu@verudix.com$My Files$Nag$Monday$Tuesday$','vishnu@verudix.com','vishnu@verudix.com',1,0,'2013-12-09 15:48:33','1969-01-01 00:00:00','vishnu@verudix.com','2013-12-09 15:48:33',NULL,NULL),
(164,125,'Thursday','2013-12-09 15:48:42','vishnu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vishnu@verudix.com$My Files$Nag$Monday$Tuesday$Wednesday$','vishnu@verudix.com','vishnu@verudix.com',1,0,'2013-12-09 15:48:42','1969-01-01 00:00:00','vishnu@verudix.com','2013-12-09 15:48:42',NULL,NULL),
(165,126,'Jan','2013-12-09 15:48:54','vishnu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vishnu@verudix.com$My Files$Nag$','vishnu@verudix.com','vishnu@verudix.com',1,0,'2013-12-09 15:48:54','1969-01-01 00:00:00','vishnu@verudix.com','2013-12-09 15:48:54',NULL,NULL),
(166,127,'Feb','2013-12-09 15:49:00','vishnu@verudix.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vishnu@verudix.com$My Files$Nag$Jan$','vishnu@verudix.com','vishnu@verudix.com',1,0,'2013-12-09 15:49:00','1969-01-01 00:00:00','vishnu@verudix.com','2013-12-09 15:49:00',NULL,NULL),
(167,128,'airtelbill.docx','2013-12-09 15:58:45','two@two.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$','two@two.com','two@two.com',0,1,'2013-12-09 15:58:45','1969-01-01 00:00:00','two@two.com','2013-12-09 15:58:45',NULL,NULL),
(168,129,'One','2013-12-09 15:58:51','two@two.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$','two@two.com','two@two.com',1,0,'2013-12-09 15:58:51','1969-01-01 00:00:00','two@two.com','2013-12-09 15:58:51',NULL,NULL),
(169,130,'jan','2013-12-09 15:58:54','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$one@one.com$My Files$','one@one.com','one@one.com',1,0,'2013-12-09 15:58:54','1969-01-01 00:00:00','one@one.com','2013-12-09 15:58:54',NULL,NULL),
(170,131,'citibankbill.docx','2013-12-09 15:59:00','two@two.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$','two@two.com','two@two.com',0,1,'2013-12-09 15:59:00','1969-01-01 00:00:00','two@two.com','2013-12-09 15:59:00',NULL,NULL),
(171,132,'feb','2013-12-09 15:59:00','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$one@one.com$My Files$jan$','one@one.com','one@one.com',1,0,'2013-12-09 15:59:00','1969-01-01 00:00:00','one@one.com','2013-12-09 15:59:00',NULL,NULL),
(172,133,'Two','2013-12-09 15:59:05','two@two.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$','two@two.com','two@two.com',1,0,'2013-12-09 15:59:05','1969-01-01 00:00:00','two@two.com','2013-12-09 15:59:05',NULL,NULL),
(173,134,'march','2013-12-09 15:59:09','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$one@one.com$My Files$jan$feb$','one@one.com','one@one.com',1,0,'2013-12-09 15:59:09','1969-01-01 00:00:00','one@one.com','2013-12-09 15:59:09',NULL,NULL),
(174,135,'CreateBearerTokenFromClientCredentials.docx','2013-12-09 15:59:15','two@two.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$','two@two.com','two@two.com',0,1,'2013-12-09 15:59:15','1969-01-01 00:00:00','two@two.com','2013-12-09 15:59:15',NULL,NULL),
(175,136,'april','2013-12-09 15:59:20','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$one@one.com$My Files$jan$feb$march$','one@one.com','one@one.com',1,0,'2013-12-09 15:59:20','1969-01-01 00:00:00','one@one.com','2013-12-09 15:59:20',NULL,NULL),
(176,137,'Three','2013-12-09 15:59:21','two@two.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$','two@two.com','two@two.com',1,0,'2013-12-09 15:59:21','1969-01-01 00:00:00','two@two.com','2013-12-09 15:59:21',NULL,NULL),
(177,138,'Debugger-Tutorial-Companion-Document.pdf','2013-12-09 15:59:31','two@two.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$Three$','two@two.com','two@two.com',0,1,'2013-12-09 15:59:31','1969-01-01 00:00:00','two@two.com','2013-12-09 15:59:31',NULL,NULL),
(178,139,'Lockit_Refactored-servlet.xml','2013-12-09 15:59:32','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$one@one.com$My Files$jan$feb$march$','one@one.com','one@one.com',0,1,'2013-12-09 15:59:32','1969-01-01 00:00:00','one@one.com','2013-12-09 15:59:32',NULL,NULL),
(179,140,'Four','2013-12-09 15:59:53','two@two.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$Three$','two@two.com','two@two.com',1,0,'2013-12-09 15:59:53','1969-01-01 00:00:00','two@two.com','2013-12-09 15:59:53',NULL,NULL),
(180,141,'may','2013-12-09 15:59:56','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$one@one.com$My Files$jan$feb$march$','one@one.com','one@one.com',1,0,'2013-12-09 15:59:56','1969-01-01 00:00:00','one@one.com','2013-12-09 15:59:56',NULL,NULL),
(181,142,'web.xml','2013-12-09 16:00:13','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$one@one.com$My Files$jan$feb$march$may$','one@one.com','one@one.com',0,1,'2013-12-09 16:00:13','1969-01-01 00:00:00','one@one.com','2013-12-09 16:00:13',NULL,NULL),
(182,143,'dev_restapi.docx','2013-12-09 16:00:13','two@two.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$Three$Four$','two@two.com','two@two.com',0,1,'2013-12-09 16:00:13','1969-01-01 00:00:00','two@two.com','2013-12-09 16:00:13',NULL,NULL),
(183,144,'Five','2013-12-09 16:00:18','two@two.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$Three$Four$','two@two.com','two@two.com',1,0,'2013-12-09 16:00:18','1969-01-01 00:00:00','two@two.com','2013-12-09 16:00:18',NULL,NULL),
(184,145,'Feature_BUG_UNI_B_Functional_Specification.docx','2013-12-09 16:00:31','two@two.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$Three$Four$Five$','two@two.com','two@two.com',0,1,'2013-12-09 16:00:31','1969-01-01 00:00:00','two@two.com','2013-12-09 16:00:31',NULL,NULL),
(185,146,'Six','2013-12-09 16:00:37','two@two.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$Three$Four$Five$','two@two.com','two@two.com',1,0,'2013-12-09 16:00:37','1969-01-01 00:00:00','two@two.com','2013-12-09 16:00:37',NULL,NULL),
(186,147,'june','2013-12-09 16:00:58','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$one@one.com$My Files$jan$feb$march$april$','one@one.com','one@one.com',1,0,'2013-12-09 16:00:58','1969-01-01 00:00:00','one@one.com','2013-12-09 16:00:58',NULL,NULL),
(187,148,'httpclient-tutorial.pdf','2013-12-09 16:01:39','two@two.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$Three$Four$Five$','two@two.com','two@two.com',0,1,'2013-12-09 16:01:39','1969-01-01 00:00:00','two@two.com','2013-12-09 16:01:39',NULL,NULL),
(188,148,'httpclient-tutorial.pdf','2013-12-09 17:07:17','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$Three$Four$Five$','two@two.com','two@two.com',0,1,'2013-12-09 17:07:17','2013-12-10 17:07:17','two@two.com','2013-12-09 17:07:17','two@two.com','2013-12-09 17:07:17'),
(189,129,'One','2013-12-09 17:11:23','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$','two@two.com','two@two.com',1,0,'2013-12-09 17:11:23','2013-12-10 17:11:23','two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-09 17:11:23'),
(190,131,'citibankbill.docx','2013-12-09 15:59:00','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$','two@two.com','two@two.com',0,1,'2013-12-09 17:11:23','2013-12-10 17:11:23','two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-09 17:11:23'),
(191,133,'Two','2013-12-09 15:59:05','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$','two@two.com','two@two.com',1,0,'2013-12-09 17:11:23','2013-12-10 17:11:23','two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-09 17:11:23'),
(192,135,'CreateBearerTokenFromClientCredentials.docx','2013-12-09 15:59:15','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$','two@two.com','two@two.com',0,1,'2013-12-09 17:11:23','2013-12-10 17:11:23','two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-09 17:11:23'),
(193,137,'Three','2013-12-09 15:59:21','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$','two@two.com','two@two.com',1,0,'2013-12-09 17:11:23','2013-12-10 17:11:23','two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-09 17:11:23'),
(194,138,'Debugger-Tutorial-Companion-Document.pdf','2013-12-09 15:59:31','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$Three$','two@two.com','two@two.com',0,1,'2013-12-09 17:11:23','2013-12-10 17:11:23','two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-09 17:11:23'),
(195,140,'Four','2013-12-09 15:59:53','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$Three$','two@two.com','two@two.com',1,0,'2013-12-09 17:11:23','2013-12-10 17:11:23','two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-09 17:11:23'),
(196,143,'dev_restapi.docx','2013-12-09 16:00:13','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$Three$Four$','two@two.com','two@two.com',0,1,'2013-12-09 17:11:23','2013-12-10 17:11:23','two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-09 17:11:23'),
(197,144,'Five','2013-12-09 16:00:18','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$Three$Four$','two@two.com','two@two.com',1,0,'2013-12-09 17:11:23','2013-12-10 17:11:23','two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-09 17:11:23'),
(198,145,'Feature_BUG_UNI_B_Functional_Specification.docx','2013-12-09 16:00:31','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$Three$Four$Five$','two@two.com','two@two.com',0,1,'2013-12-09 17:11:23','2013-12-10 17:11:23','two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-09 17:11:23'),
(199,146,'Six','2013-12-09 16:00:37','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$Three$Four$Five$','two@two.com','two@two.com',1,0,'2013-12-09 17:11:23','2013-12-10 17:11:23','two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-09 17:11:23'),
(200,148,'httpclient-tutorial.pdf','2013-12-09 16:01:39','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$Three$Four$Five$','two@two.com','two@two.com',0,1,'2013-12-09 17:11:23','2013-12-10 17:11:23','two@two.com','2013-12-09 17:11:23','two@two.com','2013-12-09 17:11:23'),
(205,35,'skynet.sql','2013-12-09 19:18:28','venugopal@gmail.com','D:$verudix_ws_new$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$','venu@verudix.com','venu@verudix.com',0,1,'2013-12-09 19:18:28','2013-12-10 19:18:28','venu@verudix.com','2013-12-09 19:18:28','venu@verudix.com','2013-12-09 19:18:28'),
(206,128,'airtelbill.docx','2013-12-09 20:07:56','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$','two@two.com','two@two.com',0,1,'2013-12-09 20:07:56','2013-12-10 20:07:56','two@two.com','2013-12-09 20:07:56','two@two.com','2013-12-09 20:07:56'),
(207,128,'airtelbill.docx','2013-12-09 20:09:06','nag@nag.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$','two@two.com','one@one.com',0,1,'2013-12-09 20:09:06','2013-12-09 22:09:06','one@one.com','2013-12-09 20:09:06','one@one.com','2013-12-09 20:09:06'),
(208,91,'mysql.sql','2013-12-09 20:41:06','keerthi.rukmini02@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$nag@nag.com$My Files$','nag@nag.com','nag@nag.com',0,1,'2013-12-09 20:41:06','2013-12-11 20:41:06','nag@nag.com','2013-12-09 20:41:06','nag@nag.com','2013-12-09 20:41:06'),
(209,110,'Monday','2013-12-09 21:04:14','keerthi.rukmini02@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$','venu@verudix.com','venu@verudix.com',1,0,'2013-12-09 21:04:14','2013-12-10 21:04:14','venu@verudix.com','2013-12-09 21:04:14','venu@verudix.com','2013-12-09 21:04:14'),
(210,111,'Tuesday','2013-12-09 13:33:06','keerthi.rukmini02@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$Monday$','venu@verudix.com','venu@verudix.com',1,0,'2013-12-09 21:04:14','2013-12-10 21:04:14','venu@verudix.com','2013-12-09 21:04:14','venu@verudix.com','2013-12-09 21:04:14'),
(211,112,'Wednesday','2013-12-09 13:33:33','keerthi.rukmini02@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$Monday$Tuesday$','venu@verudix.com','venu@verudix.com',1,0,'2013-12-09 21:04:14','2013-12-10 21:04:14','venu@verudix.com','2013-12-09 21:04:14','venu@verudix.com','2013-12-09 21:04:14'),
(212,113,'Thursday','2013-12-09 13:33:44','keerthi.rukmini02@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$Monday$Tuesday$Wednesday$','venu@verudix.com','venu@verudix.com',1,0,'2013-12-09 21:04:14','2013-12-10 21:04:14','venu@verudix.com','2013-12-09 21:04:14','venu@verudix.com','2013-12-09 21:04:14'),
(213,149,'airtelbill.docx','2013-12-09 21:05:44','venu@verudix.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$','venu@verudix.com','venu@verudix.com',0,1,'2013-12-09 21:05:44','1969-01-01 00:00:00','venu@verudix.com','2013-12-09 21:05:44',NULL,NULL),
(214,149,'airtelbill.docx','2013-12-09 21:06:18','keerthi.rukmini02@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$','venu@verudix.com','venu@verudix.com',0,1,'2013-12-09 21:06:18','2013-12-10 21:06:18','venu@verudix.com','2013-12-09 21:06:18','venu@verudix.com','2013-12-09 21:06:18'),
(215,150,'citibankbill.docx','2013-12-09 21:08:46','venu@verudix.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$','venu@verudix.com','venu@verudix.com',0,1,'2013-12-09 21:08:46','1969-01-01 00:00:00','venu@verudix.com','2013-12-09 21:08:46',NULL,NULL),
(216,150,'citibankbill.docx','2013-12-09 21:08:57','keerthi.rukmini02@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$','venu@verudix.com','venu@verudix.com',0,1,'2013-12-09 21:08:57','2013-12-10 21:08:57','venu@verudix.com','2013-12-09 21:08:57','venu@verudix.com','2013-12-09 21:08:57'),
(217,151,'Debugger-Tutorial-Companion-Document.pdf','2013-12-09 21:26:15','venu@verudix.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$','venu@verudix.com','venu@verudix.com',0,1,'2013-12-09 21:26:15','1969-01-01 00:00:00','venu@verudix.com','2013-12-09 21:26:15',NULL,NULL),
(218,151,'Debugger-Tutorial-Companion-Document.pdf','2013-12-09 21:26:25','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$','venu@verudix.com','venu@verudix.com',0,1,'2013-12-09 21:26:25','2013-12-10 21:26:25','venu@verudix.com','2013-12-09 21:26:25','venu@verudix.com','2013-12-09 21:26:25'),
(219,128,'airtelbill.docx','2013-12-10 10:56:14','venu@verudix.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$','two@two.com','one@one.com',0,1,'2013-12-10 10:56:14','2013-12-11 10:56:14','one@one.com','2013-12-10 10:56:14','one@one.com','2013-12-10 10:56:14'),
(220,151,'Debugger-Tutorial-Companion-Document.pdf','2013-12-10 12:03:35','alekya@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$','venu@verudix.com','one@one.com',0,1,'2013-12-10 12:03:35','2013-12-22 12:03:35','one@one.com','2013-12-10 12:03:35','one@one.com','2013-12-10 12:03:35'),
(221,152,'venugopal','2013-12-10 12:05:51','venuuverudix@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venuuverudix@gmail.com$My Files$','venuuverudix@gmail.com','venuuverudix@gmail.com',1,0,'2013-12-10 12:05:51','1969-01-01 00:00:00','venuuverudix@gmail.com','2013-12-10 12:05:51',NULL,NULL),
(222,153,'tyr','2013-12-10 12:05:56','venuuverudix@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venuuverudix@gmail.com$My Files$venugopal$','venuuverudix@gmail.com','venuuverudix@gmail.com',1,0,'2013-12-10 12:05:56','1969-01-01 00:00:00','venuuverudix@gmail.com','2013-12-10 12:05:56',NULL,NULL),
(223,154,'asdfasd','2013-12-10 12:06:01','venuuverudix@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venuuverudix@gmail.com$My Files$venugopal$tyr$','venuuverudix@gmail.com','venuuverudix@gmail.com',1,0,'2013-12-10 12:06:01','1969-01-01 00:00:00','venuuverudix@gmail.com','2013-12-10 12:06:01',NULL,NULL),
(224,155,'asdfadsf','2013-12-10 12:06:07','venuuverudix@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venuuverudix@gmail.com$My Files$venugopal$tyr$asdfasd$','venuuverudix@gmail.com','venuuverudix@gmail.com',1,0,'2013-12-10 12:06:07','1969-01-01 00:00:00','venuuverudix@gmail.com','2013-12-10 12:06:07',NULL,NULL),
(225,156,'opoiidf','2013-12-10 12:06:14','venuuverudix@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venuuverudix@gmail.com$My Files$venugopal$tyr$asdfasd$asdfadsf$','venuuverudix@gmail.com','venuuverudix@gmail.com',1,0,'2013-12-10 12:06:14','1969-01-01 00:00:00','venuuverudix@gmail.com','2013-12-10 12:06:14',NULL,NULL),
(226,157,'New Microsoft Office Excel Worksheet.xlsx','2013-12-10 12:06:25','venuuverudix@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venuuverudix@gmail.com$My Files$venugopal$tyr$asdfasd$asdfadsf$opoiidf$','venuuverudix@gmail.com','venuuverudix@gmail.com',0,1,'2013-12-10 12:06:25','1969-01-01 00:00:00','venuuverudix@gmail.com','2013-12-10 12:06:25',NULL,NULL),
(227,151,'Debugger-Tutorial-Companion-Document.pdf','2013-12-10 12:06:52','bhanu@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venu@verudix.com$My Files$','venu@verudix.com','one@one.com',0,1,'2013-12-10 12:06:52','2013-12-21 12:06:52','one@one.com','2013-12-10 12:06:52','one@one.com','2013-12-10 12:06:52'),
(228,158,'New Microsoft Office Excel Worksheet (2).xls','2013-12-10 12:08:23','venuuverudix@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venuuverudix@gmail.com$My Files$','venuuverudix@gmail.com','venuuverudix@gmail.com',0,1,'2013-12-10 12:08:23','1969-01-01 00:00:00','venuuverudix@gmail.com','2013-12-10 12:08:23',NULL,NULL),
(229,159,'sajf foiskdjf.txt','2013-12-10 12:09:09','venuuverudix@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venuuverudix@gmail.com$My Files$','venuuverudix@gmail.com','venuuverudix@gmail.com',0,1,'2013-12-10 12:09:09','1969-01-01 00:00:00','venuuverudix@gmail.com','2013-12-10 12:09:09',NULL,NULL),
(230,160,'venu.rtf','2013-12-10 12:09:37','venuuverudix@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venuuverudix@gmail.com$My Files$','venuuverudix@gmail.com','venuuverudix@gmail.com',0,1,'2013-12-10 12:09:37','1969-01-01 00:00:00','venuuverudix@gmail.com','2013-12-10 12:09:37',NULL,NULL),
(231,161,'sadfsadfsdafsdaf.pptx','2013-12-10 12:10:18','venuuverudix@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venuuverudix@gmail.com$My Files$','venuuverudix@gmail.com','venuuverudix@gmail.com',0,1,'2013-12-10 12:10:18','1969-01-01 00:00:00','venuuverudix@gmail.com','2013-12-10 12:10:18',NULL,NULL),
(232,162,'4','2013-12-10 12:10:36','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$','one@one.com','one@one.com',1,0,'2013-12-10 12:10:36','1969-01-01 00:00:00','one@one.com','2013-12-10 12:10:36',NULL,NULL),
(233,161,'sadfsadfsdafsdaf.pptx','2013-12-10 12:10:39','nag@nag.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venuuverudix@gmail.com$My Files$','venuuverudix@gmail.com','venuuverudix@gmail.com',0,1,'2013-12-10 12:10:39','2013-12-21 12:10:39','venuuverudix@gmail.com','2013-12-10 12:10:39','venuuverudix@gmail.com','2013-12-10 12:10:39'),
(234,160,'venu.rtf','2013-12-10 12:11:04','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venuuverudix@gmail.com$My Files$','venuuverudix@gmail.com','venuuverudix@gmail.com',0,1,'2013-12-10 12:11:04','2013-12-21 12:11:04','venuuverudix@gmail.com','2013-12-10 12:11:04','venuuverudix@gmail.com','2013-12-10 12:11:04'),
(235,160,'venu.rtf','2013-12-10 12:11:27','keerthi.rukmini02@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venuuverudix@gmail.com$My Files$','venuuverudix@gmail.com','venuuverudix@gmail.com',0,1,'2013-12-10 12:11:27','2013-12-10 12:11:27','venuuverudix@gmail.com','2013-12-10 12:11:27','venuuverudix@gmail.com','2013-12-10 12:11:27'),
(236,161,'sadfsadfsdafsdaf.pptx','2013-12-10 12:11:52','keerthi.rukmini02@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venuuverudix@gmail.com$My Files$','venuuverudix@gmail.com','venuuverudix@gmail.com',0,1,'2013-12-10 12:11:52','2013-12-21 12:11:52','venuuverudix@gmail.com','2013-12-10 12:11:52','venuuverudix@gmail.com','2013-12-10 12:11:52'),
(237,161,'sadfsadfsdafsdaf.pptx','2013-12-10 12:12:13','keerthi@verudix.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venuuverudix@gmail.com$My Files$','venuuverudix@gmail.com','venuuverudix@gmail.com',0,1,'2013-12-10 12:12:13','2013-12-21 13:12:13','venuuverudix@gmail.com','2013-12-10 12:12:13','venuuverudix@gmail.com','2013-12-10 12:12:13'),
(238,163,'keerthiv','2013-12-10 12:31:49','abc@abc.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$abc@abc.com$My Files$','abc@abc.com','abc@abc.com',1,0,'2013-12-10 12:31:49','1969-01-01 00:00:00','abc@abc.com','2013-12-10 12:31:49',NULL,NULL),
(239,164,'lockit demo','2013-12-10 12:32:25','abc@abc.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$abc@abc.com$My Files$keerthiv$','abc@abc.com','abc@abc.com',1,0,'2013-12-10 12:32:25','1969-01-01 00:00:00','abc@abc.com','2013-12-10 12:32:25',NULL,NULL),
(240,165,'lockit java','2013-12-10 12:32:40','abc@abc.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$abc@abc.com$My Files$keerthiv$lockit demo$','abc@abc.com','abc@abc.com',1,0,'2013-12-10 12:32:40','1969-01-01 00:00:00','abc@abc.com','2013-12-10 12:32:40',NULL,NULL),
(241,166,'Lockit_Refactored-servlet.xml','2013-12-10 12:40:31','abc@abc.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$abc@abc.com$My Files$keerthiv$lockit demo$lockit java$','abc@abc.com','abc@abc.com',0,1,'2013-12-10 12:40:31','1969-01-01 00:00:00','abc@abc.com','2013-12-10 12:40:31',NULL,NULL),
(242,167,'DocuSign - U.S. Templates Matrix 20130701.xlsx','2013-12-10 12:44:24','mailkeert@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$mailkeert@gmail.com$My Files$','mailkeert@gmail.com','mailkeert@gmail.com',0,1,'2013-12-10 12:44:24','1969-01-01 00:00:00','mailkeert@gmail.com','2013-12-10 12:44:24',NULL,NULL),
(243,168,'Gmail','2013-12-10 12:44:36','mailkeert@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$mailkeert@gmail.com$My Files$','mailkeert@gmail.com','mailkeert@gmail.com',1,0,'2013-12-10 12:44:36','1969-01-01 00:00:00','mailkeert@gmail.com','2013-12-10 12:44:36',NULL,NULL),
(244,169,'Yahoo','2013-12-10 12:46:01','mailkeert@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$mailkeert@gmail.com$My Files$Gmail$','mailkeert@gmail.com','mailkeert@gmail.com',1,0,'2013-12-10 12:46:01','1969-01-01 00:00:00','mailkeert@gmail.com','2013-12-10 12:46:01',NULL,NULL),
(245,170,'UNI_B_Proxy (1).pptx','2013-12-10 12:46:22','mailkeert@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$mailkeert@gmail.com$My Files$Gmail$','mailkeert@gmail.com','mailkeert@gmail.com',0,1,'2013-12-10 12:46:22','1969-01-01 00:00:00','mailkeert@gmail.com','2013-12-10 12:46:22',NULL,NULL),
(246,171,'Lasdf','2013-12-10 15:49:03','kk@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$kk@gmail.com$My Files$','kk@gmail.com','kk@gmail.com',1,0,'2013-12-10 15:49:03','1969-01-01 00:00:00','kk@gmail.com','2013-12-10 15:49:03',NULL,NULL),
(247,172,'nag.sql','2013-12-10 15:49:17','kk@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$kk@gmail.com$My Files$Lasdf$','kk@gmail.com','kk@gmail.com',0,1,'2013-12-10 15:49:17','1969-01-01 00:00:00','kk@gmail.com','2013-12-10 15:49:17',NULL,NULL),
(248,173,'nag.sql','2013-12-11 10:38:17','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$','one@one.com','one@one.com',0,1,'2013-12-11 10:38:17','1969-01-01 00:00:00','one@one.com','2013-12-11 10:38:17',NULL,NULL),
(249,174,'ShareFolder','2013-12-11 10:39:18','two@two.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$','two@two.com','two@two.com',1,0,'2013-12-11 10:39:18','1969-01-01 00:00:00','two@two.com','2013-12-11 10:39:18',NULL,NULL),
(250,175,'XYZ','2013-12-11 10:41:17','two@two.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$two@two.com$My Files$One$Two$','two@two.com','two@two.com',1,0,'2013-12-11 10:41:17','1969-01-01 00:00:00','two@two.com','2013-12-11 10:41:17',NULL,NULL),
(251,176,'UNI_B_Process_Definition_Proxy.docx','2013-12-11 14:04:29','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$one@one.com$My Files$','one@one.com','one@one.com',0,1,'2013-12-11 14:04:29','1969-01-01 00:00:00','one@one.com','2013-12-11 14:04:29',NULL,NULL),
(252,177,'Monday','2013-12-11 14:08:05','one@one.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$one@one.com$My Files$','one@one.com','one@one.com',1,0,'2013-12-11 14:08:05','1969-01-01 00:00:00','one@one.com','2013-12-11 14:08:05',NULL,NULL),
(253,176,'UNI_B_Process_Definition_Proxy.docx','2013-12-11 16:21:04','two@two.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$one@one.com$My Files$','one@one.com','one@one.com',0,1,'2013-12-11 16:21:04','2013-12-22 16:21:04','one@one.com','2013-12-11 16:21:04','one@one.com','2013-12-11 16:21:04'),
(261,178,'Keerthi','2013-12-11 18:32:03','rukmini.keerthi02@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$rukmini.keerthi02@gmail.com$My Files$','rukmini.keerthi02@gmail.com','rukmini.keerthi02@gmail.com',1,0,'2013-12-11 18:32:03','1969-01-01 00:00:00','rukmini.keerthi02@gmail.com','2013-12-11 18:32:03',NULL,NULL),
(262,179,'Task_Management.pdf','2013-12-11 18:32:57','rukmini.keerthi02@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$rukmini.keerthi02@gmail.com$My Files$','rukmini.keerthi02@gmail.com','rukmini.keerthi02@gmail.com',0,1,'2013-12-11 18:32:57','1969-01-01 00:00:00','rukmini.keerthi02@gmail.com','2013-12-11 18:32:57',NULL,NULL),
(263,180,'Code_Review_Template.doc','2013-12-11 18:36:03','rukmini.keerthi02@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$rukmini.keerthi02@gmail.com$My Files$','rukmini.keerthi02@gmail.com','rukmini.keerthi02@gmail.com',0,1,'2013-12-11 18:36:03','1969-01-01 00:00:00','rukmini.keerthi02@gmail.com','2013-12-11 18:36:03',NULL,NULL),
(264,181,'airtelbill.docx','2013-12-11 18:37:13','rukmini.keerthi02@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$rukmini.keerthi02@gmail.com$My Files$','rukmini.keerthi02@gmail.com','rukmini.keerthi02@gmail.com',0,1,'2013-12-11 18:37:13','1969-01-01 00:00:00','rukmini.keerthi02@gmail.com','2013-12-11 18:37:13',NULL,NULL),
(265,182,'citibankbill.docx','2013-12-11 18:38:34','rukmini.keerthi02@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$rukmini.keerthi02@gmail.com$My Files$','rukmini.keerthi02@gmail.com','rukmini.keerthi02@gmail.com',0,1,'2013-12-11 18:38:34','1969-01-01 00:00:00','rukmini.keerthi02@gmail.com','2013-12-11 18:38:34',NULL,NULL),
(266,177,'Monday','2013-12-13 19:41:09','two@two.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$one@one.com$My Files$','one@one.com','one@one.com',1,0,'2013-12-13 19:41:09','2013-12-24 19:41:09','one@one.com','2013-12-13 19:41:09','one@one.com','2013-12-13 19:41:09'),
(267,160,'venu.rtf','2013-12-13 19:41:37','three@three.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$venuuverudix@gmail.com$My Files$','venuuverudix@gmail.com','one@one.com',0,1,'2013-12-13 19:41:37','2013-12-24 19:41:37','one@one.com','2013-12-13 19:41:37','one@one.com','2013-12-13 19:41:37'),
(268,176,'UNI_B_Process_Definition_Proxy.docx','2013-12-13 20:07:00','helluvanag@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$one@one.com$My Files$','one@one.com','one@one.com',0,1,'2013-12-13 20:07:00','2013-12-24 20:07:00','one@one.com','2013-12-13 20:07:00','one@one.com','2013-12-13 20:07:00'),
(269,177,'Monday','2013-12-13 20:07:57','helluvanag@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$one@one.com$My Files$','one@one.com','one@one.com',1,0,'2013-12-13 20:07:57','2013-12-24 20:07:57','one@one.com','2013-12-13 20:07:57','one@one.com','2013-12-13 20:07:57'),
(270,183,'citibankbill.docx','2013-12-16 18:57:00','sandhya@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$sandhya@gmail.com$My Files$','sandhya@gmail.com','sandhya@gmail.com',0,1,'2013-12-16 18:57:00','1969-01-01 00:00:00','sandhya@gmail.com','2013-12-16 18:57:00',NULL,NULL),
(271,184,'Task_Management.xlsx','2013-12-16 19:46:59','vgpoloju@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vgpoloju@gmail.com$My Files$','vgpoloju@gmail.com','vgpoloju@gmail.com',0,1,'2013-12-16 19:46:59','1969-01-01 00:00:00','vgpoloju@gmail.com','2013-12-16 19:46:59',NULL,NULL),
(272,185,'dsfdsf','2013-12-16 19:54:19','vgpoloju@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vgpoloju@gmail.com$My Files$','vgpoloju@gmail.com','vgpoloju@gmail.com',1,0,'2013-12-16 19:54:19','1969-01-01 00:00:00','vgpoloju@gmail.com','2013-12-16 19:54:19',NULL,NULL),
(273,186,'ddsfdsf','2013-12-16 19:54:38','vgpoloju@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vgpoloju@gmail.com$My Files$','vgpoloju@gmail.com','vgpoloju@gmail.com',1,0,'2013-12-16 19:54:38','1969-01-01 00:00:00','vgpoloju@gmail.com','2013-12-16 19:54:38',NULL,NULL),
(274,187,'fvdfg','2013-12-16 20:46:49','vgpoloju@gmail.com','D:$LockitProject$.metadata$.plugins$org.eclipse.wst.server.core$tmp0$wtpwebapps$Lockit_Refactored$Userfiles$vgpoloju@gmail.com$My Files$','vgpoloju@gmail.com','vgpoloju@gmail.com',1,0,'2013-12-16 20:46:49','1969-01-01 00:00:00','vgpoloju@gmail.com','2013-12-16 20:46:49',NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `forgotpasswordkeys` */

DROP TABLE IF EXISTS `forgotpasswordkeys`;

CREATE TABLE `forgotpasswordkeys` (
  `UserID` varchar(128) DEFAULT NULL,
  `Pkey` varchar(128) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `forgotpasswordkeys` */

LOCK TABLES `forgotpasswordkeys` WRITE;

insert into `forgotpasswordkeys` values 
('helluvanag@gmail.com','1385715678497','2013-12-02 14:31:23'),
('bbb@bmail.com','1385716343867','2013-12-02 14:42:29'),
('helluvanag@gmail.com','1385716982552','2013-12-02 14:53:06'),
('bbb@bmail.com','1385716999516','2013-12-02 14:53:23'),
('eee@email.com','1385717022223','2013-12-02 14:53:46'),
('helluvanag@gmail.com','1385730881688','2013-11-02 18:44:50'),
('helluvanag@gmail.com','1386047591808','2013-12-06 10:43:16'),
('keerthi.rukmini02@gmail.com','1386600513279','2013-12-12 20:18:38'),
('three@three.com','1386600833239','2013-12-12 20:23:57'),
('four@four.com','1386600991286','2013-12-12 20:26:35'),
('venu@verudix.com','1386603161321','2013-12-12 21:02:46'),
('priya@gmail.com','1386654158674','2013-12-13 11:12:43'),
('mailkeert@gmail.com','1386654255982','2013-12-13 11:14:20'),
('nag@satyam.com','1386654317289','2013-12-13 11:15:21'),
('venuuverudix@gmail.com','1386656115031','2013-12-13 11:45:19'),
('alekya@gmail.com','1386657069151','2013-12-13 12:01:13'),
('abc@abc.com','1386658840805','2013-12-13 12:30:45'),
('xy@xy.com','1386659473507','2013-12-13 12:41:18'),
('nag@yahoo.com','1386659487975','2013-12-13 12:41:32'),
('helluvanag@gmail.com','1386659577722','2013-12-13 12:43:03'),
('kk@gmail.com','1386669565727','2013-12-13 15:29:31'),
('bhanu@gmail.com','1387190511130','2013-12-19 16:11:56'),
('sandhya@gmail.com','1387194246724','2013-12-19 17:14:11'),
('vgpoloju@gmail.com','1387194690733','2013-12-19 17:21:35'),
('one@one.com','1387197813217','2013-12-19 18:13:38'),
('pvc@gmail.com','1387198329224','2013-12-19 18:22:14'),
('raj@raj.com','1387199854790','2013-12-19 18:47:39'),
('one@one.com','1387200373861','2013-12-19 18:56:18'),
('vgpoloju@gmail.com','1387207510325','2013-12-19 20:55:15'),
('helluvanag@gmail.com','1387255994661','2013-12-20 10:23:19'),
('nag@nag.com','1387256032809','2013-12-20 10:23:58');

UNLOCK TABLES;

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `UserID` varchar(128) NOT NULL,
  `GroupID` int(4) NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(128) DEFAULT NULL,
  `CreatedBy` varchar(128) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(128) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `GroupType` varchar(16) DEFAULT 'User',
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Data for the table `groups` */

LOCK TABLES `groups` WRITE;

insert into `groups` values 
('aaa@amail.com',1,'Rao','aaa@amail.com','2013-11-26 13:32:13',NULL,NULL,'User'),
('aaa@amail.com',2,'Test','aaa@amail.com','2013-11-26 15:07:41',NULL,NULL,'User'),
('aaa@amail.com',3,'Keerthi','aaa@amail.com','2013-11-26 15:08:20',NULL,NULL,'User'),
('aaa@amail.com',4,'Verudix','aaa@amail.com','2013-11-26 15:09:25',NULL,NULL,'User'),
('bbb@bmail.com',5,'Venu','bbb@bmail.com','2013-11-26 16:07:10',NULL,NULL,'User'),
('aaa@amail.com',6,'Nag','aaa@amail.com','2013-11-26 16:28:32',NULL,NULL,'User'),
('aaa@amail.com',7,'Sandhya','aaa@amail.com','2013-11-26 16:29:06',NULL,NULL,'User'),
('aaa@amail.com',8,'List','aaa@amail.com','2013-11-26 16:41:22',NULL,NULL,'User'),
('aaa@amail.com',9,'Ram','aaa@amail.com','2013-11-26 17:06:22',NULL,NULL,'User'),
('ccc@cmail.com',10,'CCC','ccc@cmail.com','2013-11-26 17:09:59',NULL,NULL,'User'),
('bbb@bmail.com',11,'Verudix','bbb@bmail.com','2013-11-26 18:12:33',NULL,NULL,'User'),
('keerthiv@gmail.com',12,'Gmail','keerthiv@gmail.com','2013-11-29 10:53:43',NULL,NULL,'User'),
('aaa@amail.com',13,'Rajnikar','aaa@amail.com','2013-12-04 18:40:38',NULL,NULL,'User'),
('vishnu@verudix.com',14,'Srini','vishnu@verudix.com','2013-12-04 19:19:41',NULL,NULL,'User'),
('nag@nag.com',15,'Nag','nag@nag.com','2013-12-05 10:40:36',NULL,NULL,'User'),
('nag@nag.com',16,'Yahoo','nag@nag.com','2013-12-05 12:17:44',NULL,NULL,'User'),
('nag@nag.com',17,'rediff','nag@nag.com','2013-12-05 13:03:23',NULL,NULL,'User'),
('nag@nag.com',18,'Andhravilas','nag@nag.com','2013-12-05 13:05:02',NULL,NULL,'User'),
('aaa@amail.com',19,'NewGroup','aaa@amail.com','2013-12-05 14:44:15',NULL,NULL,'User'),
('sreedhar@verudix.com',20,'Nag','sreedhar@verudix.com','2013-12-05 16:56:30',NULL,NULL,'User'),
('venuuverudix@gmail.com',23,'venu','venuuverudix@gmail.com','2013-12-10 12:13:24',NULL,NULL,'User'),
('mailkeert@gmail.com',24,'one','mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,'User'),
('mailkeert@gmail.com',25,'two','mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,'User'),
('two@two.com',27,'Group1','two@two.com','2013-12-11 16:25:32',NULL,NULL,'User');

UNLOCK TABLES;

/*Table structure for table `newmembers` */

DROP TABLE IF EXISTS `newmembers`;

CREATE TABLE `newmembers` (
  `Firstname` varchar(150) DEFAULT NULL,
  `Lastname` varchar(150) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Mobile` varchar(150) DEFAULT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `newmembers` */

LOCK TABLES `newmembers` WRITE;

UNLOCK TABLES;

/*Table structure for table `registration` */

DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `PhotoUrl` varchar(1024) DEFAULT '~/Images/User.png' COMMENT 'profile phto',
  `UserID` varchar(128) NOT NULL,
  `FristName` varchar(64) DEFAULT NULL,
  `LastName` varchar(64) DEFAULT NULL,
  `Password` varchar(64) DEFAULT NULL,
  `Organization` varchar(512) DEFAULT NULL,
  `Email` varchar(128) DEFAULT NULL,
  `DisplayName` varchar(64) DEFAULT NULL,
  `Location` varchar(512) DEFAULT NULL,
  `IsGoogleAuth` tinyint(1) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `Mobile` varchar(16) DEFAULT NULL,
  `OfficePhone` varchar(16) DEFAULT NULL,
  `CreatedBy` varchar(128) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(128) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `registration` */

LOCK TABLES `registration` WRITE;

insert into `registration` values 
('~/Images/User.png','a1@gmail.com',NULL,NULL,',≥¬Ã‘Ïiõ¡ØïlŸqü…',NULL,NULL,'gg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('images/User.png','aaa@amail.com','aaa','aaa','é(úmˇƒÒÆ¿mîKï∑z','','helluvanag1@gmail.com','aaa','abb@mail.com',NULL,NULL,'','',NULL,NULL,'aaa@amail.com','2013-12-04 07:50:38'),
('~/Images/User.png','abc@abc.com',NULL,NULL,'ô†-Öˇ\ZŒIπ/O‹-;™',NULL,NULL,'keerthi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('~/Images/User.png','Aditya@verudix.com',NULL,NULL,'ò“g ˘4Øçpbò7ˇ',NULL,NULL,'Aditya',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('~/Images/User.png','alekya@gmail.com',NULL,NULL,'ò“g ˘4Øçpbò7ˇ',NULL,NULL,'Alekya',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('D:/verudix_ws/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/Lockit_Refactored/Images/img_1385988682497Penguins.jpg','bbb@bmail.com','bbb','bbb','….Ã“-ô@~wØ.bÈ7','','','bbb','',NULL,NULL,'','',NULL,NULL,'bbb@bmail.com','2013-12-02 06:21:23'),
('~/Images/User.png','ccc@cmail.com',NULL,NULL,'8ÿﬁf,ˆãé˝íDcHB',NULL,NULL,'ccc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('~/Images/User.png','ddd@dmail.com',NULL,NULL,'x‰Û≥$∆¸ÍÊçùª˛FÔ',NULL,NULL,'ddd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('D:/verudix_ws/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/Lockit_Refactored/Images/img_1385968147935Chrysanthemum.jpg','eee@email.com','eee','eee','c≤¢£÷¿Ï	íW˚É$¨ﬁF','','','eee','',NULL,NULL,'','',NULL,NULL,'eee@email.com','2013-12-02 12:39:07'),
('~/Images/User.png','four@four.com',NULL,NULL,'ò“g ˘4Øçpbò7ˇ',NULL,NULL,'Four',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('~/Images/User.png','helluvanag@gmail.com',NULL,NULL,'‰⁄v¥≈ÑR¥y€C‡{\\N',NULL,NULL,'Nag',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('images/User.png','hhh@hmail.com','','','#œ˜ÃB~˙Ÿ¶»9ãøø','','','hhh','',NULL,NULL,'','',NULL,NULL,'hhh@hmail.com','2013-11-28 03:20:43'),
('~/Images/User.png','keerthi.rukmini02@gmail.com',NULL,NULL,'ò“g ˘4Øçpbò7ˇ',NULL,NULL,'KeerthiRukmini',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('~/Images/User.png','keerthi@verudix.com',NULL,NULL,'ô†-Öˇ\ZŒIπ/O‹-;™',NULL,NULL,'keerthi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('D:/verudix_ws/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/Lockit_Refactored/Images/img_1385702951513Tulips.jpg','keerthiv@gmail.com','Keerthi','v','˜\rE0\n’Ä7h…¥ùU_Q!','','','keerthi','',NULL,NULL,'','',NULL,NULL,'keerthiv@gmail.com','2013-11-29 10:59:11'),
('~/Images/User.png','Khajavali@veurdix.com',NULL,NULL,'ò“g ˘4Øçpbò7ˇ',NULL,NULL,'Khaja',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('~/Images/User.png','kk@gmail.com',NULL,NULL,'ò“g ˘4Øçpbò7ˇ',NULL,NULL,'kk',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('~/Images/User.png','kv@gmail.com',NULL,NULL,'ò“g ˘4Øçpbò7ˇ',NULL,NULL,'keerthi ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('images/img_1386659915149Tulips_resize.jpg','mailkeert@gmail.com','Keert','Keert','ò“g ˘4Øçpbò7ˇ','nage','mailkeert@gmail.com','Keert','loca',NULL,NULL,'','',NULL,NULL,'mailkeert@gmail.com','2013-12-10 12:48:56'),
('D:/LockitProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Lockit_Refactored/Images/img_1386571843976Chrysanthemum.jpg','nag@nag.com','nag','nag','jw~\ZØ*LÛˇ#∫`37`\0','','nag@nag.com','nag','',NULL,NULL,'','',NULL,NULL,'nag@nag.com','2013-12-09 12:20:44'),
('~/Images/User.png','nag@satyam.com',NULL,NULL,'*ﬁÅG!ÎKxÂı§<+e4Å',NULL,NULL,'Nag',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('~/Images/User.png','nag@yahoo.com',NULL,NULL,'ò“g ˘4Øçpbò7ˇ',NULL,NULL,'nag',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('images/User.png','one@one.com','nag','nag','ò“g ˘4Øçpbò7ˇ','','','One','',NULL,NULL,'','',NULL,NULL,'one@one.com','2013-12-16 11:24:36'),
('~/Images/User.png','priya@gmail.com',NULL,NULL,'ò“g ˘4Øçpbò7ˇ',NULL,NULL,'Priya',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('images/User.png','pvc@gmail.com','Sandhya','sre','ò“g ˘4Øçpbò7ˇ','','','Venu','',NULL,NULL,'','',NULL,NULL,'pvc@gmail.com','2013-12-16 06:27:03'),
('images/img_1387200018623Chrysanthemum.jpg','raj@raj.com','Raj','Raj','ò“g ˘4Øçpbò7ˇ','verudix.','raj@raj.com','Raj','Hyd',NULL,NULL,'22222222222','111111111111',NULL,NULL,'raj@raj.com','2013-12-16 06:52:26'),
('~/Images/User.png','rukmini.keerthi02@gmail.com','keerthi','v','t”Õ;≤@R\'–aJ¯',NULL,'rukmini.keerthi02@gmail.com','keerthi v',NULL,1,NULL,NULL,NULL,NULL,'2013-12-11 18:02:27',NULL,NULL),
('images/User.png','sandhya@gmail.com','Sandhya','Rani','ò“g ˘4Øçpbò7ˇ','verudix.','one@one.com','Sandy','hyd',NULL,NULL,'111111111111','111111111111',NULL,NULL,'sandhya@gmail.com','2013-12-16 06:43:22'),
('~/Images/User.png','seshu@gmail.com',NULL,NULL,'ò“g ˘4Øçpbò7ˇ',NULL,NULL,'Seshu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('D:/LockitProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Lockit_Refactored/Images/img_1386244621523Tulips_resize.bmp','sreedhar@verudix.com','a','b','ò“g ˘4Øçpbò7ˇ','','hh@gmail.com','sreedhar123','',NULL,NULL,'','',NULL,NULL,'sreedhar@verudix.com','2013-12-05 05:27:02'),
('~/Images/User.png','three@three.com',NULL,NULL,'ò“g ˘4Øçpbò7ˇ',NULL,NULL,'Three',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('~/Images/User.png','two@two.com',NULL,NULL,'ò“g ˘4Øçpbò7ˇ',NULL,NULL,'Number Two',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('~/Images/User.png','venu@verudix.com',NULL,NULL,'ò“g ˘4Øçpbò7ˇ',NULL,NULL,'Venu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('~/Images/User.png','venugopal@gmail.com',NULL,NULL,'ò“g ˘4Øçpbò7ˇ',NULL,NULL,'VenuGopal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('D:/LockitProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Lockit_Refactored/Images/img_1386658389882Chrysanthemum.jpg','venuuverudix@gmail.com','venugopal','venugopal','¸cÈµæ\"Bíñ€‚Ö≠.K','','venu@gmail.com','pvc','',NULL,NULL,'','',NULL,NULL,'venuuverudix@gmail.com','2013-12-10 12:23:10'),
('images/User.png','vgpoloju@gmail.com','ff','dfdf','¸cÈµæ\"Bíñ€‚Ö≠.K','','','venu','',NULL,NULL,'','',NULL,NULL,'vgpoloju@gmail.com','2013-12-16 08:46:35'),
('~/Images/User.png','vishnu@verudix.com',NULL,NULL,'ò“g ˘4Øçpbò7ˇ',NULL,NULL,'Vishnu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('~/Images/User.png','xy@xy.com',NULL,NULL,'ô†-Öˇ\ZŒIπ/O‹-;™',NULL,NULL,'xy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `user_contacts` */

DROP TABLE IF EXISTS `user_contacts`;

CREATE TABLE `user_contacts` (
  `ContactID` int(11) NOT NULL AUTO_INCREMENT,
  `EmailID` varchar(128) DEFAULT NULL,
  `FirstName` varchar(128) DEFAULT NULL,
  `LastName` varchar(128) DEFAULT NULL,
  `UserID` varchar(128) DEFAULT NULL,
  `CreatedBy` varchar(128) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ContactType` varchar(128) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`ContactID`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

/*Data for the table `user_contacts` */

LOCK TABLES `user_contacts` WRITE;

insert into `user_contacts` values 
(1,'one@one.com','one','one','aaa@amail.com','aaa@amail.com','2013-11-26 01:32:00','user'),
(6,'kiran@gmail.com','kiran','kiran','aaa@amail.com','aaa@amail.com','2013-11-26 01:36:39','user'),
(13,'one@one.com','aaa','one','bbb@bmail.com','bbb@bmail.com','2013-11-26 04:07:32','user'),
(14,'nag@nag.com','nag','nag','bbb@bmail.com','bbb@bmail.com','2013-11-26 04:08:32','user'),
(15,'two@two.com','two','two','bbb@bmail.com','bbb@bmail.com','2013-11-26 04:12:43','user'),
(17,'kiran789@gmail.com','kkk','kk','aaa@amail.com','aaa@amail.com','2013-11-26 04:49:42','user'),
(18,'ramesh@gmail.com','ramesh','ramesh','ccc@cmail.com','ccc@cmail.com','2013-11-26 05:12:25','user'),
(19,'three@three.com','three','three','bbb@bmail.com','bbb@bmail.com','2013-11-26 06:16:41','user'),
(20,'k1@gmail.com','keerthi','v','keerthiv@gmail.com','keerthiv@gmail.com','2013-11-29 10:55:46','user'),
(21,'k2@gmail.com','r','v','keerthiv@gmail.com','keerthiv@gmail.com','2013-11-29 10:57:58','user'),
(24,'zzz@zmail.com','zzz','zzz','vishnu@verudix.com','vishnu@verudix.com','2013-12-04 07:24:59','user'),
(34,'one@one.com','one','one','sreedhar@verudix.com','sreedhar@verudix.com','2013-12-05 06:00:59','user'),
(36,'raj@raj.com','raj','raj','sreedhar@verudix.com','sreedhar@verudix.com','2013-12-05 06:53:24','user'),
(47,'ram@gmail.com','ramesh','ram','nag@nag.com','nag@nag.com','2013-12-05 09:11:39','user'),
(49,'three@three.com','three','three','nag@nag.com','nag@nag.com','2013-12-05 09:19:54','user'),
(50,'bhanu@gmail.com','bhanu','saladi','nag@nag.com','nag@nag.com','2013-12-05 09:23:01','user'),
(51,'s@s.com','sandhya','sandhya','nag@nag.com','nag@nag.com','2013-12-06 07:02:50','user'),
(53,'five@gmail.com','five','five','nag@nag.com','nag@nag.com','2013-12-06 07:04:04','user'),
(54,'nag@gmail.com','rao','sal','nag@nag.com','nag@nag.com','2013-12-06 07:20:58','user'),
(61,'venugopal@gmail.com','p','v','venuuverudix@gmail.com','venuuverudix@gmail.com','2013-12-10 12:13:03','user'),
(63,'zzz@zmaiil.com','zzz','zzz','mailkeert@gmail.com','mailkeert@gmail.com','2013-12-10 12:47:35','user'),
(64,'yyy@ymail.com','yyy','yyy','mailkeert@gmail.com','mailkeert@gmail.com','2013-12-10 12:47:45','user');

UNLOCK TABLES;

/*Table structure for table `user_groups` */

DROP TABLE IF EXISTS `user_groups`;

CREATE TABLE `user_groups` (
  `UserID` varchar(128) NOT NULL,
  `GroupID` int(4) NOT NULL AUTO_INCREMENT,
  `CreatedBy` varchar(128) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(128) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `IsActive` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`,`GroupID`),
  KEY `FK_user_groups` (`GroupID`),
  KEY `FK_user_registration` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `user_groups` */

LOCK TABLES `user_groups` WRITE;

insert into `user_groups` values 
('a1@gmail.com',13,'aaa@amail.com','2013-12-04 18:40:38',NULL,NULL,1),
('a1@gmail.com',14,'vishnu@verudix.com','2013-12-04 19:19:41',NULL,NULL,1),
('a1@gmail.com',15,'nag@nag.com','2013-12-05 10:40:36',NULL,NULL,1),
('a1@gmail.com',16,'nag@nag.com','2013-12-05 12:17:44',NULL,NULL,1),
('a1@gmail.com',17,'nag@nag.com','2013-12-05 13:03:23',NULL,NULL,1),
('a1@gmail.com',18,'nag@nag.com','2013-12-05 13:05:02',NULL,NULL,0),
('a1@gmail.com',19,'aaa@amail.com','2013-12-05 14:44:15',NULL,NULL,1),
('a1@gmail.com',20,'sreedhar@verudix.com','2013-12-05 16:56:30',NULL,NULL,1),
('a1@gmail.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('a1@gmail.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('a1@gmail.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:24',NULL,NULL,1),
('a1@gmail.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('a1@gmail.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,0),
('a1@gmail.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,1),
('a1@gmail.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('a1@gmail.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,1),
('a1@gmail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('aaa@amail.com',1,'aaa@amail.com','2013-11-26 15:44:15',NULL,NULL,0),
('aaa@amail.com',2,'aaa@amail.com','2013-11-26 15:07:50',NULL,NULL,1),
('aaa@amail.com',3,'aaa@amail.com','2013-11-26 15:44:22',NULL,NULL,0),
('aaa@amail.com',4,'aaa@amail.com','2013-11-26 15:43:25',NULL,NULL,0),
('aaa@amail.com',5,'bbb@bmail.com','2013-11-26 16:07:10',NULL,NULL,1),
('aaa@amail.com',6,'aaa@amail.com','2013-11-26 16:28:40',NULL,NULL,1),
('aaa@amail.com',7,'aaa@amail.com','2013-11-26 16:29:06',NULL,NULL,1),
('aaa@amail.com',8,'aaa@amail.com','2013-11-26 16:41:22',NULL,NULL,1),
('aaa@amail.com',10,'ccc@cmail.com','2013-11-26 17:09:59',NULL,NULL,1),
('aaa@amail.com',11,'bbb@bmail.com','2013-11-26 18:12:33',NULL,NULL,1),
('aaa@amail.com',12,'keerthiv@gmail.com','2013-11-29 10:53:43',NULL,NULL,1),
('aaa@amail.com',15,'nag@nag.com','2013-12-05 10:40:36',NULL,NULL,1),
('aaa@amail.com',16,'nag@nag.com','2013-12-05 12:17:44',NULL,NULL,1),
('aaa@amail.com',17,'nag@nag.com','2013-12-05 13:03:23',NULL,NULL,1),
('aaa@amail.com',18,'nag@nag.com','2013-12-05 13:05:02',NULL,NULL,0),
('aaa@amail.com',20,'sreedhar@verudix.com','2013-12-05 16:56:30',NULL,NULL,1),
('aaa@amail.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('aaa@amail.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('aaa@amail.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:24',NULL,NULL,1),
('aaa@amail.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('aaa@amail.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,0),
('aaa@amail.com',26,'one@one.com','2013-12-11 11:56:24',NULL,NULL,0),
('aaa@amail.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('aaa@amail.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('aaa@amail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('abc@abc.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('abc@abc.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('abc@abc.com',26,'one@one.com','2013-12-11 11:56:24',NULL,NULL,0),
('abc@abc.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('abc@abc.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('abc@abc.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('Aditya@verudix.com',13,'aaa@amail.com','2013-12-05 14:32:36',NULL,NULL,1),
('Aditya@verudix.com',15,'nag@nag.com','2013-12-05 10:40:36',NULL,NULL,1),
('Aditya@verudix.com',17,'nag@nag.com','2013-12-05 13:03:23',NULL,NULL,1),
('Aditya@verudix.com',18,'nag@nag.com','2013-12-05 13:05:02',NULL,NULL,0),
('Aditya@verudix.com',20,'sreedhar@verudix.com','2013-12-05 16:56:30',NULL,NULL,1),
('Aditya@verudix.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('Aditya@verudix.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('Aditya@verudix.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:24',NULL,NULL,1),
('Aditya@verudix.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('Aditya@verudix.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('Aditya@verudix.com',26,'one@one.com','2013-12-12 18:14:36',NULL,NULL,0),
('Aditya@verudix.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('Aditya@verudix.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('Aditya@verudix.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('alekya@gmail.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:36',NULL,NULL,0),
('alekya@gmail.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('alekya@gmail.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('alekya@gmail.com',26,'one@one.com','2013-12-12 18:14:36',NULL,NULL,0),
('alekya@gmail.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('alekya@gmail.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('alekya@gmail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('bbb@bmail.com',1,'aaa@amail.com','2013-11-26 15:44:15',NULL,NULL,1),
('bbb@bmail.com',2,'aaa@amail.com','2013-11-26 16:03:15',NULL,NULL,1),
('bbb@bmail.com',3,'aaa@amail.com','2013-11-26 15:44:22',NULL,NULL,1),
('bbb@bmail.com',4,'aaa@amail.com','2013-11-26 15:43:25',NULL,NULL,0),
('bbb@bmail.com',5,'bbb@bmail.com','2013-11-26 16:07:14',NULL,NULL,0),
('bbb@bmail.com',6,'aaa@amail.com','2013-11-26 16:28:32',NULL,NULL,0),
('bbb@bmail.com',7,'aaa@amail.com','2013-11-26 16:29:06',NULL,NULL,1),
('bbb@bmail.com',8,'aaa@amail.com','2013-11-26 16:41:22',NULL,NULL,1),
('bbb@bmail.com',9,'aaa@amail.com','2013-11-26 17:06:22',NULL,NULL,1),
('bbb@bmail.com',10,'ccc@cmail.com','2013-11-26 17:10:42',NULL,NULL,0),
('bbb@bmail.com',13,'aaa@amail.com','2013-12-05 14:32:36',NULL,NULL,1),
('bbb@bmail.com',15,'nag@nag.com','2013-12-05 10:40:36',NULL,NULL,1),
('bbb@bmail.com',17,'nag@nag.com','2013-12-05 13:03:23',NULL,NULL,1),
('bbb@bmail.com',18,'nag@nag.com','2013-12-05 13:05:02',NULL,NULL,1),
('bbb@bmail.com',20,'sreedhar@verudix.com','2013-12-05 16:56:30',NULL,NULL,1),
('bbb@bmail.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('bbb@bmail.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('bbb@bmail.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:36',NULL,NULL,0),
('bbb@bmail.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('bbb@bmail.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('bbb@bmail.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('bbb@bmail.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('bbb@bmail.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('bbb@bmail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('bhanu@gmail.com',18,'nag@nag.com','2013-12-05 21:23:01',NULL,NULL,1),
('ccc@cmail.com',1,'aaa@amail.com','2013-11-26 15:44:15',NULL,NULL,0),
('ccc@cmail.com',3,'aaa@amail.com','2013-11-26 15:44:22',NULL,NULL,1),
('ccc@cmail.com',4,'aaa@amail.com','2013-11-26 15:43:25',NULL,NULL,0),
('ccc@cmail.com',5,'bbb@bmail.com','2013-11-26 16:07:10',NULL,NULL,0),
('ccc@cmail.com',6,'aaa@amail.com','2013-11-26 16:28:32',NULL,NULL,1),
('ccc@cmail.com',7,'aaa@amail.com','2013-11-26 16:29:06',NULL,NULL,1),
('ccc@cmail.com',8,'aaa@amail.com','2013-11-26 16:41:22',NULL,NULL,1),
('ccc@cmail.com',9,'aaa@amail.com','2013-11-26 17:06:22',NULL,NULL,0),
('ccc@cmail.com',10,'ccc@cmail.com','2013-11-26 17:10:42',NULL,NULL,0),
('ccc@cmail.com',11,'bbb@bmail.com','2013-11-26 18:12:33',NULL,NULL,1),
('ccc@cmail.com',13,'aaa@amail.com','2013-12-05 14:32:36',NULL,NULL,0),
('ccc@cmail.com',15,'nag@nag.com','2013-12-05 10:40:36',NULL,NULL,1),
('ccc@cmail.com',17,'nag@nag.com','2013-12-05 13:03:23',NULL,NULL,1),
('ccc@cmail.com',18,'nag@nag.com','2013-12-05 13:05:02',NULL,NULL,1),
('ccc@cmail.com',20,'sreedhar@verudix.com','2013-12-05 16:56:30',NULL,NULL,1),
('ccc@cmail.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('ccc@cmail.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('ccc@cmail.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:36',NULL,NULL,1),
('ccc@cmail.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('ccc@cmail.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('ccc@cmail.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('ccc@cmail.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('ccc@cmail.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('ccc@cmail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('ddd@dmail.com',1,'aaa@amail.com','2013-11-26 15:44:15',NULL,NULL,0),
('ddd@dmail.com',3,'aaa@amail.com','2013-11-26 15:44:22',NULL,NULL,0),
('ddd@dmail.com',4,'aaa@amail.com','2013-11-26 15:43:25',NULL,NULL,1),
('ddd@dmail.com',5,'bbb@bmail.com','2013-11-26 16:07:14',NULL,NULL,0),
('ddd@dmail.com',6,'aaa@amail.com','2013-11-26 16:28:40',NULL,NULL,1),
('ddd@dmail.com',7,'aaa@amail.com','2013-11-26 16:29:06',NULL,NULL,1),
('ddd@dmail.com',8,'aaa@amail.com','2013-11-26 16:41:22',NULL,NULL,1),
('ddd@dmail.com',9,'aaa@amail.com','2013-11-26 17:06:22',NULL,NULL,0),
('ddd@dmail.com',10,'ccc@cmail.com','2013-11-26 17:10:42',NULL,NULL,0),
('ddd@dmail.com',13,'aaa@amail.com','2013-12-05 14:32:36',NULL,NULL,0),
('ddd@dmail.com',15,'nag@nag.com','2013-12-05 10:40:36',NULL,NULL,1),
('ddd@dmail.com',17,'nag@nag.com','2013-12-05 13:03:23',NULL,NULL,1),
('ddd@dmail.com',18,'nag@nag.com','2013-12-05 13:05:02',NULL,NULL,1),
('ddd@dmail.com',20,'sreedhar@verudix.com','2013-12-05 16:56:30',NULL,NULL,1),
('ddd@dmail.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('ddd@dmail.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('ddd@dmail.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:36',NULL,NULL,1),
('ddd@dmail.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('ddd@dmail.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('ddd@dmail.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('ddd@dmail.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('ddd@dmail.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('ddd@dmail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('dsfdsa@gmail.com',15,'nag@nag.com','2013-12-05 21:01:59',NULL,NULL,1),
('dsfdsa@gmail.com',16,'nag@nag.com','2013-12-05 21:02:58',NULL,NULL,1),
('dsfdsa@gmail.com',20,'sreedhar@verudix.com','2013-12-05 17:55:27',NULL,NULL,1),
('eee@email.com',13,'aaa@amail.com','2013-12-05 14:32:36',NULL,NULL,0),
('eee@email.com',15,'nag@nag.com','2013-12-05 10:40:36',NULL,NULL,1),
('eee@email.com',17,'nag@nag.com','2013-12-05 13:03:23',NULL,NULL,1),
('eee@email.com',18,'nag@nag.com','2013-12-05 13:05:02',NULL,NULL,1),
('eee@email.com',20,'sreedhar@verudix.com','2013-12-05 16:56:30',NULL,NULL,0),
('eee@email.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('eee@email.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('eee@email.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:36',NULL,NULL,1),
('eee@email.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('eee@email.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('eee@email.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('eee@email.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('eee@email.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('eee@email.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('five@gmail.com',15,'nag@nag.com','2013-12-06 19:03:28',NULL,NULL,1),
('four@four.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('four@four.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('four@four.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:36',NULL,NULL,1),
('four@four.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('four@four.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('four@four.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('four@four.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('four@four.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('four@four.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('helluvanag@gmail.com',13,'aaa@amail.com','2013-12-05 14:32:36',NULL,NULL,0),
('helluvanag@gmail.com',15,'nag@nag.com','2013-12-05 10:40:36',NULL,NULL,1),
('helluvanag@gmail.com',17,'nag@nag.com','2013-12-05 13:03:23',NULL,NULL,1),
('helluvanag@gmail.com',18,'nag@nag.com','2013-12-05 13:05:02',NULL,NULL,1),
('helluvanag@gmail.com',20,'sreedhar@verudix.com','2013-12-05 16:56:30',NULL,NULL,0),
('helluvanag@gmail.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('helluvanag@gmail.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('helluvanag@gmail.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:36',NULL,NULL,0),
('helluvanag@gmail.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('helluvanag@gmail.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('helluvanag@gmail.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('helluvanag@gmail.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('helluvanag@gmail.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('helluvanag@gmail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('hhh@hmail.com',13,'aaa@amail.com','2013-12-05 14:32:36',NULL,NULL,0),
('hhh@hmail.com',15,'nag@nag.com','2013-12-05 10:40:36',NULL,NULL,1),
('hhh@hmail.com',17,'nag@nag.com','2013-12-05 13:03:23',NULL,NULL,1),
('hhh@hmail.com',18,'nag@nag.com','2013-12-05 13:05:02',NULL,NULL,1),
('hhh@hmail.com',20,'sreedhar@verudix.com','2013-12-05 16:56:30',NULL,NULL,0),
('hhh@hmail.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('hhh@hmail.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('hhh@hmail.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:37',NULL,NULL,0),
('hhh@hmail.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('hhh@hmail.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('hhh@hmail.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('hhh@hmail.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('hhh@hmail.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('hhh@hmail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('k1@gmail.com',12,'keerthiv@gmail.com','2013-11-29 10:55:46',NULL,NULL,1),
('k1@gmail.com',13,'keerthiv@gmail.com','2013-11-29 10:58:13',NULL,NULL,1),
('k2@gmail.com',12,'keerthiv@gmail.com','2013-11-29 10:57:59',NULL,NULL,1),
('k2@gmail.com',13,'keerthiv@gmail.com','2013-11-29 10:58:13',NULL,NULL,1),
('k@gmail.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('k@gmail.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('keerthi.rukmini02@gmail.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('keerthi.rukmini02@gmail.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('keerthi.rukmini02@gmail.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:37',NULL,NULL,0),
('keerthi.rukmini02@gmail.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('keerthi.rukmini02@gmail.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('keerthi.rukmini02@gmail.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('keerthi.rukmini02@gmail.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('keerthi.rukmini02@gmail.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('keerthi.rukmini02@gmail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('keerthi@verudix.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('keerthi@verudix.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('keerthi@verudix.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:37',NULL,NULL,0),
('keerthi@verudix.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('keerthi@verudix.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('keerthi@verudix.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('keerthi@verudix.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('keerthi@verudix.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('keerthi@verudix.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('keerthiv@gmail.com',13,'aaa@amail.com','2013-12-05 14:32:36',NULL,NULL,0),
('keerthiv@gmail.com',15,'nag@nag.com','2013-12-05 10:40:36',NULL,NULL,1),
('keerthiv@gmail.com',17,'nag@nag.com','2013-12-05 13:03:23',NULL,NULL,1),
('keerthiv@gmail.com',18,'nag@nag.com','2013-12-05 13:05:02',NULL,NULL,1),
('keerthiv@gmail.com',20,'sreedhar@verudix.com','2013-12-05 16:56:30',NULL,NULL,1),
('keerthiv@gmail.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('keerthiv@gmail.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('keerthiv@gmail.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:37',NULL,NULL,0),
('keerthiv@gmail.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('keerthiv@gmail.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('keerthiv@gmail.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('keerthiv@gmail.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('keerthiv@gmail.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('keerthiv@gmail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('keethi@gmail.com',16,'nag@nag.com','2013-12-05 21:02:11',NULL,NULL,1),
('keethi@gmail.com',17,'nag@nag.com','2013-12-05 18:43:59',NULL,NULL,1),
('keethi@gmail.com',20,'sreedhar@verudix.com','2013-12-05 17:54:09',NULL,NULL,1),
('Khajavali@veurdix.com',13,'aaa@amail.com','2013-12-05 14:32:36',NULL,NULL,0),
('Khajavali@veurdix.com',14,'vishnu@verudix.com','2013-12-04 19:19:52',NULL,NULL,1),
('Khajavali@veurdix.com',15,'nag@nag.com','2013-12-05 10:40:54',NULL,NULL,1),
('Khajavali@veurdix.com',17,'nag@nag.com','2013-12-05 13:03:23',NULL,NULL,1),
('Khajavali@veurdix.com',18,'nag@nag.com','2013-12-05 13:05:02',NULL,NULL,0),
('Khajavali@veurdix.com',20,'sreedhar@verudix.com','2013-12-05 16:56:30',NULL,NULL,1),
('Khajavali@veurdix.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('Khajavali@veurdix.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('Khajavali@veurdix.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:37',NULL,NULL,0),
('Khajavali@veurdix.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('Khajavali@veurdix.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('Khajavali@veurdix.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('Khajavali@veurdix.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('Khajavali@veurdix.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('Khajavali@veurdix.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('kiran789@gmail.com',6,'aaa@amail.com','2013-11-26 18:10:51',NULL,NULL,0),
('kiran789@gmail.com',7,'aaa@amail.com','2013-11-26 16:49:42',NULL,NULL,1),
('kiran789@gmail.com',9,'aaa@amail.com','2013-11-26 17:06:22',NULL,NULL,1),
('kiran789@gmail.com',13,'aaa@amail.com','2013-12-05 14:32:30',NULL,NULL,0),
('kiran789@gmail.com',19,'aaa@amail.com','2013-12-05 14:44:15',NULL,NULL,1),
('kiran@gmail.com',1,'aaa@amail.com','2013-11-26 13:36:39',NULL,NULL,1),
('kiran@gmail.com',3,'aaa@amail.com','2013-11-26 15:08:20',NULL,NULL,1),
('kiran@gmail.com',4,'aaa@amail.com','2013-11-26 15:09:25',NULL,NULL,1),
('kiran@gmail.com',6,'aaa@amail.com','2013-11-26 18:10:51',NULL,NULL,0),
('kiran@gmail.com',7,'aaa@amail.com','2013-11-26 16:29:06',NULL,NULL,1),
('kiran@gmail.com',8,'aaa@amail.com','2013-11-26 16:41:22',NULL,NULL,1),
('kiran@gmail.com',9,'aaa@amail.com','2013-11-26 17:06:22',NULL,NULL,1),
('kiran@gmail.com',13,'aaa@amail.com','2013-12-05 14:32:30',NULL,NULL,0),
('kiran@gmail.com',19,'aaa@amail.com','2013-12-05 14:44:15',NULL,NULL,1),
('kk@gmail.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('kk@gmail.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('kk@gmail.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('kk@gmail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('kv@gmail.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('kv@gmail.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('kv@gmail.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:37',NULL,NULL,0),
('kv@gmail.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('kv@gmail.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('kv@gmail.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('kv@gmail.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('kv@gmail.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('kv@gmail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('mailkeert@gmail.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:37',NULL,NULL,0),
('mailkeert@gmail.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('mailkeert@gmail.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('mailkeert@gmail.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('mailkeert@gmail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('nag@nag.com',1,'aaa@amail.com','2013-11-26 15:06:28',NULL,NULL,1),
('nag@nag.com',3,'aaa@amail.com','2013-11-26 15:08:20',NULL,NULL,1),
('nag@nag.com',4,'aaa@amail.com','2013-11-26 15:09:25',NULL,NULL,1),
('nag@nag.com',7,'aaa@amail.com','2013-11-26 16:29:06',NULL,NULL,1),
('nag@nag.com',8,'aaa@amail.com','2013-11-26 16:41:22',NULL,NULL,1),
('nag@nag.com',13,'aaa@amail.com','2013-12-05 14:32:30',NULL,NULL,1),
('nag@nag.com',14,'vishnu@verudix.com','2013-12-04 19:19:52',NULL,NULL,1),
('nag@nag.com',20,'sreedhar@verudix.com','2013-12-05 16:56:30',NULL,NULL,1),
('nag@nag.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:37',NULL,NULL,0),
('nag@nag.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('nag@nag.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('nag@nag.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('nag@nag.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('nag@satyam.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:37',NULL,NULL,0),
('nag@satyam.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('nag@satyam.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('nag@satyam.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('nag@satyam.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('nag@satyam.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('nag@satyam.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('nag@yahoo.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('nag@yahoo.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('nag@yahoo.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('nag@yahoo.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('nag@yahoo.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('nag@yahoo.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('one@one.com',1,'aaa@amail.com','2013-11-26 13:32:13',NULL,NULL,1),
('one@one.com',2,'aaa@amail.com','2013-11-26 15:07:41',NULL,NULL,1),
('one@one.com',3,'aaa@amail.com','2013-11-26 15:08:20',NULL,NULL,1),
('one@one.com',4,'aaa@amail.com','2013-11-26 15:09:25',NULL,NULL,1),
('one@one.com',5,'bbb@bmail.com','2013-11-26 16:07:33',NULL,NULL,1),
('one@one.com',6,'aaa@amail.com','2013-11-26 18:10:51',NULL,NULL,0),
('one@one.com',7,'aaa@amail.com','2013-11-26 16:29:06',NULL,NULL,1),
('one@one.com',8,'aaa@amail.com','2013-11-26 16:41:22',NULL,NULL,1),
('one@one.com',9,'aaa@amail.com','2013-11-26 17:06:22',NULL,NULL,0),
('one@one.com',13,'aaa@amail.com','2013-12-05 14:32:30',NULL,NULL,0),
('one@one.com',15,'nag@nag.com','2013-12-05 10:40:55',NULL,NULL,1),
('one@one.com',16,'nag@nag.com','2013-12-05 21:06:44',NULL,NULL,1),
('one@one.com',17,'nag@nag.com','2013-12-05 13:03:23',NULL,NULL,1),
('one@one.com',18,'nag@nag.com','2013-12-05 13:05:02',NULL,NULL,1),
('one@one.com',20,'sreedhar@verudix.com','2013-12-05 17:46:12',NULL,NULL,1),
('one@one.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:37',NULL,NULL,0),
('one@one.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('one@one.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('one@one.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('one@one.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('priya@gmail.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:37',NULL,NULL,0),
('priya@gmail.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('priya@gmail.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('priya@gmail.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('priya@gmail.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('priya@gmail.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('priya@gmail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('pvc@gmail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('raj@raj.com',17,'nag@nag.com','2013-12-05 20:58:25',NULL,NULL,1),
('raj@raj.com',18,'nag@nag.com','2013-12-05 21:06:56',NULL,NULL,1),
('raj@raj.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('ramesh@gmail.com',10,'ccc@cmail.com','2013-11-26 17:12:25',NULL,NULL,1),
('ruk@yahoo.com',16,'nag@nag.com','2013-12-09 12:26:38',NULL,NULL,1),
('ruk@yahoo.com',18,'nag@nag.com','2013-12-09 12:27:30',NULL,NULL,1),
('ruk@yahoo.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('ruk@yahoo.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('rukmini.keerthi02@gmail.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('rukmini.keerthi02@gmail.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('rukmini.keerthi02@gmail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('s@s.com',15,'nag@nag.com','2013-12-06 19:02:50',NULL,NULL,1),
('sandhya@gmail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('seshu@gmail.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('seshu@gmail.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('seshu@gmail.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:37',NULL,NULL,0),
('seshu@gmail.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('seshu@gmail.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('seshu@gmail.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('seshu@gmail.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('seshu@gmail.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('seshu@gmail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('sreedhar@verudix.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('sreedhar@verudix.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('sreedhar@verudix.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:37',NULL,NULL,0),
('sreedhar@verudix.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('sreedhar@verudix.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('sreedhar@verudix.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('sreedhar@verudix.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('sreedhar@verudix.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('sreedhar@verudix.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('three@three.com',11,'bbb@bmail.com','2013-11-26 18:16:41',NULL,NULL,1),
('three@three.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:37',NULL,NULL,0),
('three@three.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('three@three.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('three@three.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('three@three.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('two@two.com',4,'aaa@amail.com','2013-11-26 16:01:10',NULL,NULL,1),
('two@two.com',7,'aaa@amail.com','2013-11-26 16:29:06',NULL,NULL,1),
('two@two.com',8,'aaa@amail.com','2013-11-26 16:41:22',NULL,NULL,1),
('two@two.com',15,'nag@nag.com','2013-12-05 10:40:55',NULL,NULL,1),
('two@two.com',16,'nag@nag.com','2013-12-05 12:17:44',NULL,NULL,1),
('two@two.com',17,'nag@nag.com','2013-12-05 13:03:23',NULL,NULL,1),
('two@two.com',18,'nag@nag.com','2013-12-05 13:05:02',NULL,NULL,1),
('two@two.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:37',NULL,NULL,0),
('two@two.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('two@two.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('two@two.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('venu@gmail.com',26,'one@one.com','2013-12-12 14:21:27',NULL,NULL,1),
('venu@gmail.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,1),
('venu@verudix.com',13,'aaa@amail.com','2013-12-05 14:32:30',NULL,NULL,1),
('venu@verudix.com',14,'vishnu@verudix.com','2013-12-04 19:19:52',NULL,NULL,1),
('venu@verudix.com',15,'nag@nag.com','2013-12-05 10:40:55',NULL,NULL,1),
('venu@verudix.com',17,'nag@nag.com','2013-12-05 13:03:23',NULL,NULL,1),
('venu@verudix.com',18,'nag@nag.com','2013-12-05 13:05:02',NULL,NULL,0),
('venu@verudix.com',20,'sreedhar@verudix.com','2013-12-05 16:56:30',NULL,NULL,1),
('venu@verudix.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('venu@verudix.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('venu@verudix.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:37',NULL,NULL,1),
('venu@verudix.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('venu@verudix.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('venu@verudix.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('venu@verudix.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('venu@verudix.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('venu@verudix.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('venugopal11@gmail.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:37',NULL,NULL,0),
('venugopal@gmail.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('venugopal@gmail.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('venugopal@gmail.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:37',NULL,NULL,1),
('venugopal@gmail.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('venugopal@gmail.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('venugopal@gmail.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('venugopal@gmail.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('venugopal@gmail.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('venugopal@gmail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('venuu@gmail.com',16,'nag@nag.com','2013-12-05 21:08:57',NULL,NULL,1),
('venuu@gmail.com',20,'sreedhar@verudix.com','2013-12-05 17:54:32',NULL,NULL,1),
('venuuverudix@gmail.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('venuuverudix@gmail.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('venuuverudix@gmail.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('venuuverudix@gmail.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('venuuverudix@gmail.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('venuuverudix@gmail.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('vishnu@verudix.com',13,'aaa@amail.com','2013-12-05 14:32:30',NULL,NULL,1),
('vishnu@verudix.com',15,'nag@nag.com','2013-12-05 10:40:55',NULL,NULL,1),
('vishnu@verudix.com',17,'nag@nag.com','2013-12-05 13:03:23',NULL,NULL,1),
('vishnu@verudix.com',18,'nag@nag.com','2013-12-05 13:05:02',NULL,NULL,1),
('vishnu@verudix.com',20,'sreedhar@verudix.com','2013-12-05 16:56:30',NULL,NULL,1),
('vishnu@verudix.com',21,'one@one.com','2013-12-10 10:42:49',NULL,NULL,1),
('vishnu@verudix.com',22,'one@one.com','2013-12-10 10:42:58',NULL,NULL,1),
('vishnu@verudix.com',23,'venuuverudix@gmail.com','2013-12-10 12:13:37',NULL,NULL,1),
('vishnu@verudix.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('vishnu@verudix.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('vishnu@verudix.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('vishnu@verudix.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('vishnu@verudix.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('vishnu@verudix.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('xy@xy.com',24,'mailkeert@gmail.com','2013-12-10 12:46:40',NULL,NULL,1),
('xy@xy.com',25,'mailkeert@gmail.com','2013-12-10 12:46:47',NULL,NULL,1),
('xy@xy.com',26,'one@one.com','2013-12-12 18:14:37',NULL,NULL,0),
('xy@xy.com',27,'two@two.com','2013-12-11 16:25:32',NULL,NULL,1),
('xy@xy.com',28,'one@one.com','2013-12-12 18:12:59',NULL,NULL,0),
('xy@xy.com',29,'vgpoloju@gmail.com','2013-12-16 20:19:01',NULL,NULL,1),
('yyy@ymail.com',14,'vishnu@verudix.com','2013-12-04 19:22:52',NULL,NULL,1),
('zzz@zmail.com',14,'vishnu@verudix.com','2013-12-04 19:21:58',NULL,NULL,1);

UNLOCK TABLES;

/* Procedure structure for procedure `sp_db_dynamicQuery` */

drop procedure if exists `sp_db_dynamicQuery`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_db_dynamicQuery`(IN usrid varchar(50),IN spclty varchar(500))
BEGIN
set @b=spclty;
WHILE @b<>'' DO
set @pos=locate(',',@b);
IF @pos>0 THEN
set @str=left(@b,@pos-1);
set @b=right(@b,length(@b)-@pos);
else
set @str=@b;
set @b='';
END IF;
SET @s = CONCAT('insert into mm_employee_spclty(mm_usrid, mm_spclty_type, mm_status) values (','\'',usrid,'\'',',','\'',@str,'\'',',',1,')');
PREPARE stmt1 FROM @s; 
EXECUTE stmt1; 
DEALLOCATE PREPARE stmt1;
END WHILE;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `sp_getfiles` */

drop procedure if exists `sp_getfiles`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getfiles`(in inuserid varchar(200))
BEGIN
select FileID,
CASE WHEN substring_index(filename,'.',-1)='doc' THEN '~/images/word.png'
WHEN substring_index(filename,'.',-1)='docx' THEN '~/images/word.png'
WHEN substring_index(filename,'.',-1)='ppt'  THEN '~/images/powerpoint.png'
WHEN substring_index(filename,'.',-1)='pptx' THEN '~/images/powerpoint.png'
WHEN substring_index(filename,'.',-1)='pdf' THEN '~/images/pdf.png'
WHEN substring_index(filename,'.',-1)='xls'  THEN '~/images/excel.png'
WHEN substring_index(filename,'.',-1)='xlsx' THEN '~/images/excel.png'
WHEN substring_index(filename,'.',-1)='txt' THEN '~/images/text.png'
ELSE '~/images/defaultfile.png'
end as fileImage,
UserID, FileName, Location,
CASE 
WHEN (expiredDateTime < now() and ownerID<>inuserid and Print=0) then 0
WHEN (expiredDateTime < now() and ownerID<>inuserid) then 0
WHEN (expiredDateTime > now() and ownerID<>inuserid and Print=0) then 0
ELSE 1
end as Print,
CASE 
WHEN (expiredDateTime < now() and ownerID<>inuserid and download=0) then 0
WHEN (expiredDateTime < now() and ownerID<>inuserid) then 0
WHEN (expiredDateTime > now() and ownerID<>inuserid and download=0) then 0
ELSE 1
end as Download,sharing as OrgSharing,  OwnerID,Fun_GetNameFromID( OwnerID)as Owner,CreatedDate as CreatedDt,sharedDateTime,ExpiredDateTime,
CASE 
WHEN (expiredDateTime < now() and ownerID<>inuserid and sharing=0) then 'false'
WHEN (expiredDateTime < now() and ownerID<>inuserid) then 'false'
WHEN (expiredDateTime > now() and ownerID<>inuserid and sharing=0) then 'false'
ELSE 'true'
end as sharing,
CASE 
WHEN ownerID=inuserid then 'true'
else 'false' end as isDelete
from files where userID=inuserid order by CreatedDate desc;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `sp_getfilestatus` */

drop procedure if exists `sp_getfilestatus`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getfilestatus`(IN inuid varchar(64),IN infilename varchar(200))
BEGIN
select expiredDateTime into @expiretime from files where UserID=inuid and FileName=infilename;
select viewstatus into @viewstatus from files where UserID=inuid and FileName=infilename;
select now() into @nowtime ;
if(@expiretime <> '1969-01-01 00:00:00') THEN
if(@expiretime < @nowtime) then
select 1;
else
if(@viewstatus>0 and @expiretime < @nowtime)then
select 1;
else
select 0;
end if;
end if;
else
select 0;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `sp_getuserprofile` */

drop procedure if exists `sp_getuserprofile`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getuserprofile`(in inuserid varchar(200))
BEGIN
select * from userdetails where UserID=inuserid;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `sp_Registration` */

drop procedure if exists `sp_Registration`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Registration`(In insheppitId varchar(128),IN insheppitpwd varchar(128),IN indisplayname varchar(64))
BEGIN
if not exists(select * from registration where UserID=insheppitId)then
if not exists(select * from registration where Email=insheppitId) then
insert into registration(UserID,Password,DisplayName)values(insheppitId,aes_encrypt(insheppitpwd,'l0ck1t'),indisplayname);
select 1;  
else
select 2;
end if;
else
select 3;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `sp_updatefileexpiry` */

drop procedure if exists `sp_updatefileexpiry`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updatefileexpiry`(IN inuid varchar(64),IN infilename varchar(200))
BEGIN
update files set viewStatus=1 where UserID=inuid and FileName=infilename;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `test` */

drop procedure if exists `test`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `test`(in inuserid varchar(200),in inarg varchar(8))
BEGIN
if(inarg='OWN') then
select f.UserID, f.FileName, f.FilePath,concat(f.filePath, f.filename) as location,f.fileId,
CASE WHEN substring_index(f.FileName,'.',-1)='doc' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='docx' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='ppt'  THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pptx' THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pdf' THEN '~/images/pdf.png'
WHEN substring_index(f.FileName,'.',-1)='xls'  THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='xlsx' THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='txt' THEN '~/images/text.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID = f.ownerid THEN '~/images/folder.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID <> f.ownerid THEN '~/images/sharedfolder.png'
ELSE '~/images/defaultfile.png'
end as fileImage,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
ELSE 'true'
end as Print,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.download=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.download=0) then 'false'
ELSE 'true'
end as Download,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
ELSE 'true'
end as sharing,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
ELSE 'true'
end as Annotate,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
ELSE 'true'
end as PrintScreen,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
ELSE 'true'
end as RedAct,
CASE 
WHEN ownerID=inuserid then 'true'
else 'false' end as isDelete,
fs.sharing as OrgSharing,f.IsFolder, Fun_GetNameFromID(f.OwnerID)as Owner,Fun_GetNameFromID(SharedBy) as SharedBy,f.CreatedDate as CreatedDt,fs.sharedDateTime,fs.ExpiredDateTime,fs.ViewStatus
from files as f
INNER JOIN file_share as fs on f.userID=fs.UserID and f.fileID=fs.fileID  where f.userID=inuserid order by f.CreatedDate 
desc;
elseif(inarg='ALL') then
select f.UserID, f.FileName, f.FilePath,concat(f.filePath, f.filename) as location,f.fileId,
CASE WHEN substring_index(f.FileName,'.',-1)='doc' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='docx' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='ppt'  THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pptx' THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pdf' THEN '~/images/pdf.png'
WHEN substring_index(f.FileName,'.',-1)='xls'  THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='xlsx' THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='txt' THEN '~/images/text.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID = f.ownerid THEN '~/images/folder.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID <> f.ownerid THEN '~/images/sharedfolder.png'
ELSE '~/images/defaultfile.png'
end as fileImage,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
ELSE 'true'
end as Print,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.download=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.download=0) then 'false'
ELSE 'true'
end as Download,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
ELSE 'true'
end as sharing,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
ELSE 'true'
end as Annotate,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
ELSE 'true'
end as PrintScreen,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
ELSE 'true'
end as RedAct,
CASE 
WHEN ownerID=inuserid then 'true'
else 'false' end as isDelete,
fs.sharing as OrgSharing,f.IsFolder, Fun_GetNameFromID(f.OwnerID)as Owner,Fun_GetNameFromID(SharedBy) as SharedBy,f.CreatedDate as CreatedDt,fs.sharedDateTime,fs.ExpiredDateTime,fs.ViewStatus
from files as f
INNER JOIN file_share as fs  on f.fileID=fs.fileID and fs.USERID=f.UserID  
order by f.CreatedDate ;
else
select f.UserID, f.FileName, f.FilePath,concat(f.filePath, f.filename) as location,f.fileId,
CASE WHEN substring_index(f.FileName,'.',-1)='doc' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='docx' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='ppt'  THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pptx' THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pdf' THEN '~/images/pdf.png'
WHEN substring_index(f.FileName,'.',-1)='xls'  THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='xlsx' THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='txt' THEN '~/images/text.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID = f.ownerid THEN '~/images/folder.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID <> f.ownerid THEN '~/images/sharedfolder.png'
ELSE '~/images/defaultfile.png'
end as fileImage,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
ELSE 'true'
end as Print,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.download=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.download=0) then 'false'
ELSE 'true'
end as Download,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
ELSE 'true'
end as sharing,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
ELSE 'true'
end as Annotate,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
ELSE 'true'
end as PrintScreen,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
ELSE 'true'
end as RedAct,
CASE 
WHEN ownerID=inuserid then 'true'
else 'false' end as isDelete,
fs.sharing as OrgSharing,f.IsFolder, Fun_GetNameFromID(f.OwnerID)as Owner,Fun_GetNameFromID(SharedBy) as SharedBy,f.CreatedDate as CreatedDt,fs.sharedDateTime,fs.ExpiredDateTime,fs.ViewStatus
from files as f
INNER JOIN file_share as fs  on f.fileID=fs.fileID  and fs.USERID=inuserid
and fs.FileID  in (select FileID from files  where UserID<>inuserid)  order by f.CreatedDate ;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Check_Login` */

drop procedure if exists `usp_Check_Login`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Check_Login`(IN inuid varchar(64),IN inpwd varchar(128))
BEGIN
if exists(select * from registration where UserID=inuid and Password=aes_encrypt(inpwd,'l0ck1t')) then
select concat('1,',DisplayName) as res from registration where UserID=inuid;
else
select concat('0,NA') as res;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Check_MailStatus` */

drop procedure if exists `usp_Check_MailStatus`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Check_MailStatus`(in inemail varchar(128))
BEGIN
if exists(select * from registration  where UserID=inemail) then
select 1;
else
select 0;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Check_PasswordKey` */

drop procedure if exists `usp_Check_PasswordKey`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Check_PasswordKey`(IN inuserid varchar(128), IN inpkey varchar(128))
BEGIN
if exists(select * from forgotpasswordkeys where userID=inuserid and Pkey=inpkey and CreatedDate>=now()) then
select 1;
else
select 0;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Delete_File` */

drop procedure if exists `usp_Delete_File`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Delete_File`(IN inuserid varchar(128),IN infileid INT)
BEGIN
if not exists(select * from files where FileID=@infileid and UserID=inuserid) then
if exists(select * from file_share where FileID=infileid) then
delete from file_share where  FileID=infileid;
delete from files where FileID=infileid and UserID=inuserid;
insert into deletefiles_history values(infileid,inuserid,now(),inuserid,now());
end if;
select 1;
else 
select 0;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Delete_Folder` */

drop procedure if exists `usp_Delete_Folder`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Delete_Folder`(in inuserid varchar(128),in infileid INT(4))
BEGIN
SET SESSION SQL_MODE='NO_BACKSLASH_ESCAPES';
select FilePath,FileName INTO @filepath,@filename  from files where UserID=inuserid and FileID=infileid;
delete from file_share where  FileID= infileid;
delete from files where  FileID= infileid;
delete from file_share where  FileID in (select fileID from files where filepath like concat(@filepath,@filename,'_%'));
delete from files where filepath like concat(@filepath,@filename,'_%'); 
select 1;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_delete_group` */

drop procedure if exists `usp_delete_group`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_delete_group`(IN inuserID varchar(128), IN ingroupID int)
BEGIN
if exists(select * from groups where userID=inuserID and GroupID=ingroupID)then
delete from groups where userID=inuserID and GroupID=ingroupID;
select 1;
else
select 0;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Delete_UserContact` */

drop procedure if exists `usp_Delete_UserContact`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Delete_UserContact`(IN incontactID int,IN inuserID varchar(128) )
BEGIN
if exists(select * from user_contacts where userID=inuserID and contactid=incontactID)then
select EmailId into @ContactId from user_contacts where contactId=incontactID;
delete from user_contacts where userID=inuserID and contactid=incontactID;
if exists(select * from user_groups where CreatedBy=inuserID and UserID=@ContactId)then
delete from user_groups where UserID=@ContactId and CreatedBy=inuserID;
end if;
select 1;
else
select 0;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Forgot_PasswordKey` */

drop procedure if exists `usp_Forgot_PasswordKey`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Forgot_PasswordKey`(IN inuserid varchar(128),IN inpkey varchar(128))
BEGIN
insert into forgotpasswordkeys values(inuserid,inpkey,date_add(now(),INTERVAL 3 day));
select 1;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_get_password` */

drop procedure if exists `usp_get_password`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_get_password`(in inuserid varchar(128))
BEGIN
if exists(select * from registration where UserID=inuserid) then
	select aes_decrypt(Password,'l0ck1t') from registration where UserID=inuserid;
else
select '';
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_GoogleRegistration` */

drop procedure if exists `usp_GoogleRegistration`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_GoogleRegistration`(In insheppitId varchar(128),IN insheppitpwd varchar(128),IN indisplayname varchar(64),IN infirstName varchar(64), IN inLastName varchar(64))
BEGIN
if not exists(select * from registration where UserID=insheppitId)then
if not exists(select * from registration where Email=insheppitId) then
insert into registration(UserID,Password,DisplayName,CreatedDate,IsGoogleAuth,FristName,LastName,Email)values(insheppitId,aes_encrypt(insheppitpwd,'l0ck1t'),indisplayname,Now(),1,infirstName,inLastName,insheppitId);
select 1;  
else
select 2;
end if;
else
select 3;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_InsertLDAPUserGroup` */

drop procedure if exists `usp_InsertLDAPUserGroup`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_InsertLDAPUserGroup`(IN inuserid varchar(128),IN ldapStr varchar(1024))
BEGIN
set @b=ldapStr;
set @pos=locate(',',@b);
IF @pos>0 THEN
set @str1=left(@b,@pos-1);
set @str2=right(@b,length(@b)-@pos);
IF NOT EXISTS(select * from groups where groupname =@str2 and groupType='LDAP')THEN
insert into groups(UserID,GroupName,CreatedBy,CreatedDate,groupType) values(inuserid,@str2,inuserid,now(),'LDAP');
insert into user_groups(UserID,GroupID,CreatedBy,CreatedDate) values(@str1,last_insert_id(),inuserid,now());
else
select GroupID into @groupID from groups where groupname =@str2 and groupType='LDAP';
insert into user_groups(UserID,GroupID,CreatedBy,CreatedDate) values(@str1,@groupID,inuserid,now());
END IF;
END IF;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Insert_AddFile` */

drop procedure if exists `usp_Insert_AddFile`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Insert_AddFile`(IN infilename varchar(128),
IN indateuploaded datetime,
IN inuserid varchar(128),
IN infilepath varchar(512),
IN inownerid varchar(128),
IN insharedby varchar(128),
IN inisfolder int(1),
IN inshareddatetime datetime,
IN inexpirydatetime datetime,
IN inprint  tinyint(1),
IN indownload tinyint(1),
IN insharing tinyint(1),
IN inannotate tinyint(1),
IN inprintscreen tinyint(1),
IN inredact  tinyint(1),
IN increatedby varchar(64),
IN increateddate datetime,
IN inIsSecure int(1))
BEGIN
SET infilepath= REPLACE(infilepath,'\\','$');
SET infilepath= REPLACE(infilepath,'/','$');
select Max(FileID) into @tempfileid  from files;
if(@tempfileid is NULL) then
set @tempfileid=1;
insert into files(FileID,FileName,DateUploaded,UserID,FilePath,OwnerID,SharedBy,IsFolder,SharedDatetime,ExpiryDatetime,
CreatedBy,CreatedDate,IsSecure)
values(@tempfileid,infilename,indateuploaded,inuserid,infilepath,inownerid,insharedby,inisfolder,inshareddatetime,                      inexpirydatetime,increatedby,increateddate,inIsSecure); 
insert into file_share(UserID,FileID,Print,Download,Sharing,Annotate,PrintScreen,RedAct,IsFolder,SharedDatetime,                       ExpiredDatetime,CreatedBy,CreatedDate)
values(inuserid,@tempfileid,inprint,indownload,insharing,inannotate,inprintscreen,inredact,isfolder,inshareddatetime,inexpirydatetime,increatedby,increateddate);
select 1;   
else
if not exists(select * from files where UserID=inuserid and Filename=infilename and FilePath=infilepath) then
set @tempfileid=@tempfileid+1;
insert into files(FileID,FileName,DateUploaded,UserID,FilePath,OwnerID,SharedBy,IsFolder,SharedDatetime,ExpiryDatetime,
CreatedBy,CreatedDate,IsSecure)
values(@tempfileid,infilename,indateuploaded,inuserid,infilepath,inownerid,insharedby,inisfolder,inshareddatetime,inexpirydatetime,
increatedby,increateddate,inIsSecure); 
insert into file_share(UserID,FileID,Print,Download,Sharing,Annotate,PrintScreen,RedAct,IsFolder,SharedDatetime,ExpiredDatetime,CreatedBy,CreatedDate)
values(inuserid,@tempfileid,inprint,indownload,insharing,inannotate,inprintscreen,inredact,isfolder,inshareddatetime,inexpirydatetime,increatedby,increateddate);
select 2;   
else
select 0;
end if;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Insert_Group` */

drop procedure if exists `usp_Insert_Group`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Insert_Group`(in ingroupname varchar(128),in increatedby varchar(128),in increateddate datetime)
BEGIN
if not exists(select * from groups where GroupName=ingroupname and UserID=increatedby) then
insert into groups(UserID,GroupName,CreatedBy,CreatedDate)
values(increatedby,ingroupname,increatedby,increateddate);
select last_insert_id();
else
select 0;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Insert_Registration` */

drop procedure if exists `usp_Insert_Registration`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Insert_Registration`(
IN inuserid varchar(128),
IN infristname varchar(64),
IN inlastname varchar(64),
IN inpassword varchar(64),
IN inorganization varchar(512),
IN inemail varchar(128),
IN indisplayname varchar(64),
IN inlocation varchar(512),
IN inisgoogleauth tinyint(1),
IN inisactive bit,
IN inmobile varchar(16),
IN inofficephone varchar(16),
IN increatedby varchar(128),
IN increateddate datetime
)
BEGIN
if not exists(select * from registration where UserID=inuserid) then
insert into registration(UserID,FristName,LastName,Password,Organization,Email,DisplayName,Location,IsGoogleAuth,IsActive,Mobile,OfficePhone,CreatedBy,CreatedDate)
values(inuserid,infristname,inlastname,aes_encrypt(inpassword,'l0ck1t'),inorganization,inemail,indisplayname,inlocation,inisgoogleauth,inisactive,inmobile,inofficephone,increatedby,increateddate);
select 1;
else
select 0;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Insert_ShareFile` */

drop procedure if exists `usp_Insert_ShareFile`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Insert_ShareFile`(
IN inuserid varchar(128),
IN infileid int,
IN inprint tinyint(1),
IN indownload tinyint(1),
IN insharing tinyint(1),
IN inannotate tinyint(1),
IN inprintscreen tinyint(1),
IN inredact tinyint(1),
IN inisfolder tinyint(1),
IN inshareddatetime datetime,
IN inexpireddatetime datetime,
IN inviewstatus tinyint(1),
IN increatedby varchar(128),
IN increateddate datetime)
BEGIN
if not exists(select * from file_share where UserID=inuserid and FileID=infileid) then
select ownerid into @ownerid from files where fileID=infileid order by CreatedDate limit 1;
insert into files(FileID,FileName,DateUploaded,UserID,FilePath,OwnerID,SharedBy,IsFolder,IsSecure,SharedDatetime,ExpiryDatetime,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate) (select FileID,FileName,increateddate,inuserid,FilePath,@ownerid,increatedby,inisfolder,IsSecure,inshareddatetime,inexpireddatetime,increatedby,increateddate,increatedby,increateddate from files where ownerid=@ownerid and FileID=infileid and UserId=@ownerid);
insert into file_share(UserID,FileID,Print,Download,Sharing,Annotate,PrintScreen,RedAct,IsFolder,SharedDatetime,ExpiredDatetime,ViewStatus,CreatedBy,CreatedDate)
values(inuserid,infileid,inprint,indownload,insharing,inannotate,inprintscreen,inredact,inisfolder,inshareddatetime,
inexpireddatetime,inviewstatus,increatedby,increateddate);
select 1;
else
select 0;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Insert_ShareFolder` */

drop procedure if exists `usp_Insert_ShareFolder`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Insert_ShareFolder`(
IN inuserid varchar(128),
IN infileid int,
IN inprint tinyint(1),
IN indownload tinyint(1),
IN insharing tinyint(1),
IN inannotate tinyint(1),
IN inprintscreen tinyint(1),
IN inredact tinyint(1),
IN inisfolder tinyint(1),
IN inshareddatetime datetime,
IN inexpireddatetime datetime,
IN inviewstatus tinyint(1),
IN increatedby varchar(128),
IN increateddate datetime
)
BEGIN
if not exists(select * from file_share where UserID=inuserid and FileID=infileid) then
select ownerid,FilePath,concat(filepath,filename) into @ownerid,@filepath,@likeFolderpath from files where fileID=infileid order by CreatedDate limit 1;
insert into files(FileID,FileName,DateUploaded,UserID,FilePath,OwnerID,SharedBy,IsFolder,IsSecure,SharedDatetime,ExpiryDatetime,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate) (select FileID,FileName,increateddate,inuserid,FilePath,@ownerid,increatedby,inisfolder,IsSecure,inshareddatetime,inexpireddatetime,increatedby,increateddate,increatedby,increateddate from files where ownerid=@ownerid and FileID=infileid limit 1);
insert into file_share(UserID,FileID,Print,Download,Sharing,Annotate,PrintScreen,RedAct,IsFolder,SharedDatetime,ExpiredDatetime,ViewStatus,CreatedBy,CreatedDate)
values(inuserid,infileid,inprint,indownload,insharing,inannotate,inprintscreen,inredact,inisfolder,inshareddatetime,
inexpireddatetime,inviewstatus,increatedby,increateddate);
insert into files(FileID,FileName,DateUploaded,UserID,FilePath,OwnerID,SharedBy,IsFolder,IsSecure,SharedDatetime,ExpiryDatetime,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate) 
select FileID,FileName,createddate,inuserid,FilePath,OwnerID,increatedby,IsFolder,IsSecure,inshareddatetime,inexpireddatetime,increatedby,increateddate,increatedby,increateddate from files where ownerid=@ownerid and userid=@ownerid and FilePath like concat(@likeFolderpath,'_%' );
insert into file_share(UserID,FileID,Print,Download,Sharing,Annotate,PrintScreen,RedAct,IsFolder,SharedDatetime,ExpiredDatetime,ViewStatus,CreatedBy,CreatedDate)
(select inuserid,FileID,inprint,indownload,insharing,inannotate,inprintscreen,inredact,IsFolder,inshareddatetime,
inexpireddatetime,inviewstatus,increatedby,increateddate from files where ownerid=@ownerid and userId=@ownerid and FilePath like concat(@likeFolderpath,'_%'));
select 1;
else
select 0;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Insert_UserContact` */

drop procedure if exists `usp_Insert_UserContact`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Insert_UserContact`(in inemailid varchar(128),in infirstname varchar(128),in inlastname varchar(128),in inuserid varchar(128), in ingroupid int, in increatedby varchar(128),in increateddate datetime )
BEGIN
if exists(select * from registration where UserID=inuserID) then
insert into user_contacts(emailid,firstname,lastname,userid,createdby,createddate) values(inemailid,infirstname,inlastname, inuserid, increatedby, increateddate);
if(ingroupid>0) then
if exists( select * from user_groups where createdby=inuserID and GroupID=ingroupid )then
insert into user_groups(UserID,GroupID,CreatedBy,CreatedDate,IsActive) values(inemailid,ingroupid,inuserid,now(),1);
select 1;
else
select -1;
end if;
end if;
select 1;
else
select 0;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Insert_UserGroups` */

drop procedure if exists `usp_Insert_UserGroups`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Insert_UserGroups`(in inuserid varchar(128),
in ingroupID int,in increatedby varchar(128),in increateddate datetime )
BEGIN
if not exists(select * from user_groups where UserID=inuserid and GroupID=ingroupID) then
insert into user_groups(UserID,GroupID,CreatedBy,CreatedDate,IsActive)
values(inuserid,ingroupID,increatedby,increateddate,1);
select 1;
else
select 0;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_select_` */

drop procedure if exists `usp_select_`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_select_`(in inuserid varchar(200),in inarg varchar(8))
BEGIN
if(inarg='ALL') then
select f.UserID, f.FileName, f.FilePath,concat(f.filePath, f.filename) as location,f.fileId,
CASE WHEN substring_index(f.FileName,'.',-1)='doc' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='docx' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='ppt'  THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pptx' THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pdf' THEN '~/images/pdf.png'
WHEN substring_index(f.FileName,'.',-1)='xls'  THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='xlsx' THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='txt' THEN '~/images/text.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID = f.ownerid THEN '~/images/folder.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID <> f.ownerid THEN '~/images/sharedfolder.png'
ELSE '~/images/defaultfile.png'
end as fileImage,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
ELSE 'true'
end as Print,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.download=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.download=0) then 'false'
ELSE 'true'
end as Download,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
ELSE 'true'
end as sharing,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
ELSE 'true'
end as Annotate,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
ELSE 'true'
end as PrintScreen,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
ELSE 'true'
end as RedAct,
CASE 
WHEN ownerID=inuserid then 'true'
else 'false' end as isDelete,
fs.sharing as OrgSharing,f.IsFolder, Fun_GetNameFromID(f.OwnerID)as Owner,Fun_GetNameFromID(SharedBy) as SharedBy,f.CreatedDate as CreatedDt,fs.sharedDateTime,fs.ExpiredDateTime,fs.ViewStatus
from files as f
INNER JOIN file_share as fs on f.userID=fs.UserID and f.fileID=fs.fileID  where f.userID=inuserid order by f.CreatedDate desc;
elseif(arg='OWN') then
select f.UserID, f.FileName, f.FilePath,concat(f.filePath, f.filename) as location,f.fileId,
CASE WHEN substring_index(f.FileName,'.',-1)='doc' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='docx' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='ppt'  THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pptx' THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pdf' THEN '~/images/pdf.png'
WHEN substring_index(f.FileName,'.',-1)='xls'  THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='xlsx' THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='txt' THEN '~/images/text.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID = f.ownerid THEN '~/images/folder.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID <> f.ownerid THEN '~/images/sharedfolder.png'
ELSE '~/images/defaultfile.png'
end as fileImage,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
ELSE 'true'
end as Print,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.download=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.download=0) then 'false'
ELSE 'true'
end as Download,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
ELSE 'true'
end as sharing,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
ELSE 'true'
end as Annotate,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
ELSE 'true'
end as PrintScreen,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
ELSE 'true'
end as RedAct,
CASE 
WHEN ownerID=inuserid then 'true'
else 'false' end as isDelete,
fs.sharing as OrgSharing,f.IsFolder, Fun_GetNameFromID(f.OwnerID)as Owner,Fun_GetNameFromID(SharedBy) as SharedBy,f.CreatedDate as CreatedDt,fs.sharedDateTime,fs.ExpiredDateTime,fs.ViewStatus
from files as f
INNER JOIN file_share as fs  on f.fileID=fs.fileID  and fs.USERID=inuserid
order by f.CreatedDate ;
else
select f.UserID, f.FileName, f.FilePath,concat(f.filePath, f.filename) as location,f.fileId,
CASE WHEN substring_index(f.FileName,'.',-1)='doc' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='docx' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='ppt'  THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pptx' THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pdf' THEN '~/images/pdf.png'
WHEN substring_index(f.FileName,'.',-1)='xls'  THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='xlsx' THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='txt' THEN '~/images/text.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID = f.ownerid THEN '~/images/folder.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID <> f.ownerid THEN '~/images/sharedfolder.png'
ELSE '~/images/defaultfile.png'
end as fileImage,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
ELSE 'true'
end as Print,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.download=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.download=0) then 'false'
ELSE 'true'
end as Download,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
ELSE 'true'
end as sharing,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
ELSE 'true'
end as Annotate,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
ELSE 'true'
end as PrintScreen,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
ELSE 'true'
end as RedAct,
CASE 
WHEN ownerID=inuserid then 'true'
else 'false' end as isDelete,
fs.sharing as OrgSharing,f.IsFolder, Fun_GetNameFromID(f.OwnerID)as Owner,Fun_GetNameFromID(SharedBy) as SharedBy,f.CreatedDate as CreatedDt,fs.sharedDateTime,fs.ExpiredDateTime,fs.ViewStatus
from files as f
INNER JOIN file_share as fs  on f.fileID=fs.fileID  and fs.USERID=inuserid
and fs.FileID  in (select FileID from files  where UserID<>inuserid)  order by f.CreatedDate ;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_select_AllGroupUsers` */

drop procedure if exists `usp_select_AllGroupUsers`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_select_AllGroupUsers`(IN inuserid varchar(128))
BEGIN
select reg.userid as userid, reg.displayName as displayName,group_concat(g.groupName)as groupnames,group_concat(g.groupID) from groups as g inner join user_groups as ug on g.groupID=ug.groupID inner join registration as reg on reg.userid=ug.userid where g.userid=inuserid group by ug.userid;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Select_AllUserContacts` */

drop procedure if exists `usp_Select_AllUserContacts`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Select_AllUserContacts`(IN inuserid varchar(128))
BEGIN
select contactid,emailID,concat(firstname,' ',Lastname) as displayname,firstname,Lastname,case 
when contactType='user' then ' '
else contactType end as groupnames from user_contacts where userID=inuserID 
order by createddate desc;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_select_AllUsersAuto` */

drop procedure if exists `usp_select_AllUsersAuto`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_select_AllUsersAuto`(IN inuserid varchar(128))
BEGIN
select userid from user_groups
union 
select groupName from groups;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_select_all_users` */

drop procedure if exists `usp_select_all_users`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_select_all_users`(IN inuserID varchar(128))
BEGIN
select userID,displayname  from registration where userID<>inuserID
union 
select emailID as userID,concat(firstname,' ',Lastname) as displayname from user_contacts where userID=inuserID;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_select_fileExpiry` */

drop procedure if exists `usp_select_fileExpiry`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_select_fileExpiry`(IN inuid varchar(128), IN infileID int)
BEGIN
select ExpiredDateTime,Print from file_share where UserID=inuid and fileID=infileID;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_select_filepathByfileId` */

drop procedure if exists `usp_select_filepathByfileId`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_select_filepathByfileId`(IN inFileID varchar(150))
BEGIN
select REPLACE(FilePath,'$','/') as FilePath from files where FileID=inFileID;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_select_fileproperties` */

drop procedure if exists `usp_select_fileproperties`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_select_fileproperties`(IN inUserID varchar(150),IN inFileID int)
BEGIN
select fs.*,REPLACE(concat(f.filePath,f.fileName),'$','/') as location,f.IsSecure from files as f inner join file_share as fs on f.fileID=fs.fileID and f.userID=fs.userID where f.UserID=inUserID and f.FileID=inFileID;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_select_files` */

drop procedure if exists `usp_select_files`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_select_files`(in inuserid varchar(200))
BEGIN
select f.UserID, f.FileName,REPLACE(f.FilePath,'$','/') as FilePath,REPLACE(concat(f.filePath, f.filename),'$','/') as location,f.fileId,f.IsSecure,f.OwnerID,
CASE WHEN substring_index(f.FileName,'.',-1)='doc' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='docx' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='ppt'  THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pptx' THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pdf' THEN '~/images/pdf.png'
WHEN substring_index(f.FileName,'.',-1)='xls'  THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='xlsx' THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='txt' THEN '~/images/text.png'
WHEN substring_index(f.FileName,'.',-1)='rtf' THEN '~/images/rtf.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID = f.ownerid THEN '~/images/folder.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID <> f.ownerid THEN '~/images/sharedfolder.png'
ELSE '~/images/defaultfile.png'
end as fileImage,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
ELSE 'true'
end as Print,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.download=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.download=0) then 'false'
ELSE 'true'
end as Download,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
ELSE 'true'
end as sharing,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
ELSE 'true'
end as Annotate,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
ELSE 'true'
end as PrintScreen,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
ELSE 'true'
end as RedAct,
CASE
WHEN f.Isfolder>0 THEN true
ELSE false end as IsfolderBool,
CASE
WHEN f.Isfolder=0 THEN true
ELSE false end as IsfileBool,
CASE 
WHEN ownerID=inuserid then 'true'
else 'false' end as isDelete,
CASE 
WHEN fs.expiredDateTime < now() and fs.expiredDateTime = '1969-01-01 00:00:00' then '0'
WHEN fs.expiredDateTime > now() and fs.expiredDateTime <> '1969-01-01 00:00:00' then '0'
else '1' end as IsExpiry,
fs.sharing as OrgSharing,f.IsFolder, Fun_GetNameFromID(f.OwnerID)as Owner,Fun_GetNameFromID(SharedBy) as SharedBy,f.CreatedDate as CreatedDt,fs.sharedDateTime,fs.ExpiredDateTime,fs.ViewStatus
from files as f
INNER JOIN file_share as fs on f.userID=fs.UserID and f.fileID=fs.fileID  where f.userID=inuserid and filepath like '%My Files_' order by f.CreatedDate desc;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Select_FilesByFolder` */

drop procedure if exists `usp_Select_FilesByFolder`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Select_FilesByFolder`(in inuserid varchar(128),in inpath varchar(1024))
BEGIN
SET inpath= REPLACE(inpath,'/','$');
select f.UserID, f.FileName, REPLACE(f.FilePath,'$','/') as FilePath,REPLACE(concat(f.filePath, f.filename),'$','/') as location,f.fileId,f.IsSecure,f.OwnerID,
CASE WHEN substring_index(f.FileName,'.',-1)='doc' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='docx' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='ppt'  THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pptx' THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pdf' THEN '~/images/pdf.png'
WHEN substring_index(f.FileName,'.',-1)='xls'  THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='xlsx' THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='txt' THEN '~/images/text.png'
WHEN substring_index(f.FileName,'.',-1)='rtf' THEN '~/images/rtf.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID = f.ownerid THEN '~/images/folder.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID <> f.ownerid THEN '~/images/sharedfolder.png'
ELSE '~/images/defaultfile.png'
end as fileImage,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
ELSE 'true'
end as Print,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.download=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.download=0) then 'false'
ELSE 'true'
end as Download,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
ELSE 'true'
end as sharing,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
ELSE 'true'
end as Annotate,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
ELSE 'true'
end as PrintScreen,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
ELSE 'true'
end as RedAct,
CASE 
WHEN ownerID=inuserid then 'true'
else 'false' end as isDelete,
CASE
WHEN f.Isfolder>0 THEN true
ELSE false end as IsfolderBool,
CASE
WHEN f.Isfolder=0 THEN true
ELSE false end as IsfileBool,
CASE 
WHEN fs.expiredDateTime < now() and fs.expiredDateTime = '1969-01-01 00:00:00' then '0'
WHEN fs.expiredDateTime > now() and fs.expiredDateTime <> '1969-01-01 00:00:00' then '0'
else '1' end as IsExpiry,
fs.sharing as OrgSharing,f.IsFolder, Fun_GetNameFromID(f.OwnerID)as Owner,Fun_GetNameFromID(SharedBy) as SharedBy,f.CreatedDate as CreatedDt,fs.sharedDateTime,fs.ExpiredDateTime,fs.ViewStatus
from files as f
INNER JOIN file_share as fs on f.userID=fs.UserID and f.fileID=fs.fileID  where f.userID=inuserid and f.FilePath=inpath order by f.CreatedDate desc; 
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_select_filesbyown` */

drop procedure if exists `usp_select_filesbyown`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_select_filesbyown`(in inuserid varchar(128))
BEGIN
select f.UserID, f.FileName,REPLACE(f.FilePath,'$','/') as FilePath,REPLACE(concat(f.filePath, f.filename),'$','/') as location,f.fileId,f.IsSecure,f.OwnerID,
CASE WHEN substring_index(f.FileName,'.',-1)='doc' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='docx' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='ppt'  THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pptx' THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pdf' THEN '~/images/pdf.png'
WHEN substring_index(f.FileName,'.',-1)='xls'  THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='xlsx' THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='txt' THEN '~/images/text.png'
WHEN substring_index(f.FileName,'.',-1)='rtf' THEN '~/images/rtf.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID = f.ownerid THEN '~/images/folder.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID <> f.ownerid THEN '~/images/sharedfolder.png'
ELSE '~/images/defaultfile.png'
end as fileImage,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
ELSE 'true'
end as Print,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.download=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.download=0) then 'false'
ELSE 'true'
end as Download,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
ELSE 'true'
end as sharing,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
ELSE 'true'
end as Annotate,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
ELSE 'true'
end as PrintScreen,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
ELSE 'true'
end as RedAct,
CASE
WHEN f.Isfolder>0 THEN true
ELSE false end as IsfolderBool,
CASE
WHEN f.Isfolder=0 THEN true
ELSE false end as IsfileBool,
CASE 
WHEN ownerID=inuserid then 'true'
else 'false' end as isDelete,
'0'  as IsExpiry,
fs.sharing as OrgSharing,f.IsFolder, Fun_GetNameFromID(f.OwnerID)as Owner,Fun_GetNameFromID(SharedBy) as SharedBy,f.CreatedDate as CreatedDt,fs.sharedDateTime,fs.ExpiredDateTime,fs.ViewStatus
from files as f
INNER JOIN file_share as fs on f.userID=fs.UserID and f.fileID=fs.fileID  where f.userID=inuserid and ownerid=inuserid order by f.CreatedDate 
desc;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_select_filesbyshare` */

drop procedure if exists `usp_select_filesbyshare`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_select_filesbyshare`(in inuserid varchar(128))
BEGIN
select f.UserID, f.FileName, REPLACE(f.FilePath,'$','/') as FilePath,REPLACE(concat(f.filePath, f.filename),'$','/') as location,f.fileId,f.IsSecure,f.OwnerID,
CASE WHEN substring_index(f.FileName,'.',-1)='doc' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='docx' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='ppt'  THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pptx' THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pdf' THEN '~/images/pdf.png'
WHEN substring_index(f.FileName,'.',-1)='xls'  THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='xlsx' THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='txt' THEN '~/images/text.png'
WHEN substring_index(f.FileName,'.',-1)='rtf' THEN '~/images/rtf.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID = f.ownerid THEN '~/images/folder.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID <> f.ownerid THEN '~/images/sharedfolder.png'
ELSE '~/images/defaultfile.png'
end as fileImage,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Print=0) then 'false'
ELSE 'true'
end as Print,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.download=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.download=0) then 'false'
ELSE 'true'
end as Download,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.sharing=0) then 'false'
ELSE 'true'
end as sharing,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.Annotate=0) then 'false'
ELSE 'true'
end as Annotate,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.PrintScreen=0) then 'false'
ELSE 'true'
end as PrintScreen,
CASE 
WHEN (fs.expiredDateTime < now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
WHEN (fs.expiredDateTime > now() and f.ownerID<>inuserid and fs.RedAct=0) then 'false'
ELSE 'true'
end as RedAct,
CASE
WHEN f.Isfolder>0 THEN true
ELSE false end as IsfolderBool,
CASE
WHEN f.Isfolder=0 THEN true
ELSE false end as IsfileBool,
CASE 
WHEN ownerID=inuserid then 'true'
else 'false' end as isDelete,
CASE 
WHEN fs.expiredDateTime < now() and fs.expiredDateTime = '1969-01-01 00:00:00' then '0'
WHEN fs.expiredDateTime > now() and fs.expiredDateTime <> '1969-01-01 00:00:00' then '0'
else '1' end as IsExpiry,
fs.sharing as OrgSharing,f.IsFolder, Fun_GetNameFromID(f.OwnerID)as Owner,Fun_GetNameFromID(SharedBy) as SharedBy,f.CreatedDate as CreatedDt,fs.sharedDateTime,fs.ExpiredDateTime,fs.ViewStatus
from files as f
INNER JOIN file_share as fs  on f.fileID=fs.fileID and f.UserID=fs.UserID where fs.userID=inuserid and f.ownerid<>inuserid
and filepath like '%My Files_' order by f.CreatedDate desc ;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Select_ForgotPassword` */

drop procedure if exists `usp_Select_ForgotPassword`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Select_ForgotPassword`(in inuserid varchar(128))
BEGIN
if exists(select * from registration where UserID=inuserid) then
select Password from registration where UserID=inuserid;
else
select '';
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Select_Groups` */

drop procedure if exists `usp_Select_Groups`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Select_Groups`(IN inuserid varchar(128))
BEGIN
SELECT * FROM groups where userid=inuserid order by createddate desc;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Select_SharedFileOwner` */

drop procedure if exists `usp_Select_SharedFileOwner`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Select_SharedFileOwner`(IN infileID int)
BEGIN
select OwnerID from files where fileId=infileID;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Select_SharedFilesByFolder` */

drop procedure if exists `usp_Select_SharedFilesByFolder`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Select_SharedFilesByFolder`(in inuserid varchar(128),in inpath varchar(1024),in infileID int)
BEGIN
SET inpath=REPLACE(inpath,'/','$');
select ownerid,Print,Download,Sharing,Annotate,PrintScreen,RedAct,ExpiredDatetime into @ownerid,@Print,@Download,@Sharing,@Annotate,@PrintScreen,@RedAct,@ExpiredDatetime from files inner join file_share on files.UserID=file_share.userID and files.fileID=file_share.fileID where files.fileID=infileID and files.UserID=inuserid;
select f.UserID, f.FileName, REPLACE(f.FilePath,'$','\\') as FilePath,REPLACE(concat(f.filePath, f.filename),'$','\\') as location,f.fileId,f.IsSecure,f.OwnerID,
CASE WHEN substring_index(f.FileName,'.',-1)='doc' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='docx' THEN '~/images/word.png'
WHEN substring_index(f.FileName,'.',-1)='ppt'  THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pptx' THEN '~/images/powerpoint.png'
WHEN substring_index(f.FileName,'.',-1)='pdf' THEN '~/images/pdf.png'
WHEN substring_index(f.FileName,'.',-1)='xls'  THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='xlsx' THEN '~/images/excel.png'
WHEN substring_index(f.FileName,'.',-1)='txt' THEN '~/images/text.png'
WHEN substring_index(f.FileName,'.',-1)='rtf' THEN '~/images/rtf.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID = f.ownerid THEN '~/images/folder.png'
WHEN substring_index(f.FileName,'.',-1)=f.FileName OR substring_index(f.FileName,'.',-1)IS NULL  AND f.IsFolder=1 AND f.userID <> f.ownerid THEN '~/images/sharedfolder.png'
ELSE '~/images/defaultfile.png'
end as fileImage,
CASE 
WHEN (@ExpiredDatetime < now() and @ownerid<>inuserid and @Print=0) then 'false'
WHEN (@ExpiredDatetime > now() and @ownerid<>inuserid and @Print=0) then 'false'
ELSE 'true'
end as Print,
CASE 
WHEN (@ExpiredDatetime < now() and @ownerid<>inuserid and @Download=0) then 'false'
WHEN (@ExpiredDatetime > now() and @ownerid<>inuserid and @Download=0) then 'false'
ELSE 'true'
end as Download,
CASE 
WHEN (@ExpiredDatetime < now() and @ownerid<>inuserid and @Sharing=0) then 'false'
WHEN (@ExpiredDatetime > now() and @ownerid<>inuserid and @Sharing=0) then 'false'
ELSE 'true'
end as sharing,
CASE 
WHEN (@ExpiredDatetime < now() and @ownerid<>inuserid and @Annotate=0) then 'false'
WHEN (@ExpiredDatetime > now() and @ownerid<>inuserid and @Annotate=0) then 'false'
ELSE 'true'
end as Annotate,
CASE 
WHEN (@ExpiredDatetime < now() and @ownerid<>inuserid and @PrintScreen=0) then 'false'
WHEN (@ExpiredDatetime > now() and @ownerid<>inuserid and @PrintScreen=0) then 'false'
ELSE 'true'
end as PrintScreen,
CASE 
WHEN (@ExpiredDatetime < now() and @ownerid<>inuserid and @RedAct=0) then 'false'
WHEN (@ExpiredDatetime > now() and @ownerid<>inuserid and @RedAct=0) then 'false'
ELSE 'true'
end as RedAct,
CASE 
WHEN ownerID=inuserid then 'true'
else 'false' end as isDelete,
CASE
WHEN f.Isfolder>0 THEN true
ELSE false end as IsfolderBool,
CASE
WHEN f.Isfolder=0 THEN true
ELSE false end as IsfileBool,
CASE 
WHEN @ExpiredDatetime < now() and @ExpiredDatetime = '1969-01-01 00:00:00' then '0'
WHEN @ExpiredDatetime > now() and @ExpiredDatetime <> '1969-01-01 00:00:00' then '0'
else '1' end as IsExpiry,
fs.sharing as OrgSharing,f.IsFolder, Fun_GetNameFromID(f.OwnerID)as Owner,Fun_GetNameFromID(SharedBy) as SharedBy,f.CreatedDate as CreatedDt,fs.sharedDateTime,fs.ExpiredDateTime,fs.ViewStatus
from files as f
INNER JOIN file_share as fs on f.userID=fs.UserID and f.fileID=fs.fileID  where f.userID=(select ownerID from files as f where f.userid=inuserid and f.fileID=infileID) and f.FilePath=inpath order by f.CreatedDate desc; 
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Select_SharedUsersandProperties` */

drop procedure if exists `usp_Select_SharedUsersandProperties`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Select_SharedUsersandProperties`(IN inuserid varchar(128), IN infileID int)
BEGIN
select fs.*, CASE 
WHEN fs.ExpiredDatetime='1969-01-01 00:00:00' THEN '' ELSE date_format(fs.ExpiredDatetime,'%m-%d-%Y %H:%i')end as formattedExpiredDatetime,substring_index(fs.UserID,'@',1) as DisplayName,f.OwnerID from file_share as fs inner join files as f on f.fileID=fs.fileID and f.userid=fs.userid where f.sharedby=inuserid and f.fileID=infileID and f.userid<>inuserid;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Select_UserPrfoile` */

drop procedure if exists `usp_Select_UserPrfoile`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Select_UserPrfoile`(IN inuserid varchar(128))
BEGIN
select * from registration where userid=inuserid;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_select_usersByGroupName` */

drop procedure if exists `usp_select_usersByGroupName`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_select_usersByGroupName`(IN ingroupName varchar(128))
BEGIN
if exists(select * from groups where groupName=ingroupName) then
select ug.userid from user_groups as ug inner join groups as g on g.groupID=ug.groupID where g.GroupName=ingroupName;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_select_UsersOfGroupByName` */

drop procedure if exists `usp_select_UsersOfGroupByName`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_select_UsersOfGroupByName`(IN inuserid varchar(128), IN ingroupname varchar(128))
BEGIN
select * from user_groups as ug inner join groups as g on g.groupID=ug.groupID where g.UserID=inuserid and GroupName=ingroupname and ug.IsActive=1;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_select_users_of_Group` */

drop procedure if exists `usp_select_users_of_Group`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_select_users_of_Group`(IN inuserid varchar(128),in ingroupID int)
BEGIN
select * from user_groups where createdby=inuserid and GroupID=ingroupID and IsActive=1;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Update_Password` */

drop procedure if exists `usp_Update_Password`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Update_Password`(in inuserid varchar(128),
in inoldpassword varchar(64),
in innewpassword varchar(64))
BEGIN
if exists(select * from Registration where Userid=inuserid and Password = aes_encrypt(inoldpassword,'l0ck1t') ) then
update Registration set Password = aes_encrypt(innewpassword,'l0ck1t') 
where 	Userid=inuserid and Password= aes_encrypt(inoldpassword,'l0ck1t');
select 1;
else
select 0;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Update_ResetPassword` */

drop procedure if exists `usp_Update_ResetPassword`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Update_ResetPassword`(IN inuserid varchar(64),
IN inpassword varchar(128))
BEGIN
if exists(select * from Registration where userid=inuserid) then
update Registration set Password=aes_encrypt(inpassword,'l0ck1t') where userid=inuserid;
select 1;
else
select 0;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_update_SharedFileProperties` */

drop procedure if exists `usp_update_SharedFileProperties`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_update_SharedFileProperties`(IN insharedUserid varchar(128), IN infileID int, IN insharedBy varchar(128),IN insave int(1), IN inshare int(1), IN inprint int(1), IN inexpiryDateTime Datetime)
BEGIN
if exists(select * from file_share where userid=insharedUserid and fileID=infileID) then
select IsFolder into @isfolder from file_share where userid=insharedUserid and fileID=infileID;
if(@isfolder<>1) then
update file_share set Download=insave,Sharing=inshare,Print=inprint,ExpiredDatetime=inexpiryDateTime where userid=insharedUserid and fileID=infileID;
else
update file_share set Download=insave,Sharing=inshare,Print=inprint,ExpiredDatetime=inexpiryDateTime,Modifiedby=insharedBy,ModifiedDate=now()  where userid=insharedUserid and fileID=infileID;
select concat(Filepath,filename) into @filepath  from files where  fileID=infileID  and userid= insharedby Limit 1;
update file_share set Download=insave,Sharing=inshare,Print=inprint,ExpiredDatetime=inexpiryDateTime,Modifiedby=insharedBy,ModifiedDate=now()   where userid=insharedUserid and
fileid in(select fileid from files where Userid=insharedUserid and  FilePath like concat(@filepath,'%'));
end if;
select 1;
end if;
select 0;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Update_UserContact` */

drop procedure if exists `usp_Update_UserContact`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Update_UserContact`(in incontactid int, in inemailid varchar(128),in infirstname varchar(128),in inlastname varchar(128),in inuserid varchar(128), in ingroupid  int )
BEGIN
if exists(select * from user_contacts where UserID=inuserID and contactid=incontactid) then
update user_contacts set emailid=inemailid,firstname=infirstname,lastname=inlastname where userid=inuserid and  contactid=incontactid;
if(ingroupid<>0) then
if exists( select * from user_groups where UserID=inuserID and GroupID=ingroupid )then
update user_groups set  GroupID=ingroupid  where UserID=inuserID and GroupID=ingroupid;
else
insert into user_groups(UserID,GroupID,CreatedBy,CreatedDate,IsActive) values(emailid,ingroupid,inuserid,now(),1);
end if;
select 1;
else
select 1;
end if;
else
select 0;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_update_UserGroup` */

drop procedure if exists `usp_update_UserGroup`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_update_UserGroup`(IN ingroupID int,IN ingroupOwnerID varchar(128), IN inuserID varchar(128) ,IN inIsActive int(1))
BEGIN
if exists(select * from registration where UserID=ingroupOwnerID) then
if exists(select * from user_groups where UserID=inuserID and GroupID=ingroupID)then
update user_groups set IsActive =inIsActive where UserID=inuserID and GroupID=inGroupID;
else
insert into user_groups(UserID,GroupID,CreatedBy,CreatedDate,IsActive) values(inuserID,ingroupID,ingroupOwnerID,now(),inIsActive);
end if;
select 1;
else
select 0;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Update_UserGroupByName` */

drop procedure if exists `usp_Update_UserGroupByName`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Update_UserGroupByName`(IN ingroupName varchar(128),IN ingroupOwnerID varchar(128), IN inuserID varchar(128) ,IN inIsActive int(1))
BEGIN
if exists(select * from registration where UserID=ingroupOwnerID) then
select distinct g.groupID into @groupID from groups as g inner join user_groups as ug on g.groupID=ug.GroupID  where g.UserID=ingroupOwnerID and GroupName=ingroupName;
if exists( select * from user_groups where UserID=inuserID and GroupID=@groupID )then
update user_groups set IsActive =inIsActive where UserID=inuserID and GroupID=@groupID;
else
insert into user_groups(UserID,GroupID,CreatedBy,CreatedDate,IsActive) values(inuserID,@groupID,ingroupOwnerID,now(),inIsActive);
end if;
select 1;
else
select 0;
end if;
END$$

DELIMITER ;$$

/* Procedure structure for procedure `usp_Update_UserPrfoile` */

drop procedure if exists `usp_Update_UserPrfoile`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Update_UserPrfoile`(IN inuserid varchar(128),
IN infirstname varchar(64),IN inlastname varchar(64),IN indisplayname varchar(64),IN inemail varchar(128), IN inlocatiion varchar(128),IN inorganization varchar(512),IN inmobile varchar(16), IN inofficephone varchar(16),in inphotourl varchar(1024), IN inmodifieddate  datetime )
BEGIN
if  exists(select * from registration where userid=inuserid ) then
if (inphotourl='') then
update registration set fristname=infirstname, lastname=inlastname,
email=inemail,organization=inorganization,displayname=indisplayname,location=inlocatiion,
mobile= inmobile,officephone=inofficephone,modifiedby=inuserid,modifieddate=inmodifieddate
where userid=inuserid;
else
update registration set fristname=infirstname, lastname=inlastname,
email=inemail,organization=inorganization,displayname=indisplayname,location=inlocatiion,
mobile= inmobile,officephone=inofficephone,photourl=inphotourl, 
modifiedby=inuserid,modifieddate=inmodifieddate
where userid=inuserid;
end if;
select 1;
else
select 0;
end if;
END$$

DELIMITER ;$$

/* Function  structure for function  `Fun_GetNameFromID` */

drop function  if exists `Fun_GetNameFromID`;

DELIMITER $$;

CREATE DEFINER=`root`@`localhost` FUNCTION `Fun_GetNameFromID`( inuserid varchar(200)) RETURNS varchar(200) CHARSET latin1
BEGIN
return( select DisplayName from registration where UserID=inuserid);
END$$

DELIMITER ;$$

SET FOREIGN_KEY_CHECKS=1;
