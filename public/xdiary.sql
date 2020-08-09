-- MariaDB dump 10.17  Distrib 10.5.3-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: xdiary
-- ------------------------------------------------------
-- Server version	10.5.3-MariaDB-log
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!40101 SET NAMES utf8mb4 */
;

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;

/*!40103 SET TIME_ZONE='+00:00' */
;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */
;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;

--
-- Table structure for table `admins`
--
DROP TABLE IF EXISTS `admins`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL COMMENT '登录名',
  `password` varchar(40) NOT NULL,
  `salt` char(10) DEFAULT NULL COMMENT '混淆码',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `mobile` char(11) DEFAULT NULL COMMENT '手机号码',
  `role` smallint(5) unsigned DEFAULT NULL COMMENT '角色',
  `status` bigint(20) DEFAULT 0 COMMENT '0=正常，其它（1=永久冻结，冻结时间）不可登录	',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `last_login` bigint(20) DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `group` (`role`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8 COMMENT = '后台用户表';

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `admins`
--
LOCK TABLES `admins` WRITE;

/*!40000 ALTER TABLE `admins` DISABLE KEYS */
;

INSERT INTO
  `admins`
VALUES
  (
    1,
    'fortune',
    'c2a3b691ee173bbaee19a5d6aae8c995507fa706',
    '25ee364a54',
    'luck@fmail.pro',
    '13428122341',
    1,
    0,
    '2008-08-18 18:58:13',
    1593838435
  );

/*!40000 ALTER TABLE `admins` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `article`
--
DROP TABLE IF EXISTS `article`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `article` (
  `id` tinyint(20) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `cover` varchar(255) DEFAULT NULL COMMENT '列表封面图',
  `summary` varchar(255) DEFAULT NULL COMMENT '文章摘要',
  `seo_title` varchar(255) DEFAULT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) DEFAULT NULL COMMENT 'SEO关键词',
  `seo_description` varchar(255) DEFAULT NULL COMMENT 'SEO描述',
  `content_id` int(50) NOT NULL COMMENT '内容ID',
  `category_id` int(50) DEFAULT NULL COMMENT '文章分类ID',
  `category` varchar(20) DEFAULT NULL COMMENT '分类名，对应article_category表',
  `columns_id` int(50) NOT NULL DEFAULT 0 COMMENT '专栏ID，0不属于任何专栏',
  `available` smallint(6) DEFAULT 0 COMMENT '阅读权限：0免费、1登录、2私密',
  `nav_id` tinyint(20) DEFAULT NULL COMMENT '所属导航栏',
  `visit` int(11) NOT NULL DEFAULT 0 COMMENT '阅读次数',
  `collect` int(11) NOT NULL DEFAULT 0 COMMENT '收藏次数',
  `share` int(11) NOT NULL DEFAULT 0 COMMENT '分享次数',
  `user_id` tinyint(20) DEFAULT NULL COMMENT '文章发表用户ID',
  `username` varchar(50) DEFAULT NULL COMMENT '展示文章发表人',
  `create` bigint(20) DEFAULT NULL COMMENT '创建时间( Unix 时间戳)',
  `last_time` datetime DEFAULT NULL ON UPDATE current_timestamp() COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 17 DEFAULT CHARSET = utf8 COMMENT = '文章表';

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `article`
--
LOCK TABLES `article` WRITE;

/*!40000 ALTER TABLE `article` DISABLE KEYS */
;

INSERT INTO
  `article`
VALUES
  (
    1,
    'Linux VPS初始化配置',
    NULL,
    '拿到一台新的Linux服务器，我们应该怎么做呢？立马安装LANP或LNMP，服务器管理初始化有门道…   ',
    'dds',
    'ddd',
    'adssd',
    1,
    0,
    '',
    0,
    1,
    NULL,
    0,
    0,
    0,
    1,
    '',
    NULL,
    '2020-06-30 16:31:35'
  ),
(
    2,
    'Linux挂载新硬盘',
    NULL,
    '现在很多云商家所给的Linux都把数据盘和系统分开来，所以在Linux下挂载硬盘就成了大家必修课…',
    NULL,
    NULL,
    NULL,
    2,
    NULL,
    'Linux',
    0,
    2,
    NULL,
    0,
    0,
    0,
    2,
    NULL,
    NULL,
    '2020-06-30 16:32:04'
  ),
(
    3,
    'MariaDB源码编绎安装',
    NULL,
    'MariaDB(Mysql重要开源分支)，现在大多数Linux默认安装MariaDB而非MySql，所以未来必定是以MariaDB为主！！',
    'mysql主从配置',
    'mysql主从配置',
    'mysql主从配置',
    3,
    0,
    '',
    0,
    0,
    NULL,
    0,
    0,
    0,
    2,
    NULL,
    NULL,
    '2018-11-06 14:02:23'
  ),
(
    4,
    'MySql源码安装（mysql 5.7.6版本及以前方法）',
    NULL,
    'MySql源码编译安装（mysql 5.7.6）',
    NULL,
    NULL,
    NULL,
    4,
    NULL,
    'MariaDB',
    0,
    0,
    NULL,
    0,
    0,
    0,
    2,
    NULL,
    NULL,
    '2017-10-14 11:12:55'
  ),
(
    5,
    'VPN服务器之L2TPIPSec搭建',
    NULL,
    '生活在天朝，对整个网络实行了闭关锁国的政策，让我们这些天朝的屁民们都接触不到外面的世界！！唯有拥有一个自己的VPN才能翻墙看看外面的世界，这就是成语“一枝红杳出墙来”',
    NULL,
    NULL,
    NULL,
    5,
    NULL,
    'Linux',
    0,
    0,
    NULL,
    0,
    0,
    0,
    2,
    NULL,
    NULL,
    '2017-10-15 17:02:35'
  ),
(
    6,
    'phpMyAdmin连接管理多台MySQL',
    NULL,
    '配置phpMyAdmin下拉选择多台Mysql数据库，这样不用切换数据库连接时每次都要打密码 ',
    'phpMyAdmin连接管理多台MySQL',
    'phpMyAdmin连接管理多台MySQL',
    'phpMyAdmin连接管理多台MySQL',
    6,
    0,
    '',
    0,
    0,
    NULL,
    0,
    0,
    0,
    2,
    '',
    NULL,
    '2020-06-30 16:32:45'
  ),
(
    7,
    '服务器带宽选择（1M带宽同时能承受多少人在线）',
    NULL,
    '在选购主机时会面对一个问题，带宽1M到底能容纳多少人呢?“共享宽带”和“独享宽带”到底选择哪个才好呢？',
    NULL,
    NULL,
    NULL,
    7,
    NULL,
    'Linux',
    0,
    0,
    NULL,
    0,
    0,
    0,
    2,
    NULL,
    NULL,
    '2017-10-18 11:04:29'
  ),
(
    8,
    'Git日常使用',
    NULL,
    'Git最近流行起来了，很多公司平时开发就直接用GIT作为版本管理工具了，不再像以前只有SVN来管理代码和多人协作开发！！所以问题来了，我们必须学会Git的简单使用……',
    NULL,
    NULL,
    NULL,
    8,
    NULL,
    'Git',
    0,
    0,
    NULL,
    0,
    0,
    0,
    2,
    NULL,
    NULL,
    '2017-10-19 14:52:42'
  ),
(
    9,
    '连接VPN出错“ L2TP连接尝试失败 ，因为安全层在初始化与远程计算机的协商时遇到了一个处理错误',
    NULL,
    '重新安半Windows10，连接VPN时出错“ L2TP连接尝试失败:ERROR因为安全层在初始化与远程计算机的协商时遇到了一个处理错误”，真心累，为了能用Google,而不用国内的X度，所以折腾……',
    NULL,
    NULL,
    NULL,
    9,
    NULL,
    'VPN',
    0,
    0,
    NULL,
    0,
    0,
    0,
    2,
    NULL,
    NULL,
    '2017-10-22 12:15:40'
  ),
(
    10,
    '源码编译安装Nginx与PHP ',
    NULL,
    '做为PHP的服务器环境很多人选择LAMP，但是在性能上还是LNMP略胜一筹！所以本站的环境是选择了LNMP（Linux+Nginx+PHP），于是就开始源码编译安装Nginx与PHP ',
    NULL,
    NULL,
    NULL,
    10,
    NULL,
    'Linux',
    0,
    0,
    NULL,
    0,
    0,
    0,
    2,
    NULL,
    NULL,
    '2017-10-28 17:03:31'
  ),
(
    11,
    'SVN(subversion)服务器搭建及配置 ',
    NULL,
    'SVN(subversion)服务器源码编译其实也挺简单的，最重要的是要配置服务端钩子自动更新，这样在测试服中就可以直接SVN更新的代码在WEB中体现出来！当然罗，生产环境不推荐直接用SVN的勾子自动更新代码！但相对来说本站（技术派）这种小型的技术分享网，还是直接用勾子更新代码更为方便些',
    NULL,
    NULL,
    NULL,
    11,
    NULL,
    'svn',
    0,
    0,
    NULL,
    0,
    0,
    0,
    2,
    NULL,
    NULL,
    NULL
  ),
(
    12,
    'SSH2设置SOCKS5代理实现科学上网',
    NULL,
    '为了实现科学上网（可以用谷歌，可以看facebook,可以随意看外国视频），很多同学又架设ss，又架设VPN等一系列设置，把菜鸟一下子就吓得更菜了，看来科学上网这只鸡不是谁都能吃的？？其实错了，只需要一个很简单的SOCKS5代理就可以直接吃鸡（科学上网）啦！！！',
    'SOCKS5代理上谷歌',
    'SOCKS5代理上谷歌',
    'SOCKS5代理上谷歌',
    13,
    0,
    '',
    0,
    0,
    NULL,
    0,
    0,
    0,
    2,
    NULL,
    NULL,
    '2019-10-09 18:24:30'
  ),
(
    13,
    '升级Windows10 Build 17074后VMware Workstation运行出错“与De',
    NULL,
    '今天蛋疼外加无聊，就升级Windows10到开发版Build 17074，没想到虚拟机出错（VMware Workstation 与 Device/Credential Guard 不兼容。在禁用 Device/Credential Guard 后，可以运行 VMware Workstation。有关更多详细信息，请访问http://www.vmware.com/go/turnoff_CG_DG。）',
    NULL,
    NULL,
    NULL,
    14,
    NULL,
    'windwos',
    0,
    0,
    NULL,
    0,
    0,
    0,
    2,
    NULL,
    NULL,
    '2018-01-22 11:58:00'
  ),
(
    14,
    '风创未来----资金短缺',
    NULL,
    '气冲冲从工商局回来后，坐电脑前，想起了这个月公司的社保还没扣缴。上电子税务局，直接选择社保申报，飞快点到扣缴费...',
    '风创未来 小说',
    '风创未来创业故事',
    '风创未来创始人奋斗故事',
    15,
    0,
    '',
    0,
    0,
    NULL,
    0,
    0,
    0,
    1,
    'luck',
    1539704692,
    '2018-10-17 01:06:19'
  ),
(
    15,
    'Linux开机自动启动（适用于Debina、Ubuntu）',
    NULL,
    '很多时候，自己源码编译的软件都想设置为开机自动启动，免得机器不小心重启后还要手动去开启服务；特别是mysql、PHP、 Nginx等；',
    'Linux开机自动启动（适用于Debina、Ubuntu）',
    'Linux开机自动启动;Debina开机自动启动;Ubuntu开机自动启动;',
    'Linux开机自动启动（适用于Debina、Ubuntu）',
    16,
    0,
    '',
    0,
    0,
    NULL,
    0,
    0,
    0,
    1,
    '蜜蜂Linux',
    1540521595,
    '2018-10-26 10:41:50'
  ),
(
    16,
    '都在一条船上',
    NULL,
    '收到140万元赞赏网络爆文，但7月24日下午，文章发布平台“张凯律师”一号已因被投诉，涉嫌违反《即时通信工具公众信息服务发展管理暂行规定》被屏蔽所有功能。但这么好的文章不应该沉没，特别转发、留存、欣赏。虽然文章笔记很差，但是说的很事实，大家自己观看，自己觉得是真还是假！不管你信不信，反正我是信了！！！ ',
    '假疫苗事件，都在一条船上－－张凯律师',
    '假疫苗事件;都在一条船上;张凯律师;地沟油;',
    '假疫苗事件;都在一条船上;张凯律师，出处：http://blog.sina.com.cn/s/blog_13f88c2ed0102yq5w.html　假疫苗事件;都在一条船上;张凯律师;地沟油;\"皮革奶\"风波;\"三聚氰胺\"事件;三聚氰胺;疫苗问题;长生生物;\r\n上联：满朝文武藏绿卡，下联： 半壁江山养红颜，横批：颜色革命',
    17,
    0,
    '',
    0,
    1,
    NULL,
    0,
    0,
    0,
    1,
    '张凯律师',
    1542695844,
    '2018-11-20 15:28:44'
  );

/*!40000 ALTER TABLE `article` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `article_category`
--
DROP TABLE IF EXISTS `article_category`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `article_category` (
  `id` tinyint(20) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category` varchar(20) NOT NULL COMMENT '文章分类名',
  `seo_title` varchar(255) DEFAULT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) DEFAULT NULL COMMENT 'SEO关键词',
  `seo_description` varchar(255) DEFAULT NULL COMMENT 'SEO描述',
  `show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示：默认1显示，0不显示',
  `order_by` int(1) DEFAULT 1 COMMENT '显示先后:小前大后',
  `modify_id` int(11) unsigned DEFAULT NULL COMMENT '最后修改者ID',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_id` int(11) unsigned DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `category` (`category`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8 COMMENT = '文章分类表';

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `article_category`
--
LOCK TABLES `article_category` WRITE;

/*!40000 ALTER TABLE `article_category` DISABLE KEYS */
;

INSERT INTO
  `article_category`
VALUES
  (
    5,
    'Flutter 象棋0',
    '0',
    '0',
    '3',
    0,
    1,
    1,
    '2020-06-30 21:10:59',
    1,
    '2020-06-30 12:36:29'
  ),
(
    6,
    'Linux',
    's',
    's',
    's',
    1,
    1,
    NULL,
    NULL,
    1,
    '2020-06-30 21:10:55'
  );

/*!40000 ALTER TABLE `article_category` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `article_content`
--
DROP TABLE IF EXISTS `article_content`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `article_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内容ID',
  `content` text DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 22 DEFAULT CHARSET = utf8 COMMENT = '文章类内容表';

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `article_content`
--
LOCK TABLES `article_content` WRITE;

/*!40000 ALTER TABLE `article_content` DISABLE KEYS */
;

INSERT INTO
  `article_content`
VALUES
  (
    1,
    '                                                                                                  <br><h5>一、检查硬件及系统</h5>\r\n										<ol>\r\n											<li>查看VPS虚拟架构：</li>\r\n											<pre><code>\r\nroot@Toka:~# dmidecode -t 1\r\n# dmidecode 2.12\r\nSMBIOS 2.4 present.\r\n\r\nHandle 0x0100, DMI type 1, 27 bytes\r\nSystem Information\r\n		Manufacturer: Red Hat\r\n		Product Name: KVM\r\n		Version: RHEL 7.0.0 PC (i440FX + PIIX, 1996)\r\n		Serial Number: Not Specified\r\n		UUID: FA7BF371-7B90-4E7D-9A06-FC98D2FC234F\r\n		Wake-up Type: Power Switch\r\n		SKU Number: Not Specified\r\n		Family: Red Hat Enterprise Linux\r\nroot@Toka:~# 这一台是KVM架构的VPS，还有QEMU、Xen、VMware\r\nroot@Toka:~# 相对来说KVM是比较贵的,也比较稀少,下面这台是QEMU\r\n\r\nroot@Hotf:~# dmidecode -t 1\r\n# dmidecode 2.12\r\nSMBIOS 2.8 present.\r\n\r\nHandle 0x0100, DMI type 1, 27 bytes\r\nSystem Information\r\n        Manufacturer: QEMU\r\n        Product Name: Standard PC (i440FX + PIIX, 1996)\r\n        Version: pc-i440fx-2.1\r\n        Serial Number: 1ecccaa5-3bc5-40cd-b0a5-0066e4de084a\r\n        UUID: 1ECCCAA5-3BC5-40CD-B0A5-0066E4DE084A\r\n        Wake-up Type: Power Switch\r\n        SKU Number: Not Specified\r\n        Family: Not Specified\r\n\r\n											</code></pre>\r\n											<li>查看系统版本：</li> \r\n											<pre><code>\r\nroot@Toka:~# cat /etc/issue\r\nDebian GNU/Linux 9 \\n \\l\r\nroot@Toka:~# lsb_release -a\r\nNo LSB modules are available.\r\nDistributor ID: Debian\r\nDescription:    Debian GNU/Linux 9.1 (stretch)\r\nRelease:        9.1\r\nCodename:       stretch\r\nroot@Toka:~# cat /etc/os-release \r\nPRETTY_NAME=\"Debian GNU/Linux 9 (stretch)\"\r\nNAME=\"Debian GNU/Linux\"\r\nVERSION_ID=\"9\"\r\nVERSION=\"9 (stretch)\"\r\nID=debian\r\nHOME_URL=\"https://www.debian.org/\"\r\nSUPPORT_URL=\"https://www.debian.org/support\"\r\nBUG_REPORT_URL=\"https://bugs.debian.org/\"\r\nroot@Toka:~# cat /proc/version \r\nLinux version 4.9.0-3-amd64 (debian-kernel@lists.debian.org) (gcc version 6.3.0 20170516 (Debian 6.3.0-18) ) #1 SMP Debian 4.9.30-2+deb9u2 (2017-06-26)\r\nroot@Toka:~# uname -a\r\nLinux Toka 4.9.0-3-amd64 #1 SMP Debian 4.9.30-2+deb9u2 (2017-06-26) x86_64 GNU/Linux									</code></pre>\r\n											<li>查看是否为64位系统：</li>\r\n											<pre><code>\r\n[root@tokay.win(CentOS):~#] file /sbin/init\r\n/sbin/init: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.18, stripped\r\nroot@toka.pro(Debian):~# file /lib/systemd/systemd\r\n/lib/systemd/systemd: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=9c328d5dd958a001ea35a2bd711ff5ec2b648a21, stripped\r\nroot@www.xdiary.win(Debian):~# Debian系列与CentOS系列所执行的命令行并不相同！</code>如果看到有<b>x86-64</b>字样，则是64位Linux操作系统。</pre>\r\n\r\n											<li>查看CPU信息：</li>\r\n											<pre><code>\r\nroot@toka.pro:~# dmidecode -t 4\r\n# dmidecode 2.12\r\nSMBIOS 2.4 present.\r\n\r\nHandle 0x0401, DMI type 4, 32 bytes\r\nProcessor Information\r\n        Socket Designation: CPU 1\r\n        Type: Central Processor\r\n        Family: Other\r\n        Manufacturer: Bochs\r\n        ID: D3 06 00 00 FD FB 8B 07\r\n        Version: Not Specified\r\n        Voltage: Unknown\r\n        External Clock: Unknown\r\n        Max Speed: 2000 MHz\r\n        Current Speed: 2000 MHz\r\n        Status: Populated, Enabled\r\n        Upgrade: Other\r\n        L1 Cache Handle: Not Provided\r\n        L2 Cache Handle: Not Provided\r\n        L3 Cache Handle: Not Provided\r\n\r\nroot@toka.pro:~# cat /proc/cpuinfo\r\nprocessor       : 0\r\nvendor_id       : GenuineIntel\r\ncpu family      : 6\r\nmodel           : 45\r\nmodel name      : Intel(R) Xeon(R) CPU E5-2620 0 @ 2.00GHz\r\nstepping        : 7\r\nmicrocode       : 1796\r\ncpu MHz         : 1999.996\r\ncache size      : 15360 KB\r\nphysical id     : 0\r\nsiblings        : 12\r\ncore id         : 0\r\ncpu cores       : 6\r\napicid          : 0\r\ninitial apicid  : 0\r\nfpu             : yes\r\nfpu_exception   : yes\r\ncpuid level     : 13\r\nwp              : yes\r\nflags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good xtopology nonstop_tsc aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid dca sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm ida arat epb pln pts dtherm tpr_shadow vnmi flexpriority ept vpid xsaveopt\r\nbogomips        : 3999.99\r\nclflush size    : 64\r\ncache_alignment : 64\r\naddress sizes   : 46 bits physical, 48 bits virtual\r\npower management:\r\n											</code></pre>\r\n\r\n											<li>查看内存信息:</li>\r\n											<pre>命令 <b>free -m</b> 与 <b>cat /proc/meminfo</b> 都可以查看到内存的信息<code>\r\nroot@toka.pro:~# dmidecode -t 16\r\n# dmidecode 2.12\r\nSMBIOS 2.4 present.\r\n\r\nHandle 0x1000, DMI type 16, 15 bytes\r\nPhysical Memory Array\r\n        Location: Other\r\n        Use: System Memory\r\n        Error Correction Type: Multi-bit ECC\r\n        Maximum Capacity: 2 GB\r\n        Error Information Handle: Not Provided\r\n        Number Of Devices: 1\r\nroot@toka.pro:~# free -m\r\n             total       used       free     shared    buffers     cached\r\nMem:          1024        252        771         58          0        169\r\n-/+ buffers/cache:         82        941\r\nSwap:          512         68        443\r\nroot@toka.pro:~# cat /proc/meminfo\r\nMemTotal:        1048576 kB\r\nMemFree:          793792 kB\r\nCached:           172064 kB\r\nBuffers:               0 kB\r\nActive:            93472 kB\r\nInactive:          90004 kB\r\nActive(anon):      32580 kB\r\nInactive(anon):    37488 kB\r\nActive(file):      60892 kB\r\nInactive(file):    52516 kB\r\nUnevictable:           0 kB\r\nMlocked:               0 kB\r\nSwapTotal:        524288 kB\r\nSwapFree:         454312 kB\r\nDirty:                24 kB\r\nWriteback:             0 kB\r\nAnonPages:         70068 kB\r\nShmem:             58656 kB\r\nSlab:              12640 kB\r\nSReclaimable:       4748 kB\r\nSUnreclaim:         7892 kB\r\n											</code></pre>\r\n\r\n											<li>查看硬盘（磁盘）：</li>\r\n											<pre><code>\r\nroot@hotf-net:~# fdisk -l\r\nDisk /dev/vda: 20 GiB, 21474836480 bytes, 41943040 sectors\r\nUnits: sectors of 1 * 512 = 512 bytes\r\nSector size (logical/physical): 512 bytes / 512 bytes\r\nI/O size (minimum/optimal): 512 bytes / 512 bytes\r\nDisklabel type: dos\r\nDisk identifier: 0xeec04523\r\n\r\nDevice     Boot Start      End  Sectors Size Id Type\r\n/dev/vda1  *     2048 41940991 41938944  20G 83 Linux\r\n\r\n\r\nDisk /dev/vdb: 20 GiB, 21474836480 bytes, 41943040 sectors\r\nUnits: sectors of 1 * 512 = 512 bytes\r\nSector size (logical/physical): 512 bytes / 512 bytes\r\nI/O size (minimum/optimal): 512 bytes / 512 bytes\r\nroot@hotf-net:~# 以上表示本机有vda（20GB,已分区使用）、vdb（20GB，未分区未使用）两块硬盘\r\n											</code></pre>\r\n<li>分区并挂载硬盘（磁盘）：</li>\r\n											<pre><code>\r\nroot@hotf-net:~# 进入vdb磁盘，对vdb磁盘进行分区\r\nroot@hotf-net:~# fdisk /dev/vdb\r\n欢迎使用 fdisk (util-linux 2.25.2)。\r\n更改将停留在内存中，直到您决定将更改写入磁盘。\r\n使用写入命令前请三思。\r\n\r\n命令(输入 m 获取帮助)：m\r\n\r\n帮助：\r\n\r\n  DOS (MBR)\r\n   a   开关 可启动 标志\r\n   b   编辑嵌套的 BSD 磁盘标签\r\n   c   开关 dos 兼容性标志\r\n\r\n  常规\r\n   d   删除分区\r\n   l   列出已知分区类型\r\n   n   添加新分区\r\n   p   打印分区表\r\n   t   更改分区类型\r\n   v   检查分区表\r\n\r\n  杂项\r\n   m   打印此菜单\r\n   u   更改 显示/记录 单位\r\n   x   更多功能(仅限专业人员)\r\n\r\n  保存并退出\r\n   w   将分区表写入磁盘并退出\r\n   q   退出而不保存更改\r\n\r\n  新建空磁盘标签\r\n   g   新建一份 GPT 分区表\r\n   G   新建一份空 GPT (IRIX) 分区表\r\n   o   新建一份的空 DOS 分区表\r\n   s   新建一份空 Sun 分区表\r\n\r\n命令(输入 m 获取帮助)：n               #这里输入m可以查看命令，n不查看帮助命令\r\n分区类型\r\n   p   主分区 (1个主分区，0个扩展分区，3空闲)\r\n   e   扩展分区 (逻辑分区容器)\r\n选择 (默认 p)：p                        #回车直接建主分区\r\n分区号 (1-4，默认 1)： 1                #输入1，建立第一分区\r\nFirst sector (2048-41943039, default 2048):             #直接回车\r\nLast sector, +sectors or +size{K,M,G,T,P} (2048-41943039, default 41943039):  \r\n                                                        #这里注意直接回车将分所有容量，不然要输入大小\r\n\r\nCreated a new partition 1 of type \'Linux\' and of size 20 GiB.\r\n\r\n命令(输入 m 获取帮助)： w               # w为保存退出，q退出而不保存更改\r\nThe partition table has been altered.\r\nCalling ioctl() to re-read partition table.\r\nSyncing disks.                          # 到此分区完成，接下来挂载！！！\r\nroot@hotf-net:~# 再查看当前硬盘状态，是否已改变？？\r\nroot@hotf-net:~# fdisk -l\r\nDisk /dev/vda: 20 GiB, 21474836480 bytes, 41943040 sectors\r\nUnits: sectors of 1 * 512 = 512 bytes\r\nSector size (logical/physical): 512 bytes / 512 bytes\r\nI/O size (minimum/optimal): 512 bytes / 512 bytes\r\nDisklabel type: dos\r\nDisk identifier: 0xeec04523\r\n\r\nDevice     Boot Start      End  Sectors Size Id Type\r\n/dev/vda1  *     2048 41940991 41938944  20G 83 Linux\r\n\r\n\r\nDisk /dev/vdb: 20 GiB, 21474836480 bytes, 41943040 sectors\r\nUnits: sectors of 1 * 512 = 512 bytes\r\nSector size (logical/physical): 512 bytes / 512 bytes\r\nI/O size (minimum/optimal): 512 bytes / 512 bytes\r\nDisklabel type: dos\r\nDisk identifier: 0x41c95590\r\n\r\nDevice     Boot Start      End  Sectors Size Id Type\r\n/dev/vdb1        2048 41943039 41940992  20G 83 Linux\r\nroot@hotf-net:~# 格式化刚才新建的分区，将/dev/vdb1格式化为ext4类型\r\nroot@hotf-net:~# mkfs.ext4 /dev/vdb1\r\nmke2fs 1.44.1 (24-Mar-2018)\r\nCreating filesystem with 5242624 4k blocks and 1310720 inodes\r\nFilesystem UUID: 04578bcb-96c1-477d-9f38-875bd0e5aef9\r\nSuperblock backups stored on blocks: \r\n        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, \r\n        4096000\r\n\r\nAllocating group tables: done                            \r\nWriting inode tables: done                            \r\nCreating journal (32768 blocks): done\r\nWriting superblocks and filesystem accounting information: done   \r\n\r\nroot@hotf-net:~# 创建挂载目录\r\nroot@hotf-net:~# mkdir /data\r\nroot@hotf-net:~# 挂载/dev/vdb1到/data\r\nroot@hotf-net:~# mount /dev/vdb1 /data\r\nroot@hotf-net:~# df -h\r\nFilesystem      Size  Used Avail Use% Mounted on\r\nudev            967M     0  967M   0% /dev\r\ntmpfs           200M  5.2M  195M   3% /run\r\n/dev/vda1        20G  9.7G  9.0G  52% /\r\ntmpfs           997M     0  997M   0% /dev/shm\r\ntmpfs           5.0M     0  5.0M   0% /run/lock\r\ntmpfs           997M     0  997M   0% /sys/fs/cgroup\r\ntmpfs           200M     0  200M   0% /run/user/0\r\n/dev/vdb1        20G   45M   19G   1% /data\r\nroot@hotf-net:~# 看，已挂载成,现在可以用新的硬盘了，但重启后还要重新挂载！！\r\nroot@hotf-net:~# 所以要配置开机自动挂载\r\nroot@hotf-net:~# vim /etc/fstab\r\n#加入如下行,保存\r\n/dev/vdb1       /data      ext4    defaults   0   0\r\nroot@hotf-net:~# 更兼容式的自动挂载是用UUID来代替/dev/vdb1\r\nroot@hotf-net:~# 找到分区的UUID（先查看硬盘分区的UUID）\r\nroot@hotf-net:~# blkid\r\n/dev/vda1: UUID=\"7cef075a-e1dc-43f2-82cf-7b135e22a302\" TYPE=\"ext4\" PARTUUID=\"eec04523-01\"\r\n/dev/vdb1: UUID=\"04578bcb-96c1-477d-9f38-875bd0e5aef9\" TYPE=\"ext4\" PARTUUID=\"41c95590-01\"\r\nroot@hotf-net:~# vim /etc/fstab\r\n# 用UUID代替“/dev/sdb1”这样才更有兼容性\r\nUUID=\"04578bcb-96c1-477d-9f38-875bd0e5aef9\" /data       ext4  defaults   0    0\r\nroot@hotf-net:~# OK，可以重启看下是否真的会自动挂载了!!!\r\n											</code></pre>\r\n\r\n											<li>查看分区容量情况：</li><pre><code>root@hotf-net:~# df -h\r\nFilesystem      Size  Used Avail Use% Mounted on\r\nudev            967M     0  967M   0% /dev\r\ntmpfs           200M  5.1M  195M   3% /run\r\n/dev/vda1        20G  9.7G  8.9G  53% /\r\ntmpfs           997M     0  997M   0% /dev/shm\r\ntmpfs           5.0M     0  5.0M   0% /run/lock\r\ntmpfs           997M     0  997M   0% /sys/fs/cgroup\r\n/dev/vdb1        20G   45M   19G   1% /data\r\ntmpfs           200M     0  200M   0% /run/user/0\r\nroot@hotf-net:~# 这里可以看到分区及硬盘挂载情况									</code></pre>\r\n\r\n											<li>测试VPS主机磁盘IO的性能,也是区分是否为固态硬盘重要依据：</li>\r\n											<pre><code>\r\nroot@toka.pro:~# time dd if=/dev/zero bs=1024k of=tstfile count=1024\r\n记录了1024+0 的读入\r\n记录了1024+0 的写出\r\n1073741824 bytes (1.1 GB, 1.0 GiB) copied, 8.19455 s, 131 MB/s\r\n\r\nreal    0m8.219s\r\nuser    0m0.000s\r\nsys     0m2.544s\r\nroot@toka.pro:~# dd if=tstfile bs=1024k of=/dev/null count=1024\r\n录了1024+0 的读入\r\n记录了1024+0 的写出\r\n1073741824 bytes (1.1 GB, 1.0 GiB) copied, 0.257606 s, 4.2 GB/s\r\nroot@toka.pro:~# dd if=tstfile of=/dev/null bs=1M count=1024\r\n记录了1024+0 的读入\r\n记录了1024+0 的写出\r\n1073741824 bytes (1.1 GB, 1.0 GiB) copied, 0.299709 s, 3.6 GB/s\r\nroot@toka.pro:~# \r\nroot@toka.pro:~# dd if=/dev/zero of=test bs=64k count=4k oflag=dsync\r\n记录了4096+0 的读入\r\n记录了4096+0 的写出\r\n268435456 bytes (268 MB, 256 MiB) copied, 5.91183 s, 45.4 MB/s\r\nroot@toka.pro:~# dd if=/dev/zero of=test bs=8k count=256k conv=fdatasync\r\n记录了262144+0 的读入\r\n记录了262144+0 的写出\r\n2147483648 bytes (2.1 GB, 2.0 GiB) copied, 3.79961 s, 565 MB/s\r\nroot@toka.pro:~# 这台固态硬盘，普通硬盘在 10.2 MB/s、44.9 MB/s左右\r\n											</code></pre>\r\n										</ol>\r\n									<h5>二、修改密码及配制密钥登录</h5>\r\n										<ol>\r\n											<li>修改密码：passwd</li>\r\n											<li>配置密钥登录：</li>\r\n											<pre><code>\r\nroot@toka.pro:~# mkdir ~/.ssh\r\nroot@toka.pro:~# chmod 700 ~/.ssh\r\nroot@toka.pro:~# 把用SecureCRT创建的RSA公钥Identity.pub上传到服务器,再把公钥加入authorized_keys中\r\nroot@toka.pro:~# ssh-keygen -i -f Identity.pub >> ~/.ssh/authorized_keys \r\nroot@toka.pro:~# chmod 600 ~/.ssh/authorized_keys\r\nroot@toka.pro:~# /etc/init.d/ssh restart\r\nroot@toka.pro:~# 重启SSH,试下用私钥登录(CentOS系列：/etc/init.d/sshd restart)，如还不能成功用私钥登录，请再按以下修改ssh配置\r\nroot@toka.pro:~# vim /etc/ssh/sshd_config\r\n	TCPKeepAlive yes         #保持连接\r\n	ClientAliveInterval 60   #每一分问一次客户端在不在\r\n	ClientAliveCountMax 3    #客户端3次没回应才断开(手动增加)\r\n	RSAAuthentication yes    #RSA认证\r\n	PubkeyAuthentication yes  #开启公钥验证\r\n	#验证文件路径，这个可以不更改它,因为上面用的就是这个目录\r\n	AuthorizedKeysFile    %h/.ssh/authorized_keys  #公钥存放路径，默认不用修改\r\n	PasswordAuthentication no   #一定要测试私钥可以登录后才能关闭常规的密码登录,不然将再也远程登录不了\r\nroot@toka.pro:~# /etc/init.d/ssh restart\r\n											</code></pre>\r\n										</ol>\r\n\r\n									<h5>三、配制bash高亮及当前系统位置提示</h5>\r\n										<ol>\r\n											<li>配制高亮bash：</li>\r\n											<blockquote>\r\n											  \r\n											  <pre><code>\r\nroot@toka.pro:~# vim ~/.bashrc\r\n	###使以下几行生效,去掉以下几行头部“#”就可以了###\r\n	export LS_OPTIONS=\\\"--color=auto\\\"\r\n	eval \"`dircolors`\"\r\n	alias ls=\\\"ls $LS_OPTIONS\\\"\r\n	alias ll=\\\"ls $LS_OPTIONS -l\\\"\r\n	alias l=\\\"ls $LS_OPTIONS -lA\\\"\r\n						                      </code></pre>\r\n						                      <p>保存退出,重新登录后就可看到效果</p>\r\n						                    </blockquote>\r\n										\r\n											<li>配制vim高亮语法与默认编码：</li>\r\n											<pre><code>\r\nroot@toka.pro:~# 在当前家目录下添加或修改.vimrc\r\nroot@toka.pro:~# vim ~/.vimrc\r\n	syntax on\r\n	set number\r\n	set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936\r\n	set termencoding=utf-8\r\n	set encoding=utf-8	\r\nroot@toka.pro:~# 保存退出,如果还没有高亮语法的话,确认安装了vim-enhanced，再在/etc/profile末尾加入此句\r\nroot@toka.pro:~# vim /etc/profile\r\n	export TERM=xterm-color       #这样就可以高亮显示了\r\n											</code></pre>\r\n\r\n											<li>修改系统提示：</li>\r\n											<pre><code>\r\nroot@toka.pro:~# 修改hostname\r\nroot@toka.pro:~# vim /etc/hostname\r\n    ###修改为hotf###\r\n    hotf \r\nroot@toka.pro:~# 记得要修改/etc/hosts,（因为不修改可能会导致解析错误等等）\r\nroot@toka.pro:~# vim /etc/hosts\r\n    ###记得要把127.0.1.1 这行中旧的hostname改为现在新的###\r\n    ###不然会出现解析错误等问题（如Nginx中不能正确识别网站的虚拟目录设置）\r\n    127.0.1.1    hotf\r\nroot@toka.pro:~# 重启之后以上两项修改正式生效\r\nroot@toka.pro:~# vim ~/.bashrc\r\n	###把PS1这一行改成如下###\r\n	PS1=\'\\[\\e[31m\\]\\u\\[\\e[36m\\]@\\[\\e[35m\\]\\h\\[\\e[32m\\]:\\[\\e[34m\\]\\w\\[\\e[33m\\]\\$\\[\\e[m\\] \' \r\nroot@toka.pro:~# 保存退出,重新登录生效\r\n											</code></pre>\r\n										</ol>\r\n\r\n									<h5>四、中文环境与中国时间</h5>\r\n									<blockquote>\r\n										<ol>\r\n											<li>查系统所支持的区域是否有中文：</li>\r\n											<pre><code>\r\nroot@hotf:~# locale -a|grep zh\r\nzh_CN.gb18030\r\nzh_CN.gbk\r\nzh_CN.utf8\r\nroot@hotf:~# 如果有以上zh_CN字样输出，证明已经支持中文了\r\nroot@hotf:~# 如果没有任何输出，则需要重新安装中文语言包\r\n											</code></pre>\r\n\r\n											<li>安装必要的中文字体包：</li>\r\n											<pre><code>\r\nroot@hotf:~# 安装ttf-arphic-uming scim-tables-zh im-switch xfonts-intl-chinese  fonts-noto  ttf-wqy-microhei 中其中一个字体包就可					\r\nroot@hotf:~# apt-get install ttf-wqy-microhei\r\n											</code></pre>\r\n\r\n											<li>更新对应的locales文：</li>\r\n											<pre><code>\r\nroot@hotf:~# dpkg-reconfigure locales\r\nroot@hotf:~# 选择zh_CN.UTF-8安装\r\n											</code></pre>\r\n\r\n											<li>设置默认为中文UTF-8：</li>\r\n											<pre><code>\r\nroot@hotf:~# vim /etc/default/locale \r\n	###设置默认为中文UTF-8\r\n	LANG=\"zh_CN.UTF-8\"  \r\nroot@hotf:~# 保存退出     \r\n											</code></pre>\r\n\r\n											<li>修改时间时区：</li>\r\n											<pre><code>\r\nroot@hotf:~# dpkg-reconfigure tzdata \r\nroot@hotf:~# 首先选择区：Asia(亚洲)\r\nroot@hotf:~# 接着选择时地区：shanghai(上海)\r\nroot@hotf:~# date\r\n2016年 12月 15日 星期四 00:38:09 CST\r\nroot@hotf:~# 时间不对，同步时间\r\nroot@hotf:~# apt-get install ntpdate\r\nroot@hotf:~# ntpdate-debian\r\n15 Dec 16:42:10 ntpdate[5693]: step time server 210.23.25.77 offset 57601.167265 sec\r\nroot@hotf:~# date\r\n2016年 12月 15日 星期四 16:42:15 CST\r\nroot@hotf:~# 时间同步过来了\r\n\r\n											</code></pre>\r\n										</ol>\r\n									</blockquote>\r\n\r\n									<h5><br></h5>\r\n<h5>五、增加SWAP空間大小</h5>\r\n<li>增加ｓｗａｐ交換空間：</li>\r\n<ol>\r\n<pre><code>\r\nroot@elapse.date:~# mkdir /swap\r\nroot@elapse.date:~# cd /swap/\r\nroot@elapse.date:/swap# 下面這條命令中的count大小爲swap大小，這裏是6G\r\nroot@elapse.date:/swap# dd if=/dev/zero of=swapfile bs=1024 count=6144000\r\n记录了6144000+0 的读入\r\n记录了6144000+0 的写出\r\n6291456000 bytes (6.3 GB, 5.9 GiB) copied, 59.5233 s, 106 MB/s\r\nroot@elapse.date:/swap# 把生成的文件转换成 Swap 文件 \r\nroot@elapse.date:/swap# mkswap -f swapfile\r\nmkswap: swapfile：不安全的权限 0644，建议使用 0600。\r\n正在设置交换空间版本 1，大小 = 5.9 GiB (6291451904  个字节)\r\n无标签，UUID=fc65ef64-e5b2-46bb-a933-175e5f6dc6da\r\nroot@elapse.date:/swap# 激活 Swap 文件\r\nroot@elapse.date:/swap# swapon swapfile\r\nswapon: /swap/swapfile：不安全的权限 0644，建议使用 0600。\r\nroot@elapse.date:/swap# 查看下是否加到swqp空間裏了\r\nroot@elapse.date:/swap# free -m\r\n              total        used        free      shared  buff/cache   available\r\nMem:           3828        1143         177           2        2506        2438\r\nSwap:          5999           0        5999\r\nroot@elapse.date:/swap# 添加成功\r\nroot@elapse.date:/swap# 如要千載這個swap文件使用如下命令\r\nroot@elapse.date:/swap# swapoff swapfile\r\nroot@elapse.date:/swap#								</code></pre>\r\n</ol>\r\n<li>保持这个swap空間重啓後也能生效</li>\r\n<ol>\r\n<pre><code>\r\nroot@elapse.date:~# vim /etc/fstab\r\n＃添加如下行\r\n/swap/swapfile       /swap                swap       defaults              0 0\r\n \r\n</code></pre>\r\n</ol>\r\n<h5><code>\r\n\r\n<h5><code>六、安装必装软件</code></h5><code>\r\n										<ol>\r\n											<li>apt-get install vim rar unrar </li>\r\n											<li>apt-get install build-essential</li>\r\n											<li>apt-get install libtool cmake libncurses5-dev</li>\r\n										</ol>\r\n										<p>接下来安装自己所需要的服务就可，如LAMP,<a href=\"javascript:void(0)\">LNMP</a>,VPN等\r\n										</p><p>……</p></code></code></h5>                                                                                    '
  ),
(
    2,
    '								<h5>查看Linux下的硬盘：</h5>\r\n								<pre><span style=\"white-space: pre-wrap;\">root@Toka:~# fdisk -l\r\nDisk /dev/sda: 119.2 GiB, 128035676160 bytes, 250069680 sectors\r\nUnits: sectors of 1 * 512 = 512 bytes\r\nSector size (logical/physical): 512 bytes / 512 bytes\r\nI/O size (minimum/optimal): 512 bytes / 512 bytes\r\nDisklabel type: dos\r\nDisk identifier: 0x44e5be3f\r\n\r\n设备       启动     Start    末尾    扇区   Size Id 类型\r\n/dev/sda1  *         2048 230152191 230150144 109.8G 83 Linux\r\n/dev/sda2       230154238 250068991  19914754   9.5G  5 扩展\r\n/dev/sda5       230154240 250068991  19914752   9.5G 82 Linux 交换 / Solaris\r\n\r\n\r\nDisk /dev/sdb: 119.2 GiB, 128035676160 bytes, 250069680 sectors\r\nUnits: sectors of 1 * 512 = 512 bytes\r\nSector size (logical/physical): 512 bytes / 512 bytes\r\nI/O size (minimum/optimal): 512 bytes / 512 bytes\r\nDisklabel type: dos\r\nDisk identifier: 0x0bf0152e\r\n\r\n\r\nDisk /dev/sdc: 465.8 GiB, 500107862016 bytes, 976773168 sectors\r\nUnits: sectors of 1 * 512 = 512 bytes\r\nSector size (logical/physical): 512 bytes / 512 bytes\r\nI/O size (minimum/optimal): 512 bytes / 512 bytes\r\nDisklabel type: dos\r\nDisk identifier: 0xff56d139\r\n\r\n设备       启动 Start    末尾    扇区 Size Id 类型\r\n/dev/sdc1  *     2048 186650623 186648576  89G  7 HPFS/NTFS/exFAT\r\nroot@Toka:~# </span><br></pre>		\r\n								<p>这里可以看到有三块硬盘：Disk /dev/sda: 119.2 GiB，Disk /dev/sdb: 119.2 GiB，Disk /dev/sdc: 465.8 GiB,<br>其中&nbsp;/dev/sdb还没有分区，而&nbsp;/dev/sda这一块已分区成了三个区，/dev/sdc这一块只分了一个89G的区，还有465.8 - 89 GB未分区<br>\r\n							    而我们现在就是要先把sdb这一块硬盘分区并使用起来</p>\r\n                 <pre><code>\r\nroot@Toka:~# fdisk /dev/sdb\r\n\r\nWelcome to fdisk (util-linux 2.27.1).                                           欢迎使用 fdisk \r\nChanges will remain in memory only, until you decide to write them.             更改将停留在内存中，直到您决定将更改写入磁盘。\r\nBe careful before using the write command.                                      使用写入命令前请三思。\r\n\r\n命令(输入 m 获取帮助)：m\r\n\r\n帮助：\r\n\r\n  DOS (MBR)\r\n   a   toggle a bootable flag                                        开关 可启动 标志\r\n   b   edit nested BSD disklabel                                     编辑嵌套的 BSD 磁盘标签\r\n   c   toggle the dos compatibility flag                             开关 dos 兼容性标志\r\n\r\n  Generic                                                      常规\r\n   d   delete a partition                                            删除分区\r\n   l   list known partition types                                    列出已知分区类型\r\n   n   add a new partition                                           添加新分区\r\n   p   print the partition table                                     打印分区表\r\n   t   change a partition type                                       更改分区类型\r\n   v   verify the partition table                                    检查分区表\r\n\r\n  Misc                                                         杂项\r\n   m   print this menu                                               打印此菜单\r\n   u   change display/entry units                                    更改 显示/记录 单位\r\n   x   extra functionality (experts only)                            更多功能(仅限专业人员)\r\n\r\n  Save &amp; Exit                                                  保存并退出\r\n   w   write table to disk and exit                                  将分区表写入磁盘并退出\r\n   q   quit without saving changes                                   退出而不保存更改\r\n\r\n  Create a new label                                           新建空磁盘标签\r\n   g    create a new empty GPT partition table                       新建一份 GPT 分区表\r\n   G   create a new empty SGI (IRIX) partition table                 新建一份空 GPT (IRIX) 分区表\r\n   o   create a new empty DOS partition table                        新建一份的空 DOS 分区表\r\n   s   create a new empty Sun partition table                        新建一份空 Sun 分区表\r\n\r\n\r\n命令(输入 m 获取帮助)：n               #这里输入m可以查看命令，n不查看帮助命令\r\n分区类型\r\n   p   主分区 (1个主分区，0个扩展分区，3空闲)\r\n   e   扩展分区 (逻辑分区容器)\r\n选择 (默认 p)：p                         #回车直接建主分区\r\n分区号 (1-4，默认 1)： 1                 #输入1，建立第一分区\r\nFirst sector (2048-16777215, default 2048):             #直接回车\r\nLast sector, +sectors or +size{K,M,G,T,P} (2048-16777215, default 16777215):  \r\n                                        #这里注意直接回车将分所有容量，不然要输入大小\r\nCreated a new partition 1 of type \'Linux\' and of size 8 GiB.\r\n\r\n命令(输入 m 获取帮助)： w                # w为保存退出，q退出而不保存更改\r\nThe partition table has been altered.\r\nCalling ioctl() to re-read partition table.\r\nSyncing disks.                        \r\n\r\n							    </code></pre>	\r\n							    <p>到此分区完成，接下来挂载分区来使用！！！</p>\r\n							    <pre><code>\r\nroot@Toka:~# 再查看当前硬盘状态,看现的分区状况\r\nroot@Toka:~# fdisk -l\r\nDisk /dev/sda: 119.2 GiB, 128035676160 bytes, 250069680 sectors\r\nUnits: sectors of 1 * 512 = 512 bytes\r\nSector size (logical/physical): 512 bytes / 512 bytes\r\nI/O size (minimum/optimal): 512 bytes / 512 bytes\r\nDisklabel type: dos\r\nDisk identifier: 0x44e5be3f\r\n\r\n设备       启动     Start    末尾    扇区   Size Id 类型\r\n/dev/sda1  *         2048 230152191 230150144 109.8G 83 Linux\r\n/dev/sda2       230154238 250068991  19914754   9.5G  5 扩展\r\n/dev/sda5       230154240 250068991  19914752   9.5G 82 Linux 交换 / Solaris\r\n\r\n\r\nDisk /dev/sdb: 119.2 GiB, 128035676160 bytes, 250069680 sectors\r\nUnits: sectors of 1 * 512 = 512 bytes\r\nSector size (logical/physical): 512 bytes / 512 bytes\r\nI/O size (minimum/optimal): 512 bytes / 512 bytes\r\nDisklabel type: dos\r\nDisk identifier: 0x0bf0152e\r\n\r\n设备       启动 Start    末尾    扇区   Size Id 类型\r\n/dev/sdb1        2048 250069679 250067632 119.2G 83 Linux\r\n\r\n\r\nDisk /dev/sdc: 465.8 GiB, 500107862016 bytes, 976773168 sectors\r\nUnits: sectors of 1 * 512 = 512 bytes\r\nSector size (logical/physical): 512 bytes / 512 bytes\r\nI/O size (minimum/optimal): 512 bytes / 512 bytes\r\nDisklabel type: dos\r\nDisk identifier: 0xff56d139\r\n\r\n设备       启动 Start    末尾    扇区 Size Id 类型\r\n/dev/sdc1  *     2048 186650623 186648576  89G  7 HPFS/NTFS/exFAT\r\n\r\nroot@Toka:~# 在上面可以看到<span style=\"background-color: transparent; color: inherit; font-size: inherit;\">sdb</span><span style=\"background-color: transparent; color: inherit; font-size: inherit;\">直接分成了一个区了</span><span style=\"background-color: transparent; color: inherit; font-size: inherit;\">sdb1</span><span style=\"background-color: transparent; color: inherit; font-size: inherit;\"><br></span>						    	</code></pre>	\r\n						    	<p>接下来还要格式化刚才新建的分区(<span style=\"background-color: transparent; color: inherit; font-family: Menlo, Monaco, Consolas, \" courier=\"\" new\",=\"\" monospace;=\"\" font-size:=\"\" inherit;=\"\" white-space:=\"\" pre-wrap;\"=\"\">/dev/sdb1</span>)，并挂载好就可以使用了</p>\r\n						    	<pre><code>\r\nroot@Toka:~# 将/dev/sdb1格式化为ext4类型       \r\nroot@Toka:~# mkfs.ext4 /dev/sdb1 \r\nmke2fs 1.42.13 (17-May-2015)\r\n/dev/sdb1 contains a ntfs file system labelled \'68\'\r\n无论如何也要继续? (y,n) y\r\nDiscarding device blocks: 完成                            \r\nCreating filesystem with 31258454 4k blocks and 7815168 inodes\r\nFilesystem UUID: 3d7ecf8a-aeaf-4979-aeac-6cf40184714f\r\nSuperblock backups stored on blocks: \r\n        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, \r\n        4096000, 7962624, 11239424, 20480000, 23887872\r\n\r\nAllocating group tables: 完成                            \r\n正在写入inode表: 完成                            \r\nCreating journal (32768 blocks): 完成\r\nWriting superblocks and filesystem accounting information: 完成   \r\n\r\nroot@Toka:~# 创建挂载目录(/data),并将/dev/sdb1挂载到/data\r\nroot@Toka:~# mkdir /data\r\nroot@Toka:~# mount /dev/sdb1 /data\r\nroot@Toka:~# 挂载好，查看下是否挂载成功\r\nroot@Toka:~# df -h\r\n文件系统        容量  已用  可用 已用% 挂载点\r\nudev            4.6G     0  4.6G    0% /dev\r\ntmpfs           950M  9.5M  940M    1% /run\r\n/dev/sda1       108G  4.0G   99G    4% /\r\ntmpfs           4.7G  204K  4.7G    1% /dev/shm\r\ntmpfs           5.0M  4.0K  5.0M    1% /run/lock\r\ntmpfs           4.7G     0  4.7G    0% /sys/fs/cgroup\r\ntmpfs           950M   44K  950M    1% /run/user/1000\r\ntmpfs           950M  8.0K  950M    1% /run/user/108\r\ntmpfs           950M     0  950M    0% /run/user/0\r\n/dev/sdb1       118G   60M  112G    1% /data                        #i注意是否有这行\r\nroot@Toka:~# 上面可以看到已经成功挂载，现在就可以使用了！！！\r\n						    	</code></pre>\r\n						    	<p>一般来说经过上面的步骤，已经可以正常使用新的硬盘了！  <br>\r\n						    	但是如果哪一天你不小心重启了你的服务器，那么就会发现在/data里面并没有数据!!!  <br>\r\n						        别慌,这只是因为重启后，系统没有自动挂载/dev/sdb这一块硬盘的原因，所以还要设置开机自动挂载！！！</p>\r\n						        <pre><code>     \r\nroot@Toka:~# vim /etc/fstab\r\n  # /etc/fstab: static file system information.\r\n  #\r\n  # Use \'blkid\' to print the universally unique identifier for a\r\n  # device; this may be used with UUID= as a more robust way to name devices\r\n  # that works even if disks are added and removed. See fstab(5).\r\n  #\r\n  # <file system=\"\"> <mount point=\"\">   <type>  <options>       <dump>  <pass>\r\n  # / was on /dev/vda1 during installation\r\n  UUID=fa712cf1-bdc1-4c06-a3ec-dafa0d38429b /               ext4    errors=remount-ro 0\r\n           1\r\n  # swap was on /dev/vda5 during installation\r\n  UUID=8634a363-7476-405c-bec3-23d87c7b49d6 none            swap    sw              0  \r\n         0\r\n  /dev/sr0        /media/cdrom0   udf,iso9660 user,noauto     0       0\r\n  # 下而这一行就是我们添加的自动挂载/dev/sdb1\r\n  /dev/sdb1       /data           ext4   defaults   0   0\r\nroot@Toka:~# 保存退出，这样就配置好了开机自动挂载硬盘了！！！\r\n						    	</pass></dump></options></type></mount></file></code></pre>\r\n						    	<p>是不是感觉技术派的Linux派特别给力呢？！！！</p>'
  ),
(
    3,
    '<p>安装工具</p>\r\n<pre><code>\r\nroot@Toka:~# apt-get install libncurses5-dev\r\nroot@Toka:~# Redhat和其他Linux版本对应的是ncurses-devel,这里安装的母鸡是Debian\r\n</code></pre>\r\n<p>再安装cmake</p>	\r\n<pre><code>	\r\nroot@Toka:~# wget https://cmake.org/files/v3.7/cmake-3.7.2.tar.gz\r\nroot@Toka:~# tar -zxvf cmake-3.7.0.tar.gz\r\nroot@Toka:~# cd cmake-3.7.0\r\nroot@Toka:~# ./bootstrap\r\nroot@Toka:~# make\r\nroot@Toka:~# make install \r\n</code></pre>\r\n<p>下载MariaDB：<a href=\"https://mirrors.tuna.tsinghua.edu.cn/mariadb//mariadb-10.1.19/source/mariadb-10.1.19.tar.gz\" target=\"_blank\">mariadb-10.1.19.tar.gz</a> 或 <a href=\"https://downloads.mariadb.org/interstitial/mariadb-10.1.20/bintar-linux-glibc_214-x86_64/mariadb-10.1.20-linux-glibc_214-x86_64.tar.gz\" target=\"_blank\">mariadb-10.1.20-linux-glibc_214-x86_64.tar.gz</a>这里以mariadb-10.1.19.tar.gz为示例安装</p>\r\n\r\n<pre><code>	\r\nroot@Toka:~# wget https://mirrors.tuna.tsinghua.edu.cn/mariadb//mariadb-10.1.19/source/mariadb-10.1.19.tar.gz\r\nroot@Toka:~# tar -zxvf mariadb-10.1.19.tar.gz\r\nroot@Toka:~# cd mariadb-10.1.19 \r\nroot@Toka:~# cmake \\\r\n-DCMAKE_INSTALL_PREFIX=/usr/local/mysql \\\r\n-DSYSCONFDIR=/etc/mysql \\\r\n-DMYSQL_USER=mysql \\\r\n-DWITH_MYISAM_STORAGE_ENGINE=1 \\\r\n-DWITH_INNOBASE_STORAGE_ENGINE=1 \\\r\n-DWITH_ARCHIVE_STORAGE_ENGINE=1 \\\r\n-DWITH_MEMORY_STORAGE_ENGINE=1 \\\r\n-DWITH_READLINE=1 \\\r\n-DMYSQL_UNIX_ADDR=/var/run/mysqld/mysqld.sock \\\r\n-DMYSQL_TCP_PORT=3306 \\\r\n-DENABLED_LOCAL_INFILE=1 \\\r\n-DENABLE_DOWNLOADS=1 \\\r\n-DWITH_PARTITION_STORAGE_ENGINE=1 \\\r\n-DEXTRA_CHARSETS=all \\\r\n-DDEFAULT_CHARSET=utf8 \\\r\n-DDEFAULT_COLLATION=utf8_general_ci \\\r\n-DWITH_DEBUG=0 \\\r\n-DMYSQL_MAINTAINER_MODE=0 \\\r\n-DWITH_SSL:STRING=bundled \\\r\n-DWITH_ZLIB:STRING=bundled \\\r\n-DWITHOUT_MROONGA_STORAGE_ENGINE=1\r\n\r\n出错：\r\n/usr/bin/ld: cannot find -lz\r\ncollect2: error: ld returned 1 exit status\r\nstorage/tokudb/PerconaFT/ft/CMakeFiles/ft.dir/build.make:1382: recipe for target \'storage/tokudb/PerconaFT/ft/libft.so\' failed\r\nmake[2]: *** [storage/tokudb/PerconaFT/ft/libft.so] Error 1\r\n-DWITH_ZLIB=/usr/local/src/zlib-1.2.8\r\n\r\nroot@Toka:~# 按上面错误提示可知缺少zlib1g，安zlib1g-dev解决\r\nroot@Toka:~# apt-get install zlib1g-dev\r\n\r\nroot@Toka:~# 重新再次安装\r\n\r\nroot@Toka:~# cmake \\\r\n-DCMAKE_INSTALL_PREFIX=/usr/local/mysql \\\r\n-DSYSCONFDIR=/etc/mysql \\\r\n-DMYSQL_USER=mysql \\\r\n-DWITH_MYISAM_STORAGE_ENGINE=1 \\\r\n-DWITH_INNOBASE_STORAGE_ENGINE=1 \\\r\n-DWITH_ARCHIVE_STORAGE_ENGINE=1 \\\r\n-DWITH_MEMORY_STORAGE_ENGINE=1 \\\r\n-DWITH_READLINE=1 \\\r\n-DMYSQL_UNIX_ADDR=/var/run/mysqld/mysqld.sock \\\r\n-DMYSQL_TCP_PORT=3306 \\\r\n-DENABLED_LOCAL_INFILE=1 \\\r\n-DENABLE_DOWNLOADS=1 \\\r\n-DWITH_PARTITION_STORAGE_ENGINE=1 \\\r\n-DEXTRA_CHARSETS=all \\\r\n-DDEFAULT_CHARSET=utf8 \\\r\n-DDEFAULT_COLLATION=utf8_general_ci \\\r\n-DWITH_DEBUG=0 \\\r\n-DMYSQL_MAINTAINER_MODE=0 \\\r\n-DWITH_SSL:STRING=bundled \\\r\n-DWITH_ZLIB:STRING=bundled \\\r\n-DWITHOUT_MROONGA_STORAGE_ENGINE=1\r\n\r\n警告：Warning: Bison executable not found in PATH\r\nroot@Toka:~# apt-get install bison \r\nroot@Toka:~# 解决后，重新再次安装\r\n\r\nroot@Toka:~# cmake \\\r\n-DCMAKE_INSTALL_PREFIX=/usr/local/mysql \\\r\n-DSYSCONFDIR=/etc/mysql \\\r\n-DMYSQL_USER=mysql \\\r\n-DWITH_MYISAM_STORAGE_ENGINE=1 \\\r\n-DWITH_INNOBASE_STORAGE_ENGINE=1 \\\r\n-DWITH_ARCHIVE_STORAGE_ENGINE=1 \\\r\n-DWITH_MEMORY_STORAGE_ENGINE=1 \\\r\n-DWITH_READLINE=1 \\\r\n-DMYSQL_UNIX_ADDR=/var/run/mysqld/mysqld.sock \\\r\n-DMYSQL_TCP_PORT=3306 \\\r\n-DENABLED_LOCAL_INFILE=1 \\\r\n-DENABLE_DOWNLOADS=1 \\\r\n-DWITH_PARTITION_STORAGE_ENGINE=1 \\\r\n-DEXTRA_CHARSETS=all \\\r\n-DDEFAULT_CHARSET=utf8 \\\r\n-DDEFAULT_COLLATION=utf8_general_ci \\\r\n-DWITH_DEBUG=0 \\\r\n-DMYSQL_MAINTAINER_MODE=0 \\\r\n-DWITH_SSL:STRING=bundled \\\r\n-DWITH_ZLIB:STRING=bundled \\\r\n-DWITHOUT_MROONGA_STORAGE_ENGINE=1\r\n\r\n这下完好，不警告：\r\n-- Configuring done\r\n-- Generating done\r\n-- Build files have been written to: /usr/local/src/mariadb-10.1.19\r\n可以放心进行下一步安装了！！\r\n\r\nroot@Toka:~# make\r\n[100%] Built target my_safe_process\r\nroot@Toka:~# 没报错，继续\r\nroot@Toka:~# make install\r\n</code></pre>\r\n<p>经过以上安装大功告成！！！<br>\r\n不过还要添加mysql环境变量，不然每次打mysql命令时都要打绝对路径才能生效。</p>\r\n<pre><code>	\r\nroot@Toka:~#  echo -e \'\\n export PATH=$PATH:/usr/local/mysql/bin \\n\' &gt;&gt; ~/.bashrc &amp;&amp; source ~/.bashrc\r\n</code></pre>\r\n<p>接下来创建mysql用户和组</p>\r\n<pre><code>	\r\nroot@Toka:~#  groupadd mysql\r\nroot@Toka:~#  useradd -r -g mysql -s /bin/false mysql\r\n</code></pre>\r\n<p>接下来简单配置一下，才可以用</p>\r\n<pre><code>	\r\nroot@Toka:~#  chown -R mysql:mysql /usr/local/mysql/data\r\nroot@Toka:~#  mkdir /var/run/mysqld\r\nroot@Toka:~#  chown -R mysql:mysql /var/run/mysqld/\r\nroot@Toka:~#  cd /usr/local/mysql\r\nroot@Toka:~#  mkdir /etc/mysql\r\nroot@Toka:~#  cp support-files/my-small.cnf /etc/mysql/my.cnf\r\nroot@Toka:~#  修改配置文件：\r\nroot@Toka:~#  vim /etc/mysql/my.cnf\r\n# 在[client]下添加以下行\r\ndefault-character-set = utf8\r\n# 在[mysqld]下添加以下行\r\ncharacter-set-server = utf8\r\nroot@Toka:~# 初始化数据库\r\nroot@Toka:~# scripts/mysql_install_db --user=mysql\r\nroot@Toka:~# 先启动mysql\r\nroot@Toka:~# /usr/local/mysql/support-files/mysql.server start\r\nroot@Toka:~# 再执行修改密码：\r\nroot@Toka:~# /usr/local/mysql/bin/mysql_secure_installation\r\n提示：Enter current password for root (enter for none):  \r\n直接回车，因为我们刚安装还没有密码\r\n提示：Set root password? [Y/n]\r\n输入：y\r\n提示：New password:\r\n输入新密码\r\n提示：Re-enter new password:\r\n重新输入刚才的密码\r\n提示：Remove anonymous users? [Y/n]\r\n输入：y\r\n提示：Disallow root login remotely? [Y/n]\r\n输入：n\r\n提示：Remove test database and access to it? [Y/n]\r\n输入：y\r\n提示：Reload privilege tables now? [Y/n]\r\n输入：y\r\nAll done!  If you\'ve completed all of the above steps, your MariaDB installation should now be secure.\r\nThanks for using MariaDB!\r\n\r\nroot@Toka:~# 再执行如下修改root用户可远程登录\r\nroot@Toka:~# mysql -h localhost -u root -p\r\nmysql -h localhost -u root -p\r\nMariaDB [(none)]&gt; use mysql\r\nMariaDB [mysql]&gt; update user set host=\'%\' where user=\'root\' and host=\'localhost\';\r\nMariaDB [mysql]&gt; select host from user where user=\'root\';\r\n+-----------+\r\n| host      |\r\n+-----------+\r\n| %         |\r\n| 127.0.0.1 |\r\n| ::1       |\r\n| debian    |\r\n+-----------+\r\n4 rows in set (0.00 sec)\r\nMariaDB [(none)]&gt; FLUSH PRIVILEGES;\r\nMariaDB [(none)]&gt; exit;\r\n\r\nroot@Toka:~# 至此数据库安装完成!!\r\n</code></pre>\r\n<p>安装MariaDB到此全部完成</p>\r\n<p>日常重启控制命令： <br>\r\n        启动：/usr/local/mysql/support-files/mysql.server start    <br>\r\n        停止：/usr/local/mysql/support-files/mysql.server stop   <br>\r\n        重启：/usr/local/mysql/support-files/mysql.server restart    <br>\r\n</p>\r\n<p>\r\nMariaDB官网：<a href=\"https://downloads.mariadb.org/ \" target=\"_blank\">https://downloads.mariadb.org/ </a>    <br>\r\n参考：<br>&nbsp; &nbsp; &nbsp; &nbsp; <a href=\"https://mariadb.com/kb/zh-cn/installing-mariadb-binary-tarballs/ \" target=\"_blank\">https://mariadb.com/kb/zh-cn/installing-mariadb-binary-tarballs/ </a>    <br>&nbsp; &nbsp; &nbsp; &nbsp;<a href=\" http://opso.coding.me/2016/03/29/mariadb-install/ \" target=\"_blank\"> http://opso.coding.me/2016/03/29/mariadb-install/ </a>     <br>&nbsp; &nbsp; &nbsp; &nbsp;<a href=\" http://cloudline.iteye.com/blog/867772 \" target=\"_blank\"> http://cloudline.iteye.com/blog/867772 </a>                <br>\r\n</p>\r\n<pre><code>	\r\n=====================================================================================\r\n MySql主从配置：\r\n=====================================================================================\r\n  1.1、版本一致\r\n  ##1.2、初始化表，并在后台启动mysql\r\n  ##1.3、修改root的密码\r\n-------------------------------------------------------------------------------------\r\n修改主服务器master:\r\nvim /usr/local/mysql/my.cnf\r\n #服务器唯一ID，默认是1，一般取IP最后一段\r\n server-id=154\r\n\r\n #启用二进进制日志\r\n log-bin=mysql-bin\r\n # binlog-do-db = testdb   #只记录testdb库变化,多个库用‘,’分隔\r\n # binlog-ignore-db=mysql  #忽略mysql库变化，多个库用‘,’分隔\r\n # expire_logs_days =7     #binlog日志只保留7天内的数据\r\n-------------------------------------------------------------------------------------\r\n\r\n修改从服务器slave:\r\nvim /usr/local/mysql/my.cnf\r\n #服务器唯一ID，默认是1，一般取IP最后一段\r\n server-id=135\r\n #启用二进进制日志\r\n log-bin=mysql-bin\r\n #log-slave-updates                      #级联复制(A-&gt;B-&gt;C)\r\n # expire_logs_days =7                   #binlog日志只保留7天内的数据\r\n # replicate-ignore-db=mysql           #不同步mysql库，多个库用‘,’分隔\r\n # replicate-do-db = testdb            #只同步testdb库，多个库用‘,’分隔\r\n # replicate-do-table = test_tb        #只同步test_tb表，多个表用‘,’分隔\r\n # replicate-ignore-table = test_tb    #不同步test_tb表，多个表用‘,’分隔\r\n # replicate-wild-do-table = test_tb   #同表，可以加通配符（replicate-wild-do-table=db_name.%） 只复制哪个库的哪个表\r\n # replicate-wild-ignore-table = test  #不同步的表，通配符来规则范围（replicate-wild-ignore-table=mysql.%）忽略哪个库的哪个表\r\n\r\n重启两台服务器的mysql\r\n/usr/local/mysql/support-files/mysql.server restart\r\n--------------------------------------------------------------------------------------\r\n在主服务器上建立帐户并授权slave:\r\n   #/usr/local/mysql/bin/mysql -uroot -p\r\n   mysql&gt; GRANT REPLICATION SLAVE ON *.* to \'mysync\'@\'%\' identified by \'syncpasswd\'; \r\n    ##一般不用root帐号，“%”表示所有客户端都可能连，只要帐号，密码正确，此处可用具体客户端IP代替，如192.168.145.226，加强安全。\r\n　 mysql&gt; FLUSH PRIVILEGES;\r\n登录主服务器的mysql，查询master的状态      \r\n\r\nmysql&gt; show master status;          ###记住记住下面这两个值，从服务器中要用到\r\n+------------------+----------+--------------+------------------+-------------------+\r\n| File             | Position | Binlog_Do_DB | Binlog_Ignore_DB | Executed_Gtid_Set |\r\n+------------------+----------+--------------+------------------+-------------------+\r\n| mysql-bin.000002 |      607 |              |                  |                   |\r\n+------------------+----------+--------------+------------------+-------------------+\r\n1 row in set (0.00 sec)\r\n注：执行完此步骤后不要再操作主服务器MYSQL，防止主服务器状态值变化\r\n\r\n-----------------------------------------------------------------------------------------------\r\n配置从服务器Slave：\r\nmysql&gt; change master to master_host=\'218.16.120.154\',\r\nmaster_user=\'mysync\',\r\nmaster_password=\'syncpasswdcmb7d\',\r\nmaster_log_file=\'mysql-bin.000002\',\r\nmaster_log_pos=607;\r\nmysql&gt; start slave;                              ##这里是开户从服务(停止为:stop slave)\r\nmysql&gt; show slave status\\G;                      \r\n              Master_Log_File: mysql-bin.000002\r\n          Read_Master_Log_Pos: 607\r\n               Relay_Log_File: debian-relay-bin.000002\r\n                Relay_Log_Pos: 770\r\n        Relay_Master_Log_File: mysql-bin.000002\r\n             Slave_IO_Running: Yes               ###这个必须为YES\r\n            Slave_SQL_Running: Yes               ###这个必须为YES\r\n\r\n-----------------------------------------------------------------------------------------------\r\n如果从服务器配置出错，可以先重围（ reset slave;）再配置就可以了！\r\n到此就主从MySql就配置完成了，可以测试了。\r\n注：MySql每次重启都要重新配置主从同步哦!!\r\n</code></pre>\r\n'
  ),
(
    4,
    '<p>安装工具cmake</p>\r\n<pre><code>\r\nroot@Toka:~# \r\nroot@Toka:~# wget https://cmake.org/files/v3.7/cmake-3.7.2.tar.gz\r\nroot@Toka:~# tar -zxvf cmake-3.7.0.tar.gz\r\nroot@Toka:~# cd cmake-3.7.0\r\nroot@Toka:~# ./bootstrap\r\nroot@Toka:~# make\r\nroot@Toka:~# make install \r\nroot@Toka:~# #或者直接在线安装cmake\r\nroot@Toka:~# apt-get install cmake\r\n</code></pre>\r\n<p>下载mysql：<a href=\"http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.4-m14.tar.gz\" target=\"_blank\">mysql-5.7.4-m14.tar.gz</a>、<a href=\"http://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.0-dmr.tar.gz\" target=\"_blank\">mysql-8.0.0-dmr.tar.gz</a>、<a href=\"http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.15.tar.gz\" target=\"_blank\">mysql-5.7.15.tar.gz</a></p>	\r\n<pre><code>\r\nroot@Toka:~# wget http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.15.tar.gz\r\nroot@Toka:~# tar -zxvf mysql-5.7.15.tar.gz\r\nroot@Toka:~# cd mysql-5.7.15\r\nroot@Toka:~# 下面这条命令中的“.”表示当前目录，不能漏了！！！\r\nroot@Toka:~# cmake .      \r\nCMake Error at cmake/readline.cmake:64 (MESSAGE):\r\n  Curses library not found.  Please install appropriate package,\r\n\r\n      remove CMakeCache.txt and rerun cmake.On Debian/Ubuntu, package name is libncurses5-dev, on Redhat and derivates it is ncurses-devel.\r\nCall Stack (most recent call first):\r\n  cmake/readline.cmake:107 (FIND_CURSES)\r\n  cmake/readline.cmake:181 (MYSQL_USE_BUNDLED_EDITLINE)\r\n  CMakeLists.txt:467 (MYSQL_CHECK_EDITLINE)\r\n\r\n-- Configuring incomplete, errors occurred!\r\n\r\nroot@Toka:~# 上面报错主要提示缺少libncurses5-dev，所以下面安装缺少的libncurses5-dev\r\nroot@Toka:~# apt-get install libncurses5-dev\r\nroot@Toka:~# 重新cmake\r\nroot@Toka:~# cmake .   \r\nConfiguring done\r\nGenerating done\r\nroot@Toka:~# 成功了，继续下面的安装\r\nroot@Toka:~# make\r\nroot@Toka:~# make install \r\n</code></pre>\r\n<p>至此安装完成，但还要做一定的配置就可以使用mysql了</p>\r\n<pre><code>\r\nroot@Toka:~# 创建mysql专属的用户名和组名\r\nroot@Toka:~# groupadd mysql\r\nroot@Toka:~# useradd -r -g mysql mysql\r\nroot@Toka:~# cd /usr/local/mysql\r\nroot@Toka:~# chown -R mysql .\r\nroot@Toka:~# chgrp -R mysql .\r\nroot@Toka:~# scripts/mysql_install_db --user=mysql\r\nroot@Toka:~# chown -R root . \r\nroot@Toka:~# chown -R mysql data\r\n</code></pre>\r\n<p>以下为mysql 5.7版本才需要</p>\r\n<pre><code>\r\nroot@Toka:~#  vim my.cnf\r\n#加入如下行，这样就可以不用密码登录了\r\nskip-grant-tables\r\n#保存退出\r\nroot@Toka:~# 启动mysql\r\nroot@Toka:~# support-files/mysql.server start \r\nroot@Toka:~# bin/mysql -h localhost -u root\r\nmysql&gt; use mysql;\r\nmysql&gt; update user set password=password(\'123456\') where user=\'root\';\r\nmysql&gt; flush privileges;\r\nmysql&gt; exit;\r\nroot@Toka:~# vim my.cnf\r\n#再注销刚才这一行\r\n#skip-grant-tables\r\n#保存退出\r\nroot@Toka:~# support-files/mysql.server restart \r\nroot@Toka:~# bin/mysql -h localhost -u root -p123456\r\nmysql&gt; SET PASSWORD=PASSWORD(\'新的密码\');\r\nmysql&gt; exit;\r\nroot@Toka:~# 至此mysql密码修改完成\r\n</code></pre>\r\n<p>\r\n重新启动mysql:<br>\r\n/usr/local/mysql/support-files/mysql.server restart </p>\r\n<pre><code>\r\nroot@Toka:~# 覆盖系统默认的mysql 低版本的服务，可以讲如下脚本拷入系统启动目录。\r\nroot@Toka:~# cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysql.server\r\nroot@Toka:~# 到此安装完成\r\n</code></pre>\r\n<p>大功告成！！！！</p>\r\n<p>非本机用户还不能登录而出现ERROR 1130的话,要改mysql数据库里的user表<br>如下</p>\r\n<pre><code>\r\nroot@Toka:~# mysql -h localhost -u root\r\nMysql&gt;  use mysql;\r\nMysql&gt;  update mysql.user set host=\'%\' where user=\'root\' and host=\'localhost\';\r\nMysql&gt;  UPDATE `mysql`.`user` SET `password` = PASSWORD( \'kaQWkd,.23Ks\' ) WHERE `user`.`Host` = CAST( 0x25 AS BINARY ) AND `user`.`User` = CAST( 0x726f6f74 AS BINARY ) ;\r\nMysql&gt;  exit;\r\nroot@Toka:~# /usr/local/mysql/support-files/mysql.server restart \r\n</code></pre>'
  ),
(
    5,
    '<p>VPN的种类有：L2TP、PPTP等 <br>\r\n如标题，本文主要讲L2TP这一类的VPN服务器搭建 <br>\r\n那么现在开始吧！！！\r\n</p>\r\n<ol>\r\n   <li>安装openswan，配置IPSEC</li>\r\n   <pre><code>\r\nroot@Toka:~# 旧版本的Debian可以直接在线安装\r\nroot@Toka:~# apt-get install openswan\r\nroot@Toka:~# 新版本的Debian软件源包里已经不包含openswan了，所以只以源码编译安装！！\r\nroot@Toka:~# 安装openswan必需库\r\nroot@Toka:~# apt-get install libgmp3-dev\r\nroot@Toka:~# apt-get install gawk mawk flex bison\r\nroot@Toka:~# apt-get install iproute2\r\nroot@Toka:~# 安装多线程下载工具\r\nroot@Toka:~# apt-get install axel\r\nroot@Toka:~# 用多线程axel下载器来下载openswan源码\r\nroot@Toka:~# axel https://download.openswan.org/openswan/openswan-2.6.49.1.tar.gz\r\nroot@Toka:~# 解压并安装\r\nroot@Toka:~# tar -zxvf openswan-2.6.49.1.tar.gz\r\nroot@Toka:~# cd openswan-2.6.49.1/\r\nroot@Toka:~# make programs\r\nroot@Toka:~# make install\r\nroot@Toka:~# 安装完成，查看下是否安装成功\r\nroot@Toka:~# ipsec --version\r\nLinux Openswan U2.6.49.1/K(no kernel code presently loaded)\r\nSee `ipsec --copyright\' for copyright information.\r\nroot@Toka:~# 已经安装成功，接下来启动ipsec\r\nroot@Toka:~# service ipsec start\r\nFailed to start ipsec.service: Unit ipsec.service not found.\r\nroot@Toka:~# 以上提示没有ipsec服务，所以只有用绝对路径来启动\r\nroot@Toka:~# /etc/init.d/ipsec start\r\n&lt;27&gt;Oct 14 17:31:51 ipsec_setup: Starting Openswan IPsec U2.6.49.1/K4.9.0-3-amd64...\r\nroot@Toka:~# 启动成功\r\n   </code></pre>\r\n   <p>至些成功安装了，接下来更新IP转发</p>\r\n   <pre><code>\r\nroot@Toka:~# 先备份原有文件\r\nroot@Toka:~# cp /etc/sysctl.conf /etc/sysctl.conf.yl\r\nroot@Toka:~# 配置IP转发\r\nroot@Toka:~# echo \"net.ipv4.ip_forward = 1\" |  tee -a /etc/sysctl.conf\r\nroot@Toka:~# echo \"net.ipv4.conf.all.accept_redirects = 0\" |  tee -a /etc/sysctl.conf\r\nroot@Toka:~# echo \"net.ipv4.conf.all.send_redirects = 0\" |  tee -a /etc/sysctl.conf\r\nroot@Toka:~# echo \"net.ipv4.conf.default.rp_filter = 0\" |  tee -a /etc/sysctl.conf\r\nroot@Toka:~# echo \"net.ipv4.conf.default.accept_source_route = 0\" |  tee -a /etc/sysctl.conf\r\nroot@Toka:~# echo \"net.ipv4.conf.default.send_redirects = 0\" |  tee -a /etc/sysctl.conf\r\nroot@Toka:~# echo \"net.ipv4.icmp_ignore_bogus_error_responses = 1\" |  tee -a /etc/sysctl.conf\r\nroot@Toka:~# for vpn in /proc/sys/net/ipv4/conf/*; \r\n&gt; do \r\n&gt;   echo 0 &gt; $vpn/accept_redirects;\r\n&gt;   echo 0 &gt; $vpn/send_redirects; \r\n&gt; done\r\nroot@Toka:~# IP转发完成\r\n   </code></pre>\r\n   <p>接下来设置IP table <br><span style=\"background-color: rgb(255, 0, 0);\">\r\n   这里请各位注意，不配IP table，VPN服务器安装好连接上去后，客户面是上不了网的！！！</span></p>\r\n   <pre><code>\r\nroot@Toka:~# iptables -t nat -A POSTROUTING -s 172.16.1.1/24 -o eth0 -j MASQUERADE  \r\n   </code></pre>\r\n   <p>配置IPSEC</p>\r\n   <pre><code>\r\nroot@Toka:~# 先备份原来的配置文件\r\nroot@Toka:~# cp /etc/ipsec.conf /etc/ipsec.conf.yl \r\nroot@Toka:~# MYIP=`/sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk \'{print $2}\'|tr -d \"addr:\"`\r\nroot@Toka:~# echo $MYIP\r\n122.114.228.217 10.122.228.217\r\nroot@Toka:~# 上面MYIP出现双IP，所以还是手动设置为正确的IP，如果\'echo $MYIP\'只出现一个IP4，那就正确\r\nroot@Toka:~# MYIP=\'122.114.228.217\'\r\nroot@Toka:~# 好了，变量MYIP设置完成，接下来直接生成ipsec.conf配置文件\r\nroot@Toka:~# cat &gt;/etc/ipsec.conf &lt;&lt; <eof>EOF\r\n&gt;version 2 # conforms to second version of ipsec.conf specification\r\n&gt; \r\n&gt; config setup\r\n&gt;     dumpdir=/var/run/pluto/\r\n&gt;     #in what directory should things started by setup (notably the Pluto daemon) be allowed to dump core?\r\n&gt; \r\n&gt;     nat_traversal=yes\r\n&gt;     #whether to accept/offer to support NAT (NAPT, also known as \"IP Masqurade\") workaround for IPsec\r\n&gt; \r\n&gt;     virtual_private=%v4:10.0.0.0/8,%v4:192.168.0.0/16,%v4:172.16.0.0/12,%v6:fd00::/8,%v6:fe80::/10\r\n&gt;     #contains the networks that are allowed as subnet= for the remote client. In other words, the address ranges that may live behind a NAT router through which a client connects.\r\n&gt; \r\n&gt;     protostack=netkey\r\n&gt;     #decide which protocol stack is going to be used.\r\n&gt; \r\n&gt;     force_keepalive=yes\r\n&gt;     keep_alive=60\r\n&gt;     # Send a keep-alive packet every 60 seconds.\r\n&gt; \r\n&gt; conn L2TP-PSK-noNAT\r\n&gt;     authby=secret\r\n&gt;     #shared secret. Use rsasig for certificates.\r\n&gt; \r\n&gt;     pfs=no\r\n&gt;     #Disable pfs\r\n&gt; \r\n&gt;     auto=add\r\n&gt;     #the ipsec tunnel should be started and routes created when the ipsec daemon itself starts.\r\n&gt; \r\n&gt;     keyingtries=3\r\n&gt;     #Only negotiate a conn. 3 times.\r\n&gt; \r\n&gt;     ikelifetime=8h\r\n&gt;     keylife=1h\r\n&gt; \r\n&gt;     ike=aes256-sha1,aes128-sha1,3des-sha1\r\n&gt;     phase2alg=aes256-sha1,aes128-sha1,3des-sha1\r\n&gt;     # https://lists.openswan.org/pipermail/users/2014-April/022947.html\r\n&gt;     # specifies the phase 1 encryption scheme, the hashing algorithm, and the diffie-hellman group. The modp1024 is for Diffie-Hellman 2. Why \'modp\' instead of dh? DH2 is a 1028 bit encryption algorithm that modulo\'s a prime number, e.g. modp1028. See RFC 5114 for details or the wiki page on diffie hellmann, if interested.\r\n&gt; \r\n&gt;     type=transport\r\n&gt;     #because we use l2tp as tunnel protocol\r\n&gt; \r\n&gt;     left=$MYIP\r\n&gt;     leftnexthop=$MYIP\r\n&gt;     #fill in server IP above\r\n&gt; \r\n&gt;     leftprotoport=17/1701\r\n&gt;     right=%any\r\n&gt;     rightprotoport=17/%any\r\n&gt; \r\n&gt;     dpddelay=10\r\n&gt;     # Dead Peer Dectection (RFC 3706) keepalives delay\r\n&gt;     dpdtimeout=20\r\n&gt;     #  length of time (in seconds) we will idle without hearing either an R_U_THERE poll from our peer, or an R_U_THERE_ACK reply.\r\n&gt;     dpdaction=clear\r\n&gt;     # When a DPD enabled peer is declared dead, what action should be taken. clear means the eroute and SA with both be cleared.\r\n&gt; EOF\r\nroot@Toka:~# \r\n   </eof></code></pre>\r\n    <p>接下来配置IPSEC连接的公钥</p>\r\n   <pre><code>\r\nroot@Toka:~# 注意，这里把公钥配置为“toka.pro”\r\nroot@Toka:~# cat &gt;/etc/ipsec.secrets  &lt;&lt; <eof>EOF\r\n&gt; $MYIP %any: PSK \"toka.pro\"\r\n&gt; EOF\r\nroot@Toka:~# 接下来重启下服务\r\nroot@Toka:~# /etc/init.d/ipsec restart\r\n&lt;27&gt;Jul 30 23:11:35 ipsec_setup: Stopping Openswan IPsec...\r\n&lt;27&gt;Jul 30 23:11:37 ipsec_setup: Starting Openswan IPsec U2.6.49.1/K4.9.0-3-amd64...\r\nroot@Toka:~# 再认证下，如果出现如下，刚全部ipsec配置正确！！！\r\nroot@Toka:~# ipsec verify\r\nChecking if IPsec got installed and started correctly:\r\n\r\nVersion check and ipsec on-path                         [OK]\r\nOpenswan U2.6.49.1/K4.9.0-3-amd64 (netkey)\r\nSee `ipsec --copyright\' for copyright information.\r\nChecking for IPsec support in kernel                    [OK]\r\n NETKEY: Testing XFRM related proc values\r\n         ICMP default/send_redirects                    [OK]\r\n         ICMP default/accept_redirects                  [NOT DISABLED]\r\n\r\n  Disable /proc/sys/net/ipv4/conf/*/accept_redirects or NETKEY will cause act on or cause sending of bogus ICMP redirects!\r\n\r\n         XFRM larval drop                               [OK]\r\nHardware random device check                            [N/A]\r\nTwo or more interfaces found, checking IP forwarding    [OK]\r\nChecking rp_filter                                      [OK]\r\nChecking that pluto is running                          [OK]\r\n Pluto listening for IKE on udp 500                     [OK]\r\n Pluto listening for IKE on tcp 500                     [NOT IMPLEMENTED]\r\n Pluto listening for IKE/NAT-T on udp 4500              [OK]\r\n Pluto listening for IKE/NAT-T on tcp 4500              [NOT IMPLEMENTED]\r\n Pluto listening for IKE on tcp 10000 (cisco)           [NOT IMPLEMENTED]\r\nChecking NAT and MASQUERADEing                          [TEST INCOMPLETE]\r\nChecking \'ip\' command                                   [OK]\r\nChecking \'iptables\' command                             [OK]\r\n\r\nipsec verify: encountered errors\r\nroot@Toka:~# ipsec安装配置完成\r\n   </eof></code></pre>\r\n\r\n   <li>安装xl2tpd</li>\r\n   <p>安装并配置xl2tpd ppp lsof</p>\r\n   <pre><code>\r\nroot@Toka:~# apt-get install xl2tpd ppp lsof\r\nroot@Toka:~# 配置xl2tpd，先备份原来的配置文件\r\nroot@Toka:~# cp /etc/xl2tpd/xl2tpd.conf /etc/xl2tpd/xl2tpd.conf.yl\r\nroot@Toka:~# cat &gt;/etc/xl2tpd/xl2tpd.conf  &lt;&lt; <eof>EOF\r\n&gt; [global]\r\n&gt; ipsec saref = yes\r\n&gt; saref refinfo = 30\r\n&gt; \r\n&gt; ;debug avp = yes\r\n&gt; ;debug network = yes\r\n&gt; ;debug state = yes\r\n&gt; ;debug tunnel = yes\r\n&gt; \r\n&gt; [lns default]\r\n&gt; ip range = 172.16.1.30-172.16.1.100\r\n&gt; local ip = 172.16.1.1\r\n&gt; refuse pap = yes\r\n&gt; require authentication = yes\r\n&gt; ;ppp debug = yes\r\n&gt; pppoptfile = /etc/ppp/options.xl2tpd\r\n&gt; length bit = yes\r\n&gt; EOF </eof>\r\nroot@Toka:~# 配置PPP\r\nroot@Toka:~# cat &gt;/etc/ppp/options.xl2tpd  &lt;&lt; <eof>EOF\r\n&gt; require-mschap-v2\r\n&gt; ms-dns 119.29.29.29\r\n&gt; ms-dns 4.2.2.1\r\n&gt; auth\r\n&gt; mtu 1000\r\n&gt; mru 1000\r\n&gt; crtscts\r\n&gt; hide-password\r\n&gt; modem\r\n&gt; name l2tpd\r\n&gt; proxyarp\r\n&gt; lcp-echo-interval 0\r\n&gt; lcp-echo-failure 0\r\n&gt; EOF </eof>\r\nroot@Toka:~# 添加VPN账户和密码\r\nroot@Toka:~# cat &gt;/etc/ppp/chap-secrets  &lt;&lt; <eof>EOF\r\n&gt; # Secrets for authentication using CHAP\r\n&gt; # client       server    secret       IP addresses\r\n&gt; # 账号         服务类型   密码        IP\r\n&gt; toka           l2tpd     toka.pro     *\r\n&gt; EOF </eof>\r\nroot@Toka:~# 请记住上面设置了VPN的账号为toka，密码为toka.pro,客户端连接时请不要输错\r\nroot@Toka:~# 至此全部VPN服务器安装配置完成，重启所有服务，然后就可以用客户端连接上了！！\r\nroot@Toka:~# /etc/init.d/ipsec restart\r\nroot@Toka:~# /etc/init.d/xl2tpd restart\r\n   </code></pre>\r\n   <p>大功告成！！至此你需要注意以下三点： <br>\r\n1.客户端连接时所选择的VPN类型为：使用预共享密钥的 L2TP/IPsec  <br>\r\n2.连接时填入服务器地址IP不能错，预共享密钥为上面配置的toka.net,账号toka,密码toka.pro   <br>\r\n3.服务器所在地，最好在国外，因为在国内的服务器也一样的被封锁了访问外国！！！\r\n   </p>\r\n\r\n</ol>'
  ),
(
    6,
    '                                <p>\r\n默认安装phpMyAdmin，通常只能连一台MySql服务器，\r\n其配置信息是保存在phpMyAdmin的配置文件里的，\r\n当我们需要在多台服务器之间进行切换登陆的时候，\r\n修改起来非常麻烦。遵照下面的配置方法，\r\n我们可以方便的使用phpMyAdmin连接多台MySQL。\r\n</p>\r\n<ol>\r\n<li>登陆phpMyAdmin时输入服务器ip地址、用户名、密码操作步骤</li>\r\n<p>操作步骤: <br>\r\n修改phpMyAdmin目录下的 /libraries/config.default.php\r\n</p>\r\n<pre><code>\r\n$cfg[\'AllowArbitraryServer\'] = true;   ###默认值为false，改成true后可以输入服务器ＩＰ\r\n</code></pre>\r\n<li>登陆phpMyAdmin时只需输入用户名、密码，服务器地址为下拉列表可选，登陆后也可选择其他服务器快速切换。</li>\r\n<p>先修改phpMyAdmin目录下的 /libraries/config.default.php</p>\r\n<pre><code>\r\n$cfg[\'AllowArbitraryServer\'] = false;  \r\n</code></pre>\r\n<p>然后将phpMyAdmin根目录下的config.sample.inc.php 文件重命名为config.inc.php</p>\r\n<p>再修改config.inc.php文件，找到 First server 注释部分，将其添加以下内容</p>\r\n<pre><code>\r\n$hosts[]=[\'host\'=>\'localhost\',\'user\'=>\'root\',\'password\'=>\'root\'];\r\n$hosts[]=[\'host\'=>\'elapse.data\',\'user\'=>\'root\',\'password\'=>\'root2123\'];       //快云\r\n$hosts[]=[\'host\'=>\'vip.gust.cn\',\'user\'=>\'root\',\'password\'=>\'dasdfroo21m\'];    //腾讯云\r\n\r\n###$hosts数组中，host为服务器IP地址，user是Mysql登录用户名,Password是登录密码，对应改成自己的\r\n###这里我配置了三台Mysql服务器\r\nforeach ($hosts as $key => $value) {\r\n	# code...\r\n	/* Authentication type */\r\n	$cfg[\'Servers\'][$key+1][\'auth_type\'] = \'cookie\';\r\n\r\n	/* Server parameters */\r\n	$cfg[\'Servers\'][$key+1][\'host\'] = $value[\'host\'];   //修改host\r\n	$cfg[\'Servers\'][$key+1][\'connect_type\'] = \'tcp\';\r\n	$cfg[\'Servers\'][$key+1][\'compress\'] = false;\r\n	/* Select mysqli if your server has it */\r\n	$cfg[\'Servers\'][$key+1][\'extension\'] = \'mysql\';\r\n	$cfg[\'Servers\'][$key+1][\'AllowNoPassword\'] = true;\r\n	$cfg[\'Servers\'][$key+1][\'user\'] = $value[\'user\'];  //修改用户名\r\n	$cfg[\'Servers\'][$key+1][\'password\'] = $value[\'password\']; //密码\r\n	/* rajk - for blobstreaming */\r\n	$cfg[\'Servers\'][$key+1][\'bs_garbage_threshold\'] = 50;\r\n	$cfg[\'Servers\'][$key+1][\'bs_repository_threshold\'] = \'32M\';\r\n	$cfg[\'Servers\'][$key+1][\'bs_temp_blob_timeout\'] = 600;\r\n	$cfg[\'Servers\'][$key+1][\'bs_temp_log_threshold\'] = \'32M\';\r\n}\r\n\r\n#注意，这里是用循环来遍历数组，你只需改数组，不用改循环里的内容！！\r\n</code></pre>\r\n<p>修改完成后保存文件，重新登陆，\r\n如果可以看到phpMyAdmin登陆界面中出现服务器候选列表，说明修改正确\r\n</p>\r\n<li>登陆phpMyAdmin时只需在服务器地址“下拉列表”中选择就可无需输入用户和密码！</li>\r\n<p>操作步骤：请在方法二完成后，把循环里中$cfg[\'Servers\'][$i][\'auth_type\'] = \'cookie\';\r\n这一行的cookie改成config就完成了！</p>\r\n<p>修改完成后保存文件，重新登陆，\r\n会出现出现服务器候选列表和用户密码框，\r\n但只要你在服务器地址选中你要登录的服务器，用户密码不用管，直接提交就可登录！！\r\n注意，在chrome浏览器中，会出现报错，而且中有服务器候选列表，没有用户密码输入框，\r\n但只要选择你要登录的服务器，也能自动登录，只不过没有登录前有个报错界面难看了点点！</p>\r\n</ol>\r\n                            '
  ),
(
    7,
    '<p>\r\n首先要知道影响在线人数的因素\r\n</p>\r\n<ol>\r\n    <li>访问量</li>\r\n    <li>网站类型</li>\r\n<p>如果是出文字的网站(如小说站)，1M带宽带动日均5000IP，还勉强。如果是普通网站有图片，有文字、论坛、新闻资讯类型网站 大概1M能带一千IP。考虑到高峰期并发，1M高峰期还会卡。【最低配 这里不说服务器配制，一般来说配制都是足够的，除非你的服务器运行内存少于512M】。\r\n下面根据影响因素计算下1M带宽能同时承受多少人在线(以网络状况良好为前提)</p>\r\n</ol>\r\n\r\n<p>下面根据影响因素计算下1M带宽能同时承受多少人在线</p>\r\n<ol>\r\n    <li>打开网站8秒以内的原则;</li>\r\n    <li>评判的只是：用户从云服务器下载文件的速度;</li>\r\n    <li>页面的尺寸大小为60KB左右;</li>\r\n<p>参考公式：支持连接个人 = 服务器带宽/页面尺寸大小</p>\r\n<p>通过计算大致结果是，1Mbps的带宽(服务器的1M带宽是指服务器出站达到1M/s速度（服务器的上传带宽），跟我们家用的带宽稍有区别)支持的连接数为：17个</p>\r\n</ol>\r\n<p>\r\n因此，(N)M带宽可以支持的同时在线人数大概为N*17个  <br>\r\n所以，1M带宽的云主机，日均3000IP以下应该没问题。当然如果你的每个页面都比较大的话，那就没这么多了。具体多少，可以按照上面的算法算下。\r\n以上计算方法仅供参考！！！\r\n</p>'
  ),
(
    8,
    '<p>取得服务器文件<br>\r\ngit clone URL\r\n取得CI4最新代码示例：\r\ngit clone https://github.com/bcit-ci/CodeIgniter4  \r\n</p>\r\n<pre><code>\r\nelapse@Toka MINGW64 /d/Language/PHP/Code (develop)\r\n$ git clone https://github.com/bcit-ci/CodeIgniter4 \r\n以上是取得CI4最新代码示例\r\n\r\nelapse@Toka MINGW64 /d/Language/PHP/Code (develop)\r\n$ git clone https://github.com/bcit-ci/CodeIgniter4 codeigniter4New\r\n以上是取得CI4并重命名为codeigniter4New \r\n\r\nelapse@Toka MINGW64 /d/Language/PHP/Code (develop)\r\n$ git pull\r\n以上是更新你的本地仓库至最新改动\r\n</code></pre>\r\n<h5>一、git设置</h5>\r\n<pre><code>\r\n设置全局用户名与邮箱：\r\nelapse@Toka MINGW64 /d/Language/PHP/Code (develop)\r\n$ git config --global user.name \"临来笑笑生\"\r\n\r\nelapse@Toka MINGW64 /d/Language/PHP/Code (develop)\r\n$ git config --global user.email \'luck@fmail.pro\'\r\n\r\n查看配置：\r\nelapse@Toka MINGW64 /d/Language/PHP/Code (develop)\r\n$ cat .git/config\r\n[core]\r\n        repositoryformatversion = 0\r\n        filemode = false\r\n        bare = false\r\n        logallrefupdates = true\r\n        symlinks = false\r\n        ignorecase = true\r\n[remote \"origin\"]\r\n        url = https://github.com/bcit-ci/CodeIgniter\r\n        fetch = +refs/heads/*:refs/remotes/origin/*\r\n[branch \"develop\"]\r\n        remote = origin\r\n        merge = refs/heads/develop\r\n[gui]\r\n        wmstate = normal\r\n        geometry = 1061x563+32+32 233 255\r\n\r\nelapse@Toka MINGW64 /d/Language/PHP/Code (develop)\r\n$ \r\n\r\nelapse@Toka MINGW64 /d/Language/PHP/Code (develop)\r\n$ \r\n\r\nelapse@Toka MINGW64 /d/Language/PHP/Code (develop)\r\n$ \r\n</code></pre>\r\n<h5>二、创建git仓库及操作</h5>\r\n<pre><code>\r\nelapse@Toka MINGW64 /d/Language/PHP/Code (develop)\r\n$ mkdir abc\r\n\r\nelapse@Toka MINGW64 /d/Language/PHP/Code (develop)\r\n$ cd abc/\r\n\r\nelapse@Toka MINGW64 /d/Language/PHP/Code/abc (develop)\r\n$ git init\r\n\r\nelapse@Toka MINGW64 /d/Language/PHP/Code/abc (develop)\r\n$ git clone https://github.com/bcit-ci/CodeIgniter4\r\n\r\nelapse@Toka MINGW64 /d/Language/PHP/Code/abc (develop)\r\n$\r\n\r\n</code></pre>\r\n<h5>三、更改代码的操作</h5>\r\n<pre><code>\r\n更新本地代码到最新版本（需要merge才能合到本地代码中）:\r\nelapse@Toka MINGW64 /d/Language/PHP/Code (develop)\r\n$ git fetch\r\n\r\n合并更新后的代码到本地\r\nelapse@Toka MINGW64 /d/Language/PHP/Code (develop)\r\n$ git merge\r\n\r\n更新你的本地仓库至最新改动(git fetch和git merge组合)\r\nelapse@Toka MINGW64 /d/Language/PHP/Code (develop)\r\n$ git pull\r\n\r\n修改代码后，查看已修改的内容\r\nelapse@Toka MINGW64 /d/Language/PHP/Code (develop)\r\n$ git diff --cached\r\n</code></pre>\r\n<h5>四、其它常用命令</h5>\r\n<pre><code>\r\n销毁自己的修改\r\nelapse@Toka MINGW64 /d/Language/PHP/Code (develop)\r\n$ git reset --hard\r\n\r\n查看最新版本和上一个版本的差异(一个^表示向前推进一个版本)\r\nelapse@Toka MINGW64 /d/Language/PHP/Code (develop)\r\n$ git diff HEAD HEAD^\r\n</code></pre>\r\n使用手册:  <br>\r\n&nbsp;&nbsp;&nbsp;     <a href=\"http://idannywu.com/git.html\" target=\"_blank\">http://idannywu.com/git.html </a>       <br>          \r\n&nbsp;&nbsp;&nbsp;     <a href=\"https://git-scm.com/book/zh/v2\" target=\"_blank\">https://git-scm.com/book/zh/v2 </a>     <br>\r\n&nbsp;&nbsp;&nbsp;     <a href=\"http://rogerdudler.github.io/git-guide/index.zh.html\" target=\"_blank\">http://rogerdudler.github.io/git-guide/index.zh.html </a>  <br>\r\n&nbsp;&nbsp;&nbsp;     <a href=\"http://wlog.cn/soft/git-quick-start.html\" target=\"_blank\">http://wlog.cn/soft/git-quick-start.html </a>  <br>'
  ),
(
    9,
    '<p>今天周日，闲着蛋疼，然后就去重装了Windows10企业版的系统，没想到连接VPN时出错“ L2TP连接尝试失败:ERROR因为安全层在初始化与远程计算机的协商时遇到了一个处理错误” <br>\r\n无奈，只有折腾解决方法：</p>\r\n<h5>一、查看VPN所需要服务是否启动</h5>\r\n<p>首先呢，用快捷键“win+e”打开“此电脑”,然后右键此电脑，选择\"管理（G）”，在弹出的新窗口“计算机管理”中的左侧最下面的依次点开“服务和应用管理”=》“服务”，然后把以下几个服务启动并设置自动启动！！</p>\r\n<ol>\r\n   <li>IPsec Policy Agent</li>\r\n   <p>找到并双击就可以打开IPsec Policy Agent的属性，设置启动类型为：自动（延迟启动）；</p>\r\n   <li>Routing and Remote Access</li>\r\n   <p>双击打开Routing and Remote Access的属性，设置启动类型为：自动（延迟启动）；</p>\r\n   <li>Remote Access Connection Manager</li>\r\n   <p>双击打开Remote Access Connection Manager的属性，设置启动类型为：自动（延迟启动）；</p>\r\n</ol>\r\n<h5>二、修改注册表</h5>\r\n<p>用快捷键“win+r”打开运行，输入：regedit  回车就可以打开“注册表编辑器” <br>\r\n然后依次打开： <br>\r\n计算机\\HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\RasMan\\Parameters</p>\r\n<ol>\r\n   <li>双击右侧中的AllowL2TPWeakCrypto，把数值改为：1 （备注：如没有此项则新建DWORD类型并将其设置为 1 的值） </li>\r\n   <li>创建ProhibitIpSec，选择DWORD类型（32位，64位都可以）并将其设置为 1 的值</li>\r\n</ol>\r\n<p>大功告成，重启电脑后连接VPN！！</p>\r\n打开免费VPN：<a href=\"http://www.freevpnonline.com/\" target=\"_blank\">freevpnonline.com</a><br>\r\n找到账号（freevpnonline.com）密码（5201）与共享密钥（freevpnonline.com）进行VPN连接，测试，一下子就连接上了！！哈哈，成功啦，我先去上一下<a href=\"https://www.google.com/\" target=\"_blank\">谷歌</a>压压惊，死X度娘，你可以离我远点了！！！\r\n'
  ),
(
    10,
    '<h5>一、安装必要的类库和软件</h5>\r\n<p>一般我们都需要先装pcre, zlib，前者为了重写rewrite，后者为了gzip压缩</p>\r\n<pre><code>\r\nroot@Toka:~# 先安装必要用到的软件\r\nroot@Toka:~# apt-get install vim build-essential libtool\r\nroot@Toka:~# 下载pcre, 并解压\r\nroot@Toka:~# cd /usr/local/src\r\nroot@Toka:~# wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.40.tar.gz\r\nroot@Toka:~# tar -zxvf pcre-8.40.tar.gz\r\nroot@Toka:~# 下载zlib，并解压\r\nroot@Toka:~# wget http://zlib.net/zlib-1.2.11.tar.gz\r\nroot@Toka:~# tar -zxvf zlib-1.2.11.tar.gz\r\nroot@Toka:~# 下载openssl，并解压\r\nroot@Toka:~# wget http://www.openssl.org/source/openssl-1.0.1c.tar.gz\r\nroot@Toka:~# tar -zxvf openssl-1.0.1c.tar.gz\r\nroot@Toka:~# \r\n</code></pre>\r\n<p>pcre和zlib与openssl这个也只解压就好,不要编译安装，编译Nginx时会自动安装</p>\r\n\r\n<h5>二、源码编译安装Nginx</h5>\r\n<p>首先从<a href=\"http://nginx.org\" target=\"_blank\">nginx.org官网</a>最新版本，stable（稳定版）、mainline 版，随意选择，我这里选择的是mainline版本</p>\r\n<pre><code>\r\nroot@Toka:~# wget http://nginx.org/download/nginx-1.13.6.tar.gz\r\nroot@Toka:~# tar -zxvf nginx-1.13.6.tar.gz\r\nroot@Toka:~# cd nginx-1.13.6/\r\nroot@Toka:~# #====================下面这两个扩展主要是为了可以代理www.google.com才加的========================\r\nroot@Toka:~# apt install git\r\nroot@Toka:~# cd /usr/local/src/\r\nroot@Toka:~# git clone https://github.com/yaoweibin/ngx_http_substitutions_filter_module\r\nroot@Toka:~# git clone https://github.com/cuber/ngx_http_google_filter_module\r\nroot@Toka:~# #====================下面两个 -add-module 分别对应上面这两个 ========================\r\nroot@Toka:~# ./configure --sbin-path=/usr/local/nginx/nginx \\\r\n --conf-path=/usr/local/nginx/nginx.conf \\\r\n --pid-path=/usr/local/nginx/nginx.pid \\\r\n --with-http_ssl_module \\\r\n --with-pcre=/usr/local/src/pcre-8.40 \\\r\n --with-zlib=/usr/local/src/zlib-1.2.11 \\\r\n --with-openssl=/usr/local/src/openssl-1.1.0c \\\r\n --with-http_v2_module \\\r\n --add-module=/usr/local/src/ngx_http_substitutions_filter_module \\\r\n --add-module=/usr/local/src/ngx_http_google_filter_module\r\nroot@Toka:~# make  \r\nsed -e \"s|%%PREFIX%%|/usr/local/nginx|\" \\\r\n        -e \"s|%%PID_PATH%%|/usr/local/nginx/nginx.pid|\" \\\r\n        -e \"s|%%CONF_PATH%%|/usr/local/nginx/nginx.conf|\" \\\r\n        -e \"s|%%ERROR_LOG_PATH%%|/usr/local/nginx/logs/error.log|\" \\\r\n        &lt; man/nginx.8 &gt; objs/nginx.8\r\nmake[1]: Leaving directory \'/root/soft/nginx-1.13.6\'\r\nroot@Toka:~# make install\r\nmake -f objs/Makefile install\r\nmake[1]: Entering directory \'/root/soft/nginx-1.13.6\'\r\ntest -d \'/usr/local/nginx\' || mkdir -p \'/usr/local/nginx\'\r\ntest -d \'/usr/local/nginx\' \\\r\n        || mkdir -p \'/usr/local/nginx\'\r\ntest ! -f \'/usr/local/nginx/nginx\' \\\r\n        || mv \'/usr/local/nginx/nginx\' \\\r\n                \'/usr/local/nginx/nginx.old\'\r\ncp objs/nginx \'/usr/local/nginx/nginx\'\r\ntest -d \'/usr/local/nginx\' \\\r\n        || mkdir -p \'/usr/local/nginx\'\r\ncp conf/koi-win \'/usr/local/nginx\'\r\ncp conf/koi-utf \'/usr/local/nginx\'\r\ncp conf/win-utf \'/usr/local/nginx\'\r\ntest -f \'/usr/local/nginx/mime.types\' \\\r\n        || cp conf/mime.types \'/usr/local/nginx\'\r\ncp conf/mime.types \'/usr/local/nginx/mime.types.default\'\r\ntest -f \'/usr/local/nginx/fastcgi_params\' \\\r\n        || cp conf/fastcgi_params \'/usr/local/nginx\'\r\ncp conf/fastcgi_params \\\r\n        \'/usr/local/nginx/fastcgi_params.default\'\r\ntest -f \'/usr/local/nginx/fastcgi.conf\' \\\r\n        || cp conf/fastcgi.conf \'/usr/local/nginx\'\r\ncp conf/fastcgi.conf \'/usr/local/nginx/fastcgi.conf.default\'\r\ntest -f \'/usr/local/nginx/uwsgi_params\' \\\r\n        || cp conf/uwsgi_params \'/usr/local/nginx\'\r\ncp conf/uwsgi_params \\\r\n        \'/usr/local/nginx/uwsgi_params.default\'\r\ntest -f \'/usr/local/nginx/scgi_params\' \\\r\n        || cp conf/scgi_params \'/usr/local/nginx\'\r\ncp conf/scgi_params \\\r\n        \'/usr/local/nginx/scgi_params.default\'\r\ntest -f \'/usr/local/nginx/nginx.conf\' \\\r\n        || cp conf/nginx.conf \'/usr/local/nginx/nginx.conf\'\r\ncp conf/nginx.conf \'/usr/local/nginx/nginx.conf.default\'\r\ntest -d \'/usr/local/nginx\' \\\r\n        || mkdir -p \'/usr/local/nginx\'\r\ntest -d \'/usr/local/nginx/logs\' \\\r\n        || mkdir -p \'/usr/local/nginx/logs\'\r\ntest -d \'/usr/local/nginx/html\' \\\r\n        || cp -R html \'/usr/local/nginx\'\r\ntest -d \'/usr/local/nginx/logs\' \\\r\n        || mkdir -p \'/usr/local/nginx/logs\'\r\nmake[1]: Leaving directory \'/root/soft/nginx-1.13.6\'\r\nroot@Toka:~# 到此nginx安装完成！！\r\n</code></pre>\r\n\r\n<h5>三、源码编译安装PHP</h5>\r\n请稍等，正在整理…………\r\n<h5>三、配置Nginx与PHP</h5>\r\n'
  ),
(
    11,
    '<p>一、安装依赖包</p><p>二、安装SVN</p><p>三、配置SVN勾子自动更新</p>'
  ),
(
    12,
    '<p><p>一、能正常用SecureCRT连接的VPS</p>\r\n想要科学上网，你这只VPS肯定是要在国外或者香港的，因为国内的服务器跟你自己电脑一样也是被禁止过滤了好多站点的！！\r\n\r\n<p>二、配置SecureCRT的SOCKS5代理</p>\r\n用SecureCRT正常连接VPS后，选择上个的菜单=&gt; Options =&gt; Session Options  <br>\r\n在弹出的新窗口的左侧选择 Connection =&gt; Port Forwarding  选中 <br>\r\n在右侧中单击“Add…”按纽，新弹出窗口  <br>\r\nName中随便输入个名字，我这里以端口号为名“5858” <br>\r\n两个Port中输入端口，这里输入：5858   <br>\r\n再把“Dynamic forwarding using SOCKS 4 or 5”给勾选上！！ <br>\r\nOK！记得点“OK”，然后断开VPS，再重新连接一下就设置完成了！！</p><p><img src=\"data:image/png;base64,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sLNCscXarG4zWeXatla9zcINk/tbzEazicUTCHh+YQtue3IBSjVrC79bU3zTv4pLzlccOv7P13aLFzzwwhsPxHTkP7Fy8RcbPpl/5birknxtHC6e86Lm4mnPwh6w1xcUXvTev598at3hoHE3/uPxe+ZNSve3df60b8PrX5Vf8fzr//zjXHPBhvt//4e167dcPSEhLaxnOZ8S4HD0+iRUFHah45/VbOaIRGw+n6XTMQmpjmT3ImioqVNyEAQIAgSBnwUBR+amjY9jzM+iAimEQiA9PR3If//990ql0iUivA77zLOPjw8YEsuyXV1dSOfv78/csIHkQZMKkjGXhBzhnIA5Novt+abn8w35IB9cxSh8oc/C1aGrnUbhtB5mK5vN9w9la04e3Wc1G9o1NqNWdfKnohazxdJedfBoYafR75r5U2RsDN8tnbV7X7r7zebMax5Z/bsoqzk8+8owG6v5xCdvNhvkU2elZ0ZXR4dtP164d8/pSWb24Z8qDdxRs7Jlxzf959W3fpry5Eu3TY02drbqsP/c2FFZVdfIC50cFMg11GJsHm3St7Y0C3QdPI5V26lva85785WPcm0p97+4elIY3lHTW0VUCEGrrvjId59u+IGdectjD942USntaqq1SYSGNk0bqqzTNjY2WbUWjpXVru3WG402m4iurNMvBSDlIFCHODIyfNky9bFjPomJYVddVbN+PT0cp9IQFncCjpwSBAgCFxUByshgLMG8CqNXOGLoS45X3SXuzUT+jhQCqampIOiNGzeCqQeWwfvf//7n5+eHaXfw/JkzZ06ePMnhcLKystLS0pCNuZHIiTB9OIVpoXwWf650ro1te6HxhdP603wOf4HfgkeCH8EonE5PJ2N+gxOzX9x4+En741iasiP/fOjGI9H3vPPEPWMCfdpPnc07V26RLbhyXCAbxVosnaqCbcf2dZmib2q4pmzjqj+tPd1hYFlN7IjRix+5d0mEn2zKVZOS9h/75G/LNgvZepbP+NufWxTL3rHl2A95B7lnqxeH17/92IqPc+0fVLWZhVNuuGZWTqxccl3GV59/9/LSH9/mYzBsME9bMSWZ2/ZS7sFjlta5tZ0TQ/H1EarGdp3tVdepi0+dVFVrmxs+/uvprxDP5QtveHH97RnTFij3bPvXfbveEXFYZgsraNEVE0MDfHvzMpXuCdhlUT8476qq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'
  ),
(
    13,
    '<p></p><p></p><p></p><p>一、能正常用SecureCRT连接的VPS</p>\r\n想要科学上网，你这只VPS肯定是要在国外或者香港的，因为国内的服务器跟你自己电脑一样也是被禁止过滤了好多站点的！！\r\n\r\n<p>二、配置SecureCRT的SOCKS5代理</p>\r\n用SecureCRT正常连接VPS后，选择上个的菜单=&gt; Options =&gt; Session Options  <br>\r\n在弹出的新窗口的左侧选择 Connection =&gt; Port Forwarding  选中 <br>\r\n在右侧中单击“Add…”按纽，新弹出窗口  <br>\r\nName中随便输入个名字，我这里以端口号为名“5858” <br>\r\n两个Port中输入端口，这里输入：5858   <br>\r\n再把“Dynamic forwarding using SOCKS 4 or 5”给勾选上！！ <p></p><p><img src=\"https://toka.pro/static/uploads/summernote/12/81d6c285a906ad30e6b39b44c15edf24.png\" data-filename=\"img\" style=\"width: 663px;\"><br>\r\nOK！记得点“OK”，然后断开VPS，再重新连接一下就设置完成了！！\r\n\r\n\r\n</p><p>三、配置浏览器的SOCKS5</p>\r\n浏览器设置中，火狐是最容易设置的！ <br>\r\n火狐：<br>&nbsp; &nbsp; &nbsp; &nbsp; 设置  接到最下面“网络代理服务器” 点击“设定” <br>&nbsp; &nbsp; &nbsp; &nbsp; 选择“手动设定 Proxy（M）:  <br>&nbsp; &nbsp; &nbsp; &nbsp; 在SOCKS主机填入：127.0.0.1 端口：5858 <p></p><p><img src=\"https://toka.pro/static/uploads/summernote/12/f4ce6f896718144cdcd77c8e1b4ea140.png\" data-filename=\"img\" style=\"width: 891px;\"><br>&nbsp; &nbsp; &nbsp; &nbsp; 确定就设置完成了！！  <br>\r\n    \r\n谷歌： <br>&nbsp; &nbsp; &nbsp; &nbsp; 右键“Google Chrome”，选择属性 <br>&nbsp; &nbsp; &nbsp; &nbsp; 在目标这一行中添加： --proxy-server=\"SOCKS5://127.0.0.1:5858\"   <br>&nbsp; &nbsp; &nbsp; &nbsp;如我的：C:\\Users\\Administrator\\AppData\\Local\\Google\\Chrome\\Application\\chrome.exe --proxy-server=\"SOCKS5://127.0.0.1:5858\"  <br>&nbsp; &nbsp; &nbsp; &nbsp;点击确定，然后双击打开就可以直接用SSH2代理上网了！ <br>开始吃鸡啦，开始科学上网，想上哪个网站就哪个，是不是特别爽，而且特别简单！！</p><p>四、苹果MAC下开启代理：</p><p>&nbsp;1.如需无密码登录，则要配制公钥和私钥</p><p>2.一条命令天启Socks5：&nbsp; while true; do ssh -D 5858 root@107.155.45.83 || true; done</p><p></p><p></p>'
  ),
(
    14,
    '<p>升级Windows10到开发版Build 17074，没想到虚拟机出错（VMware Workstation 与 Device/Credential Guard 不兼容。在禁用 Device/Credential Guard 后，可以运行 VMware Workstation。有关更多详细信息，请访问http://www.vmware.com/go/turnoff_CG_DG。）</p><p>没法，只好放Google搜索一下！都是说两点：</p><p>1、禁用Hyper-V &nbsp;（这个默认就是关闭的，所以无需操作）</p><p>2、禁用 Credential Guard</p><p>只好按照要求去做第二步关闭Credential Guard：</p><p>“win键+r\"打开运行，输入gpedit.msc，确定打开本地组策略编辑器</p><p>转到<b>本地计算机策略</b>&gt;<b>计算机配置</b>&gt;<b>管理模板 &gt; 系统</b>&gt;<b>Device Guard</b></p><p><b>打开&nbsp;</b>基于虚拟化的安全 设置为“已禁用”</p><p><b>按</b>“win键+X\"，选择“Windows PowerShell(管理员)(A)”</p><p><b>输入命令：bcdedit /set hypervisorlaunchtype off</b></p><p><b>然后重启</b></p><p><b>没想到，还是提示</b></p><p><b><br></b><img src=\"https://toka.pro/static/uploads/summernote/01/774b3d0063a99f95f8d7b8f7a761f553.png\" data-filename=\"img\" style=\"width: 424px;\"><b><br></b>百思不得解！！</p><p>最后再按上面步骤重做一次，但没有直接重启，只是选择关机！！没想到关机后，再打开电源开机，就可以了！！</p><p>这证明是不是重启就是一个坑呢？</p><p>应该正确的姿势是：关机-》再开机！！！ &nbsp; &nbsp;看来要生个孩子，姿势很重要呀！！！</p><p> </p>'
  ),
(
    15,
    '<p>&nbsp; &nbsp; &nbsp; &nbsp; 气冲冲从工商局回来后，坐电脑前，想起了这个月公司的社保还没扣缴。上电子税务局，直接选择社保申报，飞快点到扣缴费，按下扣款拕！“余额不足，扣款失败”，shit,公司公账没钱了。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;遥想当年，还是个单纯的程序员时，从没想过有一天我连会计做账报税，帮客户代办营业执照，扣缴社保等这些杂活也要做。自从创办了“风创未来网络有限公司”后，一切都变了！</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 再也回不到那个只是单纯的人，单纯的程序员了！无论是见客户接单时，还是为客户去工商局办理营业执照面对那些故意为难你的公务员，都满满的心累感。公务员的不作为就不说了，单论我这个性格，并不适合于人际关系，不然今天也不会在工商局和那些公务员吵起来了。想想这一架吵得真不值得，回来后，阿弟整整关在房门没有和我说一句话！也许他也觉得我太过于浮躁了。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;浮躁，看着“余额不足，扣款失败”这几个字，不单单是浮躁，更多的是无奈！也许这样就快要成为创业失败者了。上个月因为资金不足，把公司唯一一个员工炒掉后，公司就只有我和我弟弟了。可能早就已是名存实亡？并不是，因为公司主要靠的是我！</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 遥想当初，去注册“风创未来”公司营业执照时，是多么的紧张和担心办不了。当时我还在“房道网”当作一个普通的PHP程序员，又不太敢经常请假去搞这个执照的事。当时大概是在2017年末吧 想着先在春节前办下执照，过完年后再换份技术主管的工作，这样子轻松又有时间做下自己“风创未来”的事。但是后来忘了什么原因导致我年后提前离职了！中途又去面试了好几家公司的职位，但都没有比较适合心意的工作 然后在老乡林秋清这个帮我做兼职会计的鼓动之下 ，初步设想和计划公司的实业经营范围为一开始做代理记账这一块传统行业！</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 其实我创办这家公司，是想用它来从事经营服务器和云服务器这一块的。但当我真正办下“风创未来网络有限公司”后 才突然发学自己连购买个服务器的资金都不足，更何况要购买很多，还要把这些服务器全部都托管到机房里面去！那只能想着从简单，投入成本低的行业先积累客户，最后再做客户转移罗。可以先做技术定制，再从中推广自己的云服务器，这样子成本低，或是做工商代办，代理记账，帮客户从办公司开始，营业执照，记账报税，做技术定制（官网 小程序） 云服务 一条龙服务下来！想法和计划好像挺好的，没有方向上的错误。唯一的就是没有想到自己做自己公司官网所花费的时间太长了 整整两个多月。唉，也许创业时员工多并不是好事，管理上都占去了一定的时间，却没能达到人多做事快的效果。或许这就是请大学实习生的后果吧！</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 时间，这也是一个非常大的成本。如果我还是年轻人，而不是中年大叔的话，我还可以面对更多的失败和重来！但现在的我已三十有余，无论是将来结婚生子都已不远，老爸老妈一直在催这个事，而我自己却深深的明白，还没有这个能力可以担当得起做为别人老公的责任，更没钱担得起孩子他爸。如果再给我半年时间，我可以把公司所需要的代理记账会计软件开发完美初步使用版，那样子我可以安排全力去扩展业务而不用愁心于现有客户的服务质量问题！</p>'
  ),
(
    16,
    '<p>很多时候，自己源码编译的软件都想设置为开机自动启动，免得机器不小心重启后还要手动去开启服务；特别是mysql、PHP、 Nginx等；</p>\r\n<h4>先建立个开机启动时测试脚本：</h4>\r\n<pre><code>\r\nroot@elapse.date:~# vim testBoot.sh\r\n#!/bin/bash\r\n# =========================================================================\r\n# 测试开机启动\r\n# =========================================================================\r\nLog=/root/reboot.log.txt\r\nDate=\'date +%Y%m%d%H%M%S\'\r\necho \"# ================== `${Date}`=&gt; start ===================\" &gt;&gt; ${Log}\r\necho \'=======================完美的一天========================\' &gt;&gt; ${Log}\r\n# 保存退出!\r\nroot@elapse.date:~# 复制脚本到　/etc/init.d/　目录下\r\nroot@elapse.date:~# cp testBoot.sh /etc/init.d/\r\nroot@elapse.date:~# 给脚本加可执行权限\r\nroot@elapse.date:~# chmod +x /etc/init.d/testBoot.sh\r\nroot@elapse.date:~# 增加开机启动\r\nroot@elapse.date:~# update-rc.d testBoot.sh defaults\r\n警告：insserv: warning: script \'testBoot.sh\' missing LSB tags and overrides\r\nroot@elapse.date:~# 因为testBoot.sh不符合debian开机自启文件的内容规范，debian要求文件头部有启动信息。\r\nroot@elapse.date:~# 参考同目录下的/etc/init.d/skeleton文件头\r\nroot@elapse.date:~# 把如下，头回入到testBoot.sh里面\r\nroot@elapse.date:~# vim /etc/init.d/testBoot.sh\r\n#!/bin/bash\r\n# =========================================================================\r\n# 测试开机启动\r\n# =========================================================================\r\n\r\n### BEGIN INIT INFO\r\n# Provides:          skeleton\r\n# Required-Start:    $remote_fs $syslog\r\n# Required-Stop:     $remote_fs $syslog\r\n# Default-Start:     2 3 4 5\r\n# Default-Stop:      0 1 6\r\n# Short-Description: 这是测试开机启动\r\n# Description:       详细描述此开机测试脚本\r\n### END INIT INFO\r\n\r\nLog=/root/reboot.log.txt\r\nDate=\'date +%Y%m%d%H%M%S\'\r\necho \"# ================== `${Date}`=&gt; start ===================\" &gt;&gt; ${Log}\r\necho \'=======================完美的一天========================\' &gt;&gt; ${Log}\r\n# 保存退出!\r\nroot@elapse.date:~# 先删除刚才开机启动\r\nroot@elapse.date:~# update-rc.d -f testBoot.sh remove\r\nroot@elapse.date:~# 再增加开机启动，是不是就不再有这个警告了？！\r\nroot@elapse.date:~# update-rc.d testBoot.sh defaults\r\nroot@elapse.date:~# 果然不再有警告了！重启试下脚本是否有开机自动启动了\r\nroot@elapse.date:~# reboot\r\n</code>\r\n</pre>\r\n查看是否生成了/root/reboot.log.txt文件！！有生成，测证明增加开机启动成功，因为以上开机启动测试脚本主要是生成一个便于我们查看是否开机启动的日志\r\n\r\n\r\n\r\n\r\n'
  ),
(
    17,
    '<p></p><p><a href=\"http://blog.sina.com.cn/s/blog_13f88c2ed0102yq5w.html\">转自：公号 张凯律师</a></p>\r\n<p>2010年春天，我和十几位律师、记者一起研讨山西毒疫苗事件。\r\n我把研讨会记录放在我的博客里，第二天，文章被删，为了表示抗议，我把这个事记录在了博客里。</p>\r\n<img src=\"https://elapse.date/static/uploads/summernote/11/2fb38446f97885af3bf062d5177b2dfb.jpg\" data-filename=\"img\"> \r\n<p></p><p>之后，律师和记者分头行动，一系列维权过程我都写在博客里，但文章很快被外星人劫持了。</p><p>那一年，我见了很多当事人，他们的孩子在打完疫苗之后，有的忽然抽搐，有的死了……。</p><p>但是，人的生病和死亡可能有很多种原因，他们只能说明在时间上有先后关系，但是谁能说清楚是否存在实质因果关系呢？</p><p>很多部门就是这么搪塞他们的。</p><p>疫苗的保存要求在2–8度，当时有证据表明：很多疫苗直接在高温下保存和运输。</p><p>高温下的疫苗只是无效，还是变质为有毒物质？谁都说不清。</p><p>当时毒疫苗事件发生在山西，八年后的今天，疫苗受害主要在山东。</p><p>这一东一西，惹动了人们的愤怒。</p><p>山西疫苗事件距今天已经八年时间了，这八年，我经历了人生各种起落和变故。</p><p>就像坐在一艘大船里，自己完全无力左右命运，只能跟着大船起起落落。</p><p>然而，我们何尝不都在一艘大船里，看起来船决定着我们的命运。<br></p><p>事实是：船里的每一个人，决定着船的命运。</p><p><br></p><p>1</p><p><br></p><p>我的同学今天给我留言，让我写写毒疫苗的文章，因为他的孩子打了报道的问题疫苗，他不知道这疫苗进入孩子的血液里会发生什么。</p><p>我还记得他嘲讽我：不懂得赚钱，每天总是关心自己改变不了的事情，闲的蛋疼。</p><p>我的同学就很会赚钱，平时不问西东，念叨着什么岁月静好。 八年前山西毒疫苗的事情他根本不知道，似乎也不需要知道。山东的事终于轮到他了。</p><p>他也真的急了，一下午给我发来好多这个事件的文章，问我是不是真的。</p><p>我说：“不传谣，不信谣”。这正是他曾经发给我的微信。</p><p>2009年，我帮助毒奶粉受害者。</p><p>2010年帮助毒疫苗家庭。</p><p>我的这位同学说：你什么都改变不了，倒是把自己搭进去了。识时务者为俊杰。</p><p>他说的是真的，而且他也是俊杰。所以，我不为自己辩护。</p><p>2009年，我代理毒奶粉的受害人，到法院起诉，法院不立案。</p><p>2010年，毒疫苗的受害人到法院起诉，法院也不立案。受害人就到卫生部抗议，最后被拘留了，于是行政诉讼，我拿着他们的诉状到法院，依然不立案。我和法官吵起来，最后被轰出去了，这事发生在北京的一个法院。</p><p>行政拘留不算太重的处罚，最多十五天。但据说有人因此被判刑，理由是：寻衅滋事，刑期两年。</p><p>确实，我什么也没有改变。</p><p>我常常感觉到：这样的处境，律师是最没用的，有时候，我们只是给当事人带来一些心灵的安慰而已。</p><p><span style=\"background-color: rgb(255, 0, 0);\">今天网上才传出消息：过去管奶粉的领导，并没有卸任，现在管疫苗了。</span></p><p><span style=\"background-color: rgb(255, 0, 0);\">网友质问：管不好奶粉的人，能管好疫苗吗？</span></p><p><span style=\"background-color: rgb(255, 0, 0);\">疫苗问题没有解决，管疫苗的人也没有解决，但提问题的人都被解决了。</span></p><p>当年披露山西毒疫苗的记者王克勤被报社下岗，总编包月阳被免职。还有当年的那些律师，我都不想多说了。</p><p>最近读哈耶克，这位先知般的思想家，指出了人类通往奴役的路，他说：“观念的转变和人类意志的力量，塑造了今天的世界”。</p><p>如果他说的是真的，那么：今天的中国的样子，就是中国人观念塑造的，中国人普遍有什么样的想法，就有什么样的中国。</p><p>换句话说，中国人，有什么样的观念，就会有什么样的疫苗。</p><p>我那位同学的想法，基本是国人的普遍想法。</p><p>平时我懒得理他，他也懒得理我，同一个世界，不同的梦想。</p><p>而这次，这位同学或许才意识到，我们是在同一条船上。不仅仅我与这位同学，这次大富豪刘强东与八年前那些衣服都穿不整齐的农民，也站在了同一条船上。</p><p>平时我的这位同学一门心思赚钱，哪里管什么洪水滔天。但这次他发现了船在漏水，可能自己也会溺水，总应该想想怎么把船修好吧？</p><p>况且他平时很“爱国”，微信朋友圈几乎没有“负面”信息，最近又在朋友圈里转发人报文章，吆喝着要和美国把贸易战打到底，说什么：美国亡我之心不死。</p><p>这位同学最后发信说：“要好好赚钱，让儿子移民”。</p><p>我回复：“真怂”。</p><p><br></p><p>2</p><p><br></p><p>一个大胆的假设：</p><p>如果2010年，那些做报道的记者、律师不是被打压，而是得到荣誉。</p><p>如果那年的的疫苗事件，责任官员得到惩处，法院大胆的开庭审理，受害人得到高额赔偿。</p><p>如果那些自发组织起来的NGO组织，可以自由的发挥他们的功效。</p><p>那今天会怎么样呢？</p><p>不用太聪明也会知道：会产生更杰出的记者、律师、官员……</p><p>法官会充满荣誉感，他们会骄傲的说：八年前那个案子是我判的……</p><p>NGO组织会自豪的把八年前他们的功绩写在自己的宣传册里，对来访的人夸耀自己在疫苗事件中所做的贡献……</p><p>但，这一切都只是假设。</p><p>如果把我的这些假设翻译成政治或法律词汇，就是：新 闻 自 由、司 法 独 立、主 权 在 民……</p><p>这些已经被历史无数次的验证过的价值，难道我们还需要别出心裁，另辟新道吗？</p><p>问题疫苗难道真的只是疫苗问题吗？</p><p><br></p><p>3</p><p><br></p><p>爱国青年说：“任何国家都有问题。”</p><p>是的，他们说的没错，但解决问题的方式却大不相同。</p><p>八年前，我们把毒疫苗的帖子删干净了，以为疫苗问题解决了。</p><p>但问题疫苗只是换了一个省。而且，这或许只是刚刚开始。</p><p>《南方都市报》刊发的调查报告《疫苗之殇》中披露，中国是世界疫苗事故最多、最惨的国家，每年至少都会有超过1000个孩子患上各种疫苗后遗症，或死或残。</p><p>美国也曾经有过疫苗危机，大家都争着要往美国这艘船上跳，看看他们是怎么对待船客呢？</p><p>几年前，美国麻州一家药厂出现违规，导致全国脑炎爆发，76人死亡，该厂负责人被控二级谋杀，药厂倒闭，赔偿2亿美金。</p><p>1988年，美国通过《国家疫苗伤害补偿程序》。确立了为接种疫苗造成伤害的无过错补偿制度，受害人无需诉讼就可获得初步赔偿。</p><p>我们得到赔偿的概率有多大呢？</p><p>这要解释什么是无过错补偿。简单的说：双方举证方式不同。</p><p>2013年湖南广东四川有4名婴儿注射乙肝疫苗后死亡。家属向医院提出索赔，院方称：尚不能确定死因与疫苗有关。也就是说：家属需要证明孩子的死是疫苗导致的。</p><p>想想，这样的证明有多难？孩子打了疫苗，孩子也死了，但这可以证明是疫苗导致的吗？不可以。</p><p>医院会说：孩子中午还吃饭了呢？你怎么知道不是吃饭死的？医生可以拿出一大堆病例说明：吃饭也是可以死人的。</p><p>你是一个几年才会接种一次疫苗的人，你的诉讼对手是精通疫苗医学的机构。你怎么可能讲过他？</p><p>你当然可以申请鉴定，但是疫苗有多假，鉴定就可以有多假。</p><p>美国确定的的无过错补偿责任正好相反，上面的案子为例，按照美国的法律，院方需要证明：孩子的死与疫苗没有关系，如果院方不能证明，就要赔偿。</p><p>依据上述的美国法律，也是先行赔付。先赔钱，然后再打官司，一般而言，孩子疫苗后，只要不是明显的意外死亡或其他疾病导致死亡，都会推定为疫苗导致。</p><p>而赔偿的数额呢？</p><p>在山西毒疫苗事件中，唯一获得法院立案的尚彩玲，打了三年官司，最终和疫苗厂家达成和解协议：厂家补偿十万元，尚彩玲放弃诉讼和上访权利。</p><p>从1988年至2000年法案实施12年间，全美有1500多人得到11亿多美元的基金救济。平均每人约500万人民币。</p><p>从数字来看，我们孩子比美国孩子疫苗致残、致死的数额多出十多倍。而赔偿，我们比美国少十几倍。</p><p>看了这样的数字，不知道那些整日喊着：“厉害了，我的国”的人会怎么想。</p><p><br></p><p>4</p><p><br></p><p>不能再写下去了，再写一下就又变成“别有用心”的人了。但希望这篇文章不要被删，谁家没个孩子，谁能避免被狗咬一口呢？</p><p>当年为疫苗受害者呼吁的律师，现在多半已经不干这事了。他们在哪里，自行谷歌吧。</p><p>我回到了北京，北京司法局还没有给我年检，所以不能执业，既然大家都在一艘船上，谁认识局长，帮我和他聊聊。把这么优秀的律师逼成一个靠文章打赏的人，实在违背社会主义核心价值观。</p><p>张凯律师记于2018年7月23日</p>\r\n<hr>\r\n<p>那律师被失踪了。今天在其他网站上看到的：</p><p>有那么一个地方正义不再正义了，英雄，那些真的猛士，时时流泪又流血。爆料\"地沟油\"的洛阳电视台记者李翔身中10余刀被惨杀；\"中国药品打假第一人\"高敬德在北京被派出所接走，3天后离奇死亡；\"皮革奶\"风波，中央电视台主持赵普因告诫\"不要再吃老酸奶和果冻\"而被淡出将近半年；爆料毕节五名流浪儿童被冻死的记者李元龙也不知去向；爆料\"三聚氰胺\"事件，中国乳业打假第一人蒋卫锁遇害；六年前记者王克勤发现了疫苗问题，并发表了长篇调查报告。然后，他被下岗了；而报道疫苗问题的总编辑包月阳，后来被免职了……一个个血腥的事件，令我们如此揪心，胸闷至心痛。</p><p><br></p><p>对于这种非正常的社会现象，我一直在纳闷，我们这个社会到底是哪一股势力如此之强大，强大到可以无视社会正义，可以蔑视汹汹的民意，敢冒天下之大不韪，保护恶人，捂盖坏事？我更不知道，这股力量悠悠的底气，到底是谁赋予的，竟然强大到可以逆天，不惜站到民众对立面上来。</p><p>我不敢揣测，恕我胆怯，我要苟延残喘，还要苟活于这个世界，毕竟我有家有室，只能选择呼吁，坚守良知，理性爱国，沉稳做事。我知道，更多的人与一样，选择沉默，选择等待。然而，我们沉默恰恰是对邪恶的纵容，等待来的结果恰恰是李翔和蒋卫锁之死，而孙咸泽等人反而升官发大财，我们却变成了这个社会邪恶势力的帮凶，不知道个个脸上有着血污……</p><p>我们这个社会啊，如今真的谈不上什么进步的，做好人的成本太高，做英雄的代价太大。社会的新闻导向，越来越畸形化或无厘头化。理想在新闻联播上得到\"高富帅\"般丰满，现实在网络新闻里顷刻\"低矮挫\"般骨感。这一厢，打开电视看新闻联播了，什么拍了35次掌，手拍麻了；流了5次泪，泪流干了；1000次生在中国，1000次死在中国，简直爱死中国了……一片歌舞升平，中华盛世景象；那一厢，打开电脑看社会新闻了，诸如什么乳业打假第一人蒋卫锁遇害了，发布毕节5流浪儿童冻死的李元龙被当地警方控制了，云南彝良农妇因跪访总理被拘留了，爆料重庆官员不雅照曝光的朱瑞峰似遭到报复……貌似我们的国家，已然听不进一点真实的声音，对待自己的人民，特别是说真心话、办良心事的人越来越发狠。徒徒地要求人们永远生活在新闻联播的新闻通稿中，生活在谎言中，像猪一样，被安排，被幸福，最后被屠戮……</p><p>到底哪一个中国是真实的？</p><p>面对全球只有中国大陆才会发生怪象！我只是想问：我们的政府扮演了怎么样的角色？对于蒋卫锁之死，公权力是否意识到打假英雄的危险，并提供了安全保护？是谁打死了他？幕后操作者是谁？当地公权力有责任吗？社会不能为讲真话的人提供保护，那么公权力到底在保护谁？这一切都是我要等待的答案。对于孙咸泽之流的升迁，公权力是否意识到让这些人担任国家食药监总局药品安全总监具有多么大的危害性！如果在韩国，他应该下跪，在日本，他应该切腹，在朝鲜，他会被炮决！</p><p>我也相信，很多人和我一样，也在等待这个答案！因为大家都渴望生活在真相之中，哪怕真相是无比肮脏，无比丑陋，无比冷酷……只要是打假英雄，只要是揭黑人士，我们整个社会都有责任保护他们，而且政府首当其冲，因为这些人代表着这个社会良知，是我们这个社会正能量的化身。他们的被迫害，甚至被谋害，这是对正义公然的挑衅！这是对良知野蛮的强暴！</p><p>纵观我大中华连牛奶问题都解决不了，连儿童的疫苗安全问题都解决不了，祖国的儿童喝奶靠进口，打着毒疫苗，还叫嚣着把日本灭了，在此我表示很担忧！纵观我大中华连英雄都没有去保护好，坏人纷纷升迁，让他们流泪又流血，还叫嚣着中华民族复兴，我表示非常担忧！</p><p>疫苗事件，在我周围的同事和朋友都不敢乱讨论，因为怕……　我不知道是否大家都在装哑巴？没装哑巴的人都会被失踪吗？？我不知道，也许下一个失踪的人是…………<br></p><p><br></p>\r\n<hr>\r\n以上全部为转载，与本网站无关！！转载出处新浪：<a href=\"http://blog.sina.com.cn/s/blog_13f88c2ed0102yq5w.html\" target=\"_blank\">http://blog.sina.com.cn/s/blog_13f88c2ed0102yq5w.html</a>'
  ),
(
    18,
    '                                                                <p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">到现在为止，我们的象棋游戏能支持玩家与云库引擎正常地交替下棋了！但现在的游戏没有细致的规则限制，玩家可以不按照中国象棋的规则行棋。本节我们需要限制用户的行棋动作，遵循象棋游戏的通用规则。</p><h2 id=\"\" style=\"font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" color:=\"\" rgb(32,=\"\" 35,=\"\" 38);=\"\" margin:=\"\" 1.6em=\"\" 0px;=\"\" font-size:=\"\" 20px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">本节概要</h2><ul style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\"><li style=\"outline: 0px !important;\">中国象棋游戏规范介绍</li><li style=\"outline: 0px !important;\">实现可行着法枚举工具类</li><li style=\"outline: 0px !important;\">实现着法合法性检查工具类</li><li style=\"outline: 0px !important;\">应用着法合法性检查</li></ul><h2 id=\"-1\" style=\"font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" color:=\"\" rgb(32,=\"\" 35,=\"\" 38);=\"\" margin:=\"\" 1.6em=\"\" 0px;=\"\" font-size:=\"\" 20px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">中国象棋游戏规范</h2><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\"><a href=\"https://gitbook.cn/gitchat/column/5e9d67352b34772795873df4/topic/docs/%E4%B8%AD%E5%9B%BD%E8%B1%A1%E6%A3%8B%E6%B8%B8%E6%88%8F%E8%A7%84%E8%8C%83\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(79, 161, 219); transition: background-color 0.15s ease-in-out 0s, color 0.15s ease-in-out 0s, border-color 0.15s ease-in-out 0s; outline: 0px !important;\">中国象棋游戏规范</a></p><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">知道大家都不爱看文档，所以我简单地把行棋的规则和一般的输赢判断规则列举一下。</p><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">着法合法性检查规则：</p><ul style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\"><li style=\"outline: 0px !important;\">车走直线、马踩日，炮打翻山、象飞田，兵卒过河左右走，仕象不离老将边；</li><li style=\"outline: 0px !important;\">行棋着法不能吃已方棋子；</li><li style=\"outline: 0px !important;\">车只能在一条线上走子，直到遇到第一个障碍棋子，如果棋子是敌方的，可以吃掉它；</li><li style=\"outline: 0px !important;\">马走一个日字，但有「蹩腿」的行动限制；</li><li style=\"outline: 0px !important;\">象走一个田字，不能过河界，且有被「填心」的行动限制；</li><li style=\"outline: 0px !important;\">炮可以在一条直线上走子，直至遇到第一个障碍棋子，如果越过障碍棋子后在直线上遇到的第一个棋子是敌方棋子，可以吃掉它；</li><li style=\"outline: 0px !important;\">兵卒在冲过对方的河界之前，只能一次向前行走一步，过了敌方河界以后，可以向前方或左右方向行走一步；</li><li style=\"outline: 0px !important;\">一步着法过后，不能造成双方的老将对面，即两方老将都在同一列，且中间无格挡棋子；</li></ul><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">胜负检查判定方法：</p><ul style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\"><li style=\"outline: 0px !important;\">如果无论已方走什么可行着法都无法解除对方下一步对已方老将的攻击，则表示已方已经输了；</li><li style=\"outline: 0px !important;\">如果对方行棋后，已方无合法的着法可走，则表示已方已经输了；</li><li style=\"outline: 0px !important;\">如果一方在进棋过程中反复捉对方的将或大子，造成了三次以上的连续重复局面，则判长捉和长将方为负；</li><li style=\"outline: 0px !important;\">如果超过 60 个回合无吃子，则判和棋；</li></ul><h2 id=\"-2\" style=\"font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" color:=\"\" rgb(32,=\"\" 35,=\"\" 38);=\"\" margin:=\"\" 1.6em=\"\" 0px;=\"\" font-size:=\"\" 20px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">准备工作</h2><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">为了实现中国象棋游戏的规则检查，我们有些准备工作要先做一下：</p><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">第一件事，我们要增强一下 dart 的基本算法方法集，建立一个自己的 math-ex 工具集。我们在 lib/common 文件夹下新建一个 math-ext.dart 文件，实现两个方法：</p><pre style=\"font-family: \" source=\"\" code=\"\" pro\",=\"\" monospace;=\"\" font-size:=\"\" 0.9em;=\"\" padding:=\"\" 10px=\"\" 20px;=\"\" margin-bottom:=\"\" 1.1em;=\"\" line-height:=\"\" 1.45;=\"\" word-break:=\"\" break-word;=\"\" background-color:=\"\" rgba(128,=\"\" 128,=\"\" 0.05);=\"\" border-width:=\"\" 0px;=\"\" border-style:=\"\" initial;=\"\" border-color:=\"\" border-radius:=\"\" 5px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\"><code class=\"dart language-dart\" style=\"font-family: \" source=\"\" code=\"\" pro\",=\"\" monospace;=\"\" white-space:=\"\" pre;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">abs(value) => value > 0 ? value : -value;\r\n\r\n// 二分查找，没有找到 dart 的标准库的实现，就自己实现一个了\r\nint binarySearch(List<int> array, int start, int end, int key) {\r\n  //\r\n  if (start > end) return -1;\r\n\r\n  if (array[start] == key) return start;\r\n  if (array[end] == key) return end;\r\n\r\n  final middle = start + (end - start) ~/ 2;\r\n  if (array[middle] == key) return middle;\r\n\r\n  if (key < array[middle]) {\r\n    return binarySearch(array, start + 1, middle - 1, key);\r\n  }\r\n\r\n  return binarySearch(array, middle + 1, end - 1, key);\r\n}\r\n</int></code></pre><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">第二件事，在进行着法检查的过程中，我们时常要假定这步棋已经走出，再看局面是否是合法的，例如会不会千万老将会面，会不会千万自己的老将可能被对方直接攻击。这些尝试操作需要改动棋子的位置布署，所以我们希望在一个 clone 的临时棋盘上进行这种验证操作。</p><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">在 Phase 类中，我们添加一个名叫 clone 的构造方法，它可以基于现有 Phase 对象克隆一个相同的临时 Phase 对象：</p><pre style=\"font-family: \" source=\"\" code=\"\" pro\",=\"\" monospace;=\"\" font-size:=\"\" 0.9em;=\"\" padding:=\"\" 10px=\"\" 20px;=\"\" margin-bottom:=\"\" 1.1em;=\"\" line-height:=\"\" 1.45;=\"\" word-break:=\"\" break-word;=\"\" background-color:=\"\" rgba(128,=\"\" 128,=\"\" 0.05);=\"\" border-width:=\"\" 0px;=\"\" border-style:=\"\" initial;=\"\" border-color:=\"\" border-radius:=\"\" 5px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\"><code class=\"dart language-dart\" style=\"font-family: \" source=\"\" code=\"\" pro\",=\"\" monospace;=\"\" white-space:=\"\" pre;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">// 克隆一个一模一样的 phase 对象，修改其内容时不影响原来的 Phase 对象\r\nPhase.clone(Phase other) {\r\n  //\r\n  _pieces = List<string>();\r\n\r\n  other._pieces.forEach((piece) => _pieces.add(piece));\r\n\r\n  _side = other._side;\r\n\r\n  halfMove = other.halfMove;\r\n  fullMove = other.fullMove;\r\n}\r\n</string></code></pre><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">此外，我们还需要给 Phase 类添加一个 testMove 的方法，规则检查时会做假设性行棋，然后判断局面是否会有老将对面等 Case，直接改动棋子分布数组而不用关心招法的合法性：</p><blockquote style=\"padding-top: 15px; padding-bottom: 15px; margin-bottom: 1.1em; font-size: 17px; border: none; background: rgb(250, 250, 252); border-radius: 4px; color: rgb(32, 35, 38); font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\"><p style=\"font-size: 1em; line-height: 1.45; outline: 0px !important;\">这件事不能直接调用 Phase 的 move 方法，move 方法中会进行着法合法性检查，如果假设性行棋调用合法性检测，这就陷入了逻辑循环。</p></blockquote><pre style=\"font-family: \" source=\"\" code=\"\" pro\",=\"\" monospace;=\"\" font-size:=\"\" 0.9em;=\"\" padding:=\"\" 10px=\"\" 20px;=\"\" margin-bottom:=\"\" 1.1em;=\"\" line-height:=\"\" 1.45;=\"\" word-break:=\"\" break-word;=\"\" background-color:=\"\" rgba(128,=\"\" 128,=\"\" 0.05);=\"\" border-width:=\"\" 0px;=\"\" border-style:=\"\" initial;=\"\" border-color:=\"\" border-radius:=\"\" 5px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\"><code class=\"dart language-dart\" style=\"font-family: \" source=\"\" code=\"\" pro\",=\"\" monospace;=\"\" white-space:=\"\" pre;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">  // 在判断行棋合法性等环节，要在克隆的棋盘上进行行棋假设，然后检查效果\r\n  // 这种情况下不验证、不记录、不翻译\r\n  void moveTest(Move move, {turnSide = false}) {\r\n    // 修改棋盘\r\n    _pieces[move.to] = _pieces[move.from];\r\n    _pieces[move.from] = Piece.Empty;\r\n\r\n    // 交换走棋方\r\n    if (turnSide) _side = Side.oppo(_side);\r\n  }\r\n</code></pre><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">准备工作完成了，我们来检查玩家的着法合法性！</p><h2 id=\"-3\" style=\"font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" color:=\"\" rgb(32,=\"\" 35,=\"\" 38);=\"\" margin:=\"\" 1.6em=\"\" 0px;=\"\" font-size:=\"\" 20px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">着法合法性检查</h2><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">深呼吸一轮，我们要开始飘过一片逻辑海洋！</p><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">我们在 lib/cchess 文件夹下新建 steps-enum.dart，这个类里面放置着法枚举工具类 StepsEnumerator 的实现：</p><pre style=\"font-family: \" source=\"\" code=\"\" pro\",=\"\" monospace;=\"\" font-size:=\"\" 0.9em;=\"\" padding:=\"\" 10px=\"\" 20px;=\"\" margin-bottom:=\"\" 1.1em;=\"\" line-height:=\"\" 1.45;=\"\" word-break:=\"\" break-word;=\"\" background-color:=\"\" rgba(128,=\"\" 128,=\"\" 0.05);=\"\" border-width:=\"\" 0px;=\"\" border-style:=\"\" initial;=\"\" border-color:=\"\" border-radius:=\"\" 5px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\"><code class=\"dart language-dart\" style=\"font-family: \" source=\"\" code=\"\" pro\",=\"\" monospace;=\"\" white-space:=\"\" pre;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">import \'../common/math.ext.dart\';\r\nimport \'cc-base.dart\';\r\nimport \'phase.dart\';\r\n\r\n// 枚举当前局面下所有合符象棋规则的着法\r\nclass StepsEnumerator {\r\n  //\r\n  static List<move> enumSteps(Phase phase) {\r\n    //\r\n    final steps = <move>[];\r\n\r\n    for (var row = 0; row < 10; row++) {\r\n      //\r\n      for (var col = 0; col < 9; col++) {\r\n        //\r\n        final from = row * 9 + col;\r\n        final piece = phase.pieceAt(from);\r\n\r\n        if (Side.of(piece) != phase.side) continue;\r\n\r\n        var pieceSteps;\r\n\r\n        if (piece == Piece.RedKing || piece == Piece.BlackKing) { // 将的着法\r\n          pieceSteps = enumKingSteps(phase, row, col, from);\r\n        } else if (piece == Piece.RedAdvisor || piece == Piece.BlackAdvisor) { // 仕的着法\r\n          pieceSteps = enumAdvisorSteps(phase, row, col, from);\r\n        } else if (piece == Piece.RedBishop || piece == Piece.BlackBishop) { // 象的着法\r\n          pieceSteps = enumBishopSteps(phase, row, col, from);\r\n        } else if (piece == Piece.RedKnight || piece == Piece.BlackKnight) { // 马的着法\r\n          pieceSteps = enumKnightSteps(phase, row, col, from);\r\n        } else if (piece == Piece.RedRook || piece == Piece.BlackRook) { // 车的着法\r\n          pieceSteps = enumRookSteps(phase, row, col, from);\r\n        } else if (piece == Piece.RedCanon || piece == Piece.BlackCanon) { // 炮的着法\r\n          pieceSteps = enumCanonSteps(phase, row, col, from);\r\n        } else if (piece == Piece.RedPawn || piece == Piece.BlackPawn) { // 兵的着法\r\n          pieceSteps = enumPawnSteps(phase, row, col, from);\r\n        } else {\r\n          continue;\r\n        }\r\n\r\n        steps.addAll(pieceSteps);\r\n      }\r\n    }\r\n\r\n    return steps;\r\n  }\r\n\r\n  // 将的着法枚举\r\n  static List<move> enumKingSteps(\r\n    Phase phase, int row, int col, int from) {\r\n    //\r\n    final offsetList = [\r\n      [-1, 0],\r\n      [0, -1],\r\n      [1, 0],\r\n      [0, 1]\r\n    ];\r\n\r\n    final redRange = [66, 67, 68, 75, 76, 77, 84, 85, 86];\r\n    final blackRange = [3, 4, 5, 12, 13, 14, 21, 22, 23];\r\n    final range = (phase.side == Side.Red ? redRange : blackRange);\r\n\r\n    final steps = <move>[];\r\n\r\n    for (var i = 0; i < 4; i++) {\r\n      //\r\n      final offset = offsetList[i];\r\n      final to = (row + offset[0]) * 9 + col + offset[1];\r\n\r\n      if (!posOnBoard(to) || Side.of(phase.pieceAt(to)) == phase.side) {\r\n        continue;\r\n      }\r\n\r\n      if (binarySearch(range, 0, range.length - 1, to) > -1) {\r\n        steps.add(Move(from, to));\r\n      }\r\n    }\r\n\r\n    return steps;\r\n  }\r\n\r\n  // 士的着法枚举\r\n  static List<move> enumAdvisorSteps(\r\n    Phase phase, int row, int col, int from) {\r\n    //\r\n    final offsetList = [\r\n      [-1, -1],\r\n      [1, -1],\r\n      [-1, 1],\r\n      [1, 1]\r\n    ];\r\n\r\n    final redRange = [66, 68, 76, 84, 86];\r\n    final blackRange = [3, 5, 13, 21, 23];\r\n    final range = phase.side == Side.Red ? redRange : blackRange;\r\n\r\n    final steps = <move>[];\r\n\r\n    for (var i = 0; i < 4; i++) {\r\n      //\r\n      final offset = offsetList[i];\r\n      final to = (row + offset[0]) * 9 + col + offset[1];\r\n\r\n      if (!posOnBoard(to) || Side.of(phase.pieceAt(to)) == phase.side) {\r\n        continue;\r\n      }\r\n\r\n      if (binarySearch(range, 0, range.length - 1, to) > -1) {\r\n        steps.add(Move(from, to));\r\n      }\r\n    }\r\n\r\n    return steps;\r\n  }\r\n\r\n  // 象的着法枚举\r\n  static List<move> enumBishopSteps(\r\n    Phase phase, int row, int col, int from) {\r\n    //\r\n    final heartOffsetList = [\r\n      [-1, -1],\r\n      [1, -1],\r\n      [-1, 1],\r\n      [1, 1]\r\n    ];\r\n\r\n    final offsetList = [\r\n      [-2, -2],\r\n      [2, -2],\r\n      [-2, 2],\r\n      [2, 2]\r\n    ];\r\n\r\n    final redRange = [47, 51, 63, 67, 71, 83, 87];\r\n    final blackRange = [2, 6, 18, 22, 26, 38, 42];\r\n    final range = phase.side == Side.Red ? redRange : blackRange;\r\n\r\n    final steps = <move>[];\r\n\r\n    for (var i = 0; i < 4; i++) {\r\n      //\r\n      final heartOffset = heartOffsetList[i];\r\n      final heart = (row + heartOffset[0]) * 9 + (col + heartOffset[1]);\r\n\r\n      if (!posOnBoard(heart) || phase.pieceAt(heart) != Piece.Empty) {\r\n        continue;\r\n      }\r\n\r\n      final offset = offsetList[i];\r\n      final to = (row + offset[0]) * 9 + (col + offset[1]);\r\n\r\n      if (!posOnBoard(to) || Side.of(phase.pieceAt(to)) == phase.side) {\r\n        continue;\r\n      }\r\n\r\n      if (binarySearch(range, 0, range.length - 1, to) > -1) {\r\n        steps.add(Move(from, to));\r\n      }\r\n    }\r\n\r\n    return steps;\r\n  }\r\n\r\n  // 马的着法枚举\r\n  static List<move> enumKnightSteps(\r\n    Phase phase, int row, int col, int from) {\r\n    //\r\n    final offsetList = [\r\n      [-2, -1],\r\n      [-1, -2],\r\n      [1, -2],\r\n      [2, -1],\r\n      [2, 1],\r\n      [1, 2],\r\n      [-1, 2],\r\n      [-2, 1]\r\n    ];\r\n    final footOffsetList = [\r\n      [-1, 0],\r\n      [0, -1],\r\n      [0, -1],\r\n      [1, 0],\r\n      [1, 0],\r\n      [0, 1],\r\n      [0, 1],\r\n      [-1, 0]\r\n    ];\r\n\r\n    final steps = <move>[];\r\n\r\n    for (var i = 0; i < 8; i++) {\r\n      //\r\n      final offset = offsetList[i];\r\n      final nr = row + offset[0], nc = col + offset[1];\r\n\r\n      if (nr < 0 || nr > 9 || nc < 0 || nc > 9) continue;\r\n\r\n      final to = nr * 9 + nc;\r\n      if (!posOnBoard(to) || Side.of(phase.pieceAt(to)) == phase.side) {\r\n        continue;\r\n      }\r\n\r\n      final footOffset = footOffsetList[i];\r\n      final fr = row + footOffset[0], fc = col + footOffset[1];\r\n      final foot = fr * 9 + fc;\r\n\r\n      if (!posOnBoard(foot) || phase.pieceAt(foot) != Piece.Empty) {\r\n        continue;\r\n      }\r\n\r\n      steps.add(Move(from, to));\r\n    }\r\n\r\n    return steps;\r\n  }\r\n\r\n  // 车的着法枚举\r\n  static List<move> enumRookSteps(\r\n    Phase phase, int row, int col, int from) {\r\n    //\r\n    final steps = <move>[];\r\n\r\n    // to left\r\n    for (var c = col - 1; c >= 0; c--) {\r\n      final to = row * 9 + c;\r\n      final target = phase.pieceAt(to);\r\n\r\n      if (target == Piece.Empty) {\r\n        steps.add(Move(from, to));\r\n      } else {\r\n        if (Side.of(target) != phase.side) {\r\n          steps.add(Move(from, to));\r\n        }\r\n        break;\r\n      }\r\n    }\r\n\r\n    // to top\r\n    for (var r = row - 1; r >= 0; r--) {\r\n      final to = r * 9 + col;\r\n      final target = phase.pieceAt(to);\r\n\r\n      if (target == Piece.Empty) {\r\n        steps.add(Move(from, to));\r\n      } else {\r\n        if (Side.of(target) != phase.side) {\r\n          steps.add(Move(from, to));\r\n        }\r\n        break;\r\n      }\r\n    }\r\n\r\n    // to right\r\n    for (var c = col + 1; c < 9; c++) {\r\n      final to = row * 9 + c;\r\n      final target = phase.pieceAt(to);\r\n\r\n      if (target == Piece.Empty) {\r\n        steps.add(Move(from, to));\r\n      } else {\r\n        if (Side.of(target) != phase.side) {\r\n          steps.add(Move(from, to));\r\n        }\r\n        break;\r\n      }\r\n    }\r\n\r\n    // to down\r\n    for (var r = row + 1; r < 10; r++) {\r\n      final to = r * 9 + col;\r\n      final target = phase.pieceAt(to);\r\n\r\n      if (target == Piece.Empty) {\r\n        steps.add(Move(from, to));\r\n      } else {\r\n        if (Side.of(target) != phase.side) {\r\n          steps.add(Move(from, to));\r\n        }\r\n        break;\r\n      }\r\n    }\r\n\r\n    return steps;\r\n  }\r\n\r\n  // 炮的着法枚举\r\n  static List<move> enumCanonSteps(\r\n    Phase phase, int row, int col, int from) {\r\n    //\r\n    final steps = <move>[];\r\n    // to left\r\n    var overPiece = false;\r\n\r\n    for (var c = col - 1; c >= 0; c--) {\r\n      final to = row * 9 + c;\r\n      final target = phase.pieceAt(to);\r\n\r\n      if (!overPiece) {\r\n        if (target == Piece.Empty) {\r\n          steps.add(Move(from, to));\r\n        } else {\r\n          overPiece = true;\r\n        }\r\n      } else {\r\n        if (target != Piece.Empty) {\r\n          if (Side.of(target) != phase.side) {\r\n            steps.add(Move(from, to));\r\n          }\r\n          break;\r\n        }\r\n      }\r\n    }\r\n\r\n    // to top\r\n    overPiece = false;\r\n\r\n    for (var r = row - 1; r >= 0; r--) {\r\n      final to = r * 9 + col;\r\n      final target = phase.pieceAt(to);\r\n\r\n      if (!overPiece) {\r\n        if (target == Piece.Empty) {\r\n          steps.add(Move(from, to));\r\n        } else {\r\n          overPiece = true;\r\n        }\r\n      } else {\r\n        if (target != Piece.Empty) {\r\n          if (Side.of(target) != phase.side) {\r\n            steps.add(Move(from, to));\r\n          }\r\n          break;\r\n        }\r\n      }\r\n    }\r\n\r\n    // to right\r\n    overPiece = false;\r\n\r\n    for (var c = col + 1; c < 9; c++) {\r\n      final to = row * 9 + c;\r\n      final target = phase.pieceAt(to);\r\n\r\n      if (!overPiece) {\r\n        if (target == Piece.Empty) {\r\n          steps.add(Move(from, to));\r\n        } else {\r\n          overPiece = true;\r\n        }\r\n      } else {\r\n        if (target != Piece.Empty) {\r\n          if (Side.of(target) != phase.side) {\r\n            steps.add(Move(from, to));\r\n          }\r\n          break;\r\n        }\r\n      }\r\n    }\r\n\r\n    // to bottom\r\n    overPiece = false;\r\n\r\n    for (var r = row + 1; r < 10; r++) {\r\n      final to = r * 9 + col;\r\n      final target = phase.pieceAt(to);\r\n\r\n      if (!overPiece) {\r\n        if (target == Piece.Empty) {\r\n          steps.add(Move(from, to));\r\n        } else {\r\n          overPiece = true;\r\n        }\r\n      } else {\r\n        if (target != Piece.Empty) {\r\n          if (Side.of(target) != phase.side) {\r\n            steps.add(Move(from, to));\r\n          }\r\n          break;\r\n        }\r\n      }\r\n    }\r\n\r\n    return steps;\r\n  }\r\n\r\n  // 兵的着法枚举\r\n  static List<move> enumPawnSteps(\r\n    Phase phase, int row, int col, int from) {\r\n    //\r\n    var to = (row + (phase.side == Side.Red ? -1 : 1)) * 9 + col;\r\n\r\n    final steps = <move>[];\r\n\r\n    if (posOnBoard(to) && Side.of(phase.pieceAt(to)) != phase.side) {\r\n      steps.add(Move(from, to));\r\n    }\r\n\r\n    if ((phase.side == Side.Red && row < 5) || (phase.side == Side.Black && row > 4)) {\r\n      //\r\n      if (col > 0) {\r\n        to = row * 9 + col - 1;\r\n        if (posOnBoard(to) && Side.of(phase.pieceAt(to)) != phase.side) {\r\n          steps.add(Move(from, to));\r\n        }\r\n      }\r\n\r\n      if (col < 8) {\r\n        to = row * 9 + col + 1;\r\n        if (posOnBoard(to) && Side.of(phase.pieceAt(to)) != phase.side) {\r\n          steps.add(Move(from, to));\r\n        }\r\n      }\r\n    }\r\n\r\n    return steps;\r\n  }\r\n\r\n  static posOnBoard(int pos) => pos > -1 && pos < 90;\r\n}\r\n</move></move></move></move></move></move></move></move></move></move></move></move></move></move></move></move></code></pre><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">这是一个很长的工具，应用它可以列举当前局面下，行棋方可能走的全部着法，但不包含避免老将对面、避免行棋后对方可以直接攻击已方老将等逻辑。</p><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">接着，我们在 lib/cchess 文件夹下新建 steps-validate.dart 文件，将在这个工具类中放置某一着法是否合法的检查逻辑：</p><pre style=\"font-family: \" source=\"\" code=\"\" pro\",=\"\" monospace;=\"\" font-size:=\"\" 0.9em;=\"\" padding:=\"\" 10px=\"\" 20px;=\"\" margin-bottom:=\"\" 1.1em;=\"\" line-height:=\"\" 1.45;=\"\" word-break:=\"\" break-word;=\"\" background-color:=\"\" rgba(128,=\"\" 128,=\"\" 0.05);=\"\" border-width:=\"\" 0px;=\"\" border-style:=\"\" initial;=\"\" border-color:=\"\" border-radius:=\"\" 5px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\"><code class=\"dart language-dart\" style=\"font-family: \" source=\"\" code=\"\" pro\",=\"\" monospace;=\"\" white-space:=\"\" pre;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">import \'../common/math.ext.dart\';\r\nimport \'cc-base.dart\';\r\nimport \'cc-rules.dart\';\r\nimport \'phase.dart\';\r\n\r\n// 着法合法性验证\r\nclass StepValidate {\r\n  //\r\n  static bool validate(Phase phase, Move move) {\r\n    //\r\n    if (Side.of(phase.pieceAt(move.to)) == phase.side) return false;\r\n\r\n    final piece = phase.pieceAt(move.from);\r\n\r\n    var valid = false;\r\n\r\n    if (piece == Piece.RedKing || piece == Piece.BlackKing) { // 将\r\n      valid = validateKingStep(phase, move);\r\n    } else if (piece == Piece.RedAdvisor || piece == Piece.BlackAdvisor) { // 仕\r\n      valid = validateAdvisorStep(phase, move);\r\n    } else if (piece == Piece.RedBishop || piece == Piece.BlackBishop) { // 象\r\n      valid = validateBishopStep(phase, move);\r\n    } else if (piece == Piece.RedKnight || piece == Piece.BlackKnight) { // 马\r\n      valid = validateKnightStep(phase, move);\r\n    } else if (piece == Piece.RedRook || piece == Piece.BlackRook) { // 车\r\n      valid = validateRookStep(phase, move);\r\n    } else if (piece == Piece.RedCanon || piece == Piece.BlackCanon) { // 炮\r\n      valid = validateCanonStep(phase, move);\r\n    } else if (piece == Piece.RedPawn || piece == Piece.BlackPawn) { // 兵\r\n      valid = validatePawnStep(phase, move);\r\n    }\r\n\r\n    if (!valid) return false;\r\n\r\n    if (ChessRules.willBeChecked(phase, move)) return false;\r\n\r\n    if (ChessRules.willKingsMeeting(phase, move)) return false;\r\n\r\n    return true;\r\n  }\r\n\r\n  static bool validateKingStep(Phase phase, Move move) {\r\n    //\r\n    final adx = abs(move.tx - move.fx), ady = abs(move.ty - move.fy);\r\n\r\n    final isUpDownMove = (adx == 0 && ady == 1);\r\n    final isLeftRightMove = (adx == 1 && ady == 0);\r\n\r\n    if (!isUpDownMove && !isLeftRightMove) return false;\r\n\r\n    final redRange = [66, 67, 68, 75, 76, 77, 84, 85, 86];\r\n    final blackRange = [3, 4, 5, 12, 13, 14, 21, 22, 23];\r\n    final range = (phase.side == Side.Red) ? redRange : blackRange;\r\n\r\n    return binarySearch(range, 0, range.length - 1, move.to) >= 0;\r\n  }\r\n\r\n  static bool validateAdvisorStep(Phase phase, Move move) {\r\n    //\r\n    final adx = abs(move.tx - move.fx), ady = abs(move.ty - move.fy);\r\n\r\n    if (adx != 1 || ady != 1) return false;\r\n\r\n    final redRange = [66, 68, 76, 84, 86], blackRange = [3, 5, 13, 21, 23];\r\n    final range = (phase.side == Side.Red) ? redRange : blackRange;\r\n\r\n    return binarySearch(range, 0, range.length - 1, move.to) >= 0;\r\n  }\r\n\r\n  static bool validateBishopStep(Phase phase, Move move) {\r\n    //\r\n    final adx = abs(move.tx - move.fx), ady = abs(move.ty - move.fy);\r\n\r\n    if (adx != 2 || ady != 2) return false;\r\n\r\n    final redRange = [47, 51, 63, 67, 71, 83, 87], blackRange = [2, 6, 18, 22, 26, 38, 42];\r\n    final range = (phase.side == Side.Red) ? redRange : blackRange;\r\n\r\n    if (binarySearch(range, 0, range.length - 1, move.to) < 0) return false;\r\n\r\n    if (move.tx > move.fx) {\r\n      if (move.ty > move.fy) {\r\n        final heart = (move.fy + 1) * 9 + move.fx + 1;\r\n        if (phase.pieceAt(heart) != Piece.Empty) return false;\r\n      } else {\r\n        final heart = (move.fy - 1) * 9 + move.fx + 1;\r\n        if (phase.pieceAt(heart) != Piece.Empty) return false;\r\n      }\r\n    } else {\r\n      if (move.ty > move.fy) {\r\n        final heart = (move.fy + 1) * 9 + move.fx - 1;\r\n        if (phase.pieceAt(heart) != Piece.Empty) return false;\r\n      } else {\r\n        final heart = (move.fy - 1) * 9 + move.fx - 1;\r\n        if (phase.pieceAt(heart) != Piece.Empty) return false;\r\n      }\r\n    }\r\n\r\n    return true;\r\n  }\r\n\r\n  static bool validateKnightStep(Phase phase, Move move) {\r\n    //\r\n    final dx = move.tx - move.fx, dy = move.ty - move.fy;\r\n    final adx = abs(dx), ady = abs(dy);\r\n\r\n    if (!(adx == 1 && ady == 2) && !(adx == 2 && ady == 1)) return false;\r\n\r\n    if (adx > ady) {\r\n      if (dx > 0) {\r\n        final foot = move.fy * 9 + move.fx + 1;\r\n        if (phase.pieceAt(foot) != Piece.Empty) return false;\r\n      } else {\r\n        final foot = move.fy * 9 + move.fx - 1;\r\n        if (phase.pieceAt(foot) != Piece.Empty) return false;\r\n      }\r\n    } else {\r\n      if (dy > 0) {\r\n        final foot = (move.fy + 1) * 9 + move.fx;\r\n        if (phase.pieceAt(foot) != Piece.Empty) return false;\r\n      } else {\r\n        final foot = (move.fy - 1) * 9 + move.fx;\r\n        if (phase.pieceAt(foot) != Piece.Empty) return false;\r\n      }\r\n    }\r\n\r\n    return true;\r\n  }\r\n\r\n  static bool validateRookStep(Phase phase, Move move) {\r\n    //\r\n    final dx = move.tx - move.fx, dy = move.ty - move.fy;\r\n\r\n    if (dx != 0 && dy != 0) return false;\r\n\r\n    if (dy == 0) {\r\n      if (dx < 0) {\r\n        for (int i = move.fx - 1; i > move.tx; i--) {\r\n          if (phase.pieceAt(move.fy * 9 + i) != Piece.Empty) return false;\r\n        }\r\n      } else {\r\n        for (int i = move.fx + 1; i < move.tx; i++) {\r\n          if (phase.pieceAt(move.fy * 9 + i) != Piece.Empty) return false;\r\n        }\r\n      }\r\n    } else {\r\n      if (dy < 0) {\r\n        for (int i = move.fy - 1; i > move.ty; i--) {\r\n          if (phase.pieceAt(i * 9 + move.fx) != Piece.Empty) return false;\r\n        }\r\n      } else {\r\n        for (int i = move.fy + 1; i < move.ty; i++) {\r\n          if (phase.pieceAt(i * 9 + move.fx) != Piece.Empty) return false;\r\n        }\r\n      }\r\n    }\r\n\r\n    return true;\r\n  }\r\n\r\n  static bool validateCanonStep(Phase phase, Move move) {\r\n    //\r\n    final dx = move.tx - move.fx, dy = move.ty - move.fy;\r\n\r\n    if (dx != 0 && dy != 0) return false;\r\n\r\n    if (dy == 0) {\r\n      //\r\n      if (dx < 0) {\r\n        //\r\n        var overPiece = false;\r\n\r\n        for (int i = move.fx - 1; i > move.tx; i--) {\r\n          //\r\n          if (phase.pieceAt(move.fy * 9 + i) != Piece.Empty) {\r\n            //\r\n            if (overPiece) return false;\r\n\r\n            if (phase.pieceAt(move.to) == Piece.Empty) return false;\r\n            overPiece = true;\r\n          }\r\n        }\r\n\r\n        if (!overPiece && phase.pieceAt(move.to) != Piece.Empty) return false;\r\n        //\r\n      } else {\r\n        //\r\n        var overPiece = false;\r\n\r\n        for (int i = move.fx + 1; i < move.tx; i++) {\r\n          //\r\n          if (phase.pieceAt(move.fy * 9 + i) != Piece.Empty) {\r\n            //\r\n            if (overPiece) return false;\r\n\r\n            if (phase.pieceAt(move.to) == Piece.Empty) return false;\r\n            overPiece = true;\r\n          }\r\n        }\r\n\r\n        if (!overPiece && phase.pieceAt(move.to) != Piece.Empty) return false;\r\n      }\r\n    } else {\r\n      //\r\n      if (dy < 0) {\r\n        //\r\n        var overPiece = false;\r\n\r\n        for (int i = move.fy - 1; i > move.ty; i--) {\r\n          //\r\n          if (phase.pieceAt(i * 9 + move.fx) != Piece.Empty) {\r\n            //\r\n            if (overPiece) return false;\r\n\r\n            if (phase.pieceAt(move.to) == Piece.Empty) return false;\r\n            overPiece = true;\r\n          }\r\n        }\r\n\r\n        if (!overPiece && phase.pieceAt(move.to) != Piece.Empty) return false;\r\n        //\r\n      } else {\r\n        //\r\n        var overPiece = false;\r\n\r\n        for (int i = move.fy + 1; i < move.ty; i++) {\r\n          //\r\n          if (phase.pieceAt(i * 9 + move.fx) != Piece.Empty) {\r\n            //\r\n            if (overPiece) return false;\r\n\r\n            if (phase.pieceAt(move.to) == Piece.Empty) return false;\r\n            overPiece = true;\r\n          }\r\n        }\r\n\r\n        if (!overPiece && phase.pieceAt(move.to) != Piece.Empty) return false;\r\n      }\r\n    }\r\n\r\n    return true;\r\n  }\r\n\r\n  static bool validatePawnStep(Phase phase, Move move) {\r\n    //\r\n    final dy = move.ty - move.fy;\r\n    final adx = abs(move.tx - move.fx), ady = abs(move.ty - move.fy);\r\n\r\n    if (adx > 1 || ady > 1 || (adx + ady) > 1) return false;\r\n\r\n    if (phase.side == Side.Red) {\r\n      //\r\n      if (move.fy > 4 && adx != 0) return false;\r\n      if (dy > 0) return false;\r\n      //\r\n    } else {\r\n      //\r\n      if (move.fy < 5 && adx != 0) return false;\r\n      if (dy < 0) return false;\r\n    }\r\n\r\n    return true;\r\n  }\r\n}\r\n</code></pre><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">这个工具类按不同棋子地行棋规则检查用户的着法是否合规，而且还包含避免老将对面、避免行棋后对方可以直接攻击已方老将等逻辑。</p><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">接下来，我们在 lib/cchess 文件夹下新建 cc-rules.dart 文件，在其中提供当前是否有将军，是否已经被杀死等逻辑检查：</p><pre style=\"font-family: \" source=\"\" code=\"\" pro\",=\"\" monospace;=\"\" font-size:=\"\" 0.9em;=\"\" padding:=\"\" 10px=\"\" 20px;=\"\" margin-bottom:=\"\" 1.1em;=\"\" line-height:=\"\" 1.45;=\"\" word-break:=\"\" break-word;=\"\" background-color:=\"\" rgba(128,=\"\" 128,=\"\" 0.05);=\"\" border-width:=\"\" 0px;=\"\" border-style:=\"\" initial;=\"\" border-color:=\"\" border-radius:=\"\" 5px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\"><code class=\"dart language-dart\" style=\"font-family: \" source=\"\" code=\"\" pro\",=\"\" monospace;=\"\" white-space:=\"\" pre;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">import \'cc-base.dart\';\r\nimport \'phase.dart\';\r\nimport \'step-enum.dart\';\r\nimport \'steps-validate.dart\';\r\n\r\nclass ChessRules {\r\n  // 是否被对方将军\r\n  static checked(Phase phase) {\r\n    //\r\n    final myKingPos = findKingPos(phase);\r\n\r\n    final oppoPhase = Phase.clone(phase);\r\n    oppoPhase.trunSide();\r\n\r\n    final oppoSteps = StepsEnumerator.enumSteps(oppoPhase);\r\n\r\n    for (var step in oppoSteps) {\r\n      if (step.to == myKingPos) return true;\r\n    }\r\n\r\n    return false;\r\n  }\r\n\r\n  // 应用指定着法后，是否被将军\r\n  static willBeChecked(Phase phase, Move move) {\r\n    //\r\n    final tempPhase = Phase.clone(phase);\r\n    tempPhase.moveTest(move);\r\n\r\n    return checked(tempPhase);\r\n  }\r\n\r\n  // 应用指定着法后，是否会造成老将对面\r\n  static willKingsMeeting(Phase phase, Move move) {\r\n    //\r\n    final tempPhase = Phase.clone(phase);\r\n    tempPhase.moveTest(move);\r\n\r\n    for (var col = 3; col < 6; col++) {\r\n      //\r\n      var foundKingAlready = false;\r\n\r\n      for (var row = 0; row < 10; row++) {\r\n        //\r\n        final piece = tempPhase.pieceAt(row * 9 + col);\r\n\r\n        if (!foundKingAlready) {\r\n          if (piece == Piece.RedKing || piece == Piece.BlackKing) foundKingAlready = true;\r\n          if (row > 2) break;\r\n        } else {\r\n          if (piece == Piece.RedKing || piece == Piece.BlackKing) return true;\r\n          if (piece != Piece.Empty) break;\r\n        }\r\n      }\r\n    }\r\n\r\n    return false;\r\n  }\r\n\r\n  // 是否已经被对方杀死\r\n  static bool beKilled(Phase phase) {\r\n    //\r\n    List<move> steps = StepsEnumerator.enumSteps(phase);\r\n\r\n    for (var step in steps) {\r\n      if (StepValidate.validate(phase, step)) return false;\r\n    }\r\n\r\n    return true;\r\n  }\r\n\r\n  // 寻找已方的老将位置\r\n  static int findKingPos(Phase phase) {\r\n    //\r\n    for (var i = 0; i < 90; i++) {\r\n      //\r\n      final piece = phase.pieceAt(i);\r\n\r\n      if (piece == Piece.RedKing || piece == Piece.BlackKing) {\r\n        if (phase.side == Side.of(piece)) return i;\r\n      }\r\n    }\r\n\r\n    return -1;\r\n  }\r\n}\r\n</move></code></pre><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">好大的几片代码，让人有点窒息！好在逻辑还算清晰、且与 Flutter 本身没啥关系。</p><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">艰巨的规则逻辑实现的差不多了，我们看看如果在玩家走棋的过程中应用这些着法检查。</p><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">我们回到 Phase 类，之前已经预留了着法合法性检查的 validateMove 方法定义，现在来实现它：</p><pre style=\"font-family: \" source=\"\" code=\"\" pro\",=\"\" monospace;=\"\" font-size:=\"\" 0.9em;=\"\" padding:=\"\" 10px=\"\" 20px;=\"\" margin-bottom:=\"\" 1.1em;=\"\" line-height:=\"\" 1.45;=\"\" word-break:=\"\" break-word;=\"\" background-color:=\"\" rgba(128,=\"\" 128,=\"\" 0.05);=\"\" border-width:=\"\" 0px;=\"\" border-style:=\"\" initial;=\"\" border-color:=\"\" border-radius:=\"\" 5px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\"><code class=\"dart language-dart\" style=\"font-family: \" source=\"\" code=\"\" pro\",=\"\" monospace;=\"\" white-space:=\"\" pre;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">// 验证移动棋子的着法是否合法\r\nbool validateMove(int from, int to) {\r\n  // 移动的棋子的选手，应该是当前方\r\n  if (Side.of(_pieces[from]) != _side) return false;\r\n  return (StepValidate.validate(this, Move(from, to)));\r\n}\r\n</code></pre><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">看看，一两句代码的事！当复杂的问题被透彻解决了之后，剩下的事件总是这样！</p><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">运行产品试试，现在不合棋规的走法，都是不被接受的了！</p><h2 id=\"-4\" style=\"font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" color:=\"\" rgb(32,=\"\" 35,=\"\" 38);=\"\" margin:=\"\" 1.6em=\"\" 0px;=\"\" font-size:=\"\" 20px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">本节回顾</h2><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">本小节中，我们先是像大家介绍了中国象棋游戏的规范知识，如有需要详细地学习中国象棋游戏规范，可以参考我们提供的<a href=\"https://gitbook.cn/gitchat/column/5e9d67352b34772795873df4/topic/docs/%E4%B8%AD%E5%9B%BD%E8%B1%A1%E6%A3%8B%E6%B8%B8%E6%88%8F%E8%A7%84%E8%8C%83\" style=\"background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: rgb(79, 161, 219); transition: background-color 0.15s ease-in-out 0s, color 0.15s ease-in-out 0s, border-color 0.15s ease-in-out 0s; outline: 0px !important;\">详细文档-中国象棋游戏规范</a>；</p><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">接着，我们依据中国象棋游戏规范实现了着法枚举工具类，列表玩家当着可以走的所有着法。</p><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">然后，我们根据游戏规范文档来验证某种着法是不是在合法的范围内。例如「马蹩腿」、「象填心」规则的检查。此外，行棋后必须避免老将对面、必须避免自己的老将被对方的棋子直接威胁。</p><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">最后，我们在 Phase 类中使用着法合法性检查工具类对玩家的棋子移动进行了限制。</p><p style=\"margin-bottom: 1.1em;  font-family: -apple-system, BlinkMacSystemFont, Roboto, \" segoe=\"\" ui\",=\"\" \"helvetica=\"\" neue\",=\"\" \"microsoft=\"\" yahei\",=\"\" sans-serif;=\"\" font-size:=\"\" 17px;=\"\" outline:=\"\" 0px=\"\" !important;\"=\"\">象棋软件中的开发中，「着法枚举」和「着法合法性检查」都是重要的基础工作，这两部分的可靠实现，是象棋游戏能正常运行的基石。这部分代码其实可以很容易地从 Dart 语言转换成其它语言，真心希望棋软开发者能把它有效利用起来！</p>                                                        '
  ),
(
    19,
    '<p><img src=\"http://xdiary.up/static/uploads/1593503239_dc077be9bec263291792.jpg\" data-filename=\"img\" style=\"width: 800px;\"><br></p>'
  ),
(
    20,
    '                                                                                                                                                                <p><img src=\"http://xdiary.up/static/uploads/1593503251_3859c13b9d7407630730.jpg\" data-filename=\"img\" style=\"width: 887px;\"></p><p>ddddddddddddd--------dddddddd</p><p><img src=\"http://xdiary.up/static/uploads/1593504633_8b7887cace15b92ff13e.jpg\" data-filename=\"img\" style=\"width: 800px;\"><br></p>                                                                                                                                            '
  ),
(
    21,
    '<p>dddddasdfa<img src=\"http://xdiary.up/static/uploads/1593510875_186617479739cc6b9355.jpg\" data-filename=\"img\" style=\"width: 670px;\"></p>'
  );

/*!40000 ALTER TABLE `article_content` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `column`
--
DROP TABLE IF EXISTS `column`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `column` (
  `id` tinyint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `subhead` varchar(50) NOT NULL COMMENT '副标题',
  `surface_plot` varchar(255) DEFAULT NULL COMMENT '封面图',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `excerpt` text DEFAULT NULL COMMENT '简介',
  `price` decimal(15, 2) DEFAULT 0.00 COMMENT '价格',
  `visit` int(11) NOT NULL DEFAULT 0 COMMENT '阅读次数',
  `collect` int(11) NOT NULL DEFAULT 0 COMMENT '收藏次数',
  `amount` int(11) DEFAULT NULL COMMENT '专栏文章数',
  `complete` int(11) NOT NULL DEFAULT 0 COMMENT '已发布文章数',
  `seo_title` varchar(255) DEFAULT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) DEFAULT NULL COMMENT 'SEO关键词',
  `seo_description` varchar(255) DEFAULT NULL COMMENT 'SEO描述',
  `create_id` tinyint(20) DEFAULT NULL COMMENT '文章发表用户ID',
  `create` bigint(20) DEFAULT NULL COMMENT '创建时间( Unix 时间戳)',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '文章专栏表';

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `column`
--
LOCK TABLES `column` WRITE;

/*!40000 ALTER TABLE `column` DISABLE KEYS */
;

/*!40000 ALTER TABLE `column` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `menus`
--
DROP TABLE IF EXISTS `menus`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `menus` (
  `id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_by` tinyint(2) unsigned NOT NULL COMMENT '排序',
  `class` varchar(20) NOT NULL COMMENT '类',
  `method` varchar(30) NOT NULL COMMENT '方法',
  `name` varchar(20) NOT NULL COMMENT '菜单名字',
  `level` tinyint(2) unsigned DEFAULT 0 COMMENT '菜单层级',
  `parent` tinyint(10) unsigned DEFAULT 0 COMMENT '父级',
  `icon` varchar(50) DEFAULT NULL COMMENT 'ICON',
  `department` varchar(20) DEFAULT NULL COMMENT '所属顶级',
  `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示：默认1显示，0不显示',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8 COMMENT = '后台菜单表';

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `menus`
--
LOCK TABLES `menus` WRITE;

/*!40000 ALTER TABLE `menus` DISABLE KEYS */
;

INSERT INTO
  `menus`
VALUES
  (1, 1, 'love', 'index', '后台首页', 1, 0, 'fa-desktop', '1', 1),
(2, 8, '', '', '系统设置', 1, 0, 'fa-cogs', '请选择', 1),
(3, 1, 'menus', 'index', '菜单管理', 2, 2, 'fa-folder', '2', 1),
(4, 4, 'record', 'index', '操作日志', 2, 2, NULL, '2', 1),
(5, 3, 'roles', 'index', '角色管理', 2, 2, 'fa-key', '2', 1),
(6, 2, 'admins', 'index', '后台用户', 2, 2, 'ssssss', '2', 1),
(7, 2, 'nav', 'index', '导航菜单', 1, 0, 'fa-fire', '请选择', 1),
(8, 2, '', '', '文章管理', 1, 0, 'fa-leanpub', '请选择', 1),
(
    9,
    1,
    'example',
    'index',
    '示例数据',
    1,
    0,
    'fa-fire',
    '请选择',
    0
  ),
(
    10,
    1,
    'articleCategory',
    'index',
    '文章分类',
    2,
    8,
    '',
    '8',
    1
  ),
(11, 3, 'article', 'index', '文章列表', 2, 8, '', '8', 1),
(12, 2, 'column', 'index', '文章专栏', 0, 8, NULL, '8', 1);

/*!40000 ALTER TABLE `menus` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `record`
--
DROP TABLE IF EXISTS `record`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `record` (
  `id` int(100) unsigned NOT NULL AUTO_INCREMENT,
  `table_id` int(10) unsigned NOT NULL COMMENT '操作表ID',
  `table_name` varchar(180) NOT NULL COMMENT '操作表名',
  `user_id` int(10) unsigned NOT NULL COMMENT '操作用户ID',
  `username` varchar(16) NOT NULL COMMENT '操作用户名',
  `action` varchar(180) NOT NULL COMMENT '操作动作',
  `ip` varchar(39) NOT NULL COMMENT '操作IP',
  `record_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 61 DEFAULT CHARSET = utf8 COMMENT = '操作记录表';

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `record`
--
LOCK TABLES `record` WRITE;

/*!40000 ALTER TABLE `record` DISABLE KEYS */
;

INSERT INTO
  `record`
VALUES
  (
    1,
    9,
    'menus',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    2,
    9,
    'menus',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    3,
    9,
    'menus',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    4,
    8,
    'menus',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    5,
    10,
    'menus',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    6,
    11,
    'menus',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    7,
    10,
    'menus',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    8,
    10,
    'menus',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    9,
    1,
    'articleCategory',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    10,
    2,
    'articleCategory',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    11,
    2,
    'articleCategory',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    12,
    2,
    'articleCategory',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    13,
    2,
    'articleCategory',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    14,
    2,
    'articleCategory',
    1,
    'fortune',
    'expurgate',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    15,
    1,
    'articleCategory',
    1,
    'fortune',
    'delete',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    16,
    3,
    'articleCategory',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    17,
    4,
    'articleCategory',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    18,
    3,
    'articleCategory',
    1,
    'fortune',
    'expurgate',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    19,
    5,
    'articleCategory',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    20,
    17,
    'article',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    21,
    17,
    'article',
    1,
    'fortune',
    'expurgate',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    22,
    18,
    'article',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    23,
    19,
    'article',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    24,
    20,
    'article',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    25,
    21,
    'article',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    26,
    22,
    'article',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    27,
    23,
    'article',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    28,
    24,
    'article',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    29,
    25,
    'article',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    30,
    26,
    'article',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    31,
    27,
    'article',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    32,
    28,
    'article',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    33,
    29,
    'article',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    34,
    30,
    'article',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    35,
    31,
    'article',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    36,
    32,
    'article',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    37,
    33,
    'article',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    38,
    34,
    'article',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    39,
    35,
    'article',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    40,
    35,
    'article',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    41,
    35,
    'article',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    42,
    34,
    'article',
    1,
    'fortune',
    'delete',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    43,
    33,
    'article',
    1,
    'fortune',
    'delete',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    44,
    32,
    'article',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    45,
    35,
    'article',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    46,
    35,
    'article',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    47,
    1,
    'article',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    48,
    1,
    'article',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    49,
    1,
    'article',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    50,
    6,
    'article',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    51,
    35,
    'article',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    52,
    35,
    'article',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    53,
    29,
    'article',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    54,
    21,
    'article',
    1,
    'fortune',
    'expurgate',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    55,
    6,
    'articleCategory',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    56,
    5,
    'articleCategory',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    57,
    32,
    'article',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    58,
    18,
    'article',
    1,
    'fortune',
    'expurgate',
    '127.0.0.1',
    '0000-00-00 00:00:00'
  ),
(
    59,
    12,
    'menus',
    1,
    'fortune',
    'create',
    '127.0.0.1',
    '2020-03-07 14:39:32'
  ),
(
    60,
    11,
    'menus',
    1,
    'fortune',
    'edit',
    '127.0.0.1',
    '2020-03-07 14:40:01'
  );

/*!40000 ALTER TABLE `record` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `rights`
--
DROP TABLE IF EXISTS `rights`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `rights` (
  `right_id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `right_name` varchar(50) DEFAULT NULL,
  `right_class` varchar(30) DEFAULT NULL,
  `right_method` varchar(30) DEFAULT NULL,
  `right_detail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`right_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 28 DEFAULT CHARSET = utf8 COMMENT = '权限表';

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `rights`
--
LOCK TABLES `rights` WRITE;

/*!40000 ALTER TABLE `rights` DISABLE KEYS */
;

INSERT INTO
  `rights`
VALUES
  (1, NULL, 'love', 'index', NULL),
(2, NULL, 'menus', 'index', NULL),
(3, NULL, 'menus', 'create', NULL),
(4, NULL, 'menus', 'edit', NULL),
(5, NULL, 'admins', 'index', NULL),
(6, NULL, 'admins', 'edit', NULL),
(7, NULL, 'roles', 'index', NULL),
(8, NULL, 'admins', 'create', NULL),
(9, NULL, 'roles', 'edit', NULL),
(10, NULL, 'roles', 'create', NULL),
(11, NULL, 'record', 'index', NULL),
(12, NULL, 'article', 'index', NULL),
(13, NULL, 'article', 'test', NULL),
(14, NULL, 'article', 'edit', NULL),
(15, NULL, 'article', 'create', NULL),
(16, NULL, 'nav', 'index', NULL),
(17, NULL, 'order', 'index', NULL),
(18, NULL, 'articlecategory', 'create', NULL),
(19, NULL, 'articlecategory', 'index', NULL),
(20, NULL, 'articlecategory', 'edit', NULL),
(21, NULL, 'articlecategory', 'expurgate', NULL),
(22, NULL, 'articlecategory', 'delete', NULL),
(23, NULL, 'article', 'expurgate', NULL),
(24, NULL, 'upload', 'summernote', NULL),
(25, NULL, 'article', 'delete', NULL),
(26, NULL, 'column', 'index', NULL),
(27, NULL, 'column', 'create', NULL);

/*!40000 ALTER TABLE `rights` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `roles`
--
DROP TABLE IF EXISTS `roles`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `rights` varchar(255) DEFAULT NULL,
  `default` varchar(50) DEFAULT NULL COMMENT '默认登录页',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE = MyISAM AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8 COMMENT = '管理角色组表';

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `roles`
--
LOCK TABLES `roles` WRITE;

/*!40000 ALTER TABLE `roles` DISABLE KEYS */
;

INSERT INTO
  `roles`
VALUES
  (1, 'root=>超级管理员', '', '');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */
;

UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */
;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */
;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */
;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */
;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */
;

-- Dump completed on 2020-07-05 13:45:01