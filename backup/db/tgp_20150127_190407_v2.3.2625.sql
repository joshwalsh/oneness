-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: craft
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.12.04.1

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
-- Table structure for table `craft_assetfiles`
--

DROP TABLE IF EXISTS `craft_assetfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetfiles` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` smallint(6) unsigned DEFAULT NULL,
  `height` smallint(6) unsigned DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfiles_filename_folderId_unq_idx` (`filename`,`folderId`),
  KEY `craft_assetfiles_sourceId_fk` (`sourceId`),
  KEY `craft_assetfiles_folderId_fk` (`folderId`),
  CONSTRAINT `craft_assetfiles_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetfiles`
--

LOCK TABLES `craft_assetfiles` WRITE;
/*!40000 ALTER TABLE `craft_assetfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assetfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assetfolders`
--

DROP TABLE IF EXISTS `craft_assetfolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetfolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfolders_name_parentId_sourceId_unq_idx` (`name`,`parentId`,`sourceId`),
  KEY `craft_assetfolders_parentId_fk` (`parentId`),
  KEY `craft_assetfolders_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetfolders_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetfolders`
--

LOCK TABLES `craft_assetfolders` WRITE;
/*!40000 ALTER TABLE `craft_assetfolders` DISABLE KEYS */;
INSERT INTO `craft_assetfolders` VALUES (2,NULL,2,'Images','','2015-01-27 16:22:57','2015-01-27 16:22:57','b047bf55-22db-40a7-a99a-ebcb1c94a807');
/*!40000 ALTER TABLE `craft_assetfolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assetindexdata`
--

DROP TABLE IF EXISTS `craft_assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceId` int(10) NOT NULL,
  `offset` int(10) NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  `recordId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetindexdata_sessionId_sourceId_offset_unq_idx` (`sessionId`,`sourceId`,`offset`),
  KEY `craft_assetindexdata_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetindexdata_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetindexdata`
--

LOCK TABLES `craft_assetindexdata` WRITE;
/*!40000 ALTER TABLE `craft_assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assetsources`
--

DROP TABLE IF EXISTS `craft_assetsources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetsources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetsources_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assetsources_handle_unq_idx` (`handle`),
  KEY `craft_assetsources_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_assetsources_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetsources`
--

LOCK TABLES `craft_assetsources` WRITE;
/*!40000 ALTER TABLE `craft_assetsources` DISABLE KEYS */;
INSERT INTO `craft_assetsources` VALUES (2,'Images','images','Local','{\"path\":\"tgp.d-i.co\\/assets\\/images\\/\",\"url\":\"http:\\/\\/tgp.d-i.co\\/assets\\/images\\/\"}',1,52,'2015-01-27 16:22:57','2015-01-27 17:47:54','fbd0b787-8e27-46f1-bf40-17f7b879768f');
/*!40000 ALTER TABLE `craft_assetsources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assettransformindex`
--

DROP TABLE IF EXISTS `craft_assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT NULL,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assettransformindex_sourceId_fileId_location_idx` (`sourceId`,`fileId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assettransformindex`
--

LOCK TABLES `craft_assettransformindex` WRITE;
/*!40000 ALTER TABLE `craft_assettransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assettransforms`
--

DROP TABLE IF EXISTS `craft_assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `height` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(10) DEFAULT NULL,
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assettransforms`
--

LOCK TABLES `craft_assettransforms` WRITE;
/*!40000 ALTER TABLE `craft_assettransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assettransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categories`
--

DROP TABLE IF EXISTS `craft_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_categories_groupId_fk` (`groupId`),
  CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categories`
--

LOCK TABLES `craft_categories` WRITE;
/*!40000 ALTER TABLE `craft_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categorygroups`
--

DROP TABLE IF EXISTS `craft_categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_categorygroups_handle_unq_idx` (`handle`),
  KEY `craft_categorygroups_structureId_fk` (`structureId`),
  KEY `craft_categorygroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categorygroups`
--

LOCK TABLES `craft_categorygroups` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups` DISABLE KEYS */;
INSERT INTO `craft_categorygroups` VALUES (1,3,17,'I Have Cancer','iHaveCancer',1,'','2015-01-27 15:55:01','2015-01-27 15:55:01','8688e73f-e94a-4986-80e8-24d50b969557'),(2,4,18,'Loved One Has Cancer','lovedOneHasCancer',1,'','2015-01-27 15:55:38','2015-01-27 15:55:38','9a53b930-2938-45e2-9d99-4619e7f2f76a'),(3,5,19,'Donors Volunteers','donorsVolunteers',1,'','2015-01-27 15:56:22','2015-01-27 15:56:22','e0a986ca-def1-4e12-8116-5461bf0f4236');
/*!40000 ALTER TABLE `craft_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categorygroups_i18n`
--

DROP TABLE IF EXISTS `craft_categorygroups_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categorygroups_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `urlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nestedUrlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_i18n_groupId_locale_unq_idx` (`groupId`,`locale`),
  KEY `craft_categorygroups_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_categorygroups_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_categorygroups_i18n_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categorygroups_i18n`
--

LOCK TABLES `craft_categorygroups_i18n` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups_i18n` DISABLE KEYS */;
INSERT INTO `craft_categorygroups_i18n` VALUES (1,1,'en_us','i-have-cancer/{slug}','{parent.uri}/{slug}','2015-01-27 15:55:01','2015-01-27 15:55:01','10cbf350-1fa7-4917-a062-a12b9df8f0ed'),(2,2,'en_us','loved-one-has-cancer/{slug}','{parent.uri}/{slug}','2015-01-27 15:55:38','2015-01-27 15:55:38','b0a4ea46-ae8d-404a-a12c-59c3d5b42e62'),(3,3,'en_us','donors-volunteers/{slug}','{parent.uri}/{slug}','2015-01-27 15:56:22','2015-01-27 15:56:22','7bbc22ba-5508-4073-8a8f-b9ee5ec3ae65');
/*!40000 ALTER TABLE `craft_categorygroups_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_content`
--

DROP TABLE IF EXISTS `craft_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_body` text COLLATE utf8_unicode_ci,
  `field_storyResourceLink` text COLLATE utf8_unicode_ci,
  `field_storyTitle` text COLLATE utf8_unicode_ci,
  `field_storySubtitle` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_content_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_content_title_idx` (`title`),
  KEY `craft_content_locale_fk` (`locale`),
  CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_content_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_content`
--

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;
INSERT INTO `craft_content` VALUES (1,1,'en_us',NULL,NULL,NULL,NULL,NULL,'2015-01-25 16:17:43','2015-01-25 16:17:43','4bc74fd9-ec4e-4473-ba46-df1f25a225ee'),(2,2,'en_us','The Gathering Place','<p>\r\n	It\'s true, this site doesn\'t have a whole lot of content yet, but don\'t worry. Our web developers have just installed the CMS, and they\'re setting things up for the content editors this very moment. Soon Tgp.d-i.co will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.\r\n</p><p><br></p><p>Are you like Kate</p>',NULL,NULL,NULL,'2015-01-25 16:17:44','2015-01-26 22:40:30','9c372cae-90ed-44dc-8d06-9b84bb1fa0eb'),(4,4,'en_us',NULL,NULL,NULL,NULL,NULL,'2015-01-26 15:32:46','2015-01-26 15:32:46','f911e036-f2ef-46f1-8569-a8520ca5bd1e'),(5,5,'en_us',NULL,NULL,NULL,NULL,NULL,'2015-01-26 15:33:30','2015-01-26 15:33:30','cc32d75a-e746-4606-a4fb-dca96382014e'),(9,7,'en_us','test resource',NULL,NULL,NULL,NULL,'2015-01-27 16:30:07','2015-01-27 17:42:25','51e97f20-4a08-4c26-86f8-aa38c3644789'),(10,11,'en_us','The Gathering Place Stories',NULL,'',NULL,NULL,'2015-01-27 16:37:10','2015-01-27 17:56:50','3dbc9269-3d9c-444b-8eb0-a27737cb8e6c'),(12,13,'en_us','Sample Story #1',NULL,'',NULL,NULL,'2015-01-27 17:06:23','2015-01-27 17:56:11','99cc26f5-ff5d-4248-832f-eeb96c438ba3');
/*!40000 ALTER TABLE `craft_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_deprecationerrors`
--

DROP TABLE IF EXISTS `craft_deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `templateLine` smallint(6) unsigned DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_deprecationerrors`
--

LOCK TABLES `craft_deprecationerrors` WRITE;
/*!40000 ALTER TABLE `craft_deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elements`
--

DROP TABLE IF EXISTS `craft_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_elements_type_idx` (`type`),
  KEY `craft_elements_enabled_idx` (`enabled`),
  KEY `craft_elements_archived_dateCreated_idx` (`archived`,`dateCreated`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elements`
--

LOCK TABLES `craft_elements` WRITE;
/*!40000 ALTER TABLE `craft_elements` DISABLE KEYS */;
INSERT INTO `craft_elements` VALUES (1,'User',1,0,'2015-01-25 16:17:43','2015-01-25 16:17:43','675c6c43-cf37-407a-baa3-7384d4b9308b'),(2,'Entry',1,0,'2015-01-25 16:17:44','2015-01-26 22:40:30','b17e9737-cc3a-48de-b256-7b94198cf023'),(4,'User',1,0,'2015-01-26 15:32:46','2015-01-26 15:32:46','421e4d26-21f6-41ef-9a14-1c146e9a07da'),(5,'User',1,0,'2015-01-26 15:33:30','2015-01-26 15:33:30','2639f9b6-55ce-415a-ab8d-e1e610db2005'),(7,'Entry',1,0,'2015-01-27 16:30:07','2015-01-27 17:42:25','b079f213-0ce9-465c-9375-d35694d5e2d0'),(8,'MatrixBlock',1,0,'2015-01-27 16:30:08','2015-01-27 17:42:25','6eb1bced-c685-4b2e-9790-078595c106dd'),(9,'MatrixBlock',1,0,'2015-01-27 16:30:08','2015-01-27 17:42:25','bcdd28c8-b9d8-4112-93ac-7b4d71a44d6a'),(10,'MatrixBlock',1,0,'2015-01-27 16:30:08','2015-01-27 17:42:25','367ffadc-94d2-474d-8a72-480960e39340'),(11,'Entry',1,0,'2015-01-27 16:37:10','2015-01-27 17:56:50','03e8b13d-5047-4384-8596-5eb249734fb8'),(13,'Entry',1,0,'2015-01-27 17:06:23','2015-01-27 17:56:11','b0ffdb5d-797c-41e2-9ba7-24345f930dde'),(15,'MatrixBlock',1,0,'2015-01-27 17:56:11','2015-01-27 17:56:11','7ad99b37-71af-438c-b715-4b5856c1fda0'),(16,'MatrixBlock',1,0,'2015-01-27 17:56:11','2015-01-27 17:56:11','3e462f91-e6a6-4e62-a0b5-4fe20688b351');
/*!40000 ALTER TABLE `craft_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elements_i18n`
--

DROP TABLE IF EXISTS `craft_elements_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elements_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elements_i18n_elementId_locale_unq_idx` (`elementId`,`locale`),
  UNIQUE KEY `craft_elements_i18n_uri_locale_unq_idx` (`uri`,`locale`),
  KEY `craft_elements_i18n_slug_locale_idx` (`slug`,`locale`),
  KEY `craft_elements_i18n_enabled_idx` (`enabled`),
  KEY `craft_elements_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_elements_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_elements_i18n_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elements_i18n`
--

LOCK TABLES `craft_elements_i18n` WRITE;
/*!40000 ALTER TABLE `craft_elements_i18n` DISABLE KEYS */;
INSERT INTO `craft_elements_i18n` VALUES (1,1,'en_us','',NULL,1,'2015-01-25 16:17:43','2015-01-25 16:17:43','ff67df16-fb2f-4aa9-983f-4d92913a665e'),(2,2,'en_us','homepage','__home__',1,'2015-01-25 16:17:44','2015-01-26 22:40:30','8c08a307-7e03-48a4-ba9f-411503169f24'),(4,4,'en_us','',NULL,1,'2015-01-26 15:32:46','2015-01-26 15:32:46','8c41fab9-929a-4532-9ed2-33f1f9f76489'),(5,5,'en_us','',NULL,1,'2015-01-26 15:33:30','2015-01-26 15:33:30','93f1974e-dc49-444f-a395-7677d33bf0c0'),(9,7,'en_us','test-resource','resources/test-resource',1,'2015-01-27 16:30:08','2015-01-27 17:42:25','da68ea3a-2231-4706-b14b-e44ef3415a5b'),(10,8,'en_us','',NULL,1,'2015-01-27 16:30:08','2015-01-27 17:42:25','d7fd36be-e830-4f6d-88d6-2701117f9692'),(11,9,'en_us','',NULL,1,'2015-01-27 16:30:08','2015-01-27 17:42:25','0a0e1320-026c-4ed4-bfc0-b527ac735ec7'),(12,10,'en_us','',NULL,1,'2015-01-27 16:30:08','2015-01-27 17:42:25','4ecfe307-7b77-408c-916f-5ba20f8d35ec'),(13,11,'en_us','story','stories/story',1,'2015-01-27 16:37:10','2015-01-27 17:56:50','c5cc1786-ed0e-4906-b7af-0ceb4d9709fa'),(15,13,'en_us','story-1','stories/story-1',1,'2015-01-27 17:06:23','2015-01-27 17:56:11','ea678080-4dd9-465d-8413-f3c0e5aa33da'),(17,15,'en_us','',NULL,1,'2015-01-27 17:56:11','2015-01-27 17:56:11','b01ecbe1-a4eb-4edf-9dd9-41254bc9218f'),(18,16,'en_us','',NULL,1,'2015-01-27 17:56:11','2015-01-27 17:56:11','bf528f7d-0003-451e-8efa-3b1c2a45c584');
/*!40000 ALTER TABLE `craft_elements_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_emailmessages`
--

DROP TABLE IF EXISTS `craft_emailmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_emailmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_emailmessages_key_locale_unq_idx` (`key`,`locale`),
  KEY `craft_emailmessages_locale_fk` (`locale`),
  CONSTRAINT `craft_emailmessages_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_emailmessages`
--

LOCK TABLES `craft_emailmessages` WRITE;
/*!40000 ALTER TABLE `craft_emailmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_emailmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entries`
--

DROP TABLE IF EXISTS `craft_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entries_sectionId_idx` (`sectionId`),
  KEY `craft_entries_typeId_idx` (`typeId`),
  KEY `craft_entries_postDate_idx` (`postDate`),
  KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  KEY `craft_entries_authorId_fk` (`authorId`),
  CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entries`
--

LOCK TABLES `craft_entries` WRITE;
/*!40000 ALTER TABLE `craft_entries` DISABLE KEYS */;
INSERT INTO `craft_entries` VALUES (2,1,1,NULL,'2015-01-26 22:26:32',NULL,'2015-01-25 16:17:44','2015-01-26 22:40:30','3a5e6933-7e1f-4b58-9ef8-336d78cf7be2'),(7,5,5,5,'2015-01-27 16:30:00',NULL,'2015-01-27 16:30:08','2015-01-27 17:42:25','6f771d6d-95ba-4ffa-88e9-582133fb8b16'),(11,4,6,4,'2015-01-27 16:37:00',NULL,'2015-01-27 16:37:10','2015-01-27 17:56:50','fab909d1-029b-473e-ad7e-f783ec6db442'),(13,4,6,4,'2015-01-27 17:06:00',NULL,'2015-01-27 17:06:23','2015-01-27 17:56:11','de177524-80d1-4472-a91f-d539b35c662e');
/*!40000 ALTER TABLE `craft_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entrydrafts`
--

DROP TABLE IF EXISTS `craft_entrydrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entrydrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entrydrafts_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entrydrafts_sectionId_fk` (`sectionId`),
  KEY `craft_entrydrafts_creatorId_fk` (`creatorId`),
  KEY `craft_entrydrafts_locale_fk` (`locale`),
  CONSTRAINT `craft_entrydrafts_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entrydrafts`
--

LOCK TABLES `craft_entrydrafts` WRITE;
/*!40000 ALTER TABLE `craft_entrydrafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_entrydrafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entrytypes`
--

DROP TABLE IF EXISTS `craft_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Title',
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  UNIQUE KEY `craft_entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  KEY `craft_entrytypes_sectionId_fk` (`sectionId`),
  KEY `craft_entrytypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entrytypes`
--

LOCK TABLES `craft_entrytypes` WRITE;
/*!40000 ALTER TABLE `craft_entrytypes` DISABLE KEYS */;
INSERT INTO `craft_entrytypes` VALUES (1,1,13,'Homepage','homepage',1,'Title',NULL,NULL,'2015-01-25 16:17:44','2015-01-27 14:53:40','25e1a8ed-5241-4118-9128-0268e146b99b'),(4,4,46,'Story Box','storyBox',1,'Title',NULL,NULL,'2015-01-27 15:00:33','2015-01-27 17:19:37','200ccfa3-3dbf-4263-be2d-5a02013c788e'),(5,5,24,'Resources','resources',1,'Title',NULL,NULL,'2015-01-27 15:28:44','2015-01-27 16:21:28','6772dc15-e3bf-44a5-82d0-f2540bcd1d82'),(6,4,56,'Individual Story','individualStory',1,'Title',NULL,NULL,'2015-01-27 17:12:59','2015-01-27 18:54:59','b03ea002-5b7b-4b52-a8ec-5a3c80c6b45f');
/*!40000 ALTER TABLE `craft_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entryversions`
--

DROP TABLE IF EXISTS `craft_entryversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entryversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `num` smallint(6) unsigned NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entryversions_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entryversions_sectionId_fk` (`sectionId`),
  KEY `craft_entryversions_creatorId_fk` (`creatorId`),
  KEY `craft_entryversions_locale_fk` (`locale`),
  CONSTRAINT `craft_entryversions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entryversions`
--

LOCK TABLES `craft_entryversions` WRITE;
/*!40000 ALTER TABLE `craft_entryversions` DISABLE KEYS */;
INSERT INTO `craft_entryversions` VALUES (1,2,1,5,'en_us',1,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"The Gathering Place\",\"slug\":\"homepage\",\"postDate\":1422202664,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"1\":\"<p>\\r\\n\\tIt\'s true, this site doesn\'t have a whole lot of content yet, but don\'t worry. Our web developers have just installed the CMS, and they\'re setting things up for the content editors this very moment. Soon Tgp.d-i.co will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.\\r\\n<\\/p>\",\"2\":\"\"}}','2015-01-26 17:53:29','2015-01-26 17:53:29','df050caf-2860-4d59-aa16-476e98b33da9'),(2,2,1,5,'en_us',2,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"The Gathering Place\",\"slug\":\"homepage\",\"postDate\":1422305788,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"1\":\"<p>\\r\\n\\tIt\'s true, this site doesn\'t have a whole lot of content yet, but don\'t worry. Our web developers have just installed the CMS, and they\'re setting things up for the content editors this very moment. Soon Tgp.d-i.co will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.\\r\\n<\\/p>\",\"3\":\"\",\"4\":\"\",\"2\":\"\"}}','2015-01-26 21:39:46','2015-01-26 21:39:46','4029483d-047f-4b66-8058-c98502cb5c84'),(3,2,1,5,'en_us',3,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"The Gathering Place\",\"slug\":\"homepage\",\"postDate\":1422305788,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"1\":\"<p>\\r\\n\\tIt\'s true, this site doesn\'t have a whole lot of content yet, but don\'t worry. Our web developers have just installed the CMS, and they\'re setting things up for the content editors this very moment. Soon Tgp.d-i.co will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.\\r\\n<\\/p><p><br><\\/p><p>Are you like Kate<\\/p>\",\"2\":\"\"}}','2015-01-26 21:49:00','2015-01-26 21:49:00','54ffbef5-8d86-4ff4-ad81-11bb0c6b838e'),(4,2,1,5,'en_us',4,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"The Gathering Place\",\"slug\":\"homepage\",\"postDate\":1422311192,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"1\":\"<p>\\r\\n\\tIt\'s true, this site doesn\'t have a whole lot of content yet, but don\'t worry. Our web developers have just installed the CMS, and they\'re setting things up for the content editors this very moment. Soon Tgp.d-i.co will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.\\r\\n<\\/p><p><br><\\/p><p>Are you like Kate<\\/p>\",\"6\":\"\",\"2\":\"\"}}','2015-01-26 22:40:30','2015-01-26 22:40:30','42ff7e8d-c816-4d84-91ff-c8ea76c7fa18'),(8,7,5,5,'en_us',1,'','{\"typeId\":null,\"authorId\":\"5\",\"title\":\"test resource\",\"slug\":\"test-resource\",\"postDate\":1422376207,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"9\":{\"new1\":{\"type\":\"resourceImage\",\"enabled\":\"1\",\"fields\":{\"default\":\"\"}},\"new2\":{\"type\":\"resourceName\",\"enabled\":\"1\",\"fields\":{\"placeholdername\":\"number one\"}},\"new3\":{\"type\":\"resourceDescription\",\"enabled\":\"1\",\"fields\":{\"resourceBody\":\"testing if this working or not\"}}}}}','2015-01-27 16:30:08','2015-01-27 16:30:08','764f9f08-3abd-4d8d-9dd9-f7b3d444b885'),(9,11,4,4,'en_us',1,'','{\"typeId\":null,\"authorId\":\"4\",\"title\":\"The Gathering Place - Stories\",\"slug\":\"the-gathering-place-stories\",\"postDate\":1422376630,\"expiryDate\":null,\"enabled\":1,\"fields\":[]}','2015-01-27 16:37:10','2015-01-27 16:37:10','8e331091-e624-40be-af51-e02232458e86'),(10,11,4,4,'en_us',2,'','{\"typeId\":\"4\",\"authorId\":\"4\",\"title\":\"The Gathering Place - Stories\",\"slug\":\"the-gathering-place-stories\",\"postDate\":1422376620,\"expiryDate\":null,\"enabled\":1,\"fields\":[]}','2015-01-27 16:38:23','2015-01-27 16:38:23','b783d42e-63a2-47cd-a2d2-669b2d3f6a4a'),(12,11,4,4,'en_us',3,'','{\"typeId\":\"4\",\"authorId\":\"4\",\"title\":\"The Gathering Place\",\"slug\":\"story\",\"postDate\":1422376620,\"expiryDate\":null,\"enabled\":1,\"fields\":[]}','2015-01-27 17:02:21','2015-01-27 17:02:21','c4ee8d89-249f-45d6-8b3c-27ea16411998'),(13,13,4,4,'en_us',1,'','{\"typeId\":null,\"authorId\":\"4\",\"title\":\"Story\",\"slug\":\"story-1\",\"postDate\":1422378383,\"expiryDate\":null,\"enabled\":1,\"fields\":[]}','2015-01-27 17:06:23','2015-01-27 17:06:23','1db660ce-c84c-4e2d-9ab8-83723645f694'),(14,7,5,5,'en_us',2,'','{\"typeId\":\"5\",\"authorId\":\"5\",\"title\":\"test resource\",\"slug\":\"test-resource\",\"postDate\":1422376200,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"9\":{\"8\":{\"type\":\"resourceImage\",\"enabled\":\"1\",\"fields\":{\"default\":\"\"}},\"9\":{\"type\":\"resourceName\",\"enabled\":\"1\",\"fields\":{\"placeholdername\":\"number one\"}},\"10\":{\"type\":\"resourceDescription\",\"enabled\":\"1\",\"fields\":{\"resourceBody\":\"testing if this working or not\"}}}}}','2015-01-27 17:20:20','2015-01-27 17:20:20','1a49fb40-2d72-47d4-83d9-147650e0fc10'),(15,11,4,4,'en_us',4,'','{\"typeId\":\"6\",\"authorId\":\"4\",\"title\":\"The Gathering Place\",\"slug\":\"story\",\"postDate\":1422376620,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"21\":\"\",\"30\":\"\",\"14\":\"\",\"13\":\"\",\"20\":\"\",\"2\":\"\"}}','2015-01-27 17:24:00','2015-01-27 17:24:00','0481a33a-c58c-42b6-8c5e-ad02b3402e61'),(16,7,5,5,'en_us',3,'','{\"typeId\":\"5\",\"authorId\":\"5\",\"title\":\"test resource\",\"slug\":\"test-resource\",\"postDate\":1422376200,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"9\":{\"8\":{\"type\":\"resourceImage\",\"enabled\":\"1\",\"fields\":{\"default\":\"\"}},\"9\":{\"type\":\"resourceName\",\"enabled\":\"1\",\"fields\":{\"placeholdername\":\"number one\"}},\"10\":{\"type\":\"resourceDescription\",\"enabled\":\"1\",\"fields\":{\"resourceDescription\":\"testing if this working or not\"}}}}}','2015-01-27 17:27:03','2015-01-27 17:27:03','d77eee81-d9d1-4b70-a303-3df17dfd1306'),(17,7,5,5,'en_us',4,'','{\"typeId\":\"5\",\"authorId\":\"5\",\"title\":\"test resource\",\"slug\":\"test-resource\",\"postDate\":1422376200,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"9\":{\"8\":{\"type\":\"resourceImage\",\"enabled\":\"1\",\"fields\":{\"default\":\"\"}},\"9\":{\"type\":\"resourceName\",\"enabled\":\"1\",\"fields\":{\"placeholdername\":\"number one\"}},\"10\":{\"type\":\"resourceDescription\",\"enabled\":\"1\",\"fields\":{\"resourceDescription\":\"testing if this working or not\"}}}}}','2015-01-27 17:29:37','2015-01-27 17:29:37','cadd1bdc-5bd5-4a92-922d-285a421e28c8'),(18,7,5,5,'en_us',5,'','{\"typeId\":\"5\",\"authorId\":\"5\",\"title\":\"test resource\",\"slug\":\"test-resource\",\"postDate\":1422376200,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"9\":{\"8\":{\"type\":\"resourceImage\",\"enabled\":\"1\",\"fields\":{\"default\":\"\"}},\"9\":{\"type\":\"resourceName\",\"enabled\":\"1\",\"fields\":{\"placeholdername\":\"number one\"}},\"10\":{\"type\":\"resourceDescription\",\"enabled\":\"1\",\"fields\":{\"resourceDescription\":\"testing if this working or not\"}}}}}','2015-01-27 17:42:25','2015-01-27 17:42:25','fce5d71b-b5a1-4a04-a313-8e3c9e3ed23d'),(19,13,4,4,'en_us',2,'','{\"typeId\":\"6\",\"authorId\":\"4\",\"title\":\"Sample Story #1\",\"slug\":\"story-1\",\"postDate\":1422378360,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"21\":\"\",\"30\":\"\",\"14\":{\"new1\":{\"type\":\"storyTitle\",\"enabled\":\"1\",\"fields\":{\"storyTitle\":\"<h2>The Story Title goes here.<\\/h2>\",\"storySubtitle\":\"<h3>This is a subtitle<\\/h3>\"}},\"new2\":{\"type\":\"storyBody\",\"enabled\":\"1\",\"fields\":{\"storyText\":\"<p>Lorem ipsum dolor sit amet, vel cibo autem primis ex, vim in exerci animal dissentiunt. At nemore luptatum tractatos pro. Pri ad forensibus suscipiantur, id apeirian sadipscing per, sed ne gubergren assentior. Ea maiorum consulatu mei. Novum dicant qualisque at mel, pro ea facilisi recusabo inciderint.<\\/p><p>Ignota facilis maiestatis cum ex, iuvaret menandri eleifend ut sit, nec etiam repudiare et. Vix eu alia iudico diceret, vis ei debet decore luptatum. Mel ea malorum cotidieque, dolorum scripserit persequeris eu sit. I<em>n altera ridens ullamcorper sea<\\/em>, duo nisl partem at. Vix audire scripserit te, vocibus fastidii deseruisse quo ei, ex mel dolore cotidieque.<\\/p><p><strong>Possim invidunt usu ut.<\\/strong> Graece explicari appellantur id eum, ne apeirian praesent ullamcorper has, odio eros hendrerit ex nec. Vide suscipit eos in. Brute congue omnium an cum. Id mei assum similique.<\\/p><p>Idque omittantur at eum. Id eum omnes utroque habemus, solet forensibus ut vix. Ridens expetenda referrentur sea in. Et vel graece habemus. Eam eu vero fastidii albucius, dicam perpetua instructior mea an, ius sint omnis option ea. Ad affert quando theophrastus pri, nisl repudiare expetendis eam ad.<\\/p><p>Cu vim minim tempor nusquam. Officiis tincidunt per in. Delectus singulis no mel, cum nulla sapientem consulatu no. Has quis partiendo ea, an vel persecuti assueverit sadipscing, cu ipsum iisque his. Quando doming eirmod vel at, eos id mollis ponderum, eius harum quo at. Sed graeci mollis tritani cu, cu veri propriae dignissim sit.<\\/p>\"}},\"new3\":{\"type\":\"storyAccentText\",\"enabled\":\"1\",\"fields\":{\"storyAccentText\":\"<h5>Idque omittantur at eum. Id eum omnes utroque habemus, solet forensibus ut vix. Ridens expetenda referrentur sea in. Et vel graece habemus. Eam eu vero fastidii albucius, dicam perpetua instructior mea an, ius sint omnis option ea. Ad affert quando theophrastus pri, nisl repudiare expetendis eam ad.<\\/h5>\"}}},\"13\":\"\",\"20\":\"\",\"2\":\"\"}}','2015-01-27 17:56:11','2015-01-27 17:56:11','df53f856-ba16-4874-bbe6-82cb67a37cca'),(20,11,4,4,'en_us',5,'','{\"typeId\":\"6\",\"authorId\":\"4\",\"title\":\"The Gathering Place Stories\",\"slug\":\"story\",\"postDate\":1422376620,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"21\":\"\",\"30\":\"\",\"14\":\"\",\"13\":\"\",\"20\":\"\",\"2\":\"\"}}','2015-01-27 17:56:51','2015-01-27 17:56:51','a330dbe7-8387-438d-a170-d545c1938350');
/*!40000 ALTER TABLE `craft_entryversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldgroups`
--

DROP TABLE IF EXISTS `craft_fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldgroups`
--

LOCK TABLES `craft_fieldgroups` WRITE;
/*!40000 ALTER TABLE `craft_fieldgroups` DISABLE KEYS */;
INSERT INTO `craft_fieldgroups` VALUES (1,'Default','2015-01-25 16:17:44','2015-01-25 16:17:44','c6c908d5-ef19-499b-a679-642de3e7660e'),(2,'images','2015-01-26 21:46:53','2015-01-26 21:46:53','c416d27e-ffbd-422f-aa43-51272ef731c1');
/*!40000 ALTER TABLE `craft_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayoutfields`
--

DROP TABLE IF EXISTS `craft_fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayoutfields_tabId_fk` (`tabId`),
  KEY `craft_fieldlayoutfields_fieldId_fk` (`fieldId`),
  CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayoutfields`
--

LOCK TABLES `craft_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `craft_fieldlayoutfields` VALUES (2,5,2,1,1,1,'2015-01-25 16:17:44','2015-01-25 16:17:44','6bb3d614-cc51-4bd5-8252-4344b240ff3b'),(3,5,2,2,0,2,'2015-01-25 16:17:44','2015-01-25 16:17:44','7026006e-f553-442a-b808-f84c7a9dcef9'),(18,13,13,1,1,1,'2015-01-27 14:53:40','2015-01-27 14:53:40','afb46cf1-c396-4b37-9e28-e7f826c707bc'),(19,13,14,2,0,1,'2015-01-27 14:53:40','2015-01-27 14:53:40','260a9b1c-ec0c-46c2-b474-c2577864eb10'),(25,24,20,9,0,1,'2015-01-27 16:21:28','2015-01-27 16:21:28','c25a737e-641b-4d6d-8e41-3e7dec347011'),(45,40,35,22,0,1,'2015-01-27 16:52:48','2015-01-27 16:52:48','a7f548a4-3099-4440-ad51-fbd52e2cc370'),(46,41,36,23,0,1,'2015-01-27 16:52:48','2015-01-27 16:52:48','26c5fd42-2dd2-4a96-a98c-a7ff14d052fb'),(47,41,36,27,0,2,'2015-01-27 16:52:48','2015-01-27 16:52:48','b881f835-1680-43bb-bab7-60d4f2e437a6'),(48,41,36,28,0,3,'2015-01-27 16:52:48','2015-01-27 16:52:48','238e1341-7367-4063-a0ee-539b3b490cd2'),(49,42,37,29,0,1,'2015-01-27 16:52:48','2015-01-27 16:52:48','ceff2cd9-c937-4cee-804b-5dea47dd8b8a'),(59,46,41,30,0,1,'2015-01-27 17:19:37','2015-01-27 17:19:37','8238558c-0b45-4c76-b2d6-5c44e2adc27a'),(63,53,45,10,0,1,'2015-01-27 18:00:45','2015-01-27 18:00:45','df8b950d-8aab-45d4-8591-e50ca2def905'),(64,54,46,11,0,1,'2015-01-27 18:00:45','2015-01-27 18:00:45','b783e1ac-7cd6-4da8-ae40-875692158a96'),(65,55,47,12,0,1,'2015-01-27 18:00:45','2015-01-27 18:00:45','7eab78d4-71ba-4b95-855a-986c764d6d59'),(66,56,48,13,0,1,'2015-01-27 18:54:59','2015-01-27 18:54:59','ce0515af-f25f-46a9-baba-a5d2027a826a'),(67,56,48,35,0,2,'2015-01-27 18:54:59','2015-01-27 18:54:59','1034bde0-3d44-438e-9e2d-73fd6869f936'),(68,56,48,36,0,3,'2015-01-27 18:54:59','2015-01-27 18:54:59','69288401-8e8d-4bd3-becd-6890a68f8543'),(69,56,48,14,0,4,'2015-01-27 18:54:59','2015-01-27 18:54:59','fe224a39-861d-4b75-b68f-3cde262e4733'),(70,56,48,20,0,5,'2015-01-27 18:54:59','2015-01-27 18:54:59','69399dbd-8cae-4f14-ad20-80357de20352'),(71,56,48,21,0,6,'2015-01-27 18:54:59','2015-01-27 18:54:59','46e2c5c9-1a2e-491f-91ed-7f043fd23c9f'),(72,56,48,30,0,7,'2015-01-27 18:54:59','2015-01-27 18:54:59','1be93a61-14f2-4da4-b5af-d90649405d04'),(73,56,48,2,0,8,'2015-01-27 18:54:59','2015-01-27 18:54:59','3a886801-64b0-42de-b4be-69029d2d480f'),(77,59,51,31,0,1,'2015-01-27 18:57:48','2015-01-27 18:57:48','4e34945f-4bf0-4b3f-b0b4-c87fa721a8c4'),(78,60,52,32,0,1,'2015-01-27 18:57:48','2015-01-27 18:57:48','ff495269-177a-4fd5-a535-77a3ec863bbb'),(79,60,52,33,0,2,'2015-01-27 18:57:48','2015-01-27 18:57:48','30573ed3-707c-4d00-b161-3955c9fcd0fe'),(80,61,53,17,0,1,'2015-01-27 18:58:56','2015-01-27 18:58:56','caccfff2-7f22-4b5d-945b-2355b1fcf5b8'),(81,62,54,18,0,1,'2015-01-27 18:58:56','2015-01-27 18:58:56','b6f0cc97-8a35-4ef8-8c26-a7552484413a'),(82,63,55,19,0,1,'2015-01-27 18:58:56','2015-01-27 18:58:56','86cc3393-497e-4534-aab7-64a7d36e40bf');
/*!40000 ALTER TABLE `craft_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayouts`
--

DROP TABLE IF EXISTS `craft_fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayouts`
--

LOCK TABLES `craft_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouts` DISABLE KEYS */;
INSERT INTO `craft_fieldlayouts` VALUES (1,'Tag','2015-01-25 16:17:44','2015-01-25 16:17:44','0ff5712f-5691-40c6-8874-9e1fa8ef23d5'),(5,'Entry','2015-01-25 16:17:44','2015-01-25 16:17:44','bd18b98b-5e8f-4a1c-9f47-483383fe544a'),(7,'Entry','2015-01-26 20:30:42','2015-01-26 20:30:42','161e8b20-d7ce-47e0-847c-089997c81301'),(12,'Asset','2015-01-26 22:25:56','2015-01-26 22:25:56','c0bbecd8-7608-4f87-ac52-ae1c5d55a267'),(13,'Entry','2015-01-27 14:53:40','2015-01-27 14:53:40','891f4726-2bd4-4473-a7ee-096263b812f6'),(17,'Category','2015-01-27 15:55:01','2015-01-27 15:55:01','0c0b9ce1-08b4-4fda-86fc-32e967492810'),(18,'Category','2015-01-27 15:55:38','2015-01-27 15:55:38','625cbe61-7955-46c7-bd85-5298d9987aa4'),(19,'Category','2015-01-27 15:56:22','2015-01-27 15:56:22','9c0fc193-8b1a-4860-91d4-9185117f9a1d'),(24,'Entry','2015-01-27 16:21:28','2015-01-27 16:21:28','1d8226aa-0d0e-4cdc-b5c4-d8db6a06eb0d'),(40,'MatrixBlock','2015-01-27 16:52:48','2015-01-27 16:52:48','e5fdbd8f-d369-41f4-b996-e9645c6b7d41'),(41,'MatrixBlock','2015-01-27 16:52:48','2015-01-27 16:52:48','7c597076-4eed-4c24-b9a1-1ad4242f2b08'),(42,'MatrixBlock','2015-01-27 16:52:48','2015-01-27 16:52:48','5279aff7-a5ca-4b36-a453-faf54c20fa7e'),(46,'Entry','2015-01-27 17:19:37','2015-01-27 17:19:37','abd1ad61-35d8-4c68-a02b-4e5102cbba9b'),(52,'Asset','2015-01-27 17:47:54','2015-01-27 17:47:54','7ca83c33-3e94-4580-88c1-41629dcd2d27'),(53,'MatrixBlock','2015-01-27 18:00:45','2015-01-27 18:00:45','6605acea-261a-410f-b19a-77fe98bd5a04'),(54,'MatrixBlock','2015-01-27 18:00:45','2015-01-27 18:00:45','22d7708c-3311-4c4a-b29c-706dcd96b1af'),(55,'MatrixBlock','2015-01-27 18:00:45','2015-01-27 18:00:45','8f45b92e-7d44-4b39-9920-c0e8e2072bf6'),(56,'Entry','2015-01-27 18:54:59','2015-01-27 18:54:59','a4da9bf5-99b5-4529-be18-5f21ae3b0ab6'),(59,'MatrixBlock','2015-01-27 18:57:48','2015-01-27 18:57:48','6036f925-404c-4c99-ab1b-63da23b1f214'),(60,'MatrixBlock','2015-01-27 18:57:48','2015-01-27 18:57:48','1095c030-17b7-448b-a527-ba581098b5b8'),(61,'MatrixBlock','2015-01-27 18:58:56','2015-01-27 18:58:56','1ccfeb7c-c8d5-4216-98b2-0f1ebe0aceaf'),(62,'MatrixBlock','2015-01-27 18:58:56','2015-01-27 18:58:56','c24743b9-3628-44ac-9a83-06028b8f7944'),(63,'MatrixBlock','2015-01-27 18:58:56','2015-01-27 18:58:56','ab03230a-066b-44e2-baf9-1b530f1ad14f');
/*!40000 ALTER TABLE `craft_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayouttabs`
--

DROP TABLE IF EXISTS `craft_fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayouttabs_layoutId_fk` (`layoutId`),
  CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayouttabs`
--

LOCK TABLES `craft_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `craft_fieldlayouttabs` VALUES (2,5,'Content',1,'2015-01-25 16:17:44','2015-01-25 16:17:44','d3fbe061-02aa-43a0-8e5c-3c1c591a54ae'),(13,13,'testimonials',1,'2015-01-27 14:53:40','2015-01-27 14:53:40','94e13e75-bc71-446d-aa37-2523ee721f08'),(14,13,'Sidebar',2,'2015-01-27 14:53:40','2015-01-27 14:53:40','faa0fbca-37e2-4547-873d-d10cd71efad3'),(20,24,'resource #1',1,'2015-01-27 16:21:28','2015-01-27 16:21:28','7a8c0817-fdca-4b73-a696-0111ec5accee'),(35,40,'Content',1,'2015-01-27 16:52:48','2015-01-27 16:52:48','e276f7fd-e94c-4357-927e-a0009abd4687'),(36,41,'Content',1,'2015-01-27 16:52:48','2015-01-27 16:52:48','d1682f56-d12d-49ca-b708-d93b75e70236'),(37,42,'Content',1,'2015-01-27 16:52:48','2015-01-27 16:52:48','4a28abad-27be-4203-b804-ec42f992190d'),(41,46,'Tab 1',1,'2015-01-27 17:19:37','2015-01-27 17:19:37','92c8aa4f-4e11-49b6-b0a0-195ecc59b2de'),(45,53,'Content',1,'2015-01-27 18:00:45','2015-01-27 18:00:45','ce567216-1414-4dfb-bc0e-63faa240e4cf'),(46,54,'Content',1,'2015-01-27 18:00:45','2015-01-27 18:00:45','e6866c20-53cd-43b8-b632-55512ec1d527'),(47,55,'Content',1,'2015-01-27 18:00:45','2015-01-27 18:00:45','e8a37879-a171-4bcf-aa13-f5e3f5e58ef8'),(48,56,'Tab 1',1,'2015-01-27 18:54:59','2015-01-27 18:54:59','e565c319-cc97-4c30-ad19-1c337342b46c'),(51,59,'Content',1,'2015-01-27 18:57:48','2015-01-27 18:57:48','44e7bd05-16de-458a-86b3-e18a89ceeff0'),(52,60,'Content',1,'2015-01-27 18:57:48','2015-01-27 18:57:48','ef53b785-38b7-4639-96fe-eb2f86e491cb'),(53,61,'Content',1,'2015-01-27 18:58:56','2015-01-27 18:58:56','75a3dcbf-47fd-4da5-96fa-7fd350875f3c'),(54,62,'Content',1,'2015-01-27 18:58:56','2015-01-27 18:58:56','7b67aca4-17bb-4464-929f-76e2807719e8'),(55,63,'Content',1,'2015-01-27 18:58:56','2015-01-27 18:58:56','2e262b32-2b15-42b5-b037-ac2bbc6489b4');
/*!40000 ALTER TABLE `craft_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fields`
--

DROP TABLE IF EXISTS `craft_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(58) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `translatable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `craft_fields_context_idx` (`context`),
  KEY `craft_fields_groupId_fk` (`groupId`),
  CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fields`
--

LOCK TABLES `craft_fields` WRITE;
/*!40000 ALTER TABLE `craft_fields` DISABLE KEYS */;
INSERT INTO `craft_fields` VALUES (1,1,'Body','body','global',NULL,1,'RichText','{\"configFile\":\"Standard.json\",\"columnType\":\"text\"}','2015-01-25 16:17:44','2015-01-25 16:17:44','3e60a341-571b-4f7a-be1a-da12d58d7c66'),(2,1,'Tags','tags','global',NULL,0,'Tags','{\"source\":\"taggroup:1\"}','2015-01-25 16:17:44','2015-01-25 16:17:44','d3d135ab-238d-46b4-ab16-e2ce4d1bd879'),(9,1,'resource blocks','resourceBlocks','global','',0,'Matrix','{\"maxBlocks\":null}','2015-01-27 15:47:15','2015-01-27 18:00:45','673a873e-bf36-4c32-abc4-210f1536ab36'),(10,NULL,'default','default','matrixBlockType:1','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"2\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"2\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"limit\":\"\"}','2015-01-27 15:47:15','2015-01-27 18:00:45','12e68f7f-a81e-4925-92a2-5cd6daa5d6d8'),(11,NULL,'placeholder name','placeholdername','matrixBlockType:2','',0,'PlainText','{\"placeholder\":\"Resource #1\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-01-27 16:10:03','2015-01-27 18:00:45','94a5ed44-3dba-473d-814e-0105fdfabaac'),(12,NULL,'text','text','matrixBlockType:3','',0,'PlainText','{\"placeholder\":\"The body of the resource\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-01-27 16:10:03','2015-01-27 18:00:45','e2d34f10-c8f1-4788-bbcd-2594aa0d0a65'),(13,1,'Story Main Image','storyMainImage','global','This will be the large banner image across the top of the individual story pages.',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"2\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"2\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"limit\":\"\"}','2015-01-27 16:26:35','2015-01-27 17:36:46','6f0d4fb1-e124-4e2e-bd0b-0865d34c283c'),(14,1,'Story Body','storyBody','global','This will include all of the primary information for each story\'s individual page.',0,'Matrix','{\"maxBlocks\":null}','2015-01-27 16:29:57','2015-01-27 18:58:56','d30ae559-7650-4805-a009-111911a8eabe'),(17,NULL,'Story Text','storyText','matrixBlockType:5','',0,'RichText','{\"configFile\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"\",\"columnType\":\"mediumtext\"}','2015-01-27 16:29:57','2015-01-27 18:58:56','07ecad14-f9e4-4cb5-86b2-697931802590'),(18,NULL,'Story Image','storyImage','matrixBlockType:6','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"2\",\"defaultUploadLocationSubpath\":\"stories\",\"singleUploadLocationSource\":\"2\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"limit\":\"\"}','2015-01-27 16:30:59','2015-01-27 18:58:56','93fd00f0-1610-404e-8dce-92cc98b09a84'),(19,NULL,'Story Accent Text','storyAccentText','matrixBlockType:7','If there are any short passages or other bits of text that should be emphasized, they can go here.',0,'RichText','{\"configFile\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"\",\"columnType\":\"text\"}','2015-01-27 16:40:18','2015-01-27 18:58:56','e2b667fe-14fe-4429-a00b-cec50ef3a48f'),(20,1,'Story Resource Link','storyResourceLink','global','Link to resources in the sidebar of the individual story page.',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-01-27 16:44:53','2015-01-27 16:44:53','8d1c37de-874d-4b30-8dd7-5da98a73672d'),(21,1,'Sidebar Event Link','sidebarEventLink','global','Sidebar link to event on the calendar',0,'Matrix','{\"maxBlocks\":null}','2015-01-27 16:48:54','2015-01-27 16:52:48','8e727010-b0b4-4f66-97cd-76204d6292cd'),(22,NULL,'Event Name','eventName','matrixBlockType:8','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-01-27 16:48:54','2015-01-27 16:52:48','b54914da-0c10-481b-b7ff-285b247d329a'),(23,NULL,'Event Start Time','eventStartTime','matrixBlockType:9','',0,'Date','{\"minuteIncrement\":\"15\",\"showTime\":1,\"showDate\":0}','2015-01-27 16:48:54','2015-01-27 16:52:48','b32b0dce-b648-4bbc-91ac-520b3ccc8852'),(27,NULL,'Event Stop Time','eventStopTime','matrixBlockType:9','',0,'Date','{\"minuteIncrement\":\"15\",\"showTime\":1,\"showDate\":0}','2015-01-27 16:52:48','2015-01-27 16:52:48','5750fe23-2e8d-4cd8-a58d-409a07eb6d90'),(28,NULL,'Event Date','eventDate','matrixBlockType:9','',0,'Date','{\"minuteIncrement\":\"30\",\"showDate\":1,\"showTime\":0}','2015-01-27 16:52:48','2015-01-27 16:52:48','40ef8a50-cf27-4fa6-81d2-688a849dea9b'),(29,NULL,'Location','location','matrixBlockType:11','Name of the location (The Gathering Place, Library, etc.)',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-01-27 16:52:48','2015-01-27 16:52:48','46818b20-9367-4def-8ad4-4451886e3342'),(30,1,'Story Blurb','storyBlurb','global','This is the short story block to link to a full story page.',0,'Matrix','{\"maxBlocks\":\"3\"}','2015-01-27 16:57:36','2015-01-27 18:57:48','a8699a94-e6ec-4a36-8e9f-6262418c8f5e'),(31,NULL,'Story Blurb Image','storyBlurbImage','matrixBlockType:12','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"2\",\"defaultUploadLocationSubpath\":\"stories\",\"singleUploadLocationSource\":\"2\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"limit\":\"\"}','2015-01-27 16:57:36','2015-01-27 18:57:48','6df9b84b-a7b8-4370-9142-df6e37e0bd9a'),(32,NULL,'Story Title','storyTitle','matrixBlockType:13','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-01-27 16:57:36','2015-01-27 18:57:48','e4a210b6-5fdf-489f-8c62-d95a2da9b3a9'),(33,NULL,'Story Excerpt','storyExcerpt','matrixBlockType:13','Short description or excerpt from story to let the reader know what the story is about.',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"300\",\"multiline\":\"\",\"initialRows\":\"4\"}','2015-01-27 16:57:36','2015-01-27 18:57:48','3b35b4d1-7a76-40b5-8777-c52207805eeb'),(34,2,'Main Story Image','mainStoryImage','global','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"2\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"2\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"limit\":\"\"}','2015-01-27 17:36:19','2015-01-27 17:36:19','274d10b8-6db4-4466-8ddc-9a66bfbc89af'),(35,1,'Story Title','storyTitle','global','',0,'RichText','{\"configFile\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"\",\"columnType\":\"text\"}','2015-01-27 18:53:25','2015-01-27 18:53:25','3956aa1a-a364-464b-b39e-fa617df70fa9'),(36,1,'Story Subtitle','storySubtitle','global','',0,'RichText','{\"configFile\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"\",\"columnType\":\"text\"}','2015-01-27 18:53:42','2015-01-27 18:53:42','218b6314-ce43-41c4-9b16-62f652e50edf');
/*!40000 ALTER TABLE `craft_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_globalsets`
--

DROP TABLE IF EXISTS `craft_globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_globalsets_name_unq_idx` (`name`),
  UNIQUE KEY `craft_globalsets_handle_unq_idx` (`handle`),
  KEY `craft_globalsets_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_globalsets`
--

LOCK TABLES `craft_globalsets` WRITE;
/*!40000 ALTER TABLE `craft_globalsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_info`
--

DROP TABLE IF EXISTS `craft_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `build` int(11) unsigned NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `releaseDate` datetime NOT NULL,
  `edition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `siteUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `track` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_info`
--

LOCK TABLES `craft_info` WRITE;
/*!40000 ALTER TABLE `craft_info` DISABLE KEYS */;
INSERT INTO `craft_info` VALUES (1,'2.3',2625,'2.3.1','2015-01-06 22:37:09',2,'The Gathering Place','http://tgp.d-i.co','UTC',1,0,'stable','2015-01-25 16:17:42','2015-01-26 14:40:21','45e20c88-e795-4f82-ad32-2a41d022f7df');
/*!40000 ALTER TABLE `craft_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_locales`
--

DROP TABLE IF EXISTS `craft_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_locales` (
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`locale`),
  KEY `craft_locales_sortOrder_idx` (`sortOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_locales`
--

LOCK TABLES `craft_locales` WRITE;
/*!40000 ALTER TABLE `craft_locales` DISABLE KEYS */;
INSERT INTO `craft_locales` VALUES ('en_us',1,'2015-01-25 16:17:43','2015-01-25 16:17:43','d2477640-6250-476d-8623-1d2ff5105d35');
/*!40000 ALTER TABLE `craft_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixblocks`
--

DROP TABLE IF EXISTS `craft_matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`),
  KEY `craft_matrixblocks_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixblocks`
--

LOCK TABLES `craft_matrixblocks` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocks` DISABLE KEYS */;
INSERT INTO `craft_matrixblocks` VALUES (8,7,9,1,1,NULL,'2015-01-27 16:30:08','2015-01-27 17:42:25','63e02611-fa0c-4e45-a09c-dbb86bba2e6e'),(9,7,9,2,2,NULL,'2015-01-27 16:30:08','2015-01-27 17:42:25','4ab92edf-5ddf-4bab-81e6-7c70964ed5b7'),(10,7,9,3,3,NULL,'2015-01-27 16:30:08','2015-01-27 17:42:25','b778b31c-2456-43e7-8097-07b644b56d75'),(15,13,14,5,2,NULL,'2015-01-27 17:56:11','2015-01-27 17:56:11','cc88685b-0489-4b66-9595-63eb9ae84bd4'),(16,13,14,7,3,NULL,'2015-01-27 17:56:11','2015-01-27 17:56:11','7822e829-6148-4589-84be-44911a5040e4');
/*!40000 ALTER TABLE `craft_matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixblocktypes`
--

DROP TABLE IF EXISTS `craft_matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `craft_matrixblocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_matrixblocktypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixblocktypes`
--

LOCK TABLES `craft_matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocktypes` DISABLE KEYS */;
INSERT INTO `craft_matrixblocktypes` VALUES (1,9,53,'resource image','resourceImage',1,'2015-01-27 15:47:15','2015-01-27 18:00:45','51c502c7-05f5-49fa-945c-5f6076d15ace'),(2,9,54,'resource name','resourceName',2,'2015-01-27 16:10:03','2015-01-27 18:00:45','cd84e836-b983-42f1-93d6-54e542a91c4d'),(3,9,55,'resource description','resourceDescription',3,'2015-01-27 16:10:03','2015-01-27 18:00:45','d5316c1e-67c8-4ca1-92f3-1db7c47fec05'),(5,14,61,'Story Body','storyBody',1,'2015-01-27 16:29:57','2015-01-27 18:58:56','1b928230-65d6-4866-8d71-423ca1d2d589'),(6,14,62,'Story Image','storyImage',2,'2015-01-27 16:30:59','2015-01-27 18:58:56','e44e1086-f0ba-4cb1-99cc-6a77f8d2df48'),(7,14,63,'Story Accent Text','storyAccentText',3,'2015-01-27 16:40:18','2015-01-27 18:58:56','3668dab3-64df-4316-989c-92cabe146d65'),(8,21,40,'Event Name','eventName',1,'2015-01-27 16:48:54','2015-01-27 16:52:48','2e35c53f-2f5e-4115-96c3-e5f896e42502'),(9,21,41,'Event Day & Time','eventDayTime',2,'2015-01-27 16:48:54','2015-01-27 16:52:48','dc5302ac-e7b3-4723-a58c-cadfae1aa74a'),(11,21,42,'Event Location','eventLocation',3,'2015-01-27 16:52:48','2015-01-27 16:52:48','9417dfbe-259b-449e-863d-5ef382d84ed2'),(12,30,59,'Story Blurb Image','storyBlurbImage',1,'2015-01-27 16:57:36','2015-01-27 18:57:48','082a3ffd-931a-4c9e-856a-0904459f1d3f'),(13,30,60,'Story Info','storyInfo',2,'2015-01-27 16:57:36','2015-01-27 18:57:48','0b39c64d-e95d-41ed-a24b-66a7082b9027');
/*!40000 ALTER TABLE `craft_matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixcontent_resourceblocks`
--

DROP TABLE IF EXISTS `craft_matrixcontent_resourceblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixcontent_resourceblocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_resourceName_placeholdername` text COLLATE utf8_unicode_ci,
  `field_resourceDescription_text` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_resourceblocks_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_resourceblocks_locale_fk` (`locale`),
  CONSTRAINT `craft_matrixcontent_resourceblocks_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_resourceblocks_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixcontent_resourceblocks`
--

LOCK TABLES `craft_matrixcontent_resourceblocks` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_resourceblocks` DISABLE KEYS */;
INSERT INTO `craft_matrixcontent_resourceblocks` VALUES (1,8,'en_us',NULL,NULL,'2015-01-27 16:30:08','2015-01-27 17:42:25','d6b616d2-2f91-4648-b1ad-925fd6c91f79'),(2,9,'en_us','number one',NULL,'2015-01-27 16:30:08','2015-01-27 17:42:25','f01d312a-6fdb-4c1c-a706-e82683ae0515'),(3,10,'en_us',NULL,'testing if this working or not','2015-01-27 16:30:08','2015-01-27 17:42:25','fedb5d8b-9fa7-4f87-8ca1-1757a82e4901');
/*!40000 ALTER TABLE `craft_matrixcontent_resourceblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixcontent_sidebareventlink`
--

DROP TABLE IF EXISTS `craft_matrixcontent_sidebareventlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixcontent_sidebareventlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_eventName_eventName` text COLLATE utf8_unicode_ci,
  `field_eventDayTime_eventStartTime` datetime DEFAULT NULL,
  `field_eventLocation_location` text COLLATE utf8_unicode_ci,
  `field_eventDayTime_eventStopTime` datetime DEFAULT NULL,
  `field_eventDayTime_eventDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_sidebareventlink_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_sidebareventlink_locale_fk` (`locale`),
  CONSTRAINT `craft_matrixcontent_sidebareventlink_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_sidebareventlink_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixcontent_sidebareventlink`
--

LOCK TABLES `craft_matrixcontent_sidebareventlink` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_sidebareventlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_matrixcontent_sidebareventlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixcontent_storyblurb`
--

DROP TABLE IF EXISTS `craft_matrixcontent_storyblurb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixcontent_storyblurb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_storyInfo_storyTitle` text COLLATE utf8_unicode_ci,
  `field_storyInfo_storyExcerpt` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_storyblurb_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_storyblurb_locale_fk` (`locale`),
  CONSTRAINT `craft_matrixcontent_storyblurb_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_storyblurb_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixcontent_storyblurb`
--

LOCK TABLES `craft_matrixcontent_storyblurb` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_storyblurb` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_matrixcontent_storyblurb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixcontent_storybody`
--

DROP TABLE IF EXISTS `craft_matrixcontent_storybody`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixcontent_storybody` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_storyTitle_storyTitle` text COLLATE utf8_unicode_ci,
  `field_storyTitle_storySubtitle` text COLLATE utf8_unicode_ci,
  `field_storyBody_storyText` mediumtext COLLATE utf8_unicode_ci,
  `field_storyAccentText_storyAccentText` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_storybody_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_storybody_locale_fk` (`locale`),
  CONSTRAINT `craft_matrixcontent_storybody_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_storybody_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixcontent_storybody`
--

LOCK TABLES `craft_matrixcontent_storybody` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_storybody` DISABLE KEYS */;
INSERT INTO `craft_matrixcontent_storybody` VALUES (2,15,'en_us',NULL,NULL,'<p>Lorem ipsum dolor sit amet, vel cibo autem primis ex, vim in exerci animal dissentiunt. At nemore luptatum tractatos pro. Pri ad forensibus suscipiantur, id apeirian sadipscing per, sed ne gubergren assentior. Ea maiorum consulatu mei. Novum dicant qualisque at mel, pro ea facilisi recusabo inciderint.</p><p>Ignota facilis maiestatis cum ex, iuvaret menandri eleifend ut sit, nec etiam repudiare et. Vix eu alia iudico diceret, vis ei debet decore luptatum. Mel ea malorum cotidieque, dolorum scripserit persequeris eu sit. I<em>n altera ridens ullamcorper sea</em>, duo nisl partem at. Vix audire scripserit te, vocibus fastidii deseruisse quo ei, ex mel dolore cotidieque.</p><p><strong>Possim invidunt usu ut.</strong> Graece explicari appellantur id eum, ne apeirian praesent ullamcorper has, odio eros hendrerit ex nec. Vide suscipit eos in. Brute congue omnium an cum. Id mei assum similique.</p><p>Idque omittantur at eum. Id eum omnes utroque habemus, solet forensibus ut vix. Ridens expetenda referrentur sea in. Et vel graece habemus. Eam eu vero fastidii albucius, dicam perpetua instructior mea an, ius sint omnis option ea. Ad affert quando theophrastus pri, nisl repudiare expetendis eam ad.</p><p>Cu vim minim tempor nusquam. Officiis tincidunt per in. Delectus singulis no mel, cum nulla sapientem consulatu no. Has quis partiendo ea, an vel persecuti assueverit sadipscing, cu ipsum iisque his. Quando doming eirmod vel at, eos id mollis ponderum, eius harum quo at. Sed graeci mollis tritani cu, cu veri propriae dignissim sit.</p>',NULL,'2015-01-27 17:56:11','2015-01-27 17:56:11','4f153285-7f63-4f28-be2a-7fced85acf4f'),(3,16,'en_us',NULL,NULL,NULL,'<h5>Idque omittantur at eum. Id eum omnes utroque habemus, solet forensibus ut vix. Ridens expetenda referrentur sea in. Et vel graece habemus. Eam eu vero fastidii albucius, dicam perpetua instructior mea an, ius sint omnis option ea. Ad affert quando theophrastus pri, nisl repudiare expetendis eam ad.</h5>','2015-01-27 17:56:11','2015-01-27 17:56:11','37806cf1-96e1-468e-ab68-dfab260ad7aa');
/*!40000 ALTER TABLE `craft_matrixcontent_storybody` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_migrations`
--

DROP TABLE IF EXISTS `craft_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_migrations_version_unq_idx` (`version`),
  KEY `craft_migrations_pluginId_fk` (`pluginId`),
  CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_migrations`
--

LOCK TABLES `craft_migrations` WRITE;
/*!40000 ALTER TABLE `craft_migrations` DISABLE KEYS */;
INSERT INTO `craft_migrations` VALUES (1,NULL,'m000000_000000_base','2015-01-25 16:17:42','2015-01-25 16:17:42','2015-01-25 16:17:42','413d36ca-f91b-4629-af64-e7285726838b'),(2,NULL,'m140730_000001_add_filename_and_format_to_transformindex','2015-01-25 16:17:42','2015-01-25 16:17:42','2015-01-25 16:17:42','d6409c1b-5f22-4302-962d-4d4d1727d62e'),(3,NULL,'m140815_000001_add_format_to_transforms','2015-01-25 16:17:42','2015-01-25 16:17:43','2015-01-25 16:17:43','8f6cdc7d-01e6-4ed7-8201-21f3458f2178'),(4,NULL,'m140822_000001_allow_more_than_128_items_per_field','2015-01-25 16:17:42','2015-01-25 16:17:43','2015-01-25 16:17:43','01a4735d-aa7a-4b2a-b443-fc8770078d77'),(5,NULL,'m140829_000001_single_title_formats','2015-01-25 16:17:42','2015-01-25 16:17:43','2015-01-25 16:17:43','7f7daa8f-3334-4529-9428-0d38b1c288e6'),(6,NULL,'m140831_000001_extended_cache_keys','2015-01-25 16:17:42','2015-01-25 16:17:43','2015-01-25 16:17:43','ccb16e0f-5634-4d0e-b80f-b22658a05b27'),(7,NULL,'m140922_000001_delete_orphaned_matrix_blocks','2015-01-25 16:17:42','2015-01-25 16:17:43','2015-01-25 16:17:43','81ee3172-b79c-4d84-b4a0-f376bee2191f'),(8,NULL,'m141008_000001_elements_index_tune','2015-01-25 16:17:42','2015-01-25 16:17:43','2015-01-25 16:17:43','b9c1d8eb-635d-426e-829e-98bd9e5bbc41'),(9,NULL,'m141009_000001_assets_source_handle','2015-01-25 16:17:42','2015-01-25 16:17:43','2015-01-25 16:17:43','d5cdaaca-6416-40ce-a6f8-4b04e36cb370'),(10,NULL,'m141024_000001_field_layout_tabs','2015-01-25 16:17:42','2015-01-25 16:17:43','2015-01-25 16:17:43','8fc9c534-30c1-4d35-82c6-0730dbc39d33'),(11,NULL,'m141030_000001_drop_structure_move_permission','2015-01-25 16:17:42','2015-01-25 16:17:43','2015-01-25 16:17:43','94a487ac-fae1-47ff-bd0c-651b4dcbaade'),(12,NULL,'m141103_000001_tag_titles','2015-01-25 16:17:42','2015-01-25 16:17:43','2015-01-25 16:17:43','8fc87e7c-48c5-41fc-a0ba-941967a87ba7'),(13,NULL,'m141109_000001_user_status_shuffle','2015-01-25 16:17:42','2015-01-25 16:17:43','2015-01-25 16:17:43','3779d525-6c7f-4681-b6c8-d4feb0f36901'),(14,NULL,'m141126_000001_user_week_start_day','2015-01-25 16:17:42','2015-01-25 16:17:43','2015-01-25 16:17:43','0e79f2ae-b9d7-4eea-a9cd-a5c65e389378');
/*!40000 ALTER TABLE `craft_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_plugins`
--

DROP TABLE IF EXISTS `craft_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `version` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8_unicode_ci,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_plugins`
--

LOCK TABLES `craft_plugins` WRITE;
/*!40000 ALTER TABLE `craft_plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_rackspaceaccess`
--

DROP TABLE IF EXISTS `craft_rackspaceaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_rackspaceaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connectionKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storageUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cdnUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_rackspaceaccess_connectionKey_unq_idx` (`connectionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_rackspaceaccess`
--

LOCK TABLES `craft_rackspaceaccess` WRITE;
/*!40000 ALTER TABLE `craft_rackspaceaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_rackspaceaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_relations`
--

DROP TABLE IF EXISTS `craft_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_relations_fieldId_sourceId_sourceLocale_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceLocale`,`targetId`),
  KEY `craft_relations_sourceId_fk` (`sourceId`),
  KEY `craft_relations_sourceLocale_fk` (`sourceLocale`),
  KEY `craft_relations_targetId_fk` (`targetId`),
  CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceLocale_fk` FOREIGN KEY (`sourceLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_relations`
--

LOCK TABLES `craft_relations` WRITE;
/*!40000 ALTER TABLE `craft_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_routes`
--

DROP TABLE IF EXISTS `craft_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urlParts` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urlPattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_routes_urlPattern_unq_idx` (`urlPattern`),
  KEY `craft_routes_locale_idx` (`locale`),
  CONSTRAINT `craft_routes_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_routes`
--

LOCK TABLES `craft_routes` WRITE;
/*!40000 ALTER TABLE `craft_routes` DISABLE KEYS */;
INSERT INTO `craft_routes` VALUES (1,NULL,'[\"stories\\/\",[\"slug\",\"[^\\\\\\/]+\"]]','stories\\/(?P<slug>[^\\/]+)','stories.html',1,'2015-01-27 18:02:52','2015-01-27 18:02:52','fe5704d3-c57b-497a-99aa-99d52e85c745');
/*!40000 ALTER TABLE `craft_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_searchindex`
--

DROP TABLE IF EXISTS `craft_searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`locale`),
  FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_searchindex`
--

LOCK TABLES `craft_searchindex` WRITE;
/*!40000 ALTER TABLE `craft_searchindex` DISABLE KEYS */;
INSERT INTO `craft_searchindex` VALUES (2,'slug',0,'en_us',' homepage '),(2,'title',0,'en_us',' the gathering place '),(2,'field',1,'en_us',' it s true this site doesn t have a whole lot of content yet but don t worry our web developers have just installed the cms and they re setting things up for the content editors this very moment soon tgp d i co will be an oasis of fresh perspectives sharp analyses and astute opinions that will keep you coming back again and again are you like kate '),(2,'field',2,'en_us',''),(13,'slug',0,'en_us',' story 1 '),(13,'title',0,'en_us',' sample story 1 '),(13,'field',30,'en_us',''),(11,'slug',0,'en_us',' story '),(11,'title',0,'en_us',' the gathering place stories '),(11,'field',13,'en_us',''),(11,'field',14,'en_us',''),(11,'field',20,'en_us',''),(11,'field',21,'en_us',''),(11,'field',30,'en_us',''),(11,'field',2,'en_us',''),(7,'slug',0,'en_us',' test resource '),(7,'title',0,'en_us',' test resource '),(7,'field',9,'en_us',' number one testing if this working or not '),(8,'slug',0,'en_us',''),(8,'field',10,'en_us',''),(9,'slug',0,'en_us',''),(9,'field',11,'en_us',' number one '),(10,'slug',0,'en_us',''),(10,'field',12,'en_us',' testing if this working or not '),(4,'username',0,'en_us',' jvanwyhe '),(4,'firstname',0,'en_us',' julie '),(4,'lastname',0,'en_us',' vanwyhe '),(4,'fullname',0,'en_us',' julie vanwyhe '),(4,'email',0,'en_us',' javanwyhe gmail com '),(4,'slug',0,'en_us',''),(5,'username',0,'en_us',' tproctor '),(5,'firstname',0,'en_us',' tim '),(5,'lastname',0,'en_us',' proctor '),(5,'fullname',0,'en_us',' tim proctor '),(5,'email',0,'en_us',' timandcamiproctor gmail com '),(5,'slug',0,'en_us',''),(1,'username',0,'en_us',' thegatheringplaceadmin '),(1,'firstname',0,'en_us',''),(1,'lastname',0,'en_us',''),(1,'fullname',0,'en_us',''),(1,'email',0,'en_us',' branden d i co '),(1,'slug',0,'en_us',''),(13,'field',13,'en_us',''),(13,'field',14,'en_us',' this is a subtitle the story title goes here lorem ipsum dolor sit amet vel cibo autem primis ex vim in exerci animal dissentiunt at nemore luptatum tractatos pro pri ad forensibus suscipiantur id apeirian sadipscing per sed ne gubergren assentior ea maiorum consulatu mei novum dicant qualisque at mel pro ea facilisi recusabo inciderint ignota facilis maiestatis cum ex iuvaret menandri eleifend ut sit nec etiam repudiare et vix eu alia iudico diceret vis ei debet decore luptatum mel ea malorum cotidieque dolorum scripserit persequeris eu sit in altera ridens ullamcorper sea duo nisl partem at vix audire scripserit te vocibus fastidii deseruisse quo ei ex mel dolore cotidieque possim invidunt usu ut graece explicari appellantur id eum ne apeirian praesent ullamcorper has odio eros hendrerit ex nec vide suscipit eos in brute congue omnium an cum id mei assum similique idque omittantur at eum id eum omnes utroque habemus solet forensibus ut vix ridens expetenda referrentur sea in et vel graece habemus eam eu vero fastidii albucius dicam perpetua instructior mea an ius sint omnis option ea ad affert quando theophrastus pri nisl repudiare expetendis eam ad cu vim minim tempor nusquam officiis tincidunt per in delectus singulis no mel cum nulla sapientem consulatu no has quis partiendo ea an vel persecuti assueverit sadipscing cu ipsum iisque his quando doming eirmod vel at eos id mollis ponderum eius harum quo at sed graeci mollis tritani cu cu veri propriae dignissim sit idque omittantur at eum id eum omnes utroque habemus solet forensibus ut vix ridens expetenda referrentur sea in et vel graece habemus eam eu vero fastidii albucius dicam perpetua instructior mea an ius sint omnis option ea ad affert quando theophrastus pri nisl repudiare expetendis eam ad '),(13,'field',20,'en_us',''),(13,'field',21,'en_us',''),(13,'field',2,'en_us',''),(15,'field',17,'en_us',' lorem ipsum dolor sit amet vel cibo autem primis ex vim in exerci animal dissentiunt at nemore luptatum tractatos pro pri ad forensibus suscipiantur id apeirian sadipscing per sed ne gubergren assentior ea maiorum consulatu mei novum dicant qualisque at mel pro ea facilisi recusabo inciderint ignota facilis maiestatis cum ex iuvaret menandri eleifend ut sit nec etiam repudiare et vix eu alia iudico diceret vis ei debet decore luptatum mel ea malorum cotidieque dolorum scripserit persequeris eu sit in altera ridens ullamcorper sea duo nisl partem at vix audire scripserit te vocibus fastidii deseruisse quo ei ex mel dolore cotidieque possim invidunt usu ut graece explicari appellantur id eum ne apeirian praesent ullamcorper has odio eros hendrerit ex nec vide suscipit eos in brute congue omnium an cum id mei assum similique idque omittantur at eum id eum omnes utroque habemus solet forensibus ut vix ridens expetenda referrentur sea in et vel graece habemus eam eu vero fastidii albucius dicam perpetua instructior mea an ius sint omnis option ea ad affert quando theophrastus pri nisl repudiare expetendis eam ad cu vim minim tempor nusquam officiis tincidunt per in delectus singulis no mel cum nulla sapientem consulatu no has quis partiendo ea an vel persecuti assueverit sadipscing cu ipsum iisque his quando doming eirmod vel at eos id mollis ponderum eius harum quo at sed graeci mollis tritani cu cu veri propriae dignissim sit '),(15,'slug',0,'en_us',''),(16,'field',19,'en_us',' idque omittantur at eum id eum omnes utroque habemus solet forensibus ut vix ridens expetenda referrentur sea in et vel graece habemus eam eu vero fastidii albucius dicam perpetua instructior mea an ius sint omnis option ea ad affert quando theophrastus pri nisl repudiare expetendis eam ad '),(16,'slug',0,'en_us','');
/*!40000 ALTER TABLE `craft_searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sections`
--

DROP TABLE IF EXISTS `craft_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enableVersioning` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_name_unq_idx` (`name`),
  UNIQUE KEY `craft_sections_handle_unq_idx` (`handle`),
  KEY `craft_sections_structureId_fk` (`structureId`),
  CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sections`
--

LOCK TABLES `craft_sections` WRITE;
/*!40000 ALTER TABLE `craft_sections` DISABLE KEYS */;
INSERT INTO `craft_sections` VALUES (1,NULL,'Homepage','homepage','single',1,'index',1,'2015-01-25 16:17:44','2015-01-26 22:26:32','7f177e50-81ed-4caa-b939-33614d102797'),(4,2,'Stories','stories','structure',1,'stories/_entry',1,'2015-01-27 15:00:33','2015-01-27 15:00:33','33760345-8b6b-4d1e-ab37-ba415f8d7715'),(5,NULL,'Resources','resources','channel',1,'resources/_entry',1,'2015-01-27 15:28:44','2015-01-27 15:28:44','eacef886-a2b6-4ec4-87a1-8121d14b8cf9');
/*!40000 ALTER TABLE `craft_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sections_i18n`
--

DROP TABLE IF EXISTS `craft_sections_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sections_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `enabledByDefault` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nestedUrlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_i18n_sectionId_locale_unq_idx` (`sectionId`,`locale`),
  KEY `craft_sections_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_sections_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_sections_i18n_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sections_i18n`
--

LOCK TABLES `craft_sections_i18n` WRITE;
/*!40000 ALTER TABLE `craft_sections_i18n` DISABLE KEYS */;
INSERT INTO `craft_sections_i18n` VALUES (1,1,'en_us',0,'__home__',NULL,'2015-01-25 16:17:44','2015-01-26 20:56:28','f8a9649b-87e0-492f-a22e-4a66f7359e47'),(4,4,'en_us',0,'stories/{slug}','{parent.uri}/{slug}','2015-01-27 15:00:33','2015-01-27 15:00:33','867e1edb-2347-441c-8b6e-8984900c957f'),(5,5,'en_us',0,'resources/{slug}',NULL,'2015-01-27 15:28:44','2015-01-27 15:28:44','d8100268-4ac6-4e5f-9d28-7897a5c98a3b');
/*!40000 ALTER TABLE `craft_sections_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sessions`
--

DROP TABLE IF EXISTS `craft_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sessions_uid_idx` (`uid`),
  KEY `craft_sessions_token_idx` (`token`),
  KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `craft_sessions_userId_fk` (`userId`),
  CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sessions`
--

LOCK TABLES `craft_sessions` WRITE;
/*!40000 ALTER TABLE `craft_sessions` DISABLE KEYS */;
INSERT INTO `craft_sessions` VALUES (1,1,'96eb2456a3bd697ac5fb1dd7cc683b614ef37dd1czozNjoiMDg3OTcxZDctZWZlYi00YThhLTgwZTgtNDQwY2NkN2E0ZWI1Ijs=','2015-01-25 16:17:44','2015-01-25 16:17:44','ff74b52c-8529-4e4f-85ee-d80cad897a0d'),(2,1,'e83db3967e689f344955170425ab47bd17e488fcczozNjoiMDZmMDdkMzAtNWE5YS00ODVkLWFlNmQtNGE3OWI2NTYxNWVlIjs=','2015-01-25 17:51:04','2015-01-25 17:51:04','4448a462-73f6-463a-9719-f799ab284ff7'),(4,1,'dbb47d217fee596263326baa50d6d22699dd3ddaczozNjoiOTYzNDNkOGItZjk3NC00OTE3LTk0YzktM2FmZTc3OGJmOTRhIjs=','2015-01-26 14:36:30','2015-01-26 14:36:30','1f8f6bed-8146-4d8e-a89b-14daef9c4b2a'),(5,1,'a992874004f2c1c155e21232eeee188a552c64c4czozNjoiY2YzNzg2MTctNTRlZC00MWFkLWE0ZWYtYmRjNzMwMmQ5OTE3Ijs=','2015-01-26 15:26:52','2015-01-26 15:26:52','0c922f82-5791-4a9c-aae7-d8b54efe0048'),(6,5,'a4d341cca444a05d6ed3dedcc82a9e516071dca8czozNjoiNjk3NTc2NzctMjc3MC00Nzc5LTgyNzAtYTk4ZDFlMmU5NzhkIjs=','2015-01-26 15:35:55','2015-01-26 15:35:55','fd8f5709-8add-43f4-a580-f96a4d8b35c5'),(7,4,'b2d73d48cca73867949add2d5712d0292f0f8856czozNjoiMDU3M2I3ZDItNzk0YS00MTRhLWE3ZmYtYzY3YWJiNzc4NTE2Ijs=','2015-01-26 15:36:17','2015-01-26 17:29:59','f580ab1e-7be5-4529-a59a-e624b40678e0'),(8,4,'d3af36eb00dde631a758345a9bd2762de60a1c22czozNjoiNDYyOTVjNDItYTRkNS00ODA4LWJlY2YtYzM1OGU5OGEyMjk5Ijs=','2015-01-26 17:29:07','2015-01-27 14:34:52','09e5a38e-fdb8-409b-b6d0-5cfe50843a2a'),(9,5,'3d54461b3a060f8388a2492451ad9bbf02359b36czozNjoiNzAzMDE1NTMtYzk3Mi00N2U3LTk1N2EtNDA2ZmYwZWRlNDFkIjs=','2015-01-26 20:23:27','2015-01-26 20:23:27','8877b1c3-e7f9-42fa-82dc-cec01526cb65'),(10,5,'fa01513932ebcdde33115e1e99208c4f058c2cfcczozNjoiMTg3Y2RhNjYtMWY3OS00YzQ0LWE4NzgtYTkxMGM3YjMzOGE1Ijs=','2015-01-27 14:11:31','2015-01-27 14:11:31','84412542-571b-4fea-a2d7-625df22cc858');
/*!40000 ALTER TABLE `craft_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_shunnedmessages`
--

DROP TABLE IF EXISTS `craft_shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_shunnedmessages`
--

LOCK TABLES `craft_shunnedmessages` WRITE;
/*!40000 ALTER TABLE `craft_shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_structureelements`
--

DROP TABLE IF EXISTS `craft_structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `craft_structureelements_root_idx` (`root`),
  KEY `craft_structureelements_lft_idx` (`lft`),
  KEY `craft_structureelements_rgt_idx` (`rgt`),
  KEY `craft_structureelements_level_idx` (`level`),
  KEY `craft_structureelements_elementId_fk` (`elementId`),
  CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_structureelements`
--

LOCK TABLES `craft_structureelements` WRITE;
/*!40000 ALTER TABLE `craft_structureelements` DISABLE KEYS */;
INSERT INTO `craft_structureelements` VALUES (1,2,NULL,1,1,6,0,'2015-01-27 15:25:08','2015-01-27 15:25:08','263c933d-d27f-4edf-8f43-bec32a441993'),(3,2,11,1,2,3,1,'2015-01-27 16:37:10','2015-01-27 16:37:10','1d5a4506-8e20-4a0a-b932-0fc9e6eab6dd'),(5,2,13,1,4,5,1,'2015-01-27 17:06:23','2015-01-27 17:06:23','e5333a5b-211f-4d82-b495-913eb0240b9d');
/*!40000 ALTER TABLE `craft_structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_structures`
--

DROP TABLE IF EXISTS `craft_structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_structures`
--

LOCK TABLES `craft_structures` WRITE;
/*!40000 ALTER TABLE `craft_structures` DISABLE KEYS */;
INSERT INTO `craft_structures` VALUES (2,NULL,'2015-01-27 15:00:33','2015-01-27 15:00:33','5d32dcc6-4efe-43df-9f1b-db185928e0be'),(3,NULL,'2015-01-27 15:55:01','2015-01-27 15:55:01','711b1d66-0eb4-454e-86f7-845602f40398'),(4,NULL,'2015-01-27 15:55:38','2015-01-27 15:55:38','6ccb2e1d-9407-4ec4-a25e-b28a51570bf5'),(5,NULL,'2015-01-27 15:56:22','2015-01-27 15:56:22','d9970faa-d453-45f7-aff8-4c0382edc80e');
/*!40000 ALTER TABLE `craft_structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_systemsettings`
--

DROP TABLE IF EXISTS `craft_systemsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_systemsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_systemsettings_category_unq_idx` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_systemsettings`
--

LOCK TABLES `craft_systemsettings` WRITE;
/*!40000 ALTER TABLE `craft_systemsettings` DISABLE KEYS */;
INSERT INTO `craft_systemsettings` VALUES (1,'email','{\"protocol\":\"php\",\"emailAddress\":\"branden@d-i.co\",\"senderName\":\"The Gathering Place\"}','2015-01-25 16:17:44','2015-01-25 16:17:44','1d32fddc-acb2-4c3e-912b-8c4ab0bf416a');
/*!40000 ALTER TABLE `craft_systemsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_taggroups`
--

DROP TABLE IF EXISTS `craft_taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_taggroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_taggroups_handle_unq_idx` (`handle`),
  KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_taggroups`
--

LOCK TABLES `craft_taggroups` WRITE;
/*!40000 ALTER TABLE `craft_taggroups` DISABLE KEYS */;
INSERT INTO `craft_taggroups` VALUES (1,'Default','default',1,'2015-01-25 16:17:44','2015-01-25 16:17:44','52db1a4a-4692-4637-adfc-56be8088897c');
/*!40000 ALTER TABLE `craft_taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tags`
--

DROP TABLE IF EXISTS `craft_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tags_groupId_fk` (`groupId`),
  CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tags`
--

LOCK TABLES `craft_tags` WRITE;
/*!40000 ALTER TABLE `craft_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tasks`
--

DROP TABLE IF EXISTS `craft_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `currentStep` int(11) unsigned DEFAULT NULL,
  `totalSteps` int(11) unsigned DEFAULT NULL,
  `status` enum('pending','error','running') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tasks_root_idx` (`root`),
  KEY `craft_tasks_lft_idx` (`lft`),
  KEY `craft_tasks_rgt_idx` (`rgt`),
  KEY `craft_tasks_level_idx` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tasks`
--

LOCK TABLES `craft_tasks` WRITE;
/*!40000 ALTER TABLE `craft_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecachecriteria`
--

DROP TABLE IF EXISTS `craft_templatecachecriteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecachecriteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `criteria` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecachecriteria_cacheId_fk` (`cacheId`),
  KEY `craft_templatecachecriteria_type_idx` (`type`),
  CONSTRAINT `craft_templatecachecriteria_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecachecriteria`
--

LOCK TABLES `craft_templatecachecriteria` WRITE;
/*!40000 ALTER TABLE `craft_templatecachecriteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecachecriteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecacheelements`
--

DROP TABLE IF EXISTS `craft_templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `craft_templatecacheelements_cacheId_fk` (`cacheId`),
  KEY `craft_templatecacheelements_elementId_fk` (`elementId`),
  CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecacheelements`
--

LOCK TABLES `craft_templatecacheelements` WRITE;
/*!40000 ALTER TABLE `craft_templatecacheelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecaches`
--

DROP TABLE IF EXISTS `craft_templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecaches_expiryDate_cacheKey_locale_path_idx` (`expiryDate`,`cacheKey`,`locale`,`path`),
  KEY `craft_templatecaches_locale_fk` (`locale`),
  CONSTRAINT `craft_templatecaches_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecaches`
--

LOCK TABLES `craft_templatecaches` WRITE;
/*!40000 ALTER TABLE `craft_templatecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tokens`
--

DROP TABLE IF EXISTS `craft_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_tokens_token_unq_idx` (`token`),
  KEY `craft_tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tokens`
--

LOCK TABLES `craft_tokens` WRITE;
/*!40000 ALTER TABLE `craft_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_usergroups`
--

DROP TABLE IF EXISTS `craft_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_usergroups`
--

LOCK TABLES `craft_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_usergroups_users`
--

DROP TABLE IF EXISTS `craft_usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `craft_usergroups_users_userId_fk` (`userId`),
  CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_usergroups_users`
--

LOCK TABLES `craft_usergroups_users` WRITE;
/*!40000 ALTER TABLE `craft_usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions`
--

DROP TABLE IF EXISTS `craft_userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions`
--

LOCK TABLES `craft_userpermissions` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions_usergroups`
--

DROP TABLE IF EXISTS `craft_userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `craft_userpermissions_usergroups_groupId_fk` (`groupId`),
  CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions_usergroups`
--

LOCK TABLES `craft_userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions_users`
--

DROP TABLE IF EXISTS `craft_userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `craft_userpermissions_users_userId_fk` (`userId`),
  CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions_users`
--

LOCK TABLES `craft_userpermissions_users` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_users`
--

DROP TABLE IF EXISTS `craft_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferredLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weekStartDay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `client` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `suspended` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pending` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIPAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(4) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `verificationCode` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_users_username_unq_idx` (`username`),
  UNIQUE KEY `craft_users_email_unq_idx` (`email`),
  KEY `craft_users_verificationCode_idx` (`verificationCode`),
  KEY `craft_users_uid_idx` (`uid`),
  KEY `craft_users_preferredLocale_fk` (`preferredLocale`),
  CONSTRAINT `craft_users_preferredLocale_fk` FOREIGN KEY (`preferredLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_users`
--

LOCK TABLES `craft_users` WRITE;
/*!40000 ALTER TABLE `craft_users` DISABLE KEYS */;
INSERT INTO `craft_users` VALUES (1,'thegatheringplaceadmin',NULL,NULL,NULL,'branden@d-i.co','$2a$13$McoCQ2XFZ1EMRrEH5RljwOlQY4G24BnOc0bWzAZAl5xjzyHbmGeqS',NULL,0,1,0,0,0,0,0,'2015-01-26 15:26:52','174.77.7.16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2015-01-25 16:17:43','2015-01-25 16:17:43','2015-01-26 15:26:52','3838043b-f60e-43fb-a66b-e266068bef6c'),(4,'jvanwyhe',NULL,'Julie','VanWyhe','javanwyhe@gmail.com','$2a$13$OulJbZPw81T2lYcCQoxaeukCoEHob4sWhY0fOxkcBNEgKRszAe4Ha',NULL,0,1,0,0,0,0,0,'2015-01-26 17:29:07','50.53.241.243',NULL,NULL,'2015-01-26 17:28:57',NULL,NULL,NULL,NULL,0,'2015-01-26 15:36:08','2015-01-26 15:32:46','2015-01-26 17:29:07','9e104e75-5ea1-45ba-8b46-349cf9707be4'),(5,'tproctor',NULL,'Tim','Proctor','timandcamiproctor@gmail.com','$2a$13$2hxv2Imkj82Sn1vppsN7P.HW8pDO1d2bWBe6tEYPYFz3KB7vbmLwm',NULL,0,1,0,0,0,0,0,'2015-01-27 14:11:31','107.19.100.210',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2015-01-26 15:35:43','2015-01-26 15:33:30','2015-01-27 14:11:31','fbf2ad3c-1ee1-468a-ae71-00d252286032');
/*!40000 ALTER TABLE `craft_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_widgets`
--

DROP TABLE IF EXISTS `craft_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_widgets_userId_fk` (`userId`),
  CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_widgets`
--

LOCK TABLES `craft_widgets` WRITE;
/*!40000 ALTER TABLE `craft_widgets` DISABLE KEYS */;
INSERT INTO `craft_widgets` VALUES (1,1,'RecentEntries',1,NULL,1,'2015-01-25 16:17:51','2015-01-25 16:17:51','77292e9e-6f86-41fb-be98-0fdcf8ac3855'),(2,1,'GetHelp',2,NULL,1,'2015-01-25 16:17:51','2015-01-25 16:17:51','225cf480-a676-4bbf-bee1-b64ac489198f'),(3,1,'Updates',3,NULL,1,'2015-01-25 16:17:51','2015-01-25 16:17:51','3caa8f81-744a-42a2-a51f-1b5795e6a3bd'),(4,1,'Feed',4,'{\"url\":\"http:\\/\\/feeds.feedburner.com\\/blogandtonic\",\"title\":\"Blog & Tonic\"}',0,'2015-01-25 16:17:51','2015-01-25 16:54:50','7a14c28e-6599-490d-b7e0-5032c700ff07'),(5,5,'RecentEntries',1,NULL,1,'2015-01-26 15:35:55','2015-01-26 15:35:55','d2457b39-3e52-46cf-b720-8196025059da'),(6,5,'GetHelp',2,NULL,1,'2015-01-26 15:35:55','2015-01-26 15:35:55','5598510b-0241-4d22-b49e-32432da12811'),(7,5,'Updates',3,NULL,0,'2015-01-26 15:35:55','2015-01-26 17:30:20','e8ebf938-5424-4096-85c9-ef0b80f39a7f'),(8,5,'Feed',4,'{\"url\":\"http:\\/\\/feeds.feedburner.com\\/blogandtonic\",\"title\":\"Blog & Tonic\"}',1,'2015-01-26 15:35:55','2015-01-26 15:35:55','7d13d0e2-0393-441c-969c-30a38955da62'),(9,4,'RecentEntries',1,NULL,1,'2015-01-26 15:36:17','2015-01-26 15:36:17','475bc462-efe9-4b68-a046-48957777dd47'),(10,4,'GetHelp',2,NULL,1,'2015-01-26 15:36:17','2015-01-26 15:36:17','ed428f8a-37bd-470d-923c-d37c8e3acec7'),(11,4,'Updates',3,NULL,0,'2015-01-26 15:36:17','2015-01-26 17:30:31','492b8c54-703c-4867-b824-698ced05a454'),(12,4,'Feed',4,'{\"url\":\"http:\\/\\/feeds.feedburner.com\\/blogandtonic\",\"title\":\"Blog & Tonic\"}',1,'2015-01-26 15:36:17','2015-01-26 15:36:17','0c8e33cf-8c5a-45f1-9495-3f05dd9e5f96');
/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-27 19:04:08
