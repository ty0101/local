/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.49 : Database - bookstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bookstore` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bookstore`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `userid` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `firstname` varchar(80) NOT NULL,
  `lastname` varchar(80) NOT NULL,
  `status` varchar(2) DEFAULT NULL,
  `addr1` varchar(80) NOT NULL,
  `addr2` varchar(40) DEFAULT NULL,
  `city` varchar(80) NOT NULL,
  `state` varchar(80) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `phone` varchar(80) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `account` */

insert  into `account`(`userid`,`email`,`firstname`,`lastname`,`status`,`addr1`,`addr2`,`city`,`state`,`zip`,`country`,`phone`) values ('2','222@qq.com','周','二珂','s','河南省','上海','上海','上海','123','中国','6788'),('3','234@qq.com','陈','一发','a','上海','重庆','武隆','重庆','321','中国','122314');

/*Table structure for table `bannerdata` */

DROP TABLE IF EXISTS `bannerdata`;

CREATE TABLE `bannerdata` (
  `favcategory` varchar(80) NOT NULL,
  `bannername` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`favcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bannerdata` */

insert  into `bannerdata`(`favcategory`,`bannername`) values ('文学','V区V2'),('杂志','Z区Z3');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `catid` varchar(10) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `descn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`catid`,`name`,`descn`) values ('10','励志','励志'),('11','漫画','漫画'),('12','心理学','心理学'),('13','摄影','摄影'),('2','文学','文学'),('3','杂志','杂志'),('4','教育','教育'),('5','童书','童书'),('6','人文社科','人文社科'),('7','生活','生活'),('8','科技','科技'),('9','青春文学','青春文学');

/*Table structure for table `inventory` */

DROP TABLE IF EXISTS `inventory`;

CREATE TABLE `inventory` (
  `itemid` varchar(10) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `inventory` */

insert  into `inventory`(`itemid`,`qty`) values ('10',634),('100',860),('102',870),('103',900),('104',700),('105',600),('106',560),('107',320),('108',350),('109',760),('11',42),('110',860),('111',780),('112',870),('113',900),('114',700),('115',600),('116',560),('12',435),('13',325),('14',540),('15',323),('16',330),('17',320),('18',350),('19',760),('2',200),('20',860),('21',780),('22',870),('23',900),('24',700),('25',600),('26',560),('27',450),('28',340),('29',540),('3',199),('30',540),('31',340),('32',540),('33',540),('34',440),('35',300),('36',120),('37',320),('38',350),('39',760),('4',321),('40',860),('41',780),('42',870),('43',900),('44',700),('45',600),('46',560),('47',450),('48',340),('49',540),('5',322),('50',540),('51',340),('52',540),('53',540),('54',440),('55',300),('56',120),('57',320),('58',350),('59',760),('6',222),('60',860),('61',780),('62',870),('63',900),('64',700),('65',600),('66',560),('67',450),('68',340),('69',540),('7',222),('70',540),('71',340),('72',540),('73',540),('74',440),('75',300),('76',120),('77',320),('78',350),('79',760),('8',432),('80',860),('81',780),('82',870),('83',900),('84',700),('85',600),('86',560),('87',450),('88',340),('89',540),('9',345),('90',540),('91',340),('92',540),('93',540),('94',440),('95',300),('96',120),('97',320),('98',350),('99',760);

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `itemid` varchar(10) NOT NULL,
  `productid` varchar(10) NOT NULL,
  `listprice` decimal(10,2) DEFAULT NULL,
  `unitcost` decimal(10,2) DEFAULT NULL,
  `supplier` int(11) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  `attr1` varchar(80) DEFAULT NULL,
  `attr2` varchar(80) DEFAULT NULL,
  `attr3` varchar(80) DEFAULT NULL,
  `attr4` varchar(80) DEFAULT NULL,
  `attr5` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `fk_item_2` (`supplier`),
  KEY `itemProd` (`productid`),
  CONSTRAINT `fk_item_1` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`),
  CONSTRAINT `fk_item_2` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`suppid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `item` */

/*Table structure for table `lineitem` */

DROP TABLE IF EXISTS `lineitem`;

CREATE TABLE `lineitem` (
  `orderid` int(11) NOT NULL,
  `linenum` int(11) NOT NULL,
  `itemid` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitprice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`orderid`,`linenum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lineitem` */

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL,
  `userid` varchar(80) NOT NULL,
  `orderdate` date NOT NULL,
  `shipaddr1` varchar(80) NOT NULL,
  `shipaddr2` varchar(80) DEFAULT NULL,
  `shipcity` varchar(80) NOT NULL,
  `shipstate` varchar(80) NOT NULL,
  `shipzip` varchar(20) NOT NULL,
  `shipcountry` varchar(20) NOT NULL,
  `billaddr1` varchar(80) NOT NULL,
  `billaddr2` varchar(80) DEFAULT NULL,
  `billcity` varchar(80) NOT NULL,
  `billstate` varchar(80) NOT NULL,
  `billzip` varchar(20) NOT NULL,
  `billcountry` varchar(20) NOT NULL,
  `courier` varchar(80) NOT NULL,
  `totalprice` decimal(10,2) NOT NULL,
  `billtofirstname` varchar(80) NOT NULL,
  `billtolastname` varchar(80) NOT NULL,
  `shiptofirstname` varchar(80) NOT NULL,
  `shiptolastname` varchar(80) NOT NULL,
  `creditcard` varchar(80) NOT NULL,
  `exprdate` varchar(7) NOT NULL,
  `cardtype` varchar(80) NOT NULL,
  `locale` varchar(80) NOT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

/*Table structure for table `orderstatus` */

DROP TABLE IF EXISTS `orderstatus`;

CREATE TABLE `orderstatus` (
  `orderid` int(11) NOT NULL,
  `linenum` int(11) NOT NULL,
  `timestamp` date NOT NULL,
  `status` varchar(2) NOT NULL,
  PRIMARY KEY (`orderid`,`linenum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderstatus` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `productid` varchar(10) NOT NULL,
  `category` varchar(10) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `descn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`productid`),
  KEY `productCat` (`category`),
  KEY `productName` (`name`),
  CONSTRAINT `fk_product_1` FOREIGN KEY (`category`) REFERENCES `category` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`productid`,`category`,`name`,`descn`) values ('100','10','哈佛凌晨四点半','励志'),('102','10','大学不迷茫','励志'),('103','10','把时间当朋友','励志'),('104','10','靠自己去成功','励志'),('105','10','学会自己长大','励志'),('106','10','肯定自己','励志'),('107','11','阿衰','漫画'),('108','11','爆笑校园','漫画'),('109','11','大话降龙','漫画'),('110','11','给我来个和尚','漫画'),('111','11','睡不着','漫画'),('112','11','呆头农场','漫画'),('113','11','大话降龙3','漫画'),('114','11','头条都是他','漫画'),('115','11','射雕英雄传','漫画'),('116','11','星太奇','漫画'),('13','2','西游记','文学'),('14','2','红楼梦','文学'),('15','2','三国演义','文学'),('16','2','水浒传','文学'),('17','2','武林外传','文学'),('18','2','孙子兵法','文学'),('19','2','还珠格格','文学'),('2','2','明朝那些事','文学类'),('20','2','追风筝的人','文学'),('21','2','平凡的人生','文学'),('22','3','装男人','杂志'),('23','3','Time','杂志'),('24','3','时尚周刊','杂志'),('25','3','Vista看天下','杂志'),('26','3','青年文摘','杂志'),('27','3','意林','杂志'),('28','3','读者','杂志'),('29','3','维多利亚闺蜜秀','杂志'),('3','3','男人装','杂志类'),('30','3','东方时空','杂志'),('33','2','18岁欠我一个姑娘','文学'),('34','2','春风十里不如你','文学'),('35','3','读天下','杂志'),('36','3','看世界','杂志'),('37','4','逻辑思维-见识','教育'),('38','4','世界百科全书','教育'),('39','4','新东方高中英语','教育'),('40','4','生物-高中知识清单','教育'),('41','4','学霸笔记-数学','教育'),('42','4','高中语文知识手册','教育'),('43','4','衡水中学状元笔记','教育'),('44','4','高校心理学教材','教育'),('45','4','新闻写作教程','教育'),('46','4','社会研究方法','教育'),('47','5','小猪佩奇','童书'),('48','5','风筝','童书'),('49','5','小兔朱丽奥','童书'),('50','5','阿凡提','童书'),('51','5','少年读史记','童书'),('52','5','给孩子读书','童书'),('53','5','淘气包马小跳','童书'),('54','5','少年西游记','童书'),('55','5','舒克贝塔传','童书'),('56','5','阿凡提','童书'),('57','6','这个历史挺靠谱','人文社科'),('58','6','晓说','人文社科'),('59','6','知行合一王明阳','人文社科'),('60','6','曾国潘家书','人文社科'),('61','6','上下五千年','人文社科'),('62','6','习近平谈治国理政','人文社科'),('63','6','邓小平时代','人文社科'),('64','6','共产党宣言','人文社科'),('65','6','家国天下','人文社科'),('66','6','中国的和平发展道路','人文社科'),('67','7','人生导师','生活'),('68','7','如何爱孩子','生活'),('69','7','父母的教养','生活'),('70','7','戒掉孩子的拖延症','生活'),('71','7','从小读到大','生活'),('72','7','教养在生活的细节','生活'),('73','7','好妈妈胜过好老师','生活'),('74','7','儿童行为心理学','生活'),('75','7','游戏力','生活'),('76','7','成长比成功更重要','生活'),('77','8','数学之美','科技'),('78','8','数据结构与算法分析','科技'),('79','8','算法竞赛入门经典','科技'),('80','8','大话数据结构','科技'),('81','8','编译原理','科技'),('82','8','计算机科学导论','科技'),('83','8','信息简史','科技'),('84','8','深入式分布缓存','科技'),('85','8','微服务设计','科技'),('86','8','计算机图形学','科技'),('87','9','你那么懂事，一定很辛苦吧','青春文学'),('88','9','全职高手18','青春文学'),('89','9','国家是这样炼成的','青春文学'),('90','9','再会，骄傲小时光','青春文学'),('91','9','我们的少年时代','青春文学'),('92','9','爱你时有风','青春文学'),('93','9','现在是女生时代','青春文学'),('94','9','世界上所有的童话都是写给大人看的','青春文学'),('95','9','花季？雨季','青春文学'),('96','9','别走，万一好笑呢','青春文学'),('97','10','你的孤独，虽败犹荣','励志'),('98','10','你在为谁读书','励志'),('99','10','新100个基本','励志');

