-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2020 at 05:59 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mats`
--

-- --------------------------------------------------------

--
-- Table structure for table `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assettransformindex`
--

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assettransforms`
--

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `changedattributes`
--

CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `changedattributes`
--

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(5, 1, 'fieldLayoutId', '2020-03-24 20:21:15', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `changedfields`
--

CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `changedfields`
--

INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES
(51, 1, 2, '2020-03-25 05:25:11', 0, 1),
(51, 1, 3, '2020-03-25 05:25:11', 0, 1),
(51, 1, 4, '2020-03-25 05:25:11', 0, 1),
(51, 1, 5, '2020-03-25 05:25:11', 0, 1),
(51, 1, 6, '2020-03-25 05:25:11', 0, 1),
(51, 1, 7, '2020-03-25 05:25:11', 0, 1),
(51, 1, 8, '2020-03-25 05:25:11', 0, 1),
(51, 1, 9, '2020-03-25 05:25:11', 0, 1),
(65, 1, 2, '2020-03-25 05:39:04', 0, 1),
(65, 1, 3, '2020-03-25 05:39:04', 0, 1),
(65, 1, 4, '2020-03-25 05:39:04', 0, 1),
(65, 1, 5, '2020-03-25 05:39:04', 0, 1),
(65, 1, 6, '2020-03-25 05:39:04', 0, 1),
(65, 1, 7, '2020-03-25 05:39:04', 0, 1),
(65, 1, 8, '2020-03-25 05:39:04', 0, 1),
(65, 1, 9, '2020-03-25 05:39:04', 0, 1),
(67, 1, 2, '2020-03-25 05:39:05', 0, 1),
(67, 1, 3, '2020-03-25 05:39:05', 0, 1),
(67, 1, 4, '2020-03-25 05:39:05', 0, 1),
(67, 1, 5, '2020-03-25 05:39:05', 0, 1),
(67, 1, 6, '2020-03-25 05:39:05', 0, 1),
(67, 1, 7, '2020-03-25 05:39:05', 0, 1),
(67, 1, 8, '2020-03-25 05:39:05', 0, 1),
(67, 1, 9, '2020-03-25 05:39:05', 0, 1),
(69, 1, 2, '2020-03-25 05:39:05', 0, 1),
(69, 1, 3, '2020-03-25 05:39:05', 0, 1),
(69, 1, 4, '2020-03-25 05:39:05', 0, 1),
(69, 1, 5, '2020-03-25 05:39:05', 0, 1),
(69, 1, 6, '2020-03-25 05:39:05', 0, 1),
(69, 1, 7, '2020-03-25 05:39:05', 0, 1),
(69, 1, 8, '2020-03-25 05:39:05', 0, 1),
(69, 1, 9, '2020-03-25 05:39:05', 0, 1),
(71, 1, 2, '2020-03-25 05:39:05', 0, 1),
(71, 1, 3, '2020-03-25 05:39:05', 0, 1),
(71, 1, 4, '2020-03-25 05:39:05', 0, 1),
(71, 1, 5, '2020-03-25 05:39:05', 0, 1),
(71, 1, 6, '2020-03-25 05:39:05', 0, 1),
(71, 1, 7, '2020-03-25 05:39:05', 0, 1),
(71, 1, 8, '2020-03-25 05:39:05', 0, 1),
(71, 1, 9, '2020-03-25 05:39:05', 0, 1),
(73, 1, 2, '2020-03-25 05:39:05', 0, 1),
(73, 1, 3, '2020-03-25 05:39:05', 0, 1),
(73, 1, 4, '2020-03-25 05:39:05', 0, 1),
(73, 1, 5, '2020-03-25 05:39:05', 0, 1),
(73, 1, 6, '2020-03-25 05:39:05', 0, 1),
(73, 1, 7, '2020-03-25 05:39:05', 0, 1),
(73, 1, 8, '2020-03-25 05:39:05', 0, 1),
(73, 1, 9, '2020-03-25 05:39:05', 0, 1),
(75, 1, 2, '2020-03-25 05:39:05', 0, 1),
(75, 1, 3, '2020-03-25 05:39:05', 0, 1),
(75, 1, 4, '2020-03-25 05:39:05', 0, 1),
(75, 1, 5, '2020-03-25 05:39:05', 0, 1),
(75, 1, 6, '2020-03-25 05:39:05', 0, 1),
(75, 1, 7, '2020-03-25 05:39:05', 0, 1),
(75, 1, 8, '2020-03-25 05:39:05', 0, 1),
(75, 1, 9, '2020-03-25 05:39:05', 0, 1),
(77, 1, 2, '2020-03-25 05:39:05', 0, 1),
(77, 1, 3, '2020-03-25 05:39:05', 0, 1),
(77, 1, 4, '2020-03-25 05:39:05', 0, 1),
(77, 1, 5, '2020-03-25 05:39:05', 0, 1),
(77, 1, 6, '2020-03-25 05:39:05', 0, 1),
(77, 1, 7, '2020-03-25 05:39:05', 0, 1),
(77, 1, 8, '2020-03-25 05:39:05', 0, 1),
(77, 1, 9, '2020-03-25 05:39:05', 0, 1),
(79, 1, 2, '2020-03-25 05:39:05', 0, 1),
(79, 1, 3, '2020-03-25 15:21:16', 0, 1),
(79, 1, 4, '2020-03-25 05:39:05', 0, 1),
(79, 1, 5, '2020-03-25 15:21:16', 0, 1),
(79, 1, 6, '2020-03-25 05:39:05', 0, 1),
(79, 1, 7, '2020-03-25 05:39:05', 0, 1),
(79, 1, 8, '2020-03-25 15:21:16', 0, 1),
(79, 1, 9, '2020-03-25 05:39:05', 0, 1),
(81, 1, 2, '2020-03-25 05:39:05', 0, 1),
(81, 1, 3, '2020-03-25 05:39:05', 0, 1),
(81, 1, 4, '2020-03-25 05:39:05', 0, 1),
(81, 1, 5, '2020-03-25 05:39:05', 0, 1),
(81, 1, 6, '2020-03-25 05:39:05', 0, 1),
(81, 1, 7, '2020-03-25 05:39:05', 0, 1),
(81, 1, 8, '2020-03-25 05:39:05', 0, 1),
(81, 1, 9, '2020-03-25 05:39:05', 0, 1),
(83, 1, 2, '2020-03-25 05:39:06', 0, 1),
(83, 1, 3, '2020-03-25 05:39:06', 0, 1),
(83, 1, 4, '2020-03-25 05:39:06', 0, 1),
(83, 1, 5, '2020-03-25 05:39:06', 0, 1),
(83, 1, 6, '2020-03-25 05:39:06', 0, 1),
(83, 1, 7, '2020-03-25 05:39:06', 0, 1),
(83, 1, 8, '2020-03-25 05:39:06', 0, 1),
(83, 1, 9, '2020-03-25 05:39:06', 0, 1),
(85, 1, 2, '2020-03-25 05:39:06', 0, 1),
(85, 1, 3, '2020-03-25 05:39:06', 0, 1),
(85, 1, 4, '2020-03-25 05:39:06', 0, 1),
(85, 1, 5, '2020-03-25 05:39:06', 0, 1),
(85, 1, 6, '2020-03-25 05:39:06', 0, 1),
(85, 1, 7, '2020-03-25 05:39:06', 0, 1),
(85, 1, 8, '2020-03-25 05:39:06', 0, 1),
(85, 1, 9, '2020-03-25 05:39:06', 0, 1),
(87, 1, 2, '2020-03-25 05:39:06', 0, 1),
(87, 1, 3, '2020-03-25 05:39:06', 0, 1),
(87, 1, 4, '2020-03-25 05:39:06', 0, 1),
(87, 1, 5, '2020-03-25 05:39:06', 0, 1),
(87, 1, 6, '2020-03-25 05:39:06', 0, 1),
(87, 1, 7, '2020-03-25 05:39:06', 0, 1),
(87, 1, 8, '2020-03-25 05:39:06', 0, 1),
(87, 1, 9, '2020-03-25 05:39:06', 0, 1),
(89, 1, 2, '2020-03-25 05:39:06', 0, 1),
(89, 1, 3, '2020-03-25 05:39:06', 0, 1),
(89, 1, 4, '2020-03-25 05:39:06', 0, 1),
(89, 1, 5, '2020-03-25 05:39:06', 0, 1),
(89, 1, 6, '2020-03-25 05:39:06', 0, 1),
(89, 1, 7, '2020-03-25 05:39:06', 0, 1),
(89, 1, 8, '2020-03-25 05:39:06', 0, 1),
(89, 1, 9, '2020-03-25 05:39:06', 0, 1),
(91, 1, 2, '2020-03-25 05:39:06', 0, 1),
(91, 1, 3, '2020-03-25 05:39:06', 0, 1),
(91, 1, 4, '2020-03-25 05:39:06', 0, 1),
(91, 1, 5, '2020-03-25 05:39:06', 0, 1),
(91, 1, 6, '2020-03-25 05:39:06', 0, 1),
(91, 1, 7, '2020-03-25 05:39:06', 0, 1),
(91, 1, 8, '2020-03-25 05:39:06', 0, 1),
(91, 1, 9, '2020-03-25 05:39:06', 0, 1),
(93, 1, 2, '2020-03-25 05:39:06', 0, 1),
(93, 1, 3, '2020-03-25 05:39:06', 0, 1),
(93, 1, 4, '2020-03-25 05:39:06', 0, 1),
(93, 1, 5, '2020-03-25 05:39:06', 0, 1),
(93, 1, 6, '2020-03-25 05:39:06', 0, 1),
(93, 1, 7, '2020-03-25 05:39:06', 0, 1),
(93, 1, 8, '2020-03-25 05:39:06', 0, 1),
(93, 1, 9, '2020-03-25 05:39:06', 0, 1),
(95, 1, 2, '2020-03-25 05:39:07', 0, 1),
(95, 1, 3, '2020-03-25 05:39:07', 0, 1),
(95, 1, 4, '2020-03-25 05:39:07', 0, 1),
(95, 1, 5, '2020-03-25 05:39:07', 0, 1),
(95, 1, 6, '2020-03-25 05:39:07', 0, 1),
(95, 1, 7, '2020-03-25 05:39:07', 0, 1),
(95, 1, 8, '2020-03-25 05:39:07', 0, 1),
(95, 1, 9, '2020-03-25 05:39:07', 0, 1),
(97, 1, 2, '2020-03-25 05:39:07', 0, 1),
(97, 1, 3, '2020-03-25 05:39:07', 0, 1),
(97, 1, 4, '2020-03-25 05:39:07', 0, 1),
(97, 1, 5, '2020-03-25 05:39:07', 0, 1),
(97, 1, 6, '2020-03-25 05:39:07', 0, 1),
(97, 1, 7, '2020-03-25 05:39:07', 0, 1),
(97, 1, 8, '2020-03-25 05:39:07', 0, 1),
(97, 1, 9, '2020-03-25 05:39:07', 0, 1),
(99, 1, 2, '2020-03-25 05:39:07', 0, 1),
(99, 1, 3, '2020-03-25 05:39:07', 0, 1),
(99, 1, 4, '2020-03-25 05:39:07', 0, 1),
(99, 1, 5, '2020-03-25 05:39:07', 0, 1),
(99, 1, 6, '2020-03-25 05:39:07', 0, 1),
(99, 1, 7, '2020-03-25 05:39:07', 0, 1),
(99, 1, 8, '2020-03-25 05:39:07', 0, 1),
(99, 1, 9, '2020-03-25 05:39:07', 0, 1),
(101, 1, 2, '2020-03-25 05:39:07', 0, 1),
(101, 1, 3, '2020-03-25 05:39:07', 0, 1),
(101, 1, 4, '2020-03-25 05:39:07', 0, 1),
(101, 1, 5, '2020-03-25 05:39:07', 0, 1),
(101, 1, 6, '2020-03-25 05:39:07', 0, 1),
(101, 1, 7, '2020-03-25 05:39:07', 0, 1),
(101, 1, 8, '2020-03-25 05:39:07', 0, 1),
(101, 1, 9, '2020-03-25 05:39:07', 0, 1),
(103, 1, 2, '2020-03-25 05:39:07', 0, 1),
(103, 1, 3, '2020-03-25 05:39:07', 0, 1),
(103, 1, 4, '2020-03-25 05:39:07', 0, 1),
(103, 1, 5, '2020-03-25 05:39:07', 0, 1),
(103, 1, 6, '2020-03-25 05:39:07', 0, 1),
(103, 1, 7, '2020-03-25 05:39:07', 0, 1),
(103, 1, 8, '2020-03-25 05:39:07', 0, 1),
(103, 1, 9, '2020-03-25 05:39:07', 0, 1),
(105, 1, 2, '2020-03-25 05:39:07', 0, 1),
(105, 1, 3, '2020-03-25 05:39:07', 0, 1),
(105, 1, 4, '2020-03-25 05:39:07', 0, 1),
(105, 1, 5, '2020-03-25 05:39:07', 0, 1),
(105, 1, 6, '2020-03-25 05:39:07', 0, 1),
(105, 1, 7, '2020-03-25 05:39:07', 0, 1),
(105, 1, 8, '2020-03-25 05:39:07', 0, 1),
(105, 1, 9, '2020-03-25 05:39:07', 0, 1),
(107, 1, 2, '2020-03-25 05:39:08', 0, 1),
(107, 1, 3, '2020-03-25 05:39:08', 0, 1),
(107, 1, 4, '2020-03-25 05:39:08', 0, 1),
(107, 1, 5, '2020-03-25 05:39:08', 0, 1),
(107, 1, 6, '2020-03-25 05:39:08', 0, 1),
(107, 1, 7, '2020-03-25 05:39:08', 0, 1),
(107, 1, 8, '2020-03-25 05:39:08', 0, 1),
(107, 1, 9, '2020-03-25 05:39:08', 0, 1),
(109, 1, 2, '2020-03-25 05:39:08', 0, 1),
(109, 1, 3, '2020-03-25 05:39:08', 0, 1),
(109, 1, 4, '2020-03-25 05:39:08', 0, 1),
(109, 1, 5, '2020-03-25 05:39:08', 0, 1),
(109, 1, 6, '2020-03-25 05:39:08', 0, 1),
(109, 1, 7, '2020-03-25 05:39:08', 0, 1),
(109, 1, 8, '2020-03-25 05:39:08', 0, 1),
(109, 1, 9, '2020-03-25 05:39:08', 0, 1),
(111, 1, 2, '2020-03-25 05:39:08', 0, 1),
(111, 1, 3, '2020-03-25 05:39:08', 0, 1),
(111, 1, 4, '2020-03-25 05:39:08', 0, 1),
(111, 1, 5, '2020-03-25 05:39:08', 0, 1),
(111, 1, 6, '2020-03-25 05:39:08', 0, 1),
(111, 1, 7, '2020-03-25 05:39:08', 0, 1),
(111, 1, 8, '2020-03-25 05:39:08', 0, 1),
(111, 1, 9, '2020-03-25 05:39:08', 0, 1),
(113, 1, 2, '2020-03-25 05:39:08', 0, 1),
(113, 1, 3, '2020-03-25 05:39:08', 0, 1),
(113, 1, 4, '2020-03-25 05:39:08', 0, 1),
(113, 1, 5, '2020-03-25 05:39:08', 0, 1),
(113, 1, 6, '2020-03-25 05:39:08', 0, 1),
(113, 1, 7, '2020-03-25 05:39:08', 0, 1),
(113, 1, 8, '2020-03-25 05:39:08', 0, 1),
(113, 1, 9, '2020-03-25 05:39:08', 0, 1),
(115, 1, 2, '2020-03-25 05:39:09', 0, 1),
(115, 1, 3, '2020-03-25 05:39:09', 0, 1),
(115, 1, 4, '2020-03-25 05:39:09', 0, 1),
(115, 1, 5, '2020-03-25 05:39:09', 0, 1),
(115, 1, 6, '2020-03-25 05:39:09', 0, 1),
(115, 1, 7, '2020-03-25 05:39:09', 0, 1),
(115, 1, 8, '2020-03-25 05:39:09', 0, 1),
(115, 1, 9, '2020-03-25 05:39:09', 0, 1),
(117, 1, 2, '2020-03-25 05:39:09', 0, 1),
(117, 1, 3, '2020-03-25 05:39:09', 0, 1),
(117, 1, 4, '2020-03-25 05:39:09', 0, 1),
(117, 1, 5, '2020-03-25 05:39:09', 0, 1),
(117, 1, 6, '2020-03-25 05:39:09', 0, 1),
(117, 1, 7, '2020-03-25 05:39:09', 0, 1),
(117, 1, 8, '2020-03-25 05:39:09', 0, 1),
(117, 1, 9, '2020-03-25 05:39:09', 0, 1),
(119, 1, 2, '2020-03-25 05:39:09', 0, 1),
(119, 1, 3, '2020-03-25 05:39:09', 0, 1),
(119, 1, 4, '2020-03-25 05:39:09', 0, 1),
(119, 1, 5, '2020-03-25 05:39:09', 0, 1),
(119, 1, 6, '2020-03-25 05:39:09', 0, 1),
(119, 1, 7, '2020-03-25 05:39:09', 0, 1),
(119, 1, 8, '2020-03-25 05:39:09', 0, 1),
(119, 1, 9, '2020-03-25 05:39:09', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_city` text DEFAULT NULL,
  `field_driverType` varchar(255) DEFAULT NULL,
  `field_jobApplicationLink` varchar(255) DEFAULT NULL,
  `field_jobDetails` text DEFAULT NULL,
  `field_truckType` varchar(255) DEFAULT NULL,
  `field_jobType` varchar(255) DEFAULT NULL,
  `field_jobHeadline` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_city`, `field_driverType`, `field_jobApplicationLink`, `field_jobDetails`, `field_truckType`, `field_jobType`, `field_jobHeadline`) VALUES
(1, 1, 1, NULL, '2020-03-23 05:11:44', '2020-03-23 05:11:44', '9a14971a-4cba-4474-9911-012e7c1e73c1', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 1, 'Home', '2020-03-24 00:51:10', '2020-03-24 00:52:59', 'd6680b82-a199-46f2-a9c5-0542f501770d', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 1, 'Home', '2020-03-24 00:51:10', '2020-03-24 00:51:10', '673f4c58-7e61-4c18-8f17-1498300ed647', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, 1, 'Home', '2020-03-24 00:52:59', '2020-03-24 00:52:59', 'ae8bd981-e6b7-4a6d-8496-ec5b8dd5183f', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 5, 1, 'Jobs Index', '2020-03-24 00:53:31', '2020-03-24 20:24:15', 'd40cac11-8e83-4518-87dd-6eb10d0da60d', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 6, 1, 'Jobs Index', '2020-03-24 00:53:31', '2020-03-24 00:53:31', '1f72b4ef-6751-4669-bb40-a81a4482105d', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 7, 1, 'Jobs Index', '2020-03-24 20:21:15', '2020-03-24 20:21:15', 'dd620752-bde7-4c53-89eb-92e4a5c2ab78', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 8, 1, 'Jobs Index', '2020-03-24 20:24:15', '2020-03-24 20:24:15', '720be363-525c-4ad9-a454-da049c89b863', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 9, 1, NULL, '2020-03-25 05:25:09', '2020-03-25 05:25:09', '033a3147-1d4b-46e0-b7c0-d62e8f4b2736', 'cornelius', NULL, NULL, NULL, 'tanker', 'local', NULL),
(10, 10, 1, NULL, '2020-03-25 05:25:09', '2020-03-25 05:25:09', '4be78adb-f92b-4c63-9e4b-7694cecf5d3d', 'cornelius', NULL, NULL, NULL, 'tanker', 'local', NULL),
(11, 11, 1, NULL, '2020-03-25 05:25:09', '2020-03-25 05:25:09', 'd1ee2ab3-e78d-4975-a8df-be062497b2c5', 'brentwood', NULL, NULL, NULL, 'tanker', 'local', NULL),
(12, 12, 1, NULL, '2020-03-25 05:25:09', '2020-03-25 05:25:09', '204906dd-d5da-4994-b59b-670f20859c97', 'brentwood', NULL, NULL, NULL, 'tanker', 'local', NULL),
(13, 13, 1, NULL, '2020-03-25 05:25:09', '2020-03-25 05:25:09', 'b59a32db-c716-40d7-a9dd-172796c8a92f', 'bryant', NULL, NULL, NULL, 'tanker', 'local', NULL),
(14, 14, 1, NULL, '2020-03-25 05:25:09', '2020-03-25 05:25:09', 'ee206bc4-1882-4f05-b8ac-9f7305f946f5', 'bryant', NULL, NULL, NULL, 'tanker', 'local', NULL),
(15, 15, 1, NULL, '2020-03-25 05:25:09', '2020-03-25 05:25:09', 'ce891b17-7e31-48e3-ba76-d5676853f452', 'Easton', NULL, NULL, NULL, 'tanker', 'local', NULL),
(16, 16, 1, NULL, '2020-03-25 05:25:09', '2020-03-25 05:25:09', '14aa9a3c-5348-43d3-ad07-2d5403670666', 'Easton', NULL, NULL, NULL, 'tanker', 'local', NULL),
(17, 17, 1, NULL, '2020-03-25 05:25:09', '2020-03-25 05:25:09', '313dd225-619e-4ff3-82ac-3aeac586a738', 'Keene', NULL, NULL, NULL, 'tanker', 'local', NULL),
(18, 18, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '7ab0f25b-35fd-45e3-bcae-9467b3390098', 'Keene', NULL, NULL, NULL, 'tanker', 'local', NULL),
(19, 19, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '634cec3a-7c10-4753-8240-b2591ee62a2a', 'Athens', NULL, NULL, NULL, 'van', NULL, NULL),
(20, 20, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '7ce39d30-a6de-4a51-8538-1e38f0116e05', 'Athens', NULL, NULL, NULL, 'van', NULL, NULL),
(21, 21, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '3dac8a3f-e092-40ba-aed5-9441f4115449', 'Birmingham', NULL, NULL, NULL, 'van', NULL, NULL),
(22, 22, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '683539ea-8d7e-4c3c-b1a9-f62fa3a06d74', 'Birmingham', NULL, NULL, NULL, 'van', NULL, NULL),
(23, 23, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '43635843-3a31-4f50-8ef7-32633c996d33', 'Huntsville', NULL, NULL, NULL, 'van', NULL, NULL),
(24, 24, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '8d363db6-0907-445c-a9a9-e179a7d7f19d', 'Huntsville', NULL, NULL, NULL, 'van', NULL, NULL),
(25, 25, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'fd88932e-dd38-4dc0-9b32-4e8d3854a8df', 'Atlanta', NULL, NULL, NULL, 'van', NULL, NULL),
(26, 26, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'bd4c15e3-e4e0-4eec-a28f-dee73f900131', 'Atlanta', NULL, NULL, NULL, 'van', NULL, NULL),
(27, 27, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '3d4cfd99-c57b-444e-9d8d-53ea52b831b4', 'Cedar Rapids', NULL, NULL, NULL, 'van', NULL, NULL),
(28, 28, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'a0f2e22c-a513-4f24-9a9d-ea73f3328626', 'Cedar Rapids', NULL, NULL, NULL, 'van', NULL, NULL),
(29, 29, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'b1c11fc2-5f06-4058-b2f1-43c36ed7f9ed', 'Chicago', NULL, NULL, NULL, 'van', NULL, NULL),
(30, 30, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '1dc6a54b-fff3-4300-8395-63cbba997700', 'Chicago', NULL, NULL, NULL, 'van', NULL, NULL),
(31, 31, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '06772a41-18fa-406c-9a89-893cdfe27907', 'Rockford', NULL, NULL, NULL, 'van', NULL, NULL),
(32, 32, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '1c32a85a-61af-4f64-990b-4133af250b5d', 'Rockford', NULL, NULL, NULL, 'van', NULL, NULL),
(33, 33, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'bcbee3c8-fce3-4652-a82e-5248ec7267ca', 'Round Lake Beach', NULL, NULL, NULL, 'van', NULL, NULL),
(34, 34, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '6e6d3c29-d66b-47c4-ad65-485545a56b60', 'Round Lake Beach', NULL, NULL, NULL, 'van', NULL, NULL),
(35, 35, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '71b0267f-86de-444c-9ebb-d17ea222249d', 'Peoria', NULL, NULL, NULL, 'van', NULL, NULL),
(36, 36, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '98c546b7-0819-415f-ac22-784757e08f11', 'Peoria', NULL, NULL, NULL, 'van', NULL, NULL),
(37, 37, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'a8159ffa-2228-40e1-8e52-40eddd82d623', 'Aurora', NULL, NULL, NULL, 'van', NULL, NULL),
(38, 38, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'cbb6e494-9599-41c9-9fb2-bc656d9eb934', 'Aurora', NULL, NULL, NULL, 'van', NULL, NULL),
(39, 39, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '81e7d450-5a38-4e44-aab6-b21a2faeac18', 'Noblesville', NULL, NULL, NULL, 'van', NULL, NULL),
(40, 40, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '920102e7-6114-4bda-b4f7-f1cb56a7b990', 'Noblesville', NULL, NULL, NULL, 'van', NULL, NULL),
(41, 41, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '4f49eda7-ac58-45e1-ad1a-aa06f8c77b62', 'Columbus', NULL, NULL, NULL, 'van', NULL, NULL),
(42, 42, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '9f2052ef-9f6e-4063-8e55-5c11f345be54', 'Columbus', NULL, NULL, NULL, 'van', NULL, NULL),
(43, 43, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '8714ff8e-d9ba-4bda-ba3b-0a18b9aea8f2', 'Greenwood', NULL, NULL, NULL, 'reefer', NULL, NULL),
(44, 44, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '0ffb97ef-0b3d-48c3-9626-4a54c4799c64', 'Greenwood', NULL, NULL, NULL, 'reefer', NULL, NULL),
(45, 45, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '13d024ac-9825-47e5-b97b-5bf0a71f9dab', 'Mishawaka', NULL, NULL, NULL, 'reefer', NULL, NULL),
(46, 46, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '0c43c310-6a43-454f-b6a5-297c334d8b57', 'Mishawaka', NULL, NULL, NULL, 'reefer', NULL, NULL),
(47, 47, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'cd2617ce-f419-485a-a36e-5b7bf09a85b4', 'Kansas City', NULL, NULL, NULL, 'reefer', NULL, NULL),
(48, 48, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'c33e7b33-6c1d-48ec-a2d3-c35fc76e927e', 'Kansas City', NULL, NULL, NULL, 'reefer', NULL, NULL),
(49, 49, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '50726e8b-170f-40a4-8e04-fe951ea23a29', 'Bowling Green', NULL, NULL, NULL, 'reefer', NULL, NULL),
(50, 50, 1, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '44b02e86-f058-4b5a-a246-ac930a8407e1', 'Bowling Green', NULL, NULL, NULL, 'reefer', NULL, NULL),
(51, 51, 1, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '017b093d-7443-43e1-83b1-b8a9738cc659', 'Elizabethtown', NULL, NULL, NULL, 'reefer', NULL, NULL),
(52, 52, 1, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '9e5cc9db-7e31-4584-ae6e-d22116b1bbce', 'Elizabethtown', NULL, NULL, NULL, 'reefer', NULL, NULL),
(53, 53, 1, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '3b384cfe-9759-45d4-b160-51895ee66089', 'Sulphur', NULL, NULL, NULL, 'reefer', NULL, NULL),
(54, 54, 1, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'a6361ead-fcb2-49cf-bc4d-d61b5aa107d3', 'Sulphur', NULL, NULL, NULL, 'reefer', NULL, NULL),
(55, 55, 1, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '075dec27-f517-4d63-92a4-d2686540149b', 'Abbeville', NULL, NULL, NULL, 'reefer', NULL, NULL),
(56, 56, 1, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'f68c262d-fb34-4934-818c-9ed18b34b026', 'Abbeville', NULL, NULL, NULL, 'reefer', NULL, NULL),
(57, 57, 1, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '85c08e06-bb14-493d-8e11-15638ce6e0ba', 'Baltimore', NULL, NULL, NULL, 'reefer', NULL, NULL),
(58, 58, 1, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '1af96dd1-c6e4-41b0-a645-101c1bcc5d5f', 'Baltimore', NULL, NULL, NULL, 'reefer', NULL, NULL),
(59, 59, 1, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'e3231290-532d-4a04-b72b-a12d91f1ab95', 'Hagerstown', NULL, NULL, NULL, 'tanker', NULL, NULL),
(60, 60, 1, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'c09949d3-d144-4a1a-a4f3-f71a2eaffed7', 'Hagerstown', NULL, NULL, NULL, 'tanker', NULL, NULL),
(61, 61, 1, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'b88d4a5f-95bf-4227-b82f-c08a2395e3ad', 'Frederick', NULL, NULL, NULL, 'tanker', NULL, NULL),
(62, 62, 1, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'a967ba0c-c105-491e-a5c0-f73206e57edc', 'Frederick', NULL, NULL, NULL, 'tanker', NULL, NULL),
(63, 63, 1, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '954ac6d1-5d0a-4783-b003-499f5348eac3', 'Saint Peters', NULL, NULL, NULL, 'tanker', NULL, NULL),
(64, 64, 1, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '67b32a34-d437-4f40-9e2b-d65bcd9dd340', 'Saint Peters', NULL, NULL, NULL, 'tanker', NULL, NULL),
(65, 65, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:37:59', '2020-03-25 05:39:04', '73223419-0d8c-4afc-87de-7fc4064e8855', 'cornelius', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', 'local', NULL),
(66, 66, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:37:59', '2020-03-25 05:37:59', 'f4bb396c-b6f4-4941-8903-fd66327a6540', 'cornelius', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', 'local', NULL),
(67, 67, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:37:59', '2020-03-25 05:39:04', 'bff7d323-757b-4da0-aea1-002cfbe891d2', 'brentwood', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', 'local', NULL),
(68, 68, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:37:59', '2020-03-25 05:37:59', '0ae3eb34-92c4-4e0b-9971-ff55ec9f0275', 'brentwood', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', 'local', NULL),
(69, 69, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:37:59', '2020-03-25 05:39:05', 'ac8d214c-36f0-42ce-b5d3-f02948288f16', 'bryant', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', 'local', NULL),
(70, 70, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:37:59', '2020-03-25 05:37:59', '073d2592-d8cf-43d9-8ff8-81f28f93c758', 'bryant', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', 'local', NULL),
(71, 71, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:37:59', '2020-03-25 05:39:05', '43b346fc-3753-4ee0-b437-3c09134cdd8a', 'Easton', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', 'local', NULL),
(72, 72, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:37:59', '2020-03-25 05:37:59', '6c454b83-98ec-48ed-99af-14b1307ce6c0', 'Easton', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', 'local', NULL),
(73, 73, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:37:59', '2020-03-25 05:39:05', '667eca63-7204-4b5c-808e-78b8e5e006dd', 'Keene', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', 'local', NULL),
(74, 74, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'b2fe1ada-37cc-4f7f-af95-2314d2073ea4', 'Keene', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', 'local', NULL),
(75, 75, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:00', '2020-03-25 05:39:05', '3d6d3e4f-c918-4447-b2bf-e40e777dad0f', 'Athens', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(76, 76, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'd044feb8-a2e5-4611-ac3e-8d40d8c48b56', 'Athens', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(77, 77, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:00', '2020-03-25 05:39:05', '8a1e6b3e-6a3b-4149-a1d8-28280b37b2b5', 'Birmingham', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(78, 78, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:00', '2020-03-25 05:38:00', '2dc83628-6cf9-4a85-8126-cf020fa7017f', 'Birmingham', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(79, 79, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:00', '2020-03-25 15:21:15', 'eef0b53f-d949-426f-b299-0611f27440ea', 'Huntsville', 'solo', 'https://craftcms.stackexchange.com/questions/812/how-to-return-a-specific-entry', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', 'otr', NULL),
(80, 80, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:00', '2020-03-25 05:38:00', '0af4aa8a-e808-4d02-82ee-e9ae7c9e4b96', 'Huntsville', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(81, 81, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:00', '2020-03-25 05:39:05', 'b7ca3c35-3981-405c-8b7a-60e42c8a5123', 'Atlanta', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(82, 82, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:00', '2020-03-25 05:38:00', '745f621f-584f-4ca7-b77c-1d959f4a0df4', 'Atlanta', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(83, 83, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:00', '2020-03-25 05:39:06', '85515810-24be-44e9-93dd-f786bca4d7a1', 'Cedar Rapids', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(84, 84, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:00', '2020-03-25 05:38:00', '25feedce-4700-401e-afef-d38e04a050ef', 'Cedar Rapids', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(85, 85, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:00', '2020-03-25 05:39:06', '3e37327b-685d-4712-b07b-cd84b768f22d', 'Chicago', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(86, 86, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:00', '2020-03-25 05:38:00', '88b92840-04d8-49f4-83f4-bc7426c3d3d0', 'Chicago', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(87, 87, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:00', '2020-03-25 05:39:06', '581d0111-6184-4ac9-a2ea-fbafa6b62749', 'Rockford', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(88, 88, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'ad6c30d2-6cce-4d92-9aa4-bd82c0b62749', 'Rockford', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(89, 89, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:00', '2020-03-25 05:39:06', '759f98b4-f120-40c2-a70f-a57257e187dd', 'Round Lake Beach', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(90, 90, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'd0efb2d2-bd5f-4136-9f8e-1977201d2751', 'Round Lake Beach', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(91, 91, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:00', '2020-03-25 05:39:06', '34d88a56-268f-406c-9a14-5102f3197ad4', 'Peoria', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(92, 92, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:00', '2020-03-25 05:38:00', '46bf5d35-01f4-4d03-94cf-9863f68030e9', 'Peoria', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(93, 93, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:01', '2020-03-25 05:39:06', 'f21fda37-c87d-455e-b74c-75880970b754', 'Aurora', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(94, 94, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:01', '2020-03-25 05:38:01', 'cbfd5d42-492c-4851-a1ab-80caf274020d', 'Aurora', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(95, 95, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:01', '2020-03-25 05:39:07', '20512a18-ba27-458b-80bf-1b1a17572636', 'Noblesville', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(96, 96, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:01', '2020-03-25 05:38:01', 'e147aacd-583d-432e-82f9-24e73fc3ee37', 'Noblesville', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(97, 97, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:01', '2020-03-25 05:39:07', 'ecbb1a1e-0f8c-4922-9ea2-f2795741dfda', 'Columbus', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(98, 98, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:01', '2020-03-25 05:38:01', 'cfcfd7ce-dac3-4af8-9514-a2b506921d3c', 'Columbus', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(99, 99, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:01', '2020-03-25 05:39:07', 'a7c7dc5a-2d86-456a-a6f3-eb7e0ac80e0a', 'Greenwood', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(100, 100, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:01', '2020-03-25 05:38:01', '811df95b-90a1-47b8-b63d-e0bb22877457', 'Greenwood', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(101, 101, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:01', '2020-03-25 05:39:07', '3fcccd31-d79f-4bdd-913a-cf8b080be844', 'Mishawaka', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(102, 102, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:01', '2020-03-25 05:38:01', '775a3a8c-3783-4c0b-8a2d-189dff84e878', 'Mishawaka', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(103, 103, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:01', '2020-03-25 05:39:07', '8384d5d8-148a-405d-bd82-88246e11542f', 'Kansas City', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(104, 104, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:01', '2020-03-25 05:38:01', '196b6695-0f72-450c-bc75-a84c5d911f1e', 'Kansas City', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(105, 105, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:01', '2020-03-25 05:39:07', 'd373a2c4-4d87-4030-9851-4bdd384fca30', 'Bowling Green', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(106, 106, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:01', '2020-03-25 05:38:01', '4f24abf5-ca29-40d6-a607-ff293aabab54', 'Bowling Green', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(107, 107, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:01', '2020-03-25 05:39:08', '620cabb0-82e1-4df0-9131-2df9f25fb09b', 'Elizabethtown', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(108, 108, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:01', '2020-03-25 05:38:01', '681c46b8-c0d4-4e22-b577-63fec5efdd1e', 'Elizabethtown', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(109, 109, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:02', '2020-03-25 05:39:08', '4148b9de-7189-452e-8015-1302f2d866d8', 'Sulphur', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(110, 110, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:02', '2020-03-25 05:38:02', '06527ec2-bc99-435c-91f4-b4fdfec9fe6e', 'Sulphur', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(111, 111, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:02', '2020-03-25 05:39:08', 'd459f715-d0eb-4846-967e-8c18bafc392d', 'Abbeville', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(112, 112, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:02', '2020-03-25 05:38:02', '3dfd8a57-0ab5-4f72-97ce-9e63508cff01', 'Abbeville', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(113, 113, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:02', '2020-03-25 05:39:08', '582fdcb3-8aba-4c91-9094-e30c586211a8', 'Baltimore', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(114, 114, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:02', '2020-03-25 05:38:02', '242855b6-32ed-4d83-8928-1faabb8d4e58', 'Baltimore', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL);
INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_city`, `field_driverType`, `field_jobApplicationLink`, `field_jobDetails`, `field_truckType`, `field_jobType`, `field_jobHeadline`) VALUES
(115, 115, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:02', '2020-03-25 05:39:08', 'a7f76f4b-21ec-45e7-822a-5832461f1194', 'Hagerstown', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', NULL, NULL),
(116, 116, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:02', '2020-03-25 05:38:02', '87aa8853-b1a2-4c75-860e-b183db005c99', 'Hagerstown', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', NULL, NULL),
(117, 117, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:02', '2020-03-25 05:39:09', '4a7db563-9e4a-431b-b422-03bac4683d27', 'Frederick', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', NULL, NULL),
(118, 118, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:02', '2020-03-25 05:38:02', 'e77c7634-f474-4868-abbe-7ca4fc714554', 'Frederick', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', NULL, NULL),
(119, 119, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:02', '2020-03-25 05:39:09', '55a3d65c-1865-45d1-87be-e72015ae502f', 'Saint Peters', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', NULL, NULL),
(120, 120, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:38:02', '2020-03-25 05:38:02', '0c0b1f1f-cf2a-4c92-b3ec-682cd8509727', 'Saint Peters', NULL, NULL, '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', NULL, NULL),
(121, 121, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:04', '2020-03-25 05:39:04', '2923cd2f-e589-4459-af0c-5f2b5f7ef48d', 'cornelius', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', 'local', NULL),
(122, 122, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:04', '2020-03-25 05:39:04', '13b38206-000f-44bc-8a24-ee20813e1cc8', 'brentwood', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', 'local', NULL),
(123, 123, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:05', '2020-03-25 05:39:05', 'a74c3052-adb0-4fd6-bc8c-ab31cedbd70d', 'bryant', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', 'local', NULL),
(124, 124, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:05', '2020-03-25 05:39:05', '9428dad5-bbfc-494f-803c-25fc80e4899b', 'Easton', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', 'local', NULL),
(125, 125, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:05', '2020-03-25 05:39:05', 'c49338da-df16-47d3-acab-cfed1ae9553d', 'Keene', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', 'local', NULL),
(126, 126, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:05', '2020-03-25 05:39:05', 'daa42a0f-e005-4dd5-9169-c0bd42772944', 'Athens', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(127, 127, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:05', '2020-03-25 05:39:05', '881cb87b-073d-40bd-83e0-00236d82f295', 'Birmingham', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(128, 128, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:05', '2020-03-25 05:39:05', '9014331c-60bd-4fe4-a900-0a579e1da8d5', 'Huntsville', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(129, 129, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:05', '2020-03-25 05:39:05', '7251b361-b06b-473d-ad6b-ae36da46910d', 'Atlanta', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(130, 130, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:06', '2020-03-25 05:39:06', '8c1bea9b-fcfc-40e4-894e-0eb547509242', 'Cedar Rapids', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(131, 131, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:06', '2020-03-25 05:39:06', 'dd48aba1-ec3f-473f-97cc-4af98f2e7618', 'Chicago', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(132, 132, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:06', '2020-03-25 05:39:06', 'a5742057-1830-431c-9dfa-8d363db701ac', 'Rockford', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(133, 133, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:06', '2020-03-25 05:39:06', 'bd51b1ae-cc33-4c04-8375-bc09ff1aeb63', 'Round Lake Beach', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(134, 134, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:06', '2020-03-25 05:39:06', 'caf05b78-8454-4576-9e85-552fd6495b45', 'Peoria', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(135, 135, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:06', '2020-03-25 05:39:06', 'c3fadfb1-ce7c-4cad-8a17-411bdf6e3c67', 'Aurora', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(136, 136, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:07', '2020-03-25 05:39:07', '05ebc9b9-fbcd-4b00-b127-6cfe99cffccd', 'Noblesville', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(137, 137, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:07', '2020-03-25 05:39:07', '0caea30f-c18c-4404-bbd9-f5a9df343952', 'Columbus', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', NULL, NULL),
(138, 138, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:07', '2020-03-25 05:39:07', '17a048d9-fac2-42a3-898b-4148d7074c32', 'Greenwood', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(139, 139, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:07', '2020-03-25 05:39:07', '96e29924-55cc-4340-b5c7-512cbd0297d7', 'Mishawaka', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(140, 140, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:07', '2020-03-25 05:39:07', '15a2306d-39c8-44ee-bfe9-f9b5c87d0569', 'Kansas City', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(141, 141, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:07', '2020-03-25 05:39:07', '1786d8aa-58ed-4df1-9ac1-43e4616b7291', 'Bowling Green', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(142, 142, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:08', '2020-03-25 05:39:08', 'c3ae7d95-eaf9-4d9f-a013-33586df196bc', 'Elizabethtown', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(143, 143, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:08', '2020-03-25 05:39:08', '5cea05d0-0890-46ba-901d-e68e52a9c77c', 'Sulphur', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(144, 144, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:08', '2020-03-25 05:39:08', '8e04b77b-e709-4b9e-a27f-282eddaccba4', 'Abbeville', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(145, 145, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:08', '2020-03-25 05:39:08', '0475612c-b166-4775-82a6-e6622a2d5d37', 'Baltimore', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'reefer', NULL, NULL),
(146, 146, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:09', '2020-03-25 05:39:09', '08d219ac-3919-4d3d-b30e-ffb623906291', 'Hagerstown', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', NULL, NULL),
(147, 147, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:09', '2020-03-25 05:39:09', 'b1a06ab2-2f94-4423-b18b-240a026ab0e9', 'Frederick', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', NULL, NULL),
(148, 148, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 05:39:09', '2020-03-25 05:39:09', 'e330387c-848d-4ffa-864f-db3ce226e3a8', 'Saint Peters', NULL, 'conversionia.com', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'tanker', NULL, NULL),
(149, 149, 1, 'CDL-A FLATBED TRUCK DRIVER JOBS – UP TO $1,200 WKLY PAY', '2020-03-25 15:21:15', '2020-03-25 15:21:15', 'eab4ed46-3065-4885-ac7f-61ec53e4cf8a', 'Huntsville', 'solo', 'https://craftcms.stackexchange.com/questions/812/how-to-return-a-specific-entry', '<p><strong>CDL-A Flatbed Truck Driver Jobs – Averaging .63 CPM And Earn Up To $1,200 Weekly Minimum Pay!</strong></p><p><br /> Join Montgomery Transport, where we offer CDL-A truck drivers a promising flatbed career with industry-leading pay, weekly home time and up to $2,000 orientation pay.</p><p> </p><p>CDL-A flatbed truck driver jobs at Montgomery provide a Loyalty Program, breaking the ceiling on industry standards with weekly payments up to your first 84 weeks, while our Weekly Minimum Pay ensures consistency and reliability during seasonably soft market conditions.</p>', 'van', 'otr', NULL),
(150, 150, 1, '2020-03-26 07:12:53', '2020-03-26 14:12:53', '2020-03-26 14:12:53', 'e58be6e6-aea2-403b-a26c-51e4e32da1b1', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(151, 151, 1, '2020-03-26 07:14:31', '2020-03-26 14:14:31', '2020-03-26 14:14:31', '20ed2125-8609-42d2-9bde-0eedc8dc934f', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(152, 152, 1, '2020-03-26 07:33:40', '2020-03-26 14:33:40', '2020-03-26 14:33:40', 'dac4cf4d-954a-42c1-9148-80ca0e7b6cd6', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(153, 153, 1, '2020-03-26 07:38:18', '2020-03-26 14:38:18', '2020-03-26 14:38:18', '589388ae-68c4-4e62-8366-01db168100ec', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(154, 154, 1, '2020-03-26 07:49:33', '2020-03-26 14:49:33', '2020-03-26 14:49:33', 'b9300a31-e266-4dfa-a4ef-c931b515d430', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(155, 155, 1, '2020-03-26 08:05:44', '2020-03-26 15:05:44', '2020-03-26 15:05:44', 'fe578f98-319d-4428-b2d4-22adf8d15cc9', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(156, 156, 1, '2020-03-26 08:07:38', '2020-03-26 15:07:38', '2020-03-26 15:07:38', '23e10773-9ca4-41b7-8815-19f30fcd61db', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(157, 157, 1, '2020-03-26 08:40:47', '2020-03-26 15:40:47', '2020-03-26 15:40:47', 'e92c35cb-38b2-4875-bfe5-81ab2b47610b', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(158, 158, 1, '2020-03-26 09:15:23', '2020-03-26 16:15:23', '2020-03-26 16:15:23', '9ac66770-5c8d-4b70-a1d7-32cc857278b1', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(159, 159, 1, '2020-03-26 09:46:22', '2020-03-26 16:46:22', '2020-03-26 16:46:22', '875d6f7b-051e-4c88-be08-e13f431e0b04', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(160, 160, 1, '2020-03-26 13:20:49', '2020-03-26 20:20:49', '2020-03-26 20:20:49', 'b655bf4f-5ff2-40a5-a336-4186c3ffb7d4', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(161, 161, 1, '2020-03-26 15:53:56', '2020-03-26 22:53:56', '2020-03-26 22:53:56', '30107285-5907-4270-a2f2-7c5efe264c20', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(162, 162, 1, '2020-03-26 15:55:13', '2020-03-26 22:55:13', '2020-03-26 22:55:13', '712846db-1f2a-4ed2-aca9-46d9fb0e284c', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(163, 163, 1, '2020-03-26 16:11:43', '2020-03-26 23:11:43', '2020-03-26 23:11:43', 'a6b80909-d65b-4e80-9336-750b901402f5', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(164, 164, 1, '2020-03-26 16:21:26', '2020-03-26 23:21:26', '2020-03-26 23:21:26', '414e9500-4795-450b-a414-b50337af9226', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(165, 165, 1, '2020-03-26 16:23:38', '2020-03-26 23:23:38', '2020-03-26 23:23:38', 'a2c8966e-e060-4990-b8e1-50de8963e516', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(166, 166, 1, '2020-03-26 16:24:33', '2020-03-26 23:24:33', '2020-03-26 23:24:33', '179ede03-4ae7-4e5c-bfce-65f4e320ec8d', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(167, 167, 1, '2020-03-26 16:25:10', '2020-03-26 23:25:10', '2020-03-26 23:25:10', '991caed7-4ea0-4af2-b795-98378df1687e', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(168, 168, 1, '2020-03-26 16:26:42', '2020-03-26 23:26:42', '2020-03-26 23:26:42', 'f402339a-3bff-412b-8a8d-cf444dedaee3', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(169, 169, 1, '2020-03-26 16:27:40', '2020-03-26 23:27:40', '2020-03-26 23:27:40', '65029795-acdd-4a5b-b38f-e5ec01211588', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(170, 170, 1, '2020-03-26 16:29:55', '2020-03-26 23:29:55', '2020-03-26 23:29:55', 'f4b02eb9-5a08-4950-93cf-01cef8e89ab3', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(171, 171, 1, '2020-03-26 16:33:46', '2020-03-26 23:33:46', '2020-03-26 23:33:46', '6509e5f9-ff4d-4f7c-8e7e-44395b0cf5d3', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(172, 172, 1, '2020-03-26 16:50:40', '2020-03-26 23:50:40', '2020-03-26 23:50:40', '61b6af13-6529-45b6-9b69-380fc9de5031', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(173, 173, 1, '2020-03-26 18:16:15', '2020-03-27 01:16:15', '2020-03-27 01:16:15', 'ead45e60-70f2-414c-b287-901b2587a374', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(174, 174, 1, '2020-03-27 08:19:57', '2020-03-27 15:19:57', '2020-03-27 15:19:57', '674813eb-c6d1-47de-86a2-0e9e30367158', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(175, 175, 1, '2020-03-27 08:27:52', '2020-03-27 15:27:52', '2020-03-27 15:27:52', 'a9c5d0b1-b11f-445e-87b0-847da553e34d', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deprecationerrors`
--

INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'ElementQuery::getIterator()', 'C:\\xampp\\htdocs\\MATS\\templates\\jobs\\listings.twig:20', '2020-03-26 17:09:25', 'C:\\xampp\\htdocs\\MATS\\templates\\jobs\\listings.twig', 20, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\elements\\\\db\\\\ElementQuery.php\",\"line\":558,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\storage\\\\runtime\\\\compiled_templates\\\\f7\\\\f77188ac0adc99f0d04a7648b0a37015e1fbd72b3a8e544e91761a1335511970.php\",\"line\":71,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_ba4f45b995a0ccdc4b8929da0afa3beaf8b0f2244bce5ca6e6292c8218e6e29a\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":407,\"class\":\"__TwigTemplate_ba4f45b995a0ccdc4b8929da0afa3beaf8b0f2244bce5ca6e6292c8218e6e29a\",\"method\":\"doDisplay\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], []\"},{\"objectClass\":\"__TwigTemplate_ba4f45b995a0ccdc4b8929da0afa3beaf8b0f2244bce5ca6e6292c8218e6e29a\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, \\\"SORT_ASC\\\" => 4, \\\"SORT_DESC\\\" => 3, ...], []\"},{\"objectClass\":\"__TwigTemplate_ba4f45b995a0ccdc4b8929da0afa3beaf8b0f2244bce5ca6e6292c8218e6e29a\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\vendor\\\\twig\\\\twig\\\\src\\\\Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[]\"},{\"objectClass\":\"__TwigTemplate_ba4f45b995a0ccdc4b8929da0afa3beaf8b0f2244bce5ca6e6292c8218e6e29a\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\vendor\\\\twig\\\\twig\\\\src\\\\TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\vendor\\\\twig\\\\twig\\\\src\\\\Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":397,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"jobs/listings\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\View.php\",\"line\":458,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"jobs/listings\\\", []\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":235,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"jobs/listings\\\", [], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\controllers\\\\TemplatesController.php\",\"line\":98,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"jobs/listings\\\", []\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"jobs/listings\\\", []\"},{\"objectClass\":null,\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"jobs/listings\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"jobs/listings\\\", \\\"p\\\" => \\\"jobs/listings/p2\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Controller.php\",\"line\":178,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"jobs/listings\\\", \\\"p\\\" => \\\"jobs/listings/p2\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"jobs/listings\\\", \\\"p\\\" => \\\"jobs/listings/p2\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":291,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"jobs/listings\\\", \\\"p\\\" => \\\"jobs/listings/p2\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\vendor\\\\yiisoft\\\\yii2\\\\web\\\\Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"jobs/listings\\\", \\\"p\\\" => \\\"jobs/listings/p2\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\vendor\\\\craftcms\\\\cms\\\\src\\\\web\\\\Application.php\",\"line\":276,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\vendor\\\\yiisoft\\\\yii2\\\\base\\\\Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"C:\\\\xampp\\\\htdocs\\\\MATS\\\\web\\\\index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2020-03-26 17:09:25', '2020-03-26 17:09:25', 'a7437d7a-3e9f-41dc-8b05-d863f21ecb10');

-- --------------------------------------------------------

--
-- Table structure for table `drafts`
--

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `elementindexsettings`
--

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2020-03-23 05:11:44', '2020-03-23 05:11:44', NULL, 'dbcc08b3-9d6b-4432-bf34-68ba6a38f235'),
(2, NULL, NULL, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-24 00:51:10', '2020-03-24 00:52:59', NULL, '383d9821-5fa6-4ee6-ac72-f15a2f2de898'),
(3, NULL, 1, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-24 00:51:10', '2020-03-24 00:51:10', NULL, 'dab755a5-0ec1-46f6-96e3-8b36eb233003'),
(4, NULL, 2, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-24 00:52:59', '2020-03-24 00:52:59', NULL, '38d8c1be-6846-4728-815e-742743f98786'),
(5, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2020-03-24 00:53:31', '2020-03-24 20:24:15', NULL, '0cc970e6-235b-4c31-9ee9-959736ff0dad'),
(6, NULL, 3, NULL, 'craft\\elements\\Entry', 1, 0, '2020-03-24 00:53:31', '2020-03-24 00:53:31', NULL, '645f6239-3afd-4da4-bf2a-d91329ed23d1'),
(7, NULL, 4, 1, 'craft\\elements\\Entry', 1, 0, '2020-03-24 20:21:15', '2020-03-24 20:21:15', NULL, '14916778-5ee0-47c6-8a0c-5a3e28c5616e'),
(8, NULL, 5, 1, 'craft\\elements\\Entry', 1, 0, '2020-03-24 20:24:15', '2020-03-24 20:24:15', NULL, 'da9ae733-87a4-46c1-bdaa-8a04ff672f81'),
(9, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:09', '2020-03-25 05:25:09', NULL, 'dd1e0061-6ad5-4651-96eb-848b056303f6'),
(10, NULL, 6, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:09', '2020-03-25 05:25:09', NULL, 'edb8ae32-0f91-4927-b2fa-49708ba02f59'),
(11, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:09', '2020-03-25 05:25:09', NULL, '578ec5bf-77dc-4e12-9f64-b245f4b88b82'),
(12, NULL, 7, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:09', '2020-03-25 05:25:09', NULL, '98133e90-bb5c-4cca-af54-bfb8f2b81bc4'),
(13, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:09', '2020-03-25 05:25:09', NULL, '3cbee14b-ab40-44cf-bd77-ff525a2dce20'),
(14, NULL, 8, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:09', '2020-03-25 05:25:09', NULL, '63ef745d-1041-4e31-9f19-8a0faad6706d'),
(15, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:09', '2020-03-25 05:25:09', NULL, '1400c18f-362b-453d-a63a-118f865ee7b9'),
(16, NULL, 9, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:09', '2020-03-25 05:25:09', NULL, 'fbb5c2d5-7954-4ae1-a5c4-82e08fba65e6'),
(17, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:09', '2020-03-25 05:25:09', NULL, 'e362fdcd-6f10-4f85-9fd7-b222accbafc1'),
(18, NULL, 10, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:09', '2020-03-25 05:25:09', NULL, '524866ef-f6db-4824-a1f3-33dca2c55a25'),
(19, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, 'fc864ac3-07f7-4c1b-8550-f44b38bafb88'),
(20, NULL, 11, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, 'e1b64920-2538-4899-a00b-bcc6e7c953a4'),
(21, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, '60ecb515-5a97-44cf-a8bd-77da29154b77'),
(22, NULL, 12, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, '72396072-f1f7-416e-b79d-d6c1c2ef0721'),
(23, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, '24283010-79a2-4911-a86f-e6d294c4c63e'),
(24, NULL, 13, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, 'ae822e66-555b-426d-88c2-fff462304d7d'),
(25, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, '5fda505a-27bb-4cfd-ba9d-7f1062391561'),
(26, NULL, 14, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, 'ee950714-97e2-4d3b-931c-068d0f037838'),
(27, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, 'eb9f9d7e-40b1-44e0-89e2-835fb9c0d3e5'),
(28, NULL, 15, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, '30a91209-8dd3-4339-ab3c-d35720ef2a63'),
(29, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, 'c7b66acf-b706-4bce-850e-ea60a5880d2b'),
(30, NULL, 16, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, 'b6dde56c-206f-49f2-97b9-6023bd5f0848'),
(31, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, '8f308c33-522c-40bf-9461-1c8882539ad3'),
(32, NULL, 17, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, '35bbfa99-b392-4de3-8f1c-edeca2823db2'),
(33, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, 'b4c2d2db-e9f1-4932-bd2a-b7ee095f7a81'),
(34, NULL, 18, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, '31c9c60b-9843-4348-a6f1-cd9e40785a6d'),
(35, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, 'd1eeabb2-c8f8-4eba-86ed-c75a01879de3'),
(36, NULL, 19, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, '924d9227-d6fa-4e53-8214-7d1eb141b462'),
(37, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, '4ce2fce7-8832-4027-8c60-a3b52c2b33f6'),
(38, NULL, 20, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, 'fca53d81-7f30-42d8-a251-b2f4da21db03'),
(39, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, 'f7d375fa-d711-49d5-9fcc-b0b3f7723a7a'),
(40, NULL, 21, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, 'a647a380-7d05-4b27-b01c-b88d37af1a16'),
(41, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, '52a10ee2-4d43-4f54-ae15-cb50c0e2f170'),
(42, NULL, 22, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, '7bc109d6-13f7-46e1-8250-ce4544b4eae0'),
(43, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, '883a3135-1398-47f3-8215-051cd7182591'),
(44, NULL, 23, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, 'ad23569f-201a-45c9-8d14-6da11dcf5e2a'),
(45, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, 'f946b361-0099-4c53-bdae-c31d1101122b'),
(46, NULL, 24, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, 'e8de00d9-be91-4fcf-be22-ee25e1478801'),
(47, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, '805adba8-d95a-42da-b0e2-a7c48e7a7b2a'),
(48, NULL, 25, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, '75a83320-8ce4-4dea-8e1f-c91377647ca5'),
(49, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, '72eb5114-dcd4-4226-9737-6208a96611c5'),
(50, NULL, 26, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:10', '2020-03-25 05:25:10', NULL, 'b3201fad-9c19-41ab-a992-e16ebf5eba89'),
(51, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:11', '2020-03-25 05:25:11', NULL, '44d5ee43-b86e-4f21-9299-0e5880ec4358'),
(52, NULL, 27, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:11', '2020-03-25 05:25:11', NULL, '61c0e724-a3e7-4357-938f-e0fa4ba27f65'),
(53, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:11', '2020-03-25 05:25:11', NULL, '88751b02-c58d-4610-9df7-105bf875a5b8'),
(54, NULL, 28, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:11', '2020-03-25 05:25:11', NULL, '78e1919f-1688-4e64-909c-143ebf870034'),
(55, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:11', '2020-03-25 05:25:11', NULL, 'd0bf9c72-d3f4-4fcc-bb07-258ff3a84ca9'),
(56, NULL, 29, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:11', '2020-03-25 05:25:11', NULL, '4ed05b33-d522-4d58-96f8-c120c61b591f'),
(57, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:11', '2020-03-25 05:25:11', NULL, 'fbd9d4a8-00c4-415f-a5c6-00d84807a6bf'),
(58, NULL, 30, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:11', '2020-03-25 05:25:11', NULL, 'ca8fa37d-6353-4c92-a41c-9ccbc65ebf25'),
(59, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:11', '2020-03-25 05:25:11', NULL, 'b6160f5b-7376-4eed-8574-b8dc7a117df5'),
(60, NULL, 31, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:11', '2020-03-25 05:25:11', NULL, '537651dd-a446-4401-a388-13d930fd7912'),
(61, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:11', '2020-03-25 05:25:11', NULL, '1f6c17bd-a26d-4ed4-9710-279132702ccd'),
(62, NULL, 32, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:11', '2020-03-25 05:25:11', NULL, '89f1c92d-5a27-4ac2-a06d-0a3cb4eaea2b'),
(63, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:11', '2020-03-25 05:25:11', NULL, '731935c0-b18f-4b93-bd55-66940a74e326'),
(64, NULL, 33, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:25:11', '2020-03-25 05:25:11', NULL, '3a6832ae-6a6d-42f7-8103-1ec25ae0468d'),
(65, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:37:59', '2020-03-25 05:39:04', NULL, '09920342-0e89-427c-be40-7e11a98cda53'),
(66, NULL, 34, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:37:59', '2020-03-25 05:37:59', NULL, 'c4dc1ab6-bc3c-424c-8daf-3c59da34007c'),
(67, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:37:59', '2020-03-25 05:39:04', NULL, 'dfae80c3-f07b-4a91-978a-8abd977030c1'),
(68, NULL, 35, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:37:59', '2020-03-25 05:37:59', NULL, 'b81eb2a5-9acf-4a52-b6a6-32c12997dcdc'),
(69, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:37:59', '2020-03-25 05:39:05', NULL, '3deecf5f-8fed-4f5a-8fd2-aa3649939510'),
(70, NULL, 36, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:37:59', '2020-03-25 05:37:59', NULL, '63b8ae1e-41d6-4305-a30b-45661a5dea77'),
(71, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:37:59', '2020-03-25 05:39:05', NULL, 'ad9671f9-4bb7-46b6-964b-15b6673bfc4c'),
(72, NULL, 37, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:37:59', '2020-03-25 05:37:59', NULL, 'befbc483-aa3e-4b11-9a59-6b45339385c3'),
(73, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:37:59', '2020-03-25 05:39:05', NULL, 'c5b35a1b-108a-4de3-8894-d842f4bc9eee'),
(74, NULL, 38, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:37:59', '2020-03-25 05:37:59', NULL, '67fe7183-545a-4485-9d9b-443d4d71b5c2'),
(75, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 05:39:05', NULL, '077a1a87-5170-4bef-b881-aaace4e11932'),
(76, NULL, 39, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 05:38:00', NULL, '9951ad8a-f75d-44fa-b32e-0e1cf62bf734'),
(77, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 05:39:05', NULL, 'eb3ab12b-92b6-4610-8dd3-5c084edb983e'),
(78, NULL, 40, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 05:38:00', NULL, 'bb48991f-8da2-43bd-9383-c34bb733cf1d'),
(79, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 15:21:15', NULL, '4dd8fe20-8a6a-48ce-9a12-24214be0f8e8'),
(80, NULL, 41, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 05:38:00', NULL, 'cad7193a-5d2b-420e-b242-72d751671cc1'),
(81, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 05:39:05', NULL, 'f855813f-f184-4378-8b4d-36307def366d'),
(82, NULL, 42, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 05:38:00', NULL, '69e6f67c-5060-43ba-aa7e-ccef294f182c'),
(83, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 05:39:06', NULL, '60762664-b750-48dc-aab2-716fddd93853'),
(84, NULL, 43, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 05:38:00', NULL, 'b41b27b3-7a0b-4746-99e1-7fcdfbfe6a01'),
(85, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 05:39:06', NULL, '4a35c1b8-a78c-4080-b65a-a771167547d2'),
(86, NULL, 44, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 05:38:00', NULL, 'e5ef1c8e-6c85-4934-9450-7863bc1f823e'),
(87, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 05:39:06', NULL, '0d4b9a3a-83dd-489a-a510-2067662b30f6'),
(88, NULL, 45, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 05:38:00', NULL, '4fcd476b-1b96-4303-bca4-3e986d02ae44'),
(89, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 05:39:06', NULL, 'edefccd0-d7e4-4cd6-b369-ecffa6789825'),
(90, NULL, 46, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 05:38:00', NULL, '0400eeb8-8e58-4e31-8a06-0131434179ca'),
(91, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 05:39:06', NULL, '131087a2-2bcb-4092-bd71-86a5fedece0f'),
(92, NULL, 47, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 05:38:00', NULL, '7790f494-e80e-4d52-ad0d-d27c89dc5423'),
(93, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 05:39:06', NULL, '85bacf4b-c7a6-4ce8-9a59-4ec9e4b4d015'),
(94, NULL, 48, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:00', '2020-03-25 05:38:00', NULL, '27840df0-7d8e-407e-bdb4-8304fcc533de'),
(95, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:01', '2020-03-25 05:39:07', NULL, '43bebf48-d4c9-47b6-9c99-53208733de44'),
(96, NULL, 49, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:01', '2020-03-25 05:38:01', NULL, 'bb1e9978-53e7-43e5-b1b2-907d63a3c5e3'),
(97, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:01', '2020-03-25 05:39:07', NULL, '12850ac8-cbd1-43e5-a3e7-297a6ee93f7e'),
(98, NULL, 50, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:01', '2020-03-25 05:38:01', NULL, 'cc9f3778-3b90-4af1-b220-72a442a9b927'),
(99, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:01', '2020-03-25 05:39:07', NULL, '874df389-a238-4c3e-8a29-ea331ffb4a72'),
(100, NULL, 51, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:01', '2020-03-25 05:38:01', NULL, 'c22059a3-cd12-49ce-8f6c-eec3e6b2371a'),
(101, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:01', '2020-03-25 05:39:07', NULL, '78b6bd75-8ca4-49d8-acc1-4b2ea419bb89'),
(102, NULL, 52, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:01', '2020-03-25 05:38:01', NULL, '451591d3-9e4a-44b7-9284-2c381c1235c1'),
(103, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:01', '2020-03-25 05:39:07', NULL, '7cf43dfa-4c28-41ae-8d92-67f0f3dd197c'),
(104, NULL, 53, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:01', '2020-03-25 05:38:01', NULL, 'a6869b0f-7345-4767-972f-57a60702797c'),
(105, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:01', '2020-03-25 05:39:07', NULL, '785c2b96-12b0-4487-8cf5-ca06e6e74b0a'),
(106, NULL, 54, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:01', '2020-03-25 05:38:01', NULL, '5317c891-962e-4d75-8328-345f0b2e12ab'),
(107, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:01', '2020-03-25 05:39:08', NULL, '2b53ded5-9242-4bc0-8eae-42875e2ff8fb'),
(108, NULL, 55, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:01', '2020-03-25 05:38:01', NULL, '14e905d4-f7c6-487b-a65e-5075440dd7b1'),
(109, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:02', '2020-03-25 05:39:08', NULL, 'c57a0d91-f93c-4a8f-8ee5-c9099eb4ce3f'),
(110, NULL, 56, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:02', '2020-03-25 05:38:02', NULL, '116de668-cac4-4503-b372-7ecee6c8f738'),
(111, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:02', '2020-03-25 05:39:08', NULL, '4a2753b6-33d0-4ea2-81fa-566c24284da5'),
(112, NULL, 57, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:02', '2020-03-25 05:38:02', NULL, '19c9b307-1dba-4359-b697-78e3736ed016'),
(113, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:02', '2020-03-25 05:39:08', NULL, '0c3236ab-198a-4257-acf4-018fa1f0f07b'),
(114, NULL, 58, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:02', '2020-03-25 05:38:02', NULL, '1d895098-20cc-41a3-b340-b7bec3fd562b'),
(115, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:02', '2020-03-25 05:39:08', NULL, '040d4364-8908-4eb5-9cbf-bd541322f731'),
(116, NULL, 59, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:02', '2020-03-25 05:38:02', NULL, 'c8afe823-d5d3-41cd-8bff-20556091f284'),
(117, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:02', '2020-03-25 05:39:09', NULL, '73a60eaf-3c90-4f2c-8763-db6cab0f7aea'),
(118, NULL, 60, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:02', '2020-03-25 05:38:02', NULL, '16c399f7-fe25-4fd2-b990-65b7550f7f05'),
(119, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:02', '2020-03-25 05:39:09', NULL, '70efe44b-6c2c-40cd-83ea-3f9fc61eccd9'),
(120, NULL, 61, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:38:02', '2020-03-25 05:38:02', NULL, '952a00a9-699a-4512-9809-2fe0b9af770b'),
(121, NULL, 62, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:04', '2020-03-25 05:39:04', NULL, '755490a9-6fdc-4228-99b5-456c5b43651c'),
(122, NULL, 63, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:04', '2020-03-25 05:39:04', NULL, '09659542-8386-4ce5-9e4a-bd4ab5931213'),
(123, NULL, 64, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:05', '2020-03-25 05:39:05', NULL, '240a39f1-bd6e-46f7-a228-7642a47d3d15'),
(124, NULL, 65, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:05', '2020-03-25 05:39:05', NULL, '687b90e0-95df-4b62-9bbd-0dff143d320f'),
(125, NULL, 66, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:05', '2020-03-25 05:39:05', NULL, '309cb979-6490-437f-a195-8b685b272d76'),
(126, NULL, 67, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:05', '2020-03-25 05:39:05', NULL, '2091321c-e8ae-4675-bf84-63353c0179a8'),
(127, NULL, 68, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:05', '2020-03-25 05:39:05', NULL, '6c2fdca4-c497-419f-9adb-a2deee670652'),
(128, NULL, 69, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:05', '2020-03-25 05:39:05', NULL, 'b231fc12-0a1e-4dac-bc10-155761af3467'),
(129, NULL, 70, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:05', '2020-03-25 05:39:05', NULL, 'c83c7144-d831-48d5-a643-578043352ffd'),
(130, NULL, 71, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:06', '2020-03-25 05:39:06', NULL, '3ff992c1-dc72-4ef0-9e6b-ffeef2878d48'),
(131, NULL, 72, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:06', '2020-03-25 05:39:06', NULL, '8bcd59a2-0925-441a-9d46-6d7606fe7a76'),
(132, NULL, 73, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:06', '2020-03-25 05:39:06', NULL, 'd2278374-f089-4c65-a9be-525f50ab5580'),
(133, NULL, 74, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:06', '2020-03-25 05:39:06', NULL, '37e311f5-0e97-44a9-950c-887124bcab05'),
(134, NULL, 75, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:06', '2020-03-25 05:39:06', NULL, '07a1526c-27dd-4075-badc-4992f1d972ba'),
(135, NULL, 76, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:06', '2020-03-25 05:39:06', NULL, '0e5c812a-cad5-4ecd-99a1-d0d4f489fbc4'),
(136, NULL, 77, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:07', '2020-03-25 05:39:07', NULL, '0c2e6e87-52de-47d8-9bba-d91f383f9d1c'),
(137, NULL, 78, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:07', '2020-03-25 05:39:07', NULL, '5414547a-3a27-4b65-8c41-4c376af482b8'),
(138, NULL, 79, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:07', '2020-03-25 05:39:07', NULL, '9b4316fb-f4c1-4c8f-8354-a90d1029cdba'),
(139, NULL, 80, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:07', '2020-03-25 05:39:07', NULL, '176f9594-805f-42a2-b92a-a987a0dacde9'),
(140, NULL, 81, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:07', '2020-03-25 05:39:07', NULL, '86cfea01-16f5-49d9-9ab2-5f4f1155688e'),
(141, NULL, 82, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:07', '2020-03-25 05:39:07', NULL, '64a29143-58c6-4dcc-9e8f-f91683bf47ec'),
(142, NULL, 83, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:08', '2020-03-25 05:39:08', NULL, '9aa714ec-db8b-4fc4-b8d9-3ef1135ed25e'),
(143, NULL, 84, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:08', '2020-03-25 05:39:08', NULL, '21c9edde-dbc8-4d17-b18a-8df05cf74e0b'),
(144, NULL, 85, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:08', '2020-03-25 05:39:08', NULL, 'e51a6948-f560-4c66-9634-9e99652e202a'),
(145, NULL, 86, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:08', '2020-03-25 05:39:08', NULL, '9c8879f4-fc7f-4a9a-9696-545df3a6c28d'),
(146, NULL, 87, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:08', '2020-03-25 05:39:08', NULL, '97a4460b-bb48-4df8-8a43-eceb0d402416'),
(147, NULL, 88, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:09', '2020-03-25 05:39:09', NULL, '0a171023-cce2-408e-a94a-9a781fbffb48'),
(148, NULL, 89, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 05:39:09', '2020-03-25 05:39:09', NULL, '243dbe95-4450-4dca-891f-b2c73beb6eff'),
(149, NULL, 90, 2, 'craft\\elements\\Entry', 1, 0, '2020-03-25 15:21:15', '2020-03-25 15:21:15', NULL, '8f2deb12-14d6-4257-848d-b2776ffa1e81'),
(150, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 14:12:53', '2020-03-26 14:12:53', NULL, '91e9c134-f063-4d44-aea4-ba8fa58129d2'),
(151, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 14:14:31', '2020-03-26 14:14:31', NULL, 'c996c8c5-14a0-4f1c-9932-902a2c0f9c5c'),
(152, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 14:33:40', '2020-03-26 14:33:40', NULL, 'c8bf63ab-8f7c-4763-a8ed-5acb38aa8300'),
(153, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 14:38:18', '2020-03-26 14:38:18', NULL, 'cf935091-0007-401c-9737-2314f6b3bd51'),
(154, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 14:49:33', '2020-03-26 14:49:33', NULL, '2c04e95f-c2a6-4ea9-b641-5166025b5258'),
(155, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 15:05:44', '2020-03-26 15:05:44', NULL, '7a4117a1-f846-4c5a-bd94-a51143e12b92'),
(156, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 15:07:38', '2020-03-26 15:07:38', NULL, '2b8e479d-ecda-41b8-99bd-430151fe5c28'),
(157, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 15:40:47', '2020-03-26 15:40:47', NULL, 'e307ccbe-1996-408b-9e38-2091c6276108'),
(158, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 16:15:23', '2020-03-26 16:15:23', NULL, 'd1202e4c-116f-4445-a323-9cbbb063e2be'),
(159, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 16:46:22', '2020-03-26 16:46:22', NULL, '3f5ba241-9d52-43f9-b38a-28747dad2289'),
(160, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 20:20:49', '2020-03-26 20:20:49', NULL, 'a3f41c1e-fa35-4b92-906e-1a2e3cc1ec8e'),
(161, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 22:53:56', '2020-03-26 22:53:56', NULL, '2f09f60f-0eee-486f-afe4-bf4227eb25b0'),
(162, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 22:55:13', '2020-03-26 22:55:13', NULL, '4996df2d-86b3-401f-83b1-0964c7c07ae6'),
(163, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 23:11:43', '2020-03-26 23:11:43', NULL, '0f69d7a8-ea29-4bfa-a246-d0222c332abf'),
(164, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 23:21:26', '2020-03-26 23:21:26', NULL, '03c84abc-ba81-4a04-9b8f-c220c7710dfc'),
(165, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 23:23:38', '2020-03-26 23:23:38', NULL, '2ecb6af8-ac1d-4930-bdeb-c4d7215494eb'),
(166, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 23:24:33', '2020-03-26 23:24:33', NULL, '3def5ec9-ffb1-4042-9d44-9470d53cfbab'),
(167, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 23:25:10', '2020-03-26 23:25:10', NULL, '909a478c-d7f5-4dba-855b-4116b134af8e'),
(168, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 23:26:42', '2020-03-26 23:26:42', NULL, '561e5f4e-89ec-4afb-a58f-b1a36b959be2'),
(169, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 23:27:40', '2020-03-26 23:27:40', NULL, '0ee1ea44-5fb7-4477-ba75-55b77b2a0a9b'),
(170, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 23:29:55', '2020-03-26 23:29:55', NULL, 'c3aae8dc-1e61-4fff-9753-dddfc83b1d7c'),
(171, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 23:33:46', '2020-03-26 23:33:46', NULL, '8b319448-7a29-45bb-b878-d3af0c177452'),
(172, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-26 23:50:40', '2020-03-26 23:50:40', NULL, '7acc7276-c51d-4799-b1c9-63b9ddf97201'),
(173, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-27 01:16:15', '2020-03-27 01:16:15', NULL, '04d7fbf8-6925-4035-8e4f-faae2e92fc43'),
(174, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-27 15:19:57', '2020-03-27 15:19:57', NULL, '24fc5451-4dfc-4130-8830-3ec1ce2717f5'),
(175, NULL, NULL, NULL, 'Solspace\\Freeform\\Elements\\Submission', 1, 0, '2020-03-27 15:27:52', '2020-03-27 15:27:52', NULL, '7395f313-8de5-4ce3-a1a6-9cdcf124a893');

-- --------------------------------------------------------

--
-- Table structure for table `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2020-03-23 05:11:44', '2020-03-23 05:11:44', 'dfc129dc-bfa3-43be-bf26-46e2e0fe76b2'),
(2, 2, 1, 'home', '__home__', 1, '2020-03-24 00:51:10', '2020-03-24 00:51:10', 'd5e7d3df-f880-4565-81a6-8146caaf37ee'),
(3, 3, 1, 'home', '__home__', 1, '2020-03-24 00:51:10', '2020-03-24 00:51:10', '42f3b1c7-85ec-4621-badc-4980bf9d12c5'),
(4, 4, 1, 'home', '__home__', 1, '2020-03-24 00:52:59', '2020-03-24 00:52:59', 'cdfb2818-cc9a-4686-9f36-3dafae1b5100'),
(5, 5, 1, 'jobs-index', 'jobs', 1, '2020-03-24 00:53:31', '2020-03-24 00:53:31', 'c2bed3d6-da72-46d9-90da-6b4799004ad8'),
(6, 6, 1, 'jobs-index', 'jobs', 1, '2020-03-24 00:53:31', '2020-03-24 00:53:31', '4db9c2d7-fc71-4e53-b70b-ddc9e0d98b91'),
(7, 7, 1, 'jobs-index', 'jobs', 1, '2020-03-24 20:21:15', '2020-03-24 20:21:15', '6adde540-ebcc-4225-b5f0-2bff2df7e194'),
(8, 8, 1, 'jobs-index', 'jobs', 1, '2020-03-24 20:24:15', '2020-03-24 20:24:15', '6b50af38-3cb3-4c83-971e-b7f691bb2da9'),
(9, 9, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay', 1, '2020-03-25 05:25:09', '2020-03-25 05:25:09', 'e15c597f-1574-4fd0-82d5-c9b2eb2414b8'),
(10, 10, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay', 1, '2020-03-25 05:25:09', '2020-03-25 05:25:09', '1ed5c14e-19aa-4854-93de-62ce1c09f9d0'),
(11, 11, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-1', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-1', 1, '2020-03-25 05:25:09', '2020-03-25 05:25:09', 'f249deea-da66-464c-b5fd-44ba113860b5'),
(12, 12, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-1', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-1', 1, '2020-03-25 05:25:09', '2020-03-25 05:25:09', '6b1cd829-a95f-4fb8-93b3-f7b4492fbb6e'),
(13, 13, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-2', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-2', 1, '2020-03-25 05:25:09', '2020-03-25 05:25:09', 'a63147c7-266d-49fa-93ce-3e250585d5ea'),
(14, 14, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-2', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-2', 1, '2020-03-25 05:25:09', '2020-03-25 05:25:09', 'e3a2fdf4-6267-442d-8a68-c2d2a374543c'),
(15, 15, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-3', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-3', 1, '2020-03-25 05:25:09', '2020-03-25 05:25:09', 'e883e9b6-6b3c-4e6f-927f-566f6d6c1124'),
(16, 16, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-3', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-3', 1, '2020-03-25 05:25:09', '2020-03-25 05:25:09', 'd779c0a0-46cc-4ee5-8e45-0bae02af2b0b'),
(17, 17, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-4', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-4', 1, '2020-03-25 05:25:09', '2020-03-25 05:25:09', 'd0cc2437-8aa6-41f6-ae8d-bd0bb0b2f2d8'),
(18, 18, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-4', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-4', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'de37aebb-a166-4f25-883b-5f517d137c7c'),
(19, 19, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-5', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-5', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '6aa74cb4-a793-4a20-b0c0-0286803c9bcb'),
(20, 20, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-5', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-5', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '6c367e35-d45e-41f1-8a2e-8ef583145bf5'),
(21, 21, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-6', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-6', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '1f78853c-fc28-4d67-a196-36dd4ce76ea1'),
(22, 22, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-6', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-6', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '12035ed0-abce-4678-887c-8b58f620727c'),
(23, 23, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-7', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-7', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'c05799a1-fd2a-4ece-b3d1-d514bd0cab41'),
(24, 24, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-7', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-7', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '60017a50-5bda-481d-bb04-dccf88b2ec25'),
(25, 25, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-8', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-8', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'f951caae-d6db-4a20-b9bf-defce5caf762'),
(26, 26, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-8', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-8', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'ac4acda5-772d-4baa-b092-0ebb8347f4dc'),
(27, 27, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-9', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-9', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '172c3e44-476e-49c7-be45-c42fc248dcf5'),
(28, 28, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-9', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-9', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'd84eea5c-01d6-4a22-8bfe-2f1cc8ef245d'),
(29, 29, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-10', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-10', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'cf57580d-cc6c-4936-b8d9-932c31db6c45'),
(30, 30, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-10', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-10', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '90016e9e-d6d3-4a4d-a853-cab5367b7fbd'),
(31, 31, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-11', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-11', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '8fef669a-d804-4d6d-9105-ee7386d62a3b'),
(32, 32, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-11', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-11', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '2280b9f0-0559-4717-a7eb-f5aac9516c3a'),
(33, 33, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-12', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-12', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'f45e775c-7041-4393-a1de-342ebd4af856'),
(34, 34, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-12', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-12', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'a8762a55-36c2-4cba-88eb-34dbef3481c7'),
(35, 35, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-13', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-13', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '26decd2c-cb44-4f5f-b0b1-35263e883c19'),
(36, 36, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-13', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-13', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '34b2b1f4-3bbe-4d62-8872-c7b019da65ac'),
(37, 37, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-14', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-14', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '2136870b-72ec-4f41-8da3-dcf4639af69c'),
(38, 38, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-14', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-14', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '5a8e5003-ebe4-472c-88e6-a146f7ccb159'),
(39, 39, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-15', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-15', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'cde5380f-c5ea-4d25-94d3-2a18120b6f7a'),
(40, 40, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-15', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-15', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '4f4bf057-b7fb-4562-ab97-9a3b94edacdb'),
(41, 41, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-16', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-16', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '2f930d77-838b-45d3-8a3f-bd7171cd6c3c'),
(42, 42, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-16', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-16', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '027c65fd-f862-4c27-937c-395042ddb08c'),
(43, 43, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-17', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-17', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '265ce223-6945-4c56-b892-dc59763dea84'),
(44, 44, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-17', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-17', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '452254b5-58bc-4ca7-b6bc-b8c4bb2df5fa'),
(45, 45, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-18', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-18', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '06fb0efe-2549-46da-9707-52e359d7d7d2'),
(46, 46, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-18', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-18', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'baca2878-ed9a-47ee-a7f4-1b50799c63ef'),
(47, 47, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-19', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-19', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'c719859f-90ba-459f-93a5-0ac3a0edeecd'),
(48, 48, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-19', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-19', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '8a860a1c-58c1-4d52-a9e3-ed2562d41e93'),
(49, 49, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-20', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-20', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'c095bf24-6572-4e37-8e4d-2202a1b3bca6'),
(50, 50, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-20', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-20', 1, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '9449e7f3-bf6e-40a6-80ee-7a5a5cc29fb4'),
(51, 51, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-21', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-21', 1, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '7ff16f60-8525-4048-a09a-bbea158a6dc6'),
(52, 52, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-21', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-21', 1, '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'b24ebdff-9bd5-4f48-806e-a18e748acb57'),
(53, 53, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-22', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-22', 1, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '2bdb739d-c330-4c45-ba5f-29500d097558'),
(54, 54, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-22', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-22', 1, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '293ef45d-4a58-4eab-9ad1-db6539de3cf0'),
(55, 55, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-23', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-23', 1, '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'a26c4bc5-61d9-41d4-9c0c-50f3343142b4'),
(56, 56, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-23', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-23', 1, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '9cdcac99-14c4-4059-9687-fc64366f288a'),
(57, 57, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-24', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-24', 1, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '8225965a-2325-4663-b12f-ce32e7a27545'),
(58, 58, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-24', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-24', 1, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '48e5bf61-85d2-434c-a63d-e5cf6289b30c'),
(59, 59, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-25', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-25', 1, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '3ac92bf8-3096-49e9-a97a-66022741ad44'),
(60, 60, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-25', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-25', 1, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '1b2a0d9b-3c89-4a29-ae97-12e52058b15d'),
(61, 61, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-26', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-26', 1, '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'f9c7eb12-ba0a-49b1-91e2-622296a23440'),
(62, 62, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-26', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-26', 1, '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'b12a4b4a-776c-4ad5-89f2-ca89b684add1'),
(63, 63, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-27', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-27', 1, '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'b2bfdb1c-367a-4741-896d-59302c9167d0'),
(64, 64, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-27', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-27', 1, '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'edb20201-1b2d-4611-ac43-55c8b1f6293f'),
(65, 65, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-28', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-28', 1, '2020-03-25 05:37:59', '2020-03-25 05:37:59', '09c4bb00-31a0-4cb0-9a6c-13c2cb3b818f'),
(66, 66, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-28', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-28', 1, '2020-03-25 05:37:59', '2020-03-25 05:37:59', '5ed8b274-7d30-433a-96f1-5a9cbbf1dbfe'),
(67, 67, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-29', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-29', 1, '2020-03-25 05:37:59', '2020-03-25 05:37:59', '734b2460-3283-4607-a85f-998a19320850'),
(68, 68, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-29', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-29', 1, '2020-03-25 05:37:59', '2020-03-25 05:37:59', '4dbb5fdf-6ae5-458b-b5ef-1d89acb95419'),
(69, 69, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-30', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-30', 1, '2020-03-25 05:37:59', '2020-03-25 05:37:59', '4e5e727e-05ec-4209-a056-132455ac351f'),
(70, 70, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-30', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-30', 1, '2020-03-25 05:37:59', '2020-03-25 05:37:59', '96d73ab6-8193-4b58-bd26-99e07b0b53d9'),
(71, 71, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-31', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-31', 1, '2020-03-25 05:37:59', '2020-03-25 05:37:59', 'b46692b4-107b-4f40-a2c4-c2b1c6963dcf'),
(72, 72, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-31', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-31', 1, '2020-03-25 05:37:59', '2020-03-25 05:37:59', 'f7ff5961-a819-4ca6-9126-58818799865f'),
(73, 73, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-32', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-32', 1, '2020-03-25 05:37:59', '2020-03-25 05:37:59', '1a79b804-0686-4122-ab18-e15b780d7471'),
(74, 74, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-32', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-32', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '0318c5cf-c476-4558-b2d4-3ed13fb4bbe8'),
(75, 75, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-33', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-33', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '766c966f-83e0-45b2-8d41-89f8f552da97'),
(76, 76, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-33', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-33', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '38bd22ab-5562-40a2-9f4c-57d705ca9703'),
(77, 77, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-34', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-34', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '586c05dc-77e1-4a86-8e59-0b773892fbc9'),
(78, 78, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-34', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-34', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'b6fc4059-eaf3-4da1-bc7a-558519662c9e'),
(79, 79, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-35', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-35', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '9462c829-b0d5-4eca-8f11-a98c9f7a6955'),
(80, 80, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-35', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-35', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'c4fe7cde-b321-45b8-b252-7d9702068ddf'),
(81, 81, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-36', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-36', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '9148d329-8a8e-473d-8099-5fd800036576'),
(82, 82, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-36', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-36', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '3782f1c9-347a-465b-a585-3fa585677d95'),
(83, 83, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-37', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-37', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '5ab67a07-8a2f-4e9e-be77-9818b03c302e'),
(84, 84, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-37', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-37', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '89421789-37c4-4b5d-8a53-1c26fe3bd5ab'),
(85, 85, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-38', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-38', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'b4b84ce0-2b21-40b2-8f96-d6f5569a1cfd'),
(86, 86, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-38', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-38', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '3c3904ea-3950-4598-89fa-f16e64be7de3'),
(87, 87, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-39', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-39', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'b0331b89-358f-4526-aed5-2b6b05ea24a1'),
(88, 88, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-39', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-39', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '5184b15b-5241-4651-85e3-6cc965ae1e2f'),
(89, 89, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-40', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-40', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'fcb7a67d-1716-4b9e-8cd7-6f9e67b41677'),
(90, 90, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-40', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-40', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '0fb67d03-1b81-4b09-be75-534fe26c3155'),
(91, 91, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-41', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-41', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'd9ec1307-2dbd-41ef-9294-19e0cbce9c73'),
(92, 92, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-41', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-41', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '3b87d9d3-4204-44cc-b609-52a1ad4fe894'),
(93, 93, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-42', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-42', 1, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '3e2ba6ff-89b6-41b3-bbc7-94ca335eb4b4'),
(94, 94, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-42', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-42', 1, '2020-03-25 05:38:01', '2020-03-25 05:38:01', 'f3a1cff5-e3b1-4ea4-b288-7b184ecc171a'),
(95, 95, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-43', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-43', 1, '2020-03-25 05:38:01', '2020-03-25 05:38:01', 'f03acb8f-8e40-4674-aa0f-05963401abc2'),
(96, 96, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-43', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-43', 1, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '659f9d5c-4c3f-46e5-a532-4dfb2bb86a3f'),
(97, 97, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-44', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-44', 1, '2020-03-25 05:38:01', '2020-03-25 05:38:01', 'b3bebc58-637f-40e5-af4b-3005ca7d6f52'),
(98, 98, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-44', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-44', 1, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '0d5a21cc-a2d4-4367-b40c-f47c36c567b0'),
(99, 99, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-45', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-45', 1, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '2473137e-0872-4d1e-a0b6-6548242f9f80'),
(100, 100, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-45', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-45', 1, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '466f4872-1da5-4c56-bbac-3f69223405b8'),
(101, 101, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-46', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-46', 1, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '46a1f97a-da3b-4b30-bf04-b61dc6e7914c'),
(102, 102, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-46', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-46', 1, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '4f9e6796-2414-444d-9b65-d182767ceec3'),
(103, 103, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-47', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-47', 1, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '383f3972-80c6-441c-918a-ed033c2576d3'),
(104, 104, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-47', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-47', 1, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '9cb323ed-f6db-4610-8994-b68eee73bf63'),
(105, 105, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-48', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-48', 1, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '1af87dcd-0101-40a9-93e3-5ed1e8753229'),
(106, 106, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-48', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-48', 1, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '71c9bf8a-1af6-44f7-ac31-4e0e30e9cedc'),
(107, 107, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-49', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-49', 1, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '9cca10c2-3e66-4e8b-9a53-6661c0b2610d'),
(108, 108, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-49', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-49', 1, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '4acfa29c-5254-4c11-ae8a-1625e80fd236'),
(109, 109, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-50', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-50', 1, '2020-03-25 05:38:02', '2020-03-25 05:38:02', '12b3b31f-a929-40c6-a2f7-ea7676f66b68'),
(110, 110, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-50', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-50', 1, '2020-03-25 05:38:02', '2020-03-25 05:38:02', 'b37c8a50-b96f-4e4d-8c75-de795470be6b'),
(111, 111, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-51', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-51', 1, '2020-03-25 05:38:02', '2020-03-25 05:38:02', 'e6192d3f-0e8a-43de-95b0-b6fccca75beb'),
(112, 112, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-51', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-51', 1, '2020-03-25 05:38:02', '2020-03-25 05:38:02', 'd4e7b642-44f5-4701-8a3b-30dcd543de58'),
(113, 113, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-52', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-52', 1, '2020-03-25 05:38:02', '2020-03-25 05:38:02', '20d9a412-8243-4d2b-80a1-94c4b44a6644'),
(114, 114, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-52', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-52', 1, '2020-03-25 05:38:02', '2020-03-25 05:38:02', 'c552f7c4-b20e-42b2-b532-4dbc3abc9dc6'),
(115, 115, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-53', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-53', 1, '2020-03-25 05:38:02', '2020-03-25 05:38:02', '72e28e86-b8b8-4dc8-9935-043ac99e5d7f'),
(116, 116, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-53', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-53', 1, '2020-03-25 05:38:02', '2020-03-25 05:38:02', '5d43ee42-69ee-45dc-9b5a-2efb6e385957'),
(117, 117, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-54', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-54', 1, '2020-03-25 05:38:02', '2020-03-25 05:38:02', 'bc7c3b14-532b-4843-a316-ccd6ccb97546'),
(118, 118, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-54', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-54', 1, '2020-03-25 05:38:02', '2020-03-25 05:38:02', 'cb81d5f2-385f-4511-b935-d1b45647d3bc'),
(119, 119, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-55', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-55', 1, '2020-03-25 05:38:02', '2020-03-25 05:38:02', '5d24990f-dee9-4157-9d07-feb9a2e4567c'),
(120, 120, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-55', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-55', 1, '2020-03-25 05:38:02', '2020-03-25 05:38:02', 'e9c9a5f8-38a7-4847-bf99-1dbb2c63ffbf'),
(121, 121, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-28', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-28', 1, '2020-03-25 05:39:04', '2020-03-25 05:39:04', 'b14a0166-48c3-4796-b062-23a5b5894335'),
(122, 122, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-29', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-29', 1, '2020-03-25 05:39:04', '2020-03-25 05:39:04', 'e748abb9-1864-4947-a76b-ca625bbe1041'),
(123, 123, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-30', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-30', 1, '2020-03-25 05:39:05', '2020-03-25 05:39:05', 'fd1ba5e3-748d-4b34-a0f4-f16c21483fc5'),
(124, 124, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-31', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-31', 1, '2020-03-25 05:39:05', '2020-03-25 05:39:05', '8b397502-c9ad-489a-afe7-9b1e045f00c1'),
(125, 125, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-32', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-32', 1, '2020-03-25 05:39:05', '2020-03-25 05:39:05', '12d1a82e-cb7a-4822-8917-f965bd4d3848'),
(126, 126, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-33', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-33', 1, '2020-03-25 05:39:05', '2020-03-25 05:39:05', 'a15db0fe-3ecb-45f9-af42-17950c9f1df3'),
(127, 127, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-34', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-34', 1, '2020-03-25 05:39:05', '2020-03-25 05:39:05', '067e1aec-ac24-4a8a-95b6-06418b593e58'),
(128, 128, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-35', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-35', 1, '2020-03-25 05:39:05', '2020-03-25 05:39:05', '39c5365f-a46f-4d11-9fa9-26a8993a24ea'),
(129, 129, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-36', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-36', 1, '2020-03-25 05:39:05', '2020-03-25 05:39:05', 'fb800c6d-9492-4d4c-a79d-870dd799de5f'),
(130, 130, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-37', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-37', 1, '2020-03-25 05:39:06', '2020-03-25 05:39:06', 'c824314f-99be-484b-8f5b-774ce5e7c275'),
(131, 131, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-38', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-38', 1, '2020-03-25 05:39:06', '2020-03-25 05:39:06', '35ca4771-ee1d-4938-a02f-80ea65111c62'),
(132, 132, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-39', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-39', 1, '2020-03-25 05:39:06', '2020-03-25 05:39:06', '61bebe43-b06a-4361-859e-cbeaf6fc6687'),
(133, 133, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-40', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-40', 1, '2020-03-25 05:39:06', '2020-03-25 05:39:06', 'e5801bcd-362b-45b3-9cb4-03d8e4032835'),
(134, 134, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-41', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-41', 1, '2020-03-25 05:39:06', '2020-03-25 05:39:06', 'b07e167c-4ef5-4b5b-9a98-c7a74471f5be'),
(135, 135, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-42', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-42', 1, '2020-03-25 05:39:06', '2020-03-25 05:39:06', '39ef86e5-54ac-49d8-bcf3-b369a67080fc'),
(136, 136, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-43', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-43', 1, '2020-03-25 05:39:07', '2020-03-25 05:39:07', 'cf362076-6235-4d1a-bbde-11ef629b4a5b'),
(137, 137, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-44', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-44', 1, '2020-03-25 05:39:07', '2020-03-25 05:39:07', '5987c36c-0d38-43ad-8a93-8ee93ca220ee'),
(138, 138, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-45', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-45', 1, '2020-03-25 05:39:07', '2020-03-25 05:39:07', '30405519-e756-4f52-b967-a57219bfee90'),
(139, 139, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-46', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-46', 1, '2020-03-25 05:39:07', '2020-03-25 05:39:07', '4a5492bf-4d2d-456c-b0dc-c042e4d0cab1'),
(140, 140, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-47', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-47', 1, '2020-03-25 05:39:07', '2020-03-25 05:39:07', '54e8acc1-13ad-4ffa-8d8d-be5da383483d'),
(141, 141, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-48', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-48', 1, '2020-03-25 05:39:07', '2020-03-25 05:39:07', '229fa77b-079b-4c89-b267-a3d13148381b'),
(142, 142, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-49', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-49', 1, '2020-03-25 05:39:08', '2020-03-25 05:39:08', '29d36b07-8683-40c9-aebc-4fab0c1f6a71'),
(143, 143, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-50', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-50', 1, '2020-03-25 05:39:08', '2020-03-25 05:39:08', '524d5613-6bb3-49a3-9be5-117de4b3f344'),
(144, 144, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-51', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-51', 1, '2020-03-25 05:39:08', '2020-03-25 05:39:08', 'ce8d67da-8e5e-4e35-9d1f-b5dea61b7b9b'),
(145, 145, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-52', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-52', 1, '2020-03-25 05:39:08', '2020-03-25 05:39:08', '7e42a58c-5904-4b68-8b57-12cd3fa27ded'),
(146, 146, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-53', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-53', 1, '2020-03-25 05:39:08', '2020-03-25 05:39:08', '368a4d9c-6bb2-4ee8-abdb-fd2550fe058f'),
(147, 147, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-54', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-54', 1, '2020-03-25 05:39:09', '2020-03-25 05:39:09', '07cb81b4-e900-4664-9c83-515dc9e6ceb0'),
(148, 148, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-55', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-55', 1, '2020-03-25 05:39:09', '2020-03-25 05:39:09', '376bb99f-f086-45d4-a4e8-4655681d2c7e'),
(149, 149, 1, 'cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-35', 'jobs/cdl-a-flatbed-truck-driver-jobs-up-to-1-200-wkly-pay-35', 1, '2020-03-25 15:21:15', '2020-03-25 15:21:15', '72e525ad-774a-4b28-aa7b-7f2760a917c2'),
(150, 150, 1, NULL, NULL, 1, '2020-03-26 14:12:53', '2020-03-26 14:12:53', 'c30c68d6-958f-41aa-ab97-e6e526830b99'),
(151, 151, 1, NULL, NULL, 1, '2020-03-26 14:14:31', '2020-03-26 14:14:31', '219e8a46-009d-49aa-b34d-9eb3749b74b9'),
(152, 152, 1, NULL, NULL, 1, '2020-03-26 14:33:40', '2020-03-26 14:33:40', '96ce0d99-ecb6-4757-a399-a6592f020005'),
(153, 153, 1, NULL, NULL, 1, '2020-03-26 14:38:18', '2020-03-26 14:38:18', '597558e7-ef8e-4fa9-9283-4e4d7a879ebe'),
(154, 154, 1, NULL, NULL, 1, '2020-03-26 14:49:33', '2020-03-26 14:49:33', '02a8fe9e-4b74-4445-82ad-297d045e44f4'),
(155, 155, 1, NULL, NULL, 1, '2020-03-26 15:05:44', '2020-03-26 15:05:44', '02779fdd-18d8-43e9-a82c-b29529b90764'),
(156, 156, 1, NULL, NULL, 1, '2020-03-26 15:07:38', '2020-03-26 15:07:38', '998832a0-5786-4bd3-a5c4-c6a27bf364bd'),
(157, 157, 1, NULL, NULL, 1, '2020-03-26 15:40:47', '2020-03-26 15:40:47', '702ea215-965c-4254-ab38-31e8051cc42d'),
(158, 158, 1, NULL, NULL, 1, '2020-03-26 16:15:23', '2020-03-26 16:15:23', '171244ae-d169-4ae5-bf64-988b88204e5f'),
(159, 159, 1, NULL, NULL, 1, '2020-03-26 16:46:22', '2020-03-26 16:46:22', 'ae8e80f9-b484-4e1e-89b2-92704be91643'),
(160, 160, 1, NULL, NULL, 1, '2020-03-26 20:20:49', '2020-03-26 20:20:49', '42f72c37-99aa-4aa3-93e0-819c1079becf'),
(161, 161, 1, NULL, NULL, 1, '2020-03-26 22:53:56', '2020-03-26 22:53:56', '5d012dfc-be1e-437a-9688-f51194045634'),
(162, 162, 1, NULL, NULL, 1, '2020-03-26 22:55:13', '2020-03-26 22:55:13', '2d6899b5-7db0-48ea-a8aa-25053813e473'),
(163, 163, 1, NULL, NULL, 1, '2020-03-26 23:11:43', '2020-03-26 23:11:43', 'c477b857-2016-4020-b054-89feef51b9d2'),
(164, 164, 1, NULL, NULL, 1, '2020-03-26 23:21:26', '2020-03-26 23:21:26', '2499b625-894d-45ba-ae78-dcb85f20a7be'),
(165, 165, 1, NULL, NULL, 1, '2020-03-26 23:23:38', '2020-03-26 23:23:38', 'a4624283-ac5c-477c-b3a4-6dfe4c218943'),
(166, 166, 1, NULL, NULL, 1, '2020-03-26 23:24:33', '2020-03-26 23:24:33', '2937c83b-0b06-4369-996d-e94d4aa1fa30'),
(167, 167, 1, NULL, NULL, 1, '2020-03-26 23:25:10', '2020-03-26 23:25:10', '6bb06bf6-570d-4e18-9dfe-efc57d86c39f'),
(168, 168, 1, NULL, NULL, 1, '2020-03-26 23:26:42', '2020-03-26 23:26:42', '134478b4-2cab-4c53-99d2-af2cb7077ab0'),
(169, 169, 1, NULL, NULL, 1, '2020-03-26 23:27:40', '2020-03-26 23:27:40', '3c992658-f1d8-47ea-8e9c-c68310ef2544'),
(170, 170, 1, NULL, NULL, 1, '2020-03-26 23:29:55', '2020-03-26 23:29:55', '615f6ef0-34c4-4540-bf8e-75220f7ca20c'),
(171, 171, 1, NULL, NULL, 1, '2020-03-26 23:33:46', '2020-03-26 23:33:46', 'b7f6825a-1735-4eff-8c76-a802173c90f5'),
(172, 172, 1, NULL, NULL, 1, '2020-03-26 23:50:40', '2020-03-26 23:50:40', '5e426d9a-bca6-4df5-a6b8-8773c2147a07'),
(173, 173, 1, NULL, NULL, 1, '2020-03-27 01:16:15', '2020-03-27 01:16:15', '49fad250-8849-43dc-a499-12ded496fe61'),
(174, 174, 1, NULL, NULL, 1, '2020-03-27 15:19:57', '2020-03-27 15:19:57', '9f00b28a-4999-44db-be03-8aaf0dd10226'),
(175, 175, 1, NULL, NULL, 1, '2020-03-27 15:27:52', '2020-03-27 15:27:52', '7e40c7e1-4e8d-4999-a590-4e01440cf3dd');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, NULL, 1, NULL, '2020-03-24 00:51:00', NULL, NULL, '2020-03-24 00:51:10', '2020-03-24 00:51:10', 'f831fbda-97db-4723-8c1d-10011f4dfbd1'),
(3, 1, NULL, 1, NULL, '2020-03-24 00:51:00', NULL, NULL, '2020-03-24 00:51:10', '2020-03-24 00:51:10', 'dcaafb75-a942-4b6a-be35-e6d63042813c'),
(4, 1, NULL, 1, NULL, '2020-03-24 00:51:00', NULL, NULL, '2020-03-24 00:52:59', '2020-03-24 00:52:59', '4c5d1165-99f7-46d9-bca9-294a63254102'),
(5, 2, NULL, 2, NULL, '2020-03-24 00:53:00', NULL, NULL, '2020-03-24 00:53:31', '2020-03-24 00:53:31', '76abeb50-4c1b-4529-a229-304d989b3e28'),
(6, 2, NULL, 2, NULL, '2020-03-24 00:53:00', NULL, NULL, '2020-03-24 00:53:31', '2020-03-24 00:53:31', 'aa9c3fae-4b14-4238-96e1-89a3a7fae7ec'),
(7, 2, NULL, 2, NULL, '2020-03-24 00:53:00', NULL, NULL, '2020-03-24 20:21:15', '2020-03-24 20:21:15', '69e50298-51be-4a62-9b20-dd75b289adb9'),
(8, 2, NULL, 2, NULL, '2020-03-24 00:53:00', NULL, NULL, '2020-03-24 20:24:15', '2020-03-24 20:24:15', 'f9260761-9c20-4be5-917a-3a65f6532b15'),
(9, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:09', '2020-03-25 05:25:09', 'be735d57-3831-4570-9b49-85659c4721d6'),
(10, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:09', '2020-03-25 05:25:09', 'b98a0d2c-e354-413a-bd55-c7df5128bff1'),
(11, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:09', '2020-03-25 05:25:09', 'be8425b6-4612-47c0-9b26-ade972ee631c'),
(12, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:09', '2020-03-25 05:25:09', '5db37ac9-587f-47ab-afa8-760ad283724c'),
(13, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:09', '2020-03-25 05:25:09', '54958aa7-8c37-40e8-b8d7-8d17e024c895'),
(14, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:09', '2020-03-25 05:25:09', '10362e90-cafe-4976-a2bb-32f44c195041'),
(15, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:09', '2020-03-25 05:25:09', 'c600e140-8d8d-4183-94a7-433cbb3bf817'),
(16, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:09', '2020-03-25 05:25:09', 'b6fec49a-f6f0-4a97-adde-ce062b80400f'),
(17, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:09', '2020-03-25 05:25:09', '8486d362-9f58-49fc-a3cc-b9ab44114489'),
(18, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'ba1c50df-2e4b-4d44-a9cc-d3c2b41a6493'),
(19, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '97398836-e33d-499a-8545-c2706c14a02d'),
(20, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '8fbac0b3-7876-4a1e-a69c-288bc036092b'),
(21, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '83a8b51f-ed48-4363-96e3-d6d72abcf54e'),
(22, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '20417549-c941-4fe9-96be-67ea5ed562e0'),
(23, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'd65c3f96-3262-4492-a249-a6e9c12a846f'),
(24, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'ffb066b3-9667-41c1-b43d-15df32907e67'),
(25, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'b184bbb3-bcde-431b-a23e-56a75fe5f6a7'),
(26, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'd280c003-9612-4f0e-add2-4d4733ea20d3'),
(27, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'f4f746be-22ae-40b9-8086-ff5395e15af4'),
(28, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '3420aafd-8a0a-4a70-8a89-352ed29f245a'),
(29, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'b167be0f-5b76-46cb-9114-b6ce6880d3ff'),
(30, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '1def1865-70d3-4650-acd6-e078d21cf4e7'),
(31, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '4926e1ff-ac27-41a5-aa40-ba251710b331'),
(32, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'a62ac5d2-46b9-4c10-9aa9-395431c188fb'),
(33, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'fc866c37-e7b0-47a3-959d-2d3a80abbb62'),
(34, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'c25cf1a2-8a62-462a-8c55-168c70b6281c'),
(35, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '8497190d-157c-48b6-aee5-ce3c93d24296'),
(36, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '76801166-7840-47d1-8e20-59814ffcbb2e'),
(37, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '2071f6e6-749c-4bbb-b678-e8dc717fdd5c'),
(38, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'c00ee835-4e09-48ce-8192-21342473dd7d'),
(39, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '56467884-4b6c-41e4-9e7f-b255cc7cff6b'),
(40, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'f7f42298-4600-4c03-bf57-c779f4f1c4a0'),
(41, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '94c5417e-a58b-46ac-8430-a97c46364fd5'),
(42, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '00bae3f5-af5c-4e9d-8299-f815303fb208'),
(43, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '358d8a7b-d39b-4cef-a2e1-c0af7c5f46f7'),
(44, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'fa4d8d82-db71-4e10-87f0-16e349b3456e'),
(45, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'd5b35876-9086-45e8-b3b9-798a17c814f8'),
(46, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '2b01a5d3-5c51-4100-8889-ebaa04f9ebe2'),
(47, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'e4dad44f-cdd1-485c-b9a1-8f4baaed6781'),
(48, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '02a9237c-3bc4-41bb-9b53-ecdc9e556851'),
(49, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'd0c97131-7922-4906-a435-6afe0acd3112'),
(50, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:10', '2020-03-25 05:25:10', '93cf53db-83a0-486c-8342-f38945b8034f'),
(51, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'af7b3493-f2e8-4cfa-92f0-30ad57753976'),
(52, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '318a804e-23da-4bb9-9770-6a5f7c417531'),
(53, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '201c2429-5b02-456d-a354-627b57774ec6'),
(54, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'c1f40b49-e8ca-4b45-989d-0c85615203d1'),
(55, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '975f5091-e998-4759-8a28-d2eafbb3e0f3'),
(56, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '4664b8b5-b738-4756-8355-c164c501cce7'),
(57, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '2c038269-e2bc-4a62-967e-749fee4b6935'),
(58, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '9cfb99a8-0f43-41e5-bfad-99a44aefd0c1'),
(59, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '4a1b2d02-5041-4e7e-ba09-7219506a39c4'),
(60, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '2e4e2993-b02c-4ad1-89c7-586c2ee9d291'),
(61, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '8d07cda9-0df6-4774-919d-ac5dd524b017'),
(62, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '47b43a1d-33af-4677-a437-3cc0b6886e5a'),
(63, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'dc223ed5-a301-4ac6-a62d-3d7cfb04b541'),
(64, 3, NULL, 3, 1, '2020-03-25 05:25:00', NULL, NULL, '2020-03-25 05:25:11', '2020-03-25 05:25:11', '8ee074d5-9060-4a57-bebc-a94756a73275'),
(65, 3, NULL, 3, 1, '2020-03-25 05:37:00', NULL, NULL, '2020-03-25 05:37:59', '2020-03-25 05:37:59', 'a5da25d3-5605-4fc9-a465-b3f18bea2b3e'),
(66, 3, NULL, 3, 1, '2020-03-25 05:37:00', NULL, NULL, '2020-03-25 05:37:59', '2020-03-25 05:37:59', 'f0beeeb7-855f-40a0-a72a-032fea8280f1'),
(67, 3, NULL, 3, 1, '2020-03-25 05:37:00', NULL, NULL, '2020-03-25 05:37:59', '2020-03-25 05:37:59', '4398372a-2da2-40da-adfe-e294dfaf7b19'),
(68, 3, NULL, 3, 1, '2020-03-25 05:37:00', NULL, NULL, '2020-03-25 05:37:59', '2020-03-25 05:37:59', '09b41bd0-e04d-43ca-8a3e-a0399f6ee2ca'),
(69, 3, NULL, 3, 1, '2020-03-25 05:37:00', NULL, NULL, '2020-03-25 05:37:59', '2020-03-25 05:37:59', '28207a83-c027-479e-b10b-8072c6501a30'),
(70, 3, NULL, 3, 1, '2020-03-25 05:37:00', NULL, NULL, '2020-03-25 05:37:59', '2020-03-25 05:37:59', 'b6bfc765-8c5c-4472-a2c3-04a0dac24a05'),
(71, 3, NULL, 3, 1, '2020-03-25 05:37:00', NULL, NULL, '2020-03-25 05:37:59', '2020-03-25 05:37:59', '01923f8d-bcb1-4ef9-af40-1f8e5564d3ea'),
(72, 3, NULL, 3, 1, '2020-03-25 05:37:00', NULL, NULL, '2020-03-25 05:37:59', '2020-03-25 05:37:59', 'c4b288f1-f443-4616-b8c7-619b67bd9fbb'),
(73, 3, NULL, 3, 1, '2020-03-25 05:37:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '3a166879-95b2-4fde-90ea-49530b86ec81'),
(74, 3, NULL, 3, 1, '2020-03-25 05:37:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '3b478ce5-485c-4659-ac5b-56d4ec4cab94'),
(75, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '47ca9567-5ad5-4a57-ab87-36eb44137874'),
(76, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'eb24354d-8d2b-42b6-918d-10c174c8ebe1'),
(77, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '2df4d5cf-0429-4560-a2ad-eb17c6b9f6c8'),
(78, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '3e018d32-b84a-46a0-9e77-87c67c198972'),
(79, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '66d5e49d-b470-4732-85e6-09c37a603db2'),
(80, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'e2081476-94c9-44b9-931c-9f173c464745'),
(81, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'f688a1d8-9101-4036-82bd-e29a449c3d28'),
(82, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '5ca46815-1e89-4066-b314-3c56ec321aec'),
(83, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'bfb0897a-caaa-40b0-b63d-0f45504bd93f'),
(84, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'f578285c-3ddf-4f6f-b3db-51e1dc6d4db3'),
(85, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '2c17a64b-4a6e-4c2a-9e0c-94b6dbd65dc4'),
(86, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '9d1aebec-b0aa-4e18-b95a-d10732bd97e4'),
(87, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '13214720-e8ac-4917-9c7b-5f45039424b9'),
(88, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '03c4f7a7-b125-4a60-a81b-8ffcd0b0e753'),
(89, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '6d8e591b-5fcf-4d63-87a0-98a38aae1c5f'),
(90, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'cf2c5f19-e13e-47ec-9b4b-0ed8a2530f09'),
(91, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'c4074b41-05b7-4b8c-bd5f-bd02ad6b4cbf'),
(92, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:00', '2020-03-25 05:38:00', '15695ad7-fb04-4051-92ad-a06ea6b3b77a'),
(93, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '07466dd2-9790-44d2-b440-4da9b38f90da'),
(94, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:01', '2020-03-25 05:38:01', 'db211f5e-0dcc-447c-be6f-404727f0dfea'),
(95, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '648cfd69-dc09-48a9-9618-e269c36bb4b0'),
(96, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '41cb27aa-2dec-44fc-8d5c-8962d9032283'),
(97, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '08b7d126-bb47-4405-8ba3-0b8c586ceff4'),
(98, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '64dcc957-7bbf-438c-ad8d-b54c1930037f'),
(99, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '31292859-f194-48d7-a2a7-bbeeccc29e96'),
(100, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '6c887f4c-4bf7-459d-bea6-99b980f6954f'),
(101, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '71ffcfdc-a313-4fd2-b9d7-a1c9c3c1a8c6'),
(102, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '16213534-d3e8-4099-a93f-648e381477b8'),
(103, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '5b76fa49-9597-4c29-a437-f6089027ed7b'),
(104, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:01', '2020-03-25 05:38:01', 'bdccbfeb-988b-41c4-b937-5a03780fb8fe'),
(105, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '094f221c-4814-4b72-ac83-41412549b53e'),
(106, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:01', '2020-03-25 05:38:01', 'bfc210ef-d19f-4366-b969-f25140f9b3be'),
(107, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:01', '2020-03-25 05:38:01', '55bc50d7-6d19-4a81-ba0c-262c1e75393f'),
(108, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:01', '2020-03-25 05:38:01', 'ab2dafa5-a9b2-4f06-b1d5-d32671bf44fa'),
(109, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:02', '2020-03-25 05:38:02', '3884aad5-2302-4e4a-8ff3-9af3b4fd562b'),
(110, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:02', '2020-03-25 05:38:02', 'af7a1436-8ea7-4416-8751-d894083d4a85'),
(111, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:02', '2020-03-25 05:38:02', '589bd7ca-2b78-468d-adae-e6faaf5e4593'),
(112, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:02', '2020-03-25 05:38:02', '77fa7ae4-efac-46fe-a21f-28fdb1cbf9c9'),
(113, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:02', '2020-03-25 05:38:02', '09a7ae13-6263-45ad-8bc6-6a67c138acaf'),
(114, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:02', '2020-03-25 05:38:02', '0fcd6280-b9c4-44ad-a3b6-ad487ea00da0'),
(115, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:02', '2020-03-25 05:38:02', '6842a428-f397-433c-88b0-a21fa2648a7c'),
(116, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:02', '2020-03-25 05:38:02', '6808b98c-a12a-415e-be99-372172952b33'),
(117, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:02', '2020-03-25 05:38:02', 'e9a73273-7847-4e99-a936-e69caf87f653'),
(118, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:02', '2020-03-25 05:38:02', 'a50627e1-257a-4ec6-baef-243f9b33227a'),
(119, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:02', '2020-03-25 05:38:02', 'ed49752c-20ed-4435-871a-05535a699f77'),
(120, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:38:02', '2020-03-25 05:38:02', '1da94513-5239-431f-bdb2-344a7f6d6047'),
(121, 3, NULL, 3, 1, '2020-03-25 05:37:00', NULL, NULL, '2020-03-25 05:39:04', '2020-03-25 05:39:04', '9f1daf28-ba33-4dea-a12c-c1f5c0351cd5'),
(122, 3, NULL, 3, 1, '2020-03-25 05:37:00', NULL, NULL, '2020-03-25 05:39:04', '2020-03-25 05:39:04', '019ab6a7-fee0-4e1d-9102-a6179ef2f284'),
(123, 3, NULL, 3, 1, '2020-03-25 05:37:00', NULL, NULL, '2020-03-25 05:39:05', '2020-03-25 05:39:05', 'e08862e2-c7a5-44d6-a4be-7a76942d62c2'),
(124, 3, NULL, 3, 1, '2020-03-25 05:37:00', NULL, NULL, '2020-03-25 05:39:05', '2020-03-25 05:39:05', '609e81b7-7eda-48d5-8e73-00cc99c45a82'),
(125, 3, NULL, 3, 1, '2020-03-25 05:37:00', NULL, NULL, '2020-03-25 05:39:05', '2020-03-25 05:39:05', '7bc4809c-4e80-43fd-9b07-4c54126fd759'),
(126, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:05', '2020-03-25 05:39:05', 'e89d7455-7232-4509-8b71-6cf8d3d3c53e'),
(127, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:05', '2020-03-25 05:39:05', '10ec38a2-65d5-448e-999c-b8aa4bb7b3cc'),
(128, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:05', '2020-03-25 05:39:05', '41af083e-fd5a-4dcb-a1d0-55a555bad70e'),
(129, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:05', '2020-03-25 05:39:05', 'a9c3fe79-ffbf-4ef9-aabf-2f4c2957c478'),
(130, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:06', '2020-03-25 05:39:06', '6bb3a9b6-b330-4a3b-b194-f1dafb8a9987'),
(131, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:06', '2020-03-25 05:39:06', '95e99423-313b-4066-8922-5b85fe3b6f6b'),
(132, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:06', '2020-03-25 05:39:06', 'b9027d47-543c-4f02-bd46-8663678fa03b'),
(133, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:06', '2020-03-25 05:39:06', '5765ff65-f4d0-4eee-b7db-265b40d8002e'),
(134, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:06', '2020-03-25 05:39:06', 'b8aeed32-ecb5-4d03-83d1-ca1f69e4cac2'),
(135, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:06', '2020-03-25 05:39:06', '6f986a5c-0a2c-4a78-9cd2-9cc0d0104e4c'),
(136, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:07', '2020-03-25 05:39:07', 'e95f8fd3-3429-448c-9edd-d1e65727038b'),
(137, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:07', '2020-03-25 05:39:07', 'eef0dab8-5d87-4bd4-b065-8830ec141c7e'),
(138, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:07', '2020-03-25 05:39:07', '8b2e599d-be24-4e88-885d-757793d97467'),
(139, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:07', '2020-03-25 05:39:07', '75226795-4a0a-4376-b1fb-ba4440338c06'),
(140, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:07', '2020-03-25 05:39:07', '68f91cfb-60ec-40db-b67a-74f08f5c9dda'),
(141, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:07', '2020-03-25 05:39:07', 'e122bde1-fd39-4836-baf8-c5b7b46e2ab3'),
(142, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:08', '2020-03-25 05:39:08', 'c5937db8-a729-412b-a033-e67212709ffd'),
(143, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:08', '2020-03-25 05:39:08', 'c1270eda-f421-47fe-b0a8-1ec1c9b7f662'),
(144, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:08', '2020-03-25 05:39:08', 'c31ea20a-3ad8-432e-99ea-234146d01241'),
(145, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:08', '2020-03-25 05:39:08', '0855edcb-bbb2-41d2-9086-dafa21d27ff5'),
(146, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:09', '2020-03-25 05:39:09', '0c671e43-6121-4d4e-ac3a-8060fc54f897'),
(147, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:09', '2020-03-25 05:39:09', '777ca36f-6ff3-4aa4-90c8-20cfee8a4aba'),
(148, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 05:39:09', '2020-03-25 05:39:09', 'd8087182-1379-497a-bb92-58a4ff36804e'),
(149, 3, NULL, 3, 1, '2020-03-25 05:38:00', NULL, NULL, '2020-03-25 15:21:15', '2020-03-25 15:21:15', '254d7889-56b1-4f62-93bb-91751667c280');

-- --------------------------------------------------------

--
-- Table structure for table `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, NULL, 'Home', 'home', 0, NULL, '{section.name|raw}', 1, '2020-03-24 00:51:10', '2020-03-24 00:51:10', NULL, '17462fab-b3ff-4b55-82f9-c527280f34bc'),
(2, 2, 1, 'Jobs Index', 'jobsIndex', 0, '', '{section.name|raw}', 1, '2020-03-24 00:53:31', '2020-03-24 20:21:15', NULL, 'c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc'),
(3, 3, 2, 'Job Listings', 'jobListings', 1, 'Title', '', 1, '2020-03-24 03:45:18', '2020-03-24 20:22:12', NULL, '2ab2c8fb-ac48-418b-a423-ee3f3536e65a');

-- --------------------------------------------------------

--
-- Table structure for table `feedme_feeds`
--

CREATE TABLE `feedme_feeds` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `feedUrl` text NOT NULL,
  `feedType` varchar(255) DEFAULT NULL,
  `primaryElement` varchar(255) DEFAULT NULL,
  `elementType` varchar(255) NOT NULL,
  `elementGroup` text DEFAULT NULL,
  `siteId` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `duplicateHandle` text DEFAULT NULL,
  `paginationNode` text DEFAULT NULL,
  `fieldMapping` text DEFAULT NULL,
  `fieldUnique` text DEFAULT NULL,
  `passkey` varchar(255) NOT NULL,
  `backup` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feedme_feeds`
--

INSERT INTO `feedme_feeds` (`id`, `name`, `feedUrl`, `feedType`, `primaryElement`, `elementType`, `elementGroup`, `siteId`, `sortOrder`, `duplicateHandle`, `paginationNode`, `fieldMapping`, `fieldUnique`, `passkey`, `backup`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Google Sheet Test', 'https://sheets.googleapis.com/v4/spreadsheets/1ZVyW5UPWugEwHP_47neyPZ4NhF6UDGf2u82qv3Tg3uw/values/sheet-test?key=AIzaSyDMD9s4X5dwfovnz7NRZz14SKJbCLLAR74', 'googlesheet', '', 'craft\\elements\\Entry', '{\"craft\\\\elements\\\\Asset\":\"\",\"craft\\\\elements\\\\Category\":\"\",\"craft\\\\elements\\\\Entry\":{\"section\":\"3\",\"entryType\":\"3\"},\"craft\\\\elements\\\\Tag\":\"\"}', NULL, 1, '[\"add\",\"update\"]', '', '{\"title\":{\"attribute\":\"true\",\"node\":\"Job Title\",\"default\":\"\"},\"slug\":{\"attribute\":\"true\",\"node\":\"Job Title\",\"default\":\"\"},\"postDate\":{\"attribute\":\"true\",\"node\":\"noimport\",\"options\":{\"match\":\"auto\"},\"default\":{\"date\":\"\",\"timezone\":\"America\\/Los_Angeles\",\"time\":\"\"}},\"expiryDate\":{\"attribute\":\"true\",\"node\":\"noimport\",\"options\":{\"match\":\"auto\"},\"default\":{\"date\":\"\",\"timezone\":\"America\\/Los_Angeles\",\"time\":\"\"}},\"enabled\":{\"attribute\":\"true\",\"node\":\"noimport\",\"default\":\"\"},\"authorId\":{\"attribute\":\"true\",\"node\":\"noimport\",\"options\":{\"match\":\"email\"},\"default\":\"\"},\"id\":{\"attribute\":\"true\",\"node\":\"noimport\",\"default\":\"\"},\"city\":{\"field\":\"craft\\\\fields\\\\PlainText\",\"node\":\"City\",\"default\":\"\"},\"driverType\":{\"field\":\"craft\\\\fields\\\\Dropdown\",\"node\":\"Driver Type\",\"options\":{\"match\":\"value\"},\"default\":\"\"},\"jobAddress\":{\"field\":\"doublesecretagency\\\\smartmap\\\\fields\\\\Address\",\"fields\":{\"street1\":{\"node\":\"\",\"default\":\"\"},\"street2\":{\"node\":\"\",\"default\":\"\"},\"city\":{\"node\":\"City\",\"default\":\"\"},\"state\":{\"node\":\"State\",\"default\":\"\"},\"zip\":{\"node\":\"Zip\",\"default\":\"\"},\"country\":{\"node\":\"noimport\",\"default\":\"\"},\"lat\":{\"node\":\"Lat\",\"default\":\"\"},\"lng\":{\"node\":\"Long\",\"default\":\"\"}}},\"jobApplicationLink\":{\"field\":\"craft\\\\fields\\\\Url\",\"node\":\"usedefault\",\"default\":\"conversionia.com\"},\"jobDetails\":{\"field\":\"craft\\\\redactor\\\\Field\",\"node\":\"Job Overview\",\"default\":\"\"},\"jobHeadline\":{\"field\":\"craft\\\\fields\\\\PlainText\",\"node\":\"noimport\",\"default\":\"\"},\"jobType\":{\"field\":\"craft\\\\fields\\\\Dropdown\",\"node\":\"Job Type\",\"options\":{\"match\":\"value\"},\"default\":\"\"},\"truckType\":{\"field\":\"craft\\\\fields\\\\Dropdown\",\"node\":\"Truck Type\",\"options\":{\"match\":\"value\"},\"default\":\"\"}}', '{\"title\":\"1\",\"slug\":\"\",\"enabled\":\"\",\"id\":\"\",\"city\":\"1\",\"driverType\":\"\",\"jobApplicationLink\":\"\",\"jobHeadline\":\"\",\"jobType\":\"\",\"truckType\":\"1\"}', 'IFwTs5jEHf', 0, '2020-03-24 20:19:19', '2020-03-25 05:38:56', 'bb4f292a-ca7d-4938-b360-8ecb29d6cfba'),
(2, 'Mock Google Sheets', 'https://sheets.googleapis.com/v4/spreadsheets/1ZVyW5UPWugEwHP_47neyPZ4NhF6UDGf2u82qv3Tg3uw/values/sheet-test?key=AIzaSyDMD9s4X5dwfovnz7NRZz14SKJbCLLAR74', 'googlesheet', NULL, 'craft\\elements\\Entry', '{\"craft\\\\elements\\\\Asset\":\"\",\"craft\\\\elements\\\\Category\":\"\",\"craft\\\\elements\\\\Entry\":{\"section\":\"3\",\"entryType\":\"3\"},\"craft\\\\elements\\\\Tag\":\"\"}', NULL, 2, '[\"add\",\"update\"]', NULL, NULL, NULL, 'EjxlB6U0p0', 1, '2020-03-24 20:25:05', '2020-03-24 20:25:05', 'a58d09c8-160b-40b1-bd17-053d16e21381');

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Common', '2020-03-23 05:11:44', '2020-03-23 05:11:44', 'a6bd0dc1-8f56-4f96-b1a3-bb61957485ae'),
(3, 'Job', '2020-03-24 19:56:55', '2020-03-24 19:56:55', '4fb65637-0240-4b7b-848c-6f67dc84c39e');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayoutfields`
--

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayoutfields`
--

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(9, 2, 2, 5, 0, 4, '2020-03-24 20:22:12', '2020-03-24 20:22:12', 'daa3e6ae-02ed-4abf-9aee-61af2193e9de'),
(10, 2, 2, 6, 0, 5, '2020-03-24 20:22:12', '2020-03-24 20:22:12', '87cfd2eb-c6d1-4236-93c1-36f9fc64d77c'),
(11, 2, 2, 9, 0, 6, '2020-03-24 20:22:12', '2020-03-24 20:22:12', '7fad3aec-3c72-44c7-b8fe-933a676d74ff'),
(12, 2, 2, 3, 0, 2, '2020-03-24 20:22:12', '2020-03-24 20:22:12', '352ca6bf-1b72-403f-b662-ad23c6502a9b'),
(13, 2, 2, 7, 0, 8, '2020-03-24 20:22:12', '2020-03-24 20:22:12', '6194d68a-b384-4f55-9d54-bc939dff5775'),
(14, 2, 2, 8, 0, 7, '2020-03-24 20:22:12', '2020-03-24 20:22:12', 'd935ac26-08ac-4941-8e81-ed58c02a8092'),
(15, 2, 2, 4, 0, 3, '2020-03-24 20:22:12', '2020-03-24 20:22:12', 'd79c2b5d-7253-472c-9658-9dd2e589bf7b'),
(16, 2, 2, 2, 0, 1, '2020-03-24 20:22:12', '2020-03-24 20:22:12', '78d83c42-12a5-414b-a81f-4f91a8460922'),
(17, 1, 3, 5, 0, 4, '2020-03-24 20:24:15', '2020-03-24 20:24:15', 'f367bd98-978e-4f50-8047-74d2f8bda531'),
(18, 1, 3, 6, 0, 5, '2020-03-24 20:24:15', '2020-03-24 20:24:15', '940b4d20-fc0f-41a9-9abf-9cbcdd05556a'),
(19, 1, 3, 9, 0, 6, '2020-03-24 20:24:15', '2020-03-24 20:24:15', '82c7e14a-5f8b-4a5a-b39b-189fd3e4ba15'),
(20, 1, 3, 3, 0, 2, '2020-03-24 20:24:15', '2020-03-24 20:24:15', '93923d55-25a0-4740-a9eb-d920fa56f84f'),
(21, 1, 3, 7, 0, 8, '2020-03-24 20:24:15', '2020-03-24 20:24:15', 'bc288689-ef47-42c8-8778-e268bdbc9151'),
(22, 1, 3, 8, 0, 7, '2020-03-24 20:24:15', '2020-03-24 20:24:15', 'f9b523ee-8dc2-469a-9e7d-7066867635d4'),
(23, 1, 3, 4, 0, 3, '2020-03-24 20:24:15', '2020-03-24 20:24:15', 'dc4f5d76-2ca3-4dc8-baae-bcafa6abb953'),
(24, 1, 3, 2, 0, 1, '2020-03-24 20:24:15', '2020-03-24 20:24:15', '4242e631-9066-4a75-811b-a7af0365bf02');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '2020-03-24 20:21:15', '2020-03-24 20:21:15', NULL, 'bfdea601-1042-4e24-9506-4f8cc4ba3906'),
(2, 'craft\\elements\\Entry', '2020-03-24 20:22:12', '2020-03-24 20:22:12', NULL, '02d2e30b-c74d-408d-bdf6-a17a90578045');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayouttabs`
--

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 2, 'Job', 1, '2020-03-24 20:22:12', '2020-03-24 20:22:12', '14eb303a-8223-4b6d-836e-b46e7b3d648a'),
(3, 1, 'Job', 1, '2020-03-24 20:24:14', '2020-03-24 20:24:14', '44a6f214-6170-411a-942d-02b701d64d8b');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'address', 'address', 'global', '', 1, 'none', NULL, 'doublesecretagency\\smartmap\\fields\\Address', '{\"dragPinDefault\":\"\",\"dragPinLatitude\":\"0\",\"dragPinLongitude\":\"0\",\"dragPinZoom\":\"4\",\"layout\":{\"street1\":{\"width\":100,\"enable\":0,\"position\":1},\"street2\":{\"width\":100,\"enable\":0,\"position\":2},\"city\":{\"width\":50,\"enable\":1,\"position\":3},\"state\":{\"width\":15,\"enable\":1,\"position\":4},\"zip\":{\"width\":35,\"enable\":1,\"position\":5},\"country\":{\"width\":100,\"enable\":1,\"position\":6},\"lat\":{\"width\":50,\"enable\":1,\"position\":7},\"lng\":{\"width\":50,\"enable\":1,\"position\":8}}}', '2020-03-24 03:54:58', '2020-03-24 03:54:58', 'a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10'),
(2, 3, 'City', 'city', 'global', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}', '2020-03-24 19:57:11', '2020-03-24 19:57:11', 'f54c9196-e5f7-4d97-be6c-b4dd870e0e11'),
(3, 3, 'Driver Type', 'driverType', 'global', '', 1, 'none', NULL, 'craft\\fields\\Dropdown', '{\"optgroups\":true,\"options\":[{\"label\":\"Solo\",\"value\":\"solo\",\"default\":\"\"},{\"label\":\"Team\",\"value\":\"team\",\"default\":\"\"},{\"label\":\"Owner Operator\",\"value\":\"ownerOperator\",\"default\":\"\"},{\"label\":\"Student\",\"value\":\"student\",\"default\":\"\"}]}', '2020-03-24 19:57:54', '2020-03-24 19:57:54', '6a047704-fe42-4850-b2b1-90e042b32928'),
(4, 3, 'Job Address', 'jobAddress', 'global', '', 1, 'none', NULL, 'doublesecretagency\\smartmap\\fields\\Address', '{\"dragPinDefault\":\"\",\"dragPinLatitude\":\"0\",\"dragPinLongitude\":\"0\",\"dragPinZoom\":\"4\",\"layout\":{\"street1\":{\"width\":100,\"enable\":1,\"position\":1},\"street2\":{\"width\":100,\"enable\":0,\"position\":2},\"city\":{\"width\":50,\"enable\":1,\"position\":3},\"state\":{\"width\":15,\"enable\":1,\"position\":4},\"zip\":{\"width\":35,\"enable\":1,\"position\":5},\"country\":{\"width\":100,\"enable\":1,\"position\":6},\"lat\":{\"width\":50,\"enable\":1,\"position\":7},\"lng\":{\"width\":50,\"enable\":1,\"position\":8}}}', '2020-03-24 19:58:33', '2020-03-24 19:58:33', 'ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a'),
(5, 3, 'Job Application Link', 'jobApplicationLink', 'global', '', 1, 'none', NULL, 'craft\\fields\\Url', '{\"maxLength\":\"255\",\"placeholder\":\"\"}', '2020-03-24 19:58:57', '2020-03-24 19:58:57', '296c5dd1-6f04-49f5-91f7-5549f94f9a05'),
(6, 3, 'Job Details', 'jobDetails', 'global', '', 1, 'none', NULL, 'craft\\redactor\\Field', '{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"\",\"removeNbsp\":\"1\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false}', '2020-03-24 20:13:25', '2020-03-24 20:13:25', '3ec0ff05-83b4-405d-8caa-0210e6f1ff6a'),
(7, 3, 'Truck Type', 'truckType', 'global', '', 1, 'none', NULL, 'craft\\fields\\Dropdown', '{\"optgroups\":true,\"options\":[{\"label\":\"Van\",\"value\":\"van\",\"default\":\"\"},{\"label\":\"Reefer\",\"value\":\"reefer\",\"default\":\"\"},{\"label\":\"Tanker\",\"value\":\"tanker\",\"default\":\"\"}]}', '2020-03-24 20:14:07', '2020-03-24 20:14:07', '7ee9eed6-495b-451a-8176-47f2f8273a18'),
(8, 3, 'Job Type', 'jobType', 'global', '', 1, 'none', NULL, 'craft\\fields\\Dropdown', '{\"optgroups\":true,\"options\":[{\"label\":\"OTR\",\"value\":\"otr\",\"default\":\"\"},{\"label\":\"Regional\",\"value\":\"regional\",\"default\":\"\"},{\"label\":\"Dedicated\",\"value\":\"dedicated\",\"default\":\"\"},{\"label\":\"Local\",\"value\":\"local\",\"default\":\"\"}]}', '2020-03-24 20:14:49', '2020-03-24 20:14:49', 'd3313873-9368-4fb3-94f9-f5328479c75d'),
(9, 3, 'Job Headline', 'jobHeadline', 'global', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}', '2020-03-24 20:15:12', '2020-03-24 20:15:12', '40dc5cd6-496d-40e1-9b29-3b6da3bf7d23');

-- --------------------------------------------------------

--
-- Table structure for table `freeform_crm_fields`
--

CREATE TABLE `freeform_crm_fields` (
  `id` int(11) NOT NULL,
  `integrationId` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `required` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `freeform_export_profiles`
--

CREATE TABLE `freeform_export_profiles` (
  `id` int(11) NOT NULL,
  `formId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `limit` int(11) DEFAULT NULL,
  `dateRange` varchar(255) DEFAULT NULL,
  `fields` text NOT NULL,
  `filters` text DEFAULT NULL,
  `statuses` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `freeform_export_settings`
--

CREATE TABLE `freeform_export_settings` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `setting` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `freeform_fields`
--

CREATE TABLE `freeform_fields` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `required` tinyint(1) DEFAULT 0,
  `instructions` text DEFAULT NULL,
  `metaProperties` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `freeform_fields`
--

INSERT INTO `freeform_fields` (`id`, `type`, `handle`, `label`, `required`, `instructions`, `metaProperties`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'text', 'firstName', 'First Name', 0, NULL, NULL, '2020-03-26 13:29:55', '2020-03-26 13:29:55', '29eb341f-1995-4f67-b33e-e9ca98a6cc00'),
(2, 'text', 'lastName', 'Last Name', 0, NULL, NULL, '2020-03-26 13:29:55', '2020-03-26 13:29:55', 'e7870875-67f3-47d3-b470-7d3b55cd11be'),
(3, 'email', 'email', 'Email', 0, NULL, NULL, '2020-03-26 13:29:55', '2020-03-26 13:29:55', 'd9ecd8e2-adcf-468d-a5cb-5be624cca7a0'),
(4, 'text', 'website', 'Website', 0, NULL, NULL, '2020-03-26 13:29:55', '2020-03-26 13:29:55', '6178ad17-bc25-4218-b2ad-907923edf4d6'),
(5, 'text', 'cellPhone', 'Cell Phone', 0, NULL, NULL, '2020-03-26 13:29:55', '2020-03-26 13:29:55', 'b69d79a2-288c-4522-ab78-9ee21685f21e'),
(6, 'text', 'homePhone', 'Home Phone', 0, NULL, NULL, '2020-03-26 13:29:55', '2020-03-26 13:29:55', '08f66edd-6a9b-4e4c-b9a3-b56bab3f6227'),
(7, 'text', 'companyName', 'Company Name', 0, NULL, NULL, '2020-03-26 13:29:56', '2020-03-26 13:29:56', 'c23251a8-bd70-45dc-91be-e721d8d4b035'),
(8, 'textarea', 'address', 'Address', 0, NULL, '{\"rows\":2}', '2020-03-26 13:29:56', '2020-03-26 13:29:56', '2a23d637-4efe-492a-9773-0ced7d36513d'),
(9, 'text', 'city', 'City', 0, NULL, NULL, '2020-03-26 13:29:56', '2020-03-26 13:29:56', '39451f31-56a9-4868-a3d0-c6ee4200773f'),
(10, 'select', 'state', 'State', 0, NULL, '{\"options\":[{\"value\":\"\",\"label\":\"Select a State\"},{\"value\":\"AL\",\"label\":\"Alabama\"},{\"value\":\"AK\",\"label\":\"Alaska\"},{\"value\":\"AZ\",\"label\":\"Arizona\"},{\"value\":\"AR\",\"label\":\"Arkansas\"},{\"value\":\"CA\",\"label\":\"California\"},{\"value\":\"CO\",\"label\":\"Colorado\"},{\"value\":\"CT\",\"label\":\"Connecticut\"},{\"value\":\"DE\",\"label\":\"Delaware\"},{\"value\":\"DC\",\"label\":\"District of Columbia\"},{\"value\":\"FL\",\"label\":\"Florida\"},{\"value\":\"GA\",\"label\":\"Georgia\"},{\"value\":\"HI\",\"label\":\"Hawaii\"},{\"value\":\"ID\",\"label\":\"Idaho\"},{\"value\":\"IL\",\"label\":\"Illinois\"},{\"value\":\"IN\",\"label\":\"Indiana\"},{\"value\":\"IA\",\"label\":\"Iowa\"},{\"value\":\"KS\",\"label\":\"Kansas\"},{\"value\":\"KY\",\"label\":\"Kentucky\"},{\"value\":\"LA\",\"label\":\"Louisiana\"},{\"value\":\"ME\",\"label\":\"Maine\"},{\"value\":\"MD\",\"label\":\"Maryland\"},{\"value\":\"MA\",\"label\":\"Massachusetts\"},{\"value\":\"MI\",\"label\":\"Michigan\"},{\"value\":\"MN\",\"label\":\"Minnesota\"},{\"value\":\"MS\",\"label\":\"Mississippi\"},{\"value\":\"MO\",\"label\":\"Missouri\"},{\"value\":\"MT\",\"label\":\"Montana\"},{\"value\":\"NE\",\"label\":\"Nebraska\"},{\"value\":\"NV\",\"label\":\"Nevada\"},{\"value\":\"NH\",\"label\":\"New Hampshire\"},{\"value\":\"NJ\",\"label\":\"New Jersey\"},{\"value\":\"NM\",\"label\":\"New Mexico\"},{\"value\":\"NY\",\"label\":\"New York\"},{\"value\":\"NC\",\"label\":\"North Carolina\"},{\"value\":\"ND\",\"label\":\"North Dakota\"},{\"value\":\"OH\",\"label\":\"Ohio\"},{\"value\":\"OK\",\"label\":\"Oklahoma\"},{\"value\":\"OR\",\"label\":\"Oregon\"},{\"value\":\"PA\",\"label\":\"Pennsylvania\"},{\"value\":\"RI\",\"label\":\"Rhode Island\"},{\"value\":\"SC\",\"label\":\"South Carolina\"},{\"value\":\"SD\",\"label\":\"South Dakota\"},{\"value\":\"TN\",\"label\":\"Tennessee\"},{\"value\":\"TX\",\"label\":\"Texas\"},{\"value\":\"UT\",\"label\":\"Utah\"},{\"value\":\"VT\",\"label\":\"Vermont\"},{\"value\":\"VA\",\"label\":\"Virginia\"},{\"value\":\"WA\",\"label\":\"Washington\"},{\"value\":\"WV\",\"label\":\"West Virginia\"},{\"value\":\"WI\",\"label\":\"Wisconsin\"},{\"value\":\"WY\",\"label\":\"Wyoming\"}]}', '2020-03-26 13:29:56', '2020-03-26 13:29:56', 'c63a5b78-e4f6-482d-a895-48cc8a57a526'),
(11, 'text', 'zipCode', 'Zip Code', 0, NULL, NULL, '2020-03-26 13:29:56', '2020-03-26 13:29:56', '919f21f7-e4a0-42d2-b522-d78eba7fb8c6'),
(12, 'textarea', 'message', 'Message', 0, NULL, '{\"rows\":5}', '2020-03-26 13:29:56', '2020-03-26 13:29:56', '6f80a16b-0fc7-4405-ab31-ac2e355c3b2f'),
(13, 'number', 'number', 'Number', 0, NULL, NULL, '2020-03-26 13:29:56', '2020-03-26 13:29:56', '748017db-f41e-43e7-a117-6916a60b23c8'),
(14, 'cc_details', 'payment', '', 0, NULL, NULL, '2020-03-26 13:29:56', '2020-03-26 13:29:56', '50144288-8bb4-4ddc-adbe-5196d82cbda1'),
(15, 'radio_group', 'doYouHaveACurrentValidCDLA', 'Do you have a current valid CDL-A?', 0, NULL, NULL, '2020-03-26 13:48:04', '2020-03-26 13:48:04', '98d33876-0275-466e-8b62-525580c0b28f'),
(16, 'select', 'howManyYearsOfCDLADriverExperienceDoYouHave', 'How many Years of CDL A Driver Experience do you have?', 0, NULL, NULL, '2020-03-26 13:49:43', '2020-03-26 13:49:43', 'c5dfcb5b-6789-4e8e-a915-3794192d2f52'),
(17, 'radio_group', 'doYouHaveACleanDrivingRecord', 'Do you have a clean driving record?', 0, NULL, NULL, '2020-03-26 13:50:53', '2020-03-26 13:50:53', 'a445a969-717d-471d-9cf1-32e588b24ec3'),
(18, 'select', 'whichTerminalAreYouInterestedIn', 'Which terminal are you interested in?', 0, NULL, NULL, '2020-03-26 13:51:47', '2020-03-26 13:51:47', '6dfcf153-9308-4da8-a800-3b759c0a5c40'),
(19, 'checkbox', 'iHerebyConsentToReceiveEmailTextAndAutodialedAndOrPreRecordedTelemarketingCallsFromOrOnBehalfOfBoydBros', 'I hereby consent to receive email text and autodialed and or pre-recorded telemarketing calls from or on behalf of Boyd Bros', 0, NULL, NULL, '2020-03-26 13:55:17', '2020-03-26 13:55:17', '7ad57792-4643-4ef6-9f0f-47473f781eab'),
(20, 'radio_group', 'infoScale', 'infoScale', 0, NULL, NULL, '2020-03-27 03:18:34', '2020-03-27 03:18:34', '34733610-ebfe-4207-b578-3726525b9fd1'),
(21, 'textarea', 'additionalComments', 'Additional Comments', 0, NULL, NULL, '2020-03-27 03:22:11', '2020-03-27 03:22:11', 'dcfc808f-e85d-4e66-b9f4-c550286e3c84'),
(22, 'radio_group', 'accomplish', 'accomplish', 0, NULL, NULL, '2020-03-27 03:22:30', '2020-03-27 03:22:30', '5dfcb95b-7ecc-4189-b910-1d455577a82a'),
(23, 'rating', 'rating', 'I found this site easy to use', 0, NULL, NULL, '2020-03-27 03:25:15', '2020-03-27 03:25:15', '2d4f707d-6933-4d64-aab9-f3b6424afc78'),
(24, 'textarea', 'improve', 'What can we do to imporve your experience?', 0, NULL, NULL, '2020-03-27 03:26:35', '2020-03-27 03:26:35', '1d91bba4-a0dd-423d-88b4-a63ea6e6d431');

-- --------------------------------------------------------

--
-- Table structure for table `freeform_forms`
--

CREATE TABLE `freeform_forms` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `handle` varchar(100) NOT NULL,
  `spamBlockCount` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `submissionTitleFormat` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `layoutJson` mediumtext DEFAULT NULL,
  `returnUrl` varchar(255) DEFAULT NULL,
  `defaultStatus` int(11) UNSIGNED DEFAULT NULL,
  `formTemplateId` int(11) UNSIGNED DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `optInDataStorageTargetHash` varchar(20) DEFAULT NULL,
  `limitFormSubmissions` varchar(20) DEFAULT NULL,
  `extraPostUrl` varchar(255) DEFAULT NULL,
  `extraPostTriggerPhrase` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `freeform_forms`
--

INSERT INTO `freeform_forms` (`id`, `name`, `handle`, `spamBlockCount`, `submissionTitleFormat`, `description`, `layoutJson`, `returnUrl`, `defaultStatus`, `formTemplateId`, `color`, `optInDataStorageTargetHash`, `limitFormSubmissions`, `extraPostUrl`, `extraPostTriggerPhrase`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'form', 'form', 0, '{{ dateCreated|date(\"Y-m-d H:i:s\") }}', '', '{\"composer\":{\"layout\":[[{\"id\":\"MDEaBVxAk\",\"columns\":[\"37zaG92gw\"]},{\"id\":\"LLoJ3Gy26\",\"columns\":[\"8oWe9jZpP\"]},{\"id\":\"wgEQJA1rB\",\"columns\":[\"5KM0OK02p\"]},{\"id\":\"wgEQJApKa\",\"columns\":[\"Va34kjZPq\"]},{\"id\":\"oBdOp96O8\",\"columns\":[\"d1EeG8Z68\"]},{\"id\":\"ky751xXAm\",\"columns\":[\"VgLeAg426\"]},{\"id\":\"zEBrK7nml\",\"columns\":[\"jDMZQLe3y\"]},{\"id\":\"rMmkJ3AKB\",\"columns\":[\"rMmkJ3VAV\"]}],[{\"id\":\"mEPwBE9nm\",\"columns\":[\"QrnEGrVMn\"]},{\"id\":\"mEPwA1xbQ\",\"columns\":[\"Bb10jE4K3\"]},{\"id\":\"Rq5EQk8kD\",\"columns\":[\"AV34dy07p\"]},{\"id\":\"rMmkJBRW3\",\"columns\":[\"jRpqWm1zb\"]}],[{\"id\":\"xkopmkGl6\",\"columns\":[\"Rq5E3qvzV\"]},{\"id\":\"GR6EoMWvV\",\"columns\":[\"DBk0Xw4YJ\"]},{\"id\":\"zEBrKl5zj\",\"columns\":[\"gGp461ZwQ\"]},{\"id\":\"Rq5EQV9QA\",\"columns\":[\"vG8AKJMRD\"]}],[{\"id\":\"P2ByO5EGA\",\"columns\":[\"QrnEGmNE8\"]},{\"id\":\"ky751a5Ag\",\"columns\":[\"Jvb4m946X\"]},{\"id\":\"NzNEwlRNg\",\"columns\":[\"8RGzYqDm6\"]}]],\"properties\":{\"page0\":{\"type\":\"page\",\"label\":\"Page 1\"},\"form\":{\"type\":\"form\",\"name\":\"form\",\"handle\":\"form\",\"color\":\"#9a7e51\",\"submissionTitleFormat\":\"{{ dateCreated|date(\\\"Y-m-d H:i:s\\\") }}\",\"description\":\"\",\"formTemplate\":\"flexbox.html\",\"returnUrl\":\"\",\"storeData\":true,\"defaultStatus\":2,\"ajaxEnabled\":false},\"integration\":{\"type\":\"integration\",\"integrationId\":0,\"mapping\":[]},\"connections\":{\"type\":\"connections\",\"list\":null},\"rules\":{\"type\":\"rules\",\"list\":[]},\"admin_notifications\":{\"type\":\"admin_notifications\",\"notificationId\":0,\"recipients\":\"\"},\"payment\":{\"type\":\"payment\",\"integrationId\":0,\"mapping\":[]},\"8oWe9jZpP\":{\"hash\":\"8oWe9jZpP\",\"id\":1,\"type\":\"text\",\"handle\":\"firstName\",\"label\":\"First Name\",\"required\":false,\"instructions\":\"\",\"value\":\"\",\"placeholder\":\"\"},\"5KM0OK02p\":{\"hash\":\"5KM0OK02p\",\"id\":2,\"type\":\"text\",\"handle\":\"lastName\",\"label\":\"Last Name\",\"required\":false,\"instructions\":\"\",\"value\":\"\",\"placeholder\":\"\"},\"Va34kjZPq\":{\"hash\":\"Va34kjZPq\",\"id\":5,\"type\":\"text\",\"handle\":\"cellPhone\",\"label\":\"Cell Phone\",\"required\":false,\"instructions\":\"\",\"value\":\"\",\"placeholder\":\"\"},\"d1EeG8Z68\":{\"hash\":\"d1EeG8Z68\",\"id\":3,\"type\":\"email\",\"handle\":\"email\",\"label\":\"Email\",\"required\":false,\"instructions\":\"\",\"notificationId\":0,\"values\":[],\"placeholder\":\"\"},\"jDMZQLe3y\":{\"id\":10,\"hash\":\"jDMZQLe3y\",\"type\":\"select\",\"handle\":\"state\",\"label\":\"State\",\"required\":false,\"instructions\":\"\",\"showCustomValues\":true,\"value\":\"\",\"options\":[{\"value\":\"\",\"label\":\"Select a State\"},{\"value\":\"AL\",\"label\":\"Alabama\"},{\"value\":\"AK\",\"label\":\"Alaska\"},{\"value\":\"AZ\",\"label\":\"Arizona\"},{\"value\":\"AR\",\"label\":\"Arkansas\"},{\"value\":\"CA\",\"label\":\"California\"},{\"value\":\"CO\",\"label\":\"Colorado\"},{\"value\":\"CT\",\"label\":\"Connecticut\"},{\"value\":\"DE\",\"label\":\"Delaware\"},{\"value\":\"DC\",\"label\":\"District of Columbia\"},{\"value\":\"FL\",\"label\":\"Florida\"},{\"value\":\"GA\",\"label\":\"Georgia\"},{\"value\":\"HI\",\"label\":\"Hawaii\"},{\"value\":\"ID\",\"label\":\"Idaho\"},{\"value\":\"IL\",\"label\":\"Illinois\"},{\"value\":\"IN\",\"label\":\"Indiana\"},{\"value\":\"IA\",\"label\":\"Iowa\"},{\"value\":\"KS\",\"label\":\"Kansas\"},{\"value\":\"KY\",\"label\":\"Kentucky\"},{\"value\":\"LA\",\"label\":\"Louisiana\"},{\"value\":\"ME\",\"label\":\"Maine\"},{\"value\":\"MD\",\"label\":\"Maryland\"},{\"value\":\"MA\",\"label\":\"Massachusetts\"},{\"value\":\"MI\",\"label\":\"Michigan\"},{\"value\":\"MN\",\"label\":\"Minnesota\"},{\"value\":\"MS\",\"label\":\"Mississippi\"},{\"value\":\"MO\",\"label\":\"Missouri\"},{\"value\":\"MT\",\"label\":\"Montana\"},{\"value\":\"NE\",\"label\":\"Nebraska\"},{\"value\":\"NV\",\"label\":\"Nevada\"},{\"value\":\"NH\",\"label\":\"New Hampshire\"},{\"value\":\"NJ\",\"label\":\"New Jersey\"},{\"value\":\"NM\",\"label\":\"New Mexico\"},{\"value\":\"NY\",\"label\":\"New York\"},{\"value\":\"NC\",\"label\":\"North Carolina\"},{\"value\":\"ND\",\"label\":\"North Dakota\"},{\"value\":\"OH\",\"label\":\"Ohio\"},{\"value\":\"OK\",\"label\":\"Oklahoma\"},{\"value\":\"OR\",\"label\":\"Oregon\"},{\"value\":\"PA\",\"label\":\"Pennsylvania\"},{\"value\":\"RI\",\"label\":\"Rhode Island\"},{\"value\":\"SC\",\"label\":\"South Carolina\"},{\"value\":\"SD\",\"label\":\"South Dakota\"},{\"value\":\"TN\",\"label\":\"Tennessee\"},{\"value\":\"TX\",\"label\":\"Texas\"},{\"value\":\"UT\",\"label\":\"Utah\"},{\"value\":\"VT\",\"label\":\"Vermont\"},{\"value\":\"VA\",\"label\":\"Virginia\"},{\"value\":\"WA\",\"label\":\"Washington\"},{\"value\":\"WV\",\"label\":\"West Virginia\"},{\"value\":\"WI\",\"label\":\"Wisconsin\"},{\"value\":\"WY\",\"label\":\"Wyoming\"}],\"source\":\"custom\",\"target\":null,\"configuration\":null},\"VgLeAg426\":{\"hash\":\"VgLeAg426\",\"id\":9,\"type\":\"text\",\"handle\":\"city\",\"label\":\"City\",\"required\":false,\"instructions\":\"\",\"value\":\"\",\"placeholder\":\"\"},\"rMmkJ3VAV\":{\"type\":\"submit\",\"label\":\"Submit\",\"labelNext\":\" Next\",\"labelPrev\":\"Previous\",\"disablePrev\":false,\"position\":\"left\",\"inputAttributes\":[{\"attribute\":\"\",\"value\":\"\"}]},\"page1\":{\"type\":\"page\",\"label\":\"Page 2\"},\"Bb10jE4K3\":{\"hash\":\"Bb10jE4K3\",\"id\":15,\"type\":\"radio_group\",\"handle\":\"cdla\",\"label\":\"Do you have a current valid CDL-A?\",\"required\":false,\"instructions\":\"\",\"showCustomValues\":false,\"value\":\"\",\"options\":[{\"label\":\"Yes\",\"value\":\"Yes\"},{\"label\":\"No\",\"value\":\"No\"}],\"source\":\"custom\",\"target\":null,\"configuration\":null,\"oneLine\":true},\"AV34dy07p\":{\"hash\":\"AV34dy07p\",\"id\":16,\"type\":\"select\",\"handle\":\"cdlaYears\",\"label\":\"How many Years of CDL A Driver Experience do you have?\",\"required\":false,\"instructions\":\"\",\"showCustomValues\":false,\"value\":\"0-1 years\",\"options\":[{\"label\":\"0-1 years\",\"value\":\"0-1 years\"},{\"label\":\"1-3 years\",\"value\":\"1-3 years\"},{\"label\":\"3-6 years\",\"value\":\"3-6 years\"},{\"label\":\"6+ years\",\"value\":\"6+ years\"}],\"source\":\"custom\",\"target\":null,\"configuration\":null,\"values\":[]},\"page2\":{\"type\":\"page\",\"label\":\"Page 3\"},\"DBk0Xw4YJ\":{\"hash\":\"DBk0Xw4YJ\",\"id\":17,\"type\":\"radio_group\",\"handle\":\"driveRecord\",\"label\":\"Do you have a clean driving record?\",\"required\":false,\"instructions\":\"\",\"showCustomValues\":false,\"value\":\"Yes\",\"options\":[{\"label\":\"Yes\",\"value\":\"Yes\"},{\"label\":\"No\",\"value\":\"No\"}],\"source\":\"custom\",\"target\":null,\"configuration\":null},\"gGp461ZwQ\":{\"hash\":\"gGp461ZwQ\",\"id\":18,\"type\":\"select\",\"handle\":\"terminal\",\"label\":\"Which terminal are you interested in?\",\"required\":false,\"instructions\":\"\",\"showCustomValues\":false,\"value\":\"Tennesee\",\"options\":[{\"label\":\"Tennesee\",\"value\":\"Tennesee\"},{\"label\":\"Alabama\",\"value\":\"Alabama\"},{\"label\":\"Georgia\",\"value\":\"Georgia\"},{\"label\":\"Kentucky\",\"value\":\"Kentucky\"}],\"source\":\"custom\",\"target\":null,\"configuration\":null},\"jRpqWm1zb\":{\"type\":\"submit\",\"label\":\"Submit\",\"labelNext\":\"Next\",\"labelPrev\":\"Back\",\"disablePrev\":false,\"position\":\"left\",\"inputAttributes\":[[]]},\"vG8AKJMRD\":{\"type\":\"submit\",\"label\":\"Submit\",\"labelNext\":\"Next\",\"labelPrev\":\"Back\",\"disablePrev\":false,\"position\":\"left\"},\"page3\":{\"type\":\"page\",\"label\":\"Page 4\"},\"Jvb4m946X\":{\"hash\":\"Jvb4m946X\",\"id\":19,\"type\":\"checkbox\",\"handle\":\"consent\",\"label\":\"I hereby consent to receive email text and autodialed and or pre-recorded telemarketing calls from or on behalf of Boyd Bros at the email address and telephone number provided.\",\"required\":false,\"instructions\":\"\",\"value\":\"Yes\",\"checked\":false},\"8RGzYqDm6\":{\"type\":\"submit\",\"label\":\"Submit\",\"labelNext\":\"Submit\",\"labelPrev\":\"Back\",\"disablePrev\":false,\"position\":\"left\"},\"37zaG92gw\":{\"type\":\"html\",\"label\":\"HTML\",\"value\":\"\\n<blockquote class=\\\"blockquote\\\">\\n<p class=\\\"small\\\">What are our drives saying?<span class=\\\"line\\\"><\\/span><\\/p>\\n  <p class=\\\"mb-0 bold\\\">I am very happy with the way things are rolling these days!<\\/p>\\n  <footer class=\\\"blockquote-footer\\\">Joe B., Boyd Bros. <br> Independent Contractor <cite title=\\\"Source Title\\\">Source Title<\\/cite><\\/footer>\\n<\\/blockquote>\\n\"},\"QrnEGrVMn\":{\"type\":\"html\",\"label\":\"HTML\",\"value\":\"\\n<blockquote class=\\\"blockquote\\\">\\n<p class=\\\"small\\\">What are our drives saying?<span class=\\\"line\\\"><\\/span><\\/p>\\n  <p class=\\\"mb-0 bold\\\">I am very happy with the way things are rolling these days!<\\/p>\\n  <footer class=\\\"blockquote-footer\\\">Joe B., Boyd Bros. <br> Independent Contractor <cite title=\\\"Source Title\\\">Source Title<\\/cite><\\/footer>\\n<\\/blockquote>\\n\"},\"Rq5E3qvzV\":{\"type\":\"html\",\"label\":\"HTML\",\"value\":\"\\n<blockquote class=\\\"blockquote\\\">\\n<p class=\\\"small\\\">What are our drives saying?<span class=\\\"line\\\"><\\/span><\\/p>\\n  <p class=\\\"mb-0 bold\\\">Great Company to work for. They truly treat their drivers like family<\\/p>\\n  <footer class=\\\"blockquote-footer\\\">Andrew Q., Boyd Bros. <br> Lease Purchase <cite title=\\\"Source Title\\\">Source Title<\\/cite><\\/footer>\\n<\\/blockquote>\\n\"},\"QrnEGmNE8\":{\"type\":\"html\",\"label\":\"HTML\",\"value\":\"\\n<blockquote class=\\\"blockquote\\\">\\n<p class=\\\"small\\\">What are our drives saying?<span class=\\\"line\\\"><\\/span><\\/p>\\n<p class=\\\"mb-0 bold\\\">Great Company to work for. They truly treat their drivers like family<\\/p>\\n  <footer class=\\\"blockquote-footer\\\">Andrew Q., Boyd Bros. <br> Lease Purchase <cite title=\\\"Source Title\\\">Source Title<\\/cite><\\/footer>\\n<\\/blockquote>\\n\"}}},\"context\":{\"page\":0,\"hash\":\"rMmkJ3VAV\"}}', '', 2, NULL, '#9a7e51', NULL, NULL, '', '', '2020-03-26 13:52:55', '2020-03-26 23:15:30', '36eed497-ad43-44fb-9f58-d21f997a3f15'),
(2, 'survey', 'survey', 0, '{{ dateCreated|date(\"Y-m-d H:i:s\") }}', '', '{\"composer\":{\"layout\":[[{\"id\":\"oBdOR9DM2\",\"columns\":[\"n5deb50bB\"]},{\"id\":\"E2dExJvWy\",\"columns\":[\"qlRZRw4XA\"]},{\"id\":\"6E9zgkrdN\",\"columns\":[\"dV8ZM8eob\"]},{\"id\":\"zEBrkyBqL\",\"columns\":[\"PN5Z8a4AM\"]},{\"id\":\"15DzgDGWM\",\"columns\":[\"Xna0EwZ32\"]}]],\"properties\":{\"page0\":{\"type\":\"page\",\"label\":\"Page 1\"},\"form\":{\"type\":\"form\",\"name\":\"survey\",\"handle\":\"survey\",\"color\":\"#bbcf79\",\"submissionTitleFormat\":\"{{ dateCreated|date(\\\"Y-m-d H:i:s\\\") }}\",\"description\":\"\",\"formTemplate\":\"flexbox.html\",\"returnUrl\":\"\",\"storeData\":true,\"defaultStatus\":2,\"ajaxEnabled\":false},\"integration\":{\"type\":\"integration\",\"integrationId\":0,\"mapping\":[]},\"connections\":{\"type\":\"connections\",\"list\":null},\"rules\":{\"type\":\"rules\",\"list\":[]},\"admin_notifications\":{\"type\":\"admin_notifications\",\"notificationId\":0,\"recipients\":\"\"},\"payment\":{\"type\":\"payment\",\"integrationId\":0,\"mapping\":[]},\"n5deb50bB\":{\"hash\":\"n5deb50bB\",\"id\":20,\"type\":\"radio_group\",\"handle\":\"infoScale\",\"label\":\"I wish this site had more info about..\",\"required\":false,\"instructions\":\"\",\"showCustomValues\":false,\"value\":\"This site was very informative - no changes\",\"options\":[{\"label\":\"This site was very informative - no changes\",\"value\":\"This site was very informative - no changes\"},{\"label\":\"Benefits\",\"value\":\"Benefits\"},{\"label\":\"Boyd Bros Culture\",\"value\":\"Boyd Bros Culture\"},{\"label\":\"Boyd Bros Managment\",\"value\":\"Boyd Bros Managment\"},{\"label\":\"Job Descriptions\",\"value\":\"Job Descriptions\"},{\"label\":\"Safety Programs\",\"value\":\"Safety Programs\"},{\"label\":\"Bonus Programs\",\"value\":\"Bonus Programs\"}],\"source\":\"custom\",\"target\":null,\"configuration\":null,\"values\":[],\"oneLine\":false,\"inputAttributes\":[{\"attribute\":\"class \",\"value\":\"form-check-input\"},{\"attribute\":\"type\",\"value\":\"radio\"}]},\"qlRZRw4XA\":{\"hash\":\"qlRZRw4XA\",\"id\":21,\"type\":\"textarea\",\"handle\":\"additionalComments\",\"label\":\"Additional Comments\",\"required\":false,\"instructions\":\"\",\"value\":\"\",\"placeholder\":\"\",\"rows\":2},\"dV8ZM8eob\":{\"hash\":\"dV8ZM8eob\",\"id\":22,\"type\":\"radio_group\",\"handle\":\"accomplish\",\"label\":\"Did you accomplish the goal of your visit?\",\"required\":false,\"instructions\":\"\",\"showCustomValues\":false,\"value\":\"Yes\",\"options\":[{\"label\":\"Yes\",\"value\":\"Yes\"},{\"label\":\"No\",\"value\":\"No\"}],\"source\":\"custom\",\"target\":null,\"configuration\":null,\"oneLine\":true},\"PN5Z8a4AM\":{\"hash\":\"PN5Z8a4AM\",\"id\":23,\"type\":\"rating\",\"handle\":\"rating\",\"label\":\"I found this site easy to use\",\"required\":false,\"instructions\":\"\",\"value\":0,\"maxValue\":5,\"colorIdle\":\"#ddd\",\"colorHover\":\"#1dfa12\",\"colorSelected\":\"#1bff4f\"},\"Xna0EwZ32\":{\"hash\":\"Xna0EwZ32\",\"id\":24,\"type\":\"textarea\",\"handle\":\"improve\",\"label\":\"What can we do to imporve your experience?\",\"required\":false,\"instructions\":\"\",\"value\":\"\",\"placeholder\":\"\",\"rows\":2}}},\"context\":{\"page\":0,\"hash\":\"n5deb50bB\"}}', '', 2, NULL, '#bbcf79', NULL, NULL, '', '', '2020-03-27 03:21:36', '2020-03-27 04:38:39', '08c9cb61-dc8c-4782-8f51-5385cd3ef0fb');

-- --------------------------------------------------------

--
-- Table structure for table `freeform_integrations`
--

CREATE TABLE `freeform_integrations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `accessToken` varchar(255) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `forceUpdate` tinyint(1) DEFAULT 0,
  `lastUpdate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `freeform_integrations_queue`
--

CREATE TABLE `freeform_integrations_queue` (
  `id` int(11) NOT NULL,
  `submissionId` int(11) NOT NULL,
  `integrationType` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `fieldHash` varchar(20) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `freeform_mailing_lists`
--

CREATE TABLE `freeform_mailing_lists` (
  `id` int(11) NOT NULL,
  `integrationId` int(11) NOT NULL,
  `resourceId` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `memberCount` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `freeform_mailing_list_fields`
--

CREATE TABLE `freeform_mailing_list_fields` (
  `id` int(11) NOT NULL,
  `mailingListId` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `required` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `freeform_notifications`
--

CREATE TABLE `freeform_notifications` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `fromName` varchar(255) NOT NULL,
  `fromEmail` varchar(255) NOT NULL,
  `replyToEmail` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `bodyHtml` text DEFAULT NULL,
  `bodyText` text DEFAULT NULL,
  `includeAttachments` tinyint(1) DEFAULT 1,
  `presetAssets` varchar(255) DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `freeform_payments_payments`
--

CREATE TABLE `freeform_payments_payments` (
  `id` int(11) NOT NULL,
  `integrationId` int(11) NOT NULL,
  `submissionId` int(11) NOT NULL,
  `subscriptionId` int(11) DEFAULT NULL,
  `resourceId` varchar(50) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `last4` smallint(6) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `metadata` mediumtext DEFAULT NULL,
  `errorCode` varchar(20) DEFAULT NULL,
  `errorMessage` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `freeform_payments_subscriptions`
--

CREATE TABLE `freeform_payments_subscriptions` (
  `id` int(11) NOT NULL,
  `integrationId` int(11) NOT NULL,
  `submissionId` int(11) NOT NULL,
  `planId` int(11) NOT NULL,
  `resourceId` varchar(50) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `interval` varchar(20) DEFAULT NULL,
  `intervalCount` smallint(6) DEFAULT NULL,
  `last4` smallint(6) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `metadata` mediumtext DEFAULT NULL,
  `errorCode` varchar(20) DEFAULT NULL,
  `errorMessage` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `freeform_payments_subscription_plans`
--

CREATE TABLE `freeform_payments_subscription_plans` (
  `id` int(11) NOT NULL,
  `integrationId` int(11) NOT NULL,
  `resourceId` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `freeform_payment_gateway_fields`
--

CREATE TABLE `freeform_payment_gateway_fields` (
  `id` int(11) NOT NULL,
  `integrationId` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `required` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `freeform_spam_reason`
--

CREATE TABLE `freeform_spam_reason` (
  `id` int(11) NOT NULL,
  `submissionId` int(11) NOT NULL,
  `reasonType` varchar(100) NOT NULL,
  `reasonMessage` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `freeform_statuses`
--

CREATE TABLE `freeform_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `color` varchar(30) DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `freeform_statuses`
--

INSERT INTO `freeform_statuses` (`id`, `name`, `handle`, `color`, `isDefault`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Pending', 'pending', 'light', NULL, 1, '2020-03-26 13:29:56', '2020-03-26 13:29:56', 'cf8980b4-3c55-4522-8ec6-f976605ba919'),
(2, 'Open', 'open', 'green', 1, 2, '2020-03-26 13:29:56', '2020-03-26 13:29:56', '18ea26ae-a40f-4144-936a-8867582367d8'),
(3, 'Closed', 'closed', 'grey', NULL, 3, '2020-03-26 13:29:56', '2020-03-26 13:29:56', '67432bbd-6179-4b40-8bd4-c7b2fc1ea8b8');

-- --------------------------------------------------------

--
-- Table structure for table `freeform_submissions`
--

CREATE TABLE `freeform_submissions` (
  `id` int(11) NOT NULL,
  `incrementalId` int(11) NOT NULL,
  `statusId` int(11) DEFAULT NULL,
  `formId` int(11) NOT NULL,
  `token` varchar(100) NOT NULL,
  `ip` varchar(46) DEFAULT NULL,
  `isSpam` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_1` varchar(100) DEFAULT NULL,
  `field_2` varchar(100) DEFAULT NULL,
  `field_3` text DEFAULT NULL,
  `field_4` varchar(100) DEFAULT NULL,
  `field_5` varchar(100) DEFAULT NULL,
  `field_6` varchar(100) DEFAULT NULL,
  `field_7` varchar(100) DEFAULT NULL,
  `field_8` text DEFAULT NULL,
  `field_9` varchar(100) DEFAULT NULL,
  `field_10` varchar(100) DEFAULT NULL,
  `field_11` varchar(100) DEFAULT NULL,
  `field_12` text DEFAULT NULL,
  `field_13` varchar(100) DEFAULT NULL,
  `field_14` varchar(100) DEFAULT NULL,
  `field_15` varchar(100) DEFAULT NULL,
  `field_16` varchar(100) DEFAULT NULL,
  `field_17` varchar(100) DEFAULT NULL,
  `field_18` varchar(100) DEFAULT NULL,
  `field_19` varchar(100) DEFAULT NULL,
  `field_20` varchar(100) DEFAULT NULL,
  `field_21` text DEFAULT NULL,
  `field_22` varchar(100) DEFAULT NULL,
  `field_23` varchar(100) DEFAULT NULL,
  `field_24` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `freeform_submissions`
--

INSERT INTO `freeform_submissions` (`id`, `incrementalId`, `statusId`, `formId`, `token`, `ip`, `isSpam`, `dateCreated`, `dateUpdated`, `uid`, `field_1`, `field_2`, `field_3`, `field_4`, `field_5`, `field_6`, `field_7`, `field_8`, `field_9`, `field_10`, `field_11`, `field_12`, `field_13`, `field_14`, `field_15`, `field_16`, `field_17`, `field_18`, `field_19`, `field_20`, `field_21`, `field_22`, `field_23`, `field_24`) VALUES
(150, 1, 2, 1, 'laEmIAVupFgLuWlYb0tp0d5edGyJEV8OmuSdgFyWRbbGEE5c7so95ZhXI4DCNZPvzQPST2nkqNZt1p5yU43xDW23zLU6fxivZPNc', '::1', 0, '2020-03-26 14:12:53', '2020-03-26 14:12:53', '206d7a59-f527-4dec-b539-2de218e90014', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', 'Yes', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(151, 2, 2, 1, 'nv3d0YgmXLkGmt4IFiJbcfCFioDh3yFrwGMdewaM72Vfa5KZAmzgneJyFDqSn3xj50XBEKQ1znSZTNaI12UhMnwiTQIgqdpizOHh', '::1', 0, '2020-03-26 14:14:31', '2020-03-26 14:14:31', 'da7dd1d6-b30f-4f7b-b7b1-26432b1519ea', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', 'Yes', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(152, 3, 2, 1, '2g5rWDrAyP51JVlvylwghR3PKhQJ7dWIgTXVQzDY2ZZcfrrSPT4yPRBky5xd3hL2VnxjrL2vkf89b6AEiSSTfa99SSa4AI9UhdEr', '::1', 0, '2020-03-26 14:33:40', '2020-03-26 14:33:40', 'ff79d3b9-76cc-45e6-a711-ce8fbf3178f1', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(153, 4, 2, 1, '0O5WIhvyYPiGeoupn6nd2zPqSSPAFcNZLUx3qUzmz3nyE4aiziYQn4tN5rlMPVInDIbspCEaGhG69sEDkMsbwuEvAIggERKta6Js', '::1', 0, '2020-03-26 14:38:18', '2020-03-26 14:38:18', 'e4606b0d-ee47-4669-a74c-d8b4b5c811e9', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(154, 5, 2, 1, '13ITiZyXEApZ1Tk26OtkoY8rTbWuVYBDFYvLK2E1tMX7owGZMkFj9aSKoXUWdOYjSJ1nVYDdo1GvcbYdGYlGosSxRfcIgZhe8uvB', '::1', 0, '2020-03-26 14:49:34', '2020-03-26 14:49:34', '99ae93d2-3d03-4792-9f55-94f183101638', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(155, 6, 2, 1, 'Afy8xPTPSS4LZOiLtRJAzhe7ZqmOZOsf2n0WIaio1A3DCIyPiBz91vS3J3VOZDOn4206G5xDHr1xDBAkgRc1KHuTmRzeNYhYhvdO', '::1', 0, '2020-03-26 15:05:44', '2020-03-26 15:05:44', '63e49c7d-258f-41f2-9976-fdc02eed0cad', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(156, 7, 2, 1, 'rhs7P2peD8GFnd4cJTtxFZEkKMhki1fJBy87LeocMSMw8k5pLFuf3tuTL6Fi1cEKfh1P6ZrJaZw3nif8ye0X3SNMbZzqJaBe0H1U', '::1', 0, '2020-03-26 15:07:38', '2020-03-26 15:07:38', 'd5a247ee-34b0-4d02-919c-0c3397aebe04', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(157, 8, 2, 1, 'VhuMSJSCPMTlimMO5HLtEpWrZEtYIBZrue3iMtw5m99VTGBxkRgzrE4Cm3C28vvH93nlHIjs6QZk2XvBrLXbthcDy9IFfeIFGoLH', '::1', 0, '2020-03-26 15:40:47', '2020-03-26 15:40:47', '923c287e-b802-4975-a124-f120dada02c2', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(158, 9, 2, 1, 'UxFeqhezSPRu6bEW8mWERY1aATheT8biYAgAGGP2q4PFJQid9i4GDRQyciunhBsAOOLLO0OFpPBeU50JiRbXwVY5ne5a0mQkMYwQ', '::1', 0, '2020-03-26 16:15:23', '2020-03-26 16:15:23', 'd0ca44a8-976d-4d73-9729-c33e55c91d5b', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(159, 10, 2, 1, 'tQEa1aIN4qHpxxyzN452EdSpw2l7gwsP8h5zVNLRuNblhX6ojKbG9omwbFSXWl3epSHp73MJPGraY0uN8gt9Av1aTs9uHxLn2Ai4', '::1', 0, '2020-03-26 16:46:23', '2020-03-26 16:46:23', 'eda1bb55-d100-4269-887f-b4ac025b10ad', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(160, 11, 2, 1, 'lY6e4XJJQDjeDOYatksKofpAOrRdoYwqZ3FSAeF9z983DWgEla1r6je6pA8GHcdKaKOONrzufJ1T2zCjbRSqt7OT3Ylsi3FSD7lf', '::1', 0, '2020-03-26 20:20:49', '2020-03-26 20:20:49', '51873d40-3943-4881-a8a6-75f0ca08fbaa', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(161, 12, 2, 1, 'DwMezP6TRYgYJpbPAn9mc7TOn2njqYyHdnp9pV6G9lqYBnWDCNB2YNOS7kTs5bO9V1rq59MvYPUiNHfewwL9WBJZgZoNZWNJA78P', '::1', 0, '2020-03-26 22:53:56', '2020-03-26 22:53:56', '394a7ccf-a3a4-4990-baeb-a2d4ab48f937', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(162, 13, 2, 1, '9B5W2C0ZHGhwMT9L7hLQHkMOaISr9TcY2mAn7opN3U8DZEdkTXRN4jW9zYh5M27rNouJat6BLvpHIQGp40dWvLJQOSKqB9MyMdCV', '::1', 0, '2020-03-26 22:55:13', '2020-03-26 22:55:13', '8f36e4d0-1d17-403e-b7de-b2fd05632ee5', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(163, 14, 2, 1, 'Hs30LOHWQkachGmqKpI5RhP83wkgPMtXwsVTTQs2ME0C1V6Ij0Exp3sqSVCOlxPPO3YpI15Ru2I3CS2pjfCAKStQem2R10poVnC6', '::1', 0, '2020-03-26 23:11:43', '2020-03-26 23:11:43', '6f87fc79-2022-4e27-9346-2e4856f86ae4', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(164, 15, 2, 1, 'nPXR1WhFWxuejUet5GxWGTCMRzuOHfMXkS4s3rgAFEzvdAI02pdgHvNTUtsP8o33bPsTX2pOSczL4t8Ay3eciaPw56zzLwZ17hNV', '::1', 0, '2020-03-26 23:21:26', '2020-03-26 23:21:26', 'b6a076ef-c1a3-4dc7-8f23-48faa7273ab9', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(165, 16, 2, 1, '4EFAhfcLKMvE8BbUO9XkPjGfmbKRukQPYATNBMICryQYrsABt8r4J6ADE3v4x3FQVgpTfy1AY7NlcEY5R1FaZwmHTT6Kxfdy7Wko', '::1', 0, '2020-03-26 23:23:38', '2020-03-26 23:23:38', '9f85b2b0-111b-40ad-acd9-2ef596780320', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(166, 17, 2, 1, 'sqWrw8yoKpHjhIPCKUG1LOI6fEwcgNa8wCxon06JcEtQ1INcOM7ZEGTnotiEjaITsotu3mmAdqMxUpkiygS9jnW4oKBZFmiBFkI9', '::1', 0, '2020-03-26 23:24:33', '2020-03-26 23:24:33', '36e4cec8-6c3a-4a27-8aec-794ae355812e', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(167, 18, 2, 1, 'zwE7YIb5ids87hyoFukz3aQR5fYr5dj69shd8Sil1G16EsQsUSWiIiyu82B1gDC5agMqfxjUVkrjwBSE0cZbr4EoOznVIpIIKm37', '::1', 0, '2020-03-26 23:25:10', '2020-03-26 23:25:10', '57f94e0c-224c-488e-b5b7-0f8a7689aae8', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', '', '', NULL, NULL, NULL, NULL, NULL),
(168, 19, 2, 1, 'XGX77XEQYwydUHXVhd626osjJyB7vYOVfFrD3YFmwrvh3zHiWs4HN1E2z1leuwpCCFiTIZ9z7Ys1FmJfzePRT3DjXIVXUahHDj7b', '::1', 0, '2020-03-26 23:26:42', '2020-03-26 23:26:42', '73256225-8fdb-49d7-8f5f-a8c4a9fc53b2', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', '', '', NULL, NULL, NULL, NULL, NULL),
(169, 20, 2, 1, 'l0P4DK0demlTcQ1lhAq7CPjDBw2qriLvZYuSWwiJdJTandeWZWcgvuMQIT32K0OMm0HyOilxXRaegTq0gNZWtUTJOkuHTslK7ujf', '::1', 0, '2020-03-26 23:27:40', '2020-03-26 23:27:40', '8468c9f8-0746-4061-9b32-26fb279fcd1f', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(170, 21, 2, 1, 'M0avgo3S21b2pw5meR0UXOPwAj9r09St2IEdNcQCeAC8gx85UXuONp8WESwgL4lc5Iwdd3lJGdxFdc6LIta1OU8KmPgMJhmqDfF5', '::1', 0, '2020-03-26 23:29:55', '2020-03-26 23:29:55', '2031db62-2edb-4752-9dc3-652d353f68e1', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(171, 22, 2, 1, 'Vi44zSj7w0Kr4T5XOD3TFiYmM0eBSeWP41Abtx2qHtw5vS0ciAFu3sORU61X3pYlWxadeH5KfRJjxYwSG5AepoPIbvyWDF8r7Npm', '::1', 0, '2020-03-26 23:33:46', '2020-03-26 23:33:46', 'a47f94cc-9e4f-498d-b2da-af355485a332', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', '', '', NULL, NULL, NULL, NULL, NULL),
(172, 23, 2, 1, 'R3h96fK7L38gxztMG2MpbwMQZHX4F8pzVb1n2mVuz20c5ACKFhmmFjRdAHCYkYpCbwO03ZScXgOeYXXgJ6o1Rz4bCwYiMiDBGaLZ', '::1', 0, '2020-03-26 23:50:40', '2020-03-26 23:50:40', '85f2d462-a558-4d68-b9cb-d6ded5605607', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(173, 24, 2, 1, '5buDBpt4ovgY1f6DDp4NYEBHboUWEhp5QfvRmMIf6iG2vDjZgrhrKsi3f6xIUpyIxG4ddFjIcNJQvgkbGp6kjXfmtlkUjhk6Ll6E', '::1', 0, '2020-03-27 01:16:15', '2020-03-27 01:16:15', '1d75b111-bc43-4bbc-b8ea-ae6232e7090a', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(174, 25, 2, 1, 'SVqWkdEnAmDh0gnMDrvwBDsErzNZZ0jFP9sokw1y0VCoU6GTHsegEqAwXlrBj29buWpRMN5AF2NZCPURJvBEyrZ0NpuUpY0dCxHs', '::1', 0, '2020-03-27 15:19:57', '2020-03-27 15:19:57', '59c3dd9f-8198-45a5-ba45-e7db3cbc9c67', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL),
(175, 26, 2, 1, 'b01zcNeApC6C9lQTw60aViGneqfTJUTivUTZoOvIYaSw8jPPFpnFpY4Ap3qfu1xNPiu0QENasqaXgZbqi0lSDVP4kdkP1wmaYtjp', '::1', 0, '2020-03-27 15:27:52', '2020-03-27 15:27:52', 'cfe10b6c-3d91-4235-b71d-d7543bcbb932', '', '', '[\"\"]', NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', '0-1 years', '', 'Tennesee', '', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `freeform_submission_notes`
--

CREATE TABLE `freeform_submission_notes` (
  `id` int(11) NOT NULL,
  `submissionId` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `freeform_unfinalized_files`
--

CREATE TABLE `freeform_unfinalized_files` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `freeform_webhooks`
--

CREATE TABLE `freeform_webhooks` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `webhook` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `freeform_webhooks_form_relations`
--

CREATE TABLE `freeform_webhooks_form_relations` (
  `id` int(11) NOT NULL,
  `webhookId` int(11) NOT NULL,
  `formId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gqlschemas`
--

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `scope` text DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gqltokens`
--

CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configMap` mediumtext DEFAULT NULL,
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configMap`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.4.14', '3.4.10', 0, '[]', 'da3iXx7KDxRv', '2020-03-23 05:11:44', '2020-04-07 15:51:47', '0d39f8c6-b964-4e24-bb7a-bc9842925580');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocks`
--

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocktypes`
--

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `pluginId`, `type`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'app', 'Install', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '42a3f266-7eb7-4809-b649-f552804d3784'),
(2, NULL, 'app', 'm150403_183908_migrations_table_changes', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '953423b8-b6c0-46a5-9931-ff1603ddd8e4'),
(3, NULL, 'app', 'm150403_184247_plugins_table_changes', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '22b289c1-22b3-4a6f-a277-2bc9efc0f30e'),
(4, NULL, 'app', 'm150403_184533_field_version', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '0cec0cc1-541d-4f41-8aa0-bc95dcd92c6a'),
(5, NULL, 'app', 'm150403_184729_type_columns', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '3b3648ef-656c-47eb-8ab7-ddeb9e456717'),
(6, NULL, 'app', 'm150403_185142_volumes', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '07e7ce70-c810-4298-b217-dad0879010fb'),
(7, NULL, 'app', 'm150428_231346_userpreferences', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'ded2fc7d-35b9-4963-bf67-75db5f8f95e8'),
(8, NULL, 'app', 'm150519_150900_fieldversion_conversion', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'e2fa1fbc-634e-4375-b28f-6cd4bac870ae'),
(9, NULL, 'app', 'm150617_213829_update_email_settings', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'c35f2647-aa72-4548-91d0-c2abe0bf628a'),
(10, NULL, 'app', 'm150721_124739_templatecachequeries', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'fcd3f2e0-af95-481f-b51d-4468472b06ca'),
(11, NULL, 'app', 'm150724_140822_adjust_quality_settings', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'e9aae9dc-858a-4da1-a6fc-55e11f846fdb'),
(12, NULL, 'app', 'm150815_133521_last_login_attempt_ip', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '31794aa1-3460-42e5-8224-5c0a9b3639c0'),
(13, NULL, 'app', 'm151002_095935_volume_cache_settings', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '6172f7bd-4999-4cf8-ac2f-1fb2583cfabb'),
(14, NULL, 'app', 'm151005_142750_volume_s3_storage_settings', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '00a447b3-afb0-4467-bc19-0b7e95026893'),
(15, NULL, 'app', 'm151016_133600_delete_asset_thumbnails', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '232bc829-c177-4db9-bd09-3cf95db4b6b5'),
(16, NULL, 'app', 'm151209_000000_move_logo', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '50d75e18-6ce2-49d9-a2b6-0cc8d12b15c3'),
(17, NULL, 'app', 'm151211_000000_rename_fileId_to_assetId', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '35015f9b-6982-468c-bf12-5d71815adadf'),
(18, NULL, 'app', 'm151215_000000_rename_asset_permissions', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'd69a0029-7dca-419f-9882-7f5dc60435bc'),
(19, NULL, 'app', 'm160707_000001_rename_richtext_assetsource_setting', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '7de12226-72e2-446f-b331-857190273cef'),
(20, NULL, 'app', 'm160708_185142_volume_hasUrls_setting', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '4852613b-f200-4d7f-a09b-578aca7b9ab8'),
(21, NULL, 'app', 'm160714_000000_increase_max_asset_filesize', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'e3463105-7a0f-4a77-9923-e9be22e79b8f'),
(22, NULL, 'app', 'm160727_194637_column_cleanup', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '41e15211-8100-42ae-a3ad-bd861a9343f4'),
(23, NULL, 'app', 'm160804_110002_userphotos_to_assets', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'f56f330b-ae36-45ba-b33f-c01e2e8393f4'),
(24, NULL, 'app', 'm160807_144858_sites', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'f2c6720e-0d0a-4819-8b3b-f8c78ecf3f9c'),
(25, NULL, 'app', 'm160829_000000_pending_user_content_cleanup', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'c373fd6f-dbe2-44a5-93c6-eff602c36472'),
(26, NULL, 'app', 'm160830_000000_asset_index_uri_increase', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'e1121493-f083-475f-a6d7-25644afeb74c'),
(27, NULL, 'app', 'm160912_230520_require_entry_type_id', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'b89e3a22-e447-4923-a07d-138e4f97e69d'),
(28, NULL, 'app', 'm160913_134730_require_matrix_block_type_id', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'e6b90393-34e1-4b80-acac-23a531b33ed8'),
(29, NULL, 'app', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '16bdc51e-043f-41b2-8270-e88f76a52a6c'),
(30, NULL, 'app', 'm160920_231045_usergroup_handle_title_unique', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '20cfded8-d87e-4b05-af19-d8797bd7525a'),
(31, NULL, 'app', 'm160925_113941_route_uri_parts', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'fe438c15-7677-45e8-b7d3-65ebf64c3f8e'),
(32, NULL, 'app', 'm161006_205918_schemaVersion_not_null', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '98c3e961-2db9-4120-b406-cfb71f3d3225'),
(33, NULL, 'app', 'm161007_130653_update_email_settings', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'dd11c790-8233-467b-ac77-68890a3a7132'),
(34, NULL, 'app', 'm161013_175052_newParentId', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '5b01b6bd-f227-48a6-829a-3969e602ef04'),
(35, NULL, 'app', 'm161021_102916_fix_recent_entries_widgets', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'f38df721-f741-4c36-a97e-76df5d54b50b'),
(36, NULL, 'app', 'm161021_182140_rename_get_help_widget', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '00171be3-aa01-4b30-96a2-1af6e2c5830f'),
(37, NULL, 'app', 'm161025_000000_fix_char_columns', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '82a6d46d-55d6-43b4-8dc8-32925f579273'),
(38, NULL, 'app', 'm161029_124145_email_message_languages', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '7bc3838a-8960-4ffa-990a-8eca1f0bcac2'),
(39, NULL, 'app', 'm161108_000000_new_version_format', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'db74d421-f989-45ba-80f4-66d9b3f8b6f9'),
(40, NULL, 'app', 'm161109_000000_index_shuffle', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '179e8225-75ed-4964-ac72-42407b10e0bb'),
(41, NULL, 'app', 'm161122_185500_no_craft_app', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2150204f-1a4f-4df0-bec2-839732227f78'),
(42, NULL, 'app', 'm161125_150752_clear_urlmanager_cache', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '45bf44b6-d3c6-4223-9683-e9ca024a7f09'),
(43, NULL, 'app', 'm161220_000000_volumes_hasurl_notnull', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '8225c794-ffae-4593-bd4f-ff16527476f4'),
(44, NULL, 'app', 'm170114_161144_udates_permission', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '92952b94-b478-4b5a-b87f-3745ab10bdb2'),
(45, NULL, 'app', 'm170120_000000_schema_cleanup', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '68d8ca45-bedd-4a87-9c83-a515f0213777'),
(46, NULL, 'app', 'm170126_000000_assets_focal_point', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'ea0d684a-6453-4802-8aa8-b6e84931ac2c'),
(47, NULL, 'app', 'm170206_142126_system_name', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'bac38ef9-fc44-4dfd-a5c5-8c134f1a71c2'),
(48, NULL, 'app', 'm170217_044740_category_branch_limits', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '1bb81bfb-1f96-415e-b8b2-3e32dfc79237'),
(49, NULL, 'app', 'm170217_120224_asset_indexing_columns', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '42343bfa-99ea-4e44-887d-2407181a5cd1'),
(50, NULL, 'app', 'm170223_224012_plain_text_settings', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '1ed5aa25-cb79-49fd-adee-41786ec72d80'),
(51, NULL, 'app', 'm170227_120814_focal_point_percentage', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '5220df87-6442-4fb3-a20b-cf802b58e243'),
(52, NULL, 'app', 'm170228_171113_system_messages', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '391e3cf3-1e01-4397-8811-f2051c871796'),
(53, NULL, 'app', 'm170303_140500_asset_field_source_settings', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '68831588-96a5-46f2-acd4-4623bab57684'),
(54, NULL, 'app', 'm170306_150500_asset_temporary_uploads', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '814ed04a-ae1c-49d9-a943-0aeab6255f7b'),
(55, NULL, 'app', 'm170523_190652_element_field_layout_ids', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '00957b42-45b3-4eb3-bb58-df8fd5b8ed3e'),
(56, NULL, 'app', 'm170612_000000_route_index_shuffle', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '330459aa-f17d-4fcf-a1f6-6a968f6a143f'),
(57, NULL, 'app', 'm170621_195237_format_plugin_handles', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '833c299c-9cc8-45ed-8feb-2f0cffce486d'),
(58, NULL, 'app', 'm170630_161027_deprecation_line_nullable', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '05d51d25-7f3e-49b1-8522-d1c8f9095ea5'),
(59, NULL, 'app', 'm170630_161028_deprecation_changes', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'b22ac235-15a4-41d2-840c-6777f4ddba6b'),
(60, NULL, 'app', 'm170703_181539_plugins_table_tweaks', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '8a300d5c-6c1c-44b5-8298-b8cf01331aba'),
(61, NULL, 'app', 'm170704_134916_sites_tables', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'be7e227a-c77a-4239-b919-62020716f774'),
(62, NULL, 'app', 'm170706_183216_rename_sequences', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '43cc32a6-2ad5-412b-8765-6128e3feae05'),
(63, NULL, 'app', 'm170707_094758_delete_compiled_traits', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '6e9f4af9-360f-47de-8e25-2453a89e8251'),
(64, NULL, 'app', 'm170731_190138_drop_asset_packagist', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '4c29a5c7-c608-4373-9c7a-0d25419f893b'),
(65, NULL, 'app', 'm170810_201318_create_queue_table', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '26b5e709-2f27-403d-84a8-99460f4707e5'),
(66, NULL, 'app', 'm170903_192801_longblob_for_queue_jobs', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '06032510-2421-4446-92eb-2a7c424f3771'),
(67, NULL, 'app', 'm170914_204621_asset_cache_shuffle', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'f2250897-0562-4793-8316-bfe45a0b58ba'),
(68, NULL, 'app', 'm171011_214115_site_groups', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'c63eaac8-0846-4f68-9355-6d35e19fc5ef'),
(69, NULL, 'app', 'm171012_151440_primary_site', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'bc6481e1-f3da-4ec8-9262-5c39b689a5d0'),
(70, NULL, 'app', 'm171013_142500_transform_interlace', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '29b12d09-17ea-456f-aa39-0b2108e9ebeb'),
(71, NULL, 'app', 'm171016_092553_drop_position_select', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '25bb78ec-4423-4b0e-9138-b2f609463bfe'),
(72, NULL, 'app', 'm171016_221244_less_strict_translation_method', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '37edd3ce-c45f-45d0-8ab7-cea3a46cd8e3'),
(73, NULL, 'app', 'm171107_000000_assign_group_permissions', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'a7562f1b-369d-4ee8-b535-1ec4645c6149'),
(74, NULL, 'app', 'm171117_000001_templatecache_index_tune', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '4d7a802d-7bd1-45d0-8845-daf852e11188'),
(75, NULL, 'app', 'm171126_105927_disabled_plugins', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'cfe1e531-0e5a-414a-8738-f84a59f8bb30'),
(76, NULL, 'app', 'm171130_214407_craftidtokens_table', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '102738b9-dee0-4a46-867f-64824442ee6f'),
(77, NULL, 'app', 'm171202_004225_update_email_settings', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '167ad015-67c6-407b-9912-25634e7931bc'),
(78, NULL, 'app', 'm171204_000001_templatecache_index_tune_deux', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '7dd956aa-dfb5-40e2-86c5-a11e28f97730'),
(79, NULL, 'app', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'ea9c2069-6438-40b0-86a9-2441203e3e71'),
(80, NULL, 'app', 'm171218_143135_longtext_query_column', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'fc265985-e84c-41cc-a17c-6b42882fde8e'),
(81, NULL, 'app', 'm171231_055546_environment_variables_to_aliases', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'e609b955-087a-423b-85ab-69e891c8651d'),
(82, NULL, 'app', 'm180113_153740_drop_users_archived_column', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '9858a86d-3729-4725-a243-99be1a8fc63c'),
(83, NULL, 'app', 'm180122_213433_propagate_entries_setting', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'e2ebb3a0-8f05-43a6-ac2a-0f030b0534d4'),
(84, NULL, 'app', 'm180124_230459_fix_propagate_entries_values', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '5b24841a-6a16-4cb2-b967-b65ee9623a0b'),
(85, NULL, 'app', 'm180128_235202_set_tag_slugs', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'bc6c6dad-4f35-4256-bb35-e272a87cacf5'),
(86, NULL, 'app', 'm180202_185551_fix_focal_points', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '60578c8b-dfa5-48b2-be5e-546271bf3ba1'),
(87, NULL, 'app', 'm180217_172123_tiny_ints', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '5eb29c52-eaad-4304-b255-e9943b26c447'),
(88, NULL, 'app', 'm180321_233505_small_ints', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '539dd9ef-345a-4ad1-9412-21a7bd0a02df'),
(89, NULL, 'app', 'm180328_115523_new_license_key_statuses', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'f0c05c4b-7c0f-4e9e-9145-9318f7627ff8'),
(90, NULL, 'app', 'm180404_182320_edition_changes', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '542f92a2-6e7c-4585-b4d9-10cf916ef801'),
(91, NULL, 'app', 'm180411_102218_fix_db_routes', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '83afff4e-2563-41cb-8acf-88113840dcd3'),
(92, NULL, 'app', 'm180416_205628_resourcepaths_table', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '3b6b9065-bcee-424d-97ab-3820aa8985b8'),
(93, NULL, 'app', 'm180418_205713_widget_cleanup', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'feb14958-9ac7-49ce-9f55-17dc822f00ee'),
(94, NULL, 'app', 'm180425_203349_searchable_fields', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'b6046d67-16fb-45eb-9cf5-537d1f24685f'),
(95, NULL, 'app', 'm180516_153000_uids_in_field_settings', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '5ff7fbb8-5c29-4484-bf29-607e2452ae76'),
(96, NULL, 'app', 'm180517_173000_user_photo_volume_to_uid', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '13984f2a-040c-4ea4-b8c4-183db7da4bed'),
(97, NULL, 'app', 'm180518_173000_permissions_to_uid', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'a744ae13-bf00-43b7-8d1b-4a570b00f1dd'),
(98, NULL, 'app', 'm180520_173000_matrix_context_to_uids', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '845013dd-e6be-4bf2-8b19-ef32099b233b'),
(99, NULL, 'app', 'm180521_172900_project_config_table', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'c9f03b8b-a4e5-427f-ad86-286beeee8a9a'),
(100, NULL, 'app', 'm180521_173000_initial_yml_and_snapshot', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'b7f3d315-3622-4a12-8b57-168a0e31059e'),
(101, NULL, 'app', 'm180731_162030_soft_delete_sites', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'f55e7c48-1701-4df8-a0ba-fbc71e92f940'),
(102, NULL, 'app', 'm180810_214427_soft_delete_field_layouts', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '99cbcb54-02db-4b7d-bff3-ad6e2914a160'),
(103, NULL, 'app', 'm180810_214439_soft_delete_elements', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '09a7506e-82b8-46fe-af35-a890b1572c46'),
(104, NULL, 'app', 'm180824_193422_case_sensitivity_fixes', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'ee7e9fa2-968a-4bce-802a-fc8d45dfc5f4'),
(105, NULL, 'app', 'm180901_151639_fix_matrixcontent_tables', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'f00dce51-889a-45fe-9804-a3f0685c7c9e'),
(106, NULL, 'app', 'm180904_112109_permission_changes', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '77783831-5eff-432d-ad29-9ee506552174'),
(107, NULL, 'app', 'm180910_142030_soft_delete_sitegroups', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '0cb4a3fe-56cd-4f18-bbba-d3e5c6914a10'),
(108, NULL, 'app', 'm181011_160000_soft_delete_asset_support', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'bec07a67-9fa7-43e5-add1-2a8d07169ae8'),
(109, NULL, 'app', 'm181016_183648_set_default_user_settings', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '08d4c630-e817-4fbe-bca0-bffb7e1616ac'),
(110, NULL, 'app', 'm181017_225222_system_config_settings', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '01a8e9f0-1126-401a-a08d-7375636def8a'),
(111, NULL, 'app', 'm181018_222343_drop_userpermissions_from_config', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '81363849-15e7-489f-a728-d80ba331d419'),
(112, NULL, 'app', 'm181029_130000_add_transforms_routes_to_config', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '253f4883-890a-4f78-9fd6-5bb7b8f731ce'),
(113, NULL, 'app', 'm181112_203955_sequences_table', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'a9103f6d-f683-4717-b727-f60291aafaa0'),
(114, NULL, 'app', 'm181121_001712_cleanup_field_configs', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'b25fe810-531a-4a34-b000-514f354ca38d'),
(115, NULL, 'app', 'm181128_193942_fix_project_config', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'f053407f-1b5b-4e4e-986a-6b70bb99247d'),
(116, NULL, 'app', 'm181130_143040_fix_schema_version', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '270a7be6-b239-4499-92bb-a42804d36de0'),
(117, NULL, 'app', 'm181211_143040_fix_entry_type_uids', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '97d67fd9-a7c0-4cdc-ab42-e9e478dde31a'),
(118, NULL, 'app', 'm181213_102500_config_map_aliases', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '33b6506a-6822-4ac5-a81c-069c661df7e7'),
(119, NULL, 'app', 'm181217_153000_fix_structure_uids', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'be3ba4ea-121a-44cc-b97d-873dd55b3401'),
(120, NULL, 'app', 'm190104_152725_store_licensed_plugin_editions', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '93515244-3eae-4b4e-8df5-0c65a267f1ec'),
(121, NULL, 'app', 'm190108_110000_cleanup_project_config', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '1607a20f-129b-438d-8a2e-39a0d9d94948'),
(122, NULL, 'app', 'm190108_113000_asset_field_setting_change', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '811f774c-30c6-4f3d-be1e-346dc408cf34'),
(123, NULL, 'app', 'm190109_172845_fix_colspan', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '216dcf31-58a7-4634-b4e3-446a1022169a'),
(124, NULL, 'app', 'm190110_150000_prune_nonexisting_sites', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '5d107c67-4acf-4941-8767-937d3703414d'),
(125, NULL, 'app', 'm190110_214819_soft_delete_volumes', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'ff44d8d0-9679-44c6-9c1e-d562be5e0284'),
(126, NULL, 'app', 'm190112_124737_fix_user_settings', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'e4a15519-bf60-4a61-a6c1-432f66a714be'),
(127, NULL, 'app', 'm190112_131225_fix_field_layouts', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '29a0c933-b943-4e8b-9334-11a0483357f4'),
(128, NULL, 'app', 'm190112_201010_more_soft_deletes', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '446335e0-8ac5-49c6-8d85-584b0b055e98'),
(129, NULL, 'app', 'm190114_143000_more_asset_field_setting_changes', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '67dd7c24-7ac9-4b3c-81d5-ef483ffd4d71'),
(130, NULL, 'app', 'm190121_120000_rich_text_config_setting', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '8619f201-89fb-4691-93c1-aea3cca45d5a'),
(131, NULL, 'app', 'm190125_191628_fix_email_transport_password', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'cdc3a3b4-4343-4912-a70c-af1e0d9e4b55'),
(132, NULL, 'app', 'm190128_181422_cleanup_volume_folders', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '64eeadc3-9219-4b28-8f8b-6c02e55ba76d'),
(133, NULL, 'app', 'm190205_140000_fix_asset_soft_delete_index', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'd8d1884b-c3fa-41e7-a6da-96e081f57664'),
(134, NULL, 'app', 'm190208_140000_reset_project_config_mapping', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '5d421b3c-ab7b-44ea-96b7-3972ecddadfe'),
(135, NULL, 'app', 'm190218_143000_element_index_settings_uid', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'e68a841e-b455-43a4-a2ff-801956a47387'),
(136, NULL, 'app', 'm190312_152740_element_revisions', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'f287010c-de99-4877-8111-337a179f0634'),
(137, NULL, 'app', 'm190327_235137_propagation_method', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '5cc8a714-4319-483b-b1e7-4c8a95243d90'),
(138, NULL, 'app', 'm190401_223843_drop_old_indexes', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '82d4ce8b-2f16-474c-b84d-0942c054e65d'),
(139, NULL, 'app', 'm190416_014525_drop_unique_global_indexes', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '3d53dba2-1af5-4172-9acb-ea6ecfb78c2a'),
(140, NULL, 'app', 'm190417_085010_add_image_editor_permissions', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'bad9591f-b343-48a6-ba91-5574e5525f66'),
(141, NULL, 'app', 'm190502_122019_store_default_user_group_uid', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'acb0add3-63e0-4cc1-bc48-f06e8d4def07'),
(142, NULL, 'app', 'm190504_150349_preview_targets', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '3bf73f88-6b43-4691-86e4-d12817f13dc1'),
(143, NULL, 'app', 'm190516_184711_job_progress_label', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '69f6bda1-620e-43bc-a51f-f3d39ae2f8fc'),
(144, NULL, 'app', 'm190523_190303_optional_revision_creators', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'a99d33d7-04da-4fd0-821c-b71858273716'),
(145, NULL, 'app', 'm190529_204501_fix_duplicate_uids', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '460e61e2-dfd8-421b-8d14-5e4376d94df7'),
(146, NULL, 'app', 'm190605_223807_unsaved_drafts', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'e0a78667-b86d-4027-9ab9-10f25d3dd183'),
(147, NULL, 'app', 'm190607_230042_entry_revision_error_tables', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '9c181b8e-f3de-448f-91ae-1fb34701b8d8'),
(148, NULL, 'app', 'm190608_033429_drop_elements_uid_idx', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'b188ef9a-bf3a-4b55-9de0-43666893e0d8'),
(149, NULL, 'app', 'm190617_164400_add_gqlschemas_table', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '0fbbb224-0704-45e9-923e-f65bf4b81fe3'),
(150, NULL, 'app', 'm190624_234204_matrix_propagation_method', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'ed7a6391-1c68-4223-8e1b-0d943b93904b'),
(151, NULL, 'app', 'm190711_153020_drop_snapshots', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '511f00e6-0748-4544-8ab9-cf047f4fb912'),
(152, NULL, 'app', 'm190712_195914_no_draft_revisions', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '09866686-f24d-4f5c-81bb-6364320c01c4'),
(153, NULL, 'app', 'm190723_140314_fix_preview_targets_column', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '601477cd-75fa-43af-9192-eeaa97894740'),
(154, NULL, 'app', 'm190820_003519_flush_compiled_templates', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '3c4d5b6b-a298-4d8d-9e83-aeaca3c606e0'),
(155, NULL, 'app', 'm190823_020339_optional_draft_creators', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'c4d04b67-7615-466a-953a-8801e4032d93'),
(156, NULL, 'app', 'm190913_152146_update_preview_targets', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '64698866-65ce-47ef-82ec-0434ebc51ae7'),
(157, NULL, 'app', 'm191107_122000_add_gql_project_config_support', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '5fe7c056-6a78-4847-9efb-8f6262f7bc77'),
(158, NULL, 'app', 'm191204_085100_pack_savable_component_settings', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '86e3f4fb-281d-4bca-8fd1-9b26b60dae41'),
(159, NULL, 'app', 'm191206_001148_change_tracking', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '1f6aa342-a24b-4e56-89c6-89b0e71ccbb4'),
(160, NULL, 'app', 'm191216_191635_asset_upload_tracking', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'd2df5e34-4fc9-4f0d-8da5-8ade13e1f2d4'),
(161, NULL, 'app', 'm191222_002848_peer_asset_permissions', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '1db613b0-bbdc-4a54-9438-71c03c45a808'),
(162, NULL, 'app', 'm200127_172522_queue_channels', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '4ff86088-0245-4511-9bc5-12a88770f189'),
(163, NULL, 'app', 'm200211_175048_truncate_element_query_cache', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '9e01d019-0fae-467d-a202-45e519097928'),
(164, NULL, 'app', 'm200213_172522_new_elements_index', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '3b5dec81-7df7-4a3b-a39b-b0cd7fafb65f'),
(165, NULL, 'app', 'm200228_195211_long_deprecation_messages', '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-03-23 05:11:45', 'e4d9bbb4-c667-4463-8920-4eb3c9803781'),
(166, 1, 'plugin', 'Install', '2020-03-24 03:37:33', '2020-03-24 03:37:33', '2020-03-24 03:37:33', 'b0036425-6515-4ae8-a810-c3caec11f70c'),
(167, 1, 'plugin', 'm140330_000000_smartMap_addCountrySubfield', '2020-03-24 03:37:33', '2020-03-24 03:37:33', '2020-03-24 03:37:33', '8d11e6f5-0d1d-4fd2-946e-8011f81e590e'),
(168, 1, 'plugin', 'm140330_000001_smartMap_autofillCountryForExistingAddresses', '2020-03-24 03:37:33', '2020-03-24 03:37:33', '2020-03-24 03:37:33', '626255cf-f124-461f-bba4-f506a2016f2e'),
(169, 1, 'plugin', 'm140811_000001_smartMap_changeHandleToFieldId', '2020-03-24 03:37:33', '2020-03-24 03:37:33', '2020-03-24 03:37:33', 'e2abfb7b-fc45-41bd-bc02-29c8d4acd0cc'),
(170, 1, 'plugin', 'm150329_000000_smartMap_splitGoogleApiKeys', '2020-03-24 03:37:33', '2020-03-24 03:37:33', '2020-03-24 03:37:33', 'dc7f2408-6efd-4444-a708-61a9004e2424'),
(171, 1, 'plugin', 'm150331_000000_smartMap_reorganizeGeolocationOptions', '2020-03-24 03:37:33', '2020-03-24 03:37:33', '2020-03-24 03:37:33', '32a051d5-9bcb-40ef-8334-2c9108d8d046'),
(172, 1, 'plugin', 'm180207_000000_smartMap_updateFieldType', '2020-03-24 03:37:33', '2020-03-24 03:37:33', '2020-03-24 03:37:33', 'c8165e57-bb3c-4139-a818-b9d5feeeb5c0'),
(173, 1, 'plugin', 'm181124_000000_smartMap_replaceFreegeoipWithIpstack', '2020-03-24 03:37:33', '2020-03-24 03:37:33', '2020-03-24 03:37:33', 'caf665aa-2c07-4192-86fa-6bdc6c276fc2'),
(174, 1, 'plugin', 'm190310_000000_smartMap_addPositionToFieldLayouts', '2020-03-24 03:37:33', '2020-03-24 03:37:33', '2020-03-24 03:37:33', '152a1641-f3ce-458f-b24b-d6fa4f54a660'),
(175, 2, 'plugin', 'Install', '2020-03-24 03:46:04', '2020-03-24 03:46:04', '2020-03-24 03:46:04', 'c926e460-c8e7-45d4-b9d4-6d4927b40864'),
(176, 2, 'plugin', 'm180305_000000_migrate_feeds', '2020-03-24 03:46:04', '2020-03-24 03:46:04', '2020-03-24 03:46:04', 'c5f63b43-1f4b-4ffd-b07e-ca5fe82e69b3'),
(177, 2, 'plugin', 'm181113_000000_add_paginationNode', '2020-03-24 03:46:04', '2020-03-24 03:46:04', '2020-03-24 03:46:04', 'e58c653f-e1d9-4355-9b6f-cef6dceceda8'),
(178, 2, 'plugin', 'm190201_000000_update_asset_feeds', '2020-03-24 03:46:04', '2020-03-24 03:46:04', '2020-03-24 03:46:04', '966f9230-104e-4c6f-8a10-df70a398b704'),
(179, 2, 'plugin', 'm190320_000000_renameLocale', '2020-03-24 03:46:04', '2020-03-24 03:46:04', '2020-03-24 03:46:04', '03803ef3-e6a4-41b9-bf1e-9d1b0d8f1738'),
(180, 2, 'plugin', 'm190406_000000_sortOrder', '2020-03-24 03:46:04', '2020-03-24 03:46:04', '2020-03-24 03:46:04', '93bd0998-992f-46d4-9765-f3a5a1c98a8f'),
(181, 3, 'plugin', 'm180430_204710_remove_old_plugins', '2020-03-24 20:02:43', '2020-03-24 20:02:43', '2020-03-24 20:02:43', '7079377e-ec1e-449b-8f81-4df56940645a'),
(182, 3, 'plugin', 'Install', '2020-03-24 20:02:43', '2020-03-24 20:02:43', '2020-03-24 20:02:43', '9f51753a-b745-4508-9256-f61f4d2d54d2'),
(183, 3, 'plugin', 'm190225_003922_split_cleanup_html_settings', '2020-03-24 20:02:43', '2020-03-24 20:02:43', '2020-03-24 20:02:43', 'eb6d219a-42ab-488c-81b2-d329e1d2b8fc'),
(184, 5, 'plugin', 'Install', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', 'ab4e0cba-7dc1-44c9-b24e-f4932ccffa00'),
(185, 5, 'plugin', 'm180120_140521_CraftUpgrade', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', 'c9a8b661-4403-451e-8bda-d749ce7c6b34'),
(186, 5, 'plugin', 'm180125_124339_UpdateForeignKeyNames', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '522fb1ad-90aa-448d-a47e-899adc3444c1'),
(187, 5, 'plugin', 'm180214_094247_AddUniqueTokenToSubmissionsAndForms', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '6743419e-2474-418c-8a52-31c22b317630'),
(188, 5, 'plugin', 'm180220_072652_ChangeFileUploadFieldColumnType', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '952e1691-72fc-4926-8fc4-6acaca870a92'),
(189, 5, 'plugin', 'm180326_094124_AddIsSpamToSubmissions', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '8723a1a4-648f-4648-b6b7-99eb6cb172f6'),
(190, 5, 'plugin', 'm180405_101920_AddIpAddressToSubmissions', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '4f673a27-024e-4db5-bc8b-ea2252b28193'),
(191, 5, 'plugin', 'm180410_131206_CreateIntegrationsQueue', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', 'a8635aa3-66e5-4f58-90ff-2266214b8e3f'),
(192, 5, 'plugin', 'm180417_134527_AddMultipleSelectTypeToFields', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', 'b260c2ea-a19d-4d44-a7ba-352daf185a20'),
(193, 5, 'plugin', 'm180430_151626_PaymentGateways', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', 'a74e2486-c763-4a0a-841f-69a019ba1f3f'),
(194, 5, 'plugin', 'm180508_095131_CreatePaymentGatewayFieldsTable', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', 'fd1ee922-d05b-440b-a481-c87a7a8374a7'),
(195, 5, 'plugin', 'm180606_141402_AddConnectionsToFormProperties', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '30b5643f-2ce7-432d-bf6e-68b1a7952579'),
(196, 5, 'plugin', 'm180730_171628_AddCcDetailsFieldType', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2e679dc2-c4e3-4618-bd66-7212416d5132'),
(197, 5, 'plugin', 'm180817_091801_AddRulesToFormProperties', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '48816650-8091-43ee-a1c2-3426623f6d4a'),
(198, 5, 'plugin', 'm181112_152751_ChangeTypeEnumColumnsToIndexedText', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '68df716b-dbdb-414c-8159-e1c520e9dae7'),
(199, 5, 'plugin', 'm181129_083939_ChangeIntegrationFieldTypeColumnTypeToString', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '47410d3b-bb82-4846-8f00-ec6ed64fa658'),
(200, 5, 'plugin', 'm190501_124050_MergingEditionsMigration', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '9b944902-092c-420e-9407-15e11e28926a'),
(201, 5, 'plugin', 'm190502_155557_AddCCAndBCCToEmailNotifications', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '3d1c6361-5846-4ab8-bc6a-4b12946c4e6a'),
(202, 5, 'plugin', 'm190516_085150_AddPresetAssetsToNotifications', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', 'a3b495e0-8beb-447a-a800-4a15a6b68ed9'),
(203, 5, 'plugin', 'm190529_135307_AddWebhookTables', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', 'ba9479f8-4599-47a9-917c-6163294a8a0d'),
(204, 5, 'plugin', 'm190603_160423_UpgradeFreeformHoneypotEnhancement', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', 'f8777976-c98e-4fbb-9709-e639f6aac738'),
(205, 5, 'plugin', 'm190604_125112_AddFormLimitSubmissionProperty', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', 'c9308f59-b893-41b5-a07e-e6a9b94694c5'),
(206, 5, 'plugin', 'm190610_074840_MigrateScriptInsertLocation', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '6b3db28b-4517-4d08-8e2b-6fd59e058a34'),
(207, 5, 'plugin', 'm190614_103420_AddMissingMetaColumnsToProAndPaymentTables', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '40630a48-9f14-402f-b79a-44ce3a89f842'),
(208, 5, 'plugin', 'm190617_122427_RemoveBrokenForeignKeys', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '9c1717c1-202d-4699-a34e-d61767db8c76'),
(209, 5, 'plugin', 'm190618_142759_AddFixedForeignKeys', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', 'e17b1809-d0f1-4549-8491-7e93de84fc4c'),
(210, 5, 'plugin', 'm190812_125059_AddNotesTable', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '7941e113-1845-4b6a-9580-e9d4d33cd8c9'),
(211, 5, 'plugin', 'm190905_113428_FixIntervalCountNotNullColumn', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', 'd1d93eb3-2451-4902-a2fd-262ab1602a54'),
(212, 5, 'plugin', 'm191214_093453_AddExtraPostUrlColumnToForm', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '92b24657-8ed4-4419-8519-de0eb071a2af'),
(213, 5, 'plugin', 'm200203_180318_AddSpamReasonTable', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '6a90f29c-031e-45cd-9239-34137a8ce4c5'),
(214, 5, 'plugin', 'm200214_083115_FixIntegrationQueueIndex', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '2020-03-26 13:29:55', '18efba75-37a3-4f80-8979-8cc6520c0bb6');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'smart-map', '3.2.2.1', '3.2.2', 'invalid', NULL, '2020-03-24 03:37:33', '2020-03-24 03:37:33', '2020-04-07 15:51:54', '602acc9f-ce0c-4d6a-aa2a-b67c10d51b86'),
(2, 'feed-me', '4.2.2', '2.1.2', 'unknown', NULL, '2020-03-24 03:46:04', '2020-03-24 03:46:04', '2020-04-07 15:51:54', '8215bab6-2e6f-44a4-b187-b0fdeb212dc2'),
(3, 'redactor', '2.6.1', '2.3.0', 'unknown', NULL, '2020-03-24 20:02:43', '2020-03-24 20:02:43', '2020-04-07 15:51:54', 'cdc25c1b-40d6-4672-8610-8a00ac99200e'),
(4, 'pagination', '1.0.2', '1.0.0', 'unknown', NULL, '2020-03-25 22:03:41', '2020-03-25 22:03:41', '2020-04-07 15:51:54', '914eb752-50d4-4c18-b6f7-c1ac7bcfe315'),
(5, 'freeform', '3.6.6', '3.0.6', 'invalid', NULL, '2020-03-26 13:29:54', '2020-03-26 13:29:54', '2020-04-07 15:51:54', '85a50f1f-b757-4d32-baed-41a20cdc43f0');

-- --------------------------------------------------------

--
-- Table structure for table `projectconfig`
--

CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('dateModified', '1585230432'),
('email.fromEmail', '\"jvargas@conversionia.com\"'),
('email.fromName', '\"mats\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('fieldGroups.4fb65637-0240-4b7b-848c-6f67dc84c39e.name', '\"Job\"'),
('fieldGroups.a6bd0dc1-8f56-4f96-b1a3-bb61957485ae.name', '\"Common\"'),
('fields.296c5dd1-6f04-49f5-91f7-5549f94f9a05.contentColumnType', '\"string(255)\"'),
('fields.296c5dd1-6f04-49f5-91f7-5549f94f9a05.fieldGroup', '\"4fb65637-0240-4b7b-848c-6f67dc84c39e\"'),
('fields.296c5dd1-6f04-49f5-91f7-5549f94f9a05.handle', '\"jobApplicationLink\"'),
('fields.296c5dd1-6f04-49f5-91f7-5549f94f9a05.instructions', '\"\"'),
('fields.296c5dd1-6f04-49f5-91f7-5549f94f9a05.name', '\"Job Application Link\"'),
('fields.296c5dd1-6f04-49f5-91f7-5549f94f9a05.searchable', 'true'),
('fields.296c5dd1-6f04-49f5-91f7-5549f94f9a05.settings.maxLength', '\"255\"'),
('fields.296c5dd1-6f04-49f5-91f7-5549f94f9a05.settings.placeholder', '\"\"'),
('fields.296c5dd1-6f04-49f5-91f7-5549f94f9a05.translationKeyFormat', 'null'),
('fields.296c5dd1-6f04-49f5-91f7-5549f94f9a05.translationMethod', '\"none\"'),
('fields.296c5dd1-6f04-49f5-91f7-5549f94f9a05.type', '\"craft\\\\fields\\\\Url\"'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.contentColumnType', '\"text\"'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.fieldGroup', '\"4fb65637-0240-4b7b-848c-6f67dc84c39e\"'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.handle', '\"jobDetails\"'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.instructions', '\"\"'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.name', '\"Job Details\"'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.searchable', 'true'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.settings.availableTransforms', '\"*\"'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.settings.availableVolumes', '\"*\"'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.settings.cleanupHtml', 'true'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.settings.columnType', '\"text\"'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.settings.purifierConfig', '\"\"'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.settings.purifyHtml', '\"1\"'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.settings.redactorConfig', '\"\"'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.settings.removeEmptyTags', '\"1\"'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.settings.removeInlineStyles', '\"\"'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.settings.removeNbsp', '\"1\"'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.settings.showUnpermittedFiles', 'false'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.settings.showUnpermittedVolumes', 'false'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.translationKeyFormat', 'null'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.translationMethod', '\"none\"'),
('fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.type', '\"craft\\\\redactor\\\\Field\"'),
('fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.contentColumnType', '\"text\"'),
('fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.fieldGroup', '\"4fb65637-0240-4b7b-848c-6f67dc84c39e\"'),
('fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.handle', '\"jobHeadline\"'),
('fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.instructions', '\"\"'),
('fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.name', '\"Job Headline\"'),
('fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.searchable', 'true'),
('fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.settings.byteLimit', 'null'),
('fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.settings.charLimit', 'null'),
('fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.settings.code', '\"\"'),
('fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.settings.columnType', 'null'),
('fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.settings.initialRows', '\"4\"'),
('fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.settings.multiline', '\"\"'),
('fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.settings.placeholder', '\"\"'),
('fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.translationKeyFormat', 'null'),
('fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.translationMethod', '\"none\"'),
('fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.type', '\"craft\\\\fields\\\\PlainText\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.contentColumnType', '\"string\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.fieldGroup', '\"4fb65637-0240-4b7b-848c-6f67dc84c39e\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.handle', '\"driverType\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.instructions', '\"\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.name', '\"Driver Type\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.searchable', 'true'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.optgroups', 'true'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.0.__assoc__.0.0', '\"label\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.0.__assoc__.0.1', '\"Solo\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.0.__assoc__.1.0', '\"value\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.0.__assoc__.1.1', '\"solo\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.0.__assoc__.2.0', '\"default\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.0.__assoc__.2.1', '\"\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.1.__assoc__.0.0', '\"label\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.1.__assoc__.0.1', '\"Team\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.1.__assoc__.1.0', '\"value\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.1.__assoc__.1.1', '\"team\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.1.__assoc__.2.0', '\"default\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.1.__assoc__.2.1', '\"\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.2.__assoc__.0.0', '\"label\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.2.__assoc__.0.1', '\"Owner Operator\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.2.__assoc__.1.0', '\"value\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.2.__assoc__.1.1', '\"ownerOperator\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.2.__assoc__.2.0', '\"default\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.2.__assoc__.2.1', '\"\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.3.__assoc__.0.0', '\"label\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.3.__assoc__.0.1', '\"Student\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.3.__assoc__.1.0', '\"value\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.3.__assoc__.1.1', '\"student\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.3.__assoc__.2.0', '\"default\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.settings.options.3.__assoc__.2.1', '\"\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.translationKeyFormat', 'null'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.translationMethod', '\"none\"'),
('fields.6a047704-fe42-4850-b2b1-90e042b32928.type', '\"craft\\\\fields\\\\Dropdown\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.contentColumnType', '\"string\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.fieldGroup', '\"4fb65637-0240-4b7b-848c-6f67dc84c39e\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.handle', '\"truckType\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.instructions', '\"\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.name', '\"Truck Type\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.searchable', 'true'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.settings.optgroups', 'true'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.settings.options.0.__assoc__.0.0', '\"label\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.settings.options.0.__assoc__.0.1', '\"Van\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.settings.options.0.__assoc__.1.0', '\"value\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.settings.options.0.__assoc__.1.1', '\"van\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.settings.options.0.__assoc__.2.0', '\"default\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.settings.options.0.__assoc__.2.1', '\"\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.settings.options.1.__assoc__.0.0', '\"label\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.settings.options.1.__assoc__.0.1', '\"Reefer\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.settings.options.1.__assoc__.1.0', '\"value\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.settings.options.1.__assoc__.1.1', '\"reefer\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.settings.options.1.__assoc__.2.0', '\"default\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.settings.options.1.__assoc__.2.1', '\"\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.settings.options.2.__assoc__.0.0', '\"label\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.settings.options.2.__assoc__.0.1', '\"Tanker\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.settings.options.2.__assoc__.1.0', '\"value\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.settings.options.2.__assoc__.1.1', '\"tanker\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.settings.options.2.__assoc__.2.0', '\"default\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.settings.options.2.__assoc__.2.1', '\"\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.translationKeyFormat', 'null'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.translationMethod', '\"none\"'),
('fields.7ee9eed6-495b-451a-8176-47f2f8273a18.type', '\"craft\\\\fields\\\\Dropdown\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.contentColumnType', '\"string\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.fieldGroup', '\"a6bd0dc1-8f56-4f96-b1a3-bb61957485ae\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.handle', '\"address\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.instructions', '\"\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.name', '\"address\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.searchable', 'true'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.dragPinDefault', '\"\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.dragPinLatitude', '\"0\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.dragPinLongitude', '\"0\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.dragPinZoom', '\"4\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.0.0', '\"street1\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.0.1.__assoc__.0.0', '\"width\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.0.1.__assoc__.0.1', '100'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.0.1.__assoc__.1.0', '\"enable\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.0.1.__assoc__.1.1', '0'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.0.1.__assoc__.2.0', '\"position\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.0.1.__assoc__.2.1', '1'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.1.0', '\"street2\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.1.1.__assoc__.0.0', '\"width\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.1.1.__assoc__.0.1', '100'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.1.1.__assoc__.1.0', '\"enable\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.1.1.__assoc__.1.1', '0'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.1.1.__assoc__.2.0', '\"position\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.1.1.__assoc__.2.1', '2'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.2.0', '\"city\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.2.1.__assoc__.0.0', '\"width\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.2.1.__assoc__.0.1', '50'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.2.1.__assoc__.1.0', '\"enable\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.2.1.__assoc__.1.1', '1'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.2.1.__assoc__.2.0', '\"position\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.2.1.__assoc__.2.1', '3'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.3.0', '\"state\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.3.1.__assoc__.0.0', '\"width\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.3.1.__assoc__.0.1', '15'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.3.1.__assoc__.1.0', '\"enable\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.3.1.__assoc__.1.1', '1'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.3.1.__assoc__.2.0', '\"position\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.3.1.__assoc__.2.1', '4'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.4.0', '\"zip\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.4.1.__assoc__.0.0', '\"width\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.4.1.__assoc__.0.1', '35'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.4.1.__assoc__.1.0', '\"enable\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.4.1.__assoc__.1.1', '1'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.4.1.__assoc__.2.0', '\"position\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.4.1.__assoc__.2.1', '5'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.5.0', '\"country\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.5.1.__assoc__.0.0', '\"width\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.5.1.__assoc__.0.1', '100'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.5.1.__assoc__.1.0', '\"enable\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.5.1.__assoc__.1.1', '1'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.5.1.__assoc__.2.0', '\"position\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.5.1.__assoc__.2.1', '6'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.6.0', '\"lat\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.6.1.__assoc__.0.0', '\"width\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.6.1.__assoc__.0.1', '50'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.6.1.__assoc__.1.0', '\"enable\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.6.1.__assoc__.1.1', '1'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.6.1.__assoc__.2.0', '\"position\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.6.1.__assoc__.2.1', '7'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.7.0', '\"lng\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.7.1.__assoc__.0.0', '\"width\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.7.1.__assoc__.0.1', '50'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.7.1.__assoc__.1.0', '\"enable\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.7.1.__assoc__.1.1', '1'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.7.1.__assoc__.2.0', '\"position\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.settings.layout.__assoc__.7.1.__assoc__.2.1', '8'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.translationKeyFormat', 'null'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.translationMethod', '\"none\"'),
('fields.a4fc8f5c-0c5c-4e4d-a09a-79a0baf2ee10.type', '\"doublesecretagency\\\\smartmap\\\\fields\\\\Address\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.contentColumnType', '\"string\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.fieldGroup', '\"4fb65637-0240-4b7b-848c-6f67dc84c39e\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.handle', '\"jobType\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.instructions', '\"\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.name', '\"Job Type\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.searchable', 'true'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.optgroups', 'true'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.0.__assoc__.0.0', '\"label\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.0.__assoc__.0.1', '\"OTR\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.0.__assoc__.1.0', '\"value\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.0.__assoc__.1.1', '\"otr\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.0.__assoc__.2.0', '\"default\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.0.__assoc__.2.1', '\"\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.1.__assoc__.0.0', '\"label\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.1.__assoc__.0.1', '\"Regional\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.1.__assoc__.1.0', '\"value\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.1.__assoc__.1.1', '\"regional\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.1.__assoc__.2.0', '\"default\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.1.__assoc__.2.1', '\"\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.2.__assoc__.0.0', '\"label\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.2.__assoc__.0.1', '\"Dedicated\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.2.__assoc__.1.0', '\"value\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.2.__assoc__.1.1', '\"dedicated\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.2.__assoc__.2.0', '\"default\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.2.__assoc__.2.1', '\"\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.3.__assoc__.0.0', '\"label\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.3.__assoc__.0.1', '\"Local\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.3.__assoc__.1.0', '\"value\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.3.__assoc__.1.1', '\"local\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.3.__assoc__.2.0', '\"default\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.settings.options.3.__assoc__.2.1', '\"\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.translationKeyFormat', 'null'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.translationMethod', '\"none\"'),
('fields.d3313873-9368-4fb3-94f9-f5328479c75d.type', '\"craft\\\\fields\\\\Dropdown\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.contentColumnType', '\"string\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.fieldGroup', '\"4fb65637-0240-4b7b-848c-6f67dc84c39e\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.handle', '\"jobAddress\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.instructions', '\"\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.name', '\"Job Address\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.searchable', 'true'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.dragPinDefault', '\"\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.dragPinLatitude', '\"0\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.dragPinLongitude', '\"0\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.dragPinZoom', '\"4\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.0.0', '\"street1\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.0.1.__assoc__.0.0', '\"width\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.0.1.__assoc__.0.1', '100'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.0.1.__assoc__.1.0', '\"enable\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.0.1.__assoc__.1.1', '1'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.0.1.__assoc__.2.0', '\"position\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.0.1.__assoc__.2.1', '1'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.1.0', '\"street2\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.1.1.__assoc__.0.0', '\"width\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.1.1.__assoc__.0.1', '100'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.1.1.__assoc__.1.0', '\"enable\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.1.1.__assoc__.1.1', '0'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.1.1.__assoc__.2.0', '\"position\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.1.1.__assoc__.2.1', '2'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.2.0', '\"city\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.2.1.__assoc__.0.0', '\"width\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.2.1.__assoc__.0.1', '50'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.2.1.__assoc__.1.0', '\"enable\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.2.1.__assoc__.1.1', '1'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.2.1.__assoc__.2.0', '\"position\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.2.1.__assoc__.2.1', '3'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.3.0', '\"state\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.3.1.__assoc__.0.0', '\"width\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.3.1.__assoc__.0.1', '15'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.3.1.__assoc__.1.0', '\"enable\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.3.1.__assoc__.1.1', '1'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.3.1.__assoc__.2.0', '\"position\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.3.1.__assoc__.2.1', '4'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.4.0', '\"zip\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.4.1.__assoc__.0.0', '\"width\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.4.1.__assoc__.0.1', '35'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.4.1.__assoc__.1.0', '\"enable\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.4.1.__assoc__.1.1', '1'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.4.1.__assoc__.2.0', '\"position\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.4.1.__assoc__.2.1', '5'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.5.0', '\"country\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.5.1.__assoc__.0.0', '\"width\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.5.1.__assoc__.0.1', '100'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.5.1.__assoc__.1.0', '\"enable\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.5.1.__assoc__.1.1', '1'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.5.1.__assoc__.2.0', '\"position\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.5.1.__assoc__.2.1', '6'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.6.0', '\"lat\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.6.1.__assoc__.0.0', '\"width\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.6.1.__assoc__.0.1', '50'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.6.1.__assoc__.1.0', '\"enable\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.6.1.__assoc__.1.1', '1'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.6.1.__assoc__.2.0', '\"position\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.6.1.__assoc__.2.1', '7'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.7.0', '\"lng\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.7.1.__assoc__.0.0', '\"width\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.7.1.__assoc__.0.1', '50'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.7.1.__assoc__.1.0', '\"enable\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.7.1.__assoc__.1.1', '1'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.7.1.__assoc__.2.0', '\"position\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.settings.layout.__assoc__.7.1.__assoc__.2.1', '8'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.translationKeyFormat', 'null'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.translationMethod', '\"none\"'),
('fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.type', '\"doublesecretagency\\\\smartmap\\\\fields\\\\Address\"'),
('fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.contentColumnType', '\"text\"'),
('fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.fieldGroup', '\"4fb65637-0240-4b7b-848c-6f67dc84c39e\"'),
('fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.handle', '\"city\"'),
('fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.instructions', '\"\"'),
('fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.name', '\"City\"'),
('fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.searchable', 'true'),
('fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.settings.byteLimit', 'null'),
('fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.settings.charLimit', 'null'),
('fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.settings.code', '\"\"'),
('fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.settings.columnType', 'null'),
('fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.settings.initialRows', '\"4\"'),
('fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.settings.multiline', '\"\"'),
('fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.settings.placeholder', '\"\"'),
('fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.translationKeyFormat', 'null'),
('fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.translationMethod', '\"none\"'),
('fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.type', '\"craft\\\\fields\\\\PlainText\"'),
('plugins.feed-me.edition', '\"standard\"'),
('plugins.feed-me.enabled', 'true'),
('plugins.feed-me.schemaVersion', '\"2.1.2\"'),
('plugins.freeform.edition', '\"pro\"'),
('plugins.freeform.enabled', 'true'),
('plugins.freeform.schemaVersion', '\"3.0.6\"'),
('plugins.freeform.settings.ajaxByDefault', 'false'),
('plugins.freeform.settings.autoScrollToErrors', 'true'),
('plugins.freeform.settings.blockedEmails', 'null'),
('plugins.freeform.settings.blockedEmailsError', '\"Invalid Email Address\"'),
('plugins.freeform.settings.blockedIpAddresses', 'null'),
('plugins.freeform.settings.blockedKeywords', 'null'),
('plugins.freeform.settings.blockedKeywordsError', '\"Invalid Entry Data\"'),
('plugins.freeform.settings.customErrorMessage', 'null'),
('plugins.freeform.settings.customHoneypotName', 'null'),
('plugins.freeform.settings.defaultTemplates', 'true'),
('plugins.freeform.settings.defaultView', '\"dashboard\"'),
('plugins.freeform.settings.emailTemplateDirectory', 'null'),
('plugins.freeform.settings.emailTemplateStorage', '\"db\"'),
('plugins.freeform.settings.fieldDisplayOrder', '\"name\"'),
('plugins.freeform.settings.fillWithGet', 'false'),
('plugins.freeform.settings.footerScripts', 'false'),
('plugins.freeform.settings.formattingTemplate', '\"flexbox.html\"'),
('plugins.freeform.settings.formSubmitDisable', 'false'),
('plugins.freeform.settings.formSubmitExpiration', 'null'),
('plugins.freeform.settings.formTemplateDirectory', 'null'),
('plugins.freeform.settings.freeformHoneypot', 'true'),
('plugins.freeform.settings.freeformHoneypotEnhancement', 'false'),
('plugins.freeform.settings.hideBannerDemo', 'false'),
('plugins.freeform.settings.hideBannerOldFreeform', 'false'),
('plugins.freeform.settings.minimumSubmitTime', 'null'),
('plugins.freeform.settings.pluginName', 'null'),
('plugins.freeform.settings.purgableSpamAgeInDays', 'null'),
('plugins.freeform.settings.purgableSubmissionAgeInDays', 'null'),
('plugins.freeform.settings.recaptchaBehaviour', '\"display_error\"'),
('plugins.freeform.settings.recaptchaEnabled', 'false'),
('plugins.freeform.settings.recaptchaKey', 'null'),
('plugins.freeform.settings.recaptchaMinScore', '0.5'),
('plugins.freeform.settings.recaptchaSecret', 'null'),
('plugins.freeform.settings.recaptchaType', '\"v2_checkbox\"'),
('plugins.freeform.settings.removeNewlines', 'false'),
('plugins.freeform.settings.renderFormHtmlInCpViews', 'true'),
('plugins.freeform.settings.salesforce_client_id', 'null'),
('plugins.freeform.settings.salesforce_client_secret', 'null'),
('plugins.freeform.settings.salesforce_password', 'null'),
('plugins.freeform.settings.salesforce_username', 'null'),
('plugins.freeform.settings.scriptInsertLocation', '\"footer\"'),
('plugins.freeform.settings.showErrorsForBlockedEmails', 'false'),
('plugins.freeform.settings.showErrorsForBlockedKeywords', 'false'),
('plugins.freeform.settings.showTutorial', 'false'),
('plugins.freeform.settings.spamFolderEnabled', 'false'),
('plugins.freeform.settings.spamProtectionBehaviour', '\"simulate_success\"'),
('plugins.freeform.settings.submissionThrottlingCount', 'null'),
('plugins.freeform.settings.submissionThrottlingTimeFrame', 'null'),
('plugins.pagination.edition', '\"standard\"'),
('plugins.pagination.enabled', 'true'),
('plugins.pagination.schemaVersion', '\"1.0.0\"'),
('plugins.redactor.edition', '\"standard\"'),
('plugins.redactor.enabled', 'true'),
('plugins.redactor.schemaVersion', '\"2.3.0\"'),
('plugins.smart-map.edition', '\"standard\"'),
('plugins.smart-map.enabled', 'true'),
('plugins.smart-map.schemaVersion', '\"3.2.2\"'),
('plugins.smart-map.settings.debugRoute', '\"map/debug\"'),
('plugins.smart-map.settings.geolocation', '\"none\"'),
('plugins.smart-map.settings.googleBrowserKey', '\"AIzaSyASHjRmYwWSCWcR_m3JTEUcJ9HDTu9SG-Y\"'),
('plugins.smart-map.settings.googleServerKey', '\"AIzaSyAjWIqfdInsDvWO99opGRXvpMCGnYBIdD8\"'),
('plugins.smart-map.settings.ipstackAccessKey', '\"\"'),
('plugins.smart-map.settings.maxmindLicenseKey', '\"\"'),
('plugins.smart-map.settings.maxmindService', '\"\"'),
('plugins.smart-map.settings.maxmindUserId', '\"\"'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.enableVersioning', 'true'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.fieldLayouts.bfdea601-1042-4e24-9506-4f8cc4ba3906.tabs.0.fields.296c5dd1-6f04-49f5-91f7-5549f94f9a05.required', 'false'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.fieldLayouts.bfdea601-1042-4e24-9506-4f8cc4ba3906.tabs.0.fields.296c5dd1-6f04-49f5-91f7-5549f94f9a05.sortOrder', '4'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.fieldLayouts.bfdea601-1042-4e24-9506-4f8cc4ba3906.tabs.0.fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.required', 'false'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.fieldLayouts.bfdea601-1042-4e24-9506-4f8cc4ba3906.tabs.0.fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.sortOrder', '5'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.fieldLayouts.bfdea601-1042-4e24-9506-4f8cc4ba3906.tabs.0.fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.required', 'false'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.fieldLayouts.bfdea601-1042-4e24-9506-4f8cc4ba3906.tabs.0.fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.sortOrder', '6'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.fieldLayouts.bfdea601-1042-4e24-9506-4f8cc4ba3906.tabs.0.fields.6a047704-fe42-4850-b2b1-90e042b32928.required', 'false'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.fieldLayouts.bfdea601-1042-4e24-9506-4f8cc4ba3906.tabs.0.fields.6a047704-fe42-4850-b2b1-90e042b32928.sortOrder', '2'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.fieldLayouts.bfdea601-1042-4e24-9506-4f8cc4ba3906.tabs.0.fields.7ee9eed6-495b-451a-8176-47f2f8273a18.required', 'false'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.fieldLayouts.bfdea601-1042-4e24-9506-4f8cc4ba3906.tabs.0.fields.7ee9eed6-495b-451a-8176-47f2f8273a18.sortOrder', '8'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.fieldLayouts.bfdea601-1042-4e24-9506-4f8cc4ba3906.tabs.0.fields.d3313873-9368-4fb3-94f9-f5328479c75d.required', 'false'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.fieldLayouts.bfdea601-1042-4e24-9506-4f8cc4ba3906.tabs.0.fields.d3313873-9368-4fb3-94f9-f5328479c75d.sortOrder', '7'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.fieldLayouts.bfdea601-1042-4e24-9506-4f8cc4ba3906.tabs.0.fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.required', 'false'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.fieldLayouts.bfdea601-1042-4e24-9506-4f8cc4ba3906.tabs.0.fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.sortOrder', '3'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.fieldLayouts.bfdea601-1042-4e24-9506-4f8cc4ba3906.tabs.0.fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.required', 'false'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.fieldLayouts.bfdea601-1042-4e24-9506-4f8cc4ba3906.tabs.0.fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.sortOrder', '1'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.fieldLayouts.bfdea601-1042-4e24-9506-4f8cc4ba3906.tabs.0.name', '\"Job\"'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.fieldLayouts.bfdea601-1042-4e24-9506-4f8cc4ba3906.tabs.0.sortOrder', '1'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.handle', '\"jobsIndex\"'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.hasTitleField', 'false'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.name', '\"Jobs Index\"'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.sortOrder', '1'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.titleFormat', '\"{section.name|raw}\"'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.entryTypes.c9f1a9da-5182-48d8-9ba2-c6ca6a5fbadc.titleLabel', '\"\"'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.handle', '\"jobsIndex\"'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.name', '\"Jobs Index\"'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.propagationMethod', '\"all\"'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.siteSettings.c263d233-c920-40c0-995d-f6deafc5802a.enabledByDefault', 'true'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.siteSettings.c263d233-c920-40c0-995d-f6deafc5802a.hasUrls', 'true'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.siteSettings.c263d233-c920-40c0-995d-f6deafc5802a.template', '\"jobs/index\"'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.siteSettings.c263d233-c920-40c0-995d-f6deafc5802a.uriFormat', '\"jobs\"'),
('sections.72e17c71-1255-44dc-9823-ed4586ea10b3.type', '\"single\"'),
('sections.a4d4c22c-dea1-4c59-94b4-7af6f68a4dd7.enableVersioning', 'true'),
('sections.a4d4c22c-dea1-4c59-94b4-7af6f68a4dd7.entryTypes.17462fab-b3ff-4b55-82f9-c527280f34bc.handle', '\"home\"'),
('sections.a4d4c22c-dea1-4c59-94b4-7af6f68a4dd7.entryTypes.17462fab-b3ff-4b55-82f9-c527280f34bc.hasTitleField', 'false'),
('sections.a4d4c22c-dea1-4c59-94b4-7af6f68a4dd7.entryTypes.17462fab-b3ff-4b55-82f9-c527280f34bc.name', '\"Home\"'),
('sections.a4d4c22c-dea1-4c59-94b4-7af6f68a4dd7.entryTypes.17462fab-b3ff-4b55-82f9-c527280f34bc.sortOrder', '1'),
('sections.a4d4c22c-dea1-4c59-94b4-7af6f68a4dd7.entryTypes.17462fab-b3ff-4b55-82f9-c527280f34bc.titleFormat', '\"{section.name|raw}\"'),
('sections.a4d4c22c-dea1-4c59-94b4-7af6f68a4dd7.entryTypes.17462fab-b3ff-4b55-82f9-c527280f34bc.titleLabel', 'null'),
('sections.a4d4c22c-dea1-4c59-94b4-7af6f68a4dd7.handle', '\"home\"'),
('sections.a4d4c22c-dea1-4c59-94b4-7af6f68a4dd7.name', '\"Home\"'),
('sections.a4d4c22c-dea1-4c59-94b4-7af6f68a4dd7.propagationMethod', '\"all\"'),
('sections.a4d4c22c-dea1-4c59-94b4-7af6f68a4dd7.siteSettings.c263d233-c920-40c0-995d-f6deafc5802a.enabledByDefault', 'true'),
('sections.a4d4c22c-dea1-4c59-94b4-7af6f68a4dd7.siteSettings.c263d233-c920-40c0-995d-f6deafc5802a.hasUrls', 'true'),
('sections.a4d4c22c-dea1-4c59-94b4-7af6f68a4dd7.siteSettings.c263d233-c920-40c0-995d-f6deafc5802a.template', '\"\"'),
('sections.a4d4c22c-dea1-4c59-94b4-7af6f68a4dd7.siteSettings.c263d233-c920-40c0-995d-f6deafc5802a.uriFormat', '\"__home__\"'),
('sections.a4d4c22c-dea1-4c59-94b4-7af6f68a4dd7.type', '\"single\"'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.enableVersioning', 'true'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.fieldLayouts.02d2e30b-c74d-408d-bdf6-a17a90578045.tabs.0.fields.296c5dd1-6f04-49f5-91f7-5549f94f9a05.required', 'false'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.fieldLayouts.02d2e30b-c74d-408d-bdf6-a17a90578045.tabs.0.fields.296c5dd1-6f04-49f5-91f7-5549f94f9a05.sortOrder', '4'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.fieldLayouts.02d2e30b-c74d-408d-bdf6-a17a90578045.tabs.0.fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.required', 'false'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.fieldLayouts.02d2e30b-c74d-408d-bdf6-a17a90578045.tabs.0.fields.3ec0ff05-83b4-405d-8caa-0210e6f1ff6a.sortOrder', '5'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.fieldLayouts.02d2e30b-c74d-408d-bdf6-a17a90578045.tabs.0.fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.required', 'false'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.fieldLayouts.02d2e30b-c74d-408d-bdf6-a17a90578045.tabs.0.fields.40dc5cd6-496d-40e1-9b29-3b6da3bf7d23.sortOrder', '6'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.fieldLayouts.02d2e30b-c74d-408d-bdf6-a17a90578045.tabs.0.fields.6a047704-fe42-4850-b2b1-90e042b32928.required', 'false'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.fieldLayouts.02d2e30b-c74d-408d-bdf6-a17a90578045.tabs.0.fields.6a047704-fe42-4850-b2b1-90e042b32928.sortOrder', '2'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.fieldLayouts.02d2e30b-c74d-408d-bdf6-a17a90578045.tabs.0.fields.7ee9eed6-495b-451a-8176-47f2f8273a18.required', 'false'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.fieldLayouts.02d2e30b-c74d-408d-bdf6-a17a90578045.tabs.0.fields.7ee9eed6-495b-451a-8176-47f2f8273a18.sortOrder', '8'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.fieldLayouts.02d2e30b-c74d-408d-bdf6-a17a90578045.tabs.0.fields.d3313873-9368-4fb3-94f9-f5328479c75d.required', 'false'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.fieldLayouts.02d2e30b-c74d-408d-bdf6-a17a90578045.tabs.0.fields.d3313873-9368-4fb3-94f9-f5328479c75d.sortOrder', '7'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.fieldLayouts.02d2e30b-c74d-408d-bdf6-a17a90578045.tabs.0.fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.required', 'false'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.fieldLayouts.02d2e30b-c74d-408d-bdf6-a17a90578045.tabs.0.fields.ecfc8740-1e0b-4e22-87d2-c4f06a1c7a3a.sortOrder', '3'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.fieldLayouts.02d2e30b-c74d-408d-bdf6-a17a90578045.tabs.0.fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.required', 'false'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.fieldLayouts.02d2e30b-c74d-408d-bdf6-a17a90578045.tabs.0.fields.f54c9196-e5f7-4d97-be6c-b4dd870e0e11.sortOrder', '1'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.fieldLayouts.02d2e30b-c74d-408d-bdf6-a17a90578045.tabs.0.name', '\"Job\"'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.fieldLayouts.02d2e30b-c74d-408d-bdf6-a17a90578045.tabs.0.sortOrder', '1'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.handle', '\"jobListings\"'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.hasTitleField', 'true'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.name', '\"Job Listings\"'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.sortOrder', '1'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.titleFormat', '\"\"'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.entryTypes.2ab2c8fb-ac48-418b-a423-ee3f3536e65a.titleLabel', '\"Title\"'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.handle', '\"jobListings\"'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.name', '\"Job Listings\"'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.propagationMethod', '\"all\"'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.siteSettings.c263d233-c920-40c0-995d-f6deafc5802a.enabledByDefault', 'true'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.siteSettings.c263d233-c920-40c0-995d-f6deafc5802a.hasUrls', 'true'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.siteSettings.c263d233-c920-40c0-995d-f6deafc5802a.template', '\"jobs/entry\"'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.siteSettings.c263d233-c920-40c0-995d-f6deafc5802a.uriFormat', '\"jobs/{slug}\"'),
('sections.ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb.type', '\"channel\"'),
('siteGroups.63bf1954-da71-4ed4-87de-c0a9cfedfd47.name', '\"mats\"'),
('sites.c263d233-c920-40c0-995d-f6deafc5802a.baseUrl', '\"$DEFAULT_SITE_URL\"'),
('sites.c263d233-c920-40c0-995d-f6deafc5802a.handle', '\"default\"'),
('sites.c263d233-c920-40c0-995d-f6deafc5802a.hasUrls', 'true'),
('sites.c263d233-c920-40c0-995d-f6deafc5802a.language', '\"en-US\"'),
('sites.c263d233-c920-40c0-995d-f6deafc5802a.name', '\"mats\"'),
('sites.c263d233-c920-40c0-995d-f6deafc5802a.primary', 'true'),
('sites.c263d233-c920-40c0-995d-f6deafc5802a.siteGroup', '\"63bf1954-da71-4ed4-87de-c0a9cfedfd47\"'),
('sites.c263d233-c920-40c0-995d-f6deafc5802a.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"mats\"'),
('system.schemaVersion', '\"3.4.10\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', '\"\"'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) UNSIGNED NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('134fd22a', '@lib/jquery-ui'),
('138d1793', '@lib/axios'),
('195a57da', '@lib/jquery-ui'),
('19989263', '@lib/axios'),
('1ad73d14', '@app/web/assets/dashboard/dist'),
('1b6e06f', '@lib/jquery-ui'),
('1e82005b', '@app/web/assets/recententries/dist'),
('20384235', '@app/web/assets/updateswidget/dist'),
('204bd083', '@app/web/assets/admintable/dist'),
('268a0353', '@lib/vue'),
('2eaaeef4', '@app/web/assets/craftsupport/dist'),
('306d100a', '@app/web/assets/updater/dist'),
('33ef48d3', '@craft/web/assets/updater/dist'),
('367a92f8', '@app/web/assets/editsection/dist'),
('3a2c0e8c', '@craft/web/assets/recententries/dist'),
('3cf27d6', '@app/web/assets/cp/dist'),
('3d7fcf0', '@lib/jquery-ui'),
('41c1e667', '@lib/jquery.payment'),
('441aadb9', '@craft/web/assets/utilities/dist'),
('467c3b02', '@bower/jquery/dist'),
('483f94fe', '@app/web/assets/updates/dist'),
('4964ce2', '@craft/web/assets/updateswidget/dist'),
('4bd46397', '@lib/jquery.payment'),
('4c3005cf', '@craft/web/assets/tablesettings/dist'),
('4c69bef2', '@bower/jquery/dist'),
('4cda307b', '@doublesecretagency/smartmap/resources'),
('4d7e6755', '@lib/velocity'),
('4ed96ace', '@app/web/assets/dashboard/dist'),
('4f1f7bca', '@lib/velocity'),
('5159c8bd', '@lib/jquery.payment'),
('5338d422', '@lib/jquery.payment'),
('537055e3', '@app/web/assets/updates/dist'),
('54bd7afe', '@freeform/Resources'),
('57f3cc7f', '@lib/velocity'),
('5cf19028', '@bower/jquery/dist'),
('5de6498f', '@lib/velocity'),
('5e908cb7', '@bower/jquery/dist'),
('61b46547', '@app/web/assets/utilities/dist'),
('63f91507', '@lib/element-resize-detector'),
('69ec90f7', '@lib/element-resize-detector'),
('71002742', '@lib/element-resize-detector'),
('73613bdd', '@lib/element-resize-detector'),
('74177e2e', '@craft/web/assets/admintable/dist'),
('7787baaf', '@freeform/Resources'),
('7868eae3', '@app/web/assets/updates/dist'),
('79e93a9d', '@app/web/assets/fields/dist'),
('7ad46c68', '@app/web/assets/feed/dist'),
('7d3986fb', '@craft/web/assets/fields/dist'),
('7e8e14d3', '@app/web/assets/dashboard/dist'),
('7f132a8', '@app/web/assets/login/dist'),
('7f3a432', '@craft/web/assets/cp/dist'),
('8425812b', '@lib/selectize'),
('8534b6ee', '@craft/web/assets/feed/dist'),
('86449db4', '@lib/selectize'),
('876f0e3d', '@app/web/assets/updateswidget/dist'),
('8982324e', '@app/web/assets/recententries/dist'),
('8c28d93e', '@lib/xregexp'),
('8dd42482', '@app/web/assets/cp/dist'),
('8e49c5a1', '@lib/xregexp'),
('900bcb9', '@lib/axios'),
('90e693bd', '@app/web/assets/craftsupport/dist'),
('94bdaff1', '@lib/selectize'),
('94c46e8b', '@lib/xregexp'),
('973a5c02', '@app/web/assets/updater/dist'),
('98904d11', '@craft/web/assets/plugins/dist'),
('9a16ee16', '@vendor/craftcms/redactor/lib/redactor'),
('9e491103', '@craft/web/assets/editsection/dist'),
('9ea82a01', '@lib/selectize'),
('9ed1eb7b', '@lib/xregexp'),
('a0b1eda0', '@app/web/assets/craftsupport/dist'),
('a6b177f3', '@craft/feedme/web/assets/feedme/dist'),
('a6bb17b4', '@app/web/assets/pluginstore/dist'),
('ac77b13d', '@app/web/assets/updateswidget/dist'),
('b2273c67', '@craft/web/assets/login/dist'),
('b3d7814b', '@lib/timepicker'),
('b61a026', '@lib/axios'),
('b7387020', '@app/web/assets/updateswidget/dist'),
('b76c469c', '@doublesecretagency/smartmap'),
('b9bd4fe1', '@app/web/assets/login/dist'),
('b9d54c53', '@app/web/assets/recententries/dist'),
('b9da09a7', '@app/web/assets/feed/dist'),
('ba218baa', '@craft/web/assets/craftsupport/dist'),
('bc22e302', '@app/web/assets/updater/dist'),
('bd835a9f', '@app/web/assets/cp/dist'),
('c0c2699a', '@app/web/assets/dashboard/dist'),
('c0c38275', '@lib/picturefill'),
('c3f47ed9', '@craft/web/assets/deprecationerrors/dist'),
('c47327d4', '@lib/d3'),
('c4981121', '@app/web/assets/feed/dist'),
('c4ff5767', '@app/web/assets/login/dist'),
('c6e3294f', '@app/web/assets/utilities/dist'),
('c767beb7', '@lib/jquery-touch-events'),
('c8b3ad51', '@lib/fileupload'),
('cad2b1ce', '@lib/fileupload'),
('cad60785', '@lib/picturefill'),
('cd723b47', '@lib/jquery-touch-events'),
('ce66a224', '@lib/d3'),
('cfc94710', '@app/web/assets/tablesettings/dist'),
('d05bacaf', '@lib/picturefill'),
('d23ab030', '@lib/picturefill'),
('d23e067b', '@lib/fileupload'),
('d59e8cf2', '@lib/jquery-touch-events'),
('d7ff906d', '@lib/jquery-touch-events'),
('d82b838b', '@lib/fileupload'),
('d9da7358', '@app/web/assets/cp/dist'),
('dc9f9061', '@lib/d3'),
('dcbdfe32', '@craft/web/assets/updates/dist'),
('dcd15225', '@craft/web/assets/editentry/dist'),
('dd8c6594', '@app/web/assets/recententries/dist'),
('defe8cfe', '@lib/d3'),
('df3fa6eb', '@app/web/assets/updates/dist'),
('e288e46c', '@lib/fabric'),
('e3bd7349', '@craft/web/assets/matrixsettings/dist'),
('e74c7396', '@craft/redactor/assets/field/dist'),
('e88944f', '@craft/web/assets/pluginstore/dist'),
('e89d619c', '@lib/fabric'),
('ed439b78', '@lib/garnishjs'),
('edfb964f', '@app/web/assets/utilities/dist'),
('ef2287e7', '@lib/garnishjs'),
('f4bfba7a', '@app/web/assets/craftsupport/dist'),
('f4cf6f3c', '@app/web/assets/feed/dist'),
('f552454e', '@app/web/assets/matrixsettings/dist'),
('f6b45752', '@app/web/assets/utilities/dist'),
('f7ce3052', '@lib/garnishjs'),
('f8054f46', '@lib/fabric'),
('fa6453d9', '@lib/fabric'),
('fc779025', '@craft/web/assets/dashboard/dist'),
('fddbb5a2', '@lib/garnishjs');

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`) VALUES
(1, 2, 1, 1, NULL),
(2, 2, 1, 2, NULL),
(3, 5, 1, 1, NULL),
(4, 5, 1, 2, NULL),
(5, 5, 1, 3, NULL),
(6, 9, 1, 1, NULL),
(7, 11, 1, 1, NULL),
(8, 13, 1, 1, NULL),
(9, 15, 1, 1, NULL),
(10, 17, 1, 1, NULL),
(11, 19, 1, 1, NULL),
(12, 21, 1, 1, NULL),
(13, 23, 1, 1, NULL),
(14, 25, 1, 1, NULL),
(15, 27, 1, 1, NULL),
(16, 29, 1, 1, NULL),
(17, 31, 1, 1, NULL),
(18, 33, 1, 1, NULL),
(19, 35, 1, 1, NULL),
(20, 37, 1, 1, NULL),
(21, 39, 1, 1, NULL),
(22, 41, 1, 1, NULL),
(23, 43, 1, 1, NULL),
(24, 45, 1, 1, NULL),
(25, 47, 1, 1, NULL),
(26, 49, 1, 1, NULL),
(27, 51, 1, 1, NULL),
(28, 53, 1, 1, NULL),
(29, 55, 1, 1, NULL),
(30, 57, 1, 1, NULL),
(31, 59, 1, 1, NULL),
(32, 61, 1, 1, NULL),
(33, 63, 1, 1, NULL),
(34, 65, 1, 1, NULL),
(35, 67, 1, 1, NULL),
(36, 69, 1, 1, NULL),
(37, 71, 1, 1, NULL),
(38, 73, 1, 1, NULL),
(39, 75, 1, 1, NULL),
(40, 77, 1, 1, NULL),
(41, 79, 1, 1, NULL),
(42, 81, 1, 1, NULL),
(43, 83, 1, 1, NULL),
(44, 85, 1, 1, NULL),
(45, 87, 1, 1, NULL),
(46, 89, 1, 1, NULL),
(47, 91, 1, 1, NULL),
(48, 93, 1, 1, NULL),
(49, 95, 1, 1, NULL),
(50, 97, 1, 1, NULL),
(51, 99, 1, 1, NULL),
(52, 101, 1, 1, NULL),
(53, 103, 1, 1, NULL),
(54, 105, 1, 1, NULL),
(55, 107, 1, 1, NULL),
(56, 109, 1, 1, NULL),
(57, 111, 1, 1, NULL),
(58, 113, 1, 1, NULL),
(59, 115, 1, 1, NULL),
(60, 117, 1, 1, NULL),
(61, 119, 1, 1, NULL),
(62, 65, 1, 2, NULL),
(63, 67, 1, 2, NULL),
(64, 69, 1, 2, NULL),
(65, 71, 1, 2, NULL),
(66, 73, 1, 2, NULL),
(67, 75, 1, 2, NULL),
(68, 77, 1, 2, NULL),
(69, 79, 1, 2, NULL),
(70, 81, 1, 2, NULL),
(71, 83, 1, 2, NULL),
(72, 85, 1, 2, NULL),
(73, 87, 1, 2, NULL),
(74, 89, 1, 2, NULL),
(75, 91, 1, 2, NULL),
(76, 93, 1, 2, NULL),
(77, 95, 1, 2, NULL),
(78, 97, 1, 2, NULL),
(79, 99, 1, 2, NULL),
(80, 101, 1, 2, NULL),
(81, 103, 1, 2, NULL),
(82, 105, 1, 2, NULL),
(83, 107, 1, 2, NULL),
(84, 109, 1, 2, NULL),
(85, 111, 1, 2, NULL),
(86, 113, 1, 2, NULL),
(87, 115, 1, 2, NULL),
(88, 117, 1, 2, NULL),
(89, 119, 1, 2, NULL),
(90, 79, 1, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' admin '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' jvargas conversionia com '),
(1, 'slug', 0, 1, ''),
(2, 'title', 0, 1, ' home '),
(2, 'slug', 0, 1, ' home '),
(5, 'title', 0, 1, ' jobs index '),
(5, 'slug', 0, 1, ' jobs index '),
(9, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay '),
(9, 'title', 0, 1, ''),
(9, 'field', 2, 1, ' cornelius '),
(9, 'field', 4, 1, ' cornelius nc cornelius nc cornelius nc 28031 '),
(9, 'field', 8, 1, ' local '),
(9, 'field', 7, 1, ' tanker '),
(11, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 1 '),
(11, 'title', 0, 1, ''),
(11, 'field', 2, 1, ' brentwood '),
(11, 'field', 4, 1, ' brentwood tn brentwood tn brentwood tn 37027 '),
(11, 'field', 8, 1, ' local '),
(11, 'field', 7, 1, ' tanker '),
(13, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 2 '),
(13, 'title', 0, 1, ''),
(13, 'field', 2, 1, ' bryant '),
(13, 'field', 4, 1, ' bryant ar bryant ar bryant ar 72022 '),
(13, 'field', 8, 1, ' local '),
(13, 'field', 7, 1, ' tanker '),
(15, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 3 '),
(15, 'title', 0, 1, ''),
(15, 'field', 2, 1, ' easton '),
(15, 'field', 4, 1, ' easton ct easton ct easton ct 06612 '),
(15, 'field', 8, 1, ' local '),
(15, 'field', 7, 1, ' tanker '),
(17, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 4 '),
(17, 'title', 0, 1, ''),
(17, 'field', 2, 1, ' keene '),
(17, 'field', 4, 1, ' keene nh keene nh keene nh 03431 '),
(17, 'field', 8, 1, ' local '),
(17, 'field', 7, 1, ' tanker '),
(19, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 5 '),
(19, 'title', 0, 1, ''),
(19, 'field', 2, 1, ' athens '),
(19, 'field', 4, 1, ' athens al athens al athens al 35611 '),
(19, 'field', 7, 1, ' van '),
(21, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 6 '),
(21, 'title', 0, 1, ''),
(21, 'field', 2, 1, ' birmingham '),
(21, 'field', 4, 1, ' birmingham al birmingham al birmingham al 35203 '),
(21, 'field', 7, 1, ' van '),
(23, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 7 '),
(23, 'title', 0, 1, ''),
(23, 'field', 2, 1, ' huntsville '),
(23, 'field', 4, 1, ' huntsville al huntsville al huntsville al 35801 '),
(23, 'field', 7, 1, ' van '),
(25, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 8 '),
(25, 'title', 0, 1, ''),
(25, 'field', 2, 1, ' atlanta '),
(25, 'field', 4, 1, ' atlanta ga atlanta ga atlanta ga 30334 '),
(25, 'field', 7, 1, ' van '),
(27, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 9 '),
(27, 'title', 0, 1, ''),
(27, 'field', 2, 1, ' cedar rapids '),
(27, 'field', 4, 1, ' cedar rapids ia cedar rapids ia cedar rapids ia 52401 '),
(27, 'field', 7, 1, ' van '),
(29, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 10 '),
(29, 'title', 0, 1, ''),
(29, 'field', 2, 1, ' chicago '),
(29, 'field', 4, 1, ' chicago il chicago il chicago il 60604 '),
(29, 'field', 7, 1, ' van '),
(31, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 11 '),
(31, 'title', 0, 1, ''),
(31, 'field', 2, 1, ' rockford '),
(31, 'field', 4, 1, ' rockford il rockford il rockford il 61101 '),
(31, 'field', 7, 1, ' van '),
(33, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 12 '),
(33, 'title', 0, 1, ''),
(33, 'field', 2, 1, ' round lake beach '),
(33, 'field', 4, 1, ' round lake beach il round lake beach il round lake beach il 60073 '),
(33, 'field', 7, 1, ' van '),
(35, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 13 '),
(35, 'title', 0, 1, ''),
(35, 'field', 2, 1, ' peoria '),
(35, 'field', 4, 1, ' peoria il peoria il peoria il 61603 '),
(35, 'field', 7, 1, ' van '),
(37, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 14 '),
(37, 'title', 0, 1, ''),
(37, 'field', 2, 1, ' aurora '),
(37, 'field', 4, 1, ' aurora il aurora il aurora il 60506 '),
(37, 'field', 7, 1, ' van '),
(39, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 15 '),
(39, 'title', 0, 1, ''),
(39, 'field', 2, 1, ' noblesville '),
(39, 'field', 4, 1, ' noblesville in noblesville in noblesville in 46060 '),
(39, 'field', 7, 1, ' van '),
(41, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 16 '),
(41, 'title', 0, 1, ''),
(41, 'field', 2, 1, ' columbus '),
(41, 'field', 4, 1, ' columbus in columbus in columbus in 47201 '),
(41, 'field', 7, 1, ' van '),
(43, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 17 '),
(43, 'title', 0, 1, ''),
(43, 'field', 2, 1, ' greenwood '),
(43, 'field', 4, 1, ' greenwood in greenwood in greenwood in 46142 '),
(43, 'field', 7, 1, ' reefer '),
(45, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 18 '),
(45, 'title', 0, 1, ''),
(45, 'field', 2, 1, ' mishawaka '),
(45, 'field', 4, 1, ' mishawaka in mishawaka in mishawaka in 46544 '),
(45, 'field', 7, 1, ' reefer '),
(47, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 19 '),
(47, 'title', 0, 1, ''),
(47, 'field', 2, 1, ' kansas city '),
(47, 'field', 4, 1, ' kansas city ks kansas city ks kansas city ks 66101 '),
(47, 'field', 7, 1, ' reefer '),
(49, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 20 '),
(49, 'title', 0, 1, ''),
(49, 'field', 2, 1, ' bowling green '),
(49, 'field', 4, 1, ' bowling green ky bowling green ky bowling green ky green '),
(49, 'field', 7, 1, ' reefer '),
(51, 'title', 0, 1, ''),
(51, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 21 '),
(51, 'field', 3, 1, ''),
(51, 'field', 2, 1, ' elizabethtown '),
(51, 'field', 4, 1, ' elizabethtown la elizabethtown la elizabethtown la 42701 '),
(51, 'field', 5, 1, ''),
(51, 'field', 6, 1, ''),
(51, 'field', 9, 1, ''),
(51, 'field', 8, 1, ''),
(51, 'field', 7, 1, ' reefer '),
(53, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 22 '),
(53, 'title', 0, 1, ''),
(53, 'field', 2, 1, ' sulphur '),
(53, 'field', 4, 1, ' sulphur la sulphur la sulphur la 70663 '),
(53, 'field', 7, 1, ' reefer '),
(55, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 23 '),
(55, 'title', 0, 1, ''),
(55, 'field', 2, 1, ' abbeville '),
(55, 'field', 4, 1, ' abbeville la abbeville la abbeville la 70510 '),
(55, 'field', 7, 1, ' reefer '),
(57, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 24 '),
(57, 'title', 0, 1, ''),
(57, 'field', 2, 1, ' baltimore '),
(57, 'field', 4, 1, ' baltimore md baltimore md baltimore md 21202 '),
(57, 'field', 7, 1, ' reefer '),
(59, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 25 '),
(59, 'title', 0, 1, ''),
(59, 'field', 2, 1, ' hagerstown '),
(59, 'field', 4, 1, ' hagerstown la hagerstown la hagerstown la 21740 '),
(59, 'field', 7, 1, ' tanker '),
(61, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 26 '),
(61, 'title', 0, 1, ''),
(61, 'field', 2, 1, ' frederick '),
(61, 'field', 4, 1, ' frederick la frederick la frederick la 21701 '),
(61, 'field', 7, 1, ' tanker '),
(63, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 27 '),
(63, 'title', 0, 1, ''),
(63, 'field', 2, 1, ' saint peters '),
(63, 'field', 4, 1, ' saint peters mo saint peters mo saint peters mo 63376 '),
(63, 'field', 7, 1, ' tanker '),
(65, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(65, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 28 '),
(65, 'field', 3, 1, ''),
(65, 'field', 4, 1, ' cornelius nc cornelius nc cornelius nc 28031 '),
(65, 'field', 5, 1, ' conversionia com '),
(65, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(65, 'field', 2, 1, ' cornelius '),
(67, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(67, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 29 '),
(67, 'field', 3, 1, ''),
(67, 'field', 4, 1, ' brentwood tn brentwood tn brentwood tn 37027 '),
(67, 'field', 5, 1, ' conversionia com '),
(67, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(67, 'field', 2, 1, ' brentwood '),
(69, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(69, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 30 '),
(69, 'field', 3, 1, ''),
(69, 'field', 4, 1, ' bryant ar bryant ar bryant ar 72022 '),
(69, 'field', 5, 1, ' conversionia com '),
(69, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(69, 'field', 2, 1, ' bryant '),
(71, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(71, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 31 '),
(71, 'field', 3, 1, ''),
(71, 'field', 4, 1, ' easton ct easton ct easton ct 06612 '),
(71, 'field', 5, 1, ' conversionia com '),
(71, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(71, 'field', 2, 1, ' easton '),
(73, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(73, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 32 '),
(73, 'field', 3, 1, ''),
(73, 'field', 4, 1, ' keene nh keene nh keene nh 03431 '),
(73, 'field', 5, 1, ' conversionia com '),
(73, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(73, 'field', 2, 1, ' keene '),
(75, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(75, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 33 '),
(75, 'field', 3, 1, ''),
(75, 'field', 4, 1, ' athens al athens al athens al 35611 '),
(75, 'field', 5, 1, ' conversionia com '),
(75, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(75, 'field', 2, 1, ' athens '),
(77, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(77, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 34 '),
(77, 'field', 3, 1, ''),
(77, 'field', 4, 1, ' birmingham al birmingham al birmingham al 35203 '),
(77, 'field', 5, 1, ' conversionia com '),
(77, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(77, 'field', 2, 1, ' birmingham '),
(79, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 35 '),
(79, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(79, 'field', 5, 1, ' https craftcms stackexchange com questions 812 how to return a specific entry '),
(79, 'field', 4, 1, ' huntsville al huntsville al huntsville al 35801 '),
(79, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(79, 'field', 2, 1, ' huntsville '),
(81, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(81, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 36 '),
(81, 'field', 3, 1, ''),
(81, 'field', 4, 1, ' atlanta ga atlanta ga atlanta ga 30334 '),
(81, 'field', 5, 1, ' conversionia com '),
(81, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(81, 'field', 2, 1, ' atlanta '),
(83, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(83, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 37 '),
(83, 'field', 3, 1, ''),
(83, 'field', 4, 1, ' cedar rapids ia cedar rapids ia cedar rapids ia 52401 '),
(83, 'field', 5, 1, ' conversionia com '),
(83, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(83, 'field', 2, 1, ' cedar rapids '),
(85, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(85, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 38 '),
(85, 'field', 3, 1, ''),
(85, 'field', 4, 1, ' chicago il chicago il chicago il 60604 '),
(85, 'field', 5, 1, ' conversionia com '),
(85, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(85, 'field', 2, 1, ' chicago '),
(87, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(87, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 39 '),
(87, 'field', 3, 1, ''),
(87, 'field', 4, 1, ' rockford il rockford il rockford il 61101 '),
(87, 'field', 5, 1, ' conversionia com '),
(87, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(87, 'field', 2, 1, ' rockford '),
(89, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(89, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 40 '),
(89, 'field', 3, 1, ''),
(89, 'field', 4, 1, ' round lake beach il round lake beach il round lake beach il 60073 '),
(89, 'field', 5, 1, ' conversionia com '),
(89, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(89, 'field', 2, 1, ' round lake beach '),
(91, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(91, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 41 '),
(91, 'field', 3, 1, ''),
(91, 'field', 4, 1, ' peoria il peoria il peoria il 61603 '),
(91, 'field', 5, 1, ' conversionia com '),
(91, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(91, 'field', 2, 1, ' peoria '),
(93, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(93, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 42 '),
(93, 'field', 3, 1, ''),
(93, 'field', 4, 1, ' aurora il aurora il aurora il 60506 '),
(93, 'field', 5, 1, ' conversionia com '),
(93, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(93, 'field', 2, 1, ' aurora '),
(95, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(95, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 43 '),
(95, 'field', 3, 1, ''),
(95, 'field', 4, 1, ' noblesville in noblesville in noblesville in 46060 '),
(95, 'field', 5, 1, ' conversionia com '),
(95, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(95, 'field', 2, 1, ' noblesville '),
(97, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(97, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 44 '),
(97, 'field', 3, 1, ''),
(97, 'field', 4, 1, ' columbus in columbus in columbus in 47201 '),
(97, 'field', 5, 1, ' conversionia com '),
(97, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(97, 'field', 2, 1, ' columbus '),
(99, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(99, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 45 '),
(99, 'field', 3, 1, ''),
(99, 'field', 4, 1, ' greenwood in greenwood in greenwood in 46142 '),
(99, 'field', 5, 1, ' conversionia com '),
(99, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(99, 'field', 2, 1, ' greenwood '),
(101, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(101, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 46 '),
(101, 'field', 3, 1, ''),
(101, 'field', 4, 1, ' mishawaka in mishawaka in mishawaka in 46544 '),
(101, 'field', 5, 1, ' conversionia com '),
(101, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(101, 'field', 2, 1, ' mishawaka '),
(103, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(103, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 47 '),
(103, 'field', 3, 1, ''),
(103, 'field', 4, 1, ' kansas city ks kansas city ks kansas city ks 66101 '),
(103, 'field', 5, 1, ' conversionia com '),
(103, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(103, 'field', 2, 1, ' kansas city '),
(105, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(105, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 48 '),
(105, 'field', 3, 1, ''),
(105, 'field', 4, 1, ' bowling green ky bowling green ky bowling green ky green '),
(105, 'field', 5, 1, ' conversionia com '),
(105, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(105, 'field', 2, 1, ' bowling green '),
(107, 'field', 2, 1, ' elizabethtown '),
(107, 'field', 3, 1, ''),
(107, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 49 '),
(107, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(107, 'field', 9, 1, ''),
(107, 'field', 8, 1, ''),
(107, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(107, 'field', 4, 1, ' elizabethtown la elizabethtown la elizabethtown la 42701 '),
(109, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(109, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 50 '),
(109, 'field', 3, 1, ''),
(109, 'field', 4, 1, ' sulphur la sulphur la sulphur la 70663 '),
(109, 'field', 5, 1, ' conversionia com '),
(109, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(109, 'field', 2, 1, ' sulphur '),
(111, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(111, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 51 '),
(111, 'field', 3, 1, ''),
(111, 'field', 4, 1, ' abbeville la abbeville la abbeville la 70510 '),
(111, 'field', 5, 1, ' conversionia com '),
(111, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(111, 'field', 2, 1, ' abbeville '),
(113, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(113, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 52 '),
(113, 'field', 3, 1, ''),
(113, 'field', 4, 1, ' baltimore md baltimore md baltimore md 21202 '),
(113, 'field', 5, 1, ' conversionia com '),
(113, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(113, 'field', 2, 1, ' baltimore '),
(115, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(115, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 53 '),
(115, 'field', 3, 1, ''),
(115, 'field', 4, 1, ' hagerstown la hagerstown la hagerstown la 21740 '),
(115, 'field', 5, 1, ' conversionia com '),
(115, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(115, 'field', 2, 1, ' hagerstown '),
(117, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(117, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 54 '),
(117, 'field', 3, 1, ''),
(117, 'field', 4, 1, ' frederick la frederick la frederick la 21701 '),
(117, 'field', 5, 1, ' conversionia com '),
(117, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(117, 'field', 2, 1, ' frederick '),
(119, 'title', 0, 1, ' cdl a flatbed truck driver jobs up to $1 200 wkly pay '),
(119, 'slug', 0, 1, ' cdl a flatbed truck driver jobs up to 1 200 wkly pay 55 '),
(119, 'field', 3, 1, ''),
(119, 'field', 4, 1, ' saint peters mo saint peters mo saint peters mo 63376 '),
(119, 'field', 5, 1, ' conversionia com '),
(119, 'field', 6, 1, ' cdl a flatbed truck driver jobs averaging 63 cpm and earn up to $1 200 weekly minimum pay join montgomery transport where we offer cdl a truck drivers a promising flatbed career with industry leading pay weekly home time and up to $2 000 orientation pay cdl a flatbed truck driver jobs at montgomery provide a loyalty program breaking the ceiling on industry standards with weekly payments up to your first 84 weeks while our weekly minimum pay ensures consistency and reliability during seasonably soft market conditions '),
(119, 'field', 2, 1, ' saint peters '),
(65, 'field', 9, 1, ''),
(65, 'field', 8, 1, ' local '),
(65, 'field', 7, 1, ' tanker '),
(67, 'field', 9, 1, ''),
(67, 'field', 8, 1, ' local '),
(67, 'field', 7, 1, ' tanker '),
(69, 'field', 9, 1, ''),
(69, 'field', 8, 1, ' local '),
(69, 'field', 7, 1, ' tanker '),
(71, 'field', 9, 1, ''),
(71, 'field', 8, 1, ' local '),
(71, 'field', 7, 1, ' tanker '),
(73, 'field', 9, 1, ''),
(73, 'field', 8, 1, ' local '),
(73, 'field', 7, 1, ' tanker '),
(75, 'field', 9, 1, ''),
(75, 'field', 8, 1, ''),
(75, 'field', 7, 1, ' van '),
(77, 'field', 9, 1, ''),
(77, 'field', 8, 1, ''),
(77, 'field', 7, 1, ' van '),
(79, 'field', 9, 1, ''),
(79, 'field', 3, 1, ' solo '),
(79, 'field', 7, 1, ' van '),
(81, 'field', 9, 1, ''),
(81, 'field', 8, 1, ''),
(81, 'field', 7, 1, ' van '),
(83, 'field', 9, 1, ''),
(83, 'field', 8, 1, ''),
(83, 'field', 7, 1, ' van '),
(85, 'field', 9, 1, ''),
(85, 'field', 8, 1, ''),
(85, 'field', 7, 1, ' van '),
(87, 'field', 9, 1, ''),
(87, 'field', 8, 1, ''),
(87, 'field', 7, 1, ' van '),
(89, 'field', 9, 1, ''),
(89, 'field', 8, 1, ''),
(89, 'field', 7, 1, ' van '),
(91, 'field', 9, 1, ''),
(91, 'field', 8, 1, ''),
(91, 'field', 7, 1, ' van '),
(93, 'field', 9, 1, ''),
(93, 'field', 8, 1, ''),
(93, 'field', 7, 1, ' van '),
(95, 'field', 9, 1, ''),
(95, 'field', 8, 1, ''),
(95, 'field', 7, 1, ' van '),
(97, 'field', 9, 1, ''),
(97, 'field', 8, 1, ''),
(97, 'field', 7, 1, ' van '),
(99, 'field', 9, 1, ''),
(99, 'field', 8, 1, ''),
(99, 'field', 7, 1, ' reefer '),
(101, 'field', 9, 1, ''),
(101, 'field', 8, 1, ''),
(101, 'field', 7, 1, ' reefer '),
(103, 'field', 9, 1, ''),
(103, 'field', 8, 1, ''),
(103, 'field', 7, 1, ' reefer '),
(105, 'field', 9, 1, ''),
(105, 'field', 8, 1, ''),
(105, 'field', 7, 1, ' reefer '),
(107, 'field', 5, 1, ' conversionia com '),
(107, 'field', 7, 1, ' reefer '),
(109, 'field', 9, 1, ''),
(109, 'field', 8, 1, ''),
(109, 'field', 7, 1, ' reefer '),
(111, 'field', 9, 1, ''),
(111, 'field', 8, 1, ''),
(111, 'field', 7, 1, ' reefer '),
(113, 'field', 9, 1, ''),
(113, 'field', 8, 1, ''),
(113, 'field', 7, 1, ' reefer '),
(115, 'field', 9, 1, ''),
(115, 'field', 8, 1, ''),
(115, 'field', 7, 1, ' tanker '),
(117, 'field', 9, 1, ''),
(117, 'field', 8, 1, ''),
(117, 'field', 7, 1, ' tanker '),
(119, 'field', 9, 1, ''),
(119, 'field', 8, 1, ''),
(119, 'field', 7, 1, ' tanker '),
(79, 'field', 8, 1, ' otr '),
(150, 'slug', 0, 1, ''),
(150, 'title', 0, 1, ' 2020 03 26 07 12 53 '),
(151, 'slug', 0, 1, ''),
(151, 'title', 0, 1, ' 2020 03 26 07 14 31 '),
(152, 'slug', 0, 1, ''),
(152, 'title', 0, 1, ' 2020 03 26 07 33 40 '),
(153, 'slug', 0, 1, ''),
(153, 'title', 0, 1, ' 2020 03 26 07 38 18 '),
(154, 'slug', 0, 1, ''),
(154, 'title', 0, 1, ' 2020 03 26 07 49 33 '),
(155, 'slug', 0, 1, ''),
(155, 'title', 0, 1, ' 2020 03 26 08 05 44 '),
(156, 'slug', 0, 1, ''),
(156, 'title', 0, 1, ' 2020 03 26 08 07 38 '),
(157, 'slug', 0, 1, ''),
(157, 'title', 0, 1, ' 2020 03 26 08 40 47 '),
(158, 'slug', 0, 1, ''),
(158, 'title', 0, 1, ' 2020 03 26 09 15 23 '),
(159, 'slug', 0, 1, ''),
(159, 'title', 0, 1, ' 2020 03 26 09 46 22 '),
(160, 'slug', 0, 1, ''),
(160, 'title', 0, 1, ' 2020 03 26 13 20 49 '),
(161, 'slug', 0, 1, ''),
(161, 'title', 0, 1, ' 2020 03 26 15 53 56 '),
(162, 'slug', 0, 1, ''),
(162, 'title', 0, 1, ' 2020 03 26 15 55 13 '),
(163, 'slug', 0, 1, ''),
(163, 'title', 0, 1, ' 2020 03 26 16 11 43 '),
(164, 'slug', 0, 1, ''),
(164, 'title', 0, 1, ' 2020 03 26 16 21 26 '),
(165, 'slug', 0, 1, ''),
(165, 'title', 0, 1, ' 2020 03 26 16 23 38 '),
(166, 'slug', 0, 1, ''),
(166, 'title', 0, 1, ' 2020 03 26 16 24 33 '),
(167, 'slug', 0, 1, ''),
(167, 'title', 0, 1, ' 2020 03 26 16 25 10 '),
(168, 'slug', 0, 1, ''),
(168, 'title', 0, 1, ' 2020 03 26 16 26 42 '),
(169, 'slug', 0, 1, ''),
(169, 'title', 0, 1, ' 2020 03 26 16 27 40 '),
(170, 'slug', 0, 1, ''),
(170, 'title', 0, 1, ' 2020 03 26 16 29 55 '),
(171, 'slug', 0, 1, ''),
(171, 'title', 0, 1, ' 2020 03 26 16 33 46 '),
(172, 'slug', 0, 1, ''),
(172, 'title', 0, 1, ' 2020 03 26 16 50 40 '),
(173, 'slug', 0, 1, ''),
(173, 'title', 0, 1, ' 2020 03 26 18 16 15 '),
(174, 'slug', 0, 1, ''),
(174, 'title', 0, 1, ' 2020 03 27 08 19 57 '),
(175, 'slug', 0, 1, ''),
(175, 'title', 0, 1, ' 2020 03 27 08 27 52 ');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'Home', 'home', 'single', 1, 'all', NULL, '2020-03-24 00:51:10', '2020-03-24 00:51:10', NULL, 'a4d4c22c-dea1-4c59-94b4-7af6f68a4dd7'),
(2, NULL, 'Jobs Index', 'jobsIndex', 'single', 1, 'all', NULL, '2020-03-24 00:53:30', '2020-03-24 00:53:30', NULL, '72e17c71-1255-44dc-9823-ed4586ea10b3'),
(3, NULL, 'Job Listings', 'jobListings', 'channel', 1, 'all', NULL, '2020-03-24 03:45:18', '2020-03-24 03:45:18', NULL, 'ce92d17c-c6ee-4e77-a0a8-fa8bb1d1a7eb');

-- --------------------------------------------------------

--
-- Table structure for table `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, '__home__', '', 1, '2020-03-24 00:51:10', '2020-03-24 00:51:10', '14a7b58a-2462-40f5-8420-8d22298d8b22'),
(2, 2, 1, 1, 'jobs', 'jobs/index', 1, '2020-03-24 00:53:31', '2020-03-24 00:53:31', '598b455e-1cc5-47a2-bec9-dfe4072e2761'),
(3, 3, 1, 1, 'jobs/{slug}', 'jobs/entry', 1, '2020-03-24 03:45:18', '2020-03-25 15:19:34', '2d5cb4c4-dbbb-4786-adf4-09a07703c4ed');

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(10, 1, 'hx_SK3Y7j-Jzi8Gg6e8pDLRtW4J5C6KJ7FTpKEOTfnLQGN6djnQ0aHm4k_N8Jcze6OFPCB8qx_PH2gMo3sLIMOeFpIid3rGPPdMf', '2020-03-26 23:00:06', '2020-03-26 23:54:52', 'fd818c50-88b5-4c78-8701-843dfd8d39e4'),
(14, 1, '6rB_WxWFYAVAdpwzDdpIT9ouob8rk9RBa-aWISP23pMCvEcqZLV_AvHUP9ACnwYeMbyFrvN1t9xJdpcMF0OLXFq_D1wopQZGoVHa', '2020-03-27 17:09:17', '2020-03-27 17:09:17', '5d4fb82f-aab1-45f5-90fb-0834433c28b2'),
(15, 1, 'XiAE7Tt-gCNsXAbprBICUhZMCSQ4pjfwr1vHDvphlmsRcbguc0VrsNuFdaKOjJHTfdDL-QiNeR0erhJwyQtYN8WxqTQVVPERwyLb', '2020-04-07 15:50:10', '2020-04-07 15:59:21', '35cedbaf-9997-41de-a5c1-d9748eb96a54');

-- --------------------------------------------------------

--
-- Table structure for table `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'mats', '2020-03-23 05:11:44', '2020-03-23 05:11:44', NULL, '63bf1954-da71-4ed4-87de-c0a9cfedfd47');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'mats', 'default', 'en-US', 1, '$DEFAULT_SITE_URL', 1, '2020-03-23 05:11:44', '2020-03-23 05:11:44', NULL, 'c263d233-c920-40c0-995d-f6deafc5802a');

-- --------------------------------------------------------

--
-- Table structure for table `smartmap_addresses`
--

CREATE TABLE `smartmap_addresses` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `street1` varchar(255) DEFAULT NULL,
  `street2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `lat` decimal(12,8) DEFAULT NULL,
  `lng` decimal(12,8) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `smartmap_addresses`
--

INSERT INTO `smartmap_addresses` (`id`, `elementId`, `fieldId`, `street1`, `street2`, `city`, `state`, `zip`, `country`, `lat`, `lng`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 5, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-24 20:21:15', '2020-03-24 20:21:15', 'd8a90d77-fa9e-43cc-a866-cd274cdcc098'),
(2, 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-24 20:21:15', '2020-03-24 20:21:15', '5cbdc333-c257-49d9-831a-6481d8605448'),
(3, 8, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-24 20:24:15', '2020-03-24 20:24:15', '32842b8e-2b07-4e63-8bb2-e8d458ee1b64'),
(4, 9, 4, 'cornelius, NC', 'cornelius, NC', 'cornelius', 'NC', '28031', NULL, '35.48680320', '-80.86007360', '2020-03-25 05:25:09', '2020-03-25 05:25:09', '57a6d363-e0e4-435b-b4a6-c569b37227fb'),
(5, 10, 4, 'cornelius, NC', 'cornelius, NC', 'cornelius', 'NC', '28031', NULL, '35.48680320', '-80.86007360', '2020-03-25 05:25:09', '2020-03-25 05:25:09', '4af69af5-ecc9-41eb-a837-a196dccbb9ea'),
(6, 11, 4, 'brentwood, TN', 'brentwood, TN', 'brentwood', 'TN', '37027', NULL, '36.03311640', '-86.78277720', '2020-03-25 05:25:09', '2020-03-25 05:25:09', '823e5be9-3f88-4eb9-90af-c1b91581458d'),
(7, 12, 4, 'brentwood, TN', 'brentwood, TN', 'brentwood', 'TN', '37027', NULL, '36.03311640', '-86.78277720', '2020-03-25 05:25:09', '2020-03-25 05:25:09', '84c439eb-a54a-4293-99a0-e8b82f547bc1'),
(8, 13, 4, 'bryant, AR', 'bryant, AR', 'bryant', 'AR', '72022', NULL, '34.59592650', '-92.48904690', '2020-03-25 05:25:09', '2020-03-25 05:25:09', '6325377f-9dd3-4787-b1b7-d6fd5e13307f'),
(9, 14, 4, 'bryant, AR', 'bryant, AR', 'bryant', 'AR', '72022', NULL, '34.59592650', '-92.48904690', '2020-03-25 05:25:09', '2020-03-25 05:25:09', '74eddf92-973e-4469-a8c9-6618b3ad5776'),
(10, 15, 4, 'Easton, CT', 'Easton, CT', 'Easton', 'CT', '06612', NULL, '41.27120560', '-73.29664050', '2020-03-25 05:25:09', '2020-03-25 05:25:09', '717bc0e4-b685-4c68-80b0-8fdb697b53bf'),
(11, 16, 4, 'Easton, CT', 'Easton, CT', 'Easton', 'CT', '06612', NULL, '41.27120560', '-73.29664050', '2020-03-25 05:25:09', '2020-03-25 05:25:09', '9bdcb2a4-1ee5-417a-abb1-fab82e0a1c01'),
(12, 17, 4, 'Keene, NH', 'Keene, NH', 'Keene', 'NH', '03431', NULL, '42.93369200', '-72.27814090', '2020-03-25 05:25:09', '2020-03-25 05:25:09', '2b2f2b8f-462c-4e97-8e13-0f809103ecdb'),
(13, 18, 4, 'Keene, NH', 'Keene, NH', 'Keene', 'NH', '03431', NULL, '42.93369200', '-72.27814090', '2020-03-25 05:25:10', '2020-03-25 05:25:10', '73de0032-c707-4f47-944c-0b527b2c9e8c'),
(14, 19, 4, 'Athens, AL', 'Athens, AL', 'Athens', 'AL', '35611', NULL, '34.80286610', '-86.97167410', '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'a8aa61c8-bf6c-4fa8-a2c3-5757179691cf'),
(15, 20, 4, 'Athens, AL', 'Athens, AL', 'Athens', 'AL', '35611', NULL, '34.80286610', '-86.97167410', '2020-03-25 05:25:10', '2020-03-25 05:25:10', '16384fd0-1926-44ca-b08d-36765fbdfb68'),
(16, 21, 4, 'Birmingham, AL', 'Birmingham, AL', 'Birmingham', 'AL', '35203', NULL, '33.51858920', '-86.81035670', '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'd0729333-7b03-421a-87d1-a2506a58c148'),
(17, 22, 4, 'Birmingham, AL', 'Birmingham, AL', 'Birmingham', 'AL', '35203', NULL, '33.51858920', '-86.81035670', '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'e6f8a057-f4cc-4398-925b-c4c198bebf3c'),
(18, 23, 4, 'Huntsville, AL', 'Huntsville, AL', 'Huntsville', 'AL', '35801', NULL, '34.73036880', '-86.58610370', '2020-03-25 05:25:10', '2020-03-25 05:25:10', '883febf4-1e5f-4e24-909f-96e83ca34422'),
(19, 24, 4, 'Huntsville, AL', 'Huntsville, AL', 'Huntsville', 'AL', '35801', NULL, '34.73036880', '-86.58610370', '2020-03-25 05:25:10', '2020-03-25 05:25:10', '49ee7e7e-6d51-4799-87fe-ecff5103373c'),
(20, 25, 4, 'Atlanta, GA', 'Atlanta, GA', 'Atlanta', 'GA', '30334', NULL, '33.74899540', '-84.38798240', '2020-03-25 05:25:10', '2020-03-25 05:25:10', '638ca979-f07b-47d5-a512-1d529ee77ff5'),
(21, 26, 4, 'Atlanta, GA', 'Atlanta, GA', 'Atlanta', 'GA', '30334', NULL, '33.74899540', '-84.38798240', '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'a9fd189d-f72e-426b-8499-a057d5c28510'),
(22, 27, 4, 'Cedar Rapids, IA', 'Cedar Rapids, IA', 'Cedar Rapids', 'IA', '52401', NULL, '41.97787950', '-91.66562320', '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'd6a2e018-8371-4061-ac71-31628570d5cb'),
(23, 28, 4, 'Cedar Rapids, IA', 'Cedar Rapids, IA', 'Cedar Rapids', 'IA', '52401', NULL, '41.97787950', '-91.66562320', '2020-03-25 05:25:10', '2020-03-25 05:25:10', '5a11642e-58fb-45e1-9fcf-0a0f298f664d'),
(24, 29, 4, 'Chicago, IL', 'Chicago, IL', 'Chicago', 'IL', '60604', NULL, '41.87811360', '-87.62979820', '2020-03-25 05:25:10', '2020-03-25 05:25:10', '46e9d512-400c-44df-a615-ee682f130577'),
(25, 30, 4, 'Chicago, IL', 'Chicago, IL', 'Chicago', 'IL', '60604', NULL, '41.87811360', '-87.62979820', '2020-03-25 05:25:10', '2020-03-25 05:25:10', '5d703cb8-3607-46b0-87ba-f332bd403e06'),
(26, 31, 4, 'Rockford, IL', 'Rockford, IL', 'Rockford', 'IL', '61101', NULL, '42.27113110', '-89.09399520', '2020-03-25 05:25:10', '2020-03-25 05:25:10', '80406fda-f64c-490c-bf10-ec180689c48b'),
(27, 32, 4, 'Rockford, IL', 'Rockford, IL', 'Rockford', 'IL', '61101', NULL, '42.27113110', '-89.09399520', '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'ed29eeff-fbe5-4724-b151-8d7f938526c0'),
(28, 33, 4, 'Round Lake Beach, IL', 'Round Lake Beach, IL', 'Round Lake Beach', 'IL', '60073', NULL, '42.37168810', '-88.09008150', '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'a4e0e00b-34f9-41ee-934e-493cbbb1978f'),
(29, 34, 4, 'Round Lake Beach, IL', 'Round Lake Beach, IL', 'Round Lake Beach', 'IL', '60073', NULL, '42.37168810', '-88.09008150', '2020-03-25 05:25:10', '2020-03-25 05:25:10', '112b3938-9c54-4c46-ad09-712c3ca4965e'),
(30, 35, 4, 'Peoria, IL', 'Peoria, IL', 'Peoria', 'IL', '61603', NULL, '40.69364880', '-89.58898640', '2020-03-25 05:25:10', '2020-03-25 05:25:10', '7b02c4e9-008b-4561-8251-260cb36cca87'),
(31, 36, 4, 'Peoria, IL', 'Peoria, IL', 'Peoria', 'IL', '61603', NULL, '40.69364880', '-89.58898640', '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'cff53035-ae01-40cd-b4f6-c5d743d603d2'),
(32, 37, 4, 'Aurora, IL', 'Aurora, IL', 'Aurora', 'IL', '60506', NULL, '41.76058490', '-88.32007150', '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'c3415323-b50d-4938-b841-2c86d7656f08'),
(33, 38, 4, 'Aurora, IL', 'Aurora, IL', 'Aurora', 'IL', '60506', NULL, '41.76058490', '-88.32007150', '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'e8fc1d94-67ba-4755-b879-237ac78a0511'),
(34, 39, 4, 'Noblesville, IN', 'Noblesville, IN', 'Noblesville', 'IN', '46060', NULL, '40.04559170', '-86.00859550', '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'e55d3e9d-730b-4d64-b9ab-0913c6defcd5'),
(35, 40, 4, 'Noblesville, IN', 'Noblesville, IN', 'Noblesville', 'IN', '46060', NULL, '40.04559170', '-86.00859550', '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'd6887edc-a0dd-4ca1-bfdb-b16bc24d8a8d'),
(36, 41, 4, 'Columbus, IN', 'Columbus, IN', 'Columbus', 'IN', '47201', NULL, '39.20144040', '-85.92137960', '2020-03-25 05:25:10', '2020-03-25 05:25:10', '86ec7eb3-66c2-4e75-be49-90e28669c172'),
(37, 42, 4, 'Columbus, IN', 'Columbus, IN', 'Columbus', 'IN', '47201', NULL, '39.20144040', '-85.92137960', '2020-03-25 05:25:10', '2020-03-25 05:25:10', '3b14602a-868c-4ff0-a7b8-abf471edd7af'),
(38, 43, 4, 'Greenwood, IN', 'Greenwood, IN', 'Greenwood', 'IN', '46142', NULL, '39.61365780', '-86.10665260', '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'a19809ee-3c6c-4539-990b-335ddbbba5db'),
(39, 44, 4, 'Greenwood, IN', 'Greenwood, IN', 'Greenwood', 'IN', '46142', NULL, '39.61365780', '-86.10665260', '2020-03-25 05:25:10', '2020-03-25 05:25:10', '0a80c28c-13e4-4df9-a592-4aa34c6cdde5'),
(40, 45, 4, 'Mishawaka, IN', 'Mishawaka, IN', 'Mishawaka', 'IN', '46544', NULL, '41.66199270', '-86.15861560', '2020-03-25 05:25:10', '2020-03-25 05:25:10', '2ab56ca3-dd2c-4d72-9444-5fc3448c48ca'),
(41, 46, 4, 'Mishawaka, IN', 'Mishawaka, IN', 'Mishawaka', 'IN', '46544', NULL, '41.66199270', '-86.15861560', '2020-03-25 05:25:10', '2020-03-25 05:25:10', '17724282-177a-43a5-9e6c-04ff6766d671'),
(42, 47, 4, 'Kansas City, KS', 'Kansas City, KS', 'Kansas City', 'KS', '66101', NULL, '39.11553140', '-94.62678730', '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'f1040649-403b-49b0-bdf9-4edcb2139c31'),
(43, 48, 4, 'Kansas City, KS', 'Kansas City, KS', 'Kansas City', 'KS', '66101', NULL, '39.11553140', '-94.62678730', '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'dc8712ce-92d7-4190-a939-c88699f2586c'),
(44, 49, 4, 'Bowling Green, KY', 'Bowling Green, KY', 'Bowling Green', 'KY', 'Green', NULL, '36.96852190', '-86.48080430', '2020-03-25 05:25:10', '2020-03-25 05:25:10', '27ca57eb-842c-4d13-bcb8-cbbe67cc3374'),
(45, 50, 4, 'Bowling Green, KY', 'Bowling Green, KY', 'Bowling Green', 'KY', 'Green', NULL, '36.96852190', '-86.48080430', '2020-03-25 05:25:10', '2020-03-25 05:25:10', 'e5e6254b-858f-424e-8971-7c48c865bb72'),
(46, 51, 4, 'Elizabethtown, LA', 'Elizabethtown, LA', 'Elizabethtown', 'LA', '42701', NULL, '37.70891820', '-85.83347450', '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'ac6876f0-7636-4118-b457-49283de5eb6c'),
(47, 52, 4, 'Elizabethtown, KY', 'Elizabethtown, KY', 'Elizabethtown', 'KY', '42701', NULL, '37.70306460', '-85.86494080', '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'b62f806f-a5b5-402d-b2de-d650fb3ec0a7'),
(48, 53, 4, 'Sulphur, LA', 'Sulphur, LA', 'Sulphur', 'LA', '70663', NULL, '30.23659430', '-93.37737830', '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'a523279c-232b-49a5-945d-3c4c26759fa4'),
(49, 54, 4, 'Sulphur, LA', 'Sulphur, LA', 'Sulphur', 'LA', '70663', NULL, '30.23659430', '-93.37737830', '2020-03-25 05:25:11', '2020-03-25 05:25:11', '5d9401d1-3c3a-4134-a3ab-6169ca94b738'),
(50, 55, 4, 'Abbeville, LA', 'Abbeville, LA', 'Abbeville', 'LA', '70510', NULL, '29.97465020', '-92.13429210', '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'f4f67902-5135-4c04-b025-9164282df75d'),
(51, 56, 4, 'Abbeville, LA', 'Abbeville, LA', 'Abbeville', 'LA', '70510', NULL, '29.97465020', '-92.13429210', '2020-03-25 05:25:11', '2020-03-25 05:25:11', '7bf3dd3b-188d-4a9f-a1ec-8b2cd22e1779'),
(52, 57, 4, 'Baltimore, MD', 'Baltimore, MD', 'Baltimore', 'MD', '21202', NULL, '39.29038480', '-76.61218930', '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'b3f49640-adcd-4bda-8efc-c870c71e0661'),
(53, 58, 4, 'Baltimore, MD', 'Baltimore, MD', 'Baltimore', 'MD', '21202', NULL, '39.29038480', '-76.61218930', '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'f3b01bf3-eb37-4c50-bdfb-f27091ccfdfb'),
(54, 59, 4, 'Hagerstown, LA', 'Hagerstown, LA', 'Hagerstown', 'LA', '21740', NULL, '39.62980440', '-77.76438530', '2020-03-25 05:25:11', '2020-03-25 05:25:11', '0862fa88-d9f4-4eea-a0e8-c48745a7edb8'),
(55, 60, 4, 'Hagerstown, LA', 'Hagerstown, LA', 'Hagerstown', 'LA', '21740', NULL, '39.62980440', '-77.76438530', '2020-03-25 05:25:11', '2020-03-25 05:25:11', '7f983218-f2fc-4656-856a-24e235f8c2e8'),
(56, 61, 4, 'Frederick, LA', 'Frederick, LA', 'Frederick', 'LA', '21701', NULL, '39.41291160', '-77.41125780', '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'c5d3063a-52e1-4ae5-94f2-57291e77b196'),
(57, 62, 4, 'Frederick, LA', 'Frederick, LA', 'Frederick', 'LA', '21701', NULL, '39.41291160', '-77.41125780', '2020-03-25 05:25:11', '2020-03-25 05:25:11', '6f49ab48-76db-4239-8691-367326cfcb85'),
(58, 63, 4, 'Saint Peters, MO', 'Saint Peters, MO', 'Saint Peters', 'MO', '63376', NULL, '38.78746990', '-90.62989220', '2020-03-25 05:25:11', '2020-03-25 05:25:11', 'c6ba4f2c-7b8e-4089-98ea-b882d81944c7'),
(59, 64, 4, 'Saint Peters, MO', 'Saint Peters, MO', 'Saint Peters', 'MO', '63376', NULL, '38.78746990', '-90.62989220', '2020-03-25 05:25:11', '2020-03-25 05:25:11', '83f51eea-b9d9-454f-a64d-3951fa5605d1'),
(60, 65, 4, 'cornelius, NC', 'cornelius, NC', 'cornelius', 'NC', '28031', NULL, '35.48680320', '-80.86007360', '2020-03-25 05:37:59', '2020-03-25 05:39:04', '1665c4ac-4247-4a26-8c5d-f0bf30cc7d7f'),
(61, 66, 4, 'cornelius, NC', 'cornelius, NC', 'cornelius', 'NC', '28031', NULL, '35.48680320', '-80.86007360', '2020-03-25 05:37:59', '2020-03-25 05:37:59', '826d721e-33d5-4b0f-a4fd-e06393d3e48f'),
(62, 67, 4, 'brentwood, TN', 'brentwood, TN', 'brentwood', 'TN', '37027', NULL, '36.03311640', '-86.78277720', '2020-03-25 05:37:59', '2020-03-25 05:39:04', '76dd8a3b-4f6b-47f3-98ac-31e30318885a'),
(63, 68, 4, 'brentwood, TN', 'brentwood, TN', 'brentwood', 'TN', '37027', NULL, '36.03311640', '-86.78277720', '2020-03-25 05:37:59', '2020-03-25 05:37:59', 'fa7f194c-72fd-4405-a7f6-9b35124c6479'),
(64, 69, 4, 'bryant, AR', 'bryant, AR', 'bryant', 'AR', '72022', NULL, '34.59592650', '-92.48904690', '2020-03-25 05:37:59', '2020-03-25 05:39:05', '0e4fd23a-0990-40f5-af19-a82e6b36b3fc'),
(65, 70, 4, 'bryant, AR', 'bryant, AR', 'bryant', 'AR', '72022', NULL, '34.59592650', '-92.48904690', '2020-03-25 05:37:59', '2020-03-25 05:37:59', '3bf4a311-6b9c-4633-b2e7-9febb0d9e159'),
(66, 71, 4, 'Easton, CT', 'Easton, CT', 'Easton', 'CT', '06612', NULL, '41.27120560', '-73.29664050', '2020-03-25 05:37:59', '2020-03-25 05:39:05', 'fde81469-35b9-49ae-8b4c-53e0e83e10f7'),
(67, 72, 4, 'Easton, CT', 'Easton, CT', 'Easton', 'CT', '06612', NULL, '41.27120560', '-73.29664050', '2020-03-25 05:37:59', '2020-03-25 05:37:59', 'ab2d8d02-b05f-454a-93fd-b2363791a665'),
(68, 73, 4, 'Keene, NH', 'Keene, NH', 'Keene', 'NH', '03431', NULL, '42.93369200', '-72.27814090', '2020-03-25 05:38:00', '2020-03-25 05:39:05', '849dc830-f67a-43f4-8b91-1b25bb9a8477'),
(69, 74, 4, 'Keene, NH', 'Keene, NH', 'Keene', 'NH', '03431', NULL, '42.93369200', '-72.27814090', '2020-03-25 05:38:00', '2020-03-25 05:38:00', '6e233b6d-45c5-48f1-ab06-f3f347f36b6b'),
(70, 75, 4, 'Athens, AL', 'Athens, AL', 'Athens', 'AL', '35611', NULL, '34.80286610', '-86.97167410', '2020-03-25 05:38:00', '2020-03-25 05:39:05', '63cf28b9-f7e7-4b76-b73f-eda9d394842d'),
(71, 76, 4, 'Athens, AL', 'Athens, AL', 'Athens', 'AL', '35611', NULL, '34.80286610', '-86.97167410', '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'b48d9c0d-bd7a-4516-80d0-91cb6ee81da1'),
(72, 77, 4, 'Birmingham, AL', 'Birmingham, AL', 'Birmingham', 'AL', '35203', NULL, '33.51858920', '-86.81035670', '2020-03-25 05:38:00', '2020-03-25 05:39:05', '441bee86-3e2a-4db5-b37a-09a19d681aa2'),
(73, 78, 4, 'Birmingham, AL', 'Birmingham, AL', 'Birmingham', 'AL', '35203', NULL, '33.51858920', '-86.81035670', '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'f8304a65-bf9e-4c84-ada1-413424c9d1cf'),
(74, 79, 4, 'Huntsville, AL', 'Huntsville, AL', 'Huntsville', 'AL', '35801', NULL, '34.73036880', '-86.58610370', '2020-03-25 05:38:00', '2020-03-25 05:39:05', '172a5597-1d17-4562-a4db-8896d438c1fd'),
(75, 80, 4, 'Huntsville, AL', 'Huntsville, AL', 'Huntsville', 'AL', '35801', NULL, '34.73036880', '-86.58610370', '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'fbaf2661-9d22-4af4-ac70-09a10191bf68'),
(76, 81, 4, 'Atlanta, GA', 'Atlanta, GA', 'Atlanta', 'GA', '30334', NULL, '33.74899540', '-84.38798240', '2020-03-25 05:38:00', '2020-03-25 05:39:05', '728b8226-875f-42f3-ad29-32d0b16b382a'),
(77, 82, 4, 'Atlanta, GA', 'Atlanta, GA', 'Atlanta', 'GA', '30334', NULL, '33.74899540', '-84.38798240', '2020-03-25 05:38:00', '2020-03-25 05:38:00', '14aa6e5f-5c1b-4b31-982f-4e29f96204e5'),
(78, 83, 4, 'Cedar Rapids, IA', 'Cedar Rapids, IA', 'Cedar Rapids', 'IA', '52401', NULL, '41.97787950', '-91.66562320', '2020-03-25 05:38:00', '2020-03-25 05:39:06', 'f8c29d4c-6181-4413-b71b-e298dc12078a'),
(79, 84, 4, 'Cedar Rapids, IA', 'Cedar Rapids, IA', 'Cedar Rapids', 'IA', '52401', NULL, '41.97787950', '-91.66562320', '2020-03-25 05:38:00', '2020-03-25 05:38:00', '9042ffd0-0543-47cc-aea8-d787b6a6f6bb'),
(80, 85, 4, 'Chicago, IL', 'Chicago, IL', 'Chicago', 'IL', '60604', NULL, '41.87811360', '-87.62979820', '2020-03-25 05:38:00', '2020-03-25 05:39:06', '081a28eb-9d17-4011-8156-6659ecd6b3ba'),
(81, 86, 4, 'Chicago, IL', 'Chicago, IL', 'Chicago', 'IL', '60604', NULL, '41.87811360', '-87.62979820', '2020-03-25 05:38:00', '2020-03-25 05:38:00', '2ffad146-86b3-47da-8bdc-c225fd2b2d25'),
(82, 87, 4, 'Rockford, IL', 'Rockford, IL', 'Rockford', 'IL', '61101', NULL, '42.27113110', '-89.09399520', '2020-03-25 05:38:00', '2020-03-25 05:39:06', '5dfb81d7-95c1-401c-8093-380fbaf1eb6b'),
(83, 88, 4, 'Rockford, IL', 'Rockford, IL', 'Rockford', 'IL', '61101', NULL, '42.27113110', '-89.09399520', '2020-03-25 05:38:00', '2020-03-25 05:38:00', '21100664-f637-4457-874d-69232481da95'),
(84, 89, 4, 'Round Lake Beach, IL', 'Round Lake Beach, IL', 'Round Lake Beach', 'IL', '60073', NULL, '42.37168810', '-88.09008150', '2020-03-25 05:38:00', '2020-03-25 05:39:06', 'a49e8ccd-28be-4b1e-8285-405b1903a4fa'),
(85, 90, 4, 'Round Lake Beach, IL', 'Round Lake Beach, IL', 'Round Lake Beach', 'IL', '60073', NULL, '42.37168810', '-88.09008150', '2020-03-25 05:38:00', '2020-03-25 05:38:00', 'f802aa24-1d98-4a5e-afa1-8d3db63786d7'),
(86, 91, 4, 'Peoria, IL', 'Peoria, IL', 'Peoria', 'IL', '61603', NULL, '40.69364880', '-89.58898640', '2020-03-25 05:38:00', '2020-03-25 05:39:06', 'e3529c35-79ce-4cfa-a048-659dfac350f5'),
(87, 92, 4, 'Peoria, IL', 'Peoria, IL', 'Peoria', 'IL', '61603', NULL, '40.69364880', '-89.58898640', '2020-03-25 05:38:00', '2020-03-25 05:38:00', '22c3c7fd-628b-46f4-8aae-a129621ddc59'),
(88, 93, 4, 'Aurora, IL', 'Aurora, IL', 'Aurora', 'IL', '60506', NULL, '41.76058490', '-88.32007150', '2020-03-25 05:38:01', '2020-03-25 05:39:06', '04cf9e47-5c97-4317-aa97-bc17ab74919c'),
(89, 94, 4, 'Aurora, IL', 'Aurora, IL', 'Aurora', 'IL', '60506', NULL, '41.76058490', '-88.32007150', '2020-03-25 05:38:01', '2020-03-25 05:38:01', '1d184b62-b443-4f44-978b-9a5ac25cda7b'),
(90, 95, 4, 'Noblesville, IN', 'Noblesville, IN', 'Noblesville', 'IN', '46060', NULL, '40.04559170', '-86.00859550', '2020-03-25 05:38:01', '2020-03-25 05:39:07', '00723902-a40f-4378-9b90-03543d301fea'),
(91, 96, 4, 'Noblesville, IN', 'Noblesville, IN', 'Noblesville', 'IN', '46060', NULL, '40.04559170', '-86.00859550', '2020-03-25 05:38:01', '2020-03-25 05:38:01', '2ed24228-c9ae-4d0d-8051-385cedd9e347'),
(92, 97, 4, 'Columbus, IN', 'Columbus, IN', 'Columbus', 'IN', '47201', NULL, '39.20144040', '-85.92137960', '2020-03-25 05:38:01', '2020-03-25 05:39:07', 'd2ad3447-0fa2-477b-9801-3eaae89c4bde'),
(93, 98, 4, 'Columbus, IN', 'Columbus, IN', 'Columbus', 'IN', '47201', NULL, '39.20144040', '-85.92137960', '2020-03-25 05:38:01', '2020-03-25 05:38:01', '2fe5ff16-e94b-47fd-88bb-e859854383d6'),
(94, 99, 4, 'Greenwood, IN', 'Greenwood, IN', 'Greenwood', 'IN', '46142', NULL, '39.61365780', '-86.10665260', '2020-03-25 05:38:01', '2020-03-25 05:39:07', 'd3be2810-ab3f-4aa0-867b-98b3894b9efc'),
(95, 100, 4, 'Greenwood, IN', 'Greenwood, IN', 'Greenwood', 'IN', '46142', NULL, '39.61365780', '-86.10665260', '2020-03-25 05:38:01', '2020-03-25 05:38:01', 'e04dcc52-20ad-4200-9e47-ce6f5f6946da'),
(96, 101, 4, 'Mishawaka, IN', 'Mishawaka, IN', 'Mishawaka', 'IN', '46544', NULL, '41.66199270', '-86.15861560', '2020-03-25 05:38:01', '2020-03-25 05:39:07', '652c2a8d-9439-41f8-9822-83f3d26db045'),
(97, 102, 4, 'Mishawaka, IN', 'Mishawaka, IN', 'Mishawaka', 'IN', '46544', NULL, '41.66199270', '-86.15861560', '2020-03-25 05:38:01', '2020-03-25 05:38:01', 'd2093ea4-3ab6-49bd-a31a-64452be5c9d7'),
(98, 103, 4, 'Kansas City, KS', 'Kansas City, KS', 'Kansas City', 'KS', '66101', NULL, '39.11553140', '-94.62678730', '2020-03-25 05:38:01', '2020-03-25 05:39:07', 'f9c3fe0a-0f98-4a5c-b0dc-a2ecfc3c40f7'),
(99, 104, 4, 'Kansas City, KS', 'Kansas City, KS', 'Kansas City', 'KS', '66101', NULL, '39.11553140', '-94.62678730', '2020-03-25 05:38:01', '2020-03-25 05:38:01', 'eb1221b0-5f87-4684-a01d-642d61d3a703'),
(100, 105, 4, 'Bowling Green, KY', 'Bowling Green, KY', 'Bowling Green', 'KY', 'Green', NULL, '36.96852190', '-86.48080430', '2020-03-25 05:38:01', '2020-03-25 05:39:07', '18235c0c-dde4-44ad-8828-16f33367daf3'),
(101, 106, 4, 'Bowling Green, KY', 'Bowling Green, KY', 'Bowling Green', 'KY', 'Green', NULL, '36.96852190', '-86.48080430', '2020-03-25 05:38:01', '2020-03-25 05:38:01', '2bbd0755-adcb-4380-b642-1f0e67ed4a0d'),
(102, 107, 4, 'Elizabethtown, LA', 'Elizabethtown, LA', 'Elizabethtown', 'LA', '42701', NULL, '37.70891820', '-85.83347450', '2020-03-25 05:38:01', '2020-03-25 05:39:08', 'b2b3f62a-0733-40c0-81f0-020c1e418317'),
(103, 108, 4, 'Elizabethtown, KY', 'Elizabethtown, KY', 'Elizabethtown', 'KY', '42701', NULL, '37.70306460', '-85.86494080', '2020-03-25 05:38:01', '2020-03-25 05:38:01', '8869e500-4747-4f0b-991b-18fcc1a536c0'),
(104, 109, 4, 'Sulphur, LA', 'Sulphur, LA', 'Sulphur', 'LA', '70663', NULL, '30.23659430', '-93.37737830', '2020-03-25 05:38:02', '2020-03-25 05:39:08', '877a9f83-7c2f-4421-a935-a906f99ab1ac'),
(105, 110, 4, 'Sulphur, LA', 'Sulphur, LA', 'Sulphur', 'LA', '70663', NULL, '30.23659430', '-93.37737830', '2020-03-25 05:38:02', '2020-03-25 05:38:02', 'bf156cc2-0e92-4461-9ea0-9a813dc5be87'),
(106, 111, 4, 'Abbeville, LA', 'Abbeville, LA', 'Abbeville', 'LA', '70510', NULL, '29.97465020', '-92.13429210', '2020-03-25 05:38:02', '2020-03-25 05:39:08', '503d804d-3a10-4fd8-927e-7bc286563027'),
(107, 112, 4, 'Abbeville, LA', 'Abbeville, LA', 'Abbeville', 'LA', '70510', NULL, '29.97465020', '-92.13429210', '2020-03-25 05:38:02', '2020-03-25 05:38:02', 'efd6ef4a-8369-4e3f-b0e5-d70284ce48b0'),
(108, 113, 4, 'Baltimore, MD', 'Baltimore, MD', 'Baltimore', 'MD', '21202', NULL, '39.29038480', '-76.61218930', '2020-03-25 05:38:02', '2020-03-25 05:39:08', '6808d651-5b78-4231-b8d8-ba9a0ce1dbc5'),
(109, 114, 4, 'Baltimore, MD', 'Baltimore, MD', 'Baltimore', 'MD', '21202', NULL, '39.29038480', '-76.61218930', '2020-03-25 05:38:02', '2020-03-25 05:38:02', 'd6cdc0a9-fae3-49b4-8d8a-380433dd62b8'),
(110, 115, 4, 'Hagerstown, LA', 'Hagerstown, LA', 'Hagerstown', 'LA', '21740', NULL, '39.62980440', '-77.76438530', '2020-03-25 05:38:02', '2020-03-25 05:39:08', '3cbc71d4-6cc8-46b5-8419-5840c7fb330b'),
(111, 116, 4, 'Hagerstown, LA', 'Hagerstown, LA', 'Hagerstown', 'LA', '21740', NULL, '39.62980440', '-77.76438530', '2020-03-25 05:38:02', '2020-03-25 05:38:02', '7cce1884-7e16-44cd-9c5b-e5e96b4bfbcc'),
(112, 117, 4, 'Frederick, LA', 'Frederick, LA', 'Frederick', 'LA', '21701', NULL, '39.41291160', '-77.41125780', '2020-03-25 05:38:02', '2020-03-25 05:39:09', 'db4a7aa1-0500-4bf3-b420-3798993b797a'),
(113, 118, 4, 'Frederick, LA', 'Frederick, LA', 'Frederick', 'LA', '21701', NULL, '39.41291160', '-77.41125780', '2020-03-25 05:38:02', '2020-03-25 05:38:02', 'da7eef14-524b-41d6-830e-2d226c694fa0'),
(114, 119, 4, 'Saint Peters, MO', 'Saint Peters, MO', 'Saint Peters', 'MO', '63376', NULL, '38.78746990', '-90.62989220', '2020-03-25 05:38:02', '2020-03-25 05:39:09', '681e579c-7114-4d4a-98bc-22507199a133'),
(115, 120, 4, 'Saint Peters, MO', 'Saint Peters, MO', 'Saint Peters', 'MO', '63376', NULL, '38.78746990', '-90.62989220', '2020-03-25 05:38:02', '2020-03-25 05:38:02', '78b494ea-4e92-4fbd-a8e6-4ab9ce27c192'),
(116, 121, 4, 'cornelius, NC', 'cornelius, NC', 'cornelius', 'NC', '28031', NULL, '35.48680320', '-80.86007360', '2020-03-25 05:39:04', '2020-03-25 05:39:04', '56777bb8-7fbc-4bc0-bf09-46ff9c19bb5b'),
(117, 122, 4, 'brentwood, TN', 'brentwood, TN', 'brentwood', 'TN', '37027', NULL, '36.03311640', '-86.78277720', '2020-03-25 05:39:04', '2020-03-25 05:39:04', '50f5006c-22fc-45a1-b67c-f59b1b2aac1b'),
(118, 123, 4, 'bryant, AR', 'bryant, AR', 'bryant', 'AR', '72022', NULL, '34.59592650', '-92.48904690', '2020-03-25 05:39:05', '2020-03-25 05:39:05', 'a15372ba-74aa-4e39-9d74-2af43bfa4c33'),
(119, 124, 4, 'Easton, CT', 'Easton, CT', 'Easton', 'CT', '06612', NULL, '41.27120560', '-73.29664050', '2020-03-25 05:39:05', '2020-03-25 05:39:05', 'fab95da0-53cd-42d7-b0ec-ec6257447f0b'),
(120, 125, 4, 'Keene, NH', 'Keene, NH', 'Keene', 'NH', '03431', NULL, '42.93369200', '-72.27814090', '2020-03-25 05:39:05', '2020-03-25 05:39:05', 'c6bc87df-b520-4f61-b9f3-92a12f8b6f24'),
(121, 126, 4, 'Athens, AL', 'Athens, AL', 'Athens', 'AL', '35611', NULL, '34.80286610', '-86.97167410', '2020-03-25 05:39:05', '2020-03-25 05:39:05', '1fa984a1-8837-4527-becc-7aa984590410'),
(122, 127, 4, 'Birmingham, AL', 'Birmingham, AL', 'Birmingham', 'AL', '35203', NULL, '33.51858920', '-86.81035670', '2020-03-25 05:39:05', '2020-03-25 05:39:05', '1f822448-df5b-4687-a876-d6c5fa41f99f'),
(123, 128, 4, 'Huntsville, AL', 'Huntsville, AL', 'Huntsville', 'AL', '35801', NULL, '34.73036880', '-86.58610370', '2020-03-25 05:39:05', '2020-03-25 05:39:05', '6facb451-5987-4268-b103-501f599d36ab'),
(124, 129, 4, 'Atlanta, GA', 'Atlanta, GA', 'Atlanta', 'GA', '30334', NULL, '33.74899540', '-84.38798240', '2020-03-25 05:39:05', '2020-03-25 05:39:05', '1386d68c-ba1b-4ec2-a6ea-0091f17d96d3'),
(125, 130, 4, 'Cedar Rapids, IA', 'Cedar Rapids, IA', 'Cedar Rapids', 'IA', '52401', NULL, '41.97787950', '-91.66562320', '2020-03-25 05:39:06', '2020-03-25 05:39:06', 'ee8423d5-f6cc-46a1-a5ab-e3cf29801780'),
(126, 131, 4, 'Chicago, IL', 'Chicago, IL', 'Chicago', 'IL', '60604', NULL, '41.87811360', '-87.62979820', '2020-03-25 05:39:06', '2020-03-25 05:39:06', 'f82e5a47-0e1a-4196-84ce-f08a3a8d7ac2'),
(127, 132, 4, 'Rockford, IL', 'Rockford, IL', 'Rockford', 'IL', '61101', NULL, '42.27113110', '-89.09399520', '2020-03-25 05:39:06', '2020-03-25 05:39:06', '0c74e4fa-8318-4ef9-8ae2-554ca9e24eeb'),
(128, 133, 4, 'Round Lake Beach, IL', 'Round Lake Beach, IL', 'Round Lake Beach', 'IL', '60073', NULL, '42.37168810', '-88.09008150', '2020-03-25 05:39:06', '2020-03-25 05:39:06', 'a521bddd-e24d-4268-8553-e220481cd6f0'),
(129, 134, 4, 'Peoria, IL', 'Peoria, IL', 'Peoria', 'IL', '61603', NULL, '40.69364880', '-89.58898640', '2020-03-25 05:39:06', '2020-03-25 05:39:06', 'd19a185a-4cd1-4432-b8e6-d34f02dc6f8f'),
(130, 135, 4, 'Aurora, IL', 'Aurora, IL', 'Aurora', 'IL', '60506', NULL, '41.76058490', '-88.32007150', '2020-03-25 05:39:06', '2020-03-25 05:39:06', 'b6069ca8-f335-493b-a0d3-7212d09eb0b0'),
(131, 136, 4, 'Noblesville, IN', 'Noblesville, IN', 'Noblesville', 'IN', '46060', NULL, '40.04559170', '-86.00859550', '2020-03-25 05:39:07', '2020-03-25 05:39:07', '1f023785-c331-4675-912c-6dcc7fbfd303'),
(132, 137, 4, 'Columbus, IN', 'Columbus, IN', 'Columbus', 'IN', '47201', NULL, '39.20144040', '-85.92137960', '2020-03-25 05:39:07', '2020-03-25 05:39:07', '5945e2a8-d263-4c52-9027-069489bfa8f6'),
(133, 138, 4, 'Greenwood, IN', 'Greenwood, IN', 'Greenwood', 'IN', '46142', NULL, '39.61365780', '-86.10665260', '2020-03-25 05:39:07', '2020-03-25 05:39:07', 'a5822de5-480e-4a40-a62e-f2c452521406'),
(134, 139, 4, 'Mishawaka, IN', 'Mishawaka, IN', 'Mishawaka', 'IN', '46544', NULL, '41.66199270', '-86.15861560', '2020-03-25 05:39:07', '2020-03-25 05:39:07', '0e878322-1fff-4368-baf1-1cf5e2b29626'),
(135, 140, 4, 'Kansas City, KS', 'Kansas City, KS', 'Kansas City', 'KS', '66101', NULL, '39.11553140', '-94.62678730', '2020-03-25 05:39:07', '2020-03-25 05:39:07', '6a8d4fac-1953-41a7-872c-e39f15d87715'),
(136, 141, 4, 'Bowling Green, KY', 'Bowling Green, KY', 'Bowling Green', 'KY', 'Green', NULL, '36.96852190', '-86.48080430', '2020-03-25 05:39:07', '2020-03-25 05:39:07', '25e08c29-4a7e-405e-825d-5b01039a484e'),
(137, 142, 4, 'Elizabethtown, KY', 'Elizabethtown, KY', 'Elizabethtown', 'KY', '42701', NULL, '37.70306460', '-85.86494080', '2020-03-25 05:39:08', '2020-03-25 05:39:08', '11cfe161-970a-47e5-8787-133cd37c8443'),
(138, 143, 4, 'Sulphur, LA', 'Sulphur, LA', 'Sulphur', 'LA', '70663', NULL, '30.23659430', '-93.37737830', '2020-03-25 05:39:08', '2020-03-25 05:39:08', 'eb9478ea-cd93-487c-853a-3e115aa8a4de'),
(139, 144, 4, 'Abbeville, LA', 'Abbeville, LA', 'Abbeville', 'LA', '70510', NULL, '29.97465020', '-92.13429210', '2020-03-25 05:39:08', '2020-03-25 05:39:08', '06f7efb0-d592-4784-95c9-dc127cb58af1'),
(140, 145, 4, 'Baltimore, MD', 'Baltimore, MD', 'Baltimore', 'MD', '21202', NULL, '39.29038480', '-76.61218930', '2020-03-25 05:39:08', '2020-03-25 05:39:08', 'e9ac2df3-af4b-459d-b7ff-5e6bf6e877ee'),
(141, 146, 4, 'Hagerstown, LA', 'Hagerstown, LA', 'Hagerstown', 'LA', '21740', NULL, '39.62980440', '-77.76438530', '2020-03-25 05:39:09', '2020-03-25 05:39:09', 'a4c9febe-4a0f-4b09-b5e5-8889c6078528'),
(142, 147, 4, 'Frederick, LA', 'Frederick, LA', 'Frederick', 'LA', '21701', NULL, '39.41291160', '-77.41125780', '2020-03-25 05:39:09', '2020-03-25 05:39:09', '64d938a9-76cd-4681-8a64-e7945ab1548a'),
(143, 148, 4, 'Saint Peters, MO', 'Saint Peters, MO', 'Saint Peters', 'MO', '63376', NULL, '38.78746990', '-90.62989220', '2020-03-25 05:39:09', '2020-03-25 05:39:09', 'a09d1e9a-2f97-4e98-9bfe-280b16b09ab8'),
(144, 149, 4, 'Huntsville, AL', 'Huntsville, AL', 'Huntsville', 'AL', '35801', NULL, '34.73036880', '-86.58610370', '2020-03-25 15:21:15', '2020-03-25 15:21:15', 'fce1469d-9046-4426-b41b-1ff10ce696ee');

-- --------------------------------------------------------

--
-- Table structure for table `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecacheelements`
--

CREATE TABLE `templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecachequeries`
--

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecaches`
--

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'admin', NULL, NULL, NULL, 'jvargas@conversionia.com', '$2y$13$n3VLEuP6aVC2ldAc8spXEOrWp/zHhPbbu142o7KTq/wrxVwPBHkZ6', 1, 0, 0, 0, '2020-04-07 15:50:10', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2020-03-23 05:11:45', '2020-03-23 05:11:45', '2020-04-07 15:50:10', '5701f3e6-2ac1-434d-b5e2-154650d797c5');

-- --------------------------------------------------------

--
-- Table structure for table `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `volumes`
--

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `url` varchar(255) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}', 1, '2020-03-23 05:11:47', '2020-03-23 05:11:47', 'bc6d0a56-1759-4cc7-809b-afed64448309'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2020-03-23 05:11:47', '2020-03-23 05:11:47', 'a0ed1f71-aca5-4722-9750-9877e96b5b40'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2020-03-23 05:11:47', '2020-03-23 05:11:47', 'd6b2a390-199b-4df6-a624-1ca396862ad2'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2020-03-23 05:11:47', '2020-03-23 05:11:47', '81900658-6405-43ad-884e-1a14cbeb1745');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  ADD KEY `assetindexdata_volumeId_idx` (`volumeId`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_filename_folderId_idx` (`filename`,`folderId`),
  ADD KEY `assets_folderId_idx` (`folderId`),
  ADD KEY `assets_volumeId_idx` (`volumeId`),
  ADD KEY `assets_uploaderId_fk` (`uploaderId`);

--
-- Indexes for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `assettransforms`
--
ALTER TABLE `assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assettransforms_name_unq_idx` (`name`),
  ADD UNIQUE KEY `assettransforms_handle_unq_idx` (`handle`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_groupId_idx` (`groupId`),
  ADD KEY `categories_parentId_fk` (`parentId`);

--
-- Indexes for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorygroups_name_idx` (`name`),
  ADD KEY `categorygroups_handle_idx` (`handle`),
  ADD KEY `categorygroups_structureId_idx` (`structureId`),
  ADD KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `categorygroups_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  ADD KEY `categorygroups_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `changedattributes_siteId_fk` (`siteId`),
  ADD KEY `changedattributes_userId_fk` (`userId`);

--
-- Indexes for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `changedfields_siteId_fk` (`siteId`),
  ADD KEY `changedfields_fieldId_fk` (`fieldId`),
  ADD KEY `changedfields_userId_fk` (`userId`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `content_siteId_idx` (`siteId`),
  ADD KEY `content_title_idx` (`title`);

--
-- Indexes for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craftidtokens_userId_fk` (`userId`);

--
-- Indexes for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indexes for table `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drafts_creatorId_fk` (`creatorId`),
  ADD KEY `drafts_sourceId_fk` (`sourceId`);

--
-- Indexes for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elements_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `elements_type_idx` (`type`),
  ADD KEY `elements_enabled_idx` (`enabled`),
  ADD KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  ADD KEY `elements_archived_dateDeleted_draftId_revisionId_idx` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  ADD KEY `elements_draftId_fk` (`draftId`),
  ADD KEY `elements_revisionId_fk` (`revisionId`);

--
-- Indexes for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `elements_sites_siteId_idx` (`siteId`),
  ADD KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  ADD KEY `elements_sites_enabled_idx` (`enabled`),
  ADD KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entries_postDate_idx` (`postDate`),
  ADD KEY `entries_expiryDate_idx` (`expiryDate`),
  ADD KEY `entries_authorId_idx` (`authorId`),
  ADD KEY `entries_sectionId_idx` (`sectionId`),
  ADD KEY `entries_typeId_idx` (`typeId`),
  ADD KEY `entries_parentId_fk` (`parentId`);

--
-- Indexes for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  ADD KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  ADD KEY `entrytypes_sectionId_idx` (`sectionId`),
  ADD KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `entrytypes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `feedme_feeds`
--
ALTER TABLE `feedme_feeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldgroups_name_unq_idx` (`name`);

--
-- Indexes for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  ADD KEY `fieldlayoutfields_fieldId_idx` (`fieldId`);

--
-- Indexes for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `fieldlayouts_type_idx` (`type`);

--
-- Indexes for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayouttabs_layoutId_idx` (`layoutId`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fields_handle_context_unq_idx` (`handle`,`context`),
  ADD KEY `fields_groupId_idx` (`groupId`),
  ADD KEY `fields_context_idx` (`context`);

--
-- Indexes for table `freeform_crm_fields`
--
ALTER TABLE `freeform_crm_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `freeform_crm_fields_type_idx` (`type`),
  ADD KEY `freeform_crm_fields_integrationId_fk` (`integrationId`);

--
-- Indexes for table `freeform_export_profiles`
--
ALTER TABLE `freeform_export_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `freeform_export_profiles_formId_fk` (`formId`);

--
-- Indexes for table `freeform_export_settings`
--
ALTER TABLE `freeform_export_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `freeform_export_settings_userId_fk` (`userId`);

--
-- Indexes for table `freeform_fields`
--
ALTER TABLE `freeform_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `handle` (`handle`),
  ADD KEY `freeform_fields_type_idx` (`type`);

--
-- Indexes for table `freeform_forms`
--
ALTER TABLE `freeform_forms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `handle` (`handle`);

--
-- Indexes for table `freeform_integrations`
--
ALTER TABLE `freeform_integrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `handle` (`handle`),
  ADD KEY `freeform_integrations_type_idx` (`type`);

--
-- Indexes for table `freeform_integrations_queue`
--
ALTER TABLE `freeform_integrations_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `freeform_integrations_queue_status_idx` (`status`),
  ADD KEY `freeform_integrations_queue_submissionId_fk` (`submissionId`);

--
-- Indexes for table `freeform_mailing_lists`
--
ALTER TABLE `freeform_mailing_lists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `freeform_mailing_lists_integrationId_resourceId_unq_idx` (`integrationId`,`resourceId`);

--
-- Indexes for table `freeform_mailing_list_fields`
--
ALTER TABLE `freeform_mailing_list_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `freeform_mailing_list_fields_type_idx` (`type`),
  ADD KEY `freeform_mailing_list_fields_mailingListId_fk` (`mailingListId`);

--
-- Indexes for table `freeform_notifications`
--
ALTER TABLE `freeform_notifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `handle` (`handle`);

--
-- Indexes for table `freeform_payments_payments`
--
ALTER TABLE `freeform_payments_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `freeform_payments_payments_integrationId_resourceId_unq_idx` (`integrationId`,`resourceId`),
  ADD KEY `freeform_payments_payments_submissionId_fk` (`submissionId`),
  ADD KEY `freeform_payments_payments_subscriptionId_fk` (`subscriptionId`);

--
-- Indexes for table `freeform_payments_subscriptions`
--
ALTER TABLE `freeform_payments_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `freeform_payments_subscriptions_integrationId_resourceId_unq_idx` (`integrationId`,`resourceId`),
  ADD KEY `freeform_payments_subscriptions_submissionId_fk` (`submissionId`),
  ADD KEY `freeform_payments_subscriptions_planId_fk` (`planId`);

--
-- Indexes for table `freeform_payments_subscription_plans`
--
ALTER TABLE `freeform_payments_subscription_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `freeform_payments_subscription_plans_integrationId_fk` (`integrationId`);

--
-- Indexes for table `freeform_payment_gateway_fields`
--
ALTER TABLE `freeform_payment_gateway_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `freeform_payment_gateway_fields_type_idx` (`type`),
  ADD KEY `freeform_payment_gateway_fields_integrationId_fk` (`integrationId`);

--
-- Indexes for table `freeform_spam_reason`
--
ALTER TABLE `freeform_spam_reason`
  ADD PRIMARY KEY (`id`),
  ADD KEY `freeform_spam_reason_submissionId_reasonType_idx` (`submissionId`,`reasonType`);

--
-- Indexes for table `freeform_statuses`
--
ALTER TABLE `freeform_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `handle` (`handle`);

--
-- Indexes for table `freeform_submissions`
--
ALTER TABLE `freeform_submissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `freeform_submissions_incrementalId_unq_idx` (`incrementalId`),
  ADD UNIQUE KEY `freeform_submissions_token_unq_idx` (`token`),
  ADD KEY `freeform_submissions_formId_fk` (`formId`),
  ADD KEY `freeform_submissions_statusId_fk` (`statusId`);

--
-- Indexes for table `freeform_submission_notes`
--
ALTER TABLE `freeform_submission_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `freeform_submission_notes_submissionId_fk` (`submissionId`);

--
-- Indexes for table `freeform_unfinalized_files`
--
ALTER TABLE `freeform_unfinalized_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `freeform_webhooks`
--
ALTER TABLE `freeform_webhooks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `freeform_webhooks_type_idx` (`type`);

--
-- Indexes for table `freeform_webhooks_form_relations`
--
ALTER TABLE `freeform_webhooks_form_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `freeform_webhooks_form_relations_webhookId_idx` (`webhookId`),
  ADD KEY `freeform_webhooks_form_relations_formId_idx` (`formId`);

--
-- Indexes for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `globalsets_name_idx` (`name`),
  ADD KEY `globalsets_handle_idx` (`handle`),
  ADD KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gqltokens_accessToken_unq_idx` (`accessToken`),
  ADD UNIQUE KEY `gqltokens_name_unq_idx` (`name`),
  ADD KEY `gqltokens_schemaId_fk` (`schemaId`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `matrixblocks_sortOrder_idx` (`sortOrder`);

--
-- Indexes for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  ADD UNIQUE KEY `matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  ADD KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `migrations_pluginId_idx` (`pluginId`),
  ADD KEY `migrations_type_pluginId_idx` (`type`,`pluginId`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plugins_handle_unq_idx` (`handle`);

--
-- Indexes for table `projectconfig`
--
ALTER TABLE `projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `relations_sourceId_idx` (`sourceId`),
  ADD KEY `relations_targetId_idx` (`targetId`),
  ADD KEY `relations_sourceSiteId_idx` (`sourceSiteId`);

--
-- Indexes for table `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  ADD KEY `revisions_creatorId_fk` (`creatorId`);

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `searchindex_keywords_idx` (`keywords`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_handle_idx` (`handle`),
  ADD KEY `sections_name_idx` (`name`),
  ADD KEY `sections_structureId_idx` (`structureId`),
  ADD KEY `sections_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  ADD KEY `sections_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_uid_idx` (`uid`),
  ADD KEY `sessions_token_idx` (`token`),
  ADD KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `sessions_userId_idx` (`userId`);

--
-- Indexes for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indexes for table `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sitegroups_name_idx` (`name`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sites_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `sites_handle_idx` (`handle`),
  ADD KEY `sites_sortOrder_idx` (`sortOrder`),
  ADD KEY `sites_groupId_fk` (`groupId`);

--
-- Indexes for table `smartmap_addresses`
--
ALTER TABLE `smartmap_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `smartmap_addresses_elementId_idx` (`elementId`),
  ADD KEY `smartmap_addresses_fieldId_idx` (`fieldId`);

--
-- Indexes for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  ADD KEY `structureelements_root_idx` (`root`),
  ADD KEY `structureelements_lft_idx` (`lft`),
  ADD KEY `structureelements_rgt_idx` (`rgt`),
  ADD KEY `structureelements_level_idx` (`level`),
  ADD KEY `structureelements_elementId_idx` (`elementId`);

--
-- Indexes for table `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `structures_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  ADD KEY `systemmessages_language_idx` (`language`);

--
-- Indexes for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taggroups_name_idx` (`name`),
  ADD KEY `taggroups_handle_idx` (`handle`),
  ADD KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_groupId_idx` (`groupId`);

--
-- Indexes for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  ADD KEY `templatecacheelements_elementId_idx` (`elementId`);

--
-- Indexes for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  ADD KEY `templatecachequeries_type_idx` (`type`);

--
-- Indexes for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `templatecaches_siteId_idx` (`siteId`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unq_idx` (`token`),
  ADD KEY `tokens_expiryDate_idx` (`expiryDate`);

--
-- Indexes for table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_handle_unq_idx` (`handle`),
  ADD UNIQUE KEY `usergroups_name_unq_idx` (`name`);

--
-- Indexes for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `usergroups_users_userId_idx` (`userId`);

--
-- Indexes for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_name_unq_idx` (`name`);

--
-- Indexes for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `userpermissions_usergroups_groupId_idx` (`groupId`);

--
-- Indexes for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `userpermissions_users_userId_idx` (`userId`);

--
-- Indexes for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_uid_idx` (`uid`),
  ADD KEY `users_verificationCode_idx` (`verificationCode`),
  ADD KEY `users_email_idx` (`email`),
  ADD KEY `users_username_idx` (`username`),
  ADD KEY `users_photoId_fk` (`photoId`);

--
-- Indexes for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  ADD KEY `volumefolders_parentId_idx` (`parentId`),
  ADD KEY `volumefolders_volumeId_idx` (`volumeId`);

--
-- Indexes for table `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `volumes_name_idx` (`name`),
  ADD KEY `volumes_handle_idx` (`handle`),
  ADD KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `volumes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widgets_userId_idx` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransforms`
--
ALTER TABLE `assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `feedme_feeds`
--
ALTER TABLE `feedme_feeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `freeform_crm_fields`
--
ALTER TABLE `freeform_crm_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `freeform_export_profiles`
--
ALTER TABLE `freeform_export_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `freeform_export_settings`
--
ALTER TABLE `freeform_export_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `freeform_fields`
--
ALTER TABLE `freeform_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `freeform_forms`
--
ALTER TABLE `freeform_forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `freeform_integrations`
--
ALTER TABLE `freeform_integrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `freeform_integrations_queue`
--
ALTER TABLE `freeform_integrations_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `freeform_mailing_lists`
--
ALTER TABLE `freeform_mailing_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `freeform_mailing_list_fields`
--
ALTER TABLE `freeform_mailing_list_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `freeform_notifications`
--
ALTER TABLE `freeform_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `freeform_payments_payments`
--
ALTER TABLE `freeform_payments_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `freeform_payments_subscriptions`
--
ALTER TABLE `freeform_payments_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `freeform_payments_subscription_plans`
--
ALTER TABLE `freeform_payments_subscription_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `freeform_payment_gateway_fields`
--
ALTER TABLE `freeform_payment_gateway_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `freeform_spam_reason`
--
ALTER TABLE `freeform_spam_reason`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `freeform_statuses`
--
ALTER TABLE `freeform_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `freeform_submissions`
--
ALTER TABLE `freeform_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `freeform_submission_notes`
--
ALTER TABLE `freeform_submission_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `freeform_unfinalized_files`
--
ALTER TABLE `freeform_unfinalized_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `freeform_webhooks`
--
ALTER TABLE `freeform_webhooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `freeform_webhooks_form_relations`
--
ALTER TABLE `freeform_webhooks_form_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqltokens`
--
ALTER TABLE `gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `smartmap_addresses`
--
ALTER TABLE `smartmap_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecaches`
--
ALTER TABLE `templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `freeform_crm_fields`
--
ALTER TABLE `freeform_crm_fields`
  ADD CONSTRAINT `freeform_crm_fields_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `freeform_integrations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `freeform_export_profiles`
--
ALTER TABLE `freeform_export_profiles`
  ADD CONSTRAINT `freeform_export_profiles_formId_fk` FOREIGN KEY (`formId`) REFERENCES `freeform_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `freeform_export_settings`
--
ALTER TABLE `freeform_export_settings`
  ADD CONSTRAINT `freeform_export_settings_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `freeform_integrations_queue`
--
ALTER TABLE `freeform_integrations_queue`
  ADD CONSTRAINT `freeform_integrations_queue_id_fk` FOREIGN KEY (`id`) REFERENCES `freeform_mailing_list_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `freeform_integrations_queue_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `freeform_submissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `freeform_mailing_lists`
--
ALTER TABLE `freeform_mailing_lists`
  ADD CONSTRAINT `freeform_mailing_lists_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `freeform_integrations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `freeform_mailing_list_fields`
--
ALTER TABLE `freeform_mailing_list_fields`
  ADD CONSTRAINT `freeform_mailing_list_fields_mailingListId_fk` FOREIGN KEY (`mailingListId`) REFERENCES `freeform_mailing_lists` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `freeform_payments_payments`
--
ALTER TABLE `freeform_payments_payments`
  ADD CONSTRAINT `freeform_payments_payments_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `freeform_integrations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `freeform_payments_payments_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `freeform_submissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `freeform_payments_payments_subscriptionId_fk` FOREIGN KEY (`subscriptionId`) REFERENCES `freeform_payments_subscriptions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `freeform_payments_subscriptions`
--
ALTER TABLE `freeform_payments_subscriptions`
  ADD CONSTRAINT `freeform_payments_subscriptions_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `freeform_integrations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `freeform_payments_subscriptions_planId_fk` FOREIGN KEY (`planId`) REFERENCES `freeform_payments_subscription_plans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `freeform_payments_subscriptions_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `freeform_submissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `freeform_payments_subscription_plans`
--
ALTER TABLE `freeform_payments_subscription_plans`
  ADD CONSTRAINT `freeform_payments_subscription_plans_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `freeform_integrations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `freeform_payment_gateway_fields`
--
ALTER TABLE `freeform_payment_gateway_fields`
  ADD CONSTRAINT `freeform_payment_gateway_fields_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `freeform_integrations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `freeform_spam_reason`
--
ALTER TABLE `freeform_spam_reason`
  ADD CONSTRAINT `freeform_spam_reason_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `freeform_submissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `freeform_submissions`
--
ALTER TABLE `freeform_submissions`
  ADD CONSTRAINT `freeform_submissions_formId_fk` FOREIGN KEY (`formId`) REFERENCES `freeform_forms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `freeform_submissions_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `freeform_submissions_statusId_fk` FOREIGN KEY (`statusId`) REFERENCES `freeform_statuses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `freeform_submission_notes`
--
ALTER TABLE `freeform_submission_notes`
  ADD CONSTRAINT `freeform_submission_notes_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `freeform_submissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `freeform_webhooks_form_relations`
--
ALTER TABLE `freeform_webhooks_form_relations`
  ADD CONSTRAINT `freeform_webhooks_form_relations_formId_fk` FOREIGN KEY (`formId`) REFERENCES `freeform_forms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `freeform_webhooks_form_relations_webhookId_fk` FOREIGN KEY (`webhookId`) REFERENCES `freeform_webhooks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `migrations`
--
ALTER TABLE `migrations`
  ADD CONSTRAINT `migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `smartmap_addresses`
--
ALTER TABLE `smartmap_addresses`
  ADD CONSTRAINT `smartmap_addresses_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `smartmap_addresses_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
