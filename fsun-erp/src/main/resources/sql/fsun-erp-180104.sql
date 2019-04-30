/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50533
Source Host           : localhost:3306
Source Database       : fsun-erp

Target Server Type    : MYSQL
Target Server Version : 50533
File Encoding         : 65001

Date: 2017-12-01 21:15:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bus_after_process
-- ----------------------------
DROP TABLE IF EXISTS `bus_after_process`;
CREATE TABLE `bus_after_process` (
  `id` varchar(32) NOT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  `is_outsourc` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `demand` text,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_after_process
-- ----------------------------
INSERT INTO `bus_after_process` VALUES ('402887e64e855816014e859401a70013', '402887e64e00373f014e0039f18e0002', '是', '覆膜', '0', '', '');
INSERT INTO `bus_after_process` VALUES ('402887e64e855816014e859401a70014', '402887e64e00373f014e0039f18e0002', '是', '烫金', '0', '', '');
INSERT INTO `bus_after_process` VALUES ('4028d9814f12a51b014f12a8adf40003', '4028d9814f12a51b014f12a8ad7e0002', '是', 'UV', '0', '', '');
INSERT INTO `bus_after_process` VALUES ('4028d9814f12a51b014f12aafe450006', '4028d9814f12a51b014f12aa738f0005', '是', 'UV', '0', '', '');
INSERT INTO `bus_after_process` VALUES ('4028d9814f12a51b014f12aea8e4000f', '4028d9814f12a51b014f12ae5dc3000d', '是', '烫金', '0', '', '');
INSERT INTO `bus_after_process` VALUES ('4028d9814f12a51b014f12b0083e0016', '4028d9814f12a51b014f12aff4dc0014', '是', '烫金', '0', '', '');
INSERT INTO `bus_after_process` VALUES ('4028d98152f266950152f2695ade0002', '4028d981529701d101529706e4ca0003', '是', 'UV', '0', '', '');
INSERT INTO `bus_after_process` VALUES ('4028d98153267de5015326840f73000b', '4028d98153267de501532682475d0002', '是', '碰刀', '0', '', '');
INSERT INTO `bus_after_process` VALUES ('4028d98153267de5015326840f73000c', '4028d98153267de501532682475d0002', '是', '切纸', '0', '', '');
INSERT INTO `bus_after_process` VALUES ('4028d98153267de5015326840f73000d', '4028d98153267de501532682475d0002', '是', '印刷', '0', '', '');
INSERT INTO `bus_after_process` VALUES ('4028d98153267de5015326840f73000e', '4028d98153267de501532682475d0002', '是', 'UV', '0', '', '');
INSERT INTO `bus_after_process` VALUES ('4028d98153267de5015326840f73000f', '4028d98153267de501532682475d0002', '是', '烫金', '0', '', '');
INSERT INTO `bus_after_process` VALUES ('4028d9815dfff267015dfff45c4f0002', '4028d9815df5891a015df63a55f40003', '是', '切纸', '0', '', '');
INSERT INTO `bus_after_process` VALUES ('4028d9815dfff267015dfff45c4f0003', '4028d9815df5891a015df63a55f40003', '是', '烫金', '0', '', '');
INSERT INTO `bus_after_process` VALUES ('4028d9815dfff267015dfff45c4f0004', '4028d9815df5891a015df63a55f40003', '是', '印刷', '0', '', '');

-- ----------------------------
-- Table structure for bus_buy_info
-- ----------------------------
DROP TABLE IF EXISTS `bus_buy_info`;
CREATE TABLE `bus_buy_info` (
  `id` int(18) NOT NULL AUTO_INCREMENT,
  `purchase_id` varchar(32) NOT NULL,
  `factory_id` varchar(32) DEFAULT NULL,
  `classify_id` int(10) NOT NULL,
  `materiel_id` int(10) NOT NULL,
  `number` int(11) NOT NULL,
  `unit` varchar(32) DEFAULT NULL,
  `one_price` decimal(10,1) DEFAULT NULL,
  `all_price` decimal(10,1) DEFAULT NULL,
  `description` text,
  `create_man_id` char(32) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `spec` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='进货信息表的基本信息\r\n';

-- ----------------------------
-- Records of bus_buy_info
-- ----------------------------
INSERT INTO `bus_buy_info` VALUES ('15', '2016020001', '4028d98153174a9101531755daa2009c', '8', '5', '11', '张', '1.0', '11.0', '2222', '402882be46404313014640b7eb1c000f', '1', null, '2016-02-24 00:10:18');
INSERT INTO `bus_buy_info` VALUES ('16', '2016020001', '4028870252af460c0152af495a000004', '9', '6', '110', '张', '2.0', '220.0', null, '402882be46404313014640b7eb1c000f', '1', null, '2016-02-24 00:10:48');
INSERT INTO `bus_buy_info` VALUES ('17', '2016020002', '4028d98153174a9101531755daa2009c', '8', '5', '222', '张', '1.0', '222.0', null, '402882be46404313014640b7eb1c000f', '0', '157克', '2016-02-25 02:25:40');
INSERT INTO `bus_buy_info` VALUES ('18', '2016020002', '4028d9815365d4c5015365d6aebc0002', '8', '5', '200', '张', '1.0', '200.0', null, '402882be46404313014640b7eb1c000f', '1', '157克', '2016-02-25 13:47:59');
INSERT INTO `bus_buy_info` VALUES ('19', '2016020002', '4028d98153174a9101531755daa2009c', '9', '6', '1000', '张', '2.0', '2000.0', null, '402882be46404313014640b7eb1c000f', '0', '200克', '2016-02-25 13:48:11');
INSERT INTO `bus_buy_info` VALUES ('20', '2016020002', '4028d98153174a9101531755daa2009c', '9', '6', '1000', '张', '2.0', '2000.0', null, '402882be46404313014640b7eb1c000f', '0', '200克', '2016-02-25 13:48:21');
INSERT INTO `bus_buy_info` VALUES ('29', '2016020001', '4028870252af460c0152af495a000004', '8', '5', '3000', '张', '1.0', '3000.0', null, '402882be46404313014640b7eb1c000f', '1', '157克', '2016-02-25 19:31:02');
INSERT INTO `bus_buy_info` VALUES ('30', '2016020001', '4028d98153174a9101531755daa2009c', '8', '5', '111', '张', '1.0', '111.0', null, '402882be46404313014640b7eb1c000f', '1', '157克', '2016-03-05 16:59:11');

-- ----------------------------
-- Table structure for bus_classify_info
-- ----------------------------
DROP TABLE IF EXISTS `bus_classify_info`;
CREATE TABLE `bus_classify_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `unit` varchar(32) DEFAULT NULL,
  `description` text,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_classify_info
-- ----------------------------
INSERT INTO `bus_classify_info` VALUES ('9', '特种纸', '张', null, '1');
INSERT INTO `bus_classify_info` VALUES ('10', '其他', '其他', null, '1');
INSERT INTO `bus_classify_info` VALUES ('11', '油墨', '桶', null, '1');
INSERT INTO `bus_classify_info` VALUES ('12', '普通纸', '张', null, '1');

-- ----------------------------
-- Table structure for bus_customer_info
-- ----------------------------
DROP TABLE IF EXISTS `bus_customer_info`;
CREATE TABLE `bus_customer_info` (
  `id` varchar(32) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `contacts` varchar(32) DEFAULT NULL,
  `address` text,
  `tel` varchar(32) DEFAULT NULL,
  `fax` varchar(32) DEFAULT NULL,
  `description` text,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_customer_info
-- ----------------------------
INSERT INTO `bus_customer_info` VALUES ('402887e64edcab2c014edcb3913b0002', '0002', '小红', null, null, null, null, null, '0');
INSERT INTO `bus_customer_info` VALUES ('4028d9814e346bd1014e34fa27be0004', '0001', '小明', '王敏', '湖北武汉', '18868384669', null, null, '1');
INSERT INTO `bus_customer_info` VALUES ('4028d9814f6387dc014f639503e40004', '0003', '小二', null, null, null, null, null, '1');
INSERT INTO `bus_customer_info` VALUES ('4028d98153282231015328402dbb0011', '0012', '201', null, null, null, null, null, '1');
INSERT INTO `bus_customer_info` VALUES ('4028d9815345f434015345ff21dd0002', '0013', '12345', null, null, null, null, null, '1');
INSERT INTO `bus_customer_info` VALUES ('4028d9815e1547e4015e15499c1c0001', '0014', '小孙', '小吴', '汉坊5号', '18868384668', '0873-68889646', null, '1');

-- ----------------------------
-- Table structure for bus_delivery_detail
-- ----------------------------
DROP TABLE IF EXISTS `bus_delivery_detail`;
CREATE TABLE `bus_delivery_detail` (
  `id` varchar(32) NOT NULL,
  `order_code` varchar(256) DEFAULT NULL,
  `delivery_code` varchar(32) DEFAULT NULL,
  `product_code` varchar(32) DEFAULT NULL,
  `product_name` varchar(64) DEFAULT NULL,
  `style` varchar(128) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `unit` varchar(32) DEFAULT NULL,
  `one_price` double(10,2) DEFAULT NULL,
  `all_price` double(10,2) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_delivery_detail
-- ----------------------------
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e22d108015e22dcf0940032', '20170825100001', '20170827300005', '0013', '123333', null, '2000', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e22d108015e22dcfdc20034', '20170825100001', '20170827300004', '0013', '123333', null, '2000', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e22d108015e22dd08d70036', '20170825100001', '20170827300003', '0013', '123333', null, '2000', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e22d108015e22dd14810038', '2016020002', '20170827300002', '0017', '5555', null, '600', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e22d108015e22dd14810039', '2016020002', '20170827300002', '0015', '包括', null, '1700', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e22d108015e22dd1481003a', '2016020002', '20170827300002', '0019', '测试1', '123', '17', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e22d108015e22dd1481003b', '2016020002', '20170827300002', '0019', '测试1', '234', '800', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e22d108015e22dd1481003c', '2016020002', '20170827300002', '0019', '测试1', '345', '777', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e22d108015e22dd1481003d', '2016020002', '20170827300002', '0019', '测试1', '中文', '100', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e22d108015e22dd1ee5003f', '201708240001', '20170827300001', '0015', '包括', null, '200', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e22d108015e22dd1ee60040', '201708240001', '20170827300001', '0019', '测试1', '中文', '4000', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e22d108015e22dd2be50042', '2016020002', '20170826300001', '0019', '测试1', '123', '17', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e22d108015e22dd2be50043', '20170825100001', '20170826300001', '0013', '123333', null, '2000', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e8b2fcb015e8b31aad50002', '20170825100001', '20170906300001', '0020', '1', '11221', '22', '桶', '2.00', '44.00', '221321');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e8b2fcb015e8b31aad50003', '2015100001', '20170906300001', '0015', '包括', '', '12000', '只', '22.00', '264000.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e8b2fcb015e8b31aad50004', '2015100001', '20170906300001', '0014', '2332134', null, '11111', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e8b2fcb015e8b31aad50005', '2016020002', '20170906300001', '0019', '测试1', '345', '777', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e8b2fcb015e8b31aad50006', '2016020002', '20170906300001', '0019', '测试1', '中文', '100', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e8b2fcb015e8b31aadf0007', '2016020002', '20170906300001', '0017', '5555', null, '600', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e8e5e83015e8e8f1a3e0017', '20170916100001,2016020002', '20170917300002', '0019', '测试1', '345', '1767', '只', '1.10', '1943.70', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e8e5e83015e8e8f1a3e0018', '2016020002', '20170917300002', '0019', '测试1', '234', '800', '只', '0.30', '240.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e8e5e83015e8e8f1a3e0019', '2016020002', '20170917300002', '0019', '测试1', '中文', '10', '只', '0.21', '2.10', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e8e5e83015e8e8f1a3e001a', '2016020002', '20170917300002', '0017', '5555', null, '100', '只', '0.01', '1.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815e8e5e83015e8e8f1a3e001b', '2016020002', '20170917300002', '0015', '包括', null, '1700', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815ef2486c015ef2783ee30025', '20171007100006', null, '0022', '测试长度', '123456789', '100', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815ef2486c015ef2783ee30026', '20171007100006', null, '0018', '43434', '123', '200', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815ef2486c015ef2783ee40027', '20171007100006', null, '0018', '43434', '888', '300', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815ef2801e015ef2874d46002d', '20171006100001', '20171007300001', '0022', '测试长度', '123456789', '11', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815ef2801e015ef2874d47002e', '20171006100001', '20171007300001', '0019', '测试1', '123', '20', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815ef2801e015ef2874d47002f', '20171007100001', '20171007300001', '0018', '43434', '123', '3', '只', '0.00', '0.00', '');
INSERT INTO `bus_delivery_detail` VALUES ('4028d9815efa8e23015efa8f9d3b0003', '20171007100001', '201710300001', '0018', '43434', '123', '1', '只', '0.00', '0.00', '');

-- ----------------------------
-- Table structure for bus_delivery_header
-- ----------------------------
DROP TABLE IF EXISTS `bus_delivery_header`;
CREATE TABLE `bus_delivery_header` (
  `id` varchar(32) NOT NULL,
  `delivery_code` varchar(32) NOT NULL,
  `customer_code` varchar(64) DEFAULT NULL,
  `customer_name` varchar(64) DEFAULT NULL,
  `delivery_type` int(11) DEFAULT NULL,
  `create_man_name` varchar(32) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `tel` varchar(32) DEFAULT NULL,
  `contacts` varchar(32) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `express` varchar(64) DEFAULT NULL,
  `contract` varchar(64) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `receive_time` datetime DEFAULT NULL,
  `order_code` varchar(256) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `print_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `delivery_code_index` (`delivery_code`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_delivery_header
-- ----------------------------
INSERT INTO `bus_delivery_header` VALUES ('4028d9815e19fd1b015e1a03d4de0004', '20170825300001', '0001', '', '1', '超级管理员', '湖北武汉', '18868384669', '王敏', '2017-08-26', '', '', '', '1', '1', '2017-08-27 16:06:54', '20170825100001', '2017-08-25 23:30:12', '0');
INSERT INTO `bus_delivery_header` VALUES ('4028d9815e1cafd4015e1cbc20780005', '20170826300001', '0001', '小明', '1', '超级管理员', '湖北武汉', '18868384669', '王敏', '2017-08-26', '', '', '', '0', '1', null, '2016020002,20170825100001', '2017-08-26 12:10:44', '0');
INSERT INTO `bus_delivery_header` VALUES ('4028d9815e22d108015e22d1c21f0002', '20170827300001', '0012', '201', '1', '超级管理员', '', '', '', '2017-08-27', '', '', '', '0', '1', null, '201708240001', '2017-08-27 16:32:05', '1');
INSERT INTO `bus_delivery_header` VALUES ('4028d9815e22d108015e22d1f9a50006', '20170827300002', '0003', '小二', '1', '超级管理员', '', '', '', '2017-08-27', '', '', '', '0', '1', null, '2016020002', '2017-08-27 16:32:19', '0');
INSERT INTO `bus_delivery_header` VALUES ('4028d9815e22d108015e22d4c6b7000e', '20170827300003', '0012', '201', '1', '超级管理员', '', '', '', '2017-08-27', '', '', '', '0', '1', null, '20170825100001', '2017-08-27 16:35:23', '1');
INSERT INTO `bus_delivery_header` VALUES ('4028d9815e22d108015e22d8a1f70011', '20170827300004', '0001', '小明', '1', '超级管理员', '湖北武汉', '18868384669', '王敏', '2017-08-27', '', '', '', '0', '1', null, '20170825100001', '2017-08-27 16:39:36', '1');
INSERT INTO `bus_delivery_header` VALUES ('4028d9815e22d108015e22d9ee360014', '20170827300005', '0014', '小孙', '1', '超级管理员', '汉坊5号', '18868384668', '小吴', '2017-08-27', '', '', '', '0', '1', null, '20170825100001', '2017-08-27 16:41:01', '1');
INSERT INTO `bus_delivery_header` VALUES ('4028d9815e54ed71015e54f041fb0003', '20170906300001', '0001', '小明', '1', '超级管理员', '湖北武汉', '18868384669', '王敏', '2017-09-06', '', '', '', '0', '1', null, '20170825100001,2015100001,2016020002', '2017-09-06 10:06:25', '1');
INSERT INTO `bus_delivery_header` VALUES ('4028d9815e8e5e83015e8e8df5e0000a', '20170917300002', '0001', '小明', '1', '超级管理员', '湖北武汉', '18868384669', '王敏', '2017-09-17', '', '', '', '0', '1', null, '20170916100001,2016020002', '2017-09-17 14:37:01', '1');
INSERT INTO `bus_delivery_header` VALUES ('4028d9815ef2801e015ef286083e0028', '20171007300001', '0001', '小明', '1', '超级管理员', '湖北武汉', '18868384669', '王敏', '2017-10-07', '', '', '', '0', '1', null, '20171006100001,20171007100001', '2017-10-07 00:30:23', '0');
INSERT INTO `bus_delivery_header` VALUES ('4028d9815efa8e23015efa8f9d3b0002', '201710300001', '0001', '小明', '1', '超级管理员', '湖北武汉', '18868384669', '王敏', '2017-10-08', '', '', '', '0', '1', null, '20171007100001', '2017-10-08 13:57:49', '0');

-- ----------------------------
-- Table structure for bus_factory_info
-- ----------------------------
DROP TABLE IF EXISTS `bus_factory_info`;
CREATE TABLE `bus_factory_info` (
  `id` char(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `type` varchar(32) NOT NULL,
  `technology` varchar(256) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `mobile_telephone` varchar(32) DEFAULT NULL,
  `legal_person` varchar(64) DEFAULT NULL,
  `address` text,
  `description` text,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_factory_info
-- ----------------------------
INSERT INTO `bus_factory_info` VALUES ('4028870252af460c0152af495a000004', '小陈-辅料', '销售类', null, null, null, '小陈', '浙江省嘉兴市海盐县百步镇横港村汉坊印刷园广信街', null, '1');
INSERT INTO `bus_factory_info` VALUES ('4028d98152a5bc5a0152a5bf30b50004', '小毛', '加工类', '碰刀', null, '18868384668', '小毛', null, null, '1');
INSERT INTO `bus_factory_info` VALUES ('4028d98153174a9101531755daa2009c', '华港纸业', '销售类', null, null, null, '小王', null, null, '1');
INSERT INTO `bus_factory_info` VALUES ('4028d9815365d4c5015365d6aebc0002', '吴顺友物资', '销售类', null, null, null, null, null, null, '1');
INSERT INTO `bus_factory_info` VALUES ('4028d9815e835e52015e837ad28e001b', '德胜印刷厂', '制造类', null, null, null, null, null, null, '1');
INSERT INTO `bus_factory_info` VALUES ('4028d9815e835e52015e837ced5d001d', '小名', '加工类', '碰刀', null, null, null, null, null, '1');
INSERT INTO `bus_factory_info` VALUES ('4028d9815e842f88015e845d86a70002', '小王', '加工类', '碰刀', null, null, null, null, null, '1');
INSERT INTO `bus_factory_info` VALUES ('4028d9815e842f88015e845f10860004', '王孙', '加工类', '碰刀', null, null, null, null, null, '1');
INSERT INTO `bus_factory_info` VALUES ('4028d9815e842f88015e845ff0560006', '小鱼', '加工类', '碰刀', null, null, null, null, null, '1');
INSERT INTO `bus_factory_info` VALUES ('4028d9815e842f88015e84606bde0008', '小雨', '加工类', '碰刀', null, null, null, null, null, '1');
INSERT INTO `bus_factory_info` VALUES ('4028d9815e842f88015e8461ccaf000a', '大雨', '加工类', '碰刀', null, null, null, null, null, '1');
INSERT INTO `bus_factory_info` VALUES ('4028d9815e842f88015e8466d9b2000c', '大雨1', '加工类', '碰刀', null, null, null, null, null, '1');
INSERT INTO `bus_factory_info` VALUES ('4028d9815e842f88015e8467565c000e', '订单', '加工类', '碰刀', null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for bus_made_detail
-- ----------------------------
DROP TABLE IF EXISTS `bus_made_detail`;
CREATE TABLE `bus_made_detail` (
  `id` varchar(32) NOT NULL,
  `made_code` varchar(32) NOT NULL,
  `order_code` varchar(256) DEFAULT NULL,
  `product_code` varchar(32) NOT NULL,
  `style` varchar(512) DEFAULT NULL,
  `material` varchar(32) DEFAULT NULL,
  `spec` varchar(32) DEFAULT NULL,
  `open_num` int(11) DEFAULT NULL,
  `open_size` varchar(64) DEFAULT NULL,
  `open_method` varchar(128) DEFAULT NULL,
  `model` varchar(32) DEFAULT NULL,
  `layout` varchar(16) DEFAULT NULL,
  `process` varchar(64) DEFAULT NULL,
  `papers` int(11) DEFAULT NULL,
  `prints` int(11) DEFAULT NULL,
  `colors` int(11) DEFAULT NULL,
  `impos` int(11) DEFAULT NULL,
  `expects` int(11) DEFAULT NULL,
  `actuals` int(11) DEFAULT NULL,
  `loss` int(11) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `process_code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_made_detail
-- ----------------------------
INSERT INTO `bus_made_detail` VALUES ('4028d9815e077dc0015e07c3e6c20004', '170822102703599551767764', '2016020002', '0019', '测试1(345)', '双铜纸', '标规', '16', '30*40', null, '海德堡46机', '正反', 'CTP', null, null, '4', '8', null, null, null, '12345678', '170822102706759553509573');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e086644015e086eb3e70003', '170821162730442551000687', '2016020001', '0018', '43434(123)', '', '', null, '', null, '', '', '菲林', null, null, null, null, null, null, null, '', '170822133336415553976025');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e097079015e0a42bd9b0025', '170822152252959551381429', '2016020002', '0019', '测试1(123/234/345/中文)', '双铜纸', '标规', '16', '30*40', null, '海德堡4色机', '正反', 'CTP', '1000', '16000', '4', '8', '16000', '1500', '1000', '12345678才是对的擦打算', '170822152301356553053738');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e097079015e0a42bd9b0026', '170822152252959551381429', '2016020002', '0019', '测试1(123/234)', '双铜纸', '标规', '16', '30*40', null, '海德堡46机', '正反', 'CTP', null, null, '4', '8', null, null, null, '12345678', '170822194030227553241331');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e097079015e0a42bd9c0027', '170822152252959551381429', '2016020002', '0015', '包括', '', '定规', null, '', null, '', '单面', '菲林', null, null, null, null, null, null, null, '', '170822220435815553401127');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e097079015e0a42bd9c0028', '170822152252959551381429', '2016020002', '0017', '5555', '', '', null, '', null, '滨田机', '', '菲林', null, null, null, null, null, null, null, '', '170822220441596553705232');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e097079015e0a42bd9c0029', '170822152252959551381429', '2016020002', '0019', '测试1(234)', '双铜纸', '标规', '16', '30*40', null, '滨田机', '正反', 'CTP', null, null, '4', '8', null, null, null, '12345678', '170822220447703553053205');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e097079015e0a42bd9c002a', '170822152252959551381429', '2016020002', '0019', '测试1(345)', '双铜纸', '标规', '16', '30*40', null, '滨田机', '正反', 'CTP', null, null, '4', '8', null, null, null, '12345678', '170822220454076553505739');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e14c199015e14c4e352000c', '170824230302888551142984', '201708240001', '0019', '测试1(中文)', '双铜纸', '标规', '16', '30*40', null, '海德堡46机', '正反', 'CTP', null, null, '4', '8', null, null, null, '12345678', '170824230307806553367355');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e14c199015e14c4e352000d', '170824230302888551142984', '201708240001', '0015', '包括', '', '定规', null, '', null, '滨田机', '单面', '菲林', null, null, null, null, null, null, null, '', '170824230313093553552444');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e1540d7015e1544b2c70003', '170825012012975551497629', '2016020002,201708240001', '0019', '测试1(中文/中文)', '双铜纸', '标规', '16', '30*40', null, '海德堡46机', '正反', 'CTP', null, null, '4', '8', null, null, null, '12345678', '170825012155438553466486');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e1540d7015e1544b2c80004', '170825012012975551497629', '2016020002,201708240001', '0015', '包括', '', '定规', null, '', null, '', '单面', '菲林', null, null, null, null, null, null, null, '', '170825012237357553732224');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e64b891015e64dbeeb20005', '20170827300001', '20170825100001', '0013', '123333', '', '', null, '231', null, '', '', '菲林', null, null, null, null, null, null, null, '', '170904164747337553415610');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e64b891015e64dbeeb30006', '20170827300001', '20170825100001', '0013', '123333', '双铜纸', '标规', '3', '4*5', null, '滨田机', '正反', '菲林', '1000', '3000', '4', '4', '4000', '3900', '100', '12332', '170904163118570553975059');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e65dd32015e65e6f05b0003', '20170827300002', '2015100001', '0014', '2332134', '', '', null, '', null, '', '', '菲林', null, null, null, null, null, null, null, '', '170827074046534553257954');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e65dd32015e65e6f05b0004', '20170827300002', '2015100001', '0014', '2332134', '', '', null, '', null, '', '', '菲林', null, null, null, null, null, null, null, '', '170827074029401553926970');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e835e52015e8372dc69000d', '20170915300001', '2017082410001', '0015', '包括', '', '定规', null, '', null, '', '单面', '菲林', null, null, null, null, null, null, null, '', '170915105008022553975555');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e835e52015e8372dc69000e', '20170915300001', '20170825100001', '0019', '测试1(345)', '双铜纸', '标规', '16', '30*40', null, '海德堡46机', '正反', 'CTP', null, null, '4', '8', null, null, null, '12345678', '170915105129494553684310');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e8b2fcb015e8b389de90016', '20170916300002', '20170825100001,2017082410001', '0015', '包括', '', '定规', null, '', null, '', '单面', '菲林', null, null, null, null, null, null, null, '', '170916230434910553538857');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e8b2fcb015e8b389de90017', '20170916300002', '2017082410001', '0010', '12', '', '', null, '', null, '', '', '菲林', null, null, null, null, null, null, null, '', '170916230445058553854921');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e8b2fcb015e8b3d66f60029', '20170916300003', '20170916100001', '0019', '测试1(456/中文)', '双铜纸', '标规', '16', '30*40', null, '海德堡46机', '正反', 'CTP', null, null, '4', '8', null, null, null, '12345678', '170916230955486553075030');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e8b2fcb015e8b3d66f6002a', '20170916300003', '20170916100001', '0020', '1(11221)', '', '', null, '', null, '', '', '菲林', null, null, null, null, null, null, null, '', '170916231005092553399820');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e8b2fcb015e8b4531b0003c', '20170916300005', '201708240001', '0019', '测试1(中文)', '双铜纸', '标规', '16', '30*40', null, '海德堡46机', '正反', 'CTP', null, null, '4', '8', null, null, null, '12345678', '170916231832319553092383');
INSERT INTO `bus_made_detail` VALUES ('4028d9815e8b2fcb015e8b4531b0003d', '20170916300005', '20170916100001', '0020', '1(11221)', '', '', null, '', null, '', '', '菲林', null, null, null, null, null, null, null, '', '170916231837329553174007');
INSERT INTO `bus_made_detail` VALUES ('4028d9815ec84766015ec8623eea0043', '20170912300001', '20170825100001', '0013', '123333', '', '', null, '', null, '', '', '菲林', null, null, null, null, null, null, null, '', '170928200711349553419985');
INSERT INTO `bus_made_detail` VALUES ('4028d9815ec84766015ec867c5800048', '20170916300001', '20170825100001', '0019', '测试1(234)', '双铜纸', '标规', '16', '30*40', null, '海德堡46机', '正反', 'CTP', null, null, '4', '8', null, null, null, '12345678', '170916225819239553010447');
INSERT INTO `bus_made_detail` VALUES ('4028d9815ec84766015ec867c5800049', '20170916300001', '20170916100001', '0021', '1234567891234567891234567891234546789', '', '大规', null, '', null, '52机', '正反', '菲林', null, null, null, null, null, null, null, '', '170928201307105553071889');
INSERT INTO `bus_made_detail` VALUES ('4028d9815effc819015f003349140004', '20170916300004', '20170825100001', '0019', '测试1(345)', '双铜纸', '标规', '16', '30*40', null, '海德堡46机', '正反', 'CTP', null, null, '4', '8', null, null, null, '12345678', '170916231614164553955905');
INSERT INTO `bus_made_detail` VALUES ('4028d9815effc819015f003349140005', '20170916300004', '20170916100001', '0022', '测试长度(123456789/123456789/234567891/678912345/7891234567)', '擦拭的撒的静安寺阿萨德', '标规', '16', '', null, '', '', '菲林', '4765456', '4234', null, null, null, null, null, '', '170928195219191553688540');
INSERT INTO `bus_made_detail` VALUES ('4028d9815effc819015f003349140006', '20170916300004', '20170916100001', '0023', '侧的萨达是打算打算的的啊', '', '', null, '', null, '', '', '菲林', null, null, null, null, null, null, null, '', '170928203234435553563918');
INSERT INTO `bus_made_detail` VALUES ('8a8a88995e76dd12015e76f7e39b0003', '20170913300001', '20170825100001', '0020', '1(11221)', '', '', null, '', null, '滨田机', '单面', '菲林', null, null, null, null, null, null, null, '', '170913004054413553934335');
INSERT INTO `bus_made_detail` VALUES ('8a8a88995e76dd12015e76f7e39c0004', '20170913300001', '20170825100001', '0015', '包括', 'kjh', '定规', null, '', null, '52机', '单面', '菲林', null, null, null, null, null, null, null, '', '170913004049380553017041');

-- ----------------------------
-- Table structure for bus_made_header
-- ----------------------------
DROP TABLE IF EXISTS `bus_made_header`;
CREATE TABLE `bus_made_header` (
  `id` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `order_code` varchar(256) DEFAULT NULL,
  `print_status` tinyint(1) DEFAULT NULL,
  `made_type` int(11) DEFAULT NULL,
  `made_code` varchar(32) NOT NULL,
  `create_man_id` varchar(32) DEFAULT NULL,
  `create_man_name` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_made_header
-- ----------------------------
INSERT INTO `bus_made_header` VALUES ('4028d9815e03d453015e03e77c880010', null, '2016020002,2016020001', '1', '1', '170821162730442551000687', '402882be46404313014640b7eb1c000f', '超级管理员', '2017-08-21 16:27:35', '0');
INSERT INTO `bus_made_header` VALUES ('4028d9815e077dc0015e07c3e6c20003', null, '2016020002', '1', '1', '170822102703599551767764', '402882be46404313014640b7eb1c000f', '超级管理员', '2017-08-22 10:27:12', '1');
INSERT INTO `bus_made_header` VALUES ('4028d9815e086644015e08d4d047000b', null, '2016020002', '1', '1', '170822152252959551381429', '402882be46404313014640b7eb1c000f', '超级管理员', '2017-08-22 15:25:18', '1');
INSERT INTO `bus_made_header` VALUES ('4028d9815e14c199015e14c4e352000b', null, '201708240001', '1', '1', '170824230302888551142984', '402882be46404313014640b7eb1c000f', '超级管理员', '2017-08-24 23:03:21', '1');
INSERT INTO `bus_made_header` VALUES ('4028d9815e1540d7015e1544b2c70002', null, '2016020002,201708240001,2017082410001', '1', '1', '170825012012975551497629', '402882be46404313014640b7eb1c000f', '超级管理员', '2017-08-25 01:22:57', '1');
INSERT INTO `bus_made_header` VALUES ('4028d9815e20c633015e20c94db40002', null, '20170825100001', '1', '1', '20170827300001', '402882be46404313014640b7eb1c000f', '超级管理员', '2017-08-27 07:03:37', '1');
INSERT INTO `bus_made_header` VALUES ('4028d9815e20c633015e20eb7a310009', null, '2015100001,2016020002,2016020001,201708240001', '1', '1', '20170827300002', '402882be46404313014640b7eb1c000f', '超级管理员', '2017-08-27 07:40:56', '1');
INSERT INTO `bus_made_header` VALUES ('4028d9815e71eab8015e7201efbd0002', null, '20170825100001', '1', '1', '20170912300001', '402882be46404313014640b7eb1c000f', '超级管理员', '2017-09-12 01:34:43', '1');
INSERT INTO `bus_made_header` VALUES ('4028d9815e835e52015e837238be0002', null, '20170825100001,2017082410001,2015080017', '1', '1', '20170915300001', '402882be46404313014640b7eb1c000f', '超级管理员', '2017-09-15 10:50:54', '1');
INSERT INTO `bus_made_header` VALUES ('4028d9815e8b2fcb015e8b329ee20009', null, '20170825100001', '1', '1', '20170916300001', '402882be46404313014640b7eb1c000f', '超级管理员', '2017-09-16 22:58:24', '1');
INSERT INTO `bus_made_header` VALUES ('4028d9815e8b2fcb015e8b389de90015', null, '2017082410001,20170825100001', '1', '1', '20170916300002', '402882be46404313014640b7eb1c000f', '超级管理员', '2017-09-16 23:04:57', '1');
INSERT INTO `bus_made_header` VALUES ('4028d9815e8b2fcb015e8b3d66f60028', null, '20170916100001', '1', '1', '20170916300003', '402882be46404313014640b7eb1c000f', '超级管理员', '2017-09-16 23:10:10', '1');
INSERT INTO `bus_made_header` VALUES ('4028d9815e8b2fcb015e8b4308a20032', null, '20170916100001,20170825100001', '1', '1', '20170916300004', '402882be46404313014640b7eb1c000f', '超级管理员', '2017-09-16 23:16:19', '1');
INSERT INTO `bus_made_header` VALUES ('4028d9815e8b2fcb015e8b4531b0003b', null, '20170916100001,201708240001', '1', '1', '20170916300005', '402882be46404313014640b7eb1c000f', '超级管理员', '2017-09-16 23:18:41', '1');
INSERT INTO `bus_made_header` VALUES ('8a8a88995e76dd12015e76f7e39b0002', null, '20170825100001', '1', '1', '20170913300001', '402882be46404313014640b7eb1c000f', '超级管理员', '2017-09-13 00:41:50', '1');

-- ----------------------------
-- Table structure for bus_made_package
-- ----------------------------
DROP TABLE IF EXISTS `bus_made_package`;
CREATE TABLE `bus_made_package` (
  `id` char(32) NOT NULL,
  `made_code` varchar(32) NOT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  `order_code` varchar(32) DEFAULT NULL,
  `order_detail_id` varchar(32) DEFAULT NULL,
  `product_name` varchar(64) DEFAULT NULL,
  `product_code` varchar(32) DEFAULT NULL,
  `style` varchar(32) DEFAULT NULL,
  `order_number` int(11) DEFAULT NULL,
  `expect_number` int(11) DEFAULT NULL,
  `real_number` int(11) DEFAULT NULL,
  `unit` varchar(32) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生产包装信息表的基本信息\r\n';

-- ----------------------------
-- Records of bus_made_package
-- ----------------------------
INSERT INTO `bus_made_package` VALUES ('4028d9815e077dc0015e07c3e6c20008', '170822102703599551767764', '4028d981529fec4b01529ff111230004', '2016020002', '4028d9815df5891a015df63b1b64000c', '测试1', '0019', '345', '777', '777', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e086644015e086eb3e70005', '170821162730442551000687', '4028d981529fec4b01529ff111230004', '2016020002', '4028d9815d9866ab015d986969950002', '包括', '0015', null, '900', '900', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e086644015e086eb3e70006', '170821162730442551000687', '4028d981529fec4b01529fecdce60002', '2016020001', '4028d9815dee762b015dee9ce2900009', '43434', '0018', '123', '0', '0', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e097079015e0a42bd9d0048', '170822152252959551381429', '4028d981529fec4b01529ff111230004', '2016020002', '4028d98153267de501532682b26c0008', '5555', '0017', null, '600', '600', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e097079015e0a42bd9d0049', '170822152252959551381429', '4028d981529fec4b01529ff111230004', '2016020002', '4028d9815d9866ab015d986969950002', '包括', '0015', null, '900', '900', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e097079015e0a42bd9d004a', '170822152252959551381429', '4028d981529fec4b01529ff111230004', '2016020002', '4028d9815d9a79a3015d9a7ce7680005', '包括', '0015', null, '800', '800', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e097079015e0a42bd9d004b', '170822152252959551381429', '4028d981529fec4b01529ff111230004', '2016020002', '4028d9815df5891a015df63aba230008', '测试1', '0019', '123', '17', '17', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e097079015e0a42bd9e004c', '170822152252959551381429', '4028d981529fec4b01529ff111230004', '2016020002', '4028d9815df5891a015df63aeb79000a', '测试1', '0019', '234', '800', '800', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e097079015e0a42bd9e004d', '170822152252959551381429', '4028d981529fec4b01529ff111230004', '2016020002', '4028d9815df5891a015df63b1b64000c', '测试1', '0019', '345', '777', '777', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e097079015e0a42bd9e004e', '170822152252959551381429', '4028d981529fec4b01529ff111230004', '2016020002', '4028d9815df5891a015df65eb36e0016', '测试1', '0019', '中文', '100', '100', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e14c199015e14c4e3530012', '170824230302888551142984', '4028d9815e14c199015e14c2ee330002', '201708240001', '4028d9815e14c199015e14c365240004', '包括', '0015', null, '200', '200', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e14c199015e14c4e3530013', '170824230302888551142984', '4028d9815e14c199015e14c2ee330002', '201708240001', '4028d9815e14c199015e14c477e40009', '测试1', '0019', '中文', '4000', '4000', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e1540d7015e1544b2c80009', '170825012012975551497629', '4028d981529fec4b01529ff111230004', '2016020002', '4028d9815d9866ab015d986969950002', '包括', '0015', null, '900', '900', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e1540d7015e1544b2c8000a', '170825012012975551497629', '4028d981529fec4b01529ff111230004', '2016020002', '4028d9815df5891a015df63aeb79000a', '测试1', '0019', '234', '800', '800', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e1540d7015e1544b2c8000b', '170825012012975551497629', '4028d981529fec4b01529ff111230004', '2016020002', '4028d9815df5891a015df63b1b64000c', '测试1', '0019', '345', '777', '777', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e1540d7015e1544b2c9000c', '170825012012975551497629', '4028d981529fec4b01529ff111230004', '2016020002', '4028d9815df5891a015df65eb36e0016', '测试1', '0019', '中文', '100', '100', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e1540d7015e1544b2c9000d', '170825012012975551497629', '4028d9815e14c199015e14c2ee330002', '201708240001', '4028d9815e14c199015e14c365240004', '包括', '0015', null, '200', '200', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e1540d7015e1544b2c9000e', '170825012012975551497629', '4028d9815e14c199015e14c2ee330002', '201708240001', '4028d9815e14c199015e14c477e40009', '测试1', '0019', '中文', '4000', '4000', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e1540d7015e1544b2c9000f', '170825012012975551497629', '4028d9815e14d45d015e14d4f4910002', '2017082410001', '4028d9815e14d45d015e14d746990004', '23321', '0004', null, '777', '777', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e64b891015e64dbeeb3000c', '20170827300001', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e179473015e1795bc3b0005', '123333', '0013', null, '2000', '2000', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e65dd32015e65e6f05b0006', '20170827300002', '4028d9815075b466015075bfa2720004', '2015100001', '4028d98152f2b0290152f2b2fe380003', '2332134', '0014', null, '11111', '11111', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e65dd32015e65e6f05c0007', '20170827300002', '4028d981529fec4b01529ff111230004', '2016020002', '4028d98153267de501532682b26c0008', '5555', '0017', null, '600', '500', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e65dd32015e65e6f05c0008', '20170827300002', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e179473015e1795bc3b0005', '123333', '0013', null, '3000', '3000', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e835e52015e8372dc6a0013', '20170915300001', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e755422015e7587e3f20001', '测试1', '0019', '234', '23', '23', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e835e52015e8372dc6a0014', '20170915300001', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e755422015e75b58ba8003e', '包括', '0015', null, '77', '77', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e835e52015e8372dc6a0015', '20170915300001', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e75e787015e75e806b40002', '测试1', '0019', '中文', '23', '23', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e835e52015e8372dc6a0016', '20170915300001', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e75e787015e75e8e76c0005', '测试1', '0019', '345', '22', '22', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e835e52015e8372dc6a0017', '20170915300001', '4028d9815e14d45d015e14d4f4910002', '2017082410001', '4028d9815e755422015e75b8398a004c', '12', '0010', null, '7', '7', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e835e52015e8372dc6b0018', '20170915300001', '4028d9815e14d45d015e14d4f4910002', '2017082410001', '4028d9815e755422015e75b819d1004a', '包括', '0015', null, '66', '66', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e835e52015e8372dc6b0019', '20170915300001', '4028d9814f0a17e6014f0d8dfc2c004b', '2015080017', '402887e64f3966c4014f3a15fb2b0042', '123333', '0013', null, '0', '0', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e8b2fcb015e8b389dea0019', '20170916300002', '4028d9815e14d45d015e14d4f4910002', '2017082410001', '4028d9815e14d45d015e14d746990004', '23321', '0004', null, '777', '777', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e8b2fcb015e8b389dea001a', '20170916300002', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e755422015e75b58ba8003e', '包括', '0015', null, '77', '77', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e8b2fcb015e8b389dea001b', '20170916300002', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e755422015e75b7b3180048', '5555', '0017', null, '66', '66', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e8b2fcb015e8b389dea001c', '20170916300002', '4028d9815e14d45d015e14d4f4910002', '2017082410001', '4028d9815e755422015e75b8398a004c', '12', '0010', null, '7', '7', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e8b2fcb015e8b389dea001d', '20170916300002', '4028d9815e14d45d015e14d4f4910002', '2017082410001', '4028d9815e755422015e75b84f74004e', '包括', '0015', null, '9', '9', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e8b2fcb015e8b3d66f6002e', '20170916300003', '4028d9815e8b2fcb015e8b3b88cb001f', '20170916100001', '4028d9815e8b2fcb015e8b3be16a0021', '1', '0020', '11221', '20', '20', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e8b2fcb015e8b3d66f6002f', '20170916300003', '4028d9815e8b2fcb015e8b3b88cb001f', '20170916100001', '4028d9815e8b2fcb015e8b3c15ce0023', '测试1', '0019', '456', '20', '20', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e8b2fcb015e8b3d66f60030', '20170916300003', '4028d9815e8b2fcb015e8b3b88cb001f', '20170916100001', '4028d9815e8b2fcb015e8b3caf9e0025', '测试1', '0019', '中文', '30', '30', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e8b2fcb015e8b4531b10041', '20170916300005', null, '20170916100001', '4028d9815e8b2fcb015e8b3be16a0021', '1', '0020', '11221', '20', '20', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815e8b2fcb015e8b4531b10042', '20170916300005', null, '201708240001', '4028d9815e14c199015e14c477e40009', '测试1', '0019', '中文', '4000', '4000', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815ec84766015ec8623eea0044', '20170912300001', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e179473015e1795bc3b0005', '123333', '0013', null, '2000', '2000', '0', '只', '700');
INSERT INTO `bus_made_package` VALUES ('4028d9815ec84766015ec867c580004d', '20170916300001', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e755422015e7587e3f20001', '测试1', '0019', '234', '23', '23', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815ec84766015ec867c580004e', '20170916300001', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e755422015e75b58ba8003e', '包括', '0015', null, '77', '77', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815ec84766015ec867c580004f', '20170916300001', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e755422015e75b7b3180048', '5555', '0017', null, '66', '66', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815ec84766015ec867c5800050', '20170916300001', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e75d7d8015e75dc89c90003', '1', '0020', '11221', '22', '22', '0', '桶', '221321');
INSERT INTO `bus_made_package` VALUES ('4028d9815ec84766015ec867c5800051', '20170916300001', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e75e787015e75e806b40002', '测试1', '0019', '中文', '23', '23', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815ec84766015ec867c5800052', '20170916300001', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e75e787015e75e8e76c0005', '测试1', '0019', '345', '22', '22', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815ec84766015ec867c5800053', '20170916300001', null, '20170916100001', '4028d9815ec84766015ec86764850046', '1234567891234567891234567891234546789', '0021', null, '12', '12', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815effc819015f00334915000a', '20170916300004', '4028d9815e8b2fcb015e8b3b88cb001f', '20170916100001', '4028d9815e8b2fcb015e8b3be16a0021', '1', '0020', '11221', '20', '20', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815effc819015f00334915000b', '20170916300004', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e75e787015e75e8e76c0005', '测试1', '0019', '345', '22', '22', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815effc819015f00334915000c', '20170916300004', null, '20170916100001', '4028d9815ec84766015ec853832c0012', '测试长度', '0022', '123456789', '1', '1', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815effc819015f00334915000d', '20170916300004', null, '20170916100001', '4028d9815ec84766015ec8539daf0014', '测试长度', '0022', '123456789', '2', '2', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815effc819015f00334915000e', '20170916300004', null, '20170916100001', '4028d9815ec84766015ec853cf720016', '测试长度', '0022', '234567891', '333', '333', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815effc819015f00334915000f', '20170916300004', null, '20170916100001', '4028d9815ec84766015ec853f3270018', '测试长度', '0022', '678912345', '32', '32', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815effc819015f003349150010', '20170916300004', null, '20170916100001', '4028d9815ec84766015ec8541a56001a', '测试长度', '0022', '7891234567', '333', '333', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('4028d9815effc819015f003349150011', '20170916300004', null, '20170916100001', '4028d9815ec84766015ec87929b30058', '侧的萨达是打算打算的的啊', '0023', null, '1', '1', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('8a8a88995e76dd12015e76f7e39c0008', '20170913300001', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e755422015e7587e3f20001', '测试1', '0019', '234', '23', '23', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('8a8a88995e76dd12015e76f7e39c0009', '20170913300001', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e755422015e75b58ba8003e', '包括', '0015', null, '77', '77', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('8a8a88995e76dd12015e76f7e39c000a', '20170913300001', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e755422015e75b7b3180048', '5555', '0017', null, '66', '66', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('8a8a88995e76dd12015e76f7e39c000b', '20170913300001', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e75d7d8015e75dc89c90003', '1', '0020', '11221', '22', '22', '0', '桶', '221321');
INSERT INTO `bus_made_package` VALUES ('8a8a88995e76dd12015e76f7e39d000c', '20170913300001', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e75e787015e75e806b40002', '测试1', '0019', '中文', '23', '23', '0', '只', '');
INSERT INTO `bus_made_package` VALUES ('8a8a88995e76dd12015e76f7e39d000d', '20170913300001', '4028d9815e179473015e17953d1f0003', '20170825100001', '4028d9815e75e787015e75e8e76c0005', '测试1', '0019', '345', '22', '22', '0', '只', '');

-- ----------------------------
-- Table structure for bus_made_process
-- ----------------------------
DROP TABLE IF EXISTS `bus_made_process`;
CREATE TABLE `bus_made_process` (
  `id` varchar(32) NOT NULL,
  `process_code` varchar(32) NOT NULL,
  `made_code` varchar(32) NOT NULL COMMENT '生产单编号',
  `order_code` varchar(256) NOT NULL COMMENT '订单编号',
  `outsourcer` varchar(32) DEFAULT NULL COMMENT '外协方',
  `name` varchar(32) DEFAULT NULL COMMENT '工艺名称',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `demand` text COMMENT '工艺要求',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_made_process
-- ----------------------------
INSERT INTO `bus_made_process` VALUES ('4028d9815e077dc0015e07c3e6c20005', '170822102706759553509573', '170822102703599551767764', '2016020002', null, '切纸', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e077dc0015e07c3e6c20006', '170822102706759553509573', '170822102703599551767764', '2016020002', null, '烫金', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e077dc0015e07c3e6c20007', '170822102706759553509573', '170822102703599551767764', '2016020002', null, '印刷', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e086644015e086eb3e70004', '170822133336415553976025', '170821162730442551000687', '2016020001', '小毛', 'UV', '123123', '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9c002b', '170822152301356553053738', '170822152252959551381429', '2016020002', '小毛', '切纸', '1000', '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9c002c', '170822152301356553053738', '170822152252959551381429', '2016020002', null, '烫金', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9c002d', '170822152301356553053738', '170822152252959551381429', '2016020002', null, '印刷', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9c002e', '170822152356716553519380', '170822152252959551381429', '2016020002', '小毛', '上光', '800', '大苏打撒旦大苏打撒旦；阿斯顿');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9c002f', '170822152655223553023804', '170822152252959551381429', '2016020002', '小毛', '烫金', '8000', '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9c0030', '170822193904537553907779', '170822152252959551381429', '2016020002', null, '烫金', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9c0031', '170822193904537553907779', '170822152252959551381429', '2016020002', null, '印刷', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9c0032', '170822193904537553907779', '170822152252959551381429', '2016020002', '', '上光', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9c0033', '170822193904537553907779', '170822152252959551381429', '2016020002', '', '覆膜', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9c0034', '170822193904537553907779', '170822152252959551381429', '2016020002', '', '碰刀', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9c0035', '170822193904537553907779', '170822152252959551381429', '2016020002', null, null, null, null);
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9c0036', '170822194030227553241331', '170822152252959551381429', '2016020002', null, '切纸', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9c0037', '170822194030227553241331', '170822152252959551381429', '2016020002', null, '烫金', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9c0038', '170822194030227553241331', '170822152252959551381429', '2016020002', null, '印刷', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9d0039', '170822194030227553241331', '170822152252959551381429', '2016020002', '', 'UV', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9d003a', '170822194030227553241331', '170822152252959551381429', '2016020002', '', '覆膜', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9d003b', '170822194030227553241331', '170822152252959551381429', '2016020002', '', '上光', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9d003c', '170822220435815553401127', '170822152252959551381429', '2016020002', null, 'UV', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9d003d', '170822220441596553705232', '170822152252959551381429', '2016020002', null, '碰刀', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9d003e', '170822220441596553705232', '170822152252959551381429', '2016020002', null, '切纸', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9d003f', '170822220441596553705232', '170822152252959551381429', '2016020002', null, '印刷', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9d0040', '170822220441596553705232', '170822152252959551381429', '2016020002', null, 'UV', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9d0041', '170822220441596553705232', '170822152252959551381429', '2016020002', null, '烫金', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9d0042', '170822220447703553053205', '170822152252959551381429', '2016020002', null, '切纸', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9d0043', '170822220447703553053205', '170822152252959551381429', '2016020002', null, '烫金', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9d0044', '170822220447703553053205', '170822152252959551381429', '2016020002', null, '印刷', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9d0045', '170822220454076553505739', '170822152252959551381429', '2016020002', null, '切纸', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9d0046', '170822220454076553505739', '170822152252959551381429', '2016020002', null, '烫金', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e097079015e0a42bd9d0047', '170822220454076553505739', '170822152252959551381429', '2016020002', null, '印刷', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e14c199015e14c4e353000e', '170824230307806553367355', '170824230302888551142984', '201708240001', null, '切纸', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e14c199015e14c4e353000f', '170824230307806553367355', '170824230302888551142984', '201708240001', null, '烫金', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e14c199015e14c4e3530010', '170824230307806553367355', '170824230302888551142984', '201708240001', null, '印刷', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e14c199015e14c4e3530011', '170824230313093553552444', '170824230302888551142984', '201708240001', null, 'UV', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e1540d7015e1544b2c80005', '170825012155438553466486', '170825012012975551497629', '2016020002,201708240001', null, '切纸', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e1540d7015e1544b2c80006', '170825012155438553466486', '170825012012975551497629', '2016020002,201708240001', null, '烫金', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e1540d7015e1544b2c80007', '170825012155438553466486', '170825012012975551497629', '2016020002,201708240001', null, '印刷', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e1540d7015e1544b2c80008', '170825012237357553732224', '170825012012975551497629', '2016020002,201708240001', null, 'UV', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e64b891015e64dbeeb30007', '170904164747337553415610', '20170827300001', '20170825100001', '', 'UV', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e64b891015e64dbeeb30008', '170904164747337553415610', '20170827300001', '20170825100001', '', '覆膜', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e64b891015e64dbeeb30009', '170904163118570553975059', '20170827300001', '20170825100001', '', 'UV', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e64b891015e64dbeeb3000a', '170904163118570553975059', '20170827300001', '20170825100001', '小毛', '上光', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e64b891015e64dbeeb3000b', '170904163118570553975059', '20170827300001', '20170825100001', '小毛', '上光', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e65dd32015e65e6f05b0005', '170827074029401553926970', '20170827300002', '2015100001', '', '烫金', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e835e52015e8372dc6a000f', '170915105008022553975555', '20170915300001', '2017082410001', '海宁', 'UV', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e835e52015e8372dc6a0010', '170915105129494553684310', '20170915300001', '20170825100001', null, '切纸', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e835e52015e8372dc6a0011', '170915105129494553684310', '20170915300001', '20170825100001', null, '烫金', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e835e52015e8372dc6a0012', '170915105129494553684310', '20170915300001', '20170825100001', null, '印刷', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e8b2fcb015e8b389de90018', '170916230434910553538857', '20170916300002', '20170825100001,2017082410001', null, 'UV', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e8b2fcb015e8b3d66f6002b', '170916230955486553075030', '20170916300003', '20170916100001', null, '切纸', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e8b2fcb015e8b3d66f6002c', '170916230955486553075030', '20170916300003', '20170916100001', null, '烫金', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e8b2fcb015e8b3d66f6002d', '170916230955486553075030', '20170916300003', '20170916100001', null, '印刷', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e8b2fcb015e8b4531b0003e', '170916231832319553092383', '20170916300005', '201708240001', null, '切纸', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e8b2fcb015e8b4531b1003f', '170916231832319553092383', '20170916300005', '201708240001', null, '烫金', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815e8b2fcb015e8b4531b10040', '170916231832319553092383', '20170916300005', '201708240001', null, '印刷', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815ec84766015ec867c580004a', '170916225819239553010447', '20170916300001', '20170825100001', null, '切纸', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815ec84766015ec867c580004b', '170916225819239553010447', '20170916300001', '20170825100001', null, '烫金', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815ec84766015ec867c580004c', '170916225819239553010447', '20170916300001', '20170825100001', null, '印刷', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815effc819015f003349140007', '170916231614164553955905', '20170916300004', '20170825100001', null, '切纸', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815effc819015f003349150008', '170916231614164553955905', '20170916300004', '20170825100001', null, '烫金', null, '');
INSERT INTO `bus_made_process` VALUES ('4028d9815effc819015f003349150009', '170916231614164553955905', '20170916300004', '20170825100001', null, '印刷', null, '');
INSERT INTO `bus_made_process` VALUES ('8a8a88995e76dd12015e76f7e39c0005', '170913004049380553017041', '20170913300001', '20170825100001', null, 'UV', null, '');
INSERT INTO `bus_made_process` VALUES ('8a8a88995e76dd12015e76f7e39c0006', '170913004049380553017041', '20170913300001', '20170825100001', '小毛', '覆膜', null, '');
INSERT INTO `bus_made_process` VALUES ('8a8a88995e76dd12015e76f7e39c0007', '170913004049380553017041', '20170913300001', '20170825100001', '小毛', '印刷', null, '');

-- ----------------------------
-- Table structure for bus_materiel_info
-- ----------------------------
DROP TABLE IF EXISTS `bus_materiel_info`;
CREATE TABLE `bus_materiel_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `classify_id` int(10) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `spec` varchar(32) DEFAULT NULL,
  `price` decimal(10,1) DEFAULT NULL,
  `image_path` varchar(128) DEFAULT NULL,
  `description` text,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_materiel_info
-- ----------------------------
INSERT INTO `bus_materiel_info` VALUES ('5', '12', '157双铜纸', '157克', '1.0', null, null, '1');
INSERT INTO `bus_materiel_info` VALUES ('6', '9', '牛皮纸', '200克', '2.0', null, '12345', '1');
INSERT INTO `bus_materiel_info` VALUES ('10', '12', '300克双铜纸', '300克', '1.0', null, null, '1');

-- ----------------------------
-- Table structure for bus_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `bus_order_detail`;
CREATE TABLE `bus_order_detail` (
  `id` char(32) NOT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  `product_name` varchar(64) DEFAULT NULL,
  `product_code` varchar(32) DEFAULT NULL,
  `style` varchar(32) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `real_number` int(11) DEFAULT NULL,
  `papers` int(11) DEFAULT NULL,
  `prints` int(11) DEFAULT NULL,
  `spec` varchar(32) DEFAULT NULL,
  `unit` varchar(32) DEFAULT NULL,
  `one_price` double(10,2) DEFAULT NULL,
  `all_price` double(10,1) DEFAULT NULL,
  `description` text,
  `enabled` tinyint(1) DEFAULT NULL,
  `order_code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='进货信息表的基本信息\r\n';

-- ----------------------------
-- Records of bus_order_detail
-- ----------------------------
INSERT INTO `bus_order_detail` VALUES ('402887e64ed8c74f014ed8ef48fc0002', '4028d9814e3543b5014e354b1a3e0003', '111', '0003', null, '123', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015060004');
INSERT INTO `bus_order_detail` VALUES ('402887e64ed8c74f014ed8ef7f9a0004', '4028d9814e3543b5014e354b1a3e0003', '23321', '0004', null, '32556', '123', '0', '0', null, '只', '4.00', '130224.0', '123456789123456789123456789', '1', '2015060004');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfc62f50018', '402887e64eddb376014eddfc62c80017', '111', '0003', null, '123', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015070001');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfc62f50019', '402887e64eddb376014eddfc62c80017', '23321', '0004', null, '32556', '123', '0', '0', null, '只', '4.00', '130224.0', '123456789123456789123456789', '1', '2015070001');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfc87dd001c', '402887e64eddb376014eddfc87dd001b', '111', '0003', null, '123', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015070002');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfc87dd001d', '402887e64eddb376014eddfc87dd001b', '23321', '0004', null, '32556', '123', '0', '0', null, '只', '4.00', '130224.0', '123456789123456789123456789', '1', '2015070002');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfc9d5e0020', '402887e64eddb376014eddfc9d5d001f', '111', '0003', null, '123', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015070003');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfc9d5e0021', '402887e64eddb376014eddfc9d5d001f', '23321', '0004', null, '32556', '123', '0', '0', null, '只', '4.00', '130224.0', '123456789123456789123456789', '1', '2015070003');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfcac1f0024', '402887e64eddb376014eddfcac1f0023', '111', '0003', null, '123', '0', '0', '0', null, '只', '1.00', '123.0', '', '1', '2015070004');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfcac1f0025', '402887e64eddb376014eddfcac1f0023', '23321', '0004', null, '32556', '123', '0', '0', null, '只', '4.00', '130224.0', '123456789123456789123456789', '1', '2015070004');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfcbff80028', '402887e64eddb376014eddfcbff80027', '111', '0003', null, '123', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015070005');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfcbff80029', '402887e64eddb376014eddfcbff80027', '23321', '0004', null, '32556', '123', '0', '0', null, '只', '4.00', '130224.0', '123456789123456789123456789', '1', '2015070005');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfcd107002c', '402887e64eddb376014eddfcd107002b', '111', '0003', null, '123', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015070006');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfcd107002d', '402887e64eddb376014eddfcd107002b', '23321', '0004', null, '32556', '123', '0', '0', null, '只', '4.00', '130224.0', '123456789123456789123456789', '1', '2015070006');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfce55e0030', '402887e64eddb376014eddfce55e002f', '111', '0003', null, '123', '0', '0', '0', null, '只', '7.00', '861.0', '', '1', '2015070007');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfce55e0031', '402887e64eddb376014eddfce55e002f', '23321', '0004', null, '32556', '123', '0', '0', null, '只', '2.00', '65112.0', '123456789123456789123456789', '1', '2015070007');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfcf5280034', '402887e64eddb376014eddfcf5280033', '111', '0003', null, '123', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015070008');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfcf5280035', '402887e64eddb376014eddfcf5280033', '23321', '0004', null, '32556', '123', '0', '0', null, '只', '4.00', '130224.0', '123456789123456789123456789', '1', '2015070008');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfd0edf0038', '402887e64eddb376014eddfd0edf0037', '111', '0003', null, '123', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015070009');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfd0edf0039', '402887e64eddb376014eddfd0edf0037', '23321', '0004', null, '32556', '123', '0', '0', null, '只', '4.00', '130224.0', '123456789123456789123456789', '1', '2015070009');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfde8d9003c', '402887e64eddb376014eddfde8d9003b', '111', '0003', null, '123', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015070010');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfde8da003d', '402887e64eddb376014eddfde8d9003b', '23321', '0004', null, '32556', '123', '0', '0', null, '只', '4.00', '130224.0', '123456789123456789123456789', '1', '2015070010');
INSERT INTO `bus_order_detail` VALUES ('402887e64eddb376014eddfdfd450040', '402887e64eddb376014eddfdfd45003f', '111', '0003', null, '123', '0', '0', '0', null, '只', '1.00', '123.0', '', '1', '2015070011');
INSERT INTO `bus_order_detail` VALUES ('402887e64f007fab014f008d16640008', '402887e64f007fab014f008d16640007', '111', '0003', null, '123', '1', '0', '0', null, '只', '2.00', '246.0', '', '1', '2015080002');
INSERT INTO `bus_order_detail` VALUES ('402887e64f007fab014f008d1667000a', '402887e64f007fab014f008d16640007', '23321', '0004', null, '123', '0', '0', '0', null, '只', '2.00', '246.0', '', '1', '2015080002');
INSERT INTO `bus_order_detail` VALUES ('402887e64f15f8cd014f16779f5e0007', '4028d9814f0a17e6014f0d8dfc2c004b', '111', '0003', null, '212', '1231', '0', '0', null, '只', '1.00', '212.0', '', '1', '2015080017');
INSERT INTO `bus_order_detail` VALUES ('402887e64f15f8cd014f1677c5ca0009', '4028d9814f0a17e6014f0d8dfc2c004b', '111', '0003', null, '11', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015080017');
INSERT INTO `bus_order_detail` VALUES ('402887e64f1a4911014f1a82947c0006', '4028d9814f0a17e6014f0d8dfc2c004b', '123', '0006', null, '1221', '0', '0', '0', null, '只', '1.00', '1221.0', '', '1', '2015080017');
INSERT INTO `bus_order_detail` VALUES ('402887e64f1b6a32014f1ba542930010', '402887e64eddb376014eddfcac1f0023', '1', '0012', null, '1', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015070004');
INSERT INTO `bus_order_detail` VALUES ('402887e64f1b6a32014f1ba551420012', '402887e64eddb376014eddfcac1f0023', '12', '0010', null, '222', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015070004');
INSERT INTO `bus_order_detail` VALUES ('402887e64f1b6a32014f1ba562b90014', '402887e64eddb376014eddfcac1f0023', '1221', '0009', null, '11', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015070004');
INSERT INTO `bus_order_detail` VALUES ('402887e64f3966c4014f3a14bdb30037', '4028d9814f0a17e6014f0d8dfc2c004b', '1221', '0009', null, '0', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015080017');
INSERT INTO `bus_order_detail` VALUES ('402887e64f3966c4014f3a14d3e50039', '4028d9814f0a17e6014f0d8dfc2c004b', 'wqwe', '0007', null, '0', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015080017');
INSERT INTO `bus_order_detail` VALUES ('402887e64f3966c4014f3a14e4a2003b', '4028d9814f0a17e6014f0d8dfc2c004b', '23321', '0004', null, '0', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015080017');
INSERT INTO `bus_order_detail` VALUES ('402887e64f3966c4014f3a14f494003d', '4028d9814f0a17e6014f0d8dfc2c004b', '1', '0012', null, '0', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015080017');
INSERT INTO `bus_order_detail` VALUES ('402887e64f3966c4014f3a15079c003f', '4028d9814f0a17e6014f0d8dfc2c004b', '1221', '0009', null, '0', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015080017');
INSERT INTO `bus_order_detail` VALUES ('402887e64f3966c4014f3a15fb2b0042', '4028d9814f0a17e6014f0d8dfc2c004b', '123333', '0013', null, '0', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015080017');
INSERT INTO `bus_order_detail` VALUES ('4028d9814e346bd1014e34fb55a30009', '4028d9814e346bd1014e34fa78220006', '23321', '0004', null, '30', '2', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015060003');
INSERT INTO `bus_order_detail` VALUES ('4028d9814e346bd1014e34fb55a3000a', '4028d9814e346bd1014e34fa78220006', '23321', '0004', null, '40', '234', '0', '0', null, '只', '1.00', '40.0', '12345678912345678912345678123456789', '1', '2015060003');
INSERT INTO `bus_order_detail` VALUES ('4028d9814f12a51b014f12af880b0012', '4028d9814f0a17e6014f0d8dfc2c004b', '12', '0010', null, '213', '0', '0', '0', null, '只', '1.00', '213.0', '', '1', '2015080017');
INSERT INTO `bus_order_detail` VALUES ('4028d9814f12a51b014f12aff9230015', '4028d9814f0a17e6014f0d8dfc2c004b', '1221', '0011', null, '1332', '0', '0', '0', null, '张', '1.00', '1332.0', '', '1', '2015080017');
INSERT INTO `bus_order_detail` VALUES ('4028d9814f3bcc6e014f3c04715d0009', null, '23321', '0004', null, '0', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', null);
INSERT INTO `bus_order_detail` VALUES ('4028d9814f3bcc6e014f3c08efd1000b', null, '1', '0012', null, '312', '1', '0', '0', null, '只', '3.00', '936.0', '', '1', null);
INSERT INTO `bus_order_detail` VALUES ('4028d9814f3bcc6e014f3c0d06cb000c', null, '1221', '0009', null, '12', '0', '0', '0', null, '只', '1.00', '12.0', '', '1', null);
INSERT INTO `bus_order_detail` VALUES ('4028d9814f3e59c8014f3f30ec200025', '402887e64eddb376014eddfdfd45003f', '1212', '0005', null, '11', '0', '0', '0', null, '只', '1.00', '11.0', '', '1', '2015070011');
INSERT INTO `bus_order_detail` VALUES ('4028d9814f58ea4a014f5906a55d0005', '4028d9814f0a17e6014f0d8dfc2c004b', '1221', '0009', null, '123', '31', '0', '0', null, '只', '31.00', '3813.0', '', '1', '2015080017');
INSERT INTO `bus_order_detail` VALUES ('4028d9815292c26b015292d261900002', '4028d9814e3543b5014e354b1a3e0003', '23321', '0004', null, '66', '66', '88', '80', null, '只', '8.00', '528.0', '', '1', '2015060004');
INSERT INTO `bus_order_detail` VALUES ('4028d981529701d101529706e4d50004', '4028d9815075b466015075bfa2720004', '包括', '0015', '', '12000', '0', '100', '1333', null, '只', '22.00', '264000.0', '', '1', '2015100001');
INSERT INTO `bus_order_detail` VALUES ('4028d98152f2b0290152f2b2fe380003', '4028d9815075b466015075bfa2720004', '2332134', '0014', null, '11111', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2015100001');
INSERT INTO `bus_order_detail` VALUES ('4028d98153267de501532682b26c0008', '4028d981529fec4b01529ff111230004', '5555', '0017', null, '600', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2016020002');
INSERT INTO `bus_order_detail` VALUES ('4028d9815d9866ab015d986969950002', '4028d981529fec4b01529ff111230004', '包括', '0015', null, '900', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2016020002');
INSERT INTO `bus_order_detail` VALUES ('4028d9815d9a79a3015d9a7ce7680005', '4028d981529fec4b01529ff111230004', '包括', '0015', null, '800', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2016020002');
INSERT INTO `bus_order_detail` VALUES ('4028d9815dee762b015dee9c4c6b0005', '4028d981529fec4b01529fecdce60002', '43434', '0018', '345', '0', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2016020001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815dee762b015dee9ce2900009', '4028d981529fec4b01529fecdce60002', '43434', '0018', '123', '0', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2016020001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815df5891a015df63aeb79000a', '4028d981529fec4b01529ff111230004', '测试1', '0019', '234', '800', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2016020002');
INSERT INTO `bus_order_detail` VALUES ('4028d9815df5891a015df63b1b64000c', '4028d981529fec4b01529ff111230004', '测试1', '0019', '345', '777', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2016020002');
INSERT INTO `bus_order_detail` VALUES ('4028d9815df5891a015df65eb36e0016', '4028d981529fec4b01529ff111230004', '测试1', '0019', '中文', '100', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2016020002');
INSERT INTO `bus_order_detail` VALUES ('4028d9815e14c199015e14c477e40009', '4028d9815e14c199015e14c2ee330002', '测试1', '0019', '中文', '4000', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '201708240001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815e14d45d015e14d746990004', '4028d9815e14d45d015e14d4f4910002', '23321', '0004', null, '777', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2017082410001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815e755422015e7587e3f20001', '4028d9815e179473015e17953d1f0003', '测试1', '0019', '234', '23', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '20170825100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815e755422015e75b58ba8003e', '4028d9815e179473015e17953d1f0003', '包括', '0015', null, '77', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '20170825100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815e755422015e75b7b3180048', '4028d9815e179473015e17953d1f0003', '5555', '0017', null, '66', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '20170825100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815e755422015e75b819d1004a', '4028d9815e14d45d015e14d4f4910002', '包括', '0015', null, '66', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2017082410001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815e755422015e75b8398a004c', '4028d9815e14d45d015e14d4f4910002', '12', '0010', null, '7', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2017082410001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815e755422015e75b84f74004e', '4028d9815e14d45d015e14d4f4910002', '包括', '0015', null, '9', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2017082410001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815e755422015e75b9f1870053', '4028d9815e14bb38015e14bd2cad0006', '5555', '0017', null, '2', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2017080003');
INSERT INTO `bus_order_detail` VALUES ('4028d9815e755422015e75ba13f80055', '4028d9815e14bb38015e14bd2cad0006', '测试1', '0019', '234', '33', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '2017080003');
INSERT INTO `bus_order_detail` VALUES ('4028d9815e75d7d8015e75dc89c90003', '4028d9815e179473015e17953d1f0003', '1', '0020', '11221', '22', '0', '0', '0', null, '桶', '2.00', '44.0', '221321', '1', '20170825100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815e75e787015e75e806b40002', '4028d9815e179473015e17953d1f0003', '测试1', '0019', '中文', '23', '2', '0', '0', null, '只', '323.00', '7429.0', '', '1', '20170825100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815e75e787015e75e8e76c0005', '4028d9815e179473015e17953d1f0003', '测试1', '0019', '345', '22', '3', '0', '0', null, '只', '0.00', '0.0', '', '1', '20170825100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815e75e787015e75e901690007', '4028d9815e14d0c7015e14d23bd20003', '5555', '0017', null, '1', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '201708240003');
INSERT INTO `bus_order_detail` VALUES ('4028d9815e8b2fcb015e8b3caf9e0025', '4028d9815e8b2fcb015e8b3b88cb001f', '测试1', '0019', '中文', '30', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '20170916100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815e8b5c5e015e8b6fad280008', '4028d9815e8b2fcb015e8b3b88cb001f', '包括', '0015', null, '9000', '0', '0', '0', null, '只', '5.00', '45000.0', '', '1', '20170916100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815e8b5c5e015e8bbad68c001c', '4028d9815e8b2fcb015e8b3b88cb001f', '1', '0020', '11221', '213', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '20170916100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815e8b5c5e015e8bbafa1e001e', '4028d9815e8b2fcb015e8b3b88cb001f', '43434', '0018', '123', '32', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '20170916100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815e8b5c5e015e8bbb49410022', '4028d9815e8b2fcb015e8b3b88cb001f', '测试1', '0019', '345', '990', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '20170916100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815ec84766015ec853832c0012', '4028d9815e8b2fcb015e8b3b88cb001f', '测试长度', '0022', '123456789', '1', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '20170916100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815ec84766015ec8539daf0014', '4028d9815e8b2fcb015e8b3b88cb001f', '测试长度', '0022', '123456789', '2', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '20170916100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815ec84766015ec853cf720016', '4028d9815e8b2fcb015e8b3b88cb001f', '测试长度', '0022', '234567891', '333', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '20170916100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815ec84766015ec853f3270018', '4028d9815e8b2fcb015e8b3b88cb001f', '测试长度', '0022', '22222222', '32', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '20170916100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815ec84766015ec8541a56001a', '4028d9815e8b2fcb015e8b3b88cb001f', '测试长度', '0022', '7891234567', '333', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '20170916100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815ec84766015ec86764850046', '4028d9815e8b2fcb015e8b3b88cb001f', '1234567891234567891234567891234546789', '0021', null, '12', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '20170916100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815ec84766015ec87929b30058', '4028d9815e8b2fcb015e8b3b88cb001f', '侧的萨达是打算打算的的啊', '0023', null, '1', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '20170916100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815ed8f61e015ed8f75a7e0003', '4028d9815ed8f61e015ed8f75a7b0002', '测试1', null, null, '0', '0', '0', '0', null, null, '0.00', '0.0', '', '1', '20171002100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815ef2486c015ef24fa0760009', '4028d9815ef2486c015ef24fa0760008', '测试长度', '0022', '123456789', '11', '0', '0', '0', null, '只', '1.00', '11.0', '', '1', '20171006100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815ef2486c015ef24fa076000a', '4028d9815ef2486c015ef24fa0760008', '测试1', '0019', '123', '20', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '20171006100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815ef2801e015ef285f2600027', '4028d9815ef2801e015ef285f2600026', '43434', '0018', '123', '1', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '20171007100001');
INSERT INTO `bus_order_detail` VALUES ('4028d9815eff3199015eff3305b90002', '4028d9815ef2801e015ef285f2600026', '43434', '0018', '456', '223', '0', '0', '0', null, '只', '0.00', '0.0', '', '1', '20171007100001');

-- ----------------------------
-- Table structure for bus_order_info
-- ----------------------------
DROP TABLE IF EXISTS `bus_order_info`;
CREATE TABLE `bus_order_info` (
  `id` char(32) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `order_type` varchar(32) DEFAULT NULL,
  `customer_name` varchar(64) DEFAULT NULL,
  `customer_code` varchar(32) DEFAULT NULL,
  `receive_time` date DEFAULT NULL,
  `express` varchar(32) DEFAULT NULL,
  `contract` varchar(32) DEFAULT NULL,
  `set_way` varchar(32) DEFAULT NULL,
  `all_price` double(10,1) DEFAULT NULL,
  `is_get` tinyint(1) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `produce_print_status` tinyint(1) DEFAULT NULL,
  `print_status` tinyint(1) DEFAULT NULL,
  `strip` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `description` text,
  `enabled` tinyint(1) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `create_man_id` char(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_man_id` char(32) DEFAULT NULL,
  `create_man_name` varchar(32) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `merchandiser_id` varchar(32) DEFAULT NULL,
  `merchand_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单信息表的基本信息';

-- ----------------------------
-- Records of bus_order_info
-- ----------------------------
INSERT INTO `bus_order_info` VALUES ('402887e64eddb376014eddfc62c80017', '2015070001', '返单', '小明', '0001', '2015-08-06', null, null, '0', '130224.0', '1', '已下单', '0', '0', '2', '0', null, null, null, '402882be46404313014640b7eb1c000f', '2015-07-30 16:03:01', '402882be46404313014640b7eb1c000f', '超级管理员', '2015-08-11 10:40:34', '402882be46404313014640b7eb1c000f', '2015-07-30 16:03:01');
INSERT INTO `bus_order_info` VALUES ('402887e64eddb376014eddfc87dd001b', '2015070002', '返单', '小明', '0001', '2015-08-06', '', '', '0', '130224.0', '0', '已下单', '0', '0', '2', '0', '', null, null, '402882be46404313014640b7eb1c000f', '2015-07-30 16:03:11', null, '超级管理员', null, '402882be46404313014640b7eb1c000f', '2015-07-30 16:03:11');
INSERT INTO `bus_order_info` VALUES ('402887e64eddb376014eddfc9d5d001f', '2015070003', '返单', '小明', '0001', '2015-08-06', '', '', '0', '130224.0', '0', '已下单', '0', '0', '2', '0', '', null, null, '402882be46404313014640b7eb1c000f', '2015-07-30 16:03:16', null, '超级管理员', null, '402882be46404313014640b7eb1c000f', '2015-07-30 16:03:16');
INSERT INTO `bus_order_info` VALUES ('402887e64eddb376014eddfcac1f0023', '2015070004', '返单', '小明', '0001', '2015-08-06', '', '', '0', '130347.0', '0', '已下单', '0', '0', '5', '0', '', null, null, '402882be46404313014640b7eb1c000f', '2015-07-30 00:00:00', null, '超级管理员', null, '402882be46404313014640b7eb1c000f', '2015-07-30 16:03:20');
INSERT INTO `bus_order_info` VALUES ('402887e64eddb376014eddfcbff80027', '2015070005', '返单', '小明', '0001', '2015-08-06', '', '', '0', '130224.0', '0', '已下单', '0', '0', '2', '0', '', null, null, '402882be46404313014640b7eb1c000f', '2015-07-30 00:00:00', null, '超级管理员', null, '402882be46404313014640b7eb1c000f', '2015-07-30 16:03:25');
INSERT INTO `bus_order_info` VALUES ('402887e64eddb376014eddfcd107002b', '2015070006', '返单', '小明', '0001', '2015-08-06', '123123', '', '0', '130224.0', '0', '已下单', '0', '0', '2', '0', '', null, null, '402882be46404313014640b7eb1c000f', '2015-07-30 00:00:00', '402882be46404313014640b7eb1c000f', '超级管理员', '2015-08-18 15:47:01', '402882be46404313014640b7eb1c000f', '2015-07-30 16:03:30');
INSERT INTO `bus_order_info` VALUES ('402887e64eddb376014eddfce55e002f', '2015070007', '返单', '小明', '0001', '2015-08-06', '', '', '0', '65973.0', '0', '已下单', '0', '0', '2', '0', '', null, null, '402882be46404313014640b7eb1c000f', '2015-07-30 00:00:00', null, '超级管理员', null, '402882be46404313014640b7eb1c000f', '2015-07-30 16:03:35');
INSERT INTO `bus_order_info` VALUES ('402887e64eddb376014eddfcf5280033', '2015070008', '返单', '小明', '0001', '2015-08-06', '123456789', null, '3', '130224.0', '0', '已下单', '0', '0', '2', '0', null, null, null, '402882be46404313014640b7eb1c000f', '2015-07-30 00:00:00', '402882be46404313014640b7eb1c000f', '超级管理员', '2015-08-23 12:51:48', '402882be46404313014640b7eb1c000f', '2015-07-30 16:03:39');
INSERT INTO `bus_order_info` VALUES ('402887e64eddb376014eddfd0edf0037', '2015070009', '返单', '小明', '0001', '2015-08-06', '', '', '0', '130224.0', '0', '已下单', '0', '0', '2', '0', '', null, null, '402882be46404313014640b7eb1c000f', '2015-07-30 00:00:00', null, '超级管理员', null, '402882be46404313014640b7eb1c000f', '2015-07-30 16:03:46');
INSERT INTO `bus_order_info` VALUES ('402887e64eddb376014eddfde8d9003b', '2015070010', '返单', '小明', '0001', '2015-08-06', '123456', '', '0', '130224.0', '0', '已结单', '0', '0', '2', '0', '', null, null, '402882be46404313014640b7eb1c000f', '2015-07-30 00:00:00', '402882be46404313014640b7eb1c000f', '超级管理员', '2015-08-23 13:01:19', '402882be46404313014640b7eb1c000f', '2015-07-30 16:04:41');
INSERT INTO `bus_order_info` VALUES ('402887e64eddb376014eddfdfd45003f', '2015070011', '返单', '小明', '0001', '2015-08-06', '', '', '0', '134.0', '0', '已结单', '0', '0', '2', '0', '', null, null, '402882be46404313014640b7eb1c000f', '2015-07-30 00:00:00', null, '超级管理员', null, '402882be46404313014640b7eb1c000f', '2015-07-30 16:04:47');
INSERT INTO `bus_order_info` VALUES ('402887e64f007fab014f008d16640007', '2015080002', '返单', '小明', '0001', '2015-08-13', '', '', '0', '492.0', '0', '已下单', '0', '0', '2', '0', '', null, null, '402882be46404313014640b7eb1c000f', '2015-08-06 00:00:00', null, '超级管理员', null, '402882be46404313014640b7eb1c000f', '2015-08-06 09:08:10');
INSERT INTO `bus_order_info` VALUES ('4028d9814e346bd1014e34fa78220006', '2015060003', '新单', '小明', '0001', '2015-07-04', null, null, '0', '40.0', '0', '已下单', '0', '1', '2', '0', '123456789123456789123456789123456789', null, null, '402882be46404313014640b7eb1c000f', '2015-06-27 00:00:00', '402882be46404313014640b7eb1c000f', '超级管理员', '2015-07-27 13:20:41', '402882be46404313014640b7eb1c000f', '2015-06-27 20:26:38');
INSERT INTO `bus_order_info` VALUES ('4028d9814e3543b5014e354b1a3e0003', '2015060004', '新单', '小明', '0001', '2015-07-12', null, null, '0', '130752.0', '0', '已结单', '0', '0', '3', '0', null, null, null, '402882be46404313014640b7eb1c000f', '2015-06-27 00:00:00', null, '超级管理员', null, '402882be46404313014640b7eb1c000f', '2015-07-30 10:15:13');
INSERT INTO `bus_order_info` VALUES ('4028d9814f0a17e6014f0d8dfc2c004b', '2015080017', '新单', '小明', '0001', '2015-08-15', null, null, '0', '6791.0', '0', '已下单', '0', '0', '12', '0', null, null, null, '402882be46404313014640b7eb1c000f', '2015-08-08 00:00:00', '402882be46404313014640b7eb1c000f', '超级管理员', '2015-08-10 23:19:17', '402882be46404313014640b7eb1c000f', '2015-08-08 21:47:29');
INSERT INTO `bus_order_info` VALUES ('4028d9815075b466015075bfa2720004', '2015100001', '新单', '小明', '0001', '2015-10-24', null, null, '0', '264000.0', '0', '已下单', '0', '0', '2', '0', null, null, null, '402882be46404313014640b7eb1c000f', '2015-10-17 00:00:00', null, '超级管理员', null, '402882be46404313014640b7eb1c000f', '2016-01-31 17:35:12');
INSERT INTO `bus_order_info` VALUES ('4028d981529fec4b01529fecdce60002', '2016020001', '新单', '小二', '0003', '2016-02-09', null, null, '0', '0.0', '0', '已下单', '0', '0', '2', '0', null, null, null, '402882be46404313014640b7eb1c000f', '2016-02-02 00:00:00', null, '超级管理员', null, '402882be46404313014640b7eb1c000f', '2017-08-17 13:13:53');
INSERT INTO `bus_order_info` VALUES ('4028d981529fec4b01529ff111230004', '2016020002', '新单', '小二', '0003', '2016-02-09', null, null, '0', '0.0', '0', '已下单', '0', '0', '6', '0', '浙江省嘉兴市海盐县百步镇横港村汉坊印刷园广信街', null, null, '402882be46404313014640b7eb1c000f', '2016-02-02 00:00:00', '402882be46404313014640b7eb1c000f', '超级管理员', '2016-02-05 10:57:59', '402882be46404313014640b7eb1c000f', '2016-02-28 14:13:40');
INSERT INTO `bus_order_info` VALUES ('4028d9815e14bb38015e14bbedab0002', '2017080001', '新单', '小明', '0001', '2017-08-31', null, null, '3', '0.0', '0', '制单中', '0', '0', '0', '0', null, null, null, '402882be46404313014640b7eb1c000f', '2017-08-24 22:53:33', null, '超级管理员', null, null, null);
INSERT INTO `bus_order_info` VALUES ('4028d9815e14bb38015e14bcf1aa0004', '2017080002', '新单', '小明', '0001', '2017-08-31', null, null, '3', '0.0', '0', '制单中', '0', '0', '0', '0', null, null, null, '402882be46404313014640b7eb1c000f', '2017-08-24 22:54:40', null, '超级管理员', null, null, null);
INSERT INTO `bus_order_info` VALUES ('4028d9815e14bb38015e14bd2cad0006', '2017080003', '新单', '小二', '0003', '2017-08-31', null, null, '3', '0.0', '0', '制单中', '0', '0', '2', '0', null, null, null, '402882be46404313014640b7eb1c000f', '2017-08-24 22:54:55', null, '超级管理员', null, null, null);
INSERT INTO `bus_order_info` VALUES ('4028d9815e14c199015e14c2ee330002', '201708240001', '新单', '小二', '0003', '2017-08-31', null, null, '3', '0.0', '0', '已下单', '0', '0', '1', '0', null, null, null, '402882be46404313014640b7eb1c000f', '2017-08-24 00:00:00', null, '超级管理员', null, '402882be46404313014640b7eb1c000f', '2017-08-24 23:02:12');
INSERT INTO `bus_order_info` VALUES ('4028d9815e14d0c7015e14d23bd20003', '201708240003', '新单', '小明', '0001', '2017-08-31', null, null, '3', '0.0', '0', '制单中', '0', '0', '1', '0', null, null, null, '402882be46404313014640b7eb1c000f', '2017-08-24 23:17:55', null, '超级管理员', null, null, null);
INSERT INTO `bus_order_info` VALUES ('4028d9815e14d45d015e14d4f4910002', '2017082410001', '新单', '小明', '0001', '2017-08-31', null, null, '3', '0.0', '0', '已下单', '0', '0', '4', '0', null, null, null, '402882be46404313014640b7eb1c000f', '2017-08-24 00:00:00', null, '超级管理员', null, '402882be46404313014640b7eb1c000f', '2017-08-24 23:23:30');
INSERT INTO `bus_order_info` VALUES ('4028d9815e179473015e17953d1f0003', '20170825100001', '新单', '小明', '0001', '2017-09-01', null, null, '3', '7473.0', '0', '已下单', '0', '0', '6', '0', null, null, null, '402882be46404313014640b7eb1c000f', '2017-08-25 00:00:00', null, '超级管理员', null, '402882be46404313014640b7eb1c000f', '2017-08-25 12:10:44');
INSERT INTO `bus_order_info` VALUES ('4028d9815e8b2fcb015e8b3b88cb001f', '20170916100001', '新单', '小明', '0001', '2017-09-23', null, null, '3', '45000.0', '0', '已下单', '0', '0', '12', '0', null, null, null, '402882be46404313014640b7eb1c000f', '2017-09-16 23:08:08', null, '超级管理员', null, '402882be46404313014640b7eb1c000f', '2017-09-16 23:09:40');
INSERT INTO `bus_order_info` VALUES ('4028d9815ed8f61e015ed8f75a7b0002', '20171002100001', '新单', '小孙', '0014', '2017-10-03', null, null, '3', '0.0', '0', '已下单', '0', '0', '0', '0', null, null, null, '402882be46404313014640b7eb1c000f', '2017-10-02 01:24:02', null, '超级管理员', null, '402882be46404313014640b7eb1c000f', '2017-10-02 01:24:02');
INSERT INTO `bus_order_info` VALUES ('4028d9815ef2486c015ef24fa0760008', '20171006100001', '新单', '小明', '0001', '2017-10-07', null, null, '3', '11.0', '0', '已下单', '0', '0', '2', '0', null, null, null, '402882be46404313014640b7eb1c000f', '2017-10-06 23:30:58', null, '超级管理员', null, '402882be46404313014640b7eb1c000f', '2017-10-06 23:30:58');
INSERT INTO `bus_order_info` VALUES ('4028d9815ef2801e015ef285f2600026', '20171007100001', '新单', '小明', '0001', '2017-10-08', null, null, '3', '0.0', '0', '已下单', '0', '0', '2', '0', null, null, null, '402882be46404313014640b7eb1c000f', '2017-10-07 00:30:18', null, '超级管理员', null, '402882be46404313014640b7eb1c000f', '2017-10-07 00:30:18');

-- ----------------------------
-- Table structure for bus_outside_images
-- ----------------------------
DROP TABLE IF EXISTS `bus_outside_images`;
CREATE TABLE `bus_outside_images` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `images` mediumblob,
  `outside_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_outside_images
-- ----------------------------

-- ----------------------------
-- Table structure for bus_outsourc_detail
-- ----------------------------
DROP TABLE IF EXISTS `bus_outsourc_detail`;
CREATE TABLE `bus_outsourc_detail` (
  `id` varchar(32) NOT NULL,
  `order_code` varchar(32) DEFAULT NULL,
  `outsourc_name` varchar(64) DEFAULT NULL,
  `process` varchar(32) DEFAULT NULL,
  `all_price` double(10,1) DEFAULT NULL,
  `pictures` text,
  `complete_time` date DEFAULT NULL,
  `create_man_id` varchar(32) DEFAULT NULL,
  `create_man_name` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_outsourc_detail
-- ----------------------------
INSERT INTO `bus_outsourc_detail` VALUES ('4028d98152a5bc5a0152a5bfcce20006', '2015070003', '小毛', 'UV', '2222.0', null, '2016-02-03', '402882be46404313014640b7eb1c000f', '超级管理员', '2016-02-03 14:09:16', null);
INSERT INTO `bus_outsourc_detail` VALUES ('8a8a94f75f8fe3a9015f8fee644e0002', '2015070006', '华港纸业', null, '0.0', null, '2017-11-06', '402882be46404313014640b7eb1c000f', '超级管理员', '2017-11-06 14:04:46', null);

-- ----------------------------
-- Table structure for bus_product_info
-- ----------------------------
DROP TABLE IF EXISTS `bus_product_info`;
CREATE TABLE `bus_product_info` (
  `id` varchar(32) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `style` text,
  `price` decimal(10,1) DEFAULT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `film` tinyint(1) DEFAULT NULL,
  `scotch` tinyint(1) DEFAULT NULL,
  `material` varchar(32) DEFAULT NULL,
  `open_num` varchar(32) DEFAULT NULL,
  `open_size` varchar(32) DEFAULT NULL,
  `open_method` text,
  `layout` varchar(16) DEFAULT NULL,
  `model` varchar(32) DEFAULT NULL,
  `outsourc` tinyint(1) DEFAULT NULL,
  `process` varchar(128) DEFAULT NULL,
  `description` text,
  `spec` varchar(32) DEFAULT NULL,
  `colors` varchar(32) DEFAULT NULL,
  `impos` varchar(32) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_product_info
-- ----------------------------
INSERT INTO `bus_product_info` VALUES ('402887e64e00373f014e0039f18e0002', '0003', '111', '', null, '', '1', '1', '', '', '', '', '', '', '1', '', '', '', '', '', '1');
INSERT INTO `bus_product_info` VALUES ('402887e64ecd226a014ecd23cb9c0002', '0004', '23321', '', null, '', '1', '1', '', '', '', '', '', '', '1', '', '', '', '', '', '1');
INSERT INTO `bus_product_info` VALUES ('402887e64f159dcc014f15b558930002', '0012', '1', '', null, '', '1', '0', '', '', '', '', '', '', '1', '', '', '', '', '', '1');
INSERT INTO `bus_product_info` VALUES ('402887e64f1bb72e014f1bde300c0010', '0013', '123333', '', null, '/2017/9/9/15049301455730.jpg', '1', '0', '', '', '', '', '', '', '1', '', '', '', '', '', '1');
INSERT INTO `bus_product_info` VALUES ('4028d9814f12a51b014f12a8ad7e0002', '0005', '1212', '', null, '', '1', '0', '', '', '', '', '', '', '1', '', '', '', '', '', '1');
INSERT INTO `bus_product_info` VALUES ('4028d9814f12a51b014f12aa738f0005', '0006', '123', '', null, '', '1', '0', '', '', '', '', '', '', '1', '', '', '', '', '', '1');
INSERT INTO `bus_product_info` VALUES ('4028d9814f12a51b014f12ac183d0008', '0007', 'wqwe', '', null, '', '1', '0', '', '', '', '', '', '', '1', '', '', '', '', '', '1');
INSERT INTO `bus_product_info` VALUES ('4028d9814f12a51b014f12ad66ef000a', '0008', '2131', '', null, '', '1', '0', '', '', '', '', '', '', '1', '', '', '', '', '', '1');
INSERT INTO `bus_product_info` VALUES ('4028d9814f12a51b014f12ae5dc3000d', '0009', '1221', '', null, '', '1', '0', '', '', '', '', '', '', '1', '', '', '', '', '', '1');
INSERT INTO `bus_product_info` VALUES ('4028d9814f12a51b014f12af872b0011', '0010', '12', '', null, '', '1', '0', '', '', '', '', '', '', '1', '', '', '', '', '', '1');
INSERT INTO `bus_product_info` VALUES ('4028d9814f12a51b014f12aff4dc0014', '0011', '1221', '', null, '', '1', '0', '', '', '', '', '', '', '1', '', '', '', '', '', '1');
INSERT INTO `bus_product_info` VALUES ('4028d9814f6387dc014f638e512c0002', '0014', '2332134', '', null, '/2016/2/18/14557706828872.jpg', '1', '1', '', '', '', '', '', '', '1', '', '', '', '', '', '1');
INSERT INTO `bus_product_info` VALUES ('4028d981529701d101529706e4ca0003', '0015', '包括', '', null, '/2016/2/18/14557659364162.jpg', '1', '0', '', '', '', '', '单面', '', '1', '', '', '定规', '', '', '1');
INSERT INTO `bus_product_info` VALUES ('4028d98152f451070152f4d050b90006', '0016', '知道', '', null, '/2016/2/18/14558088450141.jpg', '1', '0', '', '', '', '', '', '', '1', '', '', '', '', '', '1');
INSERT INTO `bus_product_info` VALUES ('4028d98153267de501532682475d0002', '0017', '5555', '', null, '', '1', '1', '', '', '', '', '', '滨田机', '1', '', '', '', '', '', '1');
INSERT INTO `bus_product_info` VALUES ('4028d98153323980015332578eb10002', '0018', '43434', '123,345,456', null, '/2016/3/1/14568385119690.jpg', '1', '1', '', '', '', '', '', '', '1', '', '', '', '', '', '1');
INSERT INTO `bus_product_info` VALUES ('4028d9815df5891a015df63a55f40003', '0019', '测试1', '123,234,345,456,中文', null, '', '0', '1', '双铜纸', '16', '30*40', '', '正反', '海德堡46机', '1', 'CTP', '12345678', '标规', '4', '8', '1');
INSERT INTO `bus_product_info` VALUES ('4028d9815e75d7d8015e75dc89c70002', '0020', '1', '11221', null, '', '1', '0', '', '', '', '', '', '', '1', '', '', '', '', '', '1');
INSERT INTO `bus_product_info` VALUES ('4028d9815ec84766015ec84ed6be0002', '0021', '1234567891234567891234567891234546789', '', null, '', '1', '0', '', '', '', '', '', '', '1', '', '', '', '', '', '1');
INSERT INTO `bus_product_info` VALUES ('4028d9815ec84766015ec8534ad10010', '0022', '测试长度', '123456789,234567891,3456789123,4567891234,567891234,678912345,7891234567,891234567', null, '', '1', '1', '擦拭的撒的静安寺阿萨德', '', '', '', '', '', '1', '', '', '', '', '', '1');
INSERT INTO `bus_product_info` VALUES ('4028d9815ec84766015ec876c7ff0056', '0023', '侧的萨达是打算打算的的啊', '', null, '', '1', '0', '', '', '', '', '', '', '1', '', '', '', '', '', '1');

-- ----------------------------
-- Table structure for bus_purchase_info
-- ----------------------------
DROP TABLE IF EXISTS `bus_purchase_info`;
CREATE TABLE `bus_purchase_info` (
  `id` char(32) NOT NULL,
  `set_way` varchar(32) DEFAULT NULL,
  `all_price` decimal(10,1) DEFAULT NULL,
  `carriage` decimal(10,1) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `consignee` varchar(32) DEFAULT NULL,
  `description` text,
  `enabled` tinyint(1) DEFAULT NULL,
  `create_man_id` char(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `expire` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单信息表的基本信息';

-- ----------------------------
-- Records of bus_purchase_info
-- ----------------------------
INSERT INTO `bus_purchase_info` VALUES ('2016020001', '0', '3342.0', '333.0', '17', '小王', '1212212', null, '402882be46404313014640b7eb1c000f', '2016-02-24 00:09:47', null);
INSERT INTO `bus_purchase_info` VALUES ('2016020002', '0', '6423.0', '200.0', '17', '王铮亮', '11', null, '402882be46404313014640b7eb1c000f', '2016-02-25 00:34:20', '2016-02-10');
INSERT INTO `bus_purchase_info` VALUES ('2017100001', '0', '0.0', '0.0', null, null, null, null, '402882be46404313014640b7eb1c000f', '2017-10-08 19:08:58', null);

-- ----------------------------
-- Table structure for bus_stock_base
-- ----------------------------
DROP TABLE IF EXISTS `bus_stock_base`;
CREATE TABLE `bus_stock_base` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `art_num` varchar(32) DEFAULT NULL,
  `image` varchar(32) DEFAULT NULL,
  `rack_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `store_id` int(10) unsigned zerofill DEFAULT NULL,
  `customer_code` varchar(32) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_stock_base
-- ----------------------------
INSERT INTO `bus_stock_base` VALUES ('2', '浴霸', null, '/2015/7/13/14367563813163.jpg', '1号机架', null, null, null);
INSERT INTO `bus_stock_base` VALUES ('3', '测试', '1101', '/2015/7/13/14367564166720.jpg', '2号机架', null, null, null);
INSERT INTO `bus_stock_base` VALUES ('4', '222', null, '/2015/7/13/14367570279023.png', '2号机架', null, null, null);
INSERT INTO `bus_stock_base` VALUES ('5', '234', null, '/2015/7/13/14367570491493.jpg', '2号机架', null, null, null);
INSERT INTO `bus_stock_base` VALUES ('6', '333', null, '/2015/7/13/14367570767060.jpg', '2号机架', null, null, null);
INSERT INTO `bus_stock_base` VALUES ('7', '444', null, '/2015/7/13/14367570996650.jpg', '3号机架', null, null, null);
INSERT INTO `bus_stock_base` VALUES ('8', '555', null, '/2015/7/13/14367571380610.gif', '1号机架', null, null, null);
INSERT INTO `bus_stock_base` VALUES ('9', '666', null, '/2015/7/13/14367571478841.jpg', '2号机架', null, null, null);
INSERT INTO `bus_stock_base` VALUES ('10', '777', null, '/2015/7/13/14367571555582.gif', '1号机架', null, null, null);
INSERT INTO `bus_stock_base` VALUES ('11', '888', null, null, '1号机架', null, null, null);
INSERT INTO `bus_stock_base` VALUES ('12', '999', null, '/2015/7/13/14367571745003.gif', '1号机架', null, null, null);

-- ----------------------------
-- Table structure for bus_stock_detail
-- ----------------------------
DROP TABLE IF EXISTS `bus_stock_detail`;
CREATE TABLE `bus_stock_detail` (
  `id` char(32) NOT NULL,
  `stock_id` bigint(20) NOT NULL,
  `style` varchar(32) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `unit` varchar(32) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_stock_detail
-- ----------------------------

-- ----------------------------
-- Table structure for bus_store
-- ----------------------------
DROP TABLE IF EXISTS `bus_store`;
CREATE TABLE `bus_store` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 NOT NULL,
  `address` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `contacts` varchar(16) DEFAULT NULL,
  `description` varchar(512) CHARACTER SET utf8 DEFAULT NULL,
  `disable` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bus_store
-- ----------------------------
INSERT INTO `bus_store` VALUES ('17', '本地仓库', '汉坊印刷园', null, null, '0');
INSERT INTO `bus_store` VALUES ('24', 'hai', null, null, null, '1');

-- ----------------------------
-- Table structure for r_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `r_role_menu`;
CREATE TABLE `r_role_menu` (
  `id` char(32) NOT NULL COMMENT 'ID',
  `role_id` char(32) DEFAULT NULL COMMENT '角色ID',
  `menu_id` char(32) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色菜单表';

-- ----------------------------
-- Records of r_role_menu
-- ----------------------------
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386d0021', '297ea07f3da970a6013daa018581000c', '4028d9814af28328014af32663aa0006');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386d0020', '297ea07f3da970a6013daa018581000c', '4028d9814aa3d39e014aa3d617580002');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386d001f', '297ea07f3da970a6013daa018581000c', '402882be464c0a0e01464c4f58ed0001');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386c001e', '297ea07f3da970a6013daa018581000c', '297ea07f40516d39014051bbae940001');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386c001d', '297ea07f3da970a6013daa018581000c', '297ea07f3da06a5e013da09a94cf0004');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386c001c', '297ea07f3da970a6013daa018581000c', '297ea07f3da06a5e013da099ebcd0003');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386c001b', '297ea07f3da970a6013daa018581000c', '297ea07f3da06a5e013da09960e30002');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386c001a', '297ea07f3da970a6013daa018581000c', '297ea07f3da06a5e013da0aee03e0005');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386c0019', '297ea07f3da970a6013daa018581000c', '297ea07f3e35f0a0013e35f8a5e00001');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386c0018', '297ea07f3da970a6013daa018581000c', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386c0017', '297ea07f3da970a6013daa018581000c', '4028d981531790740153179356e60002');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386c0016', '297ea07f3da970a6013daa018581000c', '4028d9815e21e12a015e21e3a4050002');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386c0015', '297ea07f3da970a6013daa018581000c', '4028878d4cbc337b014cbc4346ea0003');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386c0014', '297ea07f3da970a6013daa018581000c', '4028d9814a6d50f1014a6d5d00fb0077');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386b0013', '297ea07f3da970a6013daa018581000c', '4028d9814a6d50f1014a6d56d4850074');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386b0012', '297ea07f3da970a6013daa018581000c', '402887e64e09c689014e09c9cd400003');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386b0011', '297ea07f3da970a6013daa018581000c', '402887e64de145d5014de14829a40002');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386b0010', '297ea07f3da970a6013daa018581000c', '4028d9814adc1ba0014adc1db9d90002');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386b000f', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc56b64800fc');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386b000e', '297ea07f3da970a6013daa018581000c', '4028d98152a12d8f0152a131ef810002');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386b000d', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc5540ee00fa');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbef00b5', 'f36328d24baff4d1014baff725770002', '4028d9814af28328014af32663aa0006');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbef00b4', 'f36328d24baff4d1014baff725770002', '4028d9814aa3d39e014aa3d617580002');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbef00b3', 'f36328d24baff4d1014baff725770002', '402882be464c0a0e01464c4f58ed0001');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbef00b2', 'f36328d24baff4d1014baff725770002', '297ea07f3da06a5e013da099ebcd0003');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbef00b1', 'f36328d24baff4d1014baff725770002', '297ea07f3da06a5e013da09960e30002');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbef00b0', 'f36328d24baff4d1014baff725770002', '297ea07f3e35f0a0013e35f8a5e00001');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbef00af', 'f36328d24baff4d1014baff725770002', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbef00ae', 'f36328d24baff4d1014baff725770002', '4028878d4cbc337b014cbc4346ea0003');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbef00ad', 'f36328d24baff4d1014baff725770002', '4028d9814a6d50f1014a6d5d00fb0077');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00ac', 'f36328d24baff4d1014baff725770002', '4028d9814a6d50f1014a6d56d4850074');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00ab', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09c9cd400003');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00aa', 'f36328d24baff4d1014baff725770002', '402887e64de145d5014de14829a40002');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00a9', 'f36328d24baff4d1014baff725770002', '4028d9814adc1ba0014adc1db9d90002');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00a8', 'f36328d24baff4d1014baff725770002', '4028888e49cc3b620149cc5540ee00fa');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e867444e0080', 'f36328d24baff4d1014baff9c63f0016', '4028d9814af28328014af32663aa0006');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e867444e007f', 'f36328d24baff4d1014baff9c63f0016', '297ea07f3e35f0a0013e35f8a5e00001');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e867444e007e', 'f36328d24baff4d1014baff9c63f0016', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e867444e007d', 'f36328d24baff4d1014baff9c63f0016', '402887e64e09c689014e09c9cd400003');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e867444e007c', 'f36328d24baff4d1014baff9c63f0016', '402887e64de145d5014de14829a40002');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e867444e007b', 'f36328d24baff4d1014baff9c63f0016', '4028d9814adc1ba0014adc1db9d90002');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e867444e007a', 'f36328d24baff4d1014baff9c63f0016', '4028888e49cc3b620149cc5540ee00fa');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e867444e0079', 'f36328d24baff4d1014baff9c63f0016', '4028888e49d058530149d05a687a0002');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e867444e0078', 'f36328d24baff4d1014baff9c63f0016', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e867444e0077', 'f36328d24baff4d1014baff9c63f0016', '4028d9814b17de71014b17e6ec4b0003');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e867444d0076', 'f36328d24baff4d1014baff9c63f0016', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386b000c', '297ea07f3da970a6013daa018581000c', '4028888e49d058530149d05a687a0002');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00a7', 'f36328d24baff4d1014baff725770002', '4028888e49d058530149d05a687a0002');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00a6', 'f36328d24baff4d1014baff725770002', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00a5', 'f36328d24baff4d1014baff725770002', '4028d9814b17de71014b17e6ec4b0003');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386b000b', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00a4', 'f36328d24baff4d1014baff725770002', '4028888e49cc3b620149cc4028dc0005');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386b000a', '297ea07f3da970a6013daa018581000c', '4028d981529b18f101529b1d05600002');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386b0009', '297ea07f3da970a6013daa018581000c', '4028d9815e0511c1015e0516bf270002');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00a3', 'f36328d24baff4d1014baff725770002', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00a2', 'f36328d24baff4d1014baff725770002', '402890f03feb8eb5013feb9598640003');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e867444d0075', 'f36328d24baff4d1014baff9c63f0016', '402890f03feb8eb5013feb9598640003');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e867444d0074', 'f36328d24baff4d1014baff9c63f0016', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `r_role_menu` VALUES ('4028d98152e860080152e869dbee00a1', 'f36328d24baff4d1014baff725770002', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386b0008', '297ea07f3da970a6013daa018581000c', '4028d9814b17de71014b17e6ec4b0003');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386a0007', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc4028dc0005');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386a0006', '297ea07f3da970a6013daa018581000c', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386a0005', '297ea07f3da970a6013daa018581000c', '402890f03feb8eb5013feb9598640003');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386a0004', '297ea07f3da970a6013daa018581000c', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `r_role_menu` VALUES ('4028d9815e21e12a015e21e4386d0022', '297ea07f3da970a6013daa018581000c', '402887e64d4635eb014d463780db0002');

-- ----------------------------
-- Table structure for r_role_power
-- ----------------------------
DROP TABLE IF EXISTS `r_role_power`;
CREATE TABLE `r_role_power` (
  `id` char(32) NOT NULL COMMENT 'ID',
  `role_id` char(32) DEFAULT NULL COMMENT '角色ID',
  `power_id` char(32) DEFAULT NULL COMMENT '操作ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色操作表';

-- ----------------------------
-- Records of r_role_power
-- ----------------------------
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b1009b', '297ea07f3da970a6013daa018581000c', '4028d98153174a9101531754e6220004');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b1009a', '297ea07f3da970a6013daa018581000c', '402887025307872901530798badb000b');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b10099', '297ea07f3da970a6013daa018581000c', '40288702530787290153079878720009');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b10098', '297ea07f3da970a6013daa018581000c', '402887025307872901530797fe190007');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b10097', '297ea07f3da970a6013daa018581000c', '40288702530787290153079799500005');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b10096', '297ea07f3da970a6013daa018581000c', '40288702530787290153079722df0003');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b10095', '297ea07f3da970a6013daa018581000c', '4028d981529b247901529b2f6d980009');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b10094', '297ea07f3da970a6013daa018581000c', '4028d981529b247901529b2ef64a0007');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b10093', '297ea07f3da970a6013daa018581000c', '4028d981529b247901529b2e3f320005');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b10092', '297ea07f3da970a6013daa018581000c', '4028d981529b247901529b2d000b0003');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b10091', '297ea07f3da970a6013daa018581000c', '402887e64de14c13014de15918740006');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b10090', '297ea07f3da970a6013daa018581000c', '402887e64de14c13014de158bb700004');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b0008f', '297ea07f3da970a6013daa018581000c', '402887e64de14c13014de15834d20002');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b0008e', '297ea07f3da970a6013daa018581000c', '4028d9814c4be3cf014c4be79b030002');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b0008d', '297ea07f3da970a6013daa018581000c', '4028d9814bdf7468014bdf7e2b0d0008');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b0008c', '297ea07f3da970a6013daa018581000c', '4028d9814bdf7468014bdf7d7be80006');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b0008b', '297ea07f3da970a6013daa018581000c', '4028d9814bdf7468014bdf7ca3160004');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b0008a', '297ea07f3da970a6013daa018581000c', '4028d9814bdf7468014bdf7be2720002');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b00089', '297ea07f3da970a6013daa018581000c', '4028888e49d058530149d05bdddf0008');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b00088', '297ea07f3da970a6013daa018581000c', '4028888e49d001580149d006e7a90005');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b00087', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc584a170102');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b00086', '297ea07f3da970a6013daa018581000c', '4028888e49e4f0c30149e5001fc20009');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b00085', '297ea07f3da970a6013daa018581000c', '4028888e49e4f0c30149e4ffb6c40007');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b00084', '297ea07f3da970a6013daa018581000c', '4028888e49e4f0c30149e4ff07fa0005');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b00083', '297ea07f3da970a6013daa018581000c', '4028888e49e4f0c30149e4fe85780003');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b00082', '297ea07f3da970a6013daa018581000c', '4028888e49df4da30149df57b75e0003');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b00081', '297ea07f3da970a6013daa018581000c', '4028d98149d2bf470149d2c235070002');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b00080', '297ea07f3da970a6013daa018581000c', '4028888e49d001580149d00764c00009');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b0007f', '297ea07f3da970a6013daa018581000c', '4028888e49d001580149d007288c0007');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b0007e', '297ea07f3da970a6013daa018581000c', '4028888e49d001580149d006b1f60003');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438b0007d', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc57ecec0100');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438af007c', '297ea07f3da970a6013daa018581000c', '4028888e49cc3b620149cc5767e800fe');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438af007b', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6d0b8000a6');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438af007a', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6d6cdc00a8');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438af0079', '297ea07f3da970a6013daa018581000c', '4028820744b428f30144b5765c4b0014');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438af0078', '297ea07f3da970a6013daa018581000c', '4028820744b428f30144b576a5210016');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438af0077', '297ea07f3da970a6013daa018581000c', '4028d9814adc8f1e014adc9157b40006');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438af0076', '297ea07f3da970a6013daa018581000c', '4028d9814adc8f1e014adc91c4760008');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438af0075', '297ea07f3da970a6013daa018581000c', '4028d9814adc8f1e014adc92168c000a');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438af0074', '297ea07f3da970a6013daa018581000c', '4028d9814adc8f1e014adc9051e10002');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438af0073', '297ea07f3da970a6013daa018581000c', '4028d9814adc8f1e014adc90e72a0004');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438af0072', '297ea07f3da970a6013daa018581000c', '4028820744b428f30144b575724f0010');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438af0071', '297ea07f3da970a6013daa018581000c', '4028820744b428f30144b575f9440012');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438af0070', '297ea07f3da970a6013daa018581000c', '297ea07f3e346d19013e346e4bb70001');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438af006f', '297ea07f3da970a6013daa018581000c', '297ea07f3e34a15b013e34a1e4260001');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438af006e', '297ea07f3da970a6013daa018581000c', '297ea07f422b5f8401422b6029390001');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438af006d', '297ea07f3da970a6013daa018581000c', '4028d9814b1275e3014b127b01b90002');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438af006c', '297ea07f3da970a6013daa018581000c', '4028d9814b1275e3014b127b9dcc0004');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438af006b', '297ea07f3da970a6013daa018581000c', '4028d9814b1275e3014b127c85a60006');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438af006a', '297ea07f3da970a6013daa018581000c', '4028d9814b1275e3014b12821a940009');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ae0069', '297ea07f3da970a6013daa018581000c', '4028d9814b1275e3014b1282a983000b');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ae0068', '297ea07f3da970a6013daa018581000c', '4028d9814b38a40a014b38beb1b60002');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ae0067', '297ea07f3da970a6013daa018581000c', '297ea07f3e359d13013e359fe4af0003');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ae0066', '297ea07f3da970a6013daa018581000c', '297ea07f3e359d13013e35a15ecc0004');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ae0065', '297ea07f3da970a6013daa018581000c', '402880e73f3b3caa013f3c5278990014');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ae0064', '297ea07f3da970a6013daa018581000c', '297ea07f3fc27b1a013fc283e7c30004');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ae0063', '297ea07f3da970a6013daa018581000c', '4028803c41243da901425956bf8f000b');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ae0062', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa4a77fa0029');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ae0061', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa4af7a1002c');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ae0060', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa4b81db002e');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ae005f', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa4cd40b0032');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ae005e', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa4d1b4d0034');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ae005d', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa4d79c60036');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ae005c', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa513013003e');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ae005b', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa5cb32c006e');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ae005a', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa568f3a0055');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ae0059', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa56c2fb0057');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ae0058', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa56fa3a0059');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ae0057', '297ea07f3da970a6013daa018581000c', '402882a542ff39ce0142ff3dcc000003');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ad0056', '297ea07f3da970a6013daa018581000c', '402882a542ff39ce0142ff98687300c2');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ad0055', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa657141007b');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ad0054', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa65a09a007d');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ad0053', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa66642f0081');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ad0052', '297ea07f3da970a6013daa018581000c', '4028d9814b0cfc2a014b0cfec1e80004');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ad0051', '297ea07f3da970a6013daa018581000c', '4028d9814b0cfc2a014b0cfdbe820002');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ad0050', '297ea07f3da970a6013daa018581000c', '4028d9814b0cfc2a014b0d00d06c000c');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ad004f', '297ea07f3da970a6013daa018581000c', '4028d9814b0cfc2a014b0d00602b000a');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ad004e', '297ea07f3da970a6013daa018581000c', '4028d9814b0cfc2a014b0d0001fe0008');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ad004d', '297ea07f3da970a6013daa018581000c', '402882a542ff39ce0142ff9818ea00c0');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ad004c', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa67520a0086');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ad004b', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6788950088');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ad004a', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa681215008c');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ad0049', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa686b09008e');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ad0048', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa693feb0092');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e8674457009a', 'f36328d24baff4d1014baff9c63f0016', '402887e64e09c689014e09cd38db000f');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e86744570099', 'f36328d24baff4d1014baff9c63f0016', '402887e64e09c689014e09ccf0d1000d');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e86744570098', 'f36328d24baff4d1014baff9c63f0016', '402887e64e09c689014e09ccbab2000b');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e86744570097', 'f36328d24baff4d1014baff9c63f0016', '402887e64e09c689014e09cb96310007');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e86744570096', 'f36328d24baff4d1014baff9c63f0016', '402887e64e09c689014e09cacd120005');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e86744570095', 'f36328d24baff4d1014baff9c63f0016', '402887e64de14c13014de15918740006');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e86744570094', 'f36328d24baff4d1014baff9c63f0016', '402887e64de14c13014de158bb700004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e86744570093', 'f36328d24baff4d1014baff9c63f0016', '402887e64de14c13014de15834d20002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e86744570092', 'f36328d24baff4d1014baff9c63f0016', '4028d9814adc8f1e014adc90e72a0004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e86744570091', 'f36328d24baff4d1014baff9c63f0016', '4028d9814adc8f1e014adc9051e10002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e86744570090', 'f36328d24baff4d1014baff9c63f0016', '4028d9814adc8f1e014adc92168c000a');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e8674457008f', 'f36328d24baff4d1014baff9c63f0016', '4028d9814adc8f1e014adc91c4760008');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e8674456008e', 'f36328d24baff4d1014baff9c63f0016', '4028888e49e62c670149e62e58aa0004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e8674456008d', 'f36328d24baff4d1014baff9c63f0016', '4028888e49e62c670149e62dd2d00002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e8674456008c', 'f36328d24baff4d1014baff9c63f0016', '4028888e49cc3b620149cc57ecec0100');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e8674456008b', 'f36328d24baff4d1014baff9c63f0016', '4028888e49cc3b620149cc5767e800fe');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e8674456008a', 'f36328d24baff4d1014baff9c63f0016', '4028888e49f4ba790149f5015668000a');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf80112', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09cc6d040009');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70111', 'f36328d24baff4d1014baff725770002', '4028d9814adc8f1e014adc9157b40006');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70110', 'f36328d24baff4d1014baff725770002', '4028888e49d058530149d05bdddf0008');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf7010f', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09cd38db000f');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf7010e', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09ccf0d1000d');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf7010d', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09ccbab2000b');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf7010c', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09cb96310007');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf7010b', 'f36328d24baff4d1014baff725770002', '402887e64e09c689014e09cacd120005');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf7010a', 'f36328d24baff4d1014baff725770002', '402887e64de14c13014de15918740006');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70109', 'f36328d24baff4d1014baff725770002', '402887e64de14c13014de158bb700004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70108', 'f36328d24baff4d1014baff725770002', 'f36328d24baf6b7f014baf713ed00008');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70107', 'f36328d24baff4d1014baff725770002', '4028d9814adc8f1e014adc90e72a0004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70106', 'f36328d24baff4d1014baff725770002', '4028d9814adc8f1e014adc9051e10002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70105', 'f36328d24baff4d1014baff725770002', '4028d9814b0cfc2a014b0cfec1e80004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70104', 'f36328d24baff4d1014baff725770002', '4028d9814b0cfc2a014b0cfdbe820002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70103', 'f36328d24baff4d1014baff725770002', '4028d9814adc8f1e014adc92168c000a');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70102', 'f36328d24baff4d1014baff725770002', '4028d9814adc8f1e014adc91c4760008');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70101', 'f36328d24baff4d1014baff725770002', '4028d9814b38a40a014b38beb1b60002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf70100', 'f36328d24baff4d1014baff725770002', '4028d9814b1275e3014b1282a983000b');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf700ff', 'f36328d24baff4d1014baff725770002', '4028d9814b1275e3014b12821a940009');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf700fe', 'f36328d24baff4d1014baff725770002', '4028d9814b1275e3014b127c85a60006');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600fd', 'f36328d24baff4d1014baff725770002', '4028d9814b1275e3014b127b9dcc0004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600fc', 'f36328d24baff4d1014baff725770002', '4028d9814b1275e3014b127b01b90002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600fb', 'f36328d24baff4d1014baff725770002', '4028d9814b0cfc2a014b0d00d06c000c');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600fa', 'f36328d24baff4d1014baff725770002', '4028d9814b0cfc2a014b0d00602b000a');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f9', 'f36328d24baff4d1014baff725770002', '4028d9814b0cfc2a014b0d0001fe0008');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f8', 'f36328d24baff4d1014baff725770002', '4028888e49f4ba790149f5015668000a');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f7', 'f36328d24baff4d1014baff725770002', '4028888e49e62c670149e62e58aa0004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f6', 'f36328d24baff4d1014baff725770002', '4028888e49e62c670149e62dd2d00002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f5', 'f36328d24baff4d1014baff725770002', '4028888e49e4f0c30149e4ff07fa0005');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f4', 'f36328d24baff4d1014baff725770002', '4028888e49e4f0c30149e4fe85780003');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f3', 'f36328d24baff4d1014baff725770002', '4028888e49dfa6d80149dfa8f3340004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f2', 'f36328d24baff4d1014baff725770002', '4028888e49dfa6d80149dfa877380002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f1', 'f36328d24baff4d1014baff725770002', '4028d98149d2bf470149d2c235070002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600f0', 'f36328d24baff4d1014baff725770002', '4028888e49d058530149d05b8c200006');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600ef', 'f36328d24baff4d1014baff725770002', '4028888e49d058530149d05b18b70004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600ee', 'f36328d24baff4d1014baff725770002', '4028820744b428f30144b575f9440012');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600ed', 'f36328d24baff4d1014baff725770002', '4028820744b428f30144b575724f0010');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600ec', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6d6cdc00a8');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600eb', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6d0b8000a6');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600ea', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6c7fe300a4');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600e9', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6c32a000a2');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf600e8', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6bbf9400a0');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500e7', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6b7333009e');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500e6', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6a9a17009a');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500e5', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6a58560098');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500e4', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6a1f710096');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500e3', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa69a7650094');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500e2', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa693feb0092');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500e1', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa686b09008e');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500e0', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa681215008c');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500df', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa6788950088');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500de', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa67520a0086');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500dd', 'f36328d24baff4d1014baff725770002', '402882a542ff39ce0142ff9818ea00c0');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500dc', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa66642f0081');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500db', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa65a09a007d');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500da', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa657141007b');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500d9', 'f36328d24baff4d1014baff725770002', '402882a542ff39ce0142ff98687300c2');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500d8', 'f36328d24baff4d1014baff725770002', '402882a542ff39ce0142ff3dcc000003');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500d7', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa56fa3a0059');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500d6', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa56c2fb0057');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500d5', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa568f3a0055');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf500d4', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa5cb32c006e');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400d3', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa513013003e');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400d2', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa4d79c60036');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400d1', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa4d1b4d0034');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400d0', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa4cd40b0032');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400cf', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa4b81db002e');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400ce', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa4af7a1002c');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400cd', 'f36328d24baff4d1014baff725770002', '402882a542fa2d9f0142fa4a77fa0029');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400cc', 'f36328d24baff4d1014baff725770002', '4028888e49cc3b620149cc584a170102');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400cb', 'f36328d24baff4d1014baff725770002', '4028888e49cc3b620149cc57ecec0100');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400ca', 'f36328d24baff4d1014baff725770002', '4028888e49cc3b620149cc5767e800fe');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c9', 'f36328d24baff4d1014baff725770002', '4028803c41243da901425956bf8f000b');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c8', 'f36328d24baff4d1014baff725770002', '297ea07f3fc27b1a013fc283e7c30004');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ad0047', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa69a7650094');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ad0046', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6a1f710096');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ad0045', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6a58560098');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ad0044', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6a9a17009a');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ac0043', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6b7333009e');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ac0042', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6bbf9400a0');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c7', 'f36328d24baff4d1014baff725770002', '402880e73f3b3caa013f3c5278990014');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c6', 'f36328d24baff4d1014baff725770002', '297ea07f3e359d13013e35a15ecc0004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c5', 'f36328d24baff4d1014baff725770002', '297ea07f3e359d13013e359fe4af0003');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c4', 'f36328d24baff4d1014baff725770002', '297ea07f422b5f8401422b6029390001');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c3', 'f36328d24baff4d1014baff725770002', '297ea07f3e34a15b013e34a1e4260001');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c2', 'f36328d24baff4d1014baff725770002', '297ea07f3e346d19013e346e4bb70001');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ac0041', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6c32a000a2');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ac0040', '297ea07f3da970a6013daa018581000c', '402882a542fa2d9f0142fa6c7fe300a4');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ac003f', '297ea07f3da970a6013daa018581000c', '4028888e49d058530149d05b18b70004');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ac003e', '297ea07f3da970a6013daa018581000c', '4028888e49d058530149d05b8c200006');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e86744560089', 'f36328d24baff4d1014baff9c63f0016', '4028888e49dfa6d80149dfa877380002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c1', 'f36328d24baff4d1014baff725770002', '4028820744b428f30144b576a5210016');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400c0', 'f36328d24baff4d1014baff725770002', '4028820744b428f30144b5765c4b0014');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ac003d', '297ea07f3da970a6013daa018581000c', '4028d98149d5445f0149d54bfe900002');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ac003c', '297ea07f3da970a6013daa018581000c', '4028888e49dfa6d80149dfa877380002');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ac003b', '297ea07f3da970a6013daa018581000c', '4028888e49dfa6d80149dfa8f3340004');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ac003a', '297ea07f3da970a6013daa018581000c', '4028888e49e62c670149e62dd2d00002');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ac0039', '297ea07f3da970a6013daa018581000c', '4028888e49e62c670149e62e58aa0004');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ac0038', '297ea07f3da970a6013daa018581000c', '4028888e49f4ba790149f5015668000a');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ac0037', '297ea07f3da970a6013daa018581000c', '4028888e49f4ba790149f5030ae1000c');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ac0036', '297ea07f3da970a6013daa018581000c', 'f36328d24baf6b7f014baf713ed00008');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ac0035', '297ea07f3da970a6013daa018581000c', '4028d9814bcda404014bcdad9f190004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400bf', 'f36328d24baff4d1014baff725770002', '4028d9814bdf7468014bdf7be2720002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf400be', 'f36328d24baff4d1014baff725770002', '4028d9814bdf7468014bdf7ca3160004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf300bd', 'f36328d24baff4d1014baff725770002', '4028d9814bdf7468014bdf7d7be80006');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf300bc', 'f36328d24baff4d1014baff725770002', '4028d9814bdf7468014bdf7e2b0d0008');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf300bb', 'f36328d24baff4d1014baff725770002', '4028d9814bcda404014bcdad9f190004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf300ba', 'f36328d24baff4d1014baff725770002', '4028d9814bcda404014bcdae284f0006');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf300b9', 'f36328d24baff4d1014baff725770002', '4028878d4cbb5fff014cbb838f880021');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e86744560088', 'f36328d24baff4d1014baff9c63f0016', '4028888e49dfa6d80149dfa8f3340004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e86744560087', 'f36328d24baff4d1014baff9c63f0016', '4028888e49e4f0c30149e4ff07fa0005');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e86744560086', 'f36328d24baff4d1014baff9c63f0016', '4028888e49e4f0c30149e4fe85780003');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e86744560085', 'f36328d24baff4d1014baff9c63f0016', '4028d98149d2bf470149d2c235070002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e86744560084', 'f36328d24baff4d1014baff9c63f0016', '4028888e49d058530149d05b8c200006');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e86744560083', 'f36328d24baff4d1014baff9c63f0016', '4028888e49d058530149d05b18b70004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e86744560082', 'f36328d24baff4d1014baff9c63f0016', '4028d9814b38a40a014b38beb1b60002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e86744560081', 'f36328d24baff4d1014baff9c63f0016', '4028878d4cbb5fff014cbb838f880021');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ac0034', '297ea07f3da970a6013daa018581000c', '4028d9814bcda404014bcdae284f0006');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ac0033', '297ea07f3da970a6013daa018581000c', '4028d9814c3a9999014c3a9cb0f20002');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ac0032', '297ea07f3da970a6013daa018581000c', '4028d9814c40d654014c41c163ef0005');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ab0031', '297ea07f3da970a6013daa018581000c', '4028878d4cbb5fff014cbb838f880021');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ab0030', '297ea07f3da970a6013daa018581000c', '402887e64e09c689014e09cacd120005');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ab002f', '297ea07f3da970a6013daa018581000c', '402887e64e09c689014e09cb96310007');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ab002e', '297ea07f3da970a6013daa018581000c', '402887e64e09c689014e09cc6d040009');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ab002d', '297ea07f3da970a6013daa018581000c', '402887e64e09c689014e09ccbab2000b');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ab002c', '297ea07f3da970a6013daa018581000c', '402887e64e09c689014e09ccf0d1000d');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ab002b', '297ea07f3da970a6013daa018581000c', '402887e64e09c689014e09cd38db000f');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ab002a', '297ea07f3da970a6013daa018581000c', '4028d98152a12d8f0152a1382197000c');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf300b8', 'f36328d24baff4d1014baff725770002', '4028d9814c3a9999014c3a9cb0f20002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf300b7', 'f36328d24baff4d1014baff725770002', '4028d9814c4be3cf014c4be79b030002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf300b6', 'f36328d24baff4d1014baff725770002', '402887e64de14c13014de15834d20002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e8674457009b', 'f36328d24baff4d1014baff9c63f0016', '4028d9814bdf7468014bdf7be2720002');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e8674457009c', 'f36328d24baff4d1014baff9c63f0016', '4028d9814bdf7468014bdf7ca3160004');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e8674457009d', 'f36328d24baff4d1014baff9c63f0016', '4028d9814bdf7468014bdf7d7be80006');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e8674457009e', 'f36328d24baff4d1014baff9c63f0016', '4028d9814bdf7468014bdf7e2b0d0008');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e8674457009f', 'f36328d24baff4d1014baff9c63f0016', '4028d9814c40d654014c41c163ef0005');
INSERT INTO `r_role_power` VALUES ('4028d98152e860080152e869dbf80113', 'f36328d24baff4d1014baff725770002', '4028d9814c40d654014c41c163ef0005');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ab0029', '297ea07f3da970a6013daa018581000c', '4028d98152a12d8f0152a13952f1000e');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ab0028', '297ea07f3da970a6013daa018581000c', '4028d98152a12d8f0152a139f1840010');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ab0027', '297ea07f3da970a6013daa018581000c', '4028d98152a12d8f0152a13aeb360012');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ab0026', '297ea07f3da970a6013daa018581000c', '4028d98152a12d8f0152a13bc1840015');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ab0025', '297ea07f3da970a6013daa018581000c', '4028d98152a12d8f0152a13c51980017');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ab0024', '297ea07f3da970a6013daa018581000c', '4028d98152a12d8f0152a13ef2a00019');
INSERT INTO `r_role_power` VALUES ('4028d9815e21e12a015e21e438ab0023', '297ea07f3da970a6013daa018581000c', '4028d9815316f41e015317182f44000d');

-- ----------------------------
-- Table structure for r_role_user
-- ----------------------------
DROP TABLE IF EXISTS `r_role_user`;
CREATE TABLE `r_role_user` (
  `id` char(32) NOT NULL COMMENT 'ID',
  `role_id` char(32) DEFAULT NULL COMMENT '角色ID',
  `user_id` char(32) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色用户表';

-- ----------------------------
-- Records of r_role_user
-- ----------------------------
INSERT INTO `r_role_user` VALUES ('402882be46404313014640b84ece0013', '297ea07f3da970a6013daa018581000c', '402882be46404313014640b7eb1c000f');
INSERT INTO `r_role_user` VALUES ('f36328d24baff4d1014baffd331e008d', 'f36328d24baff4d1014baff725770002', 'f36328d24baff4d1014baff87a660012');
INSERT INTO `r_role_user` VALUES ('4028d98152e860080152e86aed810116', 'f36328d24baff4d1014baff9c63f0016', '4028d98152e860080152e86ab6740114');

-- ----------------------------
-- Table structure for service_registry
-- ----------------------------
DROP TABLE IF EXISTS `service_registry`;
CREATE TABLE `service_registry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `evaluation_order` int(11) NOT NULL,
  `ignore_attributes` tinyint(1) NOT NULL,
  `img_path` longtext,
  `index_url` longtext NOT NULL,
  `name` varchar(32) NOT NULL,
  `power_code` varchar(32) NOT NULL,
  `service_id` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service_registry
-- ----------------------------
INSERT INTO `service_registry` VALUES ('1', '1232', '10000014', '1', '/images/apps/monitor.png', 'http://192.168.6.123:8080/fsun-erp', 'fsun-erp', 'ROLE_ADMIN', 'http://192.168.6.123:8080/fsun-erp/.*');

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `key` varchar(64) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `pid` int(10) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `sequence` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES ('4', 'ORDER_SUMMARY_GROUP_BY', '订单汇总分组', null, null, '1', '2');
INSERT INTO `sys_dictionary` VALUES ('5', 'customerName', '客户名称', 'customerName', '4', '1', '1');
INSERT INTO `sys_dictionary` VALUES ('6', 'orderType', '订单类型', 'orderType', '4', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('7', 'isGet', '是否已付款', 'hasGet', '4', '1', '3');
INSERT INTO `sys_dictionary` VALUES ('8', 'receiveTime', '交货日期', 'receiveTime', '4', '1', '4');
INSERT INTO `sys_dictionary` VALUES ('25', 'status', '订单状态', 'status', '4', '1', '5');
INSERT INTO `sys_dictionary` VALUES ('26', 'PRODUCT_LAYOUT', '拼版', null, null, '1', '6');
INSERT INTO `sys_dictionary` VALUES ('27', '单面', '单面', null, '26', '1', '1');
INSERT INTO `sys_dictionary` VALUES ('28', '正反', '正反', null, '26', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('29', '自反', '自反', null, '26', '1', '3');
INSERT INTO `sys_dictionary` VALUES ('30', 'PRODUCT_MODEL', '生产机型', null, null, '1', '7');
INSERT INTO `sys_dictionary` VALUES ('31', 'PRODUCT_PROCESS', '加工类型', null, null, '1', '8');
INSERT INTO `sys_dictionary` VALUES ('32', '碰刀', '碰刀', null, '31', '1', '1');
INSERT INTO `sys_dictionary` VALUES ('33', 'UV', 'UV', null, '31', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('34', '上光', '上光', null, '31', '1', '3');
INSERT INTO `sys_dictionary` VALUES ('35', '烫金', '烫金', null, '31', '1', '4');
INSERT INTO `sys_dictionary` VALUES ('36', '覆膜', '覆膜', null, '31', '1', '5');
INSERT INTO `sys_dictionary` VALUES ('37', '切纸', '切纸', null, '31', '1', '6');
INSERT INTO `sys_dictionary` VALUES ('38', '滨田机', '滨田机', null, '30', '1', '1');
INSERT INTO `sys_dictionary` VALUES ('39', '52机', '52机', null, '30', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('40', '4色机', '4色机', null, '30', '1', '3');
INSERT INTO `sys_dictionary` VALUES ('41', '海德堡46机', '海德堡46机', null, '30', '1', '4');
INSERT INTO `sys_dictionary` VALUES ('42', '海德堡52机', '海德堡52机', null, '30', '1', '5');
INSERT INTO `sys_dictionary` VALUES ('43', '海德堡4色机', '海德堡4色机', null, '30', '1', '6');
INSERT INTO `sys_dictionary` VALUES ('44', '印刷', '印刷', null, '31', '1', '7');
INSERT INTO `sys_dictionary` VALUES ('45', 'STOCK_RACK_NUM', '机架号', null, null, '1', '9');
INSERT INTO `sys_dictionary` VALUES ('46', '1号机架', '1号机架', null, '45', '1', '1');
INSERT INTO `sys_dictionary` VALUES ('47', '2号机架', '2号机架', null, '45', '1', '2');
INSERT INTO `sys_dictionary` VALUES ('48', '3号机架', '3号机架', null, '45', '1', '3');
INSERT INTO `sys_dictionary` VALUES ('49', '4号机架', '4号机架', null, '45', '1', '4');
INSERT INTO `sys_dictionary` VALUES ('50', '5号机架', '5号机架', null, '45', '1', '5');
INSERT INTO `sys_dictionary` VALUES ('51', '6号机架', '6号机架', null, '45', '1', '6');
INSERT INTO `sys_dictionary` VALUES ('52', '其他', '其他', null, '31', '1', '8');
INSERT INTO `sys_dictionary` VALUES ('53', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` char(32) NOT NULL,
  `user_id` char(32) DEFAULT NULL COMMENT '操作用户',
  `log_level` tinyint(10) DEFAULT NULL COMMENT '日志级别',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `operate_type` tinyint(10) DEFAULT NULL COMMENT '操作类别(1登录、2退出、3插入、4删除、5更新、6打印、7上传、8其他'')',
  `log_content` text COMMENT '日志内容',
  `note` text COMMENT '节点',
  `broswer` varchar(100) DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d955c62460001', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 20:32:49', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d956064ac0006', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 20:37:11', '3', '产品： 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d956223b40008', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 20:39:06', '3', '客户： 淘宝店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d9563627a000a', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 20:40:28', '3', '订单ID: null插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d95664743000c', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 20:43:37', '3', '订单(编号:2015050001)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d95667a5a000d', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 20:43:50', '5', '订单ID: 4028d9814d955a9a014d9563626f0009更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d956c5df90011', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 20:50:16', '5', '产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d956cd1cf0012', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 20:50:46', '5', '订单(编号:2015050001)下的产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d956eb3d20014', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 20:52:49', '3', '订单(编号:2015050001)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d959ac53f0015', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 21:40:57', '5', '订单(编号:2015050001)下的产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d959b68060019', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 21:41:39', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d959eec13001d', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 21:45:29', '3', '订单: 4028d9814d955a9a014d959b67f30016的返单及其返单产品信息添加成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d959f9692001e', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 21:46:13', '4', '订单(：4028d9814d955a9a014d959eebf9001a)删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d959fc5590022', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 21:46:25', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d959fda5d0023', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 21:46:30', '4', '订单(：4028d9814d955a9a014d959fc52e001f)删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d95a542a30027', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 21:52:25', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d95a55da00028', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 21:52:32', '4', '订单(：4028d9814d955a9a014d95a542780024)删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d95bbcaef002d', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 22:17:01', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d95bbfdff002e', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 22:17:15', '4', '订单(：4028d9814d955a9a014d95bbb1820029)删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d95bc3d2c0032', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 22:17:31', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d95bc5e120033', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 22:17:39', '4', '订单(：4028d9814d955a9a014d95bc3d05002f)删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d95bcc19f0038', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 22:18:05', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d95bed4d70039', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 22:20:21', '4', '订单(：4028d9814d955a9a014d95bcc1930034)删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d95bf5e4d003b', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 22:20:56', '3', '客户： 海盐插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d95bfb026003f', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 22:21:17', '3', '订单: 4028d9814d955a9a014d959b67f30016的返单及其返单产品信息添加成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d95c0ec3b0043', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 22:22:38', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d95c1039e0044', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 22:22:44', '4', '订单(：4028d9814d955a9a014d95c0ec0d0040)删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d955a9a014d95c92be00045', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 22:31:38', '5', '订单(编号:2015050018)下的产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d960b78014d960d4b460001', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 23:46:03', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d960b78014d960da92b0002', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 23:46:27', '5', '订单(订单号:4028d9814d955a9a014d959b67f30016)下的产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d960b78014d960eda840003', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 23:47:45', '5', '订单(订单号:4028d9814d955a9a014d959b67f30016)下的产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d960b78014d961241260004', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 23:51:28', '5', '订单(订单号:4028d9814d955a9a014d95bfaffa003c)下的产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d960b78014d9612f4e60005', '402882be46404313014640b7eb1c000f', '1', '2015-05-27 23:52:14', '5', '订单(订单号:4028d9814d955a9a014d95bfaffa003c)下的产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d960b78014d962013790006', '402882be46404313014640b7eb1c000f', '1', '2015-05-28 00:06:34', '5', '订单(订单号:4028d9814d955a9a014d95bfaffa003c)下的产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d960b78014d962051140007', '402882be46404313014640b7eb1c000f', '1', '2015-05-28 00:06:49', '5', '订单(订单号:4028d9814d955a9a014d95bfaffa003c)下的产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d960b78014d962293450008', '402882be46404313014640b7eb1c000f', '1', '2015-05-28 00:09:17', '5', '订单(订单号:4028d9814d955a9a014d95bfaffa003c)下的产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d960b78014d962527120009', '402882be46404313014640b7eb1c000f', '1', '2015-05-28 00:12:06', '5', '订单(订单号:4028d9814d955a9a014d95bfaffa003c)下的产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d960b78014d962b02b0000a', '402882be46404313014640b7eb1c000f', '1', '2015-05-28 00:18:30', '5', '订单(订单号:4028d9814d955a9a014d95bfaffa003c)下的产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d960b78014d962b719f000b', '402882be46404313014640b7eb1c000f', '1', '2015-05-28 00:18:59', '5', '订单(订单号:4028d9814d955a9a014d95bfaffa003c)下的产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d960b78014d962d0d4b000c', '402882be46404313014640b7eb1c000f', '1', '2015-05-28 00:20:44', '5', '订单(订单号:4028d9814d955a9a014d95bfaffa003c)下的产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d960b78014d962e8a2d000d', '402882be46404313014640b7eb1c000f', '1', '2015-05-28 00:22:21', '5', '订单(订单号:4028d9814d955a9a014d95bfaffa003c)下的产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814d9fdc11014d9fde0e8a0001', '402882be46404313014640b7eb1c000f', '1', '2015-05-29 21:30:39', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da33e82014da33f84670001', '402882be46404313014640b7eb1c000f', '1', '2015-05-30 13:15:58', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da33e82014da34277510002', '402882be46404313014640b7eb1c000f', '1', '2015-05-30 13:19:11', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da33e82014da343cbc10006', '402882be46404313014640b7eb1c000f', '1', '2015-05-30 13:20:38', '5', '产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da33e82014da34e9f27000a', '402882be46404313014640b7eb1c000f', '1', '2015-05-30 13:32:28', '5', '产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da33e82014da34fef3f0011', '402882be46404313014640b7eb1c000f', '1', '2015-05-30 13:33:54', '5', '产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da33e82014da350eae50018', '402882be46404313014640b7eb1c000f', '1', '2015-05-30 13:34:58', '5', '产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da33e82014da35138f3001a', '402882be46404313014640b7eb1c000f', '1', '2015-05-30 13:35:18', '3', '订单(编号:2015050002)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da33e82014da3515a6a001c', '402882be46404313014640b7eb1c000f', '1', '2015-05-30 13:35:27', '3', '订单(编号:2015050002)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da33e82014da3520428001e', '402882be46404313014640b7eb1c000f', '1', '2015-05-30 13:36:10', '3', '订单(编号:2015050002)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da33e82014da3524faf0020', '402882be46404313014640b7eb1c000f', '1', '2015-05-30 13:36:30', '3', '订单(编号:2015050002)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da33e82014da352a7dc0022', '402882be46404313014640b7eb1c000f', '1', '2015-05-30 13:36:52', '3', '订单(编号:2015050002)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da33e82014da35424cd0024', '402882be46404313014640b7eb1c000f', '1', '2015-05-30 13:38:30', '3', '订单(编号:2015050002)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da33e82014da3544c850026', '402882be46404313014640b7eb1c000f', '1', '2015-05-30 13:38:40', '3', '订单(编号:2015050002)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da33e82014da3546cbd0028', '402882be46404313014640b7eb1c000f', '1', '2015-05-30 13:38:48', '3', '订单(编号:2015050002)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da33e82014da3548a7f002a', '402882be46404313014640b7eb1c000f', '1', '2015-05-30 13:38:56', '3', '订单(编号:2015050002)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da33e82014da354aa57002c', '402882be46404313014640b7eb1c000f', '1', '2015-05-30 13:39:04', '3', '订单(编号:2015050002)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da33e82014da354c617002e', '402882be46404313014640b7eb1c000f', '1', '2015-05-30 13:39:11', '3', '订单(编号:2015050002)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da33e82014da354e6410030', '402882be46404313014640b7eb1c000f', '1', '2015-05-30 13:39:19', '3', '订单(编号:2015050002)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da33e82014da3550eec0032', '402882be46404313014640b7eb1c000f', '1', '2015-05-30 13:39:30', '3', '订单(编号:2015050002)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da83ec9f40001', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 12:33:16', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da861c3380002', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 13:11:28', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da87154ab0007', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 13:28:29', '3', '订单ID: 4028d9814d955a9a014d959b67f30016下的产品123及其订单信息插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da892b0460019', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 14:04:55', '3', '订单: 4028d9814d955a9a014d959b67f30016的返单及其返单产品信息添加成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da892d1e4001a', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 14:05:03', '4', '订单(编号:2015050019)下的产品: 123删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da90bd062001b', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 16:17:13', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9484dfd001c', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 17:23:17', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9af8017001d', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:16:00', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9b88430001f', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:25:51', '3', '订单(编号:2015050019)下的产品: 123插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9b8b89d0021', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:26:04', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9b8dbc00023', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:26:13', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9b9046e0025', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:26:24', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9b924710027', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:26:32', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9b944bf0029', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:26:40', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9b96ab8002b', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:26:50', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9b98e1b002d', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:26:59', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9b9aebe002f', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:27:07', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9b9d6430031', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:27:18', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9b9f96a0033', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:27:27', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9ba24690035', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:27:38', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9ba4a9c0037', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:27:47', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9bf03c00039', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:32:57', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9bf292f003b', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:33:06', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9bf52a4003d', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:33:17', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9bf77e4003f', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:33:27', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9c13b580041', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:35:22', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9c164e80043', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:35:33', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9c18b0c0045', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:35:43', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9c1b4520047', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:35:53', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9c1dd2f0049', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:36:04', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9c208c4004b', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:36:15', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9c22ecd004d', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:36:25', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9c69fc5004f', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:41:16', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9c6c5b50051', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:41:25', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9c74a3b0052', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:41:59', '4', '订单(编号:2015050019)下的产品: 123删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9c77aa50054', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:42:12', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9c7a44a0056', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:42:22', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9c7c92f0058', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 19:42:32', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014da9e7c78c0059', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 20:17:28', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa17c553005a', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 21:09:54', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa227c76005c', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 21:21:36', '3', '订单(编号:2015050019)下的产品: 123插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa2e6b6c005d', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 21:34:38', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa2e7ee4005e', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 21:34:43', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa2e954f005f', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 21:34:49', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa4d2b1b0062', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:08:13', '5', '产品: 123更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa60b9ce0063', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:29:35', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa60cd500064', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:29:40', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa60f4c80065', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:29:50', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa610fb50066', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:29:57', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa6128ef0067', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:30:03', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa613e5f0068', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:30:09', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa6158c80069', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:30:16', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa61766e006a', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:30:23', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa619232006b', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:30:30', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa61c080006c', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:30:42', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa61d6e9006d', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:30:48', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa61f0d0006e', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:30:54', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa6209a1006f', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:31:01', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa62209c0070', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:31:07', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa623de80071', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:31:14', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa654cec0072', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:34:35', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa6570ee0073', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:34:44', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa6651880074', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:35:41', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa66c77b0075', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:36:12', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa6829960076', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:37:42', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa6871070077', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:38:00', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa68ecfe0078', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:38:32', '5', '订单(编号:2015050019)下的产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa6929e80079', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:38:48', '5', '订单(编号:2015050019)下的产品: 店铺更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa6beaca007a', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:41:48', '4', '订单(编号:2015050002)下的产品: 店铺删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa6e01f1007b', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:44:05', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa6e34f9007c', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:44:18', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa6e4096007d', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:44:21', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa6f0b29007e', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:45:13', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa6f1d5d007f', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:45:18', '4', '订单(编号:2015050019)下的产品: 店铺删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814da83d4b014daa7615580080', '402882be46404313014640b7eb1c000f', '1', '2015-05-31 22:52:54', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814db40e16014db41b730d0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-02 19:50:07', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814db40e16014db43e164b0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-02 20:27:57', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814db40e16014db49262110003', '402882be46404313014640b7eb1c000f', '1', '2015-06-02 22:00:01', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64db78797014db8084bd70001', '402882be46404313014640b7eb1c000f', '1', '2015-06-03 14:07:40', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64db78797014db888f31d0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-03 16:28:12', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814dc3ff55014dc4011ff00001', '402882be46404313014640b7eb1c000f', '1', '2015-06-05 21:55:17', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814dc432aa014dc433c19c0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-05 22:50:35', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814dc432aa014dc4579c580003', '402882be46404313014640b7eb1c000f', '1', '2015-06-05 23:29:45', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814dc432aa014dc457baa30005', '402882be46404313014640b7eb1c000f', '1', '2015-06-05 23:29:53', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814dc432aa014dc457d6370007', '402882be46404313014640b7eb1c000f', '1', '2015-06-05 23:30:00', '3', '订单(编号:2015050019)下的产品: 店铺插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814dc432aa014dc4716adf0008', '402882be46404313014640b7eb1c000f', '1', '2015-06-05 23:57:56', '4', '订单(编号:2015050019)下的产品: 123删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814dc432aa014dc4952a02000a', '402882be46404313014640b7eb1c000f', '1', '2015-06-06 00:36:59', '3', '订单(编号:2015050019)下的产品: 123插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814dc432aa014dc49a90b5000b', '402882be46404313014640b7eb1c000f', '1', '2015-06-06 00:42:53', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814dc432aa014dc4cc27330010', '402882be46404313014640b7eb1c000f', '1', '2015-06-06 01:37:03', '5', '产品: 店铺更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814dc6a646014dc6a76be90001', '402882be46404313014640b7eb1c000f', '1', '2015-06-06 10:16:10', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814dc6a646014dc6ee7f4a0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-06 11:33:48', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814dc6a646014dc795b4820003', '402882be46404313014640b7eb1c000f', '1', '2015-06-06 14:36:26', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814dc6a646014dc79c9c710004', '402882be46404313014640b7eb1c000f', '1', '2015-06-06 14:43:59', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814dc6a646014dc7c733c00005', '402882be46404313014640b7eb1c000f', '1', '2015-06-06 15:30:30', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814dc6a646014dc7de7cdf0006', '402882be46404313014640b7eb1c000f', '1', '2015-06-06 15:55:56', '4', '订单(：4028d9814da83d4b014da892af830008,4028d9814d955a9a014d95bfaffa003c,4028d9814d955a9a014d959b67f30016,4028d9814d955a9a014d9563626f0009)删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814dc6a646014dc7deaeeb0007', '402882be46404313014640b7eb1c000f', '1', '2015-06-06 15:56:09', '4', '产品类型ID：4028d9814d955a9a014d956064420002删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814dc9720c014dc97402d60001', '402882be46404313014640b7eb1c000f', '1', '2015-06-06 23:18:52', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814dc9720c014dc9747d6b0003', '402882be46404313014640b7eb1c000f', '1', '2015-06-06 23:19:24', '3', '订单ID: null插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814dc9720c014dc974b64f0005', '402882be46404313014640b7eb1c000f', '1', '2015-06-06 23:19:38', '3', '订单(编号:2015060001)下的产品: 123插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814dc9720c014dc974db520006', '402882be46404313014640b7eb1c000f', '1', '2015-06-06 23:19:48', '5', '订单ID: 4028d9814dc9720c014dc9747c430002更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814dc9720c014dc975aa94000a', '402882be46404313014640b7eb1c000f', '1', '2015-06-06 23:20:41', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64de145d5014de1468f7f0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-11 14:20:07', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64de145d5014de14829c20003', '402882be46404313014640b7eb1c000f', '1', '2015-06-11 14:21:52', '3', '菜单: 库存信息管理插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64de145d5014de148a2df007a', '402882be46404313014640b7eb1c000f', '1', '2015-06-11 14:22:23', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64de14964014de14a45da0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-11 14:24:10', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64de14c13014de14c4f5f0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-11 14:26:24', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64de14c13014de15834dc0003', '402882be46404313014640b7eb1c000f', '1', '2015-06-11 14:39:23', '3', '权限: 新增插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64de14c13014de158bb7a0005', '402882be46404313014640b7eb1c000f', '1', '2015-06-11 14:39:58', '3', '权限: 编辑插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64de14c13014de159187e0007', '402882be46404313014640b7eb1c000f', '1', '2015-06-11 14:40:22', '3', '权限: 删除插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64de14c13014de15993520081', '402882be46404313014640b7eb1c000f', '1', '2015-06-11 14:40:53', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64de15cc1014de15d022f0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-11 14:44:38', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64de15cc1014de15d2b160002', '402882be46404313014640b7eb1c000f', '1', '2015-06-11 14:44:49', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64de15cc1014de1707a3b0003', '402882be46404313014640b7eb1c000f', '1', '2015-06-11 15:05:54', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64de17ff7014de18045ff0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-11 15:23:09', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64de17ff7014de1807d9c0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-11 15:23:23', '4', '货号: null删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64de17ff7014de180a4340003', '402882be46404313014640b7eb1c000f', '1', '2015-06-11 15:23:33', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64de17ff7014de181577c0006', '402882be46404313014640b7eb1c000f', '1', '2015-06-11 15:24:19', '5', '产品: 123更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64de6f667014de6f72e950001', '402882be46404313014640b7eb1c000f', '1', '2015-06-12 16:51:08', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64de6f667014de6f867940004', '402882be46404313014640b7eb1c000f', '1', '2015-06-12 16:52:28', '5', '产品: 123更新成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64de6f667014de6f9596d0007', '402882be46404313014640b7eb1c000f', '1', '2015-06-12 16:53:30', '5', '产品: 123更新成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64de6f667014de6f99f1c000a', '402882be46404313014640b7eb1c000f', '1', '2015-06-12 16:53:48', '5', '产品: 123更新成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64de6f667014de6fce1c1000b', '402882be46404313014640b7eb1c000f', '1', '2015-06-12 16:57:22', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814de814e5014de82cbe6e0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-12 22:29:15', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814de814e5014de836519e0004', '402882be46404313014640b7eb1c000f', '1', '2015-06-12 22:39:43', '5', '产品: 123更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814de814e5014de8367cfd0007', '402882be46404313014640b7eb1c000f', '1', '2015-06-12 22:39:54', '5', '产品: 123更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814de814e5014de836a898000a', '402882be46404313014640b7eb1c000f', '1', '2015-06-12 22:40:05', '5', '产品: 123更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814de814e5014de836c9ae000d', '402882be46404313014640b7eb1c000f', '1', '2015-06-12 22:40:14', '5', '产品: 123更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64dfb06a3014dfb0722280001', '402882be46404313014640b7eb1c000f', '1', '2015-06-16 14:20:58', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814dfc1859014dfc1984de0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-16 19:20:40', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814dfc1859014dfc3cf6fc0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-16 19:59:23', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64dff068f014dff141c4f0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 09:13:37', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64dff068f014dff2574470002', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 09:32:34', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64dff068f014dff43a51b0003', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 10:05:32', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64dff88ff014dff8b21c30001', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 11:23:37', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64dff8ff9014dff906b9e0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 11:29:24', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64dff8ff9014dff919d820002', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 11:30:42', '3', '货号: null插入成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64dfffe06014dfffec1610001', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 13:29:55', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e000a0b014e000a6c930001', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 13:42:39', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0030c4014e003114f30001', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 14:24:53', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0030c4014e0033ad970004', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 14:27:43', '3', '货号: 111插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e00373f014e0037e5650001', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 14:32:20', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e00373f014e0039f21f0005', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 14:34:34', '3', '产品： 111插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e00373f014e003f4f240008', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 14:40:25', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e00629d014e0062ed270001', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 15:19:20', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e00b0a6014e00b0ecc30001', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 16:44:31', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e01b8fc014e01bb949e0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 21:35:47', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e01ec8e014e01ed6bea0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 22:30:13', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e01f21f014e01f397270001', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 22:36:58', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e01f21f014e01f6dff00002', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 22:40:33', '5', '货号: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e01f21f014e01f865dd0003', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 22:42:13', '5', '货号: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e01f21f014e01f98f580004', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 22:43:29', '5', '货号: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e01f21f014e01fa88cb0005', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 22:44:33', '5', '货号: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e01f21f014e01fbcc720006', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 22:45:55', '5', '货号: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e01f21f014e01fcfe620007', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 22:47:14', '5', '货号: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e01f21f014e01fd39200008', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 22:47:29', '5', '货号: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e021f56014e022037310001', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 23:25:42', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e022788014e02289a740001', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 23:34:52', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e022788014e0229b1cf0004', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 23:36:03', '5', '货号: 111更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e022788014e022ad5810007', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 23:37:18', '5', '货号: 111更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e022788014e022c0186000a', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 23:38:35', '5', '货号: 111更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e023d4a014e023e2cfa0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 23:58:26', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e023d4a014e023e83d60004', '402882be46404313014640b7eb1c000f', '1', '2015-06-17 23:58:48', '5', '货号: 111更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e02410b014e0242262f0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 00:02:46', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e02410b014e02426ad10002', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 00:03:04', '5', '货号: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e02504b014e02515a560001', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 00:19:22', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e02816d014e0282549e0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 01:12:52', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e02816d014e0282e9d60002', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 01:13:30', '4', '货号: null,null删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e02816d014e028423240003', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 01:14:51', '4', '货号: null删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0510be014e051164970001', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 13:08:22', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0510be014e0511a64c0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 13:08:39', '4', '货号: 111删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e052c8d014e052d09080001', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 13:38:34', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0541b7014e0542ccb20001', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 14:02:20', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e059c25014e059c73ae0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 15:40:16', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e059c25014e059d01b80002', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 15:40:52', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e059c25014e059d47bb0003', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 15:41:10', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e059c25014e059da3870004', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 15:41:33', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e059c25014e05a1f3930005', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 15:46:16', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e059c25014e05a219e10006', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 15:46:26', '5', '货号: null更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e05ab44014e05aba5fc0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 15:56:52', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e05ade8014e05ae32fb0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 15:59:39', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e05d0d5014e05d11bdd0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 16:37:47', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e05d0d5014e05da263e0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 16:47:39', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e05d0d5014e05da63dc0003', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 16:47:55', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e05d0d5014e05daa0ae0004', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 16:48:10', '3', '货号: 12345插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e05d0d5014e05daf9020005', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 16:48:33', '3', '货号: 2345插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e05d0d5014e05dc0aa60006', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 16:49:43', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e05d0d5014e05dc42c70007', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 16:49:57', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e05d0d5014e05dc78c80008', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 16:50:11', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e05e009014e05e059bf0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 16:54:25', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e05e2e2014e05e33ad20001', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 16:57:34', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e05e634014e05e67ca00001', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 17:01:08', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e05e989014e05e9d5cf0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 17:04:47', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e06d9d7014e06dbd81d0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 21:29:07', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e06d9d7014e06f451190002', '402882be46404313014640b7eb1c000f', '1', '2015-06-18 21:55:51', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e0777c4014e0778ac9d0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 00:20:25', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e0779ad014e077a9aac0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 00:22:32', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e077c8e014e077de9630001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 00:26:09', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e0782e0014e0785d5a70001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 00:34:48', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e0786e8014e078896c20001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 00:37:48', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e0786e8014e078960360002', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 00:38:40', '5', '货号: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e0786e8014e078f0a910003', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 00:44:51', '3', '货号: null插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e0786e8014e079063840004', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 00:46:20', '3', '货号: null插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e0786e8014e07a9d2200005', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 01:14:06', '5', '货号: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e093fd2014e094086a80001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 08:38:20', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64e093fd2014e0942603c0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 08:40:21', '5', '货号: null更新成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64e093fd2014e094437070003', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 08:42:22', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64e093fd2014e094603490004', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 08:44:20', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e093fd2014e094a370c0005', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 08:48:55', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64e0962aa014e0963f3700001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 09:17:02', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64e0962aa014e096539ec0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 09:18:25', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e09c689014e09c717420001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 11:05:19', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e09c689014e09c8c82b0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 11:07:10', '5', '菜单: 产品分类管理更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e09c689014e09c9cd450004', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 11:08:17', '3', '菜单: 仓库信息管理插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e09c689014e09cacd4c0006', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 11:09:22', '3', '权限: 仓库新增插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e09c689014e09cb96380008', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 11:10:14', '3', '权限: 仓库修改插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e09c689014e09cc6d09000a', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 11:11:09', '3', '权限: 仓库删除插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e09c689014e09ccbab5000c', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 11:11:28', '3', '权限: 仓库禁用插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e09c689014e09ccf0d5000e', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 11:11:42', '3', '权限: 仓库启用插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e09c689014e09cd38df0010', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 11:12:01', '3', '权限: 取消操作插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e09d17d014e09d24c730001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 11:17:33', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e09d17d014e09d69a0b0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 11:22:15', '3', '仓库: 本地仓库插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e09e52c014e09e6fede0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 11:40:10', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e09f5bb014e09f608f30001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 11:56:35', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e09f5bb014e09f72d370002', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 11:57:50', '3', '仓库: 海盐仓库插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a0bbd014e0a0c202f0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 12:20:43', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a0bbd014e0a0ca1470002', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 12:21:16', '3', '仓库: 海宁仓库插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a0bbd014e0a0dc1080003', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 12:22:30', '5', '仓库: 海宁仓库更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a0efe014e0a1014c00001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 12:25:02', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a137f014e0a13dd840001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 12:29:10', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a137f014e0a1645350002', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 12:31:48', '4', '仓库: 123删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a137f014e0a1744be0003', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 12:32:53', '5', '权限: 仓库删除更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a178f014e0a17ed2b0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 12:33:37', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a178f014e0a184f550002', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 12:34:02', '4', '仓库: 海盐仓库删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a178f014e0a1e4b340003', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 12:40:34', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64e0a178f014e0a1e8c110004', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 12:40:50', '3', '仓库: haining插入成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64e0a178f014e0a1efcd00005', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 12:41:19', '5', '权限: 仓库删除更新成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64e0a178f014e0a1f1dbf0006', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 12:41:28', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64e0a178f014e0a1f33780007', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 12:41:33', '4', '仓库: haining删除成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64e0a1fc2014e0a2024e10001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 12:42:35', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64e0a1fc2014e0a204c4a0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 12:42:45', '3', '仓库: hain插入成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64e0a22cb014e0a2e7dfb0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 12:58:15', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a22cb014e0a2fcdaf0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 12:59:41', '4', '仓库: 123删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a22cb014e0a3394f30003', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 13:03:49', '5', '仓库: 本地仓库更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a22cb014e0a3485600004', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 13:04:51', '3', '仓库: hai插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a22cb014e0a34c45e0005', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 13:05:07', '4', '仓库: 123删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a22cb014e0a364f410006', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 13:06:48', '3', '仓库: hain插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a22cb014e0a39c1e60007', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 13:10:34', '4', '仓库: 123删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a3e6e014e0a3ed0630001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 13:16:05', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a3e6e014e0a3f2c7b0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 13:16:29', '3', '仓库: hai插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a4118014e0a4176820001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 13:18:59', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a42cc014e0a4309f10001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 13:20:42', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a453f014e0a459bc60001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 13:23:30', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a4abd014e0a4b7c800001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 13:29:56', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64e0a5685014e0a5b4a960001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 13:47:11', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e0a65ae014e0a662acf0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-19 13:59:04', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e0ca375014e0ca4738d0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-20 00:26:20', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e0ca375014e0ca4cecc0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-20 00:26:44', '5', '仓库: hai禁用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e0ca375014e0ca4e30f0003', '402882be46404313014640b7eb1c000f', '1', '2015-06-20 00:26:49', '5', '仓库: hai启用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e0ca375014e0cacdb6b0004', '402882be46404313014640b7eb1c000f', '1', '2015-06-20 00:35:31', '5', '货号: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e0ca375014e0caf7c070005', '402882be46404313014640b7eb1c000f', '1', '2015-06-20 00:38:24', '5', '货号: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e0ca375014e0cb07b2d0006', '402882be46404313014640b7eb1c000f', '1', '2015-06-20 00:39:29', '5', '货号: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e0ca375014e0cb0a6010007', '402882be46404313014640b7eb1c000f', '1', '2015-06-20 00:39:40', '5', '货号: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e140f76014e141145e10001', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 11:02:33', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e140f76014e145d67ef0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 12:25:42', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e14f262014e14f353e00001', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 15:09:27', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e14f262014e14f4da060002', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 15:11:07', '5', '仓库: hai更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e14f262014e14f547f40003', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 15:11:35', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e1523f6014e1524f0600001', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 16:03:39', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e152b65014e15318f740001', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 16:17:26', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e153574014e1536a0e80001', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 16:22:58', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e153c6c014e153ddb940001', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 16:30:52', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e154700014e1547e00c0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 16:41:48', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e154700014e15ece5e40002', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 19:42:03', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e15f2c3014e15f3d4b40001', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 19:49:38', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e15f722014e15f82eda0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 19:54:23', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e15f722014e15fe49570002', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 20:01:03', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e15f722014e1603bbae0003', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 20:07:00', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e15f722014e1609054c0004', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 20:12:46', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e15f722014e160d86f50005', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 20:17:42', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e161245014e1613859c0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 20:24:14', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e161245014e1615522a0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 20:26:12', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e161611014e16174ada0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 20:28:22', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e161611014e1619c8d00002', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 20:31:05', '5', '仓库: hai更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e161611014e162d20770003', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 20:52:13', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814e161611014e163f145a0004', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 21:11:49', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814e161611014e164426ba0005', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 21:17:21', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814e161611014e164ab5b90006', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 21:24:31', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814e161611014e164d41700007', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 21:27:18', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814e161611014e165104880008', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 21:31:25', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814e161611014e165446840009', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 21:34:58', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814e161611014e165d5562000a', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 21:44:52', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e166f27014e167068bc0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 22:05:42', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814e166f27014e1671a57e0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 22:07:03', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e166f27014e167212320003', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 22:07:31', '5', '仓库: hai禁用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e166f27014e167311c80004', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 22:08:36', '5', '仓库: hai启用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e167522014e167669460001', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 22:12:15', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e167522014e1676ee530002', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 22:12:49', '5', '仓库: hai禁用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e167522014e1679d5830003', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 22:16:00', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e167d1f014e167e381e0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 22:20:47', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e167d1f014e16842b450002', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 22:27:17', '4', '货号: null删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e16c053014e16c33a6c0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 23:36:10', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e16c8d8014e16c9d7670001', '402882be46404313014640b7eb1c000f', '1', '2015-06-21 23:43:23', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e16c8d8014e16d9bfec0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 00:00:46', '5', '货号: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e16dc01014e16e297150001', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 00:10:25', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e16dc01014e16e735430002', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 00:15:28', '5', '货号: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e16dc01014e16f53ef50003', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 00:30:48', '5', '客户: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e16dc01014e1702d41e0004', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 00:45:38', '5', '客户: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e196701014e196915fa0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 11:56:34', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e196701014e196a200a0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 11:57:42', '5', '客户: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e196701014e1978fc5a0003', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 12:13:56', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e196701014e198882d40004', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 12:30:53', '5', '订单ID: 4028d9814dc9720c014dc975aa430007更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e196701014e1988f26e0005', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 12:31:22', '5', '订单ID: 4028d9814dc9720c014dc975aa430007更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e196701014e198c3a640006', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 12:34:57', '5', '订单(编号:2015060002)下的产品: 123更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e196701014e198ccaba0007', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 12:35:34', '5', '订单(编号:2015060002)下的产品: 123更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e196701014e1a4f68020008', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 16:08:08', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e196701014e1a5024ad000a', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 16:08:56', '3', '客户： 淘宝店铺1插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e196701014e1a504b64000b', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 16:09:06', '5', '客户: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e196701014e1a508be0000c', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 16:09:23', '5', '客户ID：4028d9814d955a9a014d95bf5e43003a禁用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e196701014e1a50a466000d', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 16:09:29', '5', '客户ID：4028d9814d955a9a014d95bf5e43003a启用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e1a72fe014e1a7417ba0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 16:48:12', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e1a72fe014e1a7925730002', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 16:53:43', '5', '客户: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e1ad416014e1ad518cf0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 18:34:09', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e1ad416014e1ad5793f0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 18:34:34', '4', '货号: null,null,null,null,null,null,12345,2345,null,null删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e1ad416014e1ad58e630003', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 18:34:40', '4', '货号: null,null删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e1af1ee014e1af2e2f10001', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 19:06:42', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e1b91f8014e1b9426bb0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-22 22:02:50', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e208390014e20891bad0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-23 21:08:53', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e208390014e2097e5c30002', '402882be46404313014640b7eb1c000f', '1', '2015-06-23 21:25:02', '5', '客户ID：4028d9814d955a9a014d956223aa0007禁用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e208390014e2097e5d00003', '402882be46404313014640b7eb1c000f', '1', '2015-06-23 21:25:02', '5', '客户ID：4028d9814d955a9a014d95bf5e43003a禁用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e208390014e2097f37c0004', '402882be46404313014640b7eb1c000f', '1', '2015-06-23 21:25:06', '5', '客户ID：4028d9814d955a9a014d956223aa0007启用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e208390014e2097f3880005', '402882be46404313014640b7eb1c000f', '1', '2015-06-23 21:25:06', '5', '客户ID：4028d9814d955a9a014d95bf5e43003a启用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e208390014e209fc2200006', '402882be46404313014640b7eb1c000f', '1', '2015-06-23 21:33:37', '3', '货号: 1234567891234567插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e208390014e20a035ed0007', '402882be46404313014640b7eb1c000f', '1', '2015-06-23 21:34:07', '5', '货号: 1234567891234567更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e208390014e20a09aef0008', '402882be46404313014640b7eb1c000f', '1', '2015-06-23 21:34:33', '5', '货号: 1234567891234567更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e208390014e20a0feff0009', '402882be46404313014640b7eb1c000f', '1', '2015-06-23 21:34:58', '5', '货号: 1234567891234567中山大街网更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e208390014e20a177d7000a', '402882be46404313014640b7eb1c000f', '1', '2015-06-23 21:35:29', '5', '客户: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e208390014e20a41400000b', '402882be46404313014640b7eb1c000f', '1', '2015-06-23 21:38:20', '5', '货号: 1234567891234567中山大街网更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e208390014e20b62470000c', '402882be46404313014640b7eb1c000f', '1', '2015-06-23 21:58:04', '5', '客户: null更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e208390014e20b7cf40000e', '402882be46404313014640b7eb1c000f', '1', '2015-06-23 21:59:53', '3', '生产厂家： 小明插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e208390014e20d86a04000f', '402882be46404313014640b7eb1c000f', '1', '2015-06-23 22:35:30', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e331912014e333e6a3c0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 12:20:05', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e331912014e333f0aec0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 12:20:46', '5', '仓库: 本地仓库更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e331912014e333f29f40003', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 12:20:54', '5', '仓库: hai禁用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e331912014e333f44ba0004', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 12:21:01', '5', '仓库: hai禁用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e331912014e333f7af20005', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 12:21:15', '5', '仓库: hai禁用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e331912014e333f93640006', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 12:21:21', '5', '仓库: hai启用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e331912014e333fd2b90007', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 12:21:37', '5', '仓库: hai禁用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e331912014e333fe0910008', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 12:21:41', '5', '仓库: hai启用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e331912014e334018dc0009', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 12:21:55', '5', '仓库: hai禁用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e331912014e33405739000a', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 12:22:11', '4', '货号: 1234567891234567中山大街网删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e331912014e3340c0e4000b', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 12:22:38', '4', '生产厂家ID：4028d9814e208390014e20b7cf3b000d及相关信息删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e331912014e3340e82c000c', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 12:22:48', '4', '产品类型ID：4028d9814da83d4b014da871540b0003删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e346bd1014e346de0dc0001', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 17:51:33', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e346bd1014e346eec200002', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 17:52:41', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e346bd1014e34f9c2720003', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 20:24:20', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e346bd1014e34fa28710005', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 20:24:46', '3', '客户： 小明插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e346bd1014e34fa78d30007', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 20:25:07', '3', '订单ID: null插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e346bd1014e34fb5723000d', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 20:26:03', '3', '订单ID: 4028d9814e346bd1014e34fa78220006下的产品产品2及其订单信息插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e346bd1014e34fbddd7000e', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 20:26:38', '5', '订单ID: 4028d9814e346bd1014e34fa78220006更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e346bd1014e352a0ac30010', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 21:17:04', '3', '生产厂家： 22插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e3543b5014e3545a6f20001', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 21:47:13', '1', '用户：super登录成功', '192.168.89.1', 'Safari');
INSERT INTO `sys_log` VALUES ('4028d9814e3543b5014e3548cf740002', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 21:50:41', '3', '货号: null插入成功', '192.168.89.1', 'Safari');
INSERT INTO `sys_log` VALUES ('4028d9814e3543b5014e354b1a6a0004', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 21:53:11', '3', '订单ID: null插入成功', '192.168.89.1', 'Safari');
INSERT INTO `sys_log` VALUES ('4028d9814e3543b5014e354f96930005', '402882be46404313014640b7eb1c000f', '1', '2015-06-27 21:58:05', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e38bb60014e38bc76a70001', '402882be46404313014640b7eb1c000f', '1', '2015-06-28 13:55:52', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e38bb60014e38c6b7bf0002', '402882be46404313014640b7eb1c000f', '1', '2015-06-28 14:07:04', '3', '货号: 1101插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e5e00dc014e5e1158470001', '402882be46404313014640b7eb1c000f', '1', '2015-07-05 19:54:31', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64e855816014e855981850001', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 10:58:32', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e855816014e855a8fc80002', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 10:59:41', '5', '货号: null更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e855816014e855b18dc0003', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 11:00:16', '5', '货号: 1101更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e855816014e85646c7c0004', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 11:10:27', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e855816014e8564bf670005', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 11:10:49', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e855816014e85652b380006', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 11:11:16', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e855816014e856584c10007', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 11:11:39', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e855816014e85661aeb0008', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 11:12:18', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e855816014e8566411e0009', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 11:12:27', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e855816014e85665f2a000a', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 11:12:35', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e855816014e8566823f000b', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 11:12:44', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e855816014e8566a936000c', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 11:12:54', '3', '货号: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e855816014e85819cd7000d', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 11:42:20', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e855816014e858510d9000e', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 11:46:07', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e855816014e858f67fc000f', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 11:57:24', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e855816014e859398e30012', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 12:01:59', '5', '产品: 产品2更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e855816014e859401d70015', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 12:02:26', '5', '产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e85dfef014e85e089e60001', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 13:26:01', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e85dfef014e85e13d6b0003', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 13:26:47', '3', '产品： 222插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e85e607014e85e6d5a10001', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 13:32:54', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e85f371014e85f3e4eb0001', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 13:47:10', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e85f96b014e85f9f70c0001', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 13:53:48', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e85f96b014e85faeac60002', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 13:54:50', '8', '图片备份成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e85f96b014e85fb10090003', '402882be46404313014640b7eb1c000f', '1', '2015-07-13 13:55:00', '8', '数据库备份成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e94848e014e9485a2920001', '402882be46404313014640b7eb1c000f', '1', '2015-07-16 09:41:02', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e94848e014e9488c58c0002', '402882be46404313014640b7eb1c000f', '1', '2015-07-16 09:44:28', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e94848e014e948b830d0003', '402882be46404313014640b7eb1c000f', '1', '2015-07-16 09:47:27', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e94848e014e94a1e59f0004', '402882be46404313014640b7eb1c000f', '1', '2015-07-16 10:11:54', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64e94848e014e94a2451b0005', '402882be46404313014640b7eb1c000f', '1', '2015-07-16 10:12:19', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e99780c014e9979145b0001', '402882be46404313014640b7eb1c000f', '1', '2015-07-17 08:45:25', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814e99780c014e998c11910002', '402882be46404313014640b7eb1c000f', '1', '2015-07-17 09:06:10', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e99780c014e99b806040003', '402882be46404313014640b7eb1c000f', '1', '2015-07-17 09:54:11', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e99780c014e99c6d5be0004', '402882be46404313014640b7eb1c000f', '1', '2015-07-17 10:10:21', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e99780c014e99c9c8490005', '402882be46404313014640b7eb1c000f', '1', '2015-07-17 10:13:34', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e99cd9f014e99cefa440001', '402882be46404313014640b7eb1c000f', '1', '2015-07-17 10:19:15', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e99cd9f014e99f6366d0002', '402882be46404313014640b7eb1c000f', '1', '2015-07-17 11:02:06', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e99cd9f014e99faccfc0003', '402882be46404313014640b7eb1c000f', '1', '2015-07-17 11:07:07', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e99cd9f014e99fb66280004', '402882be46404313014640b7eb1c000f', '1', '2015-07-17 11:07:46', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e99cd9f014e9a131c690005', '402882be46404313014640b7eb1c000f', '1', '2015-07-17 11:33:40', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814e99cd9f014e9a1657920006', '402882be46404313014640b7eb1c000f', '1', '2015-07-17 11:37:12', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814e99cd9f014e9a285dfb0007', '402882be46404313014640b7eb1c000f', '1', '2015-07-17 11:56:53', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd1718014ecd208f6d0001', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 09:28:59', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd1718014ecd21e1760002', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 09:30:26', '4', '产品类型ID：4028d9814e346bd1014e34fb55a10008删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd1718014ecd2222fd0003', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 09:30:43', '4', '产品类型ID：402887e64e85dfef014e85e13cfa0002删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd226a014ecd239d620001', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 09:32:20', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd226a014ecd23cc130003', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 09:32:32', '3', '产品： 23321插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd2ad8014ecd330ff70001', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 09:49:12', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd2ad8014ecd4db3fd0002', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 10:18:18', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd2ad8014ecd503c560003', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 10:21:04', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd2ad8014ecd5ced8a0004', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 10:34:56', '5', '货号: null更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd2ad8014ecd5d2a4a0005', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 10:35:11', '5', '货号: 1101更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd2ad8014ecd5d6f7e0006', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 10:35:29', '5', '货号: null更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd2ad8014ecd5dad130007', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 10:35:45', '5', '货号: null更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd2ad8014ecd7032d40008', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 10:55:59', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd2ad8014ecd731a790009', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 10:59:09', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd2ad8014ecd93dce2000a', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 11:34:56', '5', '订单(编号:2015060003)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd2ad8014ecd940ae4000b', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 11:35:08', '5', '订单(编号:2015060003)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd2ad8014ecd962921000c', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 11:37:27', '5', '订单(编号:2015060003)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd2ad8014ecd99d162000d', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 11:41:26', '5', '订单(编号:2015060003)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd2ad8014ecd9b5d1e000e', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 11:43:08', '5', '订单(编号:2015060003)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd2ad8014ecd9c1f7a000f', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 11:43:57', '5', '订单(编号:2015060003)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd2ad8014ecdcf0c1d0010', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 12:39:35', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd2ad8014ecdcfc98c0011', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 12:40:23', '5', '订单(编号:2015060003)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecd2ad8014ecdd027880012', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 12:40:47', '5', '订单(编号:2015060003)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecde11f3d0001', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 12:59:19', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecde270250003', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:00:45', '3', '订单(编号:2015060004)下的产品: 111插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecde3a4420005', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:02:04', '3', '订单(编号:2015060004)下的产品: 23321插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecde48b860006', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:03:04', '4', '订单(编号:2015060004)下的产品: 111删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecde4ed040007', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:03:29', '4', '订单(编号:2015060004)下的产品: 23321删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecde525810009', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:03:43', '3', '订单(编号:2015060004)下的产品: 111插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecde7e9bc000b', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:06:44', '3', '订单(编号:2015060004)下的产品: 23321插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecde81aa1000c', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:06:57', '4', '订单(编号:2015060004)下的产品: 111删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecde850dd000d', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:07:11', '4', '订单(编号:2015060004)下的产品: 23321删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecde8797a000f', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:07:21', '3', '订单(编号:2015060004)下的产品: 111插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecde989450011', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:08:31', '3', '订单(编号:2015060004)下的产品: 23321插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecdeb10ee0013', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:10:11', '3', '订单(编号:2015060004)下的产品: 111插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecdec0a170015', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:11:15', '3', '订单(编号:2015060004)下的产品: 23321插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecdee6b1d0016', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:13:51', '4', '订单(编号:2015060004)下的产品: 111删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecdef26950017', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:14:39', '4', '订单(编号:2015060004)下的产品: 111删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecdef438e0018', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:14:46', '5', '订单(编号:2015060004)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecdef6b0e0019', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:14:56', '5', '订单(编号:2015060004)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecdf0561e001b', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:15:56', '3', '订单(编号:2015060004)下的产品: 111插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecdf0775a001c', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:16:05', '4', '订单(编号:2015060004)下的产品: 23321删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecdf081b9001d', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:16:07', '4', '订单(编号:2015060004)下的产品: 111删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecdf089ec001e', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:16:10', '4', '订单(编号:2015060004)下的产品: 23321删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecdf0a9870020', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:16:18', '3', '订单(编号:2015060004)下的产品: 111插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecdf0b9700021', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:16:22', '4', '订单(编号:2015060004)下的产品: 111删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecdf274bd0022', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:18:15', '5', '订单(编号:2015060003)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecdf2e4970023', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:18:44', '5', '订单(编号:2015060003)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ecdf4b0650024', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:20:42', '5', '订单ID: 4028d9814e346bd1014e34fa78220006更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ece0625660025', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:39:46', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ece0849a80026', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:42:06', '5', '订单(编号:2015060003)下的产品: 23321更新成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ecddfd2014ece0b77c60027', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 13:45:34', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ece2152014ece228c050001', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 14:10:47', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ece2152014ece22f0770002', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 14:11:13', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ece50db014ece51d7610001', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 15:02:26', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ece50db014ece54492d0002', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 15:05:07', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ece50db014ece5cc2fb0003', '402882be46404313014640b7eb1c000f', '1', '2015-07-27 15:14:22', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ed792f5014ed797a0f80001', '402882be46404313014640b7eb1c000f', '1', '2015-07-29 10:15:15', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ed8c74f014ed8c916f90001', '402882be46404313014640b7eb1c000f', '1', '2015-07-29 15:48:54', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ed8c74f014ed8ef4a120003', '402882be46404313014640b7eb1c000f', '1', '2015-07-29 16:30:37', '3', '订单(编号:2015060004)下的产品: 111插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ed8c74f014ed8ef7fea0005', '402882be46404313014640b7eb1c000f', '1', '2015-07-29 16:30:51', '3', '订单(编号:2015060004)下的产品: 23321插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ed8c74f014ed8eff2de0006', '402882be46404313014640b7eb1c000f', '1', '2015-07-29 16:31:20', '5', '订单(编号:2015060004)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ed8c74f014ed8f39a5b0007', '402882be46404313014640b7eb1c000f', '1', '2015-07-29 16:35:20', '5', '订单(编号:2015060004)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ed90456014ed905858e0001', '402882be46404313014640b7eb1c000f', '1', '2015-07-29 16:54:54', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64edc7d74014edc7e71320001', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 09:05:50', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64edc8cf5014edc8e029a0001', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 09:22:51', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64edcab2c014edcafcd580001', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 09:59:45', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64edcab2c014edcb392060003', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 10:03:52', '3', '客户： 小红插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64edcab2c014edcb3a3e30004', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 10:03:57', '5', '客户ID：402887e64edcab2c014edcb3913b0002禁用成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64edcab2c014edcb407ad0005', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 10:04:22', '5', '货号: null更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64edcab2c014edcb42fbc0006', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 10:04:33', '5', '货号: null更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64edcab2c014edcb4718a0007', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 10:04:49', '5', '货号: null更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64edcab2c014edcb4a4590008', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 10:05:02', '5', '货号: null更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64edcab2c014edcb4d5390009', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 10:05:15', '5', '货号: null更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64edcab2c014edcb5029b000a', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 10:05:27', '5', '货号: null更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64edcab2c014edcb52474000b', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 10:05:35', '5', '货号: null更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64edcab2c014edcb9fc16000c', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 10:10:53', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64edcab2c014edcbdf557000d', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 10:15:13', '5', '订单ID: 4028d9814e3543b5014e354b1a3e0003更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64edcab2c014edcfb2720000e', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 11:22:03', '5', '订单ids: 4028d9814e346bd1014e34fa78220006修改送货单打印状态成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64edcab2c014edd1fc52e000f', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 12:02:03', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64edd4701014edda1c6a10001', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:24:03', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddb3ed380001', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:43:53', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddb56e380002', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:45:31', '5', '订单(订单号:4028d9814e346bd1014e34fa78220006)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddb584200003', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:45:37', '5', '订单(订单号:4028d9814e346bd1014e34fa78220006)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddb5bae80004', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:45:51', '5', '订单(订单号:4028d9814e346bd1014e34fa78220006)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddb5c5190005', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:45:54', '5', '订单(订单号:4028d9814e346bd1014e34fa78220006)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddb5c8fe0006', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:45:55', '5', '订单(订单号:4028d9814e346bd1014e34fa78220006)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddb5d95b0007', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:45:59', '5', '订单(订单号:4028d9814e346bd1014e34fa78220006)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddb5e4f30008', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:46:02', '5', '订单(订单号:4028d9814e346bd1014e34fa78220006)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddb5e8620009', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:46:03', '5', '订单(订单号:4028d9814e346bd1014e34fa78220006)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddb5ec76000a', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:46:04', '5', '订单(订单号:4028d9814e346bd1014e34fa78220006)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddb5f0d7000b', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:46:05', '5', '订单(订单号:4028d9814e346bd1014e34fa78220006)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddb5f662000c', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:46:06', '5', '订单(订单号:4028d9814e346bd1014e34fa78220006)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddb5faab000d', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:46:07', '5', '订单(订单号:4028d9814e346bd1014e34fa78220006)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddb93cb5000e', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:49:41', '5', '订单(订单号:4028d9814e346bd1014e34fa78220006)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddb9531e000f', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:49:47', '5', '订单(订单号:4028d9814e346bd1014e34fa78220006)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddb9976f0010', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:50:04', '5', '订单(订单号:4028d9814e346bd1014e34fa78220006)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddba396a0011', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:50:45', '5', '订单(订单号:4028d9814e3543b5014e354b1a3e0003)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddbc8e3e0012', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:53:18', '5', '订单(订单号:4028d9814e3543b5014e354b1a3e0003)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddbcaccf0013', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 14:53:26', '5', '订单(订单号:4028d9814e3543b5014e354b1a3e0003)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddc2e1520014', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 15:00:13', '5', '订单(订单号:4028d9814e346bd1014e34fa78220006)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddc464260015', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 15:01:52', '5', '订单(订单号:4028d9814e346bd1014e34fa78220006)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddc5b3070016', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 15:03:18', '5', '订单(订单号:4028d9814e346bd1014e34fa78220006)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddfc63a0001a', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 16:03:02', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddfc8837001e', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 16:03:11', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddfc9da50022', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 16:03:17', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddfcac650026', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 16:03:20', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddfcc018002a', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 16:03:25', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddfcd179002e', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 16:03:30', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddfce5a00032', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 16:03:35', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddfcf56c0036', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 16:03:39', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddfd0f44003a', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 16:03:46', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddfde8f9003e', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 16:04:41', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddfdfd790042', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 16:04:47', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddfe169f0046', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 16:04:53', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddfe2c50004a', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 16:04:59', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddfe3df5004e', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 16:05:03', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddfe59de0052', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 16:05:10', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddff58f10053', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 16:06:16', '4', '订单(：402887e64eddb376014eddfe59b0004f)删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddffa28c0054', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 16:06:34', '4', '订单(：402887e64eddb376014eddfe3dad004b)删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64eddb376014eddfff95f0055', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 16:06:57', '4', '订单(：402887e64eddb376014eddfe2c150047)删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814edf57f2014edf5946340001', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 22:24:06', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814edf57f2014edf5bafea0002', '402882be46404313014640b7eb1c000f', '1', '2015-07-30 22:26:44', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ee1bb8f014ee1bd28190001', '402882be46404313014640b7eb1c000f', '1', '2015-07-31 09:32:26', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ee1bb8f014ee1e2a80e0002', '402882be46404313014640b7eb1c000f', '1', '2015-07-31 10:13:24', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ee1bb8f014ee22167a70003', '402882be46404313014640b7eb1c000f', '1', '2015-07-31 11:21:56', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ee2280e014ee229df550001', '402882be46404313014640b7eb1c000f', '1', '2015-07-31 11:31:11', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ee23744014ee237866f0001', '402882be46404313014640b7eb1c000f', '1', '2015-07-31 11:46:06', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ee23fce014ee2401e740001', '402882be46404313014640b7eb1c000f', '1', '2015-07-31 11:55:29', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ee24221014ee2582a780001', '402882be46404313014640b7eb1c000f', '1', '2015-07-31 12:21:45', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ee25c50014ee25e26bc0001', '402882be46404313014640b7eb1c000f', '1', '2015-07-31 12:28:17', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ee2613e014ee261969d0001', '402882be46404313014640b7eb1c000f', '1', '2015-07-31 12:32:03', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ee2626d014ee262f07d0001', '402882be46404313014640b7eb1c000f', '1', '2015-07-31 12:33:31', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ee27789014ee277effd0001', '402882be46404313014640b7eb1c000f', '1', '2015-07-31 12:56:27', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ee27789014ee29ffb370002', '402882be46404313014640b7eb1c000f', '1', '2015-07-31 13:40:12', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ee27789014ee2cdeb810003', '402882be46404313014640b7eb1c000f', '1', '2015-07-31 14:30:22', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ee27789014ee2d136930004', '402882be46404313014640b7eb1c000f', '1', '2015-07-31 14:33:58', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef12b7d014ef12be7e00001', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 09:27:43', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef12b7d014ef13462d70002', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 09:36:59', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef12b7d014ef135a2620003', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 09:38:20', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef12b7d014ef13e71140004', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 09:47:58', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef12b7d014ef146c4f80005', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 09:57:03', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef12b7d014ef14d22780006', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 10:04:01', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef12b7d014ef15226ea0007', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 10:09:29', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef12b7d014ef15845860008', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 10:16:10', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef12b7d014ef15a80430009', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 10:18:36', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef12b7d014ef1b51f17000a', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 11:57:35', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef12b7d014ef1b78d31000b', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 12:00:15', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef12b7d014ef1db289e000c', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 12:39:08', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef12b7d014ef1df3ec3000d', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 12:43:36', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef12b7d014ef2125462000e', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 13:39:24', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef12b7d014ef217d39f000f', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 13:45:24', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef12b7d014ef21d52f90010', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 13:51:24', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef12b7d014ef2257c800011', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 14:00:19', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2360d014ef237738c0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 14:19:57', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef2360d014ef245f1b30002', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 14:35:46', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef2360d014ef24a75090003', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 14:40:42', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2774c014ef27900fa0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 15:31:33', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2774c014ef2793af90002', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 15:31:48', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2bc41cf0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 16:45:00', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2befdc00002', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 16:47:59', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2ca9c370003', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:00:41', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品12及其订单信息插入成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2cb24420004', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:01:16', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品12及其订单信息插入成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2cc4ff70005', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:02:32', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品12及其订单信息插入成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d209860006', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:08:48', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品11及其订单信息插入成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d35f610007', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:10:15', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品12212及其订单信息插入成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d401010008', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:10:57', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品123及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d46a180009', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:11:23', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品123及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d473ad000a', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:11:26', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品123及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d476ec000b', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:11:27', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品123及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d47a17000c', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:11:28', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品123及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d47df0000d', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:11:29', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品123及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d4892e000e', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:11:31', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品123及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d48cc4000f', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:11:32', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品123及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d48ffe0010', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:11:33', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品123及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d492b60011', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:11:34', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品123及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d495660012', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:11:35', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品123及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d4a8b10013', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:11:39', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品123及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d4ad150014', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:11:41', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品123及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d4b2550015', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:11:42', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品123及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d4b56c0016', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:11:43', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品123及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d4cdd60017', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:11:49', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品123及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d4d0f50018', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:11:50', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品123及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef2bb9e014ef2d502a40019', '402882be46404313014640b7eb1c000f', '1', '2015-08-03 17:12:02', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品123及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef744d0014ef746bbc00001', '402882be46404313014640b7eb1c000f', '1', '2015-08-04 13:54:44', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef749a4014ef74ab0fe0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-04 13:59:04', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef77709014ef777c59e0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-04 14:48:18', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef77709014ef783d77d0006', '402882be46404313014640b7eb1c000f', '1', '2015-08-04 15:01:29', '3', '订单ID: 402887e64eddb376014eddfe16660043下的产品12345及其订单信息插入成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef77709014ef7ac924d0007', '402882be46404313014640b7eb1c000f', '1', '2015-08-04 15:45:58', '4', '订单(：402887e64eddb376014eddfe16660043)删除成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef77709014ef7acc3f80008', '402882be46404313014640b7eb1c000f', '1', '2015-08-04 15:46:11', '4', '产品类型ID：402887e64ef77709014ef783d5120002删除成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef77709014ef7c67c4c0009', '402882be46404313014640b7eb1c000f', '1', '2015-08-04 16:14:17', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef77709014ef7cf22d8000d', '402882be46404313014640b7eb1c000f', '1', '2015-08-04 16:23:44', '3', '订单: null的返单及其返单产品信息添加成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef77709014ef7cf50f2000e', '402882be46404313014640b7eb1c000f', '1', '2015-08-04 16:23:55', '4', '订单(：402887e64ef77709014ef7cf2287000a)删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef77709014ef7e0c0620012', '402882be46404313014640b7eb1c000f', '1', '2015-08-04 16:42:58', '3', '订单ID: 402887e64eddb376014eddfdfd45003f下的产品12及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef77709014ef7e124680013', '402882be46404313014640b7eb1c000f', '1', '2015-08-04 16:43:24', '4', '订单(编号:2015070011)下的产品: 12删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef77709014ef7e198570014', '402882be46404313014640b7eb1c000f', '1', '2015-08-04 16:43:53', '4', '产品类型ID：402887e64ef77709014ef7e0c036000f删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64ef77709014ef7e710d00015', '402882be46404313014640b7eb1c000f', '1', '2015-08-04 16:49:52', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64ef80c3a014ef80cc7cc0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-04 17:31:03', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64efb59cd014efb5a64170001', '402882be46404313014640b7eb1c000f', '1', '2015-08-05 08:54:41', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64efb59cd014efba469180002', '402882be46404313014640b7eb1c000f', '1', '2015-08-05 10:15:32', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64efc52bf014efc53616d0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-05 13:26:39', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64efc52bf014efc58cce30002', '402882be46404313014640b7eb1c000f', '1', '2015-08-05 13:32:34', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64efc753e014efc75d0150001', '402882be46404313014640b7eb1c000f', '1', '2015-08-05 14:04:16', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64efc753e014efc76b1000002', '402882be46404313014640b7eb1c000f', '1', '2015-08-05 14:05:13', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64efc753e014efc8682e20003', '402882be46404313014640b7eb1c000f', '1', '2015-08-05 14:22:30', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64efc753e014efc86f3720004', '402882be46404313014640b7eb1c000f', '1', '2015-08-05 14:22:59', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64efc753e014efca1b6120005', '402882be46404313014640b7eb1c000f', '1', '2015-08-05 14:52:13', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64efc753e014efcf2a67b0006', '402882be46404313014640b7eb1c000f', '1', '2015-08-05 16:20:37', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64efc753e014efcf58d7d0007', '402882be46404313014640b7eb1c000f', '1', '2015-08-05 16:23:47', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64efc753e014efd21601e0008', '402882be46404313014640b7eb1c000f', '1', '2015-08-05 17:11:39', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64efc753e014efd2262830009', '402882be46404313014640b7eb1c000f', '1', '2015-08-05 17:12:45', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f007fab014f0089595a0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-06 09:04:05', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f007fab014f008c5fe70005', '402882be46404313014640b7eb1c000f', '1', '2015-08-06 09:07:23', '3', '订单: 402887e64eddb376014eddfdfd45003f的返单及其返单产品信息添加成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f007fab014f008c9b370006', '402882be46404313014640b7eb1c000f', '1', '2015-08-06 09:07:38', '4', '订单(：402887e64f007fab014f008c5fa40002)删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f007fab014f008d1686000b', '402882be46404313014640b7eb1c000f', '1', '2015-08-06 09:08:10', '3', '订单: 402887e64eddb376014eddfdfd45003f的返单及其返单产品信息添加成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f007fab014f00929575000c', '402882be46404313014640b7eb1c000f', '1', '2015-08-06 09:14:10', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f06dc9c014f06ddff340001', '402882be46404313014640b7eb1c000f', '1', '2015-08-07 14:34:16', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f06dc9c014f06eacfa50002', '402882be46404313014640b7eb1c000f', '1', '2015-08-07 14:48:16', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f06dc9c014f06fa3b640003', '402882be46404313014640b7eb1c000f', '1', '2015-08-07 15:05:06', '5', '订单ID: 402887e64eddb376014eddfcf5280033更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f06dc9c014f0705e1eb0004', '402882be46404313014640b7eb1c000f', '1', '2015-08-07 15:17:50', '5', '订单(编号:2015080002)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f06dc9c014f070627f40005', '402882be46404313014640b7eb1c000f', '1', '2015-08-07 15:18:08', '5', '订单(编号:2015080002)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f06dc9c014f0706c9a70006', '402882be46404313014640b7eb1c000f', '1', '2015-08-07 15:18:49', '5', '订单(编号:2015080002)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f06dc9c014f0707b0af0007', '402882be46404313014640b7eb1c000f', '1', '2015-08-07 15:19:48', '5', '订单(编号:2015080002)下的产品: 23321更新成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f06dc9c014f0707dd820008', '402882be46404313014640b7eb1c000f', '1', '2015-08-07 15:20:00', '5', '订单(编号:2015080002)下的产品: 23321更新成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f06dc9c014f070d596c0009', '402882be46404313014640b7eb1c000f', '1', '2015-08-07 15:25:59', '5', '订单ID: 402887e64eddb376014eddfde8d9003b更新成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f06dc9c014f070d77c0000a', '402882be46404313014640b7eb1c000f', '1', '2015-08-07 15:26:07', '5', '订单ID: 402887e64eddb376014eddfde8d9003b更新成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f06dc9c014f072c03c0000b', '402882be46404313014640b7eb1c000f', '1', '2015-08-07 15:59:29', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f06dc9c014f073718ad000c', '402882be46404313014640b7eb1c000f', '1', '2015-08-07 16:11:35', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f06dc9c014f073cb69c000d', '402882be46404313014640b7eb1c000f', '1', '2015-08-07 16:17:43', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f06dc9c014f076ca9b2000e', '402882be46404313014640b7eb1c000f', '1', '2015-08-07 17:10:06', '5', '订单ID: 402887e64f007fab014f008d16640007更新成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f06dc9c014f076ece3e000f', '402882be46404313014640b7eb1c000f', '1', '2015-08-07 17:12:26', '5', '订单ID: 402887e64eddb376014eddfdfd45003f更新成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0a1cb9e20001', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 05:41:38', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0a1ddced0002', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 05:42:53', '5', '订单ID: 402887e64eddb376014eddfd0edf0037更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0a224de20003', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 05:47:44', '5', '订单ID: 402887e64eddb376014eddfcf5280033更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0a25597f0004', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 05:51:04', '5', '订单ID: 402887e64eddb376014eddfcbff80027更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0a41cb8f0005', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 06:22:08', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0a41f0840006', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 06:22:17', '5', '订单ID: 402887e64eddb376014eddfcd107002b更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0a4e5c870007', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 06:35:51', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0a549ae50008', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 06:42:40', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0a6082ff0009', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 06:55:41', '5', '订单(编号:2015070007)下的产品: 23321更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0b9bd3d1000a', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 12:40:05', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0b9df593000c', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 12:42:25', '3', '订单ID: null插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0b9e0e87000d', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 12:42:31', '5', '订单ID: 4028d9814f0a17e6014f0b9df545000b更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0bace4cf000f', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 12:58:44', '3', '订单ID: null插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0bbc59700010', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 13:15:37', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0bbc99080012', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 13:15:53', '3', '订单ID: null插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0bbf5e570013', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 13:18:55', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0bc556980014', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 13:25:26', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0bcefe620016', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 13:35:59', '3', '订单ID: null插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0bcf34910017', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 13:36:12', '5', '订单ID: 4028d9814f0a17e6014f0bbc98e60011更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0bd50c580018', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 13:42:35', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0ca99cc70019', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 17:34:46', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0cb75fb2001a', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 17:49:48', '5', '订单ID: 4028d9814f0a17e6014f0bcefe590015更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0cba56ac001c', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 17:53:02', '3', '订单ID: null插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0cba6829001d', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 17:53:07', '5', '订单ID: 4028d9814f0a17e6014f0cba569e001b更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0cba7843001e', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 17:53:11', '5', '订单ID: 4028d9814f0a17e6014f0cba569e001b更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0cbca57e001f', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 17:55:33', '5', '订单(编号:2015070004)下的产品: 111更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d64aee50020', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 20:59:06', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d65c79d0022', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:00:18', '3', '订单ID: null插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d65f3d50023', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:00:29', '5', '订单ID: 4028d9814f0a17e6014f0d65c78e0021更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d6b65450025', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:06:26', '3', '订单ID: null插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d6bc0470026', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:06:49', '5', '订单ID: 4028d9814f0a17e6014f0d6b653f0024更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d6df8310028', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:09:14', '3', '订单ID: null插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d6e0ab60029', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:09:19', '5', '订单ID: 4028d9814f0a17e6014f0d6df8070027更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d7185b9002b', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:13:07', '3', '订单ID: null插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d71a7c5002c', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:13:16', '5', '订单ID: 4028d9814f0a17e6014f0d7185b3002a更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d76a710002e', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:18:43', '3', '订单ID: null插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d76bc43002f', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:18:49', '5', '订单ID: 4028d9814f0a17e6014f0d76a702002d更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d76d8fa0030', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:18:56', '5', '订单ID: 4028d9814f0a17e6014f0d76a702002d更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d7a5e3e0032', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:22:47', '3', '订单ID: null插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d7ad6a70033', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:23:18', '5', '订单ID: 4028d9814f0a17e6014f0d7a5e390031更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d7e2a7b0035', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:26:56', '3', '订单ID: null插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d7e3a8e0036', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:27:00', '5', '订单ID: 4028d9814f0a17e6014f0d7e2a760034更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d8022490037', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:29:05', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d8042d60039', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:29:13', '3', '订单ID: null插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d805d4a003a', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:29:20', '5', '订单ID: 4028d9814f0a17e6014f0d8042af0038更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d80c954003b', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:29:48', '4', '订单(：4028d9814f0a17e6014f0d8042af0038,4028d9814f0a17e6014f0d7e2a760034,4028d9814f0a17e6014f0d7a5e390031,4028d9814f0a17e6014f0d7185b3002a,4028d9814f0a17e6014f0d6df8070027,4028d9814f0a17e6014f0d6b653f0024,4028d9814f0a17e6014f0d65c78e0021)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d810a00003c', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:30:04', '4', '订单(：4028d9814f0a17e6014f0bcefe590015,4028d9814f0a17e6014f0bbc98e60011,4028d9814f0a17e6014f0bace4c8000e,4028d9814f0a17e6014f0b9df545000b)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d81eebe003e', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:31:03', '3', '订单ID: null插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d8249520040', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:31:26', '3', '订单(编号:2015080016)下的产品: 111插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d8293100042', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:31:45', '3', '订单(编号:2015080016)下的产品: 23321插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d82b6250043', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:31:54', '5', '订单ID: 4028d9814f0a17e6014f0d81eead003d更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d82e77e0045', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:32:06', '3', '订单(编号:2015080016)下的产品: 111插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d8325c00046', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:32:22', '4', '订单(编号:2015080016)下的产品: 23321删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d8356ec0047', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:32:35', '4', '订单(编号:2015080016)下的产品: 111删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d83627d0048', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:32:38', '4', '订单(编号:2015080016)下的产品: 111删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d836ba80049', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:32:40', '5', '订单ID: 4028d9814f0a17e6014f0d81eead003d更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d84b324004a', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:34:04', '5', '订单(编号:2015070007)下的产品: 111更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d8dfc3e004c', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:44:13', '3', '订单ID: null插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d90f9de004d', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:47:29', '5', '订单ID: 4028d9814f0a17e6014f0d8dfc2c004b更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d911bbc004e', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:47:37', '5', '订单ID: 402887e64eddb376014eddfce55e002f更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d9137d3004f', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 21:47:44', '5', '订单ID: 4028d9814f0a17e6014f0d8dfc2c004b更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0d9ef8e60050', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 22:02:46', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0da001030051', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 22:03:53', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0da0f3610052', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 22:04:56', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0dafaac30053', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 22:21:00', '5', '订单ID: 402887e64eddb376014eddfcac1f0023更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f0a17e6014f0db50aad0054', '402882be46404313014640b7eb1c000f', '1', '2015-08-08 22:26:52', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f12a51b014f12a7cd980001', '402882be46404313014640b7eb1c000f', '1', '2015-08-09 21:30:31', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f12a51b014f12a8ae320004', '402882be46404313014640b7eb1c000f', '1', '2015-08-09 21:31:28', '3', '订单ID: 4028d9814f0a17e6014f0d8dfc2c004b下的产品1212及其订单信息插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f12a51b014f12ab09c50007', '402882be46404313014640b7eb1c000f', '1', '2015-08-09 21:34:03', '3', '订单ID: 4028d9814f0a17e6014f0d8dfc2c004b下的产品123及其订单信息插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f12a51b014f12ac4dd80009', '402882be46404313014640b7eb1c000f', '1', '2015-08-09 21:35:26', '3', '订单ID: 4028d9814f0a17e6014f0d8dfc2c004b下的产品wqwe及其订单信息插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f12a51b014f12adb06b000c', '402882be46404313014640b7eb1c000f', '1', '2015-08-09 21:36:56', '3', '订单ID: 4028d9814f0a17e6014f0d8dfc2c004b下的产品2131及其订单信息插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f12a51b014f12aeaba20010', '402882be46404313014640b7eb1c000f', '1', '2015-08-09 21:38:01', '3', '订单ID: 4028d9814f0a17e6014f0d8dfc2c004b下的产品1221及其订单信息插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f12a51b014f12afb0ec0013', '402882be46404313014640b7eb1c000f', '1', '2015-08-09 21:39:08', '3', '订单ID: 4028d9814f0a17e6014f0d8dfc2c004b下的产品12及其订单信息插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f12a51b014f12b10d010017', '402882be46404313014640b7eb1c000f', '1', '2015-08-09 21:40:37', '3', '订单ID: 4028d9814f0a17e6014f0d8dfc2c004b下的产品1221及其订单信息插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f150def014f150ee15b0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 08:42:20', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f159dcc014f15a03e570001', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 11:21:07', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f159dcc014f15b559c20003', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 11:44:10', '3', '订单ID: 4028d9814f0a17e6014f0d8dfc2c004b下的产品1及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f15f8cd014f162089200001', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 13:41:15', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f15f8cd014f1651863e0002', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 14:34:45', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f15f8cd014f166c6b620003', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 15:04:08', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f15f8cd014f166caf300004', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 15:04:25', '5', '订单(编号:2015080017)下的产品: 2131更新成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f15f8cd014f16777d510006', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 15:16:13', '3', '订单(编号:2015080017)下的产品: 111插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f15f8cd014f16779f750008', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 15:16:22', '3', '订单(编号:2015080017)下的产品: 111插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f15f8cd014f1677c5db000a', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 15:16:32', '3', '订单(编号:2015080017)下的产品: 111插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f15f8cd014f16aa4e7e000b', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 16:11:44', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f17d443014f17d612ef0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 21:39:09', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f17e05d014f17e180da0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 21:51:38', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f17e05d014f17ed024d0002', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 22:04:12', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f17e05d014f17f8e7d70003', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 22:17:12', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f17e05d014f17fde4940004', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 22:22:39', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f17e05d014f181a82f70005', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 22:53:54', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f17e05d014f1822f3740006', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 23:03:07', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f17e05d014f1831bf6f0007', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 23:19:17', '5', '订单ID: 4028d9814f0a17e6014f0d8dfc2c004b更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f17e05d014f18341a950008', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 23:21:52', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f17e05d014f183cd2bf0009', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 23:31:23', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f17e05d014f183eb56c000a', '402882be46404313014640b7eb1c000f', '1', '2015-08-10 23:33:27', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f1a40c1014f1a420f3f0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 08:56:21', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1a4911014f1a4a28a10001', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 09:05:11', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1a4911014f1a7efa650002', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 10:02:53', '5', '订单ID: 4028d9814e3543b5014e354b1a3e0003更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1a4911014f1a823fb90003', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 10:06:27', '4', '订单(编号:2015080017)下的产品: 111删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1a4911014f1a8251180004', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 10:06:32', '4', '订单(编号:2015080017)下的产品: 1221删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1a4911014f1a825d470005', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 10:06:35', '4', '订单(编号:2015080017)下的产品: 2131删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1a4911014f1a8294b00007', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 10:06:49', '3', '订单(编号:2015080017)下的产品: 111插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1a4911014f1a983eaf0008', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 10:30:29', '5', '订单(编号:2015080017)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1a4911014f1a992a140009', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 10:31:29', '5', '订单(编号:2015080017)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1a4911014f1a9b5d8a000a', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 10:33:53', '5', '订单(编号:2015080017)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1a4911014f1a9b92c6000b', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 10:34:07', '5', '订单(编号:2015080017)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1a4911014f1a9bb9e2000c', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 10:34:17', '5', '订单(编号:2015080017)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1a4911014f1a9c0f10000d', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 10:34:39', '5', '订单(编号:2015080017)下的产品: 12更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1a4911014f1a9c421d000e', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 10:34:52', '5', '订单(编号:2015080017)下的产品: 12更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1a4911014f1aa17ca1000f', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 10:40:34', '5', '订单ID: 402887e64eddb376014eddfc62c80017更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1ae0c5014f1ae2911a0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 11:51:40', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1ae0c5014f1b32f8a60002', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 13:19:29', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f1ae0c5014f1b35c1830003', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 13:22:31', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1ae0c5014f1b66f2ee0004', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 14:16:15', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f1b6a32014f1b6aa7ad0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 14:20:18', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1b6a32014f1b7707ec0002', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 14:33:49', '5', '订单(编号:2015080017)下的产品: 1221更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1b6a32014f1b79318e0003', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 14:36:11', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f1b6a32014f1b79a7a50004', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 14:36:41', '5', '订单(编号:2015080017)下的产品: 111更新成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f1b6a32014f1b7e5a870005', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 14:41:49', '5', '订单(编号:2015080017)下的产品: 12更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1b6a32014f1b7f85420006', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 14:43:06', '5', '订单(编号:2015080017)下的产品: 12更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1b6a32014f1b82c70a0007', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 14:46:39', '5', '订单(编号:2015080017)下的产品: 1221更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1b6a32014f1b88a6640008', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 14:53:04', '5', '订单ID: 402887e64eddb376014eddfde8d9003b更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1b6a32014f1b9588230009', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 15:07:08', '5', '订单(编号:2015080017)下的产品: 1221更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1b6a32014f1b9fd1a2000a', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 15:18:22', '5', '订单(编号:2015080017)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1b6a32014f1ba08252000b', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 15:19:08', '5', '订单(编号:2015080017)下的产品: 1221更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1b6a32014f1ba0ebf0000c', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 15:19:35', '5', '订单(编号:2015080017)下的产品: 12更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1b6a32014f1ba35a09000d', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 15:22:14', '5', '订单(编号:2015080017)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1b6a32014f1ba3f6d7000e', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 15:22:54', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f1b6a32014f1ba453a7000f', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 15:23:18', '5', '订单(编号:2015080017)下的产品: 1221更新成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f1b6a32014f1ba543370011', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 15:24:19', '3', '订单(编号:2015070004)下的产品: 1插入成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f1b6a32014f1ba5519c0013', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 15:24:23', '3', '订单(编号:2015070004)下的产品: 12插入成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f1b6a32014f1ba562e70015', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 15:24:27', '3', '订单(编号:2015070004)下的产品: 1221插入成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f1bb453014f1bb4e83f0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 15:41:24', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1bb72e014f1bb789830001', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 15:44:17', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1bb72e014f1bc102aa0002', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 15:54:38', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e64f1bb72e014f1bd868070004', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 16:20:11', '3', '订单ID: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1bb72e014f1bd8b26c0005', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 16:20:30', '5', '订单ID: 402887e64f1bb72e014f1bd867aa0003更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1bb72e014f1bd9427d0006', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 16:21:07', '4', '订单(：402887e64f1bb72e014f1bd867aa0003)删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1bb72e014f1bda2c480008', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 16:22:07', '3', '订单ID: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1bb72e014f1bdbaa79000a', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 16:23:45', '3', '订单ID: null插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1bb72e014f1bdc1b17000b', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 16:24:13', '5', '订单ID: 402887e64f1bb72e014f1bda2c3d0007更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1bb72e014f1bdc3bc7000c', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 16:24:22', '5', '订单ID: 402887e64f1bb72e014f1bdbaa720009更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1bb72e014f1bdc58b6000d', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 16:24:29', '4', '订单(：402887e64f1bb72e014f1bdbaa720009)删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1bb72e014f1bddcffa000f', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 16:26:05', '3', '订单: 402887e64f1bb72e014f1bda2c3d0007的返单及其返单产品信息添加成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1bb72e014f1bde30680011', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 16:26:30', '3', '订单ID: 402887e64f1bb72e014f1bddcfe7000e下的产品123333及其订单信息插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1bb72e014f1be5bef10012', '402882be46404313014640b7eb1c000f', '1', '2015-08-11 16:34:45', '5', '订单ID: 402887e64f1bb72e014f1bddcfe7000e更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f1d5278014f1d96f4460001', '402882be46404313014640b7eb1c000f', '1', '2015-08-12 00:27:56', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1f675e014f1f67df670001', '402882be46404313014640b7eb1c000f', '1', '2015-08-12 08:55:45', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1f675e014f1f7718560002', '402882be46404313014640b7eb1c000f', '1', '2015-08-12 09:12:22', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1f675e014f1f9e50900003', '402882be46404313014640b7eb1c000f', '1', '2015-08-12 09:55:13', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1f675e014f1fbf686f0004', '402882be46404313014640b7eb1c000f', '1', '2015-08-12 10:31:21', '5', '订单(编号:2015080017)下的产品: 1221更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1f675e014f2039b9340005', '402882be46404313014640b7eb1c000f', '1', '2015-08-12 12:44:58', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1f675e014f20a36b3b0006', '402882be46404313014640b7eb1c000f', '1', '2015-08-12 14:40:24', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1f675e014f20c106c90007', '402882be46404313014640b7eb1c000f', '1', '2015-08-12 15:12:45', '5', '订单(编号:2015080002)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1f675e014f20c559260008', '402882be46404313014640b7eb1c000f', '1', '2015-08-12 15:17:28', '5', '订单(编号:2015080002)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1f675e014f20c699a60009', '402882be46404313014640b7eb1c000f', '1', '2015-08-12 15:18:50', '5', '订单(编号:2015070011)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1f675e014f20ed1a1c000a', '402882be46404313014640b7eb1c000f', '1', '2015-08-12 16:00:53', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1f675e014f20eea673000b', '402882be46404313014640b7eb1c000f', '1', '2015-08-12 16:02:35', '4', '订单(编号:2015070011)下的产品: 23321删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1f675e014f20ef82e4000d', '402882be46404313014640b7eb1c000f', '1', '2015-08-12 16:03:31', '3', '订单(编号:2015080021)下的产品: 123333插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1f675e014f20f309a9000f', '402882be46404313014640b7eb1c000f', '1', '2015-08-12 16:07:22', '3', '订单(编号:2015080019)下的产品: 123插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1f675e014f20f36d660010', '402882be46404313014640b7eb1c000f', '1', '2015-08-12 16:07:48', '4', '订单(编号:2015080019)下的产品: 123删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1f675e014f20fe28260012', '402882be46404313014640b7eb1c000f', '1', '2015-08-12 16:19:31', '3', '订单(编号:2015080021)下的产品: 123333插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f1f675e014f21023a280014', '402882be46404313014640b7eb1c000f', '1', '2015-08-12 16:23:58', '3', '订单(编号:2015080021)下的产品: 123插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f399537c30001', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 10:55:24', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39a666320002', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 11:14:10', '5', '订单(编号:2015080021)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39a7e4ad0003', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 11:15:48', '5', '订单(编号:2015080021)下的产品: wqwe更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39b057e60004', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 11:25:02', '5', '订单(编号:2015080021)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39b16fbb0005', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 11:26:13', '5', '订单(编号:2015080021)下的产品: wqwe更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39b23b950006', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 11:27:06', '5', '订单(编号:2015080021)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39b3e5d50007', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 11:28:55', '5', '订单(编号:2015080021)下的产品: wqwe更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39b513c80008', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 11:30:12', '5', '订单(编号:2015080021)下的产品: 123333更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39b91b540009', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 11:34:36', '5', '订单(编号:2015080021)下的产品: wqwe更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39ba1342000a', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 11:35:40', '5', '订单(编号:2015080021)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39bb7300000b', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 11:37:10', '5', '订单(编号:2015080021)下的产品: wqwe更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39bb8ba0000c', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 11:37:16', '5', '订单(编号:2015080021)下的产品: 123333更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39c118ad000d', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 11:43:20', '5', '订单(编号:2015080021)下的产品: wqwe更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39c1b524000e', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 11:44:00', '5', '订单(编号:2015080021)下的产品: wqwe更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39c2c33d000f', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 11:45:09', '5', '订单(编号:2015080021)下的产品: 1更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39c35d150010', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 11:45:48', '5', '订单(编号:2015080021)下的产品: wqwe更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39c643500011', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 11:48:58', '5', '订单(编号:2015080021)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39c802680012', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 11:50:53', '5', '订单(编号:2015080021)下的产品: wqwe更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39c8c7420013', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 11:51:43', '5', '订单(编号:2015080021)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39c9ee970014', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 11:52:59', '5', '订单(编号:2015080021)下的产品: wqwe更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39d093cf0015', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 12:00:14', '5', '订单(编号:2015080021)下的产品: 123更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39d0a6730016', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 12:00:19', '5', '订单(编号:2015080021)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39d0bdec0017', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 12:00:25', '5', '订单(编号:2015080021)下的产品: wqwe更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39d7d8e60018', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 12:08:11', '5', '订单(编号:2015080021)下的产品: 123333更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39d878890019', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 12:08:52', '5', '订单(编号:2015080021)下的产品: 1212更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39d88899001a', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 12:08:56', '5', '订单(编号:2015080021)下的产品: wqwe更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39fe15e2001b', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 12:49:57', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39fe81f5001d', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 12:50:24', '3', '订单(编号:2015080021)下的产品: 23321插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39feb30a001f', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 12:50:37', '3', '订单(编号:2015080021)下的产品: 1212插入成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39ff1b2f0020', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 12:51:04', '4', '订单(编号:2015080021)下的产品: 23321删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39ff794b0021', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 12:51:28', '4', '订单(编号:2015080021)下的产品: 111删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f39ff92e40022', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 12:51:34', '4', '订单(编号:2015080021)下的产品: 1212删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a0586ee0023', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 12:58:04', '5', '订单(编号:2015080021)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a0684330025', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 12:59:09', '5', '订单(编号:2015080021)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a078ee60026', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:00:18', '4', '订单(编号:2015080021)下的产品: 23321删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a08522c0028', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:01:08', '5', '订单(编号:2015080021)下的产品: 1212更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a087ac80029', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:01:18', '5', '订单(编号:2015080021)下的产品: 1212更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a08c82d002a', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:01:38', '4', '订单(编号:2015080021)下的产品: 1212删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a08dc1e002c', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:01:43', '5', '订单(编号:2015080021)下的产品: 1212更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a08fe31002d', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:01:52', '5', '订单(编号:2015080021)下的产品: 123更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a10c72d002f', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:10:22', '5', '订单(编号:2015080021)下的产品: 1更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a110c2c0030', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:10:39', '5', '订单(编号:2015080021)下的产品: wqwe更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a13fdca0032', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:13:52', '5', '订单(编号:2015080021)下的产品: 2131更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a141b2b0033', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:14:00', '4', '订单(编号:2015080021)下的产品: 2131删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a14270c0034', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:14:03', '4', '订单(编号:2015080021)下的产品: 111删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a1433d30035', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:14:06', '4', '订单(编号:2015080021)下的产品: wqwe删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a143f3c0036', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:14:09', '4', '订单(编号:2015080021)下的产品: 123删除成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a14bdbd0038', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:14:41', '5', '订单(编号:2015080017)下的产品: 1221更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a14d3fc003a', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:14:47', '5', '订单(编号:2015080017)下的产品: wqwe更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a14e4ac003c', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:14:51', '5', '订单(编号:2015080017)下的产品: 23321更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a14f4a8003e', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:14:56', '5', '订单(编号:2015080017)下的产品: 1更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a1507a60040', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:15:00', '5', '订单(编号:2015080017)下的产品: 1221更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a15c76f0041', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:15:49', '5', '订单(编号:2015080017)下的产品: 123更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3966c4014f3a15fb360043', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 13:16:03', '5', '订单(编号:2015080017)下的产品: 123333更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a422a014f3a43a3c20001', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 14:05:55', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a49f1014f3a4a375f0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 14:13:06', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a49f1014f3a4a98ae0003', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 14:13:31', '5', '订单(编号:2015080021)下的产品: 1更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a49f1014f3a4f42f30005', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 14:18:37', '5', '订单(编号:2015080021)下的产品: 123更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a49f1014f3a51c34f0006', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 14:21:21', '5', '订单(编号:2015080021)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a49f1014f3a527b410007', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 14:22:08', '5', '订单(编号:2015080021)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a49f1014f3a52e8690008', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 14:22:36', '5', '订单(编号:2015080021)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a49f1014f3a53217d0009', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 14:22:50', '5', '订单(编号:2015080021)下的产品: 111更新成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a49f1014f3a5ce883000a', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 14:33:31', '5', '订单(编号:2015080021)下的产品: 1更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a49f1014f3a6106af000b', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 14:38:01', '5', '订单(编号:2015080021)下的产品: 111更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a49f1014f3a614e11000c', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 14:38:19', '5', '订单(编号:2015080021)下的产品: 111更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a49f1014f3a62356f0011', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 14:39:18', '3', '订单: 402887e64f1bb72e014f1bddcfe7000e的返单及其返单产品信息添加成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a49f1014f3ac048710012', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 16:22:04', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a49f1014f3ac386020013', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 16:25:36', '5', '订单(编号:2015080022)下的产品: 1更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a49f1014f3ac51a620014', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 16:27:20', '5', '订单(编号:2015080022)下的产品: 1更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a49f1014f3ac571d20015', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 16:27:42', '5', '订单(编号:2015080022)下的产品: 1更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a49f1014f3ac6da760016', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 16:29:14', '5', '订单(编号:2015080022)下的产品: 1更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a49f1014f3ac740130017', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 16:29:40', '5', '订单(编号:2015080022)下的产品: 111更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a49f1014f3aca097e0018', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 16:32:43', '5', '订单(编号:2015080022)下的产品: 1更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f3a49f1014f3aca3ab00019', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 16:32:55', '5', '订单(编号:2015080022)下的产品: 1更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3bcc6e014f3bcd91900001', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 21:16:11', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3bcc6e014f3bec95f50002', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 21:50:04', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3bcc6e014f3bf7c2020003', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 22:02:16', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3bcc6e014f3bfc70c90004', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 22:07:23', '5', '订单(编号:2015080022)下的产品: 1更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3bcc6e014f3bfe18a70005', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 22:09:12', '5', '订单(编号:2015080022)下的产品: 1更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3bcc6e014f3bff1ee40006', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 22:10:19', '5', '订单(编号:2015080022)下的产品: 1更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3bcc6e014f3bff8a2e0008', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 22:10:46', '5', '订单(编号:2015080022)下的产品: wqwe更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3bcc6e014f3c08aa73000a', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 22:20:45', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3bcc6e014f3c0f66c2000e', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 22:28:06', '5', '订单(编号:2015080022)下的产品: 1221更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3bcc6e014f3c105e70000f', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 22:29:09', '5', '订单(编号:2015080022)下的产品: 1221更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3bcc6e014f3c107de30010', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 22:29:17', '4', '订单(编号:2015080022)下的产品: 111删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3bcc6e014f3c10cb3c0012', '402882be46404313014640b7eb1c000f', '1', '2015-08-17 22:29:37', '5', '订单(编号:2015080022)下的产品: 1221更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3e5a72af0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 09:09:19', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3e5b7a350002', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 09:10:26', '4', '订单(编号:2015080022)下的产品: 1221删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3e5bb4230004', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 09:10:41', '5', '订单(编号:2015080022)下的产品: 23321更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3e5c4dfd0005', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 09:11:20', '4', '订单(编号:2015080022)下的产品: wqwe删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3e5c585a0006', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 09:11:23', '4', '订单(编号:2015080022)下的产品: 23321删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3e5c6b9d0007', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 09:11:28', '5', '订单(编号:2015080022)下的产品: 1221更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3e5c8f1d0009', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 09:11:37', '5', '订单(编号:2015080022)下的产品: 1更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3e5ccfb9000a', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 09:11:54', '4', '订单(编号:2015080022)下的产品: 1删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3e5ce924000c', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 09:12:00', '5', '订单(编号:2015080022)下的产品: 2131更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3e5e15ac0013', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 09:13:17', '3', '订单: 402887e64f3a49f1014f3a623550000d的返单及其返单产品信息添加成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3e5e555c0014', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 09:13:33', '4', '订单(：4028d9814f3e59c8014f3e5e158c000d)删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3e5e6efa0015', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 09:13:40', '4', '订单(：402887e64f1bb72e014f1bda2c3d0007)删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3e5fc1b50017', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 09:15:07', '5', '订单(编号:2015080021)下的产品: 123更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3e6685190018', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 09:22:30', '5', '订单(编号:2015080022)下的产品: 1221更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3e67239c0019', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 09:23:10', '5', '订单(编号:2015080022)下的产品: 1221更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3e6bf516001b', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 09:28:26', '5', '订单(编号:2015080022)下的产品: 1212更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3e6ea0a4001c', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 09:31:21', '5', '订单(编号:2015080022)下的产品: 123333更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3e96c418001d', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 10:15:12', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3e96f55f001e', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 10:15:24', '5', '订单(编号:2015080022)下的产品: 1更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3ee64529001f', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 11:42:02', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f23688c0020', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 12:48:49', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f300afa0021', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:02:37', '5', '订单(编号:2015080022)下的产品: 1更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f304a400023', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:02:53', '5', '订单(编号:2015080022)下的产品: 23321更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f30c4b40024', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:03:24', '5', '订单(编号:2015070011)下的产品: 111更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f30ec350026', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:03:34', '5', '订单(编号:2015070011)下的产品: 1212更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f357ba60027', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:08:33', '5', '订单(编号:2015080022)下的产品: 1更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f36e7170028', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:10:06', '5', '订单(编号:2015080022)下的产品: 2131更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f38205d0029', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:11:27', '5', '订单(编号:2015080022)下的产品: 2131更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f38660f002a', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:11:44', '5', '订单(编号:2015080022)下的产品: 1212更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f389dbc002c', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:11:59', '5', '订单(编号:2015080022)下的产品: 1更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f398320002d', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:12:57', '5', '订单(编号:2015080022)下的产品: 1221更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f3c8099002e', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:16:13', '5', '订单(编号:2015080022)下的产品: 1221更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f44530e002f', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:24:46', '4', '订单(编号:2015080022)下的产品: 23321删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f4852240030', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:29:08', '4', '订单(编号:2015080022)下的产品: 1212删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f4880f40031', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:29:20', '4', '订单(编号:2015080022)下的产品: 1221删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f4938e30032', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:30:07', '4', '订单(编号:2015080022)下的产品: 1删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f49ed8a0033', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:30:53', '4', '订单(编号:2015080022)下的产品: 1删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f4bf2ef0034', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:33:06', '4', '订单(编号:2015080022)下的产品: 2131删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f5a86ed0035', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:49:01', '4', '订单(编号:2015080022)下的产品: 123333删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f5b2abd0036', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:49:43', '4', '订单(编号:2015080021)下的产品: 1删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f5b39b40037', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:49:47', '4', '订单(编号:2015080021)下的产品: 123删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f5b45c70038', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:49:50', '4', '订单(编号:2015080021)下的产品: 123333删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f5b51d00039', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:49:53', '4', '订单(编号:2015080021)下的产品: 111删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f5b6153003a', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:49:57', '4', '订单(：402887e64f1bb72e014f1bddcfe7000e)删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f5b6f6f003b', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 13:50:01', '4', '订单(：402887e64f3a49f1014f3a623550000d)删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f651113003c', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 14:00:32', '5', '订单(编号:2015080017)下的产品: 1221更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f657d5d003d', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 14:00:59', '4', '订单(编号:2015080002)下的产品: 23321删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f88a934004a', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 14:39:24', '3', '订单: 4028d9814f0a17e6014f0d8dfc2c004b的返单及其返单产品信息添加成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f897e0a004b', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 14:40:19', '4', '订单(编号:2015080024)下的产品: 1221删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f898d01004c', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 14:40:23', '4', '订单(编号:2015080024)下的产品: 123删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f89a382004d', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 14:40:29', '4', '订单(编号:2015080024)下的产品: 1删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f89b2c9004e', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 14:40:32', '4', '订单(编号:2015080024)下的产品: 1221删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f89d8eb004f', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 14:40:42', '4', '订单(：4028d9814f3e59c8014f3f88a92a003e)删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3f8d5aa00050', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 14:44:32', '5', '订单(订单号:402887e64eddb376014eddfcf5280033)下的产品: 111更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3fa876250051', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 15:14:09', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f3e59c8014f3fc690270052', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 15:47:01', '5', '生产单ID: 402887e64eddb376014eddfcd107002b更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f3fe002014f3fe62d110001', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 16:21:33', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f3fe002014f3ff134660002', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 16:33:36', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f410e8a014f411b03ac0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 21:58:53', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f410e8a014f411c998e0002', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 22:00:37', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f410e8a014f413ffd660003', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 22:39:16', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f410e8a014f414781540004', '402882be46404313014640b7eb1c000f', '1', '2015-08-18 22:47:29', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f43a682014f43a6deae0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-19 09:50:53', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f49ff98014f4a3d30990001', '402882be46404313014640b7eb1c000f', '1', '2015-08-20 16:32:48', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f4edd98014f4ede3c0c0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-21 14:07:11', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f506060014f50619b0b0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-21 21:10:18', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f585151014f585251a40001', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 10:10:33', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f58d8e5014f58db6f9c0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 12:40:20', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f58d8e5014f58e541e70002', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 12:51:03', '5', '生产单ID: 402887e64eddb376014eddfcf5280033更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f58d8e5014f58e5ef070003', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 12:51:48', '5', '生产单ID: 402887e64eddb376014eddfcf5280033更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f58ea4a014f58eb7d650001', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 12:57:52', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f58ea4a014f58ec839c0002', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 12:58:59', '5', '生产单ID: 402887e64eddb376014eddfde8d9003b更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f58ea4a014f58eea5810003', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 13:01:19', '5', '生产单ID: 402887e64eddb376014eddfde8d9003b更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f58ea4a014f58ff23db0004', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 13:19:20', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f58ea4a014f5906a6670006', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 13:27:32', '5', '订单(编号:2015080017)下的产品: 1221更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f58ea4a014f593025260007', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 14:12:51', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f58ea4a014f593543a30008', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 14:18:27', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f59834d014f5984651d0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 15:44:52', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f59834d014f5985a5660002', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 15:46:15', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f598e86014f5990c5300001', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 15:58:24', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f598e86014f59d058be0002', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 17:07:50', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f598e86014f59d423350003', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 17:11:59', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f59db87014f59dca83f0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 17:21:17', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f59db87014f59dca83f0002', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 17:21:17', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f59db87014f5a0b17cf0003', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 18:12:00', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f59db87014f5a0bcc910004', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 18:12:46', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f59db87014f5a650cbc0005', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 19:50:15', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f59db87014f5a65fa7d0006', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 19:51:16', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f59db87014f5a9eeb700007', '402882be46404313014640b7eb1c000f', '1', '2015-08-23 20:53:28', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f6387dc014f63892a0d0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-25 14:26:17', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f6387dc014f638e51840003', '402882be46404313014640b7eb1c000f', '1', '2015-08-25 14:31:55', '3', '产品： 2332134插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f6387dc014f639503ea0005', '402882be46404313014640b7eb1c000f', '1', '2015-08-25 14:39:14', '3', '客户： 小二插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f640826014f640894790001', '402882be46404313014640b7eb1c000f', '1', '2015-08-25 16:45:28', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f641a95014f641aed610001', '402882be46404313014640b7eb1c000f', '1', '2015-08-25 17:05:30', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f641c3d014f641c85010001', '402882be46404313014640b7eb1c000f', '1', '2015-08-25 17:07:14', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f641db8014f641def090001', '402882be46404313014640b7eb1c000f', '1', '2015-08-25 17:08:47', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f64200b014f64204ca20001', '402882be46404313014640b7eb1c000f', '1', '2015-08-25 17:11:22', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f642233014f6422dcf30001', '402882be46404313014640b7eb1c000f', '1', '2015-08-25 17:14:10', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f6783d6014f67853b120001', '402882be46404313014640b7eb1c000f', '1', '2015-08-26 09:00:28', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f678b1b014f678b82670001', '402882be46404313014640b7eb1c000f', '1', '2015-08-26 09:07:20', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f679b09014f679b960b0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-26 09:24:53', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f67a9ee014f67aa92060001', '402882be46404313014640b7eb1c000f', '1', '2015-08-26 09:41:15', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f67b8f1014f67b994fc0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-26 09:57:39', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f67e442014f67e4a9fe0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-26 10:44:43', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f6a0f2c014f6a10f2aa0001', '402882be46404313014640b7eb1c000f', '1', '2015-08-26 20:52:19', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f6a0f2c014f6a11726a0002', '402882be46404313014640b7eb1c000f', '1', '2015-08-26 20:52:52', '5', '产品: 123333更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f6a17c5014f6a18abb60001', '402882be46404313014640b7eb1c000f', '1', '2015-08-26 21:00:45', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f6a17c5014f6a18d4fa0002', '402882be46404313014640b7eb1c000f', '1', '2015-08-26 21:00:56', '5', '产品: 123333更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f6a17c5014f6a1a3db00003', '402882be46404313014640b7eb1c000f', '1', '2015-08-26 21:02:28', '5', '产品: 123333更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f6a17c5014f6a1cd9bf0004', '402882be46404313014640b7eb1c000f', '1', '2015-08-26 21:05:19', '5', '产品: 123333更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f6a17c5014f6a24fa510005', '402882be46404313014640b7eb1c000f', '1', '2015-08-26 21:14:12', '5', '产品: 123333更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f6a17c5014f6a2528090006', '402882be46404313014640b7eb1c000f', '1', '2015-08-26 21:14:24', '5', '产品: 123333更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9814f6a17c5014f6a5922760007', '402882be46404313014640b7eb1c000f', '1', '2015-08-26 22:11:10', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9814f6a7931014f6a7a84d50001', '402882be46404313014640b7eb1c000f', '1', '2015-08-26 22:47:38', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e64f86a24e014f86a2df320001', '402882be46404313014640b7eb1c000f', '1', '2015-09-01 10:01:04', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9815075b466015075b6eda70001', '402882be46404313014640b7eb1c000f', '1', '2015-10-17 20:12:14', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9815075b466015075ba1f690002', '402882be46404313014640b7eb1c000f', '1', '2015-10-17 20:15:43', '5', '订单ID: 402887e64eddb376014eddfdfd45003f更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9815075b466015075bcdcd20003', '402882be46404313014640b7eb1c000f', '1', '2015-10-17 20:18:43', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815075b466015075bfa2900005', '402882be46404313014640b7eb1c000f', '1', '2015-10-17 20:21:44', '3', '订单ID: null插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981508dadf801508daf01a40001', '402882be46404313014640b7eb1c000f', '1', '2015-10-22 11:54:28', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981508db4e301508db536f10001', '402882be46404313014640b7eb1c000f', '1', '2015-10-22 12:01:14', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981508dbc1001508dcf830d0001', '402882be46404313014640b7eb1c000f', '1', '2015-10-22 12:29:58', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981508ddb1401508ddbe4450001', '402882be46404313014640b7eb1c000f', '1', '2015-10-22 12:43:29', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981508ddb1401508e05c9b90002', '402882be46404313014640b7eb1c000f', '1', '2015-10-22 13:29:15', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981508e099501508e0a1d460001', '402882be46404313014640b7eb1c000f', '1', '2015-10-22 13:33:58', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981508e1d0f01508e1d80fb0001', '402882be46404313014640b7eb1c000f', '1', '2015-10-22 13:55:09', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981508e1e5401508e1ea0500001', '402882be46404313014640b7eb1c000f', '1', '2015-10-22 13:56:23', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e651437b100151437bd0220001', '402882be46404313014640b7eb1c000f', '1', '2015-11-26 19:09:26', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6514381a60151438200c60001', '402882be46404313014640b7eb1c000f', '1', '2015-11-26 19:16:12', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65143887101514388c6660001', '402882be46404313014640b7eb1c000f', '1', '2015-11-26 19:23:35', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65143976801514397af090001', '402882be46404313014640b7eb1c000f', '1', '2015-11-26 19:39:52', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65143a429015143a505390001', '402882be46404313014640b7eb1c000f', '1', '2015-11-26 19:54:26', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65143ab72015143abaf2d0001', '402882be46404313014640b7eb1c000f', '1', '2015-11-26 20:01:43', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65143b01e015143b092310001', '402882be46404313014640b7eb1c000f', '1', '2015-11-26 20:07:03', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65143bc18015143bc84c30001', '402882be46404313014640b7eb1c000f', '1', '2015-11-26 20:20:06', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65143c4c6015143c546b00001', '402882be46404313014640b7eb1c000f', '1', '2015-11-26 20:29:40', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65143c7ea015143c843980001', '402882be46404313014640b7eb1c000f', '1', '2015-11-26 20:32:56', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65143cd34015143cd6d6e0001', '402882be46404313014640b7eb1c000f', '1', '2015-11-26 20:38:35', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65143d496015143d4e33d0001', '402882be46404313014640b7eb1c000f', '1', '2015-11-26 20:46:44', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65143d720015143d75a4f0001', '402882be46404313014640b7eb1c000f', '1', '2015-11-26 20:49:25', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6514798cc0151479a02590001', '402882be46404313014640b7eb1c000f', '1', '2015-11-27 14:20:54', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65147ff06015147ffcb290001', '402882be46404313014640b7eb1c000f', '1', '2015-11-27 16:12:04', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515711ab0151571b44f60001', '402882be46404313014640b7eb1c000f', '1', '2015-11-30 14:36:23', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e651572001015157203f7c0001', '402882be46404313014640b7eb1c000f', '1', '2015-11-30 14:41:49', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e651572d9801515737e1fb0001', '402882be46404313014640b7eb1c000f', '1', '2015-11-30 15:07:38', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65157538c0151575404d20001', '402882be46404313014640b7eb1c000f', '1', '2015-11-30 15:38:22', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e651578b800151578cfcac0001', '402882be46404313014640b7eb1c000f', '1', '2015-11-30 16:40:36', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e651578ff4015157929e190001', '402882be46404313014640b7eb1c000f', '1', '2015-11-30 16:46:45', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e651579e700151579fc1680001', '402882be46404313014640b7eb1c000f', '1', '2015-11-30 17:01:06', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65157a8bb015157a915d10001', '402882be46404313014640b7eb1c000f', '1', '2015-11-30 17:11:17', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515b99e401515b9a44c80001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 11:33:35', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515ba02901515ba0688f0001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 11:40:17', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515bd00d01515bd1f0a50001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 12:34:23', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515bdf7101515bdfcb9f0001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 12:49:32', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515be37b01515be425890001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 12:54:17', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515bfc5901515bfccd440001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 13:21:12', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515bfdfa01515bfeb3d20001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 13:23:17', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515c03ae01515c03f81d0001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 13:29:02', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515c055301515c059c970001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 13:30:50', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515c084701515c0883d20001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 13:34:00', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515c36df01515c372cdc0001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 14:24:58', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515c6fa101515c7126c40001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 15:28:18', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515c72bf01515c7322aa0001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 15:30:28', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515c7b8401515c7becb30001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 15:40:04', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515caf0d01515cafd25e0001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 16:36:45', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515cb12d01515cb19b5c0001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 16:38:42', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515cb3fa01515cb4493d0001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 16:41:37', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515cbaf001515cbb44d60001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 16:49:15', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515cc74b01515ccb0ad30001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 17:06:29', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515ccfe301515cd035620001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 17:12:07', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515cd59001515cd66ad80001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 17:18:54', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6515cd84501515cd88aa40001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 17:21:13', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981515ddff801515de1a2030001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 22:10:46', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981515de34201515de387c50001', '402882be46404313014640b7eb1c000f', '1', '2015-12-01 22:12:51', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65165d87f015165d950510001', '402882be46404313014640b7eb1c000f', '1', '2015-12-03 11:18:39', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6516605f3015166066fc70001', '402882be46404313014640b7eb1c000f', '1', '2015-12-03 12:07:56', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65166551401516655ac1e0001', '402882be46404313014640b7eb1c000f', '1', '2015-12-03 13:34:29', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6516655140151665791a20002', '402882be46404313014640b7eb1c000f', '1', '2015-12-03 13:36:33', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65166551401516658783f0003', '402882be46404313014640b7eb1c000f', '1', '2015-12-03 13:37:32', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e651665514015166591a550004', '402882be46404313014640b7eb1c000f', '1', '2015-12-03 13:38:14', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6516655140151665ced840005', '402882be46404313014640b7eb1c000f', '1', '2015-12-03 13:42:24', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6516655140151665d55850006', '402882be46404313014640b7eb1c000f', '1', '2015-12-03 13:42:51', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6516655140151667be7640007', '402882be46404313014640b7eb1c000f', '1', '2015-12-03 14:16:14', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e6516698dc0151669c26350001', '402882be46404313014640b7eb1c000f', '1', '2015-12-03 14:51:28', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6516698dc0151669ca9500002', '402882be46404313014640b7eb1c000f', '1', '2015-12-03 14:52:01', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6516698dc0151669f2f470003', '402882be46404313014640b7eb1c000f', '1', '2015-12-03 14:54:47', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e6516698dc015166a382280004', '402882be46404313014640b7eb1c000f', '1', '2015-12-03 14:59:30', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6516af5a901516af688530001', '402882be46404313014640b7eb1c000f', '1', '2015-12-04 11:08:40', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6516b039e01516b051d9b0001', '402882be46404313014640b7eb1c000f', '1', '2015-12-04 11:24:36', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e6516b039e01516b0fb49d0002', '402882be46404313014640b7eb1c000f', '1', '2015-12-04 11:36:10', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e6516b039e01516b13f3dd0003', '402882be46404313014640b7eb1c000f', '1', '2015-12-04 11:40:48', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e6516b809701516b8158d70001', '402882be46404313014640b7eb1c000f', '1', '2015-12-04 13:40:17', '1', '用户：super登录成功', '192.168.7.102', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887e6516b809701516b922c930002', '402882be46404313014640b7eb1c000f', '1', '2015-12-04 13:58:40', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6516b99c301516b9dd0c10001', '402882be46404313014640b7eb1c000f', '1', '2015-12-04 14:11:23', '1', '用户：super登录成功', '192.168.7.102', 'Safari');
INSERT INTO `sys_log` VALUES ('402887e6516b99c301516ba2d0db0002', '402882be46404313014640b7eb1c000f', '1', '2015-12-04 14:16:51', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e6516b99c301516ba3fa490003', '402882be46404313014640b7eb1c000f', '1', '2015-12-04 14:18:07', '5', '货号: null更新成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e652347e2c0152347ec3e30001', '402882be46404313014640b7eb1c000f', '1', '2016-01-12 14:21:08', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e652347e2c01523482e4fb0002', '402882be46404313014640b7eb1c000f', '1', '2016-01-12 14:25:39', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e652347e2c0152348c5a0c0003', '402882be46404313014640b7eb1c000f', '1', '2016-01-12 14:35:59', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e652347e2c0152349047100004', '402882be46404313014640b7eb1c000f', '1', '2016-01-12 14:40:16', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e652347e2c015234b782df0005', '402882be46404313014640b7eb1c000f', '1', '2016-01-12 15:23:07', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65234ceb1015234cf51a80001', '402882be46404313014640b7eb1c000f', '1', '2016-01-12 15:49:08', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65234d7ed015234d9ca8c0001', '402882be46404313014640b7eb1c000f', '1', '2016-01-12 16:00:34', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65234f7ed015234f9ed650001', '402882be46404313014640b7eb1c000f', '1', '2016-01-12 16:35:40', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65235073801523507b14b0001', '402882be46404313014640b7eb1c000f', '1', '2016-01-12 16:50:42', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65235126e015235130f5e0001', '402882be46404313014640b7eb1c000f', '1', '2016-01-12 17:03:07', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e65235141e01523514d77e0001', '402882be46404313014640b7eb1c000f', '1', '2016-01-12 17:05:04', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887e652351ce30152351f45a20001', '402882be46404313014640b7eb1c000f', '1', '2016-01-12 17:16:27', '1', '用户：super登录成功', '192.168.7.102', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702523f350901523f3597b80001', '402882be46404313014640b7eb1c000f', '1', '2016-01-14 16:17:02', '1', '用户：super登录成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9815292c26b015292c4548d0001', '402882be46404313014640b7eb1c000f', '1', '2016-01-30 21:41:26', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815292c26b015292d2620b0003', '402882be46404313014640b7eb1c000f', '1', '2016-01-30 21:56:47', '5', '订单(编号:2015060004)下的产品: 23321更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815292e84b015292e8fd6c0001', '402882be46404313014640b7eb1c000f', '1', '2016-01-30 22:21:28', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529701d10152970316b00001', '402882be46404313014640b7eb1c000f', '1', '2016-01-31 17:28:28', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529701d10152970493e90002', '402882be46404313014640b7eb1c000f', '1', '2016-01-31 17:30:05', '1', '用户：super登录成功', '192.168.89.1', 'Safari');
INSERT INTO `sys_log` VALUES ('4028d981529701d101529706e5c70006', '402882be46404313014640b7eb1c000f', '1', '2016-01-31 17:32:37', '3', '订单ID: 4028d9815075b466015075bfa2720004下的产品包括及其订单信息插入成功', '192.168.89.1', 'Safari');
INSERT INTO `sys_log` VALUES ('4028d981529701d10152970944330007', '402882be46404313014640b7eb1c000f', '1', '2016-01-31 17:35:12', '5', '订单ID: 4028d9815075b466015075bfa2720004更新成功', '192.168.89.1', 'Safari');
INSERT INTO `sys_log` VALUES ('4028d981529701d101529711d3330009', '402882be46404313014640b7eb1c000f', '1', '2016-01-31 17:44:33', '5', '产品: 包括更新成功', '192.168.89.1', 'Safari');
INSERT INTO `sys_log` VALUES ('4028d981529701d10152971dbb55000a', '402882be46404313014640b7eb1c000f', '1', '2016-01-31 17:57:34', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529701d101529769e856000b', '402882be46404313014640b7eb1c000f', '1', '2016-01-31 19:20:46', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152978e820152978fe30d0001', '402882be46404313014640b7eb1c000f', '1', '2016-01-31 20:02:15', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529a62a601529a698cb30001', '402882be46404313014640b7eb1c000f', '1', '2016-02-01 09:19:14', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529a62a601529a6b8d560002', '402882be46404313014640b7eb1c000f', '1', '2016-02-01 09:21:25', '1', '用户：super登录成功', '192.168.89.1', 'Safari');
INSERT INTO `sys_log` VALUES ('4028d981529b18f101529b1a67bd0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-01 12:32:24', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529b18f101529b1d05690003', '402882be46404313014640b7eb1c000f', '1', '2016-02-01 12:35:16', '3', '菜单: 采购单管理插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529b18f101529b1f7f4500f4', '402882be46404313014640b7eb1c000f', '1', '2016-02-01 12:37:58', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529b18f101529b225d4800f5', '402882be46404313014640b7eb1c000f', '1', '2016-02-01 12:41:06', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529b18f101529b23b8b60177', '402882be46404313014640b7eb1c000f', '1', '2016-02-01 12:42:35', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529b247901529b24efac0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-01 12:43:55', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529b247901529b26940f0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-01 12:45:42', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d981529b247901529b2d00330004', '402882be46404313014640b7eb1c000f', '1', '2016-02-01 12:52:43', '3', '权限: 采购制单插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529b247901529b2e3f3b0006', '402882be46404313014640b7eb1c000f', '1', '2016-02-01 12:54:05', '3', '权限: 采购单编辑插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529b247901529b2ef67b0008', '402882be46404313014640b7eb1c000f', '1', '2016-02-01 12:54:52', '3', '权限: 采购单删除插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529b247901529b2f6da2000a', '402882be46404313014640b7eb1c000f', '1', '2016-02-01 12:55:22', '3', '权限: 采购单刷新插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529b247901529b42cb8d000b', '402882be46404313014640b7eb1c000f', '1', '2016-02-01 13:16:32', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529b43b001529b4406850001', '402882be46404313014640b7eb1c000f', '1', '2016-02-01 13:17:52', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529b43b001529b45120c0087', '402882be46404313014640b7eb1c000f', '1', '2016-02-01 13:19:01', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529bbf4e01529bc0064b0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-01 15:33:18', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529bbf4e01529bc0d6030002', '402882be46404313014640b7eb1c000f', '1', '2016-02-01 15:34:12', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d981529bec3801529becf4420001', '402882be46404313014640b7eb1c000f', '1', '2016-02-01 16:22:23', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529f87b301529f891c530001', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 09:11:48', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529fe0a701529fe325730001', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 10:50:09', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529fe60101529fe65ddc0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 10:53:40', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529fec4b01529fecaef20001', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 11:00:34', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529fec4b01529fecdd320003', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 11:00:46', '3', '订单ID: null插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981529fec4b01529ff111310005', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 11:05:21', '3', '订单ID: null插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a06ec00152a06f89150001', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 13:23:30', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a12e1dc90001', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 16:51:40', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a131efa20003', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 16:55:50', '3', '菜单: 物料管理插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a132f3470004', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 16:56:56', '5', '菜单: 分类管理更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a13680420005', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:00:49', '5', '权限: 取消更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a13691c60006', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:00:54', '5', '权限: 编辑更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a136a1e60007', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:00:58', '5', '权限: 删除更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a136b8b00008', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:01:04', '5', '权限: 新增更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a136e4ed0009', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:01:15', '5', '权限: 编辑更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a136ff90000a', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:01:22', '5', '权限: 删除更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a1370dfa000b', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:01:25', '5', '权限: 新增更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a13821a3000d', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:02:36', '3', '权限: 物料新增插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a13952f9000f', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:03:54', '3', '权限: 物料编辑插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a139f18d0011', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:04:35', '3', '权限: 物料删除插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a13aeb410013', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:05:39', '3', '权限: 取消插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a13b59f70014', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:06:07', '5', '权限: 仓库启用更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a13bc18f0016', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:06:33', '3', '权限: 启用插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a13c51a00018', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:07:10', '3', '权限: 禁用插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a13ef2b7001a', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:10:03', '3', '权限: 物料编辑提交插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a142c293001b', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:14:13', '5', '权限: 启用更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a142f34a001c', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:14:25', '5', '权限: 禁用更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a1431dda001d', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:14:36', '5', '权限: 启用更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a143446b001e', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:14:46', '5', '权限: 添加产品分类更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a14352f2001f', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:14:49', '5', '权限: 去除产品分类更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a143b4ec0020', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:15:15', '5', '权限: 保存更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a1443fe20021', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:15:50', '5', '权限: 保存更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a12d8f0152a1450c710022', '402882be46404313014640b7eb1c000f', '1', '2016-02-02 17:16:42', '5', '权限: 物料保存更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a4ae660152a4c7fa870001', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 09:38:35', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a4ae660152a4cad8fe0090', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 09:41:43', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a4cb730152a4cbb6ff0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 09:42:40', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a4cb730152a4cd65fd0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 09:44:30', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a4cb730152a4ded57b0003', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 10:03:33', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a4ed690152a4eee1f60001', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 10:21:04', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a4eff80152a4f06e560001', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 10:22:46', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a4f3240152a4f3ad9d0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 10:26:19', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a4fcb90152a4fd2d800001', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 10:36:41', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a4fcb90152a4fdcb3c0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 10:37:22', '3', '物料： 157g双铜纸插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a4fcb90152a4fe545f0003', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 10:37:57', '5', '物料ID：1禁用成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a4fcb90152a4fe62470004', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 10:38:00', '5', '物料ID：1启用成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a504e40152a505cb6b0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 10:46:06', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a504e40152a505f1680002', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 10:46:16', '4', '物料ID：1删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a504e40152a50651d30003', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 10:46:40', '3', '物料： 19.1插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a508491f0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 10:48:49', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a50867fc0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 10:48:57', '5', '物料ID：2禁用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a50873200003', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 10:49:00', '5', '物料ID：2启用成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a50882e20004', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 10:49:04', '4', '物料ID：2删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a515fde60005', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:03:47', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a5163a040006', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:04:03', '3', '分类： 纸张插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a5164a3f0007', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:04:07', '5', '分类ID：1禁用成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a51661670008', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:04:13', '5', '分类ID：1启用成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a51790630009', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:05:30', '5', '分类ID：1禁用成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a5192c03000a', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:07:16', '5', '分类ID：1启用成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a519459f000b', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:07:22', '4', '分类ID：1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a5196d45000c', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:07:33', '3', '分类： 纸张插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a519a1fc000d', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:07:46', '3', '分类： 纸张1插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a51b7c6d000e', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:09:48', '5', '分类: 纸张22更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a51c7764000f', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:10:52', '4', '分类ID：2删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a51c77710010', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:10:52', '4', '分类ID：3删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a51d624c0011', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:11:52', '3', '分类： 得得得插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a51d95b40012', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:12:05', '3', '分类： 211插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a51dc1060013', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:12:16', '5', '分类ID：5禁用成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a51dc1120014', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:12:16', '5', '分类ID：4禁用成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a51dca4b0015', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:12:19', '5', '分类ID：4启用成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a51dca540016', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:12:19', '5', '分类ID：5启用成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a51de6f80017', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:12:26', '4', '分类ID：4删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a51de7020018', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:12:26', '4', '分类ID：5删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a524f6530019', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:20:09', '3', '分类： 11插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a507210152a526dc09001a', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 11:22:13', '3', '物料： 特种纸插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a555b50152a557cca00001', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 12:15:40', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a555b50152a59b3f360002', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 13:29:20', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a555b50152a59f13f40003', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 13:33:32', '3', '分类： 222插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a555b50152a5a211f70004', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 13:36:48', '3', '物料： 普通纸插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a555b50152a5a4da6e0005', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 13:39:50', '4', '物料ID：4删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a555b50152a5a4da8a0006', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 13:39:50', '4', '物料ID：3删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a555b50152a5a50a120007', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 13:40:02', '4', '分类ID：6删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a555b50152a5a50a1c0008', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 13:40:02', '4', '分类ID：7删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a555b50152a5a552970009', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 13:40:21', '3', '分类： 普通纸插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a555b50152a5a57a57000a', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 13:40:31', '3', '分类： 特种纸插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a555b50152a5a5a689000b', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 13:40:42', '3', '分类： 其他插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a555b50152a5a944f6000c', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 13:44:39', '3', '分类： 油墨插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a555b50152a5a9fac0000d', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 13:45:26', '3', '物料： 157双铜纸插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a555b50152a5aaba0b000e', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 13:46:15', '3', '物料： 牛皮纸插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a5bc5a0152a5bceedf0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 14:06:08', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a5bc5a0152a5bd3c7a0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 14:06:28', '5', '物料: 牛皮纸更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a5bc5a0152a5bd501b0003', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 14:06:33', '5', '物料: 牛皮纸更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a5bc5a0152a5bf31000005', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 14:08:36', '3', '生产厂家： 小毛插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a5bc5a0152a5bfcd220007', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 14:09:16', '3', '厂家:小毛的外协回执单: 4028d98152a5bc5a0152a5bfcce20006插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a5bc5a0152a5c61c600008', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 14:16:10', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a5bc5a0152a5dc5d250009', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 14:40:28', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a5bc5a0152a5ddf7de000a', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 14:42:13', '5', '厂家:小毛的外协回执单: 4028d98152a5bc5a0152a5bfcce20006更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a5bc5a0152a6066292000b', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 15:26:22', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a5bc5a0152a6125a3d000c', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 15:39:26', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a61c150152a61cd8c80001', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 15:50:54', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a6217e0152a62290f40001', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 15:57:09', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a6217e0152a62ac7280002', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 16:06:07', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152a62e9f0152a62f11eb0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 16:10:48', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152a630720152a630eeea0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-03 16:12:50', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252aaec360152aafe7aa30001', '402882be46404313014640b7eb1c000f', '1', '2016-02-04 14:35:50', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252ab43850152ab4404300001', '402882be46404313014640b7eb1c000f', '1', '2016-02-04 15:51:47', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252ab43850152ab4485d40003', '402882be46404313014640b7eb1c000f', '1', '2016-02-04 15:52:20', '3', '生产厂家： 333插入成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252ab43850152ab44a4df0005', '402882be46404313014640b7eb1c000f', '1', '2016-02-04 15:52:28', '3', '厂家:333的外协回执单: 4028870252ab43850152ab44a4aa0004插入成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252ab47f10152ab484dc60001', '402882be46404313014640b7eb1c000f', '1', '2016-02-04 15:56:28', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252ab47f10152ab48700e0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-04 15:56:37', '4', '生产厂家ID：4028870252ab43850152ab4485340002及相关信息删除成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252ab47f10152ab5057870003', '402882be46404313014640b7eb1c000f', '1', '2016-02-04 16:05:15', '5', '菜单: 厂家管理更新成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252ab47f10152ab7a385e0004', '402882be46404313014640b7eb1c000f', '1', '2016-02-04 16:50:59', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af0c990152af0dc7500001', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 09:31:01', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af0c990152af0f4aa00002', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 09:32:40', '1', '用户：super登录成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028870252af0c990152af115f940003', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 09:34:57', '1', '用户：super登录成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028870252af0c990152af1df07b0004', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 09:48:40', '1', '用户：super登录成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028870252af0c990152af1fd64f0005', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 09:50:45', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af0c990152af248f090006', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 09:55:54', '1', '用户：super登录成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028870252af460c0152af47cc480001', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 10:34:24', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af460c0152af480ef30002', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 10:34:41', '5', '生产厂家: 22更新成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af460c0152af4827c60003', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 10:34:47', '5', '生产厂家: 小毛更新成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af460c0152af495a0f0005', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 10:36:06', '3', '生产厂家： 小陈-辅料插入成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af460c0152af499b7f0006', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 10:36:22', '5', '生产厂家: 小陈-辅料更新成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af4a960152af4af2d90001', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 10:37:50', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af4a960152af4b41490002', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 10:38:10', '5', '生产厂家: 小陈-辅料更新成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af4a960152af4d98cd0003', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 10:40:44', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af4a960152af4eb0e60004', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 10:41:55', '1', '用户：super登录成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028870252af4a960152af5d66a30005', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 10:57:59', '5', '订单ID: 4028d981529fec4b01529ff111230004更新成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af4a960152af643b4e0006', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 11:05:27', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af4a960152af6a9ad70007', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 11:12:25', '5', '厂家ID：4028870252af460c0152af495a000004禁用成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af4a960152af6b10800008', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 11:12:55', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af4a960152af6b45ce0009', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 11:13:09', '5', '厂家ID：4028870252af460c0152af495a000004启用成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af4a960152af6e24f2000a', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 11:16:17', '5', '客户: null更新成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af4a960152af6e4804000b', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 11:16:26', '5', '客户: null更新成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af4a960152af6fd497000c', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 11:18:07', '5', '仓库: 本地仓库更新成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af4a960152af6ff76f000d', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 11:18:16', '5', '仓库: 本地仓库更新成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870252af4a960152af715c70000e', '402882be46404313014640b7eb1c000f', '1', '2016-02-05 11:19:48', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152dd3e9b0152dd3f500e0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-14 08:47:40', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152dd4acf0152dd4b30950001', '402882be46404313014640b7eb1c000f', '1', '2016-02-14 09:00:38', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152e860080152e86092be0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-16 12:39:49', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152e860080152e869367d00a0', '402882be46404313014640b7eb1c000f', '1', '2016-02-16 12:49:15', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152e860080152e86ab6a90115', '402882be46404313014640b7eb1c000f', '1', '2016-02-16 12:50:53', '3', '用户: xw插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152e860080152e86b57720117', '4028d98152e860080152e86ab6740114', '1', '2016-02-16 12:51:34', '1', '用户：xw登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152e860080152e87045fc0118', '402882be46404313014640b7eb1c000f', '1', '2016-02-16 12:56:58', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152e860080152e8709fe20119', 'f36328d24baff4d1014baff87a660012', '1', '2016-02-16 12:57:21', '1', '用户：zqh登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152ecc9f50152ecca94f40001', '402882be46404313014640b7eb1c000f', '1', '2016-02-17 09:14:05', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152ecc9f50152eccbdc070002', '4028d98152e860080152e86ab6740114', '1', '2016-02-17 09:15:29', '1', '用户：xw登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f1f6aa0152f1fa232a0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 09:24:08', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f204580152f20502cc0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 09:36:00', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f219a00152f21a5d950001', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 09:59:20', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f21fcb0152f22066af0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 10:05:55', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f221e00152f222315a0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 10:07:53', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f223600152f223cb450001', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 10:09:38', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f230980152f23100a60001', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 10:24:03', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f235b50152f235fdfc0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 10:29:30', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f238a30152f2390a8a0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 10:32:50', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f238a30152f239751d0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 10:33:17', '8', '数据库备份成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f23ab50152f23ae16f0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 10:34:51', '8', '数据库备份成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f23ab50152f23b29bb0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 10:35:09', '8', '数据库备份成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f23ab50152f23bdb960003', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 10:35:55', '8', '数据库备份成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f266950152f268741e0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 11:24:37', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f266950152f2695aea0003', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 11:25:36', '5', '产品: 包括更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f266950152f26fa4b50004', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 11:32:28', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152f283c40152f28425120001', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 11:54:52', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f28ea50152f28f25200001', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 12:06:53', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f2b0290152f2b0c00a0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 12:43:35', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f2b0290152f2b1c8450002', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 12:44:43', '5', '产品: 2332134更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f2b0290152f2b2ff160004', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 12:46:03', '5', '订单(编号:2015100001)下的产品: 2332134更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f2b0290152f2b6b6600005', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 12:50:06', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152f2b0290152f2bab22e0006', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 12:54:27', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f2c3e80152f2c4bc320001', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 13:05:25', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152f2c3e80152f2c597ed0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 13:06:21', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f2e2970152f2e332420001', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 13:38:41', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f2e2970152f2e9e4d70002', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 13:46:00', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152f2ee920152f2f990390001', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 14:03:07', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f2ee920152f2fd04670002', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 14:06:54', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152f2ee920152f30dba3e0003', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 14:25:09', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f2ee920152f3167d0f0004', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 14:34:43', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f2ee920152f318f7c90005', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 14:37:25', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f451070152f45168910001', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 20:18:41', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f451070152f4b2a3d30002', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 22:04:54', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f451070152f4b4a9690003', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 22:07:06', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f451070152f4c255bf0004', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 22:22:02', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98152f451070152f4c76b440005', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 22:27:35', '1', '用户：super登录成功', '192.168.89.1', 'Safari');
INSERT INTO `sys_log` VALUES ('4028d98152f451070152f4d051b10007', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 22:37:19', '3', '订单ID: 4028d981529fec4b01529ff111230004下的产品知道及其订单信息插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f4e18f0152f4e2412d0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 22:56:54', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f4e18f0152f4f81ca80002', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 23:20:47', '5', '产品: 知道更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f4e18f0152f4f959270003', '402882be46404313014640b7eb1c000f', '1', '2016-02-18 23:22:08', '8', '数据库备份成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f9b44e0152f9b4d4180001', '402882be46404313014640b7eb1c000f', '1', '2016-02-19 21:25:23', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f9c24f0152f9c27fe00001', '402882be46404313014640b7eb1c000f', '1', '2016-02-19 21:40:19', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f9c24f0152f9c3e5000002', '402882be46404313014640b7eb1c000f', '1', '2016-02-19 21:41:50', '8', '数据库备份成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f9c24f0152f9ca3f480003', '402882be46404313014640b7eb1c000f', '1', '2016-02-19 21:48:47', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f9c24f0152f9ca85b80004', '402882be46404313014640b7eb1c000f', '1', '2016-02-19 21:49:05', '8', '数据库备份成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152f9c24f0152f9caf8c60005', '402882be46404313014640b7eb1c000f', '1', '2016-02-19 21:49:34', '8', '图片备份成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152fa123b0152fa12a0080001', '402882be46404313014640b7eb1c000f', '1', '2016-02-19 23:07:50', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152fa123b0152fa1493aa0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-19 23:09:58', '3', '采购计划单ID: 2016020001插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152fa18c70152fa1a50480001', '402882be46404313014640b7eb1c000f', '1', '2016-02-19 23:16:14', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152fa18c70152fa1aca5c0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-19 23:16:45', '3', '采购计划单ID: 2016020002插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152fa18c70152fa1e74c10003', '402882be46404313014640b7eb1c000f', '1', '2016-02-19 23:20:46', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152fa2c470152fa2d10300001', '402882be46404313014640b7eb1c000f', '1', '2016-02-19 23:36:43', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152fa303a0152fa309e4e0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-19 23:40:36', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98152fd5a460152fd5a9ffa0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-20 14:25:20', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530772ab0153077363890001', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 13:28:35', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887025307762b0153077675360001', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 13:31:57', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887025307762b0153077b66240002', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 13:37:20', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887025307817201530781c9490001', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 13:44:19', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530782bb015307831ca40001', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 13:45:46', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530785b001530785dff60001', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 13:48:47', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887025307868301530786b2780001', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 13:49:41', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870253078729015307875d910001', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 13:50:25', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530787290153078920140002', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 13:52:20', '1', '用户：super登录成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('40288702530787290153079722fd0004', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 14:07:38', '3', '权限: 新增插入成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('40288702530787290153079799580006', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 14:08:09', '3', '权限: 编辑插入成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887025307872901530797fe1e0008', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 14:08:34', '3', '权限: 删除插入成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028870253078729015307987876000a', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 14:09:06', '3', '权限: 验收插入成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887025307872901530798bae7000c', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 14:09:23', '3', '权限: excel导出插入成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887025307992d0153079994880001', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 14:10:18', '1', '用户：super登录成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887025307992d0153079bd2d30002', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 14:12:45', '1', '用户：super登录成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887025307992d0153079c8e460096', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 14:13:33', '1', '用户：super登录成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887025307992d015307a2300c0097', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 14:19:42', '1', '用户：super登录成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('402887025307992d015307a86a6b0098', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 14:26:31', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153098b6e0153098e91220001', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 23:17:31', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530992c401530993087b0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 23:22:24', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530992c40153099420910002', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 23:23:35', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d981530992c4015309ac49690003', '402882be46404313014640b7eb1c000f', '1', '2016-02-22 23:49:59', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9815309e5c9015309e6d6e50001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 00:53:56', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9815309e5c9015309eb0aa30002', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 00:58:31', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530a00ee01530a0751a60001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 01:29:25', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530a0bde01530a0c48730001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 01:34:50', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530a0bde01530a0d99fc0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 01:36:16', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530a10fd01530a11533c0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 01:40:20', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530a142401530a1454d90001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 01:43:37', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530a142401530a14accf0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 01:44:00', '3', '采购单(2016020001)下的货号： 1插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530baebc01530bba8ba40001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 09:24:48', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530baebc01530bbc5c7e0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 09:26:47', '1', '用户：super登录成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('40288702530bedec01530bee948f0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 10:21:38', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530bf1fa01530bf23b6f0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 10:25:37', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530bf2cd01530bf342170001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 10:26:44', '3', '采购单(2016020001)下的货号： 2插入成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530bf2cd01530bf7dbcc0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 10:31:46', '3', '采购单(2016020001)下的货号： 3插入成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530bfd0401530bfd328e0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 10:37:36', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530bff8901530bffbc440001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 10:40:22', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c081101530c08a7220001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 10:50:06', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c139801530c14439c0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 11:02:47', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c157b01530c1648520001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 11:05:00', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c183901530c189c640001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 11:07:32', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c183901530c18dee90002', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 11:07:49', '4', '采购单(2016020001)下的货号：3删除成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c183901530c191c300003', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 11:08:05', '4', '采购单(2016020001)下的货号：2删除成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c33d401530c343ab40001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 11:37:42', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c33d401530c36865a0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 11:40:13', '3', '采购单(2016020001)下的货号： 4插入成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c33d401530c397f440003', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 11:43:28', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c33d401530c39e0600004', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 11:43:52', '1', '用户：super登录成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('40288702530c3ffb01530c4090460001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 11:51:11', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c3ffb01530c4484c10002', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 11:55:30', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c3ffb01530c454d560003', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 11:56:21', '1', '用户：super登录成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('40288702530c3ffb01530c4b45140004', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 12:02:52', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c3ffb01530c809c3d0005', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 13:01:08', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c3ffb01530c83b2fb0006', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 13:04:30', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c3ffb01530c8450400007', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 13:05:11', '4', '采购单(2016020001)下的物料：(157双铜纸,牛皮纸) 验收成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c3ffb01530c8573a10008', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 13:06:25', '3', '采购单(2016020001)下的货号： 5插入成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c3ffb01530c8785b50009', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 13:08:41', '3', '采购单(2016020002)下的货号： 6插入成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c3ffb01530c9317ac000a', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 13:21:19', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c3ffb01530c99ccd6000b', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 13:28:39', '3', '采购单(2016020001)下的货号： 7插入成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c3ffb01530c9a062d000c', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 13:28:54', '4', '采购单(2016020001)下的货号：7删除成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c3ffb01530c9a2529000d', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 13:29:01', '3', '采购单(2016020001)下的货号： 8插入成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c3ffb01530c9a3812000e', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 13:29:06', '4', '采购单(2016020001)下的货号：5删除成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530c3ffb01530c9a388b000f', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 13:29:06', '4', '采购单(2016020001)下的货号：8删除成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530ca24901530ca536510001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 13:41:07', '1', '用户：super登录成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('40288702530ca24901530cdd06560002', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 14:42:05', '1', '用户：super登录成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('40288702530ca24901530d39cf0d0003', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 16:23:25', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530ca24901530d4aec400004', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 16:42:07', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530ca24901530d6c93320005', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 17:18:52', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530d7e5e01530d7ec4ef0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 17:38:45', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('40288702530d7e5e01530d86d55f0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 17:47:33', '1', '用户：super登录成功', '192.168.7.130', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d981530e17af01530e2e26e60001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 20:50:18', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530e17af01530e30df610002', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 20:53:17', '4', '采购单(2016020002)下的物料：(157双铜纸) 验收成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530e654401530e6597c90001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 21:50:52', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530e90f101530e915ec60001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 22:38:41', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530e90f101530e91e1e20002', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 22:39:14', '3', '采购单(2016020002)下的货号： 7插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530e97d301530e9870940001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 22:46:24', '3', '采购单(2016020002)下的货号： 8插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530e97d301530e9889ab0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 22:46:31', '4', '采购单(2016020002)下的货号：7删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530e97d301530e9889bc0003', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 22:46:31', '4', '采购单(2016020002)下的货号：8删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530e97d301530e9972bc0004', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 22:47:30', '3', '采购单(2016020002)下的货号： 9插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530e97d301530e99c34b0005', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 22:47:51', '3', '采购单(2016020002)下的货号： 10插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530e97d301530e9a27ae0006', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 22:48:17', '3', '采购单(2016020002)下的货号： 11插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530e97d301530e9a27af0007', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 22:48:17', '3', '采购单(2016020002)下的货号： 12插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530e97d301530e9abaac0008', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 22:48:54', '4', '采购单(2016020002)下的货号：11删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530e97d301530e9ae63f0009', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 22:49:05', '4', '采购单(2016020002)下的货号：10删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530e97d301530e9af86a000a', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 22:49:10', '4', '采购单(2016020002)下的货号：12删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530e97d301530e9b0acf000b', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 22:49:15', '4', '采购单(2016020002)下的货号：9删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530e97d301530e9c7dce000c', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 22:50:50', '3', '采购单(2016020002)下的货号： 13插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ea18401530ea27d610001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 22:57:23', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ea18401530ea358660002', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 22:58:19', '5', '采购单(2016020002)下的货号: 13更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ea18401530ea401e40003', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 22:59:02', '3', '采购单(2016020002)下的货号： 14插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ea18401530ea469080004', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 22:59:29', '4', '采购单(2016020002)下的货号：14删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ea18401530ea469150005', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 22:59:29', '4', '采购单(2016020002)下的货号：13删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ebead01530ebef68c0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 23:28:29', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ebead01530ebfaf0f0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 23:29:16', '5', '采购计划单ID: 2016020002更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ebead01530ebfdfbf0003', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 23:29:29', '5', '采购计划单ID: 2016020002更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ebead01530ec042a00004', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 23:29:54', '5', '采购计划单ID: 2016020002更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ebead01530ec070930005', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 23:30:06', '5', '采购计划单ID: 2016020002更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ebead01530ec5374d0006', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 23:35:19', '5', '采购计划单ID: 2016020002更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ebead01530ec65f3e0007', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 23:36:34', '5', '采购计划单ID: 2016020002更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ec80801530ec856b30001', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 23:38:43', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ec80801530ecd00710002', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 23:43:49', '5', '采购计划单ID: 2016020002更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ec80801530ecd3cad0003', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 23:44:04', '5', '采购计划单ID: 2016020002更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ec80801530ecd91a70004', '402882be46404313014640b7eb1c000f', '1', '2016-02-23 23:44:26', '3', '采购计划单ID: 2016020003插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ee27101530ee3249c0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-24 00:08:00', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ee27101530ee369f10002', '402882be46404313014640b7eb1c000f', '1', '2016-02-24 00:08:18', '4', '采购单(：2016020003)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ee27101530ee399950003', '402882be46404313014640b7eb1c000f', '1', '2016-02-24 00:08:30', '4', '采购单(：2016020001)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ee27101530ee3e0b20004', '402882be46404313014640b7eb1c000f', '1', '2016-02-24 00:08:48', '4', '采购单(：2016020002)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ee27101530ee4c7d10005', '402882be46404313014640b7eb1c000f', '1', '2016-02-24 00:09:47', '3', '采购计划单ID: 2016020001插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ee27101530ee540270006', '402882be46404313014640b7eb1c000f', '1', '2016-02-24 00:10:18', '3', '采购单(2016020001)下的货号： 15插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ee27101530ee5b6930007', '402882be46404313014640b7eb1c000f', '1', '2016-02-24 00:10:48', '3', '采购单(2016020001)下的货号： 16插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ee27101530ee654820008', '402882be46404313014640b7eb1c000f', '1', '2016-02-24 00:11:29', '5', '采购计划单ID: 2016020001更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981530ef1d201530ef245c40001', '402882be46404313014640b7eb1c000f', '1', '2016-02-24 00:24:31', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815313c080015313c0e7640001', '402882be46404313014640b7eb1c000f', '1', '2016-02-24 22:48:42', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153140e740153140ed5e90001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 00:13:49', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981531420c10153142109d40001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 00:33:42', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981531420c1015314219bac0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 00:34:20', '3', '采购计划单ID: 2016020002插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981531420c101531421d2920003', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 00:34:34', '5', '采购计划单ID: 2016020002更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981531486ad0153148701320001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 02:25:05', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981531486ad015314878b9f0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 02:25:40', '3', '采购单(2016020002)下的货号： 17插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981531486ad01531487b12d0003', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 02:25:50', '5', '采购单(2016020002)下的货号: 17更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981531486ad01531487cd200004', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 02:25:57', '5', '采购单(2016020002)下的货号: 17更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153148d020153148d3fcd0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 02:31:54', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981531615ec01531616c4490001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 09:41:44', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153168c7e0153168daa1f0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 11:51:36', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153168c7e01531690a90c0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 11:54:52', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98153168c7e015316927b3b0003', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 11:56:51', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9815316c68f015316c6db730001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 12:54:04', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815316d986015316e3651e0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 13:25:14', '5', '采购计划单ID: 2016020002更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815316f41e015316f7a7840001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 13:47:22', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815316f41e015316f83ac50002', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 13:48:00', '3', '采购单(2016020002)下的货号： 18插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815316f41e015316f867690003', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 13:48:11', '3', '采购单(2016020002)下的货号： 19插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815316f41e015316f88daa0004', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 13:48:21', '3', '采购单(2016020002)下的货号： 20插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815316f41e015316f8a8850005', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 13:48:28', '3', '采购单(2016020002)下的货号： 21插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815316f41e015316f8ce210006', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 13:48:37', '3', '采购单(2016020002)下的货号： 22插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815316f41e015316f8e2010007', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 13:48:42', '3', '采购单(2016020002)下的货号： 23插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815316f41e015316f8f44d0008', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 13:48:47', '3', '采购单(2016020002)下的货号： 24插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815316f41e015316f9061a0009', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 13:48:52', '3', '采购单(2016020002)下的货号： 25插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815316f41e015316f91ac7000a', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 13:48:57', '3', '采购单(2016020002)下的货号： 26插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815316f41e015316f948c5000b', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 13:49:09', '3', '采购单(2016020002)下的货号： 27插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815316f41e015316f98d71000c', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 13:49:26', '3', '采购单(2016020002)下的货号： 28插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815316f41e015317182f7a000e', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 14:22:54', '3', '权限: 生成采购单插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815316f41e01531718b1bc00a3', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 14:23:27', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153174a910153174af7cf0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 15:18:22', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153174a910153174ba6f80002', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 15:19:07', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153174a910153175457a60003', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 15:28:36', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153174a9101531754e62d0005', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 15:29:13', '3', '权限: 更新供货厂家插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153174a910153175553c6009b', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 15:29:41', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153174a9101531755dadf009d', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 15:30:15', '3', '生产厂家： 华港纸业插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153174a910153175614bb009e', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 15:30:30', '4', '采购单(2016020002)下的物料：(157双铜纸,157双铜纸,牛皮纸) 更新为厂家(华港纸业)成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153174a910153175717d7009f', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 15:31:37', '4', '采购单(2016020002)下的物料：(157双铜纸,牛皮纸) 更新为厂家(华港纸业)成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153174a9101531757388f00a0', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 15:31:45', '4', '采购单(2016020002)下的物料：(157双铜纸) 验收成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153174a9101531760f5a700a1', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 15:42:23', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981531768b2015317692c0a0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 15:51:21', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815317907401531790aaf30001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 16:34:30', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981531790740153179357060003', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 16:37:25', '3', '菜单: 物料采购明细汇总插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153179074015317941423009a', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 16:38:13', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815317947201531794ad610001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 16:38:53', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815317a049015317a083580001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 16:51:48', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815317a049015317a7574a0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 16:59:16', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153181a6a0153181c535e0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 19:07:02', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153181a6a01531831e9d30003', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 19:30:37', '3', '生产厂家： 浙江省嘉兴市海盐县百步镇汉坊印刷有限公司插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153181a6a015318324b9d0004', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 19:31:02', '3', '采购单(2016020001)下的货号： 29插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153181a6a015318358ee10005', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 19:34:36', '4', '采购单(2016020001)下的物料：(157双铜纸) 更新为厂家(华港纸业)成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815318c088015318c0dde40001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 22:06:46', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815318c313015318c36d6b0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 22:09:34', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815318c313015318cd1eb00002', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 22:20:09', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815318d2b3015318d414680001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 22:27:45', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815318dbe0015318dc5fc60001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 22:36:48', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815318e4a0015318e6e8ce0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 22:48:19', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815318f2ea015318f34e420001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 23:01:51', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815318ff420153190bff140001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 23:28:49', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815318ff4201531910f15c0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 23:34:14', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98153191c0d0153191d3f1e0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 23:47:40', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815319254f015319257f920001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 23:56:41', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815319278201531927cd3c0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-25 23:59:12', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153192a290153192b66be0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-26 00:03:08', '5', '菜单: 物料采购明细汇总更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153192a290153192bc64a0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-26 00:03:32', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153192c350153192c93e40001', '402882be46404313014640b7eb1c000f', '1', '2016-02-26 00:04:25', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153193121015319316f990001', '402882be46404313014640b7eb1c000f', '1', '2016-02-26 00:09:43', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815319358a01531935d43f0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-26 00:14:31', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815319358a0153193629940002', '402882be46404313014640b7eb1c000f', '1', '2016-02-26 00:14:53', '5', '菜单: 物料采购明细汇总更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815319368a01531936ceef0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-26 00:15:35', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815319368a015319377ff50002', '402882be46404313014640b7eb1c000f', '1', '2016-02-26 00:16:20', '5', '菜单: 物料采购明细汇总更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981531937e60153193818f00001', '402882be46404313014640b7eb1c000f', '1', '2016-02-26 00:17:00', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153194cd00153194d4c2f0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-26 00:40:09', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815319512f0153195174330001', '402882be46404313014640b7eb1c000f', '1', '2016-02-26 00:44:41', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981531982cc0153198340bb0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-26 01:39:05', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153199f910153199ffec60001', '402882be46404313014640b7eb1c000f', '1', '2016-02-26 02:10:29', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815319a564015319a59d980001', '402882be46404313014640b7eb1c000f', '1', '2016-02-26 02:16:37', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815319ace2015319af0d9c0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-26 02:26:56', '4', '采购单(2016020002)下的物料：(牛皮纸,牛皮纸) 验收成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815319ace2015319b0c21f0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-26 02:28:47', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815320fab101532103e2df0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-27 12:36:56', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153215d5f0153216062160001', '402882be46404313014640b7eb1c000f', '1', '2016-02-27 14:17:57', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153215d5f0153216332060002', '402882be46404313014640b7eb1c000f', '1', '2016-02-27 14:21:02', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153215d5f0153216415630003', 'f36328d24baff4d1014baff87a660012', '1', '2016-02-27 14:22:00', '1', '用户：zqh登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153215d5f0153216873f90004', '402882be46404313014640b7eb1c000f', '1', '2016-02-27 14:26:46', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153215d5f0153217277610005', '402882be46404313014640b7eb1c000f', '1', '2016-02-27 14:37:43', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153215d5f015321761c6f0006', 'f36328d24baff4d1014baff87a660012', '1', '2016-02-27 14:41:41', '1', '用户：zqh登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153215d5f0153217c63920007', '402882be46404313014640b7eb1c000f', '1', '2016-02-27 14:48:33', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153215d5f0153218bcb760008', '402882be46404313014640b7eb1c000f', '1', '2016-02-27 15:05:23', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98153215d5f0153219ac0060009', '402882be46404313014640b7eb1c000f', '1', '2016-02-27 15:21:43', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153215d5f015321aab62e000a', '402882be46404313014640b7eb1c000f', '1', '2016-02-27 15:39:09', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153215d5f015321b0fdbf000b', '402882be46404313014640b7eb1c000f', '1', '2016-02-27 15:46:00', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153267de50153267e2ccb0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-28 14:08:36', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153267de50153268247800007', '402882be46404313014640b7eb1c000f', '1', '2016-02-28 14:13:05', '3', '产品： 5555插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153267de501532682b2ed0009', '402882be46404313014640b7eb1c000f', '1', '2016-02-28 14:13:33', '5', '订单(编号:2016020002)下的产品: 5555更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153267de501532682cf75000a', '402882be46404313014640b7eb1c000f', '1', '2016-02-28 14:13:40', '5', '订单ID: 4028d981529fec4b01529ff111230004更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153267de5015326840f790010', '402882be46404313014640b7eb1c000f', '1', '2016-02-28 14:15:02', '5', '产品: 5555更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981532687560153268abf3a0001', '402882be46404313014640b7eb1c000f', '1', '2016-02-28 14:22:20', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981532687560153273f5ed80002', '402882be46404313014640b7eb1c000f', '1', '2016-02-28 17:39:37', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153268756015327e9ce6f0003', '402882be46404313014640b7eb1c000f', '1', '2016-02-28 20:45:47', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981532822310153282e155c0002', '402882be46404313014640b7eb1c000f', '1', '2016-02-28 22:00:22', '3', '客户： 小三插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981532822310153282fa3590004', '402882be46404313014640b7eb1c000f', '1', '2016-02-28 22:02:03', '3', '客户： 122插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815328223101532833f9d60006', '402882be46404313014640b7eb1c000f', '1', '2016-02-28 22:06:48', '3', '客户： 444插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815328223101532835fb490008', '402882be46404313014640b7eb1c000f', '1', '2016-02-28 22:08:59', '3', '客户： 555插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153282231015328378394000a', '402882be46404313014640b7eb1c000f', '1', '2016-02-28 22:10:40', '3', '客户： 666插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981532822310153283be275000c', '402882be46404313014640b7eb1c000f', '1', '2016-02-28 22:15:26', '3', '客户： 999插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981532822310153283d3a29000e', '402882be46404313014640b7eb1c000f', '1', '2016-02-28 22:16:54', '3', '客户： 101插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981532822310153283dbb940010', '402882be46404313014640b7eb1c000f', '1', '2016-02-28 22:17:27', '3', '客户： 102插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153282231015328402dc10012', '402882be46404313014640b7eb1c000f', '1', '2016-02-28 22:20:08', '3', '客户： 201插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981533239800153323a8e660001', '402882be46404313014640b7eb1c000f', '1', '2016-03-01 20:50:11', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153323980015332578ed50003', '402882be46404313014640b7eb1c000f', '1', '2016-03-01 21:21:52', '3', '产品： 43434插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815332622201533266a6b60001', '402882be46404313014640b7eb1c000f', '1', '2016-03-01 21:38:21', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d981533262220153326959160002', '402882be46404313014640b7eb1c000f', '1', '2016-03-01 21:41:18', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d981533262220153326b4f6f0003', '402882be46404313014640b7eb1c000f', '1', '2016-03-01 21:43:26', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981533278e301533279339f0001', '402882be46404313014640b7eb1c000f', '1', '2016-03-01 21:58:37', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153327cb70153327d69f70001', '402882be46404313014640b7eb1c000f', '1', '2016-03-01 22:03:13', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887025335277d0153353924cd0001', '402882be46404313014640b7eb1c000f', '1', '2016-03-02 10:47:30', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887025335277d0153353a06bd0002', '402882be46404313014640b7eb1c000f', '1', '2016-03-02 10:48:28', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887025335277d0153353ba5c30003', '402882be46404313014640b7eb1c000f', '1', '2016-03-02 10:50:14', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887025335dab4015335dbb4ba0001', '402882be46404313014640b7eb1c000f', '1', '2016-03-02 13:45:04', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815341b9a8015341bb200b0001', '402882be46404313014640b7eb1c000f', '1', '2016-03-04 21:04:55', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815341b9a8015341f902560002', '402882be46404313014640b7eb1c000f', '1', '2016-03-04 22:12:31', '5', '物料: 牛皮纸更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815341b9a8015342664f800003', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 00:11:54', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9815345f434015345f483b10001', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 16:46:05', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815345f434015345ff22000003', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 16:57:41', '3', '客户： 12345插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815345f4340153460082210004', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 16:59:11', '3', '采购单(2016020001)下的货号： 30插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815346f510015346f75b2d0001', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 21:28:49', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815346f5100153470156d80002', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 21:39:43', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d981534731e301534732a4340001', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:33:34', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e3015347394b1d0002', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:40:50', '3', '采购单(2016020001)下的货号： 31插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e30153473960220003', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:40:55', '3', '采购单(2016020001)下的货号： 32插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e301534739641e0004', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:40:56', '3', '采购单(2016020001)下的货号： 33插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e3015347398b7e0005', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:41:06', '4', '采购单(2016020001)下的货号：32删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e3015347398b8d0006', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:41:06', '4', '采购单(2016020001)下的货号：33删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e301534739bb3d0007', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:41:19', '4', '采购单(2016020001)下的货号：31删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e30153473bbb660008', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:43:30', '5', '采购单(2016020002)下的货号: 27更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e30153473fac2f0009', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:47:48', '4', '采购单(2016020002)下的货号：22删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e30153473fac3e000a', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:47:48', '4', '采购单(2016020002)下的货号：23删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e30153473fac48000b', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:47:48', '4', '采购单(2016020002)下的货号：24删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e30153473fac52000c', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:47:48', '4', '采购单(2016020002)下的货号：25删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e30153473fac5b000d', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:47:48', '4', '采购单(2016020002)下的货号：26删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e30153473fc179000e', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:47:53', '4', '采购单(2016020002)下的货号：21删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e30153473fc183000f', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:47:53', '4', '采购单(2016020002)下的货号：27删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e30153473fc18d0010', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:47:53', '4', '采购单(2016020002)下的货号：28删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e30153474148e70011', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:49:34', '5', '采购单(2016020002)下的货号: 18更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e3015347430a900012', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:51:29', '3', '采购单(2016020002)下的货号： 34插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e3015347464e9a0013', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:55:03', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d981534731e30153474a83830014', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:59:39', '5', '采购单(2016020002)下的货号: 34更新成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d981534731e30153474ac4f20015', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:59:55', '3', '采购单(2016020002)下的货号： 35插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d981534731e30153474ad20e0016', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 22:59:59', '4', '采购单(2016020002)下的货号：35删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d981534731e30153474af2f60017', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 23:00:07', '3', '采购单(2016020002)下的货号： 36插入成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d981534731e30153474b00a50018', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 23:00:11', '4', '采购单(2016020002)下的货号：36删除成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d981534731e301534759c0eb0019', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 23:16:17', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e301534761bebe001a', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 23:25:01', '3', '采购单(2016020002)下的货号： 37插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e30153476231d0001b', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 23:25:30', '4', '物料ID：7删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e30153476231d8001c', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 23:25:30', '4', '物料ID：8删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534731e30153476231de001d', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 23:25:30', '4', '物料ID：9删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153477d070153477d60b30001', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 23:55:12', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153477d070153477d7ce00002', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 23:55:19', '4', '分类ID：8删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153477d070153477f87410003', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 23:57:33', '3', '分类： 普通纸插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153477d070153477fd9d70004', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 23:57:54', '5', '物料: 300克双铜纸更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153477d070153477ff57c0005', '402882be46404313014640b7eb1c000f', '1', '2016-03-05 23:58:01', '5', '物料: 157双铜纸更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153478efd015347b213e30001', '402882be46404313014640b7eb1c000f', '1', '2016-03-06 00:52:46', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d98153478efd015347b64fb70002', '402882be46404313014640b7eb1c000f', '1', '2016-03-06 00:57:23', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d98153478efd015347b91b780003', '402882be46404313014640b7eb1c000f', '1', '2016-03-06 01:00:26', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d981534a48a701534a48fce60001', '402882be46404313014640b7eb1c000f', '1', '2016-03-06 12:56:50', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534a48a701534a4b98cb0002', '402882be46404313014640b7eb1c000f', '1', '2016-03-06 12:59:41', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534a48a701534a528e880003', '402882be46404313014640b7eb1c000f', '1', '2016-03-06 13:07:17', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534a48a701534a5cf28c0005', '402882be46404313014640b7eb1c000f', '1', '2016-03-06 13:18:38', '3', '生产厂家： 小明插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534a48a701534a5f99010007', '402882be46404313014640b7eb1c000f', '1', '2016-03-06 13:21:32', '3', '生产厂家： 小王插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534a48a701534a63ac670009', '402882be46404313014640b7eb1c000f', '1', '2016-03-06 13:25:59', '3', '生产厂家： 小刘插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534a69b101534a69fccc0001', '402882be46404313014640b7eb1c000f', '1', '2016-03-06 13:32:53', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534a69b101534a6a13e90002', '402882be46404313014640b7eb1c000f', '1', '2016-03-06 13:32:59', '4', '生产厂家ID：4028d981534a48a701534a5cf2670004及相关信息删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534a69b101534a6a21a10003', '402882be46404313014640b7eb1c000f', '1', '2016-03-06 13:33:02', '4', '生产厂家ID：4028d981534a48a701534a63ac5f0008及相关信息删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534a69b101534a6a2e160004', '402882be46404313014640b7eb1c000f', '1', '2016-03-06 13:33:05', '4', '生产厂家ID：4028d981534a48a701534a5f98f80006及相关信息删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534a69b101534a6a49fe0005', '402882be46404313014640b7eb1c000f', '1', '2016-03-06 13:33:13', '4', '生产厂家ID：4028d98153181a6a01531831e98a0002及相关信息删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534a69b101534a6a7cba0006', '402882be46404313014640b7eb1c000f', '1', '2016-03-06 13:33:26', '4', '采购单(2016020002)下的货号：37删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534a69b101534a6e2d060007', '402882be46404313014640b7eb1c000f', '1', '2016-03-06 13:37:27', '5', '采购单(2016020001)下的货号: 29更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534a69b101534a6e46e90008', '402882be46404313014640b7eb1c000f', '1', '2016-03-06 13:37:34', '5', '采购单(2016020001)下的货号: 30更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981534a7ca501534a7d0ee20001', '402882be46404313014640b7eb1c000f', '1', '2016-03-06 13:53:43', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815365d4c5015365d5a2660001', '402882be46404313014640b7eb1c000f', '1', '2016-03-11 21:20:12', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815365d4c5015365d6aee30003', '402882be46404313014640b7eb1c000f', '1', '2016-03-11 21:21:21', '3', '生产厂家： 吴顺友物资插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815365d4c5015365d710dc0004', '402882be46404313014640b7eb1c000f', '1', '2016-03-11 21:21:46', '4', '采购单(2016020002)下的物料：(157双铜纸) 更新为厂家(吴顺友物资)成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815365d9d9015365da2e630001', '402882be46404313014640b7eb1c000f', '1', '2016-03-11 21:25:10', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815365d9d9015365f41d4e0002', '402882be46404313014640b7eb1c000f', '1', '2016-03-11 21:53:30', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981536edca301536edd78f00001', '402882be46404313014640b7eb1c000f', '1', '2016-03-13 15:25:21', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981536edca301536ee7001b0002', '402882be46404313014640b7eb1c000f', '1', '2016-03-13 15:35:45', '4', '生产厂家ID：4028d9814e346bd1014e352a0a81000f及相关信息删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981536edca301536eeeb83e0003', '402882be46404313014640b7eb1c000f', '1', '2016-03-13 15:44:11', '3', '采购单(2016020002)下的货号： 31插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981536edca301536eeededb0004', '402882be46404313014640b7eb1c000f', '1', '2016-03-13 15:44:21', '3', '采购单(2016020002)下的货号： 32插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981536edca301536eef073b0005', '402882be46404313014640b7eb1c000f', '1', '2016-03-13 15:44:32', '3', '采购单(2016020002)下的货号： 33插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981536edca301536eef3faf0006', '402882be46404313014640b7eb1c000f', '1', '2016-03-13 15:44:46', '3', '采购单(2016020002)下的货号： 34插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981536edca301536eef7f910007', '402882be46404313014640b7eb1c000f', '1', '2016-03-13 15:45:02', '3', '采购单(2016020002)下的货号： 35插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981536edca301536eefdc830008', '402882be46404313014640b7eb1c000f', '1', '2016-03-13 15:45:26', '4', '采购单(2016020002)下的货号：31删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981536edca301536eefdc930009', '402882be46404313014640b7eb1c000f', '1', '2016-03-13 15:45:26', '4', '采购单(2016020002)下的货号：32删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981536edca301536eefdc9e000a', '402882be46404313014640b7eb1c000f', '1', '2016-03-13 15:45:26', '4', '采购单(2016020002)下的货号：33删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981536edca301536eefdcab000b', '402882be46404313014640b7eb1c000f', '1', '2016-03-13 15:45:26', '4', '采购单(2016020002)下的货号：34删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981536edca301536eefdcba000c', '402882be46404313014640b7eb1c000f', '1', '2016-03-13 15:45:26', '4', '采购单(2016020002)下的货号：35删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887025372c0ce015372c139150001', '402882be46404313014640b7eb1c000f', '1', '2016-03-14 09:32:59', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815375cf7e015375d5b8fa0001', '402882be46404313014640b7eb1c000f', '1', '2016-03-14 23:54:14', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815376295f0153762e0d4a0001', '402882be46404313014640b7eb1c000f', '1', '2016-03-15 01:30:42', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('402887025378f45a015378f732730001', '402882be46404313014640b7eb1c000f', '1', '2016-03-15 14:29:39', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028870253793d5e015379410e400001', '402882be46404313014640b7eb1c000f', '1', '2016-03-15 15:50:19', '1', '用户：super登录成功', '192.168.7.130', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981537a970501537a976e4d0001', '402882be46404313014640b7eb1c000f', '1', '2016-03-15 22:04:17', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d981538a05ef01538a0a7a0a0001', '402882be46404313014640b7eb1c000f', '1', '2016-03-18 22:04:15', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815d9866ab015d98670c070001', '402882be46404313014640b7eb1c000f', '1', '2017-07-31 19:27:56', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815d9866ab015d986969f70003', '402882be46404313014640b7eb1c000f', '1', '2017-07-31 19:30:31', '5', '订单(编号:2016020002)下的产品: 知道更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815d9866ab015d986a3e6d0004', '402882be46404313014640b7eb1c000f', '1', '2017-07-31 19:31:25', '5', '订单(编号:2016020002)下的产品: 包括更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815d9866ab015d986c57be0005', '402882be46404313014640b7eb1c000f', '1', '2017-07-31 19:33:43', '4', '采购单(2016020002)下的物料：(157双铜纸) 更新为厂家(吴顺友物资)成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815d9a79a3015d9a7b72880001', '402882be46404313014640b7eb1c000f', '1', '2017-08-01 05:09:27', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815d9a79a3015d9a7c885d0003', '402882be46404313014640b7eb1c000f', '1', '2017-08-01 05:10:38', '5', '订单(编号:2016020002)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815d9a79a3015d9a7ca3520004', '402882be46404313014640b7eb1c000f', '1', '2017-08-01 05:10:45', '4', '订单(编号:2016020002)下的产品: 1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815d9a79a3015d9a7ce77d0006', '402882be46404313014640b7eb1c000f', '1', '2017-08-01 05:11:03', '5', '订单(编号:2016020002)下的产品: 包括更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815da72084015da7229d120001', '402882be46404313014640b7eb1c000f', '1', '2017-08-03 16:07:29', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dd15eb6015dd15f59ba0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-11 20:57:53', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dd15eb6015dd1600fa80002', '402882be46404313014640b7eb1c000f', '1', '2017-08-11 20:58:39', '5', '菜单: 生产单管理更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dd15eb6015dd16050460003', '402882be46404313014640b7eb1c000f', '1', '2017-08-11 20:58:56', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dd71e1e015dd71eb15a0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-12 23:44:59', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dd71e1e015dd73864fb0002', '402882be46404313014640b7eb1c000f', '1', '2017-08-13 00:13:03', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddb9987015ddba116dc0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-13 20:45:53', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddbf12a015ddbf360c50001', '402882be46404313014640b7eb1c000f', '1', '2017-08-13 22:15:46', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddbf12a015ddc03522d0002', '402882be46404313014640b7eb1c000f', '1', '2017-08-13 22:33:11', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddc27ea015ddc2860e70001', '402882be46404313014640b7eb1c000f', '1', '2017-08-13 23:13:40', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddc2a05015ddc2af6950001', '402882be46404313014640b7eb1c000f', '1', '2017-08-13 23:16:29', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddc2ba2015ddc2c3f8b0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-13 23:17:53', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddc3064015ddc30a1c90001', '402882be46404313014640b7eb1c000f', '1', '2017-08-13 23:22:40', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddc3064015ddc6124e90002', '402882be46404313014640b7eb1c000f', '1', '2017-08-14 00:15:40', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddc3064015ddc67ff0f0003', '402882be46404313014640b7eb1c000f', '1', '2017-08-14 00:23:09', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddc3064015ddc6861c50004', '402882be46404313014640b7eb1c000f', '1', '2017-08-14 00:23:34', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddc3064015ddc68c2000005', '402882be46404313014640b7eb1c000f', '1', '2017-08-14 00:23:59', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddc3064015ddc7bc2500006', '402882be46404313014640b7eb1c000f', '1', '2017-08-14 00:44:44', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddc3064015ddc7e56ab0007', '402882be46404313014640b7eb1c000f', '1', '2017-08-14 00:47:33', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddc3064015ddc96f6740008', '402882be46404313014640b7eb1c000f', '1', '2017-08-14 01:14:27', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddf98fb015ddfa3c9db0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-14 15:27:19', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddf98fb015ddfa4d9a60002', '402882be46404313014640b7eb1c000f', '1', '2017-08-14 15:28:29', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddf98fb015ddfa78e2e0003', '402882be46404313014640b7eb1c000f', '1', '2017-08-14 15:31:26', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddf98fb015ddfac1a690004', '402882be46404313014640b7eb1c000f', '1', '2017-08-14 15:36:24', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddf98fb015ddfb6099c0005', '402882be46404313014640b7eb1c000f', '1', '2017-08-14 15:47:15', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ddf98fb015de00dbd500006', '402882be46404313014640b7eb1c000f', '1', '2017-08-14 17:23:03', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de107b3015de10873970001', '402882be46404313014640b7eb1c000f', '1', '2017-08-14 21:56:53', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de17097015de17146450001', '402882be46404313014640b7eb1c000f', '1', '2017-08-14 23:51:23', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de38861015de38914740001', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 09:36:37', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de38aab015de38b1de70001', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 09:38:51', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de38aab015de38e1a500002', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 09:42:07', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de38aab015de39ec6ce0003', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 10:00:19', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de38aab015de3cff9bb0004', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 10:54:04', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de38aab015de3d1d3590005', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 10:56:05', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de3d403015de3d4a3270001', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 10:59:09', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de3db46015de3db8de10001', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 11:06:43', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de3db46015de3dd9ea20002', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 11:08:58', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de3eb4b015de3ebbf520001', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 11:24:24', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de3eb4b015de3eddeed0002', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 11:26:43', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de3eb4b015de40f86640003', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 12:03:28', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de3eb4b015de4104fae0004', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 12:04:20', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de422f3015de4239ca20001', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 12:25:25', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de4258c015de425cd1e0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 12:27:48', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de42dd3015de42e84250001', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 12:37:20', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de42dd3015de431845a0002', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 12:40:36', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de42dd3015de431b79e0003', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 12:40:49', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de42dd3015de43764af0004', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 12:47:01', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de42dd3015de45924bc0005', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 13:23:53', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de42dd3015de463fddd0006', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 13:35:44', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de42dd3015de46a43a50007', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 13:42:35', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de42dd3015de490583c0008', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 14:24:11', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de42dd3015de4930ba00009', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 14:27:08', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de4f749015de4f7d9e80001', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 16:17:14', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de4f95e015de4f99ada0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 16:19:09', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de4fc8f015de5035d6f0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 16:29:49', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de561a5015de5624cfd0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 18:13:30', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de61630015de627d2640001', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 21:49:15', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de61630015de6624d300002', '402882be46404313014640b7eb1c000f', '1', '2017-08-15 22:53:08', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de61630015de6b462990003', '402882be46404313014640b7eb1c000f', '1', '2017-08-16 00:22:47', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de6d3bc015de6d4b6150001', '402882be46404313014640b7eb1c000f', '1', '2017-08-16 00:58:06', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de8bf32015de8d3bacc0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-16 10:16:16', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de8bf32015de9561cf60002', '402882be46404313014640b7eb1c000f', '1', '2017-08-16 12:38:41', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815de8bf32015de97ee41d0003', '402882be46404313014640b7eb1c000f', '1', '2017-08-16 13:23:13', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dea554f015dea568c280001', '402882be46404313014640b7eb1c000f', '1', '2017-08-16 17:18:46', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815deb1f68015deb2c8f3d0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-16 21:12:32', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dedfe9d015dedfffb800001', '402882be46404313014640b7eb1c000f', '1', '2017-08-17 10:22:42', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dedfe9d015dee2724640002', '402882be46404313014640b7eb1c000f', '1', '2017-08-17 11:05:28', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dee367e015dee3e230f0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-17 11:30:35', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dee44c1015dee5c353a0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-17 12:03:26', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dee62ad015dee636bbf0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-17 12:11:19', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dee6d9b015dee6e009e0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-17 12:22:52', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dee762b015dee779bdf0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-17 12:33:22', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dee762b015dee7b42a10002', '402882be46404313014640b7eb1c000f', '1', '2017-08-17 12:37:21', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dee762b015dee841fb80003', '402882be46404313014640b7eb1c000f', '1', '2017-08-17 12:47:02', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dee762b015dee9bc1ea0004', '402882be46404313014640b7eb1c000f', '1', '2017-08-17 13:12:51', '5', '产品: 43434更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dee762b015dee9c4d010006', '402882be46404313014640b7eb1c000f', '1', '2017-08-17 13:13:27', '5', '订单(编号:2016020001)下的产品: 43434更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dee762b015dee9c66c10007', '402882be46404313014640b7eb1c000f', '1', '2017-08-17 13:13:33', '5', '订单(编号:2016020001)下的产品: 43434更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dee762b015dee9cb5930008', '402882be46404313014640b7eb1c000f', '1', '2017-08-17 13:13:53', '5', '订单ID: 4028d981529fec4b01529fecdce60002更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dee762b015dee9ce2fa000a', '402882be46404313014640b7eb1c000f', '1', '2017-08-17 13:14:05', '5', '订单(编号:2016020001)下的产品: 43434更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df039f7015df03ac6170001', '402882be46404313014640b7eb1c000f', '1', '2017-08-17 20:46:09', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df039f7015df05714840002', '402882be46404313014640b7eb1c000f', '1', '2017-08-17 21:17:05', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df0dd07015df0df7fd00001', '402882be46404313014640b7eb1c000f', '1', '2017-08-17 23:46:05', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df10994015df10a05650001', '402882be46404313014640b7eb1c000f', '1', '2017-08-18 00:32:32', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df10994015df115d50a0002', '402882be46404313014640b7eb1c000f', '1', '2017-08-18 00:45:26', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df10994015df11b316b0003', '402882be46404313014640b7eb1c000f', '1', '2017-08-18 00:51:17', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df15590015df1563b780001', '402882be46404313014640b7eb1c000f', '1', '2017-08-18 01:55:46', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df15590015df1618bb10002', '402882be46404313014640b7eb1c000f', '1', '2017-08-18 02:08:08', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df2edd6015df2f251220001', '402882be46404313014640b7eb1c000f', '1', '2017-08-18 09:25:52', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df2edd6015df2f57f390002', '402882be46404313014640b7eb1c000f', '1', '2017-08-18 09:29:21', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df2edd6015df2f7f9590003', '402882be46404313014640b7eb1c000f', '1', '2017-08-18 09:32:03', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df5891a015df58a1d780001', '402882be46404313014640b7eb1c000f', '1', '2017-08-18 21:30:55', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df5891a015df59063bc0002', '402882be46404313014640b7eb1c000f', '1', '2017-08-18 21:37:46', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df5891a015df63a57000007', '402882be46404313014640b7eb1c000f', '1', '2017-08-19 00:43:24', '3', '产品： 测试1插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df5891a015df63abbef0009', '402882be46404313014640b7eb1c000f', '1', '2017-08-19 00:43:50', '5', '订单(编号:2016020002)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df5891a015df63aebdb000b', '402882be46404313014640b7eb1c000f', '1', '2017-08-19 00:44:02', '5', '订单(编号:2016020002)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df5891a015df63b1b9a000d', '402882be46404313014640b7eb1c000f', '1', '2017-08-19 00:44:15', '5', '订单(编号:2016020002)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df5891a015df64a42400011', '402882be46404313014640b7eb1c000f', '1', '2017-08-19 01:00:48', '5', '产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df5891a015df65e78160015', '402882be46404313014640b7eb1c000f', '1', '2017-08-19 01:22:52', '5', '产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df5891a015df65eb3bc0017', '402882be46404313014640b7eb1c000f', '1', '2017-08-19 01:23:07', '5', '订单(编号:2016020002)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df67da5015df67e2f5a0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-19 01:57:31', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df68050015df680c22e0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-19 02:00:19', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df82865015df82f1a6e0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-19 09:50:22', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df83228015df83270050001', '402882be46404313014640b7eb1c000f', '1', '2017-08-19 09:54:01', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df83418015df83461ef0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-19 09:56:08', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df83418015df836458b0002', '402882be46404313014640b7eb1c000f', '1', '2017-08-19 09:58:12', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815df83418015df85bd41b0003', '402882be46404313014640b7eb1c000f', '1', '2017-08-19 10:39:13', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dfff267015dfff30ad80001', '402882be46404313014640b7eb1c000f', '1', '2017-08-20 22:01:44', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dfff267015dfff45c5f0005', '402882be46404313014640b7eb1c000f', '1', '2017-08-20 22:03:10', '5', '产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815dfff905015e00008b9a0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-20 22:16:29', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e0001d9015e00023c0b0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-20 22:18:19', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e032e05015e032ea1340001', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 13:05:40', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e032e05015e0339a7aa0002', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 13:17:43', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e033f9a015e0340ed9e0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 13:25:40', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e034a96015e034af4dc0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 13:36:37', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e035b6f015e035c07980001', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 13:55:16', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e0383cc015e0384c89f0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 14:39:47', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e0383cc015e0385b5b9000d', null, '1', '2017-08-21 14:40:48', '3', '生产单(编号:170821143954886551189081)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e038c61015e038d8edf0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 14:49:22', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e038c61015e038f3b4b000b', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 14:51:12', '3', '生产单(编号:170821144931632551969867)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e03b83c015e03b984fa0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 15:37:23', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e03c9bb015e03ce287d0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 15:59:56', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e03d453015e03d51db80001', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 16:07:31', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e03d453015e03e4e06b000a', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 16:24:44', '3', '生产单(编号:170821162435774551089284)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e03d453015e03e6dace000f', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 16:26:54', '3', '生产单(编号:170821162647566551917744)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e03d453015e03e77c9f0015', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 16:27:35', '3', '生产单(编号:170821162730442551000687)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e03d453015e03e8fdc1001a', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 16:29:14', '3', '生产单(编号:170821162908333551695632)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e03d453015e03e90b89001f', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 16:29:18', '3', '生产单(编号:170821162908333551695632)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e03d453015e03e9f7fa0025', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 16:30:18', '3', '生产单(编号:170821163013677551712367)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e03d453015e03ea853e0029', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 16:30:54', '3', '生产单(编号:170821163049640551792618)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e03d453015e03eadb16002d', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 16:31:16', '3', '生产单(编号:170821163112149551713849)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e03d453015e03ebb7dc0033', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 16:32:13', '3', '生产单(编号:170821163208081551453154)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e03d453015e03ebf361003b', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 16:32:28', '3', '生产单(编号:170821163222223551526167)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e03d453015e04092cc7003c', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 17:04:23', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e04332c015e04339a8b0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 17:50:44', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e043b18015e043b46e00001', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 17:59:07', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e043b18015e04439b9f0008', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 18:08:13', '3', '生产单(编号:170821180808301551100399)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e043b18015e044608df0013', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 18:10:52', '3', '生产单(编号:170821181005544551086929)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e045d2c015e045d5c790001', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 18:36:20', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e045d2c015e045f31cb0002', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 18:38:21', '4', '生产单(编号:170821181005544551086929)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e045d2c015e046001fb0003', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 18:39:14', '4', '生产单(编号:170821180808301551100399)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e045d2c015e046002330004', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 18:39:14', '4', '生产单(编号:170821163222223551526167)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e045d2c015e046002870005', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 18:39:14', '4', '生产单(编号:170821163208081551453154)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e045d2c015e046015cf0006', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 18:39:19', '4', '生产单(编号:170821180808301551100399)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e045d2c015e046015d70007', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 18:39:19', '4', '生产单(编号:170821163222223551526167)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e045d2c015e046015e40008', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 18:39:19', '4', '生产单(编号:170821163208081551453154)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e045d2c015e046016220009', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 18:39:19', '4', '生产单(编号:170821162435774551089284)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e045d2c015e04601644000a', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 18:39:19', '4', '生产单(编号:170821162647566551917744)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e046696015e0466ca7a0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 18:46:38', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e0469f6015e046a8d9c0006', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 18:50:45', '5', '生产单(编号:170821163049640551792618)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e0469f6015e046b3d42000c', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 18:51:30', '5', '生产单(编号:170821163049640551792618)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e0469f6015e046e84400010', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 18:55:05', '5', '生产单(编号:170821163049640551792618)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e0469f6015e046eb5dd0014', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 18:55:17', '5', '生产单(编号:170821163049640551792618)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e0511c1015e051473ec0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 21:56:19', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e0511c1015e0516bf2e0003', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 21:58:50', '3', '菜单: 旧生产单管理界面插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e0511c1015e0517000f0004', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 21:59:07', '5', '菜单: 生产单管理更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e0511c1015e0517c078009c', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 21:59:56', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e051811015e05184d9e0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 22:00:32', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e051811015e0519674b0002', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 22:01:44', '5', '菜单: 旧生产单管理界面更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e051811015e0519dcc10003', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 22:02:14', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e051a28015e051a54160001', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 22:02:45', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e051a28015e053850190002', '402882be46404313014640b7eb1c000f', '1', '2017-08-21 22:35:30', '4', '生产单(编号:170821162908333551695632)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e071a81015e071afa0e0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 07:22:42', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e077dc0015e0783fe090001', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 09:17:24', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e077dc0015e0797a7520002', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 09:38:52', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e077dc0015e07c3e7500009', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 10:27:12', '3', '生产单(编号:170822102703599551767764)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e077dc0015e07e76055000a', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 11:05:57', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e077dc0015e07f6b7e7000f', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 11:22:43', '3', '生产单(编号:170822112237148551156528)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e082766015e0827d6230001', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 12:16:22', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e082766015e0862d2eb000f', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 13:20:47', '5', '生产单(编号:170821144931632551969867)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e082766015e08633dc5001d', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 13:21:15', '5', '生产单(编号:170821144931632551969867)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e086644015e0866b6d00001', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 13:25:02', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e086644015e086e2adb0002', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 13:33:11', '4', '生产单(编号:170821163013677551712367)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e086644015e086eb3f20007', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 13:33:46', '5', '生产单(编号:170821162730442551000687)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e086644015e087067830008', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 13:35:37', '4', '生产单(编号:170821144931632551969867)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e086644015e0883e2570009', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 13:56:54', '4', '生产单(编号:170821163049640551792618)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e086644015e0885f6bf000a', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 13:59:10', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e086644015e08d4d144001a', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 15:25:18', '3', '生产单(编号:170822152252959551381429)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e086644015e08d7043f002c', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 15:27:42', '5', '生产单(编号:170822152252959551381429)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e086644015e08dca482003c', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 15:33:51', '5', '生产单(编号:170822152252959551381429)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e08e0de015e08e1ebc70001', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 15:39:37', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e08e0de015e094ac6660002', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 17:34:08', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e095798015e095e33750001', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 17:55:22', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e097079015e0970a68b0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 18:15:31', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e097079015e0982c6570002', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 18:35:18', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e097079015e098c78170003', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 18:45:54', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e097079015e09bee7d6001e', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 19:40:59', '5', '生产单(编号:170822152252959551381429)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e097079015e0a0ce9f0001f', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 21:06:12', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e097079015e0a1175220020', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 21:11:09', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e097079015e0a14754d0021', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 21:14:26', '1', '用户：super登录成功', '192.168.89.1', 'Firefox');
INSERT INTO `sys_log` VALUES ('4028d9815e097079015e0a16483e0022', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 21:16:26', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e097079015e0a190c780023', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 21:19:27', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e097079015e0a1b76340024', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 21:22:05', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e097079015e0a42beb8004f', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 22:04:59', '5', '生产单(编号:170822152252959551381429)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e0a6065015e0a60dcf10001', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 22:37:53', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e0a6065015e0a62de800002', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 22:40:05', '4', '生产单(编号:170822112237148551156528)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e0a6379015e0a63d57a0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 22:41:08', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e0a6379015e0a64097e0002', '402882be46404313014640b7eb1c000f', '1', '2017-08-22 22:41:21', '5', '生产单(编号:170821162730442551000687)结单成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e14af92015e14b437790001', '402882be46404313014640b7eb1c000f', '1', '2017-08-24 22:45:08', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e14bb38015e14bb90f10001', '402882be46404313014640b7eb1c000f', '1', '2017-08-24 22:53:10', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e14bb38015e14bbedd70003', '402882be46404313014640b7eb1c000f', '1', '2017-08-24 22:53:34', '5', '订单ID: 4028d9815e14bb38015e14bbedab0002更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e14bb38015e14bcf1af0005', '402882be46404313014640b7eb1c000f', '1', '2017-08-24 22:54:40', '5', '订单ID: 4028d9815e14bb38015e14bcf1aa0004更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e14bb38015e14bd2cba0007', '402882be46404313014640b7eb1c000f', '1', '2017-08-24 22:54:55', '5', '订单ID: 4028d9815e14bb38015e14bd2cad0006更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e14c199015e14c273e90001', '402882be46404313014640b7eb1c000f', '1', '2017-08-24 23:00:41', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e14c199015e14c2ee400003', '402882be46404313014640b7eb1c000f', '1', '2017-08-24 23:01:12', '5', '订单ID: 4028d9815e14c199015e14c2ee330002更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e14c199015e14c3659a0005', '402882be46404313014640b7eb1c000f', '1', '2017-08-24 23:01:43', '5', '订单(编号:201708240001)下的产品: 包括更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e14c199015e14c39b840006', '402882be46404313014640b7eb1c000f', '1', '2017-08-24 23:01:57', '5', '订单(编号:201708240001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e14c199015e14c3ac740007', '402882be46404313014640b7eb1c000f', '1', '2017-08-24 23:02:01', '5', '订单(编号:201708240001)下的产品: 包括更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e14c199015e14c3d6950008', '402882be46404313014640b7eb1c000f', '1', '2017-08-24 23:02:12', '5', '订单ID: 4028d9815e14c199015e14c2ee330002更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e14c199015e14c477f8000a', '402882be46404313014640b7eb1c000f', '1', '2017-08-24 23:02:53', '5', '订单(编号:201708240001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e14c199015e14c4e3f60014', '402882be46404313014640b7eb1c000f', '1', '2017-08-24 23:03:21', '3', '生产单(编号:170824230302888551142984)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e14d0c7015e14d132a80002', '402882be46404313014640b7eb1c000f', '1', '2017-08-24 23:16:47', '5', '订单ID: 4028d9815e14d0c7015e14d1327d0001更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e14d0c7015e14d23be30004', '402882be46404313014640b7eb1c000f', '1', '2017-08-24 23:17:55', '5', '订单ID: 4028d9815e14d0c7015e14d23bd20003更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e14d45d015e14d4a3cc0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-24 23:20:33', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e14d45d015e14d4f49b0003', '402882be46404313014640b7eb1c000f', '1', '2017-08-24 23:20:54', '5', '订单ID: 4028d9815e14d45d015e14d4f4910002更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e14d45d015e14d746cb0005', '402882be46404313014640b7eb1c000f', '1', '2017-08-24 23:23:26', '5', '订单(编号:2017082410001)下的产品: 23321更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e14d45d015e14d758350006', '402882be46404313014640b7eb1c000f', '1', '2017-08-24 23:23:30', '5', '订单ID: 4028d9815e14d45d015e14d4f4910002更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e1540d7015e15417ddf0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 01:19:26', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e1540d7015e1544b2dc0010', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 01:22:57', '3', '生产单(编号:170825012012975551497629)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e1547e4015e15499c780002', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 01:28:19', '3', '客户： 小孙插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e17746b015e17759b880001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 11:35:37', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e17746b015e1775d57b0003', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 11:35:51', '5', '订单ID: 4028d9815e17746b015e1775d5210002更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e177981015e17938d3f0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 12:08:19', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e179473015e1794d8390001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 12:09:44', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e179473015e179501880002', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 12:09:54', '4', '订单(：4028d9815e17746b015e1775d5210002)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e179473015e17953d2a0004', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 12:10:10', '5', '订单ID: 4028d9815e179473015e17953d1f0003更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e179473015e1795bced0006', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 12:10:42', '5', '订单(编号:20170825100001)下的产品: 123333更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e179473015e1795c5190007', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 12:10:44', '5', '订单ID: 4028d9815e179473015e17953d1f0003更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e17e370015e17e41ea20001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 13:36:19', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e17e370015e17e4f1660002', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 13:37:13', '5', '菜单: 送货单管理更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e17e57a015e17e5ad8b0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 13:38:01', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e17e72a015e17e76b4b0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 13:39:55', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e17e9be015e17e9ea950001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 13:42:39', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e18da87015e18db99670001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 18:06:38', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e18fe20015e18fe8e610001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 18:44:49', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e1900ae015e1900dfc00001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 18:47:21', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e190244015e190285590001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 18:49:09', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e19052d015e190565940001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 18:52:17', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e190cba015e190d6a2a0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 19:01:03', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e19104c015e19107dc50001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 19:04:24', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e19161d015e19165d0e0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 19:10:49', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e191791015e1917bffe0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 19:12:20', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e191791015e1918b6be0009', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 19:13:23', '3', '送货单(编号:20170825300001)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e191791015e191cc5c5000a', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 19:17:49', '4', '送货单(编号:20170825300001)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e19230a015e1923a6a80001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 19:25:20', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e19286c015e19289c8d0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 19:30:45', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e19286c015e1930ea0c0002', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 19:39:49', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e19286c015e194075b10003', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 19:56:48', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e19286c015e1940d2c10004', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 19:57:12', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e198686015e19874c980001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 21:14:10', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e19be26015e19be92a30001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 22:14:33', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e19cfd3015e19d05b720001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 22:33:58', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e19d2d4015e19d35ff40001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 22:37:16', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e19edc0015e19f79f330001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 23:16:52', '5', '客户: null更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e19edc0015e19f7c7bf0002', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 23:17:02', '5', '客户: null更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e19edc0015e19f81efa0003', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 23:17:24', '5', '客户: null更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e19fd1b015e1a008e5d0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 23:26:37', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e19fd1b015e1a03d53c0006', '402882be46404313014640b7eb1c000f', '1', '2017-08-25 23:30:12', '3', '送货单(编号:20170825300001)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e1cafd4015e1cb195ee0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-26 11:59:13', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e1cafd4015e1cb9eb180004', '402882be46404313014640b7eb1c000f', '1', '2017-08-26 12:08:19', '5', '送货单(编号:20170825300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e1cafd4015e1cbc209c0008', '402882be46404313014640b7eb1c000f', '1', '2017-08-26 12:10:44', '3', '送货单(编号:20170826300001)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e1cafd4015e1cbd78e5000b', '402882be46404313014640b7eb1c000f', '1', '2017-08-26 12:12:12', '3', '送货单(编号:20170826300002)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e1cafd4015e1cbd88d3000c', '402882be46404313014640b7eb1c000f', '1', '2017-08-26 12:12:16', '4', '送货单(编号:20170826300002)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e20c633015e20c75c900001', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 07:01:29', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e20c633015e20c94dfa0005', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 07:03:37', '3', '生产单(编号:20170827300001)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e20c633015e20cb1a7d0006', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 07:05:35', '1', '用户：super登录成功', '192.168.89.1', 'Safari');
INSERT INTO `sys_log` VALUES ('4028d9815e20c633015e20dbabfc0007', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 07:23:40', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e20c633015e20e485e00008', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 07:33:20', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e20c633015e20eb7a70001f', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 07:40:56', '3', '生产单(编号:20170827300002)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e20c633015e213c598f0020', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 09:09:16', '1', '用户：super登录成功', '192.168.89.1', 'Safari');
INSERT INTO `sys_log` VALUES ('4028d9815e20c633015e21722a870021', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 10:08:03', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e219d35015e219dae4d0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 10:55:35', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e219d35015e21b23be30002', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 11:18:02', '4', '订单(：4028d9815e14d0c7015e14d1327d0001)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e219d35015e21b88ec80003', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 11:24:56', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e21e12a015e21e1854c0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 12:09:41', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e21e12a015e21e3a40e0003', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 12:12:00', '3', '菜单: 送货单明细汇总插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e2299b7015e229a47b60001', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 15:31:29', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e229df6015e229e43c50001', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 15:35:50', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e229ff1015e22a02eb40001', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 15:37:56', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22a1fb015e22a230f80001', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 15:40:08', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22a7a6015e22a85c650001', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 15:46:52', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22b345015e22b3860e0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 15:59:04', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22b4f5015e22b5822c0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:01:14', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22b4f5015e22bab2600002', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:06:54', '5', '送货单(编号:20170825300001)结单成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22cb61015e22cbc6fa0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:25:33', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22d141220001', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:31:32', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22d1c2750005', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:32:05', '3', '送货单(编号:20170827300001)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22d1f9eb000d', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:32:19', '3', '送货单(编号:20170827300002)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22d4c6de0010', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:35:23', '3', '送货单(编号:20170827300003)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22d8a21e0013', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:39:36', '3', '送货单(编号:20170827300004)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22d9ee5a0016', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:41:01', '3', '送货单(编号:20170827300005)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22db5d3a0018', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:42:35', '5', '送货单(编号:20170827300003)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22db7562001b', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:42:41', '5', '送货单(编号:20170827300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22db830f001d', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:42:44', '5', '送货单(编号:20170827300005)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22db8ea8001f', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:42:47', '5', '送货单(编号:20170827300004)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22db99c40021', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:42:50', '5', '送货单(编号:20170827300003)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22dba6110028', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:42:53', '5', '送货单(编号:20170827300002)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22dbb402002b', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:42:57', '5', '送货单(编号:20170827300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22dbc09d002e', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:43:00', '5', '送货单(编号:20170827300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22dbcc6c0031', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:43:03', '5', '送货单(编号:20170826300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22dcf0c70033', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:44:18', '5', '送货单(编号:20170827300005)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22dcfdc90035', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:44:21', '5', '送货单(编号:20170827300004)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22dd092c0037', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:44:24', '5', '送货单(编号:20170827300003)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22dd148a003e', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:44:27', '5', '送货单(编号:20170827300002)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22dd1ef70041', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:44:30', '5', '送货单(编号:20170827300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22d108015e22dd2beb0044', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:44:33', '5', '送货单(编号:20170826300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22e681015e22e7a10f0001', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 16:55:58', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22f91e015e22f994c10001', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 17:15:35', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22fc02015e22fcaf160001', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 17:18:58', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22fda8015e22fde3d80001', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 17:20:17', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e22ff2b015e22ff5a730001', '402882be46404313014640b7eb1c000f', '1', '2017-08-27 17:21:53', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e49e8ce015e49e9efd00001', '402882be46404313014640b7eb1c000f', '1', '2017-09-04 06:43:41', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e4bb80e015e4bba47740001', '402882be46404313014640b7eb1c000f', '1', '2017-09-04 15:10:52', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e4bb80e015e4bc2c45f0002', '402882be46404313014640b7eb1c000f', '1', '2017-09-04 15:20:09', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e4bb80e015e4beceb540005', '402882be46404313014640b7eb1c000f', '1', '2017-09-04 16:06:11', '5', '生产单(编号:20170827300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e4bff0e015e4c0096ca0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-04 16:27:40', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e4bff0e015e4c038da90005', '402882be46404313014640b7eb1c000f', '1', '2017-09-04 16:30:54', '5', '生产单(编号:20170827300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e4bff0e015e4c03d6b80007', '402882be46404313014640b7eb1c000f', '1', '2017-09-04 16:31:13', '5', '生产单(编号:20170827300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e4bff0e015e4c0538a5000e', '402882be46404313014640b7eb1c000f', '1', '2017-09-04 16:32:44', '5', '生产单(编号:20170827300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e4bff0e015e4c06f604000f', '402882be46404313014640b7eb1c000f', '1', '2017-09-04 16:34:38', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e4bff0e015e4c0f8e770010', '402882be46404313014640b7eb1c000f', '1', '2017-09-04 16:44:01', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e4bff0e015e4c1180e9001a', '402882be46404313014640b7eb1c000f', '1', '2017-09-04 16:46:09', '5', '生产单(编号:20170827300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e4bff0e015e4c134bb70022', '402882be46404313014640b7eb1c000f', '1', '2017-09-04 16:48:06', '5', '生产单(编号:20170827300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e4bff0e015e4c1805e80023', '402882be46404313014640b7eb1c000f', '1', '2017-09-04 16:53:16', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e4bff0e015e4c1a69290040', '402882be46404313014640b7eb1c000f', '1', '2017-09-04 16:55:52', '5', '生产单(编号:20170827300002)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e4bff0e015e4c1adf650061', '402882be46404313014640b7eb1c000f', '1', '2017-09-04 16:56:23', '5', '生产单(编号:20170827300002)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e4bff0e015e4c1e8a850062', '402882be46404313014640b7eb1c000f', '1', '2017-09-04 17:00:23', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e54ed71015e54edee430001', '402882be46404313014640b7eb1c000f', '1', '2017-09-06 10:03:52', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e54ed71015e54ef359f0002', '402882be46404313014640b7eb1c000f', '1', '2017-09-06 10:05:16', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e54ed71015e54f042740016', '402882be46404313014640b7eb1c000f', '1', '2017-09-06 10:06:25', '3', '送货单(编号:20170906300001)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e64b891015e64cca8f30001', '402882be46404313014640b7eb1c000f', '1', '2017-09-09 12:01:27', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e64b891015e64d2bf860002', '402882be46404313014640b7eb1c000f', '1', '2017-09-09 12:08:06', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e64b891015e64d3a7ad0003', '402882be46404313014640b7eb1c000f', '1', '2017-09-09 12:09:06', '5', '产品: 123333更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e64b891015e64d557ca0004', '402882be46404313014640b7eb1c000f', '1', '2017-09-09 12:10:56', '5', '订单(编号:20170825100001)下的产品: 123333更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e64b891015e64dbeebb000d', '402882be46404313014640b7eb1c000f', '1', '2017-09-09 12:18:08', '5', '生产单(编号:20170827300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e64b891015e64e85ab10030', '402882be46404313014640b7eb1c000f', '1', '2017-09-09 12:31:42', '5', '生产单(编号:20170827300002)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e64b891015e64f646bc0031', '402882be46404313014640b7eb1c000f', '1', '2017-09-09 12:46:55', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e651f3c015e6538d9cb0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-09 13:59:38', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e651f3c015e6567b74d0015', '402882be46404313014640b7eb1c000f', '1', '2017-09-09 14:50:49', '5', '生产单(编号:20170827300002)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e651f3c015e65699e54001b', '402882be46404313014640b7eb1c000f', '1', '2017-09-09 14:52:54', '5', '生产单(编号:20170827300002)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e651f3c015e656b866c0021', '402882be46404313014640b7eb1c000f', '1', '2017-09-09 14:54:59', '5', '生产单(编号:20170827300002)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e6590d2015e6592f6d40001', '402882be46404313014640b7eb1c000f', '1', '2017-09-09 15:38:03', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e65a990015e65a9e7b80001', '402882be46404313014640b7eb1c000f', '1', '2017-09-09 16:03:07', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e65a990015e65ab6be30002', '402882be46404313014640b7eb1c000f', '1', '2017-09-09 16:04:46', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e65dd32015e65dd9a2f0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-09 16:59:35', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e65dd32015e65e07b720002', '402882be46404313014640b7eb1c000f', '1', '2017-09-09 17:02:44', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e65dd32015e65e6f10f0009', '402882be46404313014640b7eb1c000f', '1', '2017-09-09 17:09:47', '5', '生产单(编号:20170827300002)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e71964e015e71972c1a0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-11 23:38:06', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e71b026015e71b05b100001', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 00:05:36', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e71b410015e71b43dd50001', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 00:09:51', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e71b410015e71c502a00002', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 00:28:10', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e71de83015e71dee8de0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 00:56:27', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e71e2c0015e71e2f1650001', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 01:00:51', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e71e714015e71e76caf0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 01:05:45', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e71eab8015e71eb02180001', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 01:09:40', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e71eab8015e7201eff50004', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 01:34:43', '3', '生产单(编号:20170912300001)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e71eab8015e7202b5850005', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 01:35:33', '5', '订单(编号:20170825100001)下的产品: 123333更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e71eab8015e72032f720006', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 01:36:04', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e71eab8015e7205cf690008', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 01:38:57', '5', '生产单(编号:20170912300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73a725e30001', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 09:14:47', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73ba8e470003', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 09:35:59', '5', '订单(编号:20170825100001)下的产品: 123333更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73bb1a0e0005', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 09:36:35', '5', '订单(编号:20170825100001)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73d8a2210007', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:08:50', '5', '订单(编号:20170825100001)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73d8eeeb0009', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:09:10', '5', '订单(编号:20170825100001)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73d909df000a', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:09:17', '5', '订单(编号:20170825100001)下的产品: 23321更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73dbd905000c', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:12:21', '5', '订单(编号:20170825100001)下的产品: 123333更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73e9eb41000d', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:27:43', '4', '订单(编号:20170825100001)下的产品: 1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73e9f2ad000e', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:27:45', '4', '订单(编号:20170825100001)下的产品: 23321删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73e9fa28000f', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:27:47', '4', '订单(编号:20170825100001)下的产品: 123333删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73ea02e50010', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:27:49', '4', '订单(编号:20170825100001)下的产品: 1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73ec7a960012', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:30:31', '5', '订单(编号:20170825100001)下的产品: 111更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73ecafca0014', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:30:44', '5', '订单(编号:20170825100001)下的产品: 123333更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73ed0ae40016', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:31:08', '5', '订单(编号:20170825100001)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73ed37100017', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:31:19', '5', '订单(编号:20170825100001)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73ee21010018', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:32:19', '4', '订单(编号:20170825100001)下的产品: 1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73ee2cfc0019', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:32:22', '4', '订单(编号:20170825100001)下的产品: 111删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73ee45cb001b', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:32:28', '5', '订单(编号:20170825100001)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73ee5e9a001c', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:32:35', '5', '订单(编号:20170825100001)下的产品: 123333更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73ef491c001e', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:33:35', '5', '订单(编号:20170825100001)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73ef778f001f', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:33:47', '5', '订单(编号:20170825100001)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73ef91690020', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:33:53', '5', '订单(编号:20170825100001)下的产品: wqwe更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73efa81e0021', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:33:59', '4', '订单(编号:20170825100001)下的产品: wqwe删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f0090f0022', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:34:24', '4', '订单(编号:20170825100001)下的产品: 123333删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f012e10023', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:34:26', '4', '订单(编号:20170825100001)下的产品: 123333删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f1b0780025', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:36:12', '5', '订单(编号:20170825100001)下的产品: wqwe更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f1c6350027', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:36:18', '5', '订单(编号:20170825100001)下的产品: 1212更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f1d7b30029', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:36:22', '5', '订单(编号:20170825100001)下的产品: 2131更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f2520c002a', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:36:54', '4', '订单(编号:20170825100001)下的产品: wqwe删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f2597f002b', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:36:56', '4', '订单(编号:20170825100001)下的产品: 1212删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f268b5002c', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:36:59', '4', '订单(编号:20170825100001)下的产品: 2131删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f27986002e', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:37:04', '5', '订单(编号:20170825100001)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f2a9fd002f', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:37:16', '5', '订单(编号:20170825100001)下的产品: 123333更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f2c64e0030', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:37:23', '5', '订单(编号:20170825100001)下的产品: 1212更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f349050032', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:37:57', '5', '订单(编号:20170825100001)下的产品: 123333更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f652880034', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:41:16', '5', '订单(编号:20170825100001)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f8702b0035', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:43:35', '4', '订单(编号:20170825100001)下的产品: 1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f87b1c0036', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:43:37', '4', '订单(编号:20170825100001)下的产品: 1212删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f8a56a0038', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:43:48', '5', '订单(编号:20170825100001)下的产品: 23321更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f8c27f003a', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:43:56', '5', '订单(编号:20170825100001)下的产品: 123更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f8f2cc003c', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:44:08', '5', '订单(编号:20170825100001)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f94005003d', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:44:28', '4', '订单(编号:20170825100001)下的产品: 1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f94baf003e', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:44:31', '4', '订单(编号:20170825100001)下的产品: 123删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f95506003f', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:44:33', '4', '订单(编号:20170825100001)下的产品: 23321删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f980900041', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:44:44', '5', '订单(编号:20170825100001)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73f9cf300043', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:45:04', '5', '订单(编号:20170825100001)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73fa116f0044', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:45:21', '4', '订单(编号:20170825100001)下的产品: 1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73fa1a0c0045', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:45:24', '4', '订单(编号:20170825100001)下的产品: 1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73fa9cb00047', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:45:57', '5', '订单(编号:20170825100001)下的产品: 1212更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73faba510048', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:46:05', '4', '订单(编号:20170825100001)下的产品: 1212删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73fad47d004a', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:46:11', '5', '订单(编号:20170825100001)下的产品: 23321更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73fbc13d004b', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:47:12', '5', '订单(编号:20170825100001)下的产品: 123333更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73fbeea5004c', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:47:24', '5', '订单(编号:20170825100001)下的产品: 123333更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73fc2cc0004d', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:47:39', '5', '订单(编号:20170825100001)下的产品: 123333更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73fe8ecf004e', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:50:16', '5', '订单(编号:20170825100001)下的产品: 123333更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73fe9e45004f', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:50:20', '5', '订单(编号:20170825100001)下的产品: 123更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e73fece3e0051', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:50:32', '5', '订单(编号:20170825100001)下的产品: wqwe更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e74003a4c0053', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:52:05', '5', '订单(编号:20170825100001)下的产品: 23321更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e7400c8c50054', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:52:42', '4', '订单(编号:20170825100001)下的产品: 23321删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e7400da940055', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:52:46', '4', '订单(编号:20170825100001)下的产品: wqwe删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e7406feeb0057', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 10:59:29', '5', '订单(编号:20170825100001)下的产品: 123更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e7408299c0059', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 11:00:45', '5', '订单(编号:20170825100001)下的产品: 1212更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e74084e72005a', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 11:00:55', '5', '订单(编号:20170825100001)下的产品: 123更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e740ecfa1005b', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 11:08:01', '4', '订单(编号:20170825100001)下的产品: 1212删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e740ee207005c', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 11:08:06', '4', '订单(编号:20170825100001)下的产品: 123删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e739e76015e74102387005d', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 11:09:28', '4', '订单(编号:20170825100001)下的产品: 123333删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e74984a015e7498fe020001', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 13:38:57', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e749c18015e749c59730001', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 13:42:37', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e74b94c015e74b9bf1b0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 14:14:43', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e74baec015e74bc0ea40001', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 14:17:15', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e74baec015e74ee048b0002', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 15:11:49', '5', '订单(编号:20170825100001)下的产品: 23321更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e74baec015e74ee22c70003', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 15:11:57', '4', '订单(编号:20170825100001)下的产品: 23321删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e74baec015e754b2c980004', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 16:53:34', '5', '订单(编号:20170825100001)下的产品: 123更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e754e7d015e754f54200001', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 16:58:06', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e7587e51e0002', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 17:59:53', '5', '订单(编号:20170825100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e758965c90004', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:01:32', '5', '订单(编号:20170825100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e758c73210006', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:04:52', '5', '订单(编号:20170825100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e758d9ce90007', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:06:08', '4', '订单(编号:20170825100001)下的产品: 123333删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e758db6c80008', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:06:15', '4', '订单(编号:20170825100001)下的产品: 测试1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e758e4dbb000a', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:06:53', '5', '订单(编号:20170825100001)下的产品: 5555更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75909f8c000c', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:09:25', '5', '订单(编号:20170825100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75913638000e', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:10:04', '5', '订单(编号:20170825100001)下的产品: 知道更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75932cbf000f', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:12:13', '4', '订单(编号:20170825100001)下的产品: 知道删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e759335b90010', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:12:15', '4', '订单(编号:20170825100001)下的产品: 123删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e759384220012', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:12:35', '5', '订单(编号:20170825100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e7593adb20014', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:12:46', '5', '订单(编号:20170825100001)下的产品: 包括更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e7594027e0016', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:13:07', '5', '订单(编号:20170825100001)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e759426b60017', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:13:17', '4', '订单(编号:20170825100001)下的产品: 1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75942ef40018', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:13:19', '4', '订单(编号:20170825100001)下的产品: 包括删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e759439bf0019', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:13:21', '4', '订单(编号:20170825100001)下的产品: 5555删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e7594d707001b', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:14:02', '5', '订单(编号:20170825100001)下的产品: 5555更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e759551b3001c', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:14:33', '4', '订单(编号:20170825100001)下的产品: 5555删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75978481001e', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:16:57', '5', '订单(编号:20170825100001)下的产品: 43434更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75989eef0020', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:18:10', '5', '订单(编号:20170825100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e7598efb30021', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:18:30', '4', '订单(编号:20170825100001)下的产品: 43434删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75995e2a0022', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:18:58', '4', '订单(编号:20170825100001)下的产品: 测试1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e7599d8600023', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:19:30', '4', '订单(编号:20170825100001)下的产品: 测试1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e759ab7060025', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:20:27', '5', '订单(编号:20170825100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e759d7ca40027', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:23:28', '5', '订单(编号:20170825100001)下的产品: 43434更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e759d95780028', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:23:35', '4', '订单(编号:20170825100001)下的产品: 43434删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e759da1400029', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:23:38', '4', '订单(编号:20170825100001)下的产品: 测试1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e759da8be002a', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:23:40', '4', '订单(编号:20170825100001)下的产品: 测试1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e759fc2bb002c', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:25:57', '5', '订单(编号:20170825100001)下的产品: 43434更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e759fd2f0002d', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:26:02', '4', '订单(编号:20170825100001)下的产品: 43434删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75a2580f002e', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:28:47', '5', '订单(编号:20170825100001)下的产品: 2332134更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75a28bc8002f', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:29:00', '5', '订单(编号:20170825100001)下的产品: 123333更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75a41e6d0031', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:30:43', '5', '订单(编号:20170825100001)下的产品: 43434更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75a4475f0032', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:30:54', '5', '订单(编号:20170825100001)下的产品: 知道更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75a5c5b20033', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:32:31', '5', '订单(编号:20170825100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75a5fca50034', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:32:45', '5', '订单(编号:20170825100001)下的产品: 包括更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75a675400036', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:33:16', '5', '订单(编号:20170825100001)下的产品: 知道更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75a847550037', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:35:16', '4', '订单(编号:20170825100001)下的产品: 包括删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75ad59820039', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:40:48', '5', '订单(编号:20170825100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75b347fb003b', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:47:17', '5', '订单(编号:20170825100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75b5543a003d', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:49:31', '5', '订单(编号:20170825100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75b58c1b003f', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:49:45', '5', '订单(编号:20170825100001)下的产品: 包括更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75b6ed500041', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:51:16', '5', '订单(编号:20170825100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75b712ab0042', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:51:25', '4', '订单(编号:20170825100001)下的产品: 123333删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75b7192d0043', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:51:27', '4', '订单(编号:20170825100001)下的产品: 知道删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75b71fe30044', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:51:29', '4', '订单(编号:20170825100001)下的产品: 测试1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75b728740045', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:51:31', '4', '订单(编号:20170825100001)下的产品: 测试1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75b732210046', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:51:33', '4', '订单(编号:20170825100001)下的产品: 测试1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75b73e000047', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:51:36', '4', '订单(编号:20170825100001)下的产品: 测试1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75b7b3690049', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:52:06', '5', '订单(编号:20170825100001)下的产品: 5555更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75b81a0e004b', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:52:33', '5', '订单(编号:2017082410001)下的产品: 包括更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75b839d9004d', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:52:41', '5', '订单(编号:2017082410001)下的产品: 12更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75b84fd1004f', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:52:46', '5', '订单(编号:2017082410001)下的产品: 包括更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75b87c250051', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:52:58', '5', '订单(编号:2017082410001)下的产品: 5555更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75b8b87a0052', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:53:13', '4', '订单(编号:2017082410001)下的产品: 5555删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75b9f1d20054', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:54:33', '5', '订单(编号:2017080003)下的产品: 5555更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75ba14490056', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 18:54:42', '5', '订单(编号:2017080003)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75d610380057', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 19:25:16', '4', '订单(编号:2016020002)下的产品: 测试1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e755422015e75d6aead0058', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 19:25:57', '4', '订单(编号:201708240001)下的产品: 包括删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e75d7d8015e75d8551f0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 19:27:45', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e75d7d8015e75dc8b5c0004', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 19:32:21', '3', '订单ID: 4028d9815e179473015e17953d1f0003下的产品1及其订单信息插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e75e50e015e75e617bf0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 19:42:47', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e75e787015e75e7b3b20001', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 19:44:32', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e75e787015e75e8072c0003', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 19:44:54', '5', '订单(编号:20170825100001)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e75e787015e75e86f6c0004', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 19:45:20', '5', '订单(编号:20170825100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e75e787015e75e8e7a10006', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 19:45:51', '5', '订单(编号:20170825100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e75e787015e75e901ac0008', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 19:45:58', '5', '订单(编号:201708240003)下的产品: 5555更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('8a8a88995e76750a015e7675b2fd0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 22:19:38', '1', '用户：super登录成功', '10.10.8.25', 'Chrome');
INSERT INTO `sys_log` VALUES ('8a8a88995e767f47015e767f8eca0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 22:30:24', '1', '用户：super登录成功', '10.10.8.25', 'Chrome');
INSERT INTO `sys_log` VALUES ('8a8a88995e76b7a6015e76b8550d0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 23:32:25', '1', '用户：super登录成功', '10.10.8.25', 'Chrome');
INSERT INTO `sys_log` VALUES ('8a8a88995e76c7e4015e76c822a20001', '402882be46404313014640b7eb1c000f', '1', '2017-09-12 23:49:41', '1', '用户：super登录成功', '10.10.8.25', 'Chrome');
INSERT INTO `sys_log` VALUES ('8a8a88995e76dd12015e76dd7a720001', '402882be46404313014640b7eb1c000f', '1', '2017-09-13 00:12:59', '1', '用户：super登录成功', '10.10.8.25', 'Chrome');
INSERT INTO `sys_log` VALUES ('8a8a88995e76dd12015e76f7e3d3000e', '402882be46404313014640b7eb1c000f', '1', '2017-09-13 00:41:50', '3', '生产单(编号:20170913300001)插入成功', '10.10.8.25', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e7a87f6015e7a93bab00001', '402882be46404313014640b7eb1c000f', '1', '2017-09-13 17:30:55', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e835e52015e836edd410001', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 10:47:14', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e835e52015e8372398a000c', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 10:50:54', '3', '生产单(编号:20170915300001)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e835e52015e8372dc88001a', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 10:51:36', '5', '生产单(编号:20170915300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e835e52015e837ad2a6001c', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 11:00:18', '3', '生产厂家： 德胜印刷厂插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e835e52015e837ced64001e', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 11:02:36', '3', '生产厂家： 小名插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e842f88015e843695a60001', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 14:25:23', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e842f88015e845d87640003', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 15:07:55', '3', '生产厂家： 小王插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e842f88015e845f10a50005', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 15:09:36', '3', '生产厂家： 王孙插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e842f88015e845ff05d0007', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 15:10:33', '3', '生产厂家： 小鱼插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e842f88015e84606c020009', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 15:11:05', '3', '生产厂家： 小雨插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e842f88015e8461ccbf000b', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 15:12:35', '3', '生产厂家： 大雨插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e842f88015e8466d9e6000d', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 15:18:06', '3', '生产厂家： 大雨1插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e842f88015e84675681000f', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 15:18:38', '3', '生产厂家： 订单插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8492a5015e8493235c0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 16:06:28', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8492a5015e849432820002', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 16:07:38', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8496cb015e8496fee90001', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 16:10:41', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8496cb015e8511a65f0002', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 18:24:40', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8496cb015e8541674d0003', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 19:16:49', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8496cb015e856d9d0a0004', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 20:05:06', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8496cb015e856f81b10005', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 20:07:11', '5', '送货单(编号:20170906300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8496cb015e8570ff150006', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 20:08:48', '5', '送货单(编号:20170906300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8496cb015e857284070007', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 20:10:28', '5', '送货单(编号:20170906300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e85739e015e857415a90001', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 20:12:11', '5', '送货单(编号:20170906300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e857c75015e857d14080001', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 20:22:00', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e857c75015e857d58870004', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 20:22:17', '5', '送货单(编号:20170906300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e857c75015e8581354f0007', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 20:26:31', '5', '送货单(编号:20170906300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e857c75015e85815ab8000c', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 20:26:40', '5', '送货单(编号:20170906300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e857c75015e8583a93b000d', '402882be46404313014640b7eb1c000f', '1', '2017-09-15 20:29:11', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b2fcb015e8b308ad90001', '402882be46404313014640b7eb1c000f', '1', '2017-09-16 22:56:07', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b2fcb015e8b31aafa0008', '402882be46404313014640b7eb1c000f', '1', '2017-09-16 22:57:21', '5', '送货单(编号:20170906300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b2fcb015e8b329f560014', '402882be46404313014640b7eb1c000f', '1', '2017-09-16 22:58:24', '3', '生产单(编号:20170916300001)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b2fcb015e8b389dfa001e', '402882be46404313014640b7eb1c000f', '1', '2017-09-16 23:04:57', '3', '生产单(编号:20170916300002)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b2fcb015e8b3b88d40020', '402882be46404313014640b7eb1c000f', '1', '2017-09-16 23:08:08', '5', '订单ID: 4028d9815e8b2fcb015e8b3b88cb001f更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b2fcb015e8b3be1c60022', '402882be46404313014640b7eb1c000f', '1', '2017-09-16 23:08:31', '5', '订单(编号:20170916100001)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b2fcb015e8b3c15df0024', '402882be46404313014640b7eb1c000f', '1', '2017-09-16 23:08:44', '5', '订单(编号:20170916100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b2fcb015e8b3cafae0026', '402882be46404313014640b7eb1c000f', '1', '2017-09-16 23:09:23', '5', '订单(编号:20170916100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b2fcb015e8b3cf27c0027', '402882be46404313014640b7eb1c000f', '1', '2017-09-16 23:09:40', '5', '订单ID: 4028d9815e8b2fcb015e8b3b88cb001f更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b2fcb015e8b3d67000031', '402882be46404313014640b7eb1c000f', '1', '2017-09-16 23:10:10', '3', '生产单(编号:20170916300003)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b2fcb015e8b4308c50039', '402882be46404313014640b7eb1c000f', '1', '2017-09-16 23:16:19', '3', '生产单(编号:20170916300004)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b2fcb015e8b43daf8003a', '402882be46404313014640b7eb1c000f', '1', '2017-09-16 23:17:13', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b2fcb015e8b4531d10043', '402882be46404313014640b7eb1c000f', '1', '2017-09-16 23:18:41', '3', '生产单(编号:20170916300005)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8b5cebfb0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-16 23:44:36', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8b6ec0860003', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 00:04:04', '5', '订单(编号:20170916100001)下的产品: 2332134更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8b6eeade0005', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 00:04:15', '5', '订单(编号:20170916100001)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8b6f59d80007', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 00:04:44', '5', '订单(编号:20170916100001)下的产品: 包括更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8b6fad3b0009', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 00:05:05', '5', '订单(编号:20170916100001)下的产品: 包括更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8ba6713f000a', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:04:54', '5', '订单(编号:20170916100001)下的产品: 包括更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8ba6ed04000b', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:05:26', '5', '订单(编号:20170916100001)下的产品: 包括更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8ba8b6eb000c', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:07:23', '5', '订单(编号:20170916100001)下的产品: 包括更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8ba90a43000d', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:07:44', '5', '订单(编号:20170916100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8baa7d6a000e', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:09:19', '5', '订单(编号:20170916100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8baf97e9000f', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:14:54', '5', '订单(编号:20170916100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8bb088250010', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:15:55', '5', '订单(编号:20170916100001)下的产品: 2332134更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8bb0ba290011', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:16:08', '5', '订单(编号:20170916100001)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8bb3b7c40012', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:19:24', '5', '订单(编号:20170916100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8bb6afc10014', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:22:39', '5', '订单(编号:20170916100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8bb6d2360016', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:22:47', '5', '订单(编号:20170916100001)下的产品: 2332134更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8bb6fa740017', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:22:58', '4', '订单(编号:20170916100001)下的产品: 包括删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8bb7073f0018', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:23:01', '4', '订单(编号:20170916100001)下的产品: 2332134删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8bb725ad0019', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:23:09', '4', '订单(编号:20170916100001)下的产品: 2332134删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8bb73745001a', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:23:13', '4', '订单(编号:20170916100001)下的产品: 2332134删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8bb74845001b', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:23:18', '4', '订单(编号:20170916100001)下的产品: 测试1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8bbad6a0001d', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:27:11', '5', '订单(编号:20170916100001)下的产品: 1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8bbafa2e001f', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:27:20', '5', '订单(编号:20170916100001)下的产品: 5555更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8bbb12500020', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:27:26', '4', '订单(编号:20170916100001)下的产品: 测试1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8bbb1ece0021', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:27:29', '4', '订单(编号:20170916100001)下的产品: 1删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8bbb49560023', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:27:40', '5', '订单(编号:20170916100001)下的产品: 5555更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8bbba0bf0024', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:28:03', '5', '订单(编号:20170916100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8bbc06c90025', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:28:29', '5', '订单(编号:20170916100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8bbc429c0026', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:28:44', '5', '订单(编号:20170916100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8b5c5e015e8bbdca5c0027', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 01:30:24', '5', '订单(编号:20170916100001)下的产品: 测试1更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8e5e83015e8e5f24eb0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 13:45:53', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8e5e83015e8e7a793c0002', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 14:15:44', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8e5e83015e8e89d6f10009', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 14:32:31', '3', '送货单(编号:20170917300001)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8e5e83015e8e8df8820010', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 14:37:02', '3', '送货单(编号:20170917300002)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8e5e83015e8e8e46960016', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 14:37:22', '5', '送货单(编号:20170917300002)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8e5e83015e8e8f1a44001c', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 14:38:16', '5', '送货单(编号:20170917300002)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e8e9d0a015e8e9df37e0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-17 14:54:29', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e932360015e93244bc40001', '402882be46404313014640b7eb1c000f', '1', '2017-09-18 11:59:42', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e932360015e9330c3be0002', '402882be46404313014640b7eb1c000f', '1', '2017-09-18 12:13:20', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e933a0f015e933ac33b0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-18 12:24:15', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e933a0f015e933df0510002', '402882be46404313014640b7eb1c000f', '1', '2017-09-18 12:27:43', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e933a0f015e935067100003', '402882be46404313014640b7eb1c000f', '1', '2017-09-18 12:47:53', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815e933a0f015e935233000004', '402882be46404313014640b7eb1c000f', '1', '2017-09-18 12:49:51', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ead3410015ead35a0240001', '402882be46404313014640b7eb1c000f', '1', '2017-09-23 13:28:46', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ead3410015ead3ba8580002', '402882be46404313014640b7eb1c000f', '1', '2017-09-23 13:35:21', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ead3410015ead3ff0720003', '402882be46404313014640b7eb1c000f', '1', '2017-09-23 13:40:02', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ead3410015ead4118870004', '402882be46404313014640b7eb1c000f', '1', '2017-09-23 13:41:18', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ead4262015ead42d27c0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-23 13:43:11', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ead4262015ead4369070002', '402882be46404313014640b7eb1c000f', '1', '2017-09-23 13:43:49', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ead4262015ead4f2f0a0003', '402882be46404313014640b7eb1c000f', '1', '2017-09-23 13:56:41', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ead4262015ead52c03e0004', '402882be46404313014640b7eb1c000f', '1', '2017-09-23 14:00:35', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ead69b8015ead6a542c0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-23 14:26:20', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ead69b8015ead78fdc10002', '402882be46404313014640b7eb1c000f', '1', '2017-09-23 14:42:21', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ead69b8015eadc54b010003', '402882be46404313014640b7eb1c000f', '1', '2017-09-23 16:05:41', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815eaf7459015eaf7567620001', '402882be46404313014640b7eb1c000f', '1', '2017-09-23 23:57:40', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815eaf7459015eaf77b2980002', '402882be46404313014640b7eb1c000f', '1', '2017-09-24 00:00:10', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815eaf7daa015eaf7e4e170001', '402882be46404313014640b7eb1c000f', '1', '2017-09-24 00:07:23', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815eaf7daa015eaf7f328e0002', '402882be46404313014640b7eb1c000f', '1', '2017-09-24 00:08:22', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815eaf7daa015eaf8218a00003', '402882be46404313014640b7eb1c000f', '1', '2017-09-24 00:11:32', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec79fa0015ec7a0aac30001', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 16:35:49', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec79fa0015ec7a15d0e0002', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 16:36:34', '5', '订单(编号:20170916100001)下的产品: 43434更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec79fa0015ec7ab2b0e0003', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 16:47:17', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec79fa0015ec7adc4eb0004', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 16:50:07', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec7c641015ec7c6c4340001', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 17:17:25', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec7d23a015ec7d60b0e0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 17:34:07', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec7da99015ec7daeff30001', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 17:39:27', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec7f3f2015ec7f43e700001', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 18:07:06', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec804be015ec80550da0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 18:25:45', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec8301e015ec830ab010001', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 19:13:06', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec8344b015ec8347f4f0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 19:17:17', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec83857015ec8389fe20001', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 19:21:47', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec83857015ec83b77b10002', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 19:24:54', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec849842e0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 19:40:14', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec84ed7700003', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 19:46:03', '3', '订单ID: 4028d9815e8b2fcb015e8b3b88cb001f下的产品1234567891234567891234567891234546789及其订单信息插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec84f04f20005', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 19:46:15', '5', '订单(编号:20170916100001)下的产品: 1234567891234567891234567891234546789更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec84f79a3000e', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 19:46:45', '5', '生产单(编号:20170916300004)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec851f66d000f', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 19:49:28', '4', '订单(编号:20170916100001)下的产品: 1234567891234567891234567891234546789删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec8534b040011', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 19:50:55', '3', '产品： 测试长度插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec85383380013', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 19:51:09', '5', '订单(编号:20170916100001)下的产品: 测试长度更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec8539dc10015', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 19:51:16', '5', '订单(编号:20170916100001)下的产品: 测试长度更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec853cf920017', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 19:51:29', '5', '订单(编号:20170916100001)下的产品: 测试长度更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec853f3370019', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 19:51:38', '5', '订单(编号:20170916100001)下的产品: 测试长度更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec8541a84001b', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 19:51:48', '5', '订单(编号:20170916100001)下的产品: 测试长度更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec854a49e0028', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 19:52:23', '5', '生产单(编号:20170916300004)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec85959000035', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 19:57:32', '5', '生产单(编号:20170916300004)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec85b5f4b0042', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 19:59:44', '5', '生产单(编号:20170916300004)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec8623eef0045', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 20:07:15', '5', '生产单(编号:20170912300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec86764ad0047', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 20:12:52', '5', '订单(编号:20170916100001)下的产品: 1234567891234567891234567891234546789更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec867c58a0054', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 20:13:17', '5', '生产单(编号:20170916300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec86fb6460055', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 20:21:57', '5', '产品: 测试长度更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec876c81a0057', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 20:29:41', '3', '订单ID: 4028d9815e8b2fcb015e8b3b88cb001f下的产品侧的萨达是打算打算的的啊及其订单信息插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec87929d40059', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 20:32:17', '5', '订单(编号:20170916100001)下的产品: 侧的萨达是打算打算的的啊更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ec84766015ec87979420068', '402882be46404313014640b7eb1c000f', '1', '2017-09-28 20:32:37', '5', '生产单(编号:20170916300004)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ecb8b5f015ecb96ca820001', '402882be46404313014640b7eb1c000f', '1', '2017-09-29 11:03:30', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ecbac07015ecbac428e0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-29 11:26:57', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ecbac07015ecbadc3430002', '402882be46404313014640b7eb1c000f', '1', '2017-09-29 11:28:36', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ecbb0b3015ecbb0df5c0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-29 11:31:59', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ed0dfb1015ed0e0c7af0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-30 11:42:25', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ed0fd06015ed13430d60001', '402882be46404313014640b7eb1c000f', '1', '2017-09-30 13:13:32', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ed0fd06015ed13f3cb00002', '402882be46404313014640b7eb1c000f', '1', '2017-09-30 13:25:36', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ed0fd06015ed1411d8b0003', '402882be46404313014640b7eb1c000f', '1', '2017-09-30 13:27:39', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ed0fd06015ed14642900004', '402882be46404313014640b7eb1c000f', '1', '2017-09-30 13:33:16', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ed19753015ed198c91d0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-30 15:03:24', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ed19753015ed19d10170002', '402882be46404313014640b7eb1c000f', '1', '2017-09-30 15:08:05', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ed1aa47015ed1ab74ba0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-30 15:23:48', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ed1aa47015ed1dbc3180002', '402882be46404313014640b7eb1c000f', '1', '2017-09-30 16:16:34', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ed1aa47015ed1f503dc0003', '402882be46404313014640b7eb1c000f', '1', '2017-09-30 16:44:09', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ed1aa47015ed1f791370004', '402882be46404313014640b7eb1c000f', '1', '2017-09-30 16:46:56', '5', '订单(编号:20170916100001)下的产品: 测试长度更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('8a8a88875ed376c7015ed37c0c9b0001', '402882be46404313014640b7eb1c000f', '1', '2017-09-30 23:51:15', '1', '用户：super登录成功', '10.10.8.7', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ed8ea28015ed8eacd5e0001', '402882be46404313014640b7eb1c000f', '1', '2017-10-02 01:10:20', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ed8f61e015ed8f65f930001', '402882be46404313014640b7eb1c000f', '1', '2017-10-02 01:22:58', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815edaeac6015edb01d51f0001', '402882be46404313014640b7eb1c000f', '1', '2017-10-02 10:54:43', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ef2296a015ef23057ac0001', '402882be46404313014640b7eb1c000f', '1', '2017-10-06 22:56:47', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ef2296a015ef238fcd30006', '402882be46404313014640b7eb1c000f', '1', '2017-10-06 23:06:14', '4', '订单(：4028d9815ef2296a015ef2365e990004)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ef2296a015ef23e94d5000d', '402882be46404313014640b7eb1c000f', '1', '2017-10-06 23:12:21', '4', '订单(：4028d9815ef2296a015ef23e6d65000b,4028d9815ef2296a015ef23dd2040009,4028d9815ef2296a015ef23d04c10007)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ef2486c015ef24f23c40007', '402882be46404313014640b7eb1c000f', '1', '2017-10-06 23:30:26', '4', '订单(：4028d9815ef2486c015ef24eced70003,4028d9815ef2486c015ef24c76840001,4028d9815ef2296a015ef2419583000e,4028d9815ef2296a015ef234143a0002)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ef2486c015ef25887f6000d', '402882be46404313014640b7eb1c000f', '1', '2017-10-06 23:40:41', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ef2486c015ef2783f0c0028', '402882be46404313014640b7eb1c000f', '1', '2017-10-07 00:15:20', '5', '送货单(编号:20170917300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ef2801e015ef28080ad0001', '402882be46404313014640b7eb1c000f', '1', '2017-10-07 00:24:21', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ef2801e015ef2814228000d', '402882be46404313014640b7eb1c000f', '1', '2017-10-07 00:25:10', '5', '送货单(编号:20170917300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ef2801e015ef282537d001c', '402882be46404313014640b7eb1c000f', '1', '2017-10-07 00:26:20', '5', '送货单(编号:20170917300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ef2801e015ef28302b80022', '402882be46404313014640b7eb1c000f', '1', '2017-10-07 00:27:05', '5', '送货单(编号:20170917300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ef2801e015ef2837df90023', '402882be46404313014640b7eb1c000f', '1', '2017-10-07 00:27:37', '4', '订单(：4028d9815ef2801e015ef282448a0012,4028d9815ef2801e015ef2820c110010,4028d9815ef2801e015ef281c253000e,4028d9815ef2801e015ef281247e0002,4028d9815ef2486c015ef2781adb001c,4028d9815ef2486c015ef275c3e3001a,4028d9815ef2486c015ef2756d880018,4028d9815ef2486c015ef274decc0016,4028d9815ef2486c015ef26f41130014)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ef2801e015ef283ae550024', '402882be46404313014640b7eb1c000f', '1', '2017-10-07 00:27:49', '4', '订单(：4028d9815ef2486c015ef26da5be0012,4028d9815ef2486c015ef25a073a0010,4028d9815ef2486c015ef258d6ae000e,4028d9815ef2486c015ef256554a000b)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ef2801e015ef283d2b90025', '402882be46404313014640b7eb1c000f', '1', '2017-10-07 00:27:59', '4', '送货单(编号:20170917300001)删除成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ef2801e015ef2860849002c', '402882be46404313014640b7eb1c000f', '1', '2017-10-07 00:30:23', '3', '送货单(编号:20171007300001)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ef2801e015ef2874d4c0030', '402882be46404313014640b7eb1c000f', '1', '2017-10-07 00:31:47', '5', '送货单(编号:20171007300001)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815ef2801e015ef288a0990031', '402882be46404313014640b7eb1c000f', '1', '2017-10-07 00:33:13', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815efa8e23015efa8ed7830001', '402882be46404313014640b7eb1c000f', '1', '2017-10-08 13:56:58', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815efa8e23015efa8f9d7e0004', '402882be46404313014640b7eb1c000f', '1', '2017-10-08 13:57:49', '3', '送货单(编号:201710300001)插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815efba3c4015efba478df0001', '402882be46404313014640b7eb1c000f', '1', '2017-10-08 19:00:13', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815efba3c4015efbac7cc50002', '402882be46404313014640b7eb1c000f', '1', '2017-10-08 19:08:58', '3', '采购计划单ID: 2017100001插入成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815efecf23015efed36dea0001', '402882be46404313014640b7eb1c000f', '1', '2017-10-09 09:50:22', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815efecf23015eff1780060002', '402882be46404313014640b7eb1c000f', '1', '2017-10-09 11:04:43', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815eff3199015eff320ffc0001', '402882be46404313014640b7eb1c000f', '1', '2017-10-09 11:33:44', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815eff3199015eff3306900003', '402882be46404313014640b7eb1c000f', '1', '2017-10-09 11:34:47', '5', '订单(编号:20171007100001)下的产品: 43434更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815eff3199015eff73e5f40004', '402882be46404313014640b7eb1c000f', '1', '2017-10-09 12:45:39', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815effac32015effad1dc50001', '402882be46404313014640b7eb1c000f', '1', '2017-10-09 13:48:08', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815effc819015effc8ba770001', '402882be46404313014640b7eb1c000f', '1', '2017-10-09 14:18:18', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815effc819015f0008dc5a0002', '402882be46404313014640b7eb1c000f', '1', '2017-10-09 15:28:21', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815effc819015f003148bf0003', '402882be46404313014640b7eb1c000f', '1', '2017-10-09 16:12:30', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815effc819015f003349a70012', '402882be46404313014640b7eb1c000f', '1', '2017-10-09 16:14:42', '5', '生产单(编号:20170916300004)更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815f00444f015f004573490001', '402882be46404313014640b7eb1c000f', '1', '2017-10-09 16:34:32', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815f8f678c015f8f6834180001', '402882be46404313014640b7eb1c000f', '1', '2017-11-06 11:38:11', '1', '用户：super登录成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815f8f678c015f8f6b469f0002', '402882be46404313014640b7eb1c000f', '1', '2017-11-06 11:41:33', '5', '仓库: hai更新成功', '192.168.89.1', 'Chrome');
INSERT INTO `sys_log` VALUES ('4028d9815f8f678c015f8fda4bef0003', '402882be46404313014640b7eb1c000f', '1', '2017-11-06 13:42:49', '1', '用户：super登录成功', '10.10.20.119', 'Chrome');
INSERT INTO `sys_log` VALUES ('8a8a94f75f8fe3a9015f8fe6245f0001', '402882be46404313014640b7eb1c000f', '1', '2017-11-06 13:55:45', '5', '仓库: hai更新成功', '10.10.20.119', 'Chrome');
INSERT INTO `sys_log` VALUES ('8a8a94f75f8fe3a9015f8fee64c10003', '402882be46404313014640b7eb1c000f', '1', '2017-11-06 14:04:46', '3', '厂家:华港纸业的外协回执单: 8a8a94f75f8fe3a9015f8fee644e0002插入成功', '10.10.20.119', 'Chrome');
INSERT INTO `sys_log` VALUES ('8a8a94f75f8fff03015f9017131d0001', '402882be46404313014640b7eb1c000f', '1', '2017-11-06 14:49:12', '1', '用户：super登录成功', '10.10.20.119', 'Chrome');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` char(32) NOT NULL COMMENT 'ID',
  `code` varchar(64) DEFAULT NULL COMMENT '菜单编码',
  `name` varchar(64) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(100) DEFAULT NULL COMMENT '链接地址',
  `icon` varchar(64) DEFAULT NULL COMMENT '节点图标',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_man_id` char(32) DEFAULT NULL COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `isleaf` tinyint(1) DEFAULT NULL COMMENT '是否有叶子',
  `iconcls` varchar(64) DEFAULT NULL COMMENT '节点图标CSS类名',
  `expanded` tinyint(1) DEFAULT NULL COMMENT '是否扩展（1-代表扩展，0代表收缩）',
  `enabled` tinyint(1) DEFAULT NULL COMMENT '状态',
  `description` text COMMENT '备注',
  `priority` int(11) DEFAULT NULL COMMENT '排序',
  `create_man_id` char(32) DEFAULT NULL COMMENT '创建人ID',
  `pid` char(32) DEFAULT NULL COMMENT '父节点',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('402880f33e3ae38d013e3b2511250009', 'DICTIONARY_MANAGE', '数据字典', 'sys/dictionary/manage', null, '2013-04-24 00:00:00', null, '2013-12-16 16:17:11', null, null, null, '1', null, '6', '297ea07f3df89479013df895251d0001', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('4028d981494f5aa601494f60ecfc000a', 'MARKET_MANAGE', '营销信息管理', null, 'images/icons/briefcase.png', '2014-10-27 10:13:12', '402882be46404313014640b7eb1c000f', '2014-12-21 23:03:33', null, null, null, null, null, '10', '402882be46404313014640b7eb1c000f', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `sys_menu` VALUES ('297ea07f3da06a5e013da09a94cf0004', 'MENU_MANAGE', '菜单管理', 'sys/menu/manage', 'images/icons/plugins48.png', '2013-03-25 04:11:58', '402882be46404313014640b7eb1c000f', '2014-12-21 23:08:52', null, null, null, '1', null, '5', '测试', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('297ea07f3da06a5e013da099ebcd0003', 'ROLE_MANAGE', '角色管理', 'sys/role/manage', 'images/icons/themes8.png', '2013-03-25 04:11:14', '402882be46404313014640b7eb1c000f', '2014-12-21 23:08:36', null, null, null, '1', null, '4', '测试', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('297ea07f3da06a5e013da09960e30002', 'USER_MANAGE', '用户管理', 'sys/user/manage', 'images/icons/46.png', '2013-03-25 00:00:00', '402882be46404313014640b7eb1c000f', '2014-12-21 23:08:26', null, null, null, '1', null, '3', '测试', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('297ea07f3da06a5e013da098bf150001', 'SYSTEM_MANAGE', '系统管理', null, 'images/icons/l-sjzx.png', '2013-03-25 04:09:57', null, '2013-07-18 16:58:19', null, null, null, '1', null, '17', '测试', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `sys_menu` VALUES ('297ea07f3e35f0a0013e35f8a5e00001', 'LOG_MANAGE', '日志管理', 'sys/log/manage', 'images/icons/9.png', '2013-04-23 16:18:08', '402882be46404313014640b7eb1c000f', '2015-01-08 16:34:37', null, null, null, '1', null, '1', '297ea07f3df89479013df895251d0001', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('297ea07f3da06a5e013da0aee03e0005', 'POWER_MANAGE', '权限管理', 'sys/power/manage', 'images/icons/22.png', '2013-03-25 04:34:08', '402882be46404313014640b7eb1c000f', '2014-12-21 23:08:16', null, null, null, '1', null, '2', '测试', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('297ea07f3f7e6920013f7e6b2e3c0002', 'SYSTEM', 'VDI云管理平台', null, null, '2013-06-26 10:58:40', '402882be46404313014640b7eb1c000f', '2015-01-01 15:37:12', null, null, null, '1', null, '1', '297ea07f3df89479013df895251d0001', null);
INSERT INTO `sys_menu` VALUES ('402890f03feb8eb5013feb9598640003', 'OVERVIEW_MANAGE', '总览', 'bus/overview/manage', 'images/icons/sys_store.png', '2013-07-17 03:43:36', '402882be46404313014640b7eb1c000f', '2014-12-21 23:02:58', null, null, null, '1', null, '1', '297ea07f3df89479013df895251d0001', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `sys_menu` VALUES ('4028888e49cc3b620149cc5540ee00fa', 'FACTORYINFO_MANAGE', '厂家管理', 'bus/factoryInfo/manage', 'images/icons/rss.png', '2014-11-20 16:32:59', '402882be46404313014640b7eb1c000f', '2016-02-04 16:05:15', null, null, null, null, null, '2', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('4028888e49cc3b620149cc56b64800fc', 'CLASSIFY_MANAGE', '分类管理', 'bus/classify/manage', 'images/icons/play.png', '2014-11-20 16:34:35', '402882be46404313014640b7eb1c000f', '2016-02-02 16:56:56', null, null, null, null, null, '4', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('297ea07f40516d39014051bbae940001', 'ICON_MANAGE', '图标管理', 'sys/icon/manage', 'images/icons/comments8.png', '2013-08-06 11:46:28', '402882be46404313014640b7eb1c000f', '2015-01-08 23:03:55', null, null, null, '1', null, '7', null, '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('402882be464c0a0e01464c4f58ed0001', 'AUTH_MANAGE', '注册认证管理', 'sys/auth/manage', 'images/icons/article48.png', '2014-05-30 16:46:46', '402882be46404313014640b7eb1c000f', '2015-02-27 09:08:08', null, null, null, null, null, '10', '402882be46404313014640b7eb1c000f', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('4028888e49cc3b620149cc52cbc900f7', 'SUPPLY_GOOD_MANAGE', '货源信息管理', null, 'images/icons/l-jq.png', '2014-11-20 16:30:18', '402882be46404313014640b7eb1c000f', '2014-12-21 23:06:04', null, null, null, null, null, '15', '402882be46404313014640b7eb1c000f', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `sys_menu` VALUES ('4028888e49cc3b620149cc4028dc0005', 'ORDER_MANAGE', '订单信息管理', 'bus/order/manage', 'images/icons/sale.png', '2014-11-20 16:09:57', '402882be46404313014640b7eb1c000f', '2015-01-21 22:53:25', null, null, null, null, null, '3', '402882be46404313014640b7eb1c000f', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `sys_menu` VALUES ('4028888e49d058530149d05a687a0002', 'PRODUCT_MANAGE', '产品管理', 'bus/product/manage', 'images/icons/18.png', '2014-11-21 11:17:06', '402882be46404313014640b7eb1c000f', '2014-12-21 23:06:16', null, null, null, null, null, '1', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('4028d9814a6d50f1014a6d56d4850074', 'MARKET_SUMMARY', '营销汇总', null, 'images/icons/chart.png', '2014-12-21 22:53:34', '402882be46404313014640b7eb1c000f', '2015-02-28 08:49:15', null, null, null, null, null, '16', '402882be46404313014640b7eb1c000f', '297ea07f3f7e6920013f7e6b2e3c0002');
INSERT INTO `sys_menu` VALUES ('4028d9814a6d50f1014a6d5d00fb0077', 'ORDER_SUMMARY', '订单汇总', 'bus/summary/order/manage', 'images/icons/research.png', '2014-12-21 23:00:19', '402882be46404313014640b7eb1c000f', '2015-02-28 08:50:02', null, null, null, null, null, '1', '402882be46404313014640b7eb1c000f', '4028d9814a6d50f1014a6d56d4850074');
INSERT INTO `sys_menu` VALUES ('4028d9814adc1ba0014adc1db9d90002', 'CUSTOMER_MANAGE', '客户信息管理', 'bus/customer/manage', 'images/icons/46.png', '2015-01-12 11:09:03', null, null, null, null, '1', null, null, '5', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('4028d9814af28328014af32663aa0006', 'PLUGIN_MANAGE', '插件下载管理', 'sys/plugin/manage', 'images/icons/43.png', '2015-01-16 22:29:46', null, null, null, null, '1', null, null, '12', '402882be46404313014640b7eb1c000f', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('4028d9814b17de71014b17e6ec4b0003', 'MADE_MANAGE', '生产单管理', 'bus/madeOrder/manage', 'images/icons/transfer.png', '2015-01-24 01:46:24', '402882be46404313014640b7eb1c000f', '2017-08-21 21:59:06', null, null, null, null, null, '4', '402882be46404313014640b7eb1c000f', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `sys_menu` VALUES ('4028d9814aa3d39e014aa3d617580002', 'SYSTEM_CONFIG_MANAGE', '系统配置管理', 'sys/settings/manage', 'images/icons/5.png', '2015-01-01 12:52:04', '402882be46404313014640b7eb1c000f', '2015-01-01 15:47:18', null, null, null, null, null, '11', '402882be46404313014640b7eb1c000f', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('4028878d4cbc337b014cbc4346ea0003', 'ORDER_DETAIL_SUMMARY', '订单明细汇总', 'bus/summary/orderDetail/manage', 'images/icons/views8.png', '2015-04-15 16:47:47', null, null, null, null, '1', null, null, '2', '402882be46404313014640b7eb1c000f', '4028d9814a6d50f1014a6d56d4850074');
INSERT INTO `sys_menu` VALUES ('402887e64d4635eb014d463780db0002', 'MESSAGE_MANAGE', '消息管理', 'bus/message/manage', 'images/icons/comments8.png', '2015-05-12 11:42:32', null, null, null, null, '1', null, null, '13', '402882be46404313014640b7eb1c000f', '297ea07f3da06a5e013da098bf150001');
INSERT INTO `sys_menu` VALUES ('402887e64de145d5014de14829a40002', 'STOCK_MANAGE', '库存信息管理', 'bus/stock/manage', 'images/icons/25.png', '2015-06-11 14:21:52', null, null, null, null, '1', null, null, '6', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('402887e64e09c689014e09c9cd400003', 'STORE_MANAGE', '仓库信息管理', 'bus/store/manage', 'images/icons/sys_store.png', '2015-06-19 11:08:17', null, null, null, null, '1', null, null, '7', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('4028d981529b18f101529b1d05600002', 'PURCHASE_MANAGE', '采购单管理', 'bus/purchase/manage', 'images/icons/sys_delivery.png', '2016-02-01 12:35:16', null, null, null, null, '1', null, null, '6', '402882be46404313014640b7eb1c000f', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `sys_menu` VALUES ('4028d98152a12d8f0152a131ef810002', 'MATERIEL_MANAGE', '物料管理', 'bus/materiel/manage', 'images/icons/shipping.png', '2016-02-02 16:55:50', null, null, null, null, '1', null, null, '2', '402882be46404313014640b7eb1c000f', '4028888e49cc3b620149cc52cbc900f7');
INSERT INTO `sys_menu` VALUES ('4028d981531790740153179356e60002', 'PURCHASE_DETAIL_SUMMARY', '物料采购明细汇总', 'bus/summary/buyDetail/manage', 'images/icons/calculator.png', '2016-02-25 16:37:25', '402882be46404313014640b7eb1c000f', '2016-02-26 00:16:20', null, null, null, null, null, '4', '402882be46404313014640b7eb1c000f', '4028d9814a6d50f1014a6d56d4850074');
INSERT INTO `sys_menu` VALUES ('4028d9815e0511c1015e0516bf270002', 'DELIVERY_MANAGE', '送货单管理', 'bus/deliveryOrder/manage', 'images/icons/shipping.png', '2017-08-21 21:58:50', '402882be46404313014640b7eb1c000f', '2017-08-25 13:37:13', null, null, null, null, null, '5', '402882be46404313014640b7eb1c000f', '4028d981494f5aa601494f60ecfc000a');
INSERT INTO `sys_menu` VALUES ('4028d9815e21e12a015e21e3a4050002', 'DELIVERY_ORDER_SUMMARY', '送货单明细汇总', 'bus/summary/deliveryDetail/manage', 'images/icons/16.png', '2017-08-27 12:12:00', null, null, null, null, '1', null, null, '3', '402882be46404313014640b7eb1c000f', '4028d9814a6d50f1014a6d56d4850074');

-- ----------------------------
-- Table structure for sys_power
-- ----------------------------
DROP TABLE IF EXISTS `sys_power`;
CREATE TABLE `sys_power` (
  `id` char(32) NOT NULL COMMENT 'ID',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `code` varchar(64) DEFAULT NULL COMMENT '编码',
  `menu_id` char(32) DEFAULT NULL COMMENT '所属模块',
  `enabled` tinyint(1) DEFAULT NULL COMMENT '状态',
  `description` text COMMENT '备注',
  `url` varchar(100) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_man_id` char(32) DEFAULT NULL COMMENT '创建人',
  `update_man_id` char(32) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统操作表';

-- ----------------------------
-- Records of sys_power
-- ----------------------------
INSERT INTO `sys_power` VALUES ('4028820744b428f30144b5765c4b0014', '删除', 'OSVERSION_DELETE', '4028820744b428f30144b5737e44000e', null, null, null, null, '2014-03-12 16:43:56', '297ea07f3df89479013df895251d0001', null, null);
INSERT INTO `sys_power` VALUES ('4028820744b428f30144b576a5210016', '取消', 'OSVERSION_CANCEL', '4028820744b428f30144b5737e44000e', null, null, null, null, '2014-03-12 16:44:15', '297ea07f3df89479013df895251d0001', null, null);
INSERT INTO `sys_power` VALUES ('297ea07f3e346d19013e346e4bb70001', '用户删除', 'USER_DEL', '297ea07f3da06a5e013da09960e30002', null, null, 'sys/user/delete', null, '2013-04-23 09:07:23', '测试', '402882be46404313014640b7eb1c000f', '2015-01-09 22:25:54');
INSERT INTO `sys_power` VALUES ('297ea07f3e34a15b013e34a1e4260001', '用户取消', 'USER_CANCEL', '297ea07f3da06a5e013da09960e30002', null, null, null, null, '2013-04-23 10:03:45', '测试', '297ea07f3df89479013df895251d0001', '2013-08-05 15:21:30');
INSERT INTO `sys_power` VALUES ('297ea07f422b5f8401422b6029390001', '更新', 'MODULE_UPDATE', '297ea07f3feb8b3a013fec311d73002c', null, null, null, null, '2013-11-06 00:00:00', null, null, '2013-12-16 15:30:55');
INSERT INTO `sys_power` VALUES ('297ea07f3e359d13013e359fe4af0003', '用户新增', 'USER_ADD', '297ea07f3da06a5e013da09960e30002', null, null, 'sys/user/savetoAdd', null, '2013-04-23 02:41:38', '297ea07f3df89479013df895251d0001', '402882be46404313014640b7eb1c000f', '2015-01-09 22:25:37');
INSERT INTO `sys_power` VALUES ('297ea07f3e359d13013e35a15ecc0004', '用户编辑', 'USER_EDIT', '297ea07f3da06a5e013da09960e30002', null, null, 'sys/user/savetoUpdate', null, '2013-04-23 02:42:48', '297ea07f3df89479013df895251d0001', '402882be46404313014640b7eb1c000f', '2015-01-09 22:25:47');
INSERT INTO `sys_power` VALUES ('402880e73f3b3caa013f3c5278990014', '新增', 'MENU_ADD', '297ea07f3da06a5e013da09a94cf0004', null, null, 'sys/menu/savetoAdd', null, '2013-06-13 00:00:00', '297ea07f3df89479013df895251d0001', '402882be46404313014640b7eb1c000f', '2015-01-09 22:30:13');
INSERT INTO `sys_power` VALUES ('297ea07f3fc27b1a013fc283e7c30004', '新增', 'ROLE_ADD', '297ea07f3da06a5e013da099ebcd0003', null, null, 'sys/role/savetoAdd', null, '2013-07-09 00:00:00', '297ea07f3df89479013df895251d0001', '402882be46404313014640b7eb1c000f', '2015-01-09 22:28:52');
INSERT INTO `sys_power` VALUES ('4028803c41243da901425956bf8f000b', '新增', 'MODULE_ADD', '297ea07f3feb8b3a013fec311d73002c', null, null, null, null, '2013-11-15 00:00:00', null, null, '2013-12-16 15:30:42');
INSERT INTO `sys_power` VALUES ('4028888e49cc3b620149cc5767e800fe', '新增', 'FACTORY_ADD', '4028888e49cc3b620149cc5540ee00fa', null, null, 'bus/factoryInfo/savetoAdd', null, '2014-11-20 16:35:20', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-09 22:21:41');
INSERT INTO `sys_power` VALUES ('4028888e49cc3b620149cc57ecec0100', '编辑', 'FACTORY_EDIT', '4028888e49cc3b620149cc5540ee00fa', null, null, 'bus/factoryInfo/savetoUpdate', null, '2014-11-20 16:35:54', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-09 22:21:55');
INSERT INTO `sys_power` VALUES ('4028888e49cc3b620149cc584a170102', '删除', 'FACTORY_DELETE', '4028888e49cc3b620149cc5540ee00fa', null, null, 'bus/factoryInfo/delete', null, '2014-11-20 16:36:18', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-09 22:22:02');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa4a77fa0029', '新增', 'TACTICS_ADD', '402890f03feb8eb5013feb9e96c60017', null, null, null, null, '2013-12-16 00:00:00', null, null, '2013-12-16 16:39:21');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa4af7a1002c', '更新', 'TACTICS_UPDATE', '402890f03feb8eb5013feb9e96c60017', null, null, null, null, '2013-12-16 15:24:46', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa4b81db002e', '删除', 'TACTICS_DELETE', '402890f03feb8eb5013feb9e96c60017', null, null, null, null, '2013-12-16 15:25:21', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa4cd40b0032', '新增', 'STOR_ADD', '402890f03feb8eb5013feba2fa900019', null, null, null, null, '2013-12-16 15:26:48', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa4d1b4d0034', '更新', 'STOR_UPDATE', '402890f03feb8eb5013feba2fa900019', null, null, null, null, '2013-12-16 15:27:06', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa4d79c60036', '删除', 'STOR_DELETE', '402890f03feb8eb5013feba2fa900019', null, null, null, null, '2013-12-16 15:27:30', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa513013003e', '删除', 'MODULE_DELETE', '297ea07f3feb8b3a013fec311d73002c', null, null, null, null, '2013-12-16 15:31:34', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa5cb32c006e', '取消', 'POWER_CANCEL', '297ea07f3da06a5e013da0aee03e0005', null, null, null, null, '2013-12-16 15:44:08', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa568f3a0055', '新增', 'POWER_ADD', '297ea07f3da06a5e013da0aee03e0005', null, null, 'sys/power/savetoAdd', null, '2013-12-16 15:37:26', null, '402882be46404313014640b7eb1c000f', '2015-01-09 22:24:34');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa56c2fb0057', '更新', 'POWER_UPDATE', '297ea07f3da06a5e013da0aee03e0005', null, null, 'sys/power/savetoUpdate', null, '2013-12-16 15:37:39', null, '402882be46404313014640b7eb1c000f', '2015-01-09 22:24:55');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa56fa3a0059', '删除', 'POWER_DELETE', '297ea07f3da06a5e013da0aee03e0005', null, null, 'sys/power/delete', null, '2013-12-16 15:37:53', null, '402882be46404313014640b7eb1c000f', '2015-01-09 22:25:09');
INSERT INTO `sys_power` VALUES ('402882a542ff39ce0142ff3dcc000003', '密码初始化', 'USER_RESET', '297ea07f3da06a5e013da09960e30002', null, null, 'sys/user/pwdReset', null, '2013-12-17 14:28:29', '297ea07f3df89479013df895251d0001', '402882be46404313014640b7eb1c000f', '2015-01-09 22:26:33');
INSERT INTO `sys_power` VALUES ('402882a542ff39ce0142ff98687300c2', '排序', 'DICTIONARY_SORT', '402880f33e3ae38d013e3b2511250009', null, null, null, null, '2013-12-17 16:07:27', '297ea07f3df89479013df895251d0001', null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa657141007b', '更新', 'ROLE_UPDATE', '297ea07f3da06a5e013da099ebcd0003', null, null, 'sys/role/savetoUpdate', null, '2013-12-16 15:53:41', null, '402882be46404313014640b7eb1c000f', '2015-01-09 22:29:04');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa65a09a007d', '删除', 'ROLE_DELETE', '297ea07f3da06a5e013da099ebcd0003', null, null, 'sys/role/delete', null, '2013-12-16 15:53:53', null, '402882be46404313014640b7eb1c000f', '2015-01-09 22:29:14');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa66642f0081', '取消', 'ROLE_CANCEL', '297ea07f3da06a5e013da099ebcd0003', null, null, null, null, '2013-12-16 15:54:43', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542ff39ce0142ff9818ea00c0', '排序', 'MENU_SORT', '297ea07f3da06a5e013da09a94cf0004', null, null, null, null, '2013-12-17 16:07:07', '297ea07f3df89479013df895251d0001', null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa67520a0086', '更新', 'MENU_UPDATE', '297ea07f3da06a5e013da09a94cf0004', null, null, 'sys/menu/savetoUpdate', null, '2013-12-16 15:55:44', null, '402882be46404313014640b7eb1c000f', '2015-01-09 22:30:26');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6788950088', '删除', 'MENU_DELETE', '297ea07f3da06a5e013da09a94cf0004', null, null, 'sys/menu/delete', null, '2013-12-16 15:55:58', null, '402882be46404313014640b7eb1c000f', '2015-01-09 22:30:33');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa681215008c', '取消', 'MENU_CANCEL', '297ea07f3da06a5e013da09a94cf0004', null, null, null, null, '2013-12-16 15:56:33', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa686b09008e', '保存', 'MENU_SAVE', '297ea07f3da06a5e013da09a94cf0004', null, null, null, null, '2013-12-16 15:56:56', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa693feb0092', '展开', 'MENU_EXPAND', '297ea07f3da06a5e013da09a94cf0004', null, null, null, null, '2013-12-16 00:00:00', null, null, '2013-12-17 14:26:40');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa69a7650094', '收缩', 'MENU_SHRINK', '297ea07f3da06a5e013da09a94cf0004', null, null, null, null, '2013-12-16 00:00:00', null, null, '2013-12-17 14:26:03');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6a1f710096', '新增', 'DICTIONARY_ADD', '402880f33e3ae38d013e3b2511250009', null, null, null, null, '2013-12-16 00:00:00', null, null, '2013-12-17 14:26:03');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6a58560098', '更新', 'DICTIONARY_UPDATE', '402880f33e3ae38d013e3b2511250009', null, null, null, null, '2013-12-16 15:59:02', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6a9a17009a', '删除', 'DICTIONARY_DELETE', '402880f33e3ae38d013e3b2511250009', null, null, null, null, '2013-12-16 15:59:19', null, null, null);
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6b7333009e', '取消', 'DICTIONARY_CANCEL', '402880f33e3ae38d013e3b2511250009', null, null, null, null, '2013-12-16 16:00:15', null, null, '2013-12-16 16:44:58');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6bbf9400a0', '保存', 'DICTIONARY_SAVE', '402880f33e3ae38d013e3b2511250009', null, null, null, null, '2013-12-16 00:00:00', null, null, '2013-12-16 16:39:32');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6c32a000a2', '展开', 'DICTIONARY_EXPAND', '402880f33e3ae38d013e3b2511250009', null, null, null, null, '2013-12-16 00:00:00', null, null, '2013-12-16 16:39:58');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6c7fe300a4', '收缩', 'DICTIONARY_SHRINK', '402880f33e3ae38d013e3b2511250009', null, null, null, null, '2013-12-16 00:00:00', null, null, '2013-12-16 16:39:27');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6d0b8000a6', '新增', 'ICON_ADD', '297ea07f40516d39014051bbae940001', null, null, 'sys/icon/savetoAdd', null, '2013-12-16 12:00:00', null, '402882be46404313014640b7eb1c000f', '2015-01-09 22:31:18');
INSERT INTO `sys_power` VALUES ('402882a542fa2d9f0142fa6d6cdc00a8', '删除', 'ICON_DELETE', '297ea07f40516d39014051bbae940001', null, null, 'sys/icon/delete', null, '2013-12-16 00:00:00', null, '402882be46404313014640b7eb1c000f', '2015-01-09 22:31:27');
INSERT INTO `sys_power` VALUES ('4028820744b428f30144b575724f0010', '新增', 'OSVERSION_ADD', '4028820744b428f30144b5737e44000e', null, null, null, null, '2014-03-12 16:42:56', '297ea07f3df89479013df895251d0001', null, null);
INSERT INTO `sys_power` VALUES ('4028820744b428f30144b575f9440012', '更新', 'OSVERSION_UPDATE', '4028820744b428f30144b5737e44000e', null, null, null, null, '2014-03-12 16:43:31', '297ea07f3df89479013df895251d0001', null, null);
INSERT INTO `sys_power` VALUES ('4028888e49d001580149d006b1f60003', '新增', 'CLASSIFY_ADD', '4028888e49cc3b620149cc56b64800fc', null, null, 'bus/classify/savetoAdd', null, '2014-11-21 09:45:40', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:01:25');
INSERT INTO `sys_power` VALUES ('4028888e49d001580149d006e7a90005', '删除', 'CLASSIFY_DELETE', '4028888e49cc3b620149cc56b64800fc', null, null, 'bus/classify/delete', null, '2014-11-21 09:45:53', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:01:22');
INSERT INTO `sys_power` VALUES ('4028888e49d001580149d007288c0007', '编辑', 'CLASSIFY_UPDATE', '4028888e49cc3b620149cc56b64800fc', null, null, 'bus/classify/savetoUpdate', null, '2014-11-21 09:46:10', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:01:15');
INSERT INTO `sys_power` VALUES ('4028888e49d001580149d00764c00009', '取消', 'CLASSIFY_CANCEL', '4028888e49cc3b620149cc56b64800fc', null, null, null, null, '2014-11-21 09:46:25', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:00:49');
INSERT INTO `sys_power` VALUES ('4028888e49d058530149d05b18b70004', '新增', 'PRODUCT_ADD', '4028888e49d058530149d05a687a0002', null, null, 'bus/product/savetoAdd', null, '2014-11-21 11:17:51', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-09 22:14:17');
INSERT INTO `sys_power` VALUES ('4028888e49d058530149d05b8c200006', '编辑', 'PRODUCT_EDIT', '4028888e49d058530149d05a687a0002', null, null, 'bus/product/savetoUpdate', null, '2014-11-21 11:18:20', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-09 22:05:47');
INSERT INTO `sys_power` VALUES ('4028888e49d058530149d05bdddf0008', '删除', 'PRODUCT_DELETE', '4028888e49d058530149d05a687a0002', null, null, 'bus/product/delete', null, '2014-11-21 11:18:41', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-09 22:05:59');
INSERT INTO `sys_power` VALUES ('4028d98149d2bf470149d2c235070002', '取消', 'PRODUCT_CANCEL', '4028888e49d058530149d05a687a0002', null, null, null, null, '2014-11-21 22:29:43', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d98149d5445f0149d54bfe900002', '添加产品分类', 'CLASSIFY_IN', '4028888e49cc3b620149cc56b64800fc', null, null, null, null, '2014-11-22 10:19:27', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:14:46');
INSERT INTO `sys_power` VALUES ('4028888e49df4da30149df57b75e0003', '去除产品分类', 'CLASSIFY_OUT', '4028888e49cc3b620149cc56b64800fc', null, null, null, null, '2014-11-24 09:08:28', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:14:49');
INSERT INTO `sys_power` VALUES ('4028888e49dfa6d80149dfa877380002', '添加产品', 'PRODUCT_IN', '4028888e49d058530149d05a687a0002', null, null, null, null, '2014-11-24 10:36:40', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2014-11-24 12:52:53');
INSERT INTO `sys_power` VALUES ('4028888e49dfa6d80149dfa8f3340004', '去除产品', 'PRODUCT_OUT', '4028888e49d058530149d05a687a0002', null, null, null, null, '2014-11-24 10:37:11', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2014-11-24 12:52:41');
INSERT INTO `sys_power` VALUES ('4028888e49e4f0c30149e4fe85780003', '禁用', 'PRODUCT_DISABLE', '4028888e49d058530149d05a687a0002', null, null, null, null, '2014-11-25 11:28:45', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-09 22:17:20');
INSERT INTO `sys_power` VALUES ('4028888e49e4f0c30149e4ff07fa0005', '启用', 'PRODUCT_ENABLE', '4028888e49d058530149d05a687a0002', null, null, null, null, '2014-11-25 11:29:19', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-09 22:14:58');
INSERT INTO `sys_power` VALUES ('4028888e49e4f0c30149e4ffb6c40007', '禁用', 'CLASSIFY_DISABLE', '4028888e49cc3b620149cc56b64800fc', null, null, null, null, '2014-11-25 11:30:04', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:14:25');
INSERT INTO `sys_power` VALUES ('4028888e49e4f0c30149e5001fc20009', '启用', 'CLASSIFY_ENABLE', '4028888e49cc3b620149cc56b64800fc', null, null, null, null, '2014-11-25 11:30:30', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:14:36');
INSERT INTO `sys_power` VALUES ('4028888e49e62c670149e62dd2d00002', '禁用', 'FACTORY_DISABLE', '4028888e49cc3b620149cc5540ee00fa', null, null, null, null, '2014-11-25 17:00:03', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028888e49e62c670149e62e58aa0004', '启用', 'FACTORY_ENABLE', '4028888e49cc3b620149cc5540ee00fa', null, null, null, null, '2014-11-25 17:00:37', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028888e49f4ba790149f5015668000a', '保存', 'PRODUCT_SAVE', '4028888e49d058530149d05a687a0002', null, null, null, null, '2014-11-28 14:05:45', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-09 22:14:13');
INSERT INTO `sys_power` VALUES ('4028888e49f4ba790149f5030ae1000c', '保存', 'CLASSIFY_COMMIT', '4028888e49cc3b620149cc56b64800fc', null, null, null, null, '2014-11-28 14:07:37', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:15:50');
INSERT INTO `sys_power` VALUES ('4028d9814b0cfc2a014b0d0001fe0008', '删除', 'ORDER_DELETE', '4028888e49cc3b620149cc4028dc0005', null, null, 'bus/order/delete', null, '2015-01-21 22:57:59', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814b0cfc2a014b0d00602b000a', '刷新', 'ORDER_REFRESH', '4028888e49cc3b620149cc4028dc0005', null, null, null, null, '2015-01-21 22:58:23', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814b0cfc2a014b0d00d06c000c', 'excel导出', 'ORDER_EXPORT', '4028888e49cc3b620149cc4028dc0005', null, null, null, null, '2015-01-21 22:58:52', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-03-22 21:51:19');
INSERT INTO `sys_power` VALUES ('4028d9814b1275e3014b127b01b90002', '产品增加', 'ORDER_PRODUCT_ADD', '4028888e49cc3b620149cc4028dc0005', null, null, 'bus/orderDetail/savetoAdd', null, '2015-01-23 00:30:26', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-23 14:16:54');
INSERT INTO `sys_power` VALUES ('4028d9814b1275e3014b127b9dcc0004', '产品编辑', 'ORDER_PRODUCT_UPDATE', '4028888e49cc3b620149cc4028dc0005', null, null, 'bus/orderDetail/savetoUpdate', null, '2015-01-23 00:31:06', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-04-15 13:19:41');
INSERT INTO `sys_power` VALUES ('4028d9814b1275e3014b127c85a60006', '产品删除', 'ORDER_PRODUCT_DELETE', '4028888e49cc3b620149cc4028dc0005', null, null, 'bus/orderDetail/delete', null, '2015-01-23 00:32:05', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-23 14:16:40');
INSERT INTO `sys_power` VALUES ('4028d9814b1275e3014b12821a940009', '产品保存', 'ORDER_PRODUCT_SAVE', '4028888e49cc3b620149cc4028dc0005', null, null, null, null, '2015-01-23 00:38:11', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814b1275e3014b1282a983000b', '产品修改取消', 'ORDER_PRODUCT_CANCEL', '4028888e49cc3b620149cc4028dc0005', null, null, null, null, '2015-01-23 00:38:47', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814b38a40a014b38beb1b60002', '添加实际数量', 'UPDATE_NUMBER', '4028d9814b17de71014b17e6ec4b0003', null, null, null, null, '2015-01-30 10:49:56', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814adc8f1e014adc9157b40006', '删除', 'CUSTOMER_DELETE', '4028d9814adc1ba0014adc1db9d90002', null, null, 'bus/customer/delete', null, '2015-01-12 13:15:20', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814adc8f1e014adc91c4760008', '禁用', 'CUSTOMER_DISABLE', '4028d9814adc1ba0014adc1db9d90002', null, null, null, null, '2015-01-12 13:15:48', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814adc8f1e014adc92168c000a', '选择启用客户', 'CUSTOMER_ENABLE', '4028d9814adc1ba0014adc1db9d90002', null, null, null, null, '2015-01-12 13:16:09', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814b0cfc2a014b0cfdbe820002', '制单', 'ORDER_ADD', '4028888e49cc3b620149cc4028dc0005', null, null, 'bus/order/savetoAdd', null, '2015-01-21 22:55:30', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-23 00:32:59');
INSERT INTO `sys_power` VALUES ('4028d9814b0cfc2a014b0cfec1e80004', '编辑', 'ORDER_EDIT', '4028888e49cc3b620149cc4028dc0005', null, null, 'bus/order/savetoUpdate', null, '2015-01-21 22:56:37', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-01-21 22:57:17');
INSERT INTO `sys_power` VALUES ('4028d9814adc8f1e014adc9051e10002', '新增', 'CUSTOMER_ADD', '4028d9814adc1ba0014adc1db9d90002', null, null, 'bus/customer/savetoAdd', null, '2015-01-12 13:14:13', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814adc8f1e014adc90e72a0004', '编辑', 'CUSTOMER_EDIT', '4028d9814adc1ba0014adc1db9d90002', null, null, 'bus/customer/savetoUpdate', null, '2015-01-12 13:14:51', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('f36328d24baf6b7f014baf713ed00008', '打印显示金额', 'SHOW_PRICE', '4028d9814b17de71014b17e6ec4b0003', null, null, null, null, '2015-02-22 12:00:09', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814bcda404014bcdad9f190004', '刷新', 'ORDER_SUMMARY_REFRESH', '4028d9814a6d50f1014a6d5d00fb0077', null, null, null, null, '2015-02-28 08:54:42', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814bcda404014bcdae284f0006', 'EXCEL导出', 'ORDER_SUMMARY_EXPORT', '4028d9814a6d50f1014a6d5d00fb0077', null, null, null, null, '2015-02-28 08:55:17', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814bdf7468014bdf7be2720002', '外协回执单新增', 'OUTSIDE_ADD', '4028888e49cc3b620149cc5540ee00fa', null, null, 'bus/outsourcDetail/savetoAdd', null, '2015-03-03 19:53:33', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-03-03 22:23:51');
INSERT INTO `sys_power` VALUES ('4028d9814bdf7468014bdf7ca3160004', '外协回执单编辑', 'OUTSIDE_EDIT', '4028888e49cc3b620149cc5540ee00fa', null, null, 'bus/outsourcDetail/savetoUpdate', null, '2015-03-03 19:54:22', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-03-03 22:23:44');
INSERT INTO `sys_power` VALUES ('4028d9814bdf7468014bdf7d7be80006', '外协回执单删除', 'OUTSIDE_DELETE', '4028888e49cc3b620149cc5540ee00fa', null, null, 'bus/outsourcDetail/delete', null, '2015-03-03 19:55:17', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-03-03 22:23:32');
INSERT INTO `sys_power` VALUES ('4028d9814bdf7468014bdf7e2b0d0008', '附件编辑', 'ATT_EDIT', '4028888e49cc3b620149cc5540ee00fa', null, null, null, null, '2015-03-03 19:56:02', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814c3a9999014c3a9cb0f20002', '订单产品及其明细添加', 'ORDER_PRODUCT_INFO_ADD', '4028888e49cc3b620149cc4028dc0005', null, null, 'bus/order/product/savetoAdd', null, '2015-03-21 12:34:49', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-03-21 14:31:11');
INSERT INTO `sys_power` VALUES ('4028d9814c40d654014c41c163ef0005', 'excel导出', 'OUTSIDE_EXPORT', '4028888e49cc3b620149cc5540ee00fa', null, null, null, null, '2015-03-22 21:52:15', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9814c4be3cf014c4be79b030002', '返单', 'ORDER_REORDER', '4028888e49cc3b620149cc4028dc0005', null, null, 'bus/order/reorder/savetoAdd', null, '2015-03-24 21:10:11', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-03-25 21:14:46');
INSERT INTO `sys_power` VALUES ('4028878d4cbb5fff014cbb838f880021', '生产单编辑', 'PRODUCE_EDIT', '4028d9814b17de71014b17e6ec4b0003', null, null, 'bus/produce/savetoUpdate', null, '2015-04-15 13:18:23', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-04-15 13:20:29');
INSERT INTO `sys_power` VALUES ('402887e64de14c13014de15834d20002', '新增', 'STOCK_ADD', '402887e64de145d5014de14829a40002', null, null, 'bus/stock/savetoAdd', null, '2015-06-11 14:39:23', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('402887e64de14c13014de158bb700004', '编辑', 'STOCK_EDIT', '402887e64de145d5014de14829a40002', null, null, 'bus/stock/savetoUpdate', null, '2015-06-11 14:39:58', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('402887e64de14c13014de15918740006', '删除', 'STOCK_DELETE', '402887e64de145d5014de14829a40002', null, null, 'bus/stock/delete', null, '2015-06-11 14:40:22', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('402887e64e09c689014e09cacd120005', '仓库新增', 'STORE_ADD', '402887e64e09c689014e09c9cd400003', null, null, 'bus/store/savetoAdd', null, '2015-06-19 11:09:22', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('402887e64e09c689014e09cb96310007', '仓库修改', 'STORE_UPDATE', '402887e64e09c689014e09c9cd400003', null, null, 'bus/store/savetoUpdate', null, '2015-06-19 11:10:14', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('402887e64e09c689014e09cc6d040009', '仓库删除', 'STORE_DELETE', '402887e64e09c689014e09c9cd400003', null, null, null, null, '2015-06-19 11:11:09', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2015-06-19 12:41:19');
INSERT INTO `sys_power` VALUES ('402887e64e09c689014e09ccbab2000b', '仓库禁用', 'STORE_DISABLE', '402887e64e09c689014e09c9cd400003', null, null, null, null, '2015-06-19 11:11:28', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('402887e64e09c689014e09ccf0d1000d', '仓库启用', 'STORE_ENABLE', '402887e64e09c689014e09c9cd400003', null, null, null, null, '2015-06-19 11:11:42', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:06:07');
INSERT INTO `sys_power` VALUES ('402887e64e09c689014e09cd38db000f', '取消操作', 'STORE_CANCEL', '402887e64e09c689014e09c9cd400003', null, null, null, null, '2015-06-19 11:12:01', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d981529b247901529b2d000b0003', '采购制单', 'PURCHASE_ADD_IN', '4028d981529b18f101529b1d05600002', null, null, 'bus/purchase/savetoAdd', null, '2016-02-01 12:52:43', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d981529b247901529b2e3f320005', '采购单编辑', 'PURCHASE_EDIT', '4028d981529b18f101529b1d05600002', null, null, 'bus/purchase/savetoUpdate', null, '2016-02-01 12:54:05', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d981529b247901529b2ef64a0007', '采购单删除', 'PURCHASE_DELETE', '4028d981529b18f101529b1d05600002', null, null, 'bus/purchase/delete', null, '2016-02-01 12:54:52', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d981529b247901529b2f6d980009', '采购单刷新', 'PURCHASE_REFRESH', '4028d981529b18f101529b1d05600002', null, null, null, null, '2016-02-01 12:55:22', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d98152a12d8f0152a1382197000c', '物料新增', 'MATERIEL_ADD', '4028d98152a12d8f0152a131ef810002', null, null, 'bus/materiel/savetoAdd', null, '2016-02-02 17:02:36', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d98152a12d8f0152a13952f1000e', '物料编辑', 'MATERIEL_EDIT', '4028d98152a12d8f0152a131ef810002', null, null, 'bus/materiel/savetoUpdate', null, '2016-02-02 17:03:54', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d98152a12d8f0152a139f1840010', '物料删除', 'MATERIEL_DELETE', '4028d98152a12d8f0152a131ef810002', null, null, 'bus/materiel/delete', null, '2016-02-02 17:04:35', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d98152a12d8f0152a13aeb360012', '取消', 'MATERIEL_CANCEL', '4028d98152a12d8f0152a131ef810002', null, null, null, null, '2016-02-02 17:05:39', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d98152a12d8f0152a13bc1840015', '启用', 'MATERIEL_ENABLE', '4028d98152a12d8f0152a131ef810002', null, null, null, null, '2016-02-02 17:06:33', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d98152a12d8f0152a13c51980017', '禁用', 'MATERIEL_DISABLE', '4028d98152a12d8f0152a131ef810002', null, null, null, null, '2016-02-02 17:07:10', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d98152a12d8f0152a13ef2a00019', '物料保存', 'MATERIEL_COMMIT', '4028d98152a12d8f0152a131ef810002', null, null, null, null, '2016-02-02 17:10:03', '402882be46404313014640b7eb1c000f', '402882be46404313014640b7eb1c000f', '2016-02-02 17:16:42');
INSERT INTO `sys_power` VALUES ('40288702530787290153079722df0003', '新增', 'BUYINFO_ADD', '4028d981529b18f101529b1d05600002', null, null, 'bus/buyInfo/savetoAdd', null, '2016-02-22 14:07:38', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('40288702530787290153079799500005', '编辑', 'BUYINFO_EDIT', '4028d981529b18f101529b1d05600002', null, null, 'bus/buyInfo/savetoUpdate', null, '2016-02-22 14:08:09', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('402887025307872901530797fe190007', '删除', 'BUYINFO_DELETE', '4028d981529b18f101529b1d05600002', null, null, 'bus/buyInfo/delete', null, '2016-02-22 14:08:34', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('40288702530787290153079878720009', '验收', 'BUYINFO_ACCEPT', '4028d981529b18f101529b1d05600002', null, null, null, null, '2016-02-22 14:09:06', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('402887025307872901530798badb000b', 'excel导出', 'BUYINFO_TEMPLETE_EXPORT', '4028d981529b18f101529b1d05600002', null, null, null, null, '2016-02-22 14:09:23', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d9815316f41e015317182f44000d', '生成采购单', 'PURCHASE_POS', '4028d981529b18f101529b1d05600002', null, null, null, null, '2016-02-25 14:22:54', '402882be46404313014640b7eb1c000f', null, null);
INSERT INTO `sys_power` VALUES ('4028d98153174a9101531754e6220004', '更新供货厂家', 'BUYINFO_UPDATE_FACTORY', '4028d981529b18f101529b1d05600002', null, null, null, null, '2016-02-25 15:29:13', '402882be46404313014640b7eb1c000f', null, null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` char(32) NOT NULL COMMENT '角色ID',
  `code` varchar(64) DEFAULT NULL COMMENT '角色编码',
  `name` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `description` text COMMENT '备注',
  `enabled` tinyint(1) DEFAULT NULL COMMENT '状态',
  `priority` int(11) DEFAULT NULL COMMENT '排序',
  `create_man_id` char(32) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_man_id` char(32) DEFAULT NULL COMMENT '最后更新人',
  `update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('297ea07f3da970a6013daa018581000c', 'super', '超级管理员', null, null, null, '测试', '2013-03-27 00:00:59', '402882be46404313014640b7eb1c000f', '2015-01-23 00:13:07');
INSERT INTO `sys_role` VALUES ('f36328d24baff4d1014baff725770002', 'manage', '经理', null, null, null, '402882be46404313014640b7eb1c000f', '2015-02-22 14:26:24', null, null);
INSERT INTO `sys_role` VALUES ('f36328d24baff4d1014baff9c63f0016', 'staff', '员工', null, null, null, '402882be46404313014640b7eb1c000f', '2015-02-22 14:29:16', null, null);

-- ----------------------------
-- Table structure for sys_settings
-- ----------------------------
DROP TABLE IF EXISTS `sys_settings`;
CREATE TABLE `sys_settings` (
  `id` char(32) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `value` varchar(256) DEFAULT NULL,
  `group_name` varchar(64) DEFAULT NULL,
  `editor` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_settings
-- ----------------------------
INSERT INTO `sys_settings` VALUES ('1', 'register_key', '注册码', 'a3e58faa4fd398d6fa257300f0714e2f90d2d4a639a8ae51e782f8de882825ae6b44cb2440de2be3', '系统注册', 'text');
INSERT INTO `sys_settings` VALUES ('21', 'system_version', '版本号', 'fsun-erp-1.0', '系统版本', 'text');
INSERT INTO `sys_settings` VALUES ('22', 'delivery_code_format', '送货单号格式', 'month_format', '单号格式化', 'text');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` char(32) NOT NULL COMMENT '用户ID',
  `code` varchar(64) DEFAULT NULL COMMENT '用户编码',
  `username` varchar(32) DEFAULT NULL COMMENT '用户帐号',
  `password` varchar(64) DEFAULT NULL COMMENT '用户密码',
  `realname` varchar(64) DEFAULT NULL COMMENT '用户中文名称',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮件',
  `telphone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `description` text COMMENT '备注',
  `issys` tinyint(1) DEFAULT NULL COMMENT '是否是系统管理员',
  `enabled` tinyint(1) DEFAULT NULL COMMENT '状态',
  `priority` int(11) DEFAULT NULL COMMENT '排序',
  `create_man_id` char(32) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_man_id` char(32) DEFAULT NULL COMMENT '最后更新人',
  `update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('402882be46404313014640b7eb1c000f', null, 'super', '7cf89929244d8c1ca0f053dfad7c34b4', '超级管理员', null, null, null, null, null, null, null, null, '402882be46404313014640b7eb1c000f', '2014-11-28 14:30:09');
INSERT INTO `sys_user` VALUES ('f36328d24baff4d1014baff87a660012', null, 'zqh', '25c6ec51ff1722a99d27114487429296', '小周', null, null, null, null, null, null, null, null, '402882be46404313014640b7eb1c000f', '2015-05-26 10:44:21');
INSERT INTO `sys_user` VALUES ('4028d98152e860080152e86ab6740114', null, 'xw', '89a2aa7952a18f8e2e13a75f1b7dc584', '小王', null, null, null, null, null, null, '402882be46404313014640b7eb1c000f', '2016-02-16 12:50:53', null, null);

-- ----------------------------
-- View structure for v_user_power
-- ----------------------------
DROP VIEW IF EXISTS `v_user_power`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_user_power` AS select `vur`.`user_id` AS `user_id`,`vur`.`username` AS `username`,`tp`.`code` AS `power_code`,`tp`.`name` AS `power_name` from ((`v_user_role` `vur` join `r_role_power` `rrp` on((`vur`.`role_id` = `rrp`.`role_id`))) join `sys_power` `tp` on((`rrp`.`power_id` = `tp`.`id`))) group by `vur`.`user_id`,`rrp`.`power_id` ;

-- ----------------------------
-- View structure for v_user_role
-- ----------------------------
DROP VIEW IF EXISTS `v_user_role`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_user_role` AS select `tr`.`id` AS `role_id`,`tr`.`code` AS `role_code`,`tr`.`name` AS `role_name`,`tu`.`id` AS `user_id`,`tu`.`username` AS `username` from ((`sys_user` `tu` join `r_role_user` `rur` on((`tu`.`id` = `rur`.`user_id`))) join `sys_role` `tr` on((`rur`.`role_id` = `tr`.`id`))) ;
