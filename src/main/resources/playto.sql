/*
Navicat MariaDB Data Transfer

Source Server         : localhost
Source Server Version : 100111
Source Host           : localhost:3306
Source Database       : playto

Target Server Type    : MariaDB
Target Server Version : 100111
File Encoding         : 65001

Date: 2016-02-22 01:25:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for korean_battle_answer
-- ----------------------------
DROP TABLE IF EXISTS `korean_battle_answer`;
CREATE TABLE `korean_battle_answer` (
  `TEAM_CODE` varchar(5) NOT NULL,
  `ANSWER_1` varchar(1024) DEFAULT NULL,
  `ANSWER_2` varchar(1024) DEFAULT NULL,
  `ANSWER_3` varchar(1024) DEFAULT NULL,
  `ANSWER_4` varchar(1024) DEFAULT NULL,
  `ANSWER_5` varchar(1024) DEFAULT NULL,
  `ANSWER_6` varchar(1024) DEFAULT NULL,
  `ANSWER_7` varchar(1024) DEFAULT NULL,
  `ANSWER_8` varchar(1024) DEFAULT NULL,
  `ANSWER_9` varchar(1024) DEFAULT NULL,
  `ANSWER_10` varchar(1024) DEFAULT NULL,
  `ANSWER_FILE` varchar(2014) DEFAULT NULL,
  `ANSWER_IMAGE` longblob,
  `ANSWER_DT` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TEAM_CODE`,`ANSWER_DT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='우리말 겨루기 각 팀별(4개팀) 제출 답안';

-- ----------------------------
-- Records of korean_battle_answer
-- ----------------------------

-- ----------------------------
-- Table structure for korean_battle_quiz
-- ----------------------------
DROP TABLE IF EXISTS `korean_battle_quiz`;
CREATE TABLE `korean_battle_quiz` (
  `NUM` int(11) NOT NULL AUTO_INCREMENT,
  `TEXT_1` varchar(1024) DEFAULT NULL COMMENT '우리말겨루기 문제',
  `TEXT_2` varchar(1024) DEFAULT NULL,
  `TEXT_3` varchar(1024) DEFAULT NULL,
  `TEXT_4` varchar(1024) DEFAULT NULL,
  `TEXT_5` varchar(1024) DEFAULT NULL,
  `TEXT_6` varchar(1024) DEFAULT NULL,
  `TEXT_7` varchar(1024) DEFAULT NULL,
  `TEXT_8` varchar(1024) DEFAULT NULL,
  `TEXT_9` varchar(1024) DEFAULT NULL,
  `TEXT_10` varchar(1024) DEFAULT NULL,
  `ANSWER_1` varchar(1024) DEFAULT NULL COMMENT '우리말겨루기 답안',
  `ANSWER_2` varchar(1024) DEFAULT NULL,
  `ANSWER_3` varchar(1024) DEFAULT NULL,
  `ANSWER_4` varchar(1024) DEFAULT NULL,
  `ANSWER_5` varchar(1024) DEFAULT NULL,
  `ANSWER_6` varchar(1024) DEFAULT NULL,
  `ANSWER_7` varchar(1024) DEFAULT NULL,
  `ANSWER_8` varchar(1024) DEFAULT NULL,
  `ANSWER_9` varchar(1024) DEFAULT NULL,
  `ANSWER_10` varchar(1024) DEFAULT NULL,
  `PROCESS_YN` tinyint(1) DEFAULT NULL COMMENT '우리말겨루기 진행여부',
  PRIMARY KEY (`NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='우리말겨루기 출제문제 및 답안';

-- ----------------------------
-- Records of korean_battle_quiz
-- ----------------------------
INSERT INTO `korean_battle_quiz` VALUES ('1', '저만치 골목 막다른 곳에, 누런 시멘트 부대 종이를 흰 실로 얼기설기', '문살에 얽어 맨 철호네 집 방문이 보였다. 철호는 때에 절어서 마치', '가죽끈처럼 된 헝겊이 달린 문걸쇠를 잡아당겼다. 손가락이라도', '드나들만치 엉성한 문이면서 찌걱찌걱 집혀서 잘 열리지를 않았다.', '아래가 잔뜩 잡힌 채 비틀어진 문틈으로 그의 어머니의 소리가 새어 나왔다.', '“가자! 가자!”', '미치면 목소리마저 변하는 모양이었다. 그것은 이미 그의 어머니의 조용하고', '부드럽던 그 목소리가 아니고, 쨍쨍하고 간사한 게 어떤 딴 사람의 목소리였다.', null, null, null, null, null, '', null, null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for quiz_chance
-- ----------------------------
DROP TABLE IF EXISTS `quiz_chance`;
CREATE TABLE `quiz_chance` (
  `QUIZ_NUM` int(11) NOT NULL,
  `TEAM_SEQ` int(11) NOT NULL,
  `CHANCE_TYPE` int(11) NOT NULL,
  `AGREE_CHANCE` int(11) DEFAULT NULL,
  `REG_DT` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`QUIZ_NUM`,`TEAM_SEQ`,`CHANCE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quiz_chance
-- ----------------------------

-- ----------------------------
-- Table structure for quiz_info
-- ----------------------------
DROP TABLE IF EXISTS `quiz_info`;
CREATE TABLE `quiz_info` (
  `NUM` int(11) NOT NULL,
  `QUIZ_TYPE` tinyint(4) NOT NULL COMMENT '1.객관식, 2.OX 3.주관식',
  `QUIZ_TEXT` varchar(2048) NOT NULL,
  `EXAMPLE_1` varchar(2048) DEFAULT NULL,
  `EXAMPLE_2` varchar(2048) DEFAULT NULL,
  `EXAMPLE_3` varchar(2048) DEFAULT NULL,
  `EXAMPLE_4` varchar(2048) DEFAULT NULL,
  `ANSWER` varchar(2048) DEFAULT NULL COMMENT '답안',
  `HINT` text,
  `SCORE` int(11) DEFAULT NULL COMMENT '문제 점수',
  `PROCESS_YN` tinyint(4) DEFAULT NULL COMMENT '1. 진행상태',
  `BEGIN_DT` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `END_DT` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `PRIORITY_TEAM_SEQ` int(11) DEFAULT NULL,
  `PRIORITY_YN` tinyint(4) DEFAULT NULL,
  `DOUBLE_TEAM_SEQ` int(11) DEFAULT NULL,
  `DOUBLE_YN` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quiz_info
-- ----------------------------
INSERT INTO `quiz_info` VALUES ('1', '1', '1번 문제', '1번 예제', '2번 예제', '3번 예제', '4번 예제', '2', null, '10', null, '2016-02-22 01:25:34', '2016-02-22 01:25:34', null, null, null, null);
INSERT INTO `quiz_info` VALUES ('2', '2', '1번 문제', '1번 예제', '2번 예제', '3번 예제', '4번 예제', 'O', null, '20', null, '2016-02-21 21:21:48', '2016-02-21 21:21:48', null, null, null, null);
INSERT INTO `quiz_info` VALUES ('3', '3', '1번 문제', '1번 예제', '2번 예제', '3번 예제', '4번 예제', '2', null, '30', null, '2016-02-21 21:21:50', '2016-02-21 21:21:50', null, null, null, null);
INSERT INTO `quiz_info` VALUES ('4', '1', '1번 문제', '1번 예제', '2번 예제', '3번 예제', '4번 예제', '2', null, '10', null, '2016-02-22 00:23:44', '2016-02-22 00:23:44', null, null, null, null);
INSERT INTO `quiz_info` VALUES ('5', '2', '1번 문제', '1번 예제', '2번 예제', '3번 예제', '4번 예제', '2', null, '20', null, '2016-02-22 00:23:50', '2016-02-22 00:23:50', null, null, null, null);
INSERT INTO `quiz_info` VALUES ('6', '3', '1번 문제', '1번 예제', '2번 예제', '3번 예제', '4번 예제', '2', null, '30', null, '2016-02-22 00:23:45', '2016-02-22 00:23:45', null, null, null, null);

-- ----------------------------
-- Table structure for quiz_process
-- ----------------------------
DROP TABLE IF EXISTS `quiz_process`;
CREATE TABLE `quiz_process` (
  `NUM` int(11) DEFAULT NULL,
  `QUIZ_NUM` int(11) DEFAULT NULL,
  `QUIZ_END` tinyint(4) DEFAULT NULL,
  `QUIZ_DT` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quiz_process
-- ----------------------------
INSERT INTO `quiz_process` VALUES ('1', '0', '0', '2016-02-22 01:24:04');

-- ----------------------------
-- Table structure for quiz_score
-- ----------------------------
DROP TABLE IF EXISTS `quiz_score`;
CREATE TABLE `quiz_score` (
  `TEAM_SEQ` int(11) NOT NULL,
  `QUIZ_NUM` int(11) NOT NULL,
  `QUIZ_ANSWER` text,
  `SCORE` int(11) DEFAULT '0',
  `CHANCE_1` tinyint(4) DEFAULT '0' COMMENT '우선권카드',
  `CHANCE_2` tinyint(4) DEFAULT '0' COMMENT '영상힌트카트',
  `CHANCE_3` tinyint(4) DEFAULT '0' COMMENT '더블점수카드',
  `CHANCE_4` tinyint(4) DEFAULT '0' COMMENT '더블찬스카드',
  `CHANCE_5` tinyint(4) DEFAULT '0' COMMENT '미정',
  `CHANCE_6` tinyint(4) DEFAULT '0' COMMENT '미정',
  `QUIZ_DT` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TEAM_SEQ`,`QUIZ_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='3단계 퀴즈 문제 각팀별(20개 학교) 제출 답안 및 점수';

-- ----------------------------
-- Records of quiz_score
-- ----------------------------

-- ----------------------------
-- Table structure for team_info
-- ----------------------------
DROP TABLE IF EXISTS `team_info`;
CREATE TABLE `team_info` (
  `SEQ` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `SCHOOL_NAME` varchar(255) NOT NULL,
  `BASE_SCORE` int(11) DEFAULT NULL,
  `RANK_SCORE` int(11) DEFAULT '0',
  `CHANCE_1` int(11) DEFAULT '0',
  `CHANCE_2` int(11) DEFAULT '0',
  `CHANCE_3` int(11) DEFAULT '0',
  `CHANCE_4` int(11) DEFAULT '0',
  `CHANCE_5` int(11) DEFAULT '0',
  `CHANCE_6` int(11) DEFAULT '0',
  `TEAM_CODE` varchar(5) DEFAULT NULL COMMENT '팀코드 A,B,C,D',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='참여 학교 기본 정보 및 기본 점수';

-- ----------------------------
-- Records of team_info
-- ----------------------------
INSERT INTO `team_info` VALUES ('1', '책들아 놀자 1팀 : 아자 아자 화이팅!!', '놀자 1학교', '10', '0', '1', '1', '1', '1', '0', '0', 'A');
INSERT INTO `team_info` VALUES ('2', '책들아 놀자 2팀', '놀자 2학교', '20', '0', '0', '0', '1', '0', '0', '0', 'B');
INSERT INTO `team_info` VALUES ('3', '책들아 놀자 3팀 : 아자 아자 화이팅!!', '놀자 3학교', '30', '0', '0', '1', '0', '0', '0', '0', 'C');
INSERT INTO `team_info` VALUES ('4', '책들아 놀자 4팀 : 아자 아자 화이팅!!', '놀자 4학교', '40', '0', '0', '1', '0', '0', '0', '0', 'D');
INSERT INTO `team_info` VALUES ('5', '책들아 놀자 5팀 : 아자 아자 화이팅!!', '놀자 5학교', '50', '0', '0', '0', '1', '0', '0', '0', 'A');
INSERT INTO `team_info` VALUES ('6', '책들아 놀자 6팀 : 아자 아자 화이팅!!', '놀자 6학교', '60', '0', '0', '1', '0', '0', '0', '0', 'B');
INSERT INTO `team_info` VALUES ('7', '책들아 놀자 7팀 : 아자 아자 화이팅!!', '놀자 7학교', '70', '0', '0', '0', '1', '0', '0', '0', 'C');
INSERT INTO `team_info` VALUES ('8', '책들아 놀자 8팀 : 아자 아자 화이팅!!', '놀자 8학교', '80', '0', '0', '0', '1', '0', '0', '0', 'D');
INSERT INTO `team_info` VALUES ('9', '책들아 놀자 9팀 : 아자 아자 화이팅!!', '놀자 9학교', '90', '0', '0', '0', '1', '0', '0', '0', 'A');
INSERT INTO `team_info` VALUES ('10', '책들아 놀자 10팀 : 아자 아자 화이팅!!', '놀자 10학교', '100', '0', '1', '0', '1', '1', '0', '0', 'B');
INSERT INTO `team_info` VALUES ('11', '책들아 놀자 11팀 : 아자 아자 화이팅!!', '놀자 11학교', '110', '0', '0', '0', '1', '0', '0', '0', 'C');
INSERT INTO `team_info` VALUES ('12', '책들아 놀자 12팀 : 아자 아자 화이팅!!', '놀자 12학교', '120', '0', '0', '0', '1', '0', '0', '0', 'D');
INSERT INTO `team_info` VALUES ('13', '책들아 놀자 13팀 : 아자 아자 화이팅!!', '놀자 13학교', '130', '0', '0', '0', '1', '0', '0', '0', 'A');
INSERT INTO `team_info` VALUES ('14', '책들아 놀자 14팀 : 아자 아자 화이팅!!', '놀자 14학교', '140', '0', '0', '0', '1', '0', '0', '0', 'B');
INSERT INTO `team_info` VALUES ('15', '책들아 놀자 15팀 : 아자 아자 화이팅!!', '놀자 15학교', '150', '0', '0', '0', '1', '0', '0', '0', 'C');
INSERT INTO `team_info` VALUES ('16', '책들아 놀자 16팀 : 아자 아자 화이팅!!', '놀자 16학교', '160', '0', '0', '0', '1', '0', '0', '0', 'D');
INSERT INTO `team_info` VALUES ('17', '책들아 놀자 17팀 : 아자 아자 화이팅!!', '놀자 17학교', '170', '0', '0', '0', '1', '0', '0', '0', 'A');
INSERT INTO `team_info` VALUES ('18', '책들아 놀자 18팀 : 아자 아자 화이팅!!', '놀자 18학교', '180', '0', '0', '0', '1', '0', '0', '0', 'B');
INSERT INTO `team_info` VALUES ('19', '책들아 놀자 19팀 : 아자 아자 화이팅!!', '놀자 19학교', '190', '0', '0', '0', '1', '0', '0', '0', 'C');
INSERT INTO `team_info` VALUES ('20', '책들아 놀자 20팀 : 아자 아자 화이팅!!', '놀자 20학교', '200', '0', '0', '0', '1', '0', '0', '0', 'D');

-- ----------------------------
-- Table structure for working_memory
-- ----------------------------
DROP TABLE IF EXISTS `working_memory`;
CREATE TABLE `working_memory` (
  `TEAM_CODE` varchar(5) NOT NULL COMMENT '팀명 A,B,C,D',
  `XY_1` varchar(5) DEFAULT NULL,
  `XY_2` varchar(5) DEFAULT NULL,
  `XY_3` varchar(5) DEFAULT NULL,
  `XY_4` varchar(5) DEFAULT NULL,
  `XY_5` varchar(5) DEFAULT NULL,
  `XY_6` varchar(5) DEFAULT NULL,
  `XY_7` varchar(5) DEFAULT NULL,
  `XY_8` varchar(5) DEFAULT NULL,
  `XY_9` varchar(5) DEFAULT NULL,
  `XY_10` varchar(5) DEFAULT NULL,
  `XY_11` varchar(5) DEFAULT NULL,
  `XY_12` varchar(5) DEFAULT NULL,
  `XY_13` varchar(5) DEFAULT NULL,
  `XY_14` varchar(5) DEFAULT NULL,
  `XY_15` varchar(5) DEFAULT NULL,
  `XY_16` varchar(5) DEFAULT NULL,
  `XY_17` varchar(5) DEFAULT NULL,
  `XY_18` varchar(5) DEFAULT NULL,
  `XY_19` varchar(5) DEFAULT NULL,
  `XY_20` varchar(5) DEFAULT NULL,
  `WORKING_FILE` varchar(1024) DEFAULT NULL,
  `WORKING_IMAGE` longblob,
  `WORKING_DT` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TEAM_CODE`,`WORKING_DT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='워킹메모리 팀별(A,B,C,D 4개팀) 제출 답안';

-- ----------------------------
-- Records of working_memory
-- ----------------------------
