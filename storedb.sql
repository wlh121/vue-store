/*
 Navicat MySQL Data Transfer

 Source Server         : 1
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : storedb

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 19/02/2023 10:32:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `carousel_id` int(11) NOT NULL AUTO_INCREMENT,
  `imgPath` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `describes` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`carousel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (1, 'public/imgs/cat-1.png', '1');
INSERT INTO `carousel` VALUES (2, 'public/imgs/cat-2.png', '2');
INSERT INTO `carousel` VALUES (3, 'public/imgs/cat-3.png', '3');
INSERT INTO `carousel` VALUES (4, 'public/imgs/cat-4.png', '4');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '猫猫品种');
INSERT INTO `category` VALUES (2, '猫猫食物');
INSERT INTO `category` VALUES (3, '猫爬架');
INSERT INTO `category` VALUES (4, '猫舍');
INSERT INTO `category` VALUES (5, '配饰');
INSERT INTO `category` VALUES (6, '生活');
INSERT INTO `category` VALUES (7, '洗浴');
INSERT INTO `category` VALUES (8, '玩具');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `collect_time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_collect_user_id`(`user_id`) USING BTREE,
  INDEX `FK_collect_id`(`product_id`) USING BTREE,
  CONSTRAINT `FK_collect_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_collect_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collect
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_num` int(11) NOT NULL,
  `product_price` double NOT NULL,
  `order_time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_order_user_id`(`user_id`) USING BTREE,
  INDEX `FK_order_id`(`product_id`) USING BTREE,
  CONSTRAINT `FK_order_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_order_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_title` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_picture` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` double NOT NULL,
  `product_selling_price` double NOT NULL,
  `product_num` int(11) NOT NULL,
  `product_sales` int(11) NOT NULL,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `FK_product_category`(`category_id`) USING BTREE,
  CONSTRAINT `FK_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '布偶猫', 1, '纯种布偶猫长毛布偶幼猫海双蓝双蓝眼睛波斯系猫咪活体幼崽宠物猫', '布偶猫（Ragdoll）又称布拉多尔猫，是猫中体形和体重较大的一种。布偶猫于1960年开始繁育，1965年在美国获得认可。布偶猫头呈V形，眼大而圆，被毛丰厚，四肢粗大，身体柔软，多为三色或双色猫 [1]  。\r\n布偶猫全身非常松弛，像软绵绵的布偶一样。它性格温顺、恬静，对人非常友善，对疼痛的忍受性相当强，常被误认为缺乏疼痛感。它非常能容忍孩子的玩耍，也因此被称为布偶猫，是非常理想的家养宠物 [2]  。', 'public/imgs/phone/catpz1.png', 2000, 1599, 10, 0);
INSERT INTO `product` VALUES (2, '英短猫', 1, '纯种英国短毛猫矮脚蓝胖子血统折耳蓝猫活体宠物猫英短猫舍小猫咪', '英国短毛猫，体形圆胖，四肢粗短发达，毛短而密，头大脸圆，温柔平静，对人友善，极易饲养。大而圆的眼睛根据被毛不同而呈现各种颜色。作为一个古老的猫品种，其历史可追溯至古罗马时期的家猫，由于拥有悠久的育种历史，可以称得上是猫家族中的典范。英国短毛猫除了拥有固定耳距，代表性的遗传特征之外，又具有丰富的变异性，如背毛色眼睛颜色等。更重要的是，有了广泛的配种历史后，这种猫拥有了更健康的身体和更温驯的性格。\r\n英国短毛猫，体形圆胖，四肢粗短发达，毛短而密，头大脸圆，温柔平静，对人友善，极易饲养。大而圆的眼睛根据被毛不同而呈现各种颜色。作为一个古老的猫品种，其历史可追溯至古罗马时期的家猫，由于拥有悠久的育种历史，可以称得上是猫家族中的典范。英国短毛猫除了拥有固定耳距，代表性的遗传特征之外，又具有丰富的变异性，如背毛色眼睛颜色等。更重要的是，有了广泛的配种历史后，这种猫拥有了更健康的身体和更温驯的性格。\r\n英国短毛猫，体形圆胖，四肢粗短发达，毛短而密，头大脸圆，温柔平静，对人友善，极易饲养。大而圆的眼睛根据被毛不同而呈现各种颜色。作为一个古老的猫品种，其历史可追溯至古罗马时期的家猫，由于拥有悠久的育种历史，可以称得上是猫家族中的典范。英国短毛猫除了拥有固定耳距，代表性的遗传特征之外，又具有丰富的变异性，如背毛色眼睛颜色等。更重要的是，有了广泛的配种历史后，这种猫拥有了更健康的身体和更温驯的性格。', 'public/imgs/phone/catpz2.png', 1599, 599, 10, 0);
INSERT INTO `product` VALUES (3, '金渐层', 1, '英短金渐层幼猫纯种幼崽活体英短蓝金活物紫金赛级血统猫咪活物', '英短金渐层是由英短蓝猫改良而来，它体形圆胖，四肢粗短发达，毛短而密，头大脸圆，性格极为友善温柔，极易饲养。它在保留了英短蓝猫的粗壮可爱的体态和大脸之外，还演化出更加迷人的绿色或蓝绿色大圆眼睛，虎头虎脑，更加很让人们喜爱。颜色包括金色、蓝金色、金点色、蓝金点色，黑金色，也有银色、银点色等等', 'public/imgs/phone/catpz3.png', 1699, 1199, 20, 0);
INSERT INTO `product` VALUES (4, '银渐层', 1, '纯种银渐层幼猫活体宠物猫英国短毛猫银渐层英短银渐层银渐层猫咪', '英短银渐层是由英国短毛猫（蓝灰色）与金吉拉猫繁育而出的英短品种色，具备了金吉拉猫白色的毛色，又具备了英国短毛猫重要的特征。在银渐层的繁育过程中，出现了毛色为点状色的金点、银点、金渐层、蓝金渐层等。', 'public/imgs/phone/catpz4.png', 1799, 1699, 20, 0);
INSERT INTO `product` VALUES (5, '加菲猫又名异国短毛猫', 1, '加菲猫纯种幼崽曼基康矮脚猫短腿小猫咪宠物活的小奶猫幼猫咪活物', '异国短毛猫除拥有浓密皮毛外，还保留了波斯猫独特的可爱表情与圆滚滚的体型。性格也如波斯猫般文静、亲切，能慰藉主人的心，体形为中型到大型的短脚型，头部宽而圆，鼻子有明显的凹陷，皮毛有柔和的光泽，性情独立，不爱吵闹。', 'public/imgs/phone/catpz5.png', 2399, 1699, 20, 0);
INSERT INTO `product` VALUES (6, '缅因猫', 1, '猫舍缅因猫幼猫咪纯种血统银虎斑巨型宠物西伯利亚森林小崽活体', '缅因猫因原产于美国缅因州而得名，是北美自然产生的第一个长毛猫品种，约于18世纪中叶形成较稳定品种。缅因猫体格强壮，被毛厚密，长像与西伯利亚森林猫相似，在猫类中亦属大体型的品种。', 'public/imgs/phone/catpz6.png', 3399, 3399, 20, 0);
INSERT INTO `product` VALUES (7, '暹罗猫', 1, '猫舍暹罗猫幼猫血统猫泰国猫海豹重点色蓝眼小猫活体宠物猫咪活体', '暹（xiān）罗猫是世界著名的短毛猫，也是短毛猫的代表品种。种族原产于暹罗（今泰国），故名暹罗猫。在200多年前，这种珍贵的猫仅在泰国的皇宫和大寺院中饲养，是足不出户的贵族。暹罗猫能够较好适应主人当地的气候，且性格刚烈好动，机智灵活，好奇心特强，善解人意', 'public/imgs/phone/catpz7.png', 1999, 1999, 20, 0);
INSERT INTO `product` VALUES (8, '无毛猫', 1, '加拿大无毛猫蓝皮斯芬克斯纯种活体幼猫白皮黑皮鸳鸯眼比鲁斯猫咪', '加拿大无毛猫（Canadian Hairless）亦称斯芬克斯猫，是加拿大安大略省多伦多市养猫爱好者在1966年从一窝几乎是无毛的猫仔中，经过近交选育，特意为对猫毛过敏的爱猫者培育成的。这种猫是自然的基因突变产生的宠物猫，除了在耳、口、鼻、尾前段、脚等部位有些又薄又软的胎毛外，其它全身部分均无毛，皮肤多皱有弹性。加拿大无毛猫性情温顺，独立性强，无攻击性，能与其它猫狗相处', 'public/imgs/phone/catpz8.png', 1599, 1599, 20, 0);
INSERT INTO `product` VALUES (9, '卫仕猫条', 2, '猫猫零食', '卫仕猫条猫咪零食营养无诱食剂补水罐头幼猫成猫湿粮鱼油品牌猫条', 'public/imgs/appliance/catfood1.png', 40, 40, 10, 0);
INSERT INTO `product` VALUES (10, '迪迪妈猫条', 2, '猫猫零食', '迪迪妈猫条无添加剂猫咪幼猫主食级猫条鱼油专用零食无诱食剂0胶', 'public/imgs/appliance/catfood2.png', 89, 89, 10, 0);
INSERT INTO `product` VALUES (11, 'SolidGold素力高猫罐头', 2, '猫猫食品', 'SolidGold素力高猫罐头170g*16金素湿粮猫咪零食搭配主食营养增肥', 'public/imgs/appliance/catfood3.png', 329, 329, 10, 0);
INSERT INTO `product` VALUES (12, '麦富迪猫罐头', 2, '猫猫食品', '麦富迪猫罐头主食罐头成猫猫粮barf全价营养猫湿粮包猫咪零食', 'public/imgs/appliance/catfood4.png', 58, 58, 10, 0);
INSERT INTO `product` VALUES (13, 'Wanpy顽皮猫条', 2, '猫猫零食', 'Wanpy顽皮猫条零食猫零食湿粮猫咪零食幼猫猫罐头欧一吸妙鲜封包', 'public/imgs/appliance/catfood5.png', 19.8, 19.8, 10, 0);
INSERT INTO `product` VALUES (14, '麦富迪冻干羊奶棒', 2, '猫猫零食', '麦富迪冻干羊奶棒100g猫咪零食成猫幼猫小奶猫宠物用品磨牙奶酪', 'public/imgs/appliance/catfood6.png', 29.9, 29.9, 10, 0);
INSERT INTO `product` VALUES (15, '宸心宸翼', 2, '猫猫零食', '猫咪零食猫条营养小猫罐头幼猫小鱼干包妙鲜猫湿粮', 'public/imgs/appliance/catfood7.png', 69, 69, 10, 0);
INSERT INTO `product` VALUES (16, '美滋元流质猫条', 2, '猫猫零食', '美滋元猫零食流质猫条小幼猫咪罐头成猫小鱼干妙鲜肉湿粮包15支装', 'public/imgs/appliance/catfood8.png', 12.9, 12.9, 20, 10);
INSERT INTO `product` VALUES (17, '猫爬架', 3, '猫爬架', '猫爬架子猫架猫爬架猫窝猫树一体麻绳猫抓板/柱猫咪用品四季通用', 'public/imgs/appliance/catfz1.png', 179, 179, 20, 8);
INSERT INTO `product` VALUES (18, '猫爬架', 3, '猫爬架', '猫爬架子猫架猫爬架猫窝猫树一体麻绳猫抓板/柱猫咪用品四季通用', 'public/imgs/appliance/catfz2.png', 169, 169, 20, 7);
INSERT INTO `product` VALUES (19, '猫沙盆', 4, '猫沙盆', '猫砂盆全封闭抽屉顶入式防外溅大号超大号猫沙盆子猫厕所猫咪用品', 'public/imgs/appliance/catsp1.png', 39, 39, 20, 10);
INSERT INTO `product` VALUES (20, '新年转运项圈', 5, '配饰', '猫咪项圈猫牌编织项链定制刻字狗牌可爱脖圈铃铛幼猫围脖宠物用品', 'public/imgs/accessory/catzb1-1.png', 49, 39, 20, 10);
INSERT INTO `product` VALUES (21, '小鲸鱼猫咪饮水机', 6, '生活用品', '小鲸鱼猫咪饮水机自动循环流动喝水不湿嘴宠物智能饮水器狗猫用品', 'public/imgs/accessory/catzb2-1.png', 79, 79, 20, 9);
INSERT INTO `product` VALUES (22, '猫碗双碗自动饮水机', 6, '生活用品', '猫碗双碗自动饮水狗碗狗盆食盆泰迪饭盆宠物喝水狗狗陶瓷猫咪用品', 'public/imgs/accessory/catzb2-2.png', 99, 99, 20, 9);
INSERT INTO `product` VALUES (23, '伊丽莎白圈猫咪绝育项圈伊利沙白圈', 6, '生活用品', '伊丽莎白圈猫咪绝育项圈伊利沙白防舔围脖圈颈圈柔软头套狗狗用品', 'public/imgs/accessory/catzb2-3.png', 59, 59, 20, 8);
INSERT INTO `product` VALUES (24, '顶尖宠物®', 7, '洗浴用品', '顶尖宠物®白毛狗狗洗澡香波萨摩耶比熊超白色亮白博美犬用沐浴露', 'public/imgs/accessory/catzb3-1.png', 79, 79, 20, 8);
INSERT INTO `product` VALUES (25, 'spa精油', 7, '洗浴用品', '以色列SPA宠物精油狗狗猫咪沐浴露香水除臭留香持久香宠物用品', 'public/imgs/accessory/catzb3-2.png', 129, 129, 20, 0);
INSERT INTO `product` VALUES (26, '猫猫沐浴露', 7, '洗浴用品', '猫咪沐浴露杀菌除螨除臭驱虫去虱宠物专用洗护香波浴液猫洗澡用品', 'public/imgs/accessory/catzb3-3.png', 59, 59, 20, 0);
INSERT INTO `product` VALUES (27, '英国jhly猫咪沐浴露', 7, '洗浴用品', '英国jhly猫咪沐浴露短毛猫香波宠物除臭幼猫洗澡用沐浴液专用用品', 'public/imgs/accessory/catzb3-4.png', 179, 179, 20, 0);
INSERT INTO `product` VALUES (28, '逗猫棒', 8, '玩具', '猫玩具逗猫棒不倒翁羽毛铃铛小猫咪幼猫自嗨解闷耐咬神器猫猫用品', 'public/imgs/accessory/catzb4-1.png', 49, 49, 20, 0);
INSERT INTO `product` VALUES (29, '猫抓板', 8, '玩具', '猫抓板猫玩具木质猫抓球磨爪手缠剑麻绳猫爬架耐用猫抓柱宠物用品', 'public/imgs/accessory/catzb4-2.png', 99, 99, 20, 0);
INSERT INTO `product` VALUES (30, '猫砂盆除臭神器', 8, '用品', '猫砂盆除臭神器猫屎盆除臭自动净味全封闭猫厕所猫窝用品防臭家用', 'public/imgs/accessory/catzb4-3.png', 129, 129, 20, 8);
INSERT INTO `product` VALUES (31, '猫抓板', 8, '玩具', '猫玩具猫抓板实木转盘磨爪器猫抓柱耐磨逗猫可爱宠物实木用品剑麻', 'public/imgs/accessory/catzb4-4.png', 69, 69, 20, 0);

-- ----------------------------
-- Table structure for product_picture
-- ----------------------------
DROP TABLE IF EXISTS `product_picture`;
CREATE TABLE `product_picture`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `product_picture` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_product_id`(`product_id`) USING BTREE,
  CONSTRAINT `FK_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 221 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_picture
-- ----------------------------
INSERT INTO `product_picture` VALUES (1, 1, 'public/imgs/phone/buou1.jpg', NULL);
INSERT INTO `product_picture` VALUES (2, 1, 'public/imgs/phone/picture/buou2.jpg', NULL);
INSERT INTO `product_picture` VALUES (3, 1, 'public/imgs/phone/picture/buou3.jpg', NULL);
INSERT INTO `product_picture` VALUES (4, 1, 'public/imgs/phone/picture/buou4.jpg', NULL);
INSERT INTO `product_picture` VALUES (5, 1, 'public/imgs/phone/picture/buou5.jpg', NULL);
INSERT INTO `product_picture` VALUES (6, 2, 'public/imgs/phone/picture/yingduan1.jpg', NULL);
INSERT INTO `product_picture` VALUES (7, 2, 'public/imgs/phone/picture/yingduan2.jpg', NULL);
INSERT INTO `product_picture` VALUES (8, 2, 'public/imgs/phone/picture/yingduan3.jpg', NULL);
INSERT INTO `product_picture` VALUES (9, 2, 'public/imgs/phone/picture/yingduan4.jpg', NULL);
INSERT INTO `product_picture` VALUES (10, 2, 'public/imgs/phone/picture/yingduan5.jpg', NULL);
INSERT INTO `product_picture` VALUES (11, 3, 'public/imgs/phone/picture/jinjiancen1.jpg', NULL);
INSERT INTO `product_picture` VALUES (12, 3, 'public/imgs/phone/picture/jinjiancen2.jpg', NULL);
INSERT INTO `product_picture` VALUES (13, 3, 'public/imgs/phone/picture/jinjiancen3.jpg', NULL);
INSERT INTO `product_picture` VALUES (14, 3, 'public/imgs/phone/picture/jinjiancen4.jpg', NULL);
INSERT INTO `product_picture` VALUES (15, 3, 'public/imgs/phone/picture/jinjiancen5.jpg', NULL);
INSERT INTO `product_picture` VALUES (16, 4, 'public/imgs/phone/picture/yinjiancen1.jpg', NULL);
INSERT INTO `product_picture` VALUES (17, 4, 'public/imgs/phone/picture/yinjiancen2.jpg', NULL);
INSERT INTO `product_picture` VALUES (18, 4, 'public/imgs/phone/picture/yinjiancen3.jpg', NULL);
INSERT INTO `product_picture` VALUES (19, 5, 'public/imgs/phone/picture/jafei1.jpg', NULL);
INSERT INTO `product_picture` VALUES (20, 5, 'public/imgs/phone/picture/jafei2.jpg', NULL);
INSERT INTO `product_picture` VALUES (21, 6, 'public/imgs/phone/picture/mianyin1.jpg', NULL);
INSERT INTO `product_picture` VALUES (22, 6, 'public/imgs/phone/picture/mianyin2.jpg', NULL);
INSERT INTO `product_picture` VALUES (23, 6, 'public/imgs/phone/picture/mianyin3.png', NULL);
INSERT INTO `product_picture` VALUES (24, 6, 'public/imgs/phone/picture/mianyin4.png', NULL);
INSERT INTO `product_picture` VALUES (25, 6, 'public/imgs/phone/picture/mianyin5.png', NULL);
INSERT INTO `product_picture` VALUES (26, 7, 'public/imgs/phone/picture/xianluo1.png', NULL);
INSERT INTO `product_picture` VALUES (27, 7, 'public/imgs/phone/picture/xianluo2.png', NULL);
INSERT INTO `product_picture` VALUES (28, 7, 'public/imgs/phone/picture/xianluo3.jpg', NULL);
INSERT INTO `product_picture` VALUES (29, 8, 'public/imgs/phone/picture/wumao1.jpg', NULL);
INSERT INTO `product_picture` VALUES (30, 8, 'public/imgs/phone/picture/wumao2.jpg', NULL);
INSERT INTO `product_picture` VALUES (31, 9, 'public/imgs/phone/picture/catf1.jpg', NULL);
INSERT INTO `product_picture` VALUES (32, 9, 'public/imgs/phone/picture/catf2.jpg', NULL);
INSERT INTO `product_picture` VALUES (33, 10, 'public/imgs/phone/picture/catf3.jpg', NULL);
INSERT INTO `product_picture` VALUES (34, 10, 'public/imgs/phone/picture/catf4.jpg', NULL);
INSERT INTO `product_picture` VALUES (35, 11, 'public/imgs/phone/picture/catf5.jpg', NULL);
INSERT INTO `product_picture` VALUES (36, 11, 'public/imgs/phone/picture/catf6.jpg', NULL);
INSERT INTO `product_picture` VALUES (37, 12, 'public/imgs/phone/picture/catf7.jpg', NULL);
INSERT INTO `product_picture` VALUES (38, 12, 'public/imgs/phone/picture/catf8.jpg', NULL);
INSERT INTO `product_picture` VALUES (39, 13, 'public/imgs/phone/picture/catf9.jpg', NULL);
INSERT INTO `product_picture` VALUES (40, 13, 'public/imgs/phone/picture/catf10.jpg', NULL);
INSERT INTO `product_picture` VALUES (41, 14, 'public/imgs/phone/picture/catf11.jpg', NULL);
INSERT INTO `product_picture` VALUES (42, 15, 'public/imgs/phone/picture/catf12.jpg', NULL);
INSERT INTO `product_picture` VALUES (43, 16, 'public/imgs/phone/picture/catf13.jpg', NULL);
INSERT INTO `product_picture` VALUES (44, 17, 'public/imgs/phone/picture/catfz1-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (45, 18, 'public/imgs/phone/picture/catfz2-1jpg', NULL);
INSERT INTO `product_picture` VALUES (46, 18, 'public/imgs/phone/picture/catfz2-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (47, 19, 'public/imgs/phone/picture/catsp1-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (48, 19, 'public/imgs/phone/picture/catsp1-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (49, 21, 'public/imgs/phone/picture/catzb2-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (50, 21, 'public/imgs/phone/picture/catzb2-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (51, 22, 'public/imgs/phone/picture/catzb2-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (52, 22, 'public/imgs/phone/picture/catzb2-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (53, 23, 'public/imgs/phone/picture/catzb2-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (54, 23, 'public/imgs/phone/picture/catzb2-6.jpg', NULL);
INSERT INTO `product_picture` VALUES (55, 24, 'public/imgs/phone/picture/catzb3-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (56, 24, 'public/imgs/phone/picture/catzb3-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (57, 25, 'public/imgs/phone/picture/catzb3-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (58, 26, 'public/imgs/phone/picture/catzb3-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (59, 26, 'public/imgs/phone/picture/catzb3-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (60, 27, 'public/imgs/phone/picture/catzb3-6.jpg', NULL);
INSERT INTO `product_picture` VALUES (61, 27, 'public/imgs/phone/picture/catzb3-7.jpg', NULL);
INSERT INTO `product_picture` VALUES (62, 28, 'public/imgs/phone/picture/catzb4-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (63, 28, 'public/imgs/phone/picture/catzb4-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (64, 29, 'public/imgs/phone/picture/catzb4-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (65, 29, 'public/imgs/phone/picture/catzb4-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (66, 30, 'public/imgs/phone/picture/catzb4-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (67, 30, 'public/imgs/phone/picture/catzb4-6.jpg', NULL);
INSERT INTO `product_picture` VALUES (68, 31, 'public/imgs/phone/picture/catzb4-7.jpg', NULL);
INSERT INTO `product_picture` VALUES (69, 31, 'public/imgs/phone/picture/catzb4-8.jpg', NULL);
INSERT INTO `product_picture` VALUES (70, 20, 'public/imgs/phone/picture/catzb1-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (71, 20, 'public/imgs/phone/picture/catzb1-2.jpg', NULL);

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_user_id`(`user_id`) USING BTREE,
  INDEX `FK_shoppingCart_id`(`product_id`) USING BTREE,
  CONSTRAINT `FK_shoppingCart_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userPhoneNumber` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `userName`(`userName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
