/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : human_resource

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-04-06 13:26:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(50) DEFAULT NULL,
  `account_status` tinyint(1) DEFAULT '1',
  `branch_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'Administration', '1', 'OSH');
INSERT INTO `account` VALUES ('2', 'Kitchen', '1', 'OSH');
INSERT INTO `account` VALUES ('3', 'Waste Management', '1', 'OSH');
INSERT INTO `account` VALUES ('4', 'Nursing Station', '1', 'OSH');
INSERT INTO `account` VALUES ('5', 'Telephone & postage', '1', 'OSH');
INSERT INTO `account` VALUES ('6', 'Laboratory', '1', 'OSH');
INSERT INTO `account` VALUES ('7', 'Travelling & subsistence', '1', 'OSH');
INSERT INTO `account` VALUES ('8', 'Pharmacy', '1', 'OSH');
INSERT INTO `account` VALUES ('9', 'Generator', '1', 'OSH');
INSERT INTO `account` VALUES ('10', 'Theatre', '1', 'OSH');
INSERT INTO `account` VALUES ('11', 'Petty Cash', '1', 'OSH');
INSERT INTO `account` VALUES ('12', 'Opening balance', '1', 'OSH');

-- ----------------------------
-- Table structure for `account_credit`
-- ----------------------------
DROP TABLE IF EXISTS `account_credit`;
CREATE TABLE `account_credit` (
  `account_credit` int(11) NOT NULL AUTO_INCREMENT,
  `visit_type_id` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `efect_date` date NOT NULL,
  PRIMARY KEY (`account_credit`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of account_credit
-- ----------------------------
INSERT INTO `account_credit` VALUES ('3', '1', '800', '2013-06-01');
INSERT INTO `account_credit` VALUES ('4', '5', '900', '2014-05-31');

-- ----------------------------
-- Table structure for `allowance`
-- ----------------------------
DROP TABLE IF EXISTS `allowance`;
CREATE TABLE `allowance` (
  `allowance_id` int(11) NOT NULL AUTO_INCREMENT,
  `allowance_name` varchar(45) DEFAULT NULL,
  `allowance_status` int(11) NOT NULL DEFAULT '0',
  `allowance_abbr` varchar(10) NOT NULL,
  `allowance_taxable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`allowance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of allowance
-- ----------------------------

-- ----------------------------
-- Table structure for `basic_pay`
-- ----------------------------
DROP TABLE IF EXISTS `basic_pay`;
CREATE TABLE `basic_pay` (
  `basic_pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `basic_pay_amount` int(11) DEFAULT NULL,
  `personnel_id` int(11) DEFAULT NULL,
  `basic_pay_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `basic_pay_date_released` date NOT NULL,
  `basic_pay_status` int(11) DEFAULT '0',
  PRIMARY KEY (`basic_pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of basic_pay
-- ----------------------------

