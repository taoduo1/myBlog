/*
 Navicat Premium Data Transfer

 Source Server         : Hp
 Source Server Type    : MySQL
 Source Server Version : 50634
 Source Host           : rdsh902wshev83g97j6mo.mysql.rds.aliyuncs.com:3306
 Source Schema         : pspstaging

 Target Server Type    : MySQL
 Target Server Version : 50634
 File Encoding         : 65001

 Date: 13/07/2018 11:18:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ad_pile
-- ----------------------------
DROP TABLE IF EXISTS `ad_pile`;
CREATE TABLE `ad_pile`  (
  `ad_id` int(11) NOT NULL DEFAULT 0 COMMENT '广告ID',
  `pile_id` int(11) NOT NULL DEFAULT 0 COMMENT '桩ID',
  PRIMARY KEY (`ad_id`, `pile_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ad_statistics
-- ----------------------------
DROP TABLE IF EXISTS `ad_statistics`;
CREATE TABLE `ad_statistics`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) NULL DEFAULT NULL COMMENT '广告id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `action_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '01-点击，02-浏览',
  `ip_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户IPAddress',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `action_time` datetime(0) NULL DEFAULT NULL COMMENT '动作发生时间',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 275 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for advertisement
-- ----------------------------
DROP TABLE IF EXISTS `advertisement`;
CREATE TABLE `advertisement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `advertiser_id` int(11) NULL DEFAULT NULL COMMENT '广告商Id',
  `ad_category` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告类型：01:首页广告，02：充电中广告 03：充电结束广告',
  `ad_image_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告图片地址',
  `ad_link_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告链接地址',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '广告城市编号:sys_region，仅作用于首页广告',
  `is_default` int(1) NULL DEFAULT NULL COMMENT '是否为缺省广告: 0:否，1：是',
  `valid_start_date` datetime(0) NULL DEFAULT NULL COMMENT '有效开始时间',
  `vialid_end_date` datetime(0) NULL DEFAULT NULL COMMENT '有效结束时间',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `ad_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for advertiser
-- ----------------------------
DROP TABLE IF EXISTS `advertiser`;
CREATE TABLE `advertiser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告商名称',
  `comments` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告商描述',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告商联系方式',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告商email',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for api_user
-- ----------------------------
DROP TABLE IF EXISTS `api_user`;
CREATE TABLE `api_user`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'appId',
  `app_secret` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'appSecret',
  `app_secret_md5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_login_time` datetime(0) NULL DEFAULT NULL,
  `last_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pile_status_topic` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_status_topic` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_by_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enable` int(1) NULL DEFAULT 1,
  `company` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `manufacturer` int(11) NULL DEFAULT NULL COMMENT '厂商代码01：科华 02：瑞伯德',
  `threshold` double(10, 2) NULL DEFAULT NULL COMMENT '卡内金额阀值',
  PRIMARY KEY (`id`, `app_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attach_category` int(1) NULL DEFAULT NULL COMMENT '附件分类:1：合同附件 2.项目勘察附件3.项目设计阶段附件4.项目验收文档5.项目收尾文档',
  `attach_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件种类:SYS_PARAM中定义的key\nBUSINESS_CONTRACT：商务合同 PURCHASE_CONTRACT:采购合同 CONSTRUCT_CONTRACT:施工合同 CONSTRUCT_ATTH:施工附件',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '附件对应的主键',
  `attach_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件原名称',
  `attach_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件下载地址',
  `status` int(1) NULL DEFAULT 0 COMMENT '0：未支付,1:已支付',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `attach_new_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OSS上传后的新文件名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for campaign
-- ----------------------------
DROP TABLE IF EXISTS `campaign`;
CREATE TABLE `campaign`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `c_category` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动种类：01：直接发放，02:充电结束优惠',
  `c_type` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '101:直接发放积分,102:直接发放优惠券,201:服务费折扣,202:积分翻倍,203:送优惠券',
  `valid_start_date` datetime(0) NULL DEFAULT NULL COMMENT '有效开始时间',
  `valid_end_date` datetime(0) NULL DEFAULT NULL COMMENT '有效结束时间',
  `point_amount` int(20) NULL DEFAULT NULL COMMENT '101:发放积分数量',
  `coupon_type_id` int(11) NULL DEFAULT NULL COMMENT '102,203:优惠券种类ID',
  `service_fee_discount` double(20, 2) NULL DEFAULT NULL COMMENT '201:服务费折扣率',
  `point_multiple` double(20, 2) NULL DEFAULT NULL COMMENT '202:积分倍数',
  `coupon_quantity` int(11) NULL DEFAULT NULL COMMENT '203:优惠券数量',
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动描述',
  `status` int(1) NULL DEFAULT NULL COMMENT '0：新建,1:激活,2:取消',
  `status_time` datetime(0) NULL DEFAULT NULL COMMENT '状态更新时间',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 326 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for campaign_pile
-- ----------------------------
DROP TABLE IF EXISTS `campaign_pile`;
CREATE TABLE `campaign_pile`  (
  `c_id` int(11) NULL DEFAULT NULL COMMENT '活动ID',
  `pile_id` int(11) NULL DEFAULT NULL COMMENT '桩ID',
  UNIQUE INDEX `c_id`(`c_id`, `pile_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for campaign_user
-- ----------------------------
DROP TABLE IF EXISTS `campaign_user`;
CREATE TABLE `campaign_user`  (
  `c_id` int(11) NULL DEFAULT NULL COMMENT '活动ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `status` int(1) NULL DEFAULT NULL COMMENT '0:待完成,1:已完成',
  UNIQUE INDEX `c_id`(`c_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for charge_pile_opt_time
-- ----------------------------
DROP TABLE IF EXISTS `charge_pile_opt_time`;
CREATE TABLE `charge_pile_opt_time`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pile_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '桩编码',
  `order_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `opt_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `command` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指令',
  `enable` int(1) NULL DEFAULT 1 COMMENT '是否有效0:无效1:有效',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '客户创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '客户创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '客户更新时间',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '客户更新人',
  `update_by_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户更新人ip',
  PRIMARY KEY (`id`, `pile_no`) USING BTREE,
  INDEX `charge_pile_opt_time_ix_01`(`pile_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16301 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for charge_pile_params
-- ----------------------------
DROP TABLE IF EXISTS `charge_pile_params`;
CREATE TABLE `charge_pile_params`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pile_no` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '桩编号',
  `net_adddr` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网络地址',
  `mask` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子网掩码',
  `gateway` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网关',
  `port` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '端口',
  `net_adddr_backup` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用网络地址',
  `mask_backup` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用子网掩码',
  `gateway_backup` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用网关',
  `port_backup` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用端口',
  `local_adddr` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本地地址',
  `local_mask` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本地子网掩码',
  `local_gateway` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本地网关',
  `encrypt_type` int(8) NULL DEFAULT NULL COMMENT '加密方式',
  `ssid_length` int(8) NULL DEFAULT NULL COMMENT 'ssid长度',
  `ssid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ssid',
  `date` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  `pwd_length` int(8) NULL DEFAULT NULL COMMENT '密码长度',
  `pwd` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `enable` int(1) NOT NULL DEFAULT 1 COMMENT '是否可用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(5) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` int(5) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for charge_pile_upper
-- ----------------------------
DROP TABLE IF EXISTS `charge_pile_upper`;
CREATE TABLE `charge_pile_upper`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `pile_no` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '充电桩编号',
  `max_ua` double NULL DEFAULT NULL COMMENT '单体动力蓄电池最高允许充电电压',
  `max_temp` int(11) NULL DEFAULT NULL COMMENT '电池组最高温度存在正负值',
  `max_i` double NULL DEFAULT NULL COMMENT '充电组最高电流',
  `max_ub` double NULL DEFAULT NULL COMMENT '充电组最高电压',
  `POWER` int(10) NULL DEFAULT NULL COMMENT '动力蓄电池标称总能量',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 390 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for charge_point
-- ----------------------------
DROP TABLE IF EXISTS `charge_point`;
CREATE TABLE `charge_point`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `point_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充电点名称',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '充电点省',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '充电点城市',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '充电点行政区域',
  `hot_city_id` int(11) NULL DEFAULT NULL COMMENT '热点城市',
  `circle_id` int(11) NULL DEFAULT NULL COMMENT '充电点商圈',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '所属客户',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充电点地址',
  `station_nearby` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附近标记物',
  `station_lon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充电点经度',
  `station_lat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充电点维度',
  `station_gps_lon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充电点GPS经度',
  `station_gps_lat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充电点GPS维度',
  `contact_person` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充电点联系人姓名',
  `contact_email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充电点联系人邮箱',
  `contact_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充电点联系人电话',
  `enable` int(11) NULL DEFAULT 1 COMMENT '是否有效1:无效0:有效',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `business_start` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业开始',
  `business_end` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业结束',
  `rate_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '费率类型',
  `rate` decimal(5, 2) NULL DEFAULT NULL COMMENT '费率',
  `charge_pile_number` int(11) NULL DEFAULT NULL COMMENT '充电点桩数量',
  `charge_photo_url_one` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充电点图片1',
  `charge_photo_url_two` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充电点图片2',
  `charge_photo_url_three` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充电点图片3',
  `discount` int(11) NULL DEFAULT NULL COMMENT '优惠折扣',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98462 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '充电点信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for charge_point_photo
-- ----------------------------
DROP TABLE IF EXISTS `charge_point_photo`;
CREATE TABLE `charge_point_photo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `point_id` int(11) NULL DEFAULT NULL COMMENT '充电点id',
  `photo_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `photo_url` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充电点图片url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for charge_point_pile
-- ----------------------------
DROP TABLE IF EXISTS `charge_point_pile`;
CREATE TABLE `charge_point_pile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `point_id` int(11) NULL DEFAULT NULL COMMENT '充电点id',
  `construct_id` int(11) NULL DEFAULT NULL COMMENT '对应施工id',
  `point_pile_model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充电桩型号',
  `point_pile_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充电桩名称',
  `point_pile_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号唯一编码',
  `pile_type` int(11) NOT NULL DEFAULT 0 COMMENT '桩类型0：合普友电桩 1：evcar桩',
  `pile_custom_number` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充电桩自定义编码',
  `qr_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维码',
  `parking_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '停车位编号',
  `status` int(1) UNSIGNED ZEROFILL NULL DEFAULT 4 COMMENT '充电桩状态1:待充电2:充电中3:异常 4:未知 5:预约中6：失联',
  `controlled` int(11) NULL DEFAULT 1 COMMENT '是否可控 0：不可控；1：可控；',
  `lose_count` int(11) NULL DEFAULT 0 COMMENT '失联次数',
  `fault_count` int(11) NULL DEFAULT 0 COMMENT '故障次数',
  `enable` int(1) NULL DEFAULT 1 COMMENT '是否有效0:无效1:有效',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '充电桩创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '充电桩创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '充电桩更新时间',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '充电桩更新人',
  `update_by_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充电桩更新人ip',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `construction_id` int(11) NULL DEFAULT NULL COMMENT '施工单编号',
  `charging_time` int(11) NULL DEFAULT NULL COMMENT '充电中心跳间隔（秒）',
  `standby_time` int(11) NULL DEFAULT NULL COMMENT '待机心跳间隔（秒）',
  `charging_timeout` int(11) NULL DEFAULT NULL COMMENT '充电中失联超时（次）',
  `standby_timeout` int(11) NULL DEFAULT NULL COMMENT '待机失联超时（次）',
  `pile_gun_id` int(11) NULL DEFAULT NULL COMMENT '枪号',
  `serial_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机器串号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `charge_point_pile_ix_01`(`point_pile_number`) USING BTREE,
  INDEX `point_id_ix_01`(`point_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2599488 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '充电点与充电桩关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for charge_price
-- ----------------------------
DROP TABLE IF EXISTS `charge_price`;
CREATE TABLE `charge_price`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `point_id` int(11) NULL DEFAULT NULL COMMENT '充电点id',
  `service_fee` double(10, 2) NULL DEFAULT 0.00 COMMENT '服务费',
  `enable` int(1) NULL DEFAULT 1 COMMENT '是否有效0:无效1:有效',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '充电桩价格创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '充电桩价格创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '充电桩价格更新时间',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '充电桩价格更新人',
  `update_by_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充电桩价格更新人ip',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7639 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '充电桩价格信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for charge_price_time
-- ----------------------------
DROP TABLE IF EXISTS `charge_price_time`;
CREATE TABLE `charge_price_time`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge_price_id` int(11) NULL DEFAULT NULL COMMENT '充电价格id',
  `begin_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结束时间',
  `electricity_fee` double(10, 2) NULL DEFAULT 0.00 COMMENT '电费(度)',
  `enable` int(1) NULL DEFAULT 1 COMMENT '是否有效',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3722 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '充电价格时段表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for construction_order
-- ----------------------------
DROP TABLE IF EXISTS `construction_order`;
CREATE TABLE `construction_order`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` int(10) NOT NULL COMMENT '客户id',
  `point_id` int(10) NOT NULL COMMENT '充电点id',
  `contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同编码',
  `builder_id` int(10) NOT NULL COMMENT '施工方id',
  `complete_time` datetime(0) NOT NULL COMMENT '完成时间',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `enable` int(1) NOT NULL DEFAULT 1 COMMENT '是否有效0:无效1:有效',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `update_by_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新ip',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同编号',
  `contract_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同类型：01:商务合同,02:采购合同,03:施工合同,04:预采购合同',
  `contract_party_a` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同甲方',
  `contract_party_b` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同乙方',
  `contract_principal` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同负责人',
  `sign_date` datetime(0) NULL DEFAULT NULL COMMENT '签约时间',
  `sign_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签约地点',
  `total_amount` double(20, 2) NULL DEFAULT NULL COMMENT '总价',
  `arrive_date` datetime(0) NULL DEFAULT NULL COMMENT '到货时间',
  `arrive_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到货地点',
  `project_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工程名称',
  `project_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工程地点',
  `construction_contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '施工方联系人',
  `construction_contact_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '施工方联系方式',
  `construction_total_amount` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '施工方报价',
  `stage_warning_days` int(11) NULL DEFAULT NULL COMMENT '付款提醒提前天数',
  `parent_contract_id` int(11) NULL DEFAULT NULL COMMENT '父合同ID',
  `current_stage_id` int(11) NULL DEFAULT NULL COMMENT '当前阶段ID',
  `status` int(1) NULL DEFAULT NULL COMMENT '0：新建,1:进行中,2:已完成',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for contract_stage
-- ----------------------------
DROP TABLE IF EXISTS `contract_stage`;
CREATE TABLE `contract_stage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) NULL DEFAULT NULL COMMENT '合同表ID',
  `stage_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款阶段名称:首付款、中期款-1、中期款-2、尾款',
  `stage_date` datetime(0) NULL DEFAULT NULL COMMENT '付款截止日期',
  `stage_amount` double(20, 2) NULL DEFAULT NULL COMMENT '阶段金额',
  `order_type` int(1) NULL DEFAULT NULL COMMENT '阶段显示顺序,如:1,2,3,4',
  `status` int(1) NULL DEFAULT 0 COMMENT '0：未支付,1:已支付',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for coupon_lot
-- ----------------------------
DROP TABLE IF EXISTS `coupon_lot`;
CREATE TABLE `coupon_lot`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批次类型 01:hopeuday,02:商户',
  `lot_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批次编码，限制为6位整数,推荐为年月+自增序列号，如：170501',
  `lot_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批次名称,如：五一活动批次',
  `coupon_description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示在优惠券上的描述,如：五一大酬宾',
  `scope_description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示在优惠券可使用桩的范围，如：仅可在上海地区的桩上使用',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `merchant_id` int(11) NULL DEFAULT NULL COMMENT '商户ID',
  `lot_start_date` datetime(0) NULL DEFAULT NULL COMMENT '批次有效开始时间',
  `lot_end_date` datetime(0) NULL DEFAULT NULL COMMENT '批次有效结束时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `lot_no`(`lot_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for coupon_lot_pile_link
-- ----------------------------
DROP TABLE IF EXISTS `coupon_lot_pile_link`;
CREATE TABLE `coupon_lot_pile_link`  (
  `coupon_lot_id` int(11) NOT NULL,
  `pile_id` int(11) NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for coupon_rule
-- ----------------------------
DROP TABLE IF EXISTS `coupon_rule`;
CREATE TABLE `coupon_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_rule_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠券有效期规则,如：1:优惠券有效期规则,2:优惠券发放规则, 3:优惠券使用规则',
  `coupon_rule_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '101:优惠券有效期为普通券有效开始时间和结束时间 102:优惠券有效期开始时间为：发放时间，结束时间为：发放时间+valid_hours',
  `coupon_rule_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠券有效期规则,优惠券发放规则, 优惠券使用规则',
  `valid_hours` double(20, 2) NULL DEFAULT NULL COMMENT '102号规则中有效小时数',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coupon_rule
-- ----------------------------
INSERT INTO `coupon_rule` VALUES (1, '1', '101', '友电优惠券普通有效规则', 234.10, '普通优惠券', 1, '127', '127', '2017-05-18 16:52:28', '2017-07-18 19:32:44');
INSERT INTO `coupon_rule` VALUES (2, '1', '102', '商户优惠券定时有效规则', 2.00, '有效期开始时间为优惠券种类发放时间，结束时间为发放时间+有效的小时数', 1, '127', '127', '2017-05-18 16:53:10', '2017-07-19 15:38:58');
INSERT INTO `coupon_rule` VALUES (3, '1', '103', '友电优惠券定时有效规则', 30720.00, '有效期开始时间为优惠券种类发放时间，结束时间为发放时间+有效的小时数', 1, '127', '127', '2017-05-18 16:53:10', '2017-06-09 20:38:38');

-- ----------------------------
-- Table structure for coupon_type
-- ----------------------------
DROP TABLE IF EXISTS `coupon_type`;
CREATE TABLE `coupon_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_type_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠券种类编号，手工输入两位编号',
  `coupon_type_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coupon_lot_id` int(11) NULL DEFAULT NULL COMMENT '优惠券批次ID',
  `valid_start_date` datetime(0) NULL DEFAULT NULL COMMENT '优惠券有效开始时间',
  `valid_end_date` datetime(0) NULL DEFAULT NULL COMMENT '优惠券有效结束时间',
  `coupon_rule_no` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应coupon_rule优惠券规则编号',
  `amount` double(20, 2) NULL DEFAULT NULL COMMENT '金额',
  `total_quantity` int(20) NULL DEFAULT NULL COMMENT '总数量',
  `remain_quantity` int(20) NULL DEFAULT NULL COMMENT '发放剩余数量',
  `current_coupon_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前种类已生成的优惠券最大编码',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `coupon_type_no`(`coupon_type_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 295 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户名称',
  `license_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照编号',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省id',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市id',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '区域id',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户地址',
  `zip_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `contact_person` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户联系人',
  `contact_email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户邮箱',
  `contact_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户联系手机',
  `contact_telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `bank` int(11) NULL DEFAULT NULL COMMENT '开户银行',
  `bank_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行账号',
  `bank_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账户名称',
  `enable` int(1) NULL DEFAULT 1 COMMENT '是否有效0:无效1:有效',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '客户创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '客户创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '客户更新时间',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '客户更新人',
  `update_by_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户更新人ip',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 272 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer_certified
-- ----------------------------
DROP TABLE IF EXISTS `customer_certified`;
CREATE TABLE `customer_certified`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户id',
  `licence_photo` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照',
  `tax_photo` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税务登记证',
  `orgcode_photo` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织代码',
  `create_by` int(11) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户认证资料' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer_contract
-- ----------------------------
DROP TABLE IF EXISTS `customer_contract`;
CREATE TABLE `customer_contract`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `customer_id` int(10) NOT NULL COMMENT '客户id',
  `contract_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '合同编码',
  `contract_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同文件名',
  `contract_new_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同新名称',
  `contract_url` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同url',
  `contract_type` int(1) NOT NULL COMMENT '合同类型 0：主合同，1：附件',
  `begin_time` date NULL DEFAULT NULL COMMENT '合同开始日期',
  `end_time` date NULL DEFAULT NULL COMMENT '合同结束日期',
  `enable` int(1) NULL DEFAULT 1 COMMENT '有效',
  `create_by` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` int(11) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 168 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer_user
-- ----------------------------
DROP TABLE IF EXISTS `customer_user`;
CREATE TABLE `customer_user`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户编号',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `nick_name` varchar(100) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '用户名-昵称',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `big_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户id',
  `status` int(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '账号状态：1、启用，0、删除，2、禁用3 锁定',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '账号过期时间',
  `uthority_expire_time` datetime(0) NULL DEFAULT NULL COMMENT '权限过期时间',
  `login_times` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '登录次数',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次登录ip',
  `current_login_time` datetime(0) NULL DEFAULT NULL COMMENT '当前登录时间',
  `current_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前登录ip',
  `pwd_wrong_times` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录时密码错误次数',
  `last_pwd_wrong_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次密码错误日期',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` int(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_by_ip` varchar(20) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '更新人ip',
  `remark` varchar(500) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '备注',
  `email` varchar(30) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 193 CHARACTER SET = utf32 COLLATE = utf32_general_ci COMMENT = '充电桩客户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer_user_role
-- ----------------------------
DROP TABLE IF EXISTS `customer_user_role`;
CREATE TABLE `customer_user_role`  (
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户用户与客户角色关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ground_lock
-- ----------------------------
DROP TABLE IF EXISTS `ground_lock`;
CREATE TABLE `ground_lock`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `lock_model` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地锁型号',
  `lock_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地锁唯一编码',
  `pile_id` int(11) NULL DEFAULT NULL COMMENT '充电桩主键',
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `construct_id` int(11) NULL DEFAULT NULL COMMENT '对应施工id',
  `lock_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地锁名称',
  `lock_type` int(11) NULL DEFAULT NULL COMMENT '地锁种类',
  `lock_custom_number` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地锁自定义编码',
  `lot_status` int(11) NULL DEFAULT 0 COMMENT '车位状态（0：不确定/1：有车/2：无车/15：故障）',
  `error_code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '故障错误代码',
  `lock_status` int(11) NULL DEFAULT 0 COMMENT '车位锁状态（0：不确定/1：上锁/2：解锁/15：故障）',
  `controlled` int(11) NULL DEFAULT 1 COMMENT '是否可控 0：不可控；1：可控；',
  `lose_count` int(11) NULL DEFAULT 0 COMMENT '失联次数',
  `fault_count` int(11) NULL DEFAULT 0 COMMENT '故障次数',
  `enable` int(1) NULL DEFAULT 1 COMMENT '是否有效0:无效1:有效',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `construction_id` int(11) NULL DEFAULT NULL COMMENT '施工单编号',
  `lose_timeout` int(11) NULL DEFAULT NULL COMMENT '地锁失联(超时)次数',
  `serial_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机器串号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ground_lock_opt_time
-- ----------------------------
DROP TABLE IF EXISTS `ground_lock_opt_time`;
CREATE TABLE `ground_lock_opt_time`  (
  `id` int(11) NOT NULL,
  `lock_id` int(11) NULL DEFAULT NULL COMMENT '地锁外键',
  `lock_no` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地锁唯一编码',
  `opt_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `command` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指令',
  `enable` int(1) NULL DEFAULT 1 COMMENT '是否有效0:无效1:有效',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ground_lock_params
-- ----------------------------
DROP TABLE IF EXISTS `ground_lock_params`;
CREATE TABLE `ground_lock_params`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `lock_no` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地锁编号',
  `server_port` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器端口',
  `server_addr` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器地址',
  `heart_time` int(5) NULL DEFAULT NULL COMMENT '心跳超时次数',
  `enable` int(1) NULL DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `lock_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地锁Id',
  `unlock_time` int(11) NULL DEFAULT NULL COMMENT '解锁等待时间(秒)',
  `lock_time` int(11) NULL DEFAULT NULL COMMENT '车辆离开上锁时间(秒)',
  `idle_heart_beat` int(11) NULL DEFAULT NULL COMMENT '心跳包频率(秒)'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for group_pile_link
-- ----------------------------
DROP TABLE IF EXISTS `group_pile_link`;
CREATE TABLE `group_pile_link`  (
  `group_user_id` int(20) NULL DEFAULT NULL COMMENT '集团用户主键',
  `pile_id` int(20) NULL DEFAULT NULL COMMENT '桩主键',
  `is_use_only` int(1) NULL DEFAULT NULL COMMENT '是否仅集团子用户可用 0:不可用 1可用',
  `is_discount` int(1) NULL DEFAULT NULL COMMENT '是否享受集团电费/服务费/滞留费折扣优惠  0:不可享受  1:可享受',
  UNIQUE INDEX `group_user_id`(`group_user_id`, `pile_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for group_user
-- ----------------------------
DROP TABLE IF EXISTS `group_user`;
CREATE TABLE `group_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '集团用户登录名',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '集团用户名称',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '集团用户登录密码',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `electric_fee_discount` double(20, 2) NULL DEFAULT NULL COMMENT '电费折扣率',
  `service_fee_discount` double(20, 2) NULL DEFAULT NULL COMMENT '服务费折扣率',
  `demurrage_fee_discount` double(20, 2) NULL DEFAULT NULL COMMENT '滞留费折扣率',
  `month_prepayment` double(20, 2) NULL DEFAULT NULL COMMENT '集团月预充值金额',
  `big_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '账号过期时间',
  `uthority_expire_time` datetime(0) NULL DEFAULT NULL COMMENT '权限过期时间',
  `login_times` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '登录次数',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次登录ip',
  `current_login_time` datetime(0) NULL DEFAULT NULL COMMENT '当前登录时间',
  `current_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前登录ip',
  `pwd_wrong_times` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录时密码错误次数',
  `last_pwd_wrong_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次密码错误日期',
  `status` int(1) NULL DEFAULT 1 COMMENT '账号状态：0、删除，1、启用，2、禁用，3、锁定',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '集团用户邮箱地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for group_user_link
-- ----------------------------
DROP TABLE IF EXISTS `group_user_link`;
CREATE TABLE `group_user_link`  (
  `group_user_id` int(20) NULL DEFAULT NULL COMMENT '集团用户主键',
  `user_id` int(20) NULL DEFAULT NULL COMMENT '用户主键',
  `group_prepayment` double(20, 2) NULL DEFAULT NULL COMMENT '集团用户下用户金额',
  UNIQUE INDEX `group_user_id`(`group_user_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for group_user_role
-- ----------------------------
DROP TABLE IF EXISTS `group_user_role`;
CREATE TABLE `group_user_role`  (
  `user_id` int(11) NULL DEFAULT NULL COMMENT '集团用户id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '集团用户与用户角色关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inventory_history
-- ----------------------------
DROP TABLE IF EXISTS `inventory_history`;
CREATE TABLE `inventory_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_inventory_id` int(11) NULL DEFAULT NULL COMMENT '使用的采购库存主键',
  `action_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动作类型:01:入库,02:出库',
  `related_id` int(11) NULL DEFAULT NULL COMMENT '入库为预采购合同主键,出库为采购申请单主键',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '入库或出库数量',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `amount` double(20, 2) NULL DEFAULT NULL COMMENT '开票金额',
  `invoice_type` int(2) NULL DEFAULT NULL COMMENT '发票类型-01:电子发票,02:纸质发票',
  `email_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `billing_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票寄送地址',
  `pay_id` int(11) NULL DEFAULT NULL COMMENT '支付表ID',
  `invoice_header_type` int(2) NULL DEFAULT NULL COMMENT '抬头类型-01:个人02:公司',
  `invoice_header` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `taxpayer_registr_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纳税人识别号',
  `deposit_bank` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行',
  `debit_card_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `express_company` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递公司',
  `tracking_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `electric_invoice_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子发票下载地址',
  `status` int(2) NULL DEFAULT NULL COMMENT '01:新建,02:待开,03:已开,04:快递中,05:已完成,06:已备份,07已发送',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mdm_builder
-- ----------------------------
DROP TABLE IF EXISTS `mdm_builder`;
CREATE TABLE `mdm_builder`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `builder_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '施工方名称',
  `builder_nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '施工方昵称',
  `builder_contact_person` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '施工方联系人',
  `builder_phone` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '施工方电话',
  `enable` int(1) NULL DEFAULT 1 COMMENT '是否有效1:无效0:有效',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mdm_circle
-- ----------------------------
DROP TABLE IF EXISTS `mdm_circle`;
CREATE TABLE `mdm_circle`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市id',
  `circle_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商圈名称',
  `enable` int(1) NULL DEFAULT 1 COMMENT '是否有效0:无效1:有效',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '商圈创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '商圈创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '商圈更新时间',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '商圈更新人',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mdm_dic
-- ----------------------------
DROP TABLE IF EXISTS `mdm_dic`;
CREATE TABLE `mdm_dic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典id',
  `dic_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据key',
  `dic_value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据value',
  `dic_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据描述',
  `dic_index` int(11) NULL DEFAULT NULL COMMENT '数据顺序',
  `dic_group` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据组',
  `dic_group_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据组描述',
  `dic_enable` int(1) NULL DEFAULT 1 COMMENT '是否有效0:无效1:有效',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '数据字段创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '数据字典创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '数据字典更新时间',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '数据字典更新人',
  `update_by_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据字典更新人ip',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 178 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mdm_dic
-- ----------------------------
INSERT INTO `mdm_dic` VALUES (1, '', '1', '启用', 1, 'USER_STATUS', '用户状态', 1, NULL, NULL, '2016-05-11 11:41:38', 78, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (2, '', '2', '禁用', 2, 'USER_STATUS', '用户状态', 0, NULL, NULL, '2016-06-08 15:10:33', 63, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (3, 'USER_STATUS_LOCKED', '3', '锁定', 3, 'USER_STATUS', '用户状态', 0, NULL, NULL, '2016-06-07 15:58:45', 63, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (4, 'USER_STATUS_DELETE', '0', '删除', 4, 'USER_STATUS', '用户状态', 0, NULL, NULL, '2016-05-09 17:21:43', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (9, 'GUARD_LEVE_IP32', '1', 'IP32', 1, 'GUARD_LEVEL', '防护等级', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (10, 'GUARD_LEVE_IP54', '2', 'IP54', 2, 'GUARD_LEVEL', '防护等级', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (11, 'GUARD_LEVE_IP68', '3', 'IP68', 3, 'GUARD_LEVEL', '防护等级', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (12, '', '1', '发单', 1, 'CONSTRUCTION_STATUS', '施工状态', 1, NULL, NULL, '2016-05-09 15:28:56', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (13, 'CONSTRUCTION_STATUS_RECEIVE', '2', '接单', 2, 'CONSTRUCTION_STATUS', '施工状态', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (14, 'CONSTRUCTION_STATUS_WAIT', '3', '待施工', 3, 'CONSTRUCTION_STATUS', '施工状态', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (15, 'CONSTRUCTION_STATUS_WORKING', '4', '施工中', 4, 'CONSTRUCTION_STATUS', '施工状态', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (16, 'CONSTRUCTION_STATUS_END', '5', '施工结束', 5, 'CONSTRUCTION_STATUS', '施工状态', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (17, 'ROLE_TYPE_CUSTOMER', '1', '客户角色', 2, 'ROLE_TYPE', '角色类型', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (18, 'ROLE_TYPE_SYS', '0', '系统角色', 1, 'ROLE_TYPE', '角色类型', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (19, 'BRAND_PUTIAN', '1', '普天', 1, 'BRAND', '品牌', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (20, '', '2', '科华恒盛', 2, 'BRAND', '品牌', 1, NULL, NULL, '2016-07-28 17:04:53', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (24, 'TEMPLATE_REGEDIT', '1', '【合普友电】您注册HopeUday的验证码为： #code#, 请在#minute#分钟内输入验证,逾期后您需要重新获取一个验证码,谢谢!', 2, 'MESSAGE_TEMPLATE', '短信模板', 1, NULL, NULL, '2016-04-13 15:42:47', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (25, 'TEMPLATE_PASSWORD', '2', '【合普友电】您正在重置HopeUday的账户密码，验证码为： #code#, 请在#minute#分钟内输入验证,逾期后您需要重新获取一个验证码,谢谢!', 2, 'MESSAGE_TEMPLATE', '短信模板', 1, '2016-05-05 11:35:43', 1, '2016-05-05 11:35:46', 1, '1', NULL);
INSERT INTO `mdm_dic` VALUES (26, 'TEMPLATE_PILE_LOSE_EMPLOYEE', '3', '【合普友电】您的客户#customerName#下#pointName#的#pileNumber#发生故障失去链接，请尽快与您的客户联系，排除故障', 3, 'MESSAGE_TEMPLATE', '短信模板', 1, '2016-05-05 11:37:43', 1, '2016-05-05 11:37:47', 1, '1', NULL);
INSERT INTO `mdm_dic` VALUES (27, 'TEMPLATE_PILE_LOSE_CUSTOMER', '4', '【合普友电】尊敬的客户您#pointName#下的汽车充电桩#pileNumber#目前因故失去链接,请尽快确定故障原因，并进行排除，如您排除故障中遇到困难，请联系合普的业务人员或致电客户热线：#phone#', 4, 'MESSAGE_TEMPLATE', '短信模板', 2, '2016-05-05 11:42:37', 1, '2016-05-05 11:42:46', 1, '1', NULL);
INSERT INTO `mdm_dic` VALUES (28, 'TEMPLATE_PILE_LOSE_USER', '5', '【合普友电】您正在使用的汽车充电桩#pileNumber#目前因故失去链接,请在App页面刷新查看充电桩最新状态,感谢您的理解,如需帮助请联系合普友电客服热线:#phone#', 5, 'MESSAGE_TEMPLATE', '短信模板', 2, '2016-05-05 11:42:41', 1, '2016-06-02 10:03:33', 1, '1', NULL);
INSERT INTO `mdm_dic` VALUES (39, 'USER_LEVEL_1', '1', '等级一', 1, 'USER_LEVEL', '用户等级', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (40, 'MODEL_TYPE', '1', '直流', 1, 'MODEL_TYPE', '型号类型', 1, '2016-04-07 11:34:19', 1, '2016-06-03 11:29:32', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (41, '', '2', '交流', 2, 'MODEL_TYPE', '型号类型', 1, '2016-04-07 11:34:45', 1, '2016-06-03 11:21:38', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (44, '', '1', '3.3', 1, 'RATED_POWER', '额定功率', 1, '2016-04-07 11:39:44', 1, '2016-05-05 11:20:24', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (46, '', '1', '16', 1, 'RATED_CURRENT', '额定电流', 1, '2016-04-07 11:41:18', 1, '2016-05-05 11:21:44', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (47, '', '2', '32', 2, 'RATED_CURRENT', '额定电流', 1, '2016-04-07 11:41:52', 1, '2016-05-05 11:21:49', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (48, 'SIZE', '1', '100*80', 1, 'SIZE', '尺寸', 1, '2016-04-07 11:42:31', 1, '2016-04-07 11:42:31', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (49, 'SIZE', '2', '220*120', 2, 'SIZE', '尺寸', 1, '2016-04-07 11:42:55', 1, '2016-04-07 11:42:55', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (50, 'WORKING_HUMIDITY', '1', '20', 1, 'WORKING_HUMIDITY', '环境保护湿度', 1, '2016-04-07 11:44:59', 1, '2016-04-07 11:44:59', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (51, 'WORKING_HUMIDITY', '2', '50', 2, 'WORKING_HUMIDITY', '环境保护湿度', 1, '2016-04-07 11:45:25', 1, '2016-04-07 11:45:25', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (52, 'WORKING_TEMPERATURE', '1', '20', 1, 'WORKING_TEMPERATURE', '环境保护温度', 1, '2016-04-07 11:45:55', 1, '2016-04-07 11:45:55', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (53, 'WORKING_TEMPERATURE', '2', '40', 2, 'WORKING_TEMPERATURE', '环境保护温度', 1, '2016-04-07 11:46:23', 1, '2016-04-07 11:46:23', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (54, 'RATE_TYPE', '1', '按服务费收取', 1, 'RATE_TYPE', '费率类型', 1, '2016-04-08 16:53:09', 1, '2016-04-08 16:53:09', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (55, 'RATE_TYPE', '2', '按电费收取', 2, 'RATE_TYPE', '费率类型', 1, '2016-04-08 16:53:50', 1, '2016-04-08 16:53:50', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (56, 'USER_LEVEL_2', '2', '等级二', 2, 'USER_LEVEL', '用户等级', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (57, 'ID_TYPE_CARD', '1', '身份证', 1, 'ID_TYPE', '证件类型', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (58, 'ID_TYPE_PASSPORT', '2', '护照', 2, 'ID_TYPE', '证件类型', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (59, NULL, 'USER_STATUS', '用户状态', 2, 'DIC_GROUP', '数组分组', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (60, NULL, 'GUARD_LEVEL', '防护等级', 19, 'DIC_GROUP', '数组分组', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (61, NULL, 'CONSTRUCTION_STATUS', '施工状态', 3, 'DIC_GROUP', '数组分组', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (62, NULL, 'ROLE_TYPE', '角色类型', 4, 'DIC_GROUP', '数组分组', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (63, NULL, 'BRAND', '品牌', 5, 'DIC_GROUP', '数组分组', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (64, NULL, 'MESSAGE_TEMPLATE', '短信模板', 6, 'DIC_GROUP', '数组分组', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (65, NULL, 'USER_LEVEL', '用户等级', 7, 'DIC_GROUP', '数组分组', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (66, NULL, 'MODEL_TYPE', '型号类型', 8, 'DIC_GROUP', '数组分组', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (67, NULL, 'RATED_VOLTAGE', '额定电压', 9, 'DIC_GROUP', '数组分组', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (68, NULL, 'RATED_POWER', '额定功率', 10, 'DIC_GROUP', '数组分组', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (69, NULL, 'RATED_CURRENT', '额定电流', 11, 'DIC_GROUP', '数组分组', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (70, NULL, 'SIZE', '尺寸', 12, 'DIC_GROUP', '数组分组', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (71, NULL, 'WORKING_HUMIDITY', '环境保护湿度', 13, 'DIC_GROUP', '数组分组', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (72, NULL, 'WORKING_TEMPERATURE', '环境保护温度', 14, 'DIC_GROUP', '数组分组', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (73, NULL, 'RATE_TYPE', '费率类型', 15, 'DIC_GROUP', '数组分组', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (74, NULL, 'ID_TYPE', '证件类型', 16, 'DIC_GROUP', '数组分组', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (75, NULL, 'HOTLINE', '热线', 1, 'DIC_GROUP', '数组分组', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (86, 'SEX', '1', '男', 1, 'SEX', '性别', 1, '2016-04-12 17:05:49', 1, '2016-04-12 17:05:49', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (87, 'SEX', '2', '女', 2, 'SEX', '性别', 1, '2016-04-12 17:06:19', 1, '2016-04-12 17:06:19', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (96, '', '0', '中国银行', 1, 'BANK', '银行', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (97, NULL, '1', '中国农业银行', 2, 'BANK', '银行', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (104, '', '2', '10', 3, 'RATED_POWER', '额定功率', 1, '2016-04-14 10:14:15', 1, '2016-05-05 11:20:44', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (105, '', '3', '6.6', 2, 'RATED_POWER', '额定功率', 1, '2016-04-26 11:25:25', 42, '2016-05-05 11:20:37', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (114, 'ORDER_TYPE_1', '0', '已创建', 1, 'ORDER_TYPE', '订单状态', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (115, 'ORDER_TYPE_2', '1', '充电中', 2, 'ORDER_TYPE', '订单状态', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (116, 'ORDER_TYPE_3', '2', '待处理', 3, 'ORDER_TYPE', '订单状态', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (117, 'ORDER_TYPE_4', '3', '待付款', 4, 'ORDER_TYPE', '订单状态', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (118, 'ORDER_TYPE_5', '4', '已完成', 5, 'ORDER_TYPE', '订单状态', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (120, 'RATED_VOLTAGE_null', '4', '220', 1, 'RATED_VOLTAGE', '额定电压', 1, '2016-05-05 11:17:08', 1, '2016-05-05 11:17:08', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (121, 'RATED_VOLTAGE_null', '5', '380', 1, 'RATED_VOLTAGE', '额定电压', 1, '2016-05-05 11:17:13', 1, '2016-05-05 11:17:13', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (122, 'RATED_POWER_null', '4', '20', 4, 'RATED_POWER', '额定功率', 1, '2016-05-05 11:20:50', 1, '2016-05-05 11:20:50', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (123, 'ID_TYPE_null', '3', '军官证', 3, 'ID_TYPE', '证件类型', 1, '2016-05-05 11:26:50', 1, '2016-05-05 11:26:50', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (124, 'ID_TYPE_null', '4', '港澳居民来往内地通行证', 4, 'ID_TYPE', '证件类型', 1, '2016-05-05 11:27:01', 1, '2016-05-05 11:27:01', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (125, 'ID_TYPE_null', '5', '台湾居民来往大陆通行证', 5, 'ID_TYPE', '证件类型', 1, '2016-05-05 11:27:11', 1, '2016-05-05 11:27:11', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (126, 'USER_STATUS_null', '4', '快递费', 21, 'USER_STATUS', '用户状态', 0, '2016-05-11 11:38:36', 78, '2016-05-11 11:38:42', 78, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (127, 'USER_STATUS_null', '5', '地方', 1, 'USER_STATUS', '用户状态', 0, '2016-05-11 11:39:17', 78, '2016-05-11 11:39:26', 78, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (128, 'USER_LEVEL_null', '3', '等级三', 3, 'USER_LEVEL', '用户等级', 0, '2016-05-15 17:47:06', 63, '2016-05-15 17:47:18', 63, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (129, '', '3', '海尔', 2, 'BRAND', '品牌', 0, '2016-05-16 15:44:51', 63, '2016-05-16 15:45:20', 63, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (130, 'CUSTOMER_HOTLINE', '15908984487', '客户热线', 1, 'HOTLINE', '热线', 0, '2016-06-01 17:48:50', 1, '2016-06-16 14:00:28', 63, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (131, 'USER_HOTLINE', '15908984487', '用户热线', 1, 'HOTLINE', '热线', 1, '2016-06-01 17:48:54', 1, '2016-07-28 16:54:24', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (132, 'FTP_IP', '139.196.203.88', '139.196.203.88', 1, 'SP_FTP', 'FTP参数', 1, '2016-06-01 17:48:56', 1, '2016-06-01 17:49:14', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (133, 'FTP_PORT', '21', '21', 1, 'SP_FTP', 'FTP参数', 1, '2016-06-01 17:48:58', 1, '2016-06-02 10:12:11', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (134, 'FTP_USER', 'hopeuday', 'hopeuday', 1, 'SP_FTP', 'FTP参数', 1, '2016-06-01 17:49:00', 1, '2016-06-01 18:04:01', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (135, 'FTP_PWD', 'HpUd@2016', 'HpUd@2016', 1, 'SP_FTP', 'FTP参数', 1, '2016-06-01 17:49:02', 1, '2016-06-01 18:04:05', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (136, '', 'SP_FTP', 'FTP参数', 18, 'DIC_GROUP', '数组分组', 1, '2016-06-01 17:49:04', 1, '2016-06-01 17:49:06', 1, '', '');
INSERT INTO `mdm_dic` VALUES (137, 'GUN_TYPE', 'GUN_TYPE', '枪类型', 17, 'DIC_GROUP', '枪类型', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (139, 'GUN_TYPE_1', '1', '带充电枪', 1, 'GUN_TYPE', '枪类型', 1, '2016-06-06 17:59:36', 1, '2016-07-28 18:02:16', 9, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (140, 'GUN_TYPE_2', '2', '无充电枪', 2, 'GUN_TYPE', '枪类型', 1, '2016-06-06 17:59:51', 1, '2016-07-28 18:02:21', 9, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (142, 'USER_STATUS_null', '6', '锁定', 3, 'USER_STATUS', '用户状态', 1, '2016-06-07 15:58:56', 63, '2016-06-07 15:58:56', 63, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (143, 'USER_STATUS_null', '7', '禁用', 2, 'USER_STATUS', '用户状态', 1, '2016-06-08 15:10:42', 63, '2016-06-08 15:10:42', 63, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (144, 'USER_LEVEL_null', '4', '等级三', 3, 'USER_LEVEL', '用户等级', 0, '2016-06-14 16:25:50', 63, '2016-06-14 16:25:57', 63, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (145, 'BRAND_null', '4', '挚达科技', 3, 'BRAND', '品牌', 1, '2016-07-20 17:59:21', 1, '2016-07-20 17:59:21', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (146, 'BRAND_null', '5', '循道', 4, 'BRAND', '品牌', 1, '2016-07-20 17:59:33', 1, '2016-07-20 17:59:33', 1, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (147, 'PUSH_MSG_URL', 'http://appqa.hopeuday.com/api/pushMessage.ashx', 'app推送消息接口', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (150, 'USER_STATUS_null', '8', '启用1', 4, 'USER_STATUS', '用户状态', 0, '2017-05-11 13:40:50', 127, '2017-05-11 13:41:12', 127, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (151, 'USER_STATUS_null', '9', '待用', 4, 'USER_STATUS', '用户状态', 0, '2017-05-11 15:23:43', 127, '2017-05-11 15:47:00', 127, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (152, 'USER_STATUS_null', '10', '待用1', 4, 'USER_STATUS', '用户状态', 0, '2017-05-11 15:34:11', 127, '2017-05-11 16:52:51', 127, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (153, 'USER_STATUS_null', '10', '待用2', 5, 'USER_STATUS', '用户状态', 0, '2017-05-11 15:43:14', 127, '2017-05-11 17:01:55', 127, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (154, 'USER_STATUS_null', '10', '启用', 1, 'USER_STATUS', '用户状态', 1, '2017-05-11 16:52:46', 127, '2017-05-11 16:55:10', 127, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (155, 'SIGN_IN', '1001', '签到', 1, 'POINT_RULE_NO', '积分规则编号', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (156, 'REGISTRATION', '1002', '注册', 2, 'POINT_RULE_NO', '积分规则编号', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (157, 'PAYMENT', '1003', '支付', 3, 'POINT_RULE_NO', '积分规则编号', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (158, 'FEEDBACK', '1004', '反馈', 4, 'POINT_RULE_NO', '积分规则编号', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (159, 'SHARING', '1005', '分享', 5, 'POINT_RULE_NO', '积分规则编号', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (160, 'COMPLETE_DEMOGRAPHICS', '1006', '完善个人信息', 6, 'POINT_RULE_NO', '积分规则编号', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (161, 'HUMAN_INTERVEN', '1007', '人工干预', 7, 'POINT_RULE_NO', '积分规则编号', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (162, 'CONSUMPTION', '2001', '消费', 8, 'POINT_RULE_NO', '积分规则编号', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (163, 'ROLE_TYPE_GROUPUSER', '2', '集团用户角色', 3, 'ROLE_TYPE', '角色类型', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (164, 'INVOICE_STATUS_1', '1', '新建', 1, 'INVOICE_STATUS', '发票状态', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (165, 'INVOICE_STATUS_2', '2', '待开', 2, 'INVOICE_STATUS', '发票状态', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (166, 'INVOICE_STATUS_3', '3', '已开', 3, 'INVOICE_STATUS', '发票状态', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (167, 'INVOICE_STATUS_4', '4', '快递中', 4, 'INVOICE_STATUS', '发票状态', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (168, 'INVOICE_STATUS_5', '5', '完成', 5, 'INVOICE_STATUS', '发票状态', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (169, 'EXPRESS_COMPANY_1', 'EMS', 'EMS', 1, 'EXPRESS_COMPANY', '快递公司', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (170, 'EXPRESS_COMPANY_2', '顺丰', '顺丰', 2, 'EXPRESS_COMPANY', '快递公司', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (171, 'EXPRESS_COMPANY_3', '圆通', '圆通', 3, 'EXPRESS_COMPANY', '快递公司', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (172, 'EXPRESS_COMPANY_4', '申通', '申通', 4, 'EXPRESS_COMPANY', '快递公司', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (173, 'EXPRESS_COMPANY_5', '中通', '中通', 5, 'EXPRESS_COMPANY', '快递公司', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (174, 'EXPRESS_COMPANY_6', '韵达', '韵达', 6, 'EXPRESS_COMPANY', '快递公司', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (175, 'EXPRESS_COMPANY_7', '天天', '天天', 7, 'EXPRESS_COMPANY', '快递公司', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (176, 'ANDROID_VERSION', '1.2.3', '安卓最新版本号', 1, 'APP_VERSION', 'APP版本', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_dic` VALUES (177, 'ANDROID_DOWNLOAD_URL', 'www.hopeuday.com/apk', '安卓最新版本下载地址', 2, 'APP_VERSION', 'APP版本', 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for mdm_hot_city
-- ----------------------------
DROP TABLE IF EXISTS `mdm_hot_city`;
CREATE TABLE `mdm_hot_city`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市ID',
  `enable` int(1) NULL DEFAULT 1 COMMENT '城市状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新人',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `city_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '热门城市',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mdm_pay
-- ----------------------------
DROP TABLE IF EXISTS `mdm_pay`;
CREATE TABLE `mdm_pay`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pay_way` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付类型 0:支付宝1:微信2:其他',
  `enable` int(1) NULL DEFAULT 1 COMMENT '是否有效0:无效 1:有效',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `update_by_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者ip',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '第三方支付接口表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mdm_pay_detail
-- ----------------------------
DROP TABLE IF EXISTS `mdm_pay_detail`;
CREATE TABLE `mdm_pay_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pay_type` int(11) NULL DEFAULT NULL COMMENT '0:电费支付,1:其他支付',
  `pay_id` int(11) NULL DEFAULT NULL COMMENT '支付方式id',
  `param_key` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数key',
  `param_value` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数value',
  `param_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数描述',
  `is_edit` int(1) NULL DEFAULT 1 COMMENT '是否可编辑0：不可编辑1：可编辑',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mdm_pay_detail
-- ----------------------------
INSERT INTO `mdm_pay_detail` VALUES (1, 0, 1, 'partner', '2088221003174783', '签约合作者身份ID', 1, '2016-03-28 13:36:40', 1, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (2, 0, 1, 'seller_id', 'udaypay@hopeuday.com', '签约卖家支付宝账号', 1, '2016-03-28 13:49:28', NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (3, 0, 1, 'out_trade_no', '111', '商户网站唯一订单号', 1, NULL, NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (4, 0, 1, 'subject', '电费和服务费', '商品名称', 1, NULL, NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (5, 0, 1, 'body', '电费和服务费', '商品详情', 1, NULL, NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (6, 0, 1, 'total_fee', '555', '商品金额', 1, NULL, NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (7, 0, 1, 'notify_url', 'http://dev-demo.hopeuday.com/api/payment/aliNotify', '服务器异步通知页面路径', 0, NULL, NULL, '2016-04-01 16:50:40', 1);
INSERT INTO `mdm_pay_detail` VALUES (8, 0, 1, 'service', 'mobile.securitypay.pay', '服务接口名称， 固定值', 0, NULL, NULL, '2016-04-01 16:50:40', 1);
INSERT INTO `mdm_pay_detail` VALUES (9, 0, 1, 'payment_type', '1', '支付类型， 固定值', 0, NULL, NULL, '2016-04-01 16:50:40', 1);
INSERT INTO `mdm_pay_detail` VALUES (10, 0, 1, '_input_charset', 'utf-8', '参数编码， 固定值', 0, NULL, NULL, '2016-04-01 16:50:40', 1);
INSERT INTO `mdm_pay_detail` VALUES (11, 0, 1, 'it_b_pay', '30m', '设置未付款交易的超时时间', 0, NULL, NULL, '2016-04-01 16:50:41', 1);
INSERT INTO `mdm_pay_detail` VALUES (12, 0, 1, 'sign_type', 'RSA', '签名类型', 0, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_pay_detail` VALUES (13, 0, 1, 'private_key', 'MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMHbhzfYtjfMA9SdDRGTzfo5l8MSZCSIhpnVHya11nDRnMC6LRx3Q6HRYCiHk0JbHPIvHZdkCNJMqoGWZyiDyRvteRSPNpLBnDnhOU9b6+Pt26ZkMkIYgwWT3dnfyUtE5MVLHVV0F5W200zdU/uWlXU9a8WNEbR7JFnrwLz02bIFAgMBAAECgYEAoT7oihtH9cFMrlyzshsvCSM+iJOTmI+25d3Pu3Mkm1K+/8/cFgFd0AtH4G5knp0KxqdKBdK/Q61hZcikpZ54d70RJHWNmILzMVwC60g2SSIbONGHsK15dPwSczLfeAMSEyipDz/izVhgPDlPs10rGEN1WSLMryfGWqb0gnwE+0ECQQD7XwI+kqtQbYDx5NfYs5lAtU6e55S850TTLJPuUgb1bOznEz4e+AAXUfIHfqeQmSyO+pkEtKC4W6bFYItnwvr7AkEAxW1k3J2GvDEbS851gbWxbXx5+W+iqe5lDoCC2zZLlkb5s8e0tSRUzOafBF0e6h2yCJ7f7WYVsY0aVDb5CzZ2/wJAcKGYitsDIe1+6mQEhxeqIoFasf7H+YCSqSB/RDjC33MoDz3jBtNOjyRrkwogIL1RZttIdwBMR27hoezpadvGwwJAFACxZ2jObeLL0TJp1WqDP4SNFyioYm807fM3Tt6Baghm5EAnnvK/ZMM4+Ug2CaJYl2cBaRweto6FTGMFeI1cIQJAH+awt3h5XjqMDDA7eAwFB5taUOKan+ZHjmbj44TGhEasBIsxm8+OYsGgWuJJOggsIRMiAmOEXEPJ89NbpWnwnw==', '私钥', 1, NULL, NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (14, 0, 1, 'public_key', 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI6d306Q8fIfCOaTXyiUeJHkrIvYISRcc73s3vF1ZT7XN8RNPwJxo8pWaJMmvyTn9N4HQ632qJBVHf8sxHi/fEsraprwCtzvzQETrNRwVxLO5jVmRGi60j8Ue1efIlzPXV9je9mkjzOmdssymZkh2QhUrCmZYI/FCEa3/cNMW0QIDAQAB', '公钥', 1, NULL, NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (15, 0, 2, 'appid', 'wxd53d36da82199c75', '应用ID', 1, NULL, NULL, '2016-05-27 17:52:28', 61);
INSERT INTO `mdm_pay_detail` VALUES (16, 0, 2, 'mch_id', '1340647801', '商户号', 1, NULL, NULL, '2016-05-27 17:52:28', 61);
INSERT INTO `mdm_pay_detail` VALUES (17, 0, 2, 'notify_url', 'http://dev-demo.hopeuday.com/api/payment/wxNotify', '签名', 1, NULL, NULL, '2016-05-27 17:52:28', 61);
INSERT INTO `mdm_pay_detail` VALUES (18, 0, 2, 'body', '电费和服务费', '商品或支付单简要描述', 1, NULL, NULL, '2016-05-27 17:52:28', 61);
INSERT INTO `mdm_pay_detail` VALUES (19, 0, 2, 'spbill_create_ip', '127.0.0.1', '用户端实际ip', 1, NULL, NULL, '2016-05-27 17:52:29', 61);
INSERT INTO `mdm_pay_detail` VALUES (20, 0, 2, 'trade_type', 'APP', '交易类型', 1, NULL, NULL, '2016-05-27 17:52:29', 61);
INSERT INTO `mdm_pay_detail` VALUES (21, 0, 2, 'api_key', '797ECF804218458BAAAB892FF7277E01', 'API密钥，在商户平台设置', 1, NULL, NULL, '2016-05-27 17:52:29', 61);
INSERT INTO `mdm_pay_detail` VALUES (67, 1, 1, 'partner', '2088221003174783', '签约合作者身份ID', 1, '2016-03-28 13:36:40', 1, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (68, 1, 1, 'seller_id', 'udaypay@hopeuday.com', '签约卖家支付宝账号', 1, '2016-03-28 13:49:28', NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (69, 1, 1, 'out_trade_no', '111', '商户网站唯一订单号', 1, NULL, NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (70, 1, 1, 'subject', '服务费', '商品名称', 1, NULL, NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (71, 1, 1, 'body', '服务费', '商品详情', 1, NULL, NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (72, 1, 1, 'total_fee', '555', '商品金额', 1, NULL, NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (73, 1, 1, 'notify_url', 'http://dev-demo.hopeuday.com/api/payment/others/aliNotify', '服务器异步通知页面路径', 0, NULL, NULL, '2016-04-01 16:50:40', 1);
INSERT INTO `mdm_pay_detail` VALUES (74, 1, 1, 'service', 'mobile.securitypay.pay', '服务接口名称， 固定值', 0, NULL, NULL, '2016-04-01 16:50:40', 1);
INSERT INTO `mdm_pay_detail` VALUES (75, 1, 1, 'payment_type', '1', '支付类型， 固定值', 0, NULL, NULL, '2016-04-01 16:50:40', 1);
INSERT INTO `mdm_pay_detail` VALUES (76, 1, 1, '_input_charset', 'utf-8', '参数编码， 固定值', 0, NULL, NULL, '2016-04-01 16:50:40', 1);
INSERT INTO `mdm_pay_detail` VALUES (77, 1, 1, 'it_b_pay', '30m', '设置未付款交易的超时时间', 0, NULL, NULL, '2016-04-01 16:50:41', 1);
INSERT INTO `mdm_pay_detail` VALUES (78, 1, 1, 'sign_type', 'RSA', '签名类型', 0, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_pay_detail` VALUES (79, 1, 1, 'private_key', 'MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMHbhzfYtjfMA9SdDRGTzfo5l8MSZCSIhpnVHya11nDRnMC6LRx3Q6HRYCiHk0JbHPIvHZdkCNJMqoGWZyiDyRvteRSPNpLBnDnhOU9b6+Pt26ZkMkIYgwWT3dnfyUtE5MVLHVV0F5W200zdU/uWlXU9a8WNEbR7JFnrwLz02bIFAgMBAAECgYEAoT7oihtH9cFMrlyzshsvCSM+iJOTmI+25d3Pu3Mkm1K+/8/cFgFd0AtH4G5knp0KxqdKBdK/Q61hZcikpZ54d70RJHWNmILzMVwC60g2SSIbONGHsK15dPwSczLfeAMSEyipDz/izVhgPDlPs10rGEN1WSLMryfGWqb0gnwE+0ECQQD7XwI+kqtQbYDx5NfYs5lAtU6e55S850TTLJPuUgb1bOznEz4e+AAXUfIHfqeQmSyO+pkEtKC4W6bFYItnwvr7AkEAxW1k3J2GvDEbS851gbWxbXx5+W+iqe5lDoCC2zZLlkb5s8e0tSRUzOafBF0e6h2yCJ7f7WYVsY0aVDb5CzZ2/wJAcKGYitsDIe1+6mQEhxeqIoFasf7H+YCSqSB/RDjC33MoDz3jBtNOjyRrkwogIL1RZttIdwBMR27hoezpadvGwwJAFACxZ2jObeLL0TJp1WqDP4SNFyioYm807fM3Tt6Baghm5EAnnvK/ZMM4+Ug2CaJYl2cBaRweto6FTGMFeI1cIQJAH+awt3h5XjqMDDA7eAwFB5taUOKan+ZHjmbj44TGhEasBIsxm8+OYsGgWuJJOggsIRMiAmOEXEPJ89NbpWnwnw==', '私钥', 1, NULL, NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (80, 1, 1, 'public_key', 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI6d306Q8fIfCOaTXyiUeJHkrIvYISRcc73s3vF1ZT7XN8RNPwJxo8pWaJMmvyTn9N4HQ632qJBVHf8sxHi/fEsraprwCtzvzQETrNRwVxLO5jVmRGi60j8Ue1efIlzPXV9je9mkjzOmdssymZkh2QhUrCmZYI/FCEa3/cNMW0QIDAQAB', '公钥', 1, NULL, NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (81, 1, 2, 'appid', 'wxd53d36da82199c75', '应用ID', 1, NULL, NULL, '2016-05-27 17:52:28', 61);
INSERT INTO `mdm_pay_detail` VALUES (82, 1, 2, 'mch_id', '1340647801', '商户号', 1, NULL, NULL, '2016-05-27 17:52:28', 61);
INSERT INTO `mdm_pay_detail` VALUES (83, 1, 2, 'notify_url', 'http://dev-demo.hopeuday.com/api/payment/others/wxNotify', '签名', 1, NULL, NULL, '2016-05-27 17:52:28', 61);
INSERT INTO `mdm_pay_detail` VALUES (84, 1, 2, 'body', '服务费', '商品或支付单简要描述', 1, NULL, NULL, '2016-05-27 17:52:28', 61);
INSERT INTO `mdm_pay_detail` VALUES (85, 1, 2, 'spbill_create_ip', '127.0.0.1', '用户端实际ip', 1, NULL, NULL, '2016-05-27 17:52:29', 61);
INSERT INTO `mdm_pay_detail` VALUES (86, 1, 2, 'trade_type', 'APP', '交易类型', 1, NULL, NULL, '2016-05-27 17:52:29', 61);
INSERT INTO `mdm_pay_detail` VALUES (87, 1, 2, 'api_key', '797ECF804218458BAAAB892FF7277E01', 'API密钥，在商户平台设置', 1, NULL, NULL, '2016-05-27 17:52:29', 61);
INSERT INTO `mdm_pay_detail` VALUES (88, 2, 1, 'partner', '2088221003174783', '签约合作者身份ID', 1, '2016-03-28 13:36:40', 1, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (89, 2, 1, 'seller_id', 'udaypay@hopeuday.com', '签约卖家支付宝账号', 1, '2016-03-28 13:49:28', NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (90, 2, 1, 'out_trade_no', '111', '商户网站唯一订单号', 1, NULL, NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (91, 2, 1, 'subject', '滞留费', '商品名称', 1, NULL, NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (92, 2, 1, 'body', '滞留费', '商品详情', 1, NULL, NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (93, 2, 1, 'total_fee', '555', '商品金额', 1, NULL, NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (94, 2, 1, 'notify_url', 'http://139.196.1.117/api/demurrage/aliNotify', '服务器异步通知页面路径', 0, NULL, NULL, '2016-04-01 16:50:40', 1);
INSERT INTO `mdm_pay_detail` VALUES (95, 2, 1, 'service', 'mobile.securitypay.pay', '服务接口名称， 固定值', 0, NULL, NULL, '2016-04-01 16:50:40', 1);
INSERT INTO `mdm_pay_detail` VALUES (96, 2, 1, 'payment_type', '1', '支付类型， 固定值', 0, NULL, NULL, '2016-04-01 16:50:40', 1);
INSERT INTO `mdm_pay_detail` VALUES (97, 2, 1, '_input_charset', 'utf-8', '参数编码， 固定值', 0, NULL, NULL, '2016-04-01 16:50:40', 1);
INSERT INTO `mdm_pay_detail` VALUES (98, 2, 1, 'it_b_pay', '30m', '设置未付款交易的超时时间', 0, NULL, NULL, '2016-04-01 16:50:41', 1);
INSERT INTO `mdm_pay_detail` VALUES (99, 2, 1, 'sign_type', 'RSA', '签名类型', 0, NULL, NULL, NULL, NULL);
INSERT INTO `mdm_pay_detail` VALUES (100, 2, 1, 'private_key', 'MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMHbhzfYtjfMA9SdDRGTzfo5l8MSZCSIhpnVHya11nDRnMC6LRx3Q6HRYCiHk0JbHPIvHZdkCNJMqoGWZyiDyRvteRSPNpLBnDnhOU9b6+Pt26ZkMkIYgwWT3dnfyUtE5MVLHVV0F5W200zdU/uWlXU9a8WNEbR7JFnrwLz02bIFAgMBAAECgYEAoT7oihtH9cFMrlyzshsvCSM+iJOTmI+25d3Pu3Mkm1K+/8/cFgFd0AtH4G5knp0KxqdKBdK/Q61hZcikpZ54d70RJHWNmILzMVwC60g2SSIbONGHsK15dPwSczLfeAMSEyipDz/izVhgPDlPs10rGEN1WSLMryfGWqb0gnwE+0ECQQD7XwI+kqtQbYDx5NfYs5lAtU6e55S850TTLJPuUgb1bOznEz4e+AAXUfIHfqeQmSyO+pkEtKC4W6bFYItnwvr7AkEAxW1k3J2GvDEbS851gbWxbXx5+W+iqe5lDoCC2zZLlkb5s8e0tSRUzOafBF0e6h2yCJ7f7WYVsY0aVDb5CzZ2/wJAcKGYitsDIe1+6mQEhxeqIoFasf7H+YCSqSB/RDjC33MoDz3jBtNOjyRrkwogIL1RZttIdwBMR27hoezpadvGwwJAFACxZ2jObeLL0TJp1WqDP4SNFyioYm807fM3Tt6Baghm5EAnnvK/ZMM4+Ug2CaJYl2cBaRweto6FTGMFeI1cIQJAH+awt3h5XjqMDDA7eAwFB5taUOKan+ZHjmbj44TGhEasBIsxm8+OYsGgWuJJOggsIRMiAmOEXEPJ89NbpWnwnw==', '私钥', 1, NULL, NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (101, 2, 1, 'public_key', 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI6d306Q8fIfCOaTXyiUeJHkrIvYISRcc73s3vF1ZT7XN8RNPwJxo8pWaJMmvyTn9N4HQ632qJBVHf8sxHi/fEsraprwCtzvzQETrNRwVxLO5jVmRGi60j8Ue1efIlzPXV9je9mkjzOmdssymZkh2QhUrCmZYI/FCEa3/cNMW0QIDAQAB', '公钥', 1, NULL, NULL, '2016-06-07 16:00:02', 63);
INSERT INTO `mdm_pay_detail` VALUES (102, 2, 2, 'appid', 'wxd53d36da82199c75', '应用ID', 1, NULL, NULL, '2016-05-27 17:52:28', 61);
INSERT INTO `mdm_pay_detail` VALUES (103, 2, 2, 'mch_id', '1340647801', '商户号', 1, NULL, NULL, '2016-05-27 17:52:28', 61);
INSERT INTO `mdm_pay_detail` VALUES (104, 2, 2, 'notify_url', 'http://139.196.1.117/api/demurrage/wxNotify', '签名', 1, NULL, NULL, '2016-05-27 17:52:28', 61);
INSERT INTO `mdm_pay_detail` VALUES (105, 2, 2, 'body', '滞留费', '商品或支付单简要描述', 1, NULL, NULL, '2016-05-27 17:52:28', 61);
INSERT INTO `mdm_pay_detail` VALUES (106, 2, 2, 'spbill_create_ip', '127.0.0.1', '用户端实际ip', 1, NULL, NULL, '2016-05-27 17:52:29', 61);
INSERT INTO `mdm_pay_detail` VALUES (107, 2, 2, 'trade_type', 'APP', '交易类型', 1, NULL, NULL, '2016-05-27 17:52:29', 61);
INSERT INTO `mdm_pay_detail` VALUES (108, 2, 2, 'api_key', '797ECF804218458BAAAB892FF7277E01', 'API密钥，在商户平台设置', 1, NULL, NULL, '2016-05-27 17:52:29', 61);

-- ----------------------------
-- Table structure for mdm_pay_detail_copy
-- ----------------------------
DROP TABLE IF EXISTS `mdm_pay_detail_copy`;
CREATE TABLE `mdm_pay_detail_copy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pay_id` int(11) NULL DEFAULT NULL COMMENT '支付方式id',
  `param_key` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数key',
  `param_value` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数value',
  `param_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数描述',
  `is_edit` int(1) NULL DEFAULT 1 COMMENT '是否可编辑0：不可编辑1：可编辑',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mdm_product_model
-- ----------------------------
DROP TABLE IF EXISTS `mdm_product_model`;
CREATE TABLE `mdm_product_model`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品型号',
  `model_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品类型',
  `charge_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `rated_voltage` int(2) NULL DEFAULT NULL COMMENT '额定电压(V)',
  `rated_power` int(2) NULL DEFAULT NULL COMMENT '额定功率(KW)',
  `rated_current` int(2) NULL DEFAULT NULL COMMENT '额定电流(A)',
  `working_humidity` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作环境湿度(RH%)',
  `working_temperature` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作环境温度(℃)',
  `maximum_voltage_ua` int(11) NULL DEFAULT NULL COMMENT '最高输出电压UA(V)',
  `minimum_voltage_ua` int(11) NULL DEFAULT NULL COMMENT '最低输出电压UA(V)',
  `maximum_voltage_ub` int(11) NULL DEFAULT NULL COMMENT '最高输出电压UB(V)',
  `minimum_voltage_ub` int(11) NULL DEFAULT NULL COMMENT '最低输出电压UB(V)',
  `maximum_voltage_uc` int(11) NULL DEFAULT NULL COMMENT '最高输出电压UC(V)',
  `minimum_voltage_uc` int(11) NULL DEFAULT NULL COMMENT '最低输出电压UC(V)',
  `maximum_current_ia` int(11) NULL DEFAULT NULL COMMENT '最高输出电流IA(A)',
  `minimum_current_ia` int(11) NULL DEFAULT NULL COMMENT '最低输出电流IA(A)',
  `maximum_current_ib` int(11) NULL DEFAULT NULL COMMENT '最高输出电流IB(A)',
  `minimum_current_ib` int(11) NULL DEFAULT NULL COMMENT '最低输出电流IB(A)',
  `maximum_current_ic` int(11) NULL DEFAULT NULL COMMENT '最高输出电流IC(A)',
  `minimum_current_ic` int(11) NULL DEFAULT NULL COMMENT '最低输出电流IC(A)',
  `protection_grade` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '防护等级',
  `size` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外形尺寸(CM)',
  `soc` decimal(11, 0) NULL DEFAULT NULL COMMENT '最高SOC',
  `model_photo_url` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品图片',
  `enable` int(1) NULL DEFAULT 1 COMMENT '是否有效0:无效1:有效',
  `brand` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` int(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_by_ip` varbinary(20) NULL DEFAULT NULL COMMENT '修改人ip',
  `vesion` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '协议号',
  `upgrade_package` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '升级包',
  `upgrade_package_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '升级包文件名',
  `gun_type` int(1) NULL DEFAULT NULL COMMENT '枪类型',
  `serial_no_flag` int(1) NULL DEFAULT 0 COMMENT '机器串号校验标志位(0:不校验,1:校验)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2222223 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品型号' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for merchant_discount
-- ----------------------------
DROP TABLE IF EXISTS `merchant_discount`;
CREATE TABLE `merchant_discount`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) NULL DEFAULT NULL COMMENT '所属商户',
  `valid_start_date` datetime(0) NULL DEFAULT NULL COMMENT '有效开始时间',
  `valid_end_date` datetime(0) NULL DEFAULT NULL COMMENT '有效结束时间',
  `discount_description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '折扣描述',
  `status` int(1) NULL DEFAULT NULL COMMENT '是否通过审核：0：未通过,1:已通过',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for merchant_info
-- ----------------------------
DROP TABLE IF EXISTS `merchant_info`;
CREATE TABLE `merchant_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge_point_id` int(11) NULL DEFAULT NULL COMMENT '关联的充电点',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户登录名',
  `merchant_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户名称',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户登录密码',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `big_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '账号过期时间',
  `uthority_expire_time` datetime(0) NULL DEFAULT NULL COMMENT '权限过期时间',
  `login_times` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '登录次数',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次登录ip',
  `current_login_time` datetime(0) NULL DEFAULT NULL COMMENT '当前登录时间',
  `current_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前登录ip',
  `pwd_wrong_times` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录时密码错误次数',
  `last_pwd_wrong_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次密码错误日期',
  `status` int(1) NULL DEFAULT 1 COMMENT '账号状态：0、删除，1、启用，2、禁用，3、锁定',
  `enable` int(1) NULL DEFAULT 1 COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for merchant_info_copy
-- ----------------------------
DROP TABLE IF EXISTS `merchant_info_copy`;
CREATE TABLE `merchant_info_copy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge_point_id` int(11) NULL DEFAULT NULL COMMENT '关联的充电点',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户登录名',
  `merchant_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户名称',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户登录密码',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `big_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '账号过期时间',
  `uthority_expire_time` datetime(0) NULL DEFAULT NULL COMMENT '权限过期时间',
  `login_times` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '登录次数',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次登录ip',
  `current_login_time` datetime(0) NULL DEFAULT NULL COMMENT '当前登录时间',
  `current_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前登录ip',
  `pwd_wrong_times` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录时密码错误次数',
  `last_pwd_wrong_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次密码错误日期',
  `status` int(1) NULL DEFAULT 1 COMMENT '账号状态：0、删除，1、启用，2、禁用，3、锁定',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for merchant_role
-- ----------------------------
DROP TABLE IF EXISTS `merchant_role`;
CREATE TABLE `merchant_role`  (
  `merchant_id` int(11) NULL DEFAULT NULL COMMENT '商户ID',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色ID'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商户与角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for notification_history
-- ----------------------------
DROP TABLE IF EXISTS `notification_history`;
CREATE TABLE `notification_history`  (
  `history_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `target_type` int(11) NULL DEFAULT NULL COMMENT '目标类型：userId:0 , phoneNo:1,emailAddress:2',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '消息接收人，deviceId或手机号码',
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱地址',
  `message` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息内容',
  `notification_type` int(45) NULL DEFAULT NULL COMMENT '1：SMS,2：PUSH',
  `description` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `created_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人，对应user_id',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `enable` int(1) NULL DEFAULT 1 COMMENT '是否有效 1:有效，0：无效',
  `updated_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人，对应user_id',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `notification_status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`history_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 652 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '推送消息历史表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for notification_template
-- ----------------------------
DROP TABLE IF EXISTS `notification_template`;
CREATE TABLE `notification_template`  (
  `template_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模板编号',
  `template` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板，freemarker',
  `template_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板名字',
  `notification_type` int(1) NULL DEFAULT NULL COMMENT '1：SMS,2：PUSH',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `created_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `enable` int(1) NULL DEFAULT 1 COMMENT '是否有效 1:有效，0：无效',
  `updated_by` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`template_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息通知模板' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for point_rule
-- ----------------------------
DROP TABLE IF EXISTS `point_rule`;
CREATE TABLE `point_rule`  (
  `id` int(11) NOT NULL COMMENT 'rule id',
  `rule_no` int(11) NOT NULL COMMENT '????',
  `rule_type` int(11) NOT NULL COMMENT '????',
  `point_amount` int(11) NOT NULL COMMENT '积分数量\n生产，就是生产数量\n消费，就是消费数量',
  `point_ratio` decimal(2, 0) NULL DEFAULT NULL COMMENT '充值规则里充值的金额乘以改系数决定最终的积分数量\n\n充电规则里用消费金额乘以该系数决定最终的积分数量',
  `daily_increasement` int(11) NULL DEFAULT 0,
  `daily_limit` int(11) NULL DEFAULT 0,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `enable` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of point_rule
-- ----------------------------
INSERT INTO `point_rule` VALUES (1, 1001, 1, 1000, 50, 20, 1600, '127', '2017-05-16 00:00:00', '127', '2017-06-08 18:21:54', 1);
INSERT INTO `point_rule` VALUES (2, 1002, 1, 999, 60, 200, 900, '127', '2017-05-16 00:00:00', '127', '2017-06-09 19:54:04', 1);
INSERT INTO `point_rule` VALUES (3, 1003, 1, 1000, 60, 200, 900, '127', '2017-05-16 00:00:00', '127', '2017-06-09 19:54:02', 1);
INSERT INTO `point_rule` VALUES (4, 1004, 1, 2100, 89, 100, 1000, '127', '2017-05-09 00:00:00', '127', '2017-06-09 10:52:15', 1);
INSERT INTO `point_rule` VALUES (5, 1005, 1, 700, 0, 77, 500, '127', '2017-05-16 00:00:00', '127', '2017-07-17 17:27:49', 1);
INSERT INTO `point_rule` VALUES (6, 1006, 1, 500, 0, 70, 12, '127', '2017-05-16 00:00:00', '127', '2017-07-18 13:14:15', 1);
INSERT INTO `point_rule` VALUES (7, 1007, 1, 1000, 78, 20, 700, '127', '2017-05-16 00:00:00', '127', '2017-06-09 19:53:54', 1);
INSERT INTO `point_rule` VALUES (8, 1008, 1, 100, 1, 0, 0, '127', '2017-05-16 00:00:00', '127', '2017-06-23 17:30:57', 1);
INSERT INTO `point_rule` VALUES (9, 2001, 2, 1122, 0, 24, 2000, '127', '2017-05-16 00:00:00', '127', '2017-07-18 13:14:07', 1);
INSERT INTO `point_rule` VALUES (10, 1009, 1, 1, 0, 0, 0, '127', '2017-06-16 09:51:34', '127', '2017-07-17 17:27:14', 1);

-- ----------------------------
-- Table structure for point_txn_history
-- ----------------------------
DROP TABLE IF EXISTS `point_txn_history`;
CREATE TABLE `point_txn_history`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `rule_no` int(11) NULL DEFAULT NULL,
  `point_amount` int(11) NULL DEFAULT NULL,
  `continuous_days` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `description` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for prepayment_history
-- ----------------------------
DROP TABLE IF EXISTS `prepayment_history`;
CREATE TABLE `prepayment_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prepament_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1:集团用户,2:个人用户',
  `user_id` int(20) NULL DEFAULT NULL COMMENT '用户主键',
  `action_type` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '101:集团月初预付,102:集团月末清零,201:个人充值,202:个人消费,203:人工干预,204:客户卡充值,205:客户卡消费',
  `amount` double(20, 2) NULL DEFAULT NULL COMMENT '充值或使用费用',
  `comments` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 361 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目编号',
  `project_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `project_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目地点',
  `project_principal_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目负责人',
  `technical_user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '技术人员',
  `construction_user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工程人员',
  `purchase_user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购人员',
  `contract_id` int(11) NULL DEFAULT NULL COMMENT '商务合同主键',
  `risk_level` int(1) NULL DEFAULT NULL COMMENT '风险等级 0：非常高，1高，2中，3低，4非常低',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `status` int(1) NULL DEFAULT NULL COMMENT '项目阶段: 0:启动 1:准备 2:评审 3：实施 4：验收 5：收尾 6：完成',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for project_budget
-- ----------------------------
DROP TABLE IF EXISTS `project_budget`;
CREATE TABLE `project_budget`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目主键',
  `pile_budget` double(20, 2) NULL DEFAULT NULL COMMENT '充电桩预算',
  `material_budget` double(20, 2) NULL DEFAULT NULL COMMENT '物料预算',
  `elec_closet_budget` double(20, 2) NULL DEFAULT NULL COMMENT '配电箱预算',
  `other_device_budget` double(20, 2) NULL DEFAULT NULL COMMENT '其他设备预算',
  `engineering_budget` double(20, 2) NULL DEFAULT NULL COMMENT '工程预算',
  `trip_budget` double(20, 2) NULL DEFAULT NULL COMMENT '差旅预算',
  `management_budget` double(20, 2) NULL DEFAULT NULL COMMENT '管理费预算',
  `eng_deposit_budget` double(20, 2) NULL DEFAULT NULL COMMENT '施工押金预算',
  `reserve_budget` double(20, 2) NULL DEFAULT NULL COMMENT '储备金预算',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for project_construction
-- ----------------------------
DROP TABLE IF EXISTS `project_construction`;
CREATE TABLE `project_construction`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目主键',
  `construction_principal` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '施工负责人',
  `construction_deposit` double(20, 2) NULL DEFAULT NULL COMMENT '工程押金',
  `security_principal` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全负责人',
  `material_sample_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物料验收样品编号',
  `device_entry_date` datetime(0) NULL DEFAULT NULL COMMENT '设备入网时间',
  `is_device_entry` int(1) NULL DEFAULT NULL COMMENT '设备是否已入网',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for project_design
-- ----------------------------
DROP TABLE IF EXISTS `project_design`;
CREATE TABLE `project_design`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目主键',
  `elec_requirement_info` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定制配置需求信息',
  `cable_connection_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接线方式',
  `cable_spec` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线缆规格',
  `is_router` int(1) NULL DEFAULT NULL COMMENT '是否有路由器',
  `router_model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由器型号',
  `is_mobile_network_device` int(1) NULL DEFAULT NULL COMMENT '是否有移动网络',
  `weak_elec_cable_spec` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '弱电线缆规格',
  `weak_elec_cable_lenth` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '弱电线缆长度',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for project_progress
-- ----------------------------
DROP TABLE IF EXISTS `project_progress`;
CREATE TABLE `project_progress`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目主键',
  `progress_type` int(1) NULL DEFAULT NULL COMMENT '进度类型:0:项目进度,1:施工进度',
  `project_construction_id` int(11) NULL DEFAULT NULL COMMENT '施工主键',
  `start_date` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `offset_days` double(20, 2) NULL DEFAULT NULL COMMENT '实际工作天数，提前或滞后：提前+1，滞后-1',
  `progress_stage_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JSON字符串,{实施阶段:5,监督阶段:5,验收阶段:10,收尾阶段:6}',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for project_review_history
-- ----------------------------
DROP TABLE IF EXISTS `project_review_history`;
CREATE TABLE `project_review_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目ID',
  `is_passed` int(1) NULL DEFAULT NULL COMMENT '是否通过,0:否，1：是',
  `review_comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评审意见',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for project_risk_factor
-- ----------------------------
DROP TABLE IF EXISTS `project_risk_factor`;
CREATE TABLE `project_risk_factor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目主键',
  `risk_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影响因素名称',
  `scope_workload` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影响范围工作量',
  `scope_organization` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影响范围部门',
  `rework_probablity` double(20, 2) NULL DEFAULT NULL COMMENT '质量影响：返工概率',
  `repair_probablity` double(20, 2) NULL DEFAULT NULL COMMENT '质量影响：返修概率',
  `progress_influence` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '进度影响',
  `cost_influence` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成本影响',
  `strategy` int(1) NULL DEFAULT NULL COMMENT '应对策略,0:规避,1:转移,2:减轻,3:接受',
  `strategy_comments` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标注',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for project_survey
-- ----------------------------
DROP TABLE IF EXISTS `project_survey`;
CREATE TABLE `project_survey`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目主键',
  `customer_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户地址',
  `customer_pro_pk_car_model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户专有停车位车辆型号',
  `customer_pro_charge_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户专有停车位充电类型',
  `customer_pro_pk_type` int(1) NULL DEFAULT NULL COMMENT '停车位类型:0:露天，1：地下，2：立体',
  `customer_pro_pk_quantity` int(11) NULL DEFAULT NULL COMMENT '客户专有停车位数量',
  `customer_comm_charge_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公有停车位类型:0:露天，1：地下，2：立体',
  `customer_comm_quantity` int(11) NULL DEFAULT NULL COMMENT '客户公有停车位数量',
  `is_prevent_hydrops` int(1) NULL DEFAULT NULL COMMENT '是否积水',
  `is_prevent_fire` int(1) NULL DEFAULT NULL COMMENT '是否有消防设备',
  `dangerous_area` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '危险区域',
  `is_prevent_thunder` int(1) NULL DEFAULT NULL COMMENT '是否防雷',
  `elec_total_capacity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配电总容量',
  `elec_total_required` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配电总需求量',
  `elec_used_type` int(1) NULL DEFAULT NULL COMMENT '用电类型:0:商业用电，1：工业用电，2：居民用电',
  `routing_way` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '走线方式',
  `routing_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线路规格',
  `is_routing_safe` int(1) NULL DEFAULT NULL COMMENT '走线是否安全',
  `routing_comments` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '走线危险具体描述',
  `routing_destroy_road` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路面破坏(长宽深)',
  `routing_destroy_afforest` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绿化破坏（面积、植被类型）',
  `routing_punch` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '穿墙打孔（个数，大小）',
  `routing_earthwork` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '土方开挖量',
  `network_quality` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网络质量',
  `is_ethernet` int(1) NULL DEFAULT NULL COMMENT '是否有以太网',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for purchase_detail
-- ----------------------------
DROP TABLE IF EXISTS `purchase_detail`;
CREATE TABLE `purchase_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detail_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '明细类型：01:预采购合同 02：采购合同 03：采购申请 04:项目需求单',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '关联的采购申请，采购合同，预采购合同主键',
  `product_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `product_model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品型号',
  `product_quantity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品数量',
  `product_unit_price` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品单价',
  `related_contract_id` int(11) NULL DEFAULT NULL COMMENT '关联的采购合同主键',
  `express_company` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递公司',
  `tracking_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `delivery_contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递联系人',
  `delivery_contact_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递联系人手机号',
  `status` int(1) NULL DEFAULT NULL COMMENT '0：新建,1:已确认,2:快递中,3:已完成',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `selected_quantity` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for purchase_inventory
-- ----------------------------
DROP TABLE IF EXISTS `purchase_inventory`;
CREATE TABLE `purchase_inventory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) NULL DEFAULT NULL COMMENT '预采购合同主键',
  `product_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `product_model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品型号',
  `product_quantity` int(11) NULL DEFAULT NULL COMMENT '产品数量',
  `remain_quantity` int(11) NULL DEFAULT NULL COMMENT '剩余数量',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for purchase_request
-- ----------------------------
DROP TABLE IF EXISTS `purchase_request`;
CREATE TABLE `purchase_request`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_req_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购申请单编号',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目主键',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` int(1) NULL DEFAULT NULL COMMENT '0：新建,1:进行中,2:已完成',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_document
-- ----------------------------
DROP TABLE IF EXISTS `sys_document`;
CREATE TABLE `sys_document`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文档名称',
  `file_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `file_url` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `enable` int(1) NULL DEFAULT 1 COMMENT '是否有效0:无效 1:有效',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '培训文档管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param`  (
  `param_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数编号',
  `param_type_code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数类型编号',
  `param_key` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数键名',
  `param_value1` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数值一',
  `param_value2` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数值二',
  `param_value3` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数值三',
  `param_value4` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数值四',
  `display_order` int(11) NULL DEFAULT NULL COMMENT '顺序，对应前台列表展示顺序',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `updated_by` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `created_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `enable` int(1) NULL DEFAULT 1 COMMENT '是否有效0:无效1:有效',
  PRIMARY KEY (`param_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统参数表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_param
-- ----------------------------
INSERT INTO `sys_param` VALUES (2, 'PT_PRICE_ARRAY', '电价区间2', '15', '30', '4', NULL, 2, '15-30分4元', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (3, 'PT_PRICE_ARRAY', '电价区间3', '30', '100', '5', NULL, 3, '30-100分5元', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (4, 'PT_RESER_LIMIT', '用户预约上限1', '3', NULL, NULL, NULL, 1, '每个用户每天最多预约次数', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (5, 'PT_RESER_KEEP', '用户预约保留时长', '15', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (6, 'PT_LOCKLOG_KEEP', '地锁日志保留天数', '30', '1', '1', '1', 1, '1', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (7, 'PT_PILELOG_KEEP', '桩日志保留天数', '30', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_param` VALUES (11, 'PT_PRICE_ARRAY', '电价区间1', '0', '15', '3', '', 1, '0-15分3元', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (35, 'PT_USER_LEVEL', 'USER_LEVEL_1', '0', '100', '1', NULL, 1, '等级一积分送1倍', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (36, 'PT_USER_LEVEL', 'USER_LEVEL_2', '100', '200', '1.1', NULL, 2, '等级二积分送1.1倍', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (37, 'PT_USER_LEVEL', 'USER_LEVEL_3', '200', '300', '1.2', NULL, 3, '等级三积分送1.2倍', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (46, 'PT_INVOICE_EXPRESS_FEE', '发票邮递费', '8', NULL, NULL, NULL, 1, '发票邮递费用', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (47, 'PT_RETENTION_PRICE_ARRAY', '滞留费价格区间_1', '0', '15', '0', NULL, 1, '0到15分钟为0元', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (48, 'PT_RETENTION_PRICE_ARRAY', '滞留费价格区间_2', '15', '30', '5', NULL, 2, '15到30分钟为5元', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (49, 'PT_RETENTION_PRICE_ARRAY', '滞留费价格区间_3', '30', '99999', '10', NULL, 3, '30分钟后10元', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (50, 'PT_POINT_PRICE_PROPORTION', '积分和金额的兑换比例', '100', NULL, NULL, NULL, NULL, '100积分为1元人民币', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (79, 'PT_PROJECT_ATTACHMENT', 'SURVEY_ELECTRICAL_PLAN', '电气平面图CAD', NULL, NULL, NULL, NULL, '项目勘察配电勘察电气平面图CAD', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (80, 'PT_PROJECT_ATTACHMENT', 'SURVEY_COLLOCATION_AREA', '配电区照片', NULL, NULL, NULL, NULL, '项目勘察配电区照片', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (81, 'PT_PROJECT_ATTACHMENT', 'SURVEY_WALK_THE_LINE_PLAN', '走线（管道桥架）平面图CAD', NULL, NULL, NULL, NULL, '项目勘察走线勘察走线（管道桥架）平面图CAD', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (82, 'PT_PROJECT_ATTACHMENT', 'SURVEY_NETWORK_LAYOUT_PLAN', '网络布局平面图CAD', NULL, NULL, NULL, NULL, '项目勘察网络勘查网络布局平面图CAD', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (83, 'PT_PROJECT_ATTACHMENT', 'DESIGN_CONSTRUCTION_DRAWING', '施工图纸', NULL, NULL, NULL, NULL, '项目设计施工图纸', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (84, 'PT_PROJECT_ATTACHMENT', 'DESIGN_CUSTOMIZED_COLLOCATION_DIAGRAM', '配电图', NULL, NULL, NULL, NULL, '配电柜定制配电图', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (85, 'PT_PROJECT_ATTACHMENT', 'DESIGN_PLAN_CONSTRUCTION_SCHEDULE', '施工进度表', NULL, NULL, NULL, NULL, '施工设计施工计划施工进度表', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (86, 'PT_PROJECT_ATTACHMENT', 'DESIGN_PLAN_CONSTRUCTION_BUDGET_SHEET', '施工预算表', NULL, NULL, NULL, NULL, '施工设计施工计划施工预算表', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (87, 'PT_PROJECT_ATTACHMENT', 'DESIGN_PLAN_CONSTRUCTION_FLOW_CHART', '施工流程图', NULL, NULL, NULL, NULL, '施工设计施工计划施工流程图', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (88, 'PT_PROJECT_ATTACHMENT', 'DESIGN_DRAWING_CONSTRUCTION_PLANS', '施工图', NULL, NULL, NULL, NULL, '施工设计施工图纸施工图', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (89, 'PT_PROJECT_ATTACHMENT', 'DESIGN_DRAWING_CONSTRUCTION_COLLOCATION_DIAGR', '施工配电图', NULL, NULL, NULL, NULL, '施工设计施工图纸施工配电图', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (90, 'PT_PROJECT_ATTACHMENT', 'DESIGN_DRAWING_WIRE_ROUTING_DIAGRAM', '施工网线走线图', NULL, NULL, NULL, NULL, '施工设计施工图纸施工网线走线图', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (91, 'PT_PROJECT_ATTACHMENT', 'IMPLEMENTATION_MEASURES_SAFETY_SIGN_BOARD', '安全指示牌', NULL, NULL, NULL, NULL, '施工监管安全防护措施安全指示牌', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (92, 'PT_PROJECT_ATTACHMENT', 'IMPLEMENTATION_MEASURES_SAFETY_BAR', '安全宣讲栏', NULL, NULL, NULL, NULL, '施工监管安全防护措施安全宣讲栏', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (93, 'PT_PROJECT_ATTACHMENT', 'IMPLEMENTATION_ACCEPTANCE_CHECK_CONFORMITY_CE', '合格证书', NULL, NULL, NULL, NULL, '施工监管物料验收合格证书', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (94, 'PT_PROJECT_ATTACHMENT', 'IMPLEMENTATION_ACCEPTANCE_CHECK_INSPECTION_RE', '检查报告', NULL, NULL, NULL, NULL, '施工监管物料验收检查报告', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (95, 'PT_PROJECT_ATTACHMENT', 'IMPLEMENTATION_SCHEDULE_CONSTRUCTION_SCHEDULE', '施工进度表', NULL, NULL, NULL, NULL, '施工监管施工实施进度施工进度表', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (96, 'PT_PROJECT_ATTACHMENT', 'IMPLEMENTATION_SCHEDULE_SCENE_PHOTOS', '现场照片', NULL, NULL, NULL, NULL, '施工监管施工实施进度现场照片', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (97, 'PT_PROJECT_ATTACHMENT', 'ACCEPTANCE_CHECK_ENGINEERING_ACCEPTANCE', '工程部分验收（表格）', NULL, NULL, NULL, NULL, '项目启动项目验收工程部分验收（表格）', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (98, 'PT_PROJECT_ATTACHMENT', 'ACCEPTANCE_CHECK_DISTRIBUTION_ACCEPTANCE', '配电部分验收（表格）', NULL, NULL, NULL, NULL, '项目启动项目验收配电部分验收（表格）', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (99, 'PT_PROJECT_ATTACHMENT', 'ACCEPTANCE_CHECK_DISTRIBUTION_ACCEPTANCE', '配电部分验收（表格）', NULL, NULL, NULL, NULL, '项目启动项目验收配电部分验收（表格）', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (100, 'PT_PROJECT_ATTACHMENT', 'ACCEPTANCE_CHECK_WEAK_CURRENT_ACCEPTANCE', '弱电部分验收（表格）', NULL, NULL, NULL, NULL, '项目启动项目验收弱电部分验收（表格）', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (101, 'PT_PROJECT_ATTACHMENT', 'ACCEPTANCE_CHECK_EQUIPMENT_ACCEPTANCE', '设备运营验收（表格）', NULL, NULL, NULL, NULL, '项目启动项目验收设备运营验收（表格）', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (102, 'PT_PROJECT_ATTACHMENT', 'ACCEPTANCE_CHECK_WHOLE_COMPLETION_ACCEPTANCE', '整体竣工验收（表格）', NULL, NULL, NULL, NULL, '项目启动项目验收整体竣工验收（表格）', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (103, 'PT_PROJECT_ATTACHMENT', 'ACCEPTANCE_CHECK_PROJECT_ARCHIVE_CONSTRUCTION', '施工图', NULL, NULL, NULL, NULL, '项目收尾项目归档（项目移交）施工图', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (104, 'PT_PROJECT_ATTACHMENT', 'ACCEPTANCE_CHECK_PROJECT_ARCHIVE_DISTRIBUTION', '配电图', NULL, NULL, NULL, NULL, '项目收尾项目归档（项目移交）配电图', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (105, 'PT_PROJECT_ATTACHMENT', 'ACCEPTANCE_CHECK_PROJECT_ARCHIVE_EQUIPMENT_DE', '设备安装调试报告', NULL, NULL, NULL, NULL, '项目收尾项目归档（项目移交）设备安装调试报告', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (106, 'PT_PROJECT_ATTACHMENT', 'ACCEPTANCE_CHECK_PROJECT_ARCHIVE_ACCEPTANCE_R', '竣工验收报告', NULL, NULL, NULL, NULL, '项目收尾项目归档（项目移交）竣工验收报告', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (107, 'PT_PROJECT_ATTACHMENT', 'ACCEPTANCE_CHECK_TRAIN_CHARGINGPILE_TRAINING_', '充电桩培训资料', NULL, NULL, NULL, NULL, '项目收尾充电桩培训充电桩培训资料', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (108, 'PT_PROJECT_ATTACHMENT', 'ACCEPTANCE_CHECK_TRAIN_APP_TRAINING_MATERIALS', 'APP培训资料', NULL, NULL, NULL, NULL, '项目收尾充电桩培训APP培训资料', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (109, 'PT_PROJECT_ATTACHMENT', 'ACCEPTANCE_CHECK_SAFETY_PATROL_PARTOL_LIST', '巡检表', NULL, NULL, NULL, NULL, '安全培训周期性安全巡检巡检表', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (110, 'PT_PROJECT_ATTACHMENT', 'IMPLEMENTATION_READY_CONSTRUCTION_QUALIFICATI', '施工资质文件', NULL, NULL, NULL, NULL, '项目施工施工准备施工资质文件', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (111, 'PT_PROJECT_ATTACHMENT', 'IMPLEMENTATION_READY_CONSTRUCTION_PERSONNEL_I', '施工人员证件', NULL, NULL, NULL, NULL, '项目施工施工准备施工人员证件', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (112, 'PT_PROJECT_ATTACHMENT', 'IMPLEMENTATION_READY_CONSTRUCTION_CONFIRMATIO', '施工确认函', NULL, NULL, NULL, NULL, '项目施工施工准备施工确认函', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param` VALUES (113, 'PT_PROJECT_ATTACHMENT', 'IMPLEMENTATION_READY_CONSTRUCTION_ADMISSION_P', '施工入场证', NULL, NULL, NULL, NULL, '项目施工施工准备施工入场证', NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for sys_param_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_param_type`;
CREATE TABLE `sys_param_type`  (
  `param_type_code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数类型编号',
  `param_type_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数类型名称',
  `param_type_category` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数类型分类',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `updated_by` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `created_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `enable` int(1) NULL DEFAULT 1 COMMENT '是否有效0:无效1:有效',
  PRIMARY KEY (`param_type_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统参数类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_param_type
-- ----------------------------
INSERT INTO `sys_param_type` VALUES ('PT_LOCKLOG_KEEP', '地锁日志保留时长', '日志', '地锁日志保留时长，按天', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param_type` VALUES ('PT_PILELOG_KEEP', '桩日志保留时长', '日志', '桩日志保留时长，按天', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param_type` VALUES ('PT_PRICE_ARRAY', '分时计价区间', '计费', '分时计价矩阵', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param_type` VALUES ('PT_PROJECT_ATTACHMENT', '附件种类', '项目', '项目中的附件种类', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param_type` VALUES ('PT_RESER_KEEP', '用户预约保留时长', '预约', '预约保留时长，按分钟', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param_type` VALUES ('PT_RESER_LIMIT', '用户预约上限', '预约', '单个用户一天最多预约次数', NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_param_type` VALUES ('PT_USER_LEVEL', '用户等级区间', '用户', '用户等级区间', NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for sys_push_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_push_message`;
CREATE TABLE `sys_push_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `order_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `error_code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误代码',
  `type` int(1) NULL DEFAULT NULL COMMENT '类型 1：订单相关 2：消息推送',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `enable` int(1) NULL DEFAULT 1 COMMENT '是否可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_push_status
-- ----------------------------
DROP TABLE IF EXISTS `sys_push_status`;
CREATE TABLE `sys_push_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `pile_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '桩编码',
  `order_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `error_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误代码',
  `timeout_flag` int(1) NULL DEFAULT NULL COMMENT '超时标记',
  `type` int(1) NULL DEFAULT NULL COMMENT '类型 1：订单相关 2：消息推送',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态 1：已推送 0：未推送',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_push_status_ix_01`(`pile_number`) USING BTREE,
  INDEX `sys_push_status_ix_02`(`pile_number`, `status`) USING BTREE,
  INDEX `sys_push_status_ix_03`(`order_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2143552 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_region
-- ----------------------------
DROP TABLE IF EXISTS `sys_region`;
CREATE TABLE `sys_region`  (
  `region_id` int(11) NOT NULL,
  `region_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域code',
  `region_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域名称',
  `parent_id` int(11) NOT NULL COMMENT '父级id',
  `region_level` int(11) NOT NULL COMMENT '区域级别',
  `region_order` int(11) NOT NULL COMMENT '区域顺序',
  `region_name_en` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域英文名',
  `region_shortname_en` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域短名称',
  `region_enable` int(1) NULL DEFAULT 1 COMMENT '是否有效0:无效1:有效',
  `region_create_time` datetime(0) NULL DEFAULT NULL COMMENT '区域创建时间',
  `region_create_by` int(11) NULL DEFAULT NULL COMMENT '区域创建时间',
  `region_update_time` datetime(0) NULL DEFAULT NULL COMMENT '区域更新时间',
  `region_update_by` int(11) NULL DEFAULT NULL COMMENT '区域更新人',
  `region_update_by_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域更新人ip',
  `region_remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`region_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行政区域表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resource_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `resource_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源描述',
  `resource_url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源url',
  `resource_type` int(1) NULL DEFAULT 0 COMMENT '资源类型0:菜单1:组件2:资源',
  `resource_icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源样式',
  `resource_category` int(1) NULL DEFAULT 0 COMMENT '资源类别0:系统资源1:客户资源',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态0隐藏 1显示',
  `is_delete` int(1) NULL DEFAULT 1 COMMENT '0删除1未删除',
  `order_index` int(11) NULL DEFAULT 0 COMMENT '资源顺序',
  `is_quick` int(1) NULL DEFAULT NULL COMMENT '是否是快捷菜单',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2024 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES (1, '根目录', '根目录', '', -1, '', 0, 0, 1, 1, 0, NULL);
INSERT INTO `sys_resource` VALUES (2, '主页', '主页', '', 0, 'home', 0, 1, 0, 1, 0, NULL);
INSERT INTO `sys_resource` VALUES (3, '首页', '首页', '/index', 0, '', 0, 2, 0, 1, 8, NULL);
INSERT INTO `sys_resource` VALUES (4, '系统管理', '系统管理', '', 0, 'wrench', 0, 1, 1, 1, 6, NULL);
INSERT INTO `sys_resource` VALUES (5, '员工管理', '员工管理', '/sysUser', 0, '', 0, 4, 1, 1, 603, NULL);
INSERT INTO `sys_resource` VALUES (6, '系统角色管理', '系统角色管理', '/role', 0, '', 0, 4, 1, 1, 604, NULL);
INSERT INTO `sys_resource` VALUES (7, '菜单管理', '菜单管理', '/resource', 0, '', 0, 4, 1, 1, 605, NULL);
INSERT INTO `sys_resource` VALUES (8, '数据字典', '数据字典', '/dic', 0, 'desktop', 0, 4, 0, 1, 606, NULL);
INSERT INTO `sys_resource` VALUES (9, '第三方支付管理', '第三方支付管理', '/pay', 0, '', 0, 4, 1, 1, 607, NULL);
INSERT INTO `sys_resource` VALUES (10, '用户管理', '用户管理', '', 0, 'user', 0, 1, 1, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (11, '用户列表', '用户列表', '/user', 0, '', 0, 10, 1, 1, 401, NULL);
INSERT INTO `sys_resource` VALUES (12, '客户管理', '客户管理', '', 0, 'bank', 0, 1, 1, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (13, '客户信息管理', '客户管理', '/customer', 0, '', 0, 12, 1, 1, 201, NULL);
INSERT INTO `sys_resource` VALUES (16, '充电桩网络监测', '充电桩网络监测', '/monitor', 0, '', 0, 157, 1, 1, 303, NULL);
INSERT INTO `sys_resource` VALUES (22, '充电桩控制', '充电桩控制', '/chargePileControl', 0, '', 0, 12, 1, 1, 203, NULL);
INSERT INTO `sys_resource` VALUES (24, '价格管理', '价格管理', '/chargePrice', 0, '', 0, 12, 1, 1, 204, NULL);
INSERT INTO `sys_resource` VALUES (27, '结算管理', '结算管理', '', 0, 'credit-card', 0, 1, 1, 1, 4, NULL);
INSERT INTO `sys_resource` VALUES (28, '费用结算管理', '费用结算管理', '/settlement', 0, '', 0, 27, 1, 1, 701, NULL);
INSERT INTO `sys_resource` VALUES (30, '活动管理', '', '', 0, 'globe', 0, 1, 1, 1, 6, NULL);
INSERT INTO `sys_resource` VALUES (31, '促销管理', '', '', 0, '', 0, 30, 1, 1, 601, NULL);
INSERT INTO `sys_resource` VALUES (33, '数据统计报表', '数据统计报表', '', 0, 'bar-chart', 0, 1, 1, 1, 5, NULL);
INSERT INTO `sys_resource` VALUES (34, '充电桩分布', '充电桩分布', '/pileDistributed', 0, '', 0, 33, 1, 1, 501, NULL);
INSERT INTO `sys_resource` VALUES (35, '用户行为分析', '用户行为', '/userHabit', 0, '', 0, 10, 1, 1, 902, NULL);
INSERT INTO `sys_resource` VALUES (36, '充电桩使用频率', '充电桩使用频率', '/pileFrequency', 0, '', 0, 33, 1, 1, 502, NULL);
INSERT INTO `sys_resource` VALUES (38, '用户支付记录', '用户支付记录', '/userPayRecord', 0, '', 0, 33, 1, 1, 504, NULL);
INSERT INTO `sys_resource` VALUES (45, '充电桩型号管理', '充电桩型号管理', '/productModel', 0, '', 0, 157, 1, 1, 301, NULL);
INSERT INTO `sys_resource` VALUES (46, '施工方信息管理', '', '/builder', 0, '', 0, 49, 1, 1, 609, NULL);
INSERT INTO `sys_resource` VALUES (47, '充电点信息管理', '充电点信息管理', '/chargePoint', 0, '', 0, 12, 1, 1, 202, NULL);
INSERT INTO `sys_resource` VALUES (48, '非在网充电桩管理', '非在网充电桩管理', '/otherbrands', 0, '', 0, 157, 1, 1, 302, NULL);
INSERT INTO `sys_resource` VALUES (49, '安装施工', '安装施工', '', 0, 'credit-card', 0, 1, 1, 1, 7, NULL);
INSERT INTO `sys_resource` VALUES (50, '安装施工管理', '安装施工管理', '/construction', 0, '', 0, 49, 1, 1, 801, NULL);
INSERT INTO `sys_resource` VALUES (53, '员工新增', '员工新增', 'SYS_USER_ADD', 2, '', 0, 5, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (54, '员工编辑', '员工编辑', 'SYS_USER_EDIT', 2, '', 0, 5, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (55, '热点城市管理', '热点城市管理', '/hotcity', 0, '', 0, 4, 1, 1, 601, NULL);
INSERT INTO `sys_resource` VALUES (56, '商圈管理', '商圈管理', '/circle', 0, '', 0, 4, 1, 1, 602, NULL);
INSERT INTO `sys_resource` VALUES (57, '安装施工新增', '安装施工新增', 'INSTALL_ADD', 2, '', 0, 50, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (58, '安装施工编辑', '安装施工编辑', 'INSTALL_EDIT', 2, '', 0, 50, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (59, '安装施工删除', '安装施工删除', 'INSTALL_DELETE', 2, '', 0, 50, 0, 1, 3, NULL);
INSERT INTO `sys_resource` VALUES (60, '商圈新增', '商圈新增', 'CIRCLE_ADD', 2, '', 0, 56, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (61, '商圈编辑', '商圈编辑', 'CIRCLE_EDIT', 2, '', 0, 56, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (62, '商圈删除', '商圈删除', 'CIRCLE_DELETE', 2, '', 0, 56, 0, 1, 3, NULL);
INSERT INTO `sys_resource` VALUES (63, '用户初始化密码', '用户初始化密码', 'USER_REFRESH', 2, '', 0, 11, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (64, '用户禁用', '用户禁用', 'USER_BAN', 2, '', 0, 11, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (65, '用户启用', '用户启用', 'USER_PLAY', 2, '', 0, 11, 0, 1, 3, NULL);
INSERT INTO `sys_resource` VALUES (66, '充电桩控制通电', '充电桩控制通电', 'CHARGEPILE_PLAY', 2, '', 0, 22, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (67, '充电桩控制断电', '充电桩控制断电', 'CHARGEPILE_STOP', 2, '', 0, 22, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (68, '充电桩控制恢复', '充电桩控制恢复', 'CHARGEPILE_REFRESH', 2, '', 0, 22, 0, 1, 3, NULL);
INSERT INTO `sys_resource` VALUES (69, '客户新增', '客户新增', 'CUSTOMER_ADD', 2, '', 0, 13, 1, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (70, '日志监控', '日志监控', '', 0, 'medkit', 0, 1, 1, 1, 11, NULL);
INSERT INTO `sys_resource` VALUES (71, '操作日志', '操作日志', '/operateLog', 0, '', 0, 70, 1, 0, 1, NULL);
INSERT INTO `sys_resource` VALUES (73, '员工删除', '员工删除', 'USER_DEL', 2, '', 0, 5, 0, 1, 3, NULL);
INSERT INTO `sys_resource` VALUES (76, '培训管理', '培训管理', '/document', 0, '', 0, 4, 1, 1, 608, NULL);
INSERT INTO `sys_resource` VALUES (77, '用户活跃度', '用户活跃度', '/userLiveness', 0, '', 0, 33, 1, 1, 503, NULL);
INSERT INTO `sys_resource` VALUES (78, '用户查询', '用户查询', '', 2, '', 0, 11, 0, 1, 0, NULL);
INSERT INTO `sys_resource` VALUES (79, '客户查询', '客户查询', '', 2, '', 0, 13, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (80, '客户删除', '客户删除', 'CUSTOMER_DEL', 2, '', 0, 13, 0, 1, 3, NULL);
INSERT INTO `sys_resource` VALUES (81, '客户修改', '客户修改', 'CUSTOMER_EDIT', 2, '', 0, 13, 0, 1, 5, NULL);
INSERT INTO `sys_resource` VALUES (82, '客户用户管理', '客户用户管理', '/customerUser', 2, '', 0, 13, 0, 1, 4, NULL);
INSERT INTO `sys_resource` VALUES (91, '充电点新增', '充电点新增', 'CHARGE_POINT_ADD', 2, '', 0, 47, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (92, '充电点修改', '充电点修改', 'CHARGE_POINT_EDIT', 2, '', 0, 47, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (93, '充电点查询', '充电点查询', '', 2, '', 0, 47, 0, 1, 3, NULL);
INSERT INTO `sys_resource` VALUES (94, '充电点删除', '充电点删除', 'CHARGE_POINT_DEL', 2, '', 0, 47, 0, 1, 4, NULL);
INSERT INTO `sys_resource` VALUES (95, '其他品牌充电桩查询', '其他品牌充电桩查询', 'OTHER_CHARGE_SEQ', 2, '', 0, 48, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (96, '其他品牌充电桩新增', '其他品牌充电桩新增', 'OTHER_CHARGE_ADD', 2, '', 0, 48, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (97, '其他品牌充电桩修改', '其他品牌充电桩修改', 'OTHER_CHARGE_EDIT', 2, '', 0, 48, 0, 1, 3, NULL);
INSERT INTO `sys_resource` VALUES (98, '其他品牌充电桩删除', '其他品牌充电桩删除', 'OTHER_CHARGE_DEL', 2, '', 0, 48, 0, 1, 4, NULL);
INSERT INTO `sys_resource` VALUES (99, '价格查询', '价格查询', '', 2, '', 0, 24, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (100, '价格新增', '价格新增', 'CHARGE_POINT_PRICE_ADD', 2, '', 0, 24, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (101, '价格修改', '价格修改', 'CHARGE_POINT_PRICE_EDIT', 2, '', 0, 24, 0, 1, 3, NULL);
INSERT INTO `sys_resource` VALUES (102, '价格删除', '价格删除', 'CHARGE_POINT_PRICE_DEL', 2, '', 0, 24, 0, 1, 4, NULL);
INSERT INTO `sys_resource` VALUES (103, '网络监测查询', '网络监测查询', '', 2, '', 0, 16, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (104, '费用结算查询', '费用结算查询', '', 2, '', 0, 28, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (105, '费用结算导出', '费用结算导出', '', 2, '', 0, 28, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (106, '商圈查询', '商圈查询', '', 2, '', 0, 56, 0, 1, 0, NULL);
INSERT INTO `sys_resource` VALUES (107, '安装施工查询', '安装施工查询', '', 2, '', 0, 50, 0, 1, 4, NULL);
INSERT INTO `sys_resource` VALUES (109, '员工查询', '员工查询', '', 2, '', 0, 5, 0, 0, 4, NULL);
INSERT INTO `sys_resource` VALUES (110, '角色查询', '角色查询', '', 2, '', 0, 6, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (111, '角色新增', '角色新增', '', 2, '', 0, 6, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (112, '角色修改', '角色修改', '', 2, '', 0, 6, 0, 1, 3, NULL);
INSERT INTO `sys_resource` VALUES (113, '角色删除', '角色删除', '', 2, '', 0, 6, 0, 1, 4, NULL);
INSERT INTO `sys_resource` VALUES (114, '角色权限分配', '角色权限分配', '', 2, '', 0, 6, 0, 1, 5, NULL);
INSERT INTO `sys_resource` VALUES (115, '充电桩控制查询', '充电桩控制查询', '', 2, '', 0, 22, 0, 1, 4, NULL);
INSERT INTO `sys_resource` VALUES (116, '热点城市查询', '热点城市查询', '', 2, '', 0, 55, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (117, '热点城市新增', '热点城市新增', '', 2, '', 0, 55, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (118, '热点城市修改', '热点城市修改', '', 2, '', 0, 55, 0, 1, 3, NULL);
INSERT INTO `sys_resource` VALUES (119, '热点城市删除', '热点城市删除', '', 2, '', 0, 55, 0, 1, 4, NULL);
INSERT INTO `sys_resource` VALUES (120, '施工方查询', '施工方查询', '', 2, '', 0, 46, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (121, '施工方新增', '施工方新增', '', 2, '', 0, 46, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (122, '施工方修改', '施工方修改', '', 2, '', 0, 46, 0, 1, 3, NULL);
INSERT INTO `sys_resource` VALUES (123, '施工方删除', '施工方删除', '', 2, '', 0, 46, 0, 1, 4, NULL);
INSERT INTO `sys_resource` VALUES (124, '充电桩型号查询', '充电桩型号查询', '', 2, '', 0, 45, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (125, '充电桩型号新增', '充电桩型号新增', '', 2, '', 0, 45, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (126, '充电桩型号修改', '充电桩型号修改', '', 2, '', 0, 45, 0, 1, 3, NULL);
INSERT INTO `sys_resource` VALUES (127, '充电桩型号删除', '充电桩型号删除', '', 2, '', 0, 45, 0, 1, 4, NULL);
INSERT INTO `sys_resource` VALUES (128, '用户活跃度查询', '用户活跃度查询', '', 2, '', 0, 77, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (129, '用户活跃度导出', '用户活跃度导出', '', 2, '', 0, 77, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (130, '用户支付记录查询', '用户支付记录查询', '', 2, '', 0, 38, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (131, '用户支付记录导出', '用户支付记录导出', '', 2, '', 0, 38, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (132, '充电桩使用频率导出', '充电桩使用频率导出', '', 2, '', 0, 36, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (133, '用户行为分析查询', '用户行为分析查询', '', 2, '', 0, 35, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (134, '用户行为分析导出', '用户行为分析导出', '', 2, '', 0, 35, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (135, '充电桩分布查询', '充电桩分布查询', '', 2, '', 0, 34, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (136, '充电桩分布导出', '充电桩分布导出', '', 2, '', 0, 34, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (137, '培训文档查询', '培训文档查询', '', 2, '', 0, 76, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (138, '培训文档新增', '培训文档新增', '', 2, '', 0, 76, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (139, '培训文档修改', '培训文档修改', '', 2, '', 0, 76, 0, 1, 3, NULL);
INSERT INTO `sys_resource` VALUES (140, '培训文档删除', '培训文档删除', '', 2, '', 0, 76, 0, 1, 4, NULL);
INSERT INTO `sys_resource` VALUES (141, '菜单新增', '菜单新增', '', 2, '', 0, 7, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (142, '菜单修改', '菜单修改', '', 2, '', 0, 7, 0, 1, 3, NULL);
INSERT INTO `sys_resource` VALUES (143, '菜单删除', '菜单删除', '', 2, '', 0, 7, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (144, '数据字典查询', '数据字典查询', '', 2, '', 0, 8, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (145, '数据字典修改', '数据字典修改', '', 2, '', 0, 8, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (146, '支付修改', '支付修改', '', 2, '', 0, 9, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (147, '支付启用', '支付启用', '', 2, '', 0, 9, 0, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (148, '支付禁用', '支付禁用', '', 2, '', 0, 9, 0, 1, 3, NULL);
INSERT INTO `sys_resource` VALUES (149, '充电桩使用频率查询', '充电桩使用频率查询', '', 2, '', 0, 36, 0, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (150, '今日订单', '今日订单', 'INDEX_DASHBOARD_ORDER', 2, '', 0, 3, 1, 1, 1, NULL);
INSERT INTO `sys_resource` VALUES (151, '充电桩状态', '充电桩状态', 'INDEX_DASHBOARD_CHARGE', 2, '', 0, 3, 1, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (152, '用户数', '用户数', 'INDEX_DASHBOARD_USER', 2, '', 0, 3, 1, 1, 3, NULL);
INSERT INTO `sys_resource` VALUES (153, '客户数量', '客户数量', 'INDEX_DASHBOARD_CUSTOMER', 2, '', 0, 3, 1, 1, 4, NULL);
INSERT INTO `sys_resource` VALUES (154, '充电桩分布图', '充电桩分布图', 'INDEX_CHARGE_LAYOUT', 2, '', 0, 3, 1, 1, 5, NULL);
INSERT INTO `sys_resource` VALUES (155, '充电桩异常分布', '充电桩异常分布', 'INDEX_CHARGE_CHARGE_ERROR_LAYOUT', 2, '', 0, 3, 1, 1, 6, NULL);
INSERT INTO `sys_resource` VALUES (156, '充电曲线图', '充电曲线图', 'INDEX_CHARGING_LINECHART', 2, '', 0, 3, 1, 1, 7, NULL);
INSERT INTO `sys_resource` VALUES (157, '充电桩管理', '充电桩管理', '', 0, 'sitemap', 0, 1, 1, 1, 3, NULL);
INSERT INTO `sys_resource` VALUES (159, '充电桩日志', '充电桩日志', '/socketLog', 0, '', 0, 70, 1, 1, 2, NULL);
INSERT INTO `sys_resource` VALUES (168, '充电桩网络监测', '资源', '', 2, '', 0, 165, 0, 0, 2, NULL);
INSERT INTO `sys_resource` VALUES (170, '删除', '删除', '', 2, '删除', 0, 165, 0, 1, 3, NULL);
INSERT INTO `sys_resource` VALUES (177, '充电桩参数设置', '充电桩参数设置', '/chargePileParams', 0, '', 0, 157, 1, 1, 4, NULL);
INSERT INTO `sys_resource` VALUES (189, '菜单查看', '菜单查看', '', 0, '', 0, 7, 0, 1, 4, NULL);
INSERT INTO `sys_resource` VALUES (190, '员工查询', '员工查询', '', 0, '', 0, 5, 0, 1, 4, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名字',
  `role_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `role_type` int(1) NULL DEFAULT 0 COMMENT '角色类型,0 系统角色 1:客户角色 2:集团用户角色',
  `is_delete` int(1) NULL DEFAULT 1 COMMENT '是否删除0:未删除1:已删除',
  `create_by` int(1) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` int(1) NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_admin_role_is_delete`(`is_delete`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', '超级管理员', 0, 1, 1, '2016-02-13 13:15:37', 1, '2016-11-24 16:03:30');
INSERT INTO `sys_role` VALUES (2, '客户管理员', '客户管理员', 1, 1, 1, '2016-05-05 11:18:00', 1, '2016-05-05 11:56:49');
INSERT INTO `sys_role` VALUES (3, '账户管理员', '账户管理员', 0, 1, 1, '2016-05-05 11:10:00', 1, '2016-05-05 11:10:00');
INSERT INTO `sys_role` VALUES (4, '充电桩管理', '充电桩管理', 0, 1, 1, '2016-05-05 11:16:45', 1, '2016-05-05 11:16:45');
INSERT INTO `sys_role` VALUES (5, '费用管理员', '费用管理员', 0, 1, 1, '2016-05-05 11:17:05', 9, '2016-07-28 15:27:53');
INSERT INTO `sys_role` VALUES (6, '数据分析员', '数据分析员', 0, 1, 1, '2016-05-05 11:17:24', 1, '2016-05-05 11:17:24');
INSERT INTO `sys_role` VALUES (7, '安装支持', '安装支持', 0, 1, 1, '2016-05-05 11:17:40', 1, '2016-05-05 11:17:40');
INSERT INTO `sys_role` VALUES (8, '充电点管理员', '充电点管理员', 1, 1, 1, '2016-05-05 11:23:02', 1, '2016-05-05 11:23:02');
INSERT INTO `sys_role` VALUES (9, '客户财务', '客户财务', 1, 1, 1, '2016-05-05 11:24:01', 1, '2016-05-05 11:24:01');
INSERT INTO `sys_role` VALUES (10, '系统管理员', '系统管理员', 0, 1, 1, '2016-05-05 11:29:08', 1, '2017-01-19 09:46:25');
INSERT INTO `sys_role` VALUES (11, '客服人员', '客服人员', 0, 1, 1, '2016-05-05 11:40:56', 1, '2016-05-05 11:40:56');
INSERT INTO `sys_role` VALUES (12, '客户专员', '客户专员', 0, 1, 1, '2016-05-05 11:41:18', 1, '2016-05-05 11:41:18');
INSERT INTO `sys_role` VALUES (13, '客户技术支持', '客户技术支持', 0, 1, 1, '2016-05-05 11:41:34', 1, '2016-05-05 11:41:34');
INSERT INTO `sys_role` VALUES (14, '页面管理员', '管理web和桩', 0, 1, 10, '2017-01-19 09:52:23', 10, '2017-01-19 09:53:18');

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource`  (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `resource_id` int(11) NOT NULL COMMENT '资源id'
) ENGINE = InnoDB AUTO_INCREMENT = 327 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
INSERT INTO `sys_role_resource` VALUES (1, 10);
INSERT INTO `sys_role_resource` VALUES (1, 11);
INSERT INTO `sys_role_resource` VALUES (1, 78);
INSERT INTO `sys_role_resource` VALUES (1, 63);
INSERT INTO `sys_role_resource` VALUES (1, 64);
INSERT INTO `sys_role_resource` VALUES (1, 65);
INSERT INTO `sys_role_resource` VALUES (1, 35);
INSERT INTO `sys_role_resource` VALUES (1, 133);
INSERT INTO `sys_role_resource` VALUES (1, 134);
INSERT INTO `sys_role_resource` VALUES (1, 12);
INSERT INTO `sys_role_resource` VALUES (1, 13);
INSERT INTO `sys_role_resource` VALUES (1, 69);
INSERT INTO `sys_role_resource` VALUES (1, 79);
INSERT INTO `sys_role_resource` VALUES (1, 80);
INSERT INTO `sys_role_resource` VALUES (1, 82);
INSERT INTO `sys_role_resource` VALUES (1, 81);
INSERT INTO `sys_role_resource` VALUES (1, 47);
INSERT INTO `sys_role_resource` VALUES (1, 91);
INSERT INTO `sys_role_resource` VALUES (1, 92);
INSERT INTO `sys_role_resource` VALUES (1, 93);
INSERT INTO `sys_role_resource` VALUES (1, 94);
INSERT INTO `sys_role_resource` VALUES (1, 22);
INSERT INTO `sys_role_resource` VALUES (1, 66);
INSERT INTO `sys_role_resource` VALUES (1, 67);
INSERT INTO `sys_role_resource` VALUES (1, 68);
INSERT INTO `sys_role_resource` VALUES (1, 115);
INSERT INTO `sys_role_resource` VALUES (1, 24);
INSERT INTO `sys_role_resource` VALUES (1, 99);
INSERT INTO `sys_role_resource` VALUES (1, 100);
INSERT INTO `sys_role_resource` VALUES (1, 101);
INSERT INTO `sys_role_resource` VALUES (1, 102);
INSERT INTO `sys_role_resource` VALUES (1, 157);
INSERT INTO `sys_role_resource` VALUES (1, 177);
INSERT INTO `sys_role_resource` VALUES (1, 45);
INSERT INTO `sys_role_resource` VALUES (1, 124);
INSERT INTO `sys_role_resource` VALUES (1, 125);
INSERT INTO `sys_role_resource` VALUES (1, 126);
INSERT INTO `sys_role_resource` VALUES (1, 127);
INSERT INTO `sys_role_resource` VALUES (1, 48);
INSERT INTO `sys_role_resource` VALUES (1, 95);
INSERT INTO `sys_role_resource` VALUES (1, 96);
INSERT INTO `sys_role_resource` VALUES (1, 97);
INSERT INTO `sys_role_resource` VALUES (1, 98);
INSERT INTO `sys_role_resource` VALUES (1, 16);
INSERT INTO `sys_role_resource` VALUES (1, 103);
INSERT INTO `sys_role_resource` VALUES (1, 4);
INSERT INTO `sys_role_resource` VALUES (1, 55);
INSERT INTO `sys_role_resource` VALUES (1, 116);
INSERT INTO `sys_role_resource` VALUES (1, 117);
INSERT INTO `sys_role_resource` VALUES (1, 118);
INSERT INTO `sys_role_resource` VALUES (1, 119);
INSERT INTO `sys_role_resource` VALUES (1, 56);
INSERT INTO `sys_role_resource` VALUES (1, 106);
INSERT INTO `sys_role_resource` VALUES (1, 60);
INSERT INTO `sys_role_resource` VALUES (1, 61);
INSERT INTO `sys_role_resource` VALUES (1, 62);
INSERT INTO `sys_role_resource` VALUES (1, 8);
INSERT INTO `sys_role_resource` VALUES (1, 144);
INSERT INTO `sys_role_resource` VALUES (1, 145);
INSERT INTO `sys_role_resource` VALUES (1, 76);
INSERT INTO `sys_role_resource` VALUES (1, 137);
INSERT INTO `sys_role_resource` VALUES (1, 138);
INSERT INTO `sys_role_resource` VALUES (1, 139);
INSERT INTO `sys_role_resource` VALUES (1, 140);
INSERT INTO `sys_role_resource` VALUES (1, 30);
INSERT INTO `sys_role_resource` VALUES (1, 31);
INSERT INTO `sys_role_resource` VALUES (1, 49);
INSERT INTO `sys_role_resource` VALUES (1, 46);
INSERT INTO `sys_role_resource` VALUES (1, 120);
INSERT INTO `sys_role_resource` VALUES (1, 121);
INSERT INTO `sys_role_resource` VALUES (1, 122);
INSERT INTO `sys_role_resource` VALUES (1, 123);
INSERT INTO `sys_role_resource` VALUES (1, 50);
INSERT INTO `sys_role_resource` VALUES (1, 57);
INSERT INTO `sys_role_resource` VALUES (1, 58);
INSERT INTO `sys_role_resource` VALUES (1, 59);
INSERT INTO `sys_role_resource` VALUES (1, 107);
INSERT INTO `sys_role_resource` VALUES (1, 70);
INSERT INTO `sys_role_resource` VALUES (1, 159);
INSERT INTO `sys_role_resource` VALUES (1, 1);
INSERT INTO `sys_role_resource` VALUES (1, 5);
INSERT INTO `sys_role_resource` VALUES (1, 6);
INSERT INTO `sys_role_resource` VALUES (1, 7);
INSERT INTO `sys_role_resource` VALUES (1, 9);
INSERT INTO `sys_role_resource` VALUES (1, 27);
INSERT INTO `sys_role_resource` VALUES (1, 28);
INSERT INTO `sys_role_resource` VALUES (1, 33);
INSERT INTO `sys_role_resource` VALUES (1, 34);
INSERT INTO `sys_role_resource` VALUES (1, 36);
INSERT INTO `sys_role_resource` VALUES (1, 38);
INSERT INTO `sys_role_resource` VALUES (1, 77);
INSERT INTO `sys_role_resource` VALUES (1, 150);
INSERT INTO `sys_role_resource` VALUES (1, 151);
INSERT INTO `sys_role_resource` VALUES (1, 152);
INSERT INTO `sys_role_resource` VALUES (1, 153);
INSERT INTO `sys_role_resource` VALUES (1, 154);
INSERT INTO `sys_role_resource` VALUES (1, 155);
INSERT INTO `sys_role_resource` VALUES (1, 156);
INSERT INTO `sys_role_resource` VALUES (1, 53);
INSERT INTO `sys_role_resource` VALUES (1, 54);
INSERT INTO `sys_role_resource` VALUES (1, 73);
INSERT INTO `sys_role_resource` VALUES (1, 104);
INSERT INTO `sys_role_resource` VALUES (1, 105);
INSERT INTO `sys_role_resource` VALUES (1, 110);
INSERT INTO `sys_role_resource` VALUES (1, 111);
INSERT INTO `sys_role_resource` VALUES (1, 112);
INSERT INTO `sys_role_resource` VALUES (1, 113);
INSERT INTO `sys_role_resource` VALUES (1, 114);
INSERT INTO `sys_role_resource` VALUES (1, 128);
INSERT INTO `sys_role_resource` VALUES (1, 129);
INSERT INTO `sys_role_resource` VALUES (1, 130);
INSERT INTO `sys_role_resource` VALUES (1, 131);
INSERT INTO `sys_role_resource` VALUES (1, 132);
INSERT INTO `sys_role_resource` VALUES (1, 135);
INSERT INTO `sys_role_resource` VALUES (1, 136);
INSERT INTO `sys_role_resource` VALUES (1, 141);
INSERT INTO `sys_role_resource` VALUES (1, 142);
INSERT INTO `sys_role_resource` VALUES (1, 143);
INSERT INTO `sys_role_resource` VALUES (1, 146);
INSERT INTO `sys_role_resource` VALUES (1, 147);
INSERT INTO `sys_role_resource` VALUES (1, 148);
INSERT INTO `sys_role_resource` VALUES (1, 149);
INSERT INTO `sys_role_resource` VALUES (1, 170);
INSERT INTO `sys_role_resource` VALUES (1, 189);
INSERT INTO `sys_role_resource` VALUES (1, 190);
INSERT INTO `sys_role_resource` VALUES (10, 2);
INSERT INTO `sys_role_resource` VALUES (10, 3);
INSERT INTO `sys_role_resource` VALUES (10, 150);
INSERT INTO `sys_role_resource` VALUES (10, 151);
INSERT INTO `sys_role_resource` VALUES (10, 152);
INSERT INTO `sys_role_resource` VALUES (10, 153);
INSERT INTO `sys_role_resource` VALUES (10, 154);
INSERT INTO `sys_role_resource` VALUES (10, 155);
INSERT INTO `sys_role_resource` VALUES (10, 156);
INSERT INTO `sys_role_resource` VALUES (10, 10);
INSERT INTO `sys_role_resource` VALUES (10, 11);
INSERT INTO `sys_role_resource` VALUES (10, 78);
INSERT INTO `sys_role_resource` VALUES (10, 63);
INSERT INTO `sys_role_resource` VALUES (10, 64);
INSERT INTO `sys_role_resource` VALUES (10, 65);
INSERT INTO `sys_role_resource` VALUES (10, 35);
INSERT INTO `sys_role_resource` VALUES (10, 133);
INSERT INTO `sys_role_resource` VALUES (10, 134);
INSERT INTO `sys_role_resource` VALUES (10, 12);
INSERT INTO `sys_role_resource` VALUES (10, 13);
INSERT INTO `sys_role_resource` VALUES (10, 69);
INSERT INTO `sys_role_resource` VALUES (10, 79);
INSERT INTO `sys_role_resource` VALUES (10, 80);
INSERT INTO `sys_role_resource` VALUES (10, 82);
INSERT INTO `sys_role_resource` VALUES (10, 81);
INSERT INTO `sys_role_resource` VALUES (10, 47);
INSERT INTO `sys_role_resource` VALUES (10, 91);
INSERT INTO `sys_role_resource` VALUES (10, 92);
INSERT INTO `sys_role_resource` VALUES (10, 93);
INSERT INTO `sys_role_resource` VALUES (10, 94);
INSERT INTO `sys_role_resource` VALUES (10, 22);
INSERT INTO `sys_role_resource` VALUES (10, 66);
INSERT INTO `sys_role_resource` VALUES (10, 67);
INSERT INTO `sys_role_resource` VALUES (10, 68);
INSERT INTO `sys_role_resource` VALUES (10, 115);
INSERT INTO `sys_role_resource` VALUES (10, 24);
INSERT INTO `sys_role_resource` VALUES (10, 99);
INSERT INTO `sys_role_resource` VALUES (10, 100);
INSERT INTO `sys_role_resource` VALUES (10, 101);
INSERT INTO `sys_role_resource` VALUES (10, 102);
INSERT INTO `sys_role_resource` VALUES (10, 157);
INSERT INTO `sys_role_resource` VALUES (10, 177);
INSERT INTO `sys_role_resource` VALUES (10, 45);
INSERT INTO `sys_role_resource` VALUES (10, 124);
INSERT INTO `sys_role_resource` VALUES (10, 125);
INSERT INTO `sys_role_resource` VALUES (10, 126);
INSERT INTO `sys_role_resource` VALUES (10, 127);
INSERT INTO `sys_role_resource` VALUES (10, 48);
INSERT INTO `sys_role_resource` VALUES (10, 95);
INSERT INTO `sys_role_resource` VALUES (10, 96);
INSERT INTO `sys_role_resource` VALUES (10, 97);
INSERT INTO `sys_role_resource` VALUES (10, 98);
INSERT INTO `sys_role_resource` VALUES (10, 16);
INSERT INTO `sys_role_resource` VALUES (10, 103);
INSERT INTO `sys_role_resource` VALUES (10, 4);
INSERT INTO `sys_role_resource` VALUES (10, 55);
INSERT INTO `sys_role_resource` VALUES (10, 116);
INSERT INTO `sys_role_resource` VALUES (10, 117);
INSERT INTO `sys_role_resource` VALUES (10, 118);
INSERT INTO `sys_role_resource` VALUES (10, 119);
INSERT INTO `sys_role_resource` VALUES (10, 56);
INSERT INTO `sys_role_resource` VALUES (10, 106);
INSERT INTO `sys_role_resource` VALUES (10, 60);
INSERT INTO `sys_role_resource` VALUES (10, 61);
INSERT INTO `sys_role_resource` VALUES (10, 62);
INSERT INTO `sys_role_resource` VALUES (10, 5);
INSERT INTO `sys_role_resource` VALUES (10, 53);
INSERT INTO `sys_role_resource` VALUES (10, 54);
INSERT INTO `sys_role_resource` VALUES (10, 73);
INSERT INTO `sys_role_resource` VALUES (10, 190);
INSERT INTO `sys_role_resource` VALUES (10, 6);
INSERT INTO `sys_role_resource` VALUES (10, 110);
INSERT INTO `sys_role_resource` VALUES (10, 111);
INSERT INTO `sys_role_resource` VALUES (10, 112);
INSERT INTO `sys_role_resource` VALUES (10, 113);
INSERT INTO `sys_role_resource` VALUES (10, 114);
INSERT INTO `sys_role_resource` VALUES (10, 30);
INSERT INTO `sys_role_resource` VALUES (10, 31);
INSERT INTO `sys_role_resource` VALUES (10, 49);
INSERT INTO `sys_role_resource` VALUES (10, 46);
INSERT INTO `sys_role_resource` VALUES (10, 120);
INSERT INTO `sys_role_resource` VALUES (10, 121);
INSERT INTO `sys_role_resource` VALUES (10, 122);
INSERT INTO `sys_role_resource` VALUES (10, 123);
INSERT INTO `sys_role_resource` VALUES (10, 50);
INSERT INTO `sys_role_resource` VALUES (10, 57);
INSERT INTO `sys_role_resource` VALUES (10, 58);
INSERT INTO `sys_role_resource` VALUES (10, 59);
INSERT INTO `sys_role_resource` VALUES (10, 107);
INSERT INTO `sys_role_resource` VALUES (10, 70);
INSERT INTO `sys_role_resource` VALUES (10, 159);
INSERT INTO `sys_role_resource` VALUES (14, 2);
INSERT INTO `sys_role_resource` VALUES (14, 3);
INSERT INTO `sys_role_resource` VALUES (14, 150);
INSERT INTO `sys_role_resource` VALUES (14, 151);
INSERT INTO `sys_role_resource` VALUES (14, 152);
INSERT INTO `sys_role_resource` VALUES (14, 153);
INSERT INTO `sys_role_resource` VALUES (14, 154);
INSERT INTO `sys_role_resource` VALUES (14, 155);
INSERT INTO `sys_role_resource` VALUES (14, 156);
INSERT INTO `sys_role_resource` VALUES (14, 10);
INSERT INTO `sys_role_resource` VALUES (14, 11);
INSERT INTO `sys_role_resource` VALUES (14, 78);
INSERT INTO `sys_role_resource` VALUES (14, 63);
INSERT INTO `sys_role_resource` VALUES (14, 64);
INSERT INTO `sys_role_resource` VALUES (14, 65);
INSERT INTO `sys_role_resource` VALUES (14, 35);
INSERT INTO `sys_role_resource` VALUES (14, 133);
INSERT INTO `sys_role_resource` VALUES (14, 134);
INSERT INTO `sys_role_resource` VALUES (14, 12);
INSERT INTO `sys_role_resource` VALUES (14, 13);
INSERT INTO `sys_role_resource` VALUES (14, 69);
INSERT INTO `sys_role_resource` VALUES (14, 79);
INSERT INTO `sys_role_resource` VALUES (14, 80);
INSERT INTO `sys_role_resource` VALUES (14, 82);
INSERT INTO `sys_role_resource` VALUES (14, 81);
INSERT INTO `sys_role_resource` VALUES (14, 47);
INSERT INTO `sys_role_resource` VALUES (14, 91);
INSERT INTO `sys_role_resource` VALUES (14, 92);
INSERT INTO `sys_role_resource` VALUES (14, 93);
INSERT INTO `sys_role_resource` VALUES (14, 94);
INSERT INTO `sys_role_resource` VALUES (14, 22);
INSERT INTO `sys_role_resource` VALUES (14, 66);
INSERT INTO `sys_role_resource` VALUES (14, 67);
INSERT INTO `sys_role_resource` VALUES (14, 68);
INSERT INTO `sys_role_resource` VALUES (14, 115);
INSERT INTO `sys_role_resource` VALUES (14, 24);
INSERT INTO `sys_role_resource` VALUES (14, 99);
INSERT INTO `sys_role_resource` VALUES (14, 100);
INSERT INTO `sys_role_resource` VALUES (14, 101);
INSERT INTO `sys_role_resource` VALUES (14, 102);
INSERT INTO `sys_role_resource` VALUES (14, 157);
INSERT INTO `sys_role_resource` VALUES (14, 177);
INSERT INTO `sys_role_resource` VALUES (14, 45);
INSERT INTO `sys_role_resource` VALUES (14, 124);
INSERT INTO `sys_role_resource` VALUES (14, 125);
INSERT INTO `sys_role_resource` VALUES (14, 126);
INSERT INTO `sys_role_resource` VALUES (14, 127);
INSERT INTO `sys_role_resource` VALUES (14, 48);
INSERT INTO `sys_role_resource` VALUES (14, 95);
INSERT INTO `sys_role_resource` VALUES (14, 96);
INSERT INTO `sys_role_resource` VALUES (14, 97);
INSERT INTO `sys_role_resource` VALUES (14, 98);
INSERT INTO `sys_role_resource` VALUES (14, 16);
INSERT INTO `sys_role_resource` VALUES (14, 103);
INSERT INTO `sys_role_resource` VALUES (14, 33);
INSERT INTO `sys_role_resource` VALUES (14, 34);
INSERT INTO `sys_role_resource` VALUES (14, 135);
INSERT INTO `sys_role_resource` VALUES (14, 136);
INSERT INTO `sys_role_resource` VALUES (14, 36);
INSERT INTO `sys_role_resource` VALUES (14, 149);
INSERT INTO `sys_role_resource` VALUES (14, 132);
INSERT INTO `sys_role_resource` VALUES (14, 77);
INSERT INTO `sys_role_resource` VALUES (14, 128);
INSERT INTO `sys_role_resource` VALUES (14, 129);
INSERT INTO `sys_role_resource` VALUES (14, 38);
INSERT INTO `sys_role_resource` VALUES (14, 130);
INSERT INTO `sys_role_resource` VALUES (14, 131);
INSERT INTO `sys_role_resource` VALUES (14, 4);
INSERT INTO `sys_role_resource` VALUES (14, 55);
INSERT INTO `sys_role_resource` VALUES (14, 116);
INSERT INTO `sys_role_resource` VALUES (14, 117);
INSERT INTO `sys_role_resource` VALUES (14, 118);
INSERT INTO `sys_role_resource` VALUES (14, 119);
INSERT INTO `sys_role_resource` VALUES (14, 56);
INSERT INTO `sys_role_resource` VALUES (14, 106);
INSERT INTO `sys_role_resource` VALUES (14, 60);
INSERT INTO `sys_role_resource` VALUES (14, 61);
INSERT INTO `sys_role_resource` VALUES (14, 62);
INSERT INTO `sys_role_resource` VALUES (14, 7);
INSERT INTO `sys_role_resource` VALUES (14, 143);
INSERT INTO `sys_role_resource` VALUES (14, 141);
INSERT INTO `sys_role_resource` VALUES (14, 142);
INSERT INTO `sys_role_resource` VALUES (14, 189);
INSERT INTO `sys_role_resource` VALUES (14, 8);
INSERT INTO `sys_role_resource` VALUES (14, 144);
INSERT INTO `sys_role_resource` VALUES (14, 145);
INSERT INTO `sys_role_resource` VALUES (14, 9);
INSERT INTO `sys_role_resource` VALUES (14, 146);
INSERT INTO `sys_role_resource` VALUES (14, 147);
INSERT INTO `sys_role_resource` VALUES (14, 148);
INSERT INTO `sys_role_resource` VALUES (14, 76);
INSERT INTO `sys_role_resource` VALUES (14, 137);
INSERT INTO `sys_role_resource` VALUES (14, 138);
INSERT INTO `sys_role_resource` VALUES (14, 139);
INSERT INTO `sys_role_resource` VALUES (14, 140);
INSERT INTO `sys_role_resource` VALUES (14, 30);
INSERT INTO `sys_role_resource` VALUES (14, 31);
INSERT INTO `sys_role_resource` VALUES (14, 49);
INSERT INTO `sys_role_resource` VALUES (14, 46);
INSERT INTO `sys_role_resource` VALUES (14, 120);
INSERT INTO `sys_role_resource` VALUES (14, 121);
INSERT INTO `sys_role_resource` VALUES (14, 122);
INSERT INTO `sys_role_resource` VALUES (14, 123);
INSERT INTO `sys_role_resource` VALUES (14, 50);
INSERT INTO `sys_role_resource` VALUES (14, 57);
INSERT INTO `sys_role_resource` VALUES (14, 58);
INSERT INTO `sys_role_resource` VALUES (14, 59);
INSERT INTO `sys_role_resource` VALUES (14, 107);
INSERT INTO `sys_role_resource` VALUES (14, 70);
INSERT INTO `sys_role_resource` VALUES (14, 159);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户编号',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名-昵称',
  `nick_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真是姓名',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `sex` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `big_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `status` int(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '账号状态：1、启用，0、删除，2、禁用3 锁定',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '账号过期时间',
  `authority_expire_time` datetime(0) NULL DEFAULT NULL COMMENT '权限过期时间',
  `login_times` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '登录次数',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次登录ip',
  `current_login_time` datetime(0) NULL DEFAULT NULL COMMENT '当前登录时间',
  `current_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前登录ip',
  `pwd_wrong_times` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录时密码错误次数',
  `last_pwd_wrong_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次密码错误日期',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` int(20) NULL DEFAULT NULL COMMENT '修改人',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'administrator', '超级管理员', '超级管理员', 'b33f1460fca5d48f4ccd41c912947ef8', '1', '18616152558', 'xh.zhao@hopeuday.com', 'http://psp-customer.oss-cn-shanghai.aliyuncs.com/avator8d93ea5b-786c-4177-88fb-1ee19bc0a3b4.png', 1, NULL, NULL, 1, '2017-06-28 13:19:05', '116.231.179.147', '2017-06-29 20:27:01', '218.82.227.192', 0, '2017-04-12 17:41:42', NULL, 1, '2016-06-27 10:03:25', 1, NULL);
INSERT INTO `sys_user` VALUES (6, 'YD003', '赵新寰', NULL, '73e916f4ac5cc0f01b890a380d0bcf20', '1', '13917279526', 'xh.zhao@hopeuday.com', 'http://hopeuday-psp.oss-cn-shanghai.aliyuncs.com/avator/default_man.jpg', 1, NULL, NULL, 1, NULL, NULL, '2016-06-28 10:04:18', '180.173.61.120', 1, '2016-06-28 10:04:18', '2016-06-27 10:04:29', 1, '2016-06-27 10:04:29', 1, NULL);
INSERT INTO `sys_user` VALUES (7, 'YD001', '张志刚', NULL, '1e21c92359b4981d9e0d596924830f2e', '1', '18901775488', 'gavin.zhang@hopeuday.com', 'http://hopeuday-psp.oss-cn-shanghai.aliyuncs.com/avator/default_man.jpg', 1, NULL, NULL, 1, '2017-06-19 09:50:15', '116.231.179.147', '2017-06-19 09:52:08', '116.231.179.147', 0, '2017-06-19 09:49:25', '2016-06-27 21:19:39', 1, '2017-06-19 09:49:12', 1, NULL);
INSERT INTO `sys_user` VALUES (8, 'YD002', '陆洋', NULL, 'eb4350bddd0d991de84c63c0001adb7f', '2', '13061772033', 'yang.lu@hopeuday.com', 'http://hopeuday-psp.oss-cn-shanghai.aliyuncs.com/avator/default_women.jpg', 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2016-06-27 21:25:10', 1, '2016-06-27 21:25:10', 1, NULL);
INSERT INTO `sys_user` VALUES (9, 'HD000', '管理员', NULL, '0c0daba2f2a08969b9969df3400c2395', '1', '13817301761', 'xh.zhao@hopeuday.com', 'http://hopeuday-psp.oss-cn-shanghai.aliyuncs.com/avator/default_man.jpg', 1, NULL, NULL, 1, '2016-11-24 16:05:33', '116.231.180.175', '2016-11-24 16:09:47', '116.231.180.175', 0, '2016-07-29 09:12:50', '2016-07-28 15:16:47', 1, '2016-11-24 17:16:43', 1, NULL);
INSERT INTO `sys_user` VALUES (10, 'YD016', '邹杰', NULL, 'ef690ebee5f375b48e5862685f61af03', '1', '15618001527', 'jzou@hopeuday.com', 'http://hopeuday-psp.oss-cn-shanghai.aliyuncs.com/avator/default_man.jpg', 0, NULL, NULL, 1, '2017-03-27 16:32:39', '180.173.142.66', '2017-04-12 09:55:56', '180.173.142.66', 0, '2017-02-07 10:10:39', '2016-11-24 17:18:15', 1, '2017-04-12 17:43:10', 1, NULL);
INSERT INTO `sys_user` VALUES (11, 'YD014', '赵云', NULL, 'f1e11427364ad3f408aed60ae70bf35d', '2', '18298218490', 'y.zhao@hopeuday.com', 'http://hopeuday-psp.oss-cn-shanghai.aliyuncs.com/avator/default_women.jpg', 1, NULL, NULL, 1, '2017-07-19 13:48:09', '180.173.209.14', '2017-07-19 13:48:16', '180.173.209.14', 0, '2017-07-19 13:48:09', '2016-11-24 17:20:38', 1, '2016-11-24 17:23:00', 11, NULL);
INSERT INTO `sys_user` VALUES (12, 'YD015', '周佳隽', NULL, 'c7248a9318f0d2b1419c04ba8d8ad8b0', '1', '15800396536', 'jj.zhou@hopeuday.com', 'http://hopeuday-psp.oss-cn-shanghai.aliyuncs.com/avator/default_man.jpg', 1, NULL, NULL, 1, '2017-07-20 10:16:22', '180.173.179.205', '2017-07-20 10:16:25', '180.173.179.205', 0, '2017-07-20 10:16:22', '2017-01-19 09:49:21', 10, '2017-01-19 09:53:31', 10, NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户编号',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名-昵称',
  `nick_name` varchar(100) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `point_balance` int(20) NULL DEFAULT NULL COMMENT '用户积分',
  `big_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `wchat_open_id` varchar(50) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '微信openId',
  `weibo_open_id` varchar(50) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '微博openId',
  `taobao_open_id` varchar(50) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '淘宝openId',
  `third_user_id` varchar(50) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '第三方用户id',
  `third_enterprise_id` varchar(50) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '第三方企业id',
  `status` int(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '账号状态：1、启用，0、删除，2、禁用3 锁定',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '账号过期时间',
  `authority_expire_time` datetime(0) NULL DEFAULT NULL COMMENT '权限过期时间',
  `login_times` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '登录次数',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次登录ip',
  `current_login_time` datetime(0) NULL DEFAULT NULL COMMENT '当前登录时间',
  `current_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前登录ip',
  `pwd_wrong_times` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录时密码错误次数',
  `last_pwd_wrong_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次密码错误日期',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` int(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_by_ip` varchar(20) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '更新人ip',
  `remark` varchar(500) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '备注',
  `app_id` varchar(20) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `indvi_prepayment` double(20, 2) NULL DEFAULT NULL,
  `group_prepayment` double(20, 2) NULL DEFAULT NULL,
  `user_type` varchar(2) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT '01' COMMENT '01:普通个人用户,02:虚拟卡用户',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '虚拟卡关联客户ID',
  `virtual_card_no` varchar(50) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '虚拟卡卡号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 293 CHARACTER SET = utf32 COLLATE = utf32_general_ci COMMENT = '充电桩用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (68, NULL, '', 'craftsman', 'f12173638ada9a930138b569968e7f7b', '13818033497', NULL, 'avatar/0/user_68.jpg', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, 45, '2017-03-12 23:30:54', '139.196.177.28', '2017-04-11 14:23:02', '139.196.177.28', 0, '2016-10-10 12:23:18', '2016-07-28 11:05:18', NULL, '2016-12-20 10:21:12', 68, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (69, NULL, 'Lgq', '小李', '6c8ac94a04c6c8c267a92dbe65f657db', '15000591669', NULL, 'avatar/0/user_69.jpg', '', NULL, NULL, NULL, NULL, 3, NULL, NULL, 1369, '2017-07-19 13:19:07', '139.196.177.28', '2017-07-20 13:53:06', '139.196.177.28', 0, '2017-07-13 19:38:43', '2016-07-28 11:58:46', NULL, '2016-11-03 10:15:24', 69, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (70, NULL, '闫铁磊', '小闫', 'a112a6edd5cf3125f58b5620d4c3168c', '18221238286', NULL, 'avatar/0/user_70.jpg', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, 985, '2017-05-17 18:25:24', '139.196.177.28', '2017-05-17 18:26:34', '139.196.177.28', 0, '2017-05-05 13:45:10', '2016-07-28 13:06:17', NULL, '2017-03-09 15:23:50', 70, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (71, NULL, NULL, NULL, 'a112a6edd5cf3125f58b5620d4c3168c', '18321996124', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2016-08-04 17:13:39', '139.196.177.28', 0, NULL, '2016-07-28 13:10:30', NULL, '2016-07-28 13:10:30', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (72, NULL, NULL, NULL, 'a112a6edd5cf3125f58b5620d4c3168c', '15836991722', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 7, '2016-08-04 17:27:15', '139.196.177.28', '2016-08-04 17:47:06', '139.196.177.28', 0, NULL, '2016-07-28 13:13:24', NULL, '2016-07-28 13:13:24', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (73, NULL, '赵新寰', '磨刀的熊', '76d653c71dbf1e55c93a4dc51bcff3fb', '13917279526', NULL, 'avatar/0/user_73.jpg', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, 126, '2017-07-19 12:54:19', '139.196.177.28', '2017-07-20 12:01:17', '139.196.177.28', 0, '2016-08-08 13:09:45', '2016-08-02 21:27:32', NULL, '2016-08-02 21:31:26', 73, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (74, NULL, NULL, NULL, '83aec90335f3ca080c5f3aae3040c917', '13916706631', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 69, '2017-04-15 23:17:54', '139.196.177.28', '2017-04-23 10:30:45', '139.196.177.28', 0, NULL, '2016-08-02 23:23:54', NULL, '2016-08-02 23:23:54', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (75, NULL, NULL, NULL, '0f61b499a47fb51eccf807f39f924c3e', '13701105496', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2016-08-03 00:59:03', '139.196.177.28', '2016-08-08 22:46:47', '139.196.177.28', 0, NULL, '2016-08-03 00:58:41', NULL, '2016-08-03 00:58:41', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (76, NULL, NULL, NULL, '1953d765dd789dfaec78d944a9da7de9', '18221380021', NULL, 'avatar/0/user_76.jpg', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 30, '2017-06-19 11:23:05', '139.196.177.28', '2017-06-27 10:10:56', '139.196.177.28', 0, '2017-06-19 11:22:52', '2016-08-03 11:13:44', NULL, '2017-06-19 11:26:40', 76, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (77, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '15238048187', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 17, '2016-08-04 18:55:01', '139.196.177.28', '2016-08-04 18:56:10', '139.196.177.28', 0, NULL, '2016-08-03 11:28:37', NULL, '2016-08-03 11:28:37', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (78, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '13917500917', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2016-08-03 17:59:08', '139.196.177.28', '2016-08-04 14:25:09', '139.196.177.28', 0, NULL, '2016-08-03 17:59:01', NULL, '2016-08-03 17:59:01', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (79, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '15800396536', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 81, '2017-07-17 14:37:46', '139.196.177.28', '2017-07-19 13:39:56', '139.196.177.28', 0, NULL, '2016-08-04 09:15:52', NULL, '2016-08-04 09:15:52', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (80, NULL, NULL, NULL, '416c3c2082cb1dc193a2067ae519de31', '13761614567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2016-08-06 20:20:19', '139.196.177.28', 0, NULL, '2016-08-06 20:20:06', NULL, '2016-08-06 20:20:06', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (81, NULL, NULL, NULL, '77fb2ad06bfa9169cd57da2430a5b97e', '18616397697', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, '2016-08-10 17:58:13', '139.196.177.28', '2016-11-05 15:03:48', '139.196.177.28', 0, NULL, '2016-08-08 13:52:26', NULL, '2016-08-08 13:52:26', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (82, NULL, NULL, NULL, '917de198d9c04e7c99b3f694ffa6d1ca', '15919895963', NULL, 'avatar/0/user_82.jpg', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 11, '2017-04-18 14:38:43', '139.196.177.28', '2017-06-14 18:39:39', '139.196.177.28', 0, NULL, '2016-08-10 17:45:00', NULL, '2017-04-18 14:40:15', 82, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (83, NULL, NULL, NULL, '562417af5cda210e327c35ec2f03f531', '13801816684', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 4, '2016-08-24 16:44:58', '139.196.177.28', '2016-08-24 16:45:05', '139.196.177.28', 0, '2016-08-24 16:44:58', '2016-08-10 18:02:22', NULL, '2016-08-10 18:02:22', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (84, NULL, NULL, NULL, 'e2b7f6f1ae8ced737ccb2200029af257', '18583652562', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2016-08-11 11:41:36', '139.196.177.28', '2016-08-16 14:03:20', '139.196.177.28', 0, NULL, '2016-08-11 11:41:28', NULL, '2016-08-11 11:41:28', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (85, NULL, NULL, NULL, 'db051e2aff6d01307a2d1384ec4f2b2c', '13918688270', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 69, '2017-03-09 17:26:07', '139.196.177.28', '2017-07-03 14:06:22', '139.196.177.28', 0, '2016-09-06 17:10:56', '2016-08-11 13:00:06', NULL, '2016-08-11 13:00:06', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (86, NULL, NULL, NULL, 'e5d1621a51b4fc5999c4f814123cb4ca', '13524769185', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 18, '2016-10-14 11:08:30', '139.196.177.28', '2016-10-18 14:53:48', '139.196.177.28', 0, NULL, '2016-08-11 17:49:57', NULL, '2016-08-11 17:49:57', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (87, NULL, NULL, NULL, '183e1244398863a8d98e5a0d42287d54', '18616838366', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 20, '2017-04-10 15:56:32', '139.196.177.28', '2017-05-15 13:33:34', '139.196.177.28', 0, '2016-08-30 19:42:38', '2016-08-11 19:41:41', NULL, '2016-08-11 19:41:41', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (88, NULL, NULL, NULL, '1dd5aae8116efaf0d8be05397b8f1883', '18611583772', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 7, '2016-08-11 20:10:38', '139.196.177.28', '2016-08-11 20:13:36', '139.196.177.28', 0, NULL, '2016-08-11 19:48:21', NULL, '2016-08-11 19:48:21', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (89, NULL, NULL, NULL, 'e565228da671d74244b6b0356556f6de', '15161532822', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 16, '2016-09-15 19:18:15', '139.196.177.28', '2016-09-15 19:37:34', '139.196.177.28', 0, '2016-08-13 22:11:44', '2016-08-13 22:11:31', NULL, '2016-08-13 22:11:31', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (90, NULL, NULL, NULL, 'e3140edb65d47814abd5c95fa5724f41', '18651833455', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 4, '2016-08-22 13:28:52', '139.196.177.28', '2016-08-22 13:29:01', '139.196.177.28', 0, '2016-08-22 13:28:52', '2016-08-15 16:02:37', NULL, '2016-08-15 16:02:37', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (91, NULL, NULL, NULL, 'f02ef5db9d9c9ecd6984689c394db235', '13816530750', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 36, '2017-03-15 17:03:46', '139.196.177.28', '2017-03-15 17:16:16', '139.196.177.28', 0, NULL, '2016-08-17 15:20:35', NULL, '2016-08-17 15:20:35', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (92, NULL, NULL, NULL, '047fd917ad6125f910cea5acec4d6c9c', '18621510917', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 19, '2016-09-22 13:19:20', '139.196.177.28', '2016-09-27 09:26:23', '139.196.177.28', 0, '2016-08-20 13:58:42', '2016-08-20 13:58:33', NULL, '2016-08-20 13:58:33', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (93, NULL, NULL, NULL, '332565d9a9a28325e9dbf24d279f982c', '15162118659', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 6, '2016-09-14 09:29:47', '139.196.177.28', '2016-09-20 09:57:05', '139.196.177.28', 0, '2016-08-23 10:07:19', '2016-08-23 10:07:02', NULL, '2016-08-23 10:07:02', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (94, NULL, NULL, NULL, 'fd115d1f84d6879463379c437212b10d', '18782960328', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 4, '2016-08-24 16:43:18', '139.196.177.28', '2016-09-28 08:54:05', '139.196.177.28', 0, NULL, '2016-08-23 10:14:20', NULL, '2016-08-23 10:14:20', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (95, NULL, NULL, NULL, 'f34f448d6c32f9c7cc156ac2c91af65d', '13818664806', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 121, '2017-07-17 16:15:33', '139.196.177.28', '2017-07-19 12:56:01', '139.196.177.28', 0, '2016-12-23 16:20:40', '2016-08-24 09:02:17', NULL, '2016-08-24 09:02:17', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (96, NULL, NULL, NULL, '332565d9a9a28325e9dbf24d279f982c', '18796212681', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 15, '2016-09-20 20:54:16', '139.196.177.28', '2016-09-22 13:21:32', '139.196.177.28', 0, NULL, '2016-08-25 16:03:55', NULL, '2016-08-25 16:03:55', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (97, NULL, NULL, NULL, 'aa4a7f4ba0c30c13bbd288b5f0893d5e', '18918852737', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 173, '2017-07-07 08:53:09', '139.196.177.28', '2017-07-10 09:30:21', '139.196.177.28', 0, '2016-09-15 20:06:10', '2016-09-06 11:25:42', NULL, '2016-09-13 12:39:28', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (98, NULL, NULL, NULL, 'd98809ad4843f6a42d0fcf29296ddbbe', '18149781355', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2016-09-06 14:51:03', '139.196.177.28', '2016-10-11 17:30:48', '139.196.177.28', 0, NULL, '2016-09-06 14:50:54', NULL, '2016-09-06 14:50:54', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (99, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '18609482998', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 108, '2017-07-13 09:58:06', '139.196.177.28', '2017-07-17 09:06:30', '139.196.177.28', 0, '2017-05-27 18:30:10', '2016-09-06 21:14:58', NULL, '2016-09-06 21:14:58', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (100, NULL, NULL, NULL, '5f15c39f10600f493033ffbe05569746', '13585688860', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 10, '2016-12-30 17:44:43', '139.196.177.28', '2017-01-05 09:38:21', '139.196.177.28', 0, NULL, '2016-09-07 10:28:35', NULL, '2016-09-07 10:28:35', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (101, NULL, NULL, NULL, 'e565228da671d74244b6b0356556f6de', '18829278400', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2016-09-15 19:38:32', '139.196.177.28', 0, NULL, '2016-09-15 19:38:19', NULL, '2016-09-15 19:38:19', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (102, NULL, NULL, NULL, 'e428c6475a8f1a2ee096dfc5ce46fea6', '18621802015', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 17, '2017-05-13 05:39:11', '139.196.177.28', '2017-07-20 11:34:30', '139.196.177.28', 0, NULL, '2016-09-18 13:49:03', NULL, '2016-09-18 13:49:03', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (103, NULL, NULL, NULL, 'ea283ce995575db28057111d9e5cc377', '15921207020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, '2016-10-09 12:25:35', '139.196.177.28', '2016-11-22 09:26:55', '139.196.177.28', 0, NULL, '2016-09-19 08:58:31', NULL, '2016-09-19 08:58:31', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (104, NULL, NULL, NULL, 'e6c857e5cdb653b03a4bcaf7cdbd02d9', '13501765519', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 21, '2017-04-06 13:52:20', '139.196.177.28', '2017-04-09 10:08:40', '139.196.177.28', 0, NULL, '2016-09-19 14:16:52', NULL, '2016-09-19 14:16:52', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (105, NULL, NULL, NULL, '974d932378ff53ececf232ac12985d95', '18701471159', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2016-09-19 21:18:03', '139.196.177.28', 0, NULL, '2016-09-19 21:17:48', NULL, '2016-09-19 21:17:48', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (106, NULL, NULL, NULL, 'e565228da671d74244b6b0356556f6de', '13585626839', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, '2016-09-22 13:23:26', '139.196.177.28', '2016-09-27 09:27:47', '139.196.177.28', 0, NULL, '2016-09-20 17:39:47', NULL, '2016-09-20 17:39:47', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (107, NULL, NULL, NULL, '6f01747bcfb8891c5da1fba3e7f25ff7', '13958156483', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, '2016-09-23 22:59:48', '139.196.177.28', '2016-10-02 17:50:24', '139.196.177.28', 0, NULL, '2016-09-22 13:23:24', NULL, '2016-09-22 13:23:24', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (108, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '18600018501', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 4, '2016-09-22 22:04:25', '139.196.177.28', '2016-09-23 17:16:42', '139.196.177.28', 0, NULL, '2016-09-22 14:50:16', NULL, '2016-09-22 14:50:16', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (109, NULL, NULL, NULL, '83aec90335f3ca080c5f3aae3040c917', '13916027103', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 35, '2016-12-19 19:11:40', '139.196.177.28', '2016-12-20 09:29:44', '139.196.177.28', 0, NULL, '2016-10-05 11:10:36', NULL, '2016-10-05 11:10:36', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (110, NULL, NULL, NULL, '3406a986af141fffceb0818423b77c4c', '15101076918', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 8, '2016-12-07 16:17:57', '139.196.177.28', '2016-12-21 09:34:52', '139.196.177.28', 0, '2016-12-06 10:58:16', '2016-10-10 13:34:58', NULL, '2016-10-10 13:34:58', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (111, NULL, NULL, NULL, '57bdc896f45a286a07732191ff7bc5ea', '15000866517', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 4, '2016-10-13 18:22:44', '139.196.177.28', '2016-11-25 08:19:53', '139.196.177.28', 0, NULL, '2016-10-12 08:33:54', NULL, '2016-10-12 08:33:54', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (112, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '13622369658', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 15, '2017-02-08 09:18:23', '139.196.177.28', '2017-02-21 13:12:56', '139.196.177.28', 0, NULL, '2016-10-13 12:06:38', NULL, '2016-10-13 12:06:38', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (113, NULL, NULL, NULL, '090c0ddd2e372250e0e354567b10c389', '13552733903', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 6, '2016-11-17 03:18:26', '139.196.177.28', '2016-11-22 15:06:02', '139.196.177.28', 0, '2016-11-16 16:23:11', '2016-10-20 11:26:32', NULL, '2016-10-20 11:26:32', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (114, NULL, NULL, NULL, 'd32b3ca5c3d107cb41f0cf4b6dbf79b8', '18650119575', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 17, '2017-03-13 12:39:05', '139.196.177.28', '2017-03-25 07:46:01', '139.196.177.28', 0, '2017-03-13 12:39:07', '2016-10-21 22:32:32', NULL, '2016-10-21 22:32:32', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (115, NULL, '', '', '03b1f74abc2371dc7813f43465e63fa8', '18298218490', NULL, 'avatar/0/user_115.jpg', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, 86, '2017-07-09 21:42:58', '139.196.177.28', '2017-07-19 13:40:49', '139.196.177.28', 0, '2016-11-21 17:06:43', '2016-10-24 15:47:28', NULL, '2017-04-17 15:52:01', 115, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (116, NULL, NULL, NULL, '8abd04df2ead8c38c0858a985ca789ad', '15650782712', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 4, '2016-10-29 12:50:40', '139.196.177.28', '2016-11-16 16:50:12', '139.196.177.28', 0, NULL, '2016-10-29 12:49:42', NULL, '2016-10-29 12:49:42', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (117, NULL, NULL, NULL, '6f9588b07e8ab7d70d96c6361b8ad836', '13810891567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 6, '2017-02-03 20:54:39', '139.196.177.28', '2017-02-11 08:56:43', '139.196.177.28', 0, NULL, '2016-11-01 09:48:49', NULL, '2016-11-01 09:48:49', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (118, NULL, '', '', '03b1f74abc2371dc7813f43465e63fa8', '13122028843', NULL, 'avatar/0/user_118.jpg', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, 408, '2017-06-17 16:23:02', '139.196.177.28', '2017-07-11 16:38:04', '139.196.177.28', 0, '2016-11-29 16:13:46', '2016-11-07 13:04:17', NULL, '2016-12-08 19:55:56', 118, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (119, NULL, NULL, NULL, '192a9c9258c7c0860a6ecb251338e58b', '15618327613', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2016-11-10 09:58:39', '139.196.243.83', 0, NULL, '2016-11-10 09:58:27', NULL, '2016-11-10 09:58:27', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (120, NULL, NULL, NULL, '091af6b5cc2dbbaf4aee54f50bce90f1', '15618001527', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 13, '2017-03-22 14:21:20', '139.196.177.28', '2017-03-23 09:33:21', '139.196.177.28', 0, '2017-03-07 13:49:28', '2016-11-10 12:35:31', NULL, '2016-11-10 12:35:31', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (121, NULL, NULL, NULL, 'ab96057edb402e432bc8a7bae515568b', '13027435854', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2016-11-14 10:16:58', '139.196.177.28', 0, NULL, '2016-11-14 10:16:48', NULL, '2016-11-14 10:16:48', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (122, NULL, NULL, NULL, '917de198d9c04e7c99b3f694ffa6d1ca', '13122908337', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 158, '2017-07-06 12:41:37', '139.196.177.28', '2017-07-19 13:47:46', '139.196.177.28', 0, '2017-07-06 10:27:05', '2016-11-16 15:37:17', NULL, '2016-11-16 15:37:17', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (123, NULL, NULL, NULL, '891175fad9374274b98b83d2570b7e3b', '13524065600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 19, '2017-05-31 16:54:41', '139.196.177.28', '2017-06-15 10:04:44', '139.196.177.28', 0, NULL, '2016-11-21 12:05:18', NULL, '2016-11-21 12:05:18', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (125, NULL, NULL, NULL, '0041c7ff09b900ea2d66056218f16507', '15901501934', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2016-12-02 11:05:42', '139.196.177.28', '2016-12-09 20:21:13', '139.196.177.28', 0, NULL, '2016-12-02 11:05:26', NULL, '2016-12-02 11:05:26', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (126, NULL, NULL, NULL, '37090b360346a05f6b8371203a4d3b5a', '18917628133', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2016-12-03 17:55:55', '139.196.177.28', 0, NULL, '2016-12-03 17:55:50', NULL, '2016-12-03 17:55:50', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (127, NULL, NULL, NULL, '5e121747a9de6339975b9e5dba1f2aaf', '13910361122', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2016-12-04 19:44:37', '139.196.177.28', '2016-12-14 19:15:49', '139.196.177.28', 0, NULL, '2016-12-04 19:44:26', NULL, '2016-12-04 19:44:26', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (128, NULL, NULL, NULL, '3782a697eba535b1ce177e9a9d900557', '15012551526', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, '2017-02-06 12:29:58', '139.196.177.28', '2017-02-08 16:38:17', '139.196.177.28', 0, '2017-02-06 12:29:49', '2016-12-06 13:20:09', NULL, '2016-12-06 13:20:09', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (129, NULL, NULL, NULL, '805856a4456bc21d7c728d42fa667f10', '18698052894', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2016-12-08 11:44:18', '139.196.177.28', 0, NULL, '2016-12-08 11:44:09', NULL, '2016-12-08 11:44:09', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (130, NULL, NULL, NULL, 'aee685b3e0c401c3018db18ebdf3fd7d', '13962681097', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 23, '2017-06-02 14:33:14', '139.196.177.28', '2017-06-12 09:47:17', '139.196.177.28', 0, NULL, '2016-12-08 14:50:44', NULL, '2016-12-08 14:50:44', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (131, NULL, NULL, NULL, 'abb5f063f9fa5c72c3dc3ceb6983ae42', '13764732688', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 22, '2017-04-17 09:21:06', '139.196.177.28', '2017-04-17 09:21:31', '139.196.177.28', 0, NULL, '2016-12-09 09:04:03', NULL, '2016-12-09 09:04:03', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (132, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '18616988607', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 44, '2017-07-05 17:33:32', '139.196.177.28', '2017-07-12 13:02:43', '139.196.177.28', 0, '2016-12-16 15:06:39', '2016-12-16 15:06:31', NULL, '2016-12-16 15:06:31', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (133, NULL, NULL, NULL, 'a8add59c040312d9eb5529f16fed3cb3', '15120025531', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2016-12-16 20:23:12', '139.196.177.28', '2016-12-20 11:40:51', '139.196.177.28', 0, NULL, '2016-12-16 20:22:56', NULL, '2016-12-16 20:22:56', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (134, NULL, NULL, NULL, '76b31d2a088e60ad7418c5484d683377', '13777495182', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2016-12-19 15:05:52', '139.196.177.28', 0, NULL, '2016-12-19 15:05:39', NULL, '2016-12-19 15:05:39', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (135, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c8a5f490c12a11e6b688525400578902', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2016-12-19 15:38:29', NULL, '2016-12-19 15:38:29', NULL, NULL, NULL, 'vm', NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (136, NULL, NULL, NULL, '23a8f9f584e47b8a14e1c789a742fa65', '15961516716', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 11, '2017-02-09 09:44:04', '139.196.177.28', '2017-02-25 16:05:32', '139.196.177.28', 0, NULL, '2016-12-19 16:18:42', NULL, '2016-12-19 16:18:42', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (137, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hejianguangtest123', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2016-12-21 12:20:37', NULL, '2016-12-21 12:20:37', NULL, NULL, NULL, 'vm', NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (138, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0d964aadbaec11e6b688525400578902', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2016-12-21 15:27:55', NULL, '2016-12-21 15:27:55', NULL, NULL, NULL, 'vm', NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (139, NULL, NULL, NULL, '3489b5ab1bd2d12858fab893eec78ec1', '18991655929', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 17, '2017-04-10 11:31:04', '139.196.177.28', '2017-04-11 12:02:27', '139.196.177.28', 0, '2017-03-28 09:39:08', '2016-12-28 19:24:55', NULL, '2016-12-28 19:24:55', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (140, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '15377793644', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 15, '2017-06-20 07:42:30', '139.196.177.28', '2017-07-19 07:34:09', '139.196.177.28', 0, NULL, '2017-01-05 17:36:15', NULL, '2017-01-05 17:36:15', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (141, NULL, NULL, NULL, 'b243b3d85d52beb7cb2fd496206876dd', '15960698963', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-01-09 16:37:56', '139.196.177.28', 0, NULL, '2017-01-09 16:37:40', NULL, '2017-01-09 16:37:40', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (142, NULL, NULL, NULL, '08a55fe29e3258172f97984d2908f37f', '15999579202', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-01-11 17:04:41', '139.196.177.28', 0, NULL, '2017-01-11 17:04:27', NULL, '2017-01-11 17:04:27', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (143, NULL, NULL, NULL, '76d653c71dbf1e55c93a4dc51bcff3fb', '15060440223', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-01-11 21:02:56', '139.196.177.28', 0, NULL, '2017-01-11 21:02:39', NULL, '2017-01-11 21:02:39', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (144, NULL, NULL, NULL, '8c5e665038d60fc349926fc6735b37ec', '15006002495', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-01-13 08:48:44', '139.196.177.28', '2017-01-13 10:37:27', '139.196.177.28', 0, NULL, '2017-01-13 08:48:09', NULL, '2017-01-13 08:48:09', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (145, NULL, NULL, NULL, 'e1ff5c6360cd1021ad64eb8075f38592', '13573882101', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-01-13 12:20:59', '139.196.177.28', 0, NULL, '2017-01-13 12:20:45', NULL, '2017-01-13 12:20:45', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (146, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '15330052300', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-01-13 13:39:27', '139.196.177.28', '2017-01-13 15:55:47', '139.196.177.28', 0, NULL, '2017-01-13 13:39:15', NULL, '2017-01-13 13:39:15', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (147, NULL, NULL, NULL, 'f560db003d1ddf62f0cee10900c1480a', '13799400188', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 7, '2017-02-16 01:50:06', '139.196.177.28', '2017-02-16 16:42:44', '139.196.177.28', 0, NULL, '2017-01-14 19:35:04', NULL, '2017-01-14 19:35:04', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (148, NULL, NULL, NULL, '75fd6bec3bf85bbf0e5449d2826061b6', '15112389128', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, '2017-01-15 20:15:48', '139.196.177.28', '2017-01-17 09:46:20', '139.196.177.28', 0, NULL, '2017-01-14 19:39:27', NULL, '2017-01-14 19:39:27', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (149, NULL, NULL, NULL, '3c9e3130699a646ce981b767f35c9edd', '13661419010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 20, '2017-06-01 12:24:51', '139.196.177.28', '2017-06-01 12:26:08', '139.196.177.28', 0, NULL, '2017-01-16 13:37:34', NULL, '2017-01-16 13:37:34', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (150, NULL, NULL, NULL, '6fbe1514a3a12b2d5d06c25d6ee70fa7', '13802703510', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 6, '2017-02-17 12:53:24', '139.196.177.28', '2017-02-17 13:48:19', '139.196.177.28', 0, NULL, '2017-01-19 15:17:01', NULL, '2017-01-19 15:17:01', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (151, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '15691645888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 4, '2017-02-14 08:27:18', '139.196.177.28', '2017-02-25 15:55:53', '139.196.177.28', 0, NULL, '2017-01-22 10:43:56', NULL, '2017-01-22 10:43:56', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (152, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '18621916470', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 16, '2017-04-18 15:21:42', '139.196.177.28', '2017-04-18 19:10:48', '139.196.177.28', 0, '2017-02-07 16:32:44', '2017-01-22 10:44:23', NULL, '2017-01-22 10:44:23', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (153, NULL, NULL, NULL, 'f3eba6fec708e4e96b17255fee3f6039', '13308011222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 7, '2017-05-06 22:55:56', '139.196.177.28', '2017-06-21 16:35:03', '139.196.177.28', 0, NULL, '2017-01-22 10:45:21', NULL, '2017-01-22 10:45:21', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (154, NULL, NULL, NULL, 'fa45629eb246e64c20b1efc02e6fccfd', '18815900618', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-01-22 10:46:26', '139.196.177.28', '2017-02-10 15:22:23', '139.196.177.28', 0, NULL, '2017-01-22 10:46:09', NULL, '2017-01-22 10:46:09', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (155, NULL, NULL, NULL, 'b40a3475978c3ab5ea1387aa362928ed', '18680307659', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 16, '2017-04-19 10:53:12', '139.196.177.28', '2017-05-22 21:46:08', '139.196.177.28', 0, '2017-02-06 13:27:40', '2017-01-22 10:46:55', NULL, '2017-01-22 10:46:55', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (156, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '18649600993', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2017-01-22 10:48:06', NULL, '2017-01-22 10:48:06', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (157, NULL, NULL, NULL, 'f825a03ee4012cba3339528d525d0207', '18607166664', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-01-22 16:46:52', '139.196.177.28', 0, NULL, '2017-01-22 16:46:34', NULL, '2017-01-22 16:46:34', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (158, NULL, NULL, NULL, '1a0e27f32bf25b6e1a2d4cc31449eb3f', '13811706255', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 4, '2017-01-24 10:38:25', '139.196.177.28', '2017-01-24 12:09:15', '139.196.177.28', 0, '2017-01-24 10:37:56', '2017-01-24 10:37:41', NULL, '2017-01-24 10:37:41', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (159, NULL, NULL, NULL, '1c05239bb16080dd6fb2da95912d198e', '15959220838', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-01-29 17:28:22', '139.196.177.28', 0, NULL, '2017-01-29 17:27:12', NULL, '2017-01-29 17:27:12', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (160, NULL, NULL, NULL, 'b2203c77490847d555a2c21fe950f403', '15921466240', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 10, '2017-02-08 20:24:42', '139.196.177.28', '2017-07-18 13:22:48', '139.196.177.28', 0, NULL, '2017-02-06 08:42:41', NULL, '2017-02-06 08:42:41', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (161, NULL, NULL, NULL, '5ae1999ab4ce69270079d0eb817ca3ff', '17701617740', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-02-06 13:54:09', '139.196.177.28', 0, NULL, '2017-02-06 13:53:59', NULL, '2017-02-06 13:53:59', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (162, NULL, NULL, NULL, 'd288084b8efecb048be7e4eff9186554', '18124030347', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 12, '2017-02-09 17:17:58', '139.196.177.28', '2017-02-09 17:29:15', '139.196.177.28', 0, '2017-02-09 17:15:55', '2017-02-06 15:30:04', NULL, '2017-02-06 15:30:04', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (163, NULL, NULL, NULL, '6b460796856c7674b72337d43cfa432a', '18650049970', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-02-07 08:28:58', '139.196.177.28', '2017-02-10 13:48:11', '139.196.177.28', 0, NULL, '2017-02-07 08:28:49', NULL, '2017-02-07 08:28:49', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (164, NULL, NULL, NULL, '5705c788ac41ebc5ca93357319472222', '15914157161', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-02-07 08:32:31', '139.196.177.28', '2017-02-07 09:16:00', '139.196.177.28', 0, NULL, '2017-02-07 08:28:56', NULL, '2017-02-07 08:28:56', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (165, NULL, NULL, NULL, 'f61ffd4f844e241d5a52bf05781a5b92', '13418715171', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 8, '2017-04-17 13:33:56', '139.196.177.28', '2017-04-17 13:38:30', '139.196.177.28', 0, NULL, '2017-02-07 08:32:34', NULL, '2017-02-07 08:32:34', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (166, NULL, NULL, NULL, 'ed25b72da81b2aa39baf8a8f4bda0b23', '13554759347', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-02-07 08:36:00', '139.196.177.28', '2017-02-25 16:18:09', '139.196.177.28', 0, NULL, '2017-02-07 08:35:49', NULL, '2017-02-07 08:35:49', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (167, NULL, NULL, NULL, '0258e9dc95e15220ae3c84a90c031667', '13602503747', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 9, '2017-02-08 14:52:35', '139.196.177.28', '2017-02-09 17:28:28', '139.196.177.28', 0, NULL, '2017-02-07 08:41:02', NULL, '2017-02-07 08:41:02', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (168, NULL, '木木', '1314', 'fe289612ec018f23ab011c82bff3a5cf', '13680850153', NULL, NULL, '', NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-02-07 08:41:24', '139.196.177.28', '2017-02-08 09:09:58', '139.196.177.28', 0, NULL, '2017-02-07 08:41:06', NULL, '2017-02-07 08:49:34', 168, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (169, NULL, NULL, NULL, '6da92419fdc3894331e18587fcccb9ff', '18682016070', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 6, '2017-02-09 17:00:39', '139.196.177.28', '2017-03-07 19:17:27', '139.196.177.28', 0, NULL, '2017-02-07 08:59:45', NULL, '2017-02-07 08:59:45', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (170, NULL, NULL, NULL, 'e1394f815093437c0e9367ce2e32c903', '17727547067', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 7, '2017-03-14 11:19:41', '139.196.177.28', '2017-03-23 14:54:58', '139.196.177.28', 0, NULL, '2017-02-07 09:11:59', NULL, '2017-02-07 09:11:59', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (171, NULL, NULL, NULL, '3258d755a4990c1a4f79a21bc9e21200', '18850331160', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 13, '2017-03-07 19:13:09', '139.196.177.28', '2017-03-14 15:37:23', '139.196.177.28', 0, '2017-02-16 17:43:47', '2017-02-07 17:22:41', NULL, '2017-02-07 17:22:41', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (172, NULL, '陈丹', 'dan妮子93', 'db28e05a0d69531cdd1296e784b3a224', '13381830632', NULL, 'avatar/0/user_172.jpg', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, '2017-02-13 12:26:30', '139.196.177.28', '2017-02-14 20:24:08', '139.196.177.28', 0, NULL, '2017-02-07 23:27:38', NULL, '2017-02-07 23:29:26', 172, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (173, NULL, NULL, NULL, '3757dd66027c94bf7d860611512bd2f5', '18602108582', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 34, '2017-07-06 10:47:01', '139.196.177.28', '2017-07-19 13:23:41', '139.196.177.28', 0, '2017-04-28 22:50:47', '2017-02-08 22:10:23', NULL, '2017-02-08 22:10:23', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (174, NULL, NULL, NULL, '8e4dbe3a51fed24d32822eead3b8f6e1', '17620332133', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-02-09 16:49:38', '139.196.177.28', 0, NULL, '2017-02-09 16:49:06', NULL, '2017-02-09 16:49:06', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (175, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '15817425336', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-02-09 17:47:24', '139.196.177.28', '2017-02-14 15:05:30', '139.196.177.28', 0, NULL, '2017-02-09 17:47:09', NULL, '2017-02-09 17:47:09', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (176, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '18511076078', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-02-10 08:58:37', '139.196.177.28', '2017-06-01 11:49:25', '139.196.177.28', 0, NULL, '2017-02-10 08:58:20', NULL, '2017-02-10 08:58:20', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (177, NULL, NULL, NULL, '1c93321a50e8d122e296054581f66bf6', '13916751192', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 137, '2017-07-19 15:23:45', '139.196.177.28', '2017-07-20 07:38:56', '139.196.177.28', 0, '2017-04-05 08:08:33', '2017-02-13 10:55:35', NULL, '2017-02-13 10:55:35', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (178, NULL, '', '', '5f2858dc883cb2fb837d93fe31c055a2', '13917616613', NULL, NULL, '', NULL, NULL, NULL, NULL, 1, NULL, NULL, 18, '2017-05-11 15:07:15', '139.196.177.28', '2017-07-04 10:11:14', '139.196.177.28', 0, NULL, '2017-02-15 10:40:42', NULL, '2017-05-11 15:08:07', 178, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (179, NULL, NULL, NULL, '69e81af58064031b107fb010a60f81c7', '13601868219', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 55, '2017-04-22 16:38:48', '139.196.177.28', '2017-04-22 16:46:09', '139.196.177.28', 0, '2017-04-19 20:19:07', '2017-02-17 10:27:09', NULL, '2017-02-17 10:27:09', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (180, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '15026651233', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, '2017-02-20 15:33:55', '139.196.177.28', '2017-02-20 15:37:39', '139.196.177.28', 0, NULL, '2017-02-20 14:12:12', NULL, '2017-02-20 14:12:12', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (181, NULL, NULL, NULL, 'b633b92cbb23c12a3d5f1526f15ae3c6', '15874476775', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-02-21 10:45:23', '139.196.177.28', 0, NULL, '2017-02-21 10:45:04', NULL, '2017-02-21 10:45:04', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (182, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eba7833df66c11e6b2066c0b84d5406f', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2017-02-23 15:49:06', NULL, '2017-02-23 15:49:06', NULL, NULL, NULL, 'vm', NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (183, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1af5dbf2badd11e6b688525400578902', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2017-02-23 15:58:08', NULL, '2017-02-23 15:58:08', NULL, NULL, NULL, 'vm', NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (184, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '18bb939cdc7811e6b2066c0b84d5406f', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2017-02-23 15:58:40', NULL, '2017-02-23 15:58:40', NULL, NULL, NULL, 'vm', NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (185, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'd50ee544ecf711e6adc26c0b84d5406f', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2017-02-24 10:00:30', NULL, '2017-02-24 10:00:30', NULL, NULL, NULL, 'vm', NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (186, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '063d0dc1f96e11e6adc26c0b84d5406f', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2017-02-24 10:02:50', NULL, '2017-02-24 10:02:50', NULL, NULL, NULL, 'vm', NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (187, NULL, NULL, NULL, '2d3ee0cce824eade0d78cdd42d2be101', '13611686301', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, '2017-03-19 06:41:21', '139.196.177.28', '2017-05-02 07:54:13', '139.196.177.28', 0, NULL, '2017-02-24 12:18:32', NULL, '2017-02-24 12:18:32', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (188, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '112312bcf25d11e6adc26c0b84d5406f', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2017-02-24 17:05:10', NULL, '2017-02-24 17:05:10', NULL, NULL, NULL, 'vm', NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (189, NULL, NULL, NULL, '868a5a02b6a083a15777211e4b5ba102', '18516532226', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 33, '2017-05-08 14:57:19', '139.196.177.28', '2017-05-12 14:21:16', '139.196.177.28', 0, '2017-03-10 09:46:05', '2017-03-01 14:58:38', NULL, '2017-03-01 14:58:38', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (190, NULL, NULL, NULL, '06fb91e90edc8ba9a801def3744c5135', '18811459928', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-03-02 08:44:49', '139.196.177.28', 0, NULL, '2017-03-02 08:44:32', NULL, '2017-03-02 08:44:32', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (191, NULL, NULL, NULL, '10d533d95513299ec6046f4015b15862', '18201750732', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-03-02 12:27:29', '139.196.177.28', '2017-04-17 14:14:10', '139.196.177.28', 0, NULL, '2017-03-02 12:26:35', NULL, '2017-03-02 12:26:35', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (192, NULL, NULL, NULL, '543a8ae77ef3eec50118abb15302858c', '13764932093', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 16, '2017-05-06 16:56:59', '139.196.177.28', '2017-05-11 15:49:05', '139.196.177.28', 0, NULL, '2017-03-03 08:57:05', NULL, '2017-03-03 08:57:05', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (193, NULL, NULL, NULL, '5e983cce358fe547e1bd3560abf93a89', '18825125053', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-03-03 13:50:59', '139.196.177.28', '2017-03-03 13:53:39', '139.196.177.28', 0, NULL, '2017-03-03 13:50:39', NULL, '2017-03-03 13:50:39', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (194, NULL, '', 'Sssss', '49ddc450eba2ba2e41fc186a4bdab2f5', '17602101101', NULL, 'avatar/0/user_194.jpg', '', NULL, NULL, NULL, NULL, 3, NULL, NULL, 1259, '2017-07-19 13:19:54', '139.196.177.28', '2017-07-19 14:04:16', '139.196.177.28', 0, '2017-07-19 13:19:54', '2017-03-03 16:22:37', NULL, '2017-06-13 15:09:08', 194, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (195, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '18037887353', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, '2017-03-23 17:03:14', '139.196.177.28', '2017-06-28 10:34:54', '139.196.177.28', 0, NULL, '2017-03-06 18:04:02', NULL, '2017-03-06 18:04:02', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (196, NULL, NULL, NULL, 'a275d2cef8d23bad079ad451478c8c13', '18272867807', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 13, '2017-05-08 21:27:10', '139.196.177.28', '2017-05-12 17:22:13', '139.196.177.28', 0, NULL, '2017-03-07 15:34:38', NULL, '2017-03-07 15:34:38', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (197, NULL, NULL, NULL, '8e4dbe3a51fed24d32822eead3b8f6e1', '15972928009', NULL, 'avatar/0/user_197.jpg', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 7, '2017-03-08 21:00:24', '139.196.177.28', '2017-03-09 10:00:21', '139.196.177.28', 0, NULL, '2017-03-07 20:50:53', NULL, '2017-03-07 20:54:30', 197, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (198, NULL, NULL, NULL, '8dde06ce2b605c9ca4ec3d5e94be2fdf', '13061772033', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 17, '2017-07-15 17:11:53', '139.196.177.28', '2017-07-17 11:53:21', '139.196.177.28', 0, NULL, '2017-03-08 11:26:25', NULL, '2017-03-08 11:26:25', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (199, NULL, NULL, NULL, '176991b105089558c7115b4550c080e8', '13391326101', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 141, '2017-06-10 18:10:38', '139.196.177.28', '2017-06-23 09:07:09', '139.196.177.28', 0, NULL, '2017-03-09 11:01:12', NULL, '2017-03-09 11:01:12', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (200, NULL, '', '', 'a770c302215a7118bbc8d50eaafc7c3e', '17602130310', NULL, NULL, '', NULL, NULL, NULL, NULL, 1, NULL, NULL, 138, '2017-07-19 15:51:02', '139.196.177.28', '2017-07-20 13:43:22', '139.196.177.28', 0, NULL, '2017-03-09 21:21:01', NULL, '2017-03-29 14:38:23', 200, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (201, NULL, NULL, NULL, 'c7bd7ee464ba19a3ffb2b06e8e32dac4', '13811341637', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-03-20 12:37:02', '139.196.177.28', '2017-03-26 00:17:55', '139.196.177.28', 0, NULL, '2017-03-20 12:36:40', NULL, '2017-03-20 12:36:40', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (202, NULL, NULL, NULL, '93e7a3d64223df1d08abae30f1e59c14', '15190652019', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-03-22 09:52:37', '139.196.177.28', 0, NULL, '2017-03-22 09:50:46', NULL, '2017-03-22 09:50:46', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (203, NULL, '小廖', '发仔', 'a829ad37a3374feef296cad39d59be73', '15170212194', NULL, 'avatar/0/user_203.jpg', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, 124, '2017-07-07 16:12:28', '139.196.177.28', '2017-07-07 16:12:35', '139.196.177.28', 0, '2017-07-07 16:12:28', '2017-03-22 14:06:25', NULL, '2017-05-12 09:16:25', 203, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (204, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '13058155611', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 4, '2017-03-23 10:46:54', '139.196.177.28', '2017-05-28 13:41:38', '139.196.177.28', 0, NULL, '2017-03-22 18:17:48', NULL, '2017-03-22 18:17:48', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (205, NULL, 'djekc', 'acsaes', '5b1f22a2e7c9b964c983a8654eab3fb4', '18502114708', NULL, NULL, '', NULL, NULL, NULL, NULL, 1, NULL, NULL, 24, '2017-06-27 15:16:44', '139.196.177.28', '2017-07-05 13:50:10', '139.196.177.28', 0, NULL, '2017-03-23 20:27:39', NULL, '2017-06-19 09:16:44', 205, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (206, NULL, NULL, NULL, 'ca01b04800520703b6b06dc5c2d2cbf4', '13764124802', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 13, '2017-05-02 09:01:57', '139.196.177.28', '2017-05-11 13:56:01', '139.196.177.28', 0, NULL, '2017-03-24 00:55:11', NULL, '2017-03-24 00:55:11', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (207, NULL, NULL, NULL, 'aa4a7f4ba0c30c13bbd288b5f0893d5e', '13501601056', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 58, '2017-07-19 09:49:06', '139.196.177.28', '2017-07-20 10:47:16', '139.196.177.28', 0, NULL, '2017-03-24 14:10:36', NULL, '2017-03-24 14:10:36', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (208, NULL, NULL, NULL, '5411f6afafc0b576f77ea8703c433188', '13061619910', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 72, '2017-07-17 09:33:05', '139.196.177.28', '2017-07-17 09:59:40', '139.196.177.28', 0, NULL, '2017-03-29 07:19:27', NULL, '2017-03-29 07:19:27', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (209, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '13063756155', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 55, '2017-05-16 11:13:49', '139.196.177.28', '2017-05-19 18:55:17', '139.196.177.28', 0, NULL, '2017-03-30 13:06:52', NULL, '2017-03-30 13:06:52', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (210, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '13699799697', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-03-31 12:34:52', '139.196.177.28', 0, NULL, '2017-03-31 12:34:41', NULL, '2017-03-31 12:34:41', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (211, NULL, NULL, NULL, '0d7766687fdf40d17b15cc277ed48f84', '13788916193', NULL, 'avatar/0/user_211.jpg', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 150, '2017-06-28 13:41:29', '139.196.177.28', '2017-06-29 15:56:23', '139.196.177.28', 0, '2017-06-28 11:20:07', '2017-04-01 09:31:51', NULL, '2017-05-03 14:15:00', 211, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (212, NULL, NULL, NULL, '787b2c0c4f26263b1cb968bc39cf5357', '13606633444', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 6, '2017-04-05 18:38:27', '139.196.177.28', '2017-07-02 06:52:47', '139.196.177.28', 0, NULL, '2017-04-03 02:54:10', NULL, '2017-04-03 02:54:10', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (213, NULL, '', '', '7338770993fa8a9a3634cfb8fccfedbc', '13801923487', NULL, NULL, '', NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, '2017-04-21 17:17:55', '139.196.177.28', '2017-06-15 15:26:02', '139.196.177.28', 0, NULL, '2017-04-05 14:41:25', NULL, '2017-04-06 11:24:39', 213, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (214, NULL, NULL, NULL, 'bc865d047e6ca7b70788a8f49985b464', '13917320420', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 21, '2017-05-16 09:25:50', '139.196.177.28', '2017-07-18 07:50:52', '139.196.177.28', 0, NULL, '2017-04-05 15:44:55', NULL, '2017-04-05 15:44:55', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (215, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fb94714fecf011e6adc26c0b84d5406f', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2017-04-06 12:50:47', NULL, '2017-04-06 12:50:47', NULL, NULL, NULL, 'vm', NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (216, NULL, NULL, NULL, 'd521f39f2d052b96edb23d26fdd277c0', '18573109935', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-04-06 16:24:56', '139.196.177.28', 0, NULL, '2017-04-06 16:24:46', NULL, '2017-04-06 16:24:46', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (217, NULL, NULL, NULL, 'e2f56ec76d48c37a329fb7f650b24346', '18618328678', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-04-06 17:00:56', '139.196.177.28', 0, NULL, '2017-04-06 17:00:41', NULL, '2017-04-06 17:00:41', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (218, NULL, NULL, NULL, '80f5d786e414ae6d96b85dd4082415bb', '15910608106', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, '2017-04-14 10:08:58', '139.196.177.28', '2017-04-18 00:17:59', '139.196.177.28', 0, NULL, '2017-04-08 20:07:59', NULL, '2017-04-08 20:07:59', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (219, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3849e25ef4c011e6adc26c0b84d5406f', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2017-04-13 09:20:46', NULL, '2017-04-13 09:20:46', NULL, NULL, NULL, 'vm', NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (220, NULL, NULL, NULL, 'b468cc3562e1250272bbf20578e75f2c', '17717927069', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 52, '2017-07-19 15:27:07', '139.196.177.28', '2017-07-19 17:31:59', '139.196.177.28', 0, '2017-06-26 08:23:04', '2017-04-21 18:59:23', NULL, '2017-04-21 18:59:23', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (221, NULL, NULL, NULL, '917de198d9c04e7c99b3f694ffa6d1ca', '13601950693', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 24, '2017-07-06 11:06:11', '139.196.177.28', '2017-07-06 11:10:16', '139.196.177.28', 0, '2017-05-15 15:49:58', '2017-04-22 11:37:40', NULL, '2017-04-22 11:37:40', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (222, NULL, NULL, NULL, 'bc865d047e6ca7b70788a8f49985b464', '17601299326', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 18, '2017-07-10 13:09:05', '139.196.177.28', '2017-07-17 09:52:57', '139.196.177.28', 0, NULL, '2017-04-22 13:05:36', NULL, '2017-04-22 13:05:36', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (223, NULL, NULL, NULL, '080fd482839359809dca8e0d18299cf3', '15946221314', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-04-22 14:38:53', '139.196.177.28', '2017-04-22 15:46:09', '139.196.177.28', 0, NULL, '2017-04-22 14:38:44', NULL, '2017-04-22 14:38:44', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (224, NULL, NULL, NULL, '69e81af58064031b107fb010a60f81c7', '17621110096', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 25, '2017-07-19 05:14:04', '139.196.177.28', '2017-07-20 11:16:53', '139.196.177.28', 0, NULL, '2017-04-22 17:11:55', NULL, '2017-04-22 17:11:55', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1e627cd30a1611e7adc26c0b84d5406f', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2017-04-23 10:40:20', NULL, '2017-04-23 10:40:20', NULL, NULL, NULL, 'vm', NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (226, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '51b08767288c11e7adc26c0b84d5406f', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2017-04-24 09:24:23', NULL, '2017-04-24 09:24:23', NULL, NULL, NULL, 'vm', NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (227, NULL, NULL, NULL, 'af268a6e7fb227b605bf7bbb2bbe5186', '13910494296', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, '2017-04-27 11:41:18', '139.196.177.28', '2017-04-29 20:57:35', '139.196.177.28', 0, NULL, '2017-04-24 12:50:15', NULL, '2017-04-24 12:50:15', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (228, NULL, NULL, NULL, '2bb040ac7f965b989e0da739bd70e6e6', '17621202109', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 14, '2017-05-14 21:01:28', '139.196.177.28', '2017-06-12 13:42:29', '139.196.177.28', 0, '2017-05-09 10:59:17', '2017-04-24 13:54:06', NULL, '2017-04-24 13:54:06', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (229, NULL, NULL, NULL, '629289d427653f27525d8728df0c0a38', '15707330799', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-04-24 13:59:59', '139.196.177.28', 0, NULL, '2017-04-24 13:59:39', NULL, '2017-04-24 13:59:39', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (230, NULL, NULL, NULL, '5bbeb1b817d16f1db60d05304dfe33a5', '13564605643', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 6, '2017-05-02 17:15:45', '139.196.177.28', '2017-05-14 08:36:48', '139.196.177.28', 0, NULL, '2017-04-24 19:28:11', NULL, '2017-04-24 19:28:11', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (231, NULL, NULL, NULL, '72a3921f87413a7506ac9a0c49276627', '18669881367', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-04-24 19:37:38', '139.196.177.28', 0, NULL, '2017-04-24 19:37:19', NULL, '2017-04-24 19:37:19', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (232, NULL, NULL, NULL, '9a163584ed12f715d65a035e8b942e36', '18501608874', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 21, '2017-05-02 15:33:32', '139.196.177.28', '2017-05-02 15:38:00', '139.196.177.28', 0, NULL, '2017-04-25 12:04:51', NULL, '2017-04-25 12:04:51', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (233, NULL, NULL, NULL, 'd9029242485e39ba980e2bdee0672ead', '18516202977', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-04-25 14:48:58', '139.196.177.28', 0, NULL, '2017-04-25 14:48:48', NULL, '2017-04-25 14:48:48', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (234, NULL, NULL, NULL, '785016526036b42a5f2369813c607c88', '13488894712', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 7, '2017-06-27 11:49:41', '139.196.177.28', '2017-07-09 09:50:47', '139.196.177.28', 0, NULL, '2017-04-26 09:37:11', NULL, '2017-04-26 09:37:11', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (235, NULL, NULL, NULL, 'afe96492f0c834244b401846f7b5b11b', '13241904056', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 6, '2017-04-28 15:37:43', '139.196.177.28', '2017-04-28 15:38:39', '139.196.177.28', 0, '2017-04-28 15:37:10', '2017-04-28 15:36:57', NULL, '2017-04-28 15:36:57', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (236, NULL, NULL, NULL, 'b9be5888a700d7ee047c3d08f45889ef', '18911170883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-04-28 15:48:29', '139.196.177.28', '2017-05-12 22:12:14', '139.196.177.28', 0, NULL, '2017-04-28 15:48:22', NULL, '2017-04-28 15:48:22', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (237, NULL, '胡', '胡', '03b1f74abc2371dc7813f43465e63fa8', '18917599867', NULL, 'avatar/0/user_237.jpg', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, 31, '2017-05-11 16:15:51', '139.196.177.28', '2017-05-12 09:52:28', '139.196.177.28', 0, '2017-05-11 16:13:28', '2017-04-29 00:29:43', NULL, '2017-05-09 10:21:34', 237, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (238, NULL, NULL, NULL, 'd11a6751b255ec1c9c78ce81f0fc8f27', '17602140702', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-04-29 10:45:52', '139.196.177.28', '2017-04-29 13:34:58', '139.196.177.28', 0, NULL, '2017-04-29 10:45:36', NULL, '2017-04-29 10:45:36', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (239, NULL, NULL, NULL, 'fcf312423b33bcea9afd26d89e26c026', '18623003909', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-04-29 20:09:47', '139.196.177.28', '2017-05-14 09:10:17', '139.196.177.28', 0, NULL, '2017-04-29 20:09:33', NULL, '2017-04-29 20:09:33', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (240, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '245026232a2911e7adc26c0b84d5406f', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2017-05-02 13:54:24', NULL, '2017-05-02 13:54:24', NULL, NULL, NULL, 'vm', NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (241, NULL, NULL, NULL, '917de198d9c04e7c99b3f694ffa6d1ca', '18964386540', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 11, '2017-06-04 06:06:33', '139.196.177.28', '2017-07-06 10:16:35', '139.196.177.28', 0, '2017-05-02 15:45:07', '2017-05-02 15:44:21', NULL, '2017-05-02 15:44:21', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (242, NULL, NULL, NULL, '917de198d9c04e7c99b3f694ffa6d1ca', '18964682540', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 9, '2017-05-24 07:46:39', '139.196.177.28', '2017-06-13 11:52:38', '139.196.177.28', 0, NULL, '2017-05-02 15:50:19', NULL, '2017-05-02 15:50:19', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (243, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '13559252793', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, '2017-05-14 17:33:50', '139.196.177.28', '2017-06-01 10:55:24', '139.196.177.28', 0, NULL, '2017-05-02 16:04:40', NULL, '2017-05-02 16:04:40', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (244, NULL, NULL, NULL, 'b31c22113e36434981f5286a01d04bf6', '13817718247', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 20, '2017-05-12 14:14:45', '139.196.177.28', '2017-05-12 14:45:03', '139.196.177.28', 0, NULL, '2017-05-02 18:31:21', NULL, '2017-05-02 18:31:21', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (245, NULL, NULL, NULL, '85b907c2c5efd562256c865bb27f3710', '18918529589', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 11, '2017-05-13 20:49:49', '139.196.177.28', '2017-05-26 15:14:27', '139.196.177.28', 0, NULL, '2017-05-03 17:21:35', NULL, '2017-05-03 17:21:35', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (246, NULL, NULL, NULL, 'd968177dc6b26270791b9015245b4ef2', '15618687288', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 10, '2017-07-19 18:35:49', '139.196.177.28', '2017-07-20 07:57:37', '139.196.177.28', 0, NULL, '2017-05-04 13:03:42', NULL, '2017-05-04 13:03:42', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (247, NULL, NULL, NULL, '6a79e95d866bb6eda475ac8cf837d8f4', '18621067293', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, '2017-05-25 20:06:56', '139.196.177.28', '2017-05-27 09:47:12', '139.196.177.28', 0, NULL, '2017-05-05 09:13:01', NULL, '2017-05-05 09:13:01', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (248, NULL, NULL, NULL, 'e1f927450dc3fb5e1c730096f776b979', '15900812819', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-05-05 09:45:11', '139.196.177.28', '2017-05-06 10:06:51', '139.196.177.28', 0, NULL, '2017-05-05 09:44:54', NULL, '2017-05-05 09:44:54', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (249, NULL, NULL, NULL, 'c49ea4fe6ed894547b6691db2b23dbff', '13003179962', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, '2017-06-16 15:00:00', '139.196.177.28', '2017-06-29 10:07:33', '139.196.177.28', 0, NULL, '2017-05-05 12:24:38', NULL, '2017-05-05 12:24:38', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (250, NULL, NULL, NULL, '0983b84e36a2889e94a92dbc2f5a4a11', '13391016041', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 7, '2017-07-06 15:14:28', '139.196.177.28', '2017-07-20 07:21:03', '139.196.177.28', 0, NULL, '2017-05-05 13:14:42', NULL, '2017-05-05 13:14:42', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (251, NULL, NULL, NULL, 'a112a6edd5cf3125f58b5620d4c3168c', '17602102102', NULL, 'avatar/0/user_251.jpg', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 127, '2017-07-03 12:59:42', '139.196.177.28', '2017-07-19 13:56:33', '139.196.177.28', 0, '2017-05-12 16:59:43', '2017-05-05 14:03:44', NULL, '2017-05-11 13:55:20', 251, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (252, NULL, NULL, NULL, '9218c5454376a2843a49e7f01dbc875f', '15010125869', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-05-06 23:39:56', '139.196.177.28', '2017-05-27 20:57:37', '139.196.177.28', 0, NULL, '2017-05-06 23:39:40', NULL, '2017-05-06 23:39:40', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (253, NULL, NULL, NULL, '466a08bfb5785465779d8336afedda6d', '13871055560', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, '2017-05-13 08:15:42', '139.196.177.28', '2017-06-30 16:08:05', '139.196.177.28', 0, NULL, '2017-05-07 08:38:21', NULL, '2017-05-07 08:38:21', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (254, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3fb0c38bf97611e6adc26c0b84d5406f', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2017-05-08 13:57:05', NULL, '2017-05-08 13:57:05', NULL, NULL, NULL, 'vm', NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (255, NULL, NULL, NULL, '736f00b9e3c5cab45df600fd74fc53e6', '15800485290', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 6, '2017-05-08 21:53:03', '139.196.177.28', '2017-05-09 08:08:28', '139.196.177.28', 0, '2017-05-08 21:52:27', '2017-05-08 21:52:10', NULL, '2017-05-08 21:52:10', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (256, NULL, NULL, NULL, '542deaf7277baae87280a9ed01b235f5', '15601961015', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, '2017-05-11 17:04:15', '139.196.177.28', '2017-05-17 20:53:59', '139.196.177.28', 0, NULL, '2017-05-11 17:03:49', NULL, '2017-05-11 17:03:49', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (257, NULL, NULL, NULL, '54be316ef1132ddafeb3161ea926bad8', '13426200086', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-05-16 23:27:21', '139.196.177.28', '2017-05-17 07:08:42', '139.196.177.28', 0, NULL, '2017-05-16 23:26:44', NULL, '2017-05-16 23:26:44', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (258, NULL, NULL, NULL, '03b1f74abc2371dc7813f43465e63fa8', '13810437885', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-05-24 16:31:01', '139.196.177.28', 0, NULL, '2017-05-24 16:30:48', NULL, '2017-05-24 16:30:48', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (259, NULL, NULL, NULL, '6d4e4ae799616edd1e409afc0c5dcc49', '18911625188', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-05-25 13:48:40', '139.196.177.28', 0, NULL, '2017-05-25 13:48:22', NULL, '2017-05-25 13:48:22', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (260, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23a790e6314411e7adc26c0b84d5406f', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2017-05-25 16:13:35', NULL, '2017-05-25 16:13:35', NULL, NULL, NULL, 'vm', NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (261, NULL, NULL, NULL, 'bfd0a6fd3f3c9c0daf4b1305546a6cd8', '18116333900', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 22, '2017-07-19 18:54:14', '139.196.177.28', '2017-07-19 18:54:56', '139.196.177.28', 0, NULL, '2017-05-27 17:02:09', NULL, '2017-05-27 17:02:09', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (262, NULL, NULL, NULL, 'edbcc23178690cee976c81700437a6de', '18735101608', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-05-30 22:15:07', '139.196.177.28', 0, NULL, '2017-05-30 22:14:56', NULL, '2017-05-30 22:14:56', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (263, NULL, NULL, NULL, 'c2fbaa3d2c4b2f5d9540f5a6c5a7279d', '18918112980', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-06-01 09:50:23', '139.196.177.28', 0, NULL, '2017-06-01 09:49:56', NULL, '2017-06-01 09:49:56', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (264, NULL, NULL, NULL, 'b93c071c6c228fbee04a7e73de1c7dfe', '13916393481', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 11, '2017-06-07 10:40:11', '139.196.177.28', '2017-06-07 12:01:03', '139.196.177.28', 0, NULL, '2017-06-05 14:57:03', NULL, '2017-06-05 14:57:03', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (265, NULL, NULL, NULL, '91dfb84942c73946d7675ec4a3a43f54', '15881863215', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-06-05 20:52:28', '139.196.177.28', 0, NULL, '2017-06-05 20:52:00', NULL, '2017-06-05 20:52:00', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (266, NULL, NULL, NULL, 'da36828630597612a61ce7abf653df22', '18918683536', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, '2017-06-07 18:20:56', '139.196.177.28', '2017-06-09 00:50:57', '139.196.177.28', 0, NULL, '2017-06-07 09:38:46', NULL, '2017-06-07 09:38:46', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (267, NULL, NULL, NULL, '0db7a5cac8ed67b5be2499939930458f', '15021710516', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 4, '2017-06-25 11:37:37', '139.196.177.28', '2017-07-18 16:18:37', '139.196.177.28', 0, NULL, '2017-06-07 13:30:52', NULL, '2017-06-07 13:30:52', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (268, NULL, NULL, NULL, 'c3bf7a67a3545693edc65429e76416e8', '15129268008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 7, '2017-06-07 21:17:41', '139.196.177.28', '2017-06-10 11:42:05', '139.196.177.28', 0, '2017-06-07 21:17:31', '2017-06-07 21:03:36', NULL, '2017-06-07 21:03:36', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (269, NULL, NULL, NULL, 'e0e64971becfcc4f053415a2c298bcb9', '13522747351', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2017-06-09 17:24:31', NULL, '2017-06-09 17:24:31', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (270, NULL, NULL, NULL, '8d45fdb4c5350e7bf324f61629bdbecf', '13811161294', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-06-09 20:55:10', '139.196.177.28', 0, NULL, '2017-06-09 20:55:00', NULL, '2017-06-09 20:55:00', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (271, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3a813e5c33b411e7adc26c0b84d5406f', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, '2017-06-15 16:00:20', NULL, '2017-06-15 16:00:20', NULL, NULL, NULL, 'vm', NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (272, NULL, NULL, NULL, '38316de9de8638415e090ea6e1a835e1', '13522532033', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 4, '2017-06-27 17:59:16', '139.196.177.28', '2017-07-10 00:53:12', '139.196.177.28', 0, NULL, '2017-06-16 15:35:20', NULL, '2017-06-16 15:35:20', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (273, NULL, NULL, NULL, 'd6fa46391ba0cb99a9cfc7f62a0a38cb', '18798876737', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 4, '2017-06-21 16:05:37', '139.196.177.28', '2017-06-23 10:52:00', '139.196.177.28', 0, NULL, '2017-06-20 11:35:09', NULL, '2017-06-20 11:35:09', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (274, NULL, NULL, NULL, '6f31b3fb7be4d7bc11d3433f827bbad7', '13585819950', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-06-21 17:31:41', '139.196.177.28', 0, NULL, '2017-06-21 17:31:21', NULL, '2017-06-21 17:31:21', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (275, NULL, NULL, NULL, 'a6f2f04303d9426818a3746e9c79af4a', '17600878751', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-06-21 19:29:28', '139.196.177.28', 0, NULL, '2017-06-21 19:29:17', NULL, '2017-06-21 19:29:17', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (276, NULL, NULL, NULL, '7d00a799354d788798e14d3a971e5730', '18016040251', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-06-22 16:03:43', '139.196.177.28', '2017-07-07 20:49:36', '139.196.177.28', 0, NULL, '2017-06-22 16:03:32', NULL, '2017-06-22 16:03:32', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (277, NULL, NULL, NULL, 'fae9701ca6122ccfa626e7df8518fab3', '15221131518', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-06-27 12:00:12', '139.196.177.28', '2017-07-05 09:06:01', '139.196.177.28', 0, NULL, '2017-06-27 11:59:57', NULL, '2017-06-27 11:59:57', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (278, NULL, NULL, NULL, '2fc66df2f2703f4e4d723cf1006e82e0', '15705908446', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 6, '2017-06-27 21:43:45', '139.196.177.28', '2017-06-28 11:21:16', '139.196.177.28', 0, NULL, '2017-06-27 15:41:52', NULL, '2017-06-27 15:41:52', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (279, NULL, NULL, NULL, '332565d9a9a28325e9dbf24d279f982c', '18611154339', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-07-01 12:09:20', '139.196.177.28', '2017-07-01 12:13:11', '139.196.177.28', 0, NULL, '2017-07-01 12:09:02', NULL, '2017-07-01 12:09:02', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (280, NULL, NULL, NULL, '6eaef85fb525d172ca48bf018da652b4', '17701802966', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 22, '2017-07-20 09:07:24', '139.196.177.28', '2017-07-20 10:36:22', '139.196.177.28', 0, NULL, '2017-07-03 09:51:18', NULL, '2017-07-03 09:51:18', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (281, NULL, NULL, NULL, 'a673bdbce48081c4454aeb2d0fa5c00f', '18758757202', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 6, '2017-07-11 18:24:35', '139.196.177.28', '2017-07-16 21:35:21', '139.196.177.28', 0, '2017-07-03 14:14:16', '2017-07-03 14:14:14', NULL, '2017-07-03 14:14:14', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (282, NULL, NULL, NULL, '4528eea19e30719fc59d38f15669f38d', '15811586887', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-07-04 14:09:23', '139.196.177.28', '2017-07-13 16:37:33', '139.196.177.28', 0, NULL, '2017-07-04 14:09:13', NULL, '2017-07-04 14:09:13', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (283, NULL, '', '', '150e6b6f00f1247e47e5cc6c7cf79f77', '17321217532', NULL, NULL, '', NULL, NULL, NULL, NULL, 1, NULL, NULL, 4, '2017-07-11 11:00:07', '139.196.177.28', '2017-07-12 15:26:23', '139.196.177.28', 0, NULL, '2017-07-05 10:07:46', NULL, '2017-07-12 15:30:32', 283, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (284, NULL, NULL, NULL, '317f24eb426a72e6f4afd5967be47795', '18321791310', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-07-07 11:13:21', '139.196.177.28', 0, NULL, '2017-07-07 11:12:53', NULL, '2017-07-07 11:12:53', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (285, NULL, NULL, NULL, '8e594ab419ebc9393523ac0bd5c0cf8f', '18241584610', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-07-08 11:10:28', '139.196.177.28', 0, NULL, '2017-07-08 11:10:09', NULL, '2017-07-08 11:10:09', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (286, NULL, NULL, NULL, 'd37d2a30faea09f9237df605fc9444c5', '13563630547', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-07-08 18:28:05', '139.196.177.28', 0, NULL, '2017-07-08 18:27:42', NULL, '2017-07-08 18:27:42', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (287, NULL, NULL, NULL, '484af21ed26f0a4eb4d96d289f346ae9', '17310056080', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 4, '2017-07-10 21:46:18', '139.196.177.28', '2017-07-11 01:39:18', '139.196.177.28', 0, NULL, '2017-07-10 21:15:54', NULL, '2017-07-10 21:15:54', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (288, NULL, NULL, NULL, 'bc400f7357b940f4485f771a23d4af0d', '18069837063', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-07-13 11:10:00', '139.196.177.28', 0, NULL, '2017-07-13 11:09:42', NULL, '2017-07-13 11:09:42', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (289, NULL, NULL, NULL, '71bba05f1ae345233eb424083940d3dd', '15313263152', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-07-16 14:30:56', '139.196.177.28', 0, NULL, '2017-07-16 14:30:43', NULL, '2017-07-16 14:30:43', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (290, NULL, NULL, NULL, '5dbf70519617a56210bde3f3d77073dc', '13511010635', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 7, '2017-07-18 09:55:21', '139.196.177.28', '2017-07-19 16:55:48', '139.196.177.28', 0, '2017-07-17 10:00:07', '2017-07-17 09:59:47', NULL, '2017-07-17 09:59:47', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (291, NULL, NULL, NULL, 'cddc97cb1f0e5324093a0a086c020bf0', '18601288584', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, '2017-07-18 09:49:12', '139.196.177.28', '2017-07-19 12:47:07', '139.196.177.28', 0, NULL, '2017-07-18 09:48:52', NULL, '2017-07-18 09:48:52', NULL, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);
INSERT INTO `user` VALUES (292, NULL, '', '多多', 'd2f1527fed01e0fe260c2a07be72800b', '18702189610', NULL, 'avatar/0/user_292.jpg', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, '2017-07-20 09:53:34', '139.196.177.28', 0, NULL, '2017-07-20 09:53:24', NULL, '2017-07-20 10:13:33', 292, NULL, NULL, NULL, NULL, NULL, '01', NULL, NULL);

-- ----------------------------
-- Table structure for user_app_registration
-- ----------------------------
DROP TABLE IF EXISTS `user_app_registration`;
CREATE TABLE `user_app_registration`  (
  `user_id` int(11) NOT NULL,
  `app_registration_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `platform` int(2) NULL DEFAULT NULL COMMENT '0:IOS,1:ANDROID',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`, `app_registration_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `user_coupon`;
CREATE TABLE `user_coupon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `coupon_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'lot_no+coupon_type_no+六位自增长序列',
  `coupon_type_id` int(11) NULL DEFAULT NULL COMMENT '优惠券种类ID',
  `use_start_date` datetime(0) NULL DEFAULT NULL COMMENT '使用开始时间',
  `use_end_date` datetime(0) NULL DEFAULT NULL COMMENT '使用结束时间',
  `status` int(1) NULL DEFAULT NULL COMMENT '0:未使用,1:已使用,2:已过期',
  `status_date` datetime(0) NULL DEFAULT NULL COMMENT '状态更新的时间点',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `merchant_id` int(12) NULL DEFAULT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `coupon_no`(`coupon_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 386 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_demurrage_order
-- ----------------------------
DROP TABLE IF EXISTS `user_demurrage_order`;
CREATE TABLE `user_demurrage_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NULL DEFAULT NULL COMMENT '订单表主键',
  `demurrage_fee` double(20, 2) NULL DEFAULT NULL COMMENT '滞留费',
  `status` int(1) NULL DEFAULT NULL COMMENT '滞留订单状态：1:已创建2:待付款3:已付款',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `pay_status` int(1) NULL DEFAULT NULL COMMENT '第三方支付状态0:失败 1成功',
  `app_status` int(1) NULL DEFAULT NULL COMMENT 'APP支付状态0:失败 1成功',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '订单付款时间',
  `pay_way` int(1) NULL DEFAULT NULL COMMENT '交易方式0:支付宝1:微信2:银行卡(后续)',
  `order_pay_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付订单号(淘宝、微信)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_detail
-- ----------------------------
DROP TABLE IF EXISTS `user_detail`;
CREATE TABLE `user_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `money` double(10, 2) NULL DEFAULT NULL COMMENT '账户金额',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户地址',
  `sex` int(1) NULL DEFAULT NULL COMMENT '用户性别1:男2:女',
  `birthday` date NULL DEFAULT NULL COMMENT '用户生日',
  `card_type` int(1) NULL DEFAULT NULL COMMENT '证件类型',
  `card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件编码',
  `zip_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编编码',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `province` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在省',
  `city` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在市',
  `area` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在行政区域id',
  `level` int(11) NULL DEFAULT NULL COMMENT '用户等级',
  `total_charge_amount` double(20, 2) NULL DEFAULT NULL COMMENT '充电总量',
  `payment_pwd` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户支付密码',
  `channel` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户渠道',
  `weChat_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weiBo_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户明细表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `user_favorite`;
CREATE TABLE `user_favorite`  (
  `user_id` int(11) NOT NULL,
  `charging_point_id` int(11) NOT NULL,
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`, `charging_point_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_feedback
-- ----------------------------
DROP TABLE IF EXISTS `user_feedback`;
CREATE TABLE `user_feedback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '充电订单ID',
  `rating` int(11) NULL DEFAULT NULL COMMENT '打分',
  `comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈内容',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_login_history
-- ----------------------------
DROP TABLE IF EXISTS `user_login_history`;
CREATE TABLE `user_login_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '登陆时间',
  `logout_time` datetime(0) NULL DEFAULT NULL COMMENT '注销时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9474 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户登录历史' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_order
-- ----------------------------
DROP TABLE IF EXISTS `user_order`;
CREATE TABLE `user_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `order_pay_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付订单号(淘宝、微信)',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `order_type` int(1) NOT NULL DEFAULT 0 COMMENT '订单类型0：合普友电充电 1：evcard充电',
  `pile_number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单对应的充电桩唯一编码',
  `coupon_id` int(11) NULL DEFAULT NULL COMMENT '折扣券id',
  `pay_way` int(1) NULL DEFAULT NULL COMMENT '交易方式0:支付宝1:微信2:银行卡(后续)',
  `status` int(1) NULL DEFAULT 1 COMMENT '订单状态：1:已创建2:充电中3:待付款4:待处理5:已付款',
  `pay_status` int(1) NULL DEFAULT NULL COMMENT '第三方支付状态0:失败 1成功',
  `app_status` int(1) NULL DEFAULT NULL COMMENT 'APP支付状态0:失败 1成功',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '订单付款时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '订单创建时间',
  `charge_stime` datetime(0) NULL DEFAULT NULL COMMENT '充电开始时间',
  `charge_etime` datetime(0) NULL DEFAULT NULL COMMENT '充电结束时间',
  `charge_duration` double(10, 2) NULL DEFAULT NULL COMMENT '充电时长(秒)',
  `charge_quantity` double(10, 2) NULL DEFAULT NULL COMMENT '充电量(千瓦时)',
  `amount` double(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `actual_amount` double(10, 2) NULL DEFAULT NULL COMMENT '订单实际付款金额',
  `charge_price_id` int(11) NULL DEFAULT NULL COMMENT '对应的价格维护id',
  `enable` int(1) NULL DEFAULT 1 COMMENT '订单是否有效,0 无效 1有效',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `create_by` int(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` int(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_by_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人ip',
  `error_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误代码',
  `error_msg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `vin` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆vin码',
  `app_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'appId',
  `discount` int(11) NULL DEFAULT NULL COMMENT '折扣率',
  `pay_elec_fee` double NULL DEFAULT NULL COMMENT '应付电费',
  `pay_service_fee` double NULL DEFAULT NULL COMMENT '应付服务费',
  `actual_fee` double NULL DEFAULT NULL COMMENT '实付总金额',
  `discount_fee` double NULL DEFAULT NULL COMMENT '优惠金额',
  `invoice_id` int(11) NULL DEFAULT NULL,
  `exchange_rate` int(20) NULL DEFAULT NULL COMMENT '积分汇率',
  `begin_meter_value` double(10, 2) NULL DEFAULT NULL COMMENT '开始电表读数',
  `end_meter_value` double(10, 2) NULL DEFAULT NULL COMMENT '结束电表读数',
  `demurrage_start_time` datetime(0) NULL DEFAULT NULL COMMENT '滞留开始时间',
  `demurrage_end_time` datetime(0) NULL DEFAULT NULL COMMENT '滞留结束时间',
  `pile_id` int(11) NULL DEFAULT NULL COMMENT '充电桩主键',
  `settle_id` int(11) NULL DEFAULT NULL COMMENT '结算方案id',
  `used_point` int(20) NULL DEFAULT 0 COMMENT '用户本次使用积分',
  `point_balance` int(20) NULL DEFAULT 0 COMMENT '用户剩余积分',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_order_ix_01`(`order_no`) USING BTREE,
  INDEX `user_order_ix_02`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_order_process
-- ----------------------------
DROP TABLE IF EXISTS `user_order_process`;
CREATE TABLE `user_order_process`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `begin_time` datetime(0) NULL DEFAULT NULL COMMENT '过程开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '过程结束时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_order_process_ix_01`(`order_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3225 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户订单充电过程' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_order_settle
-- ----------------------------
DROP TABLE IF EXISTS `user_order_settle`;
CREATE TABLE `user_order_settle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `coupon_id` int(11) NULL DEFAULT NULL COMMENT '优惠券id',
  `group_user_id` int(11) NULL DEFAULT NULL COMMENT '集团用户id',
  `settle_type_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算类型：0：集团折扣,1:集团预付费,2:活动折扣,3:优惠券,4:无优惠',
  `elec_discount_rate` double(20, 2) NULL DEFAULT NULL COMMENT '电费折扣率 ',
  `service_discount_rate` double(20, 2) NULL DEFAULT NULL COMMENT '服务费折扣率',
  `retention_discount_rate` double(20, 2) NULL DEFAULT NULL COMMENT '滞留费折扣率',
  `end_elec_fee` double(20, 2) NULL DEFAULT NULL COMMENT '最终电费',
  `end_service_fee` double(20, 2) NULL DEFAULT NULL COMMENT '最终服务费',
  `end_retention_fee` double(20, 2) NULL DEFAULT NULL COMMENT '最终滞留费',
  `end_all_fee` double(20, 2) NULL DEFAULT NULL COMMENT '最终总费用',
  `deductible_expenses` double(20, 2) NULL DEFAULT NULL COMMENT '可抵费',
  `flag` int(1) NULL DEFAULT NULL COMMENT '是否选择该策略，0：没有选择 1：选择',
  `campaign_id` int(1) NULL DEFAULT NULL COMMENT '活动id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 190 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_order_time
-- ----------------------------
DROP TABLE IF EXISTS `user_order_time`;
CREATE TABLE `user_order_time`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `begin_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时段',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时段',
  `charge_quantity` double(10, 2) NULL DEFAULT NULL COMMENT '充电量',
  `service_price` double(10, 2) NULL DEFAULT NULL COMMENT '服务费单价（元/度）',
  `charge_price` double(10, 2) NULL DEFAULT NULL COMMENT '电费单价（元/度）',
  `service_fee` double(10, 2) NULL DEFAULT 0.00 COMMENT '服务费',
  `charge_fee` double(10, 2) NULL DEFAULT NULL COMMENT '充电费',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `enable` int(1) NULL DEFAULT NULL COMMENT '是否有效',
  `amount` double(10, 2) NULL DEFAULT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_order_time_ix_01`(`order_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46701 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户订单时段表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_pay
-- ----------------------------
DROP TABLE IF EXISTS `user_pay`;
CREATE TABLE `user_pay`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `pay_type` int(1) NULL DEFAULT NULL COMMENT '支付类型：0：个人预充值,1:发票快递费,2:滞留费',
  `pay_way` int(1) NULL DEFAULT NULL COMMENT '交易方式0:支付宝1:微信2:银行卡(后续)',
  `pay_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付订单号(淘宝、微信)',
  `pay_status` int(1) NULL DEFAULT NULL COMMENT '第三方支付状态0:已创建 1支付成功 2.支付失败',
  `error_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付错误代码',
  `error_msg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付错误描述',
  `amount` double(20, 2) NULL DEFAULT NULL COMMENT '总金额',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(1) NULL DEFAULT NULL COMMENT '0:不启用,1:启用',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `pay_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_reservation
-- ----------------------------
DROP TABLE IF EXISTS `user_reservation`;
CREATE TABLE `user_reservation`  (
  `reser_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `point_pile_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '桩编号',
  `user_id` int(20) NULL DEFAULT NULL COMMENT '用户id',
  `status` int(1) NULL DEFAULT 0 COMMENT '状态(预约中:0，已过期:1，完成:2，取消:3)',
  `started_time` datetime(0) NULL DEFAULT NULL COMMENT '预约开始时间',
  `expired_time` datetime(0) NULL DEFAULT NULL COMMENT '记录预约何时过期，创建预约记录时计算生成',
  `completed_time` datetime(0) NULL DEFAULT NULL COMMENT '记录预约完成时间，充电开始标识预约完成',
  `created_by` int(20) NULL DEFAULT NULL COMMENT '创建人,对应一个user_id',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(20) NULL DEFAULT NULL COMMENT '更新人,对应一个user_id',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `enable` int(1) NULL DEFAULT 1 COMMENT '是否有效0:无效1:有效',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`reser_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户预约记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_temp
-- ----------------------------
DROP TABLE IF EXISTS `user_temp`;
CREATE TABLE `user_temp`  (
  `id` int(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户编号',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名-昵称',
  `nick_name` varchar(100) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `point_balance` int(20) NULL DEFAULT NULL COMMENT '用户积分',
  `big_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `wchat_open_id` varchar(50) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '微信openId',
  `weibo_open_id` varchar(50) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '微博openId',
  `taobao_open_id` varchar(50) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '淘宝openId',
  `third_user_id` varchar(50) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '第三方用户id',
  `third_enterprise_id` varchar(50) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '第三方企业id',
  `status` int(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '账号状态：1、启用，0、删除，2、禁用3 锁定',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '账号过期时间',
  `authority_expire_time` datetime(0) NULL DEFAULT NULL COMMENT '权限过期时间',
  `login_times` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '登录次数',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次登录ip',
  `current_login_time` datetime(0) NULL DEFAULT NULL COMMENT '当前登录时间',
  `current_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前登录ip',
  `pwd_wrong_times` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录时密码错误次数',
  `last_pwd_wrong_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次密码错误日期',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` int(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_by_ip` varchar(20) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '更新人ip',
  `remark` varchar(500) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '备注',
  `app_id` varchar(20) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `indvi_prepayment` double(20, 2) NULL DEFAULT NULL,
  `group_prepayment` double(20, 2) NULL DEFAULT NULL,
  `user_type` varchar(2) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '01:普通个人用户,02:虚拟卡用户',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '虚拟卡关联客户ID',
  `virtual_card_no` varchar(50) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '虚拟卡卡号'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `user_vehicle`;
CREATE TABLE `user_vehicle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `vehicle_id` int(11) NULL DEFAULT NULL COMMENT '车辆id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vehicle
-- ----------------------------
DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编码',
  `vehicle_vin` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆vin码',
  `vehicle_engine_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发动机号',
  `vehicle_model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车辆型号（删掉）',
  `vehicle_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `driving_license` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾照号码',
  `driving_date` datetime(0) NULL DEFAULT NULL COMMENT '驾照日期',
  `driving_photo` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '驾照照片',
  `driving_brand_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌编码',
  `driving_brand_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `driving_type_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车型编码',
  `driving_type_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车型名称',
  `vehicle_licence` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行驶证号码',
  `vehicle_licence_photo` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行驶证照片',
  `venicle_enable` int(11) NULL DEFAULT 1 COMMENT '是否有效',
  `isDefault` int(1) NULL DEFAULT NULL COMMENT '是否默认 1：默认',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新这ip',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 159 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户车辆信息' ROW_FORMAT = Compact;

-- ----------------------------
-- View structure for v_dashboard
-- ----------------------------
DROP VIEW IF EXISTS `v_dashboard`;
CREATE ALGORITHM = UNDEFINED DEFINER = `psproot`@`%` SQL SECURITY DEFINER VIEW `v_dashboard` AS select '1' AS `classify`,'今日订单' AS `title`,`uo`.`status` AS `status`,(case `uo`.`status` when 2 then '充电中' when 3 then '待付款' when 4 then '待处理' when 5 then '已付款' end) AS `type`,count(1) AS `val`,(select count(1) from `user_order` `tm` where ((`tm`.`status` > 1) and (date_format(`uo`.`create_time`,'%Y-%m-%d') <= date_format(now(),'%Y-%m-%d')))) AS `total` from `user_order` `uo` where ((`uo`.`status` > 1) and (date_format(`uo`.`create_time`,'%Y-%m-%d') <= date_format(now(),'%Y-%m-%d'))) group by `uo`.`status` union select '2' AS `classify`,'桩状态' AS `title`,`pp`.`status` AS `status`,(case `pp`.`status` when 1 then '待充电' when 2 then '充电中' when 3 then '异常' when 4 then '未知' end) AS `type`,count(1) AS `val`,(select count(1) from `charge_point_pile` `tp` where (`tp`.`controlled` = '1')) AS `total` from `charge_point_pile` `pp` where ((`pp`.`controlled` = 1) and (`pp`.`status` is not null)) group by `pp`.`status` union select '3' AS `classify`,'活跃用户' AS `title`,1 AS `status`,'活跃用户' AS `type`,count(distinct `lh`.`user_id`) AS `val`,count(distinct `lh`.`user_id`) AS `total` from `user_login_history` `lh` where (`lh`.`login_time` > (curdate() - 30)) union select '4' AS `classify`,'客户数量' AS `title`,1 AS `status`,'客户数量' AS `type`,count(1) AS `val`,count(1) AS `total` from `customer` `c` where (`c`.`enable` = '1');

-- ----------------------------
-- View structure for v_lock_timeout
-- ----------------------------
DROP VIEW IF EXISTS `v_lock_timeout`;
CREATE ALGORITHM = UNDEFINED DEFINER = `psproot`@`%` SQL SECURITY DEFINER VIEW `v_lock_timeout` AS select `gl`.`id` AS `lock_id`,`gl`.`lock_no` AS `lock_no`,`gl`.`lock_model` AS `lock_model`,`gl`.`pile_id` AS `pile_id`,`gl`.`lose_timeout` AS `lose_timeout`,now() AS `CURRENT_TIMESTAMP`,`glot`.`opt_time` AS `opt_time`,`glot`.`command` AS `command`,`glot`.`create_by` AS `create_by`,`glot`.`create_time` AS `create_time`,`glot`.`enable` AS `enable`,`glot`.`update_by` AS `update_by`,`glot`.`update_time` AS `update_time`,`LOCKTIMEOUT`(`glot`.`lock_no`) AS `TIMEOUT_FLAG` from (`ground_lock` `gl` left join `ground_lock_opt_time` `glot` on((`gl`.`id` = `glot`.`lock_id`))) where ((`gl`.`enable` = '1') and (`gl`.`controlled` = 1));

-- ----------------------------
-- View structure for v_order_line_chart
-- ----------------------------
DROP VIEW IF EXISTS `v_order_line_chart`;
CREATE ALGORITHM = UNDEFINED DEFINER = `psproot`@`%` SQL SECURITY DEFINER VIEW `v_order_line_chart` AS select 1 AS `TYPE`,'总电量' AS `TITLE`,hour(`uo`.`create_time`) AS `HOUR`,sum(`uo`.`charge_quantity`) AS `DATA` from `user_order` `uo` where (date_format(`uo`.`create_time`,'%y-%m-%d') = date_format(now(),'%y-%m-%d')) group by hour(`uo`.`create_time`) union select `uo`.`status` AS `status`,(case `uo`.`status` when 2 then '充电中' when 3 then '待处理' when 4 then '待付款' when 5 then '已付款' end) AS `TITLE`,hour(`uo`.`create_time`) AS `HOUR`,sum(`uo`.`charge_quantity`) AS `DATA` from `user_order` `uo` where ((date_format(`uo`.`create_time`,'%y-%m-%d') = date_format(now(),'%y-%m-%d')) and (`uo`.`status` in ('2','3','4','5'))) group by `uo`.`status`,hour(`uo`.`create_time`);

-- ----------------------------
-- View structure for v_pile_distributed
-- ----------------------------
DROP VIEW IF EXISTS `v_pile_distributed`;
CREATE ALGORITHM = UNDEFINED DEFINER = `psproot`@`%` SQL SECURITY DEFINER VIEW `v_pile_distributed` AS (select `t`.`id` AS `id`,`t`.`point_pile_number` AS `point_pile_number`,`t`.`pile_custom_number` AS `pile_custom_number`,`t`.`point_pile_model` AS `point_pile_model`,`mp`.`model_name` AS `model_name`,`t`.`parking_no` AS `parking_no`,ifnull(`t`.`lose_count`,0) AS `lose_count`,ifnull(`t`.`fault_count`,0) AS `fault_count`,group_concat(`sr`.`region_name` separator '.') AS `area`,`city`.`id` AS `hot_city_id`,`city`.`city_name` AS `hot_city_name`,`mc`.`id` AS `circle_id`,`mc`.`circle_name` AS `circle_name`,`p`.`id` AS `point_id`,`p`.`point_name` AS `point_name`,`t`.`point_pile_name` AS `point_pile_name`,`p`.`address` AS `address`,`p`.`province_id` AS `province_id`,`p`.`city_id` AS `city_id`,`p`.`area_id` AS `area_id`,`p`.`create_time` AS `create_time`,`p`.`customer_id` AS `customer_id`,`c`.`customer_name` AS `customer_name`,concat(`p`.`station_lon`,',',`p`.`station_lat`) AS `station` from ((((((`charge_point_pile` `t` join `charge_point` `p` on((`t`.`point_id` = `p`.`id`))) join `customer` `c` on((`p`.`customer_id` = `c`.`id`))) join `sys_region` `sr` on(((`sr`.`region_id` = `p`.`province_id`) or (`sr`.`region_id` = `p`.`city_id`) or (`sr`.`region_id` = `p`.`area_id`)))) join `mdm_circle` `mc` on((`mc`.`id` = `p`.`circle_id`))) join `mdm_product_model` `mp` on((`t`.`point_pile_model` = `mp`.`id`))) join `mdm_hot_city` `city` on((`city`.`id` = `p`.`hot_city_id`))) group by `t`.`id`);

-- ----------------------------
-- View structure for v_pile_frequency
-- ----------------------------
DROP VIEW IF EXISTS `v_pile_frequency`;
CREATE ALGORITHM = UNDEFINED DEFINER = `psproot`@`%` SQL SECURITY DEFINER VIEW `v_pile_frequency` AS (select `t`.`id` AS `id`,`t`.`point_pile_number` AS `point_pile_number`,`t`.`pile_custom_number` AS `pile_custom_number`,`t`.`point_pile_model` AS `point_pile_model`,`t`.`parking_no` AS `parking_no`,`t`.`lose_count` AS `lose_count`,`t`.`fault_count` AS `fault_count`,`t`.`area` AS `area`,`t`.`circle_name` AS `circle_name`,`t`.`circle_id` AS `circle_id`,`t`.`point_name` AS `point_name`,`t`.`point_id` AS `point_id`,`t`.`point_pile_name` AS `point_pile_name`,`t`.`model_name` AS `model_name`,`t`.`address` AS `address`,`t`.`province_id` AS `province_id`,`t`.`city_id` AS `city_id`,`t`.`area_id` AS `area_id`,`t`.`create_time` AS `create_time`,`t`.`customer_id` AS `customer_id`,`t`.`customer_name` AS `customer_name`,count(`o`.`id`) AS `order_count` from (`v_pile_distributed` `t` left join `user_order` `o` on((`o`.`pile_number` = `t`.`point_pile_number`))) group by `t`.`id`);

-- ----------------------------
-- View structure for v_pile_timeout
-- ----------------------------
DROP VIEW IF EXISTS `v_pile_timeout`;
CREATE ALGORITHM = UNDEFINED DEFINER = `psproot`@`%` SQL SECURITY DEFINER VIEW `v_pile_timeout` AS select `cpp`.`point_pile_number` AS `point_pile_number`,`cpp`.`charging_time` AS `charging_time`,`cpp`.`standby_time` AS `standby_time`,`cpp`.`charging_timeout` AS `charging_timeout`,`cpp`.`standby_timeout` AS `standby_timeout`,now() AS `CURRENT_TIMESTAMP`,`cpot`.`opt_time` AS `opt_time`,`cpot`.`command` AS `command`,`cpot`.`create_by` AS `create_by`,`cpot`.`create_time` AS `create_time`,`cpot`.`enable` AS `enable`,`cpot`.`update_by` AS `update_by`,`cpot`.`update_time` AS `update_time`,`cpot`.`update_by_ip` AS `update_by_ip`,`cpot`.`order_no` AS `order_no`,`uo`.`update_time` AS `order_update_time`,`uo`.`status` AS `status`,`uo`.`error_code` AS `error_code`,`TIMEOUT`(`cpot`.`pile_no`) AS `TIMEOUT_FLAG` from ((`charge_point_pile` `cpp` left join `charge_pile_opt_time` `cpot` on((`cpp`.`point_pile_number` = `cpot`.`pile_no`))) left join `user_order` `uo` on((`uo`.`order_no` = `cpot`.`order_no`))) where ((`cpp`.`enable` = '1') and (`cpp`.`controlled` = 1) and (not(exists(select 1 from `sys_push_status` `sps` where ((`sps`.`pile_number` = `cpp`.`point_pile_number`) and (`sps`.`status` = 1) and (`sps`.`timeout_flag` = `sps`.`timeout_flag`))))));

-- ----------------------------
-- View structure for v_sys_user
-- ----------------------------
DROP VIEW IF EXISTS `v_sys_user`;
CREATE ALGORITHM = UNDEFINED DEFINER = `psproot`@`%` SQL SECURITY DEFINER VIEW `v_sys_user` AS select `t`.`id` AS `id`,`t`.`user_name` AS `user_name` from `sys_user` `t`;

-- ----------------------------
-- View structure for v_user_order
-- ----------------------------
DROP VIEW IF EXISTS `v_user_order`;
CREATE ALGORITHM = UNDEFINED DEFINER = `psproot`@`%` SQL SECURITY DEFINER VIEW `v_user_order` AS select `u`.`id` AS `id`,`u`.`phone` AS `phone`,`u`.`user_name` AS `user_name`,`u`.`nick_name` AS `nick_name`,group_concat(distinct `sr`.`region_name` order by `sr`.`region_id` ASC separator '.') AS `area`,`u`.`login_times` AS `total_login_times`,`o`.`order_no` AS `order_no`,`o`.`order_pay_no` AS `order_pay_no`,`o`.`order_type` AS `order_type`,`o`.`pile_number` AS `pile_number`,`o`.`coupon_id` AS `coupon_id`,`o`.`pay_way` AS `pay_way`,`o`.`status` AS `status`,`o`.`pay_time` AS `pay_time`,`o`.`create_time` AS `create_time`,`o`.`charge_stime` AS `charge_stime`,`o`.`charge_etime` AS `charge_etime`,`o`.`charge_duration` AS `charge_duration`,`o`.`charge_quantity` AS `charge_quantity`,`o`.`amount` AS `amount`,`o`.`actual_amount` AS `actual_amount`,`o`.`charge_price_id` AS `charge_price_id`,`o`.`enable` AS `enable`,`o`.`remark` AS `remark`,`o`.`create_by` AS `create_by`,`o`.`update_time` AS `update_time`,`o`.`update_by` AS `update_by`,`o`.`update_by_ip` AS `update_by_ip`,`cp`.`customer_id` AS `customer_id` from (((((`user` `u` left join `user_detail` `ud` on((`ud`.`user_id` = `u`.`id`))) left join `sys_region` `sr` on(((`sr`.`region_id` = `ud`.`province`) or (`sr`.`region_id` = `ud`.`city`)))) left join `user_order` `o` on((`o`.`user_id` = `u`.`id`))) left join `charge_point_pile` `pp` on((`pp`.`point_pile_number` = `o`.`pile_number`))) left join `charge_point` `cp` on((`cp`.`id` = `pp`.`point_id`))) group by `u`.`id`;

-- ----------------------------
-- View structure for v_user_pay_record
-- ----------------------------
DROP VIEW IF EXISTS `v_user_pay_record`;
CREATE ALGORITHM = UNDEFINED DEFINER = `psproot`@`%` SQL SECURITY DEFINER VIEW `v_user_pay_record` AS (select `t`.`id` AS `id`,`u`.`phone` AS `phone`,`u`.`user_name` AS `user_name`,`u`.`nick_name` AS `nick_name`,`t`.`order_no` AS `order_no`,`t`.`order_pay_no` AS `order_pay_no`,`t`.`create_time` AS `create_time`,`t`.`charge_stime` AS `charge_stime`,`t`.`charge_etime` AS `charge_etime`,(select `pay`.`pay_way` from `mdm_pay` `pay` where ((`pay`.`enable` = 1) and (`pay`.`id` = `t`.`pay_way`))) AS `pay_way`,`t`.`pay_way` AS `pay_way_code`,concat(`t`.`charge_stime`,' ~ ',`t`.`charge_etime`) AS `charge_time`,`t`.`charge_quantity` AS `charge_quantity`,`t`.`amount` AS `amount`,`t`.`actual_amount` AS `actual_amount`,sum(`ot`.`charge_fee`) AS `charge_fee`,sum(`ot`.`service_fee`) AS `service_fee`,(select `dic`.`dic_desc` from `mdm_dic` `dic` where ((`dic`.`dic_enable` = 1) and (`dic`.`dic_group` = 'ORDER_TYPE') and (`dic`.`dic_value` = `t`.`status`))) AS `STATUS`,`t`.`status` AS `STATUS_code`,`vpd`.`province_id` AS `province_id`,`vpd`.`city_id` AS `city_id`,`vpd`.`area_id` AS `area_id`,`vpd`.`area` AS `area`,`vpd`.`point_id` AS `point_id`,`vpd`.`point_name` AS `point_name`,`vpd`.`station` AS `station`,`vpd`.`hot_city_id` AS `hot_city_id`,`vpd`.`hot_city_name` AS `hot_city_name`,`vpd`.`circle_id` AS `circle_id`,`vpd`.`circle_name` AS `circle_name`,`vpd`.`customer_id` AS `customer_id`,`vpd`.`customer_name` AS `customer_name`,`vpd`.`point_pile_number` AS `point_pile_number`,`vpd`.`pile_custom_number` AS `pile_custom_number`,`vpd`.`point_pile_model` AS `point_pile_model`,`vpd`.`point_pile_name` AS `point_pile_name`,`udo`.`id` AS `demurrage_id`,`udo`.`status` AS `demurrage_status`,`udo`.`demurrage_fee` AS `demurrage_fee`,`t`.`demurrage_start_time` AS `demurrage_start_time`,`t`.`demurrage_end_time` AS `demurrage_end_time` from ((((`user_order` `t` join `user` `u` on((`u`.`id` = `t`.`user_id`))) join `v_pile_distributed` `vpd` on((`vpd`.`point_pile_number` = `t`.`pile_number`))) left join `user_order_time` `ot` on((`t`.`order_no` = `ot`.`order_no`))) left join `user_demurrage_order` `udo` on((`t`.`id` = `udo`.`order_id`))) group by `t`.`order_no`);

-- ----------------------------
-- Function structure for DISTANCE
-- ----------------------------
DROP FUNCTION IF EXISTS `DISTANCE`;
delimiter ;;
CREATE DEFINER=`psproot`@`%` FUNCTION `DISTANCE`(`startLatitude` double,`startLongitude` double,`endLatitude` double,`endLongitude` double) RETURNS float
BEGIN
	 DECLARE R,P,lat1,lat2,lon1,lon2,d1,d2,d3,d4,d5,d6,d7,d8,tmpresult DOUBLE;
 DECLARE result FLOAT;
 SET R = 12742001.579854401;
 SET P = 0.01745329251994329;
 SET lon1 = P * startLongitude;
 SET lat1 = P * startLatitude;
 SET lon2 = P * endLongitude;
 SET lat2 = P * endLatitude;
 
 SET d1 = SIN(lon1);
 SET d2 = SIN(lat1);
 SET d3 = COS(lon1);
 SET d4 = COS(lat1);
 SET d5 = SIN(lon2);
 SET d6 = SIN(lat2);
 SET d7 = COS(lon2);
 SET d8 = COS(lat2);
 SET tmpresult = SQRT((d4 * d3 - d8 * d7) * (d4 * d3 - d8 * d7) + (d4 * d1 - d8 * d5) * (d4 * d1 - d8 * d5) + (d2 - d6) * (d2 - d6));
 SET result = ASIN(tmpresult/ 2.0) * R;
 RETURN (result);
    END
;;
delimiter ;

-- ----------------------------
-- Function structure for GetCouponNoNextVal
-- ----------------------------
DROP FUNCTION IF EXISTS `GetCouponNoNextVal`;
delimiter ;;
CREATE DEFINER=`psproot`@`%` FUNCTION `GetCouponNoNextVal`(couponTypeId int) RETURNS varchar(50) CHARSET utf8
BEGIN
DECLARE v_coupon_no_currentVal varchar(50) default '';
DECLARE v_coupon_no_nextVal varchar(50) default '';
DECLARE  v_coupon_type_no varchar(50) default '';
SELECT IFNULL(max(up.coupon_no),ct.current_coupon_no),ct.coupon_type_no into v_coupon_no_currentVal,v_coupon_type_no 
from user_coupon up 
join coupon_type ct on up.coupon_type_id = ct.id
where up.coupon_type_id = couponTypeId;
SELECT v_coupon_type_no||substring(v_coupon_no_currentVal,length(v_coupon_type_no)+1) into v_coupon_no_nextVal from dual;
select case when
length(substring(v_coupon_no_currentVal,length(v_coupon_type_no)+1)+1)>length(substring(v_coupon_no_currentVal,length(v_coupon_type_no)+1))
then CONCAT(v_coupon_type_no,substring(v_coupon_no_currentVal,length(v_coupon_type_no)+1)+1)
else
CONCAT(v_coupon_type_no,LPAD(substring(v_coupon_no_currentVal,length(v_coupon_type_no)+1)+1,length(substring(v_coupon_no_currentVal,length(v_coupon_type_no)+1)),'0'))
end 
into v_coupon_no_nextVal
from dual;
RETURN v_coupon_no_nextVal;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for LOCKTIMEOUT
-- ----------------------------
DROP FUNCTION IF EXISTS `LOCKTIMEOUT`;
delimiter ;;
CREATE DEFINER=`psproot`@`%` FUNCTION `LOCKTIMEOUT`(LOCK_NO varchar(100)) RETURNS int(11)
BEGIN
  #定义变量
  DECLARE idle_heart_beat_temp,
          heart_time_temp int;
  DECLARE ERROR_CODE VARCHAR(32);
  DECLARE OPT_TIME timestamp;
  DECLARE CURRENT timestamp;
  DECLARE HEART_TIME_S timestamp;
  DECLARE RESULT int;

  SET CURRENT = CURRENT_TIMESTAMP;

	IF(lock_no='') THEN
     RETURN 0;
	END IF;

  #查询超时时间
  SELECT
    glp.idle_heart_beat,
    glp.heart_time INTO idle_heart_beat_temp, heart_time_temp
  FROM ground_lock gl 
  inner join ground_lock_params glp on gl.id = glp.lock_id
  WHERE gl.lock_no = LOCK_NO;

  #查询最后一次消息的操作时间
  SELECT
    glOT.OPT_TIME
    INTO OPT_TIME
  FROM ground_lock_opt_time glOT
  WHERE POT.PILE_NO = PILE_NO;

  #一次心跳失败后，连续三次60秒一次重复发送，全部失败为失联
  SET HEART_TIME_S = (OPT_TIME + INTERVAL (idle_heart_beat_temp + 3 * 60) SECOND);

  #如果待机状态
    IF (CURRENT > HEART_TIME_S) THEN
      SET RESULT = 1; #失联
    ELSE
      SET RESULT = 0; #正常
    END IF;

  RETURN RESULT; #正常
END
;;
delimiter ;

-- ----------------------------
-- Function structure for TIMEOUT
-- ----------------------------
DROP FUNCTION IF EXISTS `TIMEOUT`;
delimiter ;;
CREATE DEFINER=`psproot`@`%` FUNCTION `TIMEOUT`(PILE_NO varchar(100)) RETURNS int(11)
BEGIN

  #定义变量

  DECLARE charging_time_temp,

          standby_time_temp,

          standby_timeout_temp,

          charging_timeout_temp int;

  DECLARE ORDER_NO varchar(32);

  DECLARE ORDER_STATUS int;

  DECLARE ERROR_CODE VARCHAR(32);

  DECLARE OPT_TIME timestamp;

  DECLARE CURRENT timestamp;

  DECLARE STANDBY_TIMEOUT_S,

          CHARGING_TIMOUT_S,

          CHARGED_TIMEOUT_S timestamp;

  DECLARE RESULT int;



  SET CURRENT = CURRENT_TIMESTAMP;



	IF(PILE_NO='') THEN

     RETURN 0;

	END IF;



  #查询超时时间

  SELECT

    CPP.charging_time,

    CPP.standby_time,

    CPP.charging_timeout,

    CPP.standby_timeout INTO charging_time_temp, standby_time_temp, charging_timeout_temp, standby_timeout_temp

  FROM charge_point_pile CPP

  WHERE CPP.point_pile_number = PILE_NO;



  #查询最后一次消息的操作时间

  SELECT

    POT.OPT_TIME,

    POT.ORDER_NO INTO OPT_TIME, ORDER_NO

  FROM charge_pile_opt_time POT

  WHERE POT.PILE_NO = PILE_NO;



  #一次心跳失败后，连续三次60秒一次重复发送，全部失败为失联

  SET STANDBY_TIMEOUT_S = (OPT_TIME + INTERVAL (standby_time_temp + 3 * 60) SECOND);

  #充电桩失联时间

  SET CHARGING_TIMOUT_S = (OPT_TIME + INTERVAL (charging_time_temp * charging_timeout_temp) SECOND);

  #充电失联自动断电时间

  SET CHARGED_TIMEOUT_S = (CHARGING_TIMOUT_S + INTERVAL (charging_time_temp * standby_timeout_temp) SECOND);

  #查询订单状态

  SELECT UO.`status`,UO.ERROR_CODE INTO ORDER_STATUS,ERROR_CODE FROM user_order UO WHERE UO.order_no=ORDER_NO;



  IF (ORDER_STATUS = '2'||ORDER_STATUS = '4') THEN

    #如果充电状态

		IF (CURRENT > CHARGING_TIMOUT_S AND CURRENT < CHARGED_TIMEOUT_S) THEN

			SET RESULT = 1; #失联

		ELSEIF (CURRENT > CHARGED_TIMEOUT_S) THEN

			SET RESULT = 2; #断电 

		ELSE

			SET RESULT = 0; #正常 

		END IF;

  #如果待机状态

  ELSE

    IF (CURRENT > STANDBY_TIMEOUT_S) THEN

      SET RESULT = 1; #失联

    ELSE

      SET RESULT = 0; #正常

    END IF;

  END IF;



  RETURN RESULT; #正常

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
