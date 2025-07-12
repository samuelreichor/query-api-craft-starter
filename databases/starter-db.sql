-- MySQL dump 10.13  Distrib 8.0.40, for Linux (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ujptltijxggmyhffjswflmbollvkfqatwqlf` (`primaryOwnerId`),
  CONSTRAINT `fk_junkpdjdkzxihnplierquckfdpdlwroxtpzi` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ujptltijxggmyhffjswflmbollvkfqatwqlf` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_renbqviwcxxcoazcfccmtqtsvystirevvpvh` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_jdioqjtaoclpdseflyzjpgvoqyhvcntlzevy` (`dateRead`),
  KEY `fk_ipeggwmjhlzdecvmzeteeztxocbodqkpmcau` (`pluginId`),
  CONSTRAINT `fk_dlbqgrdygbwdagmpmtmddlrwuewflhiabkcq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ipeggwmjhlzdecvmzeteeztxocbodqkpmcau` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wuozcjphebbprnoacqzixvphsxlkdnsocswx` (`sessionId`,`volumeId`),
  KEY `idx_wzjgojhvhduxbwvkdovaeoyjtluywkelecah` (`volumeId`),
  CONSTRAINT `fk_alhijwositlqilutkfytoegsvrccxhndiavt` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ndntfnrzjomlrovpcecrokhytyayfhdjfxtx` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `mimeType` varchar(255) DEFAULT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rmozlaovqkeyzyvhtokvukaazwjitbgtrozj` (`filename`,`folderId`),
  KEY `idx_ywluhbfxqfngwaiajxncnhflcxcnhsbzmiua` (`folderId`),
  KEY `idx_biidxhpvshnmotuogelvaabmhqcbsbnxvwod` (`volumeId`),
  KEY `fk_zcsakveclojwvmphdepospunonjlvnuuoraw` (`uploaderId`),
  CONSTRAINT `fk_iqkgeogyoapangmjbydhytabqharlyylcrli` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qvwgeoehietwzbjszckvhgvfbodmryppngze` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rgbaayadobualbjpktxemrgnvlhxtdvfxeiq` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zcsakveclojwvmphdepospunonjlvnuuoraw` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_yreccxnhwifbbofahynfkghxxgpsrdxclags` (`siteId`),
  CONSTRAINT `fk_ujycepzqzlcsnupwgmiiddhghafpimqvnxqq` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yreccxnhwifbbofahynfkghxxgpsrdxclags` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ugflimmsdwzdopsedjwyoosahvxskwwpcpbb` (`userId`),
  CONSTRAINT `fk_ugflimmsdwzdopsedjwyoosahvxskwwpcpbb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bulkopevents`
--

DROP TABLE IF EXISTS `bulkopevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkopevents` (
  `key` char(10) NOT NULL,
  `senderClass` varchar(255) NOT NULL,
  `eventName` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`key`,`senderClass`,`eventName`),
  KEY `idx_gntotjqmyfoqvhsdbuutkgkukhsxtbskvhpm` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_hvhmcbiigyxfvmdrtldpoyeqzkqceedxiavi` (`groupId`),
  KEY `fk_neqigkaskrihiehdhaztzfjxsiwxcxhfxsem` (`parentId`),
  CONSTRAINT `fk_ffuczhqgjxauwqifgnegwlxffxcutlpfirpr` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kqbdjsgajofrkvtydyhowhgvqxdzcohkltyx` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_neqigkaskrihiehdhaztzfjxsiwxcxhfxsem` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ktfcdsqhzvvzywnjqtgwohqyvhwkllllwigw` (`name`),
  KEY `idx_enxyvqmxivdnzhhleiycsoqkazytfqghwqhx` (`handle`),
  KEY `idx_etrhadzryzxoqjkibspdpqfxbncpysafoyoo` (`structureId`),
  KEY `idx_zzcdpdnqhjnisjjwpfcawuagwuhwtekxbmcv` (`fieldLayoutId`),
  KEY `idx_prmmlgscwjndbqjvitbsxujzysqzvoqrkbtw` (`dateDeleted`),
  CONSTRAINT `fk_rbsnqysfquhjcsegfwtsejnxmgsqzqzixjgb` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uucgujvxtbhfnvtrjkmgljndmhdaygowmphc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_aytwvytvxhagvujtxyfzyxgllezdwqbqqplj` (`groupId`,`siteId`),
  KEY `idx_mgqvdktihfdlskkrwyqczvkgstfcbkyseffe` (`siteId`),
  CONSTRAINT `fk_hnpfneioomwpdfqeqxeaqhazgtutpfwcqmyo` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yxirvudbtuubewtvmakjqriydnwsycimwojy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_bfmsgphaocrodlwmhbnmaxlnhpjfcqjdtlsj` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_cltlunjlhstqerwufbmsqdknubaghumxjlkd` (`siteId`),
  KEY `fk_smchjfpnlgqwwmztcbtbxeeuxqopxpyvraqg` (`userId`),
  CONSTRAINT `fk_cltlunjlhstqerwufbmsqdknubaghumxjlkd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_jpwyxxxuonimekfibtjpfadwnejseaterljr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_smchjfpnlgqwwmztcbtbxeeuxqopxpyvraqg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_tassbuiezoekbnvvkhlzazknkjerchddifdy` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_zfjouhglpwobfljxbpayzwgthdbqocgppfjs` (`siteId`),
  KEY `fk_fnjzwuubvmsdqqarqvqwlkczmjuvdbebnvhd` (`fieldId`),
  KEY `fk_vtvivgfmbljxqlmxezjowzqxnljredphlshm` (`userId`),
  CONSTRAINT `fk_aciwngvkkqeygejbziqxlcoadcghzspmfsqc` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_fnjzwuubvmsdqqarqvqwlkczmjuvdbebnvhd` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vtvivgfmbljxqlmxezjowzqxnljredphlshm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_zfjouhglpwobfljxbpayzwgthdbqocgppfjs` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contentblocks`
--

DROP TABLE IF EXISTS `contentblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_idibeapqdurxzzawghszwavlpcotvlvtgbqb` (`primaryOwnerId`),
  KEY `idx_xnsonjtidqrhdsazfvewkxkgecljlggjtzch` (`fieldId`),
  CONSTRAINT `fk_aoygfbsuoezvhzsxtevasltsdocsaonadlqb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nzsumzjmiibywspwdvohatvbbbdgpdukjnxw` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_owihscceemjvvkdlzwgtsvxrkgauikujpvmh` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_mitzkwwsgkhmfpxbwxqscreezlqeplvonfnm` (`userId`),
  CONSTRAINT `fk_mitzkwwsgkhmfpxbwxqscreezlqeplvonfnm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qnlklalfsektyfnjnmnaoqzzpjkrkdwldzap` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_vqzaodjoivfoducqfkqjlzjfgamnopkwxzsk` (`creatorId`,`provisional`),
  KEY `idx_lrbpughhhiepyjwzjcojbpaskqxenhtdkolm` (`saved`),
  KEY `fk_hirsvnzitnyhqjdfvrkbfaizxaqthambdvna` (`canonicalId`),
  CONSTRAINT `fk_hirsvnzitnyhqjdfvrkbfaizxaqthambdvna` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hlmpflolwlcvyxfwfgsbzbndymxotqbsuzjz` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_zqyaofglfwnlcivdcrbvkpxvfeesesqtxarv` (`elementId`,`timestamp`,`userId`),
  KEY `fk_ztdynzttsvltpbekxbbzydiayaigmqsptfgq` (`userId`),
  KEY `fk_qsjhsgwooxeuiirracxrmhofvhvmpoqielov` (`siteId`),
  KEY `fk_xhllvdgxsgdmaujelmtljzolqbgemummqoti` (`draftId`),
  CONSTRAINT `fk_npqtcatrbixtchhlcfzhjyrpbclsvitwtcdz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qsjhsgwooxeuiirracxrmhofvhvmpoqielov` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xhllvdgxsgdmaujelmtljzolqbgemummqoti` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ztdynzttsvltpbekxbbzydiayaigmqsptfgq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_etizfldrknuujudzyjxehilefarboumbsfuc` (`dateDeleted`),
  KEY `idx_emymkgcsckaigqfccgtnywhydnpeyhjeojck` (`fieldLayoutId`),
  KEY `idx_atkbvlxgltddcazngnlgdeqtdzdmrbhlsqpt` (`type`),
  KEY `idx_rdroglgdbpdplokxdiszryzggmykldhsbrze` (`enabled`),
  KEY `idx_foagvurtmkfksvqwqthfmmnaxccwrttscjea` (`canonicalId`),
  KEY `idx_hqwjukubopmridzfplnqrtcximjnfeeppwfq` (`archived`,`dateCreated`),
  KEY `idx_tnbmnrsurdzmwfnqyrvxgauzdqvjecdtnbok` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_iemaqhirpvyvpnfufmsibawhvhhqzcxkjpqp` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_griyirpaffcjjfwxnjnjavyymxdehurvtquh` (`draftId`),
  KEY `fk_tcfrlvnenzvtjdaodugaedvirgrancdqxlli` (`revisionId`),
  CONSTRAINT `fk_fwlrqsrcvoqzuidtrzgtibgcnczbfpdvdjif` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_griyirpaffcjjfwxnjnjavyymxdehurvtquh` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_larzumfwwhzmrmtmawhqllrsnpmiwepcqopy` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tcfrlvnenzvtjdaodugaedvirgrancdqxlli` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_xyqmanleeqoqcbxezroxiwwflfrpodmisgsu` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_peduakuaumjamxcqdjlivinihthfutouvigc` (`ownerId`),
  CONSTRAINT `fk_peduakuaumjamxcqdjlivinihthfutouvigc` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qptuhsxzfbwfteiwrhzghtbvnyvxsfglcnso` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_owuyjhpmesvqmuhcdvqtkvvuaixtwmeleeye` (`elementId`,`siteId`),
  KEY `idx_mftpqolvnkwqgnecwnsyrllutnvexeydtspe` (`siteId`),
  KEY `idx_ovaxgoyqnbizcyoyroznlovlexggogdpgxsc` (`title`,`siteId`),
  KEY `idx_qnutmbzbjrmxpbugunnkqbbbzvfhivryxsqb` (`slug`,`siteId`),
  KEY `idx_isorhzdkuqowvhtfyqiujiwboxcekmvaepxb` (`enabled`),
  KEY `idx_fgtedypbqxpkwfuozlatyfecplupfvaohrgl` (`uri`,`siteId`),
  CONSTRAINT `fk_hkwadfudkugcxqkjedrsqmisldppjbrbzojz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_utrgebafqlvzxjcszcqojklrrabygnrbiepb` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `status` enum('live','pending','expired') NOT NULL DEFAULT 'live',
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_hpgfmmhblitlorayivizlzvmqlpiakkvnlap` (`postDate`),
  KEY `idx_nyqmszdaouqfkipwrkbvdrqegzqswhswpiyi` (`expiryDate`),
  KEY `idx_egdnukqhxhdkfhkquebuflzdodawvotogdlr` (`status`),
  KEY `idx_ryzmwrmxifsoidbifczwnqczgonbrunyppcr` (`sectionId`),
  KEY `idx_wqeesxrbgbiahnelukkjeyfulrqdmehqzpow` (`typeId`),
  KEY `idx_entvsijknpgavilalrtkgbdrlvpqpvuecoho` (`primaryOwnerId`),
  KEY `idx_mzinbrgcpnllyvoecszgaeczvlmwrloioodm` (`fieldId`),
  KEY `fk_ugdngevwospdbweyrqlqhbnsltwxgvvpxsaw` (`parentId`),
  CONSTRAINT `fk_erepkzyzjdtkbpaxyearfkwpuknnlkrahmpv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hkvrimzmniegwkydykiqfiqyxprkujxnwbbt` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mdnyvinrlmwbuhdtmuyegbvrquekzcwwecki` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_phrsswusjrzbgtpiyjlwcgflfelneuamuqma` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qvoutgwfgzzyxeuoseffsibodqnkquoshixz` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ugdngevwospdbweyrqlqhbnsltwxgvvpxsaw` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_zlklazmpwcnrcmkjwyszgoxfwtvanhghkews` (`authorId`),
  KEY `idx_oyomhhtulaibqfwautwcudzjostipypvxbjc` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_nnrgnqtstizyyztysitahagjqsfigjbcejin` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wcmxnzknwhzkcvuqwftrlgsvmowvabporrev` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vckpogviadtjeeqmhsdygewqvzxklnaodrxj` (`fieldLayoutId`),
  KEY `idx_qjllkllcpaeonokhtwghynynbsvjjgjmricy` (`dateDeleted`),
  CONSTRAINT `fk_zcyhffjtthwolkbhsldomvrpyemvkhpomlgh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ifeunzxeeizavnqtrpsxkwmplbsjxxljdtdm` (`dateDeleted`),
  KEY `idx_btmzidlcpcnbhroirnauiqmkdgfbckifkijo` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_egpfvxaovdwfywzixlohqyzuelgihkssdqtq` (`handle`,`context`),
  KEY `idx_iqgfjwsgzhpzunhmfjfwfiahbprhgpunceuv` (`context`),
  KEY `idx_ellkikuoblrjhiolszqxpvcrclghjlklkiau` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ynsxtciaxxodcnlqggklqpoyfxevenxlehok` (`name`),
  KEY `idx_ymyzzufaoqgtakcijhpulumzmrikabtatrzv` (`handle`),
  KEY `idx_tcapexlmgqymziprswzvmltrcwqptggktlaz` (`fieldLayoutId`),
  KEY `idx_yyllgjvzmjuamedmwpkzikjxpcaicsnbukbl` (`sortOrder`),
  CONSTRAINT `fk_rsshdffzzofleyhkfodqkqrofdrkghgpnomh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wletfppclpwswbvckxvejgtzqctlzyvhbsjb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zgznntovlvpbufpmzedgvpphsfxmaugmndni` (`accessToken`),
  UNIQUE KEY `idx_tzpvuijptxxgtvqexrribxulkouxbwfkecnu` (`name`),
  KEY `fk_vpifivrgvgkudfkuaueupnwpazxnwgjqcuum` (`schemaId`),
  CONSTRAINT `fk_vpifivrgvgkudfkuaueupnwpazxnwgjqcuum` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fhjtrupihwxkonyxvfewcfcfvslkhbxkqdvt` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bdxjeybusmcnwjtnwuhdyftklupfeunanagy` (`name`),
  KEY `idx_cqpghlyididcigtjpczvazyubvfsahocrcvw` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dzoxzztkkjlqumotoxudyefjfawxvsinszbn` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gijlivgtouliztetoaqmzjtretvxwuwxysqw` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `query_api_schemas`
--

DROP TABLE IF EXISTS `query_api_schemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query_api_schemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `scope` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `query_api_tokens`
--

DROP TABLE IF EXISTS `query_api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query_api_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `schemaId` varchar(255) DEFAULT NULL,
  `accessToken` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_rdqtjlanvxbykrewevmgtfdqgqauokcoysje` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_ueujqrlphfszrdyefeoricenoyzwsogybrwv` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=978 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_stzrynuadkuftyejymrbtkjvdnxwrlaxzmrd` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_reiapxobakmfypvhhvwpdzpyzrpwncnokplf` (`sourceId`),
  KEY `idx_zufevuleivqttfutdpgluzxtxcifdfdlksrf` (`targetId`),
  KEY `idx_fxvwvqufmyvpydyjonopaszvjxbwkdvbisca` (`sourceSiteId`),
  CONSTRAINT `fk_nlbmhykuccwstwbqpovyadsghizvkgneumss` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qfjsngjrjzklkeubxezvruojyhmrmylxpfed` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wqydllebflvnpfwnadnblrbmlersqtdqgttd` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uqqucejtfskgsiqycalzymwckpfidtsswruv` (`canonicalId`,`num`),
  KEY `fk_punoapfvolwgusgfpkriqqcrsmorfeqoomuw` (`creatorId`),
  CONSTRAINT `fk_dtipdaownmqbwwxyqlpdautnxgsskqhkarpv` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_punoapfvolwgusgfpkriqqcrsmorfeqoomuw` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_dzvcykryypxooxufnvrlzoagjdjxrtizcmno` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindexqueue`
--

DROP TABLE IF EXISTS `searchindexqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `reserved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ygohhvelobseljtpmqmwzqcosgfbnilerpng` (`elementId`,`siteId`,`reserved`),
  CONSTRAINT `fk_dguqtnzzeuttoqiwswtkbsaqsvglzsbsryja` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindexqueue_fields`
--

DROP TABLE IF EXISTS `searchindexqueue_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue_fields` (
  `jobId` int NOT NULL,
  `fieldHandle` varchar(255) NOT NULL,
  PRIMARY KEY (`jobId`,`fieldHandle`),
  UNIQUE KEY `idx_qsetasqoyzhgvezdpripebxrzfvycwpjmtgu` (`jobId`,`fieldHandle`),
  CONSTRAINT `fk_rmxwymjxyhahzbsawwqxyniyiouykcskreev` FOREIGN KEY (`jobId`) REFERENCES `searchindexqueue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned DEFAULT NULL,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gmimzfgtddmwxpjvdxqkkhufledsafodjjqo` (`handle`),
  KEY `idx_slecegpaungcoklezzyluhgsgrofkknfinhj` (`name`),
  KEY `idx_atabvdvuezfhzltrlhomozoxrnspthkkfhrm` (`structureId`),
  KEY `idx_vmqjzhgfhmpauogkkbagioppfsfgspwirujn` (`dateDeleted`),
  CONSTRAINT `fk_zqglmdhwppxcadvxkhacidomtlwljpwuqdys` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_ytyyutwnlauqrjhtiitgxlrxlxegnpndoilc` (`typeId`),
  CONSTRAINT `fk_irlmunyeeplpmdnmrueekrqvyuudhplxxjep` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ytyyutwnlauqrjhtiitgxlrxlxegnpndoilc` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gqylnmhmmcpjekcrkswwardzejemhfopasgp` (`sectionId`,`siteId`),
  KEY `idx_ufonqrdkwyxydjkhdqvcfebdsahijuyghkvf` (`siteId`),
  CONSTRAINT `fk_sjtkqbekfqfwhnoqqpsibcujuvknjodexdsy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wlovaxjcyrlsuaqhtbzpfzpxdhuktchbgpee` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mclnylumbpghkrldvhwidodfefzjrvcccfde` (`uid`),
  KEY `idx_svhzbiqkauwdsevtgwqlhfvwmwlpfvwjcost` (`token`),
  KEY `idx_crvukgjwfngwcyytxfhzllbpspugszqlbijm` (`dateUpdated`),
  KEY `idx_vdbeyrpijsnrponumiiowsnpqryhielyraqn` (`userId`),
  CONSTRAINT `fk_zictbzznenweqzjpmpxvwzlwcibkpqulahfg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_smzwfnmnkzwinsahzulklkpsvpicoqohsnlj` (`userId`,`message`),
  CONSTRAINT `fk_nyppdpvqlsqlrlemkqdxyyhqlmbepbnvyhnj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hgjjbmbjkwjkfklvzlpibvjgqxbcwpytvljr` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sigtcypqgxddtljdjhjrtfylhlwmfubcuuom` (`dateDeleted`),
  KEY `idx_ofuuxoxckptbdqvwoswxlyqiffehgtcmqrot` (`handle`),
  KEY `idx_zedyklmoyeqjotjcarlzfsexkuiwudkelisy` (`sortOrder`),
  KEY `fk_nsnyoencgsrwremusgeuqscgcfrsdcsgmynz` (`groupId`),
  CONSTRAINT `fk_nsnyoencgsrwremusgeuqscgcfrsdcsgmynz` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_taszglmcjrqgdzuuqeosxgtfvimaqspqbjam` (`userId`),
  CONSTRAINT `fk_taszglmcjrqgdzuuqeosxgtfvimaqspqbjam` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lmffrngigivpuovxqvykurmwfgawcmuyvexp` (`structureId`,`elementId`),
  KEY `idx_rcyukrocuviratchbnkaclvcucvmmsqhaivz` (`root`),
  KEY `idx_mpldvlbbtycqosmqjudjoksmflvborvphaey` (`lft`),
  KEY `idx_biceqzbwyivwrbkjdgzqegkpyydntfjkgjix` (`rgt`),
  KEY `idx_jlntnnyqoiqwluahbbwamicyswrjibpusbap` (`level`),
  KEY `idx_qaedthigjryppdlljlsohyjbcmnfllcigfkk` (`elementId`),
  CONSTRAINT `fk_hixooeskasdebivcycpdvsulmqbvwgubhflh` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mlmksdwtivoybiilhwnfpkaajzmjojvgsutp` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vxiedjgkixzikiomabkxeuaotcpfbfwhgfiy` (`key`,`language`),
  KEY `idx_qydrkqvnfahzxsjudvbvyehqgqefvbnwjceb` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mkrhqrxwipsdrloczuikunfpkhzxbrabveaq` (`name`),
  KEY `idx_yrdlpyrdeqxqoifzpggwtmetklifseoxlkhp` (`handle`),
  KEY `idx_mlxwlpviiajvlwofkeyazejhykjvwtitrzdz` (`dateDeleted`),
  KEY `fk_obsryukyqkmyifquuaiqrmnakgohckmsxjdt` (`fieldLayoutId`),
  CONSTRAINT `fk_obsryukyqkmyifquuaiqrmnakgohckmsxjdt` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ntwfyuzksxrwjyzmpigksgtiadgplxnishik` (`groupId`),
  CONSTRAINT `fk_idhcxbbvysrvzskvbzwcoxkcsnjqrqheaejs` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kxhkdklrdqtvtwzcwdvulsuxmumvfldvwkfy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kshcdwsvoijqtmaskuqottfzssujugsxccyw` (`token`),
  KEY `idx_pxsopctynqojuqtneawamlskudcvkhlavdqo` (`expiryDate`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mcinlxjthnerysfwqfrtwvdfpsfindmdssdc` (`handle`),
  KEY `idx_mwhdjtcndmyfviguawzcyorwidthfsevyruf` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ckzjysojzvuslisfcqcxdyoomfdfdswwksws` (`groupId`,`userId`),
  KEY `idx_ltacgexowywjqifkdzlkvgfdqpisqfklzdbd` (`userId`),
  CONSTRAINT `fk_dsmpucylhybsesznkwpwxfvhgwqistdepgdm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mhcrtsflnfqmzteysigsllmnexmtthsforga` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mggxpnbarywqrcsctuijgxsvipnxkxlcpcjo` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_serxsxqrawngmigtjlkaizfkijqvkqahxxsi` (`permissionId`,`groupId`),
  KEY `idx_rldfnjqurelgbfpedriritlceouyvinvjizv` (`groupId`),
  CONSTRAINT `fk_hkukljioulyfnsdmukowounnzrxowqyfxvti` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vnvumvbgdwkcdzivlksuulpcxburyydjybmy` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ljaijxxqmehswdlbdyglkvjykidympdoftqm` (`permissionId`,`userId`),
  KEY `idx_dqhmeifivcprtaychtuewdyhuxiwrqtpormq` (`userId`),
  CONSTRAINT `fk_iaftziahxssofukdhexjwupqmtrswgtrakpn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ygoretuzlitvamjovrdmukqxizxdzjchrmxv` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_nwenhphipmzygmnhyninylhjlqpgjgvbhorg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `affiliatedSiteId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_owoheuzkesxeffxajwrlrjjqjhrcmwndliij` (`active`),
  KEY `idx_kjmopiyfyzmpizqtqpgizpsckqtbcccvlirt` (`locked`),
  KEY `idx_mkdrnzaxciqgebrekhmqfuxeprewtusljtnb` (`pending`),
  KEY `idx_eeppdtgwjpxezrfmqbvfybggjorktbiisymt` (`suspended`),
  KEY `idx_ujpxnojmxpjkvzfprbyyvbxiitokolwyyewy` (`verificationCode`),
  KEY `idx_lpqczdwiywkklzyfwwdqjrtpapjdltuaugvh` (`email`),
  KEY `idx_rvczccovuqcidjizrrsdpbvpagbfwltwznea` (`username`),
  KEY `fk_isexlhyvztjwjpqmokmnfrvxdbaoxpelypca` (`photoId`),
  KEY `fk_zaeykvktrpovickuszkdrsdpuegyiluzwyuw` (`affiliatedSiteId`),
  CONSTRAINT `fk_hpxabgyaxcesswngqwwedorllvrdtnuytizx` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_isexlhyvztjwjpqmokmnfrvxdbaoxpelypca` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zaeykvktrpovickuszkdrsdpuegyiluzwyuw` FOREIGN KEY (`affiliatedSiteId`) REFERENCES `sites` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fntttgagsfroltiimdhcpajucyijjbjvcvfe` (`name`,`parentId`,`volumeId`),
  KEY `idx_cycqdsgkidkztftqraoovmrrvvxjbuegdgwx` (`parentId`),
  KEY `idx_ohejmdmqqwolygdowbwtdtqhyzmycjnwxedo` (`volumeId`),
  CONSTRAINT `fk_fgxnaqanhjjjudimpjflnzumogcofnjchezg` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xdcjcxweqrabnqcuwoiqmzymqjkqdqswvysf` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vruzxyrxckaizgnzlyoevjikmtlajssvbvjh` (`name`),
  KEY `idx_ycgolotwkaxutsduhytvuuzbqgkncvjhebxa` (`handle`),
  KEY `idx_fralfrkcidicnmccsyvtgzeophqzzfgglzsi` (`fieldLayoutId`),
  KEY `idx_wnqfxeidtertnnmruluiclrsedswcnmqtnle` (`dateDeleted`),
  CONSTRAINT `fk_ukslwqarbfkwuongwnikmexbfxbzfcflnkxa` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_wvkzpbhaplsetmuycxqbrwxyodhbbpjrmeqd` (`userId`),
  CONSTRAINT `fk_wvkzpbhaplsetmuycxqbrwxyodhbbpjrmeqd` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yfaagxogitkvkqpuvpiypdkbqqpadrkebcds` (`userId`),
  CONSTRAINT `fk_kjyenbymdohsnulomeohdayqufanqhzdtezq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-12 15:56:25
-- MySQL dump 10.13  Distrib 8.0.40, for Linux (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (11,1,1,1,'garfield2.jpg','image/jpeg','image',NULL,1280,853,61494,NULL,NULL,NULL,'2025-07-12 09:51:44','2025-07-12 09:51:44','2025-07-12 09:51:44'),(23,1,1,1,'garfield.webp','image/webp','image',NULL,1080,719,32396,NULL,NULL,NULL,'2025-07-12 09:52:34','2025-07-12 09:52:34','2025-07-12 09:52:34'),(25,1,1,1,'black-white.jpg','image/jpeg','image',NULL,612,408,18403,NULL,NULL,NULL,'2025-07-12 09:52:56','2025-07-12 09:52:56','2025-07-12 09:52:56');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets_sites` VALUES (11,1,NULL),(11,2,NULL),(11,3,NULL),(23,1,NULL),(23,2,NULL),(23,3,NULL),(25,1,NULL),(25,2,NULL),(25,3,NULL);
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `bulkopevents`
--

LOCK TABLES `bulkopevents` WRITE;
/*!40000 ALTER TABLE `bulkopevents` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `bulkopevents` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (12,1,'title','2025-07-12 09:58:05',0,1),(12,2,'slug','2025-07-12 09:55:08',0,1),(12,2,'title','2025-07-12 09:57:48',0,1),(12,3,'title','2025-07-12 09:57:37',0,1),(13,1,'title','2025-07-12 13:24:29',0,1),(13,2,'title','2025-07-12 13:24:29',1,1),(13,3,'title','2025-07-12 13:24:29',1,1),(14,2,'title','2025-07-12 09:58:26',0,1),(14,3,'title','2025-07-12 09:58:49',0,1),(15,1,'title','2025-07-12 13:24:29',0,1),(15,2,'title','2025-07-12 13:24:29',1,1),(15,3,'title','2025-07-12 13:24:29',1,1),(28,2,'title','2025-07-12 09:55:25',0,1),(28,3,'title','2025-07-12 09:57:37',0,1),(65,1,'postDate','2025-07-12 10:09:28',1,1),(65,1,'slug','2025-07-12 10:10:19',0,1),(65,1,'title','2025-07-12 10:10:19',0,1),(65,1,'uri','2025-07-12 10:09:28',1,1),(65,2,'postDate','2025-07-12 10:09:28',0,1),(65,2,'slug','2025-07-12 10:09:28',0,1),(65,2,'title','2025-07-12 10:08:19',0,1),(65,2,'uri','2025-07-12 10:09:28',0,1),(65,3,'postDate','2025-07-12 10:09:28',1,1),(65,3,'title','2025-07-12 10:11:12',0,1),(65,3,'uri','2025-07-12 10:09:28',1,1),(66,1,'slug','2025-07-12 10:08:53',1,1),(66,1,'title','2025-07-12 10:10:19',0,1),(66,2,'postDate','2025-07-12 10:08:50',0,1),(66,2,'slug','2025-07-12 10:08:53',0,1),(66,2,'status','2025-07-12 10:08:50',0,1),(66,2,'title','2025-07-12 10:08:53',0,1),(66,3,'slug','2025-07-12 10:08:53',1,1),(66,3,'title','2025-07-12 10:11:12',0,1),(67,1,'title','2025-07-12 13:24:40',0,1),(67,2,'postDate','2025-07-12 10:08:54',0,1),(67,2,'status','2025-07-12 10:08:54',0,1),(67,2,'title','2025-07-12 13:24:40',1,1),(67,3,'title','2025-07-12 13:24:40',1,1),(68,1,'slug','2025-07-12 10:09:09',1,1),(68,1,'title','2025-07-12 10:10:19',0,1),(68,2,'postDate','2025-07-12 10:09:04',0,1),(68,2,'slug','2025-07-12 10:09:09',0,1),(68,2,'status','2025-07-12 10:09:04',0,1),(68,2,'title','2025-07-12 10:09:09',0,1),(68,3,'slug','2025-07-12 10:09:09',1,1),(68,3,'title','2025-07-12 10:11:12',0,1),(69,1,'title','2025-07-12 13:24:40',0,1),(69,2,'postDate','2025-07-12 10:09:10',0,1),(69,2,'status','2025-07-12 10:09:10',0,1),(69,2,'title','2025-07-12 13:24:40',1,1),(69,3,'title','2025-07-12 13:24:40',1,1),(95,1,'postDate','2025-07-12 10:12:28',1,1),(95,1,'slug','2025-07-12 10:13:17',0,1),(95,1,'title','2025-07-12 10:13:17',0,1),(95,1,'uri','2025-07-12 10:12:28',1,1),(95,2,'postDate','2025-07-12 10:12:28',0,1),(95,2,'slug','2025-07-12 10:12:28',0,1),(95,2,'title','2025-07-12 10:11:29',0,1),(95,2,'uri','2025-07-12 10:12:28',0,1),(95,3,'postDate','2025-07-12 10:12:28',1,1),(95,3,'title','2025-07-12 10:14:11',0,1),(95,3,'uri','2025-07-12 10:12:28',1,1),(96,1,'slug','2025-07-12 10:11:49',1,1),(96,1,'title','2025-07-12 10:13:17',0,1),(96,2,'postDate','2025-07-12 10:11:47',0,1),(96,2,'slug','2025-07-12 10:11:49',0,1),(96,2,'status','2025-07-12 10:11:47',0,1),(96,2,'title','2025-07-12 10:11:49',0,1),(96,3,'slug','2025-07-12 10:11:49',1,1),(96,3,'title','2025-07-12 10:14:11',0,1),(97,1,'title','2025-07-12 13:24:40',0,1),(97,2,'postDate','2025-07-12 10:11:49',0,1),(97,2,'status','2025-07-12 10:11:49',0,1),(97,2,'title','2025-07-12 13:24:40',1,1),(97,3,'title','2025-07-12 13:24:40',1,1),(98,1,'title','2025-07-12 13:24:40',0,1),(98,2,'postDate','2025-07-12 10:11:56',0,1),(98,2,'status','2025-07-12 10:11:56',0,1),(98,2,'title','2025-07-12 13:24:40',1,1),(98,3,'title','2025-07-12 13:24:40',1,1),(99,1,'slug','2025-07-12 10:12:07',1,1),(99,1,'title','2025-07-12 10:13:17',0,1),(99,2,'postDate','2025-07-12 10:12:00',0,1),(99,2,'slug','2025-07-12 10:12:07',0,1),(99,2,'status','2025-07-12 10:12:00',0,1),(99,2,'title','2025-07-12 10:12:07',0,1),(99,3,'slug','2025-07-12 10:12:07',1,1),(99,3,'title','2025-07-12 10:14:11',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (2,1,2,'a38c9b54-55c5-46a3-8316-1f60ef0cbf3a','2025-07-12 09:53:05',0,1),(2,1,3,'33e6414d-6cb4-40b1-a5c8-abee23254b4c','2025-07-12 13:00:11',0,1),(2,1,4,'7191be35-c90c-4355-9560-eae1c4b2f7fb','2025-07-12 10:26:32',0,1),(2,1,5,'1542ed19-45ce-470b-9701-0eda7b118b8b','2025-07-12 09:51:54',0,1),(2,2,2,'a38c9b54-55c5-46a3-8316-1f60ef0cbf3a','2025-07-12 09:53:05',1,1),(2,2,3,'33e6414d-6cb4-40b1-a5c8-abee23254b4c','2025-07-12 09:55:08',0,1),(2,2,4,'7191be35-c90c-4355-9560-eae1c4b2f7fb','2025-07-12 10:23:36',0,1),(2,2,5,'1542ed19-45ce-470b-9701-0eda7b118b8b','2025-07-12 09:55:08',0,1),(2,3,2,'a38c9b54-55c5-46a3-8316-1f60ef0cbf3a','2025-07-12 09:53:05',1,1),(2,3,3,'33e6414d-6cb4-40b1-a5c8-abee23254b4c','2025-07-12 09:57:37',0,1),(2,3,4,'7191be35-c90c-4355-9560-eae1c4b2f7fb','2025-07-12 10:26:41',0,1),(2,3,5,'1542ed19-45ce-470b-9701-0eda7b118b8b','2025-07-12 09:57:37',0,1),(13,1,3,'8abac79e-53f3-4592-bbd2-96ce5cb94584','2025-07-12 10:25:52',0,1),(13,2,3,'8abac79e-53f3-4592-bbd2-96ce5cb94584','2025-07-12 10:23:36',0,1),(13,3,3,'8abac79e-53f3-4592-bbd2-96ce5cb94584','2025-07-12 10:26:07',0,1),(14,1,3,'0c94d65a-180c-4670-a2cd-e3d5b0fcdcab','2025-07-12 10:26:32',0,1),(14,2,3,'0c94d65a-180c-4670-a2cd-e3d5b0fcdcab','2025-07-12 10:23:36',0,1),(14,3,3,'0c94d65a-180c-4670-a2cd-e3d5b0fcdcab','2025-07-12 10:26:41',0,1),(15,1,2,'e2966306-abe9-4cd0-a63f-1cc76dfd8547','2025-07-12 09:53:05',0,1),(15,2,2,'e2966306-abe9-4cd0-a63f-1cc76dfd8547','2025-07-12 09:53:05',1,1),(15,3,2,'e2966306-abe9-4cd0-a63f-1cc76dfd8547','2025-07-12 09:53:05',1,1),(65,1,2,'e477a46a-3858-4d77-9bf0-818e96c4dd91','2025-07-12 10:10:19',0,1),(65,1,3,'9df6cca2-8b86-4950-8eb0-cab6ce593922','2025-07-12 10:10:19',0,1),(65,1,4,'b7719d9b-d4f4-4779-a41d-64f91a435ae2','2025-07-12 10:10:19',0,1),(65,1,5,'3ff10faa-aafd-4ec0-b638-c97e642e0a8c','2025-07-12 10:10:19',0,1),(65,2,2,'e477a46a-3858-4d77-9bf0-818e96c4dd91','2025-07-12 10:09:24',0,1),(65,2,3,'9df6cca2-8b86-4950-8eb0-cab6ce593922','2025-07-12 10:08:42',0,1),(65,2,4,'b7719d9b-d4f4-4779-a41d-64f91a435ae2','2025-07-12 10:09:15',0,1),(65,2,5,'3ff10faa-aafd-4ec0-b638-c97e642e0a8c','2025-07-12 10:08:32',0,1),(65,3,2,'e477a46a-3858-4d77-9bf0-818e96c4dd91','2025-07-12 10:11:12',0,1),(65,3,3,'9df6cca2-8b86-4950-8eb0-cab6ce593922','2025-07-12 10:11:12',0,1),(65,3,4,'b7719d9b-d4f4-4779-a41d-64f91a435ae2','2025-07-12 10:11:12',0,1),(65,3,5,'3ff10faa-aafd-4ec0-b638-c97e642e0a8c','2025-07-12 10:11:12',0,1),(66,1,1,'18d710b6-1115-495c-bbd2-fadc532253d8','2025-07-12 10:09:15',1,1),(66,2,1,'18d710b6-1115-495c-bbd2-fadc532253d8','2025-07-12 10:09:15',0,1),(66,3,1,'18d710b6-1115-495c-bbd2-fadc532253d8','2025-07-12 10:09:15',1,1),(67,1,3,'8abac79e-53f3-4592-bbd2-96ce5cb94584','2025-07-12 10:10:19',0,1),(67,2,3,'8abac79e-53f3-4592-bbd2-96ce5cb94584','2025-07-12 10:09:15',0,1),(67,3,3,'8abac79e-53f3-4592-bbd2-96ce5cb94584','2025-07-12 10:11:12',0,1),(68,1,1,'18d710b6-1115-495c-bbd2-fadc532253d8','2025-07-12 10:09:15',1,1),(68,2,1,'18d710b6-1115-495c-bbd2-fadc532253d8','2025-07-12 10:09:15',0,1),(68,3,1,'18d710b6-1115-495c-bbd2-fadc532253d8','2025-07-12 10:09:15',1,1),(69,1,3,'8abac79e-53f3-4592-bbd2-96ce5cb94584','2025-07-12 10:10:19',0,1),(69,2,3,'8abac79e-53f3-4592-bbd2-96ce5cb94584','2025-07-12 10:09:15',0,1),(69,3,3,'8abac79e-53f3-4592-bbd2-96ce5cb94584','2025-07-12 10:11:12',0,1),(95,1,2,'e477a46a-3858-4d77-9bf0-818e96c4dd91','2025-07-12 10:13:17',0,1),(95,1,3,'9df6cca2-8b86-4950-8eb0-cab6ce593922','2025-07-12 10:13:17',0,1),(95,1,4,'b7719d9b-d4f4-4779-a41d-64f91a435ae2','2025-07-12 10:13:17',0,1),(95,1,5,'3ff10faa-aafd-4ec0-b638-c97e642e0a8c','2025-07-12 10:13:17',0,1),(95,2,2,'e477a46a-3858-4d77-9bf0-818e96c4dd91','2025-07-12 10:12:17',0,1),(95,2,3,'9df6cca2-8b86-4950-8eb0-cab6ce593922','2025-07-12 10:11:39',0,1),(95,2,4,'b7719d9b-d4f4-4779-a41d-64f91a435ae2','2025-07-12 10:12:12',0,1),(95,2,5,'3ff10faa-aafd-4ec0-b638-c97e642e0a8c','2025-07-12 10:11:34',0,1),(95,3,2,'e477a46a-3858-4d77-9bf0-818e96c4dd91','2025-07-12 10:14:11',0,1),(95,3,3,'9df6cca2-8b86-4950-8eb0-cab6ce593922','2025-07-12 10:14:11',0,1),(95,3,4,'b7719d9b-d4f4-4779-a41d-64f91a435ae2','2025-07-12 10:14:11',0,1),(95,3,5,'3ff10faa-aafd-4ec0-b638-c97e642e0a8c','2025-07-12 10:14:11',0,1),(96,1,1,'18d710b6-1115-495c-bbd2-fadc532253d8','2025-07-12 10:12:12',1,1),(96,2,1,'18d710b6-1115-495c-bbd2-fadc532253d8','2025-07-12 10:12:12',0,1),(96,3,1,'18d710b6-1115-495c-bbd2-fadc532253d8','2025-07-12 10:12:12',1,1),(97,1,3,'8abac79e-53f3-4592-bbd2-96ce5cb94584','2025-07-12 10:13:17',0,1),(97,2,3,'8abac79e-53f3-4592-bbd2-96ce5cb94584','2025-07-12 10:12:12',0,1),(97,3,3,'8abac79e-53f3-4592-bbd2-96ce5cb94584','2025-07-12 10:14:11',0,1),(98,1,3,'8abac79e-53f3-4592-bbd2-96ce5cb94584','2025-07-12 10:13:17',0,1),(98,2,3,'8abac79e-53f3-4592-bbd2-96ce5cb94584','2025-07-12 10:12:12',0,1),(98,3,3,'8abac79e-53f3-4592-bbd2-96ce5cb94584','2025-07-12 10:14:11',0,1),(99,1,1,'18d710b6-1115-495c-bbd2-fadc532253d8','2025-07-12 10:12:12',1,1),(99,2,1,'18d710b6-1115-495c-bbd2-fadc532253d8','2025-07-12 10:12:12',0,1),(99,3,1,'18d710b6-1115-495c-bbd2-fadc532253d8','2025-07-12 10:12:12',1,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `contentblocks`
--

LOCK TABLES `contentblocks` WRITE;
/*!40000 ALTER TABLE `contentblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `contentblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `drafts` VALUES (1,NULL,1,0,'First draft',NULL,0,NULL,0),(2,NULL,1,0,'First draft',NULL,0,NULL,0),(23,NULL,1,0,'First draft',NULL,0,NULL,0),(24,NULL,1,0,'First draft',NULL,0,NULL,0);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (2,1,1,NULL,'edit','2025-07-12 13:51:23'),(2,1,1,NULL,'save','2025-07-12 13:00:11'),(2,1,1,NULL,'view','2025-07-12 13:56:14'),(4,1,1,NULL,'view','2025-07-12 09:42:24'),(5,1,1,NULL,'view','2025-07-12 09:43:02'),(63,1,3,NULL,'view','2025-07-12 09:59:02'),(64,1,3,NULL,'view','2025-07-12 10:05:00'),(65,1,3,NULL,'edit','2025-07-12 10:11:07'),(65,1,3,NULL,'save','2025-07-12 10:11:12'),(65,1,1,NULL,'view','2025-07-12 13:23:28'),(95,1,3,NULL,'edit','2025-07-12 10:14:07'),(95,1,3,NULL,'save','2025-07-12 10:14:11'),(95,1,3,NULL,'view','2025-07-12 11:38:36');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2025-07-12 08:49:16','2025-07-12 08:49:16',NULL,NULL,NULL,'ddb05d9c-11ab-45bf-9ff4-f261e1b48184'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-07-12 09:17:28','2025-07-12 13:00:11',NULL,NULL,NULL,'35350023-fa25-4bd6-b470-c3593c5819bd'),(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2025-07-12 09:17:28','2025-07-12 09:17:28',NULL,NULL,NULL,'71f1cfb1-991c-4bf1-8f6d-1f1abf583de9'),(4,NULL,1,NULL,2,'craft\\elements\\Entry',1,0,'2025-07-12 09:42:24','2025-07-12 09:42:24',NULL,NULL,NULL,'ef9524b5-b1df-4983-867a-38a8c0fe8f23'),(5,NULL,2,NULL,2,'craft\\elements\\Entry',1,0,'2025-07-12 09:43:01','2025-07-12 09:43:01',NULL,NULL,NULL,'82e17cf4-0d40-4ad3-a571-009d9c3202b2'),(11,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2025-07-12 09:51:43','2025-07-12 09:51:43',NULL,NULL,NULL,'1104bcdd-2d1d-4d17-b86c-cbadceb62b3f'),(12,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2025-07-12 09:51:54','2025-07-12 13:24:29',NULL,NULL,NULL,'3e95fe49-56a4-491d-95e2-4b0699072279'),(13,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2025-07-12 09:51:54','2025-07-12 13:24:29',NULL,NULL,NULL,'bbf4cbf3-3614-4b91-b057-1afce3f1fac0'),(14,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2025-07-12 09:51:54','2025-07-12 13:24:29',NULL,NULL,NULL,'d0e3816e-b504-461b-843a-ef0040745938'),(15,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2025-07-12 09:51:54','2025-07-12 13:24:29',NULL,NULL,NULL,'503e1732-a295-4f08-861a-d3dac94ecf9a'),(16,2,NULL,2,1,'craft\\elements\\Entry',1,0,'2025-07-12 09:51:54','2025-07-12 09:51:54',NULL,NULL,NULL,'56c17d59-59df-435e-956c-89ec38480909'),(17,12,NULL,3,5,'craft\\elements\\Entry',1,0,'2025-07-12 09:51:54','2025-07-12 09:51:54',NULL,NULL,NULL,'45b80819-f475-49f4-ab54-f2f1d336da13'),(18,13,NULL,4,7,'craft\\elements\\Entry',1,0,'2025-07-12 09:51:54','2025-07-12 09:51:54',NULL,NULL,NULL,'030012b1-a2e3-4086-a854-cae83fec7179'),(19,14,NULL,5,6,'craft\\elements\\Entry',1,0,'2025-07-12 09:51:54','2025-07-12 09:51:54',NULL,NULL,NULL,'db5c5d62-544d-4c86-916a-36d5d5d7f797'),(20,15,NULL,6,8,'craft\\elements\\Entry',1,0,'2025-07-12 09:51:54','2025-07-12 09:51:54',NULL,NULL,NULL,'c690c3ab-6a58-4299-8601-4cfe9462f1cc'),(23,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2025-07-12 09:52:34','2025-07-12 09:52:34',NULL,NULL,NULL,'c2685f93-e5ae-40ac-9992-c85d0114b31f'),(25,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2025-07-12 09:52:56','2025-07-12 09:52:56',NULL,NULL,NULL,'ae671e5c-1b3f-48dd-b6a7-b3ba86acfa44'),(28,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2025-07-12 09:53:05','2025-07-12 13:24:29',NULL,NULL,NULL,'2464074b-9494-4be4-acfe-6333ecbd4476'),(29,2,NULL,7,1,'craft\\elements\\Entry',1,0,'2025-07-12 09:53:05','2025-07-12 09:53:06',NULL,NULL,NULL,'01ad21c5-4b58-4bb9-b439-a8a49934a845'),(30,13,NULL,8,7,'craft\\elements\\Entry',1,0,'2025-07-12 09:53:05','2025-07-12 09:53:06',NULL,NULL,NULL,'9387e235-0d00-413a-8058-c0987c3ab3c2'),(31,14,NULL,9,6,'craft\\elements\\Entry',1,0,'2025-07-12 09:53:05','2025-07-12 09:53:06',NULL,NULL,NULL,'4afe7d75-d567-4c8d-96ca-ac7d9eb3c488'),(32,28,NULL,10,5,'craft\\elements\\Entry',1,0,'2025-07-12 09:53:05','2025-07-12 09:53:06',NULL,NULL,NULL,'b22f3ca5-7627-4080-a4f4-b17ad96b5b47'),(33,15,NULL,11,8,'craft\\elements\\Entry',1,0,'2025-07-12 09:53:05','2025-07-12 09:53:06',NULL,NULL,NULL,'099ff78a-a412-4fb0-8455-4b915d2a6f72'),(38,2,NULL,12,1,'craft\\elements\\Entry',1,0,'2025-07-12 09:55:08','2025-07-12 09:55:08',NULL,NULL,NULL,'a76aa915-3873-40a4-b503-224bb6dbde75'),(39,12,NULL,13,5,'craft\\elements\\Entry',1,0,'2025-07-12 09:55:08','2025-07-12 09:55:08',NULL,NULL,NULL,'0b759157-82d9-4f62-9cbc-0bff1ed28ab8'),(40,14,NULL,14,6,'craft\\elements\\Entry',1,0,'2025-07-12 09:55:08','2025-07-12 09:55:08',NULL,NULL,NULL,'1abe6a81-f3a1-4acc-8830-ff99e2f615a9'),(41,28,NULL,15,5,'craft\\elements\\Entry',1,0,'2025-07-12 09:55:08','2025-07-12 09:55:08',NULL,NULL,NULL,'e8e59df0-25c4-460e-acd0-15725039effd'),(44,2,NULL,16,1,'craft\\elements\\Entry',1,0,'2025-07-12 09:55:25','2025-07-12 09:55:25',NULL,NULL,NULL,'d79deddc-ac56-4717-9184-90db4d8fa354'),(45,28,NULL,17,5,'craft\\elements\\Entry',1,0,'2025-07-12 09:55:25','2025-07-12 09:55:25',NULL,NULL,NULL,'8b1d9846-56f8-4b10-9f6a-c71dc6d56cef'),(50,2,NULL,18,1,'craft\\elements\\Entry',1,0,'2025-07-12 09:57:37','2025-07-12 09:57:37',NULL,NULL,NULL,'5fcd4f5e-2eb4-4138-8d6a-71dfeb410a8a'),(51,12,NULL,19,5,'craft\\elements\\Entry',1,0,'2025-07-12 09:57:37','2025-07-12 09:57:37',NULL,NULL,NULL,'2ded4d03-d815-4991-8a7b-2bee6fb50779'),(52,14,NULL,20,6,'craft\\elements\\Entry',1,0,'2025-07-12 09:57:37','2025-07-12 09:57:37',NULL,NULL,NULL,'07ba4121-0d81-4fac-806d-a1f8c080694f'),(53,28,NULL,21,5,'craft\\elements\\Entry',1,0,'2025-07-12 09:57:37','2025-07-12 09:57:37',NULL,NULL,NULL,'997cb929-7eb1-4992-8edb-b48dc6d75c76'),(54,2,NULL,22,1,'craft\\elements\\Entry',1,0,'2025-07-12 09:57:48','2025-07-12 09:57:48',NULL,NULL,NULL,'dd7c1c16-e63b-4c2e-99c2-f9c4af770573'),(55,12,NULL,23,5,'craft\\elements\\Entry',1,0,'2025-07-12 09:57:48','2025-07-12 09:57:48',NULL,NULL,NULL,'89b24e16-754d-4fda-ade4-4d935885d5c1'),(56,2,NULL,24,1,'craft\\elements\\Entry',1,0,'2025-07-12 09:58:05','2025-07-12 09:58:05',NULL,NULL,NULL,'9e94e551-b692-4132-a8d2-8156415958ca'),(57,12,NULL,25,5,'craft\\elements\\Entry',1,0,'2025-07-12 09:58:05','2025-07-12 09:58:05',NULL,NULL,NULL,'b45dc5cb-3748-4460-8101-f3abffecea2a'),(58,2,NULL,26,1,'craft\\elements\\Entry',1,0,'2025-07-12 09:58:26','2025-07-12 09:58:26',NULL,NULL,NULL,'3b5d2e6f-49f3-4f56-be6c-3f218ee1f005'),(59,14,NULL,27,6,'craft\\elements\\Entry',1,0,'2025-07-12 09:58:26','2025-07-12 09:58:26',NULL,NULL,NULL,'e41f6ebf-deed-4fb4-b578-eca17fc3c9ef'),(60,2,NULL,28,1,'craft\\elements\\Entry',1,0,'2025-07-12 09:58:49','2025-07-12 09:58:49',NULL,NULL,NULL,'7f31c62b-c8e8-4d67-ab31-d0e45ee8b015'),(61,14,NULL,29,6,'craft\\elements\\Entry',1,0,'2025-07-12 09:58:49','2025-07-12 09:58:49',NULL,NULL,NULL,'cebf71c7-d1e3-4add-abee-1919b51c6ddb'),(62,2,NULL,30,1,'craft\\elements\\Entry',1,0,'2025-07-12 09:58:52','2025-07-12 09:58:52',NULL,NULL,NULL,'8a0258c0-06b5-45d3-862e-7f4af8895fa2'),(63,NULL,23,NULL,2,'craft\\elements\\Entry',1,0,'2025-07-12 09:59:02','2025-07-12 09:59:02',NULL,NULL,NULL,'3b8b6fbb-a387-476a-b9f8-d7edb0bc41e2'),(64,NULL,24,NULL,2,'craft\\elements\\Entry',1,0,'2025-07-12 10:01:29','2025-07-12 10:01:29',NULL,NULL,NULL,'ea9276e7-b8c0-475e-82f6-40f8b4de820e'),(65,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2025-07-12 10:05:52','2025-07-12 10:11:12',NULL,NULL,NULL,'8260f2db-4e92-44d5-8ea7-7d6eb57df550'),(66,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2025-07-12 10:08:50','2025-07-12 13:24:40',NULL,NULL,NULL,'5e61391e-5c57-4950-afe0-c1915c9b9fe3'),(67,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2025-07-12 10:08:53','2025-07-12 13:24:40',NULL,NULL,NULL,'e1dada04-c50d-4782-b30c-c95ac3c57f55'),(68,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2025-07-12 10:09:04','2025-07-12 13:24:40',NULL,NULL,NULL,'b3a70f1e-2f40-4ae9-a49f-6be8a356be50'),(69,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2025-07-12 10:09:09','2025-07-12 13:24:40',NULL,NULL,NULL,'59a4d893-8fc3-439c-8879-c50131bb2200'),(70,65,NULL,31,2,'craft\\elements\\Entry',1,0,'2025-07-12 10:09:28','2025-07-12 10:09:28',NULL,NULL,NULL,'a8305d2e-3513-4448-b701-8d477a67761c'),(71,66,NULL,32,5,'craft\\elements\\Entry',1,0,'2025-07-12 10:09:15','2025-07-12 10:09:28',NULL,NULL,NULL,'308fcd2b-40ee-4b5b-be2a-bd709eefa52c'),(72,67,NULL,33,7,'craft\\elements\\Entry',1,0,'2025-07-12 10:09:15','2025-07-12 10:09:28',NULL,NULL,NULL,'84498e4c-5268-4b87-a82e-90ead90bd72f'),(73,68,NULL,34,5,'craft\\elements\\Entry',1,0,'2025-07-12 10:09:15','2025-07-12 10:09:28',NULL,NULL,NULL,'1cad7ecd-0b92-438d-8a34-965c11a7e182'),(74,69,NULL,35,7,'craft\\elements\\Entry',1,0,'2025-07-12 10:09:15','2025-07-12 10:09:28',NULL,NULL,NULL,'5ddbece6-72f7-4784-912e-d4b3b5a74a79'),(80,65,NULL,36,2,'craft\\elements\\Entry',1,0,'2025-07-12 10:10:19','2025-07-12 10:10:19',NULL,NULL,NULL,'8bedc97a-167f-40a4-874f-b1bee4241184'),(81,66,NULL,37,5,'craft\\elements\\Entry',1,0,'2025-07-12 10:10:19','2025-07-12 10:10:19',NULL,NULL,NULL,'4c84e2ee-b715-40d9-aa80-068846c016a9'),(82,67,NULL,38,7,'craft\\elements\\Entry',1,0,'2025-07-12 10:10:19','2025-07-12 10:10:19',NULL,NULL,NULL,'823b02f6-af77-4dcd-8cb6-237a25a1a940'),(83,68,NULL,39,5,'craft\\elements\\Entry',1,0,'2025-07-12 10:10:19','2025-07-12 10:10:19',NULL,NULL,NULL,'a989e216-fa7e-4b98-a22a-ecd21d48c35f'),(84,69,NULL,40,7,'craft\\elements\\Entry',1,0,'2025-07-12 10:10:19','2025-07-12 10:10:19',NULL,NULL,NULL,'aa525274-77bc-4a46-b75d-b325716e981a'),(90,65,NULL,41,2,'craft\\elements\\Entry',1,0,'2025-07-12 10:11:12','2025-07-12 10:11:12',NULL,NULL,NULL,'53632eda-015c-4a34-8429-84bc95bbaca8'),(91,66,NULL,42,5,'craft\\elements\\Entry',1,0,'2025-07-12 10:11:12','2025-07-12 10:11:12',NULL,NULL,NULL,'865d8655-882a-4925-b3e8-b1eb1f6836d6'),(92,67,NULL,43,7,'craft\\elements\\Entry',1,0,'2025-07-12 10:11:12','2025-07-12 10:11:12',NULL,NULL,NULL,'b2a47241-8b2f-40de-9749-69b5df511b70'),(93,68,NULL,44,5,'craft\\elements\\Entry',1,0,'2025-07-12 10:11:12','2025-07-12 10:11:12',NULL,NULL,NULL,'80ce5e58-3cb2-45fc-8412-49ce5260a379'),(94,69,NULL,45,7,'craft\\elements\\Entry',1,0,'2025-07-12 10:11:12','2025-07-12 10:11:12',NULL,NULL,NULL,'cd4c8852-80d1-49c2-bdd0-4b215dcc568e'),(95,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2025-07-12 10:11:18','2025-07-12 10:14:11',NULL,NULL,NULL,'034cf098-b50a-44be-8a97-49bd348853a3'),(96,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2025-07-12 10:11:46','2025-07-12 13:24:40',NULL,NULL,NULL,'463fcbc8-95ae-4343-8275-7f5d26bd400d'),(97,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2025-07-12 10:11:49','2025-07-12 13:24:40',NULL,NULL,NULL,'17507237-d224-4697-a40e-cb1dae6310c6'),(98,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2025-07-12 10:11:56','2025-07-12 13:24:40',NULL,NULL,NULL,'b5bd2bed-6bec-42fc-aa26-9d4c9f7481dd'),(99,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2025-07-12 10:11:59','2025-07-12 13:24:40',NULL,NULL,NULL,'2ab9502c-a0d7-42e2-ae42-8f4b00b63c13'),(100,95,NULL,46,2,'craft\\elements\\Entry',1,0,'2025-07-12 10:12:28','2025-07-12 10:12:28',NULL,NULL,NULL,'313cd8ea-b837-4417-84fb-a8c3eb3d5a86'),(101,96,NULL,47,5,'craft\\elements\\Entry',1,0,'2025-07-12 10:12:12','2025-07-12 10:12:28',NULL,NULL,NULL,'acfeca94-617b-4880-a474-f8d358e25a4b'),(102,97,NULL,48,7,'craft\\elements\\Entry',1,0,'2025-07-12 10:12:12','2025-07-12 10:12:28',NULL,NULL,NULL,'d19f4fd3-bcf9-483f-88db-851d9d277fd1'),(103,99,NULL,49,5,'craft\\elements\\Entry',1,0,'2025-07-12 10:12:12','2025-07-12 10:12:28',NULL,NULL,NULL,'0d9c86ea-c31b-49e6-9bb8-969bdc838057'),(104,98,NULL,50,7,'craft\\elements\\Entry',1,0,'2025-07-12 10:12:12','2025-07-12 10:12:28',NULL,NULL,NULL,'4260a58a-3d7f-416c-a4fe-51931edd0944'),(110,95,NULL,51,2,'craft\\elements\\Entry',1,0,'2025-07-12 10:13:17','2025-07-12 10:13:17',NULL,NULL,NULL,'fa5d1d92-b75d-4e29-907b-d52356679fd7'),(111,96,NULL,52,5,'craft\\elements\\Entry',1,0,'2025-07-12 10:13:17','2025-07-12 10:13:17',NULL,NULL,NULL,'fd93ed7f-1d3d-48d3-85bb-c85f4926816b'),(112,97,NULL,53,7,'craft\\elements\\Entry',1,0,'2025-07-12 10:13:17','2025-07-12 10:13:17',NULL,NULL,NULL,'a84f8b3e-5af0-4161-ad9e-56ef1be80131'),(113,99,NULL,54,5,'craft\\elements\\Entry',1,0,'2025-07-12 10:13:17','2025-07-12 10:13:17',NULL,NULL,NULL,'e35edc7d-10e1-4763-bd1a-82697bb59674'),(114,98,NULL,55,7,'craft\\elements\\Entry',1,0,'2025-07-12 10:13:17','2025-07-12 10:13:17',NULL,NULL,NULL,'33a2b776-414b-4889-abf3-3d1312d58e1b'),(120,95,NULL,56,2,'craft\\elements\\Entry',1,0,'2025-07-12 10:14:11','2025-07-12 10:14:11',NULL,NULL,NULL,'a58d5f20-cd57-42c6-852d-7c4bb96657a9'),(121,96,NULL,57,5,'craft\\elements\\Entry',1,0,'2025-07-12 10:14:11','2025-07-12 10:14:11',NULL,NULL,NULL,'c4dec14c-218f-42ec-b376-4473b9d7ebf6'),(122,97,NULL,58,7,'craft\\elements\\Entry',1,0,'2025-07-12 10:14:11','2025-07-12 10:14:11',NULL,NULL,NULL,'cdf45b89-c190-4127-a0f3-ed55ea0b58a1'),(123,99,NULL,59,5,'craft\\elements\\Entry',1,0,'2025-07-12 10:14:11','2025-07-12 10:14:11',NULL,NULL,NULL,'19a44840-2daa-4e48-813f-a869e2625014'),(124,98,NULL,60,7,'craft\\elements\\Entry',1,0,'2025-07-12 10:14:11','2025-07-12 10:14:11',NULL,NULL,NULL,'6d450306-62ce-484f-befc-1b712e20d46d'),(128,2,NULL,61,1,'craft\\elements\\Entry',1,0,'2025-07-12 10:23:36','2025-07-12 10:23:36',NULL,NULL,NULL,'135c2217-23ff-4e62-a41e-3a28dc2b2021'),(129,13,NULL,62,7,'craft\\elements\\Entry',1,0,'2025-07-12 10:23:36','2025-07-12 10:23:36',NULL,NULL,NULL,'6c76c0c5-407d-4123-8b65-fe1ab74cd4ad'),(130,14,NULL,63,6,'craft\\elements\\Entry',1,0,'2025-07-12 10:23:36','2025-07-12 10:23:36',NULL,NULL,NULL,'9a1dec11-5ee1-4b8c-be91-78b482085582'),(133,2,NULL,64,1,'craft\\elements\\Entry',1,0,'2025-07-12 10:25:52','2025-07-12 10:25:52',NULL,NULL,NULL,'8ede9216-4ef9-4e52-995c-3c9f2d395841'),(134,13,NULL,65,7,'craft\\elements\\Entry',1,0,'2025-07-12 10:25:52','2025-07-12 10:25:52',NULL,NULL,NULL,'e039f23e-26f7-470d-8e6b-9da92c293253'),(137,2,NULL,66,1,'craft\\elements\\Entry',1,0,'2025-07-12 10:26:07','2025-07-12 10:26:07',NULL,NULL,NULL,'e13848d1-0188-4b98-853c-634c1494189b'),(138,13,NULL,67,7,'craft\\elements\\Entry',1,0,'2025-07-12 10:26:07','2025-07-12 10:26:07',NULL,NULL,NULL,'efa232b9-4aec-4058-9520-6f7933b18d0b'),(141,2,NULL,68,1,'craft\\elements\\Entry',1,0,'2025-07-12 10:26:32','2025-07-12 10:26:32',NULL,NULL,NULL,'290762bd-1bee-4cd2-8fd0-e48226e38fc7'),(142,14,NULL,69,6,'craft\\elements\\Entry',1,0,'2025-07-12 10:26:32','2025-07-12 10:26:32',NULL,NULL,NULL,'7753b818-949c-400e-940c-ba66394de0d4'),(143,2,NULL,70,1,'craft\\elements\\Entry',1,0,'2025-07-12 10:26:41','2025-07-12 10:26:41',NULL,NULL,NULL,'1153c1c3-d554-4578-9df1-4e9712d6fcfc'),(144,14,NULL,71,6,'craft\\elements\\Entry',1,0,'2025-07-12 10:26:41','2025-07-12 10:26:41',NULL,NULL,NULL,'fc5ed425-d6e4-43ea-9f6a-2e22ea370b0b'),(145,2,NULL,72,1,'craft\\elements\\Entry',1,0,'2025-07-12 13:00:04','2025-07-12 13:00:04',NULL,NULL,NULL,'4330fdbc-4e41-4723-bff6-f0abea29db1c'),(146,12,NULL,73,5,'craft\\elements\\Entry',1,0,'2025-07-12 11:45:33','2025-07-12 13:00:04',NULL,NULL,NULL,'f90b6f5f-36f7-4671-be5b-e72a504d153d'),(147,13,NULL,74,7,'craft\\elements\\Entry',1,0,'2025-07-12 11:45:33','2025-07-12 13:00:04',NULL,NULL,NULL,'da3252c8-a7e0-4360-825b-29c350036047'),(148,14,NULL,75,6,'craft\\elements\\Entry',1,0,'2025-07-12 11:45:33','2025-07-12 13:00:04',NULL,NULL,NULL,'fcb66ee7-d57e-4e7e-8192-4d138586531b'),(149,28,NULL,76,5,'craft\\elements\\Entry',1,0,'2025-07-12 11:45:33','2025-07-12 13:00:04',NULL,NULL,NULL,'260d5ae9-7e81-4554-9029-9e9a04cb3380'),(150,15,NULL,77,8,'craft\\elements\\Entry',1,0,'2025-07-12 11:45:33','2025-07-12 13:00:04',NULL,NULL,NULL,'b4292be1-9fd7-4e16-ae9d-e83e77fbdf19'),(151,2,NULL,78,1,'craft\\elements\\Entry',1,0,'2025-07-12 13:00:11','2025-07-12 13:00:11',NULL,NULL,NULL,'a165558a-084d-4974-80a1-408b71e6dc40');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_owners` VALUES (12,2,1),(13,2,2),(14,2,3),(15,2,5),(17,16,1),(17,29,1),(18,16,2),(19,16,3),(20,16,4),(28,2,4),(30,29,2),(30,38,2),(30,44,2),(30,50,2),(30,54,2),(30,56,2),(30,58,2),(30,60,2),(30,62,2),(31,29,3),(32,29,4),(33,29,5),(33,38,5),(33,44,5),(33,50,5),(33,54,5),(33,56,5),(33,58,5),(33,60,5),(33,62,5),(33,128,5),(33,133,5),(33,137,5),(33,141,5),(33,143,5),(39,38,1),(39,44,1),(40,38,3),(40,44,3),(41,38,4),(45,44,4),(51,50,1),(52,50,3),(52,54,3),(52,56,3),(53,50,4),(53,54,4),(53,56,4),(53,58,4),(53,60,4),(53,62,4),(53,128,4),(53,133,4),(53,137,4),(53,141,4),(53,143,4),(55,54,1),(57,56,1),(57,58,1),(57,60,1),(57,62,1),(57,128,1),(57,133,1),(57,137,1),(57,141,1),(57,143,1),(59,58,3),(61,60,3),(61,62,3),(66,65,1),(67,65,2),(68,65,3),(69,65,4),(71,70,1),(72,70,2),(73,70,3),(74,70,4),(81,80,1),(82,80,2),(83,80,3),(84,80,4),(91,90,1),(92,90,2),(93,90,3),(94,90,4),(96,95,1),(97,95,2),(98,95,4),(99,95,3),(101,100,1),(102,100,2),(103,100,3),(104,100,4),(111,110,1),(112,110,2),(113,110,3),(114,110,4),(121,120,1),(122,120,2),(123,120,3),(124,120,4),(129,128,2),(130,128,3),(130,133,3),(130,137,3),(134,133,2),(138,137,2),(138,141,2),(138,143,2),(142,141,3),(144,143,3),(146,145,1),(146,151,1),(147,145,2),(147,151,2),(148,145,3),(148,151,3),(149,145,4),(149,151,4),(150,145,5),(150,151,5);
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,NULL,NULL,1,'2025-07-12 08:49:16','2025-07-12 08:49:16','abb78449-1a0a-4f7f-b39d-b809fc6b17a2'),(2,2,1,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Starter\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Thank you for trying the Query API. It brings the simplicity of Twig\'s data querying to your JavaScript framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:17:28','2025-07-12 13:00:11','9d8a1b25-0f9a-4c3c-8cb8-85c7fdd98a08'),(3,2,2,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Vorlage\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Danke, dass du die Query API ausprobierst. Es bringt die Einfachheit von Twigs Datenabfragen in dein JavaScript-Framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:17:28','2025-07-12 09:55:08','33848e1c-e805-4a18-b412-cf65d4badc65'),(4,2,3,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Plantilla\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Gracias por probar la Query API. Trae la simplicidad de las consultas de datos de Twig a tu framework de JavaScript.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:17:28','2025-07-12 09:57:37','1b8e3723-2ed6-4e38-96e6-9affcd99fb51'),(5,3,1,'Home','home','__home__',NULL,1,'2025-07-12 09:17:28','2025-07-12 09:17:28','c857fb92-7fae-445d-957d-993e0d45444b'),(6,3,2,'Home','home','__home__',NULL,1,'2025-07-12 09:17:28','2025-07-12 09:17:28','e1896b32-b252-4b6e-bf69-e62c0b6b86a9'),(7,3,3,'Home','home','__home__',NULL,1,'2025-07-12 09:17:28','2025-07-12 09:17:28','851cbb68-7e6d-432d-92ba-22cc72387428'),(8,4,1,NULL,'__temp_ezprawcilwwlddpbmxuovueimzdeyodhszaa','news/__temp_ezprawcilwwlddpbmxuovueimzdeyodhszaa',NULL,1,'2025-07-12 09:42:24','2025-07-12 09:42:24','ba9b3e7e-5e1d-4744-815b-0fd02ef6fcdf'),(9,4,2,NULL,'__temp_ezprawcilwwlddpbmxuovueimzdeyodhszaa','news/__temp_ezprawcilwwlddpbmxuovueimzdeyodhszaa',NULL,1,'2025-07-12 09:42:24','2025-07-12 09:42:24','a5056770-6770-4c95-98a2-ecaa1112e99d'),(10,4,3,NULL,'__temp_ezprawcilwwlddpbmxuovueimzdeyodhszaa','news/__temp_ezprawcilwwlddpbmxuovueimzdeyodhszaa',NULL,1,'2025-07-12 09:42:24','2025-07-12 09:42:24','72106fb2-da71-4c24-9cbc-bd310c3c1be4'),(11,5,1,NULL,'__temp_cytuutvbffccsovrdipicvohkuqajrmlyldp','news/__temp_cytuutvbffccsovrdipicvohkuqajrmlyldp',NULL,1,'2025-07-12 09:43:01','2025-07-12 09:43:01','c54949a8-492e-4ea0-9387-e790b71fa0b8'),(12,5,2,NULL,'__temp_cytuutvbffccsovrdipicvohkuqajrmlyldp','news/__temp_cytuutvbffccsovrdipicvohkuqajrmlyldp',NULL,1,'2025-07-12 09:43:01','2025-07-12 09:43:01','4ef2a9d6-8b2c-42cc-a40f-a2b2ca0135ec'),(13,5,3,NULL,'__temp_cytuutvbffccsovrdipicvohkuqajrmlyldp','news/__temp_cytuutvbffccsovrdipicvohkuqajrmlyldp',NULL,1,'2025-07-12 09:43:01','2025-07-12 09:43:01','0e2f57aa-7357-4e5e-b28c-89609537e9d4'),(29,11,1,'Garfield2',NULL,NULL,NULL,1,'2025-07-12 09:51:43','2025-07-12 09:51:43','504b3633-766d-4d81-9792-b9e7d0e341cc'),(30,11,2,'Garfield2',NULL,NULL,NULL,1,'2025-07-12 09:51:44','2025-07-12 09:51:44','f0cb1608-ed78-4e9e-9b32-55114a623527'),(31,11,3,'Garfield2',NULL,NULL,NULL,1,'2025-07-12 09:51:44','2025-07-12 09:51:44','53259d92-25f5-4e35-87e2-8edbcef5f6e7'),(32,12,1,'Overview','this-starter-contains-f',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:51:54','2025-07-12 09:58:05','f0e37797-7a7f-46d6-a3c5-3713d49be7e1'),(33,12,2,'Übersicht','was-du-lernen-kannst',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:51:54','2025-07-12 09:57:48','2acf2685-cce8-4a50-9f49-a3a6355912d9'),(34,12,3,'Visión general','entry-12',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:51:54','2025-07-12 09:57:37','40492555-c528-4fdb-ada2-97d04c6db748'),(35,13,1,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Here’s a quick overview of what’s configured in the starter template. If you notice something is missing, I’d be happy to hear your feedback!</p><h3>Sections:</h3><ul><li>home: This is the home page</li><li>news: News articles can be managed here</li></ul><h3>Languages:</h3><ul><li>EN → Primary Language</li><li>DE</li><li>ES</li></ul><h3>Installed Plugins:</h3><ul><li>Query API: Edit rich text content in Craft CMS using CKEditor.</li><li>Imager X: Ninja-powered image transforms.</li><li>CKEditor: Edit rich text content in Craft CMS using CKEditor.</li></ul>\"}',1,'2025-07-12 09:51:54','2025-07-12 10:25:52','703aea1d-c4e2-4fc5-9747-2d22f0a3aba8'),(36,13,2,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Hier bekommst du eine kleine Übersicht, was alles in dem Starter Template konfiguriert ist. Wenn du findest das etwas fehlt, freue ich mich über eine Rückmeldung!</p><h3>Sections:</h3><ul><li>home: Das ist die Home Page</li><li>news: Hier können News Beiträge gepflegt werden</li></ul><h3>Sprachen:</h3><ul><li>EN -&gt; Primary Language</li><li>DE</li><li>ES</li></ul><h3>Installierte Plugins</h3><ul><li>Query API: Edit rich text content in Craft CMS using CKEditor.</li><li>Imager X: Ninja powered image transforms.</li><li>CKEditor: Edit rich text content in Craft CMS using CKEditor.</li></ul>\"}',1,'2025-07-12 09:51:54','2025-07-12 10:23:36','fc907152-4c0e-4689-870e-e65e5a60259d'),(37,13,3,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Aquí tienes un pequeño resumen de lo que está configurado en la plantilla inicial. ¡Si ves que falta algo, estaré encantado de recibir tus comentarios!</p><h3>Secciones:</h3><ul><li>home: Esta es la página de inicio</li><li>news: Aquí se pueden gestionar las noticias</li></ul><h3>Idiomas:</h3><ul><li>EN → Idioma principal</li><li>DE</li><li>ES</li></ul><h3>Plugins instalados:</h3><ul><li>Query API: Edita contenido enriquecido en Craft CMS con CKEditor.</li><li>Imager X: Transformaciones de imagen con potencia ninja.</li><li>CKEditor: Edita contenido enriquecido en Craft CMS con CKEditor.</li></ul>\"}',1,'2025-07-12 09:51:54','2025-07-12 10:26:07','2616a3df-90a0-4dc8-9733-017870b83ccc'),(38,14,1,'ImagerX for Images','image',NULL,'{\"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\": \"<p>To ensure that images are always optimized, the Imager X plugin was included in the starter right away. It generates the srcSet for the frontend.</p>\", \"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:51:54','2025-07-12 10:26:32','5f4eee26-dc11-4eeb-86f6-19ad3e4bf0ea'),(39,14,2,'ImagerX für Bilder','entry-14',NULL,'{\"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\": \"<p>Damit die Bilder immer optimiert sind, wurde in dem Starter gleich das Imager X Plugin installiert. Damit wird dann das srcSet für das Frontend erzeugt. </p>\", \"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:51:54','2025-07-12 10:23:36','29a2431e-026e-4b90-a5b5-514e8ff4d894'),(40,14,3,'ImagerX para imágenes','entry-14',NULL,'{\"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\": \"<p>Para garantizar que las imágenes estén siempre optimizadas, el plugin Imager X se ha incluido directamente en la plantilla inicial. Este genera el srcSet para el frontend.</p>\", \"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:51:54','2025-07-12 10:26:41','fcd6d654-930a-4c93-a6b3-c3678a5cf0df'),(41,15,1,NULL,'__temp_svftqjvbmynaealpnazyrdxcpiegenvdfmdj',NULL,'{\"e2966306-abe9-4cd0-a63f-1cc76dfd8547\": [23]}',1,'2025-07-12 09:51:54','2025-07-12 09:53:05','6987c0f0-3bef-41f4-a875-30752a53d658'),(42,15,2,NULL,'__temp_svftqjvbmynaealpnazyrdxcpiegenvdfmdj',NULL,'{\"e2966306-abe9-4cd0-a63f-1cc76dfd8547\": [23]}',1,'2025-07-12 09:51:54','2025-07-12 09:53:05','e015c23f-04dc-48d9-9d2e-629ac31f2280'),(43,15,3,NULL,'__temp_svftqjvbmynaealpnazyrdxcpiegenvdfmdj',NULL,'{\"e2966306-abe9-4cd0-a63f-1cc76dfd8547\": [23]}',1,'2025-07-12 09:51:54','2025-07-12 09:53:05','ffa16e4c-09de-4558-8fec-12d9d90442ba'),(44,16,1,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Starter\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Thank you for trying the Query API. It brings the simplicity of Twig\'s data querying to your JavaScript framework.</p>\"}',1,'2025-07-12 09:51:54','2025-07-12 09:51:54','21f1deca-0fe1-4709-aed9-02c6aa7fab8f'),(45,16,2,'Home','home','__home__',NULL,1,'2025-07-12 09:51:54','2025-07-12 09:51:54','a1b6e633-5a39-4183-b498-6b5f4797ee06'),(46,16,3,'Home','home','__home__',NULL,1,'2025-07-12 09:51:54','2025-07-12 09:51:54','92034ac6-0356-41fd-960a-7dd68d46189d'),(47,17,1,'What you can learn','this-starter-contains-f',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:51:54','2025-07-12 09:51:54','e34c5b91-718f-4bdb-b429-92e369de86c7'),(48,17,2,'Entry 12','entry-12',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:51:54','2025-07-12 09:51:54','f597992d-f4ba-407e-ba55-b229641d237e'),(49,17,3,'Entry 12','entry-12',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:51:54','2025-07-12 09:51:54','50854cd4-ba7b-43eb-a4c8-6b3f41223879'),(50,18,1,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,NULL,1,'2025-07-12 09:51:54','2025-07-12 09:51:54','e1c5fe8a-fb92-4a8b-b3ec-cd2d7b8061b0'),(51,18,2,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,NULL,1,'2025-07-12 09:51:54','2025-07-12 09:51:54','919b0fe6-1cae-4c94-a951-de3adfd395ec'),(52,18,3,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,NULL,1,'2025-07-12 09:51:54','2025-07-12 09:51:54','98b0c571-93b8-403c-9a79-f2825baf2216'),(53,19,1,'ImagerX for Images','image',NULL,'{\"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:51:54','2025-07-12 09:51:54','13e2a4f0-df40-4221-bec4-8f5feecb47ef'),(54,19,2,'Entry 14','entry-14',NULL,'{\"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:51:54','2025-07-12 09:51:54','61c659dc-4ae9-4a7d-b34f-59cac1687dfd'),(55,19,3,'Entry 14','entry-14',NULL,'{\"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:51:54','2025-07-12 09:51:54','9eda7933-316d-4a69-8ed4-475d2f957aca'),(56,20,1,NULL,'__temp_svftqjvbmynaealpnazyrdxcpiegenvdfmdj',NULL,NULL,1,'2025-07-12 09:51:54','2025-07-12 09:51:54','74c47136-7e07-4e5c-9104-26d46e300818'),(57,20,2,NULL,'__temp_svftqjvbmynaealpnazyrdxcpiegenvdfmdj',NULL,NULL,1,'2025-07-12 09:51:54','2025-07-12 09:51:54','0236925d-0907-402a-9b37-f5e9a55e42de'),(58,20,3,NULL,'__temp_svftqjvbmynaealpnazyrdxcpiegenvdfmdj',NULL,NULL,1,'2025-07-12 09:51:54','2025-07-12 09:51:54','4fc7b823-c828-44d0-9a4a-4622b22a4bb0'),(65,23,1,'Garfield',NULL,NULL,NULL,1,'2025-07-12 09:52:34','2025-07-12 09:52:34','75edc076-e1ce-4e15-b016-881084783c69'),(66,23,2,'Garfield',NULL,NULL,NULL,1,'2025-07-12 09:52:34','2025-07-12 09:52:34','0f28eda1-e5ef-41fe-9718-c22c8ef9ee59'),(67,23,3,'Garfield',NULL,NULL,NULL,1,'2025-07-12 09:52:34','2025-07-12 09:52:34','35ccffdc-6154-424d-a929-646e10fac056'),(71,25,1,'Black white',NULL,NULL,NULL,1,'2025-07-12 09:52:56','2025-07-12 09:52:56','ec626523-3690-4ea7-8099-380283caa02c'),(72,25,2,'Black white',NULL,NULL,NULL,1,'2025-07-12 09:52:56','2025-07-12 09:52:56','293ea0b1-eecb-4d02-8468-0494f1111284'),(73,25,3,'Black white',NULL,NULL,NULL,1,'2025-07-12 09:52:56','2025-07-12 09:52:56','dec8f9dd-8ce7-4f73-b9c8-518a2b76faeb'),(80,28,1,'I hope you like cats!','i-hope-you-like-cats',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:53:05','2025-07-12 09:53:05','dbd6c9b6-b6a9-4253-a37f-19db0da79417'),(81,28,2,'Ich hoffe du magst Katzen!','i-hope-you-like-cats',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:53:05','2025-07-12 09:55:25','7440fe0c-5f84-4405-89d9-3548ced4d2cb'),(82,28,3,'Espero que te gusten los gatos!','i-hope-you-like-cats',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:53:05','2025-07-12 09:57:37','58527f5f-018d-4211-b810-2d63e1f7a22f'),(83,29,1,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Starter\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Thank you for trying the Query API. It brings the simplicity of Twig\'s data querying to your JavaScript framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:53:06','2025-07-12 09:53:06','8e7c2ecf-1c79-4680-b0e1-2c39329a4d38'),(84,29,2,'Home','home','__home__','{\"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:53:06','2025-07-12 09:53:06','db1f1096-38eb-4db7-8c62-12a1df440c4f'),(85,29,3,'Home','home','__home__','{\"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:53:06','2025-07-12 09:53:06','b01019aa-1463-4226-947f-3d265c3039dd'),(86,30,1,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>asdf</p>\"}',1,'2025-07-12 09:53:06','2025-07-12 09:53:06','d0394e51-d615-4bdb-a6ec-186a90a0f59f'),(87,30,2,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,NULL,1,'2025-07-12 09:53:06','2025-07-12 09:53:06','acb34f2b-9b31-4f6e-b253-5870c6b900db'),(88,30,3,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,NULL,1,'2025-07-12 09:53:06','2025-07-12 09:53:06','0b1d0b63-45f1-4a64-92d1-907a1dba83d0'),(89,31,1,'ImagerX for Images','image',NULL,'{\"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\": \"<p>asdf</p>\", \"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:53:06','2025-07-12 09:53:06','a2f01d1f-a1c6-41a1-b82a-9744430a3cc4'),(90,31,2,'Entry 14','entry-14',NULL,'{\"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:53:06','2025-07-12 09:53:06','09f5fa5f-45dd-4529-aee3-192b698dc03d'),(91,31,3,'Entry 14','entry-14',NULL,'{\"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:53:06','2025-07-12 09:53:06','764eb63a-c25e-49b3-8adf-8675661cd371'),(92,32,1,'I hope you like cats!','i-hope-you-like-cats',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:53:06','2025-07-12 09:53:06','0f946b48-3588-4c90-9ad7-39e175cc782e'),(93,32,2,'I hope you like cats!','i-hope-you-like-cats',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:53:06','2025-07-12 09:53:06','3c1acf45-df0f-4502-bee2-bb66aa2deece'),(94,32,3,'I hope you like cats!','i-hope-you-like-cats',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:53:06','2025-07-12 09:53:06','f379f7b9-0c56-416f-b214-a7572c0461ac'),(95,33,1,NULL,'__temp_svftqjvbmynaealpnazyrdxcpiegenvdfmdj',NULL,'{\"e2966306-abe9-4cd0-a63f-1cc76dfd8547\": [23]}',1,'2025-07-12 09:53:06','2025-07-12 09:53:06','ed1b7dec-2928-4a73-b6f6-f77fc769cdd9'),(96,33,2,NULL,'__temp_svftqjvbmynaealpnazyrdxcpiegenvdfmdj',NULL,'{\"e2966306-abe9-4cd0-a63f-1cc76dfd8547\": [23]}',1,'2025-07-12 09:53:06','2025-07-12 09:53:06','f3e45690-e16d-4318-907f-c1fd0992d805'),(97,33,3,NULL,'__temp_svftqjvbmynaealpnazyrdxcpiegenvdfmdj',NULL,'{\"e2966306-abe9-4cd0-a63f-1cc76dfd8547\": [23]}',1,'2025-07-12 09:53:06','2025-07-12 09:53:06','ba7bc65b-4e9c-45e1-9d07-b1630fc1dba5'),(110,38,2,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Vorlage\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Danke, dass du die Query API ausprobierst. Es bringt die Einfachheit von Twigs Datenabfragen in dein JavaScript-Framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:55:08','2025-07-12 09:55:08','6e9e50e7-6139-4c69-b454-62d004cdb412'),(111,38,1,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Starter\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Thank you for trying the Query API. It brings the simplicity of Twig\'s data querying to your JavaScript framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:55:08','2025-07-12 09:55:08','ed40f2b9-13b6-41ab-97ab-e0add5551340'),(112,38,3,'Home','home','__home__','{\"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:55:08','2025-07-12 09:55:08','0d73ef00-a38d-45eb-b045-93bc952f2b93'),(113,39,2,'Was Sie lernen können','was-du-lernen-kannst',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:55:08','2025-07-12 09:55:08','5dbcde43-5759-4337-aaa3-948a1408eccd'),(114,39,1,'What you can learn','this-starter-contains-f',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:55:08','2025-07-12 09:55:08','e3a03f92-173c-40f3-8ddd-e613a2ecdbf7'),(115,39,3,'Entry 12','entry-12',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:55:08','2025-07-12 09:55:08','12340a45-9958-4416-8a44-a07c95eadd69'),(116,40,2,'Bilder mit ImagerX','entry-14',NULL,'{\"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:55:08','2025-07-12 09:55:08','47693fc4-3d35-404a-9210-c7a44fb2f359'),(117,40,1,'ImagerX for Images','image',NULL,'{\"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\": \"<p>asdf</p>\", \"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:55:08','2025-07-12 09:55:08','f712b123-5682-4bc7-8ce2-ad4901c7eaf1'),(118,40,3,'Entry 14','entry-14',NULL,'{\"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:55:08','2025-07-12 09:55:08','008f8887-ca57-4f91-bc84-3f822075b6e0'),(119,41,2,'Ich hoffe du magst Katzen','i-hope-you-like-cats',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:55:08','2025-07-12 09:55:08','6eda30e3-011a-4998-9f53-278d579135e0'),(120,41,1,'I hope you like cats!','i-hope-you-like-cats',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:55:08','2025-07-12 09:55:08','f76698b1-dc8e-49a1-9e48-a8964254555b'),(121,41,3,'I hope you like cats!','i-hope-you-like-cats',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:55:08','2025-07-12 09:55:08','2907c992-a679-45c5-891b-53fc19f8b72f'),(128,44,2,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Vorlage\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Danke, dass du die Query API ausprobierst. Es bringt die Einfachheit von Twigs Datenabfragen in dein JavaScript-Framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:55:25','2025-07-12 09:55:25','f9f244f5-7265-4532-b1a5-72019413aa80'),(129,44,1,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Starter\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Thank you for trying the Query API. It brings the simplicity of Twig\'s data querying to your JavaScript framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:55:25','2025-07-12 09:55:25','0910cd65-4df0-4d65-8639-8acb793e3b2f'),(130,44,3,'Home','home','__home__','{\"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:55:25','2025-07-12 09:55:25','050b2389-a6c2-45ad-a48d-8e188efc93b7'),(131,45,2,'Ich hoffe du magst Katzen!','i-hope-you-like-cats',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:55:25','2025-07-12 09:55:25','66137a9e-e7fb-4192-a1cb-50da3e3bf834'),(132,45,1,'I hope you like cats!','i-hope-you-like-cats',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:55:25','2025-07-12 09:55:25','0b9a5ef4-f263-4343-a736-f2367cb9eb7c'),(133,45,3,'I hope you like cats!','i-hope-you-like-cats',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:55:25','2025-07-12 09:55:25','127619ca-a594-4c35-aa19-839b4762304f'),(146,50,3,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Plantilla\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Gracias por probar la Query API. Trae la simplicidad de las consultas de datos de Twig a tu framework de JavaScript.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:57:37','2025-07-12 09:57:37','4c73537c-ab8f-4c11-94f2-0e3bb9a7e1d0'),(147,50,1,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Starter\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Thank you for trying the Query API. It brings the simplicity of Twig\'s data querying to your JavaScript framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:57:37','2025-07-12 09:57:37','28e13433-cf81-456e-b3fd-e2975fb60a05'),(148,50,2,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Vorlage\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Danke, dass du die Query API ausprobierst. Es bringt die Einfachheit von Twigs Datenabfragen in dein JavaScript-Framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:57:37','2025-07-12 09:57:37','c88e869f-2c62-43a3-b9d6-628ebd918aa3'),(149,51,3,'Visión general','entry-12',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:57:37','2025-07-12 09:57:37','baada579-c715-4db6-a6e8-c3211548aa74'),(150,51,1,'What you can learn','this-starter-contains-f',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:57:37','2025-07-12 09:57:37','274140e7-1a9b-4ca4-aa24-d4b63ef8d8cb'),(151,51,2,'Was Sie lernen können','was-du-lernen-kannst',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:57:37','2025-07-12 09:57:37','ee982fbf-c869-4729-8249-e78bd9a144d8'),(152,52,3,'Imágenes con ImagerX','entry-14',NULL,'{\"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:57:37','2025-07-12 09:57:37','965c4239-d9e8-4300-b7d0-4cf33cfc997e'),(153,52,1,'ImagerX for Images','image',NULL,'{\"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\": \"<p>asdf</p>\", \"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:57:37','2025-07-12 09:57:37','a3076ab2-0aed-4b5d-9a5b-d53bf2273446'),(154,52,2,'Bilder mit ImagerX','entry-14',NULL,'{\"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:57:37','2025-07-12 09:57:37','6acb01c7-729c-4660-ae19-e0ece1372f66'),(155,53,3,'Espero que te gusten los gatos!','i-hope-you-like-cats',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:57:37','2025-07-12 09:57:37','9bb2d5c4-ef8b-4a84-932a-3a40c42a52f4'),(156,53,1,'I hope you like cats!','i-hope-you-like-cats',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:57:37','2025-07-12 09:57:37','7dfed888-8764-4ef6-881e-376a24b305b9'),(157,53,2,'Ich hoffe du magst Katzen!','i-hope-you-like-cats',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:57:37','2025-07-12 09:57:37','4af86e44-bd38-4714-b587-26118bdd811e'),(158,54,2,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Vorlage\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Danke, dass du die Query API ausprobierst. Es bringt die Einfachheit von Twigs Datenabfragen in dein JavaScript-Framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:57:48','2025-07-12 09:57:48','8c5c46bd-e5f1-402f-b95a-99907e5a260f'),(159,54,1,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Starter\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Thank you for trying the Query API. It brings the simplicity of Twig\'s data querying to your JavaScript framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:57:48','2025-07-12 09:57:48','49c84397-1ed2-4bd8-876b-9a014794a3c7'),(160,54,3,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Plantilla\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Gracias por probar la Query API. Trae la simplicidad de las consultas de datos de Twig a tu framework de JavaScript.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:57:48','2025-07-12 09:57:48','b1680d60-2538-4157-90b8-398f2975ffc8'),(161,55,2,'Übersicht','was-du-lernen-kannst',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:57:48','2025-07-12 09:57:48','e6f8329f-676c-4dc8-8db9-305f12220a92'),(162,55,1,'What you can learn','this-starter-contains-f',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:57:48','2025-07-12 09:57:48','f457fe78-fb1a-4191-8151-f260a0ecb692'),(163,55,3,'Visión general','entry-12',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:57:48','2025-07-12 09:57:48','8b752e4c-df6e-44f0-8c69-a36bfcea2a2a'),(164,56,1,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Starter\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Thank you for trying the Query API. It brings the simplicity of Twig\'s data querying to your JavaScript framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:58:05','2025-07-12 09:58:05','3aaa847d-caf7-4790-bd2c-5d8f0ef17923'),(165,56,2,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Vorlage\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Danke, dass du die Query API ausprobierst. Es bringt die Einfachheit von Twigs Datenabfragen in dein JavaScript-Framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:58:05','2025-07-12 09:58:05','768a6a81-da7d-4172-b315-fb2722163515'),(166,56,3,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Plantilla\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Gracias por probar la Query API. Trae la simplicidad de las consultas de datos de Twig a tu framework de JavaScript.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:58:05','2025-07-12 09:58:05','059acabd-68d7-4d0c-9b77-ff7975e6b745'),(167,57,1,'Overview','this-starter-contains-f',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:58:05','2025-07-12 09:58:05','e62ce35b-2a0a-4b8b-bdb4-52e07a3814e2'),(168,57,2,'Übersicht','was-du-lernen-kannst',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:58:05','2025-07-12 09:58:05','a049a244-a5ad-410c-8f43-76b40bf96fa4'),(169,57,3,'Visión general','entry-12',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 09:58:05','2025-07-12 09:58:05','08e7d259-0183-48ca-a067-afda91df1e5e'),(170,58,2,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Vorlage\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Danke, dass du die Query API ausprobierst. Es bringt die Einfachheit von Twigs Datenabfragen in dein JavaScript-Framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:58:26','2025-07-12 09:58:26','f2edd3fe-93bb-4289-8e48-1d4370f3f8dd'),(171,58,1,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Starter\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Thank you for trying the Query API. It brings the simplicity of Twig\'s data querying to your JavaScript framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:58:26','2025-07-12 09:58:26','dbe8cecc-cd64-419e-b8b1-db4aace08922'),(172,58,3,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Plantilla\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Gracias por probar la Query API. Trae la simplicidad de las consultas de datos de Twig a tu framework de JavaScript.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:58:26','2025-07-12 09:58:26','0b7fb2e6-bf7e-43a8-a9d9-f2c51195c6cb'),(173,59,2,'ImagerX für Bilder','entry-14',NULL,'{\"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:58:26','2025-07-12 09:58:26','85f229f5-8db4-4745-bfcb-933caf18c3cf'),(174,59,1,'ImagerX for Images','image',NULL,'{\"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\": \"<p>asdf</p>\", \"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:58:26','2025-07-12 09:58:26','c950480d-0736-4774-94a5-91326ff59d6f'),(175,59,3,'Imágenes con ImagerX','entry-14',NULL,'{\"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:58:26','2025-07-12 09:58:26','a09b3157-6764-4111-83eb-b70639652df7'),(176,60,3,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Plantilla\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Gracias por probar la Query API. Trae la simplicidad de las consultas de datos de Twig a tu framework de JavaScript.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:58:49','2025-07-12 09:58:49','ea98dc43-0e16-47b2-ad2d-50d494a53d5f'),(177,60,1,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Starter\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Thank you for trying the Query API. It brings the simplicity of Twig\'s data querying to your JavaScript framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:58:49','2025-07-12 09:58:49','86bebfc7-8b1a-4fc4-9325-e464bce3ac22'),(178,60,2,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Vorlage\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Danke, dass du die Query API ausprobierst. Es bringt die Einfachheit von Twigs Datenabfragen in dein JavaScript-Framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:58:49','2025-07-12 09:58:49','728eb4e2-1199-4ef6-b8c7-1c783e056cdf'),(179,61,3,'ImagerX para imágenes','entry-14',NULL,'{\"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:58:49','2025-07-12 09:58:49','abcc9616-e040-4688-82d8-6b0706c18ac8'),(180,61,1,'ImagerX for Images','image',NULL,'{\"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\": \"<p>asdf</p>\", \"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:58:49','2025-07-12 09:58:49','25039f9f-302e-44b0-b400-7c4c1982cc66'),(181,61,2,'ImagerX für Bilder','entry-14',NULL,'{\"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 09:58:49','2025-07-12 09:58:49','d11db6d1-2da5-4fb3-9a4a-1d7ae2a27821'),(182,62,3,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Plantilla\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Gracias por probar la Query API. Trae la simplicidad de las consultas de datos de Twig a tu framework de JavaScript.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:58:52','2025-07-12 09:58:52','ffdaf535-80ab-422c-9da9-d70af2b3aefe'),(183,62,1,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Starter\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Thank you for trying the Query API. It brings the simplicity of Twig\'s data querying to your JavaScript framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:58:52','2025-07-12 09:58:52','b50bc7d8-3e13-4bf2-8e80-4ebd3beadda1'),(184,62,2,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Vorlage\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Danke, dass du die Query API ausprobierst. Es bringt die Einfachheit von Twigs Datenabfragen in dein JavaScript-Framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 09:58:52','2025-07-12 09:58:52','88e096be-49b9-4909-8a2a-20db602eb16d'),(185,63,3,NULL,'__temp_saftmuqcesmjqloepiprqpxnxxoxlgxlvpvd','news/__temp_saftmuqcesmjqloepiprqpxnxxoxlgxlvpvd',NULL,1,'2025-07-12 09:59:02','2025-07-12 09:59:02','97b4f566-ed04-4554-9b47-f2deff762291'),(186,63,1,NULL,'__temp_saftmuqcesmjqloepiprqpxnxxoxlgxlvpvd','news/__temp_saftmuqcesmjqloepiprqpxnxxoxlgxlvpvd',NULL,1,'2025-07-12 09:59:02','2025-07-12 09:59:02','e5704771-ce3a-4c63-a4ae-ae191b033c18'),(187,63,2,NULL,'__temp_saftmuqcesmjqloepiprqpxnxxoxlgxlvpvd','news/__temp_saftmuqcesmjqloepiprqpxnxxoxlgxlvpvd',NULL,1,'2025-07-12 09:59:02','2025-07-12 09:59:02','bf55257e-3862-4abf-a5a0-1552754e5160'),(188,64,3,NULL,'__temp_bnshwhwzvoqcmnyjlxnovojiajpbxtjwdcoz','news/__temp_bnshwhwzvoqcmnyjlxnovojiajpbxtjwdcoz',NULL,1,'2025-07-12 10:01:29','2025-07-12 10:01:29','dbc49ca7-0e6e-4ab1-9bba-9a83118ba65d'),(189,64,1,NULL,'__temp_bnshwhwzvoqcmnyjlxnovojiajpbxtjwdcoz','news/__temp_bnshwhwzvoqcmnyjlxnovojiajpbxtjwdcoz',NULL,1,'2025-07-12 10:01:29','2025-07-12 10:01:29','cdac94dc-c8c7-46cf-96fe-cccfe22d7612'),(190,64,2,NULL,'__temp_bnshwhwzvoqcmnyjlxnovojiajpbxtjwdcoz','news/__temp_bnshwhwzvoqcmnyjlxnovojiajpbxtjwdcoz',NULL,1,'2025-07-12 10:01:29','2025-07-12 10:01:29','083eda57-c50b-4d67-98a3-bb89fde95bc5'),(191,65,3,'Gata se convierte en alcaldesa','entry-75','news/entry-75','{\"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\": \"Luna, la gata, ahora manda en un pueblo bávaro\", \"9df6cca2-8b86-4950-8eb0-cab6ce593922\": \"<p>En un pequeño pueblo de Baviera, una gata ha conquistado tanto los corazones como el cargo de la gente.</p>\", \"e477a46a-3858-4d77-9bf0-818e96c4dd91\": [25], \"fe994fac-b988-4451-85ed-9f95abfdf575\": []}',1,'2025-07-12 10:05:52','2025-07-12 10:11:12','1ef3a711-8ec0-4ef0-b3da-c1746442de0d'),(192,65,1,'Cat Becomes Mayor','cat-becomes-mayor','news/cat-becomes-mayor','{\"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\": \"Luna the Cat is Now the Mayor of a Bavarian Village\", \"9df6cca2-8b86-4950-8eb0-cab6ce593922\": \"<p>In a small village in Bavaria, a cat has captured both the hearts and the office of the people.</p>\", \"e477a46a-3858-4d77-9bf0-818e96c4dd91\": [25], \"fe994fac-b988-4451-85ed-9f95abfdf575\": []}',1,'2025-07-12 10:05:52','2025-07-12 10:10:19','5adf6b6b-b3f8-4443-85f9-630a80afbbf1'),(193,65,2,'Katze wird Bürgermeisterin','katze-wird-bürgermeisterin','news/katze-wird-bürgermeisterin','{\"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\": \"Katze Luna regiert jetzt ein Dorf in Österreich\", \"9df6cca2-8b86-4950-8eb0-cab6ce593922\": \"<p>In einem kleinen Ort in Bayern hat eine Katze die Herzen – und das Amt – der Bürger erobert.</p>\", \"e477a46a-3858-4d77-9bf0-818e96c4dd91\": [25], \"fe994fac-b988-4451-85ed-9f95abfdf575\": []}',1,'2025-07-12 10:05:52','2025-07-12 10:10:19','2698b44d-37e9-47d1-80ec-550c594be472'),(194,66,2,'Luna schnurrt sich zur Macht','luna-schnurrt-sich-zur-macht',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:08:50','2025-07-12 10:08:53','27eeb3e9-e2ea-4a33-8e52-e43258d2e78a'),(195,66,1,'Luna Purrs into Power','luna-schnurrt-sich-zur-macht',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:08:50','2025-07-12 10:10:19','212a58f4-9155-4aa2-9726-18057a9067f0'),(196,66,3,'Luna ronronea hacia el poder','luna-schnurrt-sich-zur-macht',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:08:50','2025-07-12 10:11:12','b377472c-bfae-4a5e-a97d-17492d0c52bd'),(197,67,2,NULL,'__temp_sxuivgwfukwutfnhygpybbcrcjzqolnlovaf',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Die graue Hauskatze Luna wurde von den Bewohnern des Dorfes Schnurrhausen zum Maskottchen gewählt. Doch schnell wollten alle mehr: „Warum nicht gleich Bürgermeisterin?“, meinte ein Anwohner scherzhaft. Gesagt, getan.</p>\"}',1,'2025-07-12 10:08:53','2025-07-12 10:09:00','e6929070-99ec-486a-8d14-939a390b42a5'),(198,67,1,NULL,'__temp_sxuivgwfukwutfnhygpybbcrcjzqolnlovaf',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>The grey house cat Luna was first voted the village mascot by the citizens of \\\"Schnurrhausen\\\". But soon, someone joked, “Why not make her mayor?” So they did.</p>\"}',1,'2025-07-12 10:08:53','2025-07-12 10:10:19','5c02c09a-1b6e-4906-8e63-442dd72e08d9'),(199,67,3,NULL,'__temp_sxuivgwfukwutfnhygpybbcrcjzqolnlovaf',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>La gata gris Luna fue elegida primero como mascota del pueblo de Schnurrhausen. Pero pronto alguien bromeó: “¿Y si la hacemos alcaldesa?” Y así fue.</p>\"}',1,'2025-07-12 10:08:53','2025-07-12 10:11:12','3d6c59fc-02a8-4c09-a552-7e1d63b6155e'),(200,68,2,'Bürgermeisteramt mit Stil','bürgermeisteramt-mit-stil',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:09:04','2025-07-12 10:09:09','996c5dd6-e948-4643-986f-06dd18b50c43'),(201,68,1,'A Mayor with Style','bürgermeisteramt-mit-stil',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:09:04','2025-07-12 10:10:19','0f7e7381-72ba-4d16-b0fa-93a209df9129'),(202,68,3,'Una alcaldesa con estilo','bürgermeisteramt-mit-stil',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:09:04','2025-07-12 10:11:12','808b6604-2bc4-475e-91fc-d075e8287576'),(203,69,2,NULL,'__temp_kdujushtkqeartnklonnfmwcwuzxiqjkprmn',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Seitdem sitzt Luna regelmäßig im Rathaus – auf einem Kissen, versteht sich. Ihre Aufgaben: Freundlich schnurren, sich sonnen und sich kraulen lassen. Die Einwohner sagen: „Sie macht das besser als manch echter Politiker!“</p>\"}',1,'2025-07-12 10:09:09','2025-07-12 10:09:15','ac619905-5858-416e-95b8-987c9e8c22e9'),(204,69,1,NULL,'__temp_kdujushtkqeartnklonnfmwcwuzxiqjkprmn',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Since then, Luna regularly visits the town hall—on a comfy pillow, of course. Her duties include purring kindly, sunbathing, and accepting cuddles. Locals say, “She’s better than some real politicians!”</p>\"}',1,'2025-07-12 10:09:09','2025-07-12 10:10:19','96995bb1-de48-475c-889f-c8f2726f7cc5'),(205,69,3,NULL,'__temp_kdujushtkqeartnklonnfmwcwuzxiqjkprmn',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Desde entonces, Luna visita el ayuntamiento con frecuencia, sentada en un cojín. Sus tareas: ronronear dulcemente, tomar el sol y aceptar caricias. Los vecinos dicen: “¡Lo hace mejor que algunos políticos de verdad!”</p>\"}',1,'2025-07-12 10:09:09','2025-07-12 10:11:12','175f396c-ce21-4617-b9a3-d8905f0b66b8'),(206,70,2,'Katze wird Bürgermeisterin','katze-wird-bürgermeisterin','news/katze-wird-bürgermeisterin','{\"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\": \"Katze Luna regiert jetzt ein Dorf in Österreich\", \"9df6cca2-8b86-4950-8eb0-cab6ce593922\": \"<p>In einem kleinen Ort in Bayern hat eine Katze die Herzen – und das Amt – der Bürger erobert.</p>\", \"e477a46a-3858-4d77-9bf0-818e96c4dd91\": [25]}',1,'2025-07-12 10:09:28','2025-07-12 10:09:28','c8a66bc1-a502-4946-a93e-78597b5afd7b'),(207,70,1,'Entry 70','__temp_fzdkfftegunkkufeqjigsxebigrvziaibzqn','news/__temp_fzdkfftegunkkufeqjigsxebigrvziaibzqn',NULL,1,'2025-07-12 10:09:28','2025-07-12 10:09:28','fdb4b7db-1340-4232-afac-0ce302d10910'),(208,70,3,'Entry 70','__temp_fzdkfftegunkkufeqjigsxebigrvziaibzqn','news/__temp_fzdkfftegunkkufeqjigsxebigrvziaibzqn',NULL,1,'2025-07-12 10:09:28','2025-07-12 10:09:28','123661d3-e6c0-4b72-90ec-f6dc0a690f93'),(209,71,2,'Luna schnurrt sich zur Macht','luna-schnurrt-sich-zur-macht',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:09:28','2025-07-12 10:09:28','95f2af06-2f6e-4c5e-b2f6-75f53a475ded'),(210,71,1,'Luna schnurrt sich zur Macht','luna-schnurrt-sich-zur-macht',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:09:28','2025-07-12 10:09:28','60c7f817-ca93-4d69-96f1-5ccdfddd5c7b'),(211,71,3,'Luna schnurrt sich zur Macht','luna-schnurrt-sich-zur-macht',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:09:28','2025-07-12 10:09:28','6fe48e26-aa7e-4bcc-ba13-8e0025fd9faf'),(212,72,2,NULL,'__temp_sxuivgwfukwutfnhygpybbcrcjzqolnlovaf',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Die graue Hauskatze Luna wurde von den Bewohnern des Dorfes Schnurrhausen zum Maskottchen gewählt. Doch schnell wollten alle mehr: „Warum nicht gleich Bürgermeisterin?“, meinte ein Anwohner scherzhaft. Gesagt, getan.</p>\"}',1,'2025-07-12 10:09:28','2025-07-12 10:09:28','a7a271f6-3962-49d1-aa17-48c6e88a4a6b'),(213,72,1,NULL,'__temp_sxuivgwfukwutfnhygpybbcrcjzqolnlovaf',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Die graue Hauskatze Luna wurde von den Bewohnern des Dorfes Schnurrhausen zum Maskottchen gewählt. Doch schnell wollten alle mehr: „Warum nicht gleich Bürgermeisterin?“, meinte ein Anwohner scherzhaft. Gesagt, getan.</p>\"}',1,'2025-07-12 10:09:28','2025-07-12 10:09:28','3d20634a-db14-461e-b6f4-b1d749a3e407'),(214,72,3,NULL,'__temp_sxuivgwfukwutfnhygpybbcrcjzqolnlovaf',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Die graue Hauskatze Luna wurde von den Bewohnern des Dorfes Schnurrhausen zum Maskottchen gewählt. Doch schnell wollten alle mehr: „Warum nicht gleich Bürgermeisterin?“, meinte ein Anwohner scherzhaft. Gesagt, getan.</p>\"}',1,'2025-07-12 10:09:28','2025-07-12 10:09:28','871b3a38-0472-4d69-9b64-83c8cfe26802'),(215,73,2,'Bürgermeisteramt mit Stil','bürgermeisteramt-mit-stil',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:09:28','2025-07-12 10:09:28','d88cb80c-324f-47b0-bb32-1c21efff211f'),(216,73,1,'Bürgermeisteramt mit Stil','bürgermeisteramt-mit-stil',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:09:28','2025-07-12 10:09:28','8980b6b3-3230-4ef3-bd41-54a43d13332b'),(217,73,3,'Bürgermeisteramt mit Stil','bürgermeisteramt-mit-stil',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:09:28','2025-07-12 10:09:28','c1764ee4-d1b1-46df-9129-9c2ae1b85463'),(218,74,2,NULL,'__temp_kdujushtkqeartnklonnfmwcwuzxiqjkprmn',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Seitdem sitzt Luna regelmäßig im Rathaus – auf einem Kissen, versteht sich. Ihre Aufgaben: Freundlich schnurren, sich sonnen und sich kraulen lassen. Die Einwohner sagen: „Sie macht das besser als manch echter Politiker!“</p>\"}',1,'2025-07-12 10:09:28','2025-07-12 10:09:28','c5cb2583-b628-43e0-bdc8-4fbde12bdaae'),(219,74,1,NULL,'__temp_kdujushtkqeartnklonnfmwcwuzxiqjkprmn',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Seitdem sitzt Luna regelmäßig im Rathaus – auf einem Kissen, versteht sich. Ihre Aufgaben: Freundlich schnurren, sich sonnen und sich kraulen lassen. Die Einwohner sagen: „Sie macht das besser als manch echter Politiker!“</p>\"}',1,'2025-07-12 10:09:28','2025-07-12 10:09:28','75279e65-dc9c-4da1-aa14-ab100f601222'),(220,74,3,NULL,'__temp_kdujushtkqeartnklonnfmwcwuzxiqjkprmn',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Seitdem sitzt Luna regelmäßig im Rathaus – auf einem Kissen, versteht sich. Ihre Aufgaben: Freundlich schnurren, sich sonnen und sich kraulen lassen. Die Einwohner sagen: „Sie macht das besser als manch echter Politiker!“</p>\"}',1,'2025-07-12 10:09:28','2025-07-12 10:09:28','b718c6d0-fb99-40b3-ac4f-893e9ff5701d'),(236,80,1,'Cat Becomes Mayor','cat-becomes-mayor','news/cat-becomes-mayor','{\"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\": \"Luna the Cat is Now the Mayor of a Bavarian Village\", \"9df6cca2-8b86-4950-8eb0-cab6ce593922\": \"<p>In a small village in Bavaria, a cat has captured both the hearts and the office of the people.</p>\", \"e477a46a-3858-4d77-9bf0-818e96c4dd91\": [25]}',1,'2025-07-12 10:10:19','2025-07-12 10:10:19','d39a959a-e23d-4aac-99ba-975212f5f3d2'),(237,80,2,'Katze wird Bürgermeisterin','katze-wird-bürgermeisterin','news/katze-wird-bürgermeisterin','{\"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\": \"Katze Luna regiert jetzt ein Dorf in Österreich\", \"9df6cca2-8b86-4950-8eb0-cab6ce593922\": \"<p>In einem kleinen Ort in Bayern hat eine Katze die Herzen – und das Amt – der Bürger erobert.</p>\", \"e477a46a-3858-4d77-9bf0-818e96c4dd91\": [25]}',1,'2025-07-12 10:10:19','2025-07-12 10:10:19','fa5374f1-da6e-4af0-84b8-055c8316f4bf'),(238,80,3,'Entry 75','entry-75','news/entry-75',NULL,1,'2025-07-12 10:10:19','2025-07-12 10:10:19','092428b0-d9a8-429a-b96a-9e3e9e47af37'),(239,81,1,'Luna Purrs into Power','luna-schnurrt-sich-zur-macht',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:10:19','2025-07-12 10:10:19','d576bd12-1392-4e7a-b87a-15a8cc99fb52'),(240,81,2,'Luna schnurrt sich zur Macht','luna-schnurrt-sich-zur-macht',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:10:19','2025-07-12 10:10:19','4bce38b4-1a1e-45ba-9a89-28884653161d'),(241,81,3,'Luna schnurrt sich zur Macht','luna-schnurrt-sich-zur-macht',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:10:19','2025-07-12 10:10:19','1e0682fe-081b-4882-98d4-841a2120f754'),(242,82,1,NULL,'__temp_sxuivgwfukwutfnhygpybbcrcjzqolnlovaf',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>The grey house cat Luna was first voted the village mascot by the citizens of \\\"Schnurrhausen\\\". But soon, someone joked, “Why not make her mayor?” So they did.</p>\"}',1,'2025-07-12 10:10:19','2025-07-12 10:10:19','989b3886-e083-4191-86a1-e00e5ccd286a'),(243,82,2,NULL,'__temp_sxuivgwfukwutfnhygpybbcrcjzqolnlovaf',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Die graue Hauskatze Luna wurde von den Bewohnern des Dorfes Schnurrhausen zum Maskottchen gewählt. Doch schnell wollten alle mehr: „Warum nicht gleich Bürgermeisterin?“, meinte ein Anwohner scherzhaft. Gesagt, getan.</p>\"}',1,'2025-07-12 10:10:19','2025-07-12 10:10:19','992c167d-1faf-40c7-86b8-f2f26a3d7ad4'),(244,82,3,NULL,'__temp_sxuivgwfukwutfnhygpybbcrcjzqolnlovaf',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Die graue Hauskatze Luna wurde von den Bewohnern des Dorfes Schnurrhausen zum Maskottchen gewählt. Doch schnell wollten alle mehr: „Warum nicht gleich Bürgermeisterin?“, meinte ein Anwohner scherzhaft. Gesagt, getan.</p>\"}',1,'2025-07-12 10:10:19','2025-07-12 10:10:19','2ea76db6-4910-468a-8c73-b51dc8907da6'),(245,83,1,'A Mayor with Style','bürgermeisteramt-mit-stil',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:10:19','2025-07-12 10:10:19','1c5272c0-40e6-41f6-a689-004ffda076d4'),(246,83,2,'Bürgermeisteramt mit Stil','bürgermeisteramt-mit-stil',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:10:19','2025-07-12 10:10:19','6a6017f5-b7f0-479a-9186-4ede06df7035'),(247,83,3,'Bürgermeisteramt mit Stil','bürgermeisteramt-mit-stil',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:10:19','2025-07-12 10:10:19','b7ca0eea-8c78-47cb-baa3-1e2b5e685c30'),(248,84,1,NULL,'__temp_kdujushtkqeartnklonnfmwcwuzxiqjkprmn',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Since then, Luna regularly visits the town hall—on a comfy pillow, of course. Her duties include purring kindly, sunbathing, and accepting cuddles. Locals say, “She’s better than some real politicians!”</p>\"}',1,'2025-07-12 10:10:19','2025-07-12 10:10:19','416060f0-d56d-4442-aab2-272f3f6b854e'),(249,84,2,NULL,'__temp_kdujushtkqeartnklonnfmwcwuzxiqjkprmn',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Seitdem sitzt Luna regelmäßig im Rathaus – auf einem Kissen, versteht sich. Ihre Aufgaben: Freundlich schnurren, sich sonnen und sich kraulen lassen. Die Einwohner sagen: „Sie macht das besser als manch echter Politiker!“</p>\"}',1,'2025-07-12 10:10:19','2025-07-12 10:10:19','b6cb572f-c1d0-40f2-be0c-d5809a93c296'),(250,84,3,NULL,'__temp_kdujushtkqeartnklonnfmwcwuzxiqjkprmn',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Seitdem sitzt Luna regelmäßig im Rathaus – auf einem Kissen, versteht sich. Ihre Aufgaben: Freundlich schnurren, sich sonnen und sich kraulen lassen. Die Einwohner sagen: „Sie macht das besser als manch echter Politiker!“</p>\"}',1,'2025-07-12 10:10:19','2025-07-12 10:10:19','5b955e74-16e0-4b69-9246-9765d2fd0c76'),(266,90,3,'Gata se convierte en alcaldesa','entry-75','news/entry-75','{\"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\": \"Luna, la gata, ahora manda en un pueblo bávaro\", \"9df6cca2-8b86-4950-8eb0-cab6ce593922\": \"<p>En un pequeño pueblo de Baviera, una gata ha conquistado tanto los corazones como el cargo de la gente.</p>\", \"e477a46a-3858-4d77-9bf0-818e96c4dd91\": [25]}',1,'2025-07-12 10:11:12','2025-07-12 10:11:12','2224c477-a0bc-4491-9d47-c59f29a13a06'),(267,90,1,'Cat Becomes Mayor','cat-becomes-mayor','news/cat-becomes-mayor','{\"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\": \"Luna the Cat is Now the Mayor of a Bavarian Village\", \"9df6cca2-8b86-4950-8eb0-cab6ce593922\": \"<p>In a small village in Bavaria, a cat has captured both the hearts and the office of the people.</p>\", \"e477a46a-3858-4d77-9bf0-818e96c4dd91\": [25]}',1,'2025-07-12 10:11:12','2025-07-12 10:11:12','aeea4468-0a7f-4dfe-a248-debe4225b4ec'),(268,90,2,'Katze wird Bürgermeisterin','katze-wird-bürgermeisterin','news/katze-wird-bürgermeisterin','{\"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\": \"Katze Luna regiert jetzt ein Dorf in Österreich\", \"9df6cca2-8b86-4950-8eb0-cab6ce593922\": \"<p>In einem kleinen Ort in Bayern hat eine Katze die Herzen – und das Amt – der Bürger erobert.</p>\", \"e477a46a-3858-4d77-9bf0-818e96c4dd91\": [25]}',1,'2025-07-12 10:11:12','2025-07-12 10:11:12','1f874fd3-38a0-44c8-ae13-aa6e941ddfba'),(269,91,3,'Luna ronronea hacia el poder','luna-schnurrt-sich-zur-macht',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:11:12','2025-07-12 10:11:12','caa407f1-139a-4d99-a96e-0710bac0eaa9'),(270,91,1,'Luna Purrs into Power','luna-schnurrt-sich-zur-macht',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:11:12','2025-07-12 10:11:12','5f216076-8d29-4299-92f8-66d1fd67720f'),(271,91,2,'Luna schnurrt sich zur Macht','luna-schnurrt-sich-zur-macht',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:11:12','2025-07-12 10:11:12','db5f2625-4288-4ec6-a4e4-3ae7054d8e0e'),(272,92,3,NULL,'__temp_sxuivgwfukwutfnhygpybbcrcjzqolnlovaf',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>La gata gris Luna fue elegida primero como mascota del pueblo de Schnurrhausen. Pero pronto alguien bromeó: “¿Y si la hacemos alcaldesa?” Y así fue.</p>\"}',1,'2025-07-12 10:11:12','2025-07-12 10:11:12','42d3602b-d304-4f82-8c5f-9f4afa7bf58f'),(273,92,1,NULL,'__temp_sxuivgwfukwutfnhygpybbcrcjzqolnlovaf',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>The grey house cat Luna was first voted the village mascot by the citizens of \\\"Schnurrhausen\\\". But soon, someone joked, “Why not make her mayor?” So they did.</p>\"}',1,'2025-07-12 10:11:12','2025-07-12 10:11:12','be2a4c91-20a4-48f3-843d-05211ddbfcbd'),(274,92,2,NULL,'__temp_sxuivgwfukwutfnhygpybbcrcjzqolnlovaf',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Die graue Hauskatze Luna wurde von den Bewohnern des Dorfes Schnurrhausen zum Maskottchen gewählt. Doch schnell wollten alle mehr: „Warum nicht gleich Bürgermeisterin?“, meinte ein Anwohner scherzhaft. Gesagt, getan.</p>\"}',1,'2025-07-12 10:11:12','2025-07-12 10:11:12','4fa7fca7-cda5-42e3-9332-f38140e6a365'),(275,93,3,'Una alcaldesa con estilo','bürgermeisteramt-mit-stil',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:11:12','2025-07-12 10:11:12','5322715d-c7a5-4aed-a811-c90d75a17001'),(276,93,1,'A Mayor with Style','bürgermeisteramt-mit-stil',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:11:12','2025-07-12 10:11:12','72e74730-8977-45a4-a2f7-8da158615402'),(277,93,2,'Bürgermeisteramt mit Stil','bürgermeisteramt-mit-stil',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:11:12','2025-07-12 10:11:12','e16fa554-13fd-43fc-b669-aafe847dc501'),(278,94,3,NULL,'__temp_kdujushtkqeartnklonnfmwcwuzxiqjkprmn',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Desde entonces, Luna visita el ayuntamiento con frecuencia, sentada en un cojín. Sus tareas: ronronear dulcemente, tomar el sol y aceptar caricias. Los vecinos dicen: “¡Lo hace mejor que algunos políticos de verdad!”</p>\"}',1,'2025-07-12 10:11:12','2025-07-12 10:11:12','1fa326a2-7994-48ed-8b0a-b5f23a13ba2b'),(279,94,1,NULL,'__temp_kdujushtkqeartnklonnfmwcwuzxiqjkprmn',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Since then, Luna regularly visits the town hall—on a comfy pillow, of course. Her duties include purring kindly, sunbathing, and accepting cuddles. Locals say, “She’s better than some real politicians!”</p>\"}',1,'2025-07-12 10:11:12','2025-07-12 10:11:12','f3d39886-cc99-4f88-9c07-c76889931e91'),(280,94,2,NULL,'__temp_kdujushtkqeartnklonnfmwcwuzxiqjkprmn',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Seitdem sitzt Luna regelmäßig im Rathaus – auf einem Kissen, versteht sich. Ihre Aufgaben: Freundlich schnurren, sich sonnen und sich kraulen lassen. Die Einwohner sagen: „Sie macht das besser als manch echter Politiker!“</p>\"}',1,'2025-07-12 10:11:12','2025-07-12 10:11:12','7ece5314-8315-4956-b49a-2a5990580c1b'),(281,95,1,'Cat Teaches Yoga','cat-teaches-yoga','news/cat-teaches-yoga','{\"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\": \"Whiskers Leads the Way with “Pawmaste” Yoga\", \"9df6cca2-8b86-4950-8eb0-cab6ce593922\": \"<p>A cat has become a viral star by joining yoga sessions—and totally nailing it.</p>\", \"e477a46a-3858-4d77-9bf0-818e96c4dd91\": [23], \"fe994fac-b988-4451-85ed-9f95abfdf575\": []}',1,'2025-07-12 10:11:18','2025-07-12 10:13:17','afc1cb66-8c86-4437-b74c-dd98eceb5938'),(282,95,2,'Katze unterrichtet Yoga','katze-unterrichtet-yoga','news/katze-unterrichtet-yoga','{\"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\": \"Whiskers zeigt Menschen den „Katzengruß“\", \"9df6cca2-8b86-4950-8eb0-cab6ce593922\": \"<p>Eine Katze wurde zum viralen Star, weil sie Yoga macht – und dabei ziemlich professionell aussieht.</p>\", \"e477a46a-3858-4d77-9bf0-818e96c4dd91\": [23], \"fe994fac-b988-4451-85ed-9f95abfdf575\": []}',1,'2025-07-12 10:11:18','2025-07-12 10:13:17','cb5946a2-a3d8-4612-8cb2-5bbd10c86f01'),(283,95,3,'Gata enseña yoga','entry-105','news/entry-105','{\"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\": \"Whiskers lidera clases con “Pawmaste”\", \"9df6cca2-8b86-4950-8eb0-cab6ce593922\": \"<p>Una gata se volvió famosa por unirse a sesiones de yoga — ¡y hacerlo muy bien!</p>\", \"e477a46a-3858-4d77-9bf0-818e96c4dd91\": [23], \"fe994fac-b988-4451-85ed-9f95abfdf575\": []}',1,'2025-07-12 10:11:18','2025-07-12 10:14:11','358be8ab-a526-4c89-8614-ffb40ff7fdbf'),(284,96,2,'Katzen-Yoga für alle!','katzen-yoga-für-alle',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:11:46','2025-07-12 10:11:49','dd650320-1992-418e-b6aa-5ad5c4e04f10'),(285,96,1,'Cat Yoga for Everyone','katzen-yoga-für-alle',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:11:46','2025-07-12 10:13:17','651a6cb8-b009-4fca-b2d6-c682390188db'),(286,96,3,'Yoga gatuno para todos','katzen-yoga-für-alle',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:11:46','2025-07-12 10:14:11','d965362c-4fdb-4992-a270-fa6b4288703b'),(287,97,2,NULL,'__temp_dpclzfbvpszidleamlpefwbxeskbqfjpvrjw',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Whiskers begann ganz harmlos: Ihre Besitzerin filmte eine Yoga-Session – und Whiskers machte begeistert mit! Vom Herabschauenden Hund bis zur perfekten Kobra – sie konnte alles.</p>\"}',1,'2025-07-12 10:11:49','2025-07-12 10:11:54','536cecd3-e9e8-4ce8-802e-800cfaf9ee24'),(288,97,1,NULL,'__temp_dpclzfbvpszidleamlpefwbxeskbqfjpvrjw',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Whiskers started off innocently: her owner filmed a yoga routine, and the cat joined in. From downward dog to a flawless cobra pose—she nailed them all.</p>\"}',1,'2025-07-12 10:11:49','2025-07-12 10:13:17','37bec2bc-54bd-4057-b246-19250d54b3df'),(289,97,3,NULL,'__temp_dpclzfbvpszidleamlpefwbxeskbqfjpvrjw',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Whiskers comenzó por accidente: su dueña grabó una clase de yoga, y la gata participó encantada. Desde el perro hacia abajo hasta la cobra perfecta, ¡dominó cada postura!</p>\"}',1,'2025-07-12 10:11:49','2025-07-12 10:14:11','5b036f04-0a81-4e17-af0f-b67c106cb866'),(290,98,2,NULL,'__temp_fbqkelixwjsodajvvewjdmbnunzjrvgytzko',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Mittlerweile streamt Whiskers wöchentlich ihre eigene Yogastunde: „Pawmaste Yoga“. Tausende Fans folgen ihrem flauschigen Flow. Ein Fan schrieb: „Ich entspanne mehr beim Zuschauen als beim Mitmachen!“</p>\"}',1,'2025-07-12 10:11:56','2025-07-12 10:12:12','b8bf0d5d-91f8-4659-a120-dd65f820e23a'),(291,98,1,NULL,'__temp_fbqkelixwjsodajvvewjdmbnunzjrvgytzko',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Now, Whiskers hosts a weekly stream called \\\"Pawmaste Yoga.\\\" Thousands of fans follow her fluffy flow. One fan wrote: \\\"Watching her is more relaxing than doing yoga myself!\\\"</p>\"}',1,'2025-07-12 10:11:56','2025-07-12 10:13:17','1049c9bd-f26a-4e06-8ae6-e7cb176729d8'),(292,98,3,NULL,'__temp_fbqkelixwjsodajvvewjdmbnunzjrvgytzko',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Ahora, Whiskers tiene un stream semanal llamado “Pawmaste Yoga”. Miles de fans siguen su flow peludo. Un comentario decía: “¡Solo verla ya me relaja más que una siesta!”</p>\"}',1,'2025-07-12 10:11:56','2025-07-12 10:14:11','ac026cc0-99a7-4765-881c-95d13ba2ff7e'),(293,99,2,'Pawmaste statt Namaste','pawmaste-statt-namaste',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:11:59','2025-07-12 10:12:07','f6adc280-9feb-47c8-bac6-eeb28cf48a01'),(294,99,1,'Pawmaste, not Namaste','pawmaste-statt-namaste',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:11:59','2025-07-12 10:13:17','315c3298-2242-48af-8578-200ed7976bd9'),(295,99,3,'Pawmaste: más zen que nunca','pawmaste-statt-namaste',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:11:59','2025-07-12 10:14:11','5b586e5b-897e-4b8b-90e1-81f020510720'),(296,100,2,'Katze unterrichtet Yoga','katze-unterrichtet-yoga','news/katze-unterrichtet-yoga','{\"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\": \"Whiskers zeigt Menschen den „Katzengruß“\", \"9df6cca2-8b86-4950-8eb0-cab6ce593922\": \"<p>Eine Katze wurde zum viralen Star, weil sie Yoga macht – und dabei ziemlich professionell aussieht.</p>\", \"e477a46a-3858-4d77-9bf0-818e96c4dd91\": [23]}',1,'2025-07-12 10:12:28','2025-07-12 10:12:28','3370f68c-bce1-4854-acf1-0ba579ec85c9'),(297,100,1,'Entry 100','__temp_ugexeuqplrzamgyftpdullkgvfjggkybutmg','news/__temp_ugexeuqplrzamgyftpdullkgvfjggkybutmg',NULL,1,'2025-07-12 10:12:28','2025-07-12 10:12:28','02880c13-17e8-413d-b957-6da3dbd9cdfa'),(298,100,3,'Entry 100','__temp_ugexeuqplrzamgyftpdullkgvfjggkybutmg','news/__temp_ugexeuqplrzamgyftpdullkgvfjggkybutmg',NULL,1,'2025-07-12 10:12:28','2025-07-12 10:12:28','600f661e-72e0-42c3-83dc-1faa11798c03'),(299,101,2,'Katzen-Yoga für alle!','katzen-yoga-für-alle',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:12:28','2025-07-12 10:12:28','a7b81e2f-b008-4e4d-80de-c097fd96cd3c'),(300,101,1,'Katzen-Yoga für alle!','katzen-yoga-für-alle',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:12:28','2025-07-12 10:12:28','f210abe8-5fd9-4625-be4a-22afc2b778a0'),(301,101,3,'Katzen-Yoga für alle!','katzen-yoga-für-alle',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:12:28','2025-07-12 10:12:28','bb5440c7-771d-4eca-852b-3102051174a1'),(302,102,2,NULL,'__temp_dpclzfbvpszidleamlpefwbxeskbqfjpvrjw',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Whiskers begann ganz harmlos: Ihre Besitzerin filmte eine Yoga-Session – und Whiskers machte begeistert mit! Vom Herabschauenden Hund bis zur perfekten Kobra – sie konnte alles.</p>\"}',1,'2025-07-12 10:12:28','2025-07-12 10:12:28','f52a6ab4-27bc-4429-a517-d058d14e0650'),(303,102,1,NULL,'__temp_dpclzfbvpszidleamlpefwbxeskbqfjpvrjw',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Whiskers begann ganz harmlos: Ihre Besitzerin filmte eine Yoga-Session – und Whiskers machte begeistert mit! Vom Herabschauenden Hund bis zur perfekten Kobra – sie konnte alles.</p>\"}',1,'2025-07-12 10:12:28','2025-07-12 10:12:28','b95730a5-a8e8-4b60-8232-851b44a0c03d'),(304,102,3,NULL,'__temp_dpclzfbvpszidleamlpefwbxeskbqfjpvrjw',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Whiskers begann ganz harmlos: Ihre Besitzerin filmte eine Yoga-Session – und Whiskers machte begeistert mit! Vom Herabschauenden Hund bis zur perfekten Kobra – sie konnte alles.</p>\"}',1,'2025-07-12 10:12:28','2025-07-12 10:12:28','9d597ca1-5856-4a10-a4a4-95fd8740af0e'),(305,103,2,'Pawmaste statt Namaste','pawmaste-statt-namaste',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:12:28','2025-07-12 10:12:28','3714a987-1550-48c4-ad31-2512fc3357e4'),(306,103,1,'Pawmaste statt Namaste','pawmaste-statt-namaste',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:12:28','2025-07-12 10:12:28','680a38c0-f42d-47c0-8e4e-e4a24ae06f14'),(307,103,3,'Pawmaste statt Namaste','pawmaste-statt-namaste',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:12:28','2025-07-12 10:12:28','5625304b-ec23-4ff3-a9ab-715f32f8d918'),(308,104,2,NULL,'__temp_fbqkelixwjsodajvvewjdmbnunzjrvgytzko',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Mittlerweile streamt Whiskers wöchentlich ihre eigene Yogastunde: „Pawmaste Yoga“. Tausende Fans folgen ihrem flauschigen Flow. Ein Fan schrieb: „Ich entspanne mehr beim Zuschauen als beim Mitmachen!“</p>\"}',1,'2025-07-12 10:12:28','2025-07-12 10:12:28','6643a3a2-50d4-4ac3-bf62-a8c7ee44c6f1'),(309,104,1,NULL,'__temp_fbqkelixwjsodajvvewjdmbnunzjrvgytzko',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Mittlerweile streamt Whiskers wöchentlich ihre eigene Yogastunde: „Pawmaste Yoga“. Tausende Fans folgen ihrem flauschigen Flow. Ein Fan schrieb: „Ich entspanne mehr beim Zuschauen als beim Mitmachen!“</p>\"}',1,'2025-07-12 10:12:28','2025-07-12 10:12:28','fd1f1990-5be9-40a4-bdcb-a2069163bfcb'),(310,104,3,NULL,'__temp_fbqkelixwjsodajvvewjdmbnunzjrvgytzko',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Mittlerweile streamt Whiskers wöchentlich ihre eigene Yogastunde: „Pawmaste Yoga“. Tausende Fans folgen ihrem flauschigen Flow. Ein Fan schrieb: „Ich entspanne mehr beim Zuschauen als beim Mitmachen!“</p>\"}',1,'2025-07-12 10:12:28','2025-07-12 10:12:28','2eb2e6fe-c893-4869-a0a1-6ed838d1ef1f'),(326,110,1,'Cat Teaches Yoga','cat-teaches-yoga','news/cat-teaches-yoga','{\"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\": \"Whiskers Leads the Way with “Pawmaste” Yoga\", \"9df6cca2-8b86-4950-8eb0-cab6ce593922\": \"<p>A cat has become a viral star by joining yoga sessions—and totally nailing it.</p>\", \"e477a46a-3858-4d77-9bf0-818e96c4dd91\": [23]}',1,'2025-07-12 10:13:17','2025-07-12 10:13:17','11ccfdab-8f5c-45bf-a365-68c717fd7385'),(327,110,2,'Katze unterrichtet Yoga','katze-unterrichtet-yoga','news/katze-unterrichtet-yoga','{\"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\": \"Whiskers zeigt Menschen den „Katzengruß“\", \"9df6cca2-8b86-4950-8eb0-cab6ce593922\": \"<p>Eine Katze wurde zum viralen Star, weil sie Yoga macht – und dabei ziemlich professionell aussieht.</p>\", \"e477a46a-3858-4d77-9bf0-818e96c4dd91\": [23]}',1,'2025-07-12 10:13:17','2025-07-12 10:13:17','849e0780-33e2-4a2a-8be0-d1d70480e0c1'),(328,110,3,'Entry 105','entry-105','news/entry-105',NULL,1,'2025-07-12 10:13:17','2025-07-12 10:13:17','45d52f86-1e7f-4acf-afe3-2468de77a761'),(329,111,1,'Cat Yoga for Everyone','katzen-yoga-für-alle',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:13:17','2025-07-12 10:13:17','0460b3f1-04d7-41e2-bd34-d5ea5e6a1ac7'),(330,111,2,'Katzen-Yoga für alle!','katzen-yoga-für-alle',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:13:17','2025-07-12 10:13:17','12f29ffb-bafd-43a9-8fa3-95a2fc1a7310'),(331,111,3,'Katzen-Yoga für alle!','katzen-yoga-für-alle',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:13:17','2025-07-12 10:13:17','cfdee0bd-b270-4149-9d36-28a95fdee38e'),(332,112,1,NULL,'__temp_dpclzfbvpszidleamlpefwbxeskbqfjpvrjw',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Whiskers started off innocently: her owner filmed a yoga routine, and the cat joined in. From downward dog to a flawless cobra pose—she nailed them all.</p>\"}',1,'2025-07-12 10:13:17','2025-07-12 10:13:17','7158f4e7-92d2-4d7e-bf99-b31648fcda39'),(333,112,2,NULL,'__temp_dpclzfbvpszidleamlpefwbxeskbqfjpvrjw',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Whiskers begann ganz harmlos: Ihre Besitzerin filmte eine Yoga-Session – und Whiskers machte begeistert mit! Vom Herabschauenden Hund bis zur perfekten Kobra – sie konnte alles.</p>\"}',1,'2025-07-12 10:13:17','2025-07-12 10:13:17','eae4b2b3-909e-45d8-8b8c-ef3d9d041d62'),(334,112,3,NULL,'__temp_dpclzfbvpszidleamlpefwbxeskbqfjpvrjw',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Whiskers begann ganz harmlos: Ihre Besitzerin filmte eine Yoga-Session – und Whiskers machte begeistert mit! Vom Herabschauenden Hund bis zur perfekten Kobra – sie konnte alles.</p>\"}',1,'2025-07-12 10:13:17','2025-07-12 10:13:17','8cd19025-1e68-4e94-8cac-de5b1152a375'),(335,113,1,'Pawmaste, not Namaste','pawmaste-statt-namaste',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:13:17','2025-07-12 10:13:17','2bab4497-5983-4dc8-b231-e4735572f740'),(336,113,2,'Pawmaste statt Namaste','pawmaste-statt-namaste',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:13:17','2025-07-12 10:13:17','7f8ede9b-2cbf-42ab-97b7-756796a798f4'),(337,113,3,'Pawmaste statt Namaste','pawmaste-statt-namaste',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:13:17','2025-07-12 10:13:17','d42ab515-1074-4cd6-afa9-eac899340be6'),(338,114,1,NULL,'__temp_fbqkelixwjsodajvvewjdmbnunzjrvgytzko',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Now, Whiskers hosts a weekly stream called \\\"Pawmaste Yoga.\\\" Thousands of fans follow her fluffy flow. One fan wrote: \\\"Watching her is more relaxing than doing yoga myself!\\\"</p>\"}',1,'2025-07-12 10:13:17','2025-07-12 10:13:17','ec6f0271-ea37-47fd-a8f8-ea396424e052'),(339,114,2,NULL,'__temp_fbqkelixwjsodajvvewjdmbnunzjrvgytzko',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Mittlerweile streamt Whiskers wöchentlich ihre eigene Yogastunde: „Pawmaste Yoga“. Tausende Fans folgen ihrem flauschigen Flow. Ein Fan schrieb: „Ich entspanne mehr beim Zuschauen als beim Mitmachen!“</p>\"}',1,'2025-07-12 10:13:17','2025-07-12 10:13:17','fbd3e327-f0cc-4874-9325-e95a3b58b489'),(340,114,3,NULL,'__temp_fbqkelixwjsodajvvewjdmbnunzjrvgytzko',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Mittlerweile streamt Whiskers wöchentlich ihre eigene Yogastunde: „Pawmaste Yoga“. Tausende Fans folgen ihrem flauschigen Flow. Ein Fan schrieb: „Ich entspanne mehr beim Zuschauen als beim Mitmachen!“</p>\"}',1,'2025-07-12 10:13:17','2025-07-12 10:13:17','a9a33eb2-72f5-41f6-98d7-1fe30c57fba6'),(356,120,3,'Gata enseña yoga','entry-105','news/entry-105','{\"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\": \"Whiskers lidera clases con “Pawmaste”\", \"9df6cca2-8b86-4950-8eb0-cab6ce593922\": \"<p>Una gata se volvió famosa por unirse a sesiones de yoga — ¡y hacerlo muy bien!</p>\", \"e477a46a-3858-4d77-9bf0-818e96c4dd91\": [23]}',1,'2025-07-12 10:14:11','2025-07-12 10:14:11','82f3c4df-e172-4ea9-baa1-7d059870bdcb'),(357,120,1,'Cat Teaches Yoga','cat-teaches-yoga','news/cat-teaches-yoga','{\"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\": \"Whiskers Leads the Way with “Pawmaste” Yoga\", \"9df6cca2-8b86-4950-8eb0-cab6ce593922\": \"<p>A cat has become a viral star by joining yoga sessions—and totally nailing it.</p>\", \"e477a46a-3858-4d77-9bf0-818e96c4dd91\": [23]}',1,'2025-07-12 10:14:11','2025-07-12 10:14:11','66c3b829-8105-4b39-84a5-887c402ddaef'),(358,120,2,'Katze unterrichtet Yoga','katze-unterrichtet-yoga','news/katze-unterrichtet-yoga','{\"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\": \"Whiskers zeigt Menschen den „Katzengruß“\", \"9df6cca2-8b86-4950-8eb0-cab6ce593922\": \"<p>Eine Katze wurde zum viralen Star, weil sie Yoga macht – und dabei ziemlich professionell aussieht.</p>\", \"e477a46a-3858-4d77-9bf0-818e96c4dd91\": [23]}',1,'2025-07-12 10:14:11','2025-07-12 10:14:11','390fdb61-068e-433a-b8ac-7ec218b7d80a'),(359,121,3,'Yoga gatuno para todos','katzen-yoga-für-alle',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:14:11','2025-07-12 10:14:11','cabd56d9-e848-4c83-a1f8-7ac87e7c6fbd'),(360,121,1,'Cat Yoga for Everyone','katzen-yoga-für-alle',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:14:11','2025-07-12 10:14:11','3ddbbb6f-b27d-44af-9e70-9dd7389f9fe7'),(361,121,2,'Katzen-Yoga für alle!','katzen-yoga-für-alle',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:14:11','2025-07-12 10:14:11','f4808ab0-3fa7-4cb2-b74c-fb734873c567'),(362,122,3,NULL,'__temp_dpclzfbvpszidleamlpefwbxeskbqfjpvrjw',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Whiskers comenzó por accidente: su dueña grabó una clase de yoga, y la gata participó encantada. Desde el perro hacia abajo hasta la cobra perfecta, ¡dominó cada postura!</p>\"}',1,'2025-07-12 10:14:11','2025-07-12 10:14:11','79ad5fb1-d222-4b45-ac41-18f17711e065'),(363,122,1,NULL,'__temp_dpclzfbvpszidleamlpefwbxeskbqfjpvrjw',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Whiskers started off innocently: her owner filmed a yoga routine, and the cat joined in. From downward dog to a flawless cobra pose—she nailed them all.</p>\"}',1,'2025-07-12 10:14:11','2025-07-12 10:14:11','65e096dc-8243-4873-8c9a-260c069d8a16'),(364,122,2,NULL,'__temp_dpclzfbvpszidleamlpefwbxeskbqfjpvrjw',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Whiskers begann ganz harmlos: Ihre Besitzerin filmte eine Yoga-Session – und Whiskers machte begeistert mit! Vom Herabschauenden Hund bis zur perfekten Kobra – sie konnte alles.</p>\"}',1,'2025-07-12 10:14:11','2025-07-12 10:14:11','91d9e043-86c1-4165-a9e6-5af865ddad65'),(365,123,3,'Pawmaste: más zen que nunca','pawmaste-statt-namaste',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:14:11','2025-07-12 10:14:11','febd16e9-082a-455d-bc73-c03bc00cf77e'),(366,123,1,'Pawmaste, not Namaste','pawmaste-statt-namaste',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:14:11','2025-07-12 10:14:11','57514bf4-1c9e-4275-820a-186c2002684b'),(367,123,2,'Pawmaste statt Namaste','pawmaste-statt-namaste',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 10:14:11','2025-07-12 10:14:11','c29e6525-3c67-4326-b6a6-8fad3169ded4'),(368,124,3,NULL,'__temp_fbqkelixwjsodajvvewjdmbnunzjrvgytzko',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Ahora, Whiskers tiene un stream semanal llamado “Pawmaste Yoga”. Miles de fans siguen su flow peludo. Un comentario decía: “¡Solo verla ya me relaja más que una siesta!”</p>\"}',1,'2025-07-12 10:14:11','2025-07-12 10:14:11','c46e448c-429a-48cb-9576-ccfc75a0e1b6'),(369,124,1,NULL,'__temp_fbqkelixwjsodajvvewjdmbnunzjrvgytzko',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Now, Whiskers hosts a weekly stream called \\\"Pawmaste Yoga.\\\" Thousands of fans follow her fluffy flow. One fan wrote: \\\"Watching her is more relaxing than doing yoga myself!\\\"</p>\"}',1,'2025-07-12 10:14:11','2025-07-12 10:14:11','2a7ba1d5-b0cb-4d02-95d9-a6ec594cf8d3'),(370,124,2,NULL,'__temp_fbqkelixwjsodajvvewjdmbnunzjrvgytzko',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Mittlerweile streamt Whiskers wöchentlich ihre eigene Yogastunde: „Pawmaste Yoga“. Tausende Fans folgen ihrem flauschigen Flow. Ein Fan schrieb: „Ich entspanne mehr beim Zuschauen als beim Mitmachen!“</p>\"}',1,'2025-07-12 10:14:11','2025-07-12 10:14:11','2b75773e-24cc-4c26-8112-2c98bfa0fc6f'),(380,128,2,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Vorlage\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Danke, dass du die Query API ausprobierst. Es bringt die Einfachheit von Twigs Datenabfragen in dein JavaScript-Framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 10:23:36','2025-07-12 10:23:36','87f6bfa5-d539-4830-977a-c114141fa277'),(381,128,1,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Starter\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Thank you for trying the Query API. It brings the simplicity of Twig\'s data querying to your JavaScript framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 10:23:36','2025-07-12 10:23:36','a9e9d9db-7014-408a-9ffb-b2d27c42fc27'),(382,128,3,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Plantilla\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Gracias por probar la Query API. Trae la simplicidad de las consultas de datos de Twig a tu framework de JavaScript.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 10:23:36','2025-07-12 10:23:36','07641036-8125-4fc0-af1b-217955a12ba5'),(383,129,2,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Hier bekommst du eine kleine Übersicht, was alles in dem Starter Template konfiguriert ist. Wenn du findest das etwas fehlt, freue ich mich über eine Rückmeldung!</p><h3>Sections:</h3><ul><li>home: Das ist die Home Page</li><li>news: Hier können News Beiträge gepflegt werden</li></ul><h3>Sprachen:</h3><ul><li>EN -&gt; Primary Language</li><li>DE</li><li>ES</li></ul><h3>Installierte Plugins</h3><ul><li>Query API: Edit rich text content in Craft CMS using CKEditor.</li><li>Imager X: Ninja powered image transforms.</li><li>CKEditor: Edit rich text content in Craft CMS using CKEditor.</li></ul>\"}',1,'2025-07-12 10:23:36','2025-07-12 10:23:36','77176dfb-74f0-4e2a-8ba3-31c0f5bad30b'),(384,129,1,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,NULL,1,'2025-07-12 10:23:36','2025-07-12 10:23:36','bcbc5ba5-ec35-4dfa-b079-9ba78bd69134'),(385,129,3,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,NULL,1,'2025-07-12 10:23:36','2025-07-12 10:23:36','a14ec480-b998-434d-b0fb-c3471c0362c0'),(386,130,2,'ImagerX für Bilder','entry-14',NULL,'{\"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\": \"<p>Damit die Bilder immer optimiert sind, wurde in dem Starter gleich das Imager X Plugin installiert. Damit wird dann das srcSet für das Frontend erzeugt. </p>\", \"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 10:23:36','2025-07-12 10:23:36','6edecb9c-0b19-4cb1-b5df-7e9195ff4dbe'),(387,130,1,'ImagerX for Images','image',NULL,'{\"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\": \"<p>asdf</p>\", \"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 10:23:36','2025-07-12 10:23:36','be3e7a92-52ea-4413-abd1-7df726ceb3c3'),(388,130,3,'ImagerX para imágenes','entry-14',NULL,'{\"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 10:23:36','2025-07-12 10:23:36','273fd6e5-0422-416f-adc0-b233ea15a2f2'),(395,133,1,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Starter\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Thank you for trying the Query API. It brings the simplicity of Twig\'s data querying to your JavaScript framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 10:25:52','2025-07-12 10:25:52','511b1690-b77f-4b94-be83-64e15578cf3c'),(396,133,2,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Vorlage\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Danke, dass du die Query API ausprobierst. Es bringt die Einfachheit von Twigs Datenabfragen in dein JavaScript-Framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 10:25:52','2025-07-12 10:25:52','ec1eeb36-6b66-4699-b37d-09cde3e03380'),(397,133,3,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Plantilla\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Gracias por probar la Query API. Trae la simplicidad de las consultas de datos de Twig a tu framework de JavaScript.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 10:25:52','2025-07-12 10:25:52','48db2409-6336-44ab-873d-cbbb8749fd20'),(398,134,1,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Here’s a quick overview of what’s configured in the starter template. If you notice something is missing, I’d be happy to hear your feedback!</p><h3>Sections:</h3><ul><li>home: This is the home page</li><li>news: News articles can be managed here</li></ul><h3>Languages:</h3><ul><li>EN → Primary Language</li><li>DE</li><li>ES</li></ul><h3>Installed Plugins:</h3><ul><li>Query API: Edit rich text content in Craft CMS using CKEditor.</li><li>Imager X: Ninja-powered image transforms.</li><li>CKEditor: Edit rich text content in Craft CMS using CKEditor.</li></ul>\"}',1,'2025-07-12 10:25:52','2025-07-12 10:25:52','b3041e13-9e94-4310-af62-3cf9799621da'),(399,134,2,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Hier bekommst du eine kleine Übersicht, was alles in dem Starter Template konfiguriert ist. Wenn du findest das etwas fehlt, freue ich mich über eine Rückmeldung!</p><h3>Sections:</h3><ul><li>home: Das ist die Home Page</li><li>news: Hier können News Beiträge gepflegt werden</li></ul><h3>Sprachen:</h3><ul><li>EN -&gt; Primary Language</li><li>DE</li><li>ES</li></ul><h3>Installierte Plugins</h3><ul><li>Query API: Edit rich text content in Craft CMS using CKEditor.</li><li>Imager X: Ninja powered image transforms.</li><li>CKEditor: Edit rich text content in Craft CMS using CKEditor.</li></ul>\"}',1,'2025-07-12 10:25:52','2025-07-12 10:25:52','1037c0ed-99c5-4a0c-b5c0-5fabb6026e71'),(400,134,3,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,NULL,1,'2025-07-12 10:25:52','2025-07-12 10:25:52','a0fd0f11-4adb-4ea3-a3fa-35379ec0fc91'),(407,137,3,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Plantilla\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Gracias por probar la Query API. Trae la simplicidad de las consultas de datos de Twig a tu framework de JavaScript.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 10:26:07','2025-07-12 10:26:07','e98ddbc1-81f0-4f27-a1b1-6ba0daaa84a0'),(408,137,1,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Starter\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Thank you for trying the Query API. It brings the simplicity of Twig\'s data querying to your JavaScript framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 10:26:07','2025-07-12 10:26:07','37be2e50-9b1f-429b-a48c-59cef0787c90'),(409,137,2,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Vorlage\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Danke, dass du die Query API ausprobierst. Es bringt die Einfachheit von Twigs Datenabfragen in dein JavaScript-Framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 10:26:07','2025-07-12 10:26:07','ca7aabf4-901c-4830-a72e-f381fd267b11'),(410,138,3,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Aquí tienes un pequeño resumen de lo que está configurado en la plantilla inicial. ¡Si ves que falta algo, estaré encantado de recibir tus comentarios!</p><h3>Secciones:</h3><ul><li>home: Esta es la página de inicio</li><li>news: Aquí se pueden gestionar las noticias</li></ul><h3>Idiomas:</h3><ul><li>EN → Idioma principal</li><li>DE</li><li>ES</li></ul><h3>Plugins instalados:</h3><ul><li>Query API: Edita contenido enriquecido en Craft CMS con CKEditor.</li><li>Imager X: Transformaciones de imagen con potencia ninja.</li><li>CKEditor: Edita contenido enriquecido en Craft CMS con CKEditor.</li></ul>\"}',1,'2025-07-12 10:26:07','2025-07-12 10:26:07','93e8bd4c-63f7-4cfb-954e-373c3d6caace'),(411,138,1,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Here’s a quick overview of what’s configured in the starter template. If you notice something is missing, I’d be happy to hear your feedback!</p><h3>Sections:</h3><ul><li>home: This is the home page</li><li>news: News articles can be managed here</li></ul><h3>Languages:</h3><ul><li>EN → Primary Language</li><li>DE</li><li>ES</li></ul><h3>Installed Plugins:</h3><ul><li>Query API: Edit rich text content in Craft CMS using CKEditor.</li><li>Imager X: Ninja-powered image transforms.</li><li>CKEditor: Edit rich text content in Craft CMS using CKEditor.</li></ul>\"}',1,'2025-07-12 10:26:07','2025-07-12 10:26:07','eeee9a27-3f5a-4774-af37-dd2d7324fe39'),(412,138,2,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Hier bekommst du eine kleine Übersicht, was alles in dem Starter Template konfiguriert ist. Wenn du findest das etwas fehlt, freue ich mich über eine Rückmeldung!</p><h3>Sections:</h3><ul><li>home: Das ist die Home Page</li><li>news: Hier können News Beiträge gepflegt werden</li></ul><h3>Sprachen:</h3><ul><li>EN -&gt; Primary Language</li><li>DE</li><li>ES</li></ul><h3>Installierte Plugins</h3><ul><li>Query API: Edit rich text content in Craft CMS using CKEditor.</li><li>Imager X: Ninja powered image transforms.</li><li>CKEditor: Edit rich text content in Craft CMS using CKEditor.</li></ul>\"}',1,'2025-07-12 10:26:07','2025-07-12 10:26:07','9d242034-8a30-4263-ba67-a18b7aa1dc2d'),(419,141,1,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Starter\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Thank you for trying the Query API. It brings the simplicity of Twig\'s data querying to your JavaScript framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 10:26:32','2025-07-12 10:26:32','0622e067-e7c5-4418-bdf9-5d4f71f67ef6'),(420,141,2,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Vorlage\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Danke, dass du die Query API ausprobierst. Es bringt die Einfachheit von Twigs Datenabfragen in dein JavaScript-Framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 10:26:32','2025-07-12 10:26:32','5dcd1f46-9836-4b0e-a428-3442d5f04198'),(421,141,3,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Plantilla\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Gracias por probar la Query API. Trae la simplicidad de las consultas de datos de Twig a tu framework de JavaScript.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 10:26:32','2025-07-12 10:26:32','0d0e9338-279e-49c9-a0f9-2c8d78cc0c32'),(422,142,1,'ImagerX for Images','image',NULL,'{\"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\": \"<p>To ensure that images are always optimized, the Imager X plugin was included in the starter right away. It generates the srcSet for the frontend.</p>\", \"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 10:26:32','2025-07-12 10:26:32','7f03ead1-1c61-4d97-abd8-0255e095e43a'),(423,142,2,'ImagerX für Bilder','entry-14',NULL,'{\"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\": \"<p>Damit die Bilder immer optimiert sind, wurde in dem Starter gleich das Imager X Plugin installiert. Damit wird dann das srcSet für das Frontend erzeugt. </p>\", \"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 10:26:32','2025-07-12 10:26:32','c9d4c428-2d20-4e06-ad67-c7fe20196392'),(424,142,3,'ImagerX para imágenes','entry-14',NULL,'{\"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 10:26:32','2025-07-12 10:26:32','23aa0dbe-f969-47b8-9cc7-c978ad21e8af'),(425,143,3,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Plantilla\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Gracias por probar la Query API. Trae la simplicidad de las consultas de datos de Twig a tu framework de JavaScript.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 10:26:41','2025-07-12 10:26:41','7dc9e2cf-d3c5-43d3-8f1e-affbf5409e11'),(426,143,1,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Starter\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Thank you for trying the Query API. It brings the simplicity of Twig\'s data querying to your JavaScript framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 10:26:41','2025-07-12 10:26:41','8c3fd319-4ffe-4bd9-9af4-c50cf19011bc'),(427,143,2,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Vorlage\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Danke, dass du die Query API ausprobierst. Es bringt die Einfachheit von Twigs Datenabfragen in dein JavaScript-Framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 10:26:41','2025-07-12 10:26:41','fc3a3291-2271-4a7a-8694-90d57d18d3ff'),(428,144,3,'ImagerX para imágenes','entry-14',NULL,'{\"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\": \"<p>Para garantizar que las imágenes estén siempre optimizadas, el plugin Imager X se ha incluido directamente en la plantilla inicial. Este genera el srcSet para el frontend.</p>\", \"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 10:26:41','2025-07-12 10:26:41','6a2f7f96-017d-4398-b1fd-2756f822a412'),(429,144,1,'ImagerX for Images','image',NULL,'{\"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\": \"<p>To ensure that images are always optimized, the Imager X plugin was included in the starter right away. It generates the srcSet for the frontend.</p>\", \"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 10:26:41','2025-07-12 10:26:41','0cde5612-0337-4a82-9ea5-633c0865e070'),(430,144,2,'ImagerX für Bilder','entry-14',NULL,'{\"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\": \"<p>Damit die Bilder immer optimiert sind, wurde in dem Starter gleich das Imager X Plugin installiert. Damit wird dann das srcSet für das Frontend erzeugt. </p>\", \"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 10:26:41','2025-07-12 10:26:41','de96a92e-90f6-4b32-ba9f-126c8853cf89'),(431,145,1,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Starter\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 13:00:04','2025-07-12 13:00:04','54f39f06-b088-4d54-a6c4-c3c27a5186db'),(432,145,2,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Vorlage\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Danke, dass du die Query API ausprobierst. Es bringt die Einfachheit von Twigs Datenabfragen in dein JavaScript-Framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 13:00:04','2025-07-12 13:00:04','8b65aea5-3fc6-464a-8e01-47ce7a7b9b92'),(433,145,3,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Plantilla\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Gracias por probar la Query API. Trae la simplicidad de las consultas de datos de Twig a tu framework de JavaScript.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 13:00:04','2025-07-12 13:00:04','8c5d4324-b85a-4c30-9b59-32f4a3154200'),(434,146,1,'Overview','this-starter-contains-f',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 13:00:04','2025-07-12 13:00:04','ed678cc8-5bb9-4d42-a959-94aa49232e20'),(435,146,2,'Übersicht','was-du-lernen-kannst',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 13:00:04','2025-07-12 13:00:04','fb6d37fc-abd1-43f3-8f3a-0da1285e62d0'),(436,146,3,'Visión general','entry-12',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 13:00:04','2025-07-12 13:00:04','894945bd-7c64-4725-94aa-84ccfed70608'),(437,147,1,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Here’s a quick overview of what’s configured in the starter template. If you notice something is missing, I’d be happy to hear your feedback!</p><h3>Sections:</h3><ul><li>home: This is the home page</li><li>news: News articles can be managed here</li></ul><h3>Languages:</h3><ul><li>EN → Primary Language</li><li>DE</li><li>ES</li></ul><h3>Installed Plugins:</h3><ul><li>Query API: Edit rich text content in Craft CMS using CKEditor.</li><li>Imager X: Ninja-powered image transforms.</li><li>CKEditor: Edit rich text content in Craft CMS using CKEditor.</li></ul>\"}',1,'2025-07-12 13:00:04','2025-07-12 13:00:04','8212c3b5-97e4-4983-b819-0d471d3c3b02'),(438,147,2,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Hier bekommst du eine kleine Übersicht, was alles in dem Starter Template konfiguriert ist. Wenn du findest das etwas fehlt, freue ich mich über eine Rückmeldung!</p><h3>Sections:</h3><ul><li>home: Das ist die Home Page</li><li>news: Hier können News Beiträge gepflegt werden</li></ul><h3>Sprachen:</h3><ul><li>EN -&gt; Primary Language</li><li>DE</li><li>ES</li></ul><h3>Installierte Plugins</h3><ul><li>Query API: Edit rich text content in Craft CMS using CKEditor.</li><li>Imager X: Ninja powered image transforms.</li><li>CKEditor: Edit rich text content in Craft CMS using CKEditor.</li></ul>\"}',1,'2025-07-12 13:00:04','2025-07-12 13:00:04','f97d6da4-5ba7-447a-aca7-5cacfa7d5014'),(439,147,3,NULL,'__temp_rrbbwvxvwoochqlmkgdyxtqglwidwynohhms',NULL,'{\"8abac79e-53f3-4592-bbd2-96ce5cb94584\": \"<p>Aquí tienes un pequeño resumen de lo que está configurado en la plantilla inicial. ¡Si ves que falta algo, estaré encantado de recibir tus comentarios!</p><h3>Secciones:</h3><ul><li>home: Esta es la página de inicio</li><li>news: Aquí se pueden gestionar las noticias</li></ul><h3>Idiomas:</h3><ul><li>EN → Idioma principal</li><li>DE</li><li>ES</li></ul><h3>Plugins instalados:</h3><ul><li>Query API: Edita contenido enriquecido en Craft CMS con CKEditor.</li><li>Imager X: Transformaciones de imagen con potencia ninja.</li><li>CKEditor: Edita contenido enriquecido en Craft CMS con CKEditor.</li></ul>\"}',1,'2025-07-12 13:00:04','2025-07-12 13:00:04','f9dd846e-ea5b-4876-baf0-ac1aae26e71c'),(440,148,1,'ImagerX for Images','image',NULL,'{\"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\": \"<p>To ensure that images are always optimized, the Imager X plugin was included in the starter right away. It generates the srcSet for the frontend.</p>\", \"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 13:00:04','2025-07-12 13:00:04','27ae8e32-f410-4a90-b158-c8c9ecc2c0e8'),(441,148,2,'ImagerX für Bilder','entry-14',NULL,'{\"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\": \"<p>Damit die Bilder immer optimiert sind, wurde in dem Starter gleich das Imager X Plugin installiert. Damit wird dann das srcSet für das Frontend erzeugt. </p>\", \"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 13:00:04','2025-07-12 13:00:04','899a32b9-3855-47a2-86f8-758313f76262'),(442,148,3,'ImagerX para imágenes','entry-14',NULL,'{\"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\": \"<p>Para garantizar que las imágenes estén siempre optimizadas, el plugin Imager X se ha incluido directamente en la plantilla inicial. Este genera el srcSet para el frontend.</p>\", \"50e7623b-e945-4db4-96ba-1f93bfdf0e50\": \"h2\", \"8aa48013-3ad2-4a42-9230-855839cd44a8\": [11]}',1,'2025-07-12 13:00:04','2025-07-12 13:00:04','f292d0e2-c5b7-4429-b7f0-65e45e08f1c5'),(443,149,1,'I hope you like cats!','i-hope-you-like-cats',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 13:00:04','2025-07-12 13:00:04','45fc7ae7-7bf5-4661-8997-d10049a3699a'),(444,149,2,'Ich hoffe du magst Katzen!','i-hope-you-like-cats',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 13:00:04','2025-07-12 13:00:04','243559a6-64cf-480f-81ad-57d02cff001c'),(445,149,3,'Espero que te gusten los gatos!','i-hope-you-like-cats',NULL,'{\"18d710b6-1115-495c-bbd2-fadc532253d8\": \"h2\"}',1,'2025-07-12 13:00:04','2025-07-12 13:00:04','a99ec96c-90fa-4292-b414-4d58884e9926'),(446,150,1,NULL,'__temp_svftqjvbmynaealpnazyrdxcpiegenvdfmdj',NULL,'{\"e2966306-abe9-4cd0-a63f-1cc76dfd8547\": [23]}',1,'2025-07-12 13:00:04','2025-07-12 13:00:04','0d91bd38-558c-411a-ae8b-192ce56cc3fd'),(447,150,2,NULL,'__temp_svftqjvbmynaealpnazyrdxcpiegenvdfmdj',NULL,'{\"e2966306-abe9-4cd0-a63f-1cc76dfd8547\": [23]}',1,'2025-07-12 13:00:04','2025-07-12 13:00:04','7d5e1011-9ac1-460b-be2d-974f9d4ebd18'),(448,150,3,NULL,'__temp_svftqjvbmynaealpnazyrdxcpiegenvdfmdj',NULL,'{\"e2966306-abe9-4cd0-a63f-1cc76dfd8547\": [23]}',1,'2025-07-12 13:00:04','2025-07-12 13:00:04','859cf15d-ad18-45cf-abf8-f7d369c3ad68'),(449,151,1,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Starter\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Thank you for trying the Query API. It brings the simplicity of Twig\'s data querying to your JavaScript framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 13:00:11','2025-07-12 13:00:11','b8a70c0e-fcb1-4c8e-8ffd-dc55323f3d22'),(450,151,2,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Vorlage\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Danke, dass du die Query API ausprobierst. Es bringt die Einfachheit von Twigs Datenabfragen in dein JavaScript-Framework.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 13:00:11','2025-07-12 13:00:11','34f23469-1375-4990-9aad-78bd81ecb954'),(451,151,3,'Home','home','__home__','{\"1542ed19-45ce-470b-9701-0eda7b118b8b\": \"Query API Plantilla\", \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\": \"<p>Gracias por probar la Query API. Trae la simplicidad de las consultas de datos de Twig a tu framework de JavaScript.</p>\", \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\": [25]}',1,'2025-07-12 13:00:11','2025-07-12 13:00:11','a49be047-f503-436e-92a3-61ced0c18178');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,NULL,NULL,1,'2025-07-12 09:17:00',NULL,'live',NULL,NULL,'2025-07-12 09:17:28','2025-07-12 09:17:28'),(3,1,NULL,NULL,NULL,1,'2025-07-12 09:17:00',NULL,'live',NULL,NULL,'2025-07-12 09:17:28','2025-07-12 09:17:28'),(4,2,NULL,NULL,NULL,2,'2025-07-12 09:42:24',NULL,'live',NULL,NULL,'2025-07-12 09:42:24','2025-07-12 09:42:24'),(5,2,NULL,NULL,NULL,2,'2025-07-12 09:43:01',NULL,'live',NULL,NULL,'2025-07-12 09:43:01','2025-07-12 09:43:01'),(12,NULL,NULL,2,4,4,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 09:51:54','2025-07-12 09:51:54'),(13,NULL,NULL,2,4,6,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 09:51:54','2025-07-12 09:51:54'),(14,NULL,NULL,2,4,5,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 09:51:54','2025-07-12 09:51:54'),(15,NULL,NULL,2,4,7,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 09:51:54','2025-07-12 09:51:54'),(16,1,NULL,NULL,NULL,1,'2025-07-12 09:17:00',NULL,'live',NULL,NULL,'2025-07-12 09:51:54','2025-07-12 09:51:54'),(17,NULL,NULL,16,4,4,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 09:51:54','2025-07-12 09:51:54'),(18,NULL,NULL,16,4,6,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 09:51:54','2025-07-12 09:51:54'),(19,NULL,NULL,16,4,5,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 09:51:54','2025-07-12 09:51:54'),(20,NULL,NULL,16,4,7,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 09:51:54','2025-07-12 09:51:54'),(28,NULL,NULL,2,4,4,'2025-07-12 09:52:00',NULL,'live',NULL,NULL,'2025-07-12 09:53:05','2025-07-12 09:53:05'),(29,1,NULL,NULL,NULL,1,'2025-07-12 09:17:00',NULL,'live',NULL,NULL,'2025-07-12 09:53:06','2025-07-12 09:53:06'),(30,NULL,NULL,29,4,6,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 09:53:06','2025-07-12 09:53:06'),(31,NULL,NULL,29,4,5,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 09:53:06','2025-07-12 09:53:06'),(32,NULL,NULL,29,4,4,'2025-07-12 09:52:00',NULL,'live',NULL,NULL,'2025-07-12 09:53:06','2025-07-12 09:53:06'),(33,NULL,NULL,29,4,7,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 09:53:06','2025-07-12 09:53:06'),(38,1,NULL,NULL,NULL,1,'2025-07-12 09:17:00',NULL,'live',NULL,NULL,'2025-07-12 09:55:08','2025-07-12 09:55:08'),(39,NULL,NULL,38,4,4,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 09:55:08','2025-07-12 09:55:08'),(40,NULL,NULL,38,4,5,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 09:55:08','2025-07-12 09:55:08'),(41,NULL,NULL,38,4,4,'2025-07-12 09:52:00',NULL,'live',NULL,NULL,'2025-07-12 09:55:08','2025-07-12 09:55:08'),(44,1,NULL,NULL,NULL,1,'2025-07-12 09:17:00',NULL,'live',NULL,NULL,'2025-07-12 09:55:25','2025-07-12 09:55:25'),(45,NULL,NULL,44,4,4,'2025-07-12 09:52:00',NULL,'live',NULL,NULL,'2025-07-12 09:55:25','2025-07-12 09:55:25'),(50,1,NULL,NULL,NULL,1,'2025-07-12 09:17:00',NULL,'live',NULL,NULL,'2025-07-12 09:57:37','2025-07-12 09:57:37'),(51,NULL,NULL,50,4,4,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 09:57:37','2025-07-12 09:57:37'),(52,NULL,NULL,50,4,5,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 09:57:37','2025-07-12 09:57:37'),(53,NULL,NULL,50,4,4,'2025-07-12 09:52:00',NULL,'live',NULL,NULL,'2025-07-12 09:57:37','2025-07-12 09:57:37'),(54,1,NULL,NULL,NULL,1,'2025-07-12 09:17:00',NULL,'live',NULL,NULL,'2025-07-12 09:57:48','2025-07-12 09:57:48'),(55,NULL,NULL,54,4,4,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 09:57:48','2025-07-12 09:57:48'),(56,1,NULL,NULL,NULL,1,'2025-07-12 09:17:00',NULL,'live',NULL,NULL,'2025-07-12 09:58:05','2025-07-12 09:58:05'),(57,NULL,NULL,56,4,4,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 09:58:05','2025-07-12 09:58:05'),(58,1,NULL,NULL,NULL,1,'2025-07-12 09:17:00',NULL,'live',NULL,NULL,'2025-07-12 09:58:26','2025-07-12 09:58:26'),(59,NULL,NULL,58,4,5,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 09:58:26','2025-07-12 09:58:26'),(60,1,NULL,NULL,NULL,1,'2025-07-12 09:17:00',NULL,'live',NULL,NULL,'2025-07-12 09:58:49','2025-07-12 09:58:49'),(61,NULL,NULL,60,4,5,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 09:58:49','2025-07-12 09:58:49'),(62,1,NULL,NULL,NULL,1,'2025-07-12 09:17:00',NULL,'live',NULL,NULL,'2025-07-12 09:58:52','2025-07-12 09:58:52'),(63,2,NULL,NULL,NULL,2,'2025-07-12 09:59:02',NULL,'live',NULL,NULL,'2025-07-12 09:59:02','2025-07-12 09:59:02'),(64,2,NULL,NULL,NULL,2,'2025-07-12 10:01:29',NULL,'live',NULL,NULL,'2025-07-12 10:01:29','2025-07-12 10:01:29'),(65,2,NULL,NULL,NULL,2,'2025-07-12 10:09:00',NULL,'live',NULL,NULL,'2025-07-12 10:05:52','2025-07-12 10:09:28'),(66,NULL,NULL,65,4,4,'2025-07-12 10:08:00',NULL,'live',NULL,NULL,'2025-07-12 10:08:50','2025-07-12 10:08:50'),(67,NULL,NULL,65,4,6,'2025-07-12 10:08:00',NULL,'live',NULL,NULL,'2025-07-12 10:08:53','2025-07-12 10:08:54'),(68,NULL,NULL,65,4,4,'2025-07-12 10:09:00',NULL,'live',NULL,NULL,'2025-07-12 10:09:04','2025-07-12 10:09:04'),(69,NULL,NULL,65,4,6,'2025-07-12 10:09:00',NULL,'live',NULL,NULL,'2025-07-12 10:09:09','2025-07-12 10:09:10'),(70,2,NULL,NULL,NULL,2,'2025-07-12 10:09:00',NULL,'live',NULL,NULL,'2025-07-12 10:09:28','2025-07-12 10:09:28'),(71,NULL,NULL,70,4,4,'2025-07-12 10:08:00',NULL,'live',NULL,NULL,'2025-07-12 10:09:28','2025-07-12 10:09:28'),(72,NULL,NULL,70,4,6,'2025-07-12 10:08:00',NULL,'live',NULL,NULL,'2025-07-12 10:09:28','2025-07-12 10:09:28'),(73,NULL,NULL,70,4,4,'2025-07-12 10:09:00',NULL,'live',NULL,NULL,'2025-07-12 10:09:28','2025-07-12 10:09:28'),(74,NULL,NULL,70,4,6,'2025-07-12 10:09:00',NULL,'live',NULL,NULL,'2025-07-12 10:09:28','2025-07-12 10:09:28'),(80,2,NULL,NULL,NULL,2,'2025-07-12 10:09:00',NULL,'live',NULL,NULL,'2025-07-12 10:10:19','2025-07-12 10:10:19'),(81,NULL,NULL,80,4,4,'2025-07-12 10:08:00',NULL,'live',NULL,NULL,'2025-07-12 10:10:19','2025-07-12 10:10:19'),(82,NULL,NULL,80,4,6,'2025-07-12 10:08:00',NULL,'live',NULL,NULL,'2025-07-12 10:10:19','2025-07-12 10:10:19'),(83,NULL,NULL,80,4,4,'2025-07-12 10:09:00',NULL,'live',NULL,NULL,'2025-07-12 10:10:19','2025-07-12 10:10:19'),(84,NULL,NULL,80,4,6,'2025-07-12 10:09:00',NULL,'live',NULL,NULL,'2025-07-12 10:10:19','2025-07-12 10:10:19'),(90,2,NULL,NULL,NULL,2,'2025-07-12 10:09:00',NULL,'live',NULL,NULL,'2025-07-12 10:11:12','2025-07-12 10:11:12'),(91,NULL,NULL,90,4,4,'2025-07-12 10:08:00',NULL,'live',NULL,NULL,'2025-07-12 10:11:12','2025-07-12 10:11:12'),(92,NULL,NULL,90,4,6,'2025-07-12 10:08:00',NULL,'live',NULL,NULL,'2025-07-12 10:11:12','2025-07-12 10:11:12'),(93,NULL,NULL,90,4,4,'2025-07-12 10:09:00',NULL,'live',NULL,NULL,'2025-07-12 10:11:12','2025-07-12 10:11:12'),(94,NULL,NULL,90,4,6,'2025-07-12 10:09:00',NULL,'live',NULL,NULL,'2025-07-12 10:11:12','2025-07-12 10:11:12'),(95,2,NULL,NULL,NULL,2,'2025-07-12 10:12:00',NULL,'live',NULL,NULL,'2025-07-12 10:11:18','2025-07-12 10:12:28'),(96,NULL,NULL,95,4,4,'2025-07-12 10:11:00',NULL,'live',NULL,NULL,'2025-07-12 10:11:46','2025-07-12 10:11:47'),(97,NULL,NULL,95,4,6,'2025-07-12 10:11:00',NULL,'live',NULL,NULL,'2025-07-12 10:11:49','2025-07-12 10:11:49'),(98,NULL,NULL,95,4,6,'2025-07-12 10:11:00',NULL,'live',NULL,NULL,'2025-07-12 10:11:56','2025-07-12 10:11:56'),(99,NULL,NULL,95,4,4,'2025-07-12 10:12:00',NULL,'live',NULL,NULL,'2025-07-12 10:11:59','2025-07-12 10:12:00'),(100,2,NULL,NULL,NULL,2,'2025-07-12 10:12:00',NULL,'live',NULL,NULL,'2025-07-12 10:12:28','2025-07-12 10:12:28'),(101,NULL,NULL,100,4,4,'2025-07-12 10:11:00',NULL,'live',NULL,NULL,'2025-07-12 10:12:28','2025-07-12 10:12:28'),(102,NULL,NULL,100,4,6,'2025-07-12 10:11:00',NULL,'live',NULL,NULL,'2025-07-12 10:12:28','2025-07-12 10:12:28'),(103,NULL,NULL,100,4,4,'2025-07-12 10:12:00',NULL,'live',NULL,NULL,'2025-07-12 10:12:28','2025-07-12 10:12:28'),(104,NULL,NULL,100,4,6,'2025-07-12 10:11:00',NULL,'live',NULL,NULL,'2025-07-12 10:12:28','2025-07-12 10:12:28'),(110,2,NULL,NULL,NULL,2,'2025-07-12 10:12:00',NULL,'live',NULL,NULL,'2025-07-12 10:13:17','2025-07-12 10:13:17'),(111,NULL,NULL,110,4,4,'2025-07-12 10:11:00',NULL,'live',NULL,NULL,'2025-07-12 10:13:17','2025-07-12 10:13:17'),(112,NULL,NULL,110,4,6,'2025-07-12 10:11:00',NULL,'live',NULL,NULL,'2025-07-12 10:13:17','2025-07-12 10:13:17'),(113,NULL,NULL,110,4,4,'2025-07-12 10:12:00',NULL,'live',NULL,NULL,'2025-07-12 10:13:17','2025-07-12 10:13:17'),(114,NULL,NULL,110,4,6,'2025-07-12 10:11:00',NULL,'live',NULL,NULL,'2025-07-12 10:13:17','2025-07-12 10:13:17'),(120,2,NULL,NULL,NULL,2,'2025-07-12 10:12:00',NULL,'live',NULL,NULL,'2025-07-12 10:14:11','2025-07-12 10:14:11'),(121,NULL,NULL,120,4,4,'2025-07-12 10:11:00',NULL,'live',NULL,NULL,'2025-07-12 10:14:11','2025-07-12 10:14:11'),(122,NULL,NULL,120,4,6,'2025-07-12 10:11:00',NULL,'live',NULL,NULL,'2025-07-12 10:14:11','2025-07-12 10:14:11'),(123,NULL,NULL,120,4,4,'2025-07-12 10:12:00',NULL,'live',NULL,NULL,'2025-07-12 10:14:11','2025-07-12 10:14:11'),(124,NULL,NULL,120,4,6,'2025-07-12 10:11:00',NULL,'live',NULL,NULL,'2025-07-12 10:14:11','2025-07-12 10:14:11'),(128,1,NULL,NULL,NULL,1,'2025-07-12 09:17:00',NULL,'live',NULL,NULL,'2025-07-12 10:23:36','2025-07-12 10:23:36'),(129,NULL,NULL,128,4,6,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 10:23:36','2025-07-12 10:23:36'),(130,NULL,NULL,128,4,5,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 10:23:36','2025-07-12 10:23:36'),(133,1,NULL,NULL,NULL,1,'2025-07-12 09:17:00',NULL,'live',NULL,NULL,'2025-07-12 10:25:52','2025-07-12 10:25:52'),(134,NULL,NULL,133,4,6,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 10:25:52','2025-07-12 10:25:52'),(137,1,NULL,NULL,NULL,1,'2025-07-12 09:17:00',NULL,'live',NULL,NULL,'2025-07-12 10:26:07','2025-07-12 10:26:07'),(138,NULL,NULL,137,4,6,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 10:26:07','2025-07-12 10:26:07'),(141,1,NULL,NULL,NULL,1,'2025-07-12 09:17:00',NULL,'live',NULL,NULL,'2025-07-12 10:26:32','2025-07-12 10:26:32'),(142,NULL,NULL,141,4,5,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 10:26:32','2025-07-12 10:26:32'),(143,1,NULL,NULL,NULL,1,'2025-07-12 09:17:00',NULL,'live',NULL,NULL,'2025-07-12 10:26:41','2025-07-12 10:26:41'),(144,NULL,NULL,143,4,5,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 10:26:41','2025-07-12 10:26:41'),(145,1,NULL,NULL,NULL,1,'2025-07-12 09:17:00',NULL,'live',NULL,NULL,'2025-07-12 13:00:04','2025-07-12 13:00:04'),(146,NULL,NULL,145,4,4,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 13:00:04','2025-07-12 13:00:04'),(147,NULL,NULL,145,4,6,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 13:00:04','2025-07-12 13:00:04'),(148,NULL,NULL,145,4,5,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 13:00:04','2025-07-12 13:00:04'),(149,NULL,NULL,145,4,4,'2025-07-12 09:52:00',NULL,'live',NULL,NULL,'2025-07-12 13:00:04','2025-07-12 13:00:04'),(150,NULL,NULL,145,4,7,'2025-07-12 09:48:00',NULL,'live',NULL,NULL,'2025-07-12 13:00:04','2025-07-12 13:00:04'),(151,1,NULL,NULL,NULL,1,'2025-07-12 09:17:00',NULL,'live',NULL,NULL,'2025-07-12 13:00:11','2025-07-12 13:00:11');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries_authors` VALUES (4,1,1),(5,1,1),(63,1,1),(64,1,1),(65,1,1),(70,1,1),(80,1,1),(90,1,1),(95,1,1),(100,1,1),(110,1,1),(120,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,'home','home',NULL,'house',NULL,1,'language',NULL,NULL,1,'site',NULL,1,'2025-07-12 09:17:23','2025-07-12 13:24:29',NULL,'bc8e1a2f-5837-413f-b3e4-dbe2a568ab75'),(2,2,'News','news',NULL,'newspaper',NULL,1,'language',NULL,NULL,1,'site',NULL,1,'2025-07-12 09:18:52','2025-07-12 13:24:40',NULL,'c68b11e2-a09e-4cd4-b2a3-f142402b7aeb'),(3,3,'Page: News Overview','pageNewsOverview',NULL,'folder-grid',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-07-12 09:21:25','2025-07-12 09:21:25','2025-07-12 09:22:00','e1282ba8-05c5-473a-ae04-a810ae28c21b'),(4,5,'Headline','headline',NULL,'h1',NULL,1,'language',NULL,NULL,0,'site',NULL,1,'2025-07-12 09:29:07','2025-07-12 13:23:44',NULL,'cfc59921-481b-4e81-9445-cd5f2a3f68e4'),(5,6,'Image and Text','imageAndText',NULL,'image-polaroid',NULL,1,'language',NULL,NULL,1,'language',NULL,1,'2025-07-12 09:33:22','2025-07-12 13:24:02',NULL,'66e0bd20-6fc2-44da-8f4c-d036ac1156c7'),(6,7,'Text','text',NULL,'text',NULL,0,'language',NULL,NULL,0,'site',NULL,1,'2025-07-12 09:35:15','2025-07-12 13:24:13',NULL,'5cd79487-d897-4356-b811-6c7578b0e103'),(7,8,'Image','image',NULL,'image-landscape',NULL,0,'language',NULL,NULL,0,'site',NULL,1,'2025-07-12 09:35:46','2025-07-12 13:23:53',NULL,'c9b9fafc-2767-4b98-a078-bb250cccac09');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"b0a951ab-1e1b-45e9-a478-fa2d5ebd30a8\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"965778f6-e584-4e96-a01c-584365d66b41\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-07-12T09:15:40+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"uid\": \"f7ee93fa-8822-4474-a300-78fd4ccc364e\", \"type\": \"craft\\\\fieldlayoutelements\\\\Heading\", \"heading\": \"Hero\", \"dateAdded\": \"2025-07-12T09:39:50+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"1542ed19-45ce-470b-9701-0eda7b118b8b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Headline\", \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"0e79cff0-95ff-40c8-846b-c24c7d5ab6ff\", \"required\": false, \"dateAdded\": \"2025-07-12T09:39:50+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"33e6414d-6cb4-40b1-a5c8-abee23254b4c\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Intro Text\", \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"cfa3a69d-c697-4f3f-98e5-4a898f71797e\", \"required\": false, \"dateAdded\": \"2025-07-12T09:39:50+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"a0aeee7d-14a9-44d9-a1a6-07e8518657c0\", \"required\": false, \"dateAdded\": \"2025-07-12T09:39:50+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"uid\": \"8580271a-b530-4128-8439-278b9b58b8fa\", \"type\": \"craft\\\\fieldlayoutelements\\\\Heading\", \"heading\": \"Content\", \"dateAdded\": \"2025-07-12T09:39:50+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"7191be35-c90c-4355-9560-eae1c4b2f7fb\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"a2332799-5a39-4400-aa5d-5b995cb438a2\", \"required\": false, \"dateAdded\": \"2025-07-12T09:39:50+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-07-12 09:17:23','2025-07-12 09:42:49',NULL,'67867958-c3ce-48a7-807a-15e0fb09b88e'),(2,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"a43ab9f8-73a2-4b1f-a860-8e2e49e8080b\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"1e0ee97d-b1a0-4edc-bff6-61a8c94db2ed\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-07-12T09:17:36+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"uid\": \"d001cb31-d9df-4b7d-ac34-eb5608087392\", \"type\": \"craft\\\\fieldlayoutelements\\\\Heading\", \"heading\": \"\", \"dateAdded\": \"2025-07-12T09:42:02+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Headline\", \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"0e79cff0-95ff-40c8-846b-c24c7d5ab6ff\", \"required\": false, \"dateAdded\": \"2025-07-12T09:42:02+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"9df6cca2-8b86-4950-8eb0-cab6ce593922\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Intro Text\", \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"cfa3a69d-c697-4f3f-98e5-4a898f71797e\", \"required\": false, \"dateAdded\": \"2025-07-12T09:42:02+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"e477a46a-3858-4d77-9bf0-818e96c4dd91\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"a0aeee7d-14a9-44d9-a1a6-07e8518657c0\", \"required\": false, \"dateAdded\": \"2025-07-12T09:42:02+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"uid\": \"70e057e3-01be-42f1-b255-1cf45d8bad89\", \"type\": \"craft\\\\fieldlayoutelements\\\\Heading\", \"heading\": \"Content\", \"dateAdded\": \"2025-07-12T09:42:02+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"b7719d9b-d4f4-4779-a41d-64f91a435ae2\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"a2332799-5a39-4400-aa5d-5b995cb438a2\", \"required\": false, \"dateAdded\": \"2025-07-12T09:42:02+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}, {\"uid\": \"7b8ade3d-87b8-4465-9de9-6a78f33212b2\", \"name\": \"Settings\", \"elements\": [{\"tip\": null, \"uid\": \"fe994fac-b988-4451-85ed-9f95abfdf575\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"cfa8c371-9db2-498f-9691-56bde76890d5\", \"required\": false, \"dateAdded\": \"2025-07-12T09:42:02+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-07-12 09:18:52','2025-07-12 09:42:02',NULL,'1ca40257-d943-473b-955d-cb03bccd8d8a'),(3,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"b618ea76-14a0-469a-a00a-9411e46a54ae\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"09c5101b-3f84-4edd-a5ad-4b851c04be6d\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-07-12T09:19:40+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-07-12 09:21:25','2025-07-12 09:21:25','2025-07-12 09:22:00','8200a0aa-9627-45c0-b48f-1289f54486fa'),(4,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"9d3fea82-2a85-4181-83e5-51f225dab3e7\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"692c6b50-794b-4377-9044-2ea7645b00fb\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2025-07-12T09:24:37+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"id\": null, \"tip\": null, \"uid\": \"c539dbcd-f0a9-4ace-a302-8303fe590fd6\", \"cols\": null, \"name\": null, \"rows\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AltField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": false, \"attribute\": \"alt\", \"dateAdded\": \"2025-07-12T09:26:11+00:00\", \"requirable\": true, \"orientation\": null, \"placeholder\": null, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-07-12 09:26:11','2025-07-12 09:26:11',NULL,'7c8cc1df-632c-4963-afad-eee6a8770ab8'),(5,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"77e62c77-2070-47fe-8cd5-0e4816faf2ec\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"b510aee4-7050-4bfe-9d65-7ac1cfcc386c\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": \"Headline\", \"title\": null, \"width\": 50, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-07-12T09:26:23+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"18d710b6-1115-495c-bbd2-fadc532253d8\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 50, \"handle\": null, \"warning\": null, \"fieldUid\": \"b31aa533-16c8-44d2-8e9f-ffe300c2e7a6\", \"required\": false, \"dateAdded\": \"2025-07-12T09:29:07+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-07-12 09:29:07','2025-07-12 09:29:07',NULL,'c2f99198-d6ca-4d3c-8b41-808c941eb6a9'),(6,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"9ae992f8-80f7-48ae-9477-7c3c5638ea0b\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"b4768b0f-9792-4463-8694-1e0239204062\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": \"Headline\", \"title\": null, \"width\": 50, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-07-12T09:28:11+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"50e7623b-e945-4db4-96ba-1f93bfdf0e50\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 50, \"handle\": null, \"warning\": null, \"fieldUid\": \"b31aa533-16c8-44d2-8e9f-ffe300c2e7a6\", \"required\": false, \"dateAdded\": \"2025-07-12T09:33:22+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"cfa3a69d-c697-4f3f-98e5-4a898f71797e\", \"required\": false, \"dateAdded\": \"2025-07-12T09:33:22+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"8aa48013-3ad2-4a42-9230-855839cd44a8\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"a0aeee7d-14a9-44d9-a1a6-07e8518657c0\", \"required\": true, \"dateAdded\": \"2025-07-12T09:33:22+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-07-12 09:33:22','2025-07-12 09:33:22',NULL,'c2fc8bab-a5f7-4813-bc13-9a6188a19753'),(7,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"02643d21-9383-43cf-8fb4-8fc73e80506b\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"8abac79e-53f3-4592-bbd2-96ce5cb94584\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"cfa3a69d-c697-4f3f-98e5-4a898f71797e\", \"required\": false, \"dateAdded\": \"2025-07-12T09:35:15+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-07-12 09:35:15','2025-07-12 09:35:15',NULL,'13d80a57-a89f-4426-8236-3b9e345738b9'),(8,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"512fd508-195c-4ebd-a2cf-bee822943006\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"e2966306-abe9-4cd0-a63f-1cc76dfd8547\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"a0aeee7d-14a9-44d9-a1a6-07e8518657c0\", \"required\": false, \"dateAdded\": \"2025-07-12T09:35:46+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-07-12 09:35:46','2025-07-12 09:35:46',NULL,'66ccc7d1-468c-4af9-a8ed-0aa1088c5382');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,'Select Headline Tag','selectHeadlineTag','global',NULL,NULL,0,'language',NULL,'craft\\fields\\Dropdown','{\"customOptions\":false,\"options\":[{\"label\":\"H2\",\"value\":\"h2\",\"icon\":\"\",\"color\":\"\",\"default\":\"1\"},{\"label\":\"H3\",\"value\":\"h3\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"H4\",\"value\":\"h4\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"H5\",\"value\":\"h5\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"}]}','2025-07-12 09:28:42','2025-07-12 10:01:07',NULL,'b31aa533-16c8-44d2-8e9f-ffe300c2e7a6'),(2,'Image','image','global',NULL,NULL,0,'language',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"defaultUploadLocationSource\":\"volume:69ea2a52-05af-4d3d-be23-110dab8479b0\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:69ea2a52-05af-4d3d-be23-110dab8479b0\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSearchInput\":true,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:69ea2a52-05af-4d3d-be23-110dab8479b0\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2025-07-12 09:30:42','2025-07-12 10:00:49',NULL,'a0aeee7d-14a9-44d9-a1a6-07e8518657c0'),(3,'Rich Text','richText','global',NULL,NULL,0,'language',NULL,'craft\\ckeditor\\Field','{\"ckeConfig\":\"1592478f-4b05-481a-bb24-4ce64dd1d8cd\",\"wordLimit\":null,\"characterLimit\":null,\"showWordCount\":true,\"parseEmbeds\":false,\"availableVolumes\":\"*\",\"availableTransforms\":\"\",\"defaultTransform\":null,\"sourceEditingGroups\":[\"__ADMINS__\"],\"showUnpermittedVolumes\":false,\"showUnpermittedFiles\":false,\"fullGraphqlData\":true,\"createButtonLabel\":null,\"expandEntryButtons\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"entryTypes\":[]}','2025-07-12 09:32:36','2025-07-12 10:16:30',NULL,'cfa3a69d-c697-4f3f-98e5-4a898f71797e'),(4,'Content Builder','contentBuilder','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"minEntries\":null,\"maxEntries\":null,\"enableVersioning\":false,\"viewMode\":\"blocks\",\"showCardsInGrid\":false,\"includeTableView\":false,\"defaultTableColumns\":[],\"defaultIndexViewMode\":\"cards\",\"pageSize\":null,\"createButtonLabel\":\"New Module\",\"propagationMethod\":\"all\",\"propagationKeyFormat\":null,\"siteSettings\":{\"8a720f2b-9ede-4431-8046-c8bb1b8c36a3\":[],\"4aef88dd-f371-46fa-a04c-0bcf17bb5449\":[],\"bd06d149-c109-4f58-bd08-8dd1e7738654\":[]},\"entryTypes\":[{\"uid\":\"cfc59921-481b-4e81-9445-cd5f2a3f68e4\",\"group\":\"General\"},{\"uid\":\"5cd79487-d897-4356-b811-6c7578b0e103\",\"group\":\"General\"},{\"uid\":\"66e0bd20-6fc2-44da-8f4c-d036ac1156c7\",\"group\":\"General\"},{\"uid\":\"c9b9fafc-2767-4b98-a078-bb250cccac09\",\"group\":\"General\"}]}','2025-07-12 09:36:19','2025-07-12 09:37:23',NULL,'a2332799-5a39-4400-aa5d-5b995cb438a2'),(5,'Translatable Plain Text','translatablePlainText','global',NULL,NULL,1,'language',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2025-07-12 09:38:46','2025-07-12 09:38:46',NULL,'0e79cff0-95ff-40c8-846b-c24c7d5ab6ff'),(6,'Select Author','selectAuthor','global',NULL,NULL,0,'language',NULL,'craft\\fields\\Users','{\"allowSelfRelations\":false,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSearchInput\":true,\"showSiteMenu\":true,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2025-07-12 09:41:53','2025-07-12 10:01:00',NULL,'cfa8c371-9db2-498f-9691-56bde76890d5');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[]',1,'2025-07-12 10:26:44','2025-07-12 10:26:44','be7f1728-68ac-4727-8934-d320fb35d9ad');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'5.8.6','5.8.0.3',0,'ziizmnbhfklz','3@lqudujmsqe','2025-07-12 08:49:16','2025-07-12 13:24:40','86dacf77-cb6f-4ba6-9a17-5c921122616b');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','04a913d7-5b09-4e01-81a7-c575efb77b80'),(2,'craft','m221101_115859_create_entries_authors_table','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','72067667-81b5-465d-b084-710ac8931105'),(3,'craft','m221107_112121_add_max_authors_to_sections','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','34bf3755-f492-407e-a55c-259772e5e825'),(4,'craft','m221205_082005_translatable_asset_alt_text','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','0aa895e4-9d3d-4f66-a129-aeb8dc3dd223'),(5,'craft','m230314_110309_add_authenticator_table','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','318f3c39-627d-4ae0-8e3f-ca62935c0bc1'),(6,'craft','m230314_111234_add_webauthn_table','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','470fa8cb-09a6-43d1-9dec-28c1e8891e2d'),(7,'craft','m230503_120303_add_recoverycodes_table','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','d267a26e-1a1f-41a4-ac8a-196eed76c458'),(8,'craft','m230511_000000_field_layout_configs','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','f8347158-9ff2-4cbf-a9fc-0d6c786afe41'),(9,'craft','m230511_215903_content_refactor','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','1171c75a-5fcb-4dce-88d7-815b68a3dfa0'),(10,'craft','m230524_000000_add_entry_type_show_slug_field','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','19d69f61-21bb-41d2-9ed8-7bd95fd3a5c7'),(11,'craft','m230524_000001_entry_type_icons','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','a4879a78-f435-46e6-80bd-f16deb5055f0'),(12,'craft','m230524_000002_entry_type_colors','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','66b1e29d-a902-4cfb-8d61-aa3073df0646'),(13,'craft','m230524_220029_global_entry_types','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','8c2d0330-89a7-44e9-a1ab-381c84f9f06e'),(14,'craft','m230531_123004_add_entry_type_show_status_field','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','014cf0dd-2f86-4e00-9d56-e5f96e6f56f9'),(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','36536515-1213-40d4-aa74-308c1546ab8b'),(16,'craft','m230616_173810_kill_field_groups','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','41298864-3c75-4b6c-8c82-2cc5ef1a44f4'),(17,'craft','m230616_183820_remove_field_name_limit','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','67f6c762-5b23-4181-8bc6-d6d32bdfbd6c'),(18,'craft','m230617_070415_entrify_matrix_blocks','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','74174412-7210-46d1-ad51-5d1137014e68'),(19,'craft','m230710_162700_element_activity','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','f943c58c-820f-479c-8195-65ccb6b441d1'),(20,'craft','m230820_162023_fix_cache_id_type','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','95821648-bffc-4700-ac4c-bb2ecfa1f9b0'),(21,'craft','m230826_094050_fix_session_id_type','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','6f8b6b8b-10fa-49f1-9b7e-48b97fa9f7a1'),(22,'craft','m230904_190356_address_fields','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','0cc6f7dc-7139-41f3-a118-51ddde1c281b'),(23,'craft','m230928_144045_add_subpath_to_volumes','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','393459f3-9291-4fb5-bca3-087d73bbd2ac'),(24,'craft','m231013_185640_changedfields_amend_primary_key','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','1aba7940-80d1-41bb-85c5-76dae3c665db'),(25,'craft','m231213_030600_element_bulk_ops','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','b93f0848-ab6a-4736-a42f-fea86fe62bfa'),(26,'craft','m240129_150719_sites_language_amend_length','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','9a69a4ce-40bd-4e17-a808-22bae878e231'),(27,'craft','m240206_035135_convert_json_columns','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','7380a4eb-4f0e-4a81-8d41-9d2f75084b96'),(28,'craft','m240207_182452_address_line_3','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','f57cba32-4f66-4a68-92d7-099e0aafa4fa'),(29,'craft','m240302_212719_solo_preview_targets','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','ba9f88bd-880a-47de-b42f-e8bc8c2e8679'),(30,'craft','m240619_091352_add_auth_2fa_timestamp','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','4d27909c-334d-4d83-b517-f32a3e96da47'),(31,'craft','m240723_214330_drop_bulkop_fk','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','cc57e6c5-d279-498d-a901-e6d0b4765b76'),(32,'craft','m240731_053543_soft_delete_fields','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','48f2c67c-73c2-447d-85cf-9ee62defa226'),(33,'craft','m240805_154041_sso_identities','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','cc5e7ebd-d790-4591-8710-23064fc86270'),(34,'craft','m240926_202248_track_entries_deleted_with_section','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','23dccc1a-8634-4eb1-93fe-fb14c32f5272'),(35,'craft','m241120_190905_user_affiliated_sites','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','ac0aa9ee-7ab1-448f-9a1f-fd94da91b189'),(36,'craft','m241125_122914_add_viewUsers_permission','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','da25ed41-04c1-4f6c-8b55-1275bad67a79'),(37,'craft','m250119_135304_entry_type_overrides','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','ec053d33-8679-47ae-8fef-1c8f63e387e5'),(38,'craft','m250206_135036_search_index_queue','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','ff694bcb-bb21-4f56-95ee-bb1ec5ea95f4'),(39,'craft','m250207_172349_bulkop_events','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','9c7ec708-453b-4f7d-b7b0-c4341377987a'),(40,'craft','m250315_131608_unlimited_authors','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','0cadbc4e-3385-48d8-8122-02d486fcab4b'),(41,'craft','m250403_171253_static_statuses','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','2d2d1bde-28c8-4f53-9789-91abb68a2623'),(42,'craft','m250512_164202_asset_mime_types','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','c84113b3-4574-4c7d-821b-6aa14995d435'),(43,'craft','m250522_090843_add_deleteEntriesForSite_and_deletePeerEntriesForSite_permissions','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','c09900d5-f644-46d5-963e-fb235d6e23c2'),(44,'craft','m250531_183058_content_blocks','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','6683edf5-2633-466a-ab17-630bb86af39e'),(45,'craft','m250623_105031_entry_type_descriptions','2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 08:49:16','f04d353d-b217-428b-9678-6382155b499e'),(46,'plugin:query-api','Install','2025-07-12 08:52:01','2025-07-12 08:52:01','2025-07-12 08:52:01','9f31d53f-a7e6-4eeb-9eaf-84924e3374f9'),(47,'plugin:ckeditor','Install','2025-07-12 08:54:18','2025-07-12 08:54:18','2025-07-12 08:54:18','9230aa11-7006-4b3a-a857-1c41a5b7e152'),(48,'plugin:ckeditor','m230408_163704_v3_upgrade','2025-07-12 08:54:18','2025-07-12 08:54:18','2025-07-12 08:54:18','d13e9fef-4a1f-4408-8f5c-8c7b84d386c9');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'query-api','3.1.2','1.0.0','2025-07-12 08:52:01','2025-07-12 08:52:01','2025-07-12 08:52:01','be74216a-b19b-4884-90dc-6020b7ceec98'),(2,'imager-x','5.1.4','4.0.0','2025-07-12 08:53:52','2025-07-12 08:53:52','2025-07-12 08:53:52','077cbee1-e981-47aa-a685-60570d4283ad'),(3,'ckeditor','4.9.0','3.0.0.0','2025-07-12 08:54:18','2025-07-12 08:54:18','2025-07-12 08:54:18','12d359c9-a2b3-41b3-8d48-4cce38de4336');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('ckeditor.configs.1592478f-4b05-481a-bb24-4ce64dd1d8cd.headingLevels.0','2'),('ckeditor.configs.1592478f-4b05-481a-bb24-4ce64dd1d8cd.headingLevels.1','3'),('ckeditor.configs.1592478f-4b05-481a-bb24-4ce64dd1d8cd.headingLevels.2','4'),('ckeditor.configs.1592478f-4b05-481a-bb24-4ce64dd1d8cd.headingLevels.3','5'),('ckeditor.configs.1592478f-4b05-481a-bb24-4ce64dd1d8cd.headingLevels.4','6'),('ckeditor.configs.1592478f-4b05-481a-bb24-4ce64dd1d8cd.name','\"Simple\"'),('ckeditor.configs.1592478f-4b05-481a-bb24-4ce64dd1d8cd.toolbar.0','\"heading\"'),('ckeditor.configs.1592478f-4b05-481a-bb24-4ce64dd1d8cd.toolbar.1','\"bold\"'),('ckeditor.configs.1592478f-4b05-481a-bb24-4ce64dd1d8cd.toolbar.2','\"italic\"'),('ckeditor.configs.1592478f-4b05-481a-bb24-4ce64dd1d8cd.toolbar.3','\"link\"'),('ckeditor.configs.1592478f-4b05-481a-bb24-4ce64dd1d8cd.toolbar.4','\"bulletedList\"'),('ckeditor.configs.1592478f-4b05-481a-bb24-4ce64dd1d8cd.toolbar.5','\"numberedList\"'),('ckeditor.configs.1592478f-4b05-481a-bb24-4ce64dd1d8cd.toolbar.6','\"undo\"'),('ckeditor.configs.1592478f-4b05-481a-bb24-4ce64dd1d8cd.toolbar.7','\"redo\"'),('dateModified','1752326680'),('email.fromEmail','\"admin@gmail.com\"'),('email.fromName','\"Query API Starter\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.color','null'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.description','null'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.cardThumbAlignment','\"end\"'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.elementCondition','null'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.elements.0.dateAdded','\"2025-07-12T09:35:15+00:00\"'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.elements.0.editCondition','null'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.elements.0.elementCondition','null'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.elements.0.fieldUid','\"cfa3a69d-c697-4f3f-98e5-4a898f71797e\"'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.elements.0.handle','null'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.elements.0.includeInCards','false'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.elements.0.instructions','null'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.elements.0.label','null'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.elements.0.providesThumbs','false'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.elements.0.required','false'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.elements.0.tip','null'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.elements.0.uid','\"8abac79e-53f3-4592-bbd2-96ce5cb94584\"'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.elements.0.userCondition','null'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.elements.0.warning','null'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.elements.0.width','100'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.name','\"Content\"'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.uid','\"02643d21-9383-43cf-8fb4-8fc73e80506b\"'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.fieldLayouts.13d80a57-a89f-4426-8236-3b9e345738b9.tabs.0.userCondition','null'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.handle','\"text\"'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.hasTitleField','false'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.icon','\"text\"'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.name','\"Text\"'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.showSlugField','false'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.showStatusField','true'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.slugTranslationKeyFormat','null'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.slugTranslationMethod','\"site\"'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.titleFormat','null'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.titleTranslationKeyFormat','null'),('entryTypes.5cd79487-d897-4356-b811-6c7578b0e103.titleTranslationMethod','\"language\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.color','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.description','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.cardThumbAlignment','\"end\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elementCondition','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.autocapitalize','true'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.autocomplete','false'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.autocorrect','true'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.class','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.dateAdded','\"2025-07-12T09:28:11+00:00\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.disabled','false'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.elementCondition','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.id','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.includeInCards','false'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.inputType','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.instructions','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.label','\"Headline\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.max','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.min','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.name','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.orientation','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.placeholder','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.providesThumbs','false'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.readonly','false'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.required','true'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.size','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.step','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.tip','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.title','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.uid','\"b4768b0f-9792-4463-8694-1e0239204062\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.userCondition','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.warning','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.0.width','50'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.1.dateAdded','\"2025-07-12T09:33:22+00:00\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.1.editCondition','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.1.elementCondition','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.1.fieldUid','\"b31aa533-16c8-44d2-8e9f-ffe300c2e7a6\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.1.handle','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.1.includeInCards','false'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.1.instructions','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.1.label','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.1.providesThumbs','false'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.1.required','false'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.1.tip','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.1.uid','\"50e7623b-e945-4db4-96ba-1f93bfdf0e50\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.1.userCondition','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.1.warning','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.1.width','50'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.2.dateAdded','\"2025-07-12T09:33:22+00:00\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.2.editCondition','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.2.elementCondition','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.2.fieldUid','\"cfa3a69d-c697-4f3f-98e5-4a898f71797e\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.2.handle','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.2.includeInCards','false'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.2.instructions','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.2.label','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.2.providesThumbs','false'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.2.required','false'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.2.tip','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.2.uid','\"0c94d65a-180c-4670-a2cd-e3d5b0fcdcab\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.2.userCondition','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.2.warning','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.2.width','100'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.3.dateAdded','\"2025-07-12T09:33:22+00:00\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.3.editCondition','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.3.elementCondition','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.3.fieldUid','\"a0aeee7d-14a9-44d9-a1a6-07e8518657c0\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.3.handle','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.3.includeInCards','false'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.3.instructions','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.3.label','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.3.providesThumbs','false'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.3.required','true'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.3.tip','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.3.uid','\"8aa48013-3ad2-4a42-9230-855839cd44a8\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.3.userCondition','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.3.warning','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.elements.3.width','100'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.name','\"Content\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.uid','\"9ae992f8-80f7-48ae-9477-7c3c5638ea0b\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.fieldLayouts.c2fc8bab-a5f7-4813-bc13-9a6188a19753.tabs.0.userCondition','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.handle','\"imageAndText\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.hasTitleField','true'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.icon','\"image-polaroid\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.name','\"Image and Text\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.showSlugField','true'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.showStatusField','true'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.slugTranslationKeyFormat','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.slugTranslationMethod','\"language\"'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.titleFormat','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.titleTranslationKeyFormat','null'),('entryTypes.66e0bd20-6fc2-44da-8f4c-d036ac1156c7.titleTranslationMethod','\"language\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.color','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.description','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.cardThumbAlignment','\"end\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elementCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.autocapitalize','true'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.autocomplete','false'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.autocorrect','true'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.class','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.dateAdded','\"2025-07-12T09:15:40+00:00\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.disabled','false'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.elementCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.id','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.includeInCards','false'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.inputType','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.instructions','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.label','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.max','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.min','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.name','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.orientation','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.placeholder','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.providesThumbs','false'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.readonly','false'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.required','true'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.size','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.step','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.tip','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.title','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.uid','\"965778f6-e584-4e96-a01c-584365d66b41\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.userCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.warning','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.0.width','100'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.1.dateAdded','\"2025-07-12T09:39:50+00:00\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.1.elementCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.1.heading','\"Hero\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\Heading\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.1.uid','\"f7ee93fa-8822-4474-a300-78fd4ccc364e\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.1.userCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.2.dateAdded','\"2025-07-12T09:39:50+00:00\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.2.editCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.2.elementCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.2.fieldUid','\"0e79cff0-95ff-40c8-846b-c24c7d5ab6ff\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.2.handle','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.2.includeInCards','false'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.2.instructions','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.2.label','\"Headline\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.2.providesThumbs','false'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.2.required','false'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.2.tip','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.2.uid','\"1542ed19-45ce-470b-9701-0eda7b118b8b\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.2.userCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.2.warning','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.2.width','100'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.3.dateAdded','\"2025-07-12T09:39:50+00:00\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.3.editCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.3.elementCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.3.fieldUid','\"cfa3a69d-c697-4f3f-98e5-4a898f71797e\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.3.handle','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.3.includeInCards','false'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.3.instructions','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.3.label','\"Intro Text\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.3.providesThumbs','false'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.3.required','false'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.3.tip','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.3.uid','\"33e6414d-6cb4-40b1-a5c8-abee23254b4c\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.3.userCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.3.warning','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.3.width','100'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.4.dateAdded','\"2025-07-12T09:39:50+00:00\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.4.editCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.4.elementCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.4.fieldUid','\"a0aeee7d-14a9-44d9-a1a6-07e8518657c0\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.4.handle','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.4.includeInCards','false'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.4.instructions','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.4.label','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.4.providesThumbs','false'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.4.required','false'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.4.tip','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.4.uid','\"a38c9b54-55c5-46a3-8316-1f60ef0cbf3a\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.4.userCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.4.warning','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.4.width','100'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.5.dateAdded','\"2025-07-12T09:39:50+00:00\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.5.elementCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.5.heading','\"Content\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\Heading\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.5.uid','\"8580271a-b530-4128-8439-278b9b58b8fa\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.5.userCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.6.dateAdded','\"2025-07-12T09:39:50+00:00\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.6.editCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.6.elementCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.6.fieldUid','\"a2332799-5a39-4400-aa5d-5b995cb438a2\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.6.handle','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.6.includeInCards','false'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.6.instructions','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.6.label','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.6.providesThumbs','false'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.6.required','false'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.6.tip','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.6.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.6.uid','\"7191be35-c90c-4355-9560-eae1c4b2f7fb\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.6.userCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.6.warning','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.elements.6.width','100'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.name','\"Content\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.uid','\"b0a951ab-1e1b-45e9-a478-fa2d5ebd30a8\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.fieldLayouts.67867958-c3ce-48a7-807a-15e0fb09b88e.tabs.0.userCondition','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.handle','\"home\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.hasTitleField','true'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.icon','\"house\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.name','\"home\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.showSlugField','true'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.showStatusField','true'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.slugTranslationKeyFormat','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.slugTranslationMethod','\"site\"'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.titleFormat','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.titleTranslationKeyFormat','null'),('entryTypes.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75.titleTranslationMethod','\"language\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.color','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.description','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.cardThumbAlignment','\"end\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elementCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.autocapitalize','true'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.autocomplete','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.autocorrect','true'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.class','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.dateAdded','\"2025-07-12T09:17:36+00:00\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.disabled','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.elementCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.id','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.includeInCards','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.inputType','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.instructions','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.label','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.max','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.min','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.name','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.orientation','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.placeholder','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.providesThumbs','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.readonly','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.required','true'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.size','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.step','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.tip','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.title','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.uid','\"1e0ee97d-b1a0-4edc-bff6-61a8c94db2ed\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.userCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.warning','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.0.width','100'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.1.dateAdded','\"2025-07-12T09:42:02+00:00\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.1.elementCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.1.heading','\"\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\Heading\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.1.uid','\"d001cb31-d9df-4b7d-ac34-eb5608087392\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.1.userCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.2.dateAdded','\"2025-07-12T09:42:02+00:00\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.2.editCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.2.elementCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.2.fieldUid','\"0e79cff0-95ff-40c8-846b-c24c7d5ab6ff\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.2.handle','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.2.includeInCards','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.2.instructions','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.2.label','\"Headline\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.2.providesThumbs','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.2.required','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.2.tip','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.2.uid','\"3ff10faa-aafd-4ec0-b638-c97e642e0a8c\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.2.userCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.2.warning','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.2.width','100'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.3.dateAdded','\"2025-07-12T09:42:02+00:00\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.3.editCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.3.elementCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.3.fieldUid','\"cfa3a69d-c697-4f3f-98e5-4a898f71797e\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.3.handle','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.3.includeInCards','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.3.instructions','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.3.label','\"Intro Text\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.3.providesThumbs','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.3.required','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.3.tip','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.3.uid','\"9df6cca2-8b86-4950-8eb0-cab6ce593922\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.3.userCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.3.warning','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.3.width','100'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.4.dateAdded','\"2025-07-12T09:42:02+00:00\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.4.editCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.4.elementCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.4.fieldUid','\"a0aeee7d-14a9-44d9-a1a6-07e8518657c0\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.4.handle','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.4.includeInCards','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.4.instructions','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.4.label','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.4.providesThumbs','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.4.required','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.4.tip','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.4.uid','\"e477a46a-3858-4d77-9bf0-818e96c4dd91\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.4.userCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.4.warning','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.4.width','100'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.5.dateAdded','\"2025-07-12T09:42:02+00:00\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.5.elementCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.5.heading','\"Content\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\Heading\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.5.uid','\"70e057e3-01be-42f1-b255-1cf45d8bad89\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.5.userCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.6.dateAdded','\"2025-07-12T09:42:02+00:00\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.6.editCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.6.elementCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.6.fieldUid','\"a2332799-5a39-4400-aa5d-5b995cb438a2\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.6.handle','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.6.includeInCards','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.6.instructions','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.6.label','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.6.providesThumbs','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.6.required','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.6.tip','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.6.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.6.uid','\"b7719d9b-d4f4-4779-a41d-64f91a435ae2\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.6.userCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.6.warning','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.elements.6.width','100'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.name','\"Content\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.uid','\"a43ab9f8-73a2-4b1f-a860-8e2e49e8080b\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.0.userCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.elementCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.elements.0.dateAdded','\"2025-07-12T09:42:02+00:00\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.elements.0.editCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.elements.0.elementCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.elements.0.fieldUid','\"cfa8c371-9db2-498f-9691-56bde76890d5\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.elements.0.handle','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.elements.0.includeInCards','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.elements.0.instructions','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.elements.0.label','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.elements.0.providesThumbs','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.elements.0.required','false'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.elements.0.tip','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.elements.0.uid','\"fe994fac-b988-4451-85ed-9f95abfdf575\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.elements.0.userCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.elements.0.warning','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.elements.0.width','100'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.name','\"Settings\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.uid','\"7b8ade3d-87b8-4465-9de9-6a78f33212b2\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.fieldLayouts.1ca40257-d943-473b-955d-cb03bccd8d8a.tabs.1.userCondition','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.handle','\"news\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.hasTitleField','true'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.icon','\"newspaper\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.name','\"News\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.showSlugField','true'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.showStatusField','true'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.slugTranslationKeyFormat','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.slugTranslationMethod','\"site\"'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.titleFormat','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.titleTranslationKeyFormat','null'),('entryTypes.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb.titleTranslationMethod','\"language\"'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.color','null'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.description','null'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.cardThumbAlignment','\"end\"'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.elementCondition','null'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.elements.0.dateAdded','\"2025-07-12T09:35:46+00:00\"'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.elements.0.editCondition','null'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.elements.0.elementCondition','null'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.elements.0.fieldUid','\"a0aeee7d-14a9-44d9-a1a6-07e8518657c0\"'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.elements.0.handle','null'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.elements.0.includeInCards','false'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.elements.0.instructions','null'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.elements.0.label','null'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.elements.0.providesThumbs','false'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.elements.0.required','false'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.elements.0.tip','null'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.elements.0.uid','\"e2966306-abe9-4cd0-a63f-1cc76dfd8547\"'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.elements.0.userCondition','null'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.elements.0.warning','null'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.elements.0.width','100'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.name','\"Content\"'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.uid','\"512fd508-195c-4ebd-a2cf-bee822943006\"'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.fieldLayouts.66ccc7d1-468c-4af9-a8ed-0aa1088c5382.tabs.0.userCondition','null'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.handle','\"image\"'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.hasTitleField','false'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.icon','\"image-landscape\"'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.name','\"Image\"'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.showSlugField','false'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.showStatusField','true'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.slugTranslationKeyFormat','null'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.slugTranslationMethod','\"site\"'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.titleFormat','null'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.titleTranslationKeyFormat','null'),('entryTypes.c9b9fafc-2767-4b98-a078-bb250cccac09.titleTranslationMethod','\"language\"'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.color','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.description','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.cardThumbAlignment','\"end\"'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elementCondition','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.autocapitalize','true'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.autocomplete','false'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.autocorrect','true'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.class','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.dateAdded','\"2025-07-12T09:26:23+00:00\"'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.disabled','false'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.elementCondition','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.id','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.includeInCards','false'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.inputType','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.instructions','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.label','\"Headline\"'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.max','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.min','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.name','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.orientation','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.placeholder','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.providesThumbs','false'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.readonly','false'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.required','true'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.size','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.step','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.tip','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.title','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.uid','\"b510aee4-7050-4bfe-9d65-7ac1cfcc386c\"'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.userCondition','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.warning','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.0.width','50'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.1.dateAdded','\"2025-07-12T09:29:07+00:00\"'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.1.editCondition','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.1.elementCondition','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.1.fieldUid','\"b31aa533-16c8-44d2-8e9f-ffe300c2e7a6\"'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.1.handle','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.1.includeInCards','false'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.1.instructions','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.1.label','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.1.providesThumbs','false'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.1.required','false'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.1.tip','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.1.uid','\"18d710b6-1115-495c-bbd2-fadc532253d8\"'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.1.userCondition','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.1.warning','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.elements.1.width','50'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.name','\"Content\"'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.uid','\"77e62c77-2070-47fe-8cd5-0e4816faf2ec\"'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.fieldLayouts.c2f99198-d6ca-4d3c-8b41-808c941eb6a9.tabs.0.userCondition','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.handle','\"headline\"'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.hasTitleField','true'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.icon','\"h1\"'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.name','\"Headline\"'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.showSlugField','false'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.showStatusField','true'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.slugTranslationKeyFormat','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.slugTranslationMethod','\"site\"'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.titleFormat','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.titleTranslationKeyFormat','null'),('entryTypes.cfc59921-481b-4e81-9445-cd5f2a3f68e4.titleTranslationMethod','\"language\"'),('fields.0e79cff0-95ff-40c8-846b-c24c7d5ab6ff.columnSuffix','null'),('fields.0e79cff0-95ff-40c8-846b-c24c7d5ab6ff.handle','\"translatablePlainText\"'),('fields.0e79cff0-95ff-40c8-846b-c24c7d5ab6ff.instructions','null'),('fields.0e79cff0-95ff-40c8-846b-c24c7d5ab6ff.name','\"Translatable Plain Text\"'),('fields.0e79cff0-95ff-40c8-846b-c24c7d5ab6ff.searchable','true'),('fields.0e79cff0-95ff-40c8-846b-c24c7d5ab6ff.settings.byteLimit','null'),('fields.0e79cff0-95ff-40c8-846b-c24c7d5ab6ff.settings.charLimit','null'),('fields.0e79cff0-95ff-40c8-846b-c24c7d5ab6ff.settings.code','false'),('fields.0e79cff0-95ff-40c8-846b-c24c7d5ab6ff.settings.initialRows','4'),('fields.0e79cff0-95ff-40c8-846b-c24c7d5ab6ff.settings.multiline','false'),('fields.0e79cff0-95ff-40c8-846b-c24c7d5ab6ff.settings.placeholder','null'),('fields.0e79cff0-95ff-40c8-846b-c24c7d5ab6ff.settings.uiMode','\"normal\"'),('fields.0e79cff0-95ff-40c8-846b-c24c7d5ab6ff.translationKeyFormat','null'),('fields.0e79cff0-95ff-40c8-846b-c24c7d5ab6ff.translationMethod','\"language\"'),('fields.0e79cff0-95ff-40c8-846b-c24c7d5ab6ff.type','\"craft\\\\fields\\\\PlainText\"'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.columnSuffix','null'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.handle','\"image\"'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.instructions','null'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.name','\"Image\"'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.searchable','false'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.allowedKinds','null'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.allowSelfRelations','false'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.allowSubfolders','false'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.allowUploads','true'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.branchLimit','null'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.defaultPlacement','\"end\"'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.defaultUploadLocationSource','\"volume:69ea2a52-05af-4d3d-be23-110dab8479b0\"'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.defaultUploadLocationSubpath','null'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.maintainHierarchy','false'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.maxRelations','1'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.minRelations','null'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.previewMode','\"full\"'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.restrictedDefaultUploadSubpath','null'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.restrictedLocationSource','\"volume:69ea2a52-05af-4d3d-be23-110dab8479b0\"'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.restrictedLocationSubpath','null'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.restrictFiles','false'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.restrictLocation','false'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.selectionLabel','null'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.showCardsInGrid','false'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.showSearchInput','true'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.showSiteMenu','true'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.showUnpermittedFiles','false'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.showUnpermittedVolumes','false'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.sources.0','\"volume:69ea2a52-05af-4d3d-be23-110dab8479b0\"'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.targetSiteId','null'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.validateRelatedElements','false'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.settings.viewMode','\"large\"'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.translationKeyFormat','null'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.translationMethod','\"language\"'),('fields.a0aeee7d-14a9-44d9-a1a6-07e8518657c0.type','\"craft\\\\fields\\\\Assets\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.columnSuffix','null'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.handle','\"contentBuilder\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.instructions','null'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.name','\"Content Builder\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.searchable','false'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.createButtonLabel','\"New Module\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.defaultIndexViewMode','\"cards\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.enableVersioning','false'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.entryTypes.0.__assoc__.0.1','\"cfc59921-481b-4e81-9445-cd5f2a3f68e4\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.entryTypes.0.__assoc__.1.0','\"group\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.entryTypes.0.__assoc__.1.1','\"General\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.entryTypes.1.__assoc__.0.0','\"uid\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.entryTypes.1.__assoc__.0.1','\"5cd79487-d897-4356-b811-6c7578b0e103\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.entryTypes.1.__assoc__.1.0','\"group\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.entryTypes.1.__assoc__.1.1','\"General\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.entryTypes.2.__assoc__.0.0','\"uid\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.entryTypes.2.__assoc__.0.1','\"66e0bd20-6fc2-44da-8f4c-d036ac1156c7\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.entryTypes.2.__assoc__.1.0','\"group\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.entryTypes.2.__assoc__.1.1','\"General\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.entryTypes.3.__assoc__.0.0','\"uid\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.entryTypes.3.__assoc__.0.1','\"c9b9fafc-2767-4b98-a078-bb250cccac09\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.entryTypes.3.__assoc__.1.0','\"group\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.entryTypes.3.__assoc__.1.1','\"General\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.includeTableView','false'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.maxEntries','null'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.minEntries','null'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.pageSize','null'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.propagationKeyFormat','null'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.propagationMethod','\"all\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.showCardsInGrid','false'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.settings.viewMode','\"blocks\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.translationKeyFormat','null'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.translationMethod','\"site\"'),('fields.a2332799-5a39-4400-aa5d-5b995cb438a2.type','\"craft\\\\fields\\\\Matrix\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.columnSuffix','null'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.handle','\"selectHeadlineTag\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.instructions','null'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.name','\"Select Headline Tag\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.searchable','false'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.customOptions','false'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.0.__assoc__.0.0','\"label\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.0.__assoc__.0.1','\"H2\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.0.__assoc__.1.0','\"value\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.0.__assoc__.1.1','\"h2\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.0.__assoc__.2.0','\"icon\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.0.__assoc__.2.1','\"\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.0.__assoc__.3.0','\"color\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.0.__assoc__.3.1','\"\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.0.__assoc__.4.0','\"default\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.0.__assoc__.4.1','\"1\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.1.__assoc__.0.0','\"label\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.1.__assoc__.0.1','\"H3\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.1.__assoc__.1.0','\"value\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.1.__assoc__.1.1','\"h3\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.1.__assoc__.2.0','\"icon\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.1.__assoc__.2.1','\"\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.1.__assoc__.3.0','\"color\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.1.__assoc__.3.1','\"\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.1.__assoc__.4.0','\"default\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.1.__assoc__.4.1','\"\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.2.__assoc__.0.0','\"label\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.2.__assoc__.0.1','\"H4\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.2.__assoc__.1.0','\"value\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.2.__assoc__.1.1','\"h4\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.2.__assoc__.2.0','\"icon\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.2.__assoc__.2.1','\"\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.2.__assoc__.3.0','\"color\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.2.__assoc__.3.1','\"\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.2.__assoc__.4.0','\"default\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.2.__assoc__.4.1','\"\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.3.__assoc__.0.0','\"label\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.3.__assoc__.0.1','\"H5\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.3.__assoc__.1.0','\"value\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.3.__assoc__.1.1','\"h5\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.3.__assoc__.2.0','\"icon\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.3.__assoc__.2.1','\"\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.3.__assoc__.3.0','\"color\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.3.__assoc__.3.1','\"\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.3.__assoc__.4.0','\"default\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.settings.options.3.__assoc__.4.1','\"\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.translationKeyFormat','null'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.translationMethod','\"language\"'),('fields.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6.type','\"craft\\\\fields\\\\Dropdown\"'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.columnSuffix','null'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.handle','\"richText\"'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.instructions','null'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.name','\"Rich Text\"'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.searchable','false'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.settings.availableTransforms','\"\"'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.settings.availableVolumes','\"*\"'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.settings.characterLimit','null'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.settings.ckeConfig','\"1592478f-4b05-481a-bb24-4ce64dd1d8cd\"'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.settings.createButtonLabel','null'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.settings.defaultTransform','null'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.settings.expandEntryButtons','false'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.settings.fullGraphqlData','true'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.settings.parseEmbeds','false'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.settings.purifierConfig','null'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.settings.purifyHtml','true'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.settings.showUnpermittedFiles','false'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.settings.showUnpermittedVolumes','false'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.settings.showWordCount','true'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.settings.sourceEditingGroups.0','\"__ADMINS__\"'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.settings.wordLimit','null'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.translationKeyFormat','null'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.translationMethod','\"language\"'),('fields.cfa3a69d-c697-4f3f-98e5-4a898f71797e.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.columnSuffix','null'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.handle','\"selectAuthor\"'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.instructions','null'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.name','\"Select Author\"'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.searchable','false'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.settings.allowSelfRelations','false'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.settings.branchLimit','null'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.settings.defaultPlacement','\"end\"'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.settings.maintainHierarchy','false'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.settings.maxRelations','1'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.settings.minRelations','null'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.settings.selectionLabel','null'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.settings.showCardsInGrid','false'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.settings.showSearchInput','true'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.settings.showSiteMenu','true'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.settings.sources','\"*\"'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.settings.targetSiteId','null'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.settings.validateRelatedElements','false'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.settings.viewMode','\"list\"'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.translationKeyFormat','null'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.translationMethod','\"language\"'),('fields.cfa8c371-9db2-498f-9691-56bde76890d5.type','\"craft\\\\fields\\\\Users\"'),('fs.images.hasUrls','true'),('fs.images.name','\"Images\"'),('fs.images.settings.path','\"@webroot/assets/images\"'),('fs.images.type','\"craft\\\\fs\\\\Local\"'),('fs.images.url','\"@web/assets/images\"'),('graphql.schemas.be7f1728-68ac-4727-8934-d320fb35d9ad.isPublic','true'),('graphql.schemas.be7f1728-68ac-4727-8934-d320fb35d9ad.name','\"Public Schema\"'),('meta.__names__.0e79cff0-95ff-40c8-846b-c24c7d5ab6ff','\"Translatable Plain Text\"'),('meta.__names__.1592478f-4b05-481a-bb24-4ce64dd1d8cd','\"Simple\"'),('meta.__names__.1f5db355-8d9f-45cd-953e-88aa0634dc1b','\"Home\"'),('meta.__names__.4aef88dd-f371-46fa-a04c-0bcf17bb5449','\"DE\"'),('meta.__names__.5cd79487-d897-4356-b811-6c7578b0e103','\"Text\"'),('meta.__names__.618cfb39-7c17-47d9-8458-6de2797beeb3','\"News\"'),('meta.__names__.66e0bd20-6fc2-44da-8f4c-d036ac1156c7','\"Image and Text\"'),('meta.__names__.69ea2a52-05af-4d3d-be23-110dab8479b0','\"Images\"'),('meta.__names__.7f21a5a2-b531-45ab-a43a-621c92cbae46','\"Public Schema\"'),('meta.__names__.84441053-475f-4882-8132-350e883d79cf','\"Query API Starter\"'),('meta.__names__.8a720f2b-9ede-4431-8046-c8bb1b8c36a3','\"EN\"'),('meta.__names__.a0aeee7d-14a9-44d9-a1a6-07e8518657c0','\"Image\"'),('meta.__names__.a2332799-5a39-4400-aa5d-5b995cb438a2','\"Content Builder\"'),('meta.__names__.b31aa533-16c8-44d2-8e9f-ffe300c2e7a6','\"Select Headline Tag\"'),('meta.__names__.bc8e1a2f-5837-413f-b3e4-dbe2a568ab75','\"home\"'),('meta.__names__.bd06d149-c109-4f58-bd08-8dd1e7738654','\"ES\"'),('meta.__names__.be7f1728-68ac-4727-8934-d320fb35d9ad','\"Public Schema\"'),('meta.__names__.c68b11e2-a09e-4cd4-b2a3-f142402b7aeb','\"News\"'),('meta.__names__.c9b9fafc-2767-4b98-a078-bb250cccac09','\"Image\"'),('meta.__names__.cfa3a69d-c697-4f3f-98e5-4a898f71797e','\"Rich Text\"'),('meta.__names__.cfa8c371-9db2-498f-9691-56bde76890d5','\"Select Author\"'),('meta.__names__.cfc59921-481b-4e81-9445-cd5f2a3f68e4','\"Headline\"'),('plugins.ckeditor.edition','\"standard\"'),('plugins.ckeditor.enabled','true'),('plugins.ckeditor.schemaVersion','\"3.0.0.0\"'),('plugins.imager-x.edition','\"lite\"'),('plugins.imager-x.enabled','true'),('plugins.imager-x.licenseKey','\"AAIGGL6NP4ZKMBE44CI7NA6N\"'),('plugins.imager-x.schemaVersion','\"4.0.0\"'),('plugins.query-api.edition','\"standard\"'),('plugins.query-api.enabled','true'),('plugins.query-api.licenseKey','\"7G13656MI7Q06WNTCW00ZZ9T\"'),('plugins.query-api.schemaVersion','\"1.0.0\"'),('query-api.schemas.7f21a5a2-b531-45ab-a43a-621c92cbae46.name','\"Public Schema\"'),('query-api.schemas.7f21a5a2-b531-45ab-a43a-621c92cbae46.scope.0','\"sites.*:read\"'),('query-api.schemas.7f21a5a2-b531-45ab-a43a-621c92cbae46.scope.1','\"sections.*:read\"'),('query-api.schemas.7f21a5a2-b531-45ab-a43a-621c92cbae46.scope.2','\"usergroups.*:read\"'),('query-api.schemas.7f21a5a2-b531-45ab-a43a-621c92cbae46.scope.3','\"volumes.*:read\"'),('query-api.schemas.7f21a5a2-b531-45ab-a43a-621c92cbae46.scope.4','\"addresses.*:read\"'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.defaultPlacement','\"end\"'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.enableVersioning','true'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.entryTypes.0.uid','\"bc8e1a2f-5837-413f-b3e4-dbe2a568ab75\"'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.handle','\"home\"'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.maxAuthors','1'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.name','\"Home\"'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.propagationMethod','\"all\"'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.siteSettings.4aef88dd-f371-46fa-a04c-0bcf17bb5449.enabledByDefault','true'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.siteSettings.4aef88dd-f371-46fa-a04c-0bcf17bb5449.hasUrls','true'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.siteSettings.4aef88dd-f371-46fa-a04c-0bcf17bb5449.template','null'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.siteSettings.4aef88dd-f371-46fa-a04c-0bcf17bb5449.uriFormat','\"__home__\"'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.siteSettings.8a720f2b-9ede-4431-8046-c8bb1b8c36a3.enabledByDefault','true'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.siteSettings.8a720f2b-9ede-4431-8046-c8bb1b8c36a3.hasUrls','true'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.siteSettings.8a720f2b-9ede-4431-8046-c8bb1b8c36a3.template','null'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.siteSettings.8a720f2b-9ede-4431-8046-c8bb1b8c36a3.uriFormat','\"__home__\"'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.siteSettings.bd06d149-c109-4f58-bd08-8dd1e7738654.enabledByDefault','true'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.siteSettings.bd06d149-c109-4f58-bd08-8dd1e7738654.hasUrls','true'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.siteSettings.bd06d149-c109-4f58-bd08-8dd1e7738654.template','null'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.siteSettings.bd06d149-c109-4f58-bd08-8dd1e7738654.uriFormat','\"__home__\"'),('sections.1f5db355-8d9f-45cd-953e-88aa0634dc1b.type','\"single\"'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.defaultPlacement','\"end\"'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.enableVersioning','true'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.entryTypes.0.uid','\"c68b11e2-a09e-4cd4-b2a3-f142402b7aeb\"'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.handle','\"news\"'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.maxAuthors','1'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.name','\"News\"'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.propagationMethod','\"all\"'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.siteSettings.4aef88dd-f371-46fa-a04c-0bcf17bb5449.enabledByDefault','true'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.siteSettings.4aef88dd-f371-46fa-a04c-0bcf17bb5449.hasUrls','true'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.siteSettings.4aef88dd-f371-46fa-a04c-0bcf17bb5449.template','null'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.siteSettings.4aef88dd-f371-46fa-a04c-0bcf17bb5449.uriFormat','\"news/{slug}\"'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.siteSettings.8a720f2b-9ede-4431-8046-c8bb1b8c36a3.enabledByDefault','true'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.siteSettings.8a720f2b-9ede-4431-8046-c8bb1b8c36a3.hasUrls','true'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.siteSettings.8a720f2b-9ede-4431-8046-c8bb1b8c36a3.template','null'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.siteSettings.8a720f2b-9ede-4431-8046-c8bb1b8c36a3.uriFormat','\"news/{slug}\"'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.siteSettings.bd06d149-c109-4f58-bd08-8dd1e7738654.enabledByDefault','true'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.siteSettings.bd06d149-c109-4f58-bd08-8dd1e7738654.hasUrls','true'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.siteSettings.bd06d149-c109-4f58-bd08-8dd1e7738654.template','null'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.siteSettings.bd06d149-c109-4f58-bd08-8dd1e7738654.uriFormat','\"news/{slug}\"'),('sections.618cfb39-7c17-47d9-8458-6de2797beeb3.type','\"channel\"'),('siteGroups.84441053-475f-4882-8132-350e883d79cf.name','\"Query API Starter\"'),('sites.4aef88dd-f371-46fa-a04c-0bcf17bb5449.baseUrl','\"$WEBSITE_URL_DE\"'),('sites.4aef88dd-f371-46fa-a04c-0bcf17bb5449.enabled','\"1\"'),('sites.4aef88dd-f371-46fa-a04c-0bcf17bb5449.handle','\"de\"'),('sites.4aef88dd-f371-46fa-a04c-0bcf17bb5449.hasUrls','true'),('sites.4aef88dd-f371-46fa-a04c-0bcf17bb5449.language','\"de\"'),('sites.4aef88dd-f371-46fa-a04c-0bcf17bb5449.name','\"DE\"'),('sites.4aef88dd-f371-46fa-a04c-0bcf17bb5449.primary','false'),('sites.4aef88dd-f371-46fa-a04c-0bcf17bb5449.siteGroup','\"84441053-475f-4882-8132-350e883d79cf\"'),('sites.4aef88dd-f371-46fa-a04c-0bcf17bb5449.sortOrder','2'),('sites.8a720f2b-9ede-4431-8046-c8bb1b8c36a3.baseUrl','\"$WEBSITE_URL\"'),('sites.8a720f2b-9ede-4431-8046-c8bb1b8c36a3.enabled','true'),('sites.8a720f2b-9ede-4431-8046-c8bb1b8c36a3.handle','\"en\"'),('sites.8a720f2b-9ede-4431-8046-c8bb1b8c36a3.hasUrls','true'),('sites.8a720f2b-9ede-4431-8046-c8bb1b8c36a3.language','\"en\"'),('sites.8a720f2b-9ede-4431-8046-c8bb1b8c36a3.name','\"EN\"'),('sites.8a720f2b-9ede-4431-8046-c8bb1b8c36a3.primary','true'),('sites.8a720f2b-9ede-4431-8046-c8bb1b8c36a3.siteGroup','\"84441053-475f-4882-8132-350e883d79cf\"'),('sites.8a720f2b-9ede-4431-8046-c8bb1b8c36a3.sortOrder','1'),('sites.bd06d149-c109-4f58-bd08-8dd1e7738654.baseUrl','\"$WEBSITE_URL_ES\"'),('sites.bd06d149-c109-4f58-bd08-8dd1e7738654.enabled','\"1\"'),('sites.bd06d149-c109-4f58-bd08-8dd1e7738654.handle','\"es\"'),('sites.bd06d149-c109-4f58-bd08-8dd1e7738654.hasUrls','true'),('sites.bd06d149-c109-4f58-bd08-8dd1e7738654.language','\"es\"'),('sites.bd06d149-c109-4f58-bd08-8dd1e7738654.name','\"ES\"'),('sites.bd06d149-c109-4f58-bd08-8dd1e7738654.primary','false'),('sites.bd06d149-c109-4f58-bd08-8dd1e7738654.siteGroup','\"84441053-475f-4882-8132-350e883d79cf\"'),('sites.bd06d149-c109-4f58-bd08-8dd1e7738654.sortOrder','3'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"Query API Starter\"'),('system.schemaVersion','\"5.8.0.3\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.altTranslationKeyFormat','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.altTranslationMethod','\"language\"'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.cardThumbAlignment','\"end\"'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elementCondition','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.autocapitalize','true'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.autocomplete','false'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.autocorrect','true'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.class','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.dateAdded','\"2025-07-12T09:24:37+00:00\"'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.disabled','false'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.elementCondition','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.id','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.includeInCards','false'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.inputType','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.instructions','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.label','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.max','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.min','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.name','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.orientation','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.placeholder','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.providesThumbs','false'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.readonly','false'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.requirable','false'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.size','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.step','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.tip','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.title','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.uid','\"692c6b50-794b-4377-9044-2ea7645b00fb\"'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.userCondition','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.warning','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.0.width','100'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.attribute','\"alt\"'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.class','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.cols','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.dateAdded','\"2025-07-12T09:26:11+00:00\"'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.disabled','false'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.elementCondition','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.id','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.includeInCards','false'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.instructions','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.label','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.name','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.orientation','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.placeholder','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.providesThumbs','false'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.readonly','false'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.requirable','true'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.required','false'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.rows','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.tip','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.title','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AltField\"'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.uid','\"c539dbcd-f0a9-4ace-a302-8303fe590fd6\"'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.userCondition','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.warning','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.elements.1.width','100'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.name','\"Content\"'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.uid','\"9d3fea82-2a85-4181-83e5-51f225dab3e7\"'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fieldLayouts.7c8cc1df-632c-4963-afad-eee6a8770ab8.tabs.0.userCondition','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.fs','\"images\"'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.handle','\"images\"'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.name','\"Images\"'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.sortOrder','1'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.subpath','\"\"'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.titleTranslationKeyFormat','null'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.titleTranslationMethod','\"language\"'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.transformFs','\"\"'),('volumes.69ea2a52-05af-4d3d-be23-110dab8479b0.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `query_api_schemas`
--

LOCK TABLES `query_api_schemas` WRITE;
/*!40000 ALTER TABLE `query_api_schemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `query_api_schemas` VALUES (1,'Public Schema','[\"sites.*:read\", \"sections.*:read\", \"usergroups.*:read\", \"volumes.*:read\", \"addresses.*:read\"]','2025-07-12 12:34:24','2025-07-12 12:34:24','7f21a5a2-b531-45ab-a43a-621c92cbae46');
/*!40000 ALTER TABLE `query_api_schemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `query_api_tokens`
--

LOCK TABLES `query_api_tokens` WRITE;
/*!40000 ALTER TABLE `query_api_tokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `query_api_tokens` VALUES (1,'Public Token','1','sqKTlMFsky_OeJVeDfnps75b2Gny4NBG',1,'2025-07-12 10:34:24','2025-07-12 10:34:24','7a14c679-f236-4fde-ae0a-d15e2dc43968');
/*!40000 ALTER TABLE `query_api_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (2,2,14,1,11,1,'2025-07-12 09:51:54','2025-07-12 10:00:49','2c682c1e-1643-4e09-9eca-2cd8880bbb6f'),(3,2,19,1,11,1,'2025-07-12 09:51:54','2025-07-12 10:00:49','b1fca6f4-cb6d-4ea0-add7-2b9122109961'),(7,2,2,1,25,1,'2025-07-12 09:53:05','2025-07-12 10:00:49','029de1f1-a587-4230-90ca-f28432516a93'),(8,2,15,1,23,1,'2025-07-12 09:53:05','2025-07-12 10:00:49','a3e492f1-d820-4942-80a9-2174c2a3c10c'),(9,2,29,1,25,1,'2025-07-12 09:53:06','2025-07-12 10:00:49','505662e3-adfb-4968-bedd-e134d0dbe576'),(10,2,31,1,11,1,'2025-07-12 09:53:06','2025-07-12 10:00:49','c0b72d40-21bd-4a97-97d9-7d414ec228d5'),(11,2,33,1,23,1,'2025-07-12 09:53:06','2025-07-12 10:00:49','6ee1b6e4-813d-47d0-a7f7-241b9e4a31d6'),(14,2,38,1,25,1,'2025-07-12 09:55:08','2025-07-12 10:00:49','ece14d69-b578-47a0-a0fe-59cb283b1730'),(15,2,40,1,11,1,'2025-07-12 09:55:08','2025-07-12 10:00:49','d7ae510d-5dc6-4af9-bd8a-3bf77669e864'),(17,2,44,1,25,1,'2025-07-12 09:55:25','2025-07-12 10:00:49','50d78c89-a210-45a6-83b5-88355f71cf01'),(20,2,50,1,25,1,'2025-07-12 09:57:37','2025-07-12 10:00:49','2b53adc2-09a0-4e45-bba6-428a68e67c74'),(21,2,52,1,11,1,'2025-07-12 09:57:37','2025-07-12 10:00:49','d0c0aa7f-1b43-4b9f-a029-18b7cbb1f75f'),(22,2,54,1,25,1,'2025-07-12 09:57:48','2025-07-12 10:00:49','9f0a7ee5-7cc8-4842-8642-f52d40ce1fd3'),(23,2,56,1,25,1,'2025-07-12 09:58:05','2025-07-12 10:00:49','8ca500e5-5bf7-42e9-9022-4fc91256697b'),(24,2,58,1,25,1,'2025-07-12 09:58:26','2025-07-12 10:00:49','3e5cd53e-f494-4160-a15b-ef1a7299f3d8'),(25,2,59,1,11,1,'2025-07-12 09:58:26','2025-07-12 10:00:49','0d14c212-30ea-4fc7-a2b6-cf3f22e17d57'),(26,2,60,1,25,1,'2025-07-12 09:58:49','2025-07-12 10:00:49','5d52dd52-856a-4264-a754-8381c73f0fab'),(27,2,61,1,11,1,'2025-07-12 09:58:49','2025-07-12 10:00:49','3c142cf4-854d-4bf3-8386-1e1fbbef1b6e'),(28,2,62,1,25,1,'2025-07-12 09:58:52','2025-07-12 10:00:49','a22892fb-b7e8-44d3-9257-830576ccd0f4'),(29,2,14,2,11,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','c8c273c9-b584-4b5a-88ac-27f5f324e11a'),(30,2,14,3,11,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','bf205466-e615-4ab9-9344-a5dbae1d9cc4'),(31,2,19,2,11,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','a62bce25-8d63-41c2-a8c5-ee267ab080f7'),(32,2,19,3,11,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','a47d1276-6b25-4384-afc4-6af1c0f71889'),(33,2,2,2,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','1278da0f-5e62-454e-a71b-e54619525f18'),(34,2,2,3,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','ac12b317-0fc6-4091-9f99-bcf583d04b64'),(35,2,15,2,23,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','0545fd57-4f53-4bd0-9446-3c212cb93f47'),(36,2,15,3,23,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','98b6175e-3d62-43a1-a488-ffb17cf7ddf8'),(37,2,29,2,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','4aaeb5c4-3722-4050-add1-dea2795d6d58'),(38,2,29,3,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','0231a377-e3ab-4ab8-ae5d-660fbb5d03a3'),(39,2,31,2,11,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','554372ef-c300-4b92-b437-68272192aeb9'),(40,2,31,3,11,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','a1e51263-6bc3-4d4c-9699-f36873b26af2'),(41,2,33,2,23,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','41fdae1b-b854-4cb4-8e06-ef03a2cd83e1'),(42,2,33,3,23,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','ccac67db-07c4-4189-800b-a405d7d934a3'),(43,2,38,2,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','ac352c5b-b301-45fc-84b8-e304709d17c7'),(44,2,38,3,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','d057ab5c-7d6f-48f2-ae7b-dc42c59b6edb'),(45,2,40,2,11,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','51d885b0-abff-4113-a9b1-4cdc60c16d95'),(46,2,40,3,11,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','a0a4a3db-29b6-46f7-ad9e-43c1ef854143'),(47,2,44,2,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','017e2745-462e-4b95-8ccf-1bc7b5692b3e'),(48,2,44,3,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','7dc80a15-8435-45aa-ad36-ba23a7173cbb'),(49,2,50,2,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','c3857ff2-97ba-4dd3-89ba-6f5e711d3601'),(50,2,50,3,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','9a43c7e1-e52e-4b6d-9ccc-511e1742b7e7'),(51,2,52,2,11,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','e4a3496e-ae1c-4023-ae6d-1c69bf163944'),(52,2,52,3,11,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','d365c9d7-1e03-4773-9a26-8b66d002eca0'),(53,2,54,2,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','ebdbf5f2-43d8-46f1-bddb-9821297d251c'),(54,2,54,3,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','83162fe8-1d76-4e3c-8767-3d16862607cb'),(55,2,56,2,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','ecb008f8-eabd-4da8-b121-a55a40cf671b'),(56,2,56,3,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','c0f13740-21e7-45b5-8a1d-0ba1de6a7390'),(57,2,58,2,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','27894ff5-44c4-4bb7-bbd9-64f0900cfc3c'),(58,2,58,3,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','e65a4e7f-53d0-47fd-917c-26b31db86edb'),(59,2,59,2,11,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','16a1a85c-3b75-451a-9e20-697620057cd3'),(60,2,59,3,11,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','f461425e-fd6f-4b95-b17c-66e93a5279b0'),(61,2,60,2,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','e6446c55-78d9-4a46-bc64-68ec68d3bdbc'),(62,2,60,3,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','fc4f1a4b-df84-4df0-83da-ad94450e5086'),(63,2,61,2,11,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','b20cc442-8528-4a31-94ed-7c29bebb677f'),(64,2,61,3,11,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','3c13ffb4-d835-46d2-a4e3-72c566bce983'),(65,2,62,2,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','b2b39a3b-e4cf-4626-9531-8dbcccf838ea'),(66,2,62,3,25,1,'2025-07-12 10:00:49','2025-07-12 10:00:49','af94effc-6a36-4110-8189-93d5cad1323f'),(67,2,65,2,25,1,'2025-07-12 10:09:24','2025-07-12 10:09:24','b4f32275-8c5b-4a76-ace9-f18953319752'),(68,2,70,2,25,1,'2025-07-12 10:09:28','2025-07-12 10:09:28','f5ad1341-7585-451e-b17f-f9ee4b0eff2b'),(71,2,65,1,25,1,'2025-07-12 10:10:19','2025-07-12 10:10:19','d98e05ed-52da-4d74-848d-1d9a6ae759b6'),(72,2,80,1,25,1,'2025-07-12 10:10:19','2025-07-12 10:10:19','c87e8e46-b213-4408-886f-7d0a731eee7a'),(73,2,80,2,25,1,'2025-07-12 10:10:19','2025-07-12 10:10:19','e874e072-9d5d-49f7-b379-5cf290ceace9'),(77,2,65,3,25,1,'2025-07-12 10:11:12','2025-07-12 10:11:12','91f1dfc3-e22a-4d40-a18d-0a579b87f942'),(78,2,90,3,25,1,'2025-07-12 10:11:12','2025-07-12 10:11:12','acdcd6de-80d2-43fe-91cf-c2643f408f95'),(79,2,90,1,25,1,'2025-07-12 10:11:12','2025-07-12 10:11:12','fc93b851-d240-46c4-914c-a0ff684d0bfe'),(80,2,90,2,25,1,'2025-07-12 10:11:12','2025-07-12 10:11:12','19744521-4948-45e8-a036-a1cd06a2fe4d'),(81,2,95,2,23,1,'2025-07-12 10:12:17','2025-07-12 10:12:17','f555f35e-3304-4278-a727-4c5010eef6f4'),(82,2,100,2,23,1,'2025-07-12 10:12:28','2025-07-12 10:12:28','fb9fbb66-cfb8-48d5-a8c9-7f682f1b0b19'),(85,2,95,1,23,1,'2025-07-12 10:13:17','2025-07-12 10:13:17','34bba0de-b97e-4e0c-b10f-9313038cd998'),(86,2,110,1,23,1,'2025-07-12 10:13:17','2025-07-12 10:13:17','c3e11a25-19bc-4522-a3a5-fed06baae46c'),(87,2,110,2,23,1,'2025-07-12 10:13:17','2025-07-12 10:13:17','6f635201-f91d-48d8-b561-6cbf9706b653'),(91,2,95,3,23,1,'2025-07-12 10:14:11','2025-07-12 10:14:11','d6215690-0ef2-4055-841d-7779742a0dc3'),(92,2,120,3,23,1,'2025-07-12 10:14:11','2025-07-12 10:14:11','9a8c8475-0569-46a1-8300-04aee1a470ce'),(93,2,120,1,23,1,'2025-07-12 10:14:11','2025-07-12 10:14:11','3f17f5dd-bf4d-4c66-ab7e-696279a82c5e'),(94,2,120,2,23,1,'2025-07-12 10:14:11','2025-07-12 10:14:11','d3ce40b6-f72d-4217-a266-ff252340ce31'),(101,2,128,2,25,1,'2025-07-12 10:23:36','2025-07-12 10:23:36','2255cb1f-ffbd-46c7-b161-dc0588343608'),(102,2,128,1,25,1,'2025-07-12 10:23:36','2025-07-12 10:23:36','3e9866c1-1360-450b-8172-725dd77810db'),(103,2,128,3,25,1,'2025-07-12 10:23:36','2025-07-12 10:23:36','c8a19195-2d83-44ac-9e48-57917f52cd74'),(104,2,130,2,11,1,'2025-07-12 10:23:36','2025-07-12 10:23:36','b80a4aa5-b58e-469c-b050-7f393c2b392c'),(105,2,130,1,11,1,'2025-07-12 10:23:36','2025-07-12 10:23:36','19053712-10b0-4802-b9ac-aaa6ba1a9364'),(106,2,130,3,11,1,'2025-07-12 10:23:36','2025-07-12 10:23:36','bb2b4f28-8698-4a94-9208-17768fa2dcbe'),(110,2,133,1,25,1,'2025-07-12 10:25:52','2025-07-12 10:25:52','03983edc-03b3-4566-8bb5-aac50809caf5'),(111,2,133,2,25,1,'2025-07-12 10:25:52','2025-07-12 10:25:52','3c3d8f36-750d-4dfe-8234-892f36d388a0'),(112,2,133,3,25,1,'2025-07-12 10:25:52','2025-07-12 10:25:52','714573c5-e153-47e7-ab5a-5a4518350fe7'),(116,2,137,3,25,1,'2025-07-12 10:26:07','2025-07-12 10:26:07','71ed7e35-1d9e-46da-ac51-4bd8116e4692'),(117,2,137,1,25,1,'2025-07-12 10:26:07','2025-07-12 10:26:07','e21af205-0987-4c63-bd54-de7a7de373cb'),(118,2,137,2,25,1,'2025-07-12 10:26:07','2025-07-12 10:26:07','127f9896-3f6f-46ec-8d4a-c1efdbfbefa9'),(125,2,141,1,25,1,'2025-07-12 10:26:32','2025-07-12 10:26:32','162be6f7-87c2-49f6-a187-87effc781b47'),(126,2,141,2,25,1,'2025-07-12 10:26:32','2025-07-12 10:26:32','21f3cfae-cc35-4e1d-ba68-db26ff5d61c2'),(127,2,141,3,25,1,'2025-07-12 10:26:32','2025-07-12 10:26:32','0f502416-7fd5-42ea-af2c-cdbc81449814'),(128,2,142,1,11,1,'2025-07-12 10:26:32','2025-07-12 10:26:32','2d386430-729b-4acb-b7f8-9b8a455e98cc'),(129,2,142,2,11,1,'2025-07-12 10:26:32','2025-07-12 10:26:32','3d9a5dea-21d2-4367-aa55-04bc311d56e7'),(130,2,142,3,11,1,'2025-07-12 10:26:32','2025-07-12 10:26:32','b246c3a9-b666-4796-94c0-d9e553aad211'),(131,2,143,3,25,1,'2025-07-12 10:26:41','2025-07-12 10:26:41','5d58b251-1531-4945-93eb-11213edf817e'),(132,2,143,1,25,1,'2025-07-12 10:26:41','2025-07-12 10:26:41','d19ee9b3-4820-4d97-8ea3-c52b541e2154'),(133,2,143,2,25,1,'2025-07-12 10:26:41','2025-07-12 10:26:41','974e0a5f-f0f6-4edd-a103-4a8a606847f3'),(134,2,144,3,11,1,'2025-07-12 10:26:41','2025-07-12 10:26:41','8305edda-e9eb-42ea-aaf4-067b9470d7b0'),(135,2,144,1,11,1,'2025-07-12 10:26:41','2025-07-12 10:26:41','6559bef9-683c-4f5b-b7c2-348d5be74bef'),(136,2,144,2,11,1,'2025-07-12 10:26:41','2025-07-12 10:26:41','abe0d239-e278-4bc2-b2cf-ff4c43681d3f'),(137,2,145,1,25,1,'2025-07-12 13:00:04','2025-07-12 13:00:04','ae121ab7-907f-41c4-9568-a2078793414b'),(138,2,145,2,25,1,'2025-07-12 13:00:04','2025-07-12 13:00:04','7741599b-3870-4f3e-89e9-81461f2654f7'),(139,2,145,3,25,1,'2025-07-12 13:00:04','2025-07-12 13:00:04','def99b40-b19d-4ce7-a421-8b2db7abb278'),(140,2,148,1,11,1,'2025-07-12 13:00:04','2025-07-12 13:00:04','c5353b68-39ba-4d95-8a3e-1d04bb19f6de'),(141,2,148,2,11,1,'2025-07-12 13:00:04','2025-07-12 13:00:04','678d81b3-9ffb-4e2b-a25d-843d84646356'),(142,2,148,3,11,1,'2025-07-12 13:00:04','2025-07-12 13:00:04','b95f67e9-7063-41fb-ae44-f6c3c1a920e4'),(143,2,150,1,23,1,'2025-07-12 13:00:04','2025-07-12 13:00:04','176c8adf-3a6a-4e0a-8862-22ab367dcf8a'),(144,2,150,2,23,1,'2025-07-12 13:00:04','2025-07-12 13:00:04','86893249-4de1-4ed4-a3b4-8144487288a3'),(145,2,150,3,23,1,'2025-07-12 13:00:04','2025-07-12 13:00:04','affc2084-07a1-48e1-b054-5bca0fd8b746'),(146,2,151,1,25,1,'2025-07-12 13:00:11','2025-07-12 13:00:11','97000bc0-3441-4f3e-ac83-d0d67527d47e'),(147,2,151,2,25,1,'2025-07-12 13:00:11','2025-07-12 13:00:11','e57e7aff-8860-478f-aa6a-89a365f8ddb0'),(148,2,151,3,25,1,'2025-07-12 13:00:11','2025-07-12 13:00:11','737a8bf5-513b-40c8-bbb9-0d6d54f06d24');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,'Applied “Draft 1”'),(3,12,1,1,NULL),(4,13,1,1,NULL),(5,14,1,1,NULL),(6,15,1,1,NULL),(7,2,1,3,'Applied “Draft 1”'),(8,13,1,2,NULL),(9,14,1,2,NULL),(10,28,1,1,NULL),(11,15,1,2,NULL),(12,2,1,4,'Applied “Draft 1”'),(13,12,1,2,NULL),(14,14,1,3,NULL),(15,28,1,2,NULL),(16,2,1,5,'Applied “Draft 1”'),(17,28,1,3,NULL),(18,2,1,6,'Applied “Draft 1”'),(19,12,1,3,NULL),(20,14,1,4,NULL),(21,28,1,4,NULL),(22,2,1,7,''),(23,12,1,4,NULL),(24,2,1,8,''),(25,12,1,5,NULL),(26,2,1,9,''),(27,14,1,5,NULL),(28,2,1,10,''),(29,14,1,6,NULL),(30,2,1,11,''),(31,65,1,1,''),(32,66,1,1,NULL),(33,67,1,1,NULL),(34,68,1,1,NULL),(35,69,1,1,NULL),(36,65,1,2,'Applied “Draft 1”'),(37,66,1,2,NULL),(38,67,1,2,NULL),(39,68,1,2,NULL),(40,69,1,2,NULL),(41,65,1,3,'Applied “Draft 1”'),(42,66,1,3,NULL),(43,67,1,3,NULL),(44,68,1,3,NULL),(45,69,1,3,NULL),(46,95,1,1,''),(47,96,1,1,NULL),(48,97,1,1,NULL),(49,99,1,1,NULL),(50,98,1,1,NULL),(51,95,1,2,'Applied “Draft 1”'),(52,96,1,2,NULL),(53,97,1,2,NULL),(54,99,1,2,NULL),(55,98,1,2,NULL),(56,95,1,3,'Applied “Draft 1”'),(57,96,1,3,NULL),(58,97,1,3,NULL),(59,99,1,3,NULL),(60,98,1,3,NULL),(61,2,1,12,'Applied “Draft 1”'),(62,13,1,3,NULL),(63,14,1,7,NULL),(64,2,1,13,'Applied “Draft 1”'),(65,13,1,4,NULL),(66,2,1,14,'Applied “Draft 1”'),(67,13,1,5,NULL),(68,2,1,15,'Applied “Draft 1”'),(69,14,1,8,NULL),(70,2,1,16,''),(71,14,1,9,NULL),(72,2,1,17,''),(73,12,1,6,NULL),(74,13,1,6,NULL),(75,14,1,10,NULL),(76,28,1,5,NULL),(77,15,1,3,NULL),(78,2,1,18,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' admin gmail com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'field',5,1,' query api starter '),(2,'field',5,2,' query api vorlage '),(2,'field',5,3,' query api plantilla '),(2,'slug',0,1,' home '),(2,'slug',0,2,' home '),(2,'slug',0,3,' home '),(2,'title',0,1,' home '),(2,'title',0,2,' home '),(2,'title',0,3,' home '),(4,'field',5,2,''),(4,'field',5,3,''),(4,'slug',0,1,' temp ezprawcilwwlddpbmxuovueimzdeyodhszaa '),(4,'slug',0,2,' temp ezprawcilwwlddpbmxuovueimzdeyodhszaa '),(4,'slug',0,3,' temp ezprawcilwwlddpbmxuovueimzdeyodhszaa '),(4,'title',0,1,''),(4,'title',0,2,''),(4,'title',0,3,''),(5,'field',5,2,''),(5,'field',5,3,''),(5,'slug',0,1,' temp cytuutvbffccsovrdipicvohkuqajrmlyldp '),(5,'slug',0,2,' temp cytuutvbffccsovrdipicvohkuqajrmlyldp '),(5,'slug',0,3,' temp cytuutvbffccsovrdipicvohkuqajrmlyldp '),(5,'title',0,1,''),(5,'title',0,2,''),(5,'title',0,3,''),(11,'alt',0,1,''),(11,'alt',0,2,''),(11,'alt',0,3,''),(11,'extension',0,1,' jpg '),(11,'extension',0,2,' jpg '),(11,'extension',0,3,' jpg '),(11,'filename',0,1,' garfield2 jpg '),(11,'filename',0,2,' garfield2 jpg '),(11,'filename',0,3,' garfield2 jpg '),(11,'kind',0,1,' image '),(11,'kind',0,2,' image '),(11,'kind',0,3,' image '),(11,'slug',0,1,''),(11,'slug',0,2,''),(11,'slug',0,3,''),(11,'title',0,1,' garfield2 '),(11,'title',0,2,' garfield2 '),(11,'title',0,3,' garfield2 '),(12,'slug',0,1,' this starter contains f '),(12,'slug',0,2,' was du lernen kannst '),(12,'slug',0,3,' entry 12 '),(12,'title',0,1,' overview '),(12,'title',0,2,' uebersicht '),(12,'title',0,3,' vision general '),(13,'slug',0,1,' temp rrbbwvxvwoochqlmkgdyxtqglwidwynohhms '),(13,'slug',0,2,' temp rrbbwvxvwoochqlmkgdyxtqglwidwynohhms '),(13,'slug',0,3,' temp rrbbwvxvwoochqlmkgdyxtqglwidwynohhms '),(13,'title',0,1,''),(13,'title',0,2,''),(13,'title',0,3,''),(14,'slug',0,1,' image '),(14,'slug',0,2,' entry 14 '),(14,'slug',0,3,' entry 14 '),(14,'title',0,1,' imagerx for images '),(14,'title',0,2,' imagerx fuer bilder '),(14,'title',0,3,' imagerx para imagenes '),(15,'slug',0,1,' temp svftqjvbmynaealpnazyrdxcpiegenvdfmdj '),(15,'slug',0,2,' temp svftqjvbmynaealpnazyrdxcpiegenvdfmdj '),(15,'slug',0,3,' temp svftqjvbmynaealpnazyrdxcpiegenvdfmdj '),(15,'title',0,1,''),(15,'title',0,2,''),(15,'title',0,3,''),(23,'alt',0,1,''),(23,'alt',0,2,''),(23,'alt',0,3,''),(23,'extension',0,1,' webp '),(23,'extension',0,2,' webp '),(23,'extension',0,3,' webp '),(23,'filename',0,1,' garfield webp '),(23,'filename',0,2,' garfield webp '),(23,'filename',0,3,' garfield webp '),(23,'kind',0,1,' image '),(23,'kind',0,2,' image '),(23,'kind',0,3,' image '),(23,'slug',0,1,''),(23,'slug',0,2,''),(23,'slug',0,3,''),(23,'title',0,1,' garfield '),(23,'title',0,2,' garfield '),(23,'title',0,3,' garfield '),(25,'alt',0,1,''),(25,'alt',0,2,''),(25,'alt',0,3,''),(25,'extension',0,1,' jpg '),(25,'extension',0,2,' jpg '),(25,'extension',0,3,' jpg '),(25,'filename',0,1,' black white jpg '),(25,'filename',0,2,' black white jpg '),(25,'filename',0,3,' black white jpg '),(25,'kind',0,1,' image '),(25,'kind',0,2,' image '),(25,'kind',0,3,' image '),(25,'slug',0,1,''),(25,'slug',0,2,''),(25,'slug',0,3,''),(25,'title',0,1,' black white '),(25,'title',0,2,' black white '),(25,'title',0,3,' black white '),(28,'slug',0,1,' i hope you like cats '),(28,'slug',0,2,' i hope you like cats '),(28,'slug',0,3,' i hope you like cats '),(28,'title',0,1,' i hope you like cats '),(28,'title',0,2,' ich hoffe du magst katzen '),(28,'title',0,3,' espero que te gusten los gatos '),(63,'field',5,1,''),(63,'field',5,2,''),(63,'slug',0,1,' temp saftmuqcesmjqloepiprqpxnxxoxlgxlvpvd '),(63,'slug',0,2,' temp saftmuqcesmjqloepiprqpxnxxoxlgxlvpvd '),(63,'slug',0,3,' temp saftmuqcesmjqloepiprqpxnxxoxlgxlvpvd '),(63,'title',0,1,''),(63,'title',0,2,''),(63,'title',0,3,''),(64,'field',5,1,''),(64,'field',5,2,''),(64,'slug',0,1,' temp bnshwhwzvoqcmnyjlxnovojiajpbxtjwdcoz '),(64,'slug',0,2,' temp bnshwhwzvoqcmnyjlxnovojiajpbxtjwdcoz '),(64,'slug',0,3,' temp bnshwhwzvoqcmnyjlxnovojiajpbxtjwdcoz '),(64,'title',0,1,''),(64,'title',0,2,''),(64,'title',0,3,''),(65,'field',5,1,' luna the cat is now the mayor of a bavarian village '),(65,'field',5,2,' katze luna regiert jetzt ein dorf in oesterreich '),(65,'field',5,3,' luna la gata ahora manda en un pueblo bavaro '),(65,'slug',0,1,' cat becomes mayor '),(65,'slug',0,2,' katze wird buergermeisterin '),(65,'slug',0,3,' entry 75 '),(65,'title',0,1,' cat becomes mayor '),(65,'title',0,2,' katze wird buergermeisterin '),(65,'title',0,3,' gata se convierte en alcaldesa '),(66,'slug',0,1,' luna schnurrt sich zur macht '),(66,'slug',0,2,' luna schnurrt sich zur macht '),(66,'slug',0,3,' luna schnurrt sich zur macht '),(66,'title',0,1,' luna purrs into power '),(66,'title',0,2,' luna schnurrt sich zur macht '),(66,'title',0,3,' luna ronronea hacia el poder '),(67,'slug',0,1,' temp sxuivgwfukwutfnhygpybbcrcjzqolnlovaf '),(67,'slug',0,2,' temp sxuivgwfukwutfnhygpybbcrcjzqolnlovaf '),(67,'slug',0,3,' temp sxuivgwfukwutfnhygpybbcrcjzqolnlovaf '),(67,'title',0,1,''),(67,'title',0,2,''),(67,'title',0,3,''),(68,'slug',0,1,' burgermeisteramt mit stil '),(68,'slug',0,2,' buergermeisteramt mit stil '),(68,'slug',0,3,' burgermeisteramt mit stil '),(68,'title',0,1,' a mayor with style '),(68,'title',0,2,' buergermeisteramt mit stil '),(68,'title',0,3,' una alcaldesa con estilo '),(69,'slug',0,1,' temp kdujushtkqeartnklonnfmwcwuzxiqjkprmn '),(69,'slug',0,2,' temp kdujushtkqeartnklonnfmwcwuzxiqjkprmn '),(69,'slug',0,3,' temp kdujushtkqeartnklonnfmwcwuzxiqjkprmn '),(69,'title',0,1,''),(69,'title',0,2,''),(69,'title',0,3,''),(95,'field',5,1,' whiskers leads the way with pawmaste yoga '),(95,'field',5,2,' whiskers zeigt menschen den katzengruss '),(95,'field',5,3,' whiskers lidera clases con pawmaste '),(95,'slug',0,1,' cat teaches yoga '),(95,'slug',0,2,' katze unterrichtet yoga '),(95,'slug',0,3,' entry 105 '),(95,'title',0,1,' cat teaches yoga '),(95,'title',0,2,' katze unterrichtet yoga '),(95,'title',0,3,' gata ensena yoga '),(96,'slug',0,1,' katzen yoga fur alle '),(96,'slug',0,2,' katzen yoga fuer alle '),(96,'slug',0,3,' katzen yoga fur alle '),(96,'title',0,1,' cat yoga for everyone '),(96,'title',0,2,' katzen yoga fuer alle '),(96,'title',0,3,' yoga gatuno para todos '),(97,'slug',0,1,' temp dpclzfbvpszidleamlpefwbxeskbqfjpvrjw '),(97,'slug',0,2,' temp dpclzfbvpszidleamlpefwbxeskbqfjpvrjw '),(97,'slug',0,3,' temp dpclzfbvpszidleamlpefwbxeskbqfjpvrjw '),(97,'title',0,1,''),(97,'title',0,2,''),(97,'title',0,3,''),(98,'slug',0,1,' temp fbqkelixwjsodajvvewjdmbnunzjrvgytzko '),(98,'slug',0,2,' temp fbqkelixwjsodajvvewjdmbnunzjrvgytzko '),(98,'slug',0,3,' temp fbqkelixwjsodajvvewjdmbnunzjrvgytzko '),(98,'title',0,1,''),(98,'title',0,2,''),(98,'title',0,3,''),(99,'slug',0,1,' pawmaste statt namaste '),(99,'slug',0,2,' pawmaste statt namaste '),(99,'slug',0,3,' pawmaste statt namaste '),(99,'title',0,1,' pawmaste not namaste '),(99,'title',0,2,' pawmaste statt namaste '),(99,'title',0,3,' pawmaste mas zen que nunca ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindexqueue`
--

LOCK TABLES `searchindexqueue` WRITE;
/*!40000 ALTER TABLE `searchindexqueue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `searchindexqueue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindexqueue_fields`
--

LOCK TABLES `searchindexqueue_fields` WRITE;
/*!40000 ALTER TABLE `searchindexqueue_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `searchindexqueue_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Home','home','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-07-12 09:17:28','2025-07-12 09:17:28',NULL,'1f5db355-8d9f-45cd-953e-88aa0634dc1b'),(2,NULL,'News','news','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-07-12 09:18:59','2025-07-12 09:18:59',NULL,'618cfb39-7c17-47d9-8458-6de2797beeb3');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES (1,1,1,NULL,NULL,NULL),(2,2,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,2,1,'__home__',NULL,1,'2025-07-12 09:17:28','2025-07-12 09:17:28','de3e88e0-2c12-468d-ade8-b30f2cfc9cf1'),(2,1,1,1,'__home__',NULL,1,'2025-07-12 09:17:28','2025-07-12 09:17:28','7b93a890-074d-4748-931e-1c2e25043d18'),(3,1,3,1,'__home__',NULL,1,'2025-07-12 09:17:28','2025-07-12 09:17:28','bda52623-ccf9-48b5-b6e5-d7a09fe6722a'),(4,2,2,1,'news/{slug}',NULL,1,'2025-07-12 09:18:59','2025-07-12 09:18:59','728442f3-2c99-45e7-b1f7-220934a7eaa4'),(5,2,1,1,'news/{slug}',NULL,1,'2025-07-12 09:18:59','2025-07-12 09:18:59','a8520b28-fc8b-41cd-bfa1-061da6e8e034'),(6,2,3,1,'news/{slug}',NULL,1,'2025-07-12 09:18:59','2025-07-12 09:18:59','d6d85838-0677-42ef-aa71-0e1fb7ab7607');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Query API Starter','2025-07-12 08:49:16','2025-07-12 08:49:16',NULL,'84441053-475f-4882-8132-350e883d79cf');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'1','EN','en','en',1,'$WEBSITE_URL',1,'2025-07-12 08:49:16','2025-07-12 09:13:54',NULL,'8a720f2b-9ede-4431-8046-c8bb1b8c36a3'),(2,1,0,'1','DE','de','de',1,'$WEBSITE_URL_DE',2,'2025-07-12 09:15:16','2025-07-12 09:15:16',NULL,'4aef88dd-f371-46fa-a04c-0bcf17bb5449'),(3,1,0,'1','ES','es','es',1,'$WEBSITE_URL_ES',3,'2025-07-12 09:15:45','2025-07-12 09:15:45',NULL,'bd06d149-c109-4f58-bd08-8dd1e7738654');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `tokens` VALUES (1,'1DeHfF6Xmh-ROmffyS9aXwl6dQ--HQ0j','[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":2,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]',NULL,NULL,'2025-07-13 13:51:14','2025-07-12 13:51:14','2025-07-12 13:51:14','947dbdc0-51ae-4cd3-8459-2dfeca0a909c');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\": \"en\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'admin@gmail.com','$2y$13$QJ99jrSY/Bgp.TqLwCgKHuK0FJZKREJZXTwRLSl1iMJLETM28i4sq','2025-07-12 12:59:52',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2025-07-12 08:49:16','2025-07-12 08:49:16','2025-07-12 12:59:52');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Images','','2025-07-12 09:26:11','2025-07-12 09:26:11','e2ad2cef-af2b-46cd-84e1-a13cb067b2c7'),(2,NULL,NULL,'Temporary Uploads',NULL,'2025-07-12 09:42:07','2025-07-12 09:42:07','a972f2ec-045b-46e2-b7ca-af9884809b66'),(3,2,NULL,'user_1','user_1/','2025-07-12 09:42:07','2025-07-12 09:42:07','a78488be-b73d-4a7c-9ff6-57f82c51fa17');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,4,'Images','images','images','','','','language',NULL,'language',NULL,1,'2025-07-12 09:26:11','2025-07-12 09:26:11',NULL,'69ea2a52-05af-4d3d-be23-110dab8479b0');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}',1,'2025-07-12 08:51:29','2025-07-12 08:51:29','3aacf6da-00ad-4069-a452-5f94ac77a9b0'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2025-07-12 08:51:29','2025-07-12 08:51:29','29eca3d0-f3ff-4b8f-9982-eaa24905ce37'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2025-07-12 08:51:29','2025-07-12 08:51:29','a19f1522-20c0-4432-9777-c6899e5cb60c'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}',1,'2025-07-12 08:51:29','2025-07-12 08:51:29','4a5f55cd-c392-46d5-ad55-a5f0d9d1cd6f');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-12 15:56:25
