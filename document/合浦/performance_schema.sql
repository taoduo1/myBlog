/*
 Navicat Premium Data Transfer

 Source Server         : Hp
 Source Server Type    : MySQL
 Source Server Version : 50634
 Source Host           : rdsh902wshev83g97j6mo.mysql.rds.aliyuncs.com:3306
 Source Schema         : performance_schema

 Target Server Type    : MySQL
 Target Server Version : 50634
 File Encoding         : 65001

 Date: 13/07/2018 11:19:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `USER` char(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CURRENT_CONNECTIONS` bigint(20) NOT NULL,
  `TOTAL_CONNECTIONS` bigint(20) NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for cond_instances
-- ----------------------------
DROP TABLE IF EXISTS `cond_instances`;
CREATE TABLE `cond_instances`  (
  `NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_stages_current
-- ----------------------------
DROP TABLE IF EXISTS `events_stages_current`;
CREATE TABLE `events_stages_current`  (
  `THREAD_ID` bigint(20) UNSIGNED NOT NULL,
  `EVENT_ID` bigint(20) UNSIGNED NOT NULL,
  `END_EVENT_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SOURCE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TIMER_START` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `TIMER_END` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `TIMER_WAIT` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `NESTING_EVENT_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `NESTING_EVENT_TYPE` enum('STATEMENT','STAGE','WAIT') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_stages_history
-- ----------------------------
DROP TABLE IF EXISTS `events_stages_history`;
CREATE TABLE `events_stages_history`  (
  `THREAD_ID` bigint(20) UNSIGNED NOT NULL,
  `EVENT_ID` bigint(20) UNSIGNED NOT NULL,
  `END_EVENT_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SOURCE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TIMER_START` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `TIMER_END` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `TIMER_WAIT` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `NESTING_EVENT_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `NESTING_EVENT_TYPE` enum('STATEMENT','STAGE','WAIT') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_stages_history_long
-- ----------------------------
DROP TABLE IF EXISTS `events_stages_history_long`;
CREATE TABLE `events_stages_history_long`  (
  `THREAD_ID` bigint(20) UNSIGNED NOT NULL,
  `EVENT_ID` bigint(20) UNSIGNED NOT NULL,
  `END_EVENT_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SOURCE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TIMER_START` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `TIMER_END` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `TIMER_WAIT` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `NESTING_EVENT_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `NESTING_EVENT_TYPE` enum('STATEMENT','STAGE','WAIT') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_stages_summary_by_account_by_event_name
-- ----------------------------
DROP TABLE IF EXISTS `events_stages_summary_by_account_by_event_name`;
CREATE TABLE `events_stages_summary_by_account_by_event_name`  (
  `USER` char(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_stages_summary_by_host_by_event_name
-- ----------------------------
DROP TABLE IF EXISTS `events_stages_summary_by_host_by_event_name`;
CREATE TABLE `events_stages_summary_by_host_by_event_name`  (
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_stages_summary_by_thread_by_event_name
-- ----------------------------
DROP TABLE IF EXISTS `events_stages_summary_by_thread_by_event_name`;
CREATE TABLE `events_stages_summary_by_thread_by_event_name`  (
  `THREAD_ID` bigint(20) UNSIGNED NOT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_stages_summary_by_user_by_event_name
-- ----------------------------
DROP TABLE IF EXISTS `events_stages_summary_by_user_by_event_name`;
CREATE TABLE `events_stages_summary_by_user_by_event_name`  (
  `USER` char(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_stages_summary_global_by_event_name
-- ----------------------------
DROP TABLE IF EXISTS `events_stages_summary_global_by_event_name`;
CREATE TABLE `events_stages_summary_global_by_event_name`  (
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_statements_current
-- ----------------------------
DROP TABLE IF EXISTS `events_statements_current`;
CREATE TABLE `events_statements_current`  (
  `THREAD_ID` bigint(20) UNSIGNED NOT NULL,
  `EVENT_ID` bigint(20) UNSIGNED NOT NULL,
  `END_EVENT_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SOURCE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TIMER_START` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `TIMER_END` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `TIMER_WAIT` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `LOCK_TIME` bigint(20) UNSIGNED NOT NULL,
  `SQL_TEXT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `DIGEST` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DIGEST_TEXT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CURRENT_SCHEMA` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_TYPE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_SCHEMA` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `MYSQL_ERRNO` int(11) NULL DEFAULT NULL,
  `RETURNED_SQLSTATE` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MESSAGE_TEXT` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ERRORS` bigint(20) UNSIGNED NOT NULL,
  `WARNINGS` bigint(20) UNSIGNED NOT NULL,
  `ROWS_AFFECTED` bigint(20) UNSIGNED NOT NULL,
  `ROWS_SENT` bigint(20) UNSIGNED NOT NULL,
  `ROWS_EXAMINED` bigint(20) UNSIGNED NOT NULL,
  `CREATED_TMP_DISK_TABLES` bigint(20) UNSIGNED NOT NULL,
  `CREATED_TMP_TABLES` bigint(20) UNSIGNED NOT NULL,
  `SELECT_FULL_JOIN` bigint(20) UNSIGNED NOT NULL,
  `SELECT_FULL_RANGE_JOIN` bigint(20) UNSIGNED NOT NULL,
  `SELECT_RANGE` bigint(20) UNSIGNED NOT NULL,
  `SELECT_RANGE_CHECK` bigint(20) UNSIGNED NOT NULL,
  `SELECT_SCAN` bigint(20) UNSIGNED NOT NULL,
  `SORT_MERGE_PASSES` bigint(20) UNSIGNED NOT NULL,
  `SORT_RANGE` bigint(20) UNSIGNED NOT NULL,
  `SORT_ROWS` bigint(20) UNSIGNED NOT NULL,
  `SORT_SCAN` bigint(20) UNSIGNED NOT NULL,
  `NO_INDEX_USED` bigint(20) UNSIGNED NOT NULL,
  `NO_GOOD_INDEX_USED` bigint(20) UNSIGNED NOT NULL,
  `NESTING_EVENT_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `NESTING_EVENT_TYPE` enum('STATEMENT','STAGE','WAIT') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_statements_history
-- ----------------------------
DROP TABLE IF EXISTS `events_statements_history`;
CREATE TABLE `events_statements_history`  (
  `THREAD_ID` bigint(20) UNSIGNED NOT NULL,
  `EVENT_ID` bigint(20) UNSIGNED NOT NULL,
  `END_EVENT_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SOURCE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TIMER_START` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `TIMER_END` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `TIMER_WAIT` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `LOCK_TIME` bigint(20) UNSIGNED NOT NULL,
  `SQL_TEXT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `DIGEST` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DIGEST_TEXT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CURRENT_SCHEMA` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_TYPE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_SCHEMA` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `MYSQL_ERRNO` int(11) NULL DEFAULT NULL,
  `RETURNED_SQLSTATE` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MESSAGE_TEXT` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ERRORS` bigint(20) UNSIGNED NOT NULL,
  `WARNINGS` bigint(20) UNSIGNED NOT NULL,
  `ROWS_AFFECTED` bigint(20) UNSIGNED NOT NULL,
  `ROWS_SENT` bigint(20) UNSIGNED NOT NULL,
  `ROWS_EXAMINED` bigint(20) UNSIGNED NOT NULL,
  `CREATED_TMP_DISK_TABLES` bigint(20) UNSIGNED NOT NULL,
  `CREATED_TMP_TABLES` bigint(20) UNSIGNED NOT NULL,
  `SELECT_FULL_JOIN` bigint(20) UNSIGNED NOT NULL,
  `SELECT_FULL_RANGE_JOIN` bigint(20) UNSIGNED NOT NULL,
  `SELECT_RANGE` bigint(20) UNSIGNED NOT NULL,
  `SELECT_RANGE_CHECK` bigint(20) UNSIGNED NOT NULL,
  `SELECT_SCAN` bigint(20) UNSIGNED NOT NULL,
  `SORT_MERGE_PASSES` bigint(20) UNSIGNED NOT NULL,
  `SORT_RANGE` bigint(20) UNSIGNED NOT NULL,
  `SORT_ROWS` bigint(20) UNSIGNED NOT NULL,
  `SORT_SCAN` bigint(20) UNSIGNED NOT NULL,
  `NO_INDEX_USED` bigint(20) UNSIGNED NOT NULL,
  `NO_GOOD_INDEX_USED` bigint(20) UNSIGNED NOT NULL,
  `NESTING_EVENT_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `NESTING_EVENT_TYPE` enum('STATEMENT','STAGE','WAIT') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_statements_history_long
-- ----------------------------
DROP TABLE IF EXISTS `events_statements_history_long`;
CREATE TABLE `events_statements_history_long`  (
  `THREAD_ID` bigint(20) UNSIGNED NOT NULL,
  `EVENT_ID` bigint(20) UNSIGNED NOT NULL,
  `END_EVENT_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SOURCE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TIMER_START` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `TIMER_END` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `TIMER_WAIT` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `LOCK_TIME` bigint(20) UNSIGNED NOT NULL,
  `SQL_TEXT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `DIGEST` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DIGEST_TEXT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CURRENT_SCHEMA` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_TYPE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_SCHEMA` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `MYSQL_ERRNO` int(11) NULL DEFAULT NULL,
  `RETURNED_SQLSTATE` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MESSAGE_TEXT` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ERRORS` bigint(20) UNSIGNED NOT NULL,
  `WARNINGS` bigint(20) UNSIGNED NOT NULL,
  `ROWS_AFFECTED` bigint(20) UNSIGNED NOT NULL,
  `ROWS_SENT` bigint(20) UNSIGNED NOT NULL,
  `ROWS_EXAMINED` bigint(20) UNSIGNED NOT NULL,
  `CREATED_TMP_DISK_TABLES` bigint(20) UNSIGNED NOT NULL,
  `CREATED_TMP_TABLES` bigint(20) UNSIGNED NOT NULL,
  `SELECT_FULL_JOIN` bigint(20) UNSIGNED NOT NULL,
  `SELECT_FULL_RANGE_JOIN` bigint(20) UNSIGNED NOT NULL,
  `SELECT_RANGE` bigint(20) UNSIGNED NOT NULL,
  `SELECT_RANGE_CHECK` bigint(20) UNSIGNED NOT NULL,
  `SELECT_SCAN` bigint(20) UNSIGNED NOT NULL,
  `SORT_MERGE_PASSES` bigint(20) UNSIGNED NOT NULL,
  `SORT_RANGE` bigint(20) UNSIGNED NOT NULL,
  `SORT_ROWS` bigint(20) UNSIGNED NOT NULL,
  `SORT_SCAN` bigint(20) UNSIGNED NOT NULL,
  `NO_INDEX_USED` bigint(20) UNSIGNED NOT NULL,
  `NO_GOOD_INDEX_USED` bigint(20) UNSIGNED NOT NULL,
  `NESTING_EVENT_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `NESTING_EVENT_TYPE` enum('STATEMENT','STAGE','WAIT') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_statements_summary_by_account_by_event_name
-- ----------------------------
DROP TABLE IF EXISTS `events_statements_summary_by_account_by_event_name`;
CREATE TABLE `events_statements_summary_by_account_by_event_name`  (
  `USER` char(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `SUM_LOCK_TIME` bigint(20) UNSIGNED NOT NULL,
  `SUM_ERRORS` bigint(20) UNSIGNED NOT NULL,
  `SUM_WARNINGS` bigint(20) UNSIGNED NOT NULL,
  `SUM_ROWS_AFFECTED` bigint(20) UNSIGNED NOT NULL,
  `SUM_ROWS_SENT` bigint(20) UNSIGNED NOT NULL,
  `SUM_ROWS_EXAMINED` bigint(20) UNSIGNED NOT NULL,
  `SUM_CREATED_TMP_DISK_TABLES` bigint(20) UNSIGNED NOT NULL,
  `SUM_CREATED_TMP_TABLES` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_FULL_JOIN` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_FULL_RANGE_JOIN` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_RANGE` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_RANGE_CHECK` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_SCAN` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_MERGE_PASSES` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_RANGE` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_ROWS` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_SCAN` bigint(20) UNSIGNED NOT NULL,
  `SUM_NO_INDEX_USED` bigint(20) UNSIGNED NOT NULL,
  `SUM_NO_GOOD_INDEX_USED` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_statements_summary_by_digest
-- ----------------------------
DROP TABLE IF EXISTS `events_statements_summary_by_digest`;
CREATE TABLE `events_statements_summary_by_digest`  (
  `SCHEMA_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DIGEST` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DIGEST_TEXT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `SUM_LOCK_TIME` bigint(20) UNSIGNED NOT NULL,
  `SUM_ERRORS` bigint(20) UNSIGNED NOT NULL,
  `SUM_WARNINGS` bigint(20) UNSIGNED NOT NULL,
  `SUM_ROWS_AFFECTED` bigint(20) UNSIGNED NOT NULL,
  `SUM_ROWS_SENT` bigint(20) UNSIGNED NOT NULL,
  `SUM_ROWS_EXAMINED` bigint(20) UNSIGNED NOT NULL,
  `SUM_CREATED_TMP_DISK_TABLES` bigint(20) UNSIGNED NOT NULL,
  `SUM_CREATED_TMP_TABLES` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_FULL_JOIN` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_FULL_RANGE_JOIN` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_RANGE` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_RANGE_CHECK` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_SCAN` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_MERGE_PASSES` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_RANGE` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_ROWS` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_SCAN` bigint(20) UNSIGNED NOT NULL,
  `SUM_NO_INDEX_USED` bigint(20) UNSIGNED NOT NULL,
  `SUM_NO_GOOD_INDEX_USED` bigint(20) UNSIGNED NOT NULL,
  `FIRST_SEEN` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_SEEN` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_statements_summary_by_host_by_event_name
-- ----------------------------
DROP TABLE IF EXISTS `events_statements_summary_by_host_by_event_name`;
CREATE TABLE `events_statements_summary_by_host_by_event_name`  (
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `SUM_LOCK_TIME` bigint(20) UNSIGNED NOT NULL,
  `SUM_ERRORS` bigint(20) UNSIGNED NOT NULL,
  `SUM_WARNINGS` bigint(20) UNSIGNED NOT NULL,
  `SUM_ROWS_AFFECTED` bigint(20) UNSIGNED NOT NULL,
  `SUM_ROWS_SENT` bigint(20) UNSIGNED NOT NULL,
  `SUM_ROWS_EXAMINED` bigint(20) UNSIGNED NOT NULL,
  `SUM_CREATED_TMP_DISK_TABLES` bigint(20) UNSIGNED NOT NULL,
  `SUM_CREATED_TMP_TABLES` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_FULL_JOIN` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_FULL_RANGE_JOIN` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_RANGE` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_RANGE_CHECK` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_SCAN` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_MERGE_PASSES` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_RANGE` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_ROWS` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_SCAN` bigint(20) UNSIGNED NOT NULL,
  `SUM_NO_INDEX_USED` bigint(20) UNSIGNED NOT NULL,
  `SUM_NO_GOOD_INDEX_USED` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_statements_summary_by_thread_by_event_name
-- ----------------------------
DROP TABLE IF EXISTS `events_statements_summary_by_thread_by_event_name`;
CREATE TABLE `events_statements_summary_by_thread_by_event_name`  (
  `THREAD_ID` bigint(20) UNSIGNED NOT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `SUM_LOCK_TIME` bigint(20) UNSIGNED NOT NULL,
  `SUM_ERRORS` bigint(20) UNSIGNED NOT NULL,
  `SUM_WARNINGS` bigint(20) UNSIGNED NOT NULL,
  `SUM_ROWS_AFFECTED` bigint(20) UNSIGNED NOT NULL,
  `SUM_ROWS_SENT` bigint(20) UNSIGNED NOT NULL,
  `SUM_ROWS_EXAMINED` bigint(20) UNSIGNED NOT NULL,
  `SUM_CREATED_TMP_DISK_TABLES` bigint(20) UNSIGNED NOT NULL,
  `SUM_CREATED_TMP_TABLES` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_FULL_JOIN` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_FULL_RANGE_JOIN` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_RANGE` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_RANGE_CHECK` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_SCAN` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_MERGE_PASSES` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_RANGE` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_ROWS` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_SCAN` bigint(20) UNSIGNED NOT NULL,
  `SUM_NO_INDEX_USED` bigint(20) UNSIGNED NOT NULL,
  `SUM_NO_GOOD_INDEX_USED` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_statements_summary_by_user_by_event_name
-- ----------------------------
DROP TABLE IF EXISTS `events_statements_summary_by_user_by_event_name`;
CREATE TABLE `events_statements_summary_by_user_by_event_name`  (
  `USER` char(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `SUM_LOCK_TIME` bigint(20) UNSIGNED NOT NULL,
  `SUM_ERRORS` bigint(20) UNSIGNED NOT NULL,
  `SUM_WARNINGS` bigint(20) UNSIGNED NOT NULL,
  `SUM_ROWS_AFFECTED` bigint(20) UNSIGNED NOT NULL,
  `SUM_ROWS_SENT` bigint(20) UNSIGNED NOT NULL,
  `SUM_ROWS_EXAMINED` bigint(20) UNSIGNED NOT NULL,
  `SUM_CREATED_TMP_DISK_TABLES` bigint(20) UNSIGNED NOT NULL,
  `SUM_CREATED_TMP_TABLES` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_FULL_JOIN` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_FULL_RANGE_JOIN` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_RANGE` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_RANGE_CHECK` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_SCAN` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_MERGE_PASSES` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_RANGE` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_ROWS` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_SCAN` bigint(20) UNSIGNED NOT NULL,
  `SUM_NO_INDEX_USED` bigint(20) UNSIGNED NOT NULL,
  `SUM_NO_GOOD_INDEX_USED` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_statements_summary_global_by_event_name
-- ----------------------------
DROP TABLE IF EXISTS `events_statements_summary_global_by_event_name`;
CREATE TABLE `events_statements_summary_global_by_event_name`  (
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `SUM_LOCK_TIME` bigint(20) UNSIGNED NOT NULL,
  `SUM_ERRORS` bigint(20) UNSIGNED NOT NULL,
  `SUM_WARNINGS` bigint(20) UNSIGNED NOT NULL,
  `SUM_ROWS_AFFECTED` bigint(20) UNSIGNED NOT NULL,
  `SUM_ROWS_SENT` bigint(20) UNSIGNED NOT NULL,
  `SUM_ROWS_EXAMINED` bigint(20) UNSIGNED NOT NULL,
  `SUM_CREATED_TMP_DISK_TABLES` bigint(20) UNSIGNED NOT NULL,
  `SUM_CREATED_TMP_TABLES` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_FULL_JOIN` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_FULL_RANGE_JOIN` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_RANGE` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_RANGE_CHECK` bigint(20) UNSIGNED NOT NULL,
  `SUM_SELECT_SCAN` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_MERGE_PASSES` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_RANGE` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_ROWS` bigint(20) UNSIGNED NOT NULL,
  `SUM_SORT_SCAN` bigint(20) UNSIGNED NOT NULL,
  `SUM_NO_INDEX_USED` bigint(20) UNSIGNED NOT NULL,
  `SUM_NO_GOOD_INDEX_USED` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_waits_current
-- ----------------------------
DROP TABLE IF EXISTS `events_waits_current`;
CREATE TABLE `events_waits_current`  (
  `THREAD_ID` bigint(20) UNSIGNED NOT NULL,
  `EVENT_ID` bigint(20) UNSIGNED NOT NULL,
  `END_EVENT_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SOURCE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TIMER_START` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `TIMER_END` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `TIMER_WAIT` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `SPINS` int(10) UNSIGNED NULL DEFAULT NULL,
  `OBJECT_SCHEMA` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_NAME` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INDEX_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_TYPE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) UNSIGNED NOT NULL,
  `NESTING_EVENT_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `NESTING_EVENT_TYPE` enum('STATEMENT','STAGE','WAIT') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OPERATION` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NUMBER_OF_BYTES` bigint(20) NULL DEFAULT NULL,
  `FLAGS` int(10) UNSIGNED NULL DEFAULT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_waits_history
-- ----------------------------
DROP TABLE IF EXISTS `events_waits_history`;
CREATE TABLE `events_waits_history`  (
  `THREAD_ID` bigint(20) UNSIGNED NOT NULL,
  `EVENT_ID` bigint(20) UNSIGNED NOT NULL,
  `END_EVENT_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SOURCE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TIMER_START` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `TIMER_END` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `TIMER_WAIT` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `SPINS` int(10) UNSIGNED NULL DEFAULT NULL,
  `OBJECT_SCHEMA` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_NAME` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INDEX_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_TYPE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) UNSIGNED NOT NULL,
  `NESTING_EVENT_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `NESTING_EVENT_TYPE` enum('STATEMENT','STAGE','WAIT') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OPERATION` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NUMBER_OF_BYTES` bigint(20) NULL DEFAULT NULL,
  `FLAGS` int(10) UNSIGNED NULL DEFAULT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_waits_history_long
-- ----------------------------
DROP TABLE IF EXISTS `events_waits_history_long`;
CREATE TABLE `events_waits_history_long`  (
  `THREAD_ID` bigint(20) UNSIGNED NOT NULL,
  `EVENT_ID` bigint(20) UNSIGNED NOT NULL,
  `END_EVENT_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SOURCE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TIMER_START` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `TIMER_END` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `TIMER_WAIT` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `SPINS` int(10) UNSIGNED NULL DEFAULT NULL,
  `OBJECT_SCHEMA` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_NAME` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INDEX_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_TYPE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) UNSIGNED NOT NULL,
  `NESTING_EVENT_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `NESTING_EVENT_TYPE` enum('STATEMENT','STAGE','WAIT') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OPERATION` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NUMBER_OF_BYTES` bigint(20) NULL DEFAULT NULL,
  `FLAGS` int(10) UNSIGNED NULL DEFAULT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_waits_summary_by_account_by_event_name
-- ----------------------------
DROP TABLE IF EXISTS `events_waits_summary_by_account_by_event_name`;
CREATE TABLE `events_waits_summary_by_account_by_event_name`  (
  `USER` char(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_waits_summary_by_host_by_event_name
-- ----------------------------
DROP TABLE IF EXISTS `events_waits_summary_by_host_by_event_name`;
CREATE TABLE `events_waits_summary_by_host_by_event_name`  (
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_waits_summary_by_instance
-- ----------------------------
DROP TABLE IF EXISTS `events_waits_summary_by_instance`;
CREATE TABLE `events_waits_summary_by_instance`  (
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) UNSIGNED NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_waits_summary_by_thread_by_event_name
-- ----------------------------
DROP TABLE IF EXISTS `events_waits_summary_by_thread_by_event_name`;
CREATE TABLE `events_waits_summary_by_thread_by_event_name`  (
  `THREAD_ID` bigint(20) UNSIGNED NOT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_waits_summary_by_user_by_event_name
-- ----------------------------
DROP TABLE IF EXISTS `events_waits_summary_by_user_by_event_name`;
CREATE TABLE `events_waits_summary_by_user_by_event_name`  (
  `USER` char(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events_waits_summary_global_by_event_name
-- ----------------------------
DROP TABLE IF EXISTS `events_waits_summary_global_by_event_name`;
CREATE TABLE `events_waits_summary_global_by_event_name`  (
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file_instances
-- ----------------------------
DROP TABLE IF EXISTS `file_instances`;
CREATE TABLE `file_instances`  (
  `FILE_NAME` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `OPEN_COUNT` int(10) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file_summary_by_event_name
-- ----------------------------
DROP TABLE IF EXISTS `file_summary_by_event_name`;
CREATE TABLE `file_summary_by_event_name`  (
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `COUNT_READ` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `SUM_NUMBER_OF_BYTES_READ` bigint(20) NOT NULL,
  `COUNT_WRITE` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `SUM_NUMBER_OF_BYTES_WRITE` bigint(20) NOT NULL,
  `COUNT_MISC` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_MISC` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_MISC` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_MISC` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_MISC` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file_summary_by_instance
-- ----------------------------
DROP TABLE IF EXISTS `file_summary_by_instance`;
CREATE TABLE `file_summary_by_instance`  (
  `FILE_NAME` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) UNSIGNED NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `COUNT_READ` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `SUM_NUMBER_OF_BYTES_READ` bigint(20) NOT NULL,
  `COUNT_WRITE` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `SUM_NUMBER_OF_BYTES_WRITE` bigint(20) NOT NULL,
  `COUNT_MISC` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_MISC` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_MISC` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_MISC` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_MISC` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for host_cache
-- ----------------------------
DROP TABLE IF EXISTS `host_cache`;
CREATE TABLE `host_cache`  (
  `IP` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `HOST` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HOST_VALIDATED` enum('YES','NO') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SUM_CONNECT_ERRORS` bigint(20) NOT NULL,
  `COUNT_HOST_BLOCKED_ERRORS` bigint(20) NOT NULL,
  `COUNT_NAMEINFO_TRANSIENT_ERRORS` bigint(20) NOT NULL,
  `COUNT_NAMEINFO_PERMANENT_ERRORS` bigint(20) NOT NULL,
  `COUNT_FORMAT_ERRORS` bigint(20) NOT NULL,
  `COUNT_ADDRINFO_TRANSIENT_ERRORS` bigint(20) NOT NULL,
  `COUNT_ADDRINFO_PERMANENT_ERRORS` bigint(20) NOT NULL,
  `COUNT_FCRDNS_ERRORS` bigint(20) NOT NULL,
  `COUNT_HOST_ACL_ERRORS` bigint(20) NOT NULL,
  `COUNT_NO_AUTH_PLUGIN_ERRORS` bigint(20) NOT NULL,
  `COUNT_AUTH_PLUGIN_ERRORS` bigint(20) NOT NULL,
  `COUNT_HANDSHAKE_ERRORS` bigint(20) NOT NULL,
  `COUNT_PROXY_USER_ERRORS` bigint(20) NOT NULL,
  `COUNT_PROXY_USER_ACL_ERRORS` bigint(20) NOT NULL,
  `COUNT_AUTHENTICATION_ERRORS` bigint(20) NOT NULL,
  `COUNT_SSL_ERRORS` bigint(20) NOT NULL,
  `COUNT_MAX_USER_CONNECTIONS_ERRORS` bigint(20) NOT NULL,
  `COUNT_MAX_USER_CONNECTIONS_PER_HOUR_ERRORS` bigint(20) NOT NULL,
  `COUNT_DEFAULT_DATABASE_ERRORS` bigint(20) NOT NULL,
  `COUNT_INIT_CONNECT_ERRORS` bigint(20) NOT NULL,
  `COUNT_LOCAL_ERRORS` bigint(20) NOT NULL,
  `COUNT_UNKNOWN_ERRORS` bigint(20) NOT NULL,
  `FIRST_SEEN` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_SEEN` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `FIRST_ERROR_SEEN` timestamp(0) NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_ERROR_SEEN` timestamp(0) NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hosts
-- ----------------------------
DROP TABLE IF EXISTS `hosts`;
CREATE TABLE `hosts`  (
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CURRENT_CONNECTIONS` bigint(20) NOT NULL,
  `TOTAL_CONNECTIONS` bigint(20) NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for mutex_instances
-- ----------------------------
DROP TABLE IF EXISTS `mutex_instances`;
CREATE TABLE `mutex_instances`  (
  `NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) UNSIGNED NOT NULL,
  `LOCKED_BY_THREAD_ID` bigint(20) UNSIGNED NULL DEFAULT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for objects_summary_global_by_type
-- ----------------------------
DROP TABLE IF EXISTS `objects_summary_global_by_type`;
CREATE TABLE `objects_summary_global_by_type`  (
  `OBJECT_TYPE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_SCHEMA` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for performance_timers
-- ----------------------------
DROP TABLE IF EXISTS `performance_timers`;
CREATE TABLE `performance_timers`  (
  `TIMER_NAME` enum('CYCLE','NANOSECOND','MICROSECOND','MILLISECOND','TICK') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIMER_FREQUENCY` bigint(20) NULL DEFAULT NULL,
  `TIMER_RESOLUTION` bigint(20) NULL DEFAULT NULL,
  `TIMER_OVERHEAD` bigint(20) NULL DEFAULT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for rwlock_instances
-- ----------------------------
DROP TABLE IF EXISTS `rwlock_instances`;
CREATE TABLE `rwlock_instances`  (
  `NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) UNSIGNED NOT NULL,
  `WRITE_LOCKED_BY_THREAD_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `READ_LOCKED_BY_COUNT` int(10) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for session_account_connect_attrs
-- ----------------------------
DROP TABLE IF EXISTS `session_account_connect_attrs`;
CREATE TABLE `session_account_connect_attrs`  (
  `PROCESSLIST_ID` int(11) NOT NULL,
  `ATTR_NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ATTR_VALUE` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ORDINAL_POSITION` int(11) NULL DEFAULT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for session_connect_attrs
-- ----------------------------
DROP TABLE IF EXISTS `session_connect_attrs`;
CREATE TABLE `session_connect_attrs`  (
  `PROCESSLIST_ID` int(11) NOT NULL,
  `ATTR_NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ATTR_VALUE` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ORDINAL_POSITION` int(11) NULL DEFAULT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for setup_actors
-- ----------------------------
DROP TABLE IF EXISTS `setup_actors`;
CREATE TABLE `setup_actors`  (
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '%',
  `USER` char(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '%',
  `ROLE` char(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '%'
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for setup_consumers
-- ----------------------------
DROP TABLE IF EXISTS `setup_consumers`;
CREATE TABLE `setup_consumers`  (
  `NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENABLED` enum('YES','NO') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for setup_instruments
-- ----------------------------
DROP TABLE IF EXISTS `setup_instruments`;
CREATE TABLE `setup_instruments`  (
  `NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENABLED` enum('YES','NO') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIMED` enum('YES','NO') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for setup_objects
-- ----------------------------
DROP TABLE IF EXISTS `setup_objects`;
CREATE TABLE `setup_objects`  (
  `OBJECT_TYPE` enum('TABLE') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'TABLE',
  `OBJECT_SCHEMA` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '%',
  `OBJECT_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '%',
  `ENABLED` enum('YES','NO') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'YES',
  `TIMED` enum('YES','NO') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'YES'
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for setup_timers
-- ----------------------------
DROP TABLE IF EXISTS `setup_timers`;
CREATE TABLE `setup_timers`  (
  `NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIMER_NAME` enum('CYCLE','NANOSECOND','MICROSECOND','MILLISECOND','TICK') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for socket_instances
-- ----------------------------
DROP TABLE IF EXISTS `socket_instances`;
CREATE TABLE `socket_instances`  (
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) UNSIGNED NOT NULL,
  `THREAD_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `SOCKET_ID` int(11) NOT NULL,
  `IP` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PORT` int(11) NOT NULL,
  `STATE` enum('IDLE','ACTIVE') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for socket_summary_by_event_name
-- ----------------------------
DROP TABLE IF EXISTS `socket_summary_by_event_name`;
CREATE TABLE `socket_summary_by_event_name`  (
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `COUNT_READ` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `SUM_NUMBER_OF_BYTES_READ` bigint(20) UNSIGNED NOT NULL,
  `COUNT_WRITE` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `SUM_NUMBER_OF_BYTES_WRITE` bigint(20) UNSIGNED NOT NULL,
  `COUNT_MISC` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_MISC` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_MISC` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_MISC` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_MISC` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for socket_summary_by_instance
-- ----------------------------
DROP TABLE IF EXISTS `socket_summary_by_instance`;
CREATE TABLE `socket_summary_by_instance`  (
  `EVENT_NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint(20) UNSIGNED NOT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `COUNT_READ` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `SUM_NUMBER_OF_BYTES_READ` bigint(20) UNSIGNED NOT NULL,
  `COUNT_WRITE` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `SUM_NUMBER_OF_BYTES_WRITE` bigint(20) UNSIGNED NOT NULL,
  `COUNT_MISC` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_MISC` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_MISC` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_MISC` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_MISC` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for table_io_waits_summary_by_index_usage
-- ----------------------------
DROP TABLE IF EXISTS `table_io_waits_summary_by_index_usage`;
CREATE TABLE `table_io_waits_summary_by_index_usage`  (
  `OBJECT_TYPE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_SCHEMA` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INDEX_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `COUNT_READ` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `COUNT_WRITE` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `COUNT_FETCH` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_FETCH` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_FETCH` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_FETCH` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_FETCH` bigint(20) UNSIGNED NOT NULL,
  `COUNT_INSERT` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_INSERT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_INSERT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_INSERT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_INSERT` bigint(20) UNSIGNED NOT NULL,
  `COUNT_UPDATE` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_UPDATE` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_UPDATE` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_UPDATE` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_UPDATE` bigint(20) UNSIGNED NOT NULL,
  `COUNT_DELETE` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_DELETE` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_DELETE` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_DELETE` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_DELETE` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for table_io_waits_summary_by_table
-- ----------------------------
DROP TABLE IF EXISTS `table_io_waits_summary_by_table`;
CREATE TABLE `table_io_waits_summary_by_table`  (
  `OBJECT_TYPE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_SCHEMA` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `COUNT_READ` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `COUNT_WRITE` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `COUNT_FETCH` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_FETCH` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_FETCH` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_FETCH` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_FETCH` bigint(20) UNSIGNED NOT NULL,
  `COUNT_INSERT` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_INSERT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_INSERT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_INSERT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_INSERT` bigint(20) UNSIGNED NOT NULL,
  `COUNT_UPDATE` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_UPDATE` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_UPDATE` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_UPDATE` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_UPDATE` bigint(20) UNSIGNED NOT NULL,
  `COUNT_DELETE` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_DELETE` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_DELETE` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_DELETE` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_DELETE` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for table_lock_waits_summary_by_table
-- ----------------------------
DROP TABLE IF EXISTS `table_lock_waits_summary_by_table`;
CREATE TABLE `table_lock_waits_summary_by_table`  (
  `OBJECT_TYPE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_SCHEMA` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OBJECT_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COUNT_STAR` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WAIT` bigint(20) UNSIGNED NOT NULL,
  `COUNT_READ` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_READ` bigint(20) UNSIGNED NOT NULL,
  `COUNT_WRITE` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WRITE` bigint(20) UNSIGNED NOT NULL,
  `COUNT_READ_NORMAL` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_READ_NORMAL` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_READ_NORMAL` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_READ_NORMAL` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_READ_NORMAL` bigint(20) UNSIGNED NOT NULL,
  `COUNT_READ_WITH_SHARED_LOCKS` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_READ_WITH_SHARED_LOCKS` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_READ_WITH_SHARED_LOCKS` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_READ_WITH_SHARED_LOCKS` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_READ_WITH_SHARED_LOCKS` bigint(20) UNSIGNED NOT NULL,
  `COUNT_READ_HIGH_PRIORITY` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_READ_HIGH_PRIORITY` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_READ_HIGH_PRIORITY` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_READ_HIGH_PRIORITY` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_READ_HIGH_PRIORITY` bigint(20) UNSIGNED NOT NULL,
  `COUNT_READ_NO_INSERT` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_READ_NO_INSERT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_READ_NO_INSERT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_READ_NO_INSERT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_READ_NO_INSERT` bigint(20) UNSIGNED NOT NULL,
  `COUNT_READ_EXTERNAL` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_READ_EXTERNAL` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_READ_EXTERNAL` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_READ_EXTERNAL` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_READ_EXTERNAL` bigint(20) UNSIGNED NOT NULL,
  `COUNT_WRITE_ALLOW_WRITE` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WRITE_ALLOW_WRITE` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WRITE_ALLOW_WRITE` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WRITE_ALLOW_WRITE` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WRITE_ALLOW_WRITE` bigint(20) UNSIGNED NOT NULL,
  `COUNT_WRITE_CONCURRENT_INSERT` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WRITE_CONCURRENT_INSERT` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WRITE_CONCURRENT_INSERT` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WRITE_CONCURRENT_INSERT` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WRITE_CONCURRENT_INSERT` bigint(20) UNSIGNED NOT NULL,
  `COUNT_WRITE_DELAYED` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WRITE_DELAYED` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WRITE_DELAYED` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WRITE_DELAYED` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WRITE_DELAYED` bigint(20) UNSIGNED NOT NULL,
  `COUNT_WRITE_LOW_PRIORITY` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WRITE_LOW_PRIORITY` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WRITE_LOW_PRIORITY` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WRITE_LOW_PRIORITY` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WRITE_LOW_PRIORITY` bigint(20) UNSIGNED NOT NULL,
  `COUNT_WRITE_NORMAL` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WRITE_NORMAL` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WRITE_NORMAL` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WRITE_NORMAL` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WRITE_NORMAL` bigint(20) UNSIGNED NOT NULL,
  `COUNT_WRITE_EXTERNAL` bigint(20) UNSIGNED NOT NULL,
  `SUM_TIMER_WRITE_EXTERNAL` bigint(20) UNSIGNED NOT NULL,
  `MIN_TIMER_WRITE_EXTERNAL` bigint(20) UNSIGNED NOT NULL,
  `AVG_TIMER_WRITE_EXTERNAL` bigint(20) UNSIGNED NOT NULL,
  `MAX_TIMER_WRITE_EXTERNAL` bigint(20) UNSIGNED NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for threads
-- ----------------------------
DROP TABLE IF EXISTS `threads`;
CREATE TABLE `threads`  (
  `THREAD_ID` bigint(20) UNSIGNED NOT NULL,
  `NAME` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PROCESSLIST_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `PROCESSLIST_USER` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROCESSLIST_HOST` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROCESSLIST_DB` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROCESSLIST_COMMAND` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROCESSLIST_TIME` bigint(20) NULL DEFAULT NULL,
  `PROCESSLIST_STATE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROCESSLIST_INFO` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `PARENT_THREAD_ID` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `ROLE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INSTRUMENTED` enum('YES','NO') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `USER` char(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CURRENT_CONNECTIONS` bigint(20) NOT NULL,
  `TOTAL_CONNECTIONS` bigint(20) NOT NULL
) ENGINE = PERFORMANCE_SCHEMA CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

SET FOREIGN_KEY_CHECKS = 1;
