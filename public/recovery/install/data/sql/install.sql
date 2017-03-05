-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: sw_deploy
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1

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
-- Table structure for table `s_addon_premiums`
--

DROP TABLE IF EXISTS `s_addon_premiums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_addon_premiums` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `startprice` double NOT NULL DEFAULT '0',
  `ordernumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ordernumber_export` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subshopID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_addon_premiums`
--

LOCK TABLES `s_addon_premiums` WRITE;
/*!40000 ALTER TABLE `s_addon_premiums` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_addon_premiums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_article_configurator_dependencies`
--

DROP TABLE IF EXISTS `s_article_configurator_dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_article_configurator_dependencies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `configurator_set_id` int(10) unsigned NOT NULL,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `child_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `configurator_set_id` (`configurator_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_article_configurator_dependencies`
--

LOCK TABLES `s_article_configurator_dependencies` WRITE;
/*!40000 ALTER TABLE `s_article_configurator_dependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_article_configurator_dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_article_configurator_groups`
--

DROP TABLE IF EXISTS `s_article_configurator_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_article_configurator_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_article_configurator_groups`
--

LOCK TABLES `s_article_configurator_groups` WRITE;
/*!40000 ALTER TABLE `s_article_configurator_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_article_configurator_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_article_configurator_groups_attributes`
--

DROP TABLE IF EXISTS `s_article_configurator_groups_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_article_configurator_groups_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupID` (`groupID`),
  CONSTRAINT `s_article_configurator_groups_attributes_ibfk_1` FOREIGN KEY (`groupID`) REFERENCES `s_article_configurator_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_article_configurator_groups_attributes`
--

LOCK TABLES `s_article_configurator_groups_attributes` WRITE;
/*!40000 ALTER TABLE `s_article_configurator_groups_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_article_configurator_groups_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_article_configurator_option_relations`
--

DROP TABLE IF EXISTS `s_article_configurator_option_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_article_configurator_option_relations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) unsigned NOT NULL,
  `option_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_article_configurator_option_relations`
--

LOCK TABLES `s_article_configurator_option_relations` WRITE;
/*!40000 ALTER TABLE `s_article_configurator_option_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_article_configurator_option_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_article_configurator_options`
--

DROP TABLE IF EXISTS `s_article_configurator_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_article_configurator_options` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_article_configurator_options`
--

LOCK TABLES `s_article_configurator_options` WRITE;
/*!40000 ALTER TABLE `s_article_configurator_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_article_configurator_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_article_configurator_options_attributes`
--

DROP TABLE IF EXISTS `s_article_configurator_options_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_article_configurator_options_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `optionID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `optionID` (`optionID`),
  CONSTRAINT `s_article_configurator_options_attributes_ibfk_1` FOREIGN KEY (`optionID`) REFERENCES `s_article_configurator_options` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_article_configurator_options_attributes`
--

LOCK TABLES `s_article_configurator_options_attributes` WRITE;
/*!40000 ALTER TABLE `s_article_configurator_options_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_article_configurator_options_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_article_configurator_price_variations`
--

DROP TABLE IF EXISTS `s_article_configurator_price_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_article_configurator_price_variations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `configurator_set_id` int(10) unsigned NOT NULL,
  `variation` decimal(10,3) NOT NULL,
  `options` text COLLATE utf8_unicode_ci,
  `is_gross` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `configurator_set_id` (`configurator_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_article_configurator_price_variations`
--

LOCK TABLES `s_article_configurator_price_variations` WRITE;
/*!40000 ALTER TABLE `s_article_configurator_price_variations` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_article_configurator_price_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_article_configurator_set_group_relations`
--

DROP TABLE IF EXISTS `s_article_configurator_set_group_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_article_configurator_set_group_relations` (
  `set_id` int(11) unsigned NOT NULL DEFAULT '0',
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`set_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_article_configurator_set_group_relations`
--

LOCK TABLES `s_article_configurator_set_group_relations` WRITE;
/*!40000 ALTER TABLE `s_article_configurator_set_group_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_article_configurator_set_group_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_article_configurator_set_option_relations`
--

DROP TABLE IF EXISTS `s_article_configurator_set_option_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_article_configurator_set_option_relations` (
  `set_id` int(11) unsigned NOT NULL DEFAULT '0',
  `option_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`set_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_article_configurator_set_option_relations`
--

LOCK TABLES `s_article_configurator_set_option_relations` WRITE;
/*!40000 ALTER TABLE `s_article_configurator_set_option_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_article_configurator_set_option_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_article_configurator_sets`
--

DROP TABLE IF EXISTS `s_article_configurator_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_article_configurator_sets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(1) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_article_configurator_sets`
--

LOCK TABLES `s_article_configurator_sets` WRITE;
/*!40000 ALTER TABLE `s_article_configurator_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_article_configurator_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_article_configurator_template_prices`
--

DROP TABLE IF EXISTS `s_article_configurator_template_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_article_configurator_template_prices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(10) unsigned DEFAULT NULL,
  `customer_group_key` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `from` int(10) unsigned NOT NULL,
  `to` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `pseudoprice` double DEFAULT NULL,
  `percent` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pricegroup_2` (`customer_group_key`,`from`),
  KEY `pricegroup` (`customer_group_key`,`to`),
  KEY `template_id` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_article_configurator_template_prices`
--

LOCK TABLES `s_article_configurator_template_prices` WRITE;
/*!40000 ALTER TABLE `s_article_configurator_template_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_article_configurator_template_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_article_configurator_template_prices_attributes`
--

DROP TABLE IF EXISTS `s_article_configurator_template_prices_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_article_configurator_template_prices_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_price_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `priceID` (`template_price_id`),
  CONSTRAINT `s_article_configurator_template_prices_attributes_ibfk_1` FOREIGN KEY (`template_price_id`) REFERENCES `s_article_configurator_template_prices` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_article_configurator_template_prices_attributes`
--

LOCK TABLES `s_article_configurator_template_prices_attributes` WRITE;
/*!40000 ALTER TABLE `s_article_configurator_template_prices_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_article_configurator_template_prices_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_article_configurator_templates`
--

DROP TABLE IF EXISTS `s_article_configurator_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_article_configurator_templates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) unsigned NOT NULL DEFAULT '0',
  `order_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `suppliernumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additionaltext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `impressions` int(11) NOT NULL DEFAULT '0',
  `sales` int(11) NOT NULL DEFAULT '0',
  `active` int(11) unsigned NOT NULL DEFAULT '0',
  `instock` int(11) DEFAULT NULL,
  `stockmin` int(11) unsigned DEFAULT NULL,
  `weight` decimal(10,3) unsigned DEFAULT NULL,
  `position` int(11) unsigned NOT NULL,
  `width` decimal(10,3) unsigned DEFAULT NULL,
  `height` decimal(10,3) unsigned DEFAULT NULL,
  `length` decimal(10,3) unsigned DEFAULT NULL,
  `ean` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_id` int(11) unsigned DEFAULT NULL,
  `purchasesteps` int(11) unsigned DEFAULT NULL,
  `maxpurchase` int(11) unsigned DEFAULT NULL,
  `minpurchase` int(11) unsigned DEFAULT NULL,
  `purchaseunit` decimal(11,4) unsigned DEFAULT NULL,
  `referenceunit` decimal(10,3) unsigned DEFAULT NULL,
  `packunit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `releasedate` date DEFAULT NULL,
  `shippingfree` int(1) unsigned NOT NULL DEFAULT '0',
  `shippingtime` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchaseprice` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `articleID` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_article_configurator_templates`
--

LOCK TABLES `s_article_configurator_templates` WRITE;
/*!40000 ALTER TABLE `s_article_configurator_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_article_configurator_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_article_configurator_templates_attributes`
--

DROP TABLE IF EXISTS `s_article_configurator_templates_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_article_configurator_templates_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) unsigned DEFAULT NULL,
  `attr1` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `attr2` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `attr3` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `attr4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr7` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr8` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `attr9` mediumtext COLLATE utf8_unicode_ci,
  `attr10` mediumtext COLLATE utf8_unicode_ci,
  `attr11` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr12` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr13` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `attr14` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr15` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr16` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr17` date DEFAULT NULL,
  `attr18` mediumtext COLLATE utf8_unicode_ci,
  `attr19` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr20` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `templateID` (`template_id`),
  CONSTRAINT `s_article_configurator_templates_attributes_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `s_article_configurator_templates` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_article_configurator_templates_attributes`
--

LOCK TABLES `s_article_configurator_templates_attributes` WRITE;
/*!40000 ALTER TABLE `s_article_configurator_templates_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_article_configurator_templates_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_article_img_mapping_rules`
--

DROP TABLE IF EXISTS `s_article_img_mapping_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_article_img_mapping_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mapping_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mapping_id` (`mapping_id`),
  KEY `option_id` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_article_img_mapping_rules`
--

LOCK TABLES `s_article_img_mapping_rules` WRITE;
/*!40000 ALTER TABLE `s_article_img_mapping_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_article_img_mapping_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_article_img_mappings`
--

DROP TABLE IF EXISTS `s_article_img_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_article_img_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `image_id` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_article_img_mappings`
--

LOCK TABLES `s_article_img_mappings` WRITE;
/*!40000 ALTER TABLE `s_article_img_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_article_img_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles`
--

DROP TABLE IF EXISTS `s_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supplierID` int(11) unsigned DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `description_long` mediumtext COLLATE utf8_unicode_ci,
  `shippingtime` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `active` int(1) unsigned NOT NULL DEFAULT '0',
  `taxID` int(11) unsigned DEFAULT NULL,
  `pseudosales` int(11) NOT NULL DEFAULT '0',
  `topseller` int(1) unsigned NOT NULL DEFAULT '0',
  `metaTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `changetime` datetime NOT NULL,
  `pricegroupID` int(11) unsigned DEFAULT NULL,
  `pricegroupActive` int(1) unsigned NOT NULL,
  `filtergroupID` int(11) unsigned DEFAULT NULL,
  `laststock` int(1) NOT NULL,
  `crossbundlelook` int(1) unsigned NOT NULL,
  `notification` int(1) unsigned NOT NULL COMMENT 'send notification',
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` int(11) NOT NULL,
  `main_detail_id` int(11) unsigned DEFAULT NULL,
  `available_from` datetime DEFAULT NULL,
  `available_to` datetime DEFAULT NULL,
  `configurator_set_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_detailID` (`main_detail_id`),
  KEY `datum` (`datum`),
  KEY `name` (`name`),
  KEY `supplierID` (`supplierID`),
  KEY `shippingtime` (`shippingtime`),
  KEY `changetime` (`changetime`),
  KEY `configurator_set_id` (`configurator_set_id`),
  KEY `articles_by_category_sort_release` (`datum`,`id`),
  KEY `articles_by_category_sort_name` (`name`,`id`),
  KEY `product_newcomer` (`active`,`datum`),
  KEY `get_category_filters` (`active`,`filtergroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles`
--

LOCK TABLES `s_articles` WRITE;
/*!40000 ALTER TABLE `s_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_also_bought_ro`
--

DROP TABLE IF EXISTS `s_articles_also_bought_ro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_also_bought_ro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) unsigned NOT NULL,
  `related_article_id` int(11) NOT NULL,
  `sales` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bought_combination` (`article_id`,`related_article_id`),
  KEY `related_article_id` (`related_article_id`),
  KEY `article_id` (`article_id`),
  KEY `get_also_bought_articles` (`article_id`,`sales`,`related_article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_also_bought_ro`
--

LOCK TABLES `s_articles_also_bought_ro` WRITE;
/*!40000 ALTER TABLE `s_articles_also_bought_ro` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_also_bought_ro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_attributes`
--

DROP TABLE IF EXISTS `s_articles_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleID` int(11) unsigned DEFAULT NULL,
  `articledetailsID` int(11) unsigned DEFAULT NULL,
  `attr1` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr2` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr3` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr4` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr5` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr6` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr7` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr8` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr9` mediumtext COLLATE utf8_unicode_ci,
  `attr10` mediumtext COLLATE utf8_unicode_ci,
  `attr11` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr12` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr13` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr14` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr15` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr16` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr17` date DEFAULT NULL,
  `attr18` mediumtext COLLATE utf8_unicode_ci,
  `attr19` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr20` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articledetailsID` (`articledetailsID`),
  KEY `articleID` (`articleID`),
  CONSTRAINT `s_articles_attributes_ibfk_1` FOREIGN KEY (`articleID`) REFERENCES `s_articles` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `s_articles_attributes_ibfk_2` FOREIGN KEY (`articledetailsID`) REFERENCES `s_articles_details` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_attributes`
--

LOCK TABLES `s_articles_attributes` WRITE;
/*!40000 ALTER TABLE `s_articles_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_avoid_customergroups`
--

DROP TABLE IF EXISTS `s_articles_avoid_customergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_avoid_customergroups` (
  `articleID` int(11) NOT NULL,
  `customergroupID` int(11) NOT NULL,
  UNIQUE KEY `articleID` (`articleID`,`customergroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_avoid_customergroups`
--

LOCK TABLES `s_articles_avoid_customergroups` WRITE;
/*!40000 ALTER TABLE `s_articles_avoid_customergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_avoid_customergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_categories`
--

DROP TABLE IF EXISTS `s_articles_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `articleID` int(11) unsigned NOT NULL,
  `categoryID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articleID` (`articleID`,`categoryID`),
  KEY `categoryID` (`categoryID`),
  KEY `articleID_2` (`articleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_categories`
--

LOCK TABLES `s_articles_categories` WRITE;
/*!40000 ALTER TABLE `s_articles_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_categories_ro`
--

DROP TABLE IF EXISTS `s_articles_categories_ro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_categories_ro` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `articleID` int(11) unsigned NOT NULL,
  `categoryID` int(11) unsigned NOT NULL,
  `parentCategoryID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articleID` (`articleID`,`categoryID`,`parentCategoryID`),
  KEY `categoryID` (`categoryID`),
  KEY `articleID_2` (`articleID`),
  KEY `categoryID_2` (`categoryID`,`parentCategoryID`),
  KEY `category_id_by_article_id` (`articleID`,`id`),
  KEY `elastic_search` (`categoryID`,`articleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_categories_ro`
--

LOCK TABLES `s_articles_categories_ro` WRITE;
/*!40000 ALTER TABLE `s_articles_categories_ro` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_categories_ro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_categories_seo`
--

DROP TABLE IF EXISTS `s_articles_categories_seo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_categories_seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_article` (`shop_id`,`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_categories_seo`
--

LOCK TABLES `s_articles_categories_seo` WRITE;
/*!40000 ALTER TABLE `s_articles_categories_seo` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_categories_seo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_details`
--

DROP TABLE IF EXISTS `s_articles_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `articleID` int(11) unsigned NOT NULL DEFAULT '0',
  `ordernumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `suppliernumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kind` int(1) NOT NULL DEFAULT '0',
  `additionaltext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sales` int(11) NOT NULL DEFAULT '0',
  `active` int(11) unsigned NOT NULL DEFAULT '0',
  `instock` int(11) DEFAULT NULL,
  `stockmin` int(11) unsigned DEFAULT NULL,
  `weight` decimal(10,3) unsigned DEFAULT NULL,
  `position` int(11) unsigned NOT NULL,
  `width` decimal(10,3) unsigned DEFAULT NULL,
  `height` decimal(10,3) unsigned DEFAULT NULL,
  `length` decimal(10,3) unsigned DEFAULT NULL,
  `ean` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unitID` int(11) unsigned DEFAULT NULL,
  `purchasesteps` int(11) unsigned DEFAULT NULL,
  `maxpurchase` int(11) unsigned DEFAULT NULL,
  `minpurchase` int(11) unsigned NOT NULL DEFAULT '1',
  `purchaseunit` decimal(11,4) unsigned DEFAULT NULL,
  `referenceunit` decimal(10,3) unsigned DEFAULT NULL,
  `packunit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `releasedate` date DEFAULT NULL,
  `shippingfree` int(1) unsigned NOT NULL DEFAULT '0',
  `shippingtime` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchaseprice` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ordernumber` (`ordernumber`),
  KEY `articleID` (`articleID`),
  KEY `releasedate` (`releasedate`),
  KEY `articles_by_category_sort_popularity` (`sales`,`articleID`),
  KEY `get_similar_articles` (`kind`,`sales`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_details`
--

LOCK TABLES `s_articles_details` WRITE;
/*!40000 ALTER TABLE `s_articles_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_downloads`
--

DROP TABLE IF EXISTS `s_articles_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_downloads` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `articleID` int(11) unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `articleID` (`articleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_downloads`
--

LOCK TABLES `s_articles_downloads` WRITE;
/*!40000 ALTER TABLE `s_articles_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_downloads_attributes`
--

DROP TABLE IF EXISTS `s_articles_downloads_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_downloads_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `downloadID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `downloadID` (`downloadID`),
  CONSTRAINT `s_articles_downloads_attributes_ibfk_1` FOREIGN KEY (`downloadID`) REFERENCES `s_articles_downloads` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_downloads_attributes`
--

LOCK TABLES `s_articles_downloads_attributes` WRITE;
/*!40000 ALTER TABLE `s_articles_downloads_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_downloads_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_esd`
--

DROP TABLE IF EXISTS `s_articles_esd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_esd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleID` int(11) NOT NULL DEFAULT '0',
  `articledetailsID` int(11) NOT NULL DEFAULT '0',
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `serials` int(1) NOT NULL DEFAULT '0',
  `notification` int(1) NOT NULL DEFAULT '0',
  `maxdownloads` int(11) NOT NULL DEFAULT '0',
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `articleID` (`articleID`),
  KEY `articledetailsID` (`articledetailsID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_esd`
--

LOCK TABLES `s_articles_esd` WRITE;
/*!40000 ALTER TABLE `s_articles_esd` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_esd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_esd_attributes`
--

DROP TABLE IF EXISTS `s_articles_esd_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_esd_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `esdID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `esdID` (`esdID`),
  CONSTRAINT `s_articles_esd_attributes_ibfk_1` FOREIGN KEY (`esdID`) REFERENCES `s_articles_esd` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_esd_attributes`
--

LOCK TABLES `s_articles_esd_attributes` WRITE;
/*!40000 ALTER TABLE `s_articles_esd_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_esd_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_esd_serials`
--

DROP TABLE IF EXISTS `s_articles_esd_serials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_esd_serials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `esdID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `esdID` (`esdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_esd_serials`
--

LOCK TABLES `s_articles_esd_serials` WRITE;
/*!40000 ALTER TABLE `s_articles_esd_serials` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_esd_serials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_img`
--

DROP TABLE IF EXISTS `s_articles_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleID` int(11) DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `main` int(1) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `relations` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `article_detail_id` int(10) unsigned DEFAULT NULL,
  `media_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `artikel_id` (`articleID`),
  KEY `article_detail_id` (`article_detail_id`),
  KEY `parent_id` (`parent_id`),
  KEY `media_id` (`media_id`),
  KEY `article_images_query` (`articleID`,`position`),
  KEY `article_cover_image_query` (`articleID`,`main`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_img`
--

LOCK TABLES `s_articles_img` WRITE;
/*!40000 ALTER TABLE `s_articles_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_img_attributes`
--

DROP TABLE IF EXISTS `s_articles_img_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_img_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imageID` int(11) DEFAULT NULL,
  `attribute1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `imageID` (`imageID`),
  CONSTRAINT `s_articles_img_attributes_ibfk_1` FOREIGN KEY (`imageID`) REFERENCES `s_articles_img` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_img_attributes`
--

LOCK TABLES `s_articles_img_attributes` WRITE;
/*!40000 ALTER TABLE `s_articles_img_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_img_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_information`
--

DROP TABLE IF EXISTS `s_articles_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleID` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hauptid` (`articleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_information`
--

LOCK TABLES `s_articles_information` WRITE;
/*!40000 ALTER TABLE `s_articles_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_information_attributes`
--

DROP TABLE IF EXISTS `s_articles_information_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_information_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `informationID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `informationID` (`informationID`),
  CONSTRAINT `s_articles_information_attributes_ibfk_1` FOREIGN KEY (`informationID`) REFERENCES `s_articles_information` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_information_attributes`
--

LOCK TABLES `s_articles_information_attributes` WRITE;
/*!40000 ALTER TABLE `s_articles_information_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_information_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_notification`
--

DROP TABLE IF EXISTS `s_articles_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_notification` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ordernumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `mail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `send` int(1) unsigned NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shopLink` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_notification`
--

LOCK TABLES `s_articles_notification` WRITE;
/*!40000 ALTER TABLE `s_articles_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_prices`
--

DROP TABLE IF EXISTS `s_articles_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_prices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pricegroup` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `from` int(10) unsigned NOT NULL,
  `to` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `articleID` int(11) NOT NULL DEFAULT '0',
  `articledetailsID` int(11) NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `pseudoprice` double DEFAULT NULL,
  `baseprice` double DEFAULT NULL,
  `percent` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articleID` (`articleID`),
  KEY `articledetailsID` (`articledetailsID`),
  KEY `pricegroup_2` (`pricegroup`,`from`,`articledetailsID`),
  KEY `pricegroup` (`pricegroup`,`to`,`articledetailsID`),
  KEY `product_prices` (`articledetailsID`,`from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_prices`
--

LOCK TABLES `s_articles_prices` WRITE;
/*!40000 ALTER TABLE `s_articles_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_prices_attributes`
--

DROP TABLE IF EXISTS `s_articles_prices_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_prices_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priceID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `priceID` (`priceID`),
  CONSTRAINT `s_articles_prices_attributes_ibfk_1` FOREIGN KEY (`priceID`) REFERENCES `s_articles_prices` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_prices_attributes`
--

LOCK TABLES `s_articles_prices_attributes` WRITE;
/*!40000 ALTER TABLE `s_articles_prices_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_prices_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_relationships`
--

DROP TABLE IF EXISTS `s_articles_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleID` int(30) NOT NULL,
  `relatedarticle` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articleID` (`articleID`,`relatedarticle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_relationships`
--

LOCK TABLES `s_articles_relationships` WRITE;
/*!40000 ALTER TABLE `s_articles_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_similar`
--

DROP TABLE IF EXISTS `s_articles_similar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_similar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleID` int(30) NOT NULL,
  `relatedarticle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articleID` (`articleID`,`relatedarticle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_similar`
--

LOCK TABLES `s_articles_similar` WRITE;
/*!40000 ALTER TABLE `s_articles_similar` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_similar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_similar_shown_ro`
--

DROP TABLE IF EXISTS `s_articles_similar_shown_ro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_similar_shown_ro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) unsigned NOT NULL,
  `related_article_id` int(11) NOT NULL,
  `viewed` int(11) unsigned NOT NULL DEFAULT '0',
  `init_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `viewed_combination` (`article_id`,`related_article_id`),
  KEY `viewed` (`viewed`,`related_article_id`,`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_similar_shown_ro`
--

LOCK TABLES `s_articles_similar_shown_ro` WRITE;
/*!40000 ALTER TABLE `s_articles_similar_shown_ro` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_similar_shown_ro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_supplier`
--

DROP TABLE IF EXISTS `s_articles_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `changed` datetime NOT NULL DEFAULT '2017-02-27 15:41:10',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_supplier`
--

LOCK TABLES `s_articles_supplier` WRITE;
/*!40000 ALTER TABLE `s_articles_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_supplier_attributes`
--

DROP TABLE IF EXISTS `s_articles_supplier_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_supplier_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplierID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `supplierID` (`supplierID`),
  CONSTRAINT `s_articles_supplier_attributes_ibfk_1` FOREIGN KEY (`supplierID`) REFERENCES `s_articles_supplier` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_supplier_attributes`
--

LOCK TABLES `s_articles_supplier_attributes` WRITE;
/*!40000 ALTER TABLE `s_articles_supplier_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_supplier_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_top_seller_ro`
--

DROP TABLE IF EXISTS `s_articles_top_seller_ro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_top_seller_ro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) unsigned NOT NULL,
  `sales` int(11) unsigned NOT NULL DEFAULT '0',
  `last_cleared` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`),
  KEY `sales` (`sales`),
  KEY `listing_query` (`sales`,`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_top_seller_ro`
--

LOCK TABLES `s_articles_top_seller_ro` WRITE;
/*!40000 ALTER TABLE `s_articles_top_seller_ro` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_top_seller_ro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_translations`
--

DROP TABLE IF EXISTS `s_articles_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleID` int(11) NOT NULL,
  `languageID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `description_long` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `description_clear` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `attr1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attr2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attr3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attr4` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attr5` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articleID` (`articleID`,`languageID`)
) ENGINE=InnoDB AUTO_INCREMENT=13928 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_translations`
--

LOCK TABLES `s_articles_translations` WRITE;
/*!40000 ALTER TABLE `s_articles_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_articles_vote`
--

DROP TABLE IF EXISTS `s_articles_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_articles_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `headline` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `points` double NOT NULL,
  `datum` datetime NOT NULL,
  `active` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `answer` text COLLATE utf8_unicode_ci NOT NULL,
  `answer_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `articleID` (`articleID`),
  KEY `get_articles_votes` (`articleID`,`active`,`datum`),
  KEY `vote_average` (`points`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_articles_vote`
--

LOCK TABLES `s_articles_vote` WRITE;
/*!40000 ALTER TABLE `s_articles_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_articles_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_attribute_configuration`
--

DROP TABLE IF EXISTS `s_attribute_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_attribute_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `column_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_value` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL,
  `translatable` int(1) NOT NULL,
  `display_in_backend` int(1) NOT NULL,
  `custom` int(1) NOT NULL,
  `help_text` text COLLATE utf8_unicode_ci,
  `support_text` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `array_store` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `table_name` (`table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_attribute_configuration`
--

LOCK TABLES `s_attribute_configuration` WRITE;
/*!40000 ALTER TABLE `s_attribute_configuration` DISABLE KEYS */;
INSERT INTO `s_attribute_configuration` VALUES (1,'s_articles_attributes','attr3','text',NULL,3,1,1,0,'Optionaler Kommentar','','Kommentar','NULL',NULL),(2,'s_articles_attributes','attr1','text',NULL,1,1,1,0,'Freitext zur Anzeige auf der Detailseite','','Freitext-1','NULL',NULL),(3,'s_articles_attributes','attr2','text',NULL,2,1,1,0,'Freitext zur Anzeige auf der Detailseite','','Freitext-2','NULL',NULL);
/*!40000 ALTER TABLE `s_attribute_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_billing_template`
--

DROP TABLE IF EXISTS `s_billing_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_billing_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `typ` mediumint(11) NOT NULL,
  `group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `show` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_billing_template`
--

LOCK TABLES `s_billing_template` WRITE;
/*!40000 ALTER TABLE `s_billing_template` DISABLE KEYS */;
INSERT INTO `s_billing_template` VALUES (1,'top','1cm',2,'margin','Seitenabstand oben',0,1),(2,'right','0.81cm',2,'margin','Seitenrand rechts',0,1),(3,'bottom','0cm',2,'margin','Seitenabstand unten',0,1),(4,'left','2.41cm',2,'margin','Seitenabstand links',0,1),(5,'top2','5cm',2,'header','Logohöhe',6,1),(7,'margin','1cm',2,'headline','Überschrift Abstand zur Anschrift',0,1),(8,'left','0cm',2,'sender','Abstand links (negativ Wert möglich)',0,1),(9,'footer','<table style=\"height: 90px;\" border=\"0\" width=\"100%\">\r\n<tbody>\r\n<tr valign=\"top\">\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">Demo GmbH</span></p>\r\n<p><span style=\"font-size: xx-small;\">Steuer-Nr <br />UST-ID: <br />Finanzamt </span><span style=\"font-size: xx-small;\">Musterstadt</span></p>\r\n</td>\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">Bankverbindung</span></p>\r\n<p><span style=\"font-size: xx-small;\">Sparkasse Musterstadt<br />BLZ: <br />Konto: </span></p>\r\n<span style=\"font-size: xx-small;\">aaaa<br /></span></td>\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">AGB<br /></span></p>\r\n<p><span style=\"font-size: xx-small;\">Gerichtsstand ist Musterstadt<br />Erf&uuml;llungsort Musterstadt<br />Gelieferte Ware bleibt bis zur vollst&auml;ndigen Bezahlung unser Eigentum</span></p>\r\n</td>\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">Gesch&auml;ftsf&uuml;hrer</span></p>\r\n<p><span style=\"font-size: xx-small;\">Max Mustermann</span></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>',1,'footer','Fusszeile',2,1),(13,'right','<p><strong>Demo GmbH </strong><br /> Max Mustermann<br /> Stra&szlig;e 3<br /> 00000 Musterstadt<br /> Fon: 01234 / 56789<br /> Fax: 01234 / 56780<br />info@demo.de<br />www.demo.de</p>',1,'header','Briefkopf rechts',9,1),(14,'sender','Demo GmbH - Straße 3 - 00000 Musterstadt',2,'sender','Absender',0,1),(15,'left','100px',2,'footer','Abstand links',0,1),(16,'bottom','100px',2,'footer','Abstand unten',1,1),(17,'number','10',2,'content_middle','Anzahl angezeigter Postionen',2,1),(18,'text','',1,'content_middle','Freitext',4,1),(19,'height','12cm',2,'content_middle','Inhaltsabstand zum obigen Seitenrand',0,1),(20,'top','<p><img src=\"http://www.shopwaredemo.de/eMail_logo.jpg\" alt=\"\" width=\"393\" height=\"78\" /></p>',1,'header','Logo oben',7,1),(21,'top','1cm',2,'sender','Abstand unten zum Logo (negativ Wert möglich)',0,1),(22,'margin','2.2cm',2,'header','Abstand rechts (negativ Wert möglich)',8,1);
/*!40000 ALTER TABLE `s_billing_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_blog`
--

DROP TABLE IF EXISTS `s_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_blog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `active` int(1) NOT NULL,
  `short_description` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `views` int(11) unsigned DEFAULT NULL,
  `display_date` datetime NOT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emotion_get_blog_entry` (`display_date`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_blog`
--

LOCK TABLES `s_blog` WRITE;
/*!40000 ALTER TABLE `s_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_blog_assigned_articles`
--

DROP TABLE IF EXISTS `s_blog_assigned_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_blog_assigned_articles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) unsigned NOT NULL,
  `article_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_blog_assigned_articles`
--

LOCK TABLES `s_blog_assigned_articles` WRITE;
/*!40000 ALTER TABLE `s_blog_assigned_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_blog_assigned_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_blog_attributes`
--

DROP TABLE IF EXISTS `s_blog_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_blog_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) unsigned DEFAULT NULL,
  `attribute1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  CONSTRAINT `s_blog_attributes_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `s_blog` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_blog_attributes`
--

LOCK TABLES `s_blog_attributes` WRITE;
/*!40000 ALTER TABLE `s_blog_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_blog_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_blog_comments`
--

DROP TABLE IF EXISTS `s_blog_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_blog_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `headline` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `active` int(1) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `points` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_blog_comments`
--

LOCK TABLES `s_blog_comments` WRITE;
/*!40000 ALTER TABLE `s_blog_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_blog_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_blog_media`
--

DROP TABLE IF EXISTS `s_blog_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_blog_media` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) unsigned NOT NULL,
  `media_id` int(11) unsigned NOT NULL,
  `preview` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blogID` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_blog_media`
--

LOCK TABLES `s_blog_media` WRITE;
/*!40000 ALTER TABLE `s_blog_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_blog_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_blog_tags`
--

DROP TABLE IF EXISTS `s_blog_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_blog_tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blogID` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_blog_tags`
--

LOCK TABLES `s_blog_tags` WRITE;
/*!40000 ALTER TABLE `s_blog_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_blog_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_campaigns_articles`
--

DROP TABLE IF EXISTS `s_campaigns_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_campaigns_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentID` int(11) NOT NULL DEFAULT '0',
  `articleordernumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_campaigns_articles`
--

LOCK TABLES `s_campaigns_articles` WRITE;
/*!40000 ALTER TABLE `s_campaigns_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_campaigns_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_campaigns_banner`
--

DROP TABLE IF EXISTS `s_campaigns_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_campaigns_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentID` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `linkTarget` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_campaigns_banner`
--

LOCK TABLES `s_campaigns_banner` WRITE;
/*!40000 ALTER TABLE `s_campaigns_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_campaigns_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_campaigns_containers`
--

DROP TABLE IF EXISTS `s_campaigns_containers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_campaigns_containers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promotionID` int(11) DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_campaigns_containers`
--

LOCK TABLES `s_campaigns_containers` WRITE;
/*!40000 ALTER TABLE `s_campaigns_containers` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_campaigns_containers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_campaigns_groups`
--

DROP TABLE IF EXISTS `s_campaigns_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_campaigns_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_campaigns_groups`
--

LOCK TABLES `s_campaigns_groups` WRITE;
/*!40000 ALTER TABLE `s_campaigns_groups` DISABLE KEYS */;
INSERT INTO `s_campaigns_groups` VALUES (1,'Newsletter-Empfänger');
/*!40000 ALTER TABLE `s_campaigns_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_campaigns_html`
--

DROP TABLE IF EXISTS `s_campaigns_html`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_campaigns_html` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentID` int(11) DEFAULT NULL,
  `headline` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `html` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alignment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_campaigns_html`
--

LOCK TABLES `s_campaigns_html` WRITE;
/*!40000 ALTER TABLE `s_campaigns_html` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_campaigns_html` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_campaigns_links`
--

DROP TABLE IF EXISTS `s_campaigns_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_campaigns_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentID` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_campaigns_links`
--

LOCK TABLES `s_campaigns_links` WRITE;
/*!40000 ALTER TABLE `s_campaigns_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_campaigns_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_campaigns_logs`
--

DROP TABLE IF EXISTS `s_campaigns_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_campaigns_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datum` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mailingID` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `articleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_campaigns_logs`
--

LOCK TABLES `s_campaigns_logs` WRITE;
/*!40000 ALTER TABLE `s_campaigns_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_campaigns_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_campaigns_mailaddresses`
--

DROP TABLE IF EXISTS `s_campaigns_mailaddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_campaigns_mailaddresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer` int(1) NOT NULL,
  `groupID` int(11) NOT NULL,
  `email` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `lastmailing` int(11) NOT NULL,
  `lastread` int(11) NOT NULL,
  `added` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groupID` (`groupID`),
  KEY `email` (`email`),
  KEY `lastmailing` (`lastmailing`),
  KEY `lastread` (`lastread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_campaigns_mailaddresses`
--

LOCK TABLES `s_campaigns_mailaddresses` WRITE;
/*!40000 ALTER TABLE `s_campaigns_mailaddresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_campaigns_mailaddresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_campaigns_maildata`
--

DROP TABLE IF EXISTS `s_campaigns_maildata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_campaigns_maildata` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `groupID` int(11) unsigned NOT NULL,
  `salutation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` datetime NOT NULL,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`,`groupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_campaigns_maildata`
--

LOCK TABLES `s_campaigns_maildata` WRITE;
/*!40000 ALTER TABLE `s_campaigns_maildata` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_campaigns_maildata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_campaigns_mailings`
--

DROP TABLE IF EXISTS `s_campaigns_mailings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_campaigns_mailings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datum` date DEFAULT NULL,
  `groups` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sendermail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sendername` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plaintext` int(1) NOT NULL,
  `templateID` int(11) NOT NULL DEFAULT '0',
  `languageID` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locked` datetime DEFAULT NULL,
  `recipients` int(11) NOT NULL,
  `read` int(11) NOT NULL DEFAULT '0',
  `clicked` int(11) NOT NULL DEFAULT '0',
  `customergroup` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `publish` int(1) unsigned NOT NULL,
  `timed_delivery` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_campaigns_mailings`
--

LOCK TABLES `s_campaigns_mailings` WRITE;
/*!40000 ALTER TABLE `s_campaigns_mailings` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_campaigns_mailings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_campaigns_positions`
--

DROP TABLE IF EXISTS `s_campaigns_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_campaigns_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promotionID` int(11) NOT NULL DEFAULT '0',
  `containerID` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_campaigns_positions`
--

LOCK TABLES `s_campaigns_positions` WRITE;
/*!40000 ALTER TABLE `s_campaigns_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_campaigns_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_campaigns_sender`
--

DROP TABLE IF EXISTS `s_campaigns_sender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_campaigns_sender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_campaigns_sender`
--

LOCK TABLES `s_campaigns_sender` WRITE;
/*!40000 ALTER TABLE `s_campaigns_sender` DISABLE KEYS */;
INSERT INTO `s_campaigns_sender` VALUES (1,'info@example.com','Newsletter Absender');
/*!40000 ALTER TABLE `s_campaigns_sender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_campaigns_templates`
--

DROP TABLE IF EXISTS `s_campaigns_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_campaigns_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_campaigns_templates`
--

LOCK TABLES `s_campaigns_templates` WRITE;
/*!40000 ALTER TABLE `s_campaigns_templates` DISABLE KEYS */;
INSERT INTO `s_campaigns_templates` VALUES (1,'index.tpl','Standardtemplate'),(2,'indexh.tpl','Händler');
/*!40000 ALTER TABLE `s_campaigns_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_categories`
--

DROP TABLE IF EXISTS `s_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) unsigned DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) unsigned DEFAULT '0',
  `left` int(11) unsigned NOT NULL,
  `right` int(11) unsigned NOT NULL,
  `level` int(11) unsigned NOT NULL,
  `added` datetime NOT NULL,
  `changed` datetime NOT NULL,
  `metakeywords` mediumtext COLLATE utf8_unicode_ci,
  `metadescription` mediumtext COLLATE utf8_unicode_ci,
  `cmsheadline` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmstext` mediumtext COLLATE utf8_unicode_ci,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) NOT NULL,
  `blog` int(11) NOT NULL,
  `external` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hidefilter` int(1) NOT NULL,
  `hidetop` int(1) NOT NULL,
  `mediaID` int(11) unsigned DEFAULT NULL,
  `product_box_layout` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stream_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  KEY `description` (`description`),
  KEY `position` (`position`),
  KEY `left` (`left`,`right`),
  KEY `level` (`level`),
  KEY `active_query_builder` (`parent`,`position`,`id`),
  KEY `stream_id` (`stream_id`),
  CONSTRAINT `s_categories_fk_stream_id` FOREIGN KEY (`stream_id`) REFERENCES `s_product_streams` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_categories`
--

LOCK TABLES `s_categories` WRITE;
/*!40000 ALTER TABLE `s_categories` DISABLE KEYS */;
INSERT INTO `s_categories` VALUES (1,NULL,NULL,'Root',0,1,6,0,'2012-08-27 22:28:52','2012-08-27 22:28:52',NULL,NULL,NULL,NULL,NULL,1,0,NULL,0,0,0,NULL,NULL,NULL),(3,1,NULL,'Deutsch',0,2,3,1,'2012-08-27 22:28:52','2012-08-27 22:28:52',NULL,'','','',NULL,1,0,'',0,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `s_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_categories_attributes`
--

DROP TABLE IF EXISTS `s_categories_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_categories_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryID` int(11) unsigned DEFAULT NULL,
  `attribute1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categoryID` (`categoryID`),
  CONSTRAINT `s_categories_attributes_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `s_categories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_categories_attributes`
--

LOCK TABLES `s_categories_attributes` WRITE;
/*!40000 ALTER TABLE `s_categories_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_categories_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_categories_avoid_customergroups`
--

DROP TABLE IF EXISTS `s_categories_avoid_customergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_categories_avoid_customergroups` (
  `categoryID` int(11) NOT NULL,
  `customergroupID` int(11) NOT NULL,
  UNIQUE KEY `articleID` (`categoryID`,`customergroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_categories_avoid_customergroups`
--

LOCK TABLES `s_categories_avoid_customergroups` WRITE;
/*!40000 ALTER TABLE `s_categories_avoid_customergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_categories_avoid_customergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_cms_static`
--

DROP TABLE IF EXISTS `s_cms_static`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_cms_static` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tpl1variable` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tpl1path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tpl2variable` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tpl2path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tpl3variable` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tpl3path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `html` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `grouping` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parentID` int(11) NOT NULL DEFAULT '0',
  `page_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `changed` datetime NOT NULL DEFAULT '2017-02-27 15:41:10',
  `shop_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `get_menu` (`position`,`description`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_cms_static`
--

LOCK TABLES `s_cms_static` WRITE;
/*!40000 ALTER TABLE `s_cms_static` DISABLE KEYS */;
INSERT INTO `s_cms_static` VALUES (1,'','','','','','','Kontakt','<p>F&uuml;gen Sie hier Ihre Kontaktdaten ein</p>','gLeft|gBottom',1,'shopware.php?sViewport=ticket&sFid=5','_self',0,'','','','2017-02-27 15:41:10',NULL),(2,'','','','','','','Hilfe / Support','<h2>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas.</h2>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila. Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter.</p>\n<p>Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila.</p>\n<p>Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter. Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>','gLeft',1,'','',0,'','','','2017-02-27 15:41:10',NULL),(3,'','','','','','','Impressum','<h2>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas.</h2>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila. Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter.</p>\n<p>Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila.</p>\n<p>Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter. Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>','gLeft|gBottom2',20,'','',0,'','','','2017-02-27 15:41:10',NULL),(4,'','','','','','','AGB','<h2>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas.</h2>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila. Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter.</p>\n<p>Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila.</p>\n<p>Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter. Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>','gLeft|gBottom',18,'','',0,'','','','2017-02-27 15:41:10',NULL),(6,'','','','','','','Versand und Zahlungsbedingungen','<h2>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas.</h2>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila. Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter.</p>\n<p>Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila.</p>\n<p>Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter. Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>','gLeft|gBottom',3,'','',0,'','','','2017-02-27 15:41:10',NULL),(7,'','','','','','','Datenschutz','<h2>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas.</h2>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila. Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter.</p>\n<p>Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila.</p>\n<p>Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter. Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>','gLeft|gBottom2',6,'','',0,'','','','2017-02-27 15:41:10',NULL),(8,'','','','','','','Widerrufsrecht','<h2>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas.</h2>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila. Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter.</p>\n<p>Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila.</p>\n<p>Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter. Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>','gLeft|gBottom',5,'','',0,'','','','2017-02-27 15:41:10',NULL),(9,'','','','','','','Über uns','<h2>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas.</h2>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila. Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter.</p>\n<p>Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila.</p>\n<p>Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter. Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>','gLeft|gBottom2',0,'','',0,'','','','2017-02-27 15:41:10',NULL),(21,'','','','','','','Händler-Login','','gLeft',0,'shopware.php?sViewport=registerFC&sUseSSL=1&sValidation=H','',0,'','','','2017-02-27 15:41:10',NULL),(26,'','','','','','','Newsletter','','gBottom2',0,'shopware.php?sViewport=newsletter','',0,'','','','2017-02-27 15:41:10',NULL),(27,'','','','','','','About us','<p>Text</p>','eLeft|eBottom',0,'','',0,'','','','2017-02-27 15:41:10',NULL),(28,'','','','','','','Payment / Dispatch','<p>Text</p>','eLeft|eBottom',0,'','',0,'','','','2017-02-27 15:41:10',NULL),(29,'','','','','','','Privacy','<p>Text</p>','eLeft|eBottom',0,'','',0,'','','','2017-02-27 15:41:10',NULL),(30,'','','','','','','Help / Support','<p>Text</p>','eLeft|eBottom',0,'','',0,'','','','2017-02-27 15:41:10',NULL),(32,'','','','','','','Newsletter','','eLeft|eBottom',0,'shopware.php?sViewport=newsletter','',0,'','','','2017-02-27 15:41:10',NULL),(33,'','','','','','','Merchant login','','eLeft|eBottom',0,'shopware.php?sViewport,registerFC&sUseSSL=1&sValidation=H','',0,'','','','2017-02-27 15:41:10',NULL),(34,'','','','','','','Contact','','eLeft|eBottom',0,'shopware.php?sViewport=ticket&sFid=18','',0,'','','','2017-02-27 15:41:10',NULL),(35,'','','','','','','Site Map','','eBottom',0,'shopware.php?sViewport=sitemap','',0,'','','','2017-02-27 15:41:10',NULL),(37,'','','','','','','Partnerprogramm','<h1>Jetzt Partner werden</h1>\n<h2>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas.</h2>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila. Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter.</p>\n<p>Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila.</p>\n<p>Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter. Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>','gBottom',0,'shopware.php?sViewport=ticket&sFid=8','_self',0,'','','','2017-02-27 15:41:10',NULL),(38,'','','','','','','Affiliate program','','eBottom2',4,'shopware.php?sViewport=ticket&sFid=17','_self',0,'','','','2017-02-27 15:41:10',NULL),(39,'','','','','','','Defektes Produkt','<p>Defektes Produkt.</p>','gBottom',0,'shopware.php?sViewport=ticket&sFid=9','_self',0,'','','','2017-02-27 15:41:10',NULL),(40,'','','','','','','Defective product','<p>Defective product.</p>','eBottom',4,'shopware.php?sViewport=ticket&sFid=19','_self',0,'','','','2017-02-27 15:41:10',NULL),(41,'','','','','','','Rückgabe','<p>R&uuml;ckgabe.</p>','gBottom',4,'shopware.php?sViewport=ticket&sFid=10','_self',0,'','','','2017-02-27 15:41:10',NULL),(42,'','','','','','','Return','<p>Return.</p>','eBottom2',3,'shopware.php?sViewport=ticket&sFid=20','_self',0,'','','','2017-02-27 15:41:10',NULL),(43,'','','','','','','rechtliche Vorabinformationen','<h2>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas.</h2>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila. Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter.</p>\n<p>Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila.</p>\n<p>Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter. Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>','gLeft|gBottom',0,'','',0,'','','','2017-02-27 15:41:10',NULL),(45,'','','','','','','Widerrufsformular','<h2>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas.</h2>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila. Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter.</p>\n<p>Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>\n<p>Isericordaliter Occatio ter aut Aliusmodi vel Fugo redigo, iam ops tam Plaga consulo sui ymo Zephyr humilitas. Ivi praebalteata Occumbo congruens seco, lea qui se surculus sed abhinc praejudico in forix curo. Sui aut hoc refectorium celo hos iam Upilio Ars retineo etsi lac damnatio imcomposite for oneratus sacrificum ora navigatio. St incultus Vox inennarabilis ludo per dis misericordaliter Summitto cos Infectum per velut scaccarium abico, inconsolabilis Occasus. Ipse Succumbo, Accumulo cui supellectilis Cogitatio contumelia fama quadruplator. Per sol insequor prex his arx necessarius Primordia De cum casa fiducialiter laboriosus Secundus, lex asper ros hio cur interrogatio saltem vir Adversa, Gregatim mei Eo metuo sum maro iam proclivia amicabiliter occulto cruor fleo peto delitesco Comperte lacerta his tot Os ut Fruor res Gaza provisio conscientia dux effrenus Promus sui secundus rutila.</p>\n<p>Celo nam balnearius Opprimo Pennatus, no decentia sui, dicto esse se pulchritudo, pupa Sive res indifferenter. Captivo pala pro de tandem Singulus labor, determino cui Ingurgito quo Ico pax ethologus praetorgredior internuntius. Ops foveo Huius dux respublica his animadverto dolus imperterritus. Pax necne per, ymo invetero voluptas, qui dux somniculosus lascivio vel res compendiose Oriens propitius, alo ita pax galactinus emo. Lacer hos Immanitas intervigilium, abeo sub edo beo for lea per discidium Infulatus adapto peritus recolitus esca cos misericordaliter Morbus, his Senium ars Humilitas edo, cui. Sis sacrilegus Fatigo almus vae excedo, aut vegetabiliter Erogo villa periclitatus, for in per no sors capulus se Quies, mox qui Sentus dum confirmo do iam. Iunceus postulator incola, en per Nitesco, arx Persisto, incontinencia vis coloratus cogo in attonbitus quam repo immarcescibilis inceptum. Ego Vena series sudo ac Nitidus. Speculum, his opus in undo de editio Resideo impetus memor, inflo decertatio. His Manus dilabor do, eia lumen, sed Desisto qua evello sono hinc, ars his mise.</p>','gBottom',8,'','',0,'','','','2017-02-27 15:41:10',NULL);
/*!40000 ALTER TABLE `s_cms_static` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_cms_static_attributes`
--

DROP TABLE IF EXISTS `s_cms_static_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_cms_static_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmsStaticID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cmsStaticID` (`cmsStaticID`),
  CONSTRAINT `s_cms_static_attributes_ibfk_1` FOREIGN KEY (`cmsStaticID`) REFERENCES `s_cms_static` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_cms_static_attributes`
--

LOCK TABLES `s_cms_static_attributes` WRITE;
/*!40000 ALTER TABLE `s_cms_static_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_cms_static_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_cms_static_groups`
--

DROP TABLE IF EXISTS `s_cms_static_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_cms_static_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(1) NOT NULL,
  `mapping_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mapping_id` (`mapping_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_cms_static_groups`
--

LOCK TABLES `s_cms_static_groups` WRITE;
/*!40000 ALTER TABLE `s_cms_static_groups` DISABLE KEYS */;
INSERT INTO `s_cms_static_groups` VALUES (1,'Links','gLeft',1,NULL),(2,'Unten (Spalte 1)','gBottom',1,NULL),(3,'Unten (Spalte 2)','gBottom2',1,NULL),(4,'In Bearbeitung','gDisabled',0,NULL),(7,'Englisch links','eLeft',1,1),(9,'Englisch unten (Spalte 1)','eBottom',1,2),(10,'Englisch unten (Spalte 2)','eBottom2',1,3);
/*!40000 ALTER TABLE `s_cms_static_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_cms_support`
--

DROP TABLE IF EXISTS `s_cms_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_cms_support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_template` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `email_subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text2` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `ticket_typeID` int(10) NOT NULL,
  `isocode` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'de',
  `shop_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_cms_support`
--

LOCK TABLES `s_cms_support` WRITE;
/*!40000 ALTER TABLE `s_cms_support` DISABLE KEYS */;
INSERT INTO `s_cms_support` VALUES (5,'Kontaktformular','<p>Schreiben Sie uns eine E-Mail.</p>\r\n<p>Wir freuen uns auf Ihre Kontaktaufnahme.</p>','info@example.com','Kontaktformular Shopware Demoshop\r\n\r\nAnrede: {sVars.anrede}\r\nVorname: {sVars.vorname}\r\nNachname: {sVars.nachname}\r\nE-Mail: {sVars.email}\r\nTelefon: {sVars.telefon}\r\nBetreff: {sVars.betreff}\r\nKommentar: \r\n{sVars.kommentar}\r\n\r\n\r\n','Kontaktformular Shopware','<p>Ihr Formular wurde versendet!</p>',NULL,NULL,NULL,1,'de',NULL),(8,'Partnerformular','<h2>Partner werden und mitverdienen!</h2>\r\n<p>Einfach unseren Link auf ihre Seite legen und Sie erhalten f&uuml;r jeden Umsatz ihrer vermittelten Kunden automatisch eine attraktive Provision auf den Netto-Auftragswert.</p>\r\n<p>Bitte f&uuml;llen Sie <span style=\"text-decoration: underline;\">unverbindlich</span> das Partnerformular aus. Wir werden uns umgehend mit Ihnen in Verbindung setzen!</p>','info@example.com','Partneranfrage - {$sShopname}\n{sVars.firma} moechte Partner Ihres Shops werden!\n\nFirma: {sVars.firma}\nAnsprechpartner: {sVars.ansprechpartner}\nStraße/Hausnr.: {sVars.strasse}\nPLZ / Ort: {sVars.plz} {sVars.ort}\neMail: {sVars.email}\nTelefon: {sVars.tel}\nFax: {sVars.fax}\nWebseite: {sVars.website}\n\nKommentar:\n{sVars.kommentar}\n\nProfil:\n{sVars.profil}','Partner Anfrage','<p>Die Anfrage wurde versandt!</p>',NULL,NULL,NULL,0,'de',NULL),(9,'Defektes Produkt','<p>Sie erhalten von uns nach dem Absenden dieses Formulars innerhalb kurzer Zeit eine R&uuml;ckantwort mit einer RMA-Nummer und weiterer Vorgehensweise.</p>\r\n<p>Bitte f&uuml;llen Sie die Fehlerbeschreibung ausf&uuml;hrlich aus, Sie m&uuml;ssen diese dann nicht mehr dem Paket beilegen.</p>','info@example.com','Defektes Produkt - Shopware Demoshop\r\n\r\nFirma: {sVars.firma}\r\nKundennummer: {sVars.kdnr}\r\neMail: {sVars.email}\r\n\r\nRechnungsnummer: {sVars.rechnung}\r\nArtikelnummer: {sVars.artikel}\r\n\r\nDetaillierte Fehlerbeschreibung:\r\n--------------------------------\r\n{sVars.fehler}\r\n\r\nRechner: {sVars.rechner}\r\nSystem {sVars.system}\r\nWie tritt das Problem auf: {sVars.wie}\r\n','Online-Serviceformular','<p>Formular erfolgreich versandt!</p>',NULL,NULL,NULL,2,'de',NULL),(10,'Rückgabe','<h2>Hier k&ouml;nnen Sie Informationen zur R&uuml;ckgabe einstellen...</h2>','info@example.com','Rückgabe - Shopware Demoshop\n \nKundennummer: {sVars.kdnr}\neMail: {sVars.email}\n \nRechnungsnummer: {sVars.rechnung}\nArtikelnummer: {sVars.artikel}\n \nKommentar:\n \n{sVars.info}','Rückgabe','<p>Formular erfolgreich versandt.</p>',NULL,NULL,NULL,0,'de',NULL),(16,'Anfrage-Formular','<p>Schreiben Sie uns eine eMail.</p>\r\n<p>Wir freuen uns auf Ihre Kontaktaufnahme.</p>','info@example.com','Anfrage-Formular Shopware Demoshop\r\n\r\nAnrede: {sVars.anrede}\r\nVorname: {sVars.vorname}\r\nNachname: {sVars.nachname}\r\neMail: {sVars.email}\r\nTelefon: {sVars.telefon}\r\nFrage: \r\n{sVars.inquiry}\r\n\r\n\r\n','Anfrage-Formular Shopware','<p>Ihre Anfrage wurde versendet!</p>',NULL,NULL,NULL,0,'de',NULL),(17,'Partner form','<h2><strong>Become partner and earn money!</strong></h2>\r\n<p>Link our Site and receive&nbsp;an attractive commission on the net contract price&nbsp;for every tornover of your&nbsp;provided customers.</p>\r\n<p>Please fill out the partner form <span style=\"text-decoration: underline;\">without obligation</span>.&nbsp;We will immediately get in contact with you!</p>','info@example.com','Partner inquiry - {$sShopname}\n{sVars.firma} want to become your partner!\n\nCompany: {sVars.firma}\nContact person: {sVars.ansprechpartner}\nStreet / No.: {sVars.strasse}\nPostal Code / City: {sVars.plz} {sVars.ort}\neMail: {sVars.email}\nPhone: {sVars.tel}\nFax: {sVars.fax}\nWebsite: {sVars.website}\n\nComment:\n{sVars.kommentar}\n\nProfile:\n{sVars.profil}','Partner inquiry','<p>&nbsp;</p>\r\n&nbsp;\r\n<div id=\"result_box\" dir=\"ltr\">The request has been sent!</div>',NULL,NULL,NULL,0,'de',NULL),(18,'Contact','','info@example.com','Contact form Shopware Demoshop\r\n\r\nTitle: {sVars.anrede}\r\nFirst name: {sVars.vorname}\r\nLast name: {sVars.nachname}\r\neMail: {sVars.email}\r\nPhone: {sVars.telefon}\r\nSubject: {sVars.betreff}\r\nComment: \r\n{sVars.kommentar}\r\n\r\n\r\n','Contact form Shopware','<p>Your form was sent!</p>',NULL,NULL,NULL,0,'de',NULL),(19,'Defective product','<p>&nbsp;</p>\r\n&nbsp;\r\n<h1>Defective product - for customers and traders</h1>\r\n<p>You will receive an answer&nbsp;from us&nbsp;with an RMA number an other approach&nbsp;after sending this form.&nbsp;</p>\r\n<p>Please fill out the error description, so you must not add this any more to the package.</p>','info@example.com','Defective product - Shopware Demoshop\n\nCompany: {sVars.firma}\nCustomer no.: {sVars.kdnr}\neMail: {sVars.email}\n\nInvoice no.: {sVars.rechnung}\nArticle no.: {sVars.artikel}\n\nDescription of failure:\n--------------------------------\n{sVars.fehler}\n\nType: {sVars.rechner}\nSystem {sVars.system}\nHow does the problem occur:\n{sVars.wie}','Online-Serviceform','<p>Form successfully sent!</p>',NULL,NULL,NULL,0,'de',NULL),(20,'Return','<h2>Here you can write information about the return...</h2>','info@example.com','Return - Shopware Demoshop\n\nCustomer no.: {sVars.kdnr}\neMail: {sVars.email}\n\nInvoice no.: {sVars.rechnung}\nArticle no.: {sVars.artikel}\n\nComment:\n{sVars.info}','Return','<p>Form successfully sent.</p>',NULL,NULL,NULL,0,'de',NULL),(21,'Inquiry form','<p>Send us an email.&nbsp;<br /><br />We look forward to hearing from you.</p>','info@example.com','Anfrage-Formular Shopware Demoshop\r\n\r\nAnrede: {sVars.anrede}\r\nVorname: {sVars.vorname}\r\nNachname: {sVars.nachname}\r\neMail: {sVars.email}\r\nTelefon: {sVars.telefon}\r\nFrage: \r\n{sVars.inquiry}\r\n\r\n\r\n','Inquiry form Shopware','<p>Your request has been sent!</p>',NULL,NULL,NULL,0,'de',NULL),(22,'Support beantragen','<p>Wir freuen uns &uuml;ber Ihre Kontaktaufnahme.</p>','info@example.com','','Support beantragen','<p>Vielen Dank f&uuml;r Ihre Anfrage!</p>',NULL,NULL,NULL,1,'de',NULL);
/*!40000 ALTER TABLE `s_cms_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_cms_support_attributes`
--

DROP TABLE IF EXISTS `s_cms_support_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_cms_support_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmsSupportID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cmsSupportID` (`cmsSupportID`),
  CONSTRAINT `s_cms_support_attributes_ibfk_1` FOREIGN KEY (`cmsSupportID`) REFERENCES `s_cms_support` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_cms_support_attributes`
--

LOCK TABLES `s_cms_support_attributes` WRITE;
/*!40000 ALTER TABLE `s_cms_support_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_cms_support_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_cms_support_fields`
--

DROP TABLE IF EXISTS `s_cms_support_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_cms_support_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `error_msg` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `typ` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `required` int(1) NOT NULL,
  `supportID` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `added` datetime NOT NULL,
  `position` int(11) NOT NULL,
  `ticket_task` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`supportID`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_cms_support_fields`
--

LOCK TABLES `s_cms_support_fields` WRITE;
/*!40000 ALTER TABLE `s_cms_support_fields` DISABLE KEYS */;
INSERT INTO `s_cms_support_fields` VALUES (24,'','anrede','','select',1,5,'Anrede','normal','Frau;Herr','2007-11-02 03:28:48',1,''),(35,'','vorname','','text',1,5,'Vorname','normal','','2007-11-06 03:17:48',2,''),(36,'','nachname','','text',1,5,'Nachname','normal','','2007-11-06 03:17:57',3,'name'),(37,'','email','','email',1,5,'E-Mail-Adresse','normal','','2007-11-06 03:18:36',4,'email'),(38,'','telefon','','text',0,5,'Telefon','normal','','2007-11-06 03:18:49',5,''),(39,'','betreff','','text',1,5,'Betreff','normal','','2007-11-06 03:18:57',6,'subject'),(40,'','kommentar','','textarea',1,5,'Kommentar','normal','','2007-11-06 03:19:08',7,'message'),(41,'','firma','','text',1,8,'Firma','normal','','2007-11-22 08:11:39',1,''),(42,'','ansprechpartner','','text',1,8,'Ansprechpartner','normal','','2007-11-22 08:12:18',2,''),(43,'','strasse','','text',1,8,'Straße & Hausnummer','normal','','2007-11-22 08:12:49',3,''),(44,'','plz;ort','','text2',1,8,'PLZ ; Ort','plz;ort','','2007-11-22 08:12:59',4,''),(45,'','tel','','text',1,8,'Telefon','normal','','2007-11-22 08:13:45',5,''),(46,'','fax','','text',0,8,'Fax','normal','','2007-11-22 08:13:52',6,''),(47,'','email','','text',1,8,'E-Mail','normal','','2007-11-22 08:13:58',7,''),(48,'','website','','text',1,8,'Webseite','normal','','2007-11-22 08:14:07',8,''),(49,'','kommentar','','textarea',0,8,'Kommentar','normal','','2007-11-22 08:14:21',9,''),(50,'','profil','','textarea',1,8,'Firmenprofil','normal','','2007-11-22 08:14:34',10,''),(51,'','rechnung','','text',1,9,'Rechnungsnummer','normal','','2007-11-06 17:21:49',1,''),(52,'','email','','text',1,9,'E-Mail-Adresse','normal','','2007-11-06 17:19:20',2,'email'),(53,'','kdnr','','text',1,9,'KdNr.(siehe Rechnung)','normal','','2007-11-06 17:19:10',3,'name'),(54,'','firma','','checkbox',0,9,'Firma (Wenn ja, bitte ankreuzen)','','1','2007-11-06 17:18:36',4,''),(55,'','artikel','','textarea',1,9,'Artikelnummer(n)','normal','','2007-11-06 17:22:13',5,'subject'),(56,'','fehler','','textarea',1,9,'Detaillierte Fehlerbeschreibung','normal','','2007-11-06 17:22:33',6,'message'),(57,'','rechner','','textarea',0,9,'Auf welchem Rechnertypen läuft das defekte Produkt?','normal','','2007-11-06 17:23:17',7,''),(58,'','system','','textarea',0,9,'Mit welchem Betriebssystem arbeiten Sie?','normal','','2007-11-06 17:23:57',8,''),(59,'','wie','','select',1,9,'Wie tritt das Problem auf?','normal','sporadisch; ständig','2007-11-06 17:24:26',9,''),(60,'','kdnr','','text',1,10,'KdNr.(siehe Rechnung)','normal','','2007-11-06 17:31:38',1,''),(61,'','email','','text',1,10,'E-Mail-Adresse','normal','','2007-11-06 17:31:51',2,''),(62,'','rechnung','','text',1,10,'Rechnungsnummer','normal','','2007-11-06 17:32:02',3,''),(63,'','artikel','','textarea',1,10,'Artikelnummer(n)','normal','','2007-11-06 17:32:17',4,''),(64,'','info','','textarea',0,10,'Kommentar','normal','','2007-11-06 17:32:42',5,''),(69,'','inquiry','','textarea',1,16,'Anfrage','normal','','2007-11-06 03:19:08',1,''),(71,'','nachname','','text',1,16,'Nachname','normal','','2007-11-06 03:17:57',2,''),(72,'','anrede','','select',1,16,'Anrede','normal','Frau;Herr','2007-11-02 03:28:48',3,''),(73,'','telefon','','text',0,16,'Telefon','normal','','2007-11-06 03:18:49',4,''),(74,'','email','','text',1,16,'E-Mail-Adresse','normal','','2007-11-06 03:18:36',5,''),(75,'','vorname','','text',1,16,'Vorname','normal','','2007-11-06 03:17:48',6,''),(76,'','firma','','text',1,17,'Company','normal','','2008-10-17 13:02:42',1,''),(77,'','ansprechpartner','','text',1,17,'Contact person','normal','','2008-10-17 13:03:35',2,''),(78,'','strasse','','text',1,17,'Street & house number','normal','','2008-10-17 13:05:55',3,''),(79,'','plz;ort','','text2',1,17,'Postal Code ; City','plz;ort','','2008-10-17 13:06:23',4,''),(80,'','tel','','text',1,17,'Phone','normal','','2008-10-17 13:06:35',5,''),(81,'','fax','','text',0,17,'Fax','normal','','2008-10-17 13:06:48',6,''),(82,'','email','','text',1,17,'eMail','normal','','2008-10-17 13:07:06',7,''),(83,'','website','','text',1,17,'Website','normal','','2008-10-17 13:07:14',8,''),(84,'','kommentar','','textarea',0,17,'Comment','normal','','2008-10-17 13:07:25',9,''),(85,'','profil','','textarea',1,17,'Company profile','normal','','2008-10-17 13:07:43',10,''),(86,'','anrede','','select',1,18,'Title','normal','Ms;Mr','2008-10-17 13:21:07',1,''),(87,'','vorname','','text',1,18,'First name','normal','','2008-10-17 13:21:41',2,''),(88,'','nachname','','text',1,18,'Last name','normal','','2008-10-17 13:22:01',3,''),(89,'','email','','text',1,18,'eMail-Adress','normal','','2008-10-17 13:22:18',4,''),(90,'','telefon','','text',0,18,'Phone','normal','','2008-10-17 13:22:28',5,''),(91,'','betreff','','text',1,18,'Subject','normal','','2008-10-17 13:22:38',6,''),(92,'','kommentar','','textarea',1,18,'Comment','normal','','2008-10-17 13:22:45',7,''),(93,'','firma','','checkbox',0,19,'Company (If so, please mark)','','1','2008-10-17 13:45:44',1,''),(94,'','kdnr','','text',1,19,'Customer no. (See invoice)','normal','','2008-10-17 13:46:04',2,''),(95,'','email','','text',1,19,'Email address','normal','','2008-10-17 13:46:27',3,''),(96,'','rechnung','','text',1,19,'Invoice number','normal','','2008-10-17 13:47:03',4,''),(97,'','artikel','','textarea',1,19,'Article number(s)','normal','','2008-10-17 13:47:43',5,''),(98,'','fehler','','textarea',1,19,'Detailed error description','normal','','2008-10-17 13:48:54',6,''),(99,'','rechner','','textarea',0,19,'On which computer type does the defective product run?','normal','','2008-10-17 14:02:03',7,''),(100,'','system','','textarea',0,19,'With which operating system do you work?','normal','','2008-10-17 14:02:36',8,''),(101,'','wie','','select',1,19,'How does the problem occur?','normal','sporadically;permanently','2008-10-17 14:02:55',9,''),(102,'','kdnr','','text',1,20,'Customer no. (See invoice)','normal','','2008-10-17 14:21:28',1,''),(103,'','email','','text',1,20,'eMail-Adress','normal','','2008-10-17 14:22:12',2,''),(104,'','rechnung','','text',1,20,'Invoice number','normal','','2008-10-17 14:22:43',3,''),(105,'','artikel','','textarea',1,20,'Articlenumber(s)','normal','','2008-10-17 14:23:15',4,''),(106,'','info','','textarea',0,20,'Comment','normal','','2008-10-17 14:23:37',5,''),(107,'','anrede','','select',1,21,'Title','normal','Ms;Mr','2008-10-17 14:45:21',1,''),(108,'','vorname','','text',1,21,'First name','normal','','2008-10-17 14:46:11',2,''),(109,'','nachname','','text',1,21,'Last name','normal','','2008-10-17 14:46:31',3,''),(110,'','email','','text',1,21,'eMail-Adress','normal','','2008-10-17 14:46:49',4,''),(111,'','telefon','','text',0,21,'Phone','normal','','2008-10-17 14:47:00',5,''),(112,'','inquiry','','textarea',1,21,'Inquiry','normal','','2008-10-17 14:47:25',6,''),(113,'','name','','text',1,22,'Name','normal','','2009-04-15 22:20:30',1,'name'),(114,'','email','','email',1,22,'eMail','normal','','2009-04-15 22:20:37',2,'email'),(115,'','betreff','','text',1,22,'Betreff','normal','','2009-04-15 22:20:45',3,'subject'),(116,'','kommentar','','textarea',1,22,'Kommentar','normal','','2009-04-15 22:21:07',4,'message');
/*!40000 ALTER TABLE `s_cms_support_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_acl_privileges`
--

DROP TABLE IF EXISTS `s_core_acl_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_acl_privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resourceID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resourceID` (`resourceID`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_acl_privileges`
--

LOCK TABLES `s_core_acl_privileges` WRITE;
/*!40000 ALTER TABLE `s_core_acl_privileges` DISABLE KEYS */;
INSERT INTO `s_core_acl_privileges` VALUES (1,1,'create'),(2,1,'read'),(3,1,'update'),(4,1,'delete'),(5,2,'create'),(6,2,'read'),(7,2,'update'),(8,2,'delete'),(10,3,'create'),(11,3,'update'),(12,3,'delete'),(15,4,'create'),(16,4,'read'),(17,4,'update'),(18,4,'delete'),(19,5,'create'),(20,5,'update'),(21,5,'delete'),(22,5,'read'),(23,6,'createupdate'),(24,6,'read'),(26,6,'delete'),(27,5,'detail'),(28,5,'perform_order'),(29,7,'create'),(30,7,'read'),(31,7,'update'),(32,7,'delete'),(33,8,'create'),(34,8,'read'),(35,8,'update'),(36,8,'delete'),(37,8,'export'),(38,8,'generate'),(39,9,'read'),(40,9,'accept'),(41,9,'comment'),(42,9,'delete'),(43,10,'create'),(44,10,'read'),(45,10,'update'),(46,10,'delete'),(47,11,'create'),(48,11,'read'),(49,11,'update'),(50,11,'delete'),(56,13,'read'),(57,14,'create'),(58,14,'read'),(59,14,'update'),(60,14,'delete'),(61,15,'create'),(62,15,'read'),(63,15,'update'),(64,15,'delete'),(65,16,'create'),(66,16,'read'),(67,16,'update'),(68,16,'delete'),(69,17,'create'),(70,17,'read'),(71,17,'update'),(72,17,'delete'),(73,18,'createGroup'),(74,18,'read'),(75,18,'createSite'),(76,18,'updateSite'),(77,18,'deleteSite'),(78,18,'deleteGroup'),(79,11,'generate'),(80,19,'read'),(81,20,'read'),(82,20,'delete'),(83,21,'save'),(84,21,'read'),(85,21,'delete'),(86,22,'create'),(87,22,'read'),(88,22,'update'),(89,22,'delete'),(90,22,'statistic'),(91,23,'create'),(92,23,'read'),(93,23,'update'),(94,23,'delete'),(95,24,'read'),(96,25,'delete'),(97,25,'read'),(98,26,'read'),(99,27,'read'),(100,27,'delete'),(101,27,'create'),(102,27,'upload'),(103,27,'update'),(104,28,'read'),(105,28,'delete'),(106,28,'update'),(107,28,'create'),(108,28,'comments'),(110,29,'read'),(112,29,'delete'),(113,29,'save'),(114,30,'create'),(115,30,'read'),(116,30,'update'),(117,30,'delete'),(118,31,'create'),(119,31,'read'),(120,31,'update'),(121,31,'delete'),(122,32,'delete'),(123,32,'read'),(124,32,'write'),(125,33,'read'),(126,33,'update'),(127,33,'clear'),(128,34,'read'),(129,34,'export'),(130,34,'import'),(131,35,'create'),(132,35,'read'),(133,35,'update'),(134,35,'delete'),(136,36,'read'),(137,36,'upload'),(138,36,'download'),(139,36,'install'),(140,36,'update'),(141,37,'read'),(142,37,'swag-visitors-customers-widget'),(143,37,'swag-last-orders-widget'),(144,37,'swag-sales-widget'),(145,37,'swag-merchant-widget'),(146,37,'swag-upload-widget'),(147,37,'swag-notice-widget'),(148,38,'read'),(149,38,'createFilters'),(150,38,'editFilters'),(151,38,'deleteFilters'),(152,38,'editSingleArticle'),(153,38,'doMultiEdit'),(154,38,'doBackup'),(155,39,'read'),(156,39,'preview'),(157,39,'changeTheme'),(158,39,'createTheme'),(159,39,'uploadTheme'),(160,39,'configureTheme'),(161,39,'configureSystem'),(162,40,'read'),(163,40,'update'),(164,40,'skipUpdate'),(166,41,'update'),(167,41,'read'),(168,20,'system');
/*!40000 ALTER TABLE `s_core_acl_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_acl_resources`
--

DROP TABLE IF EXISTS `s_core_acl_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_acl_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pluginID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_acl_resources`
--

LOCK TABLES `s_core_acl_resources` WRITE;
/*!40000 ALTER TABLE `s_core_acl_resources` DISABLE KEYS */;
INSERT INTO `s_core_acl_resources` VALUES (1,'debug_test',NULL),(2,'banner',NULL),(4,'supplier',NULL),(5,'customer',NULL),(6,'form',NULL),(7,'premium',NULL),(8,'voucher',NULL),(9,'vote',NULL),(10,'mail',NULL),(11,'productfeed',NULL),(13,'overview',NULL),(14,'order',NULL),(15,'payment',NULL),(16,'shipping',NULL),(17,'snippet',NULL),(18,'site',NULL),(19,'systeminfo',NULL),(20,'log',NULL),(21,'riskmanagement',NULL),(22,'partner',NULL),(23,'category',NULL),(24,'notification',NULL),(25,'canceledorder',NULL),(26,'analytics',NULL),(27,'mediamanager',NULL),(28,'blog',NULL),(29,'article',NULL),(30,'config',NULL),(31,'emotion',NULL),(32,'newslettermanager',NULL),(33,'performance',NULL),(34,'importexport',NULL),(35,'usermanager',NULL),(36,'pluginmanager',NULL),(37,'widgets',NULL),(38,'articlelist',NULL),(39,'theme',NULL),(40,'swagupdate',NULL),(41,'attributes',NULL);
/*!40000 ALTER TABLE `s_core_acl_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_acl_roles`
--

DROP TABLE IF EXISTS `s_core_acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_acl_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleID` int(11) NOT NULL,
  `resourceID` int(11) DEFAULT NULL,
  `privilegeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roleID` (`roleID`,`resourceID`,`privilegeID`),
  KEY `resourceID` (`resourceID`),
  KEY `privilegeID` (`privilegeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_acl_roles`
--

LOCK TABLES `s_core_acl_roles` WRITE;
/*!40000 ALTER TABLE `s_core_acl_roles` DISABLE KEYS */;
INSERT INTO `s_core_acl_roles` VALUES (1,1,NULL,NULL);
/*!40000 ALTER TABLE `s_core_acl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_auth`
--

DROP TABLE IF EXISTS `s_core_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleID` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `encoder` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'LegacyBackendMd5',
  `apiKey` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `localeID` int(11) NOT NULL,
  `sessionID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  `failedlogins` int(11) NOT NULL,
  `lockeduntil` datetime DEFAULT NULL,
  `extended_editor` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled_cache` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_auth`
--

LOCK TABLES `s_core_auth` WRITE;
/*!40000 ALTER TABLE `s_core_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_auth_attributes`
--

DROP TABLE IF EXISTS `s_core_auth_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_auth_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authID` (`authID`),
  CONSTRAINT `s_core_auth_attributes_ibfk_1` FOREIGN KEY (`authID`) REFERENCES `s_core_auth` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_auth_attributes`
--

LOCK TABLES `s_core_auth_attributes` WRITE;
/*!40000 ALTER TABLE `s_core_auth_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_auth_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_auth_roles`
--

DROP TABLE IF EXISTS `s_core_auth_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_auth_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentID` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` int(1) NOT NULL,
  `admin` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_auth_roles`
--

LOCK TABLES `s_core_auth_roles` WRITE;
/*!40000 ALTER TABLE `s_core_auth_roles` DISABLE KEYS */;
INSERT INTO `s_core_auth_roles` VALUES (1,NULL,'local_admins','Default group that gains access to all shop functions','build-in',1,1);
/*!40000 ALTER TABLE `s_core_auth_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_config_element_translations`
--

DROP TABLE IF EXISTS `s_core_config_element_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_config_element_translations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `element_id` int(11) unsigned NOT NULL,
  `locale_id` int(11) unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `element_id` (`element_id`,`locale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_config_element_translations`
--

LOCK TABLES `s_core_config_element_translations` WRITE;
/*!40000 ALTER TABLE `s_core_config_element_translations` DISABLE KEYS */;
INSERT INTO `s_core_config_element_translations` VALUES (1,225,2,'Controller selection',NULL),(4,224,2,'Display recently viewed items',NULL),(5,269,2,'Activate expandable menu in storefront',NULL),(6,273,2,'Display item comparison',NULL),(11,186,2,'VAT vouchers',NULL),(12,188,2,'VAT discounts',NULL),(13,189,2,'Customer reviews must be approved',NULL),(14,190,2,'Automatic item number suggestions',NULL),(15,191,2,'Prefix for automatically generated item numbers',NULL),(16,192,2,'Deactivate product evaluations ',NULL),(17,193,2,'Automatically remind customer to submit reviews','Remind the customer via email of pending article reviews'),(18,194,2,'Days to wait before sending reminder','Days until the customer is reminded via Email of a pending article review'),(19,195,2,'Set tax for discounts dynamically',NULL),(22,231,2,'Maximum number of items to display',NULL),(29,252,2,'Cache search',NULL),(31,254,2,'Close shop due to maintenance',NULL),(32,255,2,'IP excluded from closure',NULL),(35,270,2,'Number of tiers',NULL),(36,271,2,'Activate caching',NULL),(37,272,2,'Caching time',NULL),(38,274,2,'Maximum number of items to be compared',NULL),(43,286,2,'Items per page',NULL),(44,287,2,'Standard sorting of listings',NULL),(45,288,2,'Maximum number of pages per category',NULL),(46,289,2,'Number of days items are considered new',NULL),(47,290,2,'Number of days considered for top sellers',NULL),(48,291,2,'Number of top sellers for charts',NULL),(49,292,2,'Selection of items per page',NULL),(50,293,2,'Available listing layouts',NULL),(51,294,2,'Maximum number of items selectable via pull-down menu',NULL),(52,295,2,'Text for unavailable items',NULL),(53,296,2,'Number of similar items for cross selling',NULL),(54,297,2,'Number of items \"customers also bought\"',NULL),(55,298,2,'Standard template for new categories',NULL),(56,299,2,'Number of days to be considered for top seller creation',NULL),(57,300,2,'Number of automatically determined similar products (detail page)','If no similar articles are found, Shopware can automatically generates alternative suggestions. You can activate these suggestions if you enter a number greater than 0. May decrease performance when loading these articles.'),(58,301,2,'Show delivery time in shopping cart',NULL),(60,303,2,'Request form ID',NULL),(61,304,2,'Minimum shopping cart value for offering individual requests',NULL),(62,305,2,'Zoom viewer instead of light box on detail page ',NULL),(67,310,2,'Hide \"add to shopping cart\" option if item is out-of-stock','Customers can choose to be informed per email when an item is \"now in stock\".'),(68,311,2,'Display inventory shortages in shopping cart',NULL),(69,312,2,'Jump to detail if only one item is available',NULL),(71,314,2,'Available templates for detail page',NULL),(73,317,2,'Minimum password length (registration)',NULL),(74,318,2,'Standard payment method ID (registration)',NULL),(75,319,2,'Standard recipient group ID for registered customers (system / newsletter)',NULL),(76,320,2,'Generate customer numbers automatically',NULL),(77,321,2,'Deactivate AGB terms checkbox on checkout page',NULL),(78,322,2,'Display country and state fields in shipping address forms',NULL),(79,323,2,'Data protection conditions must be accepted via checkbox',NULL),(80,324,2,'Default payment method ID',NULL),(81,325,2,'Confirm customer email addresses','Customers must enter email addresses twice, in order to avoid typing mistakes.'),(82,326,2,'Check extended fields in newsletter registration',NULL),(83,327,2,'Deactivate \"no customer account\"',NULL),(84,585,2,'Exclude IP from statistics',NULL),(85,586,2,'Google Analytics ID',NULL),(86,587,2,'Google Conversion ID',NULL),(87,588,2,'Anonymous IP address',NULL),(88,589,2,'Cache controller/Times',NULL),(89,590,2,'NoCache Controller/Tags',NULL),(90,591,2,'Alternative Proxy URL',NULL),(91,592,2,'Admin view',NULL),(95,608,2,'Activate SQL injection protection',NULL),(96,609,2,'SQL injection filter',NULL),(97,610,2,'Activate XXS protection',NULL),(98,611,2,'XXS filter',NULL),(99,612,2,'Activate Remote File Inclusion protection',NULL),(100,613,2,'RemoteFileInclusion-filter',NULL),(101,614,2,'Vouchers designated as',NULL),(102,615,2,'Maximum search term length',NULL),(103,620,2,'Discounts designated as',NULL),(104,623,2,'Shortages designated as',NULL),(105,624,2,'Disable order confirmation to shop owner',NULL),(106,625,2,'Blacklist for keywords',NULL),(107,626,2,'Surcharges on payment methods designated as',NULL),(108,627,2,'Designation percentual deduction on payment method',NULL),(109,628,2,'Order number for discounts',NULL),(110,629,2,'Order  number for shortages',NULL),(111,630,2,'Surcharge on payment method',NULL),(112,631,2,'Number of live search results',NULL),(114,633,2,'Send registration confirmation to shop owner in CC',NULL),(115,634,2,'Double opt in for newsletter subscriptions',NULL),(116,635,2,'Double opt in for customer reviews',NULL),(117,636,2,'Order number for deduction dispatch rule',NULL),(118,637,2,'Deduction dispatch rule designated as',NULL),(119,641,2,'Order status - Changes to CC addresses',NULL),(120,642,2,'Extended SQL query',NULL),(121,643,2,'Block orders with no available shipping type',NULL),(122,646,2,'Only use lower case letters in URLs',NULL),(124,649,2,'Prepare meta description of categories / items',NULL),(125,650,2,'Remove Category ID from URL',NULL),(126,651,2,'SEO noindex queries',NULL),(127,652,2,'SEO noindex viewsports',NULL),(129,654,2,'Remove HTML comments',NULL),(130,655,2,'Query aliases',NULL),(131,656,2,'SEO follow backlinks',NULL),(133,658,2,'Last update',NULL),(134,659,2,'SEO URLs caching timetable',NULL),(140,665,2,'Mark VAT ID number as required for company customers',NULL),(142,667,2,'SEO URLs item template',NULL),(143,668,2,'SEO URLs category template',NULL),(145,670,2,'Other SEO URLs',NULL),(148,673,2,'Shop name',NULL),(149,674,2,'Shop owner email',NULL),(150,675,2,'Address',NULL),(152,677,2,'Bank account',NULL),(153,843,2,'Captcha font color (R,G,B)',NULL),(154,844,2,'Bot list',NULL),(155,845,2,'Version',NULL),(156,846,2,'Revision',NULL),(157,847,2,'Base file',NULL),(158,848,2,'ESD key',NULL),(159,849,2,'Available templates for blog detail page',NULL),(161,851,2,'Factor for accurate hits ',NULL),(162,852,2,'Last update',NULL),(163,853,2,'Factor for inaccurate hits ',NULL),(164,854,2,'Minimum relevance for top items (%)',NULL),(165,855,2,'Maximum distance allowed for partial names (%)',NULL),(166,856,2,'Factor for partial hits',NULL),(169,859,2,'Selection results per page',NULL),(170,860,2,'ESD-Min-Serials',NULL),(171,867,2,'Display \"customers also bought\" recommendations',NULL),(172,868,2,'Number of items per page in the list',NULL),(173,869,2,'Maximum number of pages in the list',NULL),(174,870,2,'Display \"customers also viewed\" recommendations',NULL),(175,871,2,'Number of items per page in the list',NULL),(176,872,2,'Maximum number of pages in the list',NULL),(177,873,2,'Display shop cancellation policy',NULL),(178,874,2,'Display newsletter registration',NULL),(179,875,2,'Display bank detail notice',NULL),(180,876,2,'Display further notices','Snippet: ConfirmTextOrderDefault'),(181,877,2,'Display further options','Add product, add voucher, comment function'),(182,878,2,'Show Bonus System (if installed)',NULL),(183,879,2,'Display \"free with purchase\" items',NULL),(184,880,2,'Display country descriptions',NULL),(185,881,2,'Display information for net orders',NULL),(189,885,2,'Template for essential characteristics',NULL),(190,886,2,'PHP timeout',NULL),(191,887,2,'Selectable languages ',NULL),(192,888,2,'SEO URLs blog template',NULL),(193,889,2,'Display item details in modal box',NULL),(195,891,2,'Show blog entries from category (ID) on starting page',NULL),(196,892,2,'Number of blog entries on starting page',NULL),(197,893,2,'Company',NULL),(198,894,2,'SEO URLs landing page template',NULL),(199,897,2,'All-inclusive surcharges on payment methods designated as',NULL),(200,898,2,'Order number for all-inclusive surcharges on payment methods designated as',NULL),(203,909,2,'Always display item descriptions in listing views','Affected views: Top seller, category listings, emotions'),(205,236,2,'Message ID hostname','Will be received in headers on a default HELO string. If not defined, the value returned from SERVER_NAME, \"localhost.localdomain\" will be used.'),(206,235,2,'Sending method','mail, SMTP or file'),(207,238,2,'Default port','Sets the default SMTP server port.'),(208,239,2,'Connection prefix','\"\", ssl, or tls'),(209,237,2,'Mail host','You can also specify a different port by using this format: [hostname:port] - e.g., smtp1.example.com:25'),(210,242,2,'Connection auth','plain, login or crammd5'),(211,240,2,'SMTP username',NULL),(212,241,2,'SMTP password',NULL),(213,901,2,'Own filter',NULL),(214,905,2,'Check current password at password-change requests',NULL),(215,900,2,'Number of mails sent per call',NULL),(216,938,2,' Release download with payment status','Define the payment status in which a download of ESD items is possible.'),(217,939,2,'Always display the article preview image','e.g. in listings or when using selection or picture configurator with no selected variant'),(218,940,2,'Send order mail',NULL),(219,0,2,'Force http canonical url',NULL),(220,942,2,'Treat phone field as required','Note that you must configure the asterisk indication in the snippet RegisterLabelPhone'),(222,910,2,'Password algorithm','With which algorithm should the password be encrypted?'),(223,911,2,'Live migration','Should available user passwords be rehashed with other algorithms on next login? This is done automatically in the background, so that passwords can be gradually converted to a new algorithm.'),(224,912,2,'Bcrypt iterations','The higher the number of iterations, the more difficult it is for a potential attacker to calculate the clear-text password for the encrypted password.'),(225,913,2,'Sha256 iterations','The higher the number of iterations, the more difficult it is for a potential attacker to calculate the clear-text password for the encrypted password.'),(226,933,2,'Admin view','Deactivate cache for item preview in express checkout'),(227,934,2,'Controller cache timeouts',NULL),(228,935,2,'Skip caching for controllers / tags',NULL),(229,936,2,'Alternative proxy URL','Prepend \"http://\" to HTTP proxy links'),(230,937,2,'Activate cache clearing','Enable automatic cache clearing.'),(232,943,2,'Creditor name','Name of the creditor to be included in the mandate.'),(233,944,2,'Header text','Header text of the mandate.'),(234,945,2,'Creditor number','Number of the creditor to be included in the mandate.'),(235,946,2,'Send email','Send email to the customer with the attached SEPA mandate file.'),(236,947,2,'Show SEPA\'s BIC field','Allow customer to specify its BIC when filling in SEPA payment data.'),(237,948,2,'Require SEPA\'s BIC field','Require customer to specify its BIC when filling in SEPA payment data. This option is ignored if the field is hidden.'),(238,949,2,'Show SEPA\'s bank name field','Allow customer to specify its bank name when filling in SEPA payment data.'),(239,950,2,'Require SEPA\'s bank name field','Require customer to specify its bank name when filling in SEPA payment data. This option is ignored if the field is hidden.'),(241,952,2,'Supplier SEO',NULL),(242,953,2,'Supplier SEO URLs template',NULL),(243,955,2,'Maximum age for referrer statistics','Old referrer data will be deleted by the cron job call if active'),(244,956,2,'Maximum age for impression statistics','Old impression data will be deleted by the cron job call if active'),(245,957,2,'Show recommend product',NULL),(246,941,2,'Force http canonical url','This option does not take effect if the option \"Use always SSL\" is activated.'),(247,958,2,'Storage period in days',NULL),(248,959,2,'Download strategy for ESD files','<b>Warning</b>: Changing this setting might break ESD downloads. If not sure, use default (PHP)<br><br>Strategy to generate the download links for ESD files. <br><b>Link</b>: Better performance, but possibly insecure <br><b>PHP</b>: More secure, but memory consuming, specially for bigger files <br><b>X-Sendfile</b>: Secure and lightweight, but requires X-Sendfile module and Apache2 web server <br><b>X-Accel</b>: Equivalent to X-Sendfile, but requires Nginx web server instead'),(249,965,1,'Feedback senden',NULL),(250,962,1,'Aktionscode',NULL),(251,961,1,'Update Kanal',NULL),(252,968,2,'Show phone number field',NULL),(253,969,2,'Password must be entered twice.','Password must be entered twice in order to avoid typing errors'),(254,970,2,'Show Birthday field',NULL),(255,971,2,'Birthday is required',NULL),(256,972,2,'Show additional address line 1',''),(257,973,2,'Show additional address line 2',''),(258,974,2,'Treat additional address line 1 as required',''),(259,975,2,'Treat additional address line 2 as required',''),(260,954,2,'Report errors to shop owner',NULL),(261,907,2,'Remove \"Shopware\" from URLs','Remove \"shopware.php\" from URLs. Prevents search engines from incorrectly identifying duplicate content in the shop. If mod_rewrite is not available in Apache, this option must be disabled.'),(262,927,2,'Move categories in batch mode',NULL),(263,980,2,'Show shipping fee calculation in shopping cart','If enabled, a shipping cost calculator will be displayed in the cart page. This is only available for customers who haven\'t logged in'),(264,981,2,'\"Page not found\" destination','When the user requests a non-existent page, he will be shown the following page.'),(265,982,2,'\"Page not found\" error code','HTTP code used in \"Page not found\" responses'),(266,983,2,'Show \"I am\" select field','If this option is false, all registrations will be done as a private customer.'),(267,984,2,'Shop is family friendly','Will set the meta tag \"isFamilyFriendly\" for search engines'),(268,985,2,'Custom site SEO URLs template',NULL),(269,986,2,'Form SEO URLs template',NULL),(270,976,1,'Anzahl der Produkte pro Queue-Request','Anzahl der Produkte, die je Request in den Queue geladen werden. Je größer die Zahl, desto länger dauern die Requests. Zu kleine Werte erhöhen den Overhead.'),(271,977,1,'Anzahl der Produkte pro Batch-Request','Anzahl der Produkte, die je Request verarbeitet werden. Je größer die Zahl, desto länger dauern die Requests. Zu kleine Werte erhöhen den Overhead.'),(272,978,1,'Rückgängig-Funktion aktivieren','Ermöglicht es, einzelne Mehrfach-Änderungen rückgängig zu machen. Diese Funktion ersetzt kein Backup.'),(273,979,1,'Automatische Cache-Invalidierung aktivieren','Invalidiert den Cache für jedes Produkt, das geändert wird. Bei vielen Produkten kann sich das negativ auf die Dauer des Vorgangs auswirken. Es wird daher empfohlen, den Cache nach Ende des Vorgangs manuell zu leeren.'),(274,992,2,'Product layout','Product layout allows you to control how your products are presented on the search result page. Choose between three different layouts to fine-tune your product display.'),(275,993,2,'Do not show on sale products that are out of stock ',NULL),(276,994,2,'Email header plaintext',NULL),(277,995,2,'Email footer plaintext',NULL),(278,996,2,'Email header HTML',NULL),(279,997,2,'Email footer HTML',NULL),(280,998,2,'Show instant downloads in account','Instant downloads can already be downloaded from the order details page.'),(281,999,2,'Run \'First run wizard\' on next backend execution',''),(282,1000,2,'Show checkbox for the right of revocations for ESD products',NULL),(283,1001,2,'Product free text field for service products',NULL),(284,1002,2,'Use prev/next-tag on paginated sites','If active, use prev/next-tag instead of the Canoncial-tag on paginated sites'),(285,1003,2,'Thumbnail noise filter','Produces clearer thumbnails. May increase thumbnail generation time.'),(286,1005,2,'Display related articles on \"Article not found\" page','If enabled, \"Article not found\" page will display related articles suggestions. Disable to use the standard \"Page not found\" page'),(287,1006,2,'Show zip code field before city field','Determines if the zip code field should be shown before or after the the city field. Only applicable for Shopware 5 themes'),(288,1008,2,'Generate mobile sitemap','If enabled, an additional sitemap.xml file will be generated with the site structure for mobile devices'),(289,1009,2,'Consider product minimum order quantity for cheapest price calculation',NULL),(290,1010,2,'Consider product graduatation for cheapest price calculation',NULL),(291,1013,2,'Use \"and\" search logic','The search will only return results that match all the search terms.'),(292,1014,2,'Always select payment method in checkout',NULL),(293,1015,2,'Ajax timeout','Defines the max execution time for ExtJS ajax requests (in seconds)'),(294,1016,2,'Available salutations','Allows to configure the available shop salutations in frontend registration and account. Inserted keys are generated automatically as snippet inside the frontend/salutation namespace.'),(295,1017,2,'Show title field',NULL),(296,1021,2,'Send confirmation email after registration',NULL),(297,1022,2,'Maximum number of items per page',NULL),(298,1023,2,'Use strip_tags globally','When activated, each form input in the frontend is filtered using strip_tags.');
/*!40000 ALTER TABLE `s_core_config_element_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_config_elements`
--

DROP TABLE IF EXISTS `s_core_config_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_config_elements` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `required` int(1) unsigned NOT NULL,
  `position` int(11) NOT NULL,
  `scope` int(11) unsigned NOT NULL,
  `options` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `form_id_2` (`form_id`,`name`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1024 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_config_elements`
--

LOCK TABLES `s_core_config_elements` WRITE;
/*!40000 ALTER TABLE `s_core_config_elements` DISABLE KEYS */;
INSERT INTO `s_core_config_elements` VALUES (186,86,'vouchertax','s:2:\"19\";','MwSt. Gutscheine',NULL,'text',0,0,0,NULL),(188,86,'discounttax','s:2:\"19\";','MwSt. Rabatte',NULL,'text',0,0,0,NULL),(189,90,'voteunlock','b:1;','Artikel-Bewertungen müssen freigeschaltet werden',NULL,'boolean',0,0,0,NULL),(190,84,'backendautoordernumber','b:1;','Automatischer Vorschlag der Artikelnummer',NULL,'boolean',0,0,0,NULL),(191,84,'backendautoordernumberprefix','s:2:\"SW\";','Präfix für automatisch generierte Artikelnummer',NULL,'text',0,0,0,NULL),(192,90,'votedisable','b:0;','Artikel-Bewertungen deaktivieren',NULL,'boolean',0,0,0,NULL),(193,90,'votesendcalling','b:1;','Automatische Erinnerung zur Artikelbewertung senden','Nach Kauf dem Benutzer an die Artikelbewertung via E-Mail erinnern','boolean',0,0,0,NULL),(194,90,'votecallingtime','s:1:\"1\";','Tage bis die Erinnerungs-E-Mail verschickt wird','Tage bis der Kunde via E-Mail an die Artikel-Bewertung erinnert wird','text',0,0,0,NULL),(195,86,'taxautomode','b:1;','Steuer für Rabatte dynamisch feststellen',NULL,'boolean',0,0,1,NULL),(224,102,'show','b:1;','Artikelverlauf anzeigen',NULL,'checkbox',0,0,1,'a:0:{}'),(225,102,'controller','s:61:\"index, listing, detail, custom, newsletter, sitemap, campaign\";','Controller-Auswahl',NULL,'text',0,0,1,'a:0:{}'),(231,102,'lastarticlestoshow','s:1:\"5\";','Anzahl Artikel in Verlauf (zuletzt angeschaut)',NULL,'text',0,0,0,NULL),(235,124,'mailer_mailer','s:4:\"mail\";','Methode zum Senden der Mail','mail, smtp oder file','text',0,0,1,NULL),(236,124,'mailer_hostname','s:0:\"\";','Hostname für die Message-ID','Wird im Header mittels HELO verwendet. Andernfalls wird der Wert aus SERVER_NAME oder \"localhost.localdomain\" genutzt.','text',0,0,1,NULL),(237,124,'mailer_host','s:9:\"localhost\";','Mail Host','Es kann auch ein anderer Port über dieses Muster genutzt werden: [hostname:port] - Bsp.: smtp1.example.com:25','text',0,0,1,NULL),(238,124,'mailer_port','s:2:\"25\";','Standard Port','Setzt den Standard SMTP Server-Port','text',0,0,1,NULL),(239,124,'mailer_smtpsecure','s:0:\"\";','Verbindungs Präfix','\"\", ssl, oder tls','text',0,0,1,NULL),(240,124,'mailer_username','s:0:\"\";','SMTP Benutzername',NULL,'text',0,0,1,NULL),(241,124,'mailer_password','s:0:\"\";','SMTP Passwort',NULL,'text',0,0,1,NULL),(242,124,'mailer_auth','s:0:\"\";','Verbindungs-Authentifizierung','plain, login oder crammd5','text',0,0,1,NULL),(252,0,'cachesearch','i:86400;','Cache Suche',NULL,'interval',0,0,0,NULL),(254,128,'setoffline','b:0;','Shop wegen Wartung sperren',NULL,'boolean',0,0,1,NULL),(255,128,'offlineip','s:1:\"0\";','Von der Sperrung ausgeschlossene IP',NULL,'text',0,0,1,NULL),(269,133,'show','i:1;','Menü zeigen',NULL,'checkbox',0,0,1,'a:0:{}'),(270,133,'levels','i:2;','Anzahl Ebenen',NULL,'text',0,0,1,'a:0:{}'),(271,133,'caching','i:1;','Caching aktivieren',NULL,'checkbox',0,0,0,'a:0:{}'),(272,133,'cachetime','i:86400;','Cachezeit',NULL,'interval',0,0,0,'a:0:{}'),(273,134,'compareShow','i:1;','Vergleich zeigen',NULL,'checkbox',0,0,1,'a:0:{}'),(274,134,'maxComparisons','i:5;','Maximale Anzahl von zu vergleichenden Artikeln',NULL,'number',0,0,1,'a:0:{}'),(286,144,'articlesperpage','s:2:\"12\";','Artikel pro Seite',NULL,'text',0,0,0,NULL),(288,144,'maxpages','s:1:\"8\";','Kategorien max. Anzahl Seiten',NULL,'text',0,0,0,NULL),(289,145,'markasnew','s:2:\"30\";','Artikel als neu markieren (Tage)',NULL,'text',0,0,0,NULL),(290,145,'markastopseller','s:2:\"30\";','Artikel als Topseller markieren (Verkäufe)',NULL,'text',0,0,0,NULL),(291,145,'chartrange','i:8;','Anzahl Topseller für Charts',NULL,'number',0,0,0,NULL),(292,144,'numberarticlestoshow','s:11:\"12|24|36|48\";','Auswahl Artikel pro Seite',NULL,'text',0,0,0,NULL),(293,144,'categorytemplates','s:0:\"\";','Verfügbare Listen Layouts',NULL,'textarea',0,0,0,NULL),(294,147,'maxpurchase','s:3:\"100\";','Max. wählbare Artikelmenge / Artikel über Pulldown-Menü',NULL,'text',0,0,0,NULL),(295,147,'notavailable','s:21:\"Lieferzeit ca. 5 Tage\";','Text für nicht verfügbare Artikel',NULL,'text',0,0,1,NULL),(296,146,'maxcrosssimilar','s:1:\"8\";','Anzahl ähnlicher Artikel Cross-Selling',NULL,'text',0,0,0,NULL),(297,146,'maxcrossalsobought','s:1:\"8\";','Anzahl \"Kunden kauften auch\" Artikel Cross-Selling',NULL,'text',0,0,0,NULL),(299,145,'chartinterval','s:2:\"10\";','Anzahl der Tage, die für die Topseller-Generierung berücksichtigt werden',NULL,'text',0,0,0,NULL),(300,146,'similarlimit','s:1:\"0\";','Anzahl automatisch ermittelter, ähnlicher Artikel (Detailseite)','Wenn keine ähnlichen Produkte gefunden wurden, kann Shopware automatisch alternative Vorschläge generieren. Sie können die automatischen Vorschläge aktivieren, indem Sie einen Wert größer als 0 eintragen. Das Aktivieren kann sich negativ auf die Performance des Shops auswirken.','text',0,0,0,NULL),(301,147,'basketshippinginfo','b:1;','Lieferzeit im Warenkorb anzeigen',NULL,'boolean',0,0,0,NULL),(303,147,'inquiryid','s:2:\"16\";','Anfrage-Formular ID',NULL,'text',0,0,1,NULL),(304,147,'inquiryvalue','s:3:\"150\";','Mind. Warenkorbwert ab dem die Möglichkeit der individuellen Anfrage angeboten wird',NULL,'text',0,0,0,NULL),(305,147,'usezoomplus','b:1;','Zoomviewer statt Lightbox auf Detailseite',NULL,'boolean',0,0,0,NULL),(310,147,'deactivatebasketonnotification','b:1;','Warenkorb bei E-Mail-Benachrichtigung ausblenden','Warenkorb bei aktivierter E-Mail-Benachrichtigung und nicht vorhandenem Lagerbestand ausblenden','boolean',0,0,0,NULL),(311,147,'instockinfo','b:0;','Lagerbestands-Unterschreitung im Warenkorb anzeigen',NULL,'boolean',0,0,0,NULL),(312,144,'categorydetaillink','b:0;','Direkt auf Detailspringen, falls nur ein Artikel vorhanden ist',NULL,'boolean',0,0,0,NULL),(314,147,'detailtemplates','s:9:\":Standard\";','Verfügbare Templates Detailseite',NULL,'textarea',0,0,0,NULL),(317,157,'minpassword','s:1:\"8\";','Mindestlänge Passwort (Registrierung)',NULL,'text',0,0,0,NULL),(318,157,'defaultpayment','s:1:\"5\";','Standardzahlungsart (Id) (Registrierung)',NULL,'select',1,0,1,'a:3:{s:5:\"store\";s:12:\"base.Payment\";s:12:\"displayField\";s:11:\"description\";s:10:\"valueField\";s:2:\"id\";}'),(319,157,'newsletterdefaultgroup','s:1:\"1\";','Standard-Empfangsgruppe (ID) für registrierte Kunden (System / Newsletter)',NULL,'text',0,0,1,NULL),(320,157,'shopwaremanagedcustomernumbers','b:1;','Shopware generiert Kundennummern',NULL,'boolean',0,0,0,NULL),(321,157,'ignoreagb','b:0;','AGB - Checkbox auf Kassenseite deaktivieren',NULL,'boolean',0,0,0,NULL),(322,157,'countryshipping','b:1;','Land / Bundesland bei Lieferadresse abfragen',NULL,'boolean',0,0,0,NULL),(323,157,'actdprcheck','b:0;','Datenschutz-Bedingungen müssen über Checkbox akzeptiert werden',NULL,'boolean',0,0,0,NULL),(324,157,'paymentdefault','s:1:\"5\";','Fallback-Zahlungsart (ID)',NULL,'text',0,0,0,NULL),(325,157,'doubleemailvalidation','b:0;','E-Mail Addresse muss zweimal eingegeben werden.','E-Mail Addresse muss zweimal eingegeben werden, um Tippfehler zu vermeiden.','boolean',0,0,0,NULL),(326,157,'newsletterextendedfields','b:1;','Erweiterte Felder in Newsletter-Registrierung abfragen',NULL,'boolean',0,0,1,NULL),(327,157,'noaccountdisable','b:0;','\"Kein Kundenkonto\" deaktivieren',NULL,'boolean',0,0,0,NULL),(585,173,'blockIp','N;','IP von Statistiken ausschließen',NULL,'text',0,0,1,'a:0:{}'),(608,189,'sql_protection','b:1;','SQL-Injection-Schutz aktivieren',NULL,'checkbox',0,0,0,'a:0:{}'),(610,189,'xss_protection','b:1;','XSS-Schutz aktivieren',NULL,'checkbox',0,0,0,'a:0:{}'),(612,189,'rfi_protection','b:1;','RemoteFileInclusion-Schutz aktivieren',NULL,'checkbox',0,0,0,'a:0:{}'),(614,0,'vouchername','s:9:\"Gutschein\";','Gutscheine Bezeichnung',NULL,'text',0,0,1,NULL),(615,190,'minsearchlenght','s:1:\"3\";','Minimale Suchwortlänge',NULL,'text',0,0,0,NULL),(620,0,'discountname','s:15:\"Warenkorbrabatt\";','Rabatte Bezeichnung ',NULL,'text',0,0,1,NULL),(623,0,'surchargename','s:20:\"Mindermengenzuschlag\";','Mindermengen Bezeichnung',NULL,'text',0,0,1,NULL),(624,192,'no_order_mail','b:0;','Bestellbestätigung an Shopbetreiber deaktivieren',NULL,'boolean',0,0,0,NULL),(625,190,'badwords','s:375:\"ab,die,der,und,in,zu,den,das,nicht,von,sie,ist,des,sich,mit,dem,dass,er,es,ein,ich,auf,so,eine,auch,als,an,nach,wie,im,für,einen,um,werden,mehr,zum,aus,ihrem,style,oder,neue,spieler,können,wird,sind,ihre,einem,of,du,sind,einer,über,alle,neuen,bei,durch,kann,hat,nur,noch,zur,gegen,bis,aber,haben,vor,seine,ihren,jetzt,ihr,dir,etc,bzw,nach,deine,the,warum,machen,0,sowie,am\";','Blacklist für Keywords',NULL,'text',1,0,0,NULL),(626,0,'paymentsurchargeadd','s:25:\"Zuschlag für Zahlungsart\";','Bezeichnung proz. Zuschlag für Zahlungsart',NULL,'text',0,0,1,NULL),(627,0,'paymentsurchargedev','s:25:\"Abschlag für Zahlungsart\";','Bezeichnung proz. Abschlag für Zahlungsart',NULL,'text',0,0,1,NULL),(628,191,'discountnumber','s:11:\"sw-discount\";','Rabatte Bestellnummer',NULL,'text',0,0,1,NULL),(629,191,'surchargenumber','s:12:\"sw-surcharge\";','Mindermengen Bestellnummer',NULL,'text',0,0,1,NULL),(630,191,'paymentsurchargenumber','s:10:\"sw-payment\";','Zuschlag für Zahlungsart (Bestellnummer)',NULL,'text',0,0,1,NULL),(631,190,'maxlivesearchresults','s:1:\"6\";','Anzahl der Ergebnisse in der Livesuche',NULL,'text',0,0,0,NULL),(633,192,'send_confirm_mail','b:1;','Registrierungsbestätigung in CC an Shopbetreiber schicken',NULL,'boolean',0,0,0,NULL),(634,192,'optinnewsletter','b:0;','Double-Opt-In für Newsletter-Anmeldungen',NULL,'boolean',0,0,0,NULL),(635,192,'optinvote','b:1;','Double-Opt-In für Artikel-Bewertungen',NULL,'boolean',0,0,0,NULL),(636,191,'shippingdiscountnumber','s:16:\"SHIPPINGDISCOUNT\";','Abschlag-Versandregel (Bestellnummer)',NULL,'text',0,0,1,NULL),(637,0,'shippingdiscountname','s:15:\"Warenkorbrabatt\";','Abschlag-Versandregel (Bezeichnung)',NULL,'text',0,0,1,NULL),(641,192,'orderstatemailack','s:0:\"\";','Bestellstatus - Änderungen CC-Adresse',NULL,'text',0,0,0,NULL),(642,247,'premiumshippiungasketselect','s:93:\"MAX(a.topseller) as has_topseller, MAX(at.attr3) as has_comment, MAX(b.esdarticle) as has_esd\";','Erweitere SQL-Abfrage',NULL,'text',1,0,0,NULL),(643,247,'premiumshippingnoorder','b:0;','Bestellung bei keiner verfügbaren Versandart blocken',NULL,'boolean',1,0,0,NULL),(646,249,'routertolower','b:1;','Nur Kleinbuchstaben in den Urls nutzen',NULL,'boolean',0,0,0,NULL),(649,249,'seometadescription','b:1;','Meta-Description von Artikel/Kategorien aufbereiten',NULL,'boolean',0,0,1,NULL),(650,249,'routerremovecategory','b:0;','KategorieID aus Url entfernen',NULL,'boolean',0,0,1,NULL),(651,249,'seoqueryblacklist','s:50:\"sPage,sPerPage,sSupplier,sFilterProperties,p,n,s,f\";','SEO-Noindex Querys',NULL,'text',0,0,0,NULL),(652,249,'seoviewportblacklist','s:112:\"login,ticket,tellafriend,note,support,basket,admin,registerFC,newsletter,search,search,account,checkout,register\";','SEO-Noindex Viewports',NULL,'text',0,0,0,NULL),(654,249,'seoremovecomments','b:1;','Html-Kommentare entfernen',NULL,'boolean',0,0,0,NULL),(655,249,'seoqueryalias','s:211:\"sSearch=q,\nsPage=p,\nsPerPage=n,\nsSupplier=s,\nsFilterProperties=f,\nsCategory=c,\nsCoreId=u,\nsTarget=t,\nsValidation=v,\nsTemplate=l,\npriceMin=min,\npriceMax=max,\nshippingFree=free,\nimmediateDelivery=delivery,\nsSort=o\";','Query-Aliase',NULL,'textarea',0,0,0,NULL),(656,249,'seobacklinkwhitelist','s:54:\"www.shopware.de,\r\nwww.shopware.ag,\r\nwww.shopware-ag.de\";','SEO-Follow Backlinks',NULL,'textarea',0,0,1,NULL),(658,249,'routerlastupdate',NULL,'Datum des letzten Updates',NULL,'datetime',0,0,1,NULL),(659,249,'routercache','s:5:\"86400\";','SEO-Urls Cachezeit Tabelle',NULL,'text',0,0,0,NULL),(665,157,'vatcheckrequired','b:0;','USt-IdNr. für Firmenkunden als Pflichtfeld markieren',NULL,'boolean',0,0,1,NULL),(667,249,'routerarticletemplate','s:70:\"{sCategoryPath articleID=$sArticle.id}/{$sArticle.id}/{$sArticle.name}\";','SEO-Urls Artikel-Template',NULL,'text',0,0,1,NULL),(668,249,'routercategorytemplate','s:41:\"{sCategoryPath categoryID=$sCategory.id}/\";','SEO-Urls Kategorie-Template',NULL,'text',0,0,1,NULL),(670,249,'seostaticurls',NULL,'sonstige SEO-Urls',NULL,'textarea',0,0,1,NULL),(673,119,'shopName','s:13:\"Shopware Demo\";','Name des Shops',NULL,'text',1,0,1,NULL),(674,119,'mail','s:16:\"info@example.com\";','Shopbetreiber E-Mail',NULL,'text',1,0,1,NULL),(675,119,'address','s:0:\"\";','Adresse',NULL,'textarea',0,0,1,NULL),(677,119,'bankAccount','s:0:\"\";','Bankverbindung',NULL,'textarea',0,0,1,NULL),(843,119,'captchaColor','s:8:\"51,51,51\";','Schriftfarbe Captcha (R,G,B)',NULL,'text',0,10,1,NULL),(844,173,'botBlackList','s:2768:\"antibot;appie;architext;bjaaland;digout4u;echo;fast-webcrawler;ferret;googlebot;gulliver;harvest;htdig;ia_archiver;jeeves;jennybot;linkwalker;lycos;mercator;moget;muscatferret;myweb;netcraft;nomad;petersnews;scooter;slurp;unlost_web_crawler;voila;voyager;webbase;weblayers;wget;wisenutbot;acme.spider;ahoythehomepagefinder;alkaline;arachnophilia;aretha;ariadne;arks;aspider;atn.txt;atomz;auresys;backrub;bigbrother;blackwidow;blindekuh;bloodhound;brightnet;bspider;cactvschemistryspider;cassandra;cgireader;checkbot;churl;cmc;collective;combine;conceptbot;coolbot;core;cosmos;cruiser;cusco;cyberspyder;deweb;dienstspider;digger;diibot;directhit;dnabot;download_express;dragonbot;dwcp;e-collector;ebiness;eit;elfinbot;emacs;emcspider;esther;evliyacelebi;nzexplorer;fdse;felix;fetchrover;fido;finnish;fireball;fouineur;francoroute;freecrawl;funnelweb;gama;gazz;gcreep;getbot;geturl;golem;grapnel;griffon;gromit;hambot;havindex;hometown;htmlgobble;hyperdecontextualizer;iajabot;ibm;iconoclast;ilse;imagelock;incywincy;informant;infoseek;infoseeksidewinder;infospider;inspectorwww;intelliagent;irobot;israelisearch;javabee;jbot;jcrawler;jobo;jobot;joebot;jubii;jumpstation;katipo;kdd;kilroy;ko_yappo_robot;labelgrabber.txt;larbin;linkidator;linkscan;lockon;logo_gif;macworm;magpie;marvin;mattie;mediafox;merzscope;meshexplorer;mindcrawler;momspider;monster;motor;mwdsearch;netcarta;netmechanic;netscoop;newscan-online;nhse;northstar;occam;octopus;openfind;orb_search;packrat;pageboy;parasite;patric;pegasus;perignator;perlcrawler;phantom;piltdownman;pimptrain;pioneer;pitkow;pjspider;pka;plumtreewebaccessor;poppi;portalb;puu;python;raven;rbse;resumerobot;rhcs;roadrunner;robbie;robi;robofox;robozilla;roverbot;rules;safetynetrobot;search_au;searchprocess;senrigan;sgscout;shaggy;shaihulud;sift;simbot;site-valet;sitegrabber;sitetech;slcrawler;smartspider;snooper;solbot;spanner;speedy;spider_monkey;spiderbot;spiderline;spiderman;spiderview;spry;ssearcher;suke;suntek;sven;tach_bw;tarantula;tarspider;techbot;templeton;teoma_agent1;titin;titan;tkwww;tlspider;ucsd;udmsearch;urlck;valkyrie;victoria;visionsearch;vwbot;w3index;w3m2;wallpaper;wanderer;wapspider;webbandit;webcatcher;webcopy;webfetcher;webfoot;weblinker;webmirror;webmoose;webquest;webreader;webreaper;websnarf;webspider;webvac;webwalk;webwalker;webwatch;whatuseek;whowhere;wired-digital;wmir;wolp;wombat;worm;wwwc;wz101;xget;awbot;bobby;boris;bumblebee;cscrawler;daviesbot;ezresult;gigabot;gnodspider;internetseer;justview;linkbot;linkchecker;nederland.zoek;perman;pompos;pooodle;redalert;shoutcast;slysearch;ultraseek;webcompass;yandex;robot;yahoo;bot;psbot;crawl;RSS;larbin;ichiro;Slurp;msnbot;bot;Googlebot;ShopWiki;Bot;WebAlta;;abachobot;architext;ask jeeves;frooglebot;googlebot;lycos;spider;HTTPClient\";','Bot-Liste',NULL,'textarea',1,20,0,NULL),(847,78,'baseFile','s:12:\"shopware.php\";','Base-File',NULL,'text',1,0,0,NULL),(848,253,'esdKey','s:33:\"552211cce724117c3178e3d22bec532ec\";','ESD-Key',NULL,'text',1,0,0,NULL),(849,147,'blogdetailtemplates','s:10:\":Standard;\";','Verfügbare Templates Blog-Detailseite',NULL,'textarea',0,0,0,NULL),(851,190,'fuzzysearchexactmatchfactor','i:100;','Faktor für genaue Treffer',NULL,'number',1,0,1,NULL),(852,190,'fuzzysearchlastupdate','s:19:\"2010-01-01 00:00:00\";','Datum des letzten Updates',NULL,'datetime',0,0,0,NULL),(853,190,'fuzzysearchmatchfactor','i:5;','Faktor für unscharfe Treffer',NULL,'number',1,0,1,NULL),(854,190,'fuzzysearchmindistancentop','i:20;','Minimale Relevanz zum Topartikel in Prozent',NULL,'number',1,0,1,NULL),(855,190,'fuzzysearchpartnamedistancen','i:25;','Maximal-Distanz für Teilnamen in Prozent',NULL,'number',1,0,1,NULL),(856,190,'fuzzysearchpatternmatchfactor','i:50;','Faktor für Teiltreffer',NULL,'number',1,0,1,NULL),(859,190,'fuzzysearchselectperpage','s:11:\"12|24|36|48\";','Auswahl Ergebnisse pro Seite',NULL,'text',1,0,1,NULL),(860,253,'esdMinSerials','i:5;','ESD-Min-Serials',NULL,'text',1,0,0,NULL),(867,255,'alsoBoughtShow','b:1;','Anzeigen der Kunden-kauften-auch-Empfehlung',NULL,'checkbox',1,1,1,NULL),(868,255,'alsoBoughtPerPage','i:4;','Anzahl an Artikel pro Seite in der Liste',NULL,'number',1,2,1,NULL),(869,255,'alsoBoughtMaxPages','i:10;','Maximale Anzahl von Seiten in der Liste',NULL,'number',1,3,1,NULL),(870,255,'similarViewedShow','b:1;','Anzeigen der Kunden-schauten-sich-auch-an-Empfehlung',NULL,'checkbox',1,5,1,NULL),(871,255,'similarViewedPerPage','i:4;','Anzahl an Artikel pro Seite in der Liste',NULL,'number',1,6,1,NULL),(872,255,'similarViewedMaxPages','i:10;','Maximale Anzahl von Seiten in der Liste',NULL,'number',1,7,1,NULL),(873,256,'revocationNotice','b:1;','Zeige Widerrufsbelehrung an',NULL,'boolean',0,0,1,'a:0:{}'),(874,256,'newsletter','b:0;','Zeige Newsletter-Registrierung an',NULL,'boolean',0,0,1,'a:0:{}'),(875,256,'bankConnection','b:0;','Zeige Bankverbindungshinweis an',NULL,'boolean',0,0,1,'a:0:{}'),(876,256,'additionalFreeText','b:0;','Zeige weiteren Hinweis an','Snippet: ConfirmTextOrderDefault','boolean',0,0,1,'a:0:{}'),(877,256,'commentVoucherArticle','b:0;','Zeige weitere Optionen an','Artikel hinzuf&uuml;gen, Gutschein hinzuf&uuml;gen, Kommentarfunktion','boolean',0,0,1,'a:0:{}'),(879,256,'premiumArticles','b:0;','Zeige Prämienartikel an',NULL,'boolean',0,0,1,'a:0:{}'),(880,256,'countryNotice','b:1;','Zeige Länder-Beschreibung an',NULL,'boolean',0,0,1,'a:0:{}'),(881,256,'nettoNotice','b:0;','Zeige Hinweis für Netto-Bestellungen an',NULL,'boolean',0,0,1,'a:0:{}'),(885,256,'mainFeatures','s:290:\"{if $sBasketItem.additional_details.properties}\n    {$sBasketItem.additional_details.properties}\n{elseif $sBasketItem.additional_details.description}\n    {$sBasketItem.additional_details.description}\n{else}\n    {$sBasketItem.additional_details.description_long|strip_tags|truncate:50}\n{/if}\";','Template für die wesentliche Merkmale',NULL,'textarea',0,1,1,'a:0:{}'),(886,259,'backendTimeout','i:7200;','PHP Timeout',NULL,'interval',1,0,0,'a:0:{}'),(887,259,'backendLocales','a:2:{i:0;i:1;i:1;i:2;}','Auswählbare Sprachen',NULL,'select',1,0,0,'a:2:{s:5:\"store\";s:11:\"base.Locale\";s:11:\"multiSelect\";b:1;}'),(888,249,'routerblogtemplate','s:71:\"{sCategoryPath categoryID=$blogArticle.categoryId}/{$blogArticle.title}\";','SEO-Urls Blog-Template',NULL,'text',0,0,1,NULL),(889,256,'detailModal','b:1;','Artikeldetails in Modalbox anzeigen',NULL,'boolean',0,0,1,NULL),(891,144,'blogcategory','s:0:\"\";','Blog-Einträge aus Kategorie (ID) auf Startseite anzeigen (Nur alte Templatebasis)','','text',0,0,1,NULL),(892,144,'bloglimit','s:1:\"3\";','Anzahl Blog-Einträge auf Startseite','','text',0,0,1,NULL),(893,119,'company','s:0:\"\";','Firma',NULL,'textfield',0,0,1,NULL),(894,249,'routercampaigntemplate','s:64:\"{sCategoryPath categoryID=$campaign.categoryId}/{$campaign.name}\";','SEO-Urls Landingpage-Template',NULL,'text',0,0,1,NULL),(897,0,'paymentSurchargeAbsolute','s:25:\"Zuschlag für Zahlungsart\";','Pauschaler Aufschlag für Zahlungsart (Bezeichnung)',NULL,'text',1,0,1,NULL),(898,191,'paymentSurchargeAbsoluteNumber','s:19:\"sw-payment-absolute\";','Pauschaler Aufschlag für Zahlungsart (Bestellnummer)',NULL,'text',1,0,1,NULL),(900,263,'MailCampaignsPerCall','i:1000;','Anzahl der Mails, die pro Cronjob-Aufruf versendet werden',NULL,'number',1,0,0,NULL),(901,189,'own_filter','N;','Eigener Filter',NULL,'textarea',0,0,0,NULL),(905,157,'accountPasswordCheck','b:1;','Aktuelles Passwort bei Passwort-Änderungen abfragen',NULL,'boolean',1,0,0,NULL),(907,249,'preferBasePath','b:1;','Shopware-Kernel aus URL entfernen ','Entfernt \"shopware.php\" aus URLs. Verhindert, dass Suchmaschinen fälschlicherweise DuplicateContent im Shop erkennen. Wenn kein ModRewrite zur Verfügung steht, muss dieses Häcken entfernt werden.','boolean',1,0,0,NULL),(909,264,'useShortDescriptionInListing','b:0;','In Listen-Ansichten immer die Artikel-Kurzbeschreibung anzeigen','Beeinflusst: Topseller, Kategorielisten, Einkaufswelten','checkbox',0,0,0,NULL),(910,265,'defaultPasswordEncoder','s:4:\"Auto\";','Passwort-Algorithmus','Mit welchem Algorithmus sollen die Passwörter verschlüsselt werden?','combo',1,0,0,'a:5:{s:8:\"editable\";b:0;s:10:\"valueField\";s:2:\"id\";s:12:\"displayField\";s:2:\"id\";s:13:\"triggerAction\";s:3:\"all\";s:5:\"store\";s:20:\"base.PasswordEncoder\";}'),(911,265,'liveMigration','i:1;','Live Migration','Sollen vorhandene Benutzer-Passwörter mit anderen Passwort-Algorithmen beim nächsten Einloggen erneut gehasht werden? Das geschieht voll automatisch im Hintergrund, so dass die Passwörter sukzessiv auf einen neuen Algorithmus umgestellt werden können.','checkbox',1,0,0,NULL),(912,265,'bcryptCost','i:10;','Bcrypt-Rechenaufwand','Je höher der Rechenaufwand, desto aufwändiger ist es für einen möglichen Angreifer, ein Klartext-Passwort für das verschlüsselte Passwort zu berechnen.','number',1,0,0,'a:2:{s:8:\"minValue\";s:1:\"4\";s:8:\"maxValue\";s:2:\"31\";}'),(913,265,'sha256iterations','i:100000;','Sha256-Iterationen','Je höher der Rechenaufwand, desto aufwändiger ist es für einen möglichen Angreifer, ein Klartext-Passwort für das verschlüsselte Passwort zu berechnen.','number',1,0,0,'a:2:{s:8:\"minValue\";s:1:\"1\";s:8:\"maxValue\";s:7:\"1000000\";}'),(914,0,'topSellerActive','i:1;','','','',1,0,0,''),(915,0,'topSellerValidationTime','i:100;','','','',1,0,0,''),(916,0,'topSellerRefreshStrategy','i:3;','','','',1,0,0,''),(917,0,'topSellerPseudoSales','i:1;','','','',1,0,0,''),(918,0,'seoRefreshStrategy','i:3;','','','',1,0,0,''),(919,0,'searchRefreshStrategy','i:3;','','','',1,0,0,''),(920,0,'showSupplierInCategories','i:1;','','','',1,0,0,''),(922,0,'disableShopwareStatistics','i:0;','','','',1,0,0,''),(923,0,'disableArticleNavigation','i:0;','','','',1,0,0,''),(924,0,'similarRefreshStrategy','i:3;','','','',1,0,0,''),(925,0,'similarActive','i:1;','','','',1,0,0,''),(926,0,'similarValidationTime','i:100;','','','',1,0,0,''),(927,144,'moveBatchModeEnabled','b:0;','Kategorien im Batch-Modus verschieben',NULL,'checkbox',0,0,0,'a:0:{}'),(928,0,'traceSearch','i:1;','','','',1,0,0,''),(930,0,'displayFiltersInListings','i:1;','','','boolean',1,0,0,''),(933,266,'admin','b:0;','Admin-View','Cache bei Artikel-Vorschau und Schnellbestellung deaktivieren','boolean',0,0,0,'a:0:{}'),(934,266,'cacheControllers','s:334:\"frontend/listing 3600\nfrontend/index 3600\nfrontend/detail 3600\nfrontend/campaign 14400\nwidgets/listing 14400\nfrontend/custom 14400\nfrontend/sitemap 14400\nfrontend/blog 14400\nwidgets/index 3600\nwidgets/checkout 3600\nwidgets/compare 3600\nwidgets/emotion 14400\nwidgets/recommendation 14400\nwidgets/lastArticles 3600\nwidgets/campaign 3600\";','Cache-Controller / Zeiten',NULL,'textarea',0,0,0,'a:0:{}'),(935,266,'noCacheControllers','s:188:\"frontend/listing price\nfrontend/index price\nfrontend/detail price\nwidgets/lastArticles detail\nwidgets/checkout checkout\nwidgets/compare compare\nwidgets/emotion price\nwidgets/listing price\n\";','NoCache-Controller / Tags',NULL,'textarea',0,0,0,'a:0:{}'),(936,266,'proxy','N;','Alternative Proxy-Url','Link zum Http-Proxy mit „http://“ am Anfang.','text',0,0,0,'a:0:{}'),(937,266,'proxyPrune','b:1;','Proxy-Prune aktivieren','Das automatische Leeren des Caches aktivieren.','boolean',0,0,0,'a:0:{}'),(938,253,'downloadAvailablePaymentStatus','a:1:{i:0;i:12;}','Download freigeben bei Zahlstatus','Definieren Sie hier die Zahlstatus bei dem ein Download des ESD-Artikels möglich ist.','select',1,3,0,'a:4:{s:5:\"store\";s:18:\"base.PaymentStatus\";s:12:\"displayField\";s:11:\"description\";s:10:\"valueField\";s:2:\"id\";s:11:\"multiSelect\";b:1;}'),(939,144,'forceArticleMainImageInListing','b:0;','Immer das Artikel-Vorschaubild anzeigen','z.B. im Listing oder beim Auswahl- und Bildkonfigurator ohne ausgewählte Variante','checkbox',0,0,0,'a:0:{}'),(940,256,'sendOrderMail','b:1;','Bestell-Abschluss-E-Mail versenden',NULL,'checkbox',0,0,1,'a:0:{}'),(941,249,'forceCanonicalHttp','b:1;','Canonical immer mit HTTP','Diese Option greift nicht, wenn die Option \"Überall SSL verwenden\" aktiviert ist.','boolean',0,0,1,NULL),(942,157,'requirePhoneField','b:0;','Telefon als Pflichtfeld behandeln','Beachten Sie, dass Sie die Sternchenangabe über den Textbaustein RegisterLabelPhone konfigurieren müssen','checkbox',0,0,1,'a:0:{}'),(943,267,'sepaCompany','s:0:\"\";','Firmenname',NULL,'text',0,1,1,NULL),(944,267,'sepaHeaderText','s:0:\"\";','Überschrift',NULL,'text',0,2,1,NULL),(945,267,'sepaSellerId','s:0:\"\";','Gläubiger-Identifikationsnummer',NULL,'text',0,3,1,NULL),(946,267,'sepaSendEmail','i:1;','SEPA Mandat automatisch versenden',NULL,'checkbox',0,4,1,NULL),(947,267,'sepaShowBic','i:1;','SEPA BIC Feld anzeigen',NULL,'checkbox',0,5,1,NULL),(948,267,'sepaRequireBic','i:1;','SEPA BIC Feld erforderlich',NULL,'checkbox',0,6,1,NULL),(949,267,'sepaShowBankName','i:1;','SEPA Kreditinstitut Feld anzeigen',NULL,'checkbox',0,7,1,NULL),(950,267,'sepaRequireBankName','i:1;','SEPA Kreditinstitut Feld erforderlich',NULL,'checkbox',0,8,1,NULL),(952,249,'seoSupplier','b:1;','Hersteller SEO-Informationen anwenden',NULL,'checkbox',0,0,1,'a:0:{}'),(953,249,'seoSupplierRouteTemplate','s:46:\"{createSupplierPath supplierID=$sSupplier.id}/\";','SEO-Urls Hersteller-Template',NULL,'text',0,0,1,'a:0:{}'),(954,268,'logMail','i:0;','Fehler an Shopbetreiber senden',NULL,'checkbox',0,0,0,'a:0:{}'),(955,173,'maximumReferrerAge','s:2:\"90\";','Maximales Alter für Referrer Statistikdaten','Alte Referrer Daten werden über den Aufräumen Cronjob gelöscht, falls aktiv','text',0,0,1,'a:0:{}'),(956,173,'maximumImpressionAge','s:2:\"90\";','Maximales Alter für Artikel-Impressions','Alte Impression Daten werden über den Aufräumen Cronjob gelöscht, falls aktiv','text',0,0,1,'a:0:{}'),(957,255,'showTellAFriend','b:0;','Artikel weiterempfehlen anzeigen',NULL,'boolean',0,7,1,NULL),(958,102,'time','i:15;','Speicherfrist in Tagen',NULL,'number',0,0,0,'a:0:{}'),(959,253,'esdDownloadStrategy','i:1;','Downloadoption für ESD Dateien','<b>Achtung</b>: Diese Einstellung könnte die Funktionalität der ESD Downloads beeinträchtigen. Ändern Sie hier nur die Einstellung falls Sie wissen, was Sie tun.<br><br>Downloadstrategie für ESD Dateien.<br><b>Link</b>: Unter umständen Unsicher, da der Link von Außen eingesehen werden kann.<br><b>PHP</b>: Der Link kann nicht eingesehen werden. PHP liefert die Datei aus. Dies kann zu Problemen bei größeren Dateien führen.<br><b>X-Sendfile</b>: Unterstütz größere Dateien und ist sicher. Benötigt das X-Sendfile Apache Module. <br><b>X-Accel</b>: Äquivalent zum X-Sendfile. Benötigt das Nginx Modul X-Accel.','select',1,4,0,'a:1:{s:5:\"store\";a:4:{i:0;a:2:{i:0;i:0;i:1;s:4:\"Link\";}i:1;a:2:{i:0;i:1;i:1;s:3:\"PHP\";}i:2;a:2:{i:0;i:2;i:1;s:20:\"X-Sendfile (Apache2)\";}i:3;a:2:{i:0;i:3;i:1;s:15:\"X-Accel (Nginx)\";}}}'),(960,269,'update-api-endpoint','s:34:\"http://update-api.shopware.com/v1/\";','API Endpoint',NULL,'text',1,0,0,'a:1:{s:6:\"hidden\";b:1;}'),(961,269,'update-channel','s:6:\"stable\";','Channel',NULL,'select',0,0,0,'a:1:{s:5:\"store\";a:4:{i:0;a:2:{i:0;s:6:\"stable\";i:1;s:6:\"stable\";}i:1;a:2:{i:0;s:4:\"beta\";i:1;s:4:\"beta\";}i:2;a:2:{i:0;s:2:\"rc\";i:1;s:2:\"rc\";}i:3;a:2:{i:0;s:3:\"dev\";i:1;s:3:\"dev\";}}}'),(962,269,'update-code','s:0:\"\";','Code',NULL,'text',0,0,0,'a:0:{}'),(963,269,'update-fake-version','N;','Fake Version',NULL,'text',0,0,0,'a:1:{s:6:\"hidden\";b:1;}'),(964,269,'update-feedback-api-endpoint','s:43:\"http://feedback.update-api.shopware.com/v1/\";','Feedback API Endpoint',NULL,'text',1,0,0,'a:1:{s:6:\"hidden\";b:1;}'),(965,269,'update-send-feedback','b:1;','Send feedback',NULL,'boolean',0,0,0,'a:0:{}'),(966,269,'trackingUniqueId','s:0:\"\";','Unique identifier',NULL,'text',0,0,0,'a:1:{s:6:\"hidden\";b:1;}'),(967,269,'update-verify-signature','b:1;','Verify Signature',NULL,'boolean',0,0,0,'a:1:{s:6:\"hidden\";b:1;}'),(968,157,'showphonenumberfield','b:0;','Telefon anzeigen',NULL,'checkbox',0,0,1,'a:0:{}'),(969,157,'doublepasswordvalidation','b:0;','Passwort muss zweimal eingegeben werden','Passwort muss zweimal angegeben werden, um Tippfehler zu vermeiden.','checkbox',0,0,1,'a:0:{}'),(970,157,'showbirthdayfield','b:0;','Geburtstag anzeigen',NULL,'checkbox',0,0,1,'a:0:{}'),(971,157,'requirebirthdayfield','b:0;','Geburtstag als Pflichtfeld behandeln',NULL,'checkbox',0,0,1,'a:0:{}'),(972,157,'showAdditionAddressLine1','b:0;','Adresszusatzzeile 1 anzeigen','','checkbox',0,0,1,'a:0:{}'),(973,157,'showAdditionAddressLine2','b:0;','Adresszusatzzeile 2 anzeigen','','checkbox',0,0,1,'a:0:{}'),(974,157,'requireAdditionAddressLine1','b:0;','Adresszusatzzeile 1 als Pflichtfeld behandeln','','checkbox',0,0,1,'a:0:{}'),(975,157,'requireAdditionAddressLine2','b:0;','Adresszusatzzeile 2 als Pflichtfeld behandeln','','checkbox',0,0,1,'a:0:{}'),(976,270,'addToQueuePerRequest','i:2048;','Number of products per queue request','The number of products, you want to add to queue per request. The higher the value, the longer a request will take. Too low values will result in overhead','number',1,0,0,'a:1:{s:10:\"attributes\";a:1:{s:8:\"minValue\";i:100;}}'),(977,270,'batchItemsPerRequest','i:2048;','Products per batch request','The number of products, you want to be processed per request. The higher the value, the longer a request will take. Too low values will result in overhead','number',1,0,0,'a:1:{s:10:\"attributes\";a:1:{s:8:\"minValue\";i:50;}}'),(978,270,'enableBackup','b:1;','Enable restore feature','Enable the restore feature.','checkbox',0,0,0,'a:0:{}'),(979,270,'clearCache','b:0;','Invalidate products in batch mode','Will clear the cache for any product, which was changed in batch mode. When changing many products, this will be quite slow. Its recommended to clear the cache manually afterwards.','checkbox',0,0,0,'a:0:{}'),(980,147,'basketShowCalculation','b:1;','Versandkostenberechnung im Warenkob anzeigen','Bei aktivierter Einstellung wird ein Versandkostenrechner auf der Warenkorbseite dargestellt. Diese Funktion ist nur für nicht angemeldete Kunden verfügbar.','boolean',0,0,1,NULL),(981,249,'PageNotFoundDestination','i:-2;','\"Seite nicht gefunden\" Ziel','Wenn der Besucher eine nicht existierende Seite aufruft, wird ihm diese angezeigt.','select',1,0,1,'a:5:{s:5:\"store\";s:35:\"base.PageNotFoundDestinationOptions\";s:12:\"displayField\";s:4:\"name\";s:10:\"valueField\";s:2:\"id\";s:10:\"allowBlank\";b:0;s:8:\"pageSize\";i:25;}'),(982,249,'PageNotFoundCode','i:404;','\"Seite nicht gefunden\" Fehlercode','Übertragener HTTP Statuscode bei \"Seite nicht gefunden\" meldungen','number',1,0,1,NULL),(983,157,'showCompanySelectField','b:1;','\"Ich bin\" Auswahlfeld anzeigen','Wenn das Auswahlfeld nicht angezeigt wird, wird die Registrierung immer als Privatkunde durchgeführt.','checkbox',1,0,1,'a:0:{}'),(984,119,'metaIsFamilyFriendly','b:1;','Shop ist familienfreundlich','Setzt den Metatag \"isFamilyFriendly\" für Suchmaschinen','checkbox',0,0,1,'a:0:{}'),(985,249,'seoCustomSiteRouteTemplate','s:19:\"{$site.description}\";','SEO-Urls Shopseiten Template',NULL,'text',0,0,1,'a:0:{}'),(986,249,'seoFormRouteTemplate','s:12:\"{$form.name}\";','SEO-Urls Formular Template',NULL,'text',0,0,1,'a:0:{}'),(987,0,'showImmediateDeliveryFacet','i:1;','','','boolean',1,0,0,NULL),(988,0,'showShippingFreeFacet','i:1;','','','boolean',1,0,0,NULL),(989,0,'showPriceFacet','i:1;','','','boolean',1,0,0,NULL),(990,0,'showVoteAverageFacet','i:1;','','','boolean',1,0,0,NULL),(991,0,'defaultListingSorting','i:1;','','','',1,0,0,NULL),(992,190,'searchProductBoxLayout','s:5:\"basic\";','Produkt Layout','Mit Hilfe des Produkt Layouts können Sie entscheiden, wie Ihre Produkte auf der Suchergebnis-Seite dargestellt werden sollen. Wählen Sie eines der drei unterschiedlichen Layouts um die Ansicht perfekt auf Ihr Produktsortiment abzustimmen.','product-box-layout-select',0,0,1,NULL),(993,147,'hideNoInStock','b:0;','Abverkaufsartikel ohne Lagerbestand ausblenden',NULL,'checkbox',0,0,0,NULL),(994,192,'emailheaderplain','s:0:\"\";','E-Mail Header Plaintext',NULL,'textarea',0,0,1,NULL),(995,192,'emailfooterplain','s:64:\"\nMit freundlichen Grüßen,\n\nIhr Team von {config name=shopName}\";','E-Mail Footer Plaintext',NULL,'textarea',0,0,1,NULL),(996,192,'emailheaderhtml','s:121:\"<div>\n<img src=\"{$sShopURL}/themes/Frontend/Responsive/frontend/_public/src/img/logos/logo--tablet.png\" alt=\"Logo\"><br />\";','E-Mail Header HTML',NULL,'textarea',0,0,1,NULL),(997,192,'emailfooterhtml','s:85:\"<br/>\nMit freundlichen Grüßen,<br/><br/>\n\nIhr Team von {config name=shopName}</div>\";','E-Mail Footer HTML',NULL,'textarea',0,0,1,NULL),(998,253,'showEsd','b:1;','Sofortdownloads im Account anzeigen','Sofortdownloads können weiterhin über die Bestellübersicht heruntergeladen werden.','boolean',1,5,1,NULL),(999,259,'firstRunWizardEnabled','b:1;','\'First Run Wizard\' beim Aufruf des Backends starten',NULL,'checkbox',0,0,0,NULL),(1000,256,'showEsdWarning','b:1;','Checkbox zum Widerrufsrecht bei ESD Artikeln anzeigen',NULL,'boolean',0,0,1,'a:0:{}'),(1001,256,'serviceAttrField','s:0:\"\";','Artikel-Freitextfeld für Dienstleistungsartikel',NULL,'text',0,0,1,'a:0:{}'),(1002,249,'seoIndexPaginationLinks','b:0;','prev/next-Tag auf paginierten Seiten benutzen','Wenn aktiv, wird auf paginierten Seiten anstatt des Canoncial-Tags der prev/next-Tag benutzt.','checkbox',0,0,0,'a:0:{}'),(1003,271,'thumbnailNoiseFilter','b:0;','Rauschfilterung bei Thumbnails','Filtert beim Generieren der Thumbnails Bildfehler heraus. Achtung! Bei aktivierter Option kann das Generieren der Thumbnails wesentlich länger dauern','checkbox',0,0,0,'a:0:{}'),(1004,0,'tokenSecret','s:0:\"\";','Secret für die API Kommunikation',NULL,'text',0,0,0,NULL),(1005,249,'RelatedArticlesOnArticleNotFound','b:1;','Zeige ähnliche Artikel auf der \"Artikel nicht gefunden\" Seite an','Wenn aktiviert, zeigt die \"Artikel nicht gefunden\" Seite die ähnlichen Artikel Vorschläge an. Deaktivieren Sie diese Einstellung um die Standard \"Seite nicht gefunden\" Seite darzustellen.','boolean',1,0,1,''),(1006,157,'showZipBeforeCity','b:1;','PLZ vor dem Stadtfeld anzeigen','Legt fest ob die PLZ vor oder nach der Stadt angezeigt werden soll. Nur für Shopware 5 Themes.','checkbox',0,0,1,'a:0:{}'),(1007,0,'updateWizardStarted','b:1;','','','checkbox',0,0,1,NULL),(1008,272,'mobileSitemap','b:1;','Mobile Sitemap generieren','Wenn diese Option aktiviert ist, wird eine zusätzliche sitemap.xml mit der Struktur für mobile Endgeräte generiert.','boolean',1,1,0,NULL),(1009,144,'calculateCheapestPriceWithMinPurchase','b:0;','Mindestabnahme bei der Günstigsten-Preis-Berechnung berücksichtigen',NULL,'checkbox',0,0,1,NULL),(1010,144,'useLastGraduationForCheapestPrice','b:0;','Staffelpreise in der Günstigsten Preis Berechnung berücksichtigen',NULL,'checkbox',0,0,1,NULL),(1011,0,'lastBacklogId','i:0;','','Last processed backlog id','',0,0,0,NULL),(1012,190,'activateNumberSearch','i:1;','Nummern Suche aktivieren',NULL,'checkbox',1,0,0,NULL),(1013,190,'enableAndSearchLogic','b:0;','\"Und\" Suchlogik verwenden','Die Suche zeigt nur Treffer an, in denen alle Suchbegriffe vorkommen.','checkbox',0,0,1,NULL),(1014,256,'always_select_payment','b:0;','Zahlungsart bei Bestellung immer auswählen',NULL,'boolean',0,0,1,NULL),(1015,259,'ajaxTimeout','i:30;','Ajax Timeout','Definiert die maximale Ausführungszeit für ExtJS Ajax Requests (in Sekunden)','number',1,0,0,'a:1:{s:8:\"minValue\";i:6;}'),(1016,157,'shopsalutations','s:5:\"mr,ms\";','Verfügbare Anreden','Ermöglicht die Konfiguration welche Anreden in diesem Shop zur Verfügung stehen. Die hier definierten Keys werden automatisch als Textbaustein unter dem Namespace frontend/salutation angelegt und können dort übersetzt werden.','text',0,0,1,NULL),(1017,157,'displayprofiletitle','b:0;','Titel Feld anzeigen',NULL,'boolean',0,0,1,NULL),(1018,0,'installationDate','s:16:\"2017-02-27 15:41\";','Installationsdatum',NULL,'text',0,0,0,NULL),(1019,0,'installationSurvey','b:1;','Umfrage zur Installation',NULL,'boolean',0,0,0,NULL),(1020,0,'assetTimestamp','i:0;','','Cache invalidation timestamp for assets','',0,0,1,NULL),(1021,157,'sendRegisterConfirmation','b:1;','Bestätigungsmail nach Registrierung verschicken',NULL,'boolean',0,0,0,NULL),(1022,144,'maxStoreFrontLimit','i:100;','Maximale Anzahl Produkte pro Seite',NULL,'number',0,0,0,NULL),(1023,189,'strip_tags','b:1;','Global strip_tags verwenden','Wenn aktiviert wird jeder Formularinput im Frontend mittels strip_tags gefiltert.','checkbox',1,0,0,NULL);
/*!40000 ALTER TABLE `s_core_config_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_config_form_translations`
--

DROP TABLE IF EXISTS `s_core_config_form_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_config_form_translations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(11) unsigned NOT NULL,
  `locale_id` int(11) unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_config_form_translations`
--

LOCK TABLES `s_core_config_form_translations` WRITE;
/*!40000 ALTER TABLE `s_core_config_form_translations` DISABLE KEYS */;
INSERT INTO `s_core_config_form_translations` VALUES (1,77,2,'Shop settings',NULL),(2,78,2,'System',NULL),(3,79,2,'Items',NULL),(4,80,2,'Frontend',NULL),(5,82,2,'Interfaces',NULL),(6,83,2,'Payment methods',NULL),(7,84,2,'Item numbers',NULL),(8,86,2,'Other VAT rates',NULL),(9,87,2,'Price groups',NULL),(10,88,2,'Price units',NULL),(12,90,2,'Customer reviews',NULL),(13,92,2,'Additional settings',NULL),(14,102,2,'Recently viewed items',NULL),(15,118,2,'Shops',NULL),(16,119,2,'Basic information',NULL),(17,120,2,'Currencies',NULL),(18,121,2,'Localizations',NULL),(19,122,2,'Templates',NULL),(20,123,2,'Taxes',NULL),(21,124,2,'Mailers',NULL),(22,125,2,'Number ranges',NULL),(23,126,2,'Customer groups',NULL),(24,127,2,'Caching',NULL),(25,128,2,'Service',NULL),(26,133,2,'Advanced menu',NULL),(27,134,2,'Item comparison',NULL),(28,135,2,'Tag cloud',NULL),(29,144,2,'Categories / lists',NULL),(30,145,2,'Top seller / novelties',NULL),(31,146,2,'Cross selling / item details',NULL),(32,147,2,'Shopping cart / item details',NULL),(33,157,2,'Login / registration',NULL),(34,173,2,'Statstics',NULL),(35,174,2,'Google Analytics',NULL),(36,175,2,'HttpCache',NULL),(37,176,2,'Log',NULL),(38,177,2,'Debug',NULL),(39,180,2,'Countries',NULL),(40,189,2,'Input filter',NULL),(41,190,2,'Search',NULL),(42,191,2,'Discounts / surcharges',NULL),(43,192,2,'Email settings',NULL),(44,247,2,'Shipping costs module',NULL),(46,249,2,'SEO / router settings',NULL),(48,251,2,'Country areas',NULL),(50,253,2,'ESD',NULL),(51,255,2,'Item recommendations',NULL),(52,256,2,'Checkout',NULL),(53,257,2,'Shop page groups',NULL),(54,258,2,'Cronjobs',NULL),(55,259,2,'Backend',NULL),(56,261,2,'PDF document creation',NULL),(57,262,2,'Store API',NULL),(58,264,2,'Legacy options',NULL),(59,265,2,'Passwords',NULL),(61,267,2,'SEPA configuration',NULL),(62,271,2,'Media',''),(63,270,2,'Multi edit',NULL),(64,272,2,'Sitemap',NULL),(65,273,2,'Shopware license',NULL);
/*!40000 ALTER TABLE `s_core_config_form_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_config_forms`
--

DROP TABLE IF EXISTS `s_core_config_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_config_forms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `position` int(11) NOT NULL,
  `plugin_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `plugin_id` (`plugin_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_config_forms`
--

LOCK TABLES `s_core_config_forms` WRITE;
/*!40000 ALTER TABLE `s_core_config_forms` DISABLE KEYS */;
INSERT INTO `s_core_config_forms` VALUES (77,NULL,'Base','Shopeinstellungen',NULL,0,NULL),(78,NULL,'Core','System',NULL,10,NULL),(79,NULL,'Product','Artikel',NULL,20,NULL),(80,NULL,'Frontend','Storefront',NULL,30,NULL),(82,NULL,'Interface','Schnittstellen',NULL,50,NULL),(83,NULL,'Payment','Zahlungsarten',NULL,60,NULL),(84,79,'Product29','Artikelnummern',NULL,1,NULL),(86,79,'Product35','Sonstige MwSt.-Sätze',NULL,4,NULL),(87,79,'PriceGroup','Preisgruppen',NULL,5,NULL),(88,79,'Unit','Preiseinheiten',NULL,6,NULL),(90,80,'Rating','Artikelbewertungen',NULL,8,NULL),(92,NULL,'Other','Weitere Einstellungen',NULL,60,NULL),(102,80,'LastArticles','Artikelverlauf','',0,23),(118,77,'Shop','Shops',NULL,0,NULL),(119,77,'MasterData','Stammdaten',NULL,10,NULL),(120,77,'Currency','Währungen',NULL,20,NULL),(121,77,'Locale','Lokalisierungen',NULL,30,NULL),(123,77,'Tax','Steuern',NULL,50,NULL),(124,77,'Mail','Mailer',NULL,60,NULL),(125,77,'Number','Nummernkreise',NULL,70,NULL),(126,77,'CustomerGroup','Kundengruppen',NULL,80,NULL),(128,78,'Service','Wartung',NULL,20,NULL),(133,80,'AdvancedMenu','Erweitertes Menü','',0,29),(134,80,'Compare','Artikelvergleich',NULL,0,NULL),(144,80,'Frontend30','Kategorien / Listen',NULL,1,NULL),(145,80,'Frontend76','Topseller / Neuheiten',NULL,2,NULL),(146,80,'Frontend77','Cross-Selling / Ähnliche Art.',NULL,3,NULL),(147,80,'Frontend79','Warenkorb / Artikeldetails',NULL,5,NULL),(157,80,'Frontend33','Anmeldung / Registrierung',NULL,0,NULL),(173,78,'Statistics','Statistiken','',0,31),(180,77,'Country','Länder',NULL,50,NULL),(189,78,'InputFilter','InputFilter','',0,35),(190,80,'Search','Suche',NULL,4,NULL),(191,80,'Frontend71','Rabatte / Zuschläge',NULL,5,NULL),(192,80,'Frontend60','E-Mail-Einstellungen',NULL,10,NULL),(247,80,'Frontend93','Versandkosten-Modul',NULL,11,NULL),(249,80,'Frontend100','SEO/Router-Einstellungen',NULL,12,NULL),(251,77,'CountryArea','Länder-Zonen',NULL,51,NULL),(253,79,'Esd','ESD',NULL,0,NULL),(255,80,'Recommendation','Artikelempfehlungen',NULL,8,NULL),(256,80,'Checkout','Bestellabschluss',NULL,0,NULL),(257,77,'PageGroup','Shopseiten-Gruppen',NULL,90,NULL),(258,78,'CronJob','Cronjobs',NULL,50,NULL),(259,78,'Auth','Backend','',0,36),(261,77,'Document','PDF-Belegerstellung',NULL,90,NULL),(263,92,'Newsletter','Newsletter',NULL,0,NULL),(264,92,'LegacyOptions','Abwärtskompatibilität',NULL,0,NULL),(265,78,'Passwörter','Passwörter',NULL,0,49),(266,78,'HttpCache','Frontend cache (HTTP cache)',NULL,0,52),(267,80,'SEPA','SEPA-Konfiguration',NULL,0,NULL),(268,78,'Log','Log',NULL,0,2),(269,78,'SwagUpdate','Shopware Auto Update',NULL,0,55),(270,92,'MultiEdit','Mehrfachänderung','',0,NULL),(271,80,'Media','Medien',NULL,13,NULL),(272,80,'Sitemap','Sitemap',NULL,0,NULL),(273,92,'CoreLicense','Shopware-Lizenz',NULL,0,NULL);
/*!40000 ALTER TABLE `s_core_config_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_config_mails`
--

DROP TABLE IF EXISTS `s_core_config_mails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_config_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stateId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `frommail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fromname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `contentHTML` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `ishtml` int(1) NOT NULL,
  `attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mailtype` int(11) NOT NULL DEFAULT '1',
  `context` longtext COLLATE utf8_unicode_ci,
  `dirty` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `stateId` (`stateId`),
  CONSTRAINT `s_core_config_mails_ibfk_1` FOREIGN KEY (`stateId`) REFERENCES `s_core_states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_config_mails`
--

LOCK TABLES `s_core_config_mails` WRITE;
/*!40000 ALTER TABLE `s_core_config_mails` DISABLE KEYS */;
INSERT INTO `s_core_config_mails` VALUES (1,NULL,'sREGISTERCONFIRMATION','{config name=mail}','{config name=shopName}','Ihre Anmeldung bei {config name=shopName}','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo {$salutation} {$firstname} {$lastname},\n\nvielen Dank für Ihre Anmeldung in unserem Shop.\n\nSie erhalten Zugriff über Ihre E-Mail-Adresse {$sMAIL}\nund dem von Ihnen gewählten Kennwort.\n\nSie können sich Ihr Kennwort jederzeit per E-Mail erneut zuschicken lassen.\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','{include file=\"string:{config name=emailheaderhtml}\"}\r\n<br/><br/>\r\n<p>\nHallo {salutation} {firstname} {lastname},<br/><br/>\n\nvielen Dank für Ihre Anmeldung in unserem Shop.<br/><br/>\n\nSie erhalten Zugriff über Ihre E-Mail-Adresse <strong>{sMAIL}</strong><br/>\nund dem von Ihnen gewählten Kennwort.<br/><br/>\n\nSie können sich Ihr Kennwort jederzeit per E-Mail erneut zuschicken lassen.\n</p>\r\n<br/><br/>\r\n{include file=\"string:{config name=emailfooterhtml}\"}',1,'',2,'a:29:{s:5:\"sShop\";s:7:\"Deutsch\";s:8:\"sShopURL\";s:27:\"http://trunk.qa.shopware.in\";s:7:\"sConfig\";a:0:{}s:5:\"sMAIL\";s:14:\"xy@example.org\";s:7:\"country\";s:1:\"2\";s:13:\"customer_type\";s:7:\"private\";s:10:\"salutation\";s:4:\"Herr\";s:9:\"firstname\";s:3:\"Max\";s:8:\"lastname\";s:10:\"Mustermann\";s:5:\"phone\";s:8:\"55555555\";s:3:\"fax\";N;s:5:\"text1\";N;s:5:\"text2\";N;s:5:\"text3\";N;s:5:\"text4\";N;s:5:\"text5\";N;s:5:\"text6\";N;s:11:\"sValidation\";N;s:9:\"birthyear\";s:0:\"\";s:10:\"birthmonth\";s:0:\"\";s:8:\"birthday\";s:0:\"\";s:11:\"dpacheckbox\";N;s:7:\"company\";s:0:\"\";s:6:\"street\";s:17:\"Musterstreaße 55\";s:7:\"zipcode\";s:5:\"55555\";s:4:\"city\";s:11:\"Musterhsuen\";s:10:\"department\";s:0:\"\";s:15:\"shippingAddress\";N;s:7:\"stateID\";N;}',0),(2,NULL,'sORDER','{config name=mail}','{config name=shopName}','Ihre Bestellung im {config name=shopName}','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo {$billingaddress.firstname} {$billingaddress.lastname},\n\nvielen Dank fuer Ihre Bestellung bei {config name=shopName} (Nummer: {$sOrderNumber}) am {$sOrderDay|date:\"DATE_MEDIUM\"} um {$sOrderTime|date:\"TIME_SHORT\"}.\nInformationen zu Ihrer Bestellung:\n\nPos. Art.Nr.              Menge         Preis        Summe\n{foreach item=details key=position from=$sOrderDetails}\n{$position+1|fill:4} {$details.ordernumber|fill:20} {$details.quantity|fill:6} {$details.price|padding:8} EUR {$details.amount|padding:8} EUR\n{$details.articlename|wordwrap:49|indent:5}\n{/foreach}\n\nVersandkosten: {$sShippingCosts}\nGesamtkosten Netto: {$sAmountNet}\n{if !$sNet}\nGesamtkosten Brutto: {$sAmount}\n{/if}\n\nGewählte Zahlungsart: {$additional.payment.description}\n{$additional.payment.additionaldescription}\n{if $additional.payment.name == \"debit\"}\nIhre Bankverbindung:\nKontonr: {$sPaymentTable.account}\nBLZ:{$sPaymentTable.bankcode}\nWir ziehen den Betrag in den nächsten Tagen von Ihrem Konto ein.\n{/if}\n{if $additional.payment.name == \"prepayment\"}\n\nUnsere Bankverbindung:\n{config name=bankAccount}\n{/if}\n\n{if $sComment}\nIhr Kommentar:\n{$sComment}\n{/if}\n\nRechnungsadresse:\n{$billingaddress.company}\n{$billingaddress.firstname} {$billingaddress.lastname}\n{$billingaddress.street}\n{if {config name=showZipBeforeCity}}{$billingaddress.zipcode} {$billingaddress.city}{else}{$billingaddress.city} {$billingaddress.zipcode}{/if}\n{$billingaddress.phone}\n{$additional.country.countryname}\n\nLieferadresse:\n{$shippingaddress.company}\n{$shippingaddress.firstname} {$shippingaddress.lastname}\n{$shippingaddress.street}\n{if {config name=showZipBeforeCity}}{$shippingaddress.zipcode} {$shippingaddress.city}{else}{$shippingaddress.city} {$shippingaddress.zipcode}{/if}\n{$additional.countryShipping.countryname}\n\n{if $billingaddress.ustid}\nIhre Umsatzsteuer-ID: {$billingaddress.ustid}\nBei erfolgreicher Prüfung und sofern Sie aus dem EU-Ausland\nbestellen, erhalten Sie Ihre Ware umsatzsteuerbefreit.\n{/if}\n\n\nFür Rückfragen stehen wir Ihnen jederzeit gerne zur Verfügung.\n\nWir wünschen Ihnen noch einen schönen Tag.\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','{include file=\"string:{config name=emailheaderhtml}\"}\n<br/><br/>\n<p>\nHallo {$billingaddress.firstname} {$billingaddress.lastname},<br/><br/>\n\nvielen Dank fuer Ihre Bestellung bei {config name=shopName} (Nummer: {$sOrderNumber}) am {$sOrderDay|date:\"DATE_MEDIUM\"} um {$sOrderTime|date:\"TIME_SHORT\"}.\n<br/>\n<br/>\n<strong>Informationen zu Ihrer Bestellung:</strong></p>\n  <table width=\"80%\" border=\"0\" style=\"font-family:Arial, Helvetica, sans-serif; font-size:10px;\">\n    <tr>\n      <td bgcolor=\"#F7F7F2\" style=\"border-bottom:1px solid #cccccc;\"><strong>Artikel</strong></td>\n      <td bgcolor=\"#F7F7F2\" style=\"border-bottom:1px solid #cccccc;\"><strong>Pos.</strong></td>\n      <td bgcolor=\"#F7F7F2\" style=\"border-bottom:1px solid #cccccc;\"><strong>Art-Nr.</strong></td>\n      <td bgcolor=\"#F7F7F2\" style=\"border-bottom:1px solid #cccccc;\"><strong>Menge</strong></td>\n      <td bgcolor=\"#F7F7F2\" style=\"border-bottom:1px solid #cccccc;\"><strong>Preis</strong></td>\n      <td bgcolor=\"#F7F7F2\" style=\"border-bottom:1px solid #cccccc;\"><strong>Summe</strong></td>\n    </tr>\n\n    {foreach item=details key=position from=$sOrderDetails}\n    <tr>\n      <td rowspan=\"2\" style=\"border-bottom:1px solid #cccccc;\">{if $details.image.src.0 && $details.modus != 2}<img style=\"height: 57px;\" height=\"57\" src=\"{$details.image.src.0}\" alt=\"{$details.articlename}\" />{else} {/if}</td>\n      <td>{$position+1|fill:4} </td>\n      <td>{$details.ordernumber|fill:20}</td>\n      <td>{$details.quantity|fill:6}</td>\n      <td>{$details.price|padding:8}{$sCurrency}</td>\n      <td>{$details.amount|padding:8} {$sCurrency}</td>\n    </tr>\n    <tr>\n      <td colspan=\"5\" style=\"border-bottom:1px solid #cccccc;\">{$details.articlename|wordwrap:80|indent:4}</td>\n    </tr>\n    {/foreach}\n\n  </table>\n\n<p>\n  <br/>\n  <br/>\n    Versandkosten: {$sShippingCosts}<br/>\n    Gesamtkosten Netto: {$sAmountNet}<br/>\n    {if !$sNet}\n    Gesamtkosten Brutto: {$sAmount}<br/>\n    {/if}\n  <br/>\n  <br/>\n    <strong>Gewählte Zahlungsart:</strong> {$additional.payment.description}<br/>\n    {include file=\"string:{$additional.payment.additionaldescription}\"}\n    {if $additional.payment.name == \"debit\"}\n    Ihre Bankverbindung:<br/>\n    Kontonr: {$sPaymentTable.account}<br/>\n    BLZ:{$sPaymentTable.bankcode}<br/>\n    Wir ziehen den Betrag in den nächsten Tagen von Ihrem Konto ein.<br/>\n    {/if}\n  <br/>\n  <br/>\n    {if $additional.payment.name == \"prepayment\"}\n    Unsere Bankverbindung:<br/>\n    {config name=bankAccount}\n    {/if}\n  <br/>\n  <br/>\n    <strong>Gewählte Versandart:</strong> {$sDispatch.name}<br/>{$sDispatch.description}\n</p>\n<p>\n  {if $sComment}\n    <strong>Ihr Kommentar:</strong><br/>\n    {$sComment}<br/>\n  {/if}\n  <br/>\n  <br/>\n    <strong>Rechnungsadresse:</strong><br/>\n    {$billingaddress.company}<br/>\n    {$billingaddress.firstname} {$billingaddress.lastname}<br/>\n    {$billingaddress.street}<br/>\n    {$billingaddress.zipcode} {$billingaddress.city}<br/>\n    {$billingaddress.phone}<br/>\n    {$additional.country.countryname}<br/>\n  <br/>\n  <br/>\n    <strong>Lieferadresse:</strong><br/>\n    {$shippingaddress.company}<br/>\n    {$shippingaddress.firstname} {$shippingaddress.lastname}<br/>\n    {$shippingaddress.street}<br/>\n    {$shippingaddress.zipcode} {$shippingaddress.city}<br/>\n    {$additional.countryShipping.countryname}<br/>\n  <br/>\n    {if $billingaddress.ustid}\n    Ihre Umsatzsteuer-ID: {$billingaddress.ustid}<br/>\n    Bei erfolgreicher Prüfung und sofern Sie aus dem EU-Ausland<br/>\n    bestellen, erhalten Sie Ihre Ware umsatzsteuerbefreit.<br/>\n    {/if}\n  <br/>\n  <br/>\n    Für Rückfragen stehen wir Ihnen jederzeit gerne zur Verfügung. Sie erreichen uns wie folgt: <br/>{config name=address}\n</p>\n<br/><br/>\n{include file=\"string:{config name=emailfooterhtml}\"}',1,'',2,NULL,0),(3,NULL,'sTELLAFRIEND','{config name=mail}','{config name=shopName}','{sName} empfiehlt Ihnen {sArticle}','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo,\r\n\r\n{$sName} hat für Sie bei {$sShop} ein interessantes Produkt gefunden, dass Sie sich anschauen sollten:\r\n\r\n{$sArticle}\r\n{$sLink}\r\n\r\n{$sComment}\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',2,'a:4:{s:5:\"sName\";s:11:\"Peter Meyer\";s:8:\"sArticle\";s:10:\"Blumenvase\";s:5:\"sLink\";s:31:\"http://shop.example.org/test123\";s:8:\"sComment\";s:36:\"Hey Peter - das musst du dir ansehen\";}',0),(5,NULL,'sNOSERIALS','{config name=mail}','{config name=shopName}','Achtung - keine freien Seriennummern für {sArticleName}','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo,\r\n\r\nes sind keine weiteren freien Seriennummern für den Artikel {$sArticleName} verfügbar. Bitte stellen Sie umgehend neue Seriennummern ein oder deaktivieren Sie den Artikel.\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',2,'a:2:{s:12:\"sArticleName\";s:20:\"ESD Download Artikel\";s:5:\"sMail\";s:23:\"max.mustermann@mail.com\";}',0),(7,NULL,'sVOUCHER','{config name=mail}','{config name=shopName}','Ihr Gutschein','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo {$customer},\n\n{$user} ist Ihrer Empfehlung gefolgt und hat so eben bei {$sShop} bestellt.\nWir schenken Ihnen deshalb einen X € Gutschein, den Sie bei Ihrer nächsten Bestellung einlösen können.\n\nIhr Gutschein-Code lautet: XXX\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',2,'a:2:{s:8:\"customer\";s:11:\"Peter Meyer\";s:4:\"user\";s:11:\"Hans Maiser\";}',0),(12,NULL,'sCUSTOMERGROUPHACCEPTED','{config name=mail}','{config name=shopName}','Ihr Händleraccount wurde freigeschaltet','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo,\n\nIhr Händleraccount bei {$sShop} wurde freigeschaltet.\n\nAb sofort kaufen Sie zum Netto-EK bei uns ein.\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',2,NULL,0),(13,NULL,'sCUSTOMERGROUPHREJECTED','{config name=mail}','{config name=shopName}','Ihr Händleraccount wurde abgelehnt','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nSehr geehrter Kunde,\n\nvielen Dank für Ihr Interesse an unseren Fachhandelspreisen. Leider liegt uns aber noch kein Gewerbenachweis vor bzw. leider können wir Sie nicht als Fachhändler anerkennen.\n\nBei Rückfragen aller Art können Sie uns gerne telefonisch, per Fax oder per Mail diesbezüglich erreichen.\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',2,NULL,0),(19,NULL,'sCANCELEDQUESTION','{config name=mail}','{config name=shopName}','Ihre abgebrochene Bestellung - Jetzt Feedback geben und Gutschein kassieren','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nLieber Kunde,\r\n \r\nSie haben vor kurzem Ihre Bestellung auf {$sShop} nicht bis zum Ende durchgeführt - wir sind stets bemüht unseren Kunden das Einkaufen in unserem Shop so angenehm wie möglich zu machen und würden deshalb gerne wissen, woran Ihr Einkauf bei uns gescheitert ist.\r\n \r\nBitte lassen Sie uns doch den Grund für Ihren Bestellabbruch zukommen, Ihren Aufwand entschädigen wir Ihnen in jedem Fall mit einem 5,00 € Gutschein.\r\n \r\nVielen Dank für Ihre Unterstützung.\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',2,NULL,0),(20,NULL,'sCANCELEDVOUCHER','{config name=mail}','{config name=shopName}','Ihre abgebrochene Bestellung - Gutschein-Code anbei','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nLieber Kunde,\r\n \r\nSie haben vor kurzem Ihre Bestellung bei {$sShop} nicht bis zum Ende durchgeführt - wir möchten Ihnen heute einen 5,00 € Gutschein zukommen lassen - und Ihnen hiermit die Bestell-Entscheidung bei {$sShop} erleichtern.\r\n \r\nIhr Gutschein ist 2 Monate gültig und kann mit dem Code \"{$sVouchercode}\" eingelöst werden.\r\n\r\nWir würden uns freuen, Ihre Bestellung entgegen nehmen zu dürfen.\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',2,NULL,0),(21,9,'sORDERSTATEMAIL9','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','','',0,'',3,NULL,0),(22,10,'sORDERSTATEMAIL10','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','','',0,'',3,NULL,0),(24,13,'sORDERSTATEMAIL13','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','','',0,'',3,NULL,0),(25,16,'sORDERSTATEMAIL16','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','','',0,'',3,NULL,0),(26,15,'sORDERSTATEMAIL15','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','','',0,'',3,NULL,0),(27,14,'sORDERSTATEMAIL14','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','','',0,'',3,NULL,0),(28,12,'sORDERSTATEMAIL12','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','','',0,'',3,NULL,0),(32,17,'sORDERSTATEMAIL17','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','','',0,'',3,NULL,0),(35,18,'sORDERSTATEMAIL18','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','','',0,'',3,NULL,0),(36,19,'sORDERSTATEMAIL19','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','','',0,'',3,NULL,0),(37,20,'sORDERSTATEMAIL20','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','','',0,'',3,NULL,0),(40,NULL,'sARTICLESTOCK','{config name=mail}','{config name=shopName}','Lagerbestand von {$sData.count} Artikel{if $sData.count>1}n{/if} unter Mindestbestand ','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo,\n\nfolgende Artikel haben den Mindestbestand unterschritten:\n\nBestellnummer Artikelname Bestand/Mindestbestand\n{foreach from=$sJob.articles item=sArticle key=key}\n{$sArticle.ordernumber} {$sArticle.name} {$sArticle.instock}/{$sArticle.stockmin}\n{/foreach}\n\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',2,NULL,0),(41,NULL,'sNEWSLETTERCONFIRMATION','{config name=mail}','{config name=shopName}','Vielen Dank für Ihre Newsletter-Anmeldung','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo,\n\nvielen Dank für Ihre Newsletter-Anmeldung bei {config name=shopName}.\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',2,NULL,0),(42,NULL,'sOPTINNEWSLETTER','{config name=mail}','{config name=shopName}','Bitte bestätigen Sie Ihre Newsletter-Anmeldung','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo,\n\nvielen Dank für Ihre Anmeldung zu unserem regelmäßig erscheinenden Newsletter.\n\nBitte bestätigen Sie die Anmeldung über den nachfolgenden Link: {$sConfirmLink}\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',2,NULL,0),(43,NULL,'sOPTINVOTE','{config name=mail}','{config name=shopName}','Bitte bestätigen Sie Ihre Artikel-Bewertung','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo,\n\nvielen Dank für die Bewertung des Artikels {$sArticle.articleName}.\n\nBitte bestätigen Sie die Bewertung über nach den nachfolgenden Link: {$sConfirmLink}\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',2,NULL,0),(44,NULL,'sARTICLEAVAILABLE','{config name=mail}','{config name=shopName}','Ihr Artikel ist wieder verfügbar','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo,\n\nIhr Artikel mit der Bestellnummer {$sOrdernumber} ist jetzt wieder verfügbar.\n\n{$sArticleLink}\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',2,NULL,0),(45,NULL,'sACCEPTNOTIFICATION','{config name=mail}','{config name=shopName}','Bitte bestätigen Sie Ihre E-Mail-Benachrichtigung','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo,\n\nvielen Dank, dass Sie sich für die automatische E-Mail Benachrichtigung für den Artikel {$sArticleName} eingetragen haben.\n\nBitte bestätigen Sie die Benachrichtigung über den nachfolgenden Link:\n\n{$sConfirmLink}\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',2,NULL,0),(51,NULL,'sORDERSEPAAUTHORIZATION','{config name=mail}','{config name=shopName}','SEPA Lastschriftmandat','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo {$paymentInstance.firstName} {$paymentInstance.lastName}, im Anhang finden Sie ein Lastschriftmandat zu Ihrer Bestellung {$paymentInstance.orderNumber}. Bitte senden Sie uns das komplett ausgefüllte Dokument per Fax oder Email zurück.\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','{include file=\"string:{config name=emailheaderhtml}\"}\r\n<br/><br/>\r\nHallo {$paymentInstance.firstName} {$paymentInstance.lastName}, im Anhang finden Sie ein Lastschriftmandat zu Ihrer Bestellung {$paymentInstance.orderNumber}. Bitte senden Sie uns das komplett ausgefüllte Dokument per Fax oder Email zurück.\r\n<br/><br/>\r\n{include file=\"string:{config name=emailfooterhtml}\"}',1,'',1,NULL,0),(52,NULL,'sCONFIRMPASSWORDCHANGE','{config name=mail}','{config name=shopName}','Passwort vergessen - Passwort zurücksetzen','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo,\n\nim Shop {$sShopURL} wurde eine Anfrage gestellt, um Ihr Passwort zurück zu setzen.\n\nBitte bestätigen Sie den unten stehenden Link, um ein neues Passwort zu definieren.\n\n{$sUrlReset}\n\nDieser Link ist nur für die nächsten 2 Stunden gültig. Danach muss das Zurücksetzen des Passwortes erneut beantragt werden.\n\nFalls Sie Ihr Passwort nicht zurücksetzen möchten, ignorieren Sie diese E-Mail - es wird dann keine Änderung vorgenommen.\n\n{config name=address}\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',2,'',0),(53,1,'sORDERSTATEMAIL1','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo {$sUser.billing_salutation|salutation} {$sUser.billing_firstname} {$sUser.billing_lastname},\n\nDer Status Ihrer Bestellung mit der Bestellnummer: {$sOrder.ordernumber} vom {$sOrder.ordertime|date_format:\" %d-%m-%Y\"} hat sich geändert. Der neue Status lautet nun {$sOrder.status_description}.\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',3,'a:4:{s:6:\"sOrder\";a:40:{s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:12:\"order_number\";s:5:\"20002\";s:6:\"userID\";s:1:\"1\";s:10:\"customerID\";s:1:\"1\";s:14:\"invoice_amount\";s:6:\"201.86\";s:18:\"invoice_amount_net\";s:6:\"169.63\";s:16:\"invoice_shipping\";s:1:\"0\";s:20:\"invoice_shipping_net\";s:1:\"0\";s:9:\"ordertime\";s:19:\"2012-08-31 08:51:46\";s:6:\"status\";s:1:\"1\";s:8:\"statusID\";s:1:\"1\";s:7:\"cleared\";s:2:\"17\";s:9:\"clearedID\";s:2:\"17\";s:9:\"paymentID\";s:1:\"4\";s:13:\"transactionID\";s:0:\"\";s:7:\"comment\";s:0:\"\";s:15:\"customercomment\";s:0:\"\";s:3:\"net\";s:1:\"0\";s:5:\"netto\";s:1:\"0\";s:9:\"partnerID\";s:0:\"\";s:11:\"temporaryID\";s:0:\"\";s:7:\"referer\";s:0:\"\";s:11:\"cleareddate\";N;s:12:\"cleared_date\";N;s:12:\"trackingcode\";s:0:\"\";s:8:\"language\";s:1:\"1\";s:8:\"currency\";s:3:\"EUR\";s:14:\"currencyFactor\";s:1:\"1\";s:9:\"subshopID\";s:1:\"1\";s:10:\"dispatchID\";s:1:\"9\";s:10:\"currencyID\";s:1:\"1\";s:12:\"cleared_name\";s:4:\"open\";s:19:\"cleared_description\";s:5:\"Offen\";s:11:\"status_name\";s:10:\"in_process\";s:18:\"status_description\";s:23:\"In Bearbeitung (Wartet)\";s:19:\"payment_description\";s:8:\"Rechnung\";s:20:\"dispatch_description\";s:16:\"Standard Versand\";s:20:\"currency_description\";s:4:\"Euro\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}s:13:\"sOrderDetails\";a:5:{i:0;a:20:{s:14:\"orderdetailsID\";s:3:\"201\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:3:\"220\";s:18:\"articleordernumber\";s:7:\"SW10001\";s:5:\"price\";s:5:\"35.99\";s:8:\"quantity\";s:1:\"1\";s:7:\"invoice\";s:5:\"35.99\";s:4:\"name\";s:27:\"Versandkostenfreier Artikel\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"0\";s:10:\"esdarticle\";s:1:\"0\";s:5:\"taxID\";s:1:\"1\";s:3:\"tax\";s:5:\"19.00\";s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"0\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}i:1;a:20:{s:14:\"orderdetailsID\";s:3:\"202\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:3:\"227\";s:18:\"articleordernumber\";s:10:\"SW10002841\";s:5:\"price\";s:5:\"35.99\";s:8:\"quantity\";s:1:\"1\";s:7:\"invoice\";s:5:\"35.99\";s:4:\"name\";s:27:\"Aufschlag bei Zahlungsarten\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"0\";s:10:\"esdarticle\";s:1:\"0\";s:5:\"taxID\";s:1:\"1\";s:3:\"tax\";s:5:\"19.00\";s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"0\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}i:2;a:20:{s:14:\"orderdetailsID\";s:3:\"203\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:3:\"219\";s:18:\"articleordernumber\";s:7:\"SW10185\";s:5:\"price\";s:4:\"54.9\";s:8:\"quantity\";s:1:\"1\";s:7:\"invoice\";s:4:\"54.9\";s:4:\"name\";s:15:\"Express Versand\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"0\";s:10:\"esdarticle\";s:1:\"0\";s:5:\"taxID\";s:1:\"1\";s:3:\"tax\";s:5:\"19.00\";s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"0\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}i:3;a:20:{s:14:\"orderdetailsID\";s:3:\"204\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:3:\"197\";s:18:\"articleordernumber\";s:7:\"SW10196\";s:5:\"price\";s:5:\"34.99\";s:8:\"quantity\";s:1:\"2\";s:7:\"invoice\";s:5:\"69.98\";s:4:\"name\";s:20:\"ESD Download Artikel\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"0\";s:10:\"esdarticle\";s:1:\"1\";s:5:\"taxID\";s:1:\"1\";s:3:\"tax\";s:5:\"19.00\";s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"1\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}i:4;a:20:{s:14:\"orderdetailsID\";s:3:\"205\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:1:\"0\";s:18:\"articleordernumber\";s:19:\"sw-payment-absolute\";s:5:\"price\";s:1:\"5\";s:8:\"quantity\";s:1:\"1\";s:7:\"invoice\";s:1:\"5\";s:4:\"name\";s:25:\"Zuschlag für Zahlungsart\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"4\";s:10:\"esdarticle\";s:1:\"0\";s:5:\"taxID\";s:1:\"0\";s:3:\"tax\";N;s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"0\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}}s:5:\"sUser\";a:81:{s:15:\"billing_company\";s:11:\"shopware AG\";s:18:\"billing_department\";s:0:\"\";s:18:\"billing_salutation\";s:2:\"mr\";s:14:\"customernumber\";s:5:\"20001\";s:17:\"billing_firstname\";s:3:\"Max\";s:16:\"billing_lastname\";s:10:\"Mustermann\";s:14:\"billing_street\";s:20:\"Mustermannstraße 92\";s:32:\"billing_additional_address_line1\";s:0:\"\";s:32:\"billing_additional_address_line2\";s:0:\"\";s:15:\"billing_zipcode\";s:5:\"48624\";s:12:\"billing_city\";s:12:\"Schöppingen\";s:5:\"phone\";s:0:\"\";s:13:\"billing_phone\";s:0:\"\";s:17:\"billing_countryID\";s:1:\"2\";s:15:\"billing_stateID\";s:1:\"3\";s:15:\"billing_country\";s:11:\"Deutschland\";s:18:\"billing_countryiso\";s:2:\"DE\";s:19:\"billing_countryarea\";s:11:\"deutschland\";s:17:\"billing_countryen\";s:7:\"GERMANY\";s:5:\"ustid\";s:0:\"\";s:13:\"billing_text1\";N;s:13:\"billing_text2\";N;s:13:\"billing_text3\";N;s:13:\"billing_text4\";N;s:13:\"billing_text5\";N;s:13:\"billing_text6\";N;s:7:\"orderID\";s:2:\"57\";s:16:\"shipping_company\";s:11:\"shopware AG\";s:19:\"shipping_department\";s:0:\"\";s:19:\"shipping_salutation\";s:2:\"mr\";s:18:\"shipping_firstname\";s:3:\"Max\";s:17:\"shipping_lastname\";s:10:\"Mustermann\";s:15:\"shipping_street\";s:20:\"Mustermannstraße 92\";s:33:\"shipping_additional_address_line1\";s:0:\"\";s:33:\"shipping_additional_address_line2\";s:0:\"\";s:16:\"shipping_zipcode\";s:5:\"48624\";s:13:\"shipping_city\";s:12:\"Schöppingen\";s:16:\"shipping_stateID\";s:1:\"0\";s:18:\"shipping_countryID\";s:1:\"2\";s:16:\"shipping_country\";s:11:\"Deutschland\";s:19:\"shipping_countryiso\";s:2:\"DE\";s:20:\"shipping_countryarea\";s:11:\"deutschland\";s:18:\"shipping_countryen\";s:7:\"GERMANY\";s:14:\"shipping_text1\";N;s:14:\"shipping_text2\";N;s:14:\"shipping_text3\";N;s:14:\"shipping_text4\";N;s:14:\"shipping_text5\";N;s:14:\"shipping_text6\";N;s:2:\"id\";s:1:\"1\";s:8:\"password\";s:32:\"a256a310bc1e5db755fd392c524028a8\";s:7:\"encoder\";s:3:\"md5\";s:5:\"email\";s:15:\"dr@shopware.com\";s:6:\"active\";s:1:\"1\";s:11:\"accountmode\";s:1:\"0\";s:15:\"confirmationkey\";s:0:\"\";s:9:\"paymentID\";s:1:\"5\";s:10:\"firstlogin\";s:10:\"2011-11-23\";s:9:\"lastlogin\";s:19:\"2012-01-04 14:12:05\";s:9:\"sessionID\";s:26:\"uiorqd755gaar8dn89ukp178c7\";s:10:\"newsletter\";s:1:\"0\";s:10:\"validation\";s:1:\"0\";s:9:\"affiliate\";s:1:\"0\";s:13:\"customergroup\";s:2:\"EK\";s:13:\"paymentpreset\";s:1:\"0\";s:8:\"language\";s:1:\"1\";s:9:\"subshopID\";s:1:\"1\";s:7:\"referer\";s:0:\"\";s:12:\"pricegroupID\";N;s:15:\"internalcomment\";s:0:\"\";s:12:\"failedlogins\";s:1:\"0\";s:11:\"lockeduntil\";N;s:26:\"default_billing_address_id\";s:1:\"1\";s:27:\"default_shipping_address_id\";s:1:\"3\";s:5:\"title\";s:0:\"\";s:10:\"salutation\";s:2:\"mr\";s:9:\"firstname\";s:3:\"Max\";s:8:\"lastname\";s:10:\"Mustermann\";s:8:\"birthday\";N;s:11:\"preisgruppe\";s:1:\"1\";s:11:\"billing_net\";s:1:\"1\";}s:9:\"sDispatch\";a:2:{s:4:\"name\";s:16:\"Standard Versand\";s:11:\"description\";s:0:\"\";}}',0),(54,2,'sORDERSTATEMAIL2','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','{include file=\"string:{config name=emailheaderplain}\"}\n\nHallo {$sUser.billing_salutation|salutation} {$sUser.billing_firstname} {$sUser.billing_lastname},\n\nDer Status Ihrer Bestellung mit der Bestellnummer: {$sOrder.ordernumber} vom {$sOrder.ordertime|date_format:\" %d-%m-%Y\"} hat sich geändert. Der neue Status lautet nun {$sOrder.status_description}.\n\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',3,'a:4:{s:6:\"sOrder\";a:40:{s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:12:\"order_number\";s:5:\"20002\";s:6:\"userID\";s:1:\"1\";s:10:\"customerID\";s:1:\"1\";s:14:\"invoice_amount\";s:6:\"201.86\";s:18:\"invoice_amount_net\";s:6:\"169.63\";s:16:\"invoice_shipping\";s:1:\"0\";s:20:\"invoice_shipping_net\";s:1:\"0\";s:9:\"ordertime\";s:19:\"2012-08-31 08:51:46\";s:6:\"status\";s:1:\"2\";s:8:\"statusID\";s:1:\"2\";s:7:\"cleared\";s:2:\"17\";s:9:\"clearedID\";s:2:\"17\";s:9:\"paymentID\";s:1:\"4\";s:13:\"transactionID\";s:0:\"\";s:7:\"comment\";s:0:\"\";s:15:\"customercomment\";s:0:\"\";s:3:\"net\";s:1:\"0\";s:5:\"netto\";s:1:\"0\";s:9:\"partnerID\";s:0:\"\";s:11:\"temporaryID\";s:0:\"\";s:7:\"referer\";s:0:\"\";s:11:\"cleareddate\";N;s:12:\"cleared_date\";N;s:12:\"trackingcode\";s:0:\"\";s:8:\"language\";s:1:\"1\";s:8:\"currency\";s:3:\"EUR\";s:14:\"currencyFactor\";s:1:\"1\";s:9:\"subshopID\";s:1:\"1\";s:10:\"dispatchID\";s:1:\"9\";s:10:\"currencyID\";s:1:\"1\";s:12:\"cleared_name\";s:4:\"open\";s:19:\"cleared_description\";s:5:\"Offen\";s:11:\"status_name\";s:9:\"completed\";s:18:\"status_description\";s:22:\"Komplett abgeschlossen\";s:19:\"payment_description\";s:8:\"Rechnung\";s:20:\"dispatch_description\";s:16:\"Standard Versand\";s:20:\"currency_description\";s:4:\"Euro\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}s:13:\"sOrderDetails\";a:5:{i:0;a:20:{s:14:\"orderdetailsID\";s:3:\"201\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:3:\"220\";s:18:\"articleordernumber\";s:7:\"SW10001\";s:5:\"price\";s:5:\"35.99\";s:8:\"quantity\";s:1:\"1\";s:7:\"invoice\";s:5:\"35.99\";s:4:\"name\";s:27:\"Versandkostenfreier Artikel\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"0\";s:10:\"esdarticle\";s:1:\"0\";s:5:\"taxID\";s:1:\"1\";s:3:\"tax\";s:5:\"19.00\";s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"0\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}i:1;a:20:{s:14:\"orderdetailsID\";s:3:\"202\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:3:\"227\";s:18:\"articleordernumber\";s:10:\"SW10002841\";s:5:\"price\";s:5:\"35.99\";s:8:\"quantity\";s:1:\"1\";s:7:\"invoice\";s:5:\"35.99\";s:4:\"name\";s:27:\"Aufschlag bei Zahlungsarten\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"0\";s:10:\"esdarticle\";s:1:\"0\";s:5:\"taxID\";s:1:\"1\";s:3:\"tax\";s:5:\"19.00\";s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"0\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}i:2;a:20:{s:14:\"orderdetailsID\";s:3:\"203\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:3:\"219\";s:18:\"articleordernumber\";s:7:\"SW10185\";s:5:\"price\";s:4:\"54.9\";s:8:\"quantity\";s:1:\"1\";s:7:\"invoice\";s:4:\"54.9\";s:4:\"name\";s:15:\"Express Versand\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"0\";s:10:\"esdarticle\";s:1:\"0\";s:5:\"taxID\";s:1:\"1\";s:3:\"tax\";s:5:\"19.00\";s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"0\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}i:3;a:20:{s:14:\"orderdetailsID\";s:3:\"204\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:3:\"197\";s:18:\"articleordernumber\";s:7:\"SW10196\";s:5:\"price\";s:5:\"34.99\";s:8:\"quantity\";s:1:\"2\";s:7:\"invoice\";s:5:\"69.98\";s:4:\"name\";s:20:\"ESD Download Artikel\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"0\";s:10:\"esdarticle\";s:1:\"1\";s:5:\"taxID\";s:1:\"1\";s:3:\"tax\";s:5:\"19.00\";s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"1\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}i:4;a:20:{s:14:\"orderdetailsID\";s:3:\"205\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:1:\"0\";s:18:\"articleordernumber\";s:19:\"sw-payment-absolute\";s:5:\"price\";s:1:\"5\";s:8:\"quantity\";s:1:\"1\";s:7:\"invoice\";s:1:\"5\";s:4:\"name\";s:25:\"Zuschlag für Zahlungsart\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"4\";s:10:\"esdarticle\";s:1:\"0\";s:5:\"taxID\";s:1:\"0\";s:3:\"tax\";N;s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"0\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}}s:5:\"sUser\";a:81:{s:15:\"billing_company\";s:11:\"shopware AG\";s:18:\"billing_department\";s:0:\"\";s:18:\"billing_salutation\";s:2:\"mr\";s:14:\"customernumber\";s:5:\"20001\";s:17:\"billing_firstname\";s:3:\"Max\";s:16:\"billing_lastname\";s:10:\"Mustermann\";s:14:\"billing_street\";s:20:\"Mustermannstraße 92\";s:32:\"billing_additional_address_line1\";s:0:\"\";s:32:\"billing_additional_address_line2\";s:0:\"\";s:15:\"billing_zipcode\";s:5:\"48624\";s:12:\"billing_city\";s:12:\"Schöppingen\";s:5:\"phone\";s:0:\"\";s:13:\"billing_phone\";s:0:\"\";s:17:\"billing_countryID\";s:1:\"2\";s:15:\"billing_stateID\";s:1:\"3\";s:15:\"billing_country\";s:11:\"Deutschland\";s:18:\"billing_countryiso\";s:2:\"DE\";s:19:\"billing_countryarea\";s:11:\"deutschland\";s:17:\"billing_countryen\";s:7:\"GERMANY\";s:5:\"ustid\";s:0:\"\";s:13:\"billing_text1\";N;s:13:\"billing_text2\";N;s:13:\"billing_text3\";N;s:13:\"billing_text4\";N;s:13:\"billing_text5\";N;s:13:\"billing_text6\";N;s:7:\"orderID\";s:2:\"57\";s:16:\"shipping_company\";s:11:\"shopware AG\";s:19:\"shipping_department\";s:0:\"\";s:19:\"shipping_salutation\";s:2:\"mr\";s:18:\"shipping_firstname\";s:3:\"Max\";s:17:\"shipping_lastname\";s:10:\"Mustermann\";s:15:\"shipping_street\";s:20:\"Mustermannstraße 92\";s:33:\"shipping_additional_address_line1\";s:0:\"\";s:33:\"shipping_additional_address_line2\";s:0:\"\";s:16:\"shipping_zipcode\";s:5:\"48624\";s:13:\"shipping_city\";s:12:\"Schöppingen\";s:16:\"shipping_stateID\";s:1:\"0\";s:18:\"shipping_countryID\";s:1:\"2\";s:16:\"shipping_country\";s:11:\"Deutschland\";s:19:\"shipping_countryiso\";s:2:\"DE\";s:20:\"shipping_countryarea\";s:11:\"deutschland\";s:18:\"shipping_countryen\";s:7:\"GERMANY\";s:14:\"shipping_text1\";N;s:14:\"shipping_text2\";N;s:14:\"shipping_text3\";N;s:14:\"shipping_text4\";N;s:14:\"shipping_text5\";N;s:14:\"shipping_text6\";N;s:2:\"id\";s:1:\"1\";s:8:\"password\";s:32:\"a256a310bc1e5db755fd392c524028a8\";s:7:\"encoder\";s:3:\"md5\";s:5:\"email\";s:15:\"dr@shopware.com\";s:6:\"active\";s:1:\"1\";s:11:\"accountmode\";s:1:\"0\";s:15:\"confirmationkey\";s:0:\"\";s:9:\"paymentID\";s:1:\"5\";s:10:\"firstlogin\";s:10:\"2011-11-23\";s:9:\"lastlogin\";s:19:\"2012-01-04 14:12:05\";s:9:\"sessionID\";s:26:\"uiorqd755gaar8dn89ukp178c7\";s:10:\"newsletter\";s:1:\"0\";s:10:\"validation\";s:1:\"0\";s:9:\"affiliate\";s:1:\"0\";s:13:\"customergroup\";s:2:\"EK\";s:13:\"paymentpreset\";s:1:\"0\";s:8:\"language\";s:1:\"1\";s:9:\"subshopID\";s:1:\"1\";s:7:\"referer\";s:0:\"\";s:12:\"pricegroupID\";N;s:15:\"internalcomment\";s:0:\"\";s:12:\"failedlogins\";s:1:\"0\";s:11:\"lockeduntil\";N;s:26:\"default_billing_address_id\";s:1:\"1\";s:27:\"default_shipping_address_id\";s:1:\"3\";s:5:\"title\";s:0:\"\";s:10:\"salutation\";s:2:\"mr\";s:9:\"firstname\";s:3:\"Max\";s:8:\"lastname\";s:10:\"Mustermann\";s:8:\"birthday\";N;s:11:\"preisgruppe\";s:1:\"1\";s:11:\"billing_net\";s:1:\"1\";}s:9:\"sDispatch\";a:2:{s:4:\"name\";s:16:\"Standard Versand\";s:11:\"description\";s:0:\"\";}}',1),(55,11,'sORDERSTATEMAIL11','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo {$sUser.billing_salutation|salutation} {$sUser.billing_firstname} {$sUser.billing_lastname},\n\nDer Status Ihrer Bestellung mit der Bestellnummer: {$sOrder.ordernumber} vom {$sOrder.ordertime|date_format:\" %d-%m-%Y\"} hat sich geändert.\n\nDer neue Status lautet nun {$sOrder.status_description}.\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',3,NULL,0),(56,5,'sORDERSTATEMAIL5','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo {$sUser.billing_salutation|salutation} {$sUser.billing_firstname} {$sUser.billing_lastname},\n\nDer Status Ihrer Bestellung mit der Bestellnummer {$sOrder.ordernumber} vom {$sOrder.ordertime|date_format:\" %d.%m.%Y\"}\nhat sich geändert. Der neun Staus lautet nun {$sOrder.status_description}.\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',3,NULL,0),(57,3,'sORDERSTATEMAIL3','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo {$sUser.billing_salutation|salutation} {$sUser.billing_firstname} {$sUser.billing_lastname},\n\nDer Status Ihrer Bestellung mit der Bestellnummer {$sOrder.ordernumber} vom {$sOrder.ordertime|date_format:\" %d.%m.%Y\"}\nhat sich geändert. Der neue Staus lautet nun \"{$sOrder.status_description}\".\n\n\nInformationen zu Ihrer Bestellung:\n==================================\n{foreach item=details key=position from=$sOrderDetails}\n{$position+1|fill:3} {$details.articleordernumber|fill:10:\" \":\"...\"} {$details.name|fill:30} {$details.quantity} x {$details.price|string_format:\"%.2f\"} {$sConfig.sCURRENCY}\n{/foreach}\n\nVersandkosten: {$sOrder.invoice_shipping} {$sConfig.sCURRENCY}\nNetto-Gesamt: {$sOrder.invoice_amount_net|string_format:\"%.2f\"} {$sConfig.sCURRENCY}\nGesamtbetrag inkl. MwSt.: {$sOrder.invoice_amount|string_format:\"%.2f\"} {$sConfig.sCURRENCY}\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',3,NULL,0),(58,8,'sORDERSTATEMAIL8','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo {$sUser.billing_salutation|salutation} {$sUser.billing_firstname} {$sUser.billing_lastname},\n\nder Bestellstatus für Ihre Bestellung {$sOrder.ordernumber} hat sich geändert!\nDie Bestellung hat jetzt den Status: {$sOrder.status_description}.\n\nDen aktuellen Status Ihrer Bestellung  können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen. Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',3,'a:4:{s:6:\"sOrder\";a:40:{s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:12:\"order_number\";s:5:\"20002\";s:6:\"userID\";s:1:\"1\";s:10:\"customerID\";s:1:\"1\";s:14:\"invoice_amount\";s:6:\"201.86\";s:18:\"invoice_amount_net\";s:6:\"169.63\";s:16:\"invoice_shipping\";s:1:\"0\";s:20:\"invoice_shipping_net\";s:1:\"0\";s:9:\"ordertime\";s:19:\"2012-08-31 08:51:46\";s:6:\"status\";s:1:\"8\";s:8:\"statusID\";s:1:\"8\";s:7:\"cleared\";s:2:\"17\";s:9:\"clearedID\";s:2:\"17\";s:9:\"paymentID\";s:1:\"4\";s:13:\"transactionID\";s:0:\"\";s:7:\"comment\";s:0:\"\";s:15:\"customercomment\";s:0:\"\";s:3:\"net\";s:1:\"0\";s:5:\"netto\";s:1:\"0\";s:9:\"partnerID\";s:0:\"\";s:11:\"temporaryID\";s:0:\"\";s:7:\"referer\";s:0:\"\";s:11:\"cleareddate\";N;s:12:\"cleared_date\";N;s:12:\"trackingcode\";s:0:\"\";s:8:\"language\";s:1:\"1\";s:8:\"currency\";s:3:\"EUR\";s:14:\"currencyFactor\";s:1:\"1\";s:9:\"subshopID\";s:1:\"2\";s:10:\"dispatchID\";s:1:\"9\";s:10:\"currencyID\";s:1:\"1\";s:12:\"cleared_name\";s:4:\"open\";s:19:\"cleared_description\";s:5:\"Offen\";s:11:\"status_name\";s:22:\"clarification_required\";s:18:\"status_description\";s:18:\"Klärung notwendig\";s:19:\"payment_description\";s:8:\"Rechnung\";s:20:\"dispatch_description\";s:16:\"Standard Versand\";s:20:\"currency_description\";s:4:\"Euro\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}s:13:\"sOrderDetails\";a:5:{i:0;a:20:{s:14:\"orderdetailsID\";s:3:\"201\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:3:\"220\";s:18:\"articleordernumber\";s:7:\"SW10001\";s:5:\"price\";s:5:\"35.99\";s:8:\"quantity\";s:1:\"1\";s:7:\"invoice\";s:5:\"35.99\";s:4:\"name\";s:27:\"Versandkostenfreier Artikel\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"0\";s:10:\"esdarticle\";s:1:\"0\";s:5:\"taxID\";s:1:\"1\";s:3:\"tax\";s:5:\"19.00\";s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"0\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}i:1;a:20:{s:14:\"orderdetailsID\";s:3:\"202\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:3:\"227\";s:18:\"articleordernumber\";s:10:\"SW10002841\";s:5:\"price\";s:5:\"35.99\";s:8:\"quantity\";s:1:\"1\";s:7:\"invoice\";s:5:\"35.99\";s:4:\"name\";s:27:\"Aufschlag bei Zahlungsarten\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"0\";s:10:\"esdarticle\";s:1:\"0\";s:5:\"taxID\";s:1:\"1\";s:3:\"tax\";s:5:\"19.00\";s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"0\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}i:2;a:20:{s:14:\"orderdetailsID\";s:3:\"203\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:3:\"219\";s:18:\"articleordernumber\";s:7:\"SW10185\";s:5:\"price\";s:4:\"54.9\";s:8:\"quantity\";s:1:\"1\";s:7:\"invoice\";s:4:\"54.9\";s:4:\"name\";s:15:\"Express Versand\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"0\";s:10:\"esdarticle\";s:1:\"0\";s:5:\"taxID\";s:1:\"1\";s:3:\"tax\";s:5:\"19.00\";s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"0\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}i:3;a:20:{s:14:\"orderdetailsID\";s:3:\"204\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:3:\"197\";s:18:\"articleordernumber\";s:7:\"SW10196\";s:5:\"price\";s:5:\"34.99\";s:8:\"quantity\";s:1:\"2\";s:7:\"invoice\";s:5:\"69.98\";s:4:\"name\";s:20:\"ESD Download Artikel\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"0\";s:10:\"esdarticle\";s:1:\"1\";s:5:\"taxID\";s:1:\"1\";s:3:\"tax\";s:5:\"19.00\";s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"1\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}i:4;a:20:{s:14:\"orderdetailsID\";s:3:\"205\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:1:\"0\";s:18:\"articleordernumber\";s:19:\"sw-payment-absolute\";s:5:\"price\";s:1:\"5\";s:8:\"quantity\";s:1:\"1\";s:7:\"invoice\";s:1:\"5\";s:4:\"name\";s:25:\"Zuschlag für Zahlungsart\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"4\";s:10:\"esdarticle\";s:1:\"0\";s:5:\"taxID\";s:1:\"0\";s:3:\"tax\";N;s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"0\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}}s:5:\"sUser\";a:81:{s:15:\"billing_company\";s:11:\"shopware AG\";s:18:\"billing_department\";s:0:\"\";s:18:\"billing_salutation\";s:2:\"mr\";s:14:\"customernumber\";s:5:\"20001\";s:17:\"billing_firstname\";s:3:\"Max\";s:16:\"billing_lastname\";s:10:\"Mustermann\";s:14:\"billing_street\";s:20:\"Mustermannstraße 92\";s:32:\"billing_additional_address_line1\";s:0:\"\";s:32:\"billing_additional_address_line2\";s:0:\"\";s:15:\"billing_zipcode\";s:5:\"48624\";s:12:\"billing_city\";s:12:\"Schöppingen\";s:5:\"phone\";s:0:\"\";s:13:\"billing_phone\";s:0:\"\";s:17:\"billing_countryID\";s:1:\"2\";s:15:\"billing_stateID\";s:1:\"3\";s:15:\"billing_country\";s:11:\"Deutschland\";s:18:\"billing_countryiso\";s:2:\"DE\";s:19:\"billing_countryarea\";s:11:\"deutschland\";s:17:\"billing_countryen\";s:7:\"GERMANY\";s:5:\"ustid\";s:0:\"\";s:13:\"billing_text1\";N;s:13:\"billing_text2\";N;s:13:\"billing_text3\";N;s:13:\"billing_text4\";N;s:13:\"billing_text5\";N;s:13:\"billing_text6\";N;s:7:\"orderID\";s:2:\"57\";s:16:\"shipping_company\";s:11:\"shopware AG\";s:19:\"shipping_department\";s:0:\"\";s:19:\"shipping_salutation\";s:2:\"mr\";s:18:\"shipping_firstname\";s:3:\"Max\";s:17:\"shipping_lastname\";s:10:\"Mustermann\";s:15:\"shipping_street\";s:20:\"Mustermannstraße 92\";s:33:\"shipping_additional_address_line1\";s:0:\"\";s:33:\"shipping_additional_address_line2\";s:0:\"\";s:16:\"shipping_zipcode\";s:5:\"48624\";s:13:\"shipping_city\";s:12:\"Schöppingen\";s:16:\"shipping_stateID\";s:1:\"0\";s:18:\"shipping_countryID\";s:1:\"2\";s:16:\"shipping_country\";s:11:\"Deutschland\";s:19:\"shipping_countryiso\";s:2:\"DE\";s:20:\"shipping_countryarea\";s:11:\"deutschland\";s:18:\"shipping_countryen\";s:7:\"GERMANY\";s:14:\"shipping_text1\";N;s:14:\"shipping_text2\";N;s:14:\"shipping_text3\";N;s:14:\"shipping_text4\";N;s:14:\"shipping_text5\";N;s:14:\"shipping_text6\";N;s:2:\"id\";s:1:\"1\";s:8:\"password\";s:32:\"a256a310bc1e5db755fd392c524028a8\";s:7:\"encoder\";s:3:\"md5\";s:5:\"email\";s:15:\"dr@shopware.com\";s:6:\"active\";s:1:\"1\";s:11:\"accountmode\";s:1:\"0\";s:15:\"confirmationkey\";s:0:\"\";s:9:\"paymentID\";s:1:\"5\";s:10:\"firstlogin\";s:10:\"2011-11-23\";s:9:\"lastlogin\";s:19:\"2012-01-04 14:12:05\";s:9:\"sessionID\";s:26:\"uiorqd755gaar8dn89ukp178c7\";s:10:\"newsletter\";s:1:\"0\";s:10:\"validation\";s:1:\"0\";s:9:\"affiliate\";s:1:\"0\";s:13:\"customergroup\";s:2:\"EK\";s:13:\"paymentpreset\";s:1:\"0\";s:8:\"language\";s:1:\"2\";s:9:\"subshopID\";s:1:\"1\";s:7:\"referer\";s:0:\"\";s:12:\"pricegroupID\";N;s:15:\"internalcomment\";s:0:\"\";s:12:\"failedlogins\";s:1:\"0\";s:11:\"lockeduntil\";N;s:26:\"default_billing_address_id\";s:1:\"1\";s:27:\"default_shipping_address_id\";s:1:\"3\";s:5:\"title\";s:0:\"\";s:10:\"salutation\";s:2:\"mr\";s:9:\"firstname\";s:3:\"Max\";s:8:\"lastname\";s:10:\"Mustermann\";s:8:\"birthday\";N;s:11:\"preisgruppe\";s:1:\"1\";s:11:\"billing_net\";s:1:\"1\";}s:9:\"sDispatch\";a:2:{s:4:\"name\";s:16:\"Standard Versand\";s:11:\"description\";s:0:\"\";}}',0),(59,4,'sORDERSTATEMAIL4','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo {$sUser.billing_salutation|salutation} {$sUser.billing_firstname} {$sUser.billing_lastname},\n\nder Bestellstatus für Ihre Bestellung {$sOrder.ordernumber} hat sich geändert!\nDie Bestellung hat jetzt den Status: {$sOrder.status_description}.\n\nDen aktuellen Status Ihrer Bestellung  können Sie  auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen. Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',3,'a:4:{s:6:\"sOrder\";a:40:{s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:12:\"order_number\";s:5:\"20002\";s:6:\"userID\";s:1:\"1\";s:10:\"customerID\";s:1:\"1\";s:14:\"invoice_amount\";s:6:\"201.86\";s:18:\"invoice_amount_net\";s:6:\"169.63\";s:16:\"invoice_shipping\";s:1:\"0\";s:20:\"invoice_shipping_net\";s:1:\"0\";s:9:\"ordertime\";s:19:\"2012-08-31 08:51:46\";s:6:\"status\";s:1:\"4\";s:8:\"statusID\";s:1:\"4\";s:7:\"cleared\";s:2:\"17\";s:9:\"clearedID\";s:2:\"17\";s:9:\"paymentID\";s:1:\"4\";s:13:\"transactionID\";s:0:\"\";s:7:\"comment\";s:0:\"\";s:15:\"customercomment\";s:0:\"\";s:3:\"net\";s:1:\"0\";s:5:\"netto\";s:1:\"0\";s:9:\"partnerID\";s:0:\"\";s:11:\"temporaryID\";s:0:\"\";s:7:\"referer\";s:0:\"\";s:11:\"cleareddate\";N;s:12:\"cleared_date\";N;s:12:\"trackingcode\";s:0:\"\";s:8:\"language\";s:1:\"2\";s:8:\"currency\";s:3:\"EUR\";s:14:\"currencyFactor\";s:1:\"1\";s:9:\"subshopID\";s:1:\"1\";s:10:\"dispatchID\";s:1:\"9\";s:10:\"currencyID\";s:1:\"1\";s:12:\"cleared_name\";s:4:\"open\";s:19:\"cleared_description\";s:4:\"Open\";s:11:\"status_name\";s:18:\"cancelled_rejected\";s:18:\"status_description\";s:18:\"Cancelled/rejected\";s:19:\"payment_description\";s:8:\"Rechnung\";s:20:\"dispatch_description\";s:16:\"Standard Versand\";s:20:\"currency_description\";s:4:\"Euro\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}s:13:\"sOrderDetails\";a:5:{i:0;a:20:{s:14:\"orderdetailsID\";s:3:\"201\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:3:\"220\";s:18:\"articleordernumber\";s:7:\"SW10001\";s:5:\"price\";s:5:\"35.99\";s:8:\"quantity\";s:1:\"1\";s:7:\"invoice\";s:5:\"35.99\";s:4:\"name\";s:27:\"Versandkostenfreier Artikel\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"0\";s:10:\"esdarticle\";s:1:\"0\";s:5:\"taxID\";s:1:\"1\";s:3:\"tax\";s:5:\"19.00\";s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"0\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}i:1;a:20:{s:14:\"orderdetailsID\";s:3:\"202\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:3:\"227\";s:18:\"articleordernumber\";s:10:\"SW10002841\";s:5:\"price\";s:5:\"35.99\";s:8:\"quantity\";s:1:\"1\";s:7:\"invoice\";s:5:\"35.99\";s:4:\"name\";s:27:\"Aufschlag bei Zahlungsarten\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"0\";s:10:\"esdarticle\";s:1:\"0\";s:5:\"taxID\";s:1:\"1\";s:3:\"tax\";s:5:\"19.00\";s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"0\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}i:2;a:20:{s:14:\"orderdetailsID\";s:3:\"203\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:3:\"219\";s:18:\"articleordernumber\";s:7:\"SW10185\";s:5:\"price\";s:4:\"54.9\";s:8:\"quantity\";s:1:\"1\";s:7:\"invoice\";s:4:\"54.9\";s:4:\"name\";s:15:\"Express Versand\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"0\";s:10:\"esdarticle\";s:1:\"0\";s:5:\"taxID\";s:1:\"1\";s:3:\"tax\";s:5:\"19.00\";s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"0\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}i:3;a:20:{s:14:\"orderdetailsID\";s:3:\"204\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:3:\"197\";s:18:\"articleordernumber\";s:7:\"SW10196\";s:5:\"price\";s:5:\"34.99\";s:8:\"quantity\";s:1:\"2\";s:7:\"invoice\";s:5:\"69.98\";s:4:\"name\";s:20:\"ESD Download Artikel\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"0\";s:10:\"esdarticle\";s:1:\"1\";s:5:\"taxID\";s:1:\"1\";s:3:\"tax\";s:5:\"19.00\";s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"1\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}i:4;a:20:{s:14:\"orderdetailsID\";s:3:\"205\";s:7:\"orderID\";s:2:\"57\";s:11:\"ordernumber\";s:5:\"20002\";s:9:\"articleID\";s:1:\"0\";s:18:\"articleordernumber\";s:19:\"sw-payment-absolute\";s:5:\"price\";s:1:\"5\";s:8:\"quantity\";s:1:\"1\";s:7:\"invoice\";s:1:\"5\";s:4:\"name\";s:25:\"Zuschlag für Zahlungsart\";s:6:\"status\";s:1:\"0\";s:7:\"shipped\";s:1:\"0\";s:12:\"shippedgroup\";s:1:\"0\";s:11:\"releasedate\";s:10:\"0000-00-00\";s:5:\"modus\";s:1:\"4\";s:10:\"esdarticle\";s:1:\"0\";s:5:\"taxID\";s:1:\"0\";s:3:\"tax\";N;s:8:\"tax_rate\";s:2:\"19\";s:3:\"esd\";s:1:\"0\";s:10:\"attributes\";a:6:{s:10:\"attribute1\";s:0:\"\";s:10:\"attribute2\";s:0:\"\";s:10:\"attribute3\";s:0:\"\";s:10:\"attribute4\";s:0:\"\";s:10:\"attribute5\";s:0:\"\";s:10:\"attribute6\";s:0:\"\";}}}s:5:\"sUser\";a:81:{s:15:\"billing_company\";s:11:\"shopware AG\";s:18:\"billing_department\";s:0:\"\";s:18:\"billing_salutation\";s:2:\"mr\";s:14:\"customernumber\";s:5:\"20001\";s:17:\"billing_firstname\";s:3:\"Max\";s:16:\"billing_lastname\";s:10:\"Mustermann\";s:14:\"billing_street\";s:20:\"Mustermannstraße 92\";s:32:\"billing_additional_address_line1\";s:0:\"\";s:32:\"billing_additional_address_line2\";s:0:\"\";s:15:\"billing_zipcode\";s:5:\"48624\";s:12:\"billing_city\";s:12:\"Schöppingen\";s:5:\"phone\";s:0:\"\";s:13:\"billing_phone\";s:0:\"\";s:17:\"billing_countryID\";s:1:\"2\";s:15:\"billing_stateID\";s:1:\"3\";s:15:\"billing_country\";s:11:\"Deutschland\";s:18:\"billing_countryiso\";s:2:\"DE\";s:19:\"billing_countryarea\";s:11:\"deutschland\";s:17:\"billing_countryen\";s:7:\"GERMANY\";s:5:\"ustid\";s:0:\"\";s:13:\"billing_text1\";N;s:13:\"billing_text2\";N;s:13:\"billing_text3\";N;s:13:\"billing_text4\";N;s:13:\"billing_text5\";N;s:13:\"billing_text6\";N;s:7:\"orderID\";s:2:\"57\";s:16:\"shipping_company\";s:11:\"shopware AG\";s:19:\"shipping_department\";s:0:\"\";s:19:\"shipping_salutation\";s:2:\"mr\";s:18:\"shipping_firstname\";s:3:\"Max\";s:17:\"shipping_lastname\";s:10:\"Mustermann\";s:15:\"shipping_street\";s:20:\"Mustermannstraße 92\";s:33:\"shipping_additional_address_line1\";s:0:\"\";s:33:\"shipping_additional_address_line2\";s:0:\"\";s:16:\"shipping_zipcode\";s:5:\"48624\";s:13:\"shipping_city\";s:12:\"Schöppingen\";s:16:\"shipping_stateID\";s:1:\"0\";s:18:\"shipping_countryID\";s:1:\"2\";s:16:\"shipping_country\";s:11:\"Deutschland\";s:19:\"shipping_countryiso\";s:2:\"DE\";s:20:\"shipping_countryarea\";s:11:\"deutschland\";s:18:\"shipping_countryen\";s:7:\"GERMANY\";s:14:\"shipping_text1\";N;s:14:\"shipping_text2\";N;s:14:\"shipping_text3\";N;s:14:\"shipping_text4\";N;s:14:\"shipping_text5\";N;s:14:\"shipping_text6\";N;s:2:\"id\";s:1:\"1\";s:8:\"password\";s:32:\"a256a310bc1e5db755fd392c524028a8\";s:7:\"encoder\";s:3:\"md5\";s:5:\"email\";s:15:\"dr@shopware.com\";s:6:\"active\";s:1:\"1\";s:11:\"accountmode\";s:1:\"0\";s:15:\"confirmationkey\";s:0:\"\";s:9:\"paymentID\";s:1:\"5\";s:10:\"firstlogin\";s:10:\"2011-11-23\";s:9:\"lastlogin\";s:19:\"2012-01-04 14:12:05\";s:9:\"sessionID\";s:26:\"uiorqd755gaar8dn89ukp178c7\";s:10:\"newsletter\";s:1:\"0\";s:10:\"validation\";s:1:\"0\";s:9:\"affiliate\";s:1:\"0\";s:13:\"customergroup\";s:2:\"EK\";s:13:\"paymentpreset\";s:1:\"0\";s:8:\"language\";s:1:\"2\";s:9:\"subshopID\";s:1:\"1\";s:7:\"referer\";s:0:\"\";s:12:\"pricegroupID\";N;s:15:\"internalcomment\";s:0:\"\";s:12:\"failedlogins\";s:1:\"0\";s:11:\"lockeduntil\";N;s:26:\"default_billing_address_id\";s:1:\"1\";s:27:\"default_shipping_address_id\";s:1:\"3\";s:5:\"title\";s:0:\"\";s:10:\"salutation\";s:2:\"mr\";s:9:\"firstname\";s:3:\"Max\";s:8:\"lastname\";s:10:\"Mustermann\";s:8:\"birthday\";N;s:11:\"preisgruppe\";s:1:\"1\";s:11:\"billing_net\";s:1:\"1\";}s:9:\"sDispatch\";a:2:{s:4:\"name\";s:16:\"Standard Versand\";s:11:\"description\";s:0:\"\";}}',0),(60,6,'sORDERSTATEMAIL6','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo {$sUser.billing_salutation|salutation} {$sUser.billing_firstname} {$sUser.billing_lastname},\n\nder Bestellstatus für Ihre Bestellung {$sOrder.ordernumber} hat sich geändert!\nDie Bestellung hat jetzt den Status: {$sOrder.status_description}.\n\nDen aktuellen Status Ihrer Bestellung  können Sie  auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen. Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',3,NULL,0),(61,7,'sORDERSTATEMAIL7','{config name=mail}','{config name=shopName}','Statusänderung zur Bestellung bei {config name=shopName}','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo {$sUser.billing_salutation|salutation} {$sUser.billing_firstname} {$sUser.billing_lastname},\n\nder Bestellstatus für Ihre Bestellung {$sOrder.ordernumber} hat sich geändert!\nDie Bestellung hat jetzt den Status: {$sOrder.status_description}.\n\nDen aktuellen Status Ihrer Bestellung  können Sie  auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen. Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',3,'a:3:{s:5:\"sShop\";s:13:\"Shopware Demo\";s:8:\"sShopURL\";s:20:\"http://localhost/5.1\";s:7:\"sConfig\";a:0:{}}',0),(62,NULL,'sBIRTHDAY','{config name=mail}','{config name=shopName}','Herzlichen Glückwunsch zum Geburtstag von {config name=shopName}','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo {$sUser.salutation|salutation} {$sUser.firstname} {$sUser.lastname},\n\nwir wünschen Ihnen alles Gute zum Geburtstag.\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','',0,'',2,NULL,0),(63,NULL,'sARTICLECOMMENT','{config name=mail}','{config name=shopName}','Artikel bewerten','{include file=\"string:{config name=emailheaderplain}\"}\r\n\r\nHallo {$sUser.billing_salutation|salutation} {$sUser.billing_firstname} {$sUser.billing_lastname},\n\nSie haben bei uns vor einigen Tagen Artikel gekauft. Wir würden uns freuen, wenn Sie diese Artikel bewerten würden.<br/>\nSo helfen Sie uns, unseren Service weiter zu steigern und Sie können auf diesem Weg anderen Interessenten direkt Ihre Meinung mitteilen.\n\n\nHier finden Sie die Links zum Bewerten der von Ihnen gekauften Produkte.\n\n{foreach from=$sArticles item=sArticle key=key}\n{if !$sArticle.modus}\n{$sArticle.articleordernumber} {$sArticle.name} {$sArticle.link}\n{/if}\n{/foreach}\r\n\r\n{include file=\"string:{config name=emailfooterplain}\"}','{include file=\"string:{config name=emailheaderhtml}\"}\r\n<br/><br/>\r\nHallo {if $sUser.salutation eq \"mr\"}Herr{elseif $sUser.billing_salutation eq \"ms\"}Frau{/if} {$sUser.billing_firstname} {$sUser.billing_lastname},\n<br/>\nSie haben bei uns vor einigen Tagen Artikel gekauft. Wir würden uns freuen, wenn Sie diese Artikel bewerten würden.<br/>\nSo helfen Sie uns, unseren Service weiter zu steigern und Sie können auf diesem Weg anderen Interessenten direkt Ihre Meinung mitteilen.\n<br/><br/>\n\nHier finden Sie die Links zum Bewerten der von Ihnen gekauften Produkte.\n\n<table>\n {foreach from=$sArticles item=sArticle key=key}\n{if !$sArticle.modus}\n <tr>\n  <td>{$sArticle.articleordernumber}</td>\n  <td>{$sArticle.name}</td>\n  <td>\n  <a href=\"{$sArticle.link}\">link</a>\n  </td>\n </tr>\n{/if}\n {/foreach}\n</table>\r\n<br/><br/>\r\n{include file=\"string:{config name=emailfooterhtml}\"}',1,'',2,NULL,0);
/*!40000 ALTER TABLE `s_core_config_mails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_config_mails_attachments`
--

DROP TABLE IF EXISTS `s_core_config_mails_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_config_mails_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mailID` int(11) NOT NULL,
  `mediaID` int(11) NOT NULL,
  `shopID` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mailID` (`mailID`,`mediaID`,`shopID`),
  KEY `mediaID` (`mediaID`),
  KEY `shopID` (`shopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_config_mails_attachments`
--

LOCK TABLES `s_core_config_mails_attachments` WRITE;
/*!40000 ALTER TABLE `s_core_config_mails_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_config_mails_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_config_mails_attributes`
--

DROP TABLE IF EXISTS `s_core_config_mails_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_config_mails_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mailID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mailID` (`mailID`),
  CONSTRAINT `s_core_config_mails_attributes_ibfk_1` FOREIGN KEY (`mailID`) REFERENCES `s_core_config_mails` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_config_mails_attributes`
--

LOCK TABLES `s_core_config_mails_attributes` WRITE;
/*!40000 ALTER TABLE `s_core_config_mails_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_config_mails_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_config_values`
--

DROP TABLE IF EXISTS `s_core_config_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_config_values` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `element_id` int(11) unsigned NOT NULL,
  `shop_id` int(11) unsigned DEFAULT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `element_id_shop_id` (`element_id`,`shop_id`),
  KEY `shop_id` (`shop_id`),
  KEY `element_id` (`element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_config_values`
--

LOCK TABLES `s_core_config_values` WRITE;
/*!40000 ALTER TABLE `s_core_config_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_config_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_countries`
--

DROP TABLE IF EXISTS `s_core_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `countryiso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `areaID` int(11) DEFAULT NULL,
  `countryen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `notice` text COLLATE utf8_unicode_ci,
  `shippingfree` int(11) DEFAULT NULL,
  `taxfree` int(11) DEFAULT NULL,
  `taxfree_ustid` int(11) DEFAULT NULL,
  `taxfree_ustid_checked` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `iso3` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_state_in_registration` int(1) NOT NULL,
  `force_state_in_registration` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `areaID` (`areaID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_countries`
--

LOCK TABLES `s_core_countries` WRITE;
/*!40000 ALTER TABLE `s_core_countries` DISABLE KEYS */;
INSERT INTO `s_core_countries` VALUES (2,'Deutschland','DE',1,'GERMANY',1,'',0,0,0,0,1,'DEU',0,0),(3,'Arabische Emirate','AE',2,'ARAB EMIRATES',10,'',0,0,0,0,0,'ARE',0,0),(4,'Australien','AU',2,'AUSTRALIA',10,'',0,0,0,0,0,'AUS',0,0),(5,'Belgien','BE',3,'BELGIUM',10,'',0,0,0,0,0,'BEL',0,0),(7,'Dänemark','DK',3,'DENMARK',10,'',0,0,0,0,0,'DNK',0,0),(8,'Finnland','FI',3,'FINLAND',10,'',0,0,0,0,0,'FIN',0,0),(9,'Frankreich','FR',3,'FRANCE',10,'',0,0,0,0,0,'FRA',0,0),(10,'Griechenland','GR',3,'GREECE',10,'',0,0,0,0,0,'GRC',0,0),(11,'Großbritannien','GB',3,'GREAT BRITAIN',10,'',0,0,0,0,0,'GBR',0,0),(12,'Irland','IE',3,'IRELAND',10,'',0,0,0,0,0,'IRL',0,0),(13,'Island','IS',3,'ICELAND',10,'',0,0,0,0,0,'ISL',0,0),(14,'Italien','IT',3,'ITALY',10,'',0,0,0,0,0,'ITA',0,0),(15,'Japan','JP',2,'JAPAN',10,'',0,0,0,0,0,'JPN',0,0),(16,'Kanada','CA',2,'CANADA',10,'',0,0,0,0,0,'CAN',0,0),(18,'Luxemburg','LU',3,'LUXEMBOURG',10,'',0,0,0,0,0,'LUX',0,0),(20,'Namibia','NA',2,'NAMIBIA',10,'',0,0,0,0,0,'NAM',0,0),(21,'Niederlande','NL',3,'NETHERLANDS',10,'',0,0,0,0,0,'NLD',0,0),(22,'Norwegen','NO',3,'NORWAY',10,'',0,0,0,0,0,'NOR',0,0),(23,'Österreich','AT',3,'AUSTRIA',1,'',0,0,0,0,0,'AUT',0,0),(24,'Portugal','PT',3,'PORTUGAL',10,'',0,0,0,0,0,'PRT',0,0),(25,'Schweden','SE',3,'SWEDEN',10,'',0,0,0,0,0,'SWE',0,0),(26,'Schweiz','CH',3,'SWITZERLAND',10,'',0,1,0,0,0,'CHE',0,0),(27,'Spanien','ES',3,'SPAIN',10,'',0,0,0,0,0,'ESP',0,0),(28,'USA','US',2,'USA',10,'',0,0,0,0,0,'USA',0,0),(29,'Liechtenstein','LI',3,'LIECHTENSTEIN',10,'',0,0,0,0,0,'LIE',0,0),(30,'Polen','PL',3,'POLAND',10,'',0,0,0,0,0,'POL',0,0),(31,'Ungarn','HU',3,'HUNGARY',10,'',0,0,0,0,0,'HUN',0,0),(32,'Türkei','TR',2,'TURKEY',10,'',0,0,0,0,0,'TUR',0,0),(33,'Tschechien','CZ',3,'CZECH REPUBLIC',10,'',0,0,0,0,0,'CZE',0,0),(34,'Slowakei','SK',3,'SLOVAKIA',10,'',0,0,0,0,0,'SVK',0,0),(35,'Rum&auml;nien','RO',3,'ROMANIA',10,'',0,0,0,0,0,'ROU',0,0),(36,'Brasilien','BR',2,'BRAZIL',10,'',0,0,0,0,0,'BRA',0,0),(37,'Israel','IL',2,'ISRAEL',10,'',0,0,0,0,0,'ISR',0,0);
/*!40000 ALTER TABLE `s_core_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_countries_areas`
--

DROP TABLE IF EXISTS `s_core_countries_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_countries_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_countries_areas`
--

LOCK TABLES `s_core_countries_areas` WRITE;
/*!40000 ALTER TABLE `s_core_countries_areas` DISABLE KEYS */;
INSERT INTO `s_core_countries_areas` VALUES (1,'deutschland',1),(2,'welt',1),(3,'europa',1);
/*!40000 ALTER TABLE `s_core_countries_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_countries_attributes`
--

DROP TABLE IF EXISTS `s_core_countries_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_countries_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `countryID` (`countryID`),
  CONSTRAINT `s_core_countries_attributes_ibfk_1` FOREIGN KEY (`countryID`) REFERENCES `s_core_countries` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_countries_attributes`
--

LOCK TABLES `s_core_countries_attributes` WRITE;
/*!40000 ALTER TABLE `s_core_countries_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_countries_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_countries_states`
--

DROP TABLE IF EXISTS `s_core_countries_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_countries_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryID` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shortcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `countryID` (`countryID`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_countries_states`
--

LOCK TABLES `s_core_countries_states` WRITE;
/*!40000 ALTER TABLE `s_core_countries_states` DISABLE KEYS */;
INSERT INTO `s_core_countries_states` VALUES (2,2,'Niedersachsen','NI',0,1),(3,2,'Nordrhein-Westfalen','NW',0,1),(5,2,'Baden-Württemberg','BW',0,1),(6,2,'Bayern','BY',0,1),(7,2,'Berlin','BE',0,1),(8,2,'Brandenburg','BB',0,1),(9,2,'Bremen','HB',0,1),(10,2,'Hamburg','HH',0,1),(11,2,'Hessen','HE',0,1),(12,2,'Mecklenburg-Vorpommern','MV',0,1),(13,2,'Rheinland-Pfalz','RP',0,1),(14,2,'Saarland','SL',0,1),(15,2,'Sachsen','SN',0,1),(16,2,'Sachsen-Anhalt','ST',0,1),(17,2,'Schleswig-Holstein','SH',0,1),(18,2,'Thüringen','TH',0,1),(20,28,'Alabama','AL',0,1),(21,28,'Alaska','AK',0,1),(22,28,'Arizona','AZ',0,1),(23,28,'Arkansas','AR',0,1),(24,28,'Kalifornien','CA',0,1),(25,28,'Colorado','CO',0,1),(26,28,'Connecticut','CT',0,1),(27,28,'Delaware','DE',0,1),(28,28,'Florida','FL',0,1),(29,28,'Georgia','GA',0,1),(30,28,'Hawaii','HI',0,1),(31,28,'Idaho','ID',0,1),(32,28,'Illinois','IL',0,1),(33,28,'Indiana','IN',0,1),(34,28,'Iowa','IA',0,1),(35,28,'Kansas','KS',0,1),(36,28,'Kentucky','KY',0,1),(37,28,'Louisiana','LA',0,1),(38,28,'Maine','ME',0,1),(39,28,'Maryland','MD',0,1),(40,28,'Massachusetts','MA',0,1),(41,28,'Michigan','MI',0,1),(42,28,'Minnesota','MN',0,1),(43,28,'Mississippi','MS',0,1),(44,28,'Missouri','MO',0,1),(45,28,'Montana','MT',0,1),(46,28,'Nebraska','NE',0,1),(47,28,'Nevada','NV',0,1),(48,28,'New Hampshire','NH',0,1),(49,28,'New Jersey','NJ',0,1),(50,28,'New Mexico','NM',0,1),(51,28,'New York','NY',0,1),(52,28,'North Carolina','NC',0,1),(53,28,'North Dakota','ND',0,1),(54,28,'Ohio','OH',0,1),(55,28,'Oklahoma','OK',0,1),(56,28,'Oregon','OR',0,1),(57,28,'Pennsylvania','PA',0,1),(58,28,'Rhode Island','RI',0,1),(59,28,'South Carolina','SC',0,1),(60,28,'South Dakota','SD',0,1),(61,28,'Tennessee','TN',0,1),(62,28,'Texas','TX',0,1),(63,28,'Utah','UT',0,1),(64,28,'Vermont','VT',0,1),(65,28,'Virginia','VA',0,1),(66,28,'Washington','WA',0,1),(67,28,'West Virginia','WV',0,1),(68,28,'Wisconsin','WI',0,1),(69,28,'Wyoming','WY',0,1);
/*!40000 ALTER TABLE `s_core_countries_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_countries_states_attributes`
--

DROP TABLE IF EXISTS `s_core_countries_states_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_countries_states_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stateID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stateID` (`stateID`),
  CONSTRAINT `s_core_countries_states_attributes_ibfk_1` FOREIGN KEY (`stateID`) REFERENCES `s_core_countries_states` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_countries_states_attributes`
--

LOCK TABLES `s_core_countries_states_attributes` WRITE;
/*!40000 ALTER TABLE `s_core_countries_states_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_countries_states_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_currencies`
--

DROP TABLE IF EXISTS `s_core_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `standard` int(1) NOT NULL,
  `factor` double NOT NULL,
  `templatechar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol_position` int(11) unsigned NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_currencies`
--

LOCK TABLES `s_core_currencies` WRITE;
/*!40000 ALTER TABLE `s_core_currencies` DISABLE KEYS */;
INSERT INTO `s_core_currencies` VALUES (1,'EUR','Euro',1,1,'&euro;',0,0);
/*!40000 ALTER TABLE `s_core_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_customergroups`
--

DROP TABLE IF EXISTS `s_core_customergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_customergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupkey` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `tax` int(1) NOT NULL DEFAULT '0',
  `taxinput` int(1) NOT NULL,
  `mode` int(11) NOT NULL,
  `discount` double NOT NULL,
  `minimumorder` double NOT NULL,
  `minimumordersurcharge` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupkey` (`groupkey`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_customergroups`
--

LOCK TABLES `s_core_customergroups` WRITE;
/*!40000 ALTER TABLE `s_core_customergroups` DISABLE KEYS */;
INSERT INTO `s_core_customergroups` VALUES (1,'EK','Shopkunden',1,1,0,0,10,5),(2,'H','Händler',1,0,0,0,0,0);
/*!40000 ALTER TABLE `s_core_customergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_customergroups_attributes`
--

DROP TABLE IF EXISTS `s_core_customergroups_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_customergroups_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerGroupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customerGroupID` (`customerGroupID`),
  CONSTRAINT `s_core_customergroups_attributes_ibfk_1` FOREIGN KEY (`customerGroupID`) REFERENCES `s_core_customergroups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_customergroups_attributes`
--

LOCK TABLES `s_core_customergroups_attributes` WRITE;
/*!40000 ALTER TABLE `s_core_customergroups_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_customergroups_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_customergroups_discounts`
--

DROP TABLE IF EXISTS `s_core_customergroups_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_customergroups_discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupID` int(11) NOT NULL,
  `basketdiscount` double NOT NULL,
  `basketdiscountstart` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groupID` (`groupID`,`basketdiscountstart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_customergroups_discounts`
--

LOCK TABLES `s_core_customergroups_discounts` WRITE;
/*!40000 ALTER TABLE `s_core_customergroups_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_customergroups_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_customerpricegroups`
--

DROP TABLE IF EXISTS `s_core_customerpricegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_customerpricegroups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `netto` int(1) unsigned NOT NULL,
  `active` int(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_customerpricegroups`
--

LOCK TABLES `s_core_customerpricegroups` WRITE;
/*!40000 ALTER TABLE `s_core_customerpricegroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_customerpricegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_detail_states`
--

DROP TABLE IF EXISTS `s_core_detail_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_detail_states` (
  `id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `mail` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_detail_states`
--

LOCK TABLES `s_core_detail_states` WRITE;
/*!40000 ALTER TABLE `s_core_detail_states` DISABLE KEYS */;
INSERT INTO `s_core_detail_states` VALUES (0,'Offen',1,0),(1,'In Bearbeitung',2,0),(2,'Storniert',3,0),(3,'Abgeschlossen',4,0);
/*!40000 ALTER TABLE `s_core_detail_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_documents`
--

DROP TABLE IF EXISTS `s_core_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numbers` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `left` int(11) NOT NULL,
  `right` int(11) NOT NULL,
  `top` int(11) NOT NULL,
  `bottom` int(11) NOT NULL,
  `pagebreak` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_documents`
--

LOCK TABLES `s_core_documents` WRITE;
/*!40000 ALTER TABLE `s_core_documents` DISABLE KEYS */;
INSERT INTO `s_core_documents` VALUES (1,'Rechnung','index.tpl','doc_0',25,10,20,20,10),(2,'Lieferschein','index_ls.tpl','doc_1',25,10,20,20,10),(3,'Gutschrift','index_gs.tpl','doc_2',25,10,20,20,10),(4,'Stornorechnung','index_sr.tpl','doc_3',25,10,20,20,10);
/*!40000 ALTER TABLE `s_core_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_documents_box`
--

DROP TABLE IF EXISTS `s_core_documents_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_documents_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documentID` int(11) NOT NULL,
  `name` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `style` longtext COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_documents_box`
--

LOCK TABLES `s_core_documents_box` WRITE;
/*!40000 ALTER TABLE `s_core_documents_box` DISABLE KEYS */;
INSERT INTO `s_core_documents_box` VALUES (1,1,'Body','width:100%;\r\nfont-family: Verdana, Arial, Helvetica, sans-serif;\r\nfont-size:11px;',''),(2,1,'Logo','height: 20mm;\r\nwidth: 90mm;\r\nmargin-bottom:5mm;','<p><img src=\"http://www.shopware.de/logo/logo.png\" alt=\"\" /></p>'),(3,1,'Header_Recipient','',''),(4,1,'Header','height: 60mm;',''),(5,1,'Header_Sender','','<p>Demo GmbH - Stra&szlig;e 3 - 00000 Musterstadt</p>'),(6,1,'Header_Box_Left','width: 120mm;\r\nheight:60mm;\r\nfloat:left;',''),(7,1,'Header_Box_Right','width: 45mm;\r\nheight: 60mm;\r\nfloat:left;\r\nmargin-top:-20px;\r\nmargin-left:5px;','<p><strong>Demo GmbH </strong><br /> Max Mustermann<br /> Stra&szlig;e 3<br /> 00000 Musterstadt<br /> Fon: 01234 / 56789<br /> Fax: 01234 / 			56780<br />info@demo.de<br />www.demo.de</p>'),(8,1,'Header_Box_Bottom','font-size:14px;\r\nheight: 10mm;',''),(9,1,'Content','height: 65mm;\r\nwidth: 170mm;',''),(10,1,'Td','white-space:nowrap;\r\npadding: 5px 0;',''),(11,1,'Td_Name','white-space:normal;',''),(12,1,'Td_Line','border-bottom: 1px solid #999;\r\nheight: 0px;',''),(13,1,'Td_Head','border-bottom:1px solid #000;',''),(14,1,'Footer','width: 170mm;\r\nposition:fixed;\r\nbottom:-20mm;\r\nheight: 15mm;','<table style=\"vertical-align: top;\" width=\"100%\" border=\"0\">\r\n<tbody>\r\n<tr valign=\"top\">\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">Demo GmbH</span></p>\r\n<p><span style=\"font-size: xx-small;\">Steuer-Nr <br />UST-ID: <br />Finanzamt </span><span style=\"font-size: xx-small;\">Musterstadt</span></p>\r\n</td>\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">Bankverbindung</span></p>\r\n<p><span style=\"font-size: xx-small;\">Sparkasse Musterstadt<br />BLZ: <br />Konto: </span></p>\r\n<span style=\"font-size: xx-small;\">aaaa<br /></span></td>\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">AGB<br /></span></p>\r\n<p><span style=\"font-size: xx-small;\">Gerichtsstand ist Musterstadt<br />Erf&uuml;llungsort Musterstadt<br />Gelieferte Ware bleibt bis zur vollst&auml;ndigen Bezahlung unser Eigentum</span></p>\r\n</td>\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">Gesch&auml;ftsf&uuml;hrer</span></p>\r\n<p><span style=\"font-size: xx-small;\">Max Mustermann</span></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),(15,1,'Content_Amount','margin-left:90mm;',''),(16,1,'Content_Info','','<p>Die Ware bleibt bis zur vollst&auml;ndigen Bezahlung unser Eigentum</p>'),(68,2,'Body','width:100%;\r\nfont-family: Verdana, Arial, Helvetica, sans-serif;\r\nfont-size:11px;',''),(69,2,'Logo','height: 20mm;\r\nwidth: 90mm;\r\nmargin-bottom:5mm;','<p><img src=\"http://www.shopware.de/logo/logo.png\" alt=\"\" /></p>'),(70,2,'Header_Recipient','',''),(71,2,'Header','height: 60mm;',''),(72,2,'Header_Sender','','<p>Demo GmbH - Stra&szlig;e 3 - 00000 Musterstadt</p>'),(73,2,'Header_Box_Left','width: 120mm;\r\nheight:60mm;\r\nfloat:left;',''),(74,2,'Header_Box_Right','width: 45mm;\r\nheight: 60mm;\r\nfloat:left;\r\nmargin-top:-20px;\r\nmargin-left:5px;','<p><strong>Demo GmbH </strong><br /> Max Mustermann<br /> Stra&szlig;e 3<br /> 00000 Musterstadt<br /> Fon: 01234 / 56789<br /> Fax: 01234 / 			56780<br />info@demo.de<br />www.demo.de</p>'),(75,2,'Header_Box_Bottom','font-size:14px;\r\nheight: 10mm;',''),(76,2,'Content','height: 65mm;\r\nwidth: 170mm;',''),(77,2,'Td','white-space:nowrap;\r\npadding: 5px 0;',''),(78,2,'Td_Name','white-space:normal;',''),(79,2,'Td_Line','border-bottom: 1px solid #999;\r\nheight: 0px;',''),(80,2,'Td_Head','border-bottom:1px solid #000;',''),(81,2,'Footer','width: 170mm;\r\nposition:fixed;\r\nbottom:-20mm;\r\nheight: 15mm;','<table style=\"vertical-align: top;\" width=\"100%\" border=\"0\">\r\n<tbody>\r\n<tr valign=\"top\">\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">Demo GmbH</span></p>\r\n<p><span style=\"font-size: xx-small;\">Steuer-Nr <br />UST-ID: <br />Finanzamt </span><span style=\"font-size: xx-small;\">Musterstadt</span></p>\r\n</td>\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">Bankverbindung</span></p>\r\n<p><span style=\"font-size: xx-small;\">Sparkasse Musterstadt<br />BLZ: <br />Konto: </span></p>\r\n<span style=\"font-size: xx-small;\">aaaa<br /></span></td>\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">AGB<br /></span></p>\r\n<p><span style=\"font-size: xx-small;\">Gerichtsstand ist Musterstadt<br />Erf&uuml;llungsort Musterstadt<br />Gelieferte Ware bleibt bis zur vollst&auml;ndigen Bezahlung unser Eigentum</span></p>\r\n</td>\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">Gesch&auml;ftsf&uuml;hrer</span></p>\r\n<p><span style=\"font-size: xx-small;\">Max Mustermann</span></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),(82,2,'Content_Amount','margin-left:90mm;',''),(83,2,'Content_Info','','<p>Die Ware bleibt bis zur vollst&auml;ndigen Bezahlung unser Eigentum</p>'),(84,3,'Body','width:100%;\r\nfont-family: Verdana, Arial, Helvetica, sans-serif;\r\nfont-size:11px;',''),(85,3,'Logo','height: 20mm;\r\nwidth: 90mm;\r\nmargin-bottom:5mm;','<p><img src=\"http://www.shopware.de/logo/logo.png\" alt=\"\" /></p>'),(86,3,'Header_Recipient','',''),(87,3,'Header','height: 60mm;',''),(88,3,'Header_Sender','','<p>Demo GmbH - Stra&szlig;e 3 - 00000 Musterstadt</p>'),(89,3,'Header_Box_Left','width: 120mm;\r\nheight:60mm;\r\nfloat:left;',''),(90,3,'Header_Box_Right','width: 45mm;\r\nheight: 60mm;\r\nfloat:left;\r\nmargin-top:-20px;\r\nmargin-left:5px;','<p><strong>Demo GmbH </strong><br /> Max Mustermann<br /> Stra&szlig;e 3<br /> 00000 Musterstadt<br /> Fon: 01234 / 56789<br /> Fax: 01234 / 			56780<br />info@demo.de<br />www.demo.de</p>'),(91,3,'Header_Box_Bottom','font-size:14px;\r\nheight: 10mm;',''),(92,3,'Content','height: 65mm;\r\nwidth: 170mm;',''),(93,3,'Td','white-space:nowrap;\r\npadding: 5px 0;',''),(94,3,'Td_Name','white-space:normal;',''),(95,3,'Td_Line','border-bottom: 1px solid #999;\r\nheight: 0px;',''),(96,3,'Td_Head','border-bottom:1px solid #000;',''),(97,3,'Footer','width: 170mm;\r\nposition:fixed;\r\nbottom:-20mm;\r\nheight: 15mm;','<table style=\"vertical-align: top;\" width=\"100%\" border=\"0\">\r\n<tbody>\r\n<tr valign=\"top\">\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">Demo GmbH</span></p>\r\n<p><span style=\"font-size: xx-small;\">Steuer-Nr <br />UST-ID: <br />Finanzamt </span><span style=\"font-size: xx-small;\">Musterstadt</span></p>\r\n</td>\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">Bankverbindung</span></p>\r\n<p><span style=\"font-size: xx-small;\">Sparkasse Musterstadt<br />BLZ: <br />Konto: </span></p>\r\n<span style=\"font-size: xx-small;\">aaaa<br /></span></td>\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">AGB<br /></span></p>\r\n<p><span style=\"font-size: xx-small;\">Gerichtsstand ist Musterstadt<br />Erf&uuml;llungsort Musterstadt<br />Gelieferte Ware bleibt bis zur vollst&auml;ndigen Bezahlung unser Eigentum</span></p>\r\n</td>\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">Gesch&auml;ftsf&uuml;hrer</span></p>\r\n<p><span style=\"font-size: xx-small;\">Max Mustermann</span></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),(98,3,'Content_Amount','margin-left:90mm;',''),(99,3,'Content_Info','','<p>Die Ware bleibt bis zur vollst&auml;ndigen Bezahlung unser Eigentum</p>'),(100,4,'Body','width:100%;\r\nfont-family: Verdana, Arial, Helvetica, sans-serif;\r\nfont-size:11px;',''),(101,4,'Logo','height: 20mm;\r\nwidth: 90mm;\r\nmargin-bottom:5mm;','<p><img src=\"http://www.shopware.de/logo/logo.png\" alt=\"\" /></p>'),(102,4,'Header_Recipient','',''),(103,4,'Header','height: 60mm;',''),(104,4,'Header_Sender','','<p>Demo GmbH - Stra&szlig;e 3 - 00000 Musterstadt</p>'),(105,4,'Header_Box_Left','width: 120mm;\r\nheight:60mm;\r\nfloat:left;',''),(106,4,'Header_Box_Right','width: 45mm;\r\nheight: 60mm;\r\nfloat:left;\r\nmargin-top:-20px;\r\nmargin-left:5px;','<p><strong>Demo GmbH </strong><br /> Max Mustermann<br /> Stra&szlig;e 3<br /> 00000 Musterstadt<br /> Fon: 01234 / 56789<br /> Fax: 01234 / 			56780<br />info@demo.de<br />www.demo.de</p>'),(107,4,'Header_Box_Bottom','font-size:14px;\r\nheight: 10mm;',''),(108,4,'Content','height: 65mm;\r\nwidth: 170mm;',''),(109,4,'Td','white-space:nowrap;\r\npadding: 5px 0;',''),(110,4,'Td_Name','white-space:normal;',''),(111,4,'Td_Line','border-bottom: 1px solid #999;\r\nheight: 0px;',''),(112,4,'Td_Head','border-bottom:1px solid #000;',''),(113,4,'Footer','width: 170mm;\r\nposition:fixed;\r\nbottom:-20mm;\r\nheight: 15mm;','<table style=\"vertical-align: top;\" width=\"100%\" border=\"0\">\r\n<tbody>\r\n<tr valign=\"top\">\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">Demo GmbH</span></p>\r\n<p><span style=\"font-size: xx-small;\">Steuer-Nr <br />UST-ID: <br />Finanzamt </span><span style=\"font-size: xx-small;\">Musterstadt</span></p>\r\n</td>\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">Bankverbindung</span></p>\r\n<p><span style=\"font-size: xx-small;\">Sparkasse Musterstadt<br />BLZ: <br />Konto: </span></p>\r\n<span style=\"font-size: xx-small;\">aaaa<br /></span></td>\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">AGB<br /></span></p>\r\n<p><span style=\"font-size: xx-small;\">Gerichtsstand ist Musterstadt<br />Erf&uuml;llungsort Musterstadt<br />Gelieferte Ware bleibt bis zur vollst&auml;ndigen Bezahlung unser Eigentum</span></p>\r\n</td>\r\n<td style=\"width: 25%;\">\r\n<p><span style=\"font-size: xx-small;\">Gesch&auml;ftsf&uuml;hrer</span></p>\r\n<p><span style=\"font-size: xx-small;\">Max Mustermann</span></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>'),(114,4,'Content_Amount','margin-left:90mm;',''),(115,4,'Content_Info','','<p>Die Ware bleibt bis zur vollst&auml;ndigen Bezahlung unser Eigentum</p>');
/*!40000 ALTER TABLE `s_core_documents_box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_engine_elements`
--

DROP TABLE IF EXISTS `s_core_engine_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_engine_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupID` int(11) unsigned NOT NULL DEFAULT '0',
  `domname` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `store` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `required` int(1) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `layout` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `variantable` int(1) unsigned NOT NULL,
  `help` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translatable` int(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `databasefield` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_engine_elements`
--

LOCK TABLES `s_core_engine_elements` WRITE;
/*!40000 ALTER TABLE `s_core_engine_elements` DISABLE KEYS */;
INSERT INTO `s_core_engine_elements` VALUES (22,7,'attr[3]','','textarea',NULL,'Kommentar',0,3,'attr3','',0,'Optionaler Kommentar',1),(33,7,'attr[1]','','text',NULL,'Freitext-1',0,1,'attr1','w200',1,'Freitext zur Anzeige auf der Detailseite',1),(34,7,'attr[2]','','text',NULL,'Freitext-2',0,2,'attr2','w200',1,'Freitext zur Anzeige auf der Detailseite',1);
/*!40000 ALTER TABLE `s_core_engine_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_engine_groups`
--

DROP TABLE IF EXISTS `s_core_engine_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_engine_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `layout` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `variantable` int(1) unsigned NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_engine_groups`
--

LOCK TABLES `s_core_engine_groups` WRITE;
/*!40000 ALTER TABLE `s_core_engine_groups` DISABLE KEYS */;
INSERT INTO `s_core_engine_groups` VALUES (1,'basic','Stammdaten','column',1,1),(2,'description','Beschreibung',NULL,0,2),(3,'advanced','Einstellungen','column',1,5),(7,'additional','Zusatzfelder',NULL,1,7),(8,'reference_price','Grundpreisberechnung',NULL,0,4),(10,'price','Preise und Kundengruppen',NULL,0,3),(11,'property','Eigenschaften',NULL,0,6);
/*!40000 ALTER TABLE `s_core_engine_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_licenses`
--

DROP TABLE IF EXISTS `s_core_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_licenses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `license` text COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) unsigned NOT NULL,
  `source` int(11) unsigned NOT NULL,
  `added` date NOT NULL,
  `creation` date DEFAULT NULL,
  `expiration` date DEFAULT NULL,
  `active` int(1) NOT NULL,
  `plugin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_licenses`
--

LOCK TABLES `s_core_licenses` WRITE;
/*!40000 ALTER TABLE `s_core_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_locales`
--

DROP TABLE IF EXISTS `s_core_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_locales` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `territory` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locale` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_locales`
--

LOCK TABLES `s_core_locales` WRITE;
/*!40000 ALTER TABLE `s_core_locales` DISABLE KEYS */;
INSERT INTO `s_core_locales` VALUES (1,'de_DE','Deutsch','Deutschland'),(2,'en_GB','Englisch','Vereinigtes Königreich'),(3,'aa_DJ','Afar','Dschibuti'),(4,'aa_ER','Afar','Eritrea'),(5,'aa_ET','Afar','Äthiopien'),(6,'af_NA','Afrikaans','Namibia'),(7,'af_ZA','Afrikaans','Südafrika'),(8,'ak_GH','Akan','Ghana'),(9,'am_ET','Amharisch','Äthiopien'),(10,'ar_AE','Arabisch','Vereinigte Arabische Emirate'),(11,'ar_BH','Arabisch','Bahrain'),(12,'ar_DZ','Arabisch','Algerien'),(13,'ar_EG','Arabisch','Ägypten'),(14,'ar_IQ','Arabisch','Irak'),(15,'ar_JO','Arabisch','Jordanien'),(16,'ar_KW','Arabisch','Kuwait'),(17,'ar_LB','Arabisch','Libanon'),(18,'ar_LY','Arabisch','Libyen'),(19,'ar_MA','Arabisch','Marokko'),(20,'ar_OM','Arabisch','Oman'),(21,'ar_QA','Arabisch','Katar'),(22,'ar_SA','Arabisch','Saudi-Arabien'),(23,'ar_SD','Arabisch','Sudan'),(24,'ar_SY','Arabisch','Syrien'),(25,'ar_TN','Arabisch','Tunesien'),(26,'ar_YE','Arabisch','Jemen'),(27,'as_IN','Assamesisch','Indien'),(28,'az_AZ','Aserbaidschanisch','Aserbaidschan'),(29,'be_BY','Weißrussisch','Belarus'),(30,'bg_BG','Bulgarisch','Bulgarien'),(31,'bn_BD','Bengalisch','Bangladesch'),(32,'bn_IN','Bengalisch','Indien'),(33,'bo_CN','Tibetisch','China'),(34,'bo_IN','Tibetisch','Indien'),(35,'bs_BA','Bosnisch','Bosnien und Herzegowina'),(36,'byn_ER','Blin','Eritrea'),(37,'ca_ES','Katalanisch','Spanien'),(38,'cch_NG','Atsam','Nigeria'),(39,'cs_CZ','Tschechisch','Tschechische Republik'),(40,'cy_GB','Walisisch','Vereinigtes Königreich'),(41,'da_DK','Dänisch','Dänemark'),(42,'de_AT','Deutsch','Österreich'),(43,'de_BE','Deutsch','Belgien'),(44,'de_CH','Deutsch','Schweiz'),(45,'de_LI','Deutsch','Liechtenstein'),(46,'de_LU','Deutsch','Luxemburg'),(47,'dv_MV','Maledivisch','Malediven'),(48,'dz_BT','Bhutanisch','Bhutan'),(49,'ee_GH','Ewe-Sprache','Ghana'),(50,'ee_TG','Ewe-Sprache','Togo'),(51,'el_CY','Griechisch','Zypern'),(52,'el_GR','Griechisch','Griechenland'),(53,'en_AS','Englisch','Amerikanisch-Samoa'),(54,'en_AU','Englisch','Australien'),(55,'en_BE','Englisch','Belgien'),(56,'en_BW','Englisch','Botsuana'),(57,'en_BZ','Englisch','Belize'),(58,'en_CA','Englisch','Kanada'),(59,'en_GU','Englisch','Guam'),(60,'en_HK','Englisch','Sonderverwaltungszone Hongkong'),(61,'en_IE','Englisch','Irland'),(62,'en_IN','Englisch','Indien'),(63,'en_JM','Englisch','Jamaika'),(64,'en_MH','Englisch','Marshallinseln'),(65,'en_MP','Englisch','Nördliche Marianen'),(66,'en_MT','Englisch','Malta'),(67,'en_NA','Englisch','Namibia'),(68,'en_NZ','Englisch','Neuseeland'),(69,'en_PH','Englisch','Philippinen'),(70,'en_PK','Englisch','Pakistan'),(71,'en_SG','Englisch','Singapur'),(72,'en_TT','Englisch','Trinidad und Tobago'),(73,'en_UM','Englisch','Amerikanisch-Ozeanien'),(74,'en_US','Englisch','Vereinigte Staaten'),(75,'en_VI','Englisch','Amerikanische Jungferninseln'),(76,'en_ZA','Englisch','Südafrika'),(77,'en_ZW','Englisch','Simbabwe'),(78,'es_AR','Spanisch','Argentinien'),(79,'es_BO','Spanisch','Bolivien'),(80,'es_CL','Spanisch','Chile'),(81,'es_CO','Spanisch','Kolumbien'),(82,'es_CR','Spanisch','Costa Rica'),(83,'es_DO','Spanisch','Dominikanische Republik'),(84,'es_EC','Spanisch','Ecuador'),(85,'es_ES','Spanisch','Spanien'),(86,'es_GT','Spanisch','Guatemala'),(87,'es_HN','Spanisch','Honduras'),(88,'es_MX','Spanisch','Mexiko'),(89,'es_NI','Spanisch','Nicaragua'),(90,'es_PA','Spanisch','Panama'),(91,'es_PE','Spanisch','Peru'),(92,'es_PR','Spanisch','Puerto Rico'),(93,'es_PY','Spanisch','Paraguay'),(94,'es_SV','Spanisch','El Salvador'),(95,'es_US','Spanisch','Vereinigte Staaten'),(96,'es_UY','Spanisch','Uruguay'),(97,'es_VE','Spanisch','Venezuela'),(98,'et_EE','Estnisch','Estland'),(99,'eu_ES','Baskisch','Spanien'),(100,'fa_AF','Persisch','Afghanistan'),(101,'fa_IR','Persisch','Iran'),(102,'fi_FI','Finnisch','Finnland'),(103,'fil_PH','Filipino','Philippinen'),(104,'fo_FO','Färöisch','Färöer'),(105,'fr_BE','Französisch','Belgien'),(106,'fr_CA','Französisch','Kanada'),(107,'fr_CH','Französisch','Schweiz'),(108,'fr_FR','Französisch','Frankreich'),(109,'fr_LU','Französisch','Luxemburg'),(110,'fr_MC','Französisch','Monaco'),(111,'fr_SN','Französisch','Senegal'),(112,'fur_IT','Friulisch','Italien'),(113,'ga_IE','Irisch','Irland'),(114,'gaa_GH','Ga-Sprache','Ghana'),(115,'gez_ER','Geez','Eritrea'),(116,'gez_ET','Geez','Äthiopien'),(117,'gl_ES','Galizisch','Spanien'),(118,'gsw_CH','Schweizerdeutsch','Schweiz'),(119,'gu_IN','Gujarati','Indien'),(120,'gv_GB','Manx','Vereinigtes Königreich'),(121,'ha_GH','Hausa','Ghana'),(122,'ha_NE','Hausa','Niger'),(123,'ha_NG','Hausa','Nigeria'),(124,'ha_SD','Hausa','Sudan'),(125,'haw_US','Hawaiisch','Vereinigte Staaten'),(126,'he_IL','Hebräisch','Israel'),(127,'hi_IN','Hindi','Indien'),(128,'hr_HR','Kroatisch','Kroatien'),(129,'hu_HU','Ungarisch','Ungarn'),(130,'hy_AM','Armenisch','Armenien'),(131,'id_ID','Indonesisch','Indonesien'),(132,'ig_NG','Igbo-Sprache','Nigeria'),(133,'ii_CN','Sichuan Yi','China'),(134,'is_IS','Isländisch','Island'),(135,'it_CH','Italienisch','Schweiz'),(136,'it_IT','Italienisch','Italien'),(137,'ja_JP','Japanisch','Japan'),(138,'ka_GE','Georgisch','Georgien'),(139,'kaj_NG','Jju','Nigeria'),(140,'kam_KE','Kamba','Kenia'),(141,'kcg_NG','Tyap','Nigeria'),(142,'kfo_CI','Koro','Côte d?Ivoire'),(143,'kk_KZ','Kasachisch','Kasachstan'),(144,'kl_GL','Grönländisch','Grönland'),(145,'km_KH','Kambodschanisch','Kambodscha'),(146,'kn_IN','Kannada','Indien'),(147,'ko_KR','Koreanisch','Republik Korea'),(148,'kok_IN','Konkani','Indien'),(149,'kpe_GN','Kpelle-Sprache','Guinea'),(150,'kpe_LR','Kpelle-Sprache','Liberia'),(151,'ku_IQ','Kurdisch','Irak'),(152,'ku_IR','Kurdisch','Iran'),(153,'ku_SY','Kurdisch','Syrien'),(154,'ku_TR','Kurdisch','Türkei'),(155,'kw_GB','Kornisch','Vereinigtes Königreich'),(156,'ky_KG','Kirgisisch','Kirgisistan'),(157,'ln_CD','Lingala','Demokratische Republik Kongo'),(158,'ln_CG','Lingala','Kongo'),(159,'lo_LA','Laotisch','Laos'),(160,'lt_LT','Litauisch','Litauen'),(161,'lv_LV','Lettisch','Lettland'),(162,'mk_MK','Mazedonisch','Mazedonien'),(163,'ml_IN','Malayalam','Indien'),(164,'mn_CN','Mongolisch','China'),(165,'mn_MN','Mongolisch','Mongolei'),(166,'mr_IN','Marathi','Indien'),(167,'ms_BN','Malaiisch','Brunei Darussalam'),(168,'ms_MY','Malaiisch','Malaysia'),(169,'mt_MT','Maltesisch','Malta'),(170,'my_MM','Birmanisch','Myanmar'),(171,'nb_NO','Norwegisch Bokmål','Norwegen'),(172,'nds_DE','Niederdeutsch','Deutschland'),(173,'ne_IN','Nepalesisch','Indien'),(174,'ne_NP','Nepalesisch','Nepal'),(175,'nl_BE','Niederländisch','Belgien'),(176,'nl_NL','Niederländisch','Niederlande'),(177,'nn_NO','Norwegisch Nynorsk','Norwegen'),(178,'nr_ZA','Süd-Ndebele-Sprache','Südafrika'),(179,'nso_ZA','Nord-Sotho-Sprache','Südafrika'),(180,'ny_MW','Nyanja-Sprache','Malawi'),(181,'oc_FR','Okzitanisch','Frankreich'),(182,'om_ET','Oromo','Äthiopien'),(183,'om_KE','Oromo','Kenia'),(184,'or_IN','Orija','Indien'),(185,'pa_IN','Pandschabisch','Indien'),(186,'pa_PK','Pandschabisch','Pakistan'),(187,'pl_PL','Polnisch','Polen'),(188,'ps_AF','Paschtu','Afghanistan'),(189,'pt_BR','Portugiesisch','Brasilien'),(190,'pt_PT','Portugiesisch','Portugal'),(191,'ro_MD','Rumänisch','Republik Moldau'),(192,'ro_RO','Rumänisch','Rumänien'),(193,'ru_RU','Russisch','Russische Föderation'),(194,'ru_UA','Russisch','Ukraine'),(195,'rw_RW','Ruandisch','Ruanda'),(196,'sa_IN','Sanskrit','Indien'),(197,'se_FI','Nord-Samisch','Finnland'),(198,'se_NO','Nord-Samisch','Norwegen'),(199,'sh_BA','Serbo-Kroatisch','Bosnien und Herzegowina'),(200,'sh_CS','Serbo-Kroatisch','Serbien und Montenegro'),(201,'sh_YU','Serbo-Kroatisch',''),(202,'si_LK','Singhalesisch','Sri Lanka'),(203,'sid_ET','Sidamo','Äthiopien'),(204,'sk_SK','Slowakisch','Slowakei'),(205,'sl_SI','Slowenisch','Slowenien'),(206,'so_DJ','Somali','Dschibuti'),(207,'so_ET','Somali','Äthiopien'),(208,'so_KE','Somali','Kenia'),(209,'so_SO','Somali','Somalia'),(210,'sq_AL','Albanisch','Albanien'),(211,'sr_BA','Serbisch','Bosnien und Herzegowina'),(212,'sr_CS','Serbisch','Serbien und Montenegro'),(213,'sr_ME','Serbisch','Montenegro'),(214,'sr_RS','Serbisch','Serbien'),(215,'sr_YU','Serbisch',''),(216,'ss_SZ','Swazi','Swasiland'),(217,'ss_ZA','Swazi','Südafrika'),(218,'st_LS','Süd-Sotho-Sprache','Lesotho'),(219,'st_ZA','Süd-Sotho-Sprache','Südafrika'),(220,'sv_FI','Schwedisch','Finnland'),(221,'sv_SE','Schwedisch','Schweden'),(222,'sw_KE','Suaheli','Kenia'),(223,'sw_TZ','Suaheli','Tansania'),(224,'syr_SY','Syrisch','Syrien'),(225,'ta_IN','Tamilisch','Indien'),(226,'te_IN','Telugu','Indien'),(227,'tg_TJ','Tadschikisch','Tadschikistan'),(228,'th_TH','Thailändisch','Thailand'),(229,'ti_ER','Tigrinja','Eritrea'),(230,'ti_ET','Tigrinja','Äthiopien'),(231,'tig_ER','Tigre','Eritrea'),(232,'tn_ZA','Tswana-Sprache','Südafrika'),(233,'to_TO','Tongaisch','Tonga'),(234,'tr_TR','Türkisch','Türkei'),(236,'ts_ZA','Tsonga','Südafrika'),(237,'tt_RU','Tatarisch','Russische Föderation'),(238,'ug_CN','Uigurisch','China'),(239,'uk_UA','Ukrainisch','Ukraine'),(240,'ur_IN','Urdu','Indien'),(241,'ur_PK','Urdu','Pakistan'),(242,'uz_AF','Usbekisch','Afghanistan'),(243,'uz_UZ','Usbekisch','Usbekistan'),(244,'ve_ZA','Venda-Sprache','Südafrika'),(245,'vi_VN','Vietnamesisch','Vietnam'),(246,'wal_ET','Walamo-Sprache','Äthiopien'),(247,'wo_SN','Wolof','Senegal'),(248,'xh_ZA','Xhosa','Südafrika'),(249,'yo_NG','Yoruba','Nigeria'),(250,'zh_CN','Chinesisch','China'),(251,'zh_HK','Chinesisch','Sonderverwaltungszone Hongkong'),(252,'zh_MO','Chinesisch','Sonderverwaltungszone Macao'),(253,'zh_SG','Chinesisch','Singapur'),(254,'zh_TW','Chinesisch','Taiwan'),(255,'zu_ZA','Zulu','Südafrika');
/*!40000 ALTER TABLE `s_core_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_log`
--

DROP TABLE IF EXISTS `s_core_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `user` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value4` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_log`
--

LOCK TABLES `s_core_log` WRITE;
/*!40000 ALTER TABLE `s_core_log` DISABLE KEYS */;
INSERT INTO `s_core_log` VALUES (1,'backend','Versandkosten Verwaltung','Einstellungen wurden erfolgreich gespeichert.','2012-08-28 10:38:26','Administrator','217.86.247.178','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1 FirePHP/0.7.1','');
/*!40000 ALTER TABLE `s_core_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_menu`
--

DROP TABLE IF EXISTS `s_core_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `onclick` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '0',
  `pluginID` int(11) unsigned DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shortcut` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_menu`
--

LOCK TABLES `s_core_menu` WRITE;
/*!40000 ALTER TABLE `s_core_menu` DISABLE KEYS */;
INSERT INTO `s_core_menu` VALUES (1,NULL,'Artikel',NULL,'ico package_green article--main',0,1,NULL,'Article',NULL,NULL),(2,1,'Anlegen','','sprite-inbox--plus article--add-article',-3,1,NULL,'Article','STRG + ALT + N','Detail'),(4,1,'Kategorien','','sprite-blue-folders-stack article--categories',0,1,NULL,'Category',NULL,'Index'),(6,1,'Hersteller',NULL,'sprite-truck article--manufacturers',2,1,NULL,'Supplier',NULL,'Index'),(7,NULL,'Inhalte',NULL,'ico2 note03 contents--main',0,1,NULL,'Content',NULL,NULL),(8,30,'Banner',NULL,'sprite-image-medium marketing--banner',0,1,NULL,'Banner',NULL,'Index'),(9,30,'Einkaufswelten','','sprite-pin marketing--shopping-worlds',1,1,NULL,'Emotion',NULL,'Index'),(10,30,'Gutscheine',NULL,'sprite-mail-open-image marketing--vouchers',3,1,NULL,'Voucher',NULL,'Index'),(11,30,'Pr&auml;mienartikel',NULL,'sprite-star marketing--premium-items',2,1,NULL,'Premium',NULL,'Index'),(12,30,'Produktexporte',NULL,'sprite-folder-export marketing--product-exports',5,1,NULL,'ProductFeed',NULL,'Index'),(15,7,'Shopseiten',NULL,'sprite-documents contents--shopsites',0,1,NULL,'Site',NULL,'Index'),(20,NULL,'Kunden',NULL,'ico customer customers--main',0,1,NULL,'Customer',NULL,NULL),(21,20,'Kundenliste',NULL,'sprite-ui-scroll-pane-detail customers--customer-list',0,1,NULL,'Customer','STRG + ALT + K','Index'),(22,20,'Bestellungen',NULL,'sprite-sticky-notes-pin customers--orders',0,1,NULL,'Order','STRG + ALT + B','Index'),(23,NULL,'Einstellungen',NULL,'ico2 wrench_screwdriver settings--main',0,1,NULL,'ConfigurationMenu',NULL,NULL),(25,23,'Benutzerverwaltung',NULL,'sprite-user-silhouette settings--user-management',-2,1,NULL,'UserManager',NULL,'Index'),(26,23,'Versandkosten',NULL,'sprite-envelope--arrow settings--delivery-charges',0,1,NULL,'Shipping',NULL,'Index'),(27,23,'Zahlungsarten',NULL,'sprite-credit-cards settings--payment-methods',0,1,NULL,'Payment',NULL,'Index'),(28,23,'E-Mail-Vorlagen',NULL,'sprite-mail--pencil settings--mail-presets',0,1,NULL,'Mail',NULL,'Index'),(29,23,'Performance',NULL,'sprite-bin-full settings--performance',-5,1,NULL,'Performance',NULL,'Index'),(30,NULL,'Marketing',NULL,'ico2 chart_bar01 marketing--main',0,1,NULL,'Marketing',NULL,NULL),(31,69,'Übersicht',NULL,'sprite-report-paper marketing--analyses--overview',-5,1,NULL,'Overview',NULL,'Index'),(32,69,'Statistiken / Diagramme',NULL,'sprite-chart',-4,1,NULL,'Analytics',NULL,'Index'),(40,NULL,'',NULL,'ico question_frame shopware-help-menu',999,1,NULL,NULL,NULL,NULL),(41,114,'Onlinehilfe aufrufen','window.open(\'http://www.shopware.de/wiki\',\'Shopware\',\'width=800,height=550,scrollbars=yes\')','sprite-lifebuoy misc--help--online-help',0,1,NULL,'Onlinehelp',NULL,NULL),(44,40,'Über Shopware','createShopwareVersionMessage()','sprite-shopware-logo misc--about-shopware',2,1,NULL,'AboutShopware',NULL,'Index'),(46,7,'Import/Export','','sprite-arrow-circle-double-135 contents--import-export',3,1,NULL,'ImportExport',NULL,'Index'),(50,1,'Bewertungen',NULL,'sprite-balloon article--ratings',3,1,NULL,'Vote',NULL,'Index'),(56,30,'Partnerprogramm','','sprite-xfn-colleague marketing--partner-program',6,1,NULL,'Partner',NULL,'Index'),(57,7,'Formulare',NULL,'sprite-application-form contents--forms',2,1,NULL,'Form',NULL,'Index'),(58,30,'Newsletter','','sprite-paper-plane marketing--newsletters',7,1,NULL,'NewsletterManager',NULL,'Index'),(59,69,'Abbruch-Analyse','','sprite-chart-down-color marketing--analyses--abort-analyses',0,1,NULL,'CanceledOrder',NULL,'Index'),(62,23,'Riskmanagement','','sprite-funnel--exclamation',0,1,NULL,'RiskManagement',NULL,'Index'),(63,23,'Systeminfo',NULL,'sprite-blueprint settings--system-info',-3,1,40,'Systeminfo',NULL,'Index'),(64,7,'Medienverwaltung',NULL,'sprite-inbox-image contents--media-manager',4,1,NULL,'MediaManager',NULL,'Index'),(65,20,'Zahlungen',NULL,'sprite-credit-cards settings--payment-methods',0,1,NULL,'Payments',NULL,NULL),(66,1,'Übersicht','','sprite-ui-scroll-pane-list article--overview',-2,1,NULL,'ArticleList','STRG + ALT + O','Index'),(68,23,'Logfile','','sprite-cards-stack settings--logfile',-2,1,NULL,'Log',NULL,'Index'),(69,30,'Auswertungen',NULL,'sprite-chart marketing--analyses',-1,1,NULL,'AnalysisMenu',NULL,NULL),(72,1,'Eigenschaften','','sprite-property-blue article--properties',0,1,NULL,'Property',NULL,'Index'),(75,20,'Anlegen','','sprite-user--plus customers--add-customer',-1,1,NULL,'Customer',NULL,'Detail'),(84,69,'E-Mail Benachrichtigung','','sprite-mail-forward',4,1,NULL,'Notification',NULL,'Index'),(85,7,'Blog','','sprite-application-blog contents--blog',1,1,NULL,'Blog',NULL,'Index'),(88,114,'Zum Forum','window.open(\'https://forum.shopware.com\')','sprite-balloons-box misc--help--board',-1,1,NULL,'Forum',NULL,NULL),(91,29,'Shopcache leeren',NULL,'sprite-edit-shade settings--performance--cache',1,1,NULL,'Performance','STRG + ALT + X','Config'),(107,23,'Textbausteine',NULL,'sprite-edit-shade settings--snippets',0,1,NULL,'Snippet',NULL,'Index'),(109,40,'Tastaturk&uuml;rzel','createKeyNavOverlay()','sprite-keyboard-command misc--shortcuts',1,1,NULL,'ShortCutMenu',NULL,'Index'),(110,23,'Grundeinstellungen',NULL,'sprite-wrench-screwdriver settings--basic-settings',-5,1,NULL,'Config',NULL,'Index'),(114,40,'Hilfe',NULL,'sprite-lifebuoy misc--help',0,1,NULL,'HelpMenu',NULL,NULL),(115,40,'Feedback senden',NULL,'sprite-briefcase--arrow',0,1,NULL,'Feedback',NULL,'Index'),(118,40,'SwagUpdate',NULL,'sprite-arrow-continue-090 misc--software-update',0,1,55,'SwagUpdate',NULL,'Index'),(119,23,'Theme Manager',NULL,'sprite-application-icon-large settings--theme-manager',0,1,NULL,'Theme',NULL,'Index'),(120,23,'Plugin Manager',NULL,'sprite-application-block settings--plugin-manager',0,1,56,'PluginManager',NULL,'Index'),(121,23,'Premium Plugins',NULL,'sprite-star settings--premium-plugins',0,1,56,'PluginManager',NULL,'PremiumPlugins'),(122,1,'Product Streams','','sprite-product-streams',50,1,NULL,'ProductStream','','index'),(123,23,'Freitextfeld-Verwaltung','','sprite-attributes',-1,1,NULL,'Attributes',NULL,'Index'),(124,29,'Performance',NULL,'sprite-bin-full settings--performance',2,1,NULL,'Performance',NULL,'Index'),(125,NULL,'Connect',NULL,'shopware-connect',0,1,NULL,NULL,NULL,NULL),(126,125,'Einstieg',NULL,'sprite-mousepointer-click',0,1,NULL,'PluginManager',NULL,'ShopwareConnect');
/*!40000 ALTER TABLE `s_core_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_optin`
--

DROP TABLE IF EXISTS `s_core_optin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_optin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datum` datetime NOT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`),
  KEY `datum` (`datum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_optin`
--

LOCK TABLES `s_core_optin` WRITE;
/*!40000 ALTER TABLE `s_core_optin` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_optin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_payment_data`
--

DROP TABLE IF EXISTS `s_core_payment_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_payment_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_mean_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `use_billing_data` int(1) DEFAULT NULL,
  `bankname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bic` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iban` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_holder` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_mean_id_2` (`payment_mean_id`,`user_id`),
  KEY `payment_mean_id` (`payment_mean_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_payment_data`
--

LOCK TABLES `s_core_payment_data` WRITE;
/*!40000 ALTER TABLE `s_core_payment_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_payment_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_payment_instance`
--

DROP TABLE IF EXISTS `s_core_payment_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_payment_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_mean_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_holder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bic` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iban` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(20,4) DEFAULT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_mean_id` (`payment_mean_id`),
  KEY `payment_mean_id_2` (`payment_mean_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_payment_instance`
--

LOCK TABLES `s_core_payment_instance` WRITE;
/*!40000 ALTER TABLE `s_core_payment_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_payment_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_paymentmeans`
--

DROP TABLE IF EXISTS `s_core_paymentmeans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_paymentmeans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `table` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `hide` int(1) NOT NULL,
  `additionaldescription` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `debit_percent` double NOT NULL DEFAULT '0',
  `surcharge` double NOT NULL DEFAULT '0',
  `surchargestring` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  `esdactive` int(1) NOT NULL,
  `embediframe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hideprospect` int(1) NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pluginID` int(11) unsigned DEFAULT NULL,
  `source` int(11) DEFAULT NULL,
  `mobile_inactive` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_paymentmeans`
--

LOCK TABLES `s_core_paymentmeans` WRITE;
/*!40000 ALTER TABLE `s_core_paymentmeans` DISABLE KEYS */;
INSERT INTO `s_core_paymentmeans` VALUES (2,'debit','Lastschrift','debit.tpl','debit.php','',0,'Zusatztext',0,0,'',4,0,0,'',0,NULL,NULL,NULL,0),(3,'cash','Nachnahme','cash.tpl','cash.php','',0,'(zzgl. 2,00 Euro Nachnahmegebühren)',0,0,'',2,0,0,'',0,NULL,NULL,NULL,0),(4,'invoice','Rechnung','invoice.tpl','invoice.php','',0,'Sie zahlen einfach und bequem auf Rechnung. Shopware bietet z.B. auch die Möglichkeit, Rechnung automatisiert erst ab der 2. Bestellung für Kunden zur Verfügung zu stellen, um Zahlungsausfälle zu vermeiden.',0,0,'',3,0,1,'',0,NULL,NULL,NULL,0),(5,'prepayment','Vorkasse','prepayment.tpl','prepayment.php','',0,'Sie zahlen einfach vorab und erhalten die Ware bequem und günstig bei Zahlungseingang nach Hause geliefert.',0,0,'',1,1,0,'',0,NULL,NULL,NULL,0),(6,'sepa','SEPA','sepa.tpl','sepa','',0,'SEPA debit',0,0,'',5,0,0,'',0,'',NULL,1,0);
/*!40000 ALTER TABLE `s_core_paymentmeans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_paymentmeans_attributes`
--

DROP TABLE IF EXISTS `s_core_paymentmeans_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_paymentmeans_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentmeanID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `paymentmeanID` (`paymentmeanID`),
  CONSTRAINT `s_core_paymentmeans_attributes_ibfk_1` FOREIGN KEY (`paymentmeanID`) REFERENCES `s_core_paymentmeans` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_paymentmeans_attributes`
--

LOCK TABLES `s_core_paymentmeans_attributes` WRITE;
/*!40000 ALTER TABLE `s_core_paymentmeans_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_paymentmeans_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_paymentmeans_countries`
--

DROP TABLE IF EXISTS `s_core_paymentmeans_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_paymentmeans_countries` (
  `paymentID` int(11) unsigned NOT NULL,
  `countryID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`paymentID`,`countryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_paymentmeans_countries`
--

LOCK TABLES `s_core_paymentmeans_countries` WRITE;
/*!40000 ALTER TABLE `s_core_paymentmeans_countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_paymentmeans_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_paymentmeans_subshops`
--

DROP TABLE IF EXISTS `s_core_paymentmeans_subshops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_paymentmeans_subshops` (
  `paymentID` int(11) unsigned NOT NULL,
  `subshopID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`paymentID`,`subshopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_paymentmeans_subshops`
--

LOCK TABLES `s_core_paymentmeans_subshops` WRITE;
/*!40000 ALTER TABLE `s_core_paymentmeans_subshops` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_paymentmeans_subshops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_plugin_categories`
--

DROP TABLE IF EXISTS `s_core_plugin_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_plugin_categories` (
  `id` int(11) NOT NULL,
  `locale` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_plugin_categories`
--

LOCK TABLES `s_core_plugin_categories` WRITE;
/*!40000 ALTER TABLE `s_core_plugin_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_plugin_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_plugins`
--

DROP TABLE IF EXISTS `s_core_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `description_long` mediumtext COLLATE utf8_unicode_ci,
  `active` int(1) unsigned NOT NULL,
  `added` datetime NOT NULL,
  `installation_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `refresh_date` datetime DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `copyright` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `support` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `changes` mediumtext COLLATE utf8_unicode_ci,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `store_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `store_date` datetime DEFAULT NULL,
  `capability_update` int(1) NOT NULL,
  `capability_install` int(1) NOT NULL,
  `capability_enable` int(1) NOT NULL,
  `update_source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capability_secure_uninstall` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_plugins`
--

LOCK TABLES `s_core_plugins` WRITE;
/*!40000 ALTER TABLE `s_core_plugins` DISABLE KEYS */;
INSERT INTO `s_core_plugins` VALUES (2,'Core','ErrorHandler','ErrorHandler','Default','','',1,'2012-08-28 00:00:00','2010-10-18 00:00:00','2010-10-18 00:00:00',NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(7,'Core','Cron','Cron','Default','','',0,'2012-08-28 00:00:00',NULL,NULL,NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(8,'Core','Router','Router','Default','','',1,'2012-08-28 00:00:00','2010-10-18 00:00:00','2010-10-18 00:00:00',NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(9,'Core','CronBirthday','CronBirthday','Default','','',0,'2012-08-28 00:00:00',NULL,NULL,NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(10,'Core','System','System','Default','','',1,'2012-08-28 00:00:00','2010-10-18 00:00:00','2010-10-18 00:00:00',NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(11,'Core','ViewportForward','ViewportForward','Default','','',1,'2012-08-28 00:00:00','2010-10-18 00:00:00','2010-10-18 00:00:00',NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(12,'Core','Shop','Shop','Default','','',1,'2012-08-28 00:00:00','2010-10-18 00:00:00','2010-10-18 00:00:00',NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(13,'Core','PostFilter','PostFilter','Default','','',1,'2012-08-28 00:00:00','2010-10-18 00:00:00','2010-10-18 00:00:00',NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(14,'Core','CronRating','CronRating','Default','','',0,'2012-08-28 00:00:00',NULL,NULL,NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(15,'Core','ControllerBase','ControllerBase','Default','','',1,'2012-08-28 00:00:00','2010-10-18 00:00:00','2010-10-18 00:00:00',NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(16,'Core','CronStock','CronStock','Default','','',0,'2012-08-28 00:00:00',NULL,NULL,NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(19,'Frontend','RouterRewrite','RouterRewrite','Default','','',1,'2012-08-28 00:00:00','2010-10-18 00:00:00','2010-10-18 00:00:00',NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(21,'Frontend','Facebook','Facebook','Default','','',0,'2012-08-28 00:00:00',NULL,NULL,NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(22,'Frontend','Seo','Seo','Default','','',1,'2012-08-28 00:00:00','2010-10-18 00:00:00','2010-10-18 00:00:00',NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(23,'Frontend','LastArticles','LastArticles','Default','','',1,'2012-08-28 00:00:00','2010-10-18 00:00:00','2010-10-18 00:00:00',NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(29,'Frontend','AdvancedMenu','Erweitertes Menü','Default','','',0,'2012-08-28 00:00:00',NULL,NULL,NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(31,'Frontend','Statistics','Statistics','Default','','',1,'2012-08-28 00:00:00','2010-10-18 00:00:00','2010-10-18 00:00:00',NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(33,'Frontend','Notification','Notification','Default','','',0,'2012-08-28 00:00:00',NULL,NULL,NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(34,'Frontend','TagCloud','TagCloud','Default','','',0,'2012-08-28 00:00:00',NULL,NULL,NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(35,'Frontend','InputFilter','InputFilter','Default','','',1,'2012-08-28 00:00:00','2010-10-18 00:00:00','2010-10-18 00:00:00',NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(36,'Backend','Auth','Auth','Default','','',1,'2012-08-28 00:00:00','2010-10-18 00:00:00','2010-10-18 00:00:00',NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(37,'Backend','Menu','Menu','Default','','',1,'2012-08-28 00:00:00','2010-10-18 00:00:00','2010-10-18 00:00:00',NULL,'shopware AG','Copyright © 2010, shopware AG','','1','http://www.shopware.de/wiki/','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(40,'Backend','Check','Systeminfo','Default','','',1,'2010-10-18 00:00:00','2010-10-18 00:00:00','2010-10-18 00:00:00',NULL,'shopware AG','Copyright © 2011, shopware AG','','1.0.0','http://wiki.shopware.de','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(43,'Backend','Locale','Locale','Default','','',1,'2012-08-27 22:28:53','2012-08-27 22:28:53','2012-08-27 22:28:53',NULL,'shopware AG','Copyright &copy; 2011, shopware AG','','1.0.0','http://wiki.shopware.de','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(44,'Core','RestApi','RestApi','Default','','',1,'2012-07-13 12:03:13','2012-07-13 12:03:36','2012-07-13 12:03:36',NULL,'shopware AG','Copyright © 2012, shopware AG','','1.0.0','http://wiki.shopware.de','','http://www.shopware.de/',NULL,NULL,0,0,0,NULL,NULL,0),(49,'Core','PasswordEncoder','PasswordEncoder','Default',NULL,NULL,1,'2013-04-16 12:13:54','2013-04-16 14:07:23','2013-04-16 14:07:23','2013-04-16 14:07:23','shopware AG','Copyright © 2013, shopware AG',NULL,'1.0.0',NULL,NULL,NULL,NULL,NULL,1,0,0,NULL,NULL,0),(50,'Core','MarketingAggregate','Shopware Marketing Aggregat Funktionen','Default',NULL,NULL,1,'2013-04-30 14:19:13','2013-04-30 14:26:48','2013-04-30 14:26:48','2013-04-30 14:26:51','shopware AG','Copyright © 2012, shopware AG',NULL,'1.0.0',NULL,NULL,'http://www.shopware.de/',NULL,NULL,1,1,1,NULL,NULL,0),(51,'Core','RebuildIndex','Shopware Such- und SEO-Index','Default',NULL,NULL,1,'2013-05-19 10:53:24','2013-05-21 13:28:04','2013-05-21 13:28:04','2013-05-21 13:28:07','shopware AG','Copyright © 2012, shopware AG',NULL,'1.0.0',NULL,NULL,'http://www.shopware.de/',NULL,NULL,1,1,1,NULL,NULL,0),(52,'Core','HttpCache','Frontendcache (HttpCache)','Default',NULL,NULL,0,'2013-05-27 15:57:59','2013-05-27 15:58:09','2013-05-27 15:58:09','2013-05-27 15:58:10','shopware AG','Copyright © 2012, shopware AG',NULL,'1.1.0',NULL,NULL,NULL,NULL,NULL,1,0,1,NULL,NULL,0),(53,'Core','PaymentMethods','Payment Methods','Default','Shopware Payment Methods handling. This plugin is required to handle payment methods, and should not be deactivated',NULL,1,'2013-10-30 08:12:22','2013-10-30 08:13:26','2013-10-30 08:13:26','2013-10-30 08:13:34','shopware AG','Copyright © 2013, shopware AG',NULL,'1.0.1',NULL,NULL,NULL,NULL,NULL,1,0,1,NULL,NULL,0),(54,'Core','Debug','Debug','Default',NULL,NULL,0,'2014-01-17 09:19:05',NULL,NULL,'2014-01-17 09:19:07','shopware AG','Copyright © shopware AG',NULL,'1.0.0',NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,0),(55,'Backend','SwagUpdate','Shopware Auto Update','Default',NULL,NULL,1,'2014-05-06 09:03:01','2014-05-06 09:03:06','2014-05-06 09:03:06','2014-05-06 09:03:09','shopware AG','Copyright © 2012, shopware AG',NULL,'1.0.0',NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,0),(56,'Backend','PluginManager','Plugin Manager','Default',NULL,NULL,1,'2014-11-07 11:55:46','2014-11-07 11:55:54','2014-11-07 11:55:54','2014-11-07 11:55:57','shopware AG','Copyright © 2012, shopware AG',NULL,'1.0.0',NULL,NULL,NULL,NULL,NULL,1,1,1,NULL,NULL,0);
/*!40000 ALTER TABLE `s_core_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_pricegroups`
--

DROP TABLE IF EXISTS `s_core_pricegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_pricegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_pricegroups`
--

LOCK TABLES `s_core_pricegroups` WRITE;
/*!40000 ALTER TABLE `s_core_pricegroups` DISABLE KEYS */;
INSERT INTO `s_core_pricegroups` VALUES (1,'Standard');
/*!40000 ALTER TABLE `s_core_pricegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_pricegroups_discounts`
--

DROP TABLE IF EXISTS `s_core_pricegroups_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_pricegroups_discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupID` int(11) NOT NULL,
  `customergroupID` int(11) NOT NULL,
  `discount` double NOT NULL,
  `discountstart` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groupID` (`groupID`,`customergroupID`,`discountstart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_pricegroups_discounts`
--

LOCK TABLES `s_core_pricegroups_discounts` WRITE;
/*!40000 ALTER TABLE `s_core_pricegroups_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_pricegroups_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_rewrite_urls`
--

DROP TABLE IF EXISTS `s_core_rewrite_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_rewrite_urls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `org_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `main` int(1) unsigned NOT NULL,
  `subshopID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`,`subshopID`),
  KEY `org_path` (`org_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_rewrite_urls`
--

LOCK TABLES `s_core_rewrite_urls` WRITE;
/*!40000 ALTER TABLE `s_core_rewrite_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_rewrite_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_rulesets`
--

DROP TABLE IF EXISTS `s_core_rulesets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_rulesets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentID` int(11) NOT NULL,
  `rule1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rule2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_rulesets`
--

LOCK TABLES `s_core_rulesets` WRITE;
/*!40000 ALTER TABLE `s_core_rulesets` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_rulesets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_sessions`
--

DROP TABLE IF EXISTS `s_core_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_sessions` (
  `id` varchar(128) COLLATE utf8_bin NOT NULL,
  `data` mediumblob NOT NULL,
  `modified` int(10) unsigned NOT NULL,
  `expiry` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sess_expiry` (`expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_sessions`
--

LOCK TABLES `s_core_sessions` WRITE;
/*!40000 ALTER TABLE `s_core_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_sessions_backend`
--

DROP TABLE IF EXISTS `s_core_sessions_backend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_sessions_backend` (
  `id` varchar(128) COLLATE utf8_bin NOT NULL,
  `data` mediumblob NOT NULL,
  `modified` int(10) unsigned NOT NULL,
  `expiry` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sess_expiry` (`expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_sessions_backend`
--

LOCK TABLES `s_core_sessions_backend` WRITE;
/*!40000 ALTER TABLE `s_core_sessions_backend` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_sessions_backend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_shop_currencies`
--

DROP TABLE IF EXISTS `s_core_shop_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_shop_currencies` (
  `shop_id` int(11) unsigned NOT NULL,
  `currency_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`shop_id`,`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_shop_currencies`
--

LOCK TABLES `s_core_shop_currencies` WRITE;
/*!40000 ALTER TABLE `s_core_shop_currencies` DISABLE KEYS */;
INSERT INTO `s_core_shop_currencies` VALUES (1,1);
/*!40000 ALTER TABLE `s_core_shop_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_shop_pages`
--

DROP TABLE IF EXISTS `s_core_shop_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_shop_pages` (
  `shop_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`shop_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_shop_pages`
--

LOCK TABLES `s_core_shop_pages` WRITE;
/*!40000 ALTER TABLE `s_core_shop_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_shop_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_shops`
--

DROP TABLE IF EXISTS `s_core_shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_shops` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `main_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `base_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `base_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hosts` text COLLATE utf8_unicode_ci NOT NULL,
  `secure` int(1) unsigned NOT NULL,
  `secure_host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secure_base_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_id` int(11) unsigned DEFAULT NULL,
  `document_template_id` int(11) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `locale_id` int(11) unsigned DEFAULT NULL,
  `currency_id` int(11) unsigned DEFAULT NULL,
  `customer_group_id` int(11) unsigned DEFAULT NULL,
  `fallback_id` int(11) unsigned DEFAULT NULL,
  `customer_scope` int(1) NOT NULL,
  `default` int(1) unsigned NOT NULL,
  `active` int(1) NOT NULL,
  `always_secure` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `main_id` (`main_id`),
  KEY `host` (`host`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_shops`
--

LOCK TABLES `s_core_shops` WRITE;
/*!40000 ALTER TABLE `s_core_shops` DISABLE KEYS */;
INSERT INTO `s_core_shops` VALUES (1,NULL,'Deutsch',NULL,0,NULL,'',NULL,'',0,NULL,NULL,11,4,3,1,1,1,NULL,0,1,1,0);
/*!40000 ALTER TABLE `s_core_shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_snippets`
--

DROP TABLE IF EXISTS `s_core_snippets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_snippets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shopID` int(11) unsigned NOT NULL,
  `localeID` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `dirty` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `namespace` (`namespace`,`shopID`,`name`,`localeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2625 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_snippets`
--

LOCK TABLES `s_core_snippets` WRITE;
/*!40000 ALTER TABLE `s_core_snippets` DISABLE KEYS */;
INSERT INTO `s_core_snippets` VALUES (2587,'frontend/plugins/payment/sepa',1,1,'PaymentSepaLabelIban','IBAN','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2588,'frontend/plugins/payment/sepa',1,2,'PaymentSepaLabelIban','IBAN','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2589,'frontend/plugins/payment/sepa',1,1,'PaymentSepaLabelBic','BIC','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2590,'frontend/plugins/payment/sepa',1,2,'PaymentSepaLabelBic','BIC','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2591,'frontend/plugins/payment/sepa',1,1,'PaymentSepaLabelBankName','Ihre Bank','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2592,'frontend/plugins/payment/sepa',1,2,'PaymentSepaLabelBankName','Name of bank','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2593,'frontend/plugins/payment/sepa',1,1,'PaymentSepaLabelUseBillingData','Rechnungs-Adresse in Mandat übernehmen?','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2594,'frontend/plugins/payment/sepa',1,2,'PaymentSepaLabelUseBillingData','Use billing information for SEPA debit mandate?','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2595,'frontend/plugins/payment/sepa',1,1,'PaymentSepaInfoFields','Die mit einem * markierten Felder sind Pflichtfelder.','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2596,'frontend/plugins/payment/sepa',1,2,'PaymentSepaInfoFields','The fields marked with * are required.','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2597,'frontend/plugins/payment/sepaemail',1,1,'SepaEmailCreditorNumber','Gläubiger-Identifikationsnummer:','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2598,'frontend/plugins/payment/sepaemail',1,2,'SepaEmailCreditorNumber','Creditor number:','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2599,'frontend/plugins/payment/sepaemail',1,1,'SepaEmailMandateReference','Mandatsreferenz: <strong>{$data.orderNumber}</strong>','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2600,'frontend/plugins/payment/sepaemail',1,2,'SepaEmailMandateReference','Mandate reference: <strong>{$data.orderNumber}</strong>','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2601,'frontend/plugins/payment/sepaemail',1,1,'SepaEmailDirectDebitMandate','SEPA-Lastschriftmandat','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2602,'frontend/plugins/payment/sepaemail',1,2,'SepaEmailDirectDebitMandate','SEPA direct debit mandate','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2603,'frontend/plugins/payment/sepaemail',1,1,'SepaEmailBody','Ich ermächtige den {$config.sepaCompany}, Zahlungen von meinem Konto mittels Lastschrift einzuziehen. Zugleich weise ich mein Kreditinstitut an, die von dem {$config.sepaCompany} auf mein Konto gezogenen Lastschriften einzulösen.</p><p> Hinweis: Ich kann innerhalb von acht Wochen, beginnend mit dem Belastungsdatum, die Erstattung des belasteten Betrages verlangen. Es gelten dabei die mit meinem Kreditinstitut vereinbarten Bedingungen.','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2604,'frontend/plugins/payment/sepaemail',1,2,'SepaEmailBody','I hereby authorize payments to be made from my account to {$config.sepaCompany} via direct debit. At the same time, I instruct my financial institution to honor the debits drawn from my account.</p><p>Note: I may request reimbursement for the debited amount up to eight weeks following the date of the transfer, in accordance with preexisting terms and conditions set by my bank.','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2605,'frontend/plugins/payment/sepaemail',1,1,'SepaEmailName','Vorname und Name (Kontoinhaber)','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2606,'frontend/plugins/payment/sepaemail',1,2,'SepaEmailName','Account holder\'s name','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2607,'frontend/plugins/payment/sepaemail',1,1,'SepaEmailAddress','Straße und Hausnummer','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2608,'frontend/plugins/payment/sepaemail',1,2,'SepaEmailAddress','Address','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2609,'frontend/plugins/payment/sepaemail',1,1,'SepaEmailZip','Postleitzahl und Ort','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2610,'frontend/plugins/payment/sepaemail',1,2,'SepaEmailZip','Zip code and City','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2611,'frontend/plugins/payment/sepaemail',1,1,'SepaEmailBankName','Kreditinstitut','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2612,'frontend/plugins/payment/sepaemail',1,2,'SepaEmailBankName','Bank','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2613,'frontend/plugins/payment/sepaemail',1,1,'SepaEmailBic','BIC','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2614,'frontend/plugins/payment/sepaemail',1,2,'SepaEmailBic','BIC','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2615,'frontend/plugins/payment/sepaemail',1,1,'SepaEmailIban','IBAN','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2616,'frontend/plugins/payment/sepaemail',1,2,'SepaEmailIban','IBAN','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2617,'frontend/plugins/payment/sepaemail',1,1,'SepaEmailSignature','Datum, Ort und Unterschrift','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2618,'frontend/plugins/payment/sepaemail',1,2,'SepaEmailSignature','Signature (including date and location)','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2619,'frontend/plugins/payment/sepa',1,1,'PaymentDebitLabelIban','IBAN','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2620,'frontend/plugins/payment/sepa',1,2,'PaymentDebitLabelIban','IBAN','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2621,'frontend/plugins/payment/sepa',1,1,'PaymentDebitLabelBic','BIC','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2622,'frontend/plugins/payment/sepa',1,2,'PaymentDebitLabelBic','BIC','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2623,'frontend/plugins/payment/sepa',1,1,'ErrorIBAN','Ungültige IBAN','2013-11-01 00:00:00','2013-11-01 00:00:00',0),(2624,'frontend/plugins/payment/sepa',1,2,'ErrorIBAN','Invalid IBAN','2013-11-01 00:00:00','2013-11-01 00:00:00',0);
/*!40000 ALTER TABLE `s_core_snippets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_states`
--

DROP TABLE IF EXISTS `s_core_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_states` (
  `id` int(11) NOT NULL,
  `name` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `group` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `mail` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_states`
--

LOCK TABLES `s_core_states` WRITE;
/*!40000 ALTER TABLE `s_core_states` DISABLE KEYS */;
INSERT INTO `s_core_states` VALUES (-1,'cancelled','Abgebrochen',25,'state',0),(0,'open','Offen',1,'state',1),(1,'in_process','In Bearbeitung (Wartet)',2,'state',1),(2,'completed','Komplett abgeschlossen',3,'state',0),(3,'partially_completed','Teilweise abgeschlossen',4,'state',0),(4,'cancelled_rejected','Storniert / Abgelehnt',5,'state',1),(5,'ready_for_delivery','Zur Lieferung bereit',6,'state',1),(6,'partially_delivered','Teilweise ausgeliefert',7,'state',1),(7,'completely_delivered','Komplett ausgeliefert',8,'state',1),(8,'clarification_required','Klärung notwendig',9,'state',1),(9,'partially_invoiced','Teilweise in Rechnung gestellt',1,'payment',0),(10,'completely_invoiced','Komplett in Rechnung gestellt',2,'payment',0),(11,'partially_paid','Teilweise bezahlt',3,'payment',0),(12,'completely_paid','Komplett bezahlt',4,'payment',0),(13,'1st_reminder','1. Mahnung',5,'payment',0),(14,'2nd_reminder','2. Mahnung',6,'payment',0),(15,'3rd_reminder','3. Mahnung',7,'payment',0),(16,'encashment','Inkasso',8,'payment',0),(17,'open','Offen',0,'payment',0),(18,'reserved','Reserviert',9,'payment',0),(19,'delayed','Verzoegert',10,'payment',0),(20,'re_crediting','Wiedergutschrift',11,'payment',0),(21,'review_necessary','Überprüfung notwendig',12,'payment',0),(30,'no_credit_approved','Es wurde kein Kredit genehmigt.',30,'payment',1),(31,'the_credit_has_been_preliminarily_accepted','Der Kredit wurde vorlaeufig akzeptiert.',31,'payment',1),(32,'the_credit_has_been_accepted','Der Kredit wurde genehmigt.',32,'payment',1),(33,'the_payment_has_been_ordered_by_hanseatic_bank','Die Zahlung wurde von der Hanseatic Bank angewiesen.',33,'payment',1),(34,'a_time_extension_has_been_registered','Es wurde eine Zeitverlaengerung eingetragen.',34,'payment',1),(35,'the_process_has_been_cancelled','Vorgang wurde abgebrochen.',35,'payment',1);
/*!40000 ALTER TABLE `s_core_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_subscribes`
--

DROP TABLE IF EXISTS `s_core_subscribes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_subscribes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscribe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `listener` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pluginID` int(11) unsigned DEFAULT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscribe` (`subscribe`,`type`,`listener`),
  KEY `plugin_namespace_init_storage` (`type`,`subscribe`,`position`),
  KEY `pluginID` (`pluginID`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_subscribes`
--

LOCK TABLES `s_core_subscribes` WRITE;
/*!40000 ALTER TABLE `s_core_subscribes` DISABLE KEYS */;
INSERT INTO `s_core_subscribes` VALUES (1,'Enlight_Bootstrap_InitResource_Auth',0,'Shopware_Plugins_Backend_Auth_Bootstrap::onInitResourceAuth',36,0),(2,'Enlight_Controller_Action_PreDispatch',0,'Shopware_Plugins_Backend_Auth_Bootstrap::onPreDispatchBackend',36,0),(3,'Enlight_Bootstrap_InitResource_Menu',0,'Shopware_Plugins_Backend_Menu_Bootstrap::onInitResourceMenu',37,0),(5,'Enlight_Controller_Action_PostDispatch',0,'Shopware_Plugins_Core_ControllerBase_Bootstrap::onPostDispatch',15,100),(6,'Enlight_Controller_Front_StartDispatch',0,'Shopware_Plugins_Core_ErrorHandler_Bootstrap::onStartDispatch',2,0),(9,'Enlight_Plugins_ViewRenderer_FilterRender',0,'Shopware_Plugins_Core_PostFilter_Bootstrap::onFilterRender',13,0),(10,'Enlight_Controller_Front_RouteStartup',0,'Shopware_Plugins_Core_Router_Bootstrap::onRouteStartup',8,0),(11,'Enlight_Controller_Front_RouteShutdown',0,'Shopware_Plugins_Core_Router_Bootstrap::onRouteShutdown',8,0),(12,'Enlight_Controller_Router_FilterAssembleParams',0,'Shopware_Plugins_Core_Router_Bootstrap::onFilterAssemble',8,0),(13,'Enlight_Controller_Router_FilterUrl',0,'Shopware_Plugins_Core_Router_Bootstrap::onFilterUrl',8,0),(14,'Enlight_Controller_Router_Assemble',0,'Shopware_Plugins_Core_Router_Bootstrap::onAssemble',8,100),(17,'Enlight_Bootstrap_InitResource_System',0,'Shopware_Plugins_Core_System_Bootstrap::onInitResourceSystem',10,0),(18,'Enlight_Bootstrap_InitResource_Modules',0,'Shopware_Plugins_Core_System_Bootstrap::onInitResourceModules',10,0),(21,'Enlight_Controller_Front_PreDispatch',0,'Shopware_Plugins_Core_ViewportForward_Bootstrap::onPreDispatch',11,10),(25,'Enlight_Plugins_ViewRenderer_FilterRender',0,'Shopware_Plugins_Frontend_Seo_Bootstrap::onFilterRender',22,0),(26,'Enlight_Controller_Action_PostDispatch',0,'Shopware_Plugins_Frontend_Seo_Bootstrap::onPostDispatch',22,0),(30,'Enlight_Controller_Front_StartDispatch',0,'Shopware_Plugins_Frontend_RouterRewrite_Bootstrap::onStartDispatch',19,0),(37,'Enlight_Controller_Action_PostDispatch',0,'Shopware_Plugins_Frontend_LastArticles_Bootstrap::onPostDispatch',23,0),(38,'Enlight_Controller_Front_RouteShutdown',0,'Shopware_Plugins_Frontend_InputFilter_Bootstrap::onRouteShutdown',35,0),(41,'Enlight_Controller_Dispatcher_ControllerPath_Backend_Check',0,'Shopware_Plugins_Backend_Check_Bootstrap::onGetControllerPathBackend',40,0),(52,'Enlight_Bootstrap_InitResource_BackendSession',0,'Shopware_Plugins_Backend_Auth_Bootstrap::onInitResourceBackendSession',36,0),(56,'Enlight_Controller_Front_DispatchLoopStartup',0,'Shopware_Plugins_Core_RestApi_Bootstrap::onDispatchLoopStartup',44,0),(57,'Enlight_Controller_Front_PreDispatch',0,'Shopware_Plugins_Core_RestApi_Bootstrap::onFrontPreDispatch',44,0),(58,'Enlight_Bootstrap_InitResource_Auth',0,'Shopware_Plugins_Core_RestApi_Bootstrap::onInitResourceAuth',44,0),(69,'Enlight_Bootstrap_InitResource_PasswordEncoder',0,'Shopware_Plugins_Core_PasswordEncoder_Bootstrap::onInitResourcePasswordEncoder',49,0),(70,'Shopware_Components_Password_Manager_AddEncoder',0,'Shopware_Plugins_Core_PasswordEncoder_Bootstrap::onAddEncoder',49,0),(71,'Shopware_Modules_Order_SaveOrder_ProcessDetails',0,'Shopware_Plugins_Core_MarketingAggregate_Bootstrap::incrementTopSeller',50,0),(72,'Shopware_Modules_Articles_GetArticleCharts',0,'Shopware_Plugins_Core_MarketingAggregate_Bootstrap::afterTopSellerSelected',50,0),(73,'Enlight_Bootstrap_InitResource_TopSeller',0,'Shopware_Plugins_Core_MarketingAggregate_Bootstrap::initTopSellerResource',50,0),(74,'Enlight_Controller_Action_Backend_Config_InitTopSeller',0,'Shopware_Plugins_Core_MarketingAggregate_Bootstrap::initTopSeller',50,0),(75,'Enlight_Controller_Dispatcher_ControllerPath_Backend_TopSeller',0,'Shopware_Plugins_Core_MarketingAggregate_Bootstrap::getTopSellerBackendController',50,0),(76,'Shopware_CronJob_RefreshTopSeller',0,'Shopware_Plugins_Core_MarketingAggregate_Bootstrap::refreshTopSeller',50,0),(77,'Shopware\\Models\\Article\\Article::postUpdate',0,'Shopware_Plugins_Core_MarketingAggregate_Bootstrap::refreshArticle',50,0),(78,'Shopware\\Models\\Article\\Article::postPersist',0,'Shopware_Plugins_Core_MarketingAggregate_Bootstrap::refreshArticle',50,0),(79,'Shopware_Modules_Order_SaveOrder_ProcessDetails',0,'Shopware_Plugins_Core_MarketingAggregate_Bootstrap::addNewAlsoBought',50,0),(80,'Enlight_Controller_Dispatcher_ControllerPath_Backend_AlsoBought',0,'Shopware_Plugins_Core_MarketingAggregate_Bootstrap::getAlsoBoughtBackendController',50,0),(81,'Enlight_Bootstrap_InitResource_AlsoBought',0,'Shopware_Plugins_Core_MarketingAggregate_Bootstrap::initAlsoBoughtResource',50,0),(82,'Enlight_Controller_Dispatcher_ControllerPath_Backend_SimilarShown',0,'Shopware_Plugins_Core_MarketingAggregate_Bootstrap::getSimilarShownBackendController',50,0),(83,'Enlight_Bootstrap_InitResource_SimilarShown',0,'Shopware_Plugins_Core_MarketingAggregate_Bootstrap::initSimilarShownResource',50,0),(85,'Shopware_Plugins_LastArticles_ResetLastArticles',0,'Shopware_Plugins_Core_MarketingAggregate_Bootstrap::afterSimilarShownArticlesReset',50,0),(86,'Shopware_Modules_Articles_Before_SetLastArticle',0,'Shopware_Plugins_Core_MarketingAggregate_Bootstrap::beforeSetLastArticle',50,0),(87,'Shopware_CronJob_RefreshSimilarShown',0,'Shopware_Plugins_Core_MarketingAggregate_Bootstrap::refreshSimilarShown',50,0),(88,'Enlight_Controller_Dispatcher_ControllerPath_Backend_Seo',0,'Shopware_Plugins_Core_RebuildIndex_Bootstrap::getSeoBackendController',51,0),(89,'Enlight_Bootstrap_InitResource_SeoIndex',0,'Shopware_Plugins_Core_RebuildIndex_Bootstrap::initSeoIndexResource',51,0),(90,'Enlight_Controller_Front_DispatchLoopShutdown',0,'Shopware_Plugins_Core_RebuildIndex_Bootstrap::onAfterSendResponse',51,0),(91,'Shopware_CronJob_RefreshSeoIndex',0,'Shopware_Plugins_Core_RebuildIndex_Bootstrap::onRefreshSeoIndex',51,0),(92,'Enlight_Controller_Dispatcher_ControllerPath_Backend_SearchIndex',0,'Shopware_Plugins_Core_RebuildIndex_Bootstrap::getSearchIndexBackendController',51,0),(93,'Shopware_CronJob_RefreshSearchIndex',0,'Shopware_Plugins_Core_RebuildIndex_Bootstrap::refreshSearchIndex',51,0),(94,'Enlight_Controller_Action_PreDispatch',0,'Shopware_Plugins_Core_HttpCache_Bootstrap::onPreDispatch',52,0),(95,'Shopware\\Models\\Article\\Article::postPersist',0,'Shopware_Plugins_Core_HttpCache_Bootstrap::onPostPersist',52,0),(96,'Shopware\\Models\\Category\\Category::postPersist',0,'Shopware_Plugins_Core_HttpCache_Bootstrap::onPostPersist',52,0),(97,'Shopware\\Models\\Banner\\Banner::postPersist',0,'Shopware_Plugins_Core_HttpCache_Bootstrap::onPostPersist',52,0),(98,'Shopware\\Models\\Article\\Article::postUpdate',0,'Shopware_Plugins_Core_HttpCache_Bootstrap::onPostPersist',52,0),(99,'Shopware\\Models\\Category\\Category::postUpdate',0,'Shopware_Plugins_Core_HttpCache_Bootstrap::onPostPersist',52,0),(100,'Shopware\\Models\\Banner\\Banner::postUpdate',0,'Shopware_Plugins_Core_HttpCache_Bootstrap::onPostPersist',52,0),(102,'Shopware_CronJob_ClearHttpCache',0,'Shopware_Plugins_Core_HttpCacheBootstrap::onClearHttpCache',52,0),(103,'Shopware_Plugins_HttpCache_InvalidateCacheId',0,'Shopware_Plugins_Core_HttpCache_Bootstrap::onInvalidateCacheId',52,0),(105,'Shopware\\Models\\Blog\\Blog::postPersist',0,'Shopware_Plugins_Core_HttpCache_Bootstrap::onPostPersist',52,0),(106,'Shopware\\Models\\Blog\\Blog::postUpdate',0,'Shopware_Plugins_Core_HttpCache_Bootstrap::onPostPersist',52,0),(107,'Shopware_Modules_Admin_InitiatePaymentClass_AddClass',0,'Shopware_Plugins_Core_PaymentMethods_Bootstrap::addPaymentClass',53,0),(108,'Enlight_Controller_Action_PostDispatchSecure',0,'Shopware_Plugins_Core_PaymentMethods_Bootstrap::addPaths',53,0),(109,'Enlight_Controller_Action_PostDispatchSecure_Backend_Order',0,'Shopware_Plugins_Core_PaymentMethods_Bootstrap::onBackendOrderPostDispatch',53,0),(110,'Shopware_Plugins_HttpCache_ClearCache',0,'Shopware_Plugins_Core_HttpCache_Bootstrap::onClearCache',52,0),(111,'Enlight_Controller_Action_PostDispatchSecure_Backend_Customer',0,'Shopware_Plugins_Core_PaymentMethods_Bootstrap::onBackendCustomerPostDispatch',53,0),(112,'Enlight_Controller_Action_PostDispatch_Backend_Index',0,'Shopware_Plugins_Backend_SwagUpdate_Bootstrap::onBackendIndexPostDispatch',55,0),(113,'Enlight_Controller_Dispatcher_ControllerPath_Backend_SwagUpdate',0,'Shopware_Plugins_Backend_SwagUpdate_Bootstrap::onGetSwagUpdateControllerPath',55,0),(114,'Enlight_Bootstrap_InitResource_SwagUpdateUpdateCheck',0,'Shopware_Plugins_Backend_SwagUpdate_Bootstrap::onInitUpdateCheck',55,0),(115,'Enlight_Controller_Dispatcher_ControllerPath_Backend_PluginManager',0,'Shopware_Plugins_Backend_PluginManager_Bootstrap::getDefaultControllerPath',56,0),(116,'Enlight_Controller_Dispatcher_ControllerPath_Backend_PluginInstaller',0,'Shopware_Plugins_Backend_PluginManager_Bootstrap::getDefaultControllerPath',56,0),(117,'Shopware\\Models\\Emotion\\Emotion::postUpdate',0,'Shopware_Plugins_Core_HttpCache_Bootstrap::onPostPersist',52,0),(118,'Shopware\\Models\\Emotion\\Emotion::postPersist',0,'Shopware_Plugins_Core_HttpCache_Bootstrap::onPostPersist',52,0),(119,'Enlight_Controller_Front_DispatchLoopShutdown',0,'Shopware_Plugins_Core_System_Bootstrap::onDispatchLoopShutdown',10,0),(120,'Shopware\\Models\\Article\\Price::postPersist',0,'Shopware_Plugins_Core_HttpCache_Bootstrap::onPostPersist',52,0),(121,'Shopware\\Models\\Article\\Price::postUpdate',0,'Shopware_Plugins_Core_HttpCache_Bootstrap::onPostPersist',52,0),(122,'Shopware\\Models\\Article\\Detail::postPersist',0,'Shopware_Plugins_Core_HttpCache_Bootstrap::onPostPersist',52,0),(123,'Shopware\\Models\\Article\\Detail::postUpdate',0,'Shopware_Plugins_Core_HttpCache_Bootstrap::onPostPersist',52,0);
/*!40000 ALTER TABLE `s_core_subscribes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_tax`
--

DROP TABLE IF EXISTS `s_core_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tax` decimal(10,2) NOT NULL,
  `description` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tax` (`tax`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_tax`
--

LOCK TABLES `s_core_tax` WRITE;
/*!40000 ALTER TABLE `s_core_tax` DISABLE KEYS */;
INSERT INTO `s_core_tax` VALUES (1,19.00,'19%'),(4,7.00,'7 %');
/*!40000 ALTER TABLE `s_core_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_tax_rules`
--

DROP TABLE IF EXISTS `s_core_tax_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_tax_rules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `areaID` int(11) unsigned DEFAULT NULL,
  `countryID` int(11) unsigned DEFAULT NULL,
  `stateID` int(11) unsigned DEFAULT NULL,
  `groupID` int(11) unsigned NOT NULL,
  `customer_groupID` int(11) unsigned NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupID` (`groupID`),
  KEY `countryID` (`countryID`),
  KEY `stateID` (`stateID`),
  KEY `areaID` (`areaID`),
  KEY `tax_rate_by_conditions` (`customer_groupID`,`areaID`,`countryID`,`stateID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_tax_rules`
--

LOCK TABLES `s_core_tax_rules` WRITE;
/*!40000 ALTER TABLE `s_core_tax_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_tax_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_templates`
--

DROP TABLE IF EXISTS `s_core_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esi` tinyint(1) unsigned NOT NULL,
  `style_support` tinyint(1) unsigned NOT NULL,
  `emotion` tinyint(1) unsigned NOT NULL,
  `version` int(11) unsigned NOT NULL,
  `plugin_id` int(11) unsigned DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basename` (`template`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_templates`
--

LOCK TABLES `s_core_templates` WRITE;
/*!40000 ALTER TABLE `s_core_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_templates_config_elements`
--

DROP TABLE IF EXISTS `s_core_templates_config_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_templates_config_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `default_value` text COLLATE utf8_unicode_ci,
  `selection` text COLLATE utf8_unicode_ci,
  `field_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `support_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_blank` int(1) NOT NULL DEFAULT '1',
  `container_id` int(11) NOT NULL,
  `attributes` text COLLATE utf8_unicode_ci,
  `less_compatible` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `template_id_name` (`template_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_templates_config_elements`
--

LOCK TABLES `s_core_templates_config_elements` WRITE;
/*!40000 ALTER TABLE `s_core_templates_config_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_templates_config_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_templates_config_layout`
--

DROP TABLE IF EXISTS `s_core_templates_config_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_templates_config_layout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `template_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attributes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_templates_config_layout`
--

LOCK TABLES `s_core_templates_config_layout` WRITE;
/*!40000 ALTER TABLE `s_core_templates_config_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_templates_config_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_templates_config_set`
--

DROP TABLE IF EXISTS `s_core_templates_config_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_templates_config_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `element_values` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_templates_config_set`
--

LOCK TABLES `s_core_templates_config_set` WRITE;
/*!40000 ALTER TABLE `s_core_templates_config_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_templates_config_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_templates_config_values`
--

DROP TABLE IF EXISTS `s_core_templates_config_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_templates_config_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `element_id_shop_id` (`element_id`,`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_templates_config_values`
--

LOCK TABLES `s_core_templates_config_values` WRITE;
/*!40000 ALTER TABLE `s_core_templates_config_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_templates_config_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_theme_settings`
--

DROP TABLE IF EXISTS `s_core_theme_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_theme_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compiler_force` int(1) NOT NULL,
  `compiler_create_source_map` int(1) NOT NULL,
  `compiler_compress_css` int(1) NOT NULL,
  `compiler_compress_js` int(1) NOT NULL,
  `force_reload_snippets` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_theme_settings`
--

LOCK TABLES `s_core_theme_settings` WRITE;
/*!40000 ALTER TABLE `s_core_theme_settings` DISABLE KEYS */;
INSERT INTO `s_core_theme_settings` VALUES (2,0,0,1,1,0);
/*!40000 ALTER TABLE `s_core_theme_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_translations`
--

DROP TABLE IF EXISTS `s_core_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objecttype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `objectdata` longtext COLLATE utf8_unicode_ci NOT NULL,
  `objectkey` int(11) unsigned NOT NULL,
  `objectlanguage` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dirty` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `objecttype` (`objecttype`,`objectkey`,`objectlanguage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_translations`
--

LOCK TABLES `s_core_translations` WRITE;
/*!40000 ALTER TABLE `s_core_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_units`
--

DROP TABLE IF EXISTS `s_core_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_units`
--

LOCK TABLES `s_core_units` WRITE;
/*!40000 ALTER TABLE `s_core_units` DISABLE KEYS */;
INSERT INTO `s_core_units` VALUES (1,'l','Liter'),(2,'g','Gramm'),(5,'lfm','lfm'),(6,'kg','Kilogramm'),(8,'Paket(e)','Paket(e)'),(9,'Stck.','Stück');
/*!40000 ALTER TABLE `s_core_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_widget_views`
--

DROP TABLE IF EXISTS `s_core_widget_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_widget_views` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` int(11) unsigned NOT NULL,
  `auth_id` int(11) unsigned NOT NULL,
  `column` int(11) unsigned NOT NULL,
  `position` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `widget_id` (`widget_id`,`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_widget_views`
--

LOCK TABLES `s_core_widget_views` WRITE;
/*!40000 ALTER TABLE `s_core_widget_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_core_widget_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_core_widgets`
--

DROP TABLE IF EXISTS `s_core_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_core_widgets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plugin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_core_widgets`
--

LOCK TABLES `s_core_widgets` WRITE;
/*!40000 ALTER TABLE `s_core_widgets` DISABLE KEYS */;
INSERT INTO `s_core_widgets` VALUES (1,'swag-sales-widget','Umsatz Heute und Gestern',NULL),(2,'swag-upload-widget','Drag and Drop Upload',NULL),(3,'swag-visitors-customers-widget','Besucher online',NULL),(4,'swag-last-orders-widget','Letzte Bestellungen',NULL),(5,'swag-notice-widget','Notizzettel',NULL),(6,'swag-merchant-widget','Händlerfreischaltung',NULL),(7,'swag-shopware-news-widget','shopware News',NULL);
/*!40000 ALTER TABLE `s_core_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_crontab`
--

DROP TABLE IF EXISTS `s_crontab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_crontab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elementID` int(11) DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `next` datetime DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `interval` int(11) NOT NULL,
  `active` int(1) NOT NULL,
  `disable_on_error` tinyint(1) NOT NULL DEFAULT '1',
  `end` datetime DEFAULT NULL,
  `inform_template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `inform_mail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pluginID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `action` (`action`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_crontab`
--

LOCK TABLES `s_crontab` WRITE;
/*!40000 ALTER TABLE `s_crontab` DISABLE KEYS */;
INSERT INTO `s_crontab` VALUES (1,'Geburtstagsgruß','birthday',NULL,'','2010-10-16 23:42:58','2010-10-16 12:26:44',86400,1,1,'2010-10-16 12:26:44','','',NULL),(2,'Aufräumen','clearing',NULL,'','2010-10-16 12:34:38','2010-10-16 12:34:32',86400,1,1,'2010-10-16 12:34:32','','',NULL),(3,'Lagerbestand Warnung','article_stock',NULL,'','2010-10-16 12:34:33','2010-10-16 12:34:31',86400,1,1,'2010-10-16 12:34:32','sARTICLESTOCK','{$sConfig.sMAIL}',NULL),(5,'Suche','search',NULL,'','2010-10-16 12:34:38','2010-10-16 12:34:32',86400,1,1,'2010-10-16 12:34:32','','',NULL),(6,'eMail-Benachrichtigung','notification',NULL,'','2010-10-17 00:20:28','2010-10-16 12:26:44',86400,1,1,'2010-10-16 12:26:44','','',NULL),(7,'Artikelbewertung per eMail','article_comment',NULL,'','2010-10-16 12:35:18','2010-10-16 12:34:32',86400,1,1,'2010-10-16 12:34:32','','',NULL),(8,'Topseller Refresh','RefreshTopSeller',NULL,'','2013-05-21 14:29:44',NULL,86400,1,1,'2013-05-21 14:29:44','','',50),(9,'Similar shown article refresh','RefreshSimilarShown',NULL,'','2013-05-21 14:29:44',NULL,86400,1,1,'2013-05-21 14:29:44','','',50),(10,'Refresh seo index','RefreshSeoIndex',NULL,'','2013-05-21 13:28:04',NULL,86400,1,1,'2013-05-21 13:28:04','','',51),(11,'Refresh search index','RefreshSearchIndex',NULL,'','2013-05-21 13:28:04',NULL,86400,1,1,'2013-05-21 13:28:04','','',51),(12,'HTTP Cache löschen','ClearHttpCache',NULL,'','2017-02-28 03:00:00',NULL,86400,1,1,'2017-02-28 03:00:00','','',52),(13,'Media Garbage Collector','MediaCrawler',NULL,'','2017-02-27 15:41:16',NULL,86400,0,1,'2017-02-27 15:41:16','','',NULL);
/*!40000 ALTER TABLE `s_crontab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emarketing_banners`
--

DROP TABLE IF EXISTS `s_emarketing_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emarketing_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `valid_from` datetime DEFAULT '0000-00-00 00:00:00',
  `valid_to` datetime DEFAULT '0000-00-00 00:00:00',
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link_target` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `categoryID` int(11) NOT NULL DEFAULT '0',
  `extension` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emarketing_banners`
--

LOCK TABLES `s_emarketing_banners` WRITE;
/*!40000 ALTER TABLE `s_emarketing_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_emarketing_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emarketing_banners_attributes`
--

DROP TABLE IF EXISTS `s_emarketing_banners_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emarketing_banners_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bannerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bannerID` (`bannerID`),
  CONSTRAINT `s_emarketing_banners_attributes_ibfk_1` FOREIGN KEY (`bannerID`) REFERENCES `s_emarketing_banners` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emarketing_banners_attributes`
--

LOCK TABLES `s_emarketing_banners_attributes` WRITE;
/*!40000 ALTER TABLE `s_emarketing_banners_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_emarketing_banners_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emarketing_banners_statistics`
--

DROP TABLE IF EXISTS `s_emarketing_banners_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emarketing_banners_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bannerID` int(11) NOT NULL,
  `display_date` date NOT NULL,
  `clicks` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `display_date` (`bannerID`,`display_date`),
  KEY `bannerID` (`bannerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emarketing_banners_statistics`
--

LOCK TABLES `s_emarketing_banners_statistics` WRITE;
/*!40000 ALTER TABLE `s_emarketing_banners_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_emarketing_banners_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emarketing_lastarticles`
--

DROP TABLE IF EXISTS `s_emarketing_lastarticles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emarketing_lastarticles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `articleID` int(11) unsigned NOT NULL,
  `sessionID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userID` int(11) unsigned NOT NULL,
  `shopID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articleID` (`articleID`,`sessionID`,`shopID`),
  KEY `userID` (`userID`),
  KEY `time` (`time`),
  KEY `sessionID` (`sessionID`),
  KEY `get_last_articles` (`sessionID`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emarketing_lastarticles`
--

LOCK TABLES `s_emarketing_lastarticles` WRITE;
/*!40000 ALTER TABLE `s_emarketing_lastarticles` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_emarketing_lastarticles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emarketing_partner`
--

DROP TABLE IF EXISTS `s_emarketing_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emarketing_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `datum` date NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fax` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `web` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profil` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `fix` double NOT NULL DEFAULT '0',
  `percent` double NOT NULL DEFAULT '0',
  `cookielifetime` int(11) NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '0',
  `userID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idcode` (`idcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emarketing_partner`
--

LOCK TABLES `s_emarketing_partner` WRITE;
/*!40000 ALTER TABLE `s_emarketing_partner` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_emarketing_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emarketing_partner_attributes`
--

DROP TABLE IF EXISTS `s_emarketing_partner_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emarketing_partner_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partnerID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partnerID` (`partnerID`),
  CONSTRAINT `FK__s_emarketing_partner` FOREIGN KEY (`partnerID`) REFERENCES `s_emarketing_partner` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emarketing_partner_attributes`
--

LOCK TABLES `s_emarketing_partner_attributes` WRITE;
/*!40000 ALTER TABLE `s_emarketing_partner_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_emarketing_partner_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emarketing_referer`
--

DROP TABLE IF EXISTS `s_emarketing_referer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emarketing_referer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `referer` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emarketing_referer`
--

LOCK TABLES `s_emarketing_referer` WRITE;
/*!40000 ALTER TABLE `s_emarketing_referer` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_emarketing_referer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emarketing_tellafriend`
--

DROP TABLE IF EXISTS `s_emarketing_tellafriend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emarketing_tellafriend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datum` date NOT NULL DEFAULT '0000-00-00',
  `recipient` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sender` int(11) NOT NULL DEFAULT '0',
  `confirmed` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emarketing_tellafriend`
--

LOCK TABLES `s_emarketing_tellafriend` WRITE;
/*!40000 ALTER TABLE `s_emarketing_tellafriend` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_emarketing_tellafriend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emarketing_voucher_codes`
--

DROP TABLE IF EXISTS `s_emarketing_voucher_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emarketing_voucher_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucherID` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cashed` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `voucherID_cashed` (`voucherID`,`cashed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emarketing_voucher_codes`
--

LOCK TABLES `s_emarketing_voucher_codes` WRITE;
/*!40000 ALTER TABLE `s_emarketing_voucher_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_emarketing_voucher_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emarketing_vouchers`
--

DROP TABLE IF EXISTS `s_emarketing_vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emarketing_vouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vouchercode` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `numberofunits` int(11) NOT NULL DEFAULT '0',
  `value` double NOT NULL DEFAULT '0',
  `minimumcharge` double NOT NULL DEFAULT '0',
  `shippingfree` int(1) NOT NULL DEFAULT '0',
  `bindtosupplier` int(11) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `ordercode` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `modus` int(1) NOT NULL DEFAULT '0',
  `percental` int(1) NOT NULL,
  `numorder` int(11) NOT NULL,
  `customergroup` int(11) DEFAULT NULL,
  `restrictarticles` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `strict` int(1) NOT NULL,
  `subshopID` int(1) DEFAULT NULL,
  `taxconfig` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modus` (`modus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emarketing_vouchers`
--

LOCK TABLES `s_emarketing_vouchers` WRITE;
/*!40000 ALTER TABLE `s_emarketing_vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_emarketing_vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emarketing_vouchers_attributes`
--

DROP TABLE IF EXISTS `s_emarketing_vouchers_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emarketing_vouchers_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucherID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `voucherID` (`voucherID`),
  CONSTRAINT `s_emarketing_vouchers_attributes_ibfk_1` FOREIGN KEY (`voucherID`) REFERENCES `s_emarketing_vouchers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emarketing_vouchers_attributes`
--

LOCK TABLES `s_emarketing_vouchers_attributes` WRITE;
/*!40000 ALTER TABLE `s_emarketing_vouchers_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_emarketing_vouchers_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emotion`
--

DROP TABLE IF EXISTS `s_emotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(1) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cols` int(11) DEFAULT NULL,
  `cell_spacing` int(11) NOT NULL,
  `cell_height` int(11) NOT NULL,
  `article_height` int(11) NOT NULL,
  `rows` int(11) NOT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `show_listing` int(1) NOT NULL,
  `is_landingpage` int(1) NOT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seo_keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seo_description` text COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0,1,2,3,4',
  `fullscreen` int(11) NOT NULL DEFAULT '0',
  `mode` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'masonry',
  `position` int(11) DEFAULT '1',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emotion`
--

LOCK TABLES `s_emotion` WRITE;
/*!40000 ALTER TABLE `s_emotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_emotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emotion_attributes`
--

DROP TABLE IF EXISTS `s_emotion_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emotion_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emotionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emotionID` (`emotionID`),
  CONSTRAINT `s_emotion_attributes_ibfk_1` FOREIGN KEY (`emotionID`) REFERENCES `s_emotion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emotion_attributes`
--

LOCK TABLES `s_emotion_attributes` WRITE;
/*!40000 ALTER TABLE `s_emotion_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_emotion_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emotion_categories`
--

DROP TABLE IF EXISTS `s_emotion_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emotion_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emotion_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emotion_categories`
--

LOCK TABLES `s_emotion_categories` WRITE;
/*!40000 ALTER TABLE `s_emotion_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_emotion_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emotion_element`
--

DROP TABLE IF EXISTS `s_emotion_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emotion_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emotionID` int(11) NOT NULL,
  `componentID` int(11) NOT NULL,
  `start_row` int(11) NOT NULL,
  `start_col` int(11) NOT NULL,
  `end_row` int(11) NOT NULL,
  `end_col` int(11) NOT NULL,
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `get_emotion_elements` (`emotionID`,`start_row`,`start_col`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emotion_element`
--

LOCK TABLES `s_emotion_element` WRITE;
/*!40000 ALTER TABLE `s_emotion_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_emotion_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emotion_element_value`
--

DROP TABLE IF EXISTS `s_emotion_element_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emotion_element_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emotionID` int(11) NOT NULL,
  `elementID` int(11) NOT NULL,
  `componentID` int(11) NOT NULL,
  `fieldID` int(11) NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `emotionID` (`elementID`),
  KEY `fieldID` (`fieldID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emotion_element_value`
--

LOCK TABLES `s_emotion_element_value` WRITE;
/*!40000 ALTER TABLE `s_emotion_element_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_emotion_element_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emotion_element_viewports`
--

DROP TABLE IF EXISTS `s_emotion_element_viewports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emotion_element_viewports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementID` int(11) NOT NULL,
  `emotionID` int(11) NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_row` int(11) NOT NULL,
  `start_col` int(11) NOT NULL,
  `end_row` int(11) NOT NULL,
  `end_col` int(11) NOT NULL,
  `visible` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emotion_element_viewports`
--

LOCK TABLES `s_emotion_element_viewports` WRITE;
/*!40000 ALTER TABLE `s_emotion_element_viewports` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_emotion_element_viewports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emotion_shops`
--

DROP TABLE IF EXISTS `s_emotion_shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emotion_shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emotion_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emotion_shops`
--

LOCK TABLES `s_emotion_shops` WRITE;
/*!40000 ALTER TABLE `s_emotion_shops` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_emotion_shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_emotion_templates`
--

DROP TABLE IF EXISTS `s_emotion_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_emotion_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_emotion_templates`
--

LOCK TABLES `s_emotion_templates` WRITE;
/*!40000 ALTER TABLE `s_emotion_templates` DISABLE KEYS */;
INSERT INTO `s_emotion_templates` VALUES (1,'Standard','index.tpl');
/*!40000 ALTER TABLE `s_emotion_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_es_backlog`
--

DROP TABLE IF EXISTS `s_es_backlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_es_backlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_es_backlog`
--

LOCK TABLES `s_es_backlog` WRITE;
/*!40000 ALTER TABLE `s_es_backlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_es_backlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_export`
--

DROP TABLE IF EXISTS `s_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_export` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_export` datetime NOT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `show` int(1) NOT NULL DEFAULT '1',
  `count_articles` int(11) NOT NULL,
  `expiry` datetime NOT NULL,
  `interval` int(11) NOT NULL,
  `formatID` int(11) NOT NULL DEFAULT '1',
  `last_change` datetime NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `encodingID` int(11) NOT NULL DEFAULT '1',
  `categoryID` int(11) DEFAULT NULL,
  `currencyID` int(11) DEFAULT NULL,
  `customergroupID` int(11) DEFAULT NULL,
  `partnerID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `languageID` int(11) DEFAULT NULL,
  `active_filter` int(1) NOT NULL DEFAULT '1',
  `image_filter` int(1) NOT NULL DEFAULT '0',
  `stockmin_filter` int(1) NOT NULL DEFAULT '0',
  `instock_filter` int(11) NOT NULL,
  `price_filter` double NOT NULL,
  `own_filter` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `header` longtext COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `footer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `count_filter` int(11) NOT NULL,
  `multishopID` int(11) DEFAULT NULL,
  `variant_export` int(11) unsigned NOT NULL DEFAULT '1',
  `cache_refreshed` datetime DEFAULT NULL,
  `dirty` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_export`
--

LOCK TABLES `s_export` WRITE;
/*!40000 ALTER TABLE `s_export` DISABLE KEYS */;
INSERT INTO `s_export` VALUES (1,'Google Produktsuche','2000-01-01 00:00:00',0,'4ebfa063359a73c356913df45b3fbe7f',1,0,'2000-01-01 00:00:00',0,2,'0000-00-00 00:00:00','export.txt',1,NULL,1,1,'',NULL,0,0,0,0,0,'','{strip}\nid{#S#}\ntitel{#S#}\nbeschreibung{#S#}\nlink{#S#}\nbild_url{#S#}\nean{#S#}\ngewicht{#S#}\nmarke{#S#}\nmpn{#S#}\nzustand{#S#}\nproduktart{#S#}\npreis{#S#}\nversand{#S#}\nstandort{#S#}\nwährung\n{/strip}{#L#}','{strip}\n{$sArticle.ordernumber|escape}{#S#}\n{$sArticle.name|strip_tags|strip|truncate:80:\"...\":true|escape|htmlentities}{#S#}\n{$sArticle.description_long|strip_tags|html_entity_decode|trim|regex_replace:\"#[^\\wöäüÖÄÜß\\.%&-+ ]#i\":\"\"|strip|truncate:500:\"...\":true|htmlentities|escape}{#S#}\n{$sArticle.articleID|link:$sArticle.name|escape}{#S#}\n{$sArticle.image|image:1}{#S#}\n{$sArticle.ean|escape}{#S#}\n{if $sArticle.weight}{$sArticle.weight|escape:\"number\"}{\" kg\"}{/if}{#S#}\n{$sArticle.supplier|escape}{#S#}\n{$sArticle.suppliernumber|escape}{#S#}\nNeu{#S#}\n{$sArticle.articleID|category:\" > \"|escape}{#S#}\n{$sArticle.price|escape:\"number\"}{#S#}\nDE::DHL:{$sArticle|@shippingcost:\"prepayment\":\"de\"}{#S#}\n{#S#}\n{$sCurrency.currency}\n{/strip}{#L#}','',0,1,1,NULL,0),(2,'Kelkoo','2000-01-01 00:00:00',0,'f2d27fbba2dabc03789f0ac25f82d93f',1,0,'2000-01-01 00:00:00',0,1,'0000-00-00 00:00:00','kelkoo.csv',1,NULL,1,1,'',NULL,0,0,0,0,0,'','{strip}\nurl{#S#}\ntitle{#S#}\ndescription{#S#}\nprice{#S#}\nofferid{#S#}\nimage{#S#}\navailability{#S#}\ndeliverycost\n{/strip}{#L#}','{strip}\n{$sArticle.articleID|link:$sArticle.name|escape}{#S#}\n{$sArticle.name|escape|truncate:70}{#S#}\n{$sArticle.description_long|strip_tags|strip|trim|truncate:150:\"...\":true|html_entity_decode|escape}{#S#}\n{$sArticle.price|escape:\"number\"}{#S#}\n{$sArticle.ordernumber}{#S#}\n{$sArticle.image|image:2|escape}{#S#}\n{if $sArticle.instock}001{else}002{/if}{#S#}\n{$sArticle|@shippingcost:\"prepayment\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}\n{/strip}{#L#}','',0,1,1,NULL,0),(3,'billiger.de','2000-01-01 00:00:00',0,'9ca7fd14bc772898bf01d9904d72c1ea',1,0,'2000-01-01 00:00:00',0,1,'0000-00-00 00:00:00','billiger.csv',1,NULL,1,1,'',NULL,0,0,0,0,0,'','{strip}\naid{#S#}\nbrand{#S#}\nmpnr{#S#}\nean{#S#}\nname{#S#}\ndesc{#S#}\nshop_cat{#S#}\nprice{#S#}\nppu{#S#}\nlink{#S#}\nimage{#S#}\ndlv_time{#S#}\ndlv_cost{#S#}\npzn\n{/strip}{#L#}','{strip}\n{$sArticle.ordernumber}{#S#}\n{$sArticle.supplier|escape}{#S#}\n{$sArticle.suppliernumber|escape}{#S#}\n{$sArticle.ean|escape}{#S#}\n{$sArticle.name|strip_tags|strip|truncate:80:\"...\":true|escape}{#S#}\n{$sArticle.description_long|strip_tags|strip|trim|truncate:900:\"...\":true|html_entity_decode|escape}{#S#}\n{$sArticle.articleID|category:\">\"|escape}{#S#}\n{$sArticle.price|escape:number}{#S#}\n{if $sArticle.purchaseunit}{$sArticle.price/$sArticle.purchaseunit*$sArticle.referenceunit|escape:number} {\"\\x80\"} / {$sArticle.referenceunit} {$sArticle.unit}{/if}{#S#}\n{$sArticle.articleID|link:$sArticle.name|escape}{#S#}\n{$sArticle.image|image:2}{#S#}\n{if $sArticle.instock}2 Tage{elseif $sArticle.shippingtime}{$sArticle.shippingtime} Tage{else}10 Tage{/if}{#S#}\n{$sArticle|@shippingcost:\"prepayment\":\"de\"|escape:number}{#S#}\n\n{/strip}{#L#}','',0,1,1,NULL,0),(4,'Idealo','2000-01-01 00:00:00',0,'2648057f0020fbeb7e69c238036b25e8',1,0,'2000-01-01 00:00:00',0,1,'0000-00-00 00:00:00','idealo.csv',1,NULL,1,1,'',NULL,0,0,0,0,0,'','{strip}\nKategorie{#S#}\nHersteller{#S#}\nProduktbezeichnung{#S#}\nPreis{#S#}\nHersteller-Artikelnummer{#S#}\nEAN{#S#}\nPZN{#S#}\nISBN{#S#}\nVersandkosten Nachnahme{#S#}\nVersandkosten Vorkasse{#S#}\nVersandkosten Bankeinzug{#S#}\nDeeplink{#S#}\nLieferzeit{#S#}\nArtikelnummer{#S#}\nLink Produktbild{#S#}\nProdukt Kurztext\n{/strip}{#L#}','{strip}\n{$sArticle.articleID|category:\">\"|escape|replace:\"|\":\"\"}{#S#}\n{$sArticle.supplier|replace:\"|\":\"\"}{#S#}\n{$sArticle.name|strip_tags|strip|trim|html_entity_decode|escape}{#S#}\n{$sArticle.price|escape:\"number\"}{#S#}\n{#S#}\n{#S#}\n{#S#}\n{#S#}\n{$sArticle|@shippingcost:\"cash\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}{#S#}\n{$sArticle|@shippingcost:\"prepayment\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}{#S#}\n{$sArticle|@shippingcost:\"debit\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}{#S#}\n{$sArticle.articleID|link:$sArticle.name|replace:\"|\":\"\"}{#S#}\n{if $sArticle.instock}2 Tage{elseif $sArticle.shippingtime}{$sArticle.shippingtime|escape} Tage{else}10 Tage{/if}{#S#}\n{$sArticle.ordernumber|escape}{#S#}\n{$sArticle.image|image:2}{#S#}\n{$sArticle.description_long|strip_tags|strip|trim|truncate:300:\"...\":true|escape}\n{/strip}{#L#}','',0,1,1,NULL,0),(5,'Yatego','2000-01-01 00:00:00',0,'75838aee39eab65375b5241544035f42',1,0,'2000-01-01 00:00:00',0,1,'0000-00-00 00:00:00','yatego.csv',1,NULL,1,1,'',NULL,0,0,0,0,0,'','{strip}foreign_id{#S#}\narticle_nr{#S#}\ntitle{#S#}\ntax{#S#}\ncategories{#S#}\nunits{#S#}\nshort_desc{#S#}\nlong_desc{#S#}\npicture{#S#}\nurl{#S#}\nprice{#S#}\nprice_uvp{#S#}\ndelivery_date{#S#}\ntop_offer{#S#}\nstock{#S#}\npackage_size{#S#}\nquantity_unit{#S#}\nmpn{#S#}\nmanufacturer{#S#}\nstatus{#S#}\nvariants\n{/strip}{#L#}','{strip}\n{$sArticle.articleID|escape}{#S#}\n{$sArticle.ordernumber|escape}{#S#}\n{$sArticle.name|strip_tags|strip|truncate:80:\"...\":true|replace:\"|\":\"\"} {#S#}\n{$sArticle.tax}{#S#}\n{$sArticle.articleID|category:\">\"|escape},{$sArticle.supplier}{#S#}\n{$sArticle.weight}{#S#}\n{$sArticle.description|strip_tags|strip|trim|truncate:900:\"...\":true|html_entity_decode|replace:\"|\":\"\"|escape}{#S#}\n\"{$sArticle.description_long|trim|html_entity_decode|replace:\"|\":\"|\"|replace:\'\"\':\'\"\"\'}<p>{$sArticle.attr1|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}<p>{$sArticle.attr2|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}<p>{$sArticle.attr3|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}<p>{$sArticle.attr4|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}<p>{$sArticle.attr5|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}<p>{$sArticle.attr6|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}<p>{$sArticle.attr7|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}<p>{$sArticle.attr8|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}<p>{$sArticle.attr9|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}<p>{$sArticle.attr10|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}<p>{$sArticle.attr11|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}<p>{$sArticle.attr12|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}<p>{$sArticle.attr13|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}<p>{$sArticle.attr14|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}<p>{$sArticle.attr15|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}<p>{$sArticle.attr16|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}<p>{$sArticle.attr17|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}<p>{$sArticle.attr18|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}<p>{$sArticle.attr19|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}<p>{$sArticle.attr20|regex_replace:\"/^(\\d)$/\":\"\"|regex_replace:\"/^0000-00-00$/\":\"\"|strip}\"{#S#}\n{$sArticle.image|image:2}{#S#}\n{$sArticle.articleID|link:$sArticle.name|replace:\"|\":\"\"}{#S#}\n{if $sArticle.configurator}0{else}{$sArticle.price|escape:\"number\"|escape}{/if}{#S#}\n{$sArticle.pseudoprice|escape}{#S#}\nLieferzeit in Tagen: {$sArticle.shippingtime|replace:\"0\":\"sofort\"}{#S#}\n{$sArticle.topseller}{#S#}\n{if $sArticle.configurator}\"-1\"{else}{$sArticle.instock}{/if}{#S#}\n{$sArticle.purchaseunit}{#S#}\n{$sArticle.unit_description}{#S#}\n{$sArticle.suppliernumber}{#S#}\n{$sArticle.supplier}{#S#}\n{$sArticle.active}{#S#}\n{if $sArticle.configurator}{$sArticle.articleID|escape}{else}{/if}\n{/strip}{#L#}','',0,1,1,NULL,0),(6,'schottenland.de','2000-01-01 00:00:00',0,'ad16704bf9e58f1f66f99cca7864e63d',1,0,'2000-01-01 00:00:00',0,1,'0000-00-00 00:00:00','schottenland.csv',1,NULL,1,1,'',NULL,0,0,0,0,0,'','{strip}\nHersteller|\nProduktbezeichnung|\nProduktbeschreibung|\nPreis|\nVerfügbarkeit|\nEAN|\nHersteller AN|\nDeeplink|\nArtikelnummer|\nDAN_Ingram|\nVersandkosten Nachnahme|\nVersandkosten Vorkasse|\nVersandkosten Kreditkarte|\nVersandkosten Bankeinzug\n{/strip}{#L#}','{strip}\n{$sArticle.supplier|replace:\"|\":\"\"}|\n{$sArticle.name|strip_tags|strip|truncate:80:\"...\":true|replace:\"|\":\"\"}|\n{$sArticle.description_long|strip_tags|strip|trim|truncate:900:\"...\":true|html_entity_decode|replace:\"|\":\"\"}|\n{$sArticle.price|escape:\"number\"}|\n{if $sArticle.instock}2 Tage{elseif $sArticle.shippingtime}{$sArticle.shippingtime} Tage{else}10 Tage{/if}|\n{$sArticle.ean|replace:\"|\":\"\"}|\n{$sArticle.suppliernumber|replace:\"|\":\"\"}|\n{$sArticle.articleID|link:$sArticle.name|replace:\"|\":\"\"}|\n{$sArticle.ordernumber|replace:\"|\":\"\"}|\n|\n{$sArticle|@shippingcost:\"cash\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}|\n{$sArticle|@shippingcost:\"prepayment\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}|\n{$sArticle|@shippingcost:\"credituos\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}|\n{$sArticle|@shippingcost:\"debit\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}|\n{/strip}{#L#}','',0,1,1,NULL,0),(7,'guenstiger.de','2000-01-01 00:00:00',0,'5428e68f168eae36c3882b4cf29730bb',1,0,'2000-01-01 00:00:00',0,1,'0000-00-00 00:00:00','guenstiger.csv',1,NULL,1,1,'',NULL,0,0,0,0,0,'','{strip}\nBestellnummer|\nHersteller|\nBezeichnung|\nPreis|\nLieferzeit|\nProduktLink|\nFotoLink|\nBeschreibung|\nVersandNachnahme|\nVersandKreditkarte|\nVersandLastschrift|\nVersandBankeinzug|\nVersandRechnung|\nVersandVorkasse|\nEANCode|\nGewicht\n{/strip}{#L#}','{strip}\n{$sArticle.ordernumber|replace:\"|\":\"\"}|\n{$sArticle.supplier|replace:\"|\":\"\"}|\n{$sArticle.name|strip_tags|strip|truncate:80:\"...\":true|replace:\"|\":\"\"}|\n{$sArticle.price|escape:\"number\"}|\n{if $sArticle.instock}2 Tage{elseif $sArticle.shippingtime}{$sArticle.shippingtime} Tage{else}10 Tage{/if}|\n{$sArticle.articleID|link:$sArticle.name|replace:\"|\":\"\"}|\n{$sArticle.image|image:0}|\n{$sArticle.description_long|strip_tags|strip|trim|truncate:900:\"...\":true|html_entity_decode|replace:\"|\":\"\"}|\n{$sArticle|@shippingcost:\"cash\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}|\n|\n{$sArticle|@shippingcost:\"debit\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}|\n|\n{$sArticle|@shippingcost:\"invoice\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}|\n{$sArticle|@shippingcost:\"prepayment\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}|\n{$sArticle.ean|replace:\"|\":\"\"}|\n{$sArticle.weight|replace:\"|\":\"\"}\n{/strip}{#L#}','',0,1,1,NULL,0),(8,'geizhals.at','2000-01-01 00:00:00',0,'0102715b70fa7d60d61c15c8e025824a',1,0,'2000-01-01 00:00:00',0,1,'0000-00-00 00:00:00','geizhals.csv',1,NULL,1,1,'',NULL,0,0,0,0,0,'','{strip}\nID{#S#}\nHersteller{#S#}\nArtikelbezeichnung{#S#}\nKategorie{#S#}\nBeschreibungsfeld{#S#}\nBild{#S#}\nUrl{#S#}\nLagerstandl{#S#}\nVersandkosten{#S#}\nVersandkostenNachname{#S#}\nPreis{#S#}\nEAN{#S#}\n{/strip}{#L#}','{strip}\n{$sArticle.ordernumber|escape}{#S#}\n{$sArticle.supplier|escape}{#S#}\n{$sArticle.name|escape}{#S#}\n{$sArticle.articleID|category:\">\"|escape}{#S#}\n{$sArticle.description_long|strip_tags|strip|trim|truncate:900:\"...\":true|html_entity_decode|escape}{#S#}\n{$sArticle.image|image:0}{#S#}\n{$sArticle.articleID|link:$sArticle.name|escape}{#S#}\n{if $sArticle.instock}2 Tage{elseif $sArticle.shippingtime}{$sArticle.shippingtime} Tage{else}10 Tage{/if}{#S#}\n{$sArticle|@shippingcost:\"prepayment\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}{#S#}\n{$sArticle|@shippingcost:\"cash\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}{#S#}\n{$sArticle.price|escape:\"number\"}{#S#}\n{$sArticle.ean|escape}{#S#}\n{/strip}{#L#}','',0,1,1,NULL,0),(9,'Ciao','2000-01-01 00:00:00',0,'b8728935bc62480971c0dfdf74eabf6f',1,0,'2000-01-01 00:00:00',0,1,'0000-00-00 00:00:00','ciao.csv',1,NULL,1,1,'',NULL,0,1,0,0,0,'','{strip}\nOffer ID{#S#}\nBrand{#S#}\nProduct Name{#S#}\nCategory{#S#}\nDescription{#S#}\nImage URL{#S#}\nProduct URL{#S#}\nDelivery{#S#}\nShippingCost{#S#}\nPrice{#S#}\nProduct ID{#S#}\n{/strip}{#L#}','{strip}\n{$sArticle.ordernumber|escape}{#S#}\n{$sArticle.supplier|escape}{#S#}\n{$sArticle.name|strip_tags|strip|truncate:80:\"...\":true|escape}{#S#}\n{$sArticle.articleID|category:\">\"|escape}{#S#}\n{$sArticle.description_long|strip_tags|strip|trim|truncate:900:\"...\":true|html_entity_decode|escape}{#S#}\n{$sArticle.image|image:0}{#S#}\n{$sArticle.articleID|link:$sArticle.name|escape}{#S#}\n{if $sArticle.instock}2 Tage{elseif $sArticle.shippingtime}{$sArticle.shippingtime} Tage{else}10 Tage{/if}{#S#}\n{$sArticle|@shippingcost:\"prepayment\":\"de\"|escape:\"number\"}{#S#}\n{$sArticle.price|escape:\"number\"}{#S#}\n{#S#}\n{/strip}{#L#}','',0,1,1,NULL,0),(10,'Pangora','2000-01-01 00:00:00',0,'162a610b4a85c13fd448f9f5e2290fd5',1,0,'2000-01-01 00:00:00',0,1,'0000-00-00 00:00:00','pangora.csv',1,NULL,1,1,'',NULL,0,0,0,0,0,'','{strip}\noffer-id{#S#}\nmfname{#S#}\nlabel{#S#}\nmerchant-category{#S#}\ndescription{#S#}\nimage-url{#S#}\noffer-url{#S#}\nships-in{#S#}\nrelease-date{#S#}\ndelivery-charge{#S#}\nprices	old-prices{#S#}\nproduct-id{#S#}\n{/strip}{#L#}','{strip}\n{$sArticle.ordernumber|escape}{#S#}\n{$sArticle.supplier|escape}{#S#}\n{$sArticle.name|strip_tags|strip|truncate:80:\"...\":true|escape}{#S#}\n{$sArticle.articleID|category:\">\"|escape}{#S#}\n{$sArticle.description_long|strip_tags|strip|trim|truncate:900:\"...\":true|html_entity_decode|escape}{#S#}\n{$sArticle.image|image:0|escape}{#S#}\n{$sArticle.articleID|link:$sArticle.name|escape}{#S#}\n{if $sArticle.instock}2 Tage{elseif $sArticle.shippingtime}{$sArticle.shippingtime} Tage{else}10 Tage{/if}{#S#}\n{$sArticle.releasedate|escape}{#S#}\n{$sArticle|@shippingcost:\"prepayment\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}{#S#}\n{$sArticle.price|escape:\"number\"}{#S#}\n{#S#}\n{/strip}{#L#}\n\n','',0,1,1,NULL,0),(11,'Shopping.com','2000-01-01 00:00:00',0,'cb29f40e760f11b9071d081b8ca8039c',1,0,'2000-01-01 00:00:00',0,1,'0000-00-00 00:00:00','shopping.csv',1,NULL,1,1,'',NULL,0,0,0,0,0,'','{strip}\nMPN|\nEAN|\nHersteller|\nProduktname|\nProduktbeschreibung|\nPreis|\nProdukt-URL|\nProduktbild-URL|\nKategorie|\nVerfügbar|\nVerfügbarkeitsdetails|\nVersandkosten\n{/strip}{#L#}','{strip}\n|\n{$sArticle.ean}|\n{$sArticle.supplier}|\n{$sArticle.name|strip_tags|strip|truncate:80:\"...\":true}|\n{$sArticle.description_long|strip_tags|strip|trim|truncate:900:\"...\":true|html_entity_decode}|\n{$sArticle.price|escape:\"number\"}|\n{$sArticle.articleID|link:$sArticle.name}|\n{$sArticle.image|image:1}|\n{$sArticle.articleID|category:\">\"}|\n{if $sArticle.instock}Ja{else}Nein{/if}|\n{if $sArticle.instock}1-3 Werktage{elseif $sArticle.shippingtime}{$sArticle.shippingtime} Tage{else}10 Tage{/if}|\n{$sArticle|@shippingcost:\"prepayment\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}\n{/strip}{#L#}','',0,1,1,NULL,0),(12,'Hitmeister','2000-01-01 00:00:00',0,'76de62d0fd5ec76b483aa6529d36ee45',1,0,'2000-01-01 00:00:00',0,1,'0000-00-00 00:00:00','hitmeister.csv',1,NULL,1,1,'',NULL,0,0,0,0,0,'','{strip}\nean{#S#}\ncondition{#S#}\nprice{#S#}\ncomment{#S#}\noffer_id{#S#}\nlocation{#S#}\ncount{#S#}\ndelivery_time{#S#}\n{/strip}{#L#}','{strip}\n{$sArticle.ean|escape}{#S#}\n100{#S#}\n{$sArticle.price*100}{#S#}\n{#S#}\n{$sArticle.ordernumber|escape}{#S#}\n{#S#}\n{#S#}\n{if $sArticle.instock}b{else}d{/if}{#S#}\n{/strip}{#L#}','',0,1,1,NULL,0),(13,'evendi.de','2000-01-01 00:00:00',0,'5ac98a759a6f392ea0065a500acf82e6',1,0,'2000-01-01 00:00:00',0,1,'0000-00-00 00:00:00','evendi.csv',1,NULL,1,1,'',NULL,0,0,0,0,0,'','{strip}\nEindeutige Händler-Artikelnummer{#S#}\nPreis in Euro{#S#}\nKategorie{#S#}\nProduktbezeichnung{#S#}\nProduktbeschreibung{#S#}\nLink auf Detailseite{#S#}\nLieferzeit{#S#}\nEAN-Nummer{#S#}\nHersteller-Artikelnummer{#S#}\nLink auf Produktbild{#S#}\nHersteller{#S#}\nVersandVorkasse{#S#}\nVersandNachnahme{#S#}\nVersandLastschrift{#S#}\nVersandKreditkarte{#S#}\nVersandRechnung{#S#}\nVersandPayPal\n{/strip}{#L#}','{strip}\n{$sArticle.ordernumber|escape}{#S#}\n{$sArticle.price|escape:\"number\"|escape}{#S#}\n{$sArticle.articleID|category:\">\"|escape}{#S#}\n{$sArticle.name|strip_tags|strip|truncate:80:\"...\":true|escape}{#S#}\n{$sArticle.description_long|strip_tags|strip|trim|truncate:900:\"...\":true|html_entity_decode|escape}{#S#}\n{$sArticle.articleID|link:$sArticle.name|escape}{#S#}\n{#F#}{if $sArticle.instock}1-3 Werktage{elseif $sArticle.shippingtime}{$sArticle.shippingtime} Tage{else}10 Tage{/if}{#F#}{#S#}\n{$sArticle.ean|escape}{#S#}\n{$sArticle.suppliernumber|escape}{#S#}\n{$sArticle.image|image:0|escape}{#S#}\n{$sArticle.supplier|escape}{#S#}\n{$sArticle|@shippingcost:\"prepayment\":\"de\"|escape:\"number\"|escape}{#S#}\n{$sArticle|@shippingcost:\"cash\":\"de\"|escape:\"number\"|escape}{#S#}\n{$sArticle|@shippingcost:\"debit\":\"de\"|escape:\"number\"|escape}{#S#}\n{\"\"|escape}{#S#}\n{$sArticle|@shippingcost:\"invoice\":\"de\"|escape:\"number\"|escape}{#S#}\n{$sArticle|@shippingcost:\"paypal\":\"de\"|escape:\"number\"|escape}{#S#}\n{/strip}{#L#}','',0,1,1,NULL,0),(14,'affili.net','2000-01-01 00:00:00',0,'bc960c18cbeea9038314d040e7dc92f5',1,0,'2000-01-01 00:00:00',0,1,'0000-00-00 00:00:00','affilinet.csv',1,NULL,1,1,'',NULL,0,0,0,0,0,'','{strip}\nart_number{#S#}\ncategory{#S#}\ntitle{#S#}\ndescription{#S#}\nprice{#S#}\nimg_url{#S#}\ndeeplink1{#S#}\n{/strip}{#L#}','{strip}\n{$sArticle.ordernumber}{#S#}\n{$sArticle.articleID|category:\">\"|escape}{#S#}\n{$sArticle.name|strip_tags|strip|truncate:80:\"...\":true|escape}{#S#}\n{$sArticle.description_long|strip_tags|strip|trim|truncate:900:\"...\":true|html_entity_decode|escape}{#S#}\n{$sArticle.price|escape:\"number\"}{#S#}\n{$sArticle.image|image:2|escape}{#S#}\n{$sArticle.articleID|link:$sArticle.name|escape}{#S#}\n{/strip}{#L#}','',0,1,1,NULL,0),(15,'Google Produktsuche XML','2000-01-01 00:00:00',0,'e8eca3b3bbbad77afddb67b8138900e1',1,0,'2000-01-01 00:00:00',0,3,'2008-09-27 09:52:17','export.xml',2,NULL,1,1,'',NULL,0,0,0,0,0,'','<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<rss version=\"2.0\" xmlns:g=\"http://base.google.com/ns/1.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">\n<channel>\n	<atom:link href=\"http://{$sConfig.sBASEPATH}/engine/connectors/export/{$sSettings.id}/{$sSettings.hash}/{$sSettings.filename}\" rel=\"self\" type=\"application/rss+xml\" />\n	<title>{$sConfig.sSHOPNAME}</title>\n	<description>Beschreibung im Header hinterlegen</description>\n	<link>http://{$sConfig.sBASEPATH}</link>\n	<language>DE</language>\n	<image>\n		<url>http://{$sConfig.sBASEPATH}/templates/_default/frontend/_resources/images/logo.jpg</url>\n		<title>{$sConfig.sSHOPNAME}</title>\n		<link>http://{$sConfig.sBASEPATH}</link>\n	</image>','<item> \n    <g:id>{$sArticle.articleID|escape}</g:id>\n	<title>{$sArticle.name|strip_tags|strip|truncate:80:\"...\":true|escape}</title>\n	<description>{$sArticle.description_long|strip_tags|strip|truncate:900:\"...\"|escape}</description>\n	<g:google_product_category>Wählen Sie hier Ihre Google Produkt-Kategorie</g:google_product_category>\n	<g:product_type>{$sArticle.articleID|category:\" > \"|escape}</g:product_type>\n	<link>{$sArticle.articleID|link:$sArticle.name|escape}</link>\n	<g:image_link>{$sArticle.image|image:1}</g:image_link>\n	<g:condition>neu</g:condition>\n	<g:availability>{if $sArticle.esd}bestellbar{elseif $sArticle.instock>0}bestellbar{elseif $sArticle.releasedate && $sArticle.releasedate|strtotime > $smarty.now}vorbestellt{elseif $sArticle.shippingtime}bestellbar{else}nicht auf lager{/if}</g:availability>\n	<g:price>{$sArticle.price|format:\"number\"}</g:price>\n	<g:brand>{$sArticle.supplier|escape}</g:brand>\n	<g:gtin>{$sArticle.suppliernumber|replace:\"|\":\"\"}</g:gtin>\n	<g:mpn>{$sArticle.suppliernumber|escape}</g:mpn>\n	<g:shipping>\n       <g:country>DE</g:country>\n       <g:service>Standard</g:service>\n       <g:price>{$sArticle|@shippingcost:\"prepayment\":\"de\"|escape:number}</g:price>\n    </g:shipping>\n  {if $sArticle.changed}<pubDate>{$sArticle.changed|date_format:\"%a, %d %b %Y %T %Z\"}</pubDate>{/if}		\n</item>','</channel>\n</rss>',0,1,1,NULL,0),(16,'preissuchmaschine.de','2000-01-01 00:00:00',0,'67fbbab544165d9d4e5352f9a12054a0',1,0,'2000-01-01 00:00:00',0,1,'0000-00-00 00:00:00','preissuchmaschine.csv',1,NULL,1,1,'',NULL,0,0,0,0,0,'','{strip}\nBestellnummer|\nHersteller|\nBezeichnung|\nPreis|\nLieferzeit|\nProduktLink|\nFotoLink|\nBeschreibung|\nVersandNachnahme|\nVersandKreditkarte|\nVersandLastschrift|\nVersandBankeinzug|\nVersandRechnung|\nVersandVorkasse|\nEANCode|\nGewicht\n{/strip}{#L#}','{strip}\n{$sArticle.ordernumber|replace:\"|\":\"\"}|\n{$sArticle.supplier|replace:\"|\":\"\"}|\n{$sArticle.name|strip_tags|strip|truncate:80:\"...\":true|replace:\"|\":\"\"}|\n{$sArticle.price|escape:\"number\"}|\n{if $sArticle.instock}2 Tage{elseif $sArticle.shippingtime}{$sArticle.shippingtime} Tage{else}10 Tage{/if}|\n{$sArticle.articleID|link:$sArticle.name|replace:\"|\":\"\"}|\n{$sArticle.image|image:0}|\n{$sArticle.description_long|strip_tags|strip|trim|truncate:900:\"...\":true|html_entity_decode|replace:\"|\":\"\"}|\n{$sArticle|@shippingcost:\"cash\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}|\n|\n{$sArticle|@shippingcost:\"debit\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}|\n|\n{$sArticle|@shippingcost:\"invoice\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}|\n{$sArticle|@shippingcost:\"prepayment\":\"de\":\"Deutsche Post Standard\"|escape:\"number\"}|\n{$sArticle.ean|replace:\"|\":\"\"}|\n{$sArticle.weight|replace:\"|\":\"\"}\n{/strip}{#L#}','',0,1,1,NULL,0),(17,'RSS Feed-Template','2000-01-01 00:00:00',0,'3a6ff2a4f921a10d33d9b9ec25529a5d',1,0,'2000-01-01 00:00:00',0,3,'0000-00-00 00:00:00','export.xml',2,NULL,1,1,'',NULL,0,0,0,0,0,'','<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<rss version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">\n<channel>\n	<atom:link href=\"http://{$sConfig.sBASEPATH}/engine/connectors/export/{$sSettings.id}/{$sSettings.hash}/{$sSettings.filename}\" rel=\"self\" type=\"application/rss+xml\" />\n	<title>{$sConfig.sSHOPNAME}</title>\n	<description>Shopbeschreibung ...</description>\n	<link>http://{$sConfig.sBASEPATH}</link>\n	<language>{$sLanguage.isocode}-{$sLanguage.isocode}</language>\n	<image>\n		<url>http://{$sConfig.sBASEPATH}/templates/0/de/media/img/default/store/logo.gif</url>\n		<title>{$sConfig.sSHOPNAME}</title>\n		<link>http://{$sConfig.sBASEPATH}</link>\n	</image>{#L#}','<item> \n	<title>{$sArticle.name|strip_tags|htmlspecialchars_decode|strip|escape}</title>\n	<guid>{$sArticle.articleID|link:$sArticle.name|escape}</guid>\n	<link>{$sArticle.articleID|link:$sArticle.name}</link>\n	<description>{if $sArticle.image}\n		<a href=\"{$sArticle.articleID|link:$sArticle.name}\" style=\"border:0 none;\">\n			<img src=\"{$sArticle.image|image:0}\" align=\"right\" style=\"padding: 0pt 0pt 12px 12px; float: right;\" />\n		</a>\n{/if}\n		{$sArticle.description_long|strip_tags|regex_replace:\"/[^\\wöäüÖÄÜß .?!,&:%;\\-\\\"\']/i\":\"\"|trim|truncate:900:\"...\"|escape}\n	</description>\n	<category>{$sArticle.articleID|category:\">\"|htmlspecialchars_decode|escape}</category>\n{if $sArticle.changed} 	{assign var=\"sArticleChanged\" value=$sArticle.changed|strtotime}<pubDate>{\"r\"|date:$sArticleChanged}</pubDate>{\"rn\"}{/if}\n</item>{#L#}','</channel>\n</rss>',0,1,1,NULL,0);
/*!40000 ALTER TABLE `s_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_export_articles`
--

DROP TABLE IF EXISTS `s_export_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_export_articles` (
  `feedID` int(11) NOT NULL,
  `articleID` int(11) NOT NULL,
  PRIMARY KEY (`feedID`,`articleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_export_articles`
--

LOCK TABLES `s_export_articles` WRITE;
/*!40000 ALTER TABLE `s_export_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_export_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_export_attributes`
--

DROP TABLE IF EXISTS `s_export_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_export_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exportID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exportID` (`exportID`),
  CONSTRAINT `s_export_attributes_ibfk_1` FOREIGN KEY (`exportID`) REFERENCES `s_export` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_export_attributes`
--

LOCK TABLES `s_export_attributes` WRITE;
/*!40000 ALTER TABLE `s_export_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_export_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_export_categories`
--

DROP TABLE IF EXISTS `s_export_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_export_categories` (
  `feedID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  PRIMARY KEY (`feedID`,`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_export_categories`
--

LOCK TABLES `s_export_categories` WRITE;
/*!40000 ALTER TABLE `s_export_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_export_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_export_suppliers`
--

DROP TABLE IF EXISTS `s_export_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_export_suppliers` (
  `feedID` int(11) NOT NULL,
  `supplierID` int(11) NOT NULL,
  PRIMARY KEY (`feedID`,`supplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_export_suppliers`
--

LOCK TABLES `s_export_suppliers` WRITE;
/*!40000 ALTER TABLE `s_export_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_export_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_filter`
--

DROP TABLE IF EXISTS `s_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `comparable` int(1) NOT NULL,
  `sortmode` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `get_sets_query` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_filter`
--

LOCK TABLES `s_filter` WRITE;
/*!40000 ALTER TABLE `s_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_filter_articles`
--

DROP TABLE IF EXISTS `s_filter_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_filter_articles` (
  `articleID` int(10) unsigned NOT NULL,
  `valueID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`articleID`,`valueID`),
  KEY `valueID` (`valueID`),
  KEY `articleID` (`articleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_filter_articles`
--

LOCK TABLES `s_filter_articles` WRITE;
/*!40000 ALTER TABLE `s_filter_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_filter_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_filter_attributes`
--

DROP TABLE IF EXISTS `s_filter_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_filter_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filterID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filterID` (`filterID`),
  CONSTRAINT `s_filter_attributes_ibfk_1` FOREIGN KEY (`filterID`) REFERENCES `s_filter` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_filter_attributes`
--

LOCK TABLES `s_filter_attributes` WRITE;
/*!40000 ALTER TABLE `s_filter_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_filter_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_filter_options`
--

DROP TABLE IF EXISTS `s_filter_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_filter_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filterable` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `get_options_query` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_filter_options`
--

LOCK TABLES `s_filter_options` WRITE;
/*!40000 ALTER TABLE `s_filter_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_filter_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_filter_options_attributes`
--

DROP TABLE IF EXISTS `s_filter_options_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_filter_options_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `optionID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `optionID` (`optionID`),
  CONSTRAINT `s_filter_options_attributes_ibfk_1` FOREIGN KEY (`optionID`) REFERENCES `s_filter_options` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_filter_options_attributes`
--

LOCK TABLES `s_filter_options_attributes` WRITE;
/*!40000 ALTER TABLE `s_filter_options_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_filter_options_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_filter_relations`
--

DROP TABLE IF EXISTS `s_filter_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_filter_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupID` int(11) NOT NULL,
  `optionID` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groupID` (`groupID`,`optionID`),
  KEY `get_set_assigns_query` (`groupID`,`position`),
  KEY `groupID_2` (`groupID`),
  KEY `optionID` (`optionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_filter_relations`
--

LOCK TABLES `s_filter_relations` WRITE;
/*!40000 ALTER TABLE `s_filter_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_filter_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_filter_values`
--

DROP TABLE IF EXISTS `s_filter_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_filter_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `optionID` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `media_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `optionID` (`optionID`,`value`),
  KEY `get_property_value_by_option_id_query` (`optionID`,`position`),
  KEY `optionID_2` (`optionID`),
  KEY `filters_order_by_position` (`optionID`,`position`,`id`),
  KEY `filters_order_by_numeric` (`optionID`,`id`),
  KEY `filters_order_by_alphanumeric` (`optionID`,`value`,`id`),
  KEY `media_id` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_filter_values`
--

LOCK TABLES `s_filter_values` WRITE;
/*!40000 ALTER TABLE `s_filter_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_filter_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_filter_values_attributes`
--

DROP TABLE IF EXISTS `s_filter_values_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_filter_values_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valueID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `valueID` (`valueID`),
  CONSTRAINT `s_filter_values_attributes_ibfk_1` FOREIGN KEY (`valueID`) REFERENCES `s_filter_values` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_filter_values_attributes`
--

LOCK TABLES `s_filter_values_attributes` WRITE;
/*!40000 ALTER TABLE `s_filter_values_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_filter_values_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_library_component`
--

DROP TABLE IF EXISTS `s_library_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_library_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `x_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `convert_function` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cls` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pluginID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_library_component`
--

LOCK TABLES `s_library_component` WRITE;
/*!40000 ALTER TABLE `s_library_component` DISABLE KEYS */;
INSERT INTO `s_library_component` VALUES (2,'Text Element','emotion-components-html-element',NULL,'','component_html','html-text-element',NULL),(3,'Banner','emotion-components-banner','getBannerMappingLinks','','component_banner','banner-element',NULL),(4,'Artikel','emotion-components-article','getArticle','','component_article','article-element',NULL),(5,'Kategorie-Teaser','emotion-components-category-teaser','getCategoryTeaser','','component_category_teaser','category-teaser-element',NULL),(6,'Blog-Artikel','emotion-components-blog','getBlogEntry','','component_blog','blog-element',NULL),(7,'Banner-Slider','emotion-components-banner-slider','getBannerSlider','','component_banner_slider','banner-slider-element',NULL),(8,'Youtube-Video','emotion-components-youtube',NULL,'','component_youtube','youtube-element',NULL),(9,'iFrame-Element','emotion-components-iframe',NULL,'','component_iframe','iframe-element',NULL),(10,'Hersteller-Slider','emotion-components-manufacturer-slider','getManufacturerSlider','','component_manufacturer_slider','manufacturer-slider-element',NULL),(11,'Artikel-Slider','emotion-components-article-slider','getArticleSlider','','component_article_slider','article-slider-element',NULL),(12,'HTML5 Video-Element','emotion-components-html-video','getHtml5Video','','component_video','emotion--element-video',NULL),(13,'Code Element','emotion-components-html-code',NULL,'','component_html_code','html-code-element',NULL);
/*!40000 ALTER TABLE `s_library_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_library_component_field`
--

DROP TABLE IF EXISTS `s_library_component_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_library_component_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `componentID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `x_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `support_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `help_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `help_text` text COLLATE utf8_unicode_ci NOT NULL,
  `store` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `allow_blank` int(1) NOT NULL,
  `translatable` int(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_library_component_field`
--

LOCK TABLES `s_library_component_field` WRITE;
/*!40000 ALTER TABLE `s_library_component_field` DISABLE KEYS */;
INSERT INTO `s_library_component_field` VALUES (3,3,'file','mediaselectionfield','','Bild','','','','','','','',0,0,3),(4,2,'text','tinymce','','Text','Anzuzeigender Text','HTML-Text','Geben Sie hier den Text ein der im Element angezeigt werden soll.','','','','',0,1,4),(5,4,'article','emotion-components-fields-article','','Artikelsuche','Der anzuzeigende Artikel','Lorem ipsum dolor','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam','','','','',0,0,9),(6,2,'cms_title','textfield','','Titel','','','','','','','',1,1,6),(7,3,'bannerMapping','hidden','json','','','','','','','','',0,0,7),(8,4,'article_type','emotion-components-fields-article-type','','Typ des Artikels','','','','','','','',0,0,8),(9,5,'image_type','emotion-components-fields-category-image-type','','Typ des Bildes','','','','','','','',0,0,9),(10,5,'image','mediaselectionfield','','Bild','','','','','','','',1,0,10),(11,5,'category_selection','emotion-components-fields-category-selection','','','','','','','','','',1,0,11),(12,6,'entry_amount','numberfield','','Anzahl','','','','','','','',0,0,12),(13,7,'banner_slider_title','textfield','','Überschrift','','','','','','','',1,1,13),(15,7,'banner_slider_arrows','checkbox','','Pfeile anzeigen','','','','','','','',0,0,15),(16,7,'banner_slider_numbers','checkbox','','Nummern ausgeben','Bitte beachten Sie, dass diese Einstellung nur Auswirkungen auf das \"Emotion\"-Template hat.','','','','','','',0,0,16),(17,7,'banner_slider_scrollspeed','numberfield','','Scroll-Geschwindigkeit','','','','','','','',0,0,17),(18,7,'banner_slider_rotation','checkbox','','Automatisch rotieren','','','','','','','',0,0,18),(19,7,'banner_slider_rotatespeed','numberfield','','Rotations Geschwindigkeit','','','','','','','5000',0,0,19),(20,7,'banner_slider','hidden','json','','','','','','','','',0,0,20),(22,8,'video_id','textfield','','Youtube-Video ID','','','','','','','',0,1,22),(23,8,'video_hd','checkbox','','HD-Video verwenden','','','','','','','',0,0,23),(24,9,'iframe_url','textfield','','URL','','','','','','','',0,1,24),(25,10,'manufacturer_type','emotion-components-fields-manufacturer-type','','','','','','','','','',0,0,25),(26,10,'manufacturer_category','emotion-components-fields-category-selection','','','','','','','','','',1,0,26),(27,10,'selected_manufacturers','hidden','json','','','','','','','','',0,0,27),(28,10,'manufacturer_slider_title','textfield','','Überschrift','','','','','','','',1,1,28),(30,10,'manufacturer_slider_arrows','checkbox','','Pfeile anzeigen','','','','','','','',0,0,30),(32,10,'manufacturer_slider_scrollspeed','numberfield','','Scroll-Geschwindigkeit','','','','','','','',0,0,32),(33,10,'manufacturer_slider_rotation','checkbox','','Automatisch rotieren','','','','','','','',0,0,33),(34,10,'manufacturer_slider_rotatespeed','numberfield','','Rotations Geschwindigkeit','','','','','','','5000',0,0,34),(36,11,'article_slider_type','emotion-components-fields-article-slider-type','','','','','','','','','',0,0,36),(37,11,'selected_articles','hidden','json','','','','','','','','',0,0,37),(38,11,'article_slider_max_number','numberfield','','max. Anzahl','','','','','','','',0,0,39),(39,11,'article_slider_title','textfield','','Überschrift','','','','','','','',1,1,40),(41,11,'article_slider_arrows','checkbox','','Pfeile anzeigen','','','','','','','',0,0,42),(43,11,'article_slider_scrollspeed','numberfield','','Scroll-Geschwindigkeit','','','','','','','',0,0,44),(44,11,'article_slider_rotation','checkbox','','Automatisch rotieren','','','','','','','',0,0,45),(45,11,'article_slider_rotatespeed','numberfield','','Rotations Geschwindigkeit','','','','','','','5000',0,0,46),(47,3,'link','textfield','','Link','','','','','','','',1,1,47),(48,5,'blog_category','checkboxfield','','Blog-Kategorie','Bei der ausgewählten Kategorie handelt es sich um eine Blog-Kategorie','','','','','','',0,0,48),(59,11,'article_slider_category','emotion-components-fields-category-selection','','','','','','','','','',1,0,38),(65,3,'bannerPosition','hidden','','','','','','','','','center',0,0,NULL),(66,4,'productImageOnly','checkboxfield','','Nur Produktbild','Bei aktivierter Einstellung wird nur das Produktbild dargestellt.','','','','label','key','',0,0,10),(68,6,'blog_entry_selection','emotion-components-fields-category-selection','','Kategorie','','','','','label','key','',0,0,10),(69,12,'videoMode','emotion-components-fields-video-mode','','Modus','Bestimmen Sie das Verhalten des Videos. Legen Sie fest, ob das Video skalierend, füllend oder gestreckt dargestellt werden soll.','','','','label','key','',0,0,40),(70,12,'overlay','textfield','','Overlay Farbe','Legen Sie eine Hintergrundfarbe für das Overlay fest. Ein RGBA-Wert wird empfohlen.','','','','','','rgba(0, 0, 0, .2)',1,0,71),(71,12,'originTop','numberfield','','Oberer Ausgangspunkt','Legt den oberen Ausgangspunkt für die Skalierung des Videos fest. Die Angabe erfolgt in Prozent.','','','','','','50',1,0,69),(72,12,'originLeft','numberfield','','Linker Ausgangspunkt','Legt den linken Ausgangspunkt für die Skalierung des Videos fest. Die Angabe erfolgt in Prozent.','','','','','','50',1,0,68),(73,12,'scale','numberfield','','Zoom-Faktor','Wenn Sie den Modus Füllen gewählt haben können Sie den Zoom-Faktor mit dieser Option ändern.','','','','','','1.0',1,0,67),(74,12,'muted','checkbox','','Video stumm schalten','Die Ton-Spur des Videos wird stumm geschaltet','','','','','','1',1,0,60),(75,12,'loop','checkbox','','Video schleifen','Das Video wird in einer Dauerschleife angezeigt','','','','','','1',1,0,59),(76,12,'controls','checkbox','','Video-Steuerung anzeigen','Nicht für den Modus Füllen oder Strecken empfohlen.','','','','','','1',1,0,58),(77,12,'autobuffer','checkbox','','Video automatisch vorladen','','','','','','','1',1,0,57),(78,12,'autoplay','checkbox','','Video automatisch abspielen','','','','','','','1',1,0,56),(79,12,'html_text','tinymce','','Overlay Text','Sie können ein Overlay mit einem Text über das Video legen.','','','','','','',1,0,70),(80,12,'fallback_picture','mediatextfield','','Vorschau-Bild','Das Vorschau-Bild wird gezeigt wenn das Video noch nicht abgespielt wird.','','','','','','',0,0,44),(81,12,'h264_video','mediatextfield','','.mp4 Video','Video für Browser mit MP4 Support. Auch externer Pfad möglich.','','','','','','',0,0,43),(82,12,'ogg_video','mediatextfield','','.ogv/.ogg Video','Video für Browser mit Ogg Support. Auch externer Pfad möglich.','','','','','','',0,0,42),(83,12,'webm_video','mediatextfield','','.webm Video','Video für Browser mit WebM Support. Auch externer Pfad möglich.','','','','','','',0,0,41),(84,2,'needsNoStyling','checkbox','','Kein Styling hinzufügen','Definiert, dass kein weiteres Layout-Styling hinzugefügt wird.','','','','','','0',0,0,10),(85,3,'title','textfield','','Title Text','','','','','','','',1,1,50),(86,11,'article_slider_stream','productstreamselection','','','','','','','name','id','',0,0,38),(87,13,'javascript','codemirrorfield','','JavaScript Code','','','','','','','',1,1,0),(88,13,'smarty','codemirrorfield','','HTML Code','','','','','','','',1,1,1),(89,3,'banner_link_target','emotion-components-fields-link-target','','Link-Ziel','','','','','','','',1,0,48),(90,4,'article_category','emotion-components-fields-category-selection','','Kategorie','','','','','','','',1,0,9),(91,4,'no_border','checkbox','','','','','','','','','',1,0,90),(92,11,'no_border','checkbox','','','','','','','','','',1,0,90),(93,10,'no_border','checkbox','','','','','','','','','',1,0,90),(94,8,'video_autoplay','checkbox','','Video automatisch starten','','','','','','','0',0,0,24),(95,8,'video_related','checkbox','','Empfehlungen ausblenden','','','','','','','0',0,0,25),(96,8,'video_controls','checkbox','','Steuerung ausblenden','','','','','','','0',0,0,26),(97,8,'video_start','numberfield','','Starten nach x-Sekunden','','','','','','','',1,0,27),(98,8,'video_end','numberfield','','Stoppen nach x-Sekunden','','','','','','','',1,0,28),(99,8,'video_info','checkbox','','Info ausblenden','','','','','','','0',0,0,29),(100,8,'video_branding','checkbox','','Branding ausblenden','','','','','','','0',0,0,30),(101,8,'video_loop','checkbox','','Loop aktivieren','','','Loop ist nicht mit Start- und Endzeiten kompatibel. Video wird wieder von Beginn abgespielt.','','','','0',0,0,31);
/*!40000 ALTER TABLE `s_library_component_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_media`
--

DROP TABLE IF EXISTS `s_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `albumID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` int(10) unsigned NOT NULL,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `created` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Album` (`albumID`),
  KEY `path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_media`
--

LOCK TABLES `s_media` WRITE;
/*!40000 ALTER TABLE `s_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_media_album`
--

DROP TABLE IF EXISTS `s_media_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_media_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parentID` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_media_album`
--

LOCK TABLES `s_media_album` WRITE;
/*!40000 ALTER TABLE `s_media_album` DISABLE KEYS */;
INSERT INTO `s_media_album` VALUES (-13,'Papierkorb',NULL,12),(-12,'Hersteller',NULL,12),(-11,'Blog',NULL,3),(-10,'Unsortiert',NULL,7),(-9,'Sonstiges',-6,3),(-8,'Musik',-6,2),(-7,'Video',-6,1),(-6,'Dateien',NULL,6),(-5,'Newsletter',NULL,4),(-4,'Aktionen',NULL,5),(-3,'Einkaufswelten',NULL,3),(-2,'Banner',NULL,1),(-1,'Artikel',NULL,2);
/*!40000 ALTER TABLE `s_media_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_media_album_settings`
--

DROP TABLE IF EXISTS `s_media_album_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_media_album_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `albumID` int(11) NOT NULL,
  `create_thumbnails` int(11) NOT NULL,
  `thumbnail_size` text COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `thumbnail_high_dpi` int(1) DEFAULT NULL,
  `thumbnail_quality` int(11) DEFAULT NULL,
  `thumbnail_high_dpi_quality` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `albumID` (`albumID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_media_album_settings`
--

LOCK TABLES `s_media_album_settings` WRITE;
/*!40000 ALTER TABLE `s_media_album_settings` DISABLE KEYS */;
INSERT INTO `s_media_album_settings` VALUES (1,-10,0,'','sprite-blue-folder',0,90,60),(2,-9,0,'','sprite-blue-folder',0,90,60),(3,-8,0,'','sprite-blue-folder',0,90,60),(4,-7,0,'','sprite-blue-folder',0,90,60),(5,-6,0,'','sprite-blue-folder',0,90,60),(6,-5,0,'','sprite-inbox-document-text',0,90,60),(7,-4,0,'','sprite-target',0,90,60),(8,-3,1,'800x800;1280x1280;1920x1920','sprite-target',1,90,60),(9,-2,1,'800x800;1280x1280;1920x1920','sprite-pictures',1,90,60),(10,-1,1,'200x200;600x600;1280x1280','sprite-inbox',1,90,60),(11,-11,1,'200x200;600x600;1280x1280','sprite-leaf',1,90,60),(12,-12,0,'','sprite-hard-hat',0,90,60),(13,-13,0,'','sprite-bin-metal-full',0,90,60);
/*!40000 ALTER TABLE `s_media_album_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_media_association`
--

DROP TABLE IF EXISTS `s_media_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_media_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mediaID` int(11) NOT NULL,
  `targetType` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `targetID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Media` (`mediaID`),
  KEY `Target` (`targetID`,`targetType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_media_association`
--

LOCK TABLES `s_media_association` WRITE;
/*!40000 ALTER TABLE `s_media_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_media_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_media_attributes`
--

DROP TABLE IF EXISTS `s_media_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_media_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mediaID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mediaID` (`mediaID`),
  CONSTRAINT `s_media_attributes_ibfk_1` FOREIGN KEY (`mediaID`) REFERENCES `s_media` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_media_attributes`
--

LOCK TABLES `s_media_attributes` WRITE;
/*!40000 ALTER TABLE `s_media_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_media_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_multi_edit_backup`
--

DROP TABLE IF EXISTS `s_multi_edit_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_multi_edit_backup` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `filter_string` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Filter string of the backed up change',
  `operation_string` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Operations applied after the backup',
  `items` int(255) unsigned NOT NULL COMMENT 'Number of items affected by the backup',
  `date` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'Creation date',
  `size` int(255) unsigned NOT NULL COMMENT 'Size of the backup file',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Path of the backup file',
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Hash of the backup file',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `size` (`size`),
  KEY `items` (`items`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Backups known to the system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_multi_edit_backup`
--

LOCK TABLES `s_multi_edit_backup` WRITE;
/*!40000 ALTER TABLE `s_multi_edit_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_multi_edit_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_multi_edit_filter`
--

DROP TABLE IF EXISTS `s_multi_edit_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_multi_edit_filter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name of the filter',
  `filter_string` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'The actual filter string',
  `description` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'User description of the filter',
  `created` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'Creation date',
  `is_favorite` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Did the user mark this filter as favorite?',
  `is_simple` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Can the filter be loaded and modified with the simple editor?',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Holds all multi edit filters';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_multi_edit_filter`
--

LOCK TABLES `s_multi_edit_filter` WRITE;
/*!40000 ALTER TABLE `s_multi_edit_filter` DISABLE KEYS */;
INSERT INTO `s_multi_edit_filter` VALUES (1,'<b>Abverkauf</b><br><small>nicht auf Lager</small>','   ARTICLE.LASTSTOCK  ISTRUE and DETAIL.INSTOCK <= 0','Abverkauf-Artikel ohne Lagerbestand',NULL,1,0),(2,'Hauptartikel','ismain','Alle Hauptartikel (einfache Artikel und Standardvarianten)',NULL,0,0),(3,'Mit Staffelpreisen','HASBLOCKPRICE','',NULL,0,0),(4,'Highlight','ARTICLE.HIGHLIGHT ISTRUE ','Zeit alle Highlight-Artikel',NULL,0,0),(5,'Konfigurator-Artikel','HASCONFIGURATOR  AND ISMAIN ','Artikel mit Konfiguratoren',NULL,0,0),(7,'Varianten','HASCONFIGURATOR ','Alle Varianten',NULL,0,0),(8,'Ohne Kategorie','CATEGORY.ID ISNULL  and ISMAIN ','Artikel ohne Kategoriezuordnung',NULL,1,0),(16,'Artikel ohne Bilder','HASNOIMAGE ','Artikel ohne Bilder',NULL,1,0),(17,'Komplexer Filter','ismain and CATEGORY.ACTIVE ISTRUE and SUPPLIER.NAME IN ( \"Teapavilion\" , \"Feinbrennerei Sasse\" ) ','',NULL,0,0),(18,'Artikel mit Händlerpreisen','PRICE.CUSTOMERGROUPKEY IN (\"B2B\" , \"H\")','Alle Artikel, für die Händlerpreise gepflegt werden.',NULL,0,0),(20,'Rote Artikel','CONFIGURATOROPTION.NAME = \"%Rot%\"  or PROPERTYOPTION.VALUE = \"rot\" ','Alle Artikel mit \"rot\" als Konfiguratoroption oder Eigenschaft',NULL,0,0),(21,'Regulärer Ausdruck','DETAIL.NUMBER !~ \"^sw[0-9]*\" ','Findet alle Artikel, die <b>nicht</b> eine Bestellnummer nach dem Schema swZAHL haben.',NULL,0,0),(22,'Artikel ohne Bewertung','  VOTE.ID ISNULL  and ismain','Zeigt alle Artikel ohne Bewertungen und Kommentar',NULL,0,0),(23,'Artikel mit nicht-freigeschalteten Bewertungen','VOTE.ACTIVE = \"0\"','Zeigt alle Artikel, die mindestens eine inaktive Bewertung haben',NULL,0,1);
/*!40000 ALTER TABLE `s_multi_edit_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_multi_edit_queue`
--

DROP TABLE IF EXISTS `s_multi_edit_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_multi_edit_queue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `resource` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Queued resource (e.g. product)',
  `filter_string` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'The actual filter string',
  `operations` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Operations to apply',
  `items` int(255) unsigned NOT NULL COMMENT 'Initial number of objects in the queue',
  `active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'When active, the queue is allowed to be progressed by cronjob',
  `created` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'Creation date',
  PRIMARY KEY (`id`),
  KEY `filter_string` (`filter_string`(255)),
  KEY `created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Holds the batch process queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_multi_edit_queue`
--

LOCK TABLES `s_multi_edit_queue` WRITE;
/*!40000 ALTER TABLE `s_multi_edit_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_multi_edit_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_multi_edit_queue_articles`
--

DROP TABLE IF EXISTS `s_multi_edit_queue_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_multi_edit_queue_articles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `queue_id` int(11) unsigned NOT NULL COMMENT 'Id of the queue this article belongs to',
  `detail_id` int(11) unsigned NOT NULL COMMENT 'Id of the article detail',
  PRIMARY KEY (`id`),
  UNIQUE KEY `queue_id_2` (`queue_id`,`detail_id`),
  KEY `detail_id` (`detail_id`),
  KEY `queue_id` (`queue_id`),
  CONSTRAINT `s_multi_edit_queue_articles_ibfk_1` FOREIGN KEY (`detail_id`) REFERENCES `s_articles_details` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `s_multi_edit_queue_articles_ibfk_2` FOREIGN KEY (`queue_id`) REFERENCES `s_multi_edit_queue` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Products belonging to a certain queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_multi_edit_queue_articles`
--

LOCK TABLES `s_multi_edit_queue_articles` WRITE;
/*!40000 ALTER TABLE `s_multi_edit_queue_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_multi_edit_queue_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_order`
--

DROP TABLE IF EXISTS `s_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordernumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `invoice_amount` double NOT NULL DEFAULT '0',
  `invoice_amount_net` double NOT NULL,
  `invoice_shipping` double NOT NULL DEFAULT '0',
  `invoice_shipping_net` double NOT NULL,
  `ordertime` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `cleared` int(11) NOT NULL DEFAULT '0',
  `paymentID` int(11) NOT NULL DEFAULT '0',
  `transactionID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `customercomment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `internalcomment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `net` int(1) NOT NULL,
  `taxfree` int(11) NOT NULL,
  `partnerID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `temporaryID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `referer` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `cleareddate` datetime DEFAULT NULL,
  `trackingcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `dispatchID` int(11) NOT NULL,
  `currency` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `currencyFactor` double NOT NULL,
  `subshopID` int(11) NOT NULL,
  `remote_addr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deviceType` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partnerID` (`partnerID`),
  KEY `userID` (`userID`),
  KEY `ordertime` (`ordertime`),
  KEY `cleared` (`cleared`),
  KEY `status` (`status`),
  KEY `paymentID` (`paymentID`),
  KEY `temporaryID` (`temporaryID`),
  KEY `ordernumber` (`ordernumber`),
  KEY `transactionID` (`transactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_order`
--

LOCK TABLES `s_order` WRITE;
/*!40000 ALTER TABLE `s_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_order_attributes`
--

DROP TABLE IF EXISTS `s_order_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11) DEFAULT NULL,
  `attribute1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderID` (`orderID`),
  CONSTRAINT `s_order_attributes_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `s_order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_order_attributes`
--

LOCK TABLES `s_order_attributes` WRITE;
/*!40000 ALTER TABLE `s_order_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_order_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_order_basket`
--

DROP TABLE IF EXISTS `s_order_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order_basket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userID` int(11) NOT NULL DEFAULT '0',
  `articlename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `articleID` int(11) NOT NULL DEFAULT '0',
  `ordernumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shippingfree` int(1) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `netprice` double NOT NULL DEFAULT '0',
  `tax_rate` double NOT NULL,
  `datum` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modus` int(11) NOT NULL DEFAULT '0',
  `esdarticle` int(1) NOT NULL,
  `partnerID` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `lastviewport` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `useragent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `config` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `currencyFactor` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessionID` (`sessionID`),
  KEY `articleID` (`articleID`),
  KEY `datum` (`datum`),
  KEY `get_basket` (`sessionID`,`id`,`datum`),
  KEY `ordernumber` (`ordernumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_order_basket`
--

LOCK TABLES `s_order_basket` WRITE;
/*!40000 ALTER TABLE `s_order_basket` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_order_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_order_basket_attributes`
--

DROP TABLE IF EXISTS `s_order_basket_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order_basket_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basketID` int(11) DEFAULT NULL,
  `attribute1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basketID` (`basketID`),
  CONSTRAINT `s_order_basket_attributes_ibfk_2` FOREIGN KEY (`basketID`) REFERENCES `s_order_basket` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_order_basket_attributes`
--

LOCK TABLES `s_order_basket_attributes` WRITE;
/*!40000 ALTER TABLE `s_order_basket_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_order_basket_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_order_billingaddress`
--

DROP TABLE IF EXISTS `s_order_billingaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order_billingaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `orderID` int(11) NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `department` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `salutation` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `customernumber` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `countryID` int(11) NOT NULL DEFAULT '0',
  `stateID` int(11) DEFAULT NULL,
  `ustid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional_address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional_address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderID` (`orderID`),
  KEY `userid` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_order_billingaddress`
--

LOCK TABLES `s_order_billingaddress` WRITE;
/*!40000 ALTER TABLE `s_order_billingaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_order_billingaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_order_billingaddress_attributes`
--

DROP TABLE IF EXISTS `s_order_billingaddress_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order_billingaddress_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `billingID` int(11) DEFAULT NULL,
  `text1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `billingID` (`billingID`),
  CONSTRAINT `s_order_billingaddress_attributes_ibfk_2` FOREIGN KEY (`billingID`) REFERENCES `s_order_billingaddress` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_order_billingaddress_attributes`
--

LOCK TABLES `s_order_billingaddress_attributes` WRITE;
/*!40000 ALTER TABLE `s_order_billingaddress_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_order_billingaddress_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_order_comparisons`
--

DROP TABLE IF EXISTS `s_order_comparisons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order_comparisons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userID` int(11) NOT NULL DEFAULT '0',
  `articlename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `articleID` int(11) NOT NULL DEFAULT '0',
  `datum` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `articleID` (`articleID`),
  KEY `sessionID` (`sessionID`),
  KEY `datum` (`datum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_order_comparisons`
--

LOCK TABLES `s_order_comparisons` WRITE;
/*!40000 ALTER TABLE `s_order_comparisons` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_order_comparisons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_order_details`
--

DROP TABLE IF EXISTS `s_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11) NOT NULL DEFAULT '0',
  `ordernumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `articleID` int(11) NOT NULL DEFAULT '0',
  `articleordernumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `shipped` int(11) NOT NULL DEFAULT '0',
  `shippedgroup` int(11) NOT NULL DEFAULT '0',
  `releasedate` date DEFAULT NULL,
  `modus` int(11) NOT NULL,
  `esdarticle` int(1) NOT NULL,
  `taxID` int(11) DEFAULT NULL,
  `tax_rate` double NOT NULL,
  `config` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `ean` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pack_unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderID` (`orderID`),
  KEY `articleID` (`articleID`),
  KEY `ordernumber` (`ordernumber`),
  KEY `articleordernumber` (`articleordernumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_order_details`
--

LOCK TABLES `s_order_details` WRITE;
/*!40000 ALTER TABLE `s_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_order_details_attributes`
--

DROP TABLE IF EXISTS `s_order_details_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order_details_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detailID` int(11) DEFAULT NULL,
  `attribute1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `detailID` (`detailID`),
  CONSTRAINT `s_order_details_attributes_ibfk_1` FOREIGN KEY (`detailID`) REFERENCES `s_order_details` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_order_details_attributes`
--

LOCK TABLES `s_order_details_attributes` WRITE;
/*!40000 ALTER TABLE `s_order_details_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_order_details_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_order_documents`
--

DROP TABLE IF EXISTS `s_order_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order_documents` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `type` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `orderID` int(11) unsigned NOT NULL,
  `amount` double NOT NULL,
  `docID` int(11) NOT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `orderID` (`orderID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_order_documents`
--

LOCK TABLES `s_order_documents` WRITE;
/*!40000 ALTER TABLE `s_order_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_order_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_order_documents_attributes`
--

DROP TABLE IF EXISTS `s_order_documents_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order_documents_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documentID` (`documentID`),
  CONSTRAINT `s_order_documents_attributes_ibfk_1` FOREIGN KEY (`documentID`) REFERENCES `s_order_documents` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_order_documents_attributes`
--

LOCK TABLES `s_order_documents_attributes` WRITE;
/*!40000 ALTER TABLE `s_order_documents_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_order_documents_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_order_esd`
--

DROP TABLE IF EXISTS `s_order_esd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order_esd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialID` int(255) NOT NULL DEFAULT '0',
  `esdID` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0',
  `orderID` int(11) NOT NULL DEFAULT '0',
  `orderdetailsID` int(11) NOT NULL DEFAULT '0',
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_order_esd`
--

LOCK TABLES `s_order_esd` WRITE;
/*!40000 ALTER TABLE `s_order_esd` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_order_esd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_order_history`
--

DROP TABLE IF EXISTS `s_order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `previous_order_status_id` int(11) DEFAULT NULL,
  `order_status_id` int(11) DEFAULT NULL,
  `previous_payment_status_id` int(11) DEFAULT NULL,
  `payment_status_id` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `change_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`userID`),
  KEY `order` (`orderID`),
  KEY `current_payment_status` (`payment_status_id`),
  KEY `current_order_status` (`order_status_id`),
  KEY `previous_payment_status` (`previous_payment_status_id`),
  KEY `previous_order_status` (`previous_order_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_order_history`
--

LOCK TABLES `s_order_history` WRITE;
/*!40000 ALTER TABLE `s_order_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_order_notes`
--

DROP TABLE IF EXISTS `s_order_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sUniqueID` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `userID` int(11) NOT NULL DEFAULT '0',
  `articlename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `articleID` int(11) NOT NULL DEFAULT '0',
  `ordernumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `datum` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `basket_count_notes` (`sUniqueID`,`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_order_notes`
--

LOCK TABLES `s_order_notes` WRITE;
/*!40000 ALTER TABLE `s_order_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_order_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_order_number`
--

DROP TABLE IF EXISTS `s_order_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=929 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_order_number`
--

LOCK TABLES `s_order_number` WRITE;
/*!40000 ALTER TABLE `s_order_number` DISABLE KEYS */;
INSERT INTO `s_order_number` VALUES (1,20002,'user','Kunden'),(920,20000,'invoice','Bestellungen'),(921,20000,'doc_1','Lieferscheine'),(922,20000,'doc_2','Gutschriften'),(924,20000,'doc_0','Rechnungen'),(925,10000,'articleordernumber','Artikelbestellnummer  '),(926,10000,'sSERVICE1','Service - 1'),(927,10000,'sSERVICE2','Service - 2'),(928,110,'blogordernumber','Blog - ID');
/*!40000 ALTER TABLE `s_order_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_order_shippingaddress`
--

DROP TABLE IF EXISTS `s_order_shippingaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order_shippingaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `orderID` int(11) NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `department` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `salutation` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `countryID` int(11) NOT NULL,
  `stateID` int(11) DEFAULT NULL,
  `additional_address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional_address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderID` (`orderID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_order_shippingaddress`
--

LOCK TABLES `s_order_shippingaddress` WRITE;
/*!40000 ALTER TABLE `s_order_shippingaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_order_shippingaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_order_shippingaddress_attributes`
--

DROP TABLE IF EXISTS `s_order_shippingaddress_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order_shippingaddress_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shippingID` int(11) DEFAULT NULL,
  `text1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shippingID` (`shippingID`),
  CONSTRAINT `s_order_shippingaddress_attributes_ibfk_1` FOREIGN KEY (`shippingID`) REFERENCES `s_order_shippingaddress` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_order_shippingaddress_attributes`
--

LOCK TABLES `s_order_shippingaddress_attributes` WRITE;
/*!40000 ALTER TABLE `s_order_shippingaddress_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_order_shippingaddress_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_plugin_recommendations`
--

DROP TABLE IF EXISTS `s_plugin_recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_plugin_recommendations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryID` int(11) NOT NULL,
  `banner_active` int(1) NOT NULL,
  `new_active` int(1) NOT NULL,
  `bought_active` int(1) NOT NULL,
  `supplier_active` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categoryID_2` (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_plugin_recommendations`
--

LOCK TABLES `s_plugin_recommendations` WRITE;
/*!40000 ALTER TABLE `s_plugin_recommendations` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_plugin_recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_plugin_widgets_notes`
--

DROP TABLE IF EXISTS `s_plugin_widgets_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_plugin_widgets_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_plugin_widgets_notes`
--

LOCK TABLES `s_plugin_widgets_notes` WRITE;
/*!40000 ALTER TABLE `s_plugin_widgets_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_plugin_widgets_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_premium_dispatch`
--

DROP TABLE IF EXISTS `s_premium_dispatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_premium_dispatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(1) unsigned NOT NULL,
  `position` int(11) NOT NULL,
  `calculation` int(1) unsigned NOT NULL,
  `surcharge_calculation` int(1) unsigned NOT NULL,
  `tax_calculation` int(11) unsigned NOT NULL,
  `shippingfree` decimal(10,2) unsigned DEFAULT NULL,
  `multishopID` int(11) unsigned DEFAULT NULL,
  `customergroupID` int(11) unsigned DEFAULT NULL,
  `bind_shippingfree` int(1) unsigned NOT NULL,
  `bind_time_from` int(11) unsigned DEFAULT NULL,
  `bind_time_to` int(11) unsigned DEFAULT NULL,
  `bind_instock` int(1) unsigned DEFAULT NULL,
  `bind_laststock` int(1) unsigned NOT NULL,
  `bind_weekday_from` int(1) unsigned DEFAULT NULL,
  `bind_weekday_to` int(1) unsigned DEFAULT NULL,
  `bind_weight_from` decimal(10,3) DEFAULT NULL,
  `bind_weight_to` decimal(10,3) DEFAULT NULL,
  `bind_price_from` decimal(10,2) DEFAULT NULL,
  `bind_price_to` decimal(10,2) DEFAULT NULL,
  `bind_sql` mediumtext COLLATE utf8_unicode_ci,
  `status_link` mediumtext COLLATE utf8_unicode_ci,
  `calculation_sql` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_premium_dispatch`
--

LOCK TABLES `s_premium_dispatch` WRITE;
/*!40000 ALTER TABLE `s_premium_dispatch` DISABLE KEYS */;
INSERT INTO `s_premium_dispatch` VALUES (9,'Standard Versand',0,'','',1,0,0,3,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `s_premium_dispatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_premium_dispatch_attributes`
--

DROP TABLE IF EXISTS `s_premium_dispatch_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_premium_dispatch_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dispatchID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dispatchID` (`dispatchID`),
  CONSTRAINT `s_premium_dispatch_attributes_ibfk_1` FOREIGN KEY (`dispatchID`) REFERENCES `s_premium_dispatch` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_premium_dispatch_attributes`
--

LOCK TABLES `s_premium_dispatch_attributes` WRITE;
/*!40000 ALTER TABLE `s_premium_dispatch_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_premium_dispatch_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_premium_dispatch_categories`
--

DROP TABLE IF EXISTS `s_premium_dispatch_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_premium_dispatch_categories` (
  `dispatchID` int(11) unsigned NOT NULL,
  `categoryID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`dispatchID`,`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_premium_dispatch_categories`
--

LOCK TABLES `s_premium_dispatch_categories` WRITE;
/*!40000 ALTER TABLE `s_premium_dispatch_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_premium_dispatch_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_premium_dispatch_countries`
--

DROP TABLE IF EXISTS `s_premium_dispatch_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_premium_dispatch_countries` (
  `dispatchID` int(11) NOT NULL,
  `countryID` int(11) NOT NULL,
  PRIMARY KEY (`dispatchID`,`countryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_premium_dispatch_countries`
--

LOCK TABLES `s_premium_dispatch_countries` WRITE;
/*!40000 ALTER TABLE `s_premium_dispatch_countries` DISABLE KEYS */;
INSERT INTO `s_premium_dispatch_countries` VALUES (9,2),(9,3),(9,4),(9,5),(9,7),(9,8),(9,9),(9,10),(9,11),(9,12),(9,13),(9,14),(9,15),(9,16),(9,18),(9,20),(9,21),(9,22),(9,23),(9,24),(9,25),(9,26),(9,27),(9,28),(9,29),(9,30),(9,31),(9,32),(9,33),(9,34),(9,35),(9,36),(9,37);
/*!40000 ALTER TABLE `s_premium_dispatch_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_premium_dispatch_holidays`
--

DROP TABLE IF EXISTS `s_premium_dispatch_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_premium_dispatch_holidays` (
  `dispatchID` int(11) unsigned NOT NULL,
  `holidayID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`dispatchID`,`holidayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_premium_dispatch_holidays`
--

LOCK TABLES `s_premium_dispatch_holidays` WRITE;
/*!40000 ALTER TABLE `s_premium_dispatch_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_premium_dispatch_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_premium_dispatch_paymentmeans`
--

DROP TABLE IF EXISTS `s_premium_dispatch_paymentmeans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_premium_dispatch_paymentmeans` (
  `dispatchID` int(11) NOT NULL,
  `paymentID` int(11) NOT NULL,
  PRIMARY KEY (`dispatchID`,`paymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_premium_dispatch_paymentmeans`
--

LOCK TABLES `s_premium_dispatch_paymentmeans` WRITE;
/*!40000 ALTER TABLE `s_premium_dispatch_paymentmeans` DISABLE KEYS */;
INSERT INTO `s_premium_dispatch_paymentmeans` VALUES (9,2),(9,3),(9,4),(9,5);
/*!40000 ALTER TABLE `s_premium_dispatch_paymentmeans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_premium_holidays`
--

DROP TABLE IF EXISTS `s_premium_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_premium_holidays` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `calculation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_premium_holidays`
--

LOCK TABLES `s_premium_holidays` WRITE;
/*!40000 ALTER TABLE `s_premium_holidays` DISABLE KEYS */;
INSERT INTO `s_premium_holidays` VALUES (1,'Neujahr','DATE(\'01-01\')','2011-01-01'),(2,'Berchtoldstag','DATE(\'01/02\')','2011-01-02'),(3,'Heilige drei Könige','DATE(\'01-06\')','2011-01-06'),(4,'Rosenmontag','DATE_SUB(EASTERDATE(), INTERVAL 48 DAY)','2011-03-07'),(5,'Josefstag','DATE(\'03/19\')','2011-03-19'),(6,'Karfreitag','DATE_SUB(EASTERDATE(), INTERVAL 2 DAY)','2011-04-22'),(7,'Ostermontag','DATE_ADD(EASTERDATE(), INTERVAL 1 DAY)','2011-04-25'),(8,'Tag der Arbeit','DATE(\'05/01\')','2011-05-01'),(9,'Christi Himmelfahrt','DATE_ADD(EASTERDATE(), INTERVAL 39 DAY)','2011-06-02'),(10,'Pfingstmontag','DATE_ADD(EASTERDATE(), INTERVAL 50 DAY)','2011-06-13'),(11,'Fronleichnam','DATE_ADD(EASTERDATE(), INTERVAL 60 DAY)','2011-06-23'),(12,'Bundesfeier (Schweiz)','DATE(\'08-01\')','2011-08-01'),(13,'Mariä Himmelfahrt','DATE(\'08/15\')','2011-08-15'),(14,'Tag der Deutschen Einheit','DATE(\'10/03\')','2011-10-03'),(15,'Nationalfeiertag (Österreich)','DATE(\'10/26\')','2010-10-26'),(16,'Reformationstag','DATE(\'10/31\')','2010-10-31'),(17,'Allerheiligen','DATE(\'11/01\')','2010-11-01'),(18,'Buß- und Bettag','SUBDATE(DATE(\'11-23\'), DAYOFWEEK(DATE(\'11-23\'))+IF(DAYOFWEEK(DATE(\'11-23\'))>4,-4,3))','2010-11-17'),(19,'Mariä Empfängnis','DATE(\'12/8\')','2010-12-08'),(20,'Heiligabend','DATE(\'12/24\')','2010-12-24'),(21,'1. Weihnachtstag','DATE(\'12/25\')','2010-12-25'),(22,'2. Weihnachtstag (Stephanstag)','DATE(\'12/26\')','2010-12-26'),(23,'Sylvester','DATE(\'12/31\')','2010-12-31');
/*!40000 ALTER TABLE `s_premium_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_premium_shippingcosts`
--

DROP TABLE IF EXISTS `s_premium_shippingcosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_premium_shippingcosts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from` decimal(10,3) unsigned NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `factor` decimal(10,2) NOT NULL,
  `dispatchID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `from` (`from`,`dispatchID`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_premium_shippingcosts`
--

LOCK TABLES `s_premium_shippingcosts` WRITE;
/*!40000 ALTER TABLE `s_premium_shippingcosts` DISABLE KEYS */;
INSERT INTO `s_premium_shippingcosts` VALUES (235,0.000,3.90,0.00,9);
/*!40000 ALTER TABLE `s_premium_shippingcosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_product_streams`
--

DROP TABLE IF EXISTS `s_product_streams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_product_streams` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `conditions` text COLLATE utf8_unicode_ci,
  `type` int(11) DEFAULT NULL,
  `sorting` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_product_streams`
--

LOCK TABLES `s_product_streams` WRITE;
/*!40000 ALTER TABLE `s_product_streams` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_product_streams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_product_streams_articles`
--

DROP TABLE IF EXISTS `s_product_streams_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_product_streams_articles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `stream_id` int(11) unsigned NOT NULL,
  `article_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stream_id` (`stream_id`,`article_id`),
  KEY `s_product_streams_articles_fk_article_id` (`article_id`),
  CONSTRAINT `s_product_streams_articles_fk_article_id` FOREIGN KEY (`article_id`) REFERENCES `s_articles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `s_product_streams_articles_fk_stream_id` FOREIGN KEY (`stream_id`) REFERENCES `s_product_streams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_product_streams_articles`
--

LOCK TABLES `s_product_streams_articles` WRITE;
/*!40000 ALTER TABLE `s_product_streams_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_product_streams_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_product_streams_attributes`
--

DROP TABLE IF EXISTS `s_product_streams_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_product_streams_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `streamID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `streamID` (`streamID`),
  CONSTRAINT `s_product_streams_attributes_ibfk_1` FOREIGN KEY (`streamID`) REFERENCES `s_product_streams` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_product_streams_attributes`
--

LOCK TABLES `s_product_streams_attributes` WRITE;
/*!40000 ALTER TABLE `s_product_streams_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_product_streams_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_product_streams_selection`
--

DROP TABLE IF EXISTS `s_product_streams_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_product_streams_selection` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `stream_id` int(11) unsigned NOT NULL,
  `article_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stream_id` (`stream_id`,`article_id`),
  KEY `s_product_streams_selection_fk_article_id` (`article_id`),
  CONSTRAINT `s_product_streams_selection_fk_article_id` FOREIGN KEY (`article_id`) REFERENCES `s_articles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `s_product_streams_selection_fk_stream_id` FOREIGN KEY (`stream_id`) REFERENCES `s_product_streams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_product_streams_selection`
--

LOCK TABLES `s_product_streams_selection` WRITE;
/*!40000 ALTER TABLE `s_product_streams_selection` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_product_streams_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_schema_version`
--

DROP TABLE IF EXISTS `s_schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_schema_version` (
  `version` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `complete_date` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `error_msg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_schema_version`
--

LOCK TABLES `s_schema_version` WRITE;
/*!40000 ALTER TABLE `s_schema_version` DISABLE KEYS */;
INSERT INTO `s_schema_version` VALUES (101,'2017-02-27 15:41:04','2017-02-27 15:41:04','add-extended-editor-field',NULL),(102,'2017-02-27 15:41:04','2017-02-27 15:41:04','add-new-emotions',NULL),(103,'2017-02-27 15:41:04','2017-02-27 15:41:04','add-field-blog-teaser',NULL),(104,'2017-02-27 15:41:04','2017-02-27 15:41:04','add-field-blog-thumbnail-size',NULL),(105,'2017-02-27 15:41:04','2017-02-27 15:41:04','s_core_sessions_backend',NULL),(106,'2017-02-27 15:41:04','2017-02-27 15:41:04','add-path-to-categories',NULL),(107,'2017-02-27 15:41:04','2017-02-27 15:41:04','remove-legacy-cache-config',NULL),(108,'2017-02-27 15:41:04','2017-02-27 15:41:05','add-category-listing-indexes',NULL),(109,'2017-02-27 15:41:05','2017-02-27 15:41:05','add-translations',NULL),(110,'2017-02-27 15:41:05','2017-02-27 15:41:05','add-disabled-cache-field',NULL),(111,'2017-02-27 15:41:05','2017-02-27 15:41:05','add-password-encoder',NULL),(112,'2017-02-27 15:41:05','2017-02-27 15:41:05','link-cache-menu-to-the-new-performance-module',NULL),(113,'2017-02-27 15:41:05','2017-02-27 15:41:06','adds-performance-sql',NULL),(114,'2017-02-27 15:41:06','2017-02-27 15:41:06','add-new-top-seller',NULL),(115,'2017-02-27 15:41:06','2017-02-27 15:41:06','add-denormalized-category-table',NULL),(116,'2017-02-27 15:41:06','2017-02-27 15:41:06','optimize-emotion-queries',NULL),(117,'2017-02-27 15:41:06','2017-02-27 15:41:06','add-article-detail-page-indexes',NULL),(118,'2017-02-27 15:41:06','2017-02-27 15:41:06','optimize-property-backend-queries',NULL),(119,'2017-02-27 15:41:06','2017-02-27 15:41:06','add-batchmode-option',NULL),(120,'2017-02-27 15:41:06','2017-02-27 15:41:06','add-cache-log',NULL),(121,'2017-02-27 15:41:06','2017-02-27 15:41:06','fix-cache-label',NULL),(122,'2017-02-27 15:41:06','2017-02-27 15:41:06','optimize-search-index-queries',NULL),(123,'2017-02-27 15:41:06','2017-02-27 15:41:06','add-dummy-plugins',NULL),(124,'2017-02-27 15:41:06','2017-02-27 15:41:06','remove-router-url-cache',NULL),(125,'2017-02-27 15:41:06','2017-02-27 15:41:06','adds-filter-performance-sql',NULL),(126,'2017-02-27 15:41:06','2017-02-27 15:41:06','update-cache-menu-items',NULL),(127,'2017-02-27 15:41:06','2017-02-27 15:41:06','install-http-plugin',NULL),(128,'2017-02-27 15:41:06','2017-02-27 15:41:06','adds-community-store-resource',NULL),(129,'2017-02-27 15:41:06','2017-02-27 15:41:06','fix-mailer-config-help-text-typo',NULL),(130,'2017-02-27 15:41:06','2017-02-27 15:41:06','fix-typo-in-no-script-notices-snippet',NULL),(131,'2017-02-27 15:41:06','2017-02-27 15:41:06','add-top-seller-index',NULL),(132,'2017-02-27 15:41:06','2017-02-27 15:41:06','remove-similar-shown-listener',NULL),(133,'2017-02-27 15:41:06','2017-02-27 15:41:06','add-esd-payment-status-config',NULL),(134,'2017-02-27 15:41:06','2017-02-27 15:41:06','add-http-cache-cleanup-cronjob',NULL),(135,'2017-02-27 15:41:06','2017-02-27 15:41:06','add-main-image-listing-config',NULL),(136,'2017-02-27 15:41:06','2017-02-27 15:41:06','add-send-order-mail-config',NULL),(137,'2017-02-27 15:41:06','2017-02-27 15:41:06','remove-lastarticles-save-time',NULL),(138,'2017-02-27 15:41:06','2017-02-27 15:41:06','fix-typo-last-articles-headline',NULL),(139,'2017-02-27 15:41:07','2017-02-27 15:41:07','remove-plugin-form-from-config',NULL),(140,'2017-02-27 15:41:07','2017-02-27 15:41:07','fix-emotion-grid-id',NULL),(141,'2017-02-27 15:41:07','2017-02-27 15:41:07','add-force-canonical-http-config',NULL),(142,'2017-02-27 15:41:07','2017-02-27 15:41:07','add-listing-description-config',NULL),(143,'2017-02-27 15:41:07','2017-02-27 15:41:07','deactivate-router-to-lower-scope',NULL),(144,'2017-02-27 15:41:07','2017-02-27 15:41:07','add-require-phone-field-config',NULL),(145,'2017-02-27 15:41:07','2017-02-27 15:41:07','fix-default-incorrect-translation',NULL),(146,'2017-02-27 15:41:07','2017-02-27 15:41:07','http-cache-events',NULL),(147,'2017-02-27 15:41:07','2017-02-27 15:41:07','translations',NULL),(148,'2017-02-27 15:41:07','2017-02-27 15:41:07','payment-method-refactor',NULL),(149,'2017-02-27 15:41:07','2017-02-27 15:41:07','add-sepa-database-items',NULL),(150,'2017-02-27 15:41:07','2017-02-27 15:41:07','add-checkout-payment-info-change-config',NULL),(151,'2017-02-27 15:41:07','2017-02-27 15:41:07','add-missing-emotion-field-types',NULL),(200,'2017-02-27 15:41:07','2017-02-27 15:41:07','drop-unused-factory-table',NULL),(201,'2017-02-27 15:41:07','2017-02-27 15:41:07','add-supplier-seo',NULL),(202,'2017-02-27 15:41:07','2017-02-27 15:41:07','unregister-routerold-dead-event',NULL),(203,'2017-02-27 15:41:07','2017-02-27 15:41:07','add-http-cache-clear-event',NULL),(204,'2017-02-27 15:41:07','2017-02-27 15:41:07','add-supplier-seo-template',NULL),(205,'2017-02-27 15:41:07','2017-02-27 15:41:07','date-time-picker-label-update',NULL),(206,'2017-02-27 15:41:07','2017-02-27 15:41:07','change-image-attributes',NULL),(207,'2017-02-27 15:41:07','2017-02-27 15:41:07','product-feed-export',NULL),(208,'2017-02-27 15:41:07','2017-02-27 15:41:07','snippet-handling-refactoring',NULL),(209,'2017-02-27 15:41:07','2017-02-27 15:41:08','add-meta-title',NULL),(210,'2017-02-27 15:41:08','2017-02-27 15:41:08','add-meta-title-to-blog',NULL),(211,'2017-02-27 15:41:08','2017-02-27 15:41:08','add-always-secure',NULL),(212,'2017-02-27 15:41:08','2017-02-27 15:41:08','product-feed-export',NULL),(213,'2017-02-27 15:41:08','2017-02-27 15:41:08','update-payment-methods-plugin',NULL),(214,'2017-02-27 15:41:08','2017-02-27 15:41:08','add-debit-fields-to-payment-data',NULL),(215,'2017-02-27 15:41:08','2017-02-27 15:41:08','enlarge-zipcode-and-streetnumber-user',NULL),(216,'2017-02-27 15:41:08','2017-02-27 15:41:08','enlarge-zipcode-and-streetnumber-billing',NULL),(217,'2017-02-27 15:41:08','2017-02-27 15:41:08','enlarge-zipcode-and-streetnumber-billing_shipping',NULL),(218,'2017-02-27 15:41:08','2017-02-27 15:41:08','remove-old-debug-plugins',NULL),(219,'2017-02-27 15:41:08','2017-02-27 15:41:08','customer-payment-data-editing-in-be',NULL),(220,'2017-02-27 15:41:08','2017-02-27 15:41:08','add-payment-data-restriction',NULL),(221,'2017-02-27 15:41:08','2017-02-27 15:41:08','remove-log-plugin',NULL),(222,'2017-02-27 15:41:08','2017-02-27 15:41:08','add-logmail-config',NULL),(223,'2017-02-27 15:41:08','2017-02-27 15:41:08','add-statistic-config',NULL),(224,'2017-02-27 15:41:08','2017-02-27 15:41:08','add-statistic-impression-table',NULL),(225,'2017-02-27 15:41:08','2017-02-27 15:41:08','fix-emotion-required-fields',NULL),(226,'2017-02-27 15:41:08','2017-02-27 15:41:08','add-tellafriend-remove-option',NULL),(227,'2017-02-27 15:41:08','2017-02-27 15:41:08','fix-canonical-force-http-translation',NULL),(228,'2017-02-27 15:41:08','2017-02-27 15:41:08','add-canonical-force-http-description',NULL),(229,'2017-02-27 15:41:08','2017-02-27 15:41:08','fix-last-articles-plugin-config-form',NULL),(230,'2017-02-27 15:41:08','2017-02-27 15:41:08','fix-emotion-mandatory-fields',NULL),(231,'2017-02-27 15:41:08','2017-02-27 15:41:08','update-redirectDownload-config-var',NULL),(301,'2017-02-27 15:41:08','2017-02-27 15:41:08','drop-unused-cms-content-table',NULL),(302,'2017-02-27 15:41:08','2017-02-27 15:41:08','add-secure-cron',NULL),(303,'2017-02-27 15:41:08','2017-02-27 15:41:08','add-seo-categories',NULL),(304,'2017-02-27 15:41:08','2017-02-27 15:41:09','widget-system-refactoring',NULL),(305,'2017-02-27 15:41:09','2017-02-27 15:41:09','add-product-feed-caching',NULL),(306,'2017-02-27 15:41:09','2017-02-27 15:41:09','update-secure-cron-description',NULL),(307,'2017-02-27 15:41:09','2017-02-27 15:41:09','install-swag-update',NULL),(308,'2017-02-27 15:41:09','2017-02-27 15:41:09','increase-session-id-fields',NULL),(309,'2017-02-27 15:41:09','2017-02-27 15:41:09','merchant-email-translation',NULL),(310,'2017-02-27 15:41:09','2017-02-27 15:41:09','swagupdate-translations',NULL),(311,'2017-02-27 15:41:09','2017-02-27 15:41:09','subshop-maintenance-support',NULL),(312,'2017-02-27 15:41:09','2017-02-27 15:41:09','update-search-form-translation',NULL),(313,'2017-02-27 15:41:09','2017-02-27 15:41:09','add-order-detail-fields',NULL),(314,'2017-02-27 15:41:09','2017-02-27 15:41:09','add-order-detail-pack-unit',NULL),(315,'2017-02-27 15:41:09','2017-02-27 15:41:09','update-shipping-address-country-field-labels',NULL),(316,'2017-02-27 15:41:09','2017-02-27 15:41:09','update-seo-nofollow-labels',NULL),(317,'2017-02-27 15:41:09','2017-02-27 15:41:09','update-store-api-url',NULL),(318,'2017-02-27 15:41:09','2017-02-27 15:41:09','update-payment-methods-version',NULL),(319,'2017-02-27 15:41:09','2017-02-27 15:41:09','update-google-plugin',NULL),(330,'2017-02-27 15:41:09','2017-02-27 15:41:09','add-secure-uninstall-capability',NULL),(350,'2017-02-27 15:41:09','2017-02-27 15:41:10','add-template-parent',NULL),(351,'2017-02-27 15:41:10','2017-02-27 15:41:10','add-template-menu',NULL),(352,'2017-02-27 15:41:10','2017-02-27 15:41:10','add-theme-config',NULL),(353,'2017-02-27 15:41:10','2017-02-27 15:41:10','add-horizontal-scrolling-emotion',NULL),(354,'2017-02-27 15:41:10','2017-02-27 15:41:10','add-video-element',NULL),(355,'2017-02-27 15:41:10','2017-02-27 15:41:10','remove-config-module-template-manager',NULL),(356,'2017-02-27 15:41:10','2017-02-27 15:41:10','email-datetime-format',NULL),(357,'2017-02-27 15:41:10','2017-02-27 15:41:10','add-changed-and-mobileactive-columns',NULL),(358,'2017-02-27 15:41:10','2017-02-27 15:41:10','add-registration-field-options',NULL),(359,'2017-02-27 15:41:10','2017-02-27 15:41:10','add_additional_address_data_order_billing',NULL),(360,'2017-02-27 15:41:10','2017-02-27 15:41:10','add_additional_address_data_order_shipping',NULL),(361,'2017-02-27 15:41:10','2017-02-27 15:41:10','additional_address-config',NULL),(362,'2017-02-27 15:41:10','2017-02-27 15:41:10','add_additional_address_data_user_billing',NULL),(363,'2017-02-27 15:41:10','2017-02-27 15:41:10','add_additional_address_data_user_shipping',NULL),(364,'2017-02-27 15:41:10','2017-02-27 15:41:10','remove-article-impression',NULL),(365,'2017-02-27 15:41:10','2017-02-27 15:41:10','google-analytics-plugin-upgrade',NULL),(366,'2017-02-27 15:41:10','2017-02-27 15:41:11','translations',NULL),(367,'2017-02-27 15:41:11','2017-02-27 15:41:11','mobile-statistics',NULL),(368,'2017-02-27 15:41:11','2017-02-27 15:41:11','form-elem-text2-labels',NULL),(369,'2017-02-27 15:41:11','2017-02-27 15:41:11','change-min-purchase',NULL),(370,'2017-02-27 15:41:11','2017-02-27 15:41:11','optimize-performance',NULL),(371,'2017-02-27 15:41:11','2017-02-27 15:41:11','add-multi-edit-config-options',NULL),(372,'2017-02-27 15:41:11','2017-02-27 15:41:11','setup-multi-edit',NULL),(373,'2017-02-27 15:41:11','2017-02-27 15:41:11','address-streetnumber-merge',NULL),(374,'2017-02-27 15:41:11','2017-02-27 15:41:12','s-order-billing-enlarge-street-field',NULL),(375,'2017-02-27 15:41:12','2017-02-27 15:41:12','s-order-billing-merge-street-number',NULL),(376,'2017-02-27 15:41:12','2017-02-27 15:41:12','s-order-billing-drop-street-number',NULL),(377,'2017-02-27 15:41:12','2017-02-27 15:41:12','s-order-shipping-enlarge-street-field',NULL),(378,'2017-02-27 15:41:12','2017-02-27 15:41:12','s-order-shipping-merge-street-number',NULL),(379,'2017-02-27 15:41:12','2017-02-27 15:41:12','s-order-shipping-drop-street-number',NULL),(380,'2017-02-27 15:41:12','2017-02-27 15:41:12','s-user-billing-enlarge-street-field',NULL),(381,'2017-02-27 15:41:12','2017-02-27 15:41:12','s-user-billing-merge-street-number',NULL),(382,'2017-02-27 15:41:12','2017-02-27 15:41:12','s-user-billing-drop-street-number',NULL),(383,'2017-02-27 15:41:12','2017-02-27 15:41:12','s-user-shipping-enlarge-street-field',NULL),(384,'2017-02-27 15:41:12','2017-02-27 15:41:12','s-user-shipping-merge-street-number',NULL),(385,'2017-02-27 15:41:12','2017-02-27 15:41:12','s-user-shipping-drop-street-number',NULL),(386,'2017-02-27 15:41:12','2017-02-27 15:41:12','import-multiedit-plugin-tables',NULL),(387,'2017-02-27 15:41:12','2017-02-27 15:41:12','display-shipping-calculations-in-basket',NULL),(388,'2017-02-27 15:41:12','2017-02-27 15:41:12','add-emotion-fields-position',NULL),(389,'2017-02-27 15:41:12','2017-02-27 15:41:12','fix-custom-form-field-sorting',NULL),(390,'2017-02-27 15:41:12','2017-02-27 15:41:12','add-device-column',NULL),(391,'2017-02-27 15:41:12','2017-02-27 15:41:12','fix-attr17',NULL),(392,'2017-02-27 15:41:12','2017-02-27 15:41:12','remove-unused-listerner',NULL),(393,'2017-02-27 15:41:12','2017-02-27 15:41:12','add-404-page-config-options',NULL),(394,'2017-02-27 15:41:12','2017-02-27 15:41:12','add-company-register-config',NULL),(395,'2017-02-27 15:41:12','2017-02-27 15:41:12','remove-obsolete-trusted-shops-code',NULL),(396,'2017-02-27 15:41:12','2017-02-27 15:41:12','add-family-friendly-meta',NULL),(397,'2017-02-27 15:41:12','2017-02-27 15:41:12','form-meta-data',NULL),(398,'2017-02-27 15:41:12','2017-02-27 15:41:12','add-custom-and-form-seo-template',NULL),(399,'2017-02-27 15:41:12','2017-02-27 15:41:12','remove-unused-rewrite-table',NULL),(400,'2017-02-27 15:41:12','2017-02-27 15:41:12','article-list-config-translations',NULL),(401,'2017-02-27 15:41:12','2017-02-27 15:41:12','remove-unused-table',NULL),(402,'2017-02-27 15:41:12','2017-02-27 15:41:12','remove-dead-event',NULL),(403,'2017-02-27 15:41:12','2017-02-27 15:41:12','add-emotion-hint-to-basket-colors',NULL),(404,'2017-02-27 15:41:12','2017-02-27 15:41:12','remove-sLanguage-from-item-export',NULL),(405,'2017-02-27 15:41:12','2017-02-27 15:41:12','import-compare-settings',NULL),(406,'2017-02-27 15:41:12','2017-02-27 15:41:12','add-advanced-menu-listeners',NULL),(407,'2017-02-27 15:41:12','2017-02-27 15:41:12','empty-migration-placeholder',NULL),(408,'2017-02-27 15:41:12','2017-02-27 15:41:12','variant-price-surcharge-refactor',NULL),(409,'2017-02-27 15:41:12','2017-02-27 15:41:12','add-property-media',NULL),(410,'2017-02-27 15:41:12','2017-02-27 15:41:12','add-emotion-fields',NULL),(411,'2017-02-27 15:41:12','2017-02-27 15:41:13','remove-unused-columns',NULL),(412,'2017-02-27 15:41:13','2017-02-27 15:41:13','remove-liveshopping-bundle-columns',NULL),(413,'2017-02-27 15:41:13','2017-02-27 15:41:13','tidy-up-session-tables',NULL),(414,'2017-02-27 15:41:13','2017-02-27 15:41:13','add-product-box-layout',NULL),(415,'2017-02-27 15:41:13','2017-02-27 15:41:13','remove-promotions',NULL),(416,'2017-02-27 15:41:13','2017-02-27 15:41:13','remove-dummy-plugins',NULL),(417,'2017-02-27 15:41:13','2017-02-27 15:41:13','remove-routerold-plugin',NULL),(418,'2017-02-27 15:41:13','2017-02-27 15:41:13','shop-specific-search-statistics',NULL),(419,'2017-02-27 15:41:13','2017-02-27 15:41:13','extract-acl-service',NULL),(420,'2017-02-27 15:41:13','2017-02-27 15:41:13','remove-plugin-manager',NULL),(421,'2017-02-27 15:41:13','2017-02-27 15:41:13','remove-store-api-plugin',NULL),(422,'2017-02-27 15:41:13','2017-02-27 15:41:13','add-plugin-categories',NULL),(423,'2017-02-27 15:41:13','2017-02-27 15:41:13','remove-unused-config-variables',NULL),(424,'2017-02-27 15:41:13','2017-02-27 15:41:13','update-deprecated-config-variables',NULL),(425,'2017-02-27 15:41:13','2017-02-27 15:41:13','remove-old-templates',NULL),(426,'2017-02-27 15:41:13','2017-02-27 15:41:13','extract-cron-service',NULL),(427,'2017-02-27 15:41:13','2017-02-27 15:41:13','add-nostock-config',NULL),(428,'2017-02-27 15:41:13','2017-02-27 15:41:13','remove-old-instock-config',NULL),(429,'2017-02-27 15:41:13','2017-02-27 15:41:13','activate-performance-filters',NULL),(430,'2017-02-27 15:41:13','2017-02-27 15:41:14','add-shop-page-form-shopid',NULL),(431,'2017-02-27 15:41:14','2017-02-27 15:41:14','cache-emotion-landing-pages',NULL),(432,'2017-02-27 15:41:14','2017-02-27 15:41:14','html5-tags-for-snippets',NULL),(433,'2017-02-27 15:41:14','2017-02-27 15:41:14','emotion-device-column-as-varchar',NULL),(434,'2017-02-27 15:41:14','2017-02-27 15:41:14','add-emotion-components',NULL),(435,'2017-02-27 15:41:14','2017-02-27 15:41:14','mark-deprecated-fields-emotions',NULL),(436,'2017-02-27 15:41:14','2017-02-27 15:41:14','update-html5-video-fields',NULL),(437,'2017-02-27 15:41:14','2017-02-27 15:41:14','add-dirty-flag-email-translations',NULL),(438,'2017-02-27 15:41:14','2017-02-27 15:41:14','add-email-template-header-footer-fields',NULL),(439,'2017-02-27 15:41:14','2017-02-27 15:41:14','update-document-footer-styling',NULL),(440,'2017-02-27 15:41:14','2017-02-27 15:41:14','fix-sorder-email-template',NULL),(441,'2017-02-27 15:41:14','2017-02-27 15:41:14','add-hide-downloads-in-account',NULL),(442,'2017-02-27 15:41:14','2017-02-27 15:41:14','add-option-to-disable-styling-emotions',NULL),(443,'2017-02-27 15:41:14','2017-02-27 15:41:14','add-wizard-configuration-value',NULL),(444,'2017-02-27 15:41:14','2017-02-27 15:41:14','add-imprint-to-bottom-shop-group',NULL),(445,'2017-02-27 15:41:14','2017-02-27 15:41:14','import-vrrl-plugin-settings',NULL),(446,'2017-02-27 15:41:14','2017-02-27 15:41:14','easy-registration-process',NULL),(447,'2017-02-27 15:41:14','2017-02-27 15:41:14','update-tag-cloud-defaults',NULL),(448,'2017-02-27 15:41:14','2017-02-27 15:41:14','update-first-run-wizard-snippet',NULL),(449,'2017-02-27 15:41:14','2017-02-27 15:41:14','add-pagination-seo',NULL),(450,'2017-02-27 15:41:14','2017-02-27 15:41:14','add-high-dpi-album-settings',NULL),(451,'2017-02-27 15:41:14','2017-02-27 15:41:14','fix-email-header-field',NULL),(452,'2017-02-27 15:41:14','2017-02-27 15:41:14','add-styling-classes-main-menu',NULL),(453,'2017-02-27 15:41:14','2017-02-27 15:41:14','update-table-encoding',NULL),(454,'2017-02-27 15:41:14','2017-02-27 15:41:14','rename-theme-manager',NULL),(455,'2017-02-27 15:41:14','2017-02-27 15:41:14','cache-invalidate-variants',NULL),(456,'2017-02-27 15:41:14','2017-02-27 15:41:14','emotion-worlds-cache-invalidation',NULL),(457,'2017-02-27 15:41:14','2017-02-27 15:41:14','add-thumbnail-config',NULL),(458,'2017-02-27 15:41:14','2017-02-27 15:41:14','remove-selfhealing-plugin',NULL),(459,'2017-02-27 15:41:14','2017-02-27 15:41:14','translate-form-fields',NULL),(460,'2017-02-27 15:41:14','2017-02-27 15:41:14','fix-email-header-field',NULL),(461,'2017-02-27 15:41:14','2017-02-27 15:41:14','fix-sorder-email-thumbnails',NULL),(462,'2017-02-27 15:41:14','2017-02-27 15:41:14','add-emotion-position-column',NULL),(463,'2017-02-27 15:41:14','2017-02-27 15:41:14','translate-emotion-html-video',NULL),(464,'2017-02-27 15:41:14','2017-02-27 15:41:15','add-feed-dirty-flag',NULL),(465,'2017-02-27 15:41:15','2017-02-27 15:41:15','token-secret',NULL),(466,'2017-02-27 15:41:15','2017-02-27 15:41:15','supplier-seo-url',NULL),(467,'2017-02-27 15:41:15','2017-02-27 15:41:15','remove-listing-seo-url',NULL),(468,'2017-02-27 15:41:15','2017-02-27 15:41:15','update-feeds-thumbnails-size',NULL),(469,'2017-02-27 15:41:15','2017-02-27 15:41:15','add-404-article-page-config',NULL),(470,'2017-02-27 15:41:15','2017-02-27 15:41:15','update-price-variation-column-type',NULL),(471,'2017-02-27 15:41:15','2017-02-27 15:41:15','fix-attr17',NULL),(472,'2017-02-27 15:41:15','2017-02-27 15:41:15','add-landing-page-parent',NULL),(473,'2017-02-27 15:41:15','2017-02-27 15:41:15','add-zip-city-flip-option',NULL),(474,'2017-02-27 15:41:15','2017-02-27 15:41:15','switch-zipcode-city-emails',NULL),(475,'2017-02-27 15:41:15','2017-02-27 15:41:15','add-missing-emails',NULL),(476,'2017-02-27 15:41:15','2017-02-27 15:41:15','add-less-compatible-flag',NULL),(477,'2017-02-27 15:41:15','2017-02-27 15:41:15','disable-tag-cloud-for-installation',NULL),(478,'2017-02-27 15:41:15','2017-02-27 15:41:15','add-emotion-banner-title-attr',NULL),(479,'2017-02-27 15:41:15','2017-02-27 15:41:15','implement-after-update-wizard',NULL),(480,'2017-02-27 15:41:15','2017-02-27 15:41:15','translate-multi-edit-config-form',NULL),(481,'2017-02-27 15:41:15','2017-02-27 15:41:15','remove-vat-validation-from-core',NULL),(482,'2017-02-27 15:41:15','2017-02-27 15:41:15','remove-horizontal-scrolling',NULL),(483,'2017-02-27 15:41:15','2017-02-27 15:41:15','set-device-type-nullable',NULL),(484,'2017-02-27 15:41:15','2017-02-27 15:41:15','add-seo-title-to-categories',NULL),(485,'2017-02-27 15:41:15','2017-02-27 15:41:15','add-new-sprites-media-manager-albums',NULL),(486,'2017-02-27 15:41:15','2017-02-27 15:41:15','generate-mobile-sitemap',NULL),(487,'2017-02-27 15:41:15','2017-02-27 15:41:15','fix-service-product-snippet',NULL),(488,'2017-02-27 15:41:15','2017-02-27 15:41:15','reset-search-index',NULL),(489,'2017-02-27 15:41:15','2017-02-27 15:41:15','fix-backend-menu-icons',NULL),(490,'2017-02-27 15:41:15','2017-02-27 15:41:15','fix-email-templates-images-height',NULL),(491,'2017-02-27 15:41:15','2017-02-27 15:41:15','change-enabled-payment-methods',NULL),(492,'2017-02-27 15:41:15','2017-02-27 15:41:15','remove-unnecessary-data-from-base-install',NULL),(493,'2017-02-27 15:41:15','2017-02-27 15:41:15','remove-mail-translations',NULL),(494,'2017-02-27 15:41:15','2017-02-27 15:41:15','add-cheapest-price-calculation-config',NULL),(495,'2017-02-27 15:41:15','2017-02-27 15:41:15','fix-shopping-worlds-grid',NULL),(496,'2017-02-27 15:41:15','2017-02-27 15:41:15','add-cheapest-price-selection-config',NULL),(497,'2017-02-27 15:41:15','2017-02-27 15:41:15','fix-email-payment-method-description',NULL),(498,'2017-02-27 15:41:15','2017-02-27 15:41:15','fix-and-add-acl-privileges',NULL),(499,'2017-02-27 15:41:15','2017-02-27 15:41:15','add-swag-update-acl-privileges',NULL),(500,'2017-02-27 15:41:15','2017-02-27 15:41:15','destroy-bot-sessions',NULL),(501,'2017-02-27 15:41:15','2017-02-27 15:41:15','add-added-column-in-mailaddresses',NULL),(502,'2017-02-27 15:41:15','2017-02-27 15:41:15','remove-unused-voucher-table',NULL),(503,'2017-02-27 15:41:15','2017-02-27 15:41:15','rename-multi-edit',NULL),(504,'2017-02-27 15:41:15','2017-02-27 15:41:15','add-customergroup-index',NULL),(505,'2017-02-27 15:41:15','2017-02-27 15:41:15','add-voucher-indexes',NULL),(506,'2017-02-27 15:41:15','2017-02-27 15:41:15','password-reset',NULL),(600,'2017-02-27 15:41:15','2017-02-27 15:41:15','add-support-max-generated-similar-products',NULL),(601,'2017-02-27 15:41:15','2017-02-27 15:41:15','implement-elastic-search',NULL),(602,'2017-02-27 15:41:15','2017-02-27 15:41:15','add-premium-plugins-menu-item',NULL),(603,'2017-02-27 15:41:16','2017-02-27 15:41:16','add-product-streams',NULL),(604,'2017-02-27 15:41:16','2017-02-27 15:41:16','move-discount-surchage-names-into-snippets',NULL),(605,'2017-02-27 15:41:16','2017-02-27 15:41:16','add-and-search-config',NULL),(606,'2017-02-27 15:41:16','2017-02-27 15:41:16','add-state-name-column',NULL),(607,'2017-02-27 15:41:16','2017-02-27 15:41:16','add-rss-feed-widget',NULL),(608,'2017-02-27 15:41:16','2017-02-27 15:41:16','fix-product-stream-icon',NULL),(609,'2017-02-27 15:41:16','2017-02-27 15:41:16','add-media-recycling',NULL),(610,'2017-02-27 15:41:16','2017-02-27 15:41:16','remove-deprecated-adodb',NULL),(611,'2017-02-27 15:41:16','2017-02-27 15:41:16','remove-deprecated-api',NULL),(612,'2017-02-27 15:41:16','2017-02-27 15:41:16','remove-deprecated-multilanguage',NULL),(613,'2017-02-27 15:41:16','2017-02-27 15:41:16','add-media-meta',NULL),(614,'2017-02-27 15:41:16','2017-02-27 15:41:16','fix-document-logo-path',NULL),(615,'2017-02-27 15:41:16','2017-02-27 15:41:16','password-reset',NULL),(616,'2017-02-27 15:41:16','2017-02-27 15:41:16','product-stream-emotion-field',NULL),(617,'2017-02-27 15:41:16','2017-02-27 15:41:16','add-html5-emotion-handler',NULL),(618,'2017-02-27 15:41:16','2017-02-27 15:41:16','add-trash-album-settings',NULL),(619,'2017-02-27 15:41:16','2017-02-27 15:41:16','add-widgets-listing-cache-tag',NULL),(620,'2017-02-27 15:41:16','2017-02-27 15:41:16','add-delivered-in-future-column',NULL),(621,'2017-02-27 15:41:16','2017-02-27 15:41:16','remove-filter-options',NULL),(622,'2017-02-27 15:41:16','2017-02-27 15:41:16','add-emotion-seo-title',NULL),(623,'2017-02-27 15:41:16','2017-02-27 15:41:16','add-payment-config-item',NULL),(624,'2017-02-27 15:41:16','2017-02-27 15:41:16','fix-null-tax-rules',NULL),(625,'2017-02-27 15:41:16','2017-02-27 15:41:16','rename-feedback',NULL),(626,'2017-02-27 15:41:16','2017-02-27 15:41:16','fix-email-template-variables',NULL),(627,'2017-02-27 15:41:16','2017-02-27 15:41:16','fix-order-email-voucher-image',NULL),(628,'2017-02-27 15:41:16','2017-02-27 15:41:16','add-validation-index',NULL),(629,'2017-02-27 15:41:16','2017-02-27 15:41:16','implement-ajax-timeout',NULL),(630,'2017-02-27 15:41:16','2017-02-27 15:41:16','remove-google-analytics',NULL),(631,'2017-02-27 15:41:16','2017-02-27 15:41:16','remove-search-results-per-page',NULL),(632,'2017-02-27 15:41:16','2017-02-27 15:41:16','optimize-hide-no-instock-label',NULL),(633,'2017-02-27 15:41:16','2017-02-27 15:41:16','add-index-for-image-mappings',NULL),(634,'2017-02-27 15:41:16','2017-02-27 15:41:16','add-index-for-basket-ordernumber',NULL),(635,'2017-02-27 15:41:16','2017-02-27 15:41:16','add-index-for-plugin-id',NULL),(636,'2017-02-27 15:41:16','2017-02-27 15:41:16','streamline-german-email-wording',NULL),(637,'2017-02-27 15:41:16','2017-02-27 15:41:16','deactivate-similar-products',NULL),(638,'2017-02-27 15:41:16','2017-02-27 15:41:16','fix-serialized-data',NULL),(700,'2017-02-27 15:41:16','2017-02-27 15:41:16','remove-filter-values',NULL),(701,'2017-02-27 15:41:16','2017-02-27 15:41:16','remove-emotion-backend-options',NULL),(702,'2017-02-27 15:41:16','2017-02-27 15:41:16','add-emotion-element-css-class',NULL),(703,'2017-02-27 15:41:16','2017-02-27 15:41:16','activate-html-code-widget-by-default',NULL),(704,'2017-02-27 15:41:16','2017-02-27 15:41:16','remove-referercheck',NULL),(705,'2017-02-27 15:41:16','2017-02-27 15:41:16','rename-category-template-column',NULL),(706,'2017-02-27 15:41:16','2017-02-27 15:41:16','remove-debit-table',NULL),(707,'2017-02-27 15:41:16','2017-02-27 15:41:16','add-new-emotion-link-target-field',NULL),(708,'2017-02-27 15:41:16','2017-02-27 15:41:18','attribute-administration',NULL),(709,'2017-02-27 15:41:18','2017-02-27 15:41:18','add-user-addresses',NULL),(710,'2017-02-27 15:41:18','2017-02-27 15:41:18','remove-fax-field',NULL),(711,'2017-02-27 15:41:18','2017-02-27 15:41:18','create-address-migrate-table',NULL),(712,'2017-02-27 15:41:18','2017-02-27 15:41:18','migrate-user-billing',NULL),(713,'2017-02-27 15:41:18','2017-02-27 15:41:18','migrate-user-shipping',NULL),(714,'2017-02-27 15:41:18','2017-02-27 15:41:18','migrate-order-billing',NULL),(715,'2017-02-27 15:41:18','2017-02-27 15:41:18','migrate-order-shipping',NULL),(716,'2017-02-27 15:41:18','2017-02-27 15:41:18','copy-addresses-to-addressbook',NULL),(717,'2017-02-27 15:41:18','2017-02-27 15:41:18','set-default-billingaddresses',NULL),(718,'2017-02-27 15:41:18','2017-02-27 15:41:18','set-default-shippingaddresses',NULL),(719,'2017-02-27 15:41:18','2017-02-27 15:41:18','create-address-attribute-tables',NULL),(720,'2017-02-27 15:41:18','2017-02-27 15:41:18','migrate-order-billing-attributes',NULL),(721,'2017-02-27 15:41:18','2017-02-27 15:41:18','migrate-order-shipping-attributes',NULL),(722,'2017-02-27 15:41:18','2017-02-27 15:41:18','migrate-user-shipping-attributes',NULL),(723,'2017-02-27 15:41:18','2017-02-27 15:41:18','migrate-user-billing-attributes',NULL),(724,'2017-02-27 15:41:18','2017-02-27 15:41:18','cleanup-address-migration',NULL),(725,'2017-02-27 15:41:18','2017-02-27 15:41:18','remove-license-plugin-from-initial-db',NULL),(726,'2017-02-27 15:41:18','2017-02-27 15:41:18','remove-shipping-billing',NULL),(727,'2017-02-27 15:41:18','2017-02-27 15:41:18','core-license-config',NULL),(728,'2017-02-27 15:41:18','2017-02-27 15:41:18','create-s-user-columns',NULL),(729,'2017-02-27 15:41:18','2017-02-27 15:41:18','migrate-additional-userdata',NULL),(730,'2017-02-27 15:41:18','2017-02-27 15:41:18','drop-birthday-column',NULL),(731,'2017-02-27 15:41:18','2017-02-27 15:41:19','remove-emotion-grids',NULL),(732,'2017-02-27 15:41:19','2017-02-27 15:41:19','remove-landingpage-teaser',NULL),(733,'2017-02-27 15:41:19','2017-02-27 15:41:19','add-translatable-field-with-data',NULL),(734,'2017-02-27 15:41:19','2017-02-27 15:41:19','new-emotion-shop-association',NULL),(735,'2017-02-27 15:41:19','2017-02-27 15:41:19','migrate-old-emotion-relation',NULL),(736,'2017-02-27 15:41:19','2017-02-27 15:41:19','add-article-widget-categorie-selection',NULL),(737,'2017-02-27 15:41:19','2017-02-27 15:41:19','add-emotion-element-viewport',NULL),(738,'2017-02-27 15:41:19','2017-02-27 15:41:19','fixed-iframe-widget-xtype',NULL),(739,'2017-02-27 15:41:19','2017-02-27 15:41:19','migrate-emotion-widget-settings',NULL),(740,'2017-02-27 15:41:19','2017-02-27 15:41:19','new-border-setting-for-emotion-widgets',NULL),(741,'2017-02-27 15:41:19','2017-02-27 15:41:19','migrate-salutation-mails',NULL),(742,'2017-02-27 15:41:19','2017-02-27 15:41:19','add-title-user-billing',NULL),(743,'2017-02-27 15:41:19','2017-02-27 15:41:19','add-title-order-billing',NULL),(744,'2017-02-27 15:41:19','2017-02-27 15:41:19','add-title-order-shipping',NULL),(745,'2017-02-27 15:41:19','2017-02-27 15:41:19','add-title-user-shipping',NULL),(746,'2017-02-27 15:41:19','2017-02-27 15:41:19','migrate-shipping',NULL),(747,'2017-02-27 15:41:19','2017-02-27 15:41:19','ekw-mode-migration',NULL),(748,'2017-02-27 15:41:19','2017-02-27 15:41:19','remove-unused-fields',NULL),(749,'2017-02-27 15:41:19','2017-02-27 15:41:19','make-ustid-nullable',NULL),(750,'2017-02-27 15:41:19','2017-02-27 15:41:20','migrate-article-details-base-price',NULL),(751,'2017-02-27 15:41:20','2017-02-27 15:41:20','drop-unused-menu-fields',NULL),(752,'2017-02-27 15:41:20','2017-02-27 15:41:20','delete-payment-plugin',NULL),(753,'2017-02-27 15:41:20','2017-02-27 15:41:20','add-s-user-customer-number',NULL),(754,'2017-02-27 15:41:20','2017-02-27 15:41:20','update-order-billing-customer-number',NULL),(755,'2017-02-27 15:41:20','2017-02-27 15:41:20','migrate-customer-number',NULL),(756,'2017-02-27 15:41:20','2017-02-27 15:41:20','drop-customer-number',NULL),(757,'2017-02-27 15:41:20','2017-02-27 15:41:20','add-array-store-field',NULL),(758,'2017-02-27 15:41:20','2017-02-27 15:41:20','remove-attributes-read-acl',NULL),(759,'2017-02-27 15:41:20','2017-02-27 15:41:20','remove-noviewselect',NULL),(760,'2017-02-27 15:41:20','2017-02-27 15:41:20','change-plugin-unique-key',NULL),(761,'2017-02-27 15:41:20','2017-02-27 15:41:20','change-performance-menu',NULL),(762,'2017-02-27 15:41:20','2017-02-27 15:41:20','increase-img-character-size',NULL),(763,'2017-02-27 15:41:20','2017-02-27 15:41:20','add-attributes-read-acl',NULL),(764,'2017-02-27 15:41:20','2017-02-27 15:41:20','fixing-ordernumber-schema-addon-premiums',NULL),(765,'2017-02-27 15:41:20','2017-02-27 15:41:20','fixing-ordernumber-schema-article-configurator-templates',NULL),(766,'2017-02-27 15:41:20','2017-02-27 15:41:20','fixing-ordernumber-schema-article-details',NULL),(767,'2017-02-27 15:41:20','2017-02-27 15:41:20','fixing-ordernumber-schema-campaigns-articles',NULL),(768,'2017-02-27 15:41:20','2017-02-27 15:41:20','fixing-ordernumber-schema-order',NULL),(769,'2017-02-27 15:41:20','2017-02-27 15:41:20','fixing-ordernumber-schema-order-basket',NULL),(770,'2017-02-27 15:41:20','2017-02-27 15:41:21','fixing-ordernumber-schema-order-details',NULL),(771,'2017-02-27 15:41:21','2017-02-27 15:41:21','fixing-ordernumber-schema-order-notes',NULL),(772,'2017-02-27 15:41:21','2017-02-27 15:41:21','allow-label-nullable',NULL),(773,'2017-02-27 15:41:21','2017-02-27 15:41:21','add-library-component-fields',NULL),(774,'2017-02-27 15:41:21','2017-02-27 15:41:21','add-extra-config-elements',NULL),(775,'2017-02-27 15:41:21','2017-02-27 15:41:21','add-asset-version-config-element',NULL),(776,'2017-02-27 15:41:21','2017-02-27 15:41:21','fix-alter-ignore-migrations',NULL),(777,'2017-02-27 15:41:21','2017-02-27 15:41:21','fix-invalid-birthdays',NULL),(778,'2017-02-27 15:41:21','2017-02-27 15:41:21','add-attribtue-default-value',NULL),(779,'2017-02-27 15:41:21','2017-02-27 15:41:21','fixing-bot-detection-ios',NULL),(780,'2017-02-27 15:41:21','2017-02-27 15:41:21','fix-debit-payment',NULL),(781,'2017-02-27 15:41:21','2017-02-27 15:41:21','update-forum-link',NULL),(782,'2017-02-27 15:41:21','2017-02-27 15:41:21','add-partner-idcode-index',NULL),(783,'2017-02-27 15:41:21','2017-02-27 15:41:21','increase-media-path-columns',NULL),(784,'2017-02-27 15:41:21','2017-02-27 15:41:21','add-paging-to-notfoundfield',NULL),(785,'2017-02-27 15:41:21','2017-02-27 15:41:21','add-connect-default-menu',NULL),(786,'2017-02-27 15:41:21','2017-02-27 15:41:21','extend-api-cache-invalidation',NULL),(787,'2017-02-27 15:41:21','2017-02-27 15:41:21','add-missing-translation-basicsettings-login-and-registration',NULL),(788,'2017-02-27 15:41:21','2017-02-27 15:41:21','change-Seo-Router-description',NULL),(789,'2017-02-27 15:41:21','2017-02-27 15:41:21','add-crontab-disableonerror',NULL),(790,'2017-02-27 15:41:21','2017-02-27 15:41:21','clarify-basic-settings-label',NULL),(791,'2017-02-27 15:41:21','2017-02-27 15:41:21','increase-password-hash-size',NULL),(792,'2017-02-27 15:41:21','2017-02-27 15:41:21','add-send-registration-email-confirmation-config',NULL),(793,'2017-02-27 15:41:21','2017-02-27 15:41:21','add-attribute-table-for-search',NULL),(794,'2017-02-27 15:41:21','2017-02-27 15:41:21','fix-shop-page-limiting',NULL),(795,'2017-02-27 15:41:21','2017-02-27 15:41:21','remove-salutation-snippets',NULL),(796,'2017-02-27 15:41:21','2017-02-27 15:41:21','add-uniqueid-config-element',NULL),(797,'2017-02-27 15:41:21','2017-02-27 15:41:21','remove-salutation-snippets',NULL),(798,'2017-02-27 15:41:21','2017-02-27 15:41:21','add-sytem-log-acl',NULL),(799,'2017-02-27 15:41:21','2017-02-27 15:41:21','attribute-translation-fix-1-of-10',NULL),(800,'2017-02-27 15:41:21','2017-02-27 15:41:21','attribute-translation-fix-2-of-10',NULL),(801,'2017-02-27 15:41:21','2017-02-27 15:41:21','attribute-translation-fix-3-of-10',NULL),(802,'2017-02-27 15:41:21','2017-02-27 15:41:21','attribute-translation-fix-4-of-10',NULL),(803,'2017-02-27 15:41:21','2017-02-27 15:41:21','attribute-translation-fix-5-of-10',NULL),(804,'2017-02-27 15:41:21','2017-02-27 15:41:21','attribute-translation-fix-6-of-10',NULL),(805,'2017-02-27 15:41:21','2017-02-27 15:41:21','attribute-translation-fix-7-of-10',NULL),(806,'2017-02-27 15:41:21','2017-02-27 15:41:21','attribute-translation-fix-8-of-10',NULL),(807,'2017-02-27 15:41:21','2017-02-27 15:41:21','attribute-translation-fix-9-of-10',NULL),(808,'2017-02-27 15:41:21','2017-02-27 15:41:21','attribute-translation-fix-10-of-10',NULL),(809,'2017-02-27 15:41:21','2017-02-27 15:41:21','change-session-tables',NULL),(810,'2017-02-27 15:41:21','2017-02-27 15:41:21','change-description-of-article-cover-setting',NULL),(811,'2017-02-27 15:41:21','2017-02-27 15:41:21','add-attributes-partner',NULL),(812,'2017-02-27 15:41:21','2017-02-27 15:41:21','add-max-limit-config',NULL),(813,'2017-02-27 15:41:21','2017-02-27 15:41:21','session-expiry',NULL),(814,'2017-02-27 15:41:21','2017-02-27 15:41:22','create-configurator-options-attribute-table',NULL),(815,'2017-02-27 15:41:22','2017-02-27 15:41:22','add-strip-tags-configuration-option',NULL);
/*!40000 ALTER TABLE `s_schema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_search_fields`
--

DROP TABLE IF EXISTS `s_search_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_search_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `relevance` int(11) NOT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tableID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field` (`field`,`tableID`),
  KEY `tableID` (`tableID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_search_fields`
--

LOCK TABLES `s_search_fields` WRITE;
/*!40000 ALTER TABLE `s_search_fields` DISABLE KEYS */;
INSERT INTO `s_search_fields` VALUES (1,'Kategorie-Keywords',10,'metakeywords',2),(2,'Kategorie-Überschrift',70,'description',2),(3,'Artikel-Name',400,'name',1),(4,'Artikel-Keywords',10,'keywords',1),(5,'Artikel-Bestellnummer',50,'ordernumber',4),(6,'Hersteller-Name',45,'name',3),(7,'Artikel-Name Übersetzung',50,'name',5),(8,'Artikel-Keywords Übersetzung',10,'keywords',5);
/*!40000 ALTER TABLE `s_search_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_search_index`
--

DROP TABLE IF EXISTS `s_search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_search_index` (
  `keywordID` int(11) NOT NULL,
  `fieldID` int(11) NOT NULL,
  `elementID` int(11) NOT NULL,
  PRIMARY KEY (`keywordID`,`fieldID`,`elementID`),
  KEY `clean_up_index` (`keywordID`,`fieldID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_search_index`
--

LOCK TABLES `s_search_index` WRITE;
/*!40000 ALTER TABLE `s_search_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_search_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_search_keywords`
--

DROP TABLE IF EXISTS `s_search_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_search_keywords` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `soundex` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`),
  KEY `soundex` (`soundex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_search_keywords`
--

LOCK TABLES `s_search_keywords` WRITE;
/*!40000 ALTER TABLE `s_search_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_search_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_search_tables`
--

DROP TABLE IF EXISTS `s_search_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_search_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `referenz_table` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foreign_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `where` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_search_tables`
--

LOCK TABLES `s_search_tables` WRITE;
/*!40000 ALTER TABLE `s_search_tables` DISABLE KEYS */;
INSERT INTO `s_search_tables` VALUES (1,'s_articles',NULL,NULL,NULL),(2,'s_categories','s_articles_categories','categoryID',NULL),(3,'s_articles_supplier',NULL,'supplierID',NULL),(4,'s_articles_details','s_articles_details','id',NULL),(5,'s_articles_translations',NULL,NULL,NULL),(6,'s_articles_attributes',NULL,NULL,NULL);
/*!40000 ALTER TABLE `s_search_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_statistics_article_impression`
--

DROP TABLE IF EXISTS `s_statistics_article_impression`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_statistics_article_impression` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `articleId` int(11) unsigned NOT NULL,
  `shopId` int(11) unsigned NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `impressions` int(11) NOT NULL,
  `deviceType` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'desktop',
  PRIMARY KEY (`id`),
  UNIQUE KEY `articleId_2` (`articleId`,`shopId`,`date`,`deviceType`),
  KEY `articleId` (`articleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_statistics_article_impression`
--

LOCK TABLES `s_statistics_article_impression` WRITE;
/*!40000 ALTER TABLE `s_statistics_article_impression` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_statistics_article_impression` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_statistics_currentusers`
--

DROP TABLE IF EXISTS `s_statistics_currentusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_statistics_currentusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remoteaddr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `time` datetime DEFAULT NULL,
  `userID` int(11) NOT NULL DEFAULT '0',
  `deviceType` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'desktop',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_statistics_currentusers`
--

LOCK TABLES `s_statistics_currentusers` WRITE;
/*!40000 ALTER TABLE `s_statistics_currentusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_statistics_currentusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_statistics_pool`
--

DROP TABLE IF EXISTS `s_statistics_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_statistics_pool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remoteaddr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `datum` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_statistics_pool`
--

LOCK TABLES `s_statistics_pool` WRITE;
/*!40000 ALTER TABLE `s_statistics_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_statistics_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_statistics_referer`
--

DROP TABLE IF EXISTS `s_statistics_referer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_statistics_referer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datum` date NOT NULL DEFAULT '0000-00-00',
  `referer` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_statistics_referer`
--

LOCK TABLES `s_statistics_referer` WRITE;
/*!40000 ALTER TABLE `s_statistics_referer` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_statistics_referer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_statistics_search`
--

DROP TABLE IF EXISTS `s_statistics_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_statistics_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datum` datetime NOT NULL,
  `searchterm` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `results` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `searchterm` (`searchterm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_statistics_search`
--

LOCK TABLES `s_statistics_search` WRITE;
/*!40000 ALTER TABLE `s_statistics_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_statistics_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_statistics_visitors`
--

DROP TABLE IF EXISTS `s_statistics_visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_statistics_visitors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopID` int(11) NOT NULL,
  `datum` date NOT NULL DEFAULT '0000-00-00',
  `pageimpressions` int(11) NOT NULL DEFAULT '0',
  `uniquevisits` int(11) NOT NULL DEFAULT '0',
  `deviceType` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'desktop',
  PRIMARY KEY (`id`),
  KEY `datum` (`datum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_statistics_visitors`
--

LOCK TABLES `s_statistics_visitors` WRITE;
/*!40000 ALTER TABLE `s_statistics_visitors` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_statistics_visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_user`
--

DROP TABLE IF EXISTS `s_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `encoder` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'md5',
  `email` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  `accountmode` int(11) NOT NULL,
  `confirmationkey` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `paymentID` int(11) NOT NULL DEFAULT '0',
  `firstlogin` date NOT NULL DEFAULT '0000-00-00',
  `lastlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sessionID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newsletter` int(1) NOT NULL DEFAULT '0',
  `validation` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `affiliate` int(10) NOT NULL DEFAULT '0',
  `customergroup` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `paymentpreset` int(11) NOT NULL,
  `language` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `subshopID` int(11) NOT NULL,
  `referer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pricegroupID` int(11) unsigned DEFAULT NULL,
  `internalcomment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `failedlogins` int(11) NOT NULL,
  `lockeduntil` datetime DEFAULT NULL,
  `default_billing_address_id` int(11) DEFAULT NULL,
  `default_shipping_address_id` int(11) DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salutation` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `customernumber` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `sessionID` (`sessionID`),
  KEY `firstlogin` (`firstlogin`),
  KEY `lastlogin` (`lastlogin`),
  KEY `pricegroupID` (`pricegroupID`),
  KEY `customergroup` (`customergroup`),
  KEY `validation` (`validation`),
  KEY `default_billing_address_id` (`default_billing_address_id`),
  KEY `default_shipping_address_id` (`default_shipping_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_user`
--

LOCK TABLES `s_user` WRITE;
/*!40000 ALTER TABLE `s_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_user_addresses`
--

DROP TABLE IF EXISTS `s_user_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_user_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salutation` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `ustid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional_address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional_address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `country_id` (`country_id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `s_user_addresses_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `s_core_countries` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `s_user_addresses_ibfk_2` FOREIGN KEY (`state_id`) REFERENCES `s_core_countries_states` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `s_user_addresses_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `s_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_user_addresses`
--

LOCK TABLES `s_user_addresses` WRITE;
/*!40000 ALTER TABLE `s_user_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_user_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_user_addresses_attributes`
--

DROP TABLE IF EXISTS `s_user_addresses_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_user_addresses_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_id` int(11) NOT NULL,
  `text1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_id` (`address_id`),
  CONSTRAINT `s_user_addresses_attributes_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `s_user_addresses` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_user_addresses_attributes`
--

LOCK TABLES `s_user_addresses_attributes` WRITE;
/*!40000 ALTER TABLE `s_user_addresses_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_user_addresses_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_user_attributes`
--

DROP TABLE IF EXISTS `s_user_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_user_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userID` (`userID`),
  CONSTRAINT `s_user_attributes_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `s_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_user_attributes`
--

LOCK TABLES `s_user_attributes` WRITE;
/*!40000 ALTER TABLE `s_user_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_user_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_user_billingaddress`
--

DROP TABLE IF EXISTS `s_user_billingaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_user_billingaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL DEFAULT '0',
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `department` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `salutation` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `countryID` int(11) NOT NULL DEFAULT '0',
  `stateID` int(11) DEFAULT NULL,
  `ustid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional_address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional_address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_user_billingaddress`
--

LOCK TABLES `s_user_billingaddress` WRITE;
/*!40000 ALTER TABLE `s_user_billingaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_user_billingaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_user_billingaddress_attributes`
--

DROP TABLE IF EXISTS `s_user_billingaddress_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_user_billingaddress_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `billingID` int(11) DEFAULT NULL,
  `text1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `billingID` (`billingID`),
  CONSTRAINT `s_user_billingaddress_attributes_ibfk_1` FOREIGN KEY (`billingID`) REFERENCES `s_user_billingaddress` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_user_billingaddress_attributes`
--

LOCK TABLES `s_user_billingaddress_attributes` WRITE;
/*!40000 ALTER TABLE `s_user_billingaddress_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_user_billingaddress_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_user_shippingaddress`
--

DROP TABLE IF EXISTS `s_user_shippingaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_user_shippingaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL DEFAULT '0',
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `department` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `salutation` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `countryID` int(11) DEFAULT NULL,
  `stateID` int(11) DEFAULT NULL,
  `additional_address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional_address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userID` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_user_shippingaddress`
--

LOCK TABLES `s_user_shippingaddress` WRITE;
/*!40000 ALTER TABLE `s_user_shippingaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_user_shippingaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_user_shippingaddress_attributes`
--

DROP TABLE IF EXISTS `s_user_shippingaddress_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_user_shippingaddress_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shippingID` int(11) DEFAULT NULL,
  `text1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shippingID` (`shippingID`),
  CONSTRAINT `s_user_shippingaddress_attributes_ibfk_1` FOREIGN KEY (`shippingID`) REFERENCES `s_user_shippingaddress` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_user_shippingaddress_attributes`
--

LOCK TABLES `s_user_shippingaddress_attributes` WRITE;
/*!40000 ALTER TABLE `s_user_shippingaddress_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_user_shippingaddress_attributes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-27 15:41:28
