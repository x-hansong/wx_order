-- phpMyAdmin SQL Dump
-- version 4.2.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2015-02-14 16:00:33
-- 服务器版本： 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wx_order`
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
  `price` int(4) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `img` varchar(200) NOT NULL,
  `sellcount` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `orderinfo`
--

CREATE TABLE IF NOT EXISTS `orderinfo` (
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
  `time` date NOT NULL,
  `location` varchar(20) NOT NULL,
  `men` int(4) NOT NULL,
  `price` int(8) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `types`
--

CREATE TABLE IF NOT EXISTS `types` (
`tid` int(8) NOT NULL,
  `sid` int(8) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
 ADD PRIMARY KEY (`did`), ADD KEY `sid` (`sid`);

--
-- Indexes for table `orderinfo`
--
ALTER TABLE `orderinfo`
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
 ADD PRIMARY KEY (`uid`);

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
MODIFY `did` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `oid` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
MODIFY `sid` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
MODIFY `tid` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `uid` int(8) NOT NULL AUTO_INCREMENT;
--
-- 限制导出的表
--

--
-- 限制表 `advances`
--
ALTER TABLE `advances`
ADD CONSTRAINT `advances_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
ADD CONSTRAINT `advances_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `shops` (`sid`);

--
-- 限制表 `dishes`
--
ALTER TABLE `dishes`
ADD CONSTRAINT `dishes_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `shops` (`sid`);

--
-- 限制表 `orderinfo`
--
ALTER TABLE `orderinfo`
ADD CONSTRAINT `orderinfo_ibfk_3` FOREIGN KEY (`did`) REFERENCES `dishes` (`did`),
ADD CONSTRAINT `orderinfo_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `shops` (`sid`),
ADD CONSTRAINT `orderinfo_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`);

--
-- 限制表 `orders`
--
ALTER TABLE `orders`
ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `shops` (`sid`);

--
-- 限制表 `types`
--
ALTER TABLE `types`
ADD CONSTRAINT `types_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `shops` (`sid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
