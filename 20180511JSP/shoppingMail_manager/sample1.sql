CREATE DATABASE  IF NOT EXISTS `sample1` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sample1`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sample1
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 NOT NULL,
  `modifiedTime` datetime NOT NULL,
  `readCount` int(11) NOT NULL,
  `author` varchar(50) CHARACTER SET utf8 NOT NULL,
  `body` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'제목','2018-04-09 00:00:00',1,'김지혜','본문');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `code` int(11) NOT NULL AUTO_INCREMENT COMMENT '코드',
  `name` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '이름',
  `price` int(8) DEFAULT NULL COMMENT '가격',
  `pictureurl` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '사진경로',
  `description` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '설명',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'개념을 콕콕 잡아주는 데이터베이스',27000,'db.png','데이터베이스에 관한 모든 것을 쉽고 재미있게 정리한 교재...'),(2,'웹표준을 위한 HTML5',25000,'html5.jpg','HTML5 가이드북. 홈페이지 제작을 위한 필수 선택 HTML 기본 문법...'),(3,'Dynamic Programming book 시리즈-01 오라클 11g + PL/SQL',25000,'oracle.jpg','Dynamic 실무 코칭 프로그래밍 Book의 첫번째 책으로, 오라클 11g의 새로운...'),(4,'Visual C++ MFC 윈도우 프로그래밍',26000,'mfc.jpg','Visual C++를 처음 시작하는 독자의 눈높이에 맞춘 Visual C++...'),(5,'jQuery and jQuery Mobile : 이해하기 쉽게 풀어쓴',25000,'jquery.jpg','소스 하나로 데스크탑과 모바일까지 HTML5와 함께 사용한다. 초보자들도...'),(7,'test',10000000,'','testtest'),(8,'teststset',114,'파일업로드폼1.PNG','testsetset'),(9,'taettaset',100000,'파일업로드11.PNG','asdfasdf');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-13 16:53:26