/*Table structure for table `profile` */

DROP TABLE IF EXISTS `profile`;

CREATE TABLE `profile` (
  `userid` varchar(80) NOT NULL,
  `langpref` varchar(80) NOT NULL,
  `favcategory` varchar(30) DEFAULT NULL,
  `mylistopt` tinyint(1) DEFAULT NULL,
  `banneropt` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `profile` */

insert  into `profile`(`userid`,`langpref`,`favcategory`,`mylistopt`,`banneropt`) values ('2','汉语','文学',123,123),('3','韩语','杂志',123,123);

/*Table structure for table `sequence` */

DROP TABLE IF EXISTS `sequence`;

CREATE TABLE `sequence` (
  `name` varchar(30) NOT NULL,
  `nextid` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sequence` */

/*Table structure for table `signon` */

DROP TABLE IF EXISTS `signon`;

CREATE TABLE `signon` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `signon` */

insert  into `signon`(`username`,`password`) values ('3001','3001'),('3002','3002'),('3003','3003'),('a','123'),('gcc','123456');

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `suppid` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `status` varchar(2) NOT NULL,
  `addr1` varchar(80) DEFAULT NULL,
  `addr2` varchar(80) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `state` varchar(80) DEFAULT NULL,
  `zip` varchar(5) DEFAULT NULL,
  `phone` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`suppid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `supplier` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
