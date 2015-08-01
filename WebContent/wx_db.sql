-- phpMyAdmin SQL Dump
-- version 4.2.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2015-08-01 20:56:23
-- 服务器版本： 5.5.44-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wx_db`
--

-- --------------------------------------------------------

--
-- 表的结构 `advances`
--

CREATE TABLE IF NOT EXISTS `advances` (
`aid` int(8) NOT NULL,
  `sid` int(8) NOT NULL,
  `uid` int(8) NOT NULL,
  `time` date NOT NULL,
  `booktime` date NOT NULL,
  `men` int(4) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `location` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `config`
--

CREATE TABLE IF NOT EXISTS `config` (
`id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dishes`
--

CREATE TABLE IF NOT EXISTS `dishes` (
`did` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` float NOT NULL,
  `remark` varchar(200) NOT NULL,
  `img` varchar(200) NOT NULL,
  `sellcount` int(8) NOT NULL,
  `tid` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `dishes`
--

INSERT INTO `dishes` (`did`, `sid`, `name`, `price`, `remark`, `img`, `sellcount`, `tid`) VALUES
(1, 1, '土豆红烧肉', 10, '', './images/rou.png', 0, 1),
(8, 1, '烧鸡 ', 10, '', './images/200915155654654.JPG', 0, 1),
(9, 1, '扬州炒饭', 10, '', './images/00147307.jpg', 0, 1),
(10, 1, '红烧鱼', 10, '', './images/20121016153858371.jpg', 0, 1),
(11, 1, '酸菜鱼', 10, '', './images/20120622201733582.jpg', 0, 1),
(12, 1, '冰霜果冻', 10, '', './images/1-11110G05523364.jpg', 0, 2),
(13, 1, '多米煎饺', 10, '', './images/1610020918.jpg', 0, 2),
(14, 1, '地瓜丸', 10, '', './images/d999aa8a6ece30adeec5d425038f0567.jpg', 0, 2),
(15, 1, '鲜橙汁', 10, '', './images/2032802_123143316348_2.jpg', 0, 3),
(16, 1, '西瓜汁', 10, '', './images/0410190093.jpg', 0, 3),
(17, 1, '苹果汁', 10, '', './images/1120150061.jpg', 0, 3),
(18, 1, '樱桃汁', 10, '', './images/20081024104054279_2.jpg', 0, 3);

-- --------------------------------------------------------

--
-- 表的结构 `orderitem`
--

CREATE TABLE IF NOT EXISTS `orderitem` (
  `sid` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  `did` int(11) NOT NULL,
  `num` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
`oid` int(8) NOT NULL,
  `sid` int(8) NOT NULL,
  `uid` int(8) NOT NULL,
  `time` datetime NOT NULL,
  `location` varchar(20) NOT NULL,
  `men` int(4) NOT NULL,
  `price` float NOT NULL,
  `state` int(1) NOT NULL,
  `discount` float NOT NULL,
  `pay` int(1) NOT NULL,
  `remark` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `shops`
--

CREATE TABLE IF NOT EXISTS `shops` (
`sid` int(8) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `location` varchar(200) NOT NULL,
  `remark` varchar(200) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `shops`
--

INSERT INTO `shops` (`sid`, `name`, `phone`, `location`, `remark`) VALUES
(1, 'bidou', '020', 'daxuececheng', '');

-- --------------------------------------------------------

--
-- 表的结构 `types`
--

CREATE TABLE IF NOT EXISTS `types` (
`tid` int(8) NOT NULL,
  `sid` int(8) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `types`
--

INSERT INTO `types` (`tid`, `sid`, `name`) VALUES
(1, 1, '主食'),
(2, 1, '小吃'),
(3, 1, '饮料');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`uid` int(8) NOT NULL,
  `unionid` varchar(30) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `sex` int(1) NOT NULL,
  `province` varchar(10) NOT NULL,
  `city` varchar(10) NOT NULL,
  `headimgurl` varchar(100) NOT NULL,
  `level` int(1) NOT NULL,
  `grade` int(8) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `token` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`uid`, `unionid`, `nickname`, `sex`, `province`, `city`, `headimgurl`, `level`, `grade`, `phone`, `token`) VALUES
(1, '', 'wencong', 0, '', '', '', 0, 0, '', '123456'),
(5, '0', 'zhangli', 0, '0', '0', '0', 0, 0, '0', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advances`
--
ALTER TABLE `advances`
 ADD PRIMARY KEY (`aid`), ADD KEY `sid` (`sid`,`uid`), ADD KEY `uid` (`uid`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
 ADD PRIMARY KEY (`did`), ADD KEY `sid` (`sid`), ADD KEY `fk_dishes_1_idx` (`tid`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
 ADD PRIMARY KEY (`oid`), ADD KEY `sid` (`sid`,`did`), ADD KEY `did` (`did`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`oid`), ADD KEY `sid` (`sid`,`uid`), ADD KEY `uid` (`uid`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
 ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
 ADD PRIMARY KEY (`tid`), ADD KEY `sid` (`sid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`uid`), ADD UNIQUE KEY `nickname_UNIQUE` (`nickname`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advances`
--
ALTER TABLE `advances`
MODIFY `aid` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
MODIFY `did` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `oid` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
MODIFY `sid` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
MODIFY `tid` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `uid` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- 限制导出的表
--

--
-- 限制表 `advances`
--
ALTER TABLE `advances`
ADD CONSTRAINT `advances_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `shops` (`sid`),
ADD CONSTRAINT `advances_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);

--
-- 限制表 `dishes`
--
ALTER TABLE `dishes`
ADD CONSTRAINT `dishes_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `shops` (`sid`),
ADD CONSTRAINT `fk_dishes_1` FOREIGN KEY (`tid`) REFERENCES `types` (`tid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `orderitem`
--
ALTER TABLE `orderitem`
ADD CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `shops` (`sid`),
ADD CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
ADD CONSTRAINT `orderitem_ibfk_3` FOREIGN KEY (`did`) REFERENCES `dishes` (`did`);

--
-- 限制表 `orders`
--
ALTER TABLE `orders`
ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `shops` (`sid`),
ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);

--
-- 限制表 `types`
--
ALTER TABLE `types`
ADD CONSTRAINT `types_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `shops` (`sid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