-- ----------------------------
-- Table structure for `benefit`
-- ----------------------------
DROP TABLE IF EXISTS `benefit`;
CREATE TABLE `benefit` (
  `benefit_id` int(11) NOT NULL AUTO_INCREMENT,
  `benefit_name` varchar(45) DEFAULT NULL,
  `benefit_status` int(11) NOT NULL DEFAULT '0',
  `benefit_abbr` varchar(10) NOT NULL,
  `benefit_taxable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`benefit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of benefit
-- ----------------------------

-- ----------------------------
-- Table structure for `bill_to`
-- ----------------------------
DROP TABLE IF EXISTS `bill_to`;
CREATE TABLE `bill_to` (
  `bill_to_id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_to_name` varchar(20) NOT NULL,
  PRIMARY KEY (`bill_to_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill_to
-- ----------------------------
INSERT INTO `bill_to` VALUES ('1', 'UAP');
INSERT INTO `bill_to` VALUES ('2', 'Clarkson');
INSERT INTO `bill_to` VALUES ('3', 'APA');
INSERT INTO `bill_to` VALUES ('12', 'Questworks');

-- ----------------------------
-- Table structure for `bookings`
-- ----------------------------
DROP TABLE IF EXISTS `bookings`;
CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `patient_surname` varchar(255) NOT NULL,
  `patient_other_names` varchar(255) NOT NULL,
  `patient_number` varchar(255) NOT NULL,
  `booking_date` int(11) NOT NULL,
  `booking_datetime` datetime NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `branch_code` varchar(255) NOT NULL,
  `booking_delete` int(11) DEFAULT '0',
  `collected_amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bookings
-- ----------------------------

-- ----------------------------
-- Table structure for `branch`
-- ----------------------------
DROP TABLE IF EXISTS `branch`;
CREATE TABLE `branch` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_email` varchar(100) NOT NULL,
  `branch_phone` varchar(100) NOT NULL,
  `branch_address` varchar(100) DEFAULT NULL,
  `branch_post_code` varchar(100) DEFAULT NULL,
  `branch_building` varchar(100) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `branch_image_name` varchar(200) NOT NULL,
  `branch_thumb_name` varchar(200) NOT NULL,
  `branch_city` varchar(100) DEFAULT NULL,
  `branch_floor` varchar(100) DEFAULT NULL,
  `branch_location` varchar(100) DEFAULT NULL,
  `branch_working_weekday` varchar(100) DEFAULT NULL,
  `branch_working_weekend` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  `branch_status` tinyint(1) NOT NULL DEFAULT '1',
  `branch_code` varchar(10) DEFAULT NULL,
  `branch_parent` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of branch
-- ----------------------------
INSERT INTO `branch` VALUES ('2', 'info@serenityservices.co.ke', '+254704346052', '21316', '00100', 'Galana Plaza', 'Serenity Services Limited', '373e0b323b676e0ccf90cfd15310ae6b.jpg', 'thumbnail_373e0b323b676e0ccf90cfd15310ae6b.jpg', 'Nairobi, Kenya', '6th', 'Kilimani', '0', '0', '2015-08-28 07:27:08', '85', '2016-01-19 15:45:36', '0', '1', 'SSL', '');
INSERT INTO `branch` VALUES ('3', 'info@quadrantafrica.co.ke', '', '', '', 'Galana Plaza', 'Quadrant Africa Limited', '8892ed3fee45e6ed34523bcd9c1940f6.png', 'thumbnail_8892ed3fee45e6ed34523bcd9c1940f6.png', '', '6th floor', 'Galana Road, Kilimani', '0', '0', '2016-03-01 04:49:40', '0', '2016-03-01 12:49:40', '0', '1', null, '');

-- ----------------------------
-- Table structure for `brand`
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(50) NOT NULL,
  `brand_delete` int(11) DEFAULT '0',
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_on` date DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=463 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', 'A2A Spacers', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('2', 'Activated Charcoal', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('3', 'Actrapid', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('4', 'Acyclovir ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('5', 'Aerovent', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('6', 'Albasol', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('7', 'Alben', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('8', 'Aldactone', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('9', 'Aldomet', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('10', 'Allopurinol', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('11', 'Altacef', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('12', 'Amaryl', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('13', 'Aminophyllin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('14', 'Amitriptriptylin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('15', 'Amlong', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('16', 'Amlozaar', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('17', 'Amlozaar H', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('18', 'Amoxi denk', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('19', 'Amoxicillin generic', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('20', 'Amoxil', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('21', 'Amoxil forte', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('22', 'Amphoteracin B', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('23', 'Ampiclo-Dawa', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('24', 'Ampiclox', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('25', 'Anomex', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('26', 'Anti-D', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('27', 'Anti-Rabbies', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('28', 'Anusol', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('29', 'Aprazole Plus ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('30', 'Apresoline inj', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('31', 'Arcalion', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('32', 'Artane', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('33', 'Artequick', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('34', 'Arthrotec ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('35', 'ASAQ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('36', 'Ascard', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('37', 'Ascoril', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('38', 'Astymin ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('39', 'Astymin SN', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('40', 'Atenolol', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('41', 'ATM', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('42', 'Atorid', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('43', 'Atrest', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('44', 'Augumentin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('45', 'Aurius', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('46', 'Auropodox ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('47', 'Aurotaz- P ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('48', 'Avamys', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('49', 'Avodart', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('50', 'Azzir', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('51', 'Beclomin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('52', 'Benylin Chesty', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('53', 'Benylin Dry', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('54', 'Benylin Paed', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('55', 'Benzit', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('56', 'Betadine', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('57', 'Betadine Mouth wash', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('58', 'Betaloc Zok ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('59', 'Betapyn', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('60', 'Betaserc', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('61', 'BG-Glutamin Plus', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('62', 'Bonjela mouth gel', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('63', 'Bromodel', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('64', 'Bronchowin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('65', 'Brustan', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('66', 'Burnazine', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('67', 'Buscopan', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('68', 'Buscopan Plus', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('69', 'Cabalin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('70', 'Cadid-V3', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('71', 'Cadronate', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('72', 'CAF inj', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('73', 'Calamine lotion', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('74', 'Calcinol-1000', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('75', 'Calcium Gluconate ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('76', 'Calpol ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('77', 'Candid Cream', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('78', 'candid Paint', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('79', 'Candiid -V 3', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('80', 'Canditral', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('81', 'cardisprin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('82', 'Cardivas', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('83', 'Carticare forte', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('84', 'Cartil Care forte', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('85', 'Cartil forte', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('86', 'Cartil Super forte', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('87', 'Castor oil', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('88', 'Ceftriaxone', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('89', 'Cetrizet', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('90', 'Ciflosin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('91', 'Cipro-inta', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('92', 'Ciprolen', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('93', 'Ciprro Denk', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('94', 'Cital', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('95', 'Clarie Ds', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('96', 'Clindamycin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('97', 'Clith', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('98', 'Clopress', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('99', 'Coartem', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('100', 'Coartem Ds', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('101', 'Co-Artesiane', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('102', 'Combivent Nebulizer', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('103', 'Contiflo-OD', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('104', 'Cosatrim', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('105', 'Co-trimaxazole', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('106', 'CPZ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('107', 'Cusicrom ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('108', 'Cyclopam', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('109', 'Daboral', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('110', 'Daktarin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('111', 'Dalacin C ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('112', 'Deanxit ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('113', 'Depo-Medrl inj', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('114', 'Dermazine ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('115', 'Desefin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('116', 'Dexamethasone inj', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('117', 'Dextose 10%', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('118', 'Dextose 5%', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('119', 'Dextose 50%', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('120', 'DF 118', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('121', 'Diazepam', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('122', 'Diclo-Denk', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('123', 'Diclofenac ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('124', 'Diclomol SR', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('125', 'Digoxin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('126', 'Dobesil', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('127', 'Dobutamie', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('128', 'Doloact MR', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('129', 'Donecept', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('130', 'Dopamine', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('131', 'Dormicum inj', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('132', 'Doxycyclin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('133', 'Drox', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('134', 'Dulcolax', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('135', 'Duo-Cotecxin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('136', 'Duodart', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('137', 'Duphaston ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('138', 'Duspatalin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('139', 'Emanzenn Forte', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('140', 'Emitino', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('141', 'Enalapril', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('142', 'Encorate Chrono ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('143', 'Enema', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('144', 'Enervit', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('145', 'Entamizole', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('146', 'Enzoflam', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('147', 'Epanutin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('148', 'Epanutin inj', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('149', 'Ephedrine', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('150', 'Ephedrine Adult', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('151', 'Epibalin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('152', 'Esclam', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('153', 'Esomeprazole inj', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('154', 'Esose ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('155', 'Estovon', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('156', 'Exavate MF', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('157', 'Fastum gel', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('158', 'Femplan', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('159', 'Flagyl ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('160', 'Flamox', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('161', 'Flexilor 8', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('162', 'Floranorm', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('163', 'Floxapen', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('164', 'Flucloxacillin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('165', 'Fluconacole ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('166', 'Flunil-20', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('167', 'Freelet', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('168', 'Frusemide', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('169', 'Gabbroral', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('170', 'Gacet', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('171', 'Galvus Met', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('172', 'Gaviscon', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('173', 'Gentamycin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('174', 'Glevonix', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('175', 'Glucomet', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('176', 'Glucophage', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('177', 'Glucored Forte', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('178', 'Grabacin  Pdr', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('179', 'Grabacin -3', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('180', 'Gramocef-O', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('181', 'Griseofulvin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('182', 'Gyno-daktarin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('183', 'haloperidol', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('184', 'Halothane', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('185', 'HCTZ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('186', 'Hemsamic inj', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('187', 'Hidrasec ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('188', 'Hovite ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('189', 'Hycin/Buscopan', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('190', 'Hydrine', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('191', 'Hydrocortisone inj', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('192', 'Hyper saline 30%', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('193', 'Ilapraz', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('194', 'Imdur', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('195', 'Inno-Mero', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('196', 'inno-pime', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('197', 'Ivysine', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('198', 'Ketamine', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('199', 'Ketolac 0.5% ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('200', 'Klacid', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('201', 'Kontabs', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('202', 'K-Y Jelly', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('203', 'Lactulose', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('204', 'Lasix', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('205', 'Letrozol', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('206', 'Levobact', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('207', 'Lexotanil ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('208', 'Lignocain', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('209', 'Lignocain & Adrenaline', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('210', 'Linex', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('211', 'Lipitas', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('212', 'Liquid Parafin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('213', 'Loperamide', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('214', 'Lorhistina ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('215', 'Losartan H', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('216', 'Losartan INTAS', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('217', 'Lyser-D', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('218', 'Lysine Asa inj', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('219', 'Magnesium Sulphate 50%', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('220', 'Marcain 0.5% heavy', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('221', 'Mask', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('222', 'Maxidex 0.1%', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('223', 'Maxtrol ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('224', 'Mediven-S', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('225', 'Medrol', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('226', 'Meftal Forte', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('227', 'Melmet SR ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('228', 'Merocain Lozenges', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('229', 'Methotraxate', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('230', 'Metoz', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('231', 'Metronidazole ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('232', 'Metronidazole(flagyl) ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('233', 'Microenema', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('234', 'Micropime', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('235', 'Mixtard', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('236', 'Modicate', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('237', 'Momecort', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('238', 'Morphine ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('239', 'Motilium', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('240', 'Moza-5', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('241', 'Mucosolvan ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('242', 'Muvera', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('243', 'Myospaz/Myolgin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('244', 'Nasivion-s', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('245', 'Nebilet', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('246', 'Nebilong', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('247', 'Neopeptine', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('248', 'Neorelax-A', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('249', 'Neurocare Plus', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('250', 'Neuro-forte', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('251', 'Neurorubine  forte', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('252', 'Neurotrol', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('253', 'Nifedi-Denk', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('254', 'Nitrofurantoin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('255', 'Nitromin Spray', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('256', 'Nogluc', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('257', 'Norash', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('258', 'Normal saline', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('259', 'Nosic', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('260', 'No-spa', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('261', 'Nospalgin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('262', 'Novomix-30  insulin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('263', 'Nystatin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('264', 'One Gaba', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('265', 'Osteocerin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('266', 'Oxinus', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('267', 'Oxybral SR', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('268', 'Pabrinex I & II', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('269', 'P-Alaxin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('270', 'Pancuronium', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('271', 'Pdn(Cosmos)', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('272', 'Pdn(loose)', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('273', 'Pen V', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('274', 'Perfalgan', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('275', 'Pethadine', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('276', 'Pethidine', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('277', 'Phenobarbitone', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('278', 'Pioday', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('279', 'Piriton', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('280', 'Plasil', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('281', 'Postinor', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('282', 'Potassium Chloride 15%', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('283', 'Pozineg', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('284', 'Praziquantel', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('285', 'Predsol', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('286', 'Predsol forte', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('287', 'Pregnacare', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('288', 'Pregnasafe', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('289', 'Primolut N', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('290', 'Probeta-N', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('291', 'Proguanil', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('292', 'Proloc -D', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('293', 'Promethazine', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('294', 'Propranolol', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('295', 'Prosan ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('296', 'Pylotrip kit', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('297', 'Quinine Hcl', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('298', 'Quinine Sulphate', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('299', 'Ranferon', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('300', 'Refresh Tears', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('301', 'Rheuma -denk', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('302', 'Rhinathiol Infants', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('303', 'Rhinocort Aqua', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('304', 'Rhizin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('305', 'Rifampicin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('306', 'Ringers Lactate', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('307', 'Rivotril', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('308', 'Rocephine', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('309', 'Roxine', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('310', 'Safcal', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('311', 'Saferon', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('312', 'Saferon Plus', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('313', 'Salbutamol ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('314', 'Satrogyl', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('315', 'Senakot', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('316', 'Senna', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('317', 'Seretide ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('318', 'Silver Sulphadiazine', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('319', 'Silverex', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('320', 'Sinemet', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('321', 'Sitagen', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('322', 'Spirolac ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('323', 'Stugeron', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('324', 'Sucrafil O gel', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('325', 'Susten', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('326', 'Suxamethonium', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('327', 'Sylate', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('328', 'Symbicort', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('329', 'Syscan', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('330', 'T.E.O', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('331', 'Tegera forte', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('332', 'Tegretol', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('333', 'Tegretol CR', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('334', 'Terbex', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('335', 'Terbutalin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('336', 'Tetanus Toxoid', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('337', 'Tofen', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('338', 'Tramacetal', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('339', 'Tramadol', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('340', 'Tres Orix Forte ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('341', 'Trimetabol', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('342', 'Trinocort', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('343', 'Triokit', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('344', 'Unicontin CR', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('345', 'Unistein-HC', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('346', 'Univir', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('347', 'V Wash', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('348', 'Valium', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('349', 'Vastarel MR', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('350', 'Vazkor', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('351', 'Vedrox', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('352', 'Venofer', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('353', 'Ventolin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('354', 'Ventolin ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('355', 'Ventolin Evh Inhaler', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('356', 'Virux', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('357', 'Vitamin D3', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('358', 'Vitamin k inj', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('359', 'Volin Gel', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('360', 'Vomitin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('361', 'Warfarin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('362', 'Water for Inj', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('363', 'Xatral', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('364', 'Xenadine', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('365', 'X-Pen', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('366', 'Yasmin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('367', 'Yescort', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('368', 'Zaart', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('369', 'Zedical-OP Plus', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('370', 'Zentel ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('371', 'Zinc Sulphate', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('372', 'Zincat-OD', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('373', 'Zinnat ', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('374', 'Zithromax', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('375', 'Zulu', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('431', 'Novomix-30  insulin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('432', 'Grabacin  Pdr', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('433', 'Neurorubine  forte', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('434', 'Novomix-30  insulin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('435', 'Grabacin  Pdr', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('436', 'Neurorubine  forte', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('437', 'Novomix-30  insulin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('438', 'Grabacin  Pdr', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('439', 'Neurorubine  forte', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('440', 'Novomix-30  insulin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('441', 'Grabacin  Pdr', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('442', 'Neurorubine  forte', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('443', 'paracetamol', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('444', 'Claritek', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('445', 'Airtal', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('446', 'Rexidine', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('447', 'Plactinic', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('448', 'Cartil Omega', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('449', 'Flugone', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('450', 'Relcer', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('451', 'Glencet', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('452', 'Foralin', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('453', 'Ebastel', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('454', 'Gabica', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('455', 'Artesun', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('456', 'ORS', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('457', 'Vitamin C', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('458', 'Folic', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('459', 'Izra', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('460', 'Gen-levo', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('461', 'pyridoxine', '0', null, null, null, null);
INSERT INTO `brand` VALUES ('462', 'Frusemide (COSMOS)', '0', null, null, null, null);

-- ----------------------------
-- Table structure for `cancel_action`
-- ----------------------------
DROP TABLE IF EXISTS `cancel_action`;
CREATE TABLE `cancel_action` (
  `cancel_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `cancel_action_name` varchar(100) DEFAULT NULL,
  `cancel_action_status` tinyint(1) DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`cancel_action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cancel_action
-- ----------------------------
INSERT INTO `cancel_action` VALUES ('1', 'Refund', '1', null, null, '2015-10-06 18:17:03', null);
INSERT INTO `cancel_action` VALUES ('2', 'Cancel', '1', null, null, '2015-10-06 18:17:30', null);

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) NOT NULL,
  `category_price` int(11) DEFAULT NULL,
  `category_status` int(11) NOT NULL DEFAULT '1',
  `category_image_name` varchar(50) NOT NULL,
  `category_preffix` varchar(11) NOT NULL,
  `category_parent` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `branch_code` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'Stationary', null, '1', '', '', '0', '2015-10-11 12:56:29', '2015-10-11 13:56:05', '0', '0', 'OSH');
INSERT INTO `category` VALUES ('2', 'Drug', null, '1', '', '', '0', '2015-10-11 12:56:54', '2015-10-11 13:56:30', '0', '0', 'OSH');
INSERT INTO `category` VALUES ('3', 'Consumable', null, '1', '', '', null, '0000-00-00 00:00:00', '2015-10-18 13:29:04', '0', '0', null);

-- ----------------------------
-- Table structure for `cat_items`
-- ----------------------------
DROP TABLE IF EXISTS `cat_items`;
CREATE TABLE `cat_items` (
  `cat_items_id` int(11) NOT NULL AUTO_INCREMENT,
  `mec_id` int(11) NOT NULL,
  `item_format_id` int(11) NOT NULL,
  `cat_item_name` varchar(500) NOT NULL,
  PRIMARY KEY (`cat_items_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cat_items
-- ----------------------------
INSERT INTO `cat_items` VALUES ('1', '4', '1', 'Gastrotestinal');
INSERT INTO `cat_items` VALUES ('2', '4', '1', 'Respiratory');
INSERT INTO `cat_items` VALUES ('3', '4', '1', 'Genitourinary');
INSERT INTO `cat_items` VALUES ('4', '4', '1', 'Nervous');
INSERT INTO `cat_items` VALUES ('5', '5', '7', 'State of Nourishment');
INSERT INTO `cat_items` VALUES ('6', '5', '1', 'Skin Adnexia');
INSERT INTO `cat_items` VALUES ('7', '5', '2', 'Anaemia');
INSERT INTO `cat_items` VALUES ('8', '5', '2', 'Oedema');
INSERT INTO `cat_items` VALUES ('9', '5', '2', 'Jaundice');
INSERT INTO `cat_items` VALUES ('10', '5', '2', 'Lymphadenopathy');
INSERT INTO `cat_items` VALUES ('11', '6', '6', 'Shape and Diameter');
INSERT INTO `cat_items` VALUES ('12', '6', '6', 'Eyes (including Vision)');
INSERT INTO `cat_items` VALUES ('13', '6', '6', 'Nose');
INSERT INTO `cat_items` VALUES ('14', '6', '6', 'Ears');
INSERT INTO `cat_items` VALUES ('15', '6', '6', 'Mouth');
INSERT INTO `cat_items` VALUES ('16', '6', '6', 'Throat');
INSERT INTO `cat_items` VALUES ('17', '7', '4', 'Neck');
INSERT INTO `cat_items` VALUES ('19', '8', '5', 'Deformities');
INSERT INTO `cat_items` VALUES ('20', '8', '5', 'Cardiomegaly');
INSERT INTO `cat_items` VALUES ('21', '8', '5', 'IPV');
INSERT INTO `cat_items` VALUES ('22', '8', '5', 'Murmurs 1st Sounds');
INSERT INTO `cat_items` VALUES ('23', '8', '5', 'Murmurs 2st Sounds');
INSERT INTO `cat_items` VALUES ('24', '9', '5', 'Deformities');
INSERT INTO `cat_items` VALUES ('25', '9', '5', 'Expansion');
INSERT INTO `cat_items` VALUES ('26', '9', '5', 'Base excursion');
INSERT INTO `cat_items` VALUES ('27', '9', '5', 'Vocal Tremitus');
INSERT INTO `cat_items` VALUES ('28', '9', '5', 'Auscilation');
INSERT INTO `cat_items` VALUES ('29', '10', '5', 'Distension');
INSERT INTO `cat_items` VALUES ('30', '10', '5', 'Masses');
INSERT INTO `cat_items` VALUES ('31', '10', '5', 'Hepatomegaly');
INSERT INTO `cat_items` VALUES ('32', '10', '5', 'Splenomegaly');
INSERT INTO `cat_items` VALUES ('33', '10', '5', 'Tenderness');
INSERT INTO `cat_items` VALUES ('34', '10', '5', 'Ingunal rings');
INSERT INTO `cat_items` VALUES ('35', '10', '5', 'Genitals');
INSERT INTO `cat_items` VALUES ('36', '12', '6', 'Muscle Power');
INSERT INTO `cat_items` VALUES ('37', '12', '6', 'Reflexes(Biceps, Triceps,Abdominal)');
INSERT INTO `cat_items` VALUES ('38', '12', '6', 'Romberg Test');
INSERT INTO `cat_items` VALUES ('39', '12', '6', 'Gait');
INSERT INTO `cat_items` VALUES ('40', '12', '6', 'Co-ordinatoion');
INSERT INTO `cat_items` VALUES ('41', '12', '6', 'Sensitivity');
INSERT INTO `cat_items` VALUES ('42', '4', '1', 'Cardiovascular');

-- ----------------------------
-- Table structure for `civilstatus`
-- ----------------------------
DROP TABLE IF EXISTS `civilstatus`;
CREATE TABLE `civilstatus` (
  `civilstatus_id` int(11) NOT NULL AUTO_INCREMENT,
  `civilstatus_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`civilstatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of civilstatus
-- ----------------------------

-- ----------------------------
-- Table structure for `civil_status`
-- ----------------------------
DROP TABLE IF EXISTS `civil_status`;
CREATE TABLE `civil_status` (
  `civil_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `civil_status_name` varchar(20) NOT NULL,
  PRIMARY KEY (`civil_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of civil_status
-- ----------------------------
INSERT INTO `civil_status` VALUES ('1', 'Single');
INSERT INTO `civil_status` VALUES ('2', 'Married');
INSERT INTO `civil_status` VALUES ('3', 'Divorced');
INSERT INTO `civil_status` VALUES ('4', 'Widowed');

-- ----------------------------
-- Table structure for `civil_status_copy`
-- ----------------------------
DROP TABLE IF EXISTS `civil_status_copy`;
CREATE TABLE `civil_status_copy` (
  `civil_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `civil_status_name` varchar(20) NOT NULL,
  PRIMARY KEY (`civil_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of civil_status_copy
-- ----------------------------
INSERT INTO `civil_status_copy` VALUES ('1', 'Single');
INSERT INTO `civil_status_copy` VALUES ('2', 'Married');
INSERT INTO `civil_status_copy` VALUES ('3', 'Divorced');
INSERT INTO `civil_status_copy` VALUES ('4', 'Widowed');

-- ----------------------------
-- Table structure for `ci_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ci_sessions
-- ----------------------------
INSERT INTO `ci_sessions` VALUES ('240313e2ef68b1a3ad589eadab47e379', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0', '1459936284', 'a:11:{s:9:\"user_data\";s:0:\"\";s:12:\"login_status\";b:1;s:10:\"first_name\";s:6:\"Alvaro\";s:11:\"other_names\";s:6:\"Alvaro\";s:8:\"username\";s:8:\"amasitsa\";s:17:\"personnel_type_id\";s:1:\"2\";s:12:\"personnel_id\";i:0;s:11:\"branch_code\";s:3:\"SSL\";s:11:\"branch_name\";s:5:\"Omnis\";s:16:\"personnel_number\";s:2:\"00\";s:9:\"branch_id\";i:2;}');
INSERT INTO `ci_sessions` VALUES ('3eb3d60dcb76955ef1bf46d2261786db', '196.202.161.122', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36', '1459749330', '');
INSERT INTO `ci_sessions` VALUES ('66fd8bf31b7d3891e232eff726244670', '196.202.161.122', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36', '1459749504', 'a:12:{s:9:\"user_data\";s:0:\"\";s:12:\"login_status\";b:1;s:10:\"first_name\";s:7:\"Barbara\";s:11:\"other_names\";s:15:\"Wanjiku Gitonga\";s:8:\"username\";s:7:\"Barbara\";s:12:\"personnel_id\";s:1:\"4\";s:9:\"branch_id\";s:1:\"2\";s:11:\"branch_code\";s:3:\"SSL\";s:16:\"personnel_number\";s:6:\"110220\";s:11:\"branch_name\";s:25:\"Serenity Services Limited\";s:25:\"authorize_invoice_changes\";s:1:\"0\";s:17:\"personnel_type_id\";s:1:\"1\";}');
INSERT INTO `ci_sessions` VALUES ('8f28b2ae2414cf753099da3c63babd87', '196.202.161.122', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36', '1459749847', 'a:14:{s:9:\"user_data\";s:0:\"\";s:12:\"login_status\";b:1;s:10:\"first_name\";s:7:\"Barbara\";s:11:\"other_names\";s:15:\"Wanjiku Gitonga\";s:8:\"username\";s:7:\"Barbara\";s:12:\"personnel_id\";s:1:\"4\";s:9:\"branch_id\";s:1:\"2\";s:11:\"branch_code\";s:3:\"SSL\";s:16:\"personnel_number\";s:6:\"110220\";s:11:\"branch_name\";s:25:\"Serenity Services Limited\";s:25:\"authorize_invoice_changes\";s:1:\"0\";s:17:\"personnel_type_id\";s:1:\"1\";s:14:\"payroll_search\";s:59:\" AND payroll.payroll_year = \'2016\' AND payroll.month_id = 3\";s:20:\"payroll_search_title\";s:19:\" Payroll for 3/2016\";}');
INSERT INTO `ci_sessions` VALUES ('cf7f6701f23ced9b4037d5eb871e0249', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0', '1459933094', 'a:11:{s:9:\"user_data\";s:0:\"\";s:12:\"login_status\";b:1;s:10:\"first_name\";s:6:\"Alvaro\";s:11:\"other_names\";s:6:\"Alvaro\";s:8:\"username\";s:8:\"amasitsa\";s:17:\"personnel_type_id\";s:1:\"2\";s:12:\"personnel_id\";i:0;s:11:\"branch_code\";s:3:\"SSL\";s:11:\"branch_name\";s:5:\"Omnis\";s:16:\"personnel_number\";s:2:\"00\";s:9:\"branch_id\";i:2;}');
INSERT INTO `ci_sessions` VALUES ('ddbec69a2b7ab2b844b21377b5ffc200', '196.202.161.122', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36', '1459749520', '');

-- ----------------------------
-- Table structure for `companies`
-- ----------------------------
DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `companies_id` int(11) NOT NULL AUTO_INCREMENT,
  `companies_name` varchar(255) NOT NULL,
  `companies_email` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`companies_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of companies
-- ----------------------------
INSERT INTO `companies` VALUES ('1', 'Total', 'tottalbychoice', '1');
INSERT INTO `companies` VALUES ('2', 'Mavji', 'info@mavji.com', '0');
INSERT INTO `companies` VALUES ('3', '', '', '0');
INSERT INTO `companies` VALUES ('4', 'Madison', 'info@madison.co.ke', '0');

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(20) NOT NULL,
  `company_contact_person_name` varchar(50) DEFAULT NULL,
  `company_contact_person_phone1` varchar(20) DEFAULT NULL,
  `company_contact_person_phone2` varchar(20) DEFAULT NULL,
  `company_contact_person_email1` varchar(30) DEFAULT NULL,
  `company_contact_person_email2` varchar(30) DEFAULT NULL,
  `company_description` text,
  `company_status` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of company
-- ----------------------------

-- ----------------------------
-- Table structure for `company_insuarance`
-- ----------------------------
DROP TABLE IF EXISTS `company_insuarance`;
CREATE TABLE `company_insuarance` (
  `company_insurance_id` int(11) NOT NULL AUTO_INCREMENT,
  `companies_id` int(11) NOT NULL,
  `insurance_company_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `insurance_company_name` varchar(100) NOT NULL,
  PRIMARY KEY (`company_insurance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of company_insuarance
-- ----------------------------
INSERT INTO `company_insuarance` VALUES ('1', '1', '1', '0', '', 'UAP');
INSERT INTO `company_insuarance` VALUES ('2', '1', '2', '0', '', 'Clarkson');
INSERT INTO `company_insuarance` VALUES ('3', '4', '2', '0', '', 'Clarkson');

-- ----------------------------
-- Table structure for `compounding_period`
-- ----------------------------
DROP TABLE IF EXISTS `compounding_period`;
CREATE TABLE `compounding_period` (
  `compounding_period_id` int(11) NOT NULL AUTO_INCREMENT,
  `compounding_period_name` varchar(50) NOT NULL,
  `compounding_period_no` int(1) NOT NULL,
  PRIMARY KEY (`compounding_period_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of compounding_period
-- ----------------------------
INSERT INTO `compounding_period` VALUES ('1', 'Daily', '365');
INSERT INTO `compounding_period` VALUES ('2', 'Monthly', '12');
INSERT INTO `compounding_period` VALUES ('3', 'Quaterly', '4');
INSERT INTO `compounding_period` VALUES ('4', 'Semi annually', '2');
INSERT INTO `compounding_period` VALUES ('5', 'Annually', '1');

-- ----------------------------
-- Table structure for `configuration`
-- ----------------------------
DROP TABLE IF EXISTS `configuration`;
CREATE TABLE `configuration` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `mandrill` varchar(100) DEFAULT NULL,
  `sms_key` varchar(100) DEFAULT NULL,
  `sms_user` varchar(100) NOT NULL,
  `facebook_api` varchar(100) DEFAULT NULL,
  `facebook_secret` varchar(100) DEFAULT NULL,
  `number_of_leave_days` int(3) DEFAULT '21',
  PRIMARY KEY (`configuration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of configuration
-- ----------------------------
INSERT INTO `configuration` VALUES ('1', 'lXh-1_wB5LGagH6TJniOSQ', '1f61510514421213f9566191a15caa94f3d930305c99dae2624dfb06ef54b703', 'alviem', null, null, '21');

-- ----------------------------
-- Table structure for `contacts`
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `contacts_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `post_code` varchar(100) DEFAULT NULL,
  `building` varchar(100) NOT NULL,
  `facebook` varchar(100) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `logo` varchar(200) NOT NULL,
  `motto` varchar(200) NOT NULL,
  `pintrest` varchar(200) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `floor` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `working_weekday` varchar(100) DEFAULT NULL,
  `working_weekend` varchar(100) DEFAULT NULL,
  `mission` text,
  `vision` text,
  `thumb` varchar(100) NOT NULL,
  `twitter` varchar(100) NOT NULL,
  `about` text,
  `objectives` text,
  `core_values` text,
  `site_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`contacts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of contacts
-- ----------------------------
INSERT INTO `contacts` VALUES ('1', 'info@serenity.com', '020123456', '12345', '11200', '', 'https://www.facebook.com/dobi', 'Serenity', '59475fac8395d199428e32693cd98218.jpg', '0', '', 'Nairobi', '', 'Hurlingam', '', '', 'We aim to create an online market place where buyers of spare parts can easily find their needs, compare products and get a quick link to the seller of the spare parts they require<br>', 'Our vision is to have an e Commerce platform for vehicle spare parts<br>', 'thumbnail_59475fac8395d199428e32693cd98218.jpg', '', '<span >An online marketplace that links buyers and sellers of automotive parts. Sellers can post parts and buyers can search/filter parts which they are seeking.</span>', '<br>', '<br>', 'Autospares.co.ke');

-- ----------------------------
-- Table structure for `container_type`
-- ----------------------------
DROP TABLE IF EXISTS `container_type`;
CREATE TABLE `container_type` (
  `container_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `container_type_name` varchar(50) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `container_type_delete` int(11) DEFAULT '0',
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_on` date DEFAULT NULL,
  PRIMARY KEY (`container_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of container_type
-- ----------------------------
INSERT INTO `container_type` VALUES ('1', 'Box', null, null, '0', null, null);
INSERT INTO `container_type` VALUES ('2', 'Packet', null, null, '0', null, null);
INSERT INTO `container_type` VALUES ('3', 'Tube', null, null, '0', null, null);
INSERT INTO `container_type` VALUES ('4', 'Bottle', null, null, '0', null, null);
INSERT INTO `container_type` VALUES ('6', 'satchet', null, null, '0', null, null);

-- ----------------------------
-- Table structure for `creditor`
-- ----------------------------
DROP TABLE IF EXISTS `creditor`;
CREATE TABLE `creditor` (
  `creditor_id` int(11) NOT NULL AUTO_INCREMENT,
  `creditor_name` varchar(255) NOT NULL,
  `creditor_email` varchar(255) NOT NULL,
  `creditor_phone` varchar(255) NOT NULL,
  `creditor_location` varchar(100) NOT NULL,
  `creditor_contact_person_name` varchar(255) NOT NULL,
  `creditor_contact` varchar(255) NOT NULL,
  `creditor_status` tinyint(1) NOT NULL DEFAULT '0',
  `creditor_contact_person_onames` varchar(50) DEFAULT NULL,
  `creditor_contact_person_phone1` varchar(255) DEFAULT NULL,
  `creditor_contact_person_phone2` varchar(255) DEFAULT NULL,
  `creditor_contact_person_email` varchar(255) DEFAULT NULL,
  `creditor_description` text,
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `branch_code` varchar(10) DEFAULT NULL,
  `creditor_building` varchar(100) DEFAULT NULL,
  `creditor_floor` varchar(100) DEFAULT NULL,
  `creditor_address` varchar(100) DEFAULT NULL,
  `creditor_post_code` varchar(50) DEFAULT NULL,
  `creditor_city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`creditor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of creditor
-- ----------------------------
INSERT INTO `creditor` VALUES ('2', 'Nakumatt Ltd', '', '', '', '', '', '0', '', '0', '0', '', '', '0', '2015-11-11 18:28:25', '0', '2015-11-11 20:28:25', 'OSH', '', '', '', '', '');
INSERT INTO `creditor` VALUES ('3', 'Naivas', 'nssshq@naivas.co.ke', '', 'Kisii', '', '', '0', '', '0', '0', '', 'Kitchen, Administration', '0', '2015-11-11 18:55:53', '0', '2015-11-11 20:55:53', 'OSH', '', '', '61600', '00200', 'Nairobi');

-- ----------------------------
-- Table structure for `creditor_account`
-- ----------------------------
DROP TABLE IF EXISTS `creditor_account`;
CREATE TABLE `creditor_account` (
  `creditor_account_id` int(11) NOT NULL AUTO_INCREMENT,
  `creditor_account_description` text,
  `creditor_account_amount` double DEFAULT NULL,
  `creditor_account_date` date DEFAULT NULL,
  `creditor_account_status` tinyint(1) DEFAULT '1',
  `creditor_id` int(11) DEFAULT NULL,
  `transaction_type_id` tinyint(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`creditor_account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of creditor_account
-- ----------------------------
INSERT INTO `creditor_account` VALUES ('2', 'Purchase of items invoice no. 14401100007852', '29864', '2015-09-17', '1', '3', '2', '2015-11-11 19:03:28', '14', '2015-11-11 21:18:01', '14');
INSERT INTO `creditor_account` VALUES ('3', 'Balance b/f as at 31/08/2015', '199929', '2015-09-15', '1', '3', '2', '2015-11-11 19:06:03', '14', '2015-11-11 21:18:01', '14');
INSERT INTO `creditor_account` VALUES ('4', 'Cheque deposit', '100560', '2015-09-16', '1', '3', '1', '2015-11-11 19:07:01', '14', '2015-11-11 21:18:01', '14');

-- ----------------------------
-- Table structure for `custom_invoice`
-- ----------------------------
DROP TABLE IF EXISTS `custom_invoice`;
CREATE TABLE `custom_invoice` (
  `custom_invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_invoice_created` datetime NOT NULL,
  `custom_invoice_created_by` int(11) NOT NULL,
  `custom_invoice_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `custom_invoice_modified_by` int(11) NOT NULL,
  `custom_invoice_number` varchar(100) NOT NULL,
  `custom_invoice_status` tinyint(4) NOT NULL DEFAULT '0',
  `custom_invoice_debtor` varchar(50) NOT NULL,
  `custom_invoice_debtor_contacts` text,
  `payable_by` date NOT NULL,
  PRIMARY KEY (`custom_invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of custom_invoice
-- ----------------------------
INSERT INTO `custom_invoice` VALUES ('1', '2015-04-27 14:05:52', '85', '2015-04-27 17:05:28', '85', 'CINV15/000001', '0', 'SU', '0774834466', '0000-00-00');
INSERT INTO `custom_invoice` VALUES ('2', '2015-04-27 15:45:39', '85', '2015-04-27 18:45:15', '85', 'CINV15/000002', '0', 'Justine', '7890', '2015-05-27');
INSERT INTO `custom_invoice` VALUES ('3', '2015-04-27 16:05:37', '85', '2015-04-27 19:05:13', '85', 'CINV15/000003', '0', 'STRATHMORE UNIVERSITY', '', '2015-05-27');

-- ----------------------------
-- Table structure for `custom_invoice_item`
-- ----------------------------
DROP TABLE IF EXISTS `custom_invoice_item`;
CREATE TABLE `custom_invoice_item` (
  `custom_invoice_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_invoice_item_description` text NOT NULL,
  `custom_invoice_item_cost` int(11) NOT NULL,
  `custom_invoice_item_quantity` int(11) NOT NULL,
  `custom_invoice_id` int(11) NOT NULL,
  `custom_invoice_item_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`custom_invoice_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of custom_invoice_item
-- ----------------------------
INSERT INTO `custom_invoice_item` VALUES ('1', 'Health', '20000', '1', '1', '1');
INSERT INTO `custom_invoice_item` VALUES ('2', 'Something', '2', '1', '1', '0');
INSERT INTO `custom_invoice_item` VALUES ('3', 'heiue', '200', '2', '1', '0');
INSERT INTO `custom_invoice_item` VALUES ('4', 'First', '4000', '3', '2', '1');
INSERT INTO `custom_invoice_item` VALUES ('5', 'SCREENING OF STUDENTS AND STAFF FOR FOOD POISONING', '120000', '1', '3', '1');

-- ----------------------------
-- Table structure for `debtor_invoice`
-- ----------------------------
DROP TABLE IF EXISTS `debtor_invoice`;
CREATE TABLE `debtor_invoice` (
  `debtor_invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `debtor_invoice_created` datetime NOT NULL,
  `debtor_invoice_created_by` int(11) NOT NULL,
  `batch_no` varchar(100) NOT NULL,
  `debtor_invoice_last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `debtor_invoice_modified_by` int(11) NOT NULL,
  `debtor_invoice_status` tinyint(1) NOT NULL DEFAULT '0',
  `visit_type_id` int(11) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  PRIMARY KEY (`debtor_invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of debtor_invoice
-- ----------------------------
INSERT INTO `debtor_invoice` VALUES ('1', '2015-11-09 13:41:29', '0', 'OSH-15-000001', '2015-11-09 15:41:29', '0', '0', '6', '2015-10-01', '2015-10-31');
INSERT INTO `debtor_invoice` VALUES ('2', '2015-11-10 09:36:52', '3', 'OSH-15-000002', '2015-11-10 11:36:52', '3', '0', '6', '2015-11-01', '2015-11-07');
INSERT INTO `debtor_invoice` VALUES ('5', '2015-11-17 15:35:06', '0', 'OSH-15-000003', '2015-11-17 17:35:06', '0', '0', '6', '2015-11-08', '2015-11-15');
INSERT INTO `debtor_invoice` VALUES ('6', '2015-11-17 18:34:00', '14', 'OSH-15-000004', '2015-11-17 20:34:00', '14', '0', '6', '2015-11-08', '2015-11-16');

-- ----------------------------
-- Table structure for `debtor_invoice_item`
-- ----------------------------
DROP TABLE IF EXISTS `debtor_invoice_item`;
CREATE TABLE `debtor_invoice_item` (
  `debtor_invoice_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `debtor_invoice_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `debtor_invoice_item_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`debtor_invoice_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of debtor_invoice_item
-- ----------------------------
INSERT INTO `debtor_invoice_item` VALUES ('1', '1', '50', '0');
INSERT INTO `debtor_invoice_item` VALUES ('2', '1', '79', '0');
INSERT INTO `debtor_invoice_item` VALUES ('3', '1', '91', '0');
INSERT INTO `debtor_invoice_item` VALUES ('4', '1', '92', '0');
INSERT INTO `debtor_invoice_item` VALUES ('5', '1', '107', '0');
INSERT INTO `debtor_invoice_item` VALUES ('6', '1', '113', '0');
INSERT INTO `debtor_invoice_item` VALUES ('7', '1', '121', '0');
INSERT INTO `debtor_invoice_item` VALUES ('8', '1', '124', '0');
INSERT INTO `debtor_invoice_item` VALUES ('9', '1', '136', '0');
INSERT INTO `debtor_invoice_item` VALUES ('10', '1', '153', '0');
INSERT INTO `debtor_invoice_item` VALUES ('11', '1', '154', '0');
INSERT INTO `debtor_invoice_item` VALUES ('12', '1', '165', '0');
INSERT INTO `debtor_invoice_item` VALUES ('13', '1', '166', '0');
INSERT INTO `debtor_invoice_item` VALUES ('14', '1', '167', '0');
INSERT INTO `debtor_invoice_item` VALUES ('15', '1', '173', '0');
INSERT INTO `debtor_invoice_item` VALUES ('16', '1', '174', '0');
INSERT INTO `debtor_invoice_item` VALUES ('17', '1', '200', '0');
INSERT INTO `debtor_invoice_item` VALUES ('18', '1', '203', '0');
INSERT INTO `debtor_invoice_item` VALUES ('19', '1', '210', '0');
INSERT INTO `debtor_invoice_item` VALUES ('20', '1', '211', '0');
INSERT INTO `debtor_invoice_item` VALUES ('21', '1', '212', '0');
INSERT INTO `debtor_invoice_item` VALUES ('22', '1', '213', '0');
INSERT INTO `debtor_invoice_item` VALUES ('23', '1', '214', '0');
INSERT INTO `debtor_invoice_item` VALUES ('24', '1', '257', '0');
INSERT INTO `debtor_invoice_item` VALUES ('25', '1', '262', '0');
INSERT INTO `debtor_invoice_item` VALUES ('26', '1', '265', '0');
INSERT INTO `debtor_invoice_item` VALUES ('27', '1', '266', '0');
INSERT INTO `debtor_invoice_item` VALUES ('28', '1', '267', '0');
INSERT INTO `debtor_invoice_item` VALUES ('29', '1', '268', '0');
INSERT INTO `debtor_invoice_item` VALUES ('30', '1', '280', '0');
INSERT INTO `debtor_invoice_item` VALUES ('31', '1', '282', '0');
INSERT INTO `debtor_invoice_item` VALUES ('32', '1', '283', '0');
INSERT INTO `debtor_invoice_item` VALUES ('33', '1', '299', '0');
INSERT INTO `debtor_invoice_item` VALUES ('34', '1', '303', '0');
INSERT INTO `debtor_invoice_item` VALUES ('35', '1', '314', '0');
INSERT INTO `debtor_invoice_item` VALUES ('36', '1', '322', '0');
INSERT INTO `debtor_invoice_item` VALUES ('37', '1', '324', '0');
INSERT INTO `debtor_invoice_item` VALUES ('38', '1', '329', '0');
INSERT INTO `debtor_invoice_item` VALUES ('39', '1', '337', '0');
INSERT INTO `debtor_invoice_item` VALUES ('40', '1', '352', '0');
INSERT INTO `debtor_invoice_item` VALUES ('41', '1', '354', '0');
INSERT INTO `debtor_invoice_item` VALUES ('42', '1', '361', '0');
INSERT INTO `debtor_invoice_item` VALUES ('43', '1', '372', '0');
INSERT INTO `debtor_invoice_item` VALUES ('44', '1', '380', '0');
INSERT INTO `debtor_invoice_item` VALUES ('45', '1', '383', '0');
INSERT INTO `debtor_invoice_item` VALUES ('46', '1', '405', '0');
INSERT INTO `debtor_invoice_item` VALUES ('47', '1', '406', '0');
INSERT INTO `debtor_invoice_item` VALUES ('48', '1', '410', '0');
INSERT INTO `debtor_invoice_item` VALUES ('49', '1', '419', '0');
INSERT INTO `debtor_invoice_item` VALUES ('50', '1', '420', '0');
INSERT INTO `debtor_invoice_item` VALUES ('51', '1', '421', '0');
INSERT INTO `debtor_invoice_item` VALUES ('52', '1', '427', '0');
INSERT INTO `debtor_invoice_item` VALUES ('53', '1', '429', '0');
INSERT INTO `debtor_invoice_item` VALUES ('54', '1', '448', '0');
INSERT INTO `debtor_invoice_item` VALUES ('55', '1', '471', '0');
INSERT INTO `debtor_invoice_item` VALUES ('56', '2', '320', '0');
INSERT INTO `debtor_invoice_item` VALUES ('57', '2', '485', '0');
INSERT INTO `debtor_invoice_item` VALUES ('58', '2', '486', '0');
INSERT INTO `debtor_invoice_item` VALUES ('59', '2', '504', '0');
INSERT INTO `debtor_invoice_item` VALUES ('60', '2', '511', '0');
INSERT INTO `debtor_invoice_item` VALUES ('61', '2', '541', '0');
INSERT INTO `debtor_invoice_item` VALUES ('62', '2', '549', '0');
INSERT INTO `debtor_invoice_item` VALUES ('63', '2', '550', '0');
INSERT INTO `debtor_invoice_item` VALUES ('64', '2', '557', '0');
INSERT INTO `debtor_invoice_item` VALUES ('65', '2', '559', '0');
INSERT INTO `debtor_invoice_item` VALUES ('66', '2', '568', '0');
INSERT INTO `debtor_invoice_item` VALUES ('111', '5', '617', '0');
INSERT INTO `debtor_invoice_item` VALUES ('112', '5', '625', '0');
INSERT INTO `debtor_invoice_item` VALUES ('113', '5', '636', '0');
INSERT INTO `debtor_invoice_item` VALUES ('114', '5', '655', '0');
INSERT INTO `debtor_invoice_item` VALUES ('115', '5', '656', '0');
INSERT INTO `debtor_invoice_item` VALUES ('116', '5', '663', '0');
INSERT INTO `debtor_invoice_item` VALUES ('117', '5', '670', '0');
INSERT INTO `debtor_invoice_item` VALUES ('118', '5', '672', '0');
INSERT INTO `debtor_invoice_item` VALUES ('119', '5', '690', '0');
INSERT INTO `debtor_invoice_item` VALUES ('120', '5', '694', '0');
INSERT INTO `debtor_invoice_item` VALUES ('121', '5', '697', '0');
INSERT INTO `debtor_invoice_item` VALUES ('122', '5', '701', '0');
INSERT INTO `debtor_invoice_item` VALUES ('123', '5', '702', '0');
INSERT INTO `debtor_invoice_item` VALUES ('124', '5', '721', '0');
INSERT INTO `debtor_invoice_item` VALUES ('125', '6', '617', '1');
INSERT INTO `debtor_invoice_item` VALUES ('126', '6', '625', '0');
INSERT INTO `debtor_invoice_item` VALUES ('127', '6', '636', '0');
INSERT INTO `debtor_invoice_item` VALUES ('128', '6', '655', '0');
INSERT INTO `debtor_invoice_item` VALUES ('129', '6', '656', '0');
INSERT INTO `debtor_invoice_item` VALUES ('130', '6', '663', '0');
INSERT INTO `debtor_invoice_item` VALUES ('131', '6', '670', '0');
INSERT INTO `debtor_invoice_item` VALUES ('132', '6', '672', '0');
INSERT INTO `debtor_invoice_item` VALUES ('133', '6', '690', '0');
INSERT INTO `debtor_invoice_item` VALUES ('134', '6', '694', '0');
INSERT INTO `debtor_invoice_item` VALUES ('135', '6', '697', '0');
INSERT INTO `debtor_invoice_item` VALUES ('136', '6', '701', '0');
INSERT INTO `debtor_invoice_item` VALUES ('137', '6', '702', '0');
INSERT INTO `debtor_invoice_item` VALUES ('138', '6', '721', '0');
INSERT INTO `debtor_invoice_item` VALUES ('139', '6', '734', '0');
INSERT INTO `debtor_invoice_item` VALUES ('140', '6', '735', '0');

-- ----------------------------
-- Table structure for `deduction`
-- ----------------------------
DROP TABLE IF EXISTS `deduction`;
CREATE TABLE `deduction` (
  `deduction_id` int(11) NOT NULL AUTO_INCREMENT,
  `deduction_name` varchar(45) DEFAULT NULL,
  `deduction_status` tinyint(1) NOT NULL DEFAULT '1',
  `deduction_abbr` varchar(10) NOT NULL,
  `deduction_taxable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`deduction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of deduction
-- ----------------------------
INSERT INTO `deduction` VALUES ('3', 'HELB', '1', 'HELB', '1');

-- ----------------------------
-- Table structure for `deduction_copy`
-- ----------------------------
DROP TABLE IF EXISTS `deduction_copy`;
CREATE TABLE `deduction_copy` (
  `deduction_id` int(11) NOT NULL AUTO_INCREMENT,
  `deduction_name` varchar(45) DEFAULT NULL,
  `deduction_status` int(11) NOT NULL DEFAULT '0',
  `deduction_abbr` varchar(10) NOT NULL,
  PRIMARY KEY (`deduction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of deduction_copy
-- ----------------------------
INSERT INTO `deduction_copy` VALUES ('1', 'NSSF', '0', 'NSSF');
INSERT INTO `deduction_copy` VALUES ('2', 'NHIF', '0', 'NHIF');
INSERT INTO `deduction_copy` VALUES ('3', 'HELB', '0', 'HELB');
INSERT INTO `deduction_copy` VALUES ('4', 'SAYE', '0', 'SAYE');
INSERT INTO `deduction_copy` VALUES ('5', 'Salary Advance', '0', 'ADV');
INSERT INTO `deduction_copy` VALUES ('6', 'SACCO', '0', 'SACCO');
INSERT INTO `deduction_copy` VALUES ('7', 'Bank Loan', '0', 'B.Loan');
INSERT INTO `deduction_copy` VALUES ('8', 'Insurance', '0', 'INS');
INSERT INTO `deduction_copy` VALUES ('9', 'Pension', '0', 'Pen');

-- ----------------------------
-- Table structure for `departments`
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `department_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(30) NOT NULL,
  `department_status` tinyint(1) DEFAULT '1',
  `visit` tinyint(1) NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  `department_parent` int(11) DEFAULT NULL,
  `branch_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES ('1', 'Administration', '1', '0', null, null, '2016-03-31 13:10:35', null, null, null);
INSERT INTO `departments` VALUES ('2', 'Accounts', '1', '0', null, null, '2016-03-31 13:10:35', null, null, null);
INSERT INTO `departments` VALUES ('3', 'Operations', '1', '0', null, null, '2016-03-31 13:10:55', null, null, null);

-- ----------------------------
-- Table structure for `education`
-- ----------------------------
DROP TABLE IF EXISTS `education`;
CREATE TABLE `education` (
  `education_id` int(11) NOT NULL AUTO_INCREMENT,
  `education_name` varchar(50) NOT NULL,
  PRIMARY KEY (`education_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of education
-- ----------------------------
INSERT INTO `education` VALUES ('1', 'Primary Level');
INSERT INTO `education` VALUES ('2', 'Secondary Level');
INSERT INTO `education` VALUES ('3', 'Tertiary Level');

-- ----------------------------
-- Table structure for `entry_type`
-- ----------------------------
DROP TABLE IF EXISTS `entry_type`;
CREATE TABLE `entry_type` (
  `entry_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`entry_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of entry_type
-- ----------------------------
INSERT INTO `entry_type` VALUES ('1', 'Cashbook');
INSERT INTO `entry_type` VALUES ('2', 'Accounts Receivable');

-- ----------------------------
-- Table structure for `excersise`
-- ----------------------------
DROP TABLE IF EXISTS `excersise`;
CREATE TABLE `excersise` (
  `excersise_id` int(11) NOT NULL AUTO_INCREMENT,
  `excersise_name` varchar(50) NOT NULL,
  PRIMARY KEY (`excersise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of excersise
-- ----------------------------
INSERT INTO `excersise` VALUES ('1', '15 minutes');
INSERT INTO `excersise` VALUES ('2', '20 minutes');
INSERT INTO `excersise` VALUES ('3', '30 minutes');
INSERT INTO `excersise` VALUES ('4', '45 minutes');
INSERT INTO `excersise` VALUES ('5', '1 hour');
INSERT INTO `excersise` VALUES ('7', 'None');

-- ----------------------------
-- Table structure for `excersise_duration`
-- ----------------------------
DROP TABLE IF EXISTS `excersise_duration`;
CREATE TABLE `excersise_duration` (
  `excersise_duration_id` int(11) NOT NULL AUTO_INCREMENT,
  `excersise_duration_name` varchar(50) NOT NULL,
  PRIMARY KEY (`excersise_duration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of excersise_duration
-- ----------------------------
INSERT INTO `excersise_duration` VALUES ('1', 'Everyday');
INSERT INTO `excersise_duration` VALUES ('2', 'Every 2 days');
INSERT INTO `excersise_duration` VALUES ('3', 'Every Week');
INSERT INTO `excersise_duration` VALUES ('4', 'None');

-- ----------------------------
-- Table structure for `expenses`
-- ----------------------------
DROP TABLE IF EXISTS `expenses`;
CREATE TABLE `expenses` (
  `expenses_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `recipient` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expense_status` int(11) DEFAULT '0',
  `dateofissue` datetime DEFAULT NULL,
  PRIMARY KEY (`expenses_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of expenses
-- ----------------------------

-- ----------------------------
-- Table structure for `expenses_copy`
-- ----------------------------
DROP TABLE IF EXISTS `expenses_copy`;
CREATE TABLE `expenses_copy` (
  `expenses_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `recepient` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateofissue` date DEFAULT NULL,
  `expense_status` int(11) DEFAULT '0',
  `expense_name` varchar(110) DEFAULT NULL,
  PRIMARY KEY (`expenses_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of expenses_copy
-- ----------------------------

-- ----------------------------
-- Table structure for `gender`
-- ----------------------------
DROP TABLE IF EXISTS `gender`;
CREATE TABLE `gender` (
  `gender_id` int(11) NOT NULL AUTO_INCREMENT,
  `gender_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gender
-- ----------------------------
INSERT INTO `gender` VALUES ('1', 'Male');
INSERT INTO `gender` VALUES ('2', 'Female');

-- ----------------------------
-- Table structure for `inventory_level_status`
-- ----------------------------
DROP TABLE IF EXISTS `inventory_level_status`;
CREATE TABLE `inventory_level_status` (
  `inventory_level_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_level_status_name` varchar(255) NOT NULL,
  PRIMARY KEY (`inventory_level_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of inventory_level_status
-- ----------------------------
INSERT INTO `inventory_level_status` VALUES ('1', 'Order Creation');
INSERT INTO `inventory_level_status` VALUES ('2', 'Department Approval');
INSERT INTO `inventory_level_status` VALUES ('3', 'Supplier Approval');
INSERT INTO `inventory_level_status` VALUES ('4', 'Financial Approval');
INSERT INTO `inventory_level_status` VALUES ('5', 'Administrative / LPO generation');
INSERT INTO `inventory_level_status` VALUES ('6', 'LPO Approval');
INSERT INTO `inventory_level_status` VALUES ('7', 'Delivery for Order');

-- ----------------------------
-- Table structure for `job_title`
-- ----------------------------
DROP TABLE IF EXISTS `job_title`;
CREATE TABLE `job_title` (
  `job_title_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_title_name` varchar(100) NOT NULL,
  PRIMARY KEY (`job_title_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of job_title
-- ----------------------------
INSERT INTO `job_title` VALUES ('1', 'Accounts and Admin. Manager');
INSERT INTO `job_title` VALUES ('3', 'Accountant');
INSERT INTO `job_title` VALUES ('9', 'Office Assistant');
INSERT INTO `job_title` VALUES ('10', 'Driver');
INSERT INTO `job_title` VALUES ('11', 'Managing Director');
INSERT INTO `job_title` VALUES ('12', 'Rider');
INSERT INTO `job_title` VALUES ('13', 'Head of Operations');
INSERT INTO `job_title` VALUES ('14', 'Accounts and Admin. Assistant');

-- ----------------------------
-- Table structure for `kin_relationship`
-- ----------------------------
DROP TABLE IF EXISTS `kin_relationship`;
CREATE TABLE `kin_relationship` (
  `kin_relationship_id` int(11) NOT NULL AUTO_INCREMENT,
  `kin_relationship_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`kin_relationship_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kin_relationship
-- ----------------------------
INSERT INTO `kin_relationship` VALUES ('1', 'Husband');
INSERT INTO `kin_relationship` VALUES ('2', 'Wife');
INSERT INTO `kin_relationship` VALUES ('3', 'Brother');
INSERT INTO `kin_relationship` VALUES ('4', 'Sister');
INSERT INTO `kin_relationship` VALUES ('5', 'Other');

-- ----------------------------
-- Table structure for `language`
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_name` varchar(20) NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES ('1', 'English');
INSERT INTO `language` VALUES ('2', 'Kiswahili');
INSERT INTO `language` VALUES ('3', 'Other');

-- ----------------------------
-- Table structure for `leave_duration`
-- ----------------------------
DROP TABLE IF EXISTS `leave_duration`;
CREATE TABLE `leave_duration` (
  `leave_duration_id` int(200) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `leave_type_id` int(200) NOT NULL,
  `personnel_id` int(200) NOT NULL,
  `leave_duration_status` int(20) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`leave_duration_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of leave_duration
-- ----------------------------
INSERT INTO `leave_duration` VALUES ('4', '2015-08-14', '2015-08-21', '3', '85', '0', '85', '85', '2015-08-12 15:32:04', null);
INSERT INTO `leave_duration` VALUES ('2', '2015-08-23', '2015-08-31', '1', '92', '1', '85', '85', '2015-08-12 15:06:10', null);
INSERT INTO `leave_duration` VALUES ('5', '2015-09-01', '2015-09-08', '3', '85', '0', '85', '85', '2015-08-12 15:33:23', null);
INSERT INTO `leave_duration` VALUES ('6', '2015-08-17', '2015-08-21', '4', '93', '0', '85', '85', '2015-08-13 14:05:21', null);
INSERT INTO `leave_duration` VALUES ('7', '2015-11-04', '2015-11-15', '4', '4', '0', '35', '35', '2015-10-28 13:29:38', null);
INSERT INTO `leave_duration` VALUES ('8', '2016-09-08', '2016-09-13', '4', '3', '0', '4', '4', '2016-01-28 05:15:12', null);
INSERT INTO `leave_duration` VALUES ('9', '2016-12-12', '2016-12-30', '4', '3', '0', '4', '4', '2016-01-28 05:24:20', null);
INSERT INTO `leave_duration` VALUES ('10', '2016-03-25', '2016-03-29', '4', '2', '0', '0', '0', '2016-03-29 14:46:55', null);
INSERT INTO `leave_duration` VALUES ('11', '2016-03-25', '2016-03-29', '4', '0', '0', '0', '0', '2016-03-29 14:48:05', null);

-- ----------------------------
-- Table structure for `leave_type`
-- ----------------------------
DROP TABLE IF EXISTS `leave_type`;
CREATE TABLE `leave_type` (
  `leave_type_id` int(200) NOT NULL AUTO_INCREMENT,
  `leave_type_name` varchar(200) NOT NULL,
  `leave_type_status` int(10) NOT NULL DEFAULT '0',
  `leave_days` int(11) DEFAULT NULL,
  `leave_type_count` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`leave_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of leave_type
-- ----------------------------
INSERT INTO `leave_type` VALUES ('1', 'Paternity', '0', '10', '1');
INSERT INTO `leave_type` VALUES ('2', 'Maternity', '0', '90', '2');
INSERT INTO `leave_type` VALUES ('3', 'Sick', '0', '30', '1');
INSERT INTO `leave_type` VALUES ('4', 'Annual', '0', '21', '1');
INSERT INTO `leave_type` VALUES ('6', 'Compasionate', '0', '5', '1');

-- ----------------------------
-- Table structure for `ledger`
-- ----------------------------
DROP TABLE IF EXISTS `ledger`;
CREATE TABLE `ledger` (
  `ledger_id` int(11) NOT NULL AUTO_INCREMENT,
  `ledger_type_id` int(11) NOT NULL,
  `ledger_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ledger_amount` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `primary_key` int(11) NOT NULL,
  PRIMARY KEY (`ledger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ledger
-- ----------------------------

-- ----------------------------
-- Table structure for `ledger_type`
-- ----------------------------
DROP TABLE IF EXISTS `ledger_type`;
CREATE TABLE `ledger_type` (
  `ledger_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `ledger_type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`ledger_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ledger_type
-- ----------------------------
INSERT INTO `ledger_type` VALUES ('1', 'DEBIT');
INSERT INTO `ledger_type` VALUES ('2', 'CREDIT');

-- ----------------------------
-- Table structure for `loan_scheme`
-- ----------------------------
DROP TABLE IF EXISTS `loan_scheme`;
CREATE TABLE `loan_scheme` (
  `loan_scheme_id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_scheme_name` varchar(100) NOT NULL,
  `loan_scheme_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`loan_scheme_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of loan_scheme
-- ----------------------------
INSERT INTO `loan_scheme` VALUES ('3', 'Family bank loan 2', '1');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) NOT NULL,
  `database_action_id` int(11) NOT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `log_key` int(11) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for `month`
-- ----------------------------
DROP TABLE IF EXISTS `month`;
CREATE TABLE `month` (
  `month_id` int(11) NOT NULL AUTO_INCREMENT,
  `month_name` varchar(5) NOT NULL,
  PRIMARY KEY (`month_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of month
-- ----------------------------
INSERT INTO `month` VALUES ('1', 'Jan');
INSERT INTO `month` VALUES ('2', 'Feb');
INSERT INTO `month` VALUES ('3', 'Mar');
INSERT INTO `month` VALUES ('4', 'Apr');
INSERT INTO `month` VALUES ('5', 'May');
INSERT INTO `month` VALUES ('6', 'Jun');
INSERT INTO `month` VALUES ('7', 'Jul');
INSERT INTO `month` VALUES ('8', 'Aug');
INSERT INTO `month` VALUES ('9', 'Sep');
INSERT INTO `month` VALUES ('10', 'Oct');
INSERT INTO `month` VALUES ('11', 'Nov');
INSERT INTO `month` VALUES ('12', 'Dec');

-- ----------------------------
-- Table structure for `nhif`
-- ----------------------------
DROP TABLE IF EXISTS `nhif`;
CREATE TABLE `nhif` (
  `nhif_id` int(11) NOT NULL AUTO_INCREMENT,
  `nhif_from` float DEFAULT NULL,
  `nhif_to` float DEFAULT NULL,
  `nhif_amount` float DEFAULT NULL,
  `nhif_status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`nhif_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nhif
-- ----------------------------
INSERT INTO `nhif` VALUES ('2', '6000', '7999', '300', '1');
INSERT INTO `nhif` VALUES ('3', '8000', '11999', '400', '1');
INSERT INTO `nhif` VALUES ('4', '12000', '14999', '500', '1');
INSERT INTO `nhif` VALUES ('5', '15000', '19999', '600', '1');
INSERT INTO `nhif` VALUES ('6', '20000', '24999', '750', '1');
INSERT INTO `nhif` VALUES ('7', '25000', '29999', '850', '1');
INSERT INTO `nhif` VALUES ('8', '30000', '34999', '900', '1');
INSERT INTO `nhif` VALUES ('9', '35000', '39999', '950', '1');
INSERT INTO `nhif` VALUES ('10', '40000', '44999', '1000', '1');
INSERT INTO `nhif` VALUES ('11', '45000', '49999', '1100', '1');
INSERT INTO `nhif` VALUES ('12', '50000', '59999', '1200', '1');
INSERT INTO `nhif` VALUES ('13', '60000', '69999', '1300', '1');
INSERT INTO `nhif` VALUES ('14', '70000', '79999', '1400', '1');
INSERT INTO `nhif` VALUES ('15', '80000', '89999', '1500', '1');
INSERT INTO `nhif` VALUES ('16', '90000', '99999', '1600', '1');
INSERT INTO `nhif` VALUES ('17', '100000', '0', '1700', '1');
INSERT INTO `nhif` VALUES ('18', '0', '5999', '150', '1');

-- ----------------------------
-- Table structure for `nssf`
-- ----------------------------
DROP TABLE IF EXISTS `nssf`;
CREATE TABLE `nssf` (
  `nssf_id` int(11) NOT NULL,
  `nssf_name` varchar(45) DEFAULT NULL,
  `nssf_status` int(11) NOT NULL DEFAULT '0',
  `nssf_abbr` varchar(10) NOT NULL,
  `amount` float NOT NULL,
  `percentage` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`nssf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nssf
-- ----------------------------
INSERT INTO `nssf` VALUES ('1', 'NSSF', '1', 'NSSF', '200', '0');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(45) NOT NULL,
  `orders_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `order_instructions` text,
  `order_approval_status` int(11) DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', 'OSH15-001', '2015-11-07 22:27:15', '1', '0', '2015-11-07 20:27:15', '0', null, 'Pharmacy Order', '0');
INSERT INTO `orders` VALUES ('2', '16-001', '2016-03-29 22:16:00', '1', '0', '2016-03-29 15:16:00', '0', null, 'set up 500 pax in a dome tent', '0');

-- ----------------------------
-- Table structure for `order_item`
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_item_quantity` int(11) NOT NULL,
  `order_item_price` int(11) NOT NULL,
  `order_item_instruction` text NOT NULL,
  `purchase_quantity` int(11) NOT NULL,
  `supplier_unit_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of order_item
-- ----------------------------

-- ----------------------------
-- Table structure for `order_level_status`
-- ----------------------------
DROP TABLE IF EXISTS `order_level_status`;
CREATE TABLE `order_level_status` (
  `order_level_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `order_level_status_status` int(11) DEFAULT NULL,
  `lpo_status` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  `personnel_order_approval_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_level_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of order_level_status
-- ----------------------------
INSERT INTO `order_level_status` VALUES ('15', '1', '0', null, '2015-11-07 20:27:15', '0', null, '0', null);
INSERT INTO `order_level_status` VALUES ('16', '2', '0', null, '2016-03-29 15:16:00', '0', null, '0', null);

-- ----------------------------
-- Table structure for `order_status`
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_status_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`order_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of order_status
-- ----------------------------

-- ----------------------------
-- Table structure for `other_deduction`
-- ----------------------------
DROP TABLE IF EXISTS `other_deduction`;
CREATE TABLE `other_deduction` (
  `other_deduction_id` int(11) NOT NULL AUTO_INCREMENT,
  `other_deduction_name` varchar(45) DEFAULT NULL,
  `other_deduction_status` tinyint(1) NOT NULL DEFAULT '1',
  `other_deduction_abbr` varchar(10) NOT NULL,
  `other_deduction_taxable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`other_deduction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of other_deduction
-- ----------------------------
INSERT INTO `other_deduction` VALUES ('1', 'Salary Advances', '1', '', '1');

-- ----------------------------
-- Table structure for `paye`
-- ----------------------------
DROP TABLE IF EXISTS `paye`;
CREATE TABLE `paye` (
  `paye_id` int(11) NOT NULL AUTO_INCREMENT,
  `paye_from` float DEFAULT NULL,
  `paye_to` float DEFAULT NULL,
  `paye_amount` float DEFAULT NULL,
  `paye_status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paye_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of paye
-- ----------------------------
INSERT INTO `paye` VALUES ('2', '10165', '19740', '15', '1');
INSERT INTO `paye` VALUES ('4', '19741', '29316', '20', '1');
INSERT INTO `paye` VALUES ('6', '29317', '38892', '25', '1');
INSERT INTO `paye` VALUES ('18', '0', '10164', '10', '1');
INSERT INTO `paye` VALUES ('19', '38893', '0', '30', '1');

-- ----------------------------
-- Table structure for `payment`
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_name` varchar(45) DEFAULT NULL,
  `payment_status` int(11) NOT NULL DEFAULT '0',
  `payment_abbr` varchar(10) NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES ('1', 'Basic Pay', '0', '');

-- ----------------------------
-- Table structure for `payments`
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `payment_id` int(30) NOT NULL AUTO_INCREMENT,
  `visit_id` int(11) NOT NULL,
  `personnel_id` int(30) NOT NULL,
  `amount_paid` int(30) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payment_method_id` int(11) NOT NULL,
  `confirm_number` varchar(45) NOT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `payment_created` date DEFAULT NULL,
  `payment_created_by` int(11) DEFAULT NULL,
  `payment_service_id` int(11) DEFAULT NULL,
  `transaction_code` varchar(255) DEFAULT NULL,
  `payment_status` int(11) DEFAULT '1',
  `modified_by` int(11) DEFAULT NULL,
  `modified_on` date DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `date_approved` date DEFAULT NULL,
  `cancel` tinyint(1) DEFAULT '0',
  `cancel_action_id` int(11) DEFAULT NULL,
  `cancel_description` text,
  `cancelled_by` int(11) DEFAULT NULL,
  `cancelled_date` datetime DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payments
-- ----------------------------
INSERT INTO `payments` VALUES ('1', '1', '0', '500', '2015-12-11 17:43:20', '2', '', '1', '2015-12-11', '0', '8', '', '1', null, null, null, '2015-12-11', '0', null, null, null, null);
INSERT INTO `payments` VALUES ('2', '2', '0', '500', '2016-01-07 13:51:37', '2', '', '1', '2016-01-07', '0', '8', '', '1', null, null, null, '2016-01-07', '0', null, null, null, null);
INSERT INTO `payments` VALUES ('3', '2', '0', '500', '2016-01-07 16:23:51', '2', '', '1', '2016-01-07', '0', '11', '', '1', null, null, null, '2016-01-07', '0', null, null, null, null);
INSERT INTO `payments` VALUES ('4', '2', '0', '550', '2016-01-07 16:24:20', '5', '', '1', '2016-01-07', '0', '12', 'ABCDEFGHIJ', '1', null, null, null, '2016-01-07', '0', null, null, null, null);
INSERT INTO `payments` VALUES ('5', '2', '0', '1800', '2016-01-07 16:24:33', '2', '', '1', '2016-01-07', '0', '10', '', '1', null, null, null, '2016-01-07', '0', null, null, null, null);
INSERT INTO `payments` VALUES ('6', '2', '0', '900', '2016-01-07 16:24:43', '2', '', '1', '2016-01-07', '0', '9', '', '1', null, null, null, '2016-01-07', '0', null, null, null, null);

-- ----------------------------
-- Table structure for `payment_method`
-- ----------------------------
DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE `payment_method` (
  `payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(50) NOT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payment_method
-- ----------------------------
INSERT INTO `payment_method` VALUES ('1', 'Cheque');
INSERT INTO `payment_method` VALUES ('2', 'Cash');
INSERT INTO `payment_method` VALUES ('5', 'Mpesa');
INSERT INTO `payment_method` VALUES ('6', 'Credit card');

-- ----------------------------
-- Table structure for `payment_type`
-- ----------------------------
DROP TABLE IF EXISTS `payment_type`;
CREATE TABLE `payment_type` (
  `payment_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type_name` varchar(20) NOT NULL,
  `payment_type_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`payment_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payment_type
-- ----------------------------
INSERT INTO `payment_type` VALUES ('1', 'Mpesa', '1');
INSERT INTO `payment_type` VALUES ('2', 'Bank', '1');

-- ----------------------------
-- Table structure for `payment_type_copy`
-- ----------------------------
DROP TABLE IF EXISTS `payment_type_copy`;
CREATE TABLE `payment_type_copy` (
  `payment_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`payment_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment_type_copy
-- ----------------------------
INSERT INTO `payment_type_copy` VALUES ('1', 'Normal');
INSERT INTO `payment_type_copy` VALUES ('2', 'Debit Note');
INSERT INTO `payment_type_copy` VALUES ('3', 'Credit Note');

-- ----------------------------
-- Table structure for `payroll`
-- ----------------------------
DROP TABLE IF EXISTS `payroll`;
CREATE TABLE `payroll` (
  `payroll_id` int(11) NOT NULL AUTO_INCREMENT,
  `month_id` int(11) NOT NULL,
  `payroll_year` year(4) NOT NULL,
  `payroll_status` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`payroll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payroll
-- ----------------------------

-- ----------------------------
-- Table structure for `payroll_item`
-- ----------------------------
DROP TABLE IF EXISTS `payroll_item`;
CREATE TABLE `payroll_item` (
  `payroll_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `table` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `payroll_item_amount` double NOT NULL,
  `payroll_item_status` tinyint(1) NOT NULL DEFAULT '1',
  `personnel_id` int(11) NOT NULL,
  `payroll_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`payroll_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payroll_item
-- ----------------------------

-- ----------------------------
-- Table structure for `permissions`
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `permissions_id` int(11) NOT NULL AUTO_INCREMENT,
  `permissions_name` varchar(100) NOT NULL,
  PRIMARY KEY (`permissions_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', 'Consultation Payment');
INSERT INTO `permissions` VALUES ('2', 'Consultation Payment');

-- ----------------------------
-- Table structure for `personnel`
-- ----------------------------
DROP TABLE IF EXISTS `personnel`;
CREATE TABLE `personnel` (
  `personnel_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_onames` varchar(45) DEFAULT NULL,
  `personnel_fname` varchar(20) NOT NULL,
  `personnel_dob` date DEFAULT NULL,
  `personnel_email` varchar(45) DEFAULT NULL,
  `personnel_phone` varchar(45) DEFAULT NULL,
  `personnel_address` varchar(45) DEFAULT NULL,
  `personnel_locality` varchar(45) DEFAULT NULL,
  `civilstatus_id` int(11) DEFAULT NULL,
  `title_id` int(11) DEFAULT NULL,
  `gender_id` int(11) DEFAULT NULL,
  `personnel_username` varchar(45) DEFAULT NULL,
  `personnel_password` varchar(45) DEFAULT 'e10adc3949ba59abbe56e057f20f883e',
  `personnel_kin_fname` varchar(45) DEFAULT NULL,
  `personnel_kin_onames` varchar(45) DEFAULT NULL,
  `personnel_kin_contact` varchar(45) DEFAULT NULL,
  `personnel_kin_address` varchar(45) DEFAULT NULL,
  `kin_relationship_id` int(11) DEFAULT NULL,
  `personnel_status` tinyint(1) NOT NULL DEFAULT '1',
  `job_title_id` int(11) NOT NULL,
  `personnel_surname` varchar(20) NOT NULL,
  `personnel_staff_id` varchar(20) NOT NULL,
  `authorise` int(11) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `personnel_number` varchar(100) DEFAULT NULL,
  `personnel_post_code` varchar(10) DEFAULT NULL,
  `personnel_city` varchar(30) DEFAULT NULL,
  `personnel_account_status` tinyint(1) NOT NULL DEFAULT '1',
  `branch_id` int(11) DEFAULT NULL,
  `authorize_invoice_changes` tinyint(1) DEFAULT '0',
  `personnel_account_number` varchar(30) DEFAULT NULL,
  `personnel_nssf_number` varchar(30) DEFAULT NULL,
  `personnel_kra_pin` varchar(30) DEFAULT NULL,
  `personnel_nhif_number` varchar(30) DEFAULT NULL,
  `personnel_national_id_number` varchar(30) DEFAULT NULL,
  `personnel_type_id` int(11) DEFAULT '1',
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`personnel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel
-- ----------------------------
INSERT INTO `personnel` VALUES ('1', 'Sato', 'Caroline', '1988-06-12', 'satokaroline@gmail.com', '0705858898', '23075', 'Gitaru, Naivasha Highway, Kikuyu', '1', '3', '2', 'csato', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, null, '1', '0', '', '', '0', '2016-03-29 12:34:07', null, null, null, '2016-03-29 19:34:07', '110210', '00604', 'Gitaru, Naivasha Highway, Kiku', '1', '2', '0', '01108169741200', '2004730879', 'A007929762V', '5094599', '25422711', '1', null);
INSERT INTO `personnel` VALUES ('2', 'Adera Baraza', 'Kevin', '1982-12-26', 'kevin@serenityservices.co.ke', '0721101245', '21316', 'Kibera Stn Rd, Jamuhuri Hse. no.4', '2', '1', '1', 'kevin', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, null, '1', '0', '', '', '0', '2016-03-30 02:19:27', null, null, null, '2016-03-30 09:19:27', '110130', '00100', 'Kibera Stn Rd, Jamuhuri Hse. n', '1', '2', '0', 'Equity BAnk, Moi Avenue, 02601', '525242929', 'A0033236585', 'R154870', '22552230', '1', null);
INSERT INTO `personnel` VALUES ('3', 'Oluoch Baraza', 'Moses', '1980-09-08', 'moses@serenityservices.co.ke', '0727559609', '', 'Jamuhuri, Haliquins Court', '2', '1', '1', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, null, '1', '0', '', '', '0', null, null, null, null, '2016-03-31 12:26:02', '110140', '', 'Jamuhuri, Haliquins Court', '1', '2', '0', 'KCB, Sarit Center,1106904842', '156340917', 'A00463711P', 'R1906031', '23012741', '1', null);
INSERT INTO `personnel` VALUES ('4', 'Wanjiku Gitonga', 'Barbara', '1963-12-20', 'bwkirimi@yahoo.com', '0722708135', '72858', 'Karuna Close,  Apart. 17', '2', '2', '2', 'Barbara', '41e29a1196ae06260dd5752a52c92984', null, null, null, null, null, '1', '0', '', '', '0', '2016-04-04 01:59:09', null, null, null, '2016-04-04 08:59:09', '110220', '00200', 'Nairobi', '1', '2', '0', 'NIC, Westlands, 1000191244', '251156818', 'A001296573B', '0977410', '3137392', '1', null);
INSERT INTO `personnel` VALUES ('5', 'Lukoko', 'Hillary', '1983-08-20', 'hillumba@yahoo.com', '0705902649', '100', 'G.S.U. Camp Karbanet Rd', '2', '1', '1', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, null, '0', '0', '', '', '0', null, null, null, null, '2016-02-29 10:08:44', '110340', '50101', 'G.S.U. Camp Karbanet Rd', '1', '2', '0', 'Family Bank, KTDA, 03800002933', '711642915', 'A004027647S', '3461825', '22881098', '1', null);
INSERT INTO `personnel` VALUES ('6', 'Nyaboke Oganda', 'Irene', '1982-01-01', '', '0710235905', '', 'Kibera', '1', '2', '2', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, null, '1', '0', '', '', '0', null, null, null, null, '2016-01-28 14:24:12', '110250', '', 'Nairobi', '1', '2', '0', 'Equity Bank, Kilimani,14501644', '660350815', 'A008614105M', '5531781', '23799847', '1', null);
INSERT INTO `personnel` VALUES ('7', 'Mumbua Muinde', 'Grace', '1992-09-12', 'gracemuinde6@gmail.com', '0707674178', '4405', 'Thika', '1', '3', '2', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, null, '1', '0', '', '', '0', null, null, null, null, '2016-04-06 12:44:23', '110211', '01000', 'Thika', '1', '2', '0', '01108177764800', '2009214727', 'A009004604W', '', '29359957', '1', 'e4ff92e6c696d28b65e3ef0f8716b1d5.jpg');
INSERT INTO `personnel` VALUES ('8', 'Masila Mutoko', 'Nicholas', '1965-01-01', 'festusmutoko@yahoo.com', '0721602902', '361', 'Langata, Otiende Shopping Center', '2', '1', '1', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, null, '1', '0', '', '', '0', null, null, null, null, '2016-01-28 14:42:20', '110440', '', 'Toani', '1', '2', '0', 'K- rep, Kenyatta Market, 01407', '754537625', 'A002410603V', '1232472', '7808428', '1', null);
INSERT INTO `personnel` VALUES ('9', 'Kaleha Kaisha', 'Laura', '1990-08-18', 'laura.kaisha@gmail.com', '0714778570', 'P. O. Box 3111 ', 'roysambu, Thika Road, Nairobi', '1', '3', '2', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, null, '1', '0', '', '', '0', null, null, null, null, '2016-03-01 16:04:30', '', '30100', 'roysambu, Thika Road, Nairobi', '1', '3', '1', '', '2007057312', '', '5497239', '28140693', '1', null);
INSERT INTO `personnel` VALUES ('10', 'Oduori', 'Patrick', '1969-02-12', 'info@serenityservices.co.ke', '0706560509', '4390', 'kibera Highrise', '2', '1', '1', 'Patrick', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, null, '1', '0', '', '', '0', null, null, null, null, '2016-03-31 12:53:01', '', '00506', 'kibera Highrise', '1', '2', '0', '046000025240', '067911927', 'A002122361A', '0257979', '9803775', '1', null);

-- ----------------------------
-- Table structure for `personnel_allowance`
-- ----------------------------
DROP TABLE IF EXISTS `personnel_allowance`;
CREATE TABLE `personnel_allowance` (
  `personnel_allowance_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) DEFAULT NULL,
  `allowance_id` int(11) DEFAULT NULL,
  `personnel_allowance_amount` double NOT NULL,
  `personnel_allowance_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `personnel_allowance_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`personnel_allowance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel_allowance
-- ----------------------------

-- ----------------------------
-- Table structure for `personnel_approval`
-- ----------------------------
DROP TABLE IF EXISTS `personnel_approval`;
CREATE TABLE `personnel_approval` (
  `personnel_approval_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval_status_id` int(11) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`personnel_approval_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel_approval
-- ----------------------------

-- ----------------------------
-- Table structure for `personnel_benefit`
-- ----------------------------
DROP TABLE IF EXISTS `personnel_benefit`;
CREATE TABLE `personnel_benefit` (
  `personnel_benefit_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) DEFAULT NULL,
  `benefit_id` int(11) DEFAULT NULL,
  `personnel_benefit_amount` double NOT NULL,
  `personnel_benefit_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `personnel_benefit_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`personnel_benefit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel_benefit
-- ----------------------------

-- ----------------------------
-- Table structure for `personnel_deduction`
-- ----------------------------
DROP TABLE IF EXISTS `personnel_deduction`;
CREATE TABLE `personnel_deduction` (
  `personnel_deduction_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) DEFAULT NULL,
  `deduction_id` int(11) DEFAULT NULL,
  `personnel_deduction_amount` double NOT NULL,
  `personnel_deduction_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `personnel_deduction_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`personnel_deduction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel_deduction
-- ----------------------------

-- ----------------------------
-- Table structure for `personnel_department`
-- ----------------------------
DROP TABLE IF EXISTS `personnel_department`;
CREATE TABLE `personnel_department` (
  `personnel_department_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`personnel_department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel_department
-- ----------------------------

-- ----------------------------
-- Table structure for `personnel_dependant`
-- ----------------------------
DROP TABLE IF EXISTS `personnel_dependant`;
CREATE TABLE `personnel_dependant` (
  `personnel_dependant_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_dependant_onames` varchar(45) DEFAULT NULL,
  `personnel_dependant_fname` varchar(20) NOT NULL,
  `personnel_dependant_email` varchar(45) DEFAULT NULL,
  `personnel_dependant_phone` varchar(45) DEFAULT NULL,
  `personnel_dependant_locality` varchar(45) DEFAULT NULL,
  `title_id` int(11) DEFAULT NULL,
  `gender_id` int(11) DEFAULT NULL,
  `relationship_id` int(11) DEFAULT NULL,
  `personnel_dependant_status` int(11) NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `personnel_id` int(11) NOT NULL,
  PRIMARY KEY (`personnel_dependant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel_dependant
-- ----------------------------
INSERT INTO `personnel_dependant` VALUES ('1', 'Akinyi Oduoki', 'Joy', 'info@serenityservices.co.ke', '0716799478', 'Funyala', '3', '2', '6', '1', '4', '4', '2016-03-31 05:56:57', '2016-03-31 12:56:57', '10');
INSERT INTO `personnel_dependant` VALUES ('2', 'Nyabwine Oduuori', 'Briget', 'info@serenityservices.co.ke', '0716799478', 'Funyala', '3', '2', '6', '1', '4', '4', '2016-03-31 05:58:40', '2016-03-31 12:58:40', '10');
INSERT INTO `personnel_dependant` VALUES ('3', 'Ojiambo Oduori', 'John', 'info@serenityservices.co.ke', '0716799478', 'Funyala', '1', '1', '5', '1', '4', '4', '2016-03-31 05:59:55', '2016-03-31 12:59:55', '10');
INSERT INTO `personnel_dependant` VALUES ('4', 'Adeti Oduori', 'Sylvia ', 'info@serenityservices.co.ke', '0716799478', 'Funyala', '3', '2', '6', '1', '4', '4', '2016-03-31 06:01:14', '2016-03-31 13:01:14', '10');
INSERT INTO `personnel_dependant` VALUES ('5', 'Ajiambo', 'Bevaline', 'info@serenityservices.co.ke', '0716799478', 'Funyala', '3', '2', '6', '1', '4', '4', '2016-03-31 06:02:16', '2016-03-31 13:02:16', '10');

-- ----------------------------
-- Table structure for `personnel_document_uploads`
-- ----------------------------
DROP TABLE IF EXISTS `personnel_document_uploads`;
CREATE TABLE `personnel_document_uploads` (
  `document_upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_name` varchar(255) DEFAULT NULL,
  `document_upload_name` varchar(255) DEFAULT NULL,
  `personnel_id` int(11) DEFAULT NULL,
  `document_status` int(11) DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`document_upload_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel_document_uploads
-- ----------------------------
INSERT INTO `personnel_document_uploads` VALUES ('4', 'CV', '7770c85869e25fc70661d658b374b66a.pdf', '7', '1', '0', '2016-04-06 11:45:32', '0', null);
INSERT INTO `personnel_document_uploads` VALUES ('5', 'Transcripts', '6147b1387b30169540043f1e9ad3771a.pdf', '7', '1', '0', '2016-04-06 11:51:41', '0', null);

-- ----------------------------
-- Table structure for `personnel_emergency`
-- ----------------------------
DROP TABLE IF EXISTS `personnel_emergency`;
CREATE TABLE `personnel_emergency` (
  `personnel_emergency_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_emergency_onames` varchar(45) DEFAULT NULL,
  `personnel_emergency_fname` varchar(20) NOT NULL,
  `personnel_emergency_email` varchar(45) DEFAULT NULL,
  `personnel_emergency_phone` varchar(45) DEFAULT NULL,
  `personnel_emergency_locality` varchar(45) DEFAULT NULL,
  `title_id` int(11) DEFAULT NULL,
  `gender_id` int(11) DEFAULT NULL,
  `relationship_id` int(11) DEFAULT NULL,
  `personnel_emergency_status` int(11) NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `personnel_id` int(11) NOT NULL,
  PRIMARY KEY (`personnel_emergency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel_emergency
-- ----------------------------
INSERT INTO `personnel_emergency` VALUES ('1', 'Dorothy Oduke', 'Clarence', 'info@serenityservices.co.ke', '0716799478', 'Funyala', '2', '2', '10', '1', '4', '4', '2016-03-31 05:55:11', '2016-03-31 12:55:11', '10');

-- ----------------------------
-- Table structure for `personnel_job`
-- ----------------------------
DROP TABLE IF EXISTS `personnel_job`;
CREATE TABLE `personnel_job` (
  `personnel_job_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `job_title_id` int(11) NOT NULL,
  `personnel_job_status` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `job_commencement_date` date DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`personnel_job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel_job
-- ----------------------------
INSERT INTO `personnel_job` VALUES ('1', '10', '12', '1', '2016-03-31 06:11:28', '2016-03-31 13:11:28', '4', '4', '2016-03-03', '1');

-- ----------------------------
-- Table structure for `personnel_other_deduction`
-- ----------------------------
DROP TABLE IF EXISTS `personnel_other_deduction`;
CREATE TABLE `personnel_other_deduction` (
  `personnel_other_deduction_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) DEFAULT NULL,
  `other_deduction_id` int(11) DEFAULT NULL,
  `personnel_other_deduction_amount` double NOT NULL,
  `personnel_other_deduction_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `personnel_other_deduction_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`personnel_other_deduction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel_other_deduction
-- ----------------------------
INSERT INTO `personnel_other_deduction` VALUES ('2', '5', '1', '1000', '2016-01-28 12:51:24', '1');
INSERT INTO `personnel_other_deduction` VALUES ('5', '10', '1', '2000', '2016-03-31 13:17:45', '1');

-- ----------------------------
-- Table structure for `personnel_payment`
-- ----------------------------
DROP TABLE IF EXISTS `personnel_payment`;
CREATE TABLE `personnel_payment` (
  `personnel_payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `personnel_payment_amount` double NOT NULL,
  `personnel_payment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `personnel_payment_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`personnel_payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel_payment
-- ----------------------------
INSERT INTO `personnel_payment` VALUES ('1', '2', '1', '100000', '2016-01-28 12:40:34', '1');
INSERT INTO `personnel_payment` VALUES ('2', '5', '1', '17000', '2016-01-28 12:51:12', '1');
INSERT INTO `personnel_payment` VALUES ('3', '8', '1', '20000', '2016-01-28 12:57:37', '1');
INSERT INTO `personnel_payment` VALUES ('4', '7', '1', '25000', '2016-01-28 12:59:16', '1');
INSERT INTO `personnel_payment` VALUES ('5', '6', '1', '18000', '2016-01-28 13:00:58', '1');
INSERT INTO `personnel_payment` VALUES ('6', '3', '1', '70000', '2016-01-28 13:02:05', '1');
INSERT INTO `personnel_payment` VALUES ('7', '1', '1', '30000', '2016-01-28 13:03:37', '1');
INSERT INTO `personnel_payment` VALUES ('9', '4', '1', '30000', '2016-01-28 13:04:19', '1');
INSERT INTO `personnel_payment` VALUES ('10', '9', '1', '10000', '2016-03-01 15:51:11', '1');
INSERT INTO `personnel_payment` VALUES ('11', '10', '1', '18000', '2016-03-31 13:17:29', '1');

-- ----------------------------
-- Table structure for `personnel_relief`
-- ----------------------------
DROP TABLE IF EXISTS `personnel_relief`;
CREATE TABLE `personnel_relief` (
  `personnel_relief_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) DEFAULT NULL,
  `relief_id` int(11) DEFAULT NULL,
  `personnel_relief_amount` double NOT NULL,
  `personnel_relief_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `personnel_relief_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`personnel_relief_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel_relief
-- ----------------------------

-- ----------------------------
-- Table structure for `personnel_rooms`
-- ----------------------------
DROP TABLE IF EXISTS `personnel_rooms`;
CREATE TABLE `personnel_rooms` (
  `personnel_rooms_id` int(11) NOT NULL AUTO_INCREMENT,
  `rooms_id` int(11) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  PRIMARY KEY (`personnel_rooms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel_rooms
-- ----------------------------

-- ----------------------------
-- Table structure for `personnel_savings`
-- ----------------------------
DROP TABLE IF EXISTS `personnel_savings`;
CREATE TABLE `personnel_savings` (
  `personnel_savings_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `savings_id` int(11) NOT NULL,
  `personnel_savings_status` tinyint(1) NOT NULL DEFAULT '1',
  `personnel_savings_amount` double NOT NULL,
  `personnel_savings_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `personnel_savings_opening` float DEFAULT NULL,
  PRIMARY KEY (`personnel_savings_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel_savings
-- ----------------------------

-- ----------------------------
-- Table structure for `personnel_scheme`
-- ----------------------------
DROP TABLE IF EXISTS `personnel_scheme`;
CREATE TABLE `personnel_scheme` (
  `personnel_scheme_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `loan_scheme_id` int(11) NOT NULL,
  `personnel_scheme_repayment_sdate` date NOT NULL,
  `personnel_scheme_repayment_edate` date NOT NULL,
  `personnel_scheme_interest` double NOT NULL,
  `personnel_scheme_amount` double NOT NULL,
  `personnel_scheme_status` tinyint(1) NOT NULL DEFAULT '1',
  `personnel_scheme_monthly` int(11) NOT NULL,
  `personnel_scheme_int` int(11) NOT NULL,
  PRIMARY KEY (`personnel_scheme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel_scheme
-- ----------------------------

-- ----------------------------
-- Table structure for `personnel_section`
-- ----------------------------
DROP TABLE IF EXISTS `personnel_section`;
CREATE TABLE `personnel_section` (
  `personnel_section_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_on` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`personnel_section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel_section
-- ----------------------------
INSERT INTO `personnel_section` VALUES ('1', '4', '14', '0', '0', '2016-01-28 04:29:18', '2016-01-28 06:29:18', '0', null, null);
INSERT INTO `personnel_section` VALUES ('2', '4', '19', '0', '0', '2016-01-28 04:29:34', '2016-01-28 06:29:34', '0', null, null);
INSERT INTO `personnel_section` VALUES ('3', '4', '127', '0', '0', '2016-01-28 04:30:07', '2016-01-28 06:30:07', '0', null, null);
INSERT INTO `personnel_section` VALUES ('4', '9', '90', '4', '4', '2016-03-01 07:47:45', '2016-03-01 09:47:45', '0', null, null);
INSERT INTO `personnel_section` VALUES ('5', '1', '14', '0', '0', '2016-03-23 09:43:20', '2016-03-23 11:43:20', '0', null, null);
INSERT INTO `personnel_section` VALUES ('7', '2', '19', '0', '0', '2016-03-30 02:18:46', '2016-03-30 03:18:46', '0', null, null);
INSERT INTO `personnel_section` VALUES ('8', '2', '127', '0', '0', '2016-03-30 02:19:12', '2016-03-30 03:19:12', '0', null, null);

-- ----------------------------
-- Table structure for `personnel_store`
-- ----------------------------
DROP TABLE IF EXISTS `personnel_store`;
CREATE TABLE `personnel_store` (
  `personnel_store_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `personnel_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`personnel_store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel_store
-- ----------------------------

-- ----------------------------
-- Table structure for `personnel_type`
-- ----------------------------
DROP TABLE IF EXISTS `personnel_type`;
CREATE TABLE `personnel_type` (
  `personnel_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_type_name` varchar(30) DEFAULT NULL,
  `personnel_type_payment` tinyint(4) DEFAULT NULL,
  `personnel_type_payment_amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`personnel_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel_type
-- ----------------------------
INSERT INTO `personnel_type` VALUES ('1', 'Full time', null, null);
INSERT INTO `personnel_type` VALUES ('2', 'Consultant', '1', null);

-- ----------------------------
-- Table structure for `petty_cash`
-- ----------------------------
DROP TABLE IF EXISTS `petty_cash`;
CREATE TABLE `petty_cash` (
  `petty_cash_id` int(11) NOT NULL AUTO_INCREMENT,
  `petty_cash_description` text,
  `petty_cash_amount` double DEFAULT NULL,
  `petty_cash_date` date DEFAULT NULL,
  `petty_cash_status` tinyint(1) DEFAULT '1',
  `account_id` int(11) DEFAULT NULL,
  `transaction_type_id` tinyint(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  `branch_code` varchar(10) NOT NULL DEFAULT 'OSH',
  `is_synced` int(11) DEFAULT '0',
  PRIMARY KEY (`petty_cash_id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `petty_cash_sync`
-- ----------------------------
DROP TABLE IF EXISTS `petty_cash_sync`;
CREATE TABLE `petty_cash_sync` (
  `petty_cash_sync_id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `petty_cash_sync_status` tinyint(4) DEFAULT '0',
  `petty_cash_sync_type` tinyint(4) DEFAULT NULL,
  `pretty_cash_sync_table_id` int(11) DEFAULT NULL,
  `petty_cash_sync_table_key` int(11) DEFAULT NULL,
  `remote_pk` int(11) DEFAULT NULL,
  `branch_code` varchar(10) DEFAULT NULL,
  `sync_data` text,
  `local_pk` int(11) DEFAULT NULL,
  `petty_cash_sync_table_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`petty_cash_sync_id`)
) ENGINE=MyISAM AUTO_INCREMENT=505 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `petty_cash_sync_table`
-- ----------------------------
DROP TABLE IF EXISTS `petty_cash_sync_table`;
CREATE TABLE `petty_cash_sync_table` (
  `petty_cash_sync_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `petty_cash_sync_table_name` varchar(255) DEFAULT NULL,
  `petty_cash_sync_table_status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sync_table_cloud_save_function` varchar(50) DEFAULT NULL,
  `table_key_name` varchar(30) DEFAULT NULL,
  `branch_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`petty_cash_sync_table_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of petty_cash_sync_table
-- ----------------------------
INSERT INTO `petty_cash_sync_table` VALUES ('1', 'account', '1', '0', '0', '2015-09-17 18:46:30', '2015-11-05 20:51:24', 'save_account', 'account_id', 'OSH');
INSERT INTO `petty_cash_sync_table` VALUES ('2', 'petty_cash', '1', '0', '0', '2015-09-17 21:58:37', '2015-11-05 20:51:32', 'save_petty_cash', 'petty_cash_id', 'OSH');
INSERT INTO `petty_cash_sync_table` VALUES ('3', 'account', '1', '0', '0', '2015-09-17 21:59:01', '2015-11-05 20:51:22', 'save_account', 'account_id', 'KDP');
INSERT INTO `petty_cash_sync_table` VALUES ('4', 'petty_cash', '1', '0', '0', '2015-10-20 18:40:19', '2015-11-05 20:51:28', 'save_petty_cash', 'petty_cash_id', 'KDP');
INSERT INTO `petty_cash_sync_table` VALUES ('5', 'account', '1', null, null, '2015-11-05 18:49:26', '2015-11-05 20:50:23', 'save_account', 'account_id', 'KDPH');
INSERT INTO `petty_cash_sync_table` VALUES ('6', 'petty_cash', '1', null, null, '2015-11-05 18:49:54', '2015-11-05 20:51:01', 'save_petty_cash', 'petty_cash_id', 'KDPH');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` date DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `product_status` int(11) DEFAULT '0',
  `product_description` text,
  `branch_code` varchar(4) DEFAULT NULL,
  `product_code` varchar(10) DEFAULT NULL,
  `product_size` varchar(10) NOT NULL,
  `product_size_type` varchar(10) NOT NULL,
  `product_packsize` int(11) NOT NULL,
  `product_unitprice_insurance` double DEFAULT NULL,
  `product_unitprice` double NOT NULL,
  `batch_no` int(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_deleted` int(11) DEFAULT '0',
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_on` date DEFAULT NULL,
  `reorder_level` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `generic_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `drug_type_id` int(11) DEFAULT NULL,
  `unit_of_measure` varchar(255) DEFAULT NULL,
  `drug_administration_route_id` int(11) DEFAULT NULL,
  `is_synced` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=630 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `product_category`
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_name` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_modifed_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `product_category_parent` int(11) DEFAULT '0',
  `product_category_status` int(11) DEFAULT '0',
  PRIMARY KEY (`product_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product_category
-- ----------------------------

-- ----------------------------
-- Table structure for `product_deductions`
-- ----------------------------
DROP TABLE IF EXISTS `product_deductions`;
CREATE TABLE `product_deductions` (
  `product_deductions_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_deductions_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_deductions_pack_size` int(11) DEFAULT NULL,
  `product_deductions_quantity` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `container_type_id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `quantity_requested` int(11) DEFAULT NULL,
  `date_requested` datetime DEFAULT NULL,
  `quantity_given` int(11) DEFAULT NULL,
  `date_given` datetime DEFAULT NULL,
  `quantity_received` int(11) DEFAULT '0',
  `date_received` datetime DEFAULT NULL,
  `product_deductions_status` int(11) DEFAULT NULL,
  `search_date` date DEFAULT NULL,
  `requested_by` int(11) DEFAULT NULL,
  `given_by` int(11) DEFAULT NULL,
  `received_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_deductions_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `product_purchase`
-- ----------------------------
DROP TABLE IF EXISTS `product_purchase`;
CREATE TABLE `product_purchase` (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expiry_date` date NOT NULL,
  `product_id` int(11) NOT NULL,
  `container_type_id` int(11) DEFAULT NULL,
  `purchase_pack_size` int(11) DEFAULT NULL,
  `purchase_quantity` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product_purchase
-- ----------------------------

-- ----------------------------
-- Table structure for `purchase`
-- ----------------------------
DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expiry_date` date NOT NULL,
  `drugs_id` int(11) NOT NULL,
  `container_type_id` int(11) DEFAULT NULL,
  `purchase_pack_size` int(11) DEFAULT NULL,
  `purchase_quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`purchase_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `purchases`
-- ----------------------------
DROP TABLE IF EXISTS `purchases`;
CREATE TABLE `purchases` (
  `purchases_id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_items_id` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `units` int(11) NOT NULL,
  `pack_size` int(11) NOT NULL,
  `dc` char(1) NOT NULL,
  `ledger_type_id` int(11) NOT NULL,
  `entry_types_id` int(11) NOT NULL,
  `purchases_year` year(4) NOT NULL,
  `purchases_month` varchar(2) NOT NULL,
  `purchases_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `financial_year_id` int(11) NOT NULL,
  PRIMARY KEY (`purchases_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of purchases
-- ----------------------------

-- ----------------------------
-- Table structure for `receivable`
-- ----------------------------
DROP TABLE IF EXISTS `receivable`;
CREATE TABLE `receivable` (
  `receivable_id` int(11) NOT NULL AUTO_INCREMENT,
  `receivable_name` varchar(100) NOT NULL,
  `receivable_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`receivable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of receivable
-- ----------------------------

-- ----------------------------
-- Table structure for `receivables`
-- ----------------------------
DROP TABLE IF EXISTS `receivables`;
CREATE TABLE `receivables` (
  `receivables_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_product_id` int(11) DEFAULT NULL,
  `unit_cost` int(11) DEFAULT NULL,
  `received_quantity` int(11) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_modified_by` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  `receivables_status` int(11) DEFAULT '0',
  PRIMARY KEY (`receivables_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of receivables
-- ----------------------------

-- ----------------------------
-- Table structure for `receivable_amount`
-- ----------------------------
DROP TABLE IF EXISTS `receivable_amount`;
CREATE TABLE `receivable_amount` (
  `receivable_amount_id` int(11) NOT NULL AUTO_INCREMENT,
  `receivable_amount_amount` int(11) NOT NULL,
  `receivable_amount_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `receivable_amount_name` varchar(200) NOT NULL,
  `receivable_amount_status` int(11) NOT NULL,
  `receivable_amount_number` varchar(100) NOT NULL,
  `receivable_id` int(11) NOT NULL,
  PRIMARY KEY (`receivable_amount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of receivable_amount
-- ----------------------------

-- ----------------------------
-- Table structure for `relationship`
-- ----------------------------
DROP TABLE IF EXISTS `relationship`;
CREATE TABLE `relationship` (
  `relationship_id` int(11) NOT NULL AUTO_INCREMENT,
  `relationship_name` varchar(20) NOT NULL,
  PRIMARY KEY (`relationship_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of relationship
-- ----------------------------
INSERT INTO `relationship` VALUES ('1', 'Father');
INSERT INTO `relationship` VALUES ('2', 'Mother');
INSERT INTO `relationship` VALUES ('3', 'Brother');
INSERT INTO `relationship` VALUES ('4', 'Sister');
INSERT INTO `relationship` VALUES ('5', 'Son');
INSERT INTO `relationship` VALUES ('6', 'Daughter');
INSERT INTO `relationship` VALUES ('7', 'Aunt');
INSERT INTO `relationship` VALUES ('8', 'Uncle');
INSERT INTO `relationship` VALUES ('9', 'Guardian');
INSERT INTO `relationship` VALUES ('10', 'Wife');
INSERT INTO `relationship` VALUES ('11', 'Husband');
INSERT INTO `relationship` VALUES ('12', 'Spouse');
INSERT INTO `relationship` VALUES ('13', 'Cousin');
INSERT INTO `relationship` VALUES ('14', 'Other');

-- ----------------------------
-- Table structure for `relief`
-- ----------------------------
DROP TABLE IF EXISTS `relief`;
CREATE TABLE `relief` (
  `relief_id` int(11) NOT NULL AUTO_INCREMENT,
  `relief_name` varchar(45) DEFAULT NULL,
  `relief_status` tinyint(1) NOT NULL DEFAULT '1',
  `relief_abbr` varchar(10) NOT NULL,
  `relief_type` tinyint(1) NOT NULL DEFAULT '1',
  `relief_amount` float DEFAULT NULL,
  PRIMARY KEY (`relief_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of relief
-- ----------------------------
INSERT INTO `relief` VALUES ('3', 'Insurance Relief', '1', 'Insurance', '0', '15');
INSERT INTO `relief` VALUES ('5', 'Monthly Relief', '1', 'Monthly', '1', '1162');

-- ----------------------------
-- Table structure for `religion`
-- ----------------------------
DROP TABLE IF EXISTS `religion`;
CREATE TABLE `religion` (
  `religion_id` int(11) NOT NULL AUTO_INCREMENT,
  `religion_name` varchar(20) NOT NULL,
  PRIMARY KEY (`religion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of religion
-- ----------------------------
INSERT INTO `religion` VALUES ('1', 'Christian');
INSERT INTO `religion` VALUES ('2', 'Muslim');
INSERT INTO `religion` VALUES ('3', 'Hindu');
INSERT INTO `religion` VALUES ('4', 'Budhist');
INSERT INTO `religion` VALUES ('5', 'Other');

-- ----------------------------
-- Table structure for `requisition`
-- ----------------------------
DROP TABLE IF EXISTS `requisition`;
CREATE TABLE `requisition` (
  `requisition_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `supplier_product_id` int(11) DEFAULT NULL,
  `requested_quantity` int(11) DEFAULT NULL,
  `approved_quantity` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `requisition_status` int(11) DEFAULT '0',
  `ordered_by` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_status` int(11) DEFAULT '0',
  `last_modifed_by` int(11) DEFAULT NULL,
  `modifed` datetime DEFAULT NULL,
  PRIMARY KEY (`requisition_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of requisition
-- ----------------------------

-- ----------------------------
-- Table structure for `savings`
-- ----------------------------
DROP TABLE IF EXISTS `savings`;
CREATE TABLE `savings` (
  `savings_id` int(11) NOT NULL AUTO_INCREMENT,
  `savings_name` varchar(100) NOT NULL,
  `savings_status` int(11) NOT NULL,
  PRIMARY KEY (`savings_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of savings
-- ----------------------------

-- ----------------------------
-- Table structure for `savings_plan`
-- ----------------------------
DROP TABLE IF EXISTS `savings_plan`;
CREATE TABLE `savings_plan` (
  `savings_plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `savings_plan_name` varchar(50) NOT NULL,
  `savings_plan_min_account_balance` double NOT NULL,
  `savings_plan_min_opening_balance` double NOT NULL,
  `charge_withdrawal` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) NOT NULL,
  `compounding_period_id` int(11) NOT NULL,
  `savings_plan_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`savings_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of savings_plan
-- ----------------------------
INSERT INTO `savings_plan` VALUES ('1', 'Hekima', '0', '5000', '0', '2015-07-30 13:53:30', '85', '2015-07-30 15:53:30', '85', '5', '1');
INSERT INTO `savings_plan` VALUES ('2', 'Biashara', '5000', '25000', '1', '2015-07-30 13:54:17', '85', '2015-07-30 15:54:17', '85', '3', '1');
INSERT INTO `savings_plan` VALUES ('3', 'Ziada', '10000', '50000', '1', '2015-07-30 13:54:39', '85', '2015-07-30 15:54:39', '85', '2', '1');

-- ----------------------------
-- Table structure for `schedule`
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `schedule_id` int(5) NOT NULL AUTO_INCREMENT,
  `schedule_name` varchar(30) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  `schedule_parent` int(11) DEFAULT NULL,
  `schedule_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('3', 'Doctor Duty Roster', '0', '2015-10-11 15:01:29', '2015-10-11 16:01:29', '0', null, '1');

-- ----------------------------
-- Table structure for `schedule_item`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_item`;
CREATE TABLE `schedule_item` (
  `schedule_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(5) DEFAULT NULL,
  `personnel_id` bigint(5) DEFAULT NULL,
  `shift_id` int(5) DEFAULT NULL,
  `room_id` int(5) DEFAULT NULL,
  `schedule_date` date DEFAULT NULL,
  `schedule_start_time` time DEFAULT NULL,
  `schedule_end_time` time DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  `schedule_item_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`schedule_item_id`),
  KEY `personnel_id` (`personnel_id`),
  KEY `room_id` (`room_id`),
  KEY `shift_id` (`shift_id`),
  KEY `personnel_id_2` (`personnel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `section`
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(100) DEFAULT NULL,
  `section_status` tinyint(1) NOT NULL DEFAULT '1',
  `section_parent` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `section_user` int(11) DEFAULT NULL,
  `section_icon` varchar(20) DEFAULT NULL,
  `section_position` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of section
-- ----------------------------
INSERT INTO `section` VALUES ('2', 'Company Profile', '0', '18', '2015-07-28 11:19:00', '2015-08-28 09:19:52', '85', '85', '1', '', '3');
INSERT INTO `section` VALUES ('14', 'Dashboard', '1', '0', '2015-07-28 11:19:00', '2015-07-29 13:46:55', '85', '85', '1', 'home', '1');
INSERT INTO `section` VALUES ('16', 'Sections', '1', '18', '2015-07-29 12:45:00', '2015-07-29 14:44:10', '85', '85', '1', 'lock', '1');
INSERT INTO `section` VALUES ('17', 'Inventory', '0', '0', '2015-07-29 12:38:28', '2016-01-18 16:12:03', '85', '85', null, 'archive', '3');
INSERT INTO `section` VALUES ('18', 'Administration', '0', '0', '2015-07-29 12:43:53', '2016-01-18 15:59:41', '85', '85', null, 'cog', '1');
INSERT INTO `section` VALUES ('19', 'Human Resource', '1', '0', '2015-07-29 12:45:03', '2015-07-29 14:45:29', '85', '85', null, 'users', '2');
INSERT INTO `section` VALUES ('20', 'Personnel', '1', '19', '2015-07-29 12:45:49', '2015-07-29 14:45:49', '85', '85', null, '', '1');
INSERT INTO `section` VALUES ('21', 'Dashboard', '1', '19', '2015-07-29 13:09:19', '2015-07-29 15:09:19', '85', '85', null, '', '1');
INSERT INTO `section` VALUES ('22', 'Leave', '1', '19', '2015-07-29 18:15:29', '2015-07-29 20:15:29', '85', '85', null, '', '3');
INSERT INTO `section` VALUES ('23', 'Configuration', '1', '19', '2015-07-29 18:17:11', '2015-07-29 20:17:11', '85', '85', null, '', '4');
INSERT INTO `section` VALUES ('25', 'Payroll', '1', '127', '2015-07-29 18:19:04', '2015-10-08 20:09:52', '85', '0', null, '', '2');
INSERT INTO `section` VALUES ('26', 'Store', '1', '17', '2015-07-29 18:20:29', '2015-07-29 20:20:29', '85', '85', null, '', '1');
INSERT INTO `section` VALUES ('27', 'Suppliers', '1', '17', '2015-07-29 18:20:50', '2015-07-29 20:20:50', '85', '85', null, '', '3');
INSERT INTO `section` VALUES ('28', 'Categories', '1', '17', '2015-07-29 18:21:03', '2015-07-29 20:21:03', '85', '85', null, '', '2');
INSERT INTO `section` VALUES ('29', 'Units Of Measurement', '1', '17', '2015-07-29 18:21:50', '2015-07-29 20:21:50', '85', '85', null, '', '4');
INSERT INTO `section` VALUES ('30', 'Orders', '1', '17', '2015-07-29 18:28:30', '2015-07-29 20:28:30', '85', '85', null, '', '6');
INSERT INTO `section` VALUES ('31', 'Requisitions', '1', '17', '2015-07-29 18:28:46', '2015-07-29 20:28:46', '85', '85', null, '', '7');
INSERT INTO `section` VALUES ('39', 'Configuration', '1', '18', '2015-08-14 12:51:45', '2015-08-14 14:51:45', '85', '85', null, '', '1');
INSERT INTO `section` VALUES ('40', 'Business Development', '0', '0', '2015-08-14 13:27:01', '2015-08-14 15:27:23', '85', '85', null, 'cog', '6');
INSERT INTO `section` VALUES ('88', 'Payroll Configuration', '1', '127', '2015-08-24 11:08:42', '2015-10-08 20:09:56', '85', '0', null, '', '2');
INSERT INTO `section` VALUES ('89', 'Branches', '1', '18', '2015-08-28 07:19:46', '2015-09-02 15:03:36', '85', '85', null, '', '1');
INSERT INTO `section` VALUES ('90', 'My Account', '1', '19', '2015-09-02 13:22:44', '2015-09-02 15:22:44', '0', '0', null, '', '5');
INSERT INTO `section` VALUES ('91', 'Services', '0', '18', '2015-09-09 12:43:33', '2015-09-15 18:20:20', '0', '0', null, '', '4');
INSERT INTO `section` VALUES ('116', 'Inventory Setup', '1', '0', '2015-10-04 15:30:33', '2015-10-04 16:55:56', '0', '0', null, 'cogs', '18');
INSERT INTO `section` VALUES ('117', 'Inventory Categories', '1', '116', '2015-10-04 15:32:10', '2015-10-04 16:32:10', '0', '0', null, 'cogs', '1');
INSERT INTO `section` VALUES ('118', 'Inventory Stores', '1', '116', '2015-10-04 15:32:29', '2015-10-04 16:32:29', '0', '0', null, 'cogs', '2');
INSERT INTO `section` VALUES ('119', 'Suppliers', '1', '116', '2015-10-04 15:32:45', '2015-10-04 16:32:45', '0', '0', null, 'cogs', '3');
INSERT INTO `section` VALUES ('120', 'Inventory', '1', '0', '2015-10-04 15:34:30', '2015-10-04 16:55:28', '0', '0', null, 'briefcase', '17');
INSERT INTO `section` VALUES ('121', 'Products', '1', '120', '2015-10-04 15:35:06', '2015-10-04 16:35:06', '0', '0', null, 'briefcase', '1');
INSERT INTO `section` VALUES ('122', 'Orders', '1', '0', '2015-10-04 15:40:30', '2015-10-04 16:56:28', '0', '0', null, 'shopping-cart', '19');
INSERT INTO `section` VALUES ('127', 'Accounts', '1', '0', '2015-10-08 19:09:31', '2015-10-08 20:09:31', '0', '0', null, 'money', '6');
INSERT INTO `section` VALUES ('128', 'Insurance Invoices', '1', '127', '2015-10-08 19:10:39', '2015-10-08 20:10:39', '0', '0', null, '', '3');
INSERT INTO `section` VALUES ('129', 'Schedules', '1', '19', '2015-10-11 14:59:35', '2015-10-11 15:59:35', '0', '0', null, '', '6');
INSERT INTO `section` VALUES ('130', 'Petty Cash', '1', '127', '2015-10-17 17:24:35', '2015-10-17 18:24:35', '0', '0', null, '', '4');
INSERT INTO `section` VALUES ('131', 'Expenditure Accounts', '1', '127', '2015-10-17 17:32:48', '2016-01-18 16:11:14', '0', '0', null, '', '5');
INSERT INTO `section` VALUES ('132', 'Creditors', '1', '127', '2015-11-10 19:49:31', '2015-11-10 21:49:31', '0', '0', null, '', '6');

-- ----------------------------
-- Table structure for `session`
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `session_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` int(11) NOT NULL,
  `session_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `session_name_id` int(11) NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2518 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `session_name`
-- ----------------------------
DROP TABLE IF EXISTS `session_name`;
CREATE TABLE `session_name` (
  `session_name_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_name_name` varchar(10) NOT NULL,
  PRIMARY KEY (`session_name_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of session_name
-- ----------------------------
INSERT INTO `session_name` VALUES ('1', 'Login');
INSERT INTO `session_name` VALUES ('2', 'Logout');

-- ----------------------------
-- Table structure for `set_target`
-- ----------------------------
DROP TABLE IF EXISTS `set_target`;
CREATE TABLE `set_target` (
  `set_target_id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` varchar(45) NOT NULL,
  `target_amount` varchar(45) NOT NULL,
  `set_date` varchar(15) NOT NULL,
  PRIMARY KEY (`set_target_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of set_target
-- ----------------------------
INSERT INTO `set_target` VALUES ('87', '2', ' 1,635,241.67 ', '2014-01');
INSERT INTO `set_target` VALUES ('88', '2', ' 1,635,241.67 ', '2014-02');
INSERT INTO `set_target` VALUES ('89', '2', ' 1,635,241.67 ', '2014-03');
INSERT INTO `set_target` VALUES ('90', '2', ' 1,635,241.67 ', '2014-04');
INSERT INTO `set_target` VALUES ('91', '2', ' 1,635,241.67 ', '2014-05');
INSERT INTO `set_target` VALUES ('92', '2', ' 1,635,241.67 ', '2014-06');
INSERT INTO `set_target` VALUES ('93', '2', ' 1,635,241.67 ', '2014-07');
INSERT INTO `set_target` VALUES ('94', '2', ' 1,635,241.67 ', '2014-08');
INSERT INTO `set_target` VALUES ('95', '2', ' 1,635,241.67 ', '2014-09');
INSERT INTO `set_target` VALUES ('96', '2', ' 1,635,241.67 ', '2014-10');
INSERT INTO `set_target` VALUES ('97', '2', ' 1,635,241.67 ', '2014-11');
INSERT INTO `set_target` VALUES ('98', '2', ' 1,635,241.67 ', '2014-12');
INSERT INTO `set_target` VALUES ('99', '1', '960', '2014-01');
INSERT INTO `set_target` VALUES ('100', '1', '960', '2014-02');
INSERT INTO `set_target` VALUES ('101', '1', '960', '2014-03');
INSERT INTO `set_target` VALUES ('102', '1', '960', '2014-04');
INSERT INTO `set_target` VALUES ('103', '1', '960', '2014-05');
INSERT INTO `set_target` VALUES ('104', '1', '960', '2014-06');
INSERT INTO `set_target` VALUES ('105', '1', '960', '2014-07');
INSERT INTO `set_target` VALUES ('106', '1', '960', '2014-08');
INSERT INTO `set_target` VALUES ('107', '1', '960', '2014-07');
INSERT INTO `set_target` VALUES ('108', '1', '960', '2014-08');
INSERT INTO `set_target` VALUES ('109', '1', '960', '2014-09');
INSERT INTO `set_target` VALUES ('110', '1', '960', '2014-10');
INSERT INTO `set_target` VALUES ('111', '1', '960', '2014-11');
INSERT INTO `set_target` VALUES ('112', '1', '960', '2014-12');

-- ----------------------------
-- Table structure for `shifts`
-- ----------------------------
DROP TABLE IF EXISTS `shifts`;
CREATE TABLE `shifts` (
  `shift_id` int(5) NOT NULL AUTO_INCREMENT,
  `shift_name` varchar(100) NOT NULL,
  `shift_start` varchar(100) NOT NULL,
  `shift_end` varchar(100) NOT NULL,
  `shift_position` int(11) NOT NULL,
  PRIMARY KEY (`shift_id`),
  KEY `shift_id` (`shift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of shifts
-- ----------------------------
INSERT INTO `shifts` VALUES ('1', '', '8:00 AM', '9:00 AM', '1');
INSERT INTO `shifts` VALUES ('2', '', '9:00 AM', '10:00 AM', '2');
INSERT INTO `shifts` VALUES ('3', '', '10:00 AM', '11:00 AM', '3');
INSERT INTO `shifts` VALUES ('4', '', '12:00 PM', '1:00 PM', '5');
INSERT INTO `shifts` VALUES ('5', '', '11:00 AM', '12:00 PM', '4');
INSERT INTO `shifts` VALUES ('6', '', '1:00PM', '2:00pm', '6');
INSERT INTO `shifts` VALUES ('7', '', '2:00PM', '3:00PM', '7');
INSERT INTO `shifts` VALUES ('8', '', '3:00PM', '4:00PM', '8');
INSERT INTO `shifts` VALUES ('9', '', '4:00PM', '5:00PM', '9');
INSERT INTO `shifts` VALUES ('10', '', '5.00pm', '6.00pm', '10');

-- ----------------------------
-- Table structure for `status`
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(5) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('1', 'Yes');
INSERT INTO `status` VALUES ('2', 'No');

-- ----------------------------
-- Table structure for `stock_deductions`
-- ----------------------------
DROP TABLE IF EXISTS `stock_deductions`;
CREATE TABLE `stock_deductions` (
  `stock_deductions_id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_deductions_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stock_deductions_pack_size` int(11) NOT NULL,
  `stock_deductions_quantity` int(11) NOT NULL,
  `drugs_id` int(11) NOT NULL,
  `container_type_id` int(11) NOT NULL,
  PRIMARY KEY (`stock_deductions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of stock_deductions
-- ----------------------------

-- ----------------------------
-- Table structure for `store`
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(20) NOT NULL,
  `store_price` int(11) DEFAULT NULL,
  `store_status` int(11) NOT NULL DEFAULT '1',
  `store_image_name` varchar(50) NOT NULL,
  `store_preffix` varchar(11) NOT NULL,
  `store_parent` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `branch_code` varchar(4) DEFAULT NULL,
  `in_service_charge_status` int(11) DEFAULT '0',
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of store
-- ----------------------------

-- ----------------------------
-- Table structure for `store_product`
-- ----------------------------
DROP TABLE IF EXISTS `store_product`;
CREATE TABLE `store_product` (
  `store_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`store_product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=436 DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `supplier`
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(45) DEFAULT NULL,
  `supplier_phone` varchar(45) DEFAULT NULL,
  `supplier_email` varchar(45) DEFAULT NULL,
  `supplier_physical_address` varchar(45) DEFAULT NULL,
  `supplier_contact_person` varchar(100) DEFAULT NULL,
  `supplier_status` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `branch_code` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', 'Boniface Mwangi Contractor', '0770827872', 'bonifacemwangi.com', '0024 - 4552  Kisii ODP, Kisii', 'Biniface', '1', '2015-09-25 14:39:34', '2015-09-25 15:39:10', '0', '0', 'KSH');

-- ----------------------------
-- Table structure for `supplier_order`
-- ----------------------------
DROP TABLE IF EXISTS `supplier_order`;
CREATE TABLE `supplier_order` (
  `supplier_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `qoutation_attachment` varchar(255) DEFAULT NULL,
  `total_qoute_amount` double DEFAULT NULL,
  `supplier_order_status` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  `request_form_attachment` varchar(255) DEFAULT NULL,
  `lpo_form_attachment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`supplier_order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of supplier_order
-- ----------------------------
INSERT INTO `supplier_order` VALUES ('1', '1', '1', null, null, '0', '2015-09-30 14:07:47', '3', null, '3', null, null);
INSERT INTO `supplier_order` VALUES ('2', '1', '2', null, null, '0', '2015-09-30 16:32:09', '3', null, '3', null, null);

-- ----------------------------
-- Table structure for `supplier_product`
-- ----------------------------
DROP TABLE IF EXISTS `supplier_product`;
CREATE TABLE `supplier_product` (
  `supplier_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier_product_cost` double DEFAULT NULL,
  `supplier_product_discount` double DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `last_modified_by` int(11) DEFAULT NULL,
  `supplier_product_status` int(11) DEFAULT '0',
  PRIMARY KEY (`supplier_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of supplier_product
-- ----------------------------

-- ----------------------------
-- Table structure for `supplier_tender`
-- ----------------------------
DROP TABLE IF EXISTS `supplier_tender`;
CREATE TABLE `supplier_tender` (
  `supplier_tender_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `tender_id` int(11) NOT NULL,
  PRIMARY KEY (`supplier_tender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of supplier_tender
-- ----------------------------

-- ----------------------------
-- Table structure for `sync`
-- ----------------------------
DROP TABLE IF EXISTS `sync`;
CREATE TABLE `sync` (
  `sync_id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `sync_status` tinyint(4) DEFAULT '0',
  `sync_type` tinyint(4) DEFAULT NULL,
  `sync_table_id` int(11) DEFAULT NULL,
  `sync_table_key` int(11) DEFAULT NULL,
  `remote_pk` int(11) DEFAULT NULL,
  `branch_code` varchar(10) DEFAULT NULL,
  `sync_data` text,
  `local_pk` int(11) DEFAULT NULL,
  PRIMARY KEY (`sync_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6628 DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `sync_table`
-- ----------------------------
DROP TABLE IF EXISTS `sync_table`;
CREATE TABLE `sync_table` (
  `sync_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `sync_table_name` varchar(255) DEFAULT NULL,
  `sync_table_status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sync_table_cloud_save_function` varchar(50) DEFAULT NULL,
  `table_key_name` varchar(30) DEFAULT NULL,
  `branch_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sync_table_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sync_table
-- ----------------------------
INSERT INTO `sync_table` VALUES ('1', 'patients', '1', '0', '0', '2015-09-17 18:46:30', '2015-10-20 19:39:24', 'save_patients', 'patient_id', 'OSH');
INSERT INTO `sync_table` VALUES ('2', 'visit', '1', '0', '0', '2015-09-17 21:58:37', '2015-10-20 19:39:20', 'save_visits', 'visit_id', 'OSH');
INSERT INTO `sync_table` VALUES ('3', 'visit_charge', '1', '0', '0', '2015-09-17 21:59:01', '2015-10-20 19:39:19', 'save_visit_charges', 'visit_charge_id', 'OSH');
INSERT INTO `sync_table` VALUES ('4', 'payments', '1', '0', '0', '2015-10-20 18:40:19', '2015-10-20 19:40:19', 'save_payments', 'payment_id', 'OSH');

-- ----------------------------
-- Table structure for `sync_type`
-- ----------------------------
DROP TABLE IF EXISTS `sync_type`;
CREATE TABLE `sync_type` (
  `sync_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `sync_type_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sync_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sync_type
-- ----------------------------

-- ----------------------------
-- Table structure for `table`
-- ----------------------------
DROP TABLE IF EXISTS `table`;
CREATE TABLE `table` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(30) NOT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of table
-- ----------------------------
INSERT INTO `table` VALUES ('1', 'basic_pay');
INSERT INTO `table` VALUES ('2', 'personnel');
INSERT INTO `table` VALUES ('3', 'allowance');
INSERT INTO `table` VALUES ('4', 'deduction');
INSERT INTO `table` VALUES ('5', 'savings');
INSERT INTO `table` VALUES ('6', 'loan_scheme');
INSERT INTO `table` VALUES ('7', 'payment');
INSERT INTO `table` VALUES ('8', 'benefit');
INSERT INTO `table` VALUES ('9', 'paye');
INSERT INTO `table` VALUES ('10', 'relief');
INSERT INTO `table` VALUES ('11', 'nssf');
INSERT INTO `table` VALUES ('12', 'nhif');
INSERT INTO `table` VALUES ('13', 'other_deduction');
INSERT INTO `table` VALUES ('14', 'insruance_relief');
INSERT INTO `table` VALUES ('15', 'insurance_amount');
INSERT INTO `table` VALUES ('16', 'insurance_relief');

-- ----------------------------
-- Table structure for `targets`
-- ----------------------------
DROP TABLE IF EXISTS `targets`;
CREATE TABLE `targets` (
  `target_id` int(11) NOT NULL AUTO_INCREMENT,
  `target_name` varchar(50) NOT NULL,
  PRIMARY KEY (`target_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of targets
-- ----------------------------
INSERT INTO `targets` VALUES ('1', 'patients');
INSERT INTO `targets` VALUES ('2', 'revenue');

-- ----------------------------
-- Table structure for `title`
-- ----------------------------
DROP TABLE IF EXISTS `title`;
CREATE TABLE `title` (
  `title_id` int(11) NOT NULL AUTO_INCREMENT,
  `title_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`title_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of title
-- ----------------------------
INSERT INTO `title` VALUES ('1', 'Mr.');
INSERT INTO `title` VALUES ('2', 'Mrs.');
INSERT INTO `title` VALUES ('3', 'Miss');
INSERT INTO `title` VALUES ('4', 'Doc.');
INSERT INTO `title` VALUES ('5', 'Prof.');
INSERT INTO `title` VALUES ('6', 'Fr.');
INSERT INTO `title` VALUES ('7', 'Sr.');
INSERT INTO `title` VALUES ('8', 'Br.');

-- ----------------------------
-- Table structure for `transaction_type`
-- ----------------------------
DROP TABLE IF EXISTS `transaction_type`;
CREATE TABLE `transaction_type` (
  `transaction_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_type_name` varchar(20) DEFAULT NULL,
  `transaction_type_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`transaction_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of transaction_type
-- ----------------------------
INSERT INTO `transaction_type` VALUES ('1', 'Debit', '1');
INSERT INTO `transaction_type` VALUES ('2', 'Credit', '1');

-- ----------------------------
-- Table structure for `unit`
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(45) DEFAULT NULL,
  `unit_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;



-- ----------------------------
-- Table structure for `vat`
-- ----------------------------
DROP TABLE IF EXISTS `vat`;
CREATE TABLE `vat` (
  `vat_id` int(11) NOT NULL AUTO_INCREMENT,
  `vat_name` varchar(20) NOT NULL,
  `vat_amount` int(11) NOT NULL,
  PRIMARY KEY (`vat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vat
-- ----------------------------
INSERT INTO `vat` VALUES ('1', 'Inclusive', '16');
INSERT INTO `vat` VALUES ('2', 'Exempted', '0');
INSERT INTO `vat` VALUES ('5', '', '0');
