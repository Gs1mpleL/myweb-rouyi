-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ry-cloud
-- ------------------------------------------------------
-- Server version	5.7.44

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
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (1,'spider_bilibili','bilibili用户信息',NULL,NULL,'SpiderBilibili','crud','element-ui','com.ruoyi.spider','system','bilibili','bilibili用户信息','ruoyi','0','/','{}','admin','2025-01-21 10:51:21','','2025-01-21 10:52:34',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (1,1,'id',NULL,'int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-01-21 10:51:21','','2025-01-21 10:52:34'),(2,1,'user_id',NULL,'int','Long','userId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2025-01-21 10:51:21','','2025-01-21 10:52:34'),(3,1,'cookie',NULL,'varchar(255)','String','cookie','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2025-01-21 10:51:21','','2025-01-21 10:52:34'),(4,1,'refresh_token',NULL,'varchar(255)','String','refreshToken','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2025-01-21 10:51:21','','2025-01-21 10:52:34');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learn_blog`
--

DROP TABLE IF EXISTS `learn_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learn_blog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '博客ID',
  `user_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL COMMENT '分类ID',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '博客标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '博客内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='博客表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learn_blog`
--

LOCK TABLES `learn_blog` WRITE;
/*!40000 ALTER TABLE `learn_blog` DISABLE KEYS */;
INSERT INTO `learn_blog` VALUES (1,100,1,'Git分支合并t','# 分支合并\n`当某个功能分支测试完成后，将该分支内容合并入主分支`\n\n1. 切换到主分支\n```bash\ngit checkout master\n```\n2. 拉取最新的 master 分支代码\n```bash\ngit pull origin master\n```\n3. 合并开发分支到 master 分支,假设开发分支为develop\n```bash\ngit merge develop\n```\n4.推送合并后的 master 分支到远程仓库\n```bash\ngit push origin master\n```\n5. 删除本地分支\n```bash\ngit branch -d develop\n```\n6.删除远程分支\n```bash\ngit push origin --delete develop\n\n```\n\n\n\n\n','2025-01-26 19:06:00','2025-02-15 23:41:48','0'),(2,1,1,'Git提交规范','\n# Git提交规范\n- feat：新增功能（Feature）\n示例：feat: 添加用户登录功能\n解释：这次提交主要增加了新的功能或特性。\n- fix：修复 bug\n示例：fix: 修复用户登录时的密码验证问题\n解释：这次提交主要用于修复已知的问题或错误。\n- refactor：代码重构\n示例：refactor: 优化用户模块的代码结构\n解释：这次提交不增加新功能也不修复 bug，而是对现有代码进行优化或重构，提高代码质量和可维护性。\n- docs：文档更新\n示例：docs: 更新用户登录功能的文档\n解释：这次提交主要涉及文档的更新或添加，如 README 文件、API 文档等。\n- test：添加或更新测试用例\n示例：test: 增加用户登录功能的单元测试\n解释：这次提交主要涉及测试代码的添加或修改，确保功能的正确性和稳定性。\n- chore：常规维护任务\n示例：chore: 更新项目依赖\n解释：这次提交涉及项目的常规维护任务，如更新依赖库、配置文件等。\n- style：代码风格调整\n示例：style: 调整代码缩进和格式\n解释：这次提交主要涉及代码风格的调整，如缩进、空格、换行等，通常不会影响功能。\n- perf：性能优化\n示例：perf: 优化用户登录接口的响应时间\n解释：这次提交主要目的是提升代码的性能，减少资源消耗或提高响应速度。\n- ci：持续集成相关\n示例：ci: 配置 Travis CI\n解释：这次提交主要涉及持续集成（CI）相关的配置或脚本更新。\n- build：构建系统相关\n示例：build: 更新 Maven 配置\n解释：这次提交主要涉及构建系统的配置或脚本更新，如 Maven、Gradle 等。\n- ci/cd：持续集成/持续部署相关\n示例：ci/cd: 配置 Jenkins 流水线\n解释：这次提交主要涉及 CI/CD 相关的配置或脚本更新。\n- revert：回滚提交\n示例：revert: 回滚上一次的用户登录功能修改\n解释：这次提交用于撤销之前的某次提交。\n- security：安全相关\n示例：security: 修复 SQL 注入漏洞\n解释：这次提交主要用于修复安全相关的问题。\n- i18n：国际化\n示例：i18n: 添加多语言支持\n解释：这次提交主要涉及国际化相关的修改，如添加多语言支持。\n- l10n：本地化\n示例：l10n: 更新中文翻译\n解释：这次提交主要涉及本地化相关的修改，如更新特定语言的翻译。\n- merge：合并分支\n示例：merge: 合并 develop 分支到 master\n解释：这次提交用于记录分支合并操作。\nhotfix：紧急修复\n示例：hotfix: 紧急修复生产环境的登录问题\n解释：这次提交用于紧急修复生产环境中的问题。\ndependencies：依赖管理\n示例：dependencies: 升级 Spring Boot 版本\n解释：这次提交主要涉及项目依赖的更新或管理。\n','2025-01-26 19:09:58','2025-02-15 20:54:42','0'),(3,100,6,'Ruoyi框架的网关Test','## Ruoyi的网关\n\n### 什么是服务网关\n\n`API Gateway（APIGW / API 网关）`，顾名思义，是系统对外的唯一入口。`API`网关封装了系统内部架构，为每个客户端提供定制的API。 近几年来移动应用与企业间互联需求的兴起。从以前单一的Web应用，扩展到多种使用场景，且每种使用场景对后台服务的要求都不尽相同。 这不仅增加了后台服务的响应量，还增加了后台服务的复杂性。随着微服务架构概念的提出，API网关成为了微服务架构的一个标配组件。\n\n### 为什么要使用网关\n\n微服务的应用可能部署在不同机房，不同地区，不同域名下。此时客户端（浏览器/手机/软件工具）想 要请求对应的服务，都需要知道机器的具体 IP 或者域名 URL，当微服务实例众多时，这是非常难以记忆的，对 于客户端来说也太复杂难以维护。此时就有了网关，客户端相关的请求直接发送到网关，由网关根据请求标识 解析判断出具体的微服务地址，再把请求转发到微服务实例。这其中的记忆功能就全部交由网关来操作了。\n\n','2025-01-28 22:36:40','2025-02-15 23:40:12','0');
/*!40000 ALTER TABLE `learn_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learn_blog_category`
--

DROP TABLE IF EXISTS `learn_blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learn_blog_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='博客分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learn_blog_category`
--

LOCK TABLES `learn_blog_category` WRITE;
/*!40000 ALTER TABLE `learn_blog_category` DISABLE KEYS */;
INSERT INTO `learn_blog_category` VALUES (1,'Git','2025-01-26 19:06:00','2025-01-27 14:14:12','0'),(6,'SpringCloud','2025-01-28 22:31:51','2025-01-28 22:31:51','0');
/*!40000 ALTER TABLE `learn_blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spider_bilibili`
--

DROP TABLE IF EXISTS `spider_bilibili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spider_bilibili` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `cookie` text COLLATE utf8mb4_unicode_ci,
  `refresh_token` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `spider_bilibili_pk` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='bilibili用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spider_bilibili`
--

LOCK TABLES `spider_bilibili` WRITE;
/*!40000 ALTER TABLE `spider_bilibili` DISABLE KEYS */;
INSERT INTO `spider_bilibili` VALUES (1,1,'\nbuvid3=02091638-C143-2C6F-4A32-D092C42867DA75875infoc; b_nut=1731833375; _uuid=AE2D79FD-DDE8-A4AA-ECAD-4A7B3FDEA19B75545infoc; buvid4=1A3B47D2-5670-B5C9-B0E8-0A4198B03DE176553-024111708-d7R0UkCKB6rx3iZb9e48K%2FxM2v%2BiMrsEyZ3TpJKeHlySfpZOZIQ2D%2BZjsLufnLGo; enable_web_push=DISABLE; DedeUserID=287473737; DedeUserID__ckMd5=6119bb91868bfa11; CURRENT_BLACKGAP=0; header_theme_version=CLOSE; rpdid=|(J~lkk|k)R~0J\'u~Ju)JR|~J; LIVE_BUVID=AUTO1317318543703311; buvid_fp_plain=undefined; CURRENT_QUALITY=120; hit-dyn-v2=1; is-2022-channel=1; enable_feed_channel=DISABLE; fingerprint=a1436b55ae69f82d443190471665644f; buvid_fp=a1436b55ae69f82d443190471665644f; bili_ticket=eyJhbGciOiJIUzI1NiIsImtpZCI6InMwMyIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3Mzk3OTQ5MDYsImlhdCI6MTczOTUzNTY0NiwicGx0IjotMX0.bGJqfBiyO0mOU8DhTUhsSVm3sRv13Kjbs3w6ufE3b10; bili_ticket_expires=1739794846; SESSDATA=4b3a8fac%2C1755099824%2C2a824%2A21CjDknOwgI7_zJlA8Xl-pwiaVfZEAEfntX1qEC_gHPY_ce2TbZ1vrqZ9w5aWrJN69i1kSVjZzOWhhMmJUbE5nZThhZUJsMmJOdW8tTzU2b1h2ajhtR3gtWUVXbDQtWWZCWE5XY3BqWjBlWFR5VzNiQXRuMHQyUlZ4ckU1R3pkeTYxLVd3bmhrZlB3IIEC; bili_jct=b97a185c0f2d05663b987a0c57dd787b; CURRENT_FNVAL=2000; bp_t_offset_287473737=1034048277416247296; PVID=3; b_lsid=68D8DF710_195090C50B1; home_feed_column=4; browser_resolution=736-1017','304283f673d1a259e682044361353611'),(2,100,'SESSDATA=7bf69802%2C1755168955%2C2b441%2A22CjCt3alnSVldNGbYpeQnZEq9pixOC3DleYM4X06Nx3jQWEo4SPbYTMhgB822QijQqLcSVld2VlltOXVfOWMwRkhHN3g5Z2FfRkI3d1F2a19UUlk1WS10X2NnVTR1cU0yY1ZOc3lCRmJfZFpxaUQ3amRvZkxEMHVsMlhaSS0xRHhldHViUDU3Zl9BIIEC; Path=/; Domain=bilibili.com; Expires=Thu, 14 Aug 2025 10:55:55 GMT; HttpOnly; Secure;bili_jct=43b9b8a2429ba2499ea3d193689fb82e; Path=/; Domain=bilibili.com; Expires=Thu, 14 Aug 2025 10:55:55 GMT;DedeUserID=287473737; Path=/; Domain=bilibili.com; Expires=Thu, 14 Aug 2025 10:55:55 GMT;DedeUserID__ckMd5=6119bb91868bfa11; Path=/; Domain=bilibili.com; Expires=Thu, 14 Aug 2025 10:55:55 GMT;sid=p5gnus58; Path=/; Domain=bilibili.com; Expires=Thu, 14 Aug 2025 10:55:55 GMT','d52f63b985264d19dbcc13032512cd22');
/*!40000 ALTER TABLE `spider_bilibili` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2025-01-19 12:57:25','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2025-01-19 12:57:25','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2025-01-19 12:57:25','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-是否开启用户注册功能','sys.account.registerUser','true','Y','admin','2025-01-19 12:57:25','admin','2025-02-16 12:01:52','是否开启注册用户功能（true开启，false关闭）'),(5,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2025-01-19 12:57:25','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','网站用户',0,'若依','15888888888','ry@qq.com','0','0','admin','2025-01-19 12:57:20','admin','2025-02-15 17:15:48'),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','2','admin','2025-01-19 12:57:20','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','2','admin','2025-01-19 12:57:21','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','2','admin','2025-01-19 12:57:21','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','2','admin','2025-01-19 12:57:21','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','2','admin','2025-01-19 12:57:21','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','2','admin','2025-01-19 12:57:21','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','2','admin','2025-01-19 12:57:21','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','2','admin','2025-01-19 12:57:21','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','2','admin','2025-01-19 12:57:21','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2025-01-19 12:57:24','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2025-01-19 12:57:24','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2025-01-19 12:57:24','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2025-01-19 12:57:24','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2025-01-19 12:57:24','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2025-01-19 12:57:24','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2025-01-19 12:57:24','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2025-01-19 12:57:24','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2025-01-19 12:57:24','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2025-01-19 12:57:24','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2025-01-19 12:57:24','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2025-01-19 12:57:24','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2025-01-19 12:57:24','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2025-01-19 12:57:24','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2025-01-19 12:57:24','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2025-01-19 12:57:24','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2025-01-19 12:57:24','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2025-01-19 12:57:24','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2025-01-19 12:57:24','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2025-01-19 12:57:24','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2025-01-19 12:57:24','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2025-01-19 12:57:24','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2025-01-19 12:57:24','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2025-01-19 12:57:25','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2025-01-19 12:57:25','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2025-01-19 12:57:25','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2025-01-19 12:57:25','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2025-01-19 12:57:25','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2025-01-19 12:57:25','',NULL,'停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2025-01-19 12:57:24','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2025-01-19 12:57:24','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2025-01-19 12:57:24','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2025-01-19 12:57:24','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2025-01-19 12:57:24','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2025-01-19 12:57:24','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2025-01-19 12:57:24','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2025-01-19 12:57:24','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2025-01-19 12:57:24','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2025-01-19 12:57:24','',NULL,'登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2025-01-19 12:57:25','',NULL,''),(100,'test','DEFAULT','ryTask.bilibiliTask()','0 0 8 1/1 * ? *','2','1','0','admin','2025-01-21 12:55:10','admin','2025-01-21 12:55:19','');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
INSERT INTO `sys_job_log` VALUES (1,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：50毫秒','0','','2025-01-21 12:55:53'),(2,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：16毫秒','0','','2025-01-21 12:56:10'),(3,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：110毫秒','1','java.lang.reflect.InvocationTargetException\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\n	at com.ruoyi.job.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:20)\n	at com.ruoyi.job.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:42)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\nCaused by: java.lang.IllegalArgumentException: object is not an instance of declaring class\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.alibaba.cloud.sentinel.feign.SentinelInvocationHandler.invoke(SentinelInvocationHandler.java:119)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at jdk.pro','2025-01-21 13:08:51'),(4,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：871毫秒','0','','2025-01-21 13:14:13'),(5,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：484毫秒','0','','2025-01-22 07:59:58'),(6,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：136毫秒','1','java.lang.reflect.InvocationTargetException\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\n	at com.ruoyi.job.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:20)\n	at com.ruoyi.job.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:42)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\nCaused by: java.lang.IllegalArgumentException: object is not an instance of declaring class\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.alibaba.cloud.sentinel.feign.SentinelInvocationHandler.invoke(SentinelInvocationHandler.java:119)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at jdk.pro','2025-01-22 17:35:34'),(7,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：1938毫秒','0','','2025-01-24 08:00:24'),(8,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：1217毫秒','0','','2025-01-25 08:09:03'),(9,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：729毫秒','0','','2025-01-26 07:53:59'),(10,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：962毫秒','0','','2025-01-26 19:27:45'),(11,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：975毫秒','0','','2025-01-27 08:26:25'),(12,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：386毫秒','1','java.lang.reflect.InvocationTargetException\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\n	at com.ruoyi.job.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:20)\n	at com.ruoyi.job.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:42)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\nCaused by: java.lang.IllegalArgumentException: object is not an instance of declaring class\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.alibaba.cloud.sentinel.feign.SentinelInvocationHandler.invoke(SentinelInvocationHandler.java:119)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at jdk.pro','2025-01-28 01:54:22'),(13,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：3374毫秒','0','','2025-01-29 08:00:04'),(14,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：663毫秒','1','java.lang.reflect.InvocationTargetException\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\n	at com.ruoyi.job.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:20)\n	at com.ruoyi.job.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:42)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\nCaused by: java.lang.IllegalArgumentException: object is not an instance of declaring class\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.alibaba.cloud.sentinel.feign.SentinelInvocationHandler.invoke(SentinelInvocationHandler.java:119)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at jdk.pro','2025-01-29 11:25:52'),(15,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：1047921毫秒','1','java.lang.reflect.InvocationTargetException\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\n	at com.ruoyi.job.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:20)\n	at com.ruoyi.job.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:42)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\nCaused by: java.lang.IllegalArgumentException: object is not an instance of declaring class\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.alibaba.cloud.sentinel.feign.SentinelInvocationHandler.invoke(SentinelInvocationHandler.java:119)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at jdk.pro','2025-01-31 07:53:16'),(16,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：133毫秒','1','java.lang.reflect.InvocationTargetException\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\n	at com.ruoyi.job.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:20)\n	at com.ruoyi.job.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:42)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\nCaused by: java.lang.IllegalArgumentException: object is not an instance of declaring class\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.alibaba.cloud.sentinel.feign.SentinelInvocationHandler.invoke(SentinelInvocationHandler.java:119)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at jdk.pro','2025-02-01 17:54:03'),(17,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：23毫秒','1','java.lang.reflect.InvocationTargetException\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\n	at com.ruoyi.job.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:20)\n	at com.ruoyi.job.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:42)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\nCaused by: java.lang.IllegalArgumentException: object is not an instance of declaring class\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.alibaba.cloud.sentinel.feign.SentinelInvocationHandler.invoke(SentinelInvocationHandler.java:119)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at jdk.pro','2025-02-02 08:00:00'),(18,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：33毫秒','1','java.lang.reflect.InvocationTargetException\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\n	at com.ruoyi.job.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:20)\n	at com.ruoyi.job.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:42)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\nCaused by: java.lang.IllegalArgumentException: object is not an instance of declaring class\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.alibaba.cloud.sentinel.feign.SentinelInvocationHandler.invoke(SentinelInvocationHandler.java:119)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at jdk.pro','2025-02-03 08:00:00'),(19,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：10632毫秒','1','java.lang.reflect.InvocationTargetException\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\n	at com.ruoyi.job.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:20)\n	at com.ruoyi.job.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:42)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\nCaused by: java.lang.IllegalArgumentException: object is not an instance of declaring class\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.alibaba.cloud.sentinel.feign.SentinelInvocationHandler.invoke(SentinelInvocationHandler.java:119)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at jdk.pro','2025-02-04 08:00:11'),(20,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：39毫秒','1','java.lang.reflect.InvocationTargetException\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\n	at com.ruoyi.job.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:20)\n	at com.ruoyi.job.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:42)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\nCaused by: java.lang.IllegalArgumentException: object is not an instance of declaring class\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.alibaba.cloud.sentinel.feign.SentinelInvocationHandler.invoke(SentinelInvocationHandler.java:119)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at jdk.pro','2025-02-06 23:39:06'),(21,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：10718毫秒','1','java.lang.reflect.InvocationTargetException\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\n	at com.ruoyi.job.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:20)\n	at com.ruoyi.job.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:42)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\nCaused by: java.lang.IllegalArgumentException: object is not an instance of declaring class\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.alibaba.cloud.sentinel.feign.SentinelInvocationHandler.invoke(SentinelInvocationHandler.java:119)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at jdk.pro','2025-02-07 08:00:10'),(22,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：10390毫秒','1','java.lang.reflect.InvocationTargetException\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\n	at com.ruoyi.job.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:20)\n	at com.ruoyi.job.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:42)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\nCaused by: java.lang.IllegalArgumentException: object is not an instance of declaring class\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.alibaba.cloud.sentinel.feign.SentinelInvocationHandler.invoke(SentinelInvocationHandler.java:119)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at jdk.pro','2025-02-08 08:00:11'),(23,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：10460毫秒','1','java.lang.reflect.InvocationTargetException\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\n	at com.ruoyi.job.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:20)\n	at com.ruoyi.job.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:42)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\nCaused by: java.lang.IllegalArgumentException: object is not an instance of declaring class\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.alibaba.cloud.sentinel.feign.SentinelInvocationHandler.invoke(SentinelInvocationHandler.java:119)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at jdk.pro','2025-02-09 08:00:10'),(24,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：79毫秒','1','java.lang.reflect.InvocationTargetException\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\n	at com.ruoyi.job.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:20)\n	at com.ruoyi.job.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:42)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\nCaused by: java.lang.IllegalArgumentException: object is not an instance of declaring class\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.alibaba.cloud.sentinel.feign.SentinelInvocationHandler.invoke(SentinelInvocationHandler.java:119)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at jdk.pro','2025-02-09 21:20:33'),(25,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：520毫秒','1','java.lang.reflect.InvocationTargetException\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\n	at com.ruoyi.job.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:20)\n	at com.ruoyi.job.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:42)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\nCaused by: java.lang.IllegalArgumentException: object is not an instance of declaring class\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.alibaba.cloud.sentinel.feign.SentinelInvocationHandler.invoke(SentinelInvocationHandler.java:119)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at jdk.pro','2025-02-14 15:17:47'),(26,'test','DEFAULT','ryTask.bilibiliTask()','test 总共耗时：41毫秒','1','java.lang.reflect.InvocationTargetException\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\n	at com.ruoyi.job.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\n	at com.ruoyi.job.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:20)\n	at com.ruoyi.job.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:42)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\nCaused by: java.lang.IllegalArgumentException: object is not an instance of declaring class\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n	at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.base/java.lang.reflect.Method.invoke(Method.java:568)\n	at com.alibaba.cloud.sentinel.feign.SentinelInvocationHandler.invoke(SentinelInvocationHandler.java:119)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory$1.proceed(FeignCachingInvocationHandlerFactory.java:66)\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:54)\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:351)\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:64)\n	at org.springframework.cloud.openfeign.FeignCachingInvocationHandlerFactory.lambda$create$1(FeignCachingInvocationHandlerFactory.java:53)\n	at jdk.pro','2025-02-15 07:26:35');
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '提示信息',
  `access_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`access_time`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','0','登录成功','2025-01-19 17:49:38'),(101,'admin','127.0.0.1','0','退出成功','2025-01-19 17:53:47'),(102,'admin','127.0.0.1','0','登录成功','2025-01-19 17:53:48'),(103,'admin','127.0.0.1','0','登录成功','2025-01-19 20:48:15'),(104,'admin','127.0.0.1','0','登录成功','2025-01-19 22:49:56'),(105,'admin','127.0.0.1','0','登录成功','2025-01-21 10:50:09'),(106,'admin','127.0.0.1','0','退出成功','2025-01-23 20:59:22'),(107,'admin','127.0.0.1','0','登录成功','2025-01-23 20:59:24'),(108,'admin','127.0.0.1','0','登录成功','2025-01-24 10:54:23'),(109,'admin','127.0.0.1','0','登录成功','2025-01-24 11:20:36'),(110,'admin','127.0.0.1','0','退出成功','2025-01-24 11:30:24'),(111,'wanfeng','127.0.0.1','0','登录成功','2025-01-24 11:30:33'),(112,'wanfeng','127.0.0.1','0','退出成功','2025-01-24 11:30:58'),(113,'admin','127.0.0.1','1','密码输入错误1次','2025-01-24 11:31:00'),(114,'admin','127.0.0.1','1','密码输入错误2次','2025-01-24 11:31:04'),(115,'admin','127.0.0.1','1','密码输入错误3次','2025-01-24 11:31:10'),(116,'admin','127.0.0.1','1','密码输入错误4次','2025-01-24 11:31:13'),(117,'admin','127.0.0.1','1','密码输入错误5次','2025-01-24 11:31:17'),(118,'admin','127.0.0.1','1','密码输入错误5次，帐户锁定10分钟','2025-01-24 11:31:39'),(119,'admin','127.0.0.1','1','密码输入错误5次，帐户锁定10分钟','2025-01-24 11:32:30'),(120,'admin','127.0.0.1','1','密码输入错误5次，帐户锁定10分钟','2025-01-24 11:33:03'),(121,'admin','127.0.0.1','1','密码输入错误5次，帐户锁定10分钟','2025-01-24 11:35:28'),(122,'wanfeng','127.0.0.1','0','登录成功','2025-01-24 11:35:38'),(123,'wanfeng','127.0.0.1','0','退出成功','2025-01-24 11:38:09'),(124,'admin','127.0.0.1','1','密码输入错误5次，帐户锁定10分钟','2025-01-24 11:38:17'),(125,'admin','127.0.0.1','0','登录成功','2025-01-24 11:38:47'),(126,'admin','127.0.0.1','0','登录成功','2025-01-24 12:10:27'),(127,'admin','127.0.0.1','0','登录成功','2025-01-24 12:18:56'),(128,'admin','127.0.0.1','0','登录成功','2025-01-24 12:50:13'),(129,'admin','127.0.0.1','0','退出成功','2025-01-24 15:03:26'),(130,'admin','127.0.0.1','0','退出成功','2025-01-24 15:03:27'),(131,'admin','127.0.0.1','0','退出成功','2025-01-24 15:03:29'),(132,'admin','127.0.0.1','0','登录成功','2025-01-24 15:03:31'),(133,'admin','127.0.0.1','0','登录成功','2025-01-24 15:20:07'),(134,'admin','127.0.0.1','0','登录成功','2025-01-24 15:36:33'),(135,'admin','127.0.0.1','0','退出成功','2025-01-24 15:39:36'),(136,'wanfeng','127.0.0.1','0','登录成功','2025-01-24 15:39:42'),(137,'wanfeng','127.0.0.1','0','登录成功','2025-01-24 15:53:31'),(138,'wanfeng','127.0.0.1','0','登录成功','2025-01-24 16:30:41'),(139,'wanfeng','127.0.0.1','0','登录成功','2025-01-24 18:04:24'),(140,'wanfeng','127.0.0.1','0','退出成功','2025-01-24 19:31:35'),(141,'admin','127.0.0.1','0','登录成功','2025-01-24 19:31:42'),(142,'admin','127.0.0.1','0','退出成功','2025-01-24 19:32:12'),(143,'wanfeng','127.0.0.1','0','登录成功','2025-01-24 19:32:14'),(144,'wanfeng','127.0.0.1','0','登录成功','2025-01-26 15:49:34'),(145,'wanfeng','127.0.0.1','0','登录成功','2025-01-26 17:27:35'),(146,'wanfeng','127.0.0.1','0','退出成功','2025-01-26 17:27:41'),(147,'admin','127.0.0.1','0','登录成功','2025-01-26 17:27:48'),(148,'admin','127.0.0.1','0','退出成功','2025-01-27 13:32:28'),(149,'admin','127.0.0.1','0','登录成功','2025-01-27 13:32:30'),(150,'admin','127.0.0.1','0','退出成功','2025-01-27 14:14:24'),(151,'wanfeng','127.0.0.1','0','登录成功','2025-01-27 14:14:31'),(152,'wanfeng','127.0.0.1','0','登录成功','2025-01-27 14:28:45'),(153,'wanfeng','127.0.0.1','0','登录成功','2025-01-28 22:07:16'),(154,'wanfeng','127.0.0.1','0','登录成功','2025-01-28 22:12:45'),(155,'wanfeng','127.0.0.1','0','登录成功','2025-01-30 16:39:06'),(156,'wanfeng','127.0.0.1','0','登录成功','2025-01-30 16:51:32'),(157,'wanfeng','127.0.0.1','0','登录成功','2025-01-31 12:00:52'),(158,'wanfeng','127.0.0.1','0','退出成功','2025-01-31 12:00:56'),(159,'admin','127.0.0.1','0','登录成功','2025-01-31 12:01:05'),(160,'admin','127.0.0.1','0','登录成功','2025-01-31 12:16:16'),(161,'admin','127.0.0.1','0','登录成功','2025-02-15 17:07:22'),(162,'admin','127.0.0.1','0','退出成功','2025-02-15 17:21:05'),(163,'admin','127.0.0.1','0','登录成功','2025-02-15 17:21:13'),(164,'admin','127.0.0.1','0','退出成功','2025-02-15 18:13:17'),(165,'wanfeng','127.0.0.1','1','密码输入错误1次','2025-02-15 18:13:20'),(166,'wanfeng','127.0.0.1','0','登录成功','2025-02-15 18:13:23'),(167,'wanfeng','127.0.0.1','0','退出成功','2025-02-15 18:13:37'),(168,'admin','127.0.0.1','0','登录成功','2025-02-15 18:13:44'),(169,'admin','127.0.0.1','0','退出成功','2025-02-15 18:14:03'),(170,'wanfeng','127.0.0.1','0','登录成功','2025-02-15 18:14:06'),(171,'admin','192.168.0.109','0','登录成功','2025-02-15 19:08:18'),(172,'admin','192.168.0.109','0','退出成功','2025-02-15 19:18:29'),(173,'wanfeng','192.168.0.109','0','登录成功','2025-02-15 19:18:35'),(174,'wanfeng','127.0.0.1','0','退出成功','2025-02-15 19:22:05'),(175,'admin','127.0.0.1','0','登录成功','2025-02-15 19:22:06'),(176,'admin','127.0.0.1','0','登录成功','2025-02-15 19:47:27'),(177,'wanfeng','192.168.0.109','0','登录成功','2025-02-15 19:49:23'),(178,'admin','127.0.0.1','0','登录成功','2025-02-15 19:49:31'),(179,'admin','127.0.0.1','0','退出成功','2025-02-15 19:53:44'),(180,'wanfeng','127.0.0.1','0','登录成功','2025-02-15 19:53:46'),(181,'wanfeng','127.0.0.1','0','登录成功','2025-02-16 11:44:37'),(182,'wanfeng','127.0.0.1','0','退出成功','2025-02-16 11:53:49'),(183,'admin','127.0.0.1','0','登录成功','2025-02-16 11:53:55'),(184,'admin','127.0.0.1','0','退出成功','2025-02-16 11:55:15'),(185,'admin','127.0.0.1','0','登录成功','2025-02-16 12:01:35'),(186,'admin','127.0.0.1','0','退出成功','2025-02-16 12:01:55'),(187,'admin','127.0.0.1','0','登录成功','2025-02-16 12:01:57'),(188,'admin','127.0.0.1','0','退出成功','2025-02-16 12:03:08'),(189,'xiaohao1','127.0.0.1','0','注册成功','2025-02-16 12:05:51'),(190,'xiaohao1','127.0.0.1','0','登录成功','2025-02-16 12:05:57'),(191,'xiaohao1','127.0.0.1','0','退出成功','2025-02-16 12:45:29'),(192,'xiaohao2','127.0.0.1','0','注册成功','2025-02-16 12:47:57'),(193,'xiaohao2','127.0.0.1','0','登录成功','2025-02-16 12:48:11'),(194,'xiaohao2','127.0.0.1','0','退出成功','2025-02-16 13:01:06'),(195,'xiaohao1','127.0.0.1','0','登录成功','2025-02-16 13:01:08');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(11) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '路由名称',
  `is_frame` int(11) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'','',1,0,'M','0','0','','system','admin','2025-01-19 12:57:21','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'','',1,0,'M','0','0','','monitor','admin','2025-01-19 12:57:21','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'','',1,0,'M','0','0','','tool','admin','2025-01-19 12:57:21','',NULL,'系统工具目录'),(4,'开发文档',0,4,'https://doc.ruoyi.vip/ruoyi-cloud/',NULL,'','',0,0,'M','0','0','','guide','admin','2025-01-19 12:57:21','admin','2025-01-26 19:25:39','若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','','',1,0,'C','0','0','system:user:list','user','admin','2025-01-19 12:57:21','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','','',1,0,'C','0','0','system:role:list','peoples','admin','2025-01-19 12:57:21','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2025-01-19 12:57:21','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','','',1,0,'C','0','0','system:dept:list','tree','admin','2025-01-19 12:57:21','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','','',1,0,'C','0','0','system:post:list','post','admin','2025-01-19 12:57:21','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','','',1,0,'C','0','0','system:dict:list','dict','admin','2025-01-19 12:57:21','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','','',1,0,'C','0','0','system:config:list','edit','admin','2025-01-19 12:57:21','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2025-01-19 12:57:21','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','','',1,0,'M','0','0','','log','admin','2025-01-19 12:57:21','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2025-01-19 12:57:21','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','','',1,0,'C','0','0','monitor:job:list','job','admin','2025-01-19 12:57:21','',NULL,'定时任务菜单'),(111,'Sentinel控制台',2,3,'http://localhost:8718','','','',0,0,'C','0','0','monitor:sentinel:list','sentinel','admin','2025-01-19 12:57:21','',NULL,'流量控制菜单'),(112,'Nacos控制台',2,4,'http://localhost:8848/nacos','','','',0,0,'C','0','0','monitor:nacos:list','nacos','admin','2025-01-19 12:57:21','',NULL,'服务治理菜单'),(113,'Admin控制台',2,5,'http://localhost:9100/login','','','',0,0,'C','0','0','monitor:server:list','server','admin','2025-01-19 12:57:21','',NULL,'服务监控菜单'),(114,'表单构建',3,1,'build','tool/build/index','','',1,0,'C','0','0','tool:build:list','build','admin','2025-01-19 12:57:21','',NULL,'表单构建菜单'),(115,'代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2025-01-19 12:57:21','',NULL,'代码生成菜单'),(116,'系统接口',3,3,'http://localhost:8080/swagger-ui/index.html','','','',0,0,'C','0','0','tool:swagger:list','swagger','admin','2025-01-19 12:57:21','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','system/operlog/index','','',1,0,'C','0','0','system:operlog:list','form','admin','2025-01-19 12:57:21','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','system/logininfor/index','','',1,0,'C','0','0','system:logininfor:list','logininfor','admin','2025-01-19 12:57:21','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2025-01-19 12:57:21','',NULL,''),(1001,'用户新增',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2025-01-19 12:57:21','',NULL,''),(1002,'用户修改',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2025-01-19 12:57:21','',NULL,''),(1003,'用户删除',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2025-01-19 12:57:21','',NULL,''),(1004,'用户导出',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2025-01-19 12:57:21','',NULL,''),(1005,'用户导入',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2025-01-19 12:57:21','',NULL,''),(1006,'重置密码',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2025-01-19 12:57:21','',NULL,''),(1007,'角色查询',101,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2025-01-19 12:57:22','',NULL,''),(1008,'角色新增',101,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2025-01-19 12:57:22','',NULL,''),(1009,'角色修改',101,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2025-01-19 12:57:22','',NULL,''),(1010,'角色删除',101,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2025-01-19 12:57:22','',NULL,''),(1011,'角色导出',101,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2025-01-19 12:57:22','',NULL,''),(1012,'菜单查询',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2025-01-19 12:57:22','',NULL,''),(1013,'菜单新增',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2025-01-19 12:57:22','',NULL,''),(1014,'菜单修改',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2025-01-19 12:57:22','',NULL,''),(1015,'菜单删除',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2025-01-19 12:57:22','',NULL,''),(1016,'部门查询',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2025-01-19 12:57:22','',NULL,''),(1017,'部门新增',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2025-01-19 12:57:22','',NULL,''),(1018,'部门修改',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2025-01-19 12:57:22','',NULL,''),(1019,'部门删除',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2025-01-19 12:57:22','',NULL,''),(1020,'岗位查询',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2025-01-19 12:57:22','',NULL,''),(1021,'岗位新增',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2025-01-19 12:57:22','',NULL,''),(1022,'岗位修改',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2025-01-19 12:57:22','',NULL,''),(1023,'岗位删除',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2025-01-19 12:57:22','',NULL,''),(1024,'岗位导出',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2025-01-19 12:57:22','',NULL,''),(1025,'字典查询',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2025-01-19 12:57:22','',NULL,''),(1026,'字典新增',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2025-01-19 12:57:22','',NULL,''),(1027,'字典修改',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2025-01-19 12:57:22','',NULL,''),(1028,'字典删除',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2025-01-19 12:57:22','',NULL,''),(1029,'字典导出',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2025-01-19 12:57:22','',NULL,''),(1030,'参数查询',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2025-01-19 12:57:22','',NULL,''),(1031,'参数新增',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2025-01-19 12:57:22','',NULL,''),(1032,'参数修改',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2025-01-19 12:57:22','',NULL,''),(1033,'参数删除',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2025-01-19 12:57:22','',NULL,''),(1034,'参数导出',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2025-01-19 12:57:22','',NULL,''),(1035,'公告查询',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2025-01-19 12:57:22','',NULL,''),(1036,'公告新增',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2025-01-19 12:57:22','',NULL,''),(1037,'公告修改',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2025-01-19 12:57:22','',NULL,''),(1038,'公告删除',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2025-01-19 12:57:22','',NULL,''),(1039,'操作查询',500,1,'#','','','',1,0,'F','0','0','system:operlog:query','#','admin','2025-01-19 12:57:22','',NULL,''),(1040,'操作删除',500,2,'#','','','',1,0,'F','0','0','system:operlog:remove','#','admin','2025-01-19 12:57:22','',NULL,''),(1041,'日志导出',500,3,'#','','','',1,0,'F','0','0','system:operlog:export','#','admin','2025-01-19 12:57:22','',NULL,''),(1042,'登录查询',501,1,'#','','','',1,0,'F','0','0','system:logininfor:query','#','admin','2025-01-19 12:57:22','',NULL,''),(1043,'登录删除',501,2,'#','','','',1,0,'F','0','0','system:logininfor:remove','#','admin','2025-01-19 12:57:22','',NULL,''),(1044,'日志导出',501,3,'#','','','',1,0,'F','0','0','system:logininfor:export','#','admin','2025-01-19 12:57:22','',NULL,''),(1045,'账户解锁',501,4,'#','','','',1,0,'F','0','0','system:logininfor:unlock','#','admin','2025-01-19 12:57:22','',NULL,''),(1046,'在线查询',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2025-01-19 12:57:22','',NULL,''),(1047,'批量强退',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2025-01-19 12:57:22','',NULL,''),(1048,'单条强退',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2025-01-19 12:57:22','',NULL,''),(1049,'任务查询',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2025-01-19 12:57:22','',NULL,''),(1050,'任务新增',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2025-01-19 12:57:22','',NULL,''),(1051,'任务修改',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2025-01-19 12:57:22','',NULL,''),(1052,'任务删除',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2025-01-19 12:57:22','',NULL,''),(1053,'状态修改',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2025-01-19 12:57:22','',NULL,''),(1054,'任务导出',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2025-01-19 12:57:22','',NULL,''),(1055,'生成查询',115,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2025-01-19 12:57:22','',NULL,''),(1056,'生成修改',115,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2025-01-19 12:57:22','',NULL,''),(1057,'生成删除',115,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2025-01-19 12:57:22','',NULL,''),(1058,'导入代码',115,2,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2025-01-19 12:57:22','',NULL,''),(1059,'预览代码',115,4,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2025-01-19 12:57:22','',NULL,''),(1060,'生成代码',115,5,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2025-01-19 12:57:22','',NULL,''),(2000,'学习记录',0,0,'wanfeng/learn',NULL,NULL,'',1,0,'M','0','0','','education','admin','2025-01-24 11:26:38','admin','2025-01-24 12:49:07',''),(2001,'博客',2000,0,'blog','wanfeng/learn/blog/index',NULL,'',1,0,'C','0','0','','documentation','admin','2025-01-24 11:28:57','admin','2025-01-24 12:49:30',''),(2005,'爬虫系统',0,0,'wanfeng/spider',NULL,NULL,'',1,0,'M','0','0','','bug','admin','2025-02-15 17:26:05','admin','2025-02-15 19:22:56',''),(2006,'哔哩哔哩',2005,1,'bilibili','wanfeng/spider/bilibili/index',NULL,'',1,0,'C','0','0','','bug','admin','2025-02-15 17:29:58','admin','2025-02-15 17:33:10','');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2','新版本内容','0','admin','2025-01-19 12:57:25','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1','维护内容','0','admin','2025-01-19 12:57:25','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '返回参数',
  `status` int(11) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'代码生成',6,'com.ruoyi.gen.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/gen/importTable','127.0.0.1','','{\"tables\":\"spider_bilibili\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-21 10:51:21',67),(101,'代码生成',2,'com.ruoyi.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/gen','127.0.0.1','','{\"businessName\":\"bilibili\",\"className\":\"SpiderBilibili\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-21 10:51:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnId\":2,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-01-21 10:51:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Cookie\",\"columnId\":3,\"columnName\":\"cookie\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-21 10:51:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cookie\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RefreshToken\",\"columnId\":4,\"columnName\":\"refresh_token\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-01-21 10:51:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"refreshToken\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":4,\"superColumn\":false,\"tableId\":1,\"updateBy\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-21 10:52:34',36),(102,'代码生成',8,'com.ruoyi.gen.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/gen/batchGenCode','127.0.0.1','','{\"tables\":\"spider_bilibili\"}',NULL,0,NULL,'2025-01-21 10:52:36',44),(103,'定时任务',3,'com.ruoyi.job.controller.SysJobController.remove()','DELETE',1,'admin',NULL,'/job/1','127.0.0.1','','[1]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-21 12:36:23',39),(104,'定时任务',3,'com.ruoyi.job.controller.SysJobController.remove()','DELETE',1,'admin',NULL,'/job/2','127.0.0.1','','[2]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-21 12:36:27',19),(105,'定时任务',1,'com.ruoyi.job.controller.SysJobController.add()','POST',1,'admin',NULL,'/job','127.0.0.1','','','{\"msg\":\"新增任务\'test\'失败，Cron表达式不正确\",\"code\":500}',0,NULL,'2025-01-21 12:54:47',25),(106,'定时任务',1,'com.ruoyi.job.controller.SysJobController.add()','POST',1,'admin',NULL,'/job','127.0.0.1','','','{\"msg\":\"新增任务\'test\'失败，Cron表达式不正确\",\"code\":500}',0,NULL,'2025-01-21 12:54:50',0),(107,'定时任务',1,'com.ruoyi.job.controller.SysJobController.add()','POST',1,'admin',NULL,'/job','127.0.0.1','','{\"concurrent\":\"1\",\"createBy\":\"admin\",\"cronExpression\":\"0 0 8 1/1 * ? *\",\"invokeTarget\":\"ryTask.bilibiliTask()\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"test\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2025-01-22 08:00:00\",\"params\":{},\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-21 12:55:10',52),(108,'定时任务',2,'com.ruoyi.job.controller.SysJobController.changeStatus()','PUT',1,'admin',NULL,'/job/changeStatus','127.0.0.1','','{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-21 12:55:14',15),(109,'定时任务',2,'com.ruoyi.job.controller.SysJobController.edit()','PUT',1,'admin',NULL,'/job','127.0.0.1','','{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2025-01-21 12:55:10\",\"cronExpression\":\"0 0 8 1/1 * ? *\",\"invokeTarget\":\"ryTask.bilibiliTask()\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"test\",\"misfirePolicy\":\"2\",\"nextValidTime\":\"2025-01-22 08:00:00\",\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-21 12:55:20',18),(110,'定时任务',2,'com.ruoyi.job.controller.SysJobController.run()','PUT',1,'admin',NULL,'/job/run','127.0.0.1','','{\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-21 12:55:53',14),(111,'定时任务',2,'com.ruoyi.job.controller.SysJobController.run()','PUT',1,'admin',NULL,'/job/run','127.0.0.1','','{\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-21 12:56:10',17),(112,'定时任务',2,'com.ruoyi.job.controller.SysJobController.run()','PUT',1,'admin',NULL,'/job/run','127.0.0.1','','{\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-21 13:08:51',25),(113,'定时任务',2,'com.ruoyi.job.controller.SysJobController.run()','PUT',1,'admin',NULL,'/job/run','127.0.0.1','','{\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-21 13:14:12',41),(114,'用户管理',3,'com.ruoyi.system.controller.SysUserController.remove()','DELETE',1,'admin',NULL,'/user/2','127.0.0.1','','[2]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 10:55:24',42),(115,'菜单管理',1,'com.ruoyi.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学习记录\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"t\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 11:26:38',19),(116,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"createTime\":\"2025-01-24 11:26:38\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"学习记录\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"learn\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 11:27:39',8),(117,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"createTime\":\"2025-01-24 11:26:38\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"学习记录\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"learn\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 11:27:43',5),(118,'菜单管理',1,'com.ruoyi.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"博客\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"learn:blog\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 11:28:57',21),(119,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"createTime\":\"2025-01-24 11:28:57\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"博客\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"blog\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 11:29:37',46),(120,'用户管理',1,'com.ruoyi.system.controller.SysUserController.add()','POST',1,'admin',NULL,'/user','127.0.0.1','','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"wanfeng\",\"params\":{},\"postIds\":[1],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"wanfeng\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 11:30:18',141),(121,'用户管理',4,'com.ruoyi.system.controller.SysUserController.insertAuthRole()','PUT',1,'wanfeng',NULL,'/user/authRole','127.0.0.1','','{\"roleIds\":\"2\",\"userId\":\"100\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 11:36:12',20),(122,'角色管理',2,'com.ruoyi.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/role','127.0.0.1','','{\"admin\":false,\"createTime\":\"2025-01-19 12:57:21\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 11:39:17',53),(123,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"component\":\"learn/blog/index\",\"createTime\":\"2025-01-24 11:28:57\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"博客\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"blog\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 11:40:42',16),(124,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"component\":\"learn/blog/index\",\"createTime\":\"2025-01-24 11:28:57\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"博客\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"blog\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 11:49:09',36),(125,'菜单管理',1,'com.ruoyi.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"博客展示\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"path\":\"show\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 11:49:36',14),(126,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"component\":\"learn/blog/index\",\"createTime\":\"2025-01-24 11:49:36\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"博客展示\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"path\":\"show\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 11:50:12',26),(127,'菜单管理',1,'com.ruoyi.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"component\":\"learn/blog/edit\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"写博客\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"edit\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 11:50:36',14),(128,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"component\":\"learn/blog/index\",\"createTime\":\"2025-01-24 11:28:57\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"博客\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"blog\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 11:51:55',22),(129,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"component\":\"learn/blog/index\",\"createTime\":\"2025-01-24 11:49:36\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"博客展示\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"path\":\"index\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 11:54:09',29),(130,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"component\":\"learn/blog/edit\",\"createTime\":\"2025-01-24 11:50:36\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"写博客\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"edit\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 11:54:39',35),(131,'菜单管理',3,'com.ruoyi.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/menu/2003','127.0.0.1','','2003','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 11:56:37',53),(132,'菜单管理',3,'com.ruoyi.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/menu/2002','127.0.0.1','','2002','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 11:56:55',8),(133,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"component\":\"learn/blog/index\",\"createTime\":\"2025-01-24 11:28:57\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"博客\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"blog\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 11:57:05',47),(134,'菜单管理',1,'com.ruoyi.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"component\":\"learn/blog/edit\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"写博客\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"edit\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 12:04:28',19),(135,'菜单管理',3,'com.ruoyi.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/menu/2004','127.0.0.1','','2004','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 12:08:23',21),(136,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"createTime\":\"2025-01-24 11:26:38\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"学习记录\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"system/learn\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 12:31:42',23),(137,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"createTime\":\"2025-01-24 11:26:38\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"学习记录\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"wanfeng/learn\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 12:46:34',52),(138,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"component\":\"wanfeng/learn/blog/index\",\"createTime\":\"2025-01-24 11:28:57\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"博客\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"blog\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 12:46:44',43),(139,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"component\":\"wanfeng/learn/blog/index\",\"createTime\":\"2025-01-24 11:28:57\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"博客\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"blog\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 12:48:16',42),(140,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"createTime\":\"2025-01-24 11:26:38\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"学习记录\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"wanfeng/learn\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 12:49:07',20),(141,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"component\":\"wanfeng/learn/blog/index\",\"createTime\":\"2025-01-24 11:28:57\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"博客\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"blog\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-24 12:49:30',27),(142,'角色管理',2,'com.ruoyi.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/role','127.0.0.1','','{\"admin\":false,\"createTime\":\"2025-01-19 12:57:21\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-26 19:25:11',44),(143,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"createTime\":\"2025-01-19 12:57:21\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"https://doc.ruoyi.vip/ruoyi-cloud/\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-26 19:25:21',33),(144,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"createTime\":\"2025-01-19 12:57:21\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"开发文档\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"https://doc.ruoyi.vip/ruoyi-cloud/\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-26 19:25:39',19),(145,'在线用户',7,'com.ruoyi.system.controller.SysUserOnlineController.forceLogout()','DELETE',1,'admin',NULL,'/online/789ef182-0617-4ccb-9ed1-79319fdfb24a','127.0.0.1','','\"789ef182-0617-4ccb-9ed1-79319fdfb24a\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-26 19:27:24',16),(146,'定时任务',2,'com.ruoyi.job.controller.SysJobController.run()','PUT',1,'admin',NULL,'/job/run','127.0.0.1','','{\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-26 19:27:45',77),(147,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/101','127.0.0.1','','101','{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}',0,NULL,'2025-02-15 17:09:39',4),(148,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/103','127.0.0.1','','103','{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}',0,NULL,'2025-02-15 17:09:42',3),(149,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/103','127.0.0.1','','103','{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}',0,NULL,'2025-02-15 17:09:44',2),(150,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/103','127.0.0.1','','103','{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}',0,NULL,'2025-02-15 17:09:46',3),(151,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/103','127.0.0.1','','103','{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}',0,NULL,'2025-02-15 17:09:47',3),(152,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/103','127.0.0.1','','103','{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}',0,NULL,'2025-02-15 17:09:49',3),(153,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/108','127.0.0.1','','108','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:10:31',5),(154,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/109','127.0.0.1','','109','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:10:33',5),(155,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/102','127.0.0.1','','102','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:10:35',5),(156,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/107','127.0.0.1','','107','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:10:38',4),(157,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/106','127.0.0.1','','106','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:10:41',5),(158,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/105','127.0.0.1','','105','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:10:43',4),(159,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/104','127.0.0.1','','104','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:10:44',5),(160,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/103','127.0.0.1','','103','{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}',0,NULL,'2025-02-15 17:10:45',2),(161,'用户管理',2,'com.ruoyi.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/user','127.0.0.1','','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-01-24 11:30:18\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2025-01-31 12:00:53\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"wanfeng\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[1],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"wanfeng\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:11:08',27),(162,'岗位管理',3,'com.ruoyi.system.controller.SysPostController.remove()','DELETE',1,'admin',NULL,'/post/4','127.0.0.1','','[4]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:12:41',6),(163,'岗位管理',3,'com.ruoyi.system.controller.SysPostController.remove()','DELETE',1,'admin',NULL,'/post/3','127.0.0.1','','[3]','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:12:43',4),(164,'岗位管理',2,'com.ruoyi.system.controller.SysPostController.edit()','PUT',1,'admin',NULL,'/post','127.0.0.1','','{\"createBy\":\"admin\",\"createTime\":\"2025-01-19 12:57:21\",\"flag\":false,\"params\":{},\"postCode\":\"admin\",\"postId\":1,\"postName\":\"管理员\",\"postSort\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:13:00',6),(165,'岗位管理',2,'com.ruoyi.system.controller.SysPostController.edit()','PUT',1,'admin',NULL,'/post','127.0.0.1','','{\"createBy\":\"admin\",\"createTime\":\"2025-01-19 12:57:21\",\"flag\":false,\"params\":{},\"postCode\":\"se\",\"postId\":2,\"postName\":\"普通用户\",\"postSort\":2,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:13:09',4),(166,'角色管理',2,'com.ruoyi.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/role','127.0.0.1','','{\"admin\":false,\"createTime\":\"2025-01-19 12:57:21\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:13:36',11),(167,'用户管理',2,'com.ruoyi.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/user','127.0.0.1','','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-01-24 11:30:18\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2025-01-31 12:00:53\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"wanfeng\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[2],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"wanfeng\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:13:53',11),(168,'部门管理',2,'com.ruoyi.system.controller.SysDeptController.edit()','PUT',1,'admin',NULL,'/dept','127.0.0.1','','{\"ancestors\":\"0\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2025-01-19 12:57:20\",\"delFlag\":\"0\",\"deptId\":100,\"deptName\":\"网站用户\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:15:48',6),(169,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/103','127.0.0.1','','103','{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}',0,NULL,'2025-02-15 17:17:45',3),(170,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/101','127.0.0.1','','101','{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}',0,NULL,'2025-02-15 17:19:52',1),(171,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/103','127.0.0.1','','103','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:19:54',4),(172,'部门管理',3,'com.ruoyi.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/101','127.0.0.1','','101','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:19:56',4),(173,'菜单管理',1,'com.ruoyi.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"爬虫系统\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"spider\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:26:05',7),(174,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"createTime\":\"2025-02-15 17:26:05\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"爬虫系统\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"wanfeng/spider\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:26:20',4),(175,'角色管理',2,'com.ruoyi.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/role','127.0.0.1','','{\"admin\":false,\"createTime\":\"2025-01-19 12:57:21\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2005],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:26:34',9),(176,'菜单管理',1,'com.ruoyi.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"哔哩哔哩\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"bilibili\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:29:58',4),(177,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"createTime\":\"2025-02-15 17:29:58\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"哔哩哔哩\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"bilibili\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:30:12',3),(178,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"component\":\"wanfeng/spider/bilibili/index\",\"createTime\":\"2025-02-15 17:29:58\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"哔哩哔哩\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"bilibili\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:30:37',4),(179,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"component\":\"wanfeng/spider/bilibili/index\",\"createTime\":\"2025-02-15 17:29:58\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"哔哩哔哩\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"bilibili\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 17:33:10',3),(180,'角色管理',2,'com.ruoyi.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/role','127.0.0.1','','{\"admin\":false,\"createTime\":\"2025-01-19 12:57:21\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2005,2006],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 18:14:00',9),(181,'菜单管理',2,'com.ruoyi.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"createTime\":\"2025-02-15 17:26:05\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"爬虫系统\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"wanfeng/spider\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-15 19:22:56',5),(182,'参数管理',2,'com.ruoyi.system.controller.SysConfigController.edit()','PUT',1,'admin',NULL,'/config','127.0.0.1','','{\"configId\":4,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2025-01-19 12:57:25\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-02-16 12:01:53',15),(183,'用户头像',2,'com.ruoyi.system.controller.SysProfileController.avatar()','POST',1,'xiaohao1',NULL,'/user/profile/avatar','127.0.0.1','','','{\"msg\":\"文件格式不正确，请上传[bmp, gif, jpg, jpeg, png]格式\",\"code\":500}',0,NULL,'2025-02-16 13:16:26',3);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'admin','管理员',1,'0','admin','2025-01-19 12:57:21','admin','2025-02-15 17:13:00',''),(2,'se','普通用户',2,'0','admin','2025-01-19 12:57:21','admin','2025-02-15 17:13:09','');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2025-01-19 12:57:21','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2025-01-19 12:57:21','admin','2025-02-15 18:14:00','普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,2000),(2,2001),(2,2005),(2,2006);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,100,'admin','admin','00','xxxx','xxxx','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-02-16 12:01:58','admin','2025-01-19 12:57:21','','2025-02-16 12:01:57','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','2','127.0.0.1','2025-01-19 12:57:21','admin','2025-01-19 12:57:21','',NULL,'测试员'),(100,100,'wanfeng','wanfeng','00','','','0','','$2a$10$RgC3mW/SRtiSYKuLrVtp5ebq0x/z9sdQnm3Pux7O4Wer08cyD5F3C','0','0','127.0.0.1','2025-02-16 11:44:38','admin','2025-01-24 11:30:18','admin','2025-02-16 11:44:37',NULL),(101,100,'xiaohao1','xiaohao1','00','','','0','','$2a$10$1MTIB/Kjq/M/c6OdlzZs7uMydeq5bjunBpbiohwqBN.RbXJj.daPG','0','0','127.0.0.1','2025-02-16 13:01:09','','2025-02-16 12:05:51','','2025-02-16 13:01:08',NULL),(103,100,'xiaohao2','xiaohao2','00','','','0','','$2a$10$TZWSCVXnNj1c6CE402wuXOGI0J5zIPD3YVXeaLE3H/hEDXRg5qXvy','0','0','127.0.0.1','2025-02-16 12:48:11','','2025-02-16 12:47:57','','2025-02-16 12:48:11',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(100,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(100,2),(101,2),(103,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-16 14:03:50
