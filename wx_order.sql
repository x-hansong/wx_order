CREATE DATABASE  IF NOT EXISTS `wx_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `wx_db`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: wx_db
-- ------------------------------------------------------
-- Server version	5.6.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accesstoken`
--

DROP TABLE IF EXISTS `accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accesstoken` (
  `token` varchar(200) NOT NULL,
  `expiresIn` int(11) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `token_UNIQUE` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesstoken`
--

LOCK TABLES `accesstoken` WRITE;
/*!40000 ALTER TABLE `accesstoken` DISABLE KEYS */;
INSERT INTO `accesstoken` VALUES ('1235',60,'2015-09-30 18:50:00',1),('yf',60,'2015-09-30 19:25:00',2),('9mcyJx-s_pZb_2KGEQrUdf1Zga2gW_ZZs0Bsde9PZecXmONb7bgmBYjuZVochXIZgyxD8ypvPJsb0WICneK49hXNQWP8FEYVeTt_xKxUZXo',7200,'2015-09-30 20:15:41',3),('GK7NiJhWNA0SE1So3O2Qs901lFFfmIQ8E4PfQWVK3biII9IprCIu9ineT8jVApc9IQo0rxuKEou30aF_8p-26FFAvrG8XiZj0YIuxSz2aZk',6,'2015-09-30 20:18:32',4),('e2m-kNjxxSyEJS_bPjiWzjzndXs0mIQCHdhFwIWwsMpd7bTP1K3kUfHHwh1lvjwe6TzAL94FlOHtqBoX0ZREyDaRGsRqaJRG3SLIHMkeFes',7200,'2015-09-30 21:10:08',5),('XDIz7750yqTY8HUV0Ku0KF8H7P0_DcjGqm6iQeNvMUb1yh8d4Khy50Z0ka4i2Qhsgq_yMTlRF0Txj3rFPBKRf97mkT_S2ZVXStqtHh5JugQ',7200,'2015-09-30 23:53:41',6),('1txq3Wnp930ppxmZ8TxhTORYmCzVy3Y5a0BM9kz8D6RhS5qwPNyI7CVqyAa8QWRUARh2X_LSwhs4E_NdixFeeit4uXC1drxwLxshP9sWWls',7200,'2015-10-01 10:14:43',7),('8gi15P3gl3V2-B-xOIMR8pah0CbZfnkoPm5kH779TgpFLaVAp-GrTGvz9AqPpB_TftPYo1XTQTsNjhlmwaP1Mvte_SiksAU6IvBiNJW9YFw',7200,'2015-10-01 13:06:05',8),('9BebROFDD1veWy5VTeZSt0zqDYyl9kGSrgbCLh9YG6-n_jqM90R55MaDLjLRuk649ISXuiF6ess5AMRc-KH9w4DLWHuALQoYu2Z08HKWHis',7200,'2015-10-01 17:32:16',9),('5KWWwciMQ8M08aUJ24KYGbd0lZg6u8H0610jaiKJy1m0lc0S63V7KvNJMVaizH2cSMCa0YlCWWsv0QCKpKjfu34Zei_FQvtz3795yHWTebk',7200,'2015-10-01 23:21:35',10),('J9P1YBQlg3cVO1cjK_rXwnw-Qhncx2oSBe0pfUYIFIoS2VMwyD7_d4IiRRaA4bXSUULAoKpgoX_A2wNXfzz3dtg80fakWao-EfjrhaQG_gU',7200,'2015-10-03 15:33:33',11),('e2m-kNjxxSyEJS_bPjiWzqLr3IxucDOfYRKdGWAE0sBuY69W0ngVRpUcaY-wPA6BIsf77WbbsRL7VWrHrC4fDhPtoPjxoB4rIZ4BRrqczJc',7200,'2015-10-03 18:16:38',12),('RJ-URy4WJyhUvG46oQk9EcO46mi2QOs5M8UKeRvCjID13E0eUXufLhSas33itL_961zJTqrmdeqCso2qFvTkse1TnF3E6FH0vj6Jrzivr6Y',7200,'2015-10-03 20:32:52',13),('69ZqAHmK6USidD-dVCnYENTKwrqbGfG6cdYFS_gVcrQJr4Bz_c7T6fCmAK3s0nslf4CNzkXhUWGBa2flpVmJxk0sQeT-i8sRf87thBgD7iU',7200,'2015-10-03 22:52:02',14),('XDIz7750yqTY8HUV0Ku0KKjlhnL0P7f19toRs9nlseOdH2VI1L4tN-pAKVE-5yOQxzpGp552XroZP39858l631YJWoulFXD65QmlOLg_sZk',7200,'2015-10-04 13:14:59',15),('8gi15P3gl3V2-B-xOIMR8gqdfSxkVTE4EKSS51U4YvfB2KHNHffQ9DhzmBFSEYVyXNP6aIWxKNz39x9pCUzahiZA5jsHqv6XcBMawxv6HUw',7200,'2015-10-04 15:50:01',16),('nLWftNlKUrMoB_b7U74x9Xqzsl7ZszacLaLn7JLNDIdVhIhBS91TJA8n6xszfxic71afputIWBILsvLKewPmszcIFDBm5wIiWiUxYXFD0_w',7200,'2015-10-04 22:17:36',17),('4ydKpjFC8iA2cKTeJSTuMiTFzae2WF2FiBSIqAihfQmDubvhmNJfOWAYHIC_GpiNcCQbbTf8553p_3iPHHlnhIgpQueh_N_Xsb9kmYQoG2A',7200,'2015-10-05 00:17:46',18),('ma_1c80ZKp0mUqY60kVcsQjciE7duFx5WWdQ-bKhA8ZSRcogiEIKOYJCrasBOcXzfyAfKTBxyxdU1PyuHsknui6REG402EI4FtB6pIc5J6Y',7200,'2015-10-05 10:55:50',19),('WzM_pWxApSBrY_IytbzddMn1Wxq1edO1UEpzQiWb8yldOTHwqoqil9-6AqfitGBmgNCQ30W436VVqpz4JxfZgTtLkl04rWYfF_oHRyi_VHM',7200,'2015-10-05 13:18:33',20),('RCP4Spqs5z1SM9QBN_s1wmvklVnRlreaGwsUSjDs8jM8uzzy6v2nEQqbKGdEHSOYpd2MC--6trX2WSxU3-8vTfQ5y0c8x3oXmkRLB5bHLKs',7200,'2015-10-05 19:36:42',21),('_yh1y1qRLvPZK_O-lOk2OQxB4FBzdRG29Bgqvvwvl_x7ZiYgVcPQmdr1Lf6kLWSg7Vy7JlSrL1jsyu689RuEY61TOsKuNyZ2hKH5PSX_hzg',7200,'2015-10-05 22:04:59',22),('d7U5uarw_nwVY455060VuTf81AHiD-nVKpT-cRIYCqNPSrjnz-FwIuaH1maa3RySmkLx5LSsYKkMzIOTOf1LD-M6k7SPPE3aDPmIaxFO2Dw',7200,'2015-10-06 12:15:08',23),('R6khqMwsSibxh6iGd_zO8UOS9BWYtzSNthiSlGYDHjfDvNgHtc7x5XsD7PLgEiMdzZnXsi1GaJ74Qdn_x9MfWD4EGoWNhcomn_4MpZE220o',7200,'2015-10-06 14:22:27',24),('Mu-hTQxnmAANTZqgCYS3E6z9_JUorMQ5WNd_Yc_hKpx4PQMMINEVMIRvcozSCTTzMWBDxzeCqlXkk-DYaHa8-o6sXdfElFctU1mzYGlXCH8',7200,'2015-10-06 21:33:27',25),('OYj89yM5d6LXQKs3R8kT1SZcdSPIyj3-7al73oc1BVfkPPBqeipgaIo4Rz1mgEV-zRnA1Rb_Ebxx-9CIay-c2uMKLIoKfMKRUtLeOvMI6hg',7200,'2015-10-07 12:55:58',26),('Mu-hTQxnmAANTZqgCYS3E4mZLIJBgBo7WngRNMoUGjPnnsp_jxL0htHU_6Ih2kGrHPAzXeyuXgKt-v3KH_L_vc5AxtuYS_pRvDJyFprCHnc',7200,'2015-10-16 13:30:58',27);
/*!40000 ALTER TABLE `accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advances`
--

DROP TABLE IF EXISTS `advances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advances` (
  `aid` int(8) NOT NULL AUTO_INCREMENT,
  `sid` int(8) NOT NULL,
  `uid` int(8) NOT NULL,
  `time` datetime NOT NULL,
  `booktime` datetime NOT NULL,
  `men` int(4) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `location` varchar(20) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `sid` (`sid`,`uid`),
  KEY `uid` (`uid`),
  CONSTRAINT `advances_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `shops` (`sid`),
  CONSTRAINT `advances_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advances`
--

LOCK TABLES `advances` WRITE;
/*!40000 ALTER TABLE `advances` DISABLE KEYS */;
INSERT INTO `advances` VALUES (1,1,7,'2015-10-02 00:09:56','2015-10-02 00:09:00',5,'肖劲','123','没有','0'),(2,1,7,'2015-10-03 15:34:09','2015-10-03 15:33:00',4,'肖劲','123','没有','0'),(3,1,7,'2015-10-06 21:37:03','2015-09-20 00:00:00',5,'','','','0'),(4,1,7,'2015-10-06 21:37:17','2015-09-20 00:00:00',1,'哦Jack','看看','金教练','0'),(5,1,12,'2015-10-07 12:56:45','2015-09-20 00:00:00',1,'','','','0'),(6,1,14,'2015-10-07 12:57:09','2015-10-07 12:56:00',1,'肖汉松','18814122696','','0');
/*!40000 ALTER TABLE `advances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dishes` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` float NOT NULL,
  `remark` varchar(200) NOT NULL,
  `img` varchar(200) NOT NULL,
  `sellcount` int(8) NOT NULL,
  `tid` int(11) NOT NULL,
  PRIMARY KEY (`did`),
  KEY `sid` (`sid`),
  KEY `fk_dishes_1_idx` (`tid`),
  CONSTRAINT `dishes_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `shops` (`sid`),
  CONSTRAINT `fk_dishes_1` FOREIGN KEY (`tid`) REFERENCES `types` (`tid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishes`
--

LOCK TABLES `dishes` WRITE;
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT INTO `dishes` VALUES (19,1,'推荐',2,'','resourse/images/1.jpg',1,1),(20,1,'推荐',2,'','resourse/images/1.jpg',1,1),(21,1,'推荐',2,'','resourse/images/1.jpg',1,1),(22,1,'推荐',2,'','resourse/images/1.jpg',1,1),(23,1,'推荐',2,'','resourse/images/1.jpg',1,1),(24,1,'披萨',45,'','resourse/images/2.jpg',1,2),(25,1,'披萨',45,'','resourse/images/2.jpg',1,2),(26,1,'披萨',45,'','resourse/images/2.jpg',1,2),(27,1,'披萨',45,'','resourse/images/2.jpg',1,2),(28,1,'披萨',45,'','resourse/images/2.jpg',1,2),(29,1,'意面',20,'','resourse/images/3.jpg',1,3),(30,1,'意面',20,'','resourse/images/3.jpg',1,3),(31,1,'意面',20,'','resourse/images/3.jpg',1,3),(32,1,'意面',20,'','resourse/images/3.jpg',1,3),(33,1,'意面',20,'','resourse/images/3.jpg',1,3),(34,1,'意面',20,'','resourse/images/3.jpg',1,3),(35,1,'扒饭',22,'','resourse/images/4.jpg',1,4),(36,1,'扒饭',22,'','resourse/images/4.jpg',1,4),(37,1,'扒饭',22,'','resourse/images/4.jpg',1,4),(38,1,'扒饭',22,'','resourse/images/4.jpg',1,4),(39,1,'扒饭',22,'','resourse/images/4.jpg',1,4),(40,1,'汤',10,'','resourse/images/5.jpg',1,5),(41,1,'汤',10,'','resourse/images/5.jpg',1,5),(42,1,'汤',10,'','resourse/images/5.jpg',1,5),(43,1,'汤',10,'','resourse/images/5.jpg',1,5),(44,1,'汤',10,'','resourse/images/5.jpg',1,5),(45,1,'小吃',8,'','resourse/images/6.jpg',1,6),(46,1,'小吃',8,'','resourse/images/6.jpg',1,6),(47,1,'小吃',8,'','resourse/images/6.jpg',1,6),(48,1,'小吃',8,'','resourse/images/6.jpg',1,6),(49,1,'小吃',8,'','resourse/images/6.jpg',1,6),(50,1,'饮品',12,'','resourse/images/7.jpg',1,7),(51,1,'饮品',12,'','resourse/images/7.jpg',1,7),(52,1,'饮品',12,'','resourse/images/7.jpg',1,7),(53,1,'饮品',12,'','resourse/images/7.jpg',1,7),(54,1,'饮品',12,'','resourse/images/7.jpg',1,7);
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `sid` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  `did` int(11) NOT NULL,
  `num` int(4) NOT NULL,
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`iid`),
  KEY `sid` (`sid`,`did`),
  KEY `did` (`did`),
  KEY `orderitem_ibfk_2_idx` (`oid`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `shops` (`sid`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `orderitem_ibfk_3` FOREIGN KEY (`did`) REFERENCES `dishes` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (1,859468610,21,1,1),(1,859468610,30,1,2),(1,859596762,21,1,3),(1,859596762,27,2,4),(1,859596762,30,1,5),(1,859596762,31,1,6),(1,859785242,21,1,7),(1,860885288,33,1,8),(1,860885288,36,2,9),(1,860885288,40,1,10),(1,861152004,32,1,11),(1,861152004,36,2,12),(1,861152004,40,-1,13),(1,861152004,43,-1,14),(1,861599129,32,1,15),(1,861599129,40,-4,16),(1,861599129,43,-4,17),(1,861905785,26,1,18),(1,861905785,32,2,19),(1,862168832,26,1,20),(1,862168832,32,2,21),(1,862554055,26,1,22),(1,862554055,32,2,23),(1,863277012,26,1,24),(1,863277012,32,2,25),(1,864824784,35,3,26),(1,864889284,24,1,27),(1,865288354,24,1,28),(1,867409614,22,1,29),(1,867409614,26,1,30),(1,867409614,33,1,31),(1,867409614,36,1,32),(1,908660602,24,1,33),(1,909271958,22,1,34),(1,909271958,24,2,35),(1,909271958,29,3,36),(1,1029470531,24,2,37),(1,1029470531,27,2,38),(1,1029470531,28,2,39),(1,1029470531,32,2,40),(1,1029532132,19,17,41),(1,1029664974,29,1,42),(1,1029664974,30,1,43),(1,1029664974,31,1,44),(1,1029664974,34,1,45),(1,1029664974,37,1,46),(1,1029664974,38,1,47),(1,1084914056,19,2,48),(1,1084914056,20,2,49),(1,1084914056,21,1,50),(1,1084914056,39,3,51),(1,1084983576,21,1,52),(1,1084993098,19,2,53),(1,1084993098,20,2,54);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `oid` int(20) NOT NULL,
  `sid` int(8) NOT NULL,
  `uid` int(8) NOT NULL,
  `time` datetime NOT NULL,
  `location` varchar(20) NOT NULL,
  `men` int(4) NOT NULL,
  `price` float NOT NULL,
  `state` int(1) NOT NULL,
  `discount` float NOT NULL,
  `pay` int(1) NOT NULL,
  `remark` varchar(200) NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `sid` (`sid`,`uid`),
  KEY `uid` (`uid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `shops` (`sid`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (837267383,1,7,'2015-10-04 16:11:18','',0,0,1,1,1,'0'),(838653303,1,7,'2015-10-04 16:34:24','',0,0,1,1,1,'0'),(839059791,1,7,'2015-10-04 16:41:11','',0,0,1,1,1,'0'),(859468610,1,7,'2015-10-04 22:21:20','20',0,22,1,1,1,'0'),(859596762,1,7,'2015-10-04 22:23:28','5',0,132,1,1,1,'0'),(859785242,1,7,'2015-10-04 22:26:36','',0,2,1,1,1,'0'),(860885288,1,7,'2015-10-04 22:44:56','3',0,74,1,1,1,'0'),(861152004,1,7,'2015-10-04 22:49:23','',0,44,1,1,1,'0'),(861599129,1,7,'2015-10-04 22:56:50','',0,-60,1,1,1,'0'),(861905785,1,7,'2015-10-04 23:01:57','',0,85,1,1,1,'0'),(862168832,1,7,'2015-10-04 23:06:20','',0,85,1,1,1,'0'),(862554055,1,7,'2015-10-04 23:12:45','',0,85,1,1,1,'0'),(863277012,1,7,'2015-10-04 23:24:48','',0,85,1,1,1,'0'),(863762978,1,7,'2015-10-04 23:32:54','',0,0,1,1,1,'0'),(863817077,1,7,'2015-10-04 23:33:48','',0,0,1,1,1,'0'),(863897989,1,7,'2015-10-04 23:35:09','',0,0,1,1,1,'0'),(863944300,1,7,'2015-10-04 23:35:55','',0,0,1,1,1,'0'),(864121097,1,7,'2015-10-04 23:38:52','',0,0,1,1,1,'0'),(864416405,1,7,'2015-10-04 23:43:47','',0,0,1,1,1,'0'),(864824784,1,7,'2015-10-04 23:50:36','',0,66,1,1,1,'0'),(864889284,1,7,'2015-10-04 23:51:40','',0,45,1,1,1,'0'),(865288354,1,7,'2015-10-04 23:58:19','',0,45,1,1,1,'0'),(867409614,1,7,'2015-10-05 00:33:41','',0,89,1,1,1,'0'),(908660602,1,7,'2015-10-05 12:01:12','',0,45,1,1,1,'0'),(909271958,1,7,'2015-10-05 12:11:23','',0,152,1,1,1,'0'),(1029470531,1,7,'2015-10-06 21:34:41','',0,310,1,1,1,'0'),(1029532132,1,7,'2015-10-06 21:35:43','',0,34,1,1,1,'0'),(1029664974,1,7,'2015-10-06 21:37:56','',0,124,1,1,1,'0'),(1084914056,1,13,'2015-10-07 12:58:45','',0,76,1,1,1,'0'),(1084983576,1,14,'2015-10-07 12:59:55','',0,2,1,1,1,'0'),(1084993098,1,12,'2015-10-07 13:00:04','',0,8,1,1,2,'0');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sdkticket`
--

DROP TABLE IF EXISTS `sdkticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sdkticket` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `ticket` varchar(200) NOT NULL,
  `expiresIn` int(11) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sdkticket`
--

LOCK TABLES `sdkticket` WRITE;
/*!40000 ALTER TABLE `sdkticket` DISABLE KEYS */;
INSERT INTO `sdkticket` VALUES (1,'123',20,'2015-10-06 10:00:00'),(2,'sM4AOVdWfPE4DxkXGEs8VM_RnCV5x4XYbffIRS01HHTz_06lhtnh_95DGw_IrpSLlz1P6OxjzVi0wDt0dXc-4w',7200,'2015-10-06 12:15:10'),(3,'sM4AOVdWfPE4DxkXGEs8VM_RnCV5x4XYbffIRS01HHR34-BwvikIp-vDtK3qw9rwtRb91uu6ng9UZDxZtVwKOg',7200,'2015-10-06 14:22:28'),(4,'sM4AOVdWfPE4DxkXGEs8VM_RnCV5x4XYbffIRS01HHSmztp4stjAIfi6wRgFeuqJpYxxt0SPJ5D5ojO5_apkSw',7200,'2015-10-06 21:33:31'),(5,'sM4AOVdWfPE4DxkXGEs8VM_RnCV5x4XYbffIRS01HHQGVE7evlUpch9bgdnQbIXTqBTb8A41ho9D1YiQjHywCg',7200,'2015-10-07 12:56:02'),(6,'sM4AOVdWfPE4DxkXGEs8VM_RnCV5x4XYbffIRS01HHRXwTJgnkJe_w2B0d-6Lj5plIJEk6HbMkEW-iSAlET_WA',7200,'2015-10-16 13:30:58');
/*!40000 ALTER TABLE `sdkticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shops` (
  `sid` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `location` varchar(200) NOT NULL,
  `remark` varchar(200) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (1,'bidou','020','daxuececheng','');
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `tid` int(8) NOT NULL AUTO_INCREMENT,
  `sid` int(8) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `sid` (`sid`),
  CONSTRAINT `types_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `shops` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,1,'推荐'),(2,1,'披萨'),(3,1,'意面'),(4,1,'扒饭'),(5,1,'汤'),(6,1,'小吃'),(7,1,'饮品');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(8) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `sex` int(1) NOT NULL,
  `province` varchar(10) NOT NULL,
  `city` varchar(10) NOT NULL,
  `headimgurl` varchar(200) NOT NULL,
  `level` int(1) NOT NULL,
  `grade` int(8) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `openid_UNIQUE` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'','wencong',0,'','','',0,0,''),(5,'0','zhangli',0,'0','0','0',0,0,'0'),(6,'oTSePuCvAPwc5J50j5-iK4','肖劲1',1,'广东','广州','http://wx.qlogo.cn/mmopen/NTRZLlW6q2gDe44XKGNp5Ahx10brXiceJIjaRKqBU5nib0yDXPmVEdF8aNBEtskfbicSN921n0PfrCNGfia28HtyibDj9O0aZqY8D/0',0,0,'0'),(7,'oTSePuCvAPwcvLRrYG5J50j5-iK4','肖劲',1,'广东','广州','http://wx.qlogo.cn/mmopen/NTRZLlW6q2gDe44XKGNp5ASlaDfxd3JxWLr6gnIpdwictaibSqVM4C08ickIQ4pE8CJ6zTIqUPicSezoohIMT0emibTyVkDFo7OG7/0',0,0,'0'),(11,'oTSePuDJ9Owxypgpcagiq02OyQeI','HDD',2,'广东','广州','http://wx.qlogo.cn/mmopen/Q3auHgzwzM5Fre7dAwJBRzjSk36YAecQYCwW5DMzjrD94JPdCicmia8qzIwQ2Cb3ibeXkuShiaic4Pox70HibHqW4NB2zmJHBb6sEz2dt5MRyLsEU/0',0,0,'0'),(12,'oTSePuNXH08YqUS1n-VC0CALJYME','张力',1,'广东','惠州','http://wx.qlogo.cn/mmopen/NTRZLlW6q2hzyrnkFK3j6maHJoUhfk4g5aeeTfibUSV5MzYuvWItJt0dOW55micF93S7JQdKpdYicsA5UOFWmgLwr4REg3qYXZ0/0',0,0,'0'),(13,'oTSePuO0_x-dygslqomAy7v36lRw','文聪',1,'','','http://wx.qlogo.cn/mmopen/j80MmCh9LKXW7Z1icibMLBIJb524ZFRMvKXMTXjYeqJ2sEHg58o0VEvh9n5giaoj3nnibBgYy0ztakWQ6muCA23FPdibSpzLxpu0q/0',0,0,'0'),(14,'oTSePuAiMUrj7UtsjL5pTbwPolM8','蕭漢鬆',1,'广东','汕头','http://wx.qlogo.cn/mmopen/ajNVdqHZLLD1GfL8icloAHKyeGB6FDibH2QN9nKuBaXAaeAibfMGhMdmCPOnBUialtI4bYGKWvfEQPbSRzibhjrtEzQ/0',0,0,'0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-12 21:38:45
