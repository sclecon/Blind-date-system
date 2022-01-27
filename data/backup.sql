-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jan 27, 2022 at 07:22 AM
-- Server version: 8.0.27
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blind`
--

-- --------------------------------------------------------

--
-- Table structure for table `ea_event`
--

CREATE TABLE `ea_event` (
                            `event_id` bigint UNSIGNED NOT NULL COMMENT '活动ID',
                            `subject` varchar(255) NOT NULL COMMENT '活动标题 {text}',
                            `remark` varchar(255) DEFAULT NULL COMMENT '活动简介 {textarea}',
                            `image` varchar(255) NOT NULL COMMENT '封面图 {image}',
                            `message` text NOT NULL COMMENT '活动详情 {editor}',
                            `flag` int NOT NULL DEFAULT '1' COMMENT '活动状态 {radio} (1:等待开始, 2:进行中, 3:已结束)',
                            `start_time` datetime DEFAULT NULL COMMENT '活动开始时间 {date}(date)',
                            `over_time` datetime DEFAULT NULL COMMENT '活动结束时间 {date}(date)',
                            `status` int NOT NULL DEFAULT '1' COMMENT '数据状态 {radio} (1:正常, 0:已删除)',
                            `create_time` int DEFAULT NULL COMMENT '创建时间',
                            `update_time` int DEFAULT NULL COMMENT '更新时间',
                            `delete_time` int DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='活动数据表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ea_event`
--

INSERT INTO `ea_event` (`event_id`, `subject`, `remark`, `image`, `message`, `flag`, `start_time`, `over_time`, `status`, `create_time`, `update_time`, `delete_time`) VALUES
    (1, 'Coco 成都 2020/7/1国际动漫节 ', 'Coco 成都 2020/7/1国际动漫节 的简单介绍', 'http://127.0.0.1:3332/upload/20220122/9609236875bed1e293421ec0d26dd6ba.jpg', '&lt;p&gt;Coco 成都 2020/7/1国际动漫节&amp;nbsp;Coco 成都 2020/7/1国际动漫节&amp;nbsp; editor&lt;/p&gt;\n', 1, '2022-01-24 00:00:00', '2022-01-31 00:00:00', 1, 1642862746, 1642862746, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_event_join`
--

CREATE TABLE `ea_event_join` (
                                 `join_id` bigint UNSIGNED NOT NULL COMMENT '数据ID',
                                 `event_id` bigint UNSIGNED NOT NULL COMMENT '活动ID',
                                 `user_id` bigint UNSIGNED NOT NULL COMMENT '用户UID',
                                 `status` int NOT NULL DEFAULT '1' COMMENT '数据状态',
                                 `create_time` int DEFAULT NULL COMMENT '创建时间',
                                 `update_time` int DEFAULT NULL COMMENT '更新时间',
                                 `delete_time` int DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='活动参与表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ea_event_join`
--

INSERT INTO `ea_event_join` (`join_id`, `event_id`, `user_id`, `status`, `create_time`, `update_time`, `delete_time`) VALUES
    (2, 1, 4, 1, 1643182112, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_feedback`
--

CREATE TABLE `ea_feedback` (
                               `feedback_id` bigint UNSIGNED NOT NULL COMMENT '数据ID',
                               `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                               `phone` varchar(16) NOT NULL COMMENT '手机号 {text}',
                               `message` varchar(255) NOT NULL COMMENT '反馈内容 {textarea}',
                               `status` int NOT NULL DEFAULT '1' COMMENT '数据状态',
                               `create_time` int DEFAULT NULL COMMENT '创建时间',
                               `update_time` int DEFAULT NULL COMMENT '更新时间',
                               `delete_time` int DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='意见反馈表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ea_feedback`
--

INSERT INTO `ea_feedback` (`feedback_id`, `user_id`, `phone`, `message`, `status`, `create_time`, `update_time`, `delete_time`) VALUES
                                                                                                                                    (1, '4', '18583761997', '反馈内容', 1, 1642867245, NULL, NULL),
                                                                                                                                    (2, '4', '18583761997', '2.23的反馈内容', 1, 1642901685, NULL, NULL),
                                                                                                                                    (3, '4', '18583761997', '2.23的反馈内容2', 1, 1642902287, NULL, NULL),
                                                                                                                                    (4, '4', '18583761997', '2.23的反馈内容2', 1, 1643182462, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_mall_cate`
--

CREATE TABLE `ea_mall_cate` (
                                `id` bigint UNSIGNED NOT NULL,
                                `title` varchar(20) NOT NULL COMMENT '分类名',
                                `image` varchar(500) DEFAULT NULL COMMENT '分类图片',
                                `sort` int DEFAULT '0' COMMENT '排序',
                                `status` tinyint UNSIGNED DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
                                `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
                                `create_time` int DEFAULT NULL COMMENT '创建时间',
                                `update_time` int DEFAULT NULL COMMENT '更新时间',
                                `delete_time` int DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='商品分类' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ea_mall_cate`
--

INSERT INTO `ea_mall_cate` (`id`, `title`, `image`, `sort`, `status`, `remark`, `create_time`, `update_time`, `delete_time`) VALUES
    (9, '手机', 'http://admin.host/upload/20200514/98fc09b0c4ad4d793a6f04bef79a0edc.jpg', 0, 1, '', 1589440437, 1589440437, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_mall_goods`
--

CREATE TABLE `ea_mall_goods` (
                                 `id` bigint UNSIGNED NOT NULL,
                                 `cate_id` int DEFAULT NULL COMMENT '分类ID',
                                 `title` varchar(20) NOT NULL COMMENT '商品名称',
                                 `logo` varchar(500) DEFAULT NULL COMMENT '商品logo',
                                 `images` text COMMENT '商品图片 以 | 做分割符号',
                                 `describe` text COMMENT '商品描述',
                                 `market_price` decimal(10,2) DEFAULT '0.00' COMMENT '市场价',
                                 `discount_price` decimal(10,2) DEFAULT '0.00' COMMENT '折扣价',
                                 `sales` int DEFAULT '0' COMMENT '销量',
                                 `virtual_sales` int DEFAULT '0' COMMENT '虚拟销量',
                                 `stock` int DEFAULT '0' COMMENT '库存',
                                 `total_stock` int DEFAULT '0' COMMENT '总库存',
                                 `sort` int DEFAULT '0' COMMENT '排序',
                                 `status` tinyint UNSIGNED DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
                                 `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
                                 `create_time` int DEFAULT NULL COMMENT '创建时间',
                                 `update_time` int DEFAULT NULL COMMENT '更新时间',
                                 `delete_time` int DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='商品列表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ea_mall_goods`
--

INSERT INTO `ea_mall_goods` (`id`, `cate_id`, `title`, `logo`, `images`, `describe`, `market_price`, `discount_price`, `sales`, `virtual_sales`, `stock`, `total_stock`, `sort`, `status`, `remark`, `create_time`, `update_time`, `delete_time`) VALUES
                                                                                                                                                                                                                                                      (8, 10, '落地-风扇', 'http://admin.host/upload/20200514/a0f7fe9637abd219f7e93ceb2820df9b.jpg', 'http://admin.host/upload/20200514/95496713918290f6315ea3f87efa6bf2.jpg|http://admin.host/upload/20200514/ae29fa9cba4fc02defb7daed41cb2b13.jpg|http://admin.host/upload/20200514/f0a104d88ec7dc6fb42d2f87cbc71b76.jpg|http://admin.host/upload/20200514/3b88be4b1934690e5c1bd6b54b9ab5c8.jpg', '<p>76654757</p>\n\n<p><img alt=\"\" src=\"http://admin.host/upload/20200515/198070421110fa01f2c2ac2f52481647.jpg\" style=\"height:689px; width:790px\" /></p>\n\n<p><img alt=\"\" src=\"http://admin.host/upload/20200515/a07a742c15a78781e79f8a3317006c1d.jpg\" style=\"height:877px; width:790px\" /></p>\n', '599.00', '368.00', 0, 594, 0, 0, 675, 1, '', 1589454309, 1589567016, NULL),
                                                                                                                                                                                                                                                      (9, 9, '电脑', 'http://admin.host/upload/20200514/bbf858d469dec2e12a89460110068d3d.jpg', 'http://admin.host/upload/20200514/f0a104d88ec7dc6fb42d2f87cbc71b76.jpg', '<p>477</p>\n', '0.00', '0.00', 0, 0, 115, 320, 0, 1, '', 1589465215, 1589476345, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_news`
--

CREATE TABLE `ea_news` (
                           `news_id` bigint UNSIGNED NOT NULL COMMENT '新闻ID',
                           `subject` varchar(255) NOT NULL COMMENT '新闻标题 {text}',
                           `message` text NOT NULL COMMENT '新闻内容 {editor}',
                           `status` int NOT NULL DEFAULT '1' COMMENT '新闻状态',
                           `create_time` int DEFAULT NULL COMMENT '创建时间',
                           `update_time` int DEFAULT NULL COMMENT '更新时间',
                           `delete_time` int DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='广告新闻表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ea_news`
--

INSERT INTO `ea_news` (`news_id`, `subject`, `message`, `status`, `create_time`, `update_time`, `delete_time`) VALUES
    (1, '新闻标题', '新闻内容', 1, 1616937346, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_send_code`
--

CREATE TABLE `ea_send_code` (
                                `send_id` bigint UNSIGNED NOT NULL COMMENT '数据ID',
                                `phone` varchar(16) NOT NULL COMMENT '手机号 {text}',
                                `code` int NOT NULL COMMENT '验证码 {text}',
                                `status` int NOT NULL DEFAULT '0' COMMENT '数据状态 {radio} (1:验证完成, 0:等待验证)',
                                `create_time` int DEFAULT NULL COMMENT '创建时间',
                                `update_time` int DEFAULT NULL COMMENT '更新时间',
                                `delete_time` int DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='短信发送记录表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ea_send_code`
--

INSERT INTO `ea_send_code` (`send_id`, `phone`, `code`, `status`, `create_time`, `update_time`, `delete_time`) VALUES
                                                                                                                   (2, '18583761997', 813229, 0, NULL, NULL, NULL),
                                                                                                                   (3, '18583761997', 740921, 0, NULL, NULL, NULL),
                                                                                                                   (4, '18583761997', 354433, 1, 1642824693, 1642825224, NULL),
                                                                                                                   (5, '18583761997', 966979, 1, 1642859080, 1642859392, NULL),
                                                                                                                   (6, '18583761997', 274563, 0, 1643181229, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_system_admin`
--

CREATE TABLE `ea_system_admin` (
                                   `id` bigint UNSIGNED NOT NULL,
                                   `auth_ids` varchar(255) DEFAULT NULL COMMENT '角色权限ID',
                                   `head_img` varchar(255) DEFAULT NULL COMMENT '头像',
                                   `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
                                   `password` char(40) NOT NULL DEFAULT '' COMMENT '用户登录密码',
                                   `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
                                   `remark` varchar(255) DEFAULT '' COMMENT '备注说明',
                                   `login_num` bigint UNSIGNED DEFAULT '0' COMMENT '登录次数',
                                   `sort` int DEFAULT '0' COMMENT '排序',
                                   `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用,)',
                                   `create_time` int DEFAULT NULL COMMENT '创建时间',
                                   `update_time` int DEFAULT NULL COMMENT '更新时间',
                                   `delete_time` int DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='系统用户表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ea_system_admin`
--

INSERT INTO `ea_system_admin` (`id`, `auth_ids`, `head_img`, `username`, `password`, `phone`, `remark`, `login_num`, `sort`, `status`, `create_time`, `update_time`, `delete_time`) VALUES
    (1, NULL, '/static/admin/images/head.jpg', 'admin', 'a33b679d5581a8692988ec9f92ad2d6a2259eaa7', NULL, '', 10, 0, 1, 1642130832, 1643180202, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_system_auth`
--

CREATE TABLE `ea_system_auth` (
                                  `id` bigint UNSIGNED NOT NULL,
                                  `title` varchar(20) NOT NULL COMMENT '权限名称',
                                  `sort` int DEFAULT '0' COMMENT '排序',
                                  `status` tinyint UNSIGNED DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
                                  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
                                  `create_time` int DEFAULT NULL COMMENT '创建时间',
                                  `update_time` int DEFAULT NULL COMMENT '更新时间',
                                  `delete_time` int DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='系统权限表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ea_system_auth`
--

INSERT INTO `ea_system_auth` (`id`, `title`, `sort`, `status`, `remark`, `create_time`, `update_time`, `delete_time`) VALUES
                                                                                                                          (1, '管理员', 1, 1, '测试管理员', 1588921753, 1589614331, NULL),
                                                                                                                          (6, '游客权限', 0, 1, '', 1588227513, 1589591751, 1589591751);

-- --------------------------------------------------------

--
-- Table structure for table `ea_system_auth_node`
--

CREATE TABLE `ea_system_auth_node` (
                                       `id` bigint UNSIGNED NOT NULL,
                                       `auth_id` bigint UNSIGNED DEFAULT NULL COMMENT '角色ID',
                                       `node_id` bigint DEFAULT NULL COMMENT '节点ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='角色与节点关系表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ea_system_auth_node`
--

INSERT INTO `ea_system_auth_node` (`id`, `auth_id`, `node_id`) VALUES
                                                                   (1, 6, 1),
                                                                   (2, 6, 2),
                                                                   (3, 6, 9),
                                                                   (4, 6, 12),
                                                                   (5, 6, 18),
                                                                   (6, 6, 19),
                                                                   (7, 6, 21),
                                                                   (8, 6, 22),
                                                                   (9, 6, 29),
                                                                   (10, 6, 30),
                                                                   (11, 6, 38),
                                                                   (12, 6, 39),
                                                                   (13, 6, 45),
                                                                   (14, 6, 46),
                                                                   (15, 6, 52),
                                                                   (16, 6, 53);

-- --------------------------------------------------------

--
-- Table structure for table `ea_system_config`
--

CREATE TABLE `ea_system_config` (
                                    `id` int UNSIGNED NOT NULL,
                                    `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
                                    `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
                                    `value` text COMMENT '变量值',
                                    `remark` varchar(100) DEFAULT '' COMMENT '备注信息',
                                    `sort` int DEFAULT '0',
                                    `create_time` int DEFAULT NULL COMMENT '创建时间',
                                    `update_time` int DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='系统配置表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ea_system_config`
--

INSERT INTO `ea_system_config` (`id`, `name`, `group`, `value`, `remark`, `sort`, `create_time`, `update_time`) VALUES
                                                                                                                    (55, 'upload_type', 'upload', 'local', '当前上传方式 （local,alioss,qnoss,txoss）', 0, NULL, NULL),
                                                                                                                    (56, 'upload_allow_ext', 'upload', 'doc,gif,ico,icon,jpg,mp3,mp4,p12,pem,png,rar,jpeg', '允许上传的文件类型', 0, NULL, NULL),
                                                                                                                    (57, 'upload_allow_size', 'upload', '1024000', '允许上传的大小', 0, NULL, NULL),
                                                                                                                    (58, 'upload_allow_mime', 'upload', 'image/gif,image/jpeg,video/x-msvideo,text/plain,image/png', '允许上传的文件mime', 0, NULL, NULL),
                                                                                                                    (59, 'upload_allow_type', 'upload', 'local,alioss,qnoss,txcos', '可用的上传文件方式', 0, NULL, NULL),
                                                                                                                    (60, 'alioss_access_key_id', 'upload', '填你的', '阿里云oss公钥', 0, NULL, NULL),
                                                                                                                    (61, 'alioss_access_key_secret', 'upload', '填你的', '阿里云oss私钥', 0, NULL, NULL),
                                                                                                                    (62, 'alioss_endpoint', 'upload', '填你的', '阿里云oss数据中心', 0, NULL, NULL),
                                                                                                                    (63, 'alioss_bucket', 'upload', '填你的', '阿里云oss空间名称', 0, NULL, NULL),
                                                                                                                    (64, 'alioss_domain', 'upload', '填你的', '阿里云oss访问域名', 0, NULL, NULL),
                                                                                                                    (65, 'logo_title', 'site', 'Build', 'LOGO标题', 0, NULL, NULL),
                                                                                                                    (66, 'logo_image', 'site', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/2c412adf1b30c8be3a913e603c7b6e4a.jpg', 'logo图片', 0, NULL, NULL),
                                                                                                                    (68, 'site_name', 'site', '相亲交友小程序', '站点名称', 0, NULL, NULL),
                                                                                                                    (69, 'site_ico', 'site', '填你的', '浏览器图标', 0, NULL, NULL),
                                                                                                                    (70, 'site_copyright', 'site', 'null', '版权信息', 0, NULL, NULL),
                                                                                                                    (71, 'site_beian', 'site', 'null', '备案信息', 0, NULL, NULL),
                                                                                                                    (72, 'site_version', 'site', '1.0', '版本信息', 0, NULL, NULL),
                                                                                                                    (76, 'miniapp_appid', 'wechat', '填你的', '小程序公钥', 0, NULL, NULL),
                                                                                                                    (77, 'miniapp_appsecret', 'wechat', '填你的', '小程序私钥', 0, NULL, NULL),
                                                                                                                    (78, 'web_appid', 'wechat', '填你的', '公众号公钥', 0, NULL, NULL),
                                                                                                                    (79, 'web_appsecret', 'wechat', '填你的', '公众号私钥', 0, NULL, NULL),
                                                                                                                    (80, 'txcos_secret_id', 'upload', '填你的', '腾讯云cos密钥', 0, NULL, NULL),
                                                                                                                    (81, 'txcos_secret_key', 'upload', '填你的', '腾讯云cos私钥', 0, NULL, NULL),
                                                                                                                    (82, 'txcos_region', 'upload', '填你的', '存储桶地域', 0, NULL, NULL),
                                                                                                                    (83, 'tecos_bucket', 'upload', '填你的', '存储桶名称', 0, NULL, NULL),
                                                                                                                    (84, 'qnoss_access_key', 'upload', '填你的', '访问密钥', 0, NULL, NULL),
                                                                                                                    (85, 'qnoss_secret_key', 'upload', '填你的', '安全密钥', 0, NULL, NULL),
                                                                                                                    (86, 'qnoss_bucket', 'upload', '填你的', '存储空间', 0, NULL, NULL),
                                                                                                                    (87, 'qnoss_domain', 'upload', '填你的', '访问域名', 0, NULL, NULL),
                                                                                                                    (88, 'sms_aliyun_appid', 'sms_aliyun', 'LTAIwdFnCMoWTqio', '阿里大鱼APPID', 0, NULL, NULL),
                                                                                                                    (89, 'sms_aliyun_appsecret', 'sms_aliyun', 'yPF6QxyPZoiXYHiizt88u0W1vaM2a8', '阿里大鱼SECRET', 0, NULL, NULL),
                                                                                                                    (90, 'sms_aliyun_template', 'sms_aliyun', 'SMS_154950909', '短信模板ID', 0, NULL, NULL),
                                                                                                                    (91, 'sms_aliyun_sign', 'sms_aliyun', '阿里云短信测试', '应用签名', 0, NULL, NULL),
                                                                                                                    (92, 'pay_weixin_appid', 'pay', 'wx26e025fee547cd1b', '微信公众号的APPID', 0, NULL, NULL),
                                                                                                                    (93, 'pay_weixin_secret', 'pay', '009c9634a0d88581f599032cdecab0fe', '微信公众号的SECRET\r\n', 0, NULL, NULL),
                                                                                                                    (94, 'pay_weixin_mch_id', 'pay', '1434676802', '微信支付的商户ID', 0, NULL, NULL),
                                                                                                                    (95, 'pay_weixin_mch_key', 'pay', 'J6KgG5ghAApK03H2MS2bG2csj7Wy8UI1', '微信支付的商户KEY', 0, NULL, NULL),
                                                                                                                    (96, 'pay_total', 'pay', '0.1', '授权查看用户手机号需支付的费用', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_system_log_202201`
--

CREATE TABLE `ea_system_log_202201` (
                                        `id` int UNSIGNED NOT NULL COMMENT 'ID',
                                        `admin_id` int UNSIGNED DEFAULT '0' COMMENT '管理员ID',
                                        `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
                                        `method` varchar(50) NOT NULL COMMENT '请求方法',
                                        `title` varchar(100) DEFAULT '' COMMENT '日志标题',
                                        `content` text NOT NULL COMMENT '内容',
                                        `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
                                        `useragent` varchar(255) DEFAULT '' COMMENT 'User-Agent',
                                        `create_time` int DEFAULT NULL COMMENT '操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='后台操作日志表 - 202201' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ea_system_log_202201`
--

INSERT INTO `ea_system_log_202201` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES
                                                                                                                                 (630, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"dxkt\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642131362),
                                                                                                                                 (631, 1, '/admin/system.uploadfile/delete', 'post', '', '{\"id\":[\"302\",\"301\",\"300\",\"299\",\"298\",\"297\",\"291\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642131433),
                                                                                                                                 (632, 1, '/admin/system.menu/del', 'post', '', '{\"id\":[\"249\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642131486),
                                                                                                                                 (633, 1, '/admin/system.menu/del', 'post', '', '{\"id\":[\"250\",\"251\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642131495),
                                                                                                                                 (634, 1, '/admin/system.menu/delete?id=251', 'post', '', '{\"id\":\"251\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642131506),
                                                                                                                                 (635, 1, '/admin/system.menu/delete?id=251', 'post', '', '{\"id\":\"251\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642131518),
                                                                                                                                 (636, 1, '/admin/system.menu/delete?id=249', 'post', '', '{\"id\":\"249\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642131544),
                                                                                                                                 (637, 1, '/admin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642132785),
                                                                                                                                 (638, 1, '/admin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642132792),
                                                                                                                                 (639, 1, '/admin/system.node/refreshNode?force=1', 'post', '', '{\"force\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642132795),
                                                                                                                                 (640, 1, '/admin/system.node/clearNode', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642132804),
                                                                                                                                 (641, 1, '/admin/system.node/refreshNode?force=1', 'post', '', '{\"force\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642132813),
                                                                                                                                 (642, 1, '/admin/system.node/modify', 'post', '', '{\"id\":\"104\",\"field\":\"title\",\"value\":\"用户信息\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642132850),
                                                                                                                                 (643, 1, '/admin/system.node/modify', 'post', '', '{\"id\":\"97\",\"field\":\"title\",\"value\":\"新闻广告\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642132859),
                                                                                                                                 (644, 1, '/admin/system.node/modify', 'post', '', '{\"id\":\"69\",\"field\":\"title\",\"value\":\"会员支付\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642132872),
                                                                                                                                 (645, 1, '/admin/system.node/modify', 'post', '', '{\"id\":\"76\",\"field\":\"title\",\"value\":\"活动记录\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642132885),
                                                                                                                                 (646, 1, '/admin/system.menu/add', 'post', '', '{\"pid\":\"0\",\"title\":\"会员\",\"href\":\"\",\"icon\":\"fa fa-user\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642141737),
                                                                                                                                 (647, 1, '/admin/system.menu/add?id=254', 'post', '', '{\"id\":\"254\",\"pid\":\"254\",\"title\":\"会员列表\",\"href\":\"user\\/index\",\"icon\":\"fa fa-user-circle\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642141787),
                                                                                                                                 (648, 1, '/admin/system.menu/add', 'post', '', '{\"pid\":\"254\",\"title\":\"支付订单\",\"href\":\"user.pay\\/index\",\"icon\":\"fa fa-paypal\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642141825),
                                                                                                                                 (649, 1, '/admin/system.menu/add', 'post', '', '{\"pid\":\"0\",\"title\":\"新闻广告\",\"href\":\"\",\"icon\":\"fa fa-align-justify\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642141870),
                                                                                                                                 (650, 1, '/admin/system.menu/add?id=257', 'post', '', '{\"id\":\"257\",\"pid\":\"257\",\"title\":\"新闻广告\",\"href\":\"news\\/index\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642141882),
                                                                                                                                 (651, 1, '/admin/system.menu/add', 'post', '', '{\"pid\":\"0\",\"title\":\"线下活动\",\"href\":\"\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642141908),
                                                                                                                                 (652, 1, '/admin/system.menu/add?id=259', 'post', '', '{\"id\":\"259\",\"pid\":\"259\",\"title\":\"活动列表\",\"href\":\"event\\/index\",\"icon\":\"fa fa-connectdevelop\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642141935),
                                                                                                                                 (653, 1, '/admin/system.menu/add', 'post', '', '{\"pid\":\"0\",\"title\":\"意见反馈\",\"href\":\"\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642141955),
                                                                                                                                 (654, 1, '/admin/system.menu/add?id=261', 'post', '', '{\"id\":\"261\",\"pid\":\"261\",\"title\":\"反馈列表\",\"href\":\"feedback\\/index\",\"icon\":\"fa fa-align-center\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642141997),
                                                                                                                                 (655, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"***********\",\"keep_login\":\"0\"}', '172.22.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642391022),
                                                                                                                                 (656, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"ddhb\",\"keep_login\":\"0\"}', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642424216),
                                                                                                                                 (657, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"ajkd\",\"keep_login\":\"0\"}', '172.22.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642488457),
                                                                                                                                 (658, 1, '/admin/system.config/save', 'post', '', '{\"site_name\":\"Build\",\"site_ico\":\"填你的\",\"file\":\"\",\"site_version\":\"2.0.0\",\"site_beian\":\"填你的\",\"site_copyright\":\"填你的\"}', '172.22.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642488482),
                                                                                                                                 (659, 1, '/admin/system.config/save', 'post', '', '{\"logo_title\":\"Build\",\"logo_image\":\"\\/favicon.ico\",\"file\":\"\"}', '172.22.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642488506),
                                                                                                                                 (660, 1, '/admin/ajax/upload', 'post', '', '[]', '172.22.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642488565),
                                                                                                                                 (661, 1, '/admin/ajax/upload', 'post', '', '[]', '172.22.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642488583),
                                                                                                                                 (662, 1, '/admin/ajax/upload', 'post', '', '[]', '172.22.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642488602),
                                                                                                                                 (663, 1, '/admin/system.config/save', 'post', '', '{\"logo_title\":\"Build\",\"logo_image\":\"http:\\/\\/127.0.0.1:3332\\/upload\\/20220118\\/1c33f1b34962a6f908648b3868a3e1ae.png\",\"file\":\"\"}', '172.22.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642488637),
                                                                                                                                 (664, 1, '/admin/user/add', 'post', '', '{\"user_id\":\"0\",\"username\":\"张三丰\",\"phone\":\"***********\",\"avatar\":\"http:\\/\\/127.0.0.1:3332\\/upload\\/20220118\\/1c33f1b34962a6f908648b3868a3e1ae.png\",\"file\":\"\",\"remark\":\"个人介绍\",\"longitude\":\"104.05622442955018\",\"dimension\":\"30.63291510922048\",\"edu\":\"1\",\"sex\":\"1\",\"birthday\":\"\",\"height\":\"\",\"city\":\"\",\"address\":\"\",\"marriage\":\"1\",\"children\":\"0\",\"native\":\"\",\"nation\":\"\",\"blood\":\"5\",\"weight\":\"\",\"occupation\":\"\",\"school\":\"\",\"major\":\"\",\"status\":\"1\"}', '172.22.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642488804),
                                                                                                                                 (665, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"uhks\",\"keep_login\":\"0\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642774623),
                                                                                                                                 (666, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"prbs\",\"keep_login\":\"0\"}', '172.22.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642819594),
                                                                                                                                 (667, 1, '/admin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '172.22.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642819726),
                                                                                                                                 (668, 1, '/admin/system.menu/add?id=254', 'post', '', '{\"id\":\"254\",\"pid\":\"254\",\"title\":\"短信记录\",\"href\":\"send.code\\/index\",\"icon\":\"fa fa-phone-square\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '172.22.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642819764),
                                                                                                                                 (669, 1, '/admin/send.code/modify', 'post', '', '{\"id\":\"undefined\",\"field\":\"status\",\"value\":\"1\"}', '172.22.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642819786),
                                                                                                                                 (670, 1, '/admin/ajax/upload', 'post', '', '[]', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1642860179),
                                                                                                                                 (671, 1, '/admin/ajax/upload', 'post', '', '[]', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1642860187),
                                                                                                                                 (672, 1, '/admin/ajax/upload', 'post', '', '[]', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1642860194),
                                                                                                                                 (673, 1, '/admin/ajax/upload', 'post', '', '[]', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1642860213),
                                                                                                                                 (674, 1, '/admin/ajax/upload', 'post', '', '[]', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1642860263),
                                                                                                                                 (675, 1, '/admin/ajax/upload', 'post', '', '[]', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1642860279),
                                                                                                                                 (676, 1, '/admin/ajax/upload', 'post', '', '[]', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1642860658),
                                                                                                                                 (677, 1, '/admin/event/add', 'post', '', '{\"subject\":\"Coco 成都 2020\\/7\\/1国际动漫节 \",\"image\":\"http:\\/\\/127.0.0.1:3332\\/upload\\/20220122\\/5277b0d078c54864ac38a4e795076839.jpg\",\"file\":\"\",\"message\":\"&lt;p&gt;这是活动的详情信息&lt;\\/p&gt;\\n\",\"flag\":\"1\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1642860674),
                                                                                                                                 (678, 1, '/admin/event/add', 'post', '', '{\"subject\":\"Coco 成都 2020\\/7\\/1国际动漫节 \",\"image\":\"http:\\/\\/127.0.0.1:3332\\/upload\\/20220122\\/5277b0d078c54864ac38a4e795076839.jpg\",\"file\":\"\",\"message\":\"&lt;p&gt;这是活动的详情信息&lt;\\/p&gt;\\n\",\"flag\":\"1\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1642860678),
                                                                                                                                 (679, 1, '/admin/ajax/upload', 'post', '', '[]', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1642860717),
                                                                                                                                 (680, 1, '/admin/event/add', 'post', '', '{\"subject\":\"Coco 成都 2020\\/7\\/1国际动漫节 \",\"image\":\"http:\\/\\/127.0.0.1:3332\\/upload\\/20220122\\/9609236875bed1e293421ec0d26dd6ba.jpg\",\"file\":\"\",\"message\":\"&lt;p&gt;请求验证失败，请重新刷新页面！&lt;\\/p&gt;\\n\",\"flag\":\"1\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1642860722),
                                                                                                                                 (681, 1, '/admin/event/add', 'post', '', '{\"subject\":\"Coco 成都 2020\\/7\\/1国际动漫节 \",\"image\":\"http:\\/\\/127.0.0.1:3332\\/upload\\/20220122\\/9609236875bed1e293421ec0d26dd6ba.jpg\",\"file\":\"\",\"message\":\"&lt;p&gt;请求验证失败，请重新刷新页面！&lt;\\/p&gt;\\n\",\"flag\":\"1\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1642860726),
                                                                                                                                 (682, 1, '/admin/event/add', 'post', '', '{\"subject\":\"Coco 成都 2020\\/7\\/1国际动漫节 \",\"image\":\"http:\\/\\/127.0.0.1:3332\\/upload\\/20220122\\/9609236875bed1e293421ec0d26dd6ba.jpg\",\"file\":\"\",\"message\":\"&lt;p&gt;请求验证失败，请重新刷新页面！&lt;\\/p&gt;\\n\",\"flag\":\"1\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1642860874),
                                                                                                                                 (683, 1, '/admin/event/add', 'post', '', '{\"subject\":\"Coco 成都 2020\\/7\\/1国际动漫节 \",\"image\":\"http:\\/\\/127.0.0.1:3332\\/upload\\/20220122\\/9609236875bed1e293421ec0d26dd6ba.jpg\",\"file\":\"\",\"message\":\"&lt;p&gt;请求验证失败，请重新刷新页面！&lt;\\/p&gt;\\n\",\"flag\":\"1\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1642860897),
                                                                                                                                 (684, 1, '/admin/event/add', 'post', '', '{\"subject\":\"Coco 成都 2020\\/7\\/1国际动漫节 \",\"image\":\"http:\\/\\/127.0.0.1:3332\\/upload\\/20220122\\/9609236875bed1e293421ec0d26dd6ba.jpg\",\"file\":\"\",\"message\":\"&lt;p&gt;请求验证失败，请重新刷新页面！&lt;\\/p&gt;\\n\",\"flag\":\"1\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1642861172),
                                                                                                                                 (685, 1, '/admin/event/add', 'post', '', '{\"subject\":\"Coco 成都 2020\\/7\\/1国际动漫节 \",\"image\":\"http:\\/\\/127.0.0.1:3332\\/upload\\/20220122\\/9609236875bed1e293421ec0d26dd6ba.jpg\",\"file\":\"\",\"message\":\"&lt;p&gt;Coco 成都 2020\\/7\\/1国际动漫节&amp;nbsp;&lt;\\/p&gt;\\n\",\"flag\":\"1\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1642861200),
                                                                                                                                 (686, 1, '/admin/event/add', 'post', '', '{\"subject\":\"Coco 成都 2020\\/7\\/1国际动漫节 \",\"remark\":\"Coco 成都 2020\\/7\\/1国际动漫节 的简单介绍\",\"image\":\"http:\\/\\/127.0.0.1:3332\\/upload\\/20220122\\/9609236875bed1e293421ec0d26dd6ba.jpg\",\"file\":\"\",\"message\":\"&lt;p&gt;Coco 成都 2020\\/7\\/1国际动漫节&amp;nbsp;Coco 成都 2020\\/7\\/1国际动漫节&amp;nbsp; editor&lt;\\/p&gt;\\n\",\"flag\":\"1\",\"start_time\":\"2022-01-24\",\"over_time\":\"2022-01-31\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1642862746),
                                                                                                                                 (687, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"8mmw\",\"keep_login\":\"0\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1642863801),
                                                                                                                                 (688, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"bval\",\"keep_login\":\"0\"}', '172.22.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642919679),
                                                                                                                                 (689, 1, '/admin/send.code/delete?id=undefined', 'post', '', '{\"id\":\"undefined\"}', '172.22.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642919721),
                                                                                                                                 (690, 1, '/admin/ajax/upload', 'post', '', '[]', '172.22.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642919756),
                                                                                                                                 (691, 1, '/admin/user/edit?id=4', 'post', '', '{\"id\":\"4\",\"user_id\":\"4\",\"username\":\"18583761997\",\"phone\":\"***********\",\"avatar\":\"http:\\/\\/127.0.0.1:3332\\/upload\\/20220123\\/c37c27ce89ee27bce523b945d488b1f6.jpg|http:\\/\\/127.0.0.1:3332\\/upload\\/20220123\\/32d4364f3e3d0fbb9de6de7375325f89.jpg\",\"file\":\"\",\"remark\":\"\",\"longitude\":\"116.371335\",\"dimension\":\"39.938192\",\"sex\":\"1\",\"birthday\":\"\",\"height\":\"\",\"city\":\"\",\"address\":\"\",\"marriage\":\"1\",\"children\":\"0\",\"native\":\"\",\"nation\":\"\",\"blood\":\"5\",\"weight\":\"\",\"occupation\":\"\",\"school\":\"\",\"major\":\"\",\"status\":\"1\"}', '172.22.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642921159),
                                                                                                                                 (692, 1, '/admin/user/edit?id=4', 'post', '', '{\"id\":\"4\",\"user_id\":\"4\",\"username\":\"18583761997\",\"phone\":\"***********\",\"avatar\":\"http:\\/\\/127.0.0.1:3332\\/upload\\/20220123\\/c37c27ce89ee27bce523b945d488b1f6.jpg|http:\\/\\/127.0.0.1:3332\\/upload\\/20220123\\/32d4364f3e3d0fbb9de6de7375325f89.jpg\",\"file\":\"\",\"remark\":\"\",\"longitude\":\"116.371335\",\"dimension\":\"39.938192\",\"edu\":\"1\",\"sex\":\"1\",\"birthday\":\"\",\"height\":\"\",\"city\":\"\",\"address\":\"\",\"marriage\":\"1\",\"children\":\"0\",\"native\":\"\",\"nation\":\"\",\"blood\":\"5\",\"weight\":\"\",\"occupation\":\"\",\"school\":\"\",\"major\":\"\",\"house\":\"5\",\"car_buy\":\"2\",\"status\":\"1\"}', '172.22.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642921186),
                                                                                                                                 (693, 1, '/admin/user/edit?id=4', 'post', '', '{\"id\":\"4\",\"user_id\":\"4\",\"username\":\"18583761997\",\"phone\":\"***********\",\"avatar\":\"http:\\/\\/127.0.0.1:3332\\/upload\\/20220123\\/c37c27ce89ee27bce523b945d488b1f6.jpg|http:\\/\\/127.0.0.1:3332\\/upload\\/20220123\\/32d4364f3e3d0fbb9de6de7375325f89.jpg\",\"file\":\"\",\"remark\":\"\",\"longitude\":\"116.371335\",\"dimension\":\"39.938192\",\"sex\":\"1\",\"birthday\":\"\",\"height\":\"\",\"city\":\"\",\"address\":\"\",\"marriage\":\"1\",\"children\":\"0\",\"native\":\"\",\"nation\":\"\",\"blood\":\"5\",\"weight\":\"\",\"occupation\":\"\",\"school\":\"\",\"major\":\"\",\"status\":\"1\"}', '172.22.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642921216),
                                                                                                                                 (694, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"bddc\",\"keep_login\":\"0\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643099613),
                                                                                                                                 (695, 1, '/admin/system.config/save', 'post', '', '{\"site_name\":\"0.1\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643099771),
                                                                                                                                 (696, 1, '/admin/system.config/save', 'post', '', '{\"site_name\":\"订单金额\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643099798),
                                                                                                                                 (697, 1, '/admin/system.config/save', 'post', '', '{\"pay_weixin_appid\":\"1\",\"pay_weixin_secret\":\"微信SECRET\",\"pay_weixin_mch_id\":\"微信商户ID\",\"pay_weixin_mch_key\":\"微信商户KEY\",\"pay_total\":\"订单金额\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643099862),
                                                                                                                                 (698, 1, '/admin/system.config/save', 'post', '', '{\"pay_weixin_appid\":\"wx26e025fee547cd1b\",\"pay_weixin_secret\":\"009c9634a0d88581f599032cdecab0fe\",\"pay_weixin_mch_id\":\"1434676802\",\"pay_weixin_mch_key\":\"J6KgG5ghAApK03H2MS2bG2csj7Wy8UI1\",\"pay_total\":\"0.1\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643099888),
                                                                                                                                 (699, 1, '/admin/system.config/save', 'post', '', '{\"pay_weixin_appid\":\"wx26e025fee547cd1b\",\"pay_weixin_secret\":\"009c9634a0d88581f599032cdecab0fe\",\"pay_weixin_mch_id\":\"1434676802\",\"pay_weixin_mch_key\":\"J6KgG5ghAApK03H2MS2bG2csj7Wy8UI1\",\"pay_total\":\"0.2\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643099896),
                                                                                                                                 (700, 1, '/admin/system.config/save', 'post', '', '{\"pay_weixin_appid\":\"wx26e025fee547cd1b\",\"pay_weixin_secret\":\"009c9634a0d88581f599032cdecab0fe\",\"pay_weixin_mch_id\":\"1434676802\",\"pay_weixin_mch_key\":\"J6KgG5ghAApK03H2MS2bG2csj7Wy8UI1\",\"pay_total\":\"0.2\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643099898),
                                                                                                                                 (701, 1, '/admin/system.config/save', 'post', '', '{\"pay_weixin_appid\":\"wx26e025fee547cd1b\",\"pay_weixin_secret\":\"009c9634a0d88581f599032cdecab0fe\",\"pay_weixin_mch_id\":\"1434676802\",\"pay_weixin_mch_key\":\"J6KgG5ghAApK03H2MS2bG2csj7Wy8UI1\",\"pay_total\":\"0.2\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643099923),
                                                                                                                                 (702, NULL, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"***********\",\"captcha\":\"2aab\",\"keep_login\":\"1\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643180202),
                                                                                                                                 (703, 1, '/admin/user/edit?id=4', 'post', '', '{\"id\":\"4\",\"user_id\":\"4\",\"username\":\"sclecon\",\"phone\":\"***********\",\"avatar\":\"http:\\/\\/127.0.0.1:3332\\/upload\\/20220118\\/1c33f1b34962a6f908648b3868a3e1ae.png|http:\\/\\/127.0.0.1:3332\\/upload\\/20220118\\/1c33f1b34962a6f908648b3868a3e1ae.png\",\"file\":\"\",\"remark\":\"\",\"longitude\":\"116.371335\",\"dimension\":\"39.938192\",\"edu\":\"5\",\"sex\":\"1\",\"birthday\":\"2000-05-14\",\"height\":\"175\",\"city\":\"成都市\",\"address\":\"成都市\",\"income\":\"3\",\"marriage\":\"1\",\"children\":\"0\",\"native\":\"\",\"nation\":\"\",\"blood\":\"5\",\"weight\":\"\",\"occupation\":\"\",\"school\":\"\",\"major\":\"\",\"house\":\"5\",\"status\":\"1\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643180484),
                                                                                                                                 (704, 1, '/admin/user/delete?id=5', 'post', '', '{\"id\":\"5\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643184669),
                                                                                                                                 (705, 1, '/admin/system.quick/delete?id=11', 'post', '', '{\"id\":\"11\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643186030),
                                                                                                                                 (706, 1, '/admin/system.quick/delete?id=10', 'post', '', '{\"id\":\"10\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643186036),
                                                                                                                                 (707, 1, '/admin/system.quick/delete?id=10', 'post', '', '{\"id\":\"10\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643186045),
                                                                                                                                 (708, 1, '/admin/system.quick/delete?id=10', 'post', '', '{\"id\":\"10\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643186050),
                                                                                                                                 (709, 1, '/admin/system.quick/delete?id=10', 'post', '', '{\"id\":\"10\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643186069),
                                                                                                                                 (710, 1, '/admin/system.quick/delete?id=6', 'post', '', '{\"id\":\"6\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643186074),
                                                                                                                                 (711, 1, '/admin/system.quick/delete?id=3', 'post', '', '{\"id\":\"3\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643186099),
                                                                                                                                 (712, 1, '/admin/system.quick/delete?id=6', 'post', '', '{\"id\":\"6\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643186104),
                                                                                                                                 (713, 1, '/admin/system.quick/add', 'post', '', '{\"title\":\"会员列表\",\"href\":\"user.pay\\/index\",\"icon\":\"fa fa-users\",\"sort\":\"0\",\"remark\":\"\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643186136),
                                                                                                                                 (714, 1, '/admin/system.quick/add', 'post', '', '{\"title\":\"订单列表\",\"href\":\"user.pay\\/index\",\"icon\":\"fa fa-paypal\",\"sort\":\"0\",\"remark\":\"\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643186172),
                                                                                                                                 (715, 1, '/admin/system.quick/add', 'post', '', '{\"title\":\"活动管理\",\"href\":\"event\\/index\",\"icon\":\"fa fa-align-justify\",\"sort\":\"0\",\"remark\":\"\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643186209),
                                                                                                                                 (716, 1, '/admin/system.quick/add', 'post', '', '{\"title\":\"意见反馈\",\"href\":\"feedback\\/index\",\"icon\":\"fa fa-align-center\",\"sort\":\"0\",\"remark\":\"\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643186228),
                                                                                                                                 (717, 1, '/admin/system.config/save', 'post', '', '{\"site_name\":\"详情交友小程序\",\"site_ico\":\"填你的\",\"file\":\"\",\"site_version\":\"1.0\",\"site_beian\":\"null\",\"site_copyright\":\"null\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643187370),
                                                                                                                                 (718, 1, '/admin/system.config/save', 'post', '', '{\"logo_title\":\"Build\",\"logo_image\":\"https:\\/\\/lxn-99php.oss-cn-shenzhen.aliyuncs.com\\/upload\\/20191111\\/2c412adf1b30c8be3a913e603c7b6e4a.jpg\",\"file\":\"\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643187394),
                                                                                                                                 (719, 1, '/admin/system.config/save', 'post', '', '{\"site_name\":\"相亲交友小程序\",\"site_ico\":\"填你的\",\"file\":\"\",\"site_version\":\"1.0\",\"site_beian\":\"null\",\"site_copyright\":\"null\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643187416),
                                                                                                                                 (720, 1, '/admin/user/edit?id=12', 'post', '', '{\"id\":\"12\",\"username\":\"18583761997\",\"phone\":\"***********\",\"avatar\":\"http:\\/\\/127.0.0.1:3332\\/upload\\/20220126\\/1b0d5810b26d5273df993b665248931c.jpg|http:\\/\\/127.0.0.1:3332\\/upload\\/20220122\\/9609236875bed1e293421ec0d26dd6ba.jpg|http:\\/\\/127.0.0.1:3332\\/upload\\/20220122\\/5277b0d078c54864ac38a4e795076839.jpg|http:\\/\\/127.0.0.1:3332\\/upload\\/20220122\\/6f91c4683ac8b9799aceb44f8300d816.jpg\",\"file\":\"\",\"remark\":\"个人介绍\",\"edu\":\"2\",\"sex\":\"1\",\"birthday\":\"2000-01-26\",\"height\":\"175\",\"city\":\"成都市\",\"address\":\"成都市\",\"income\":\"3\",\"marriage\":\"1\",\"children\":\"0\",\"native\":\"四川省成都市武侯区\",\"nation\":\"汉族\",\"blood\":\"3\",\"weight\":\"130\",\"occupation\":\"美团外卖\",\"school\":\"四川大学\",\"major\":\"跑腿\",\"house\":\"1\",\"car_buy\":\"1\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643189180),
                                                                                                                                 (721, 1, '/admin/user/delete?id=12', 'post', '', '{\"id\":\"12\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643189216),
                                                                                                                                 (722, 1, '/admin/user/delete?id=12', 'post', '', '{\"id\":\"12\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643189332),
                                                                                                                                 (723, 1, '/admin/user/delete?id=12', 'post', '', '{\"id\":\"12\"}', '172.19.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 1643189390);

-- --------------------------------------------------------

--
-- Table structure for table `ea_system_menu`
--

CREATE TABLE `ea_system_menu` (
                                  `id` bigint UNSIGNED NOT NULL,
                                  `pid` bigint UNSIGNED NOT NULL DEFAULT '0' COMMENT '父id',
                                  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
                                  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
                                  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
                                  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
                                  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
                                  `sort` int DEFAULT '0' COMMENT '菜单排序',
                                  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
                                  `remark` varchar(255) DEFAULT NULL,
                                  `create_time` int DEFAULT NULL COMMENT '创建时间',
                                  `update_time` int DEFAULT NULL COMMENT '更新时间',
                                  `delete_time` int DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='系统菜单表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ea_system_menu`
--

INSERT INTO `ea_system_menu` (`id`, `pid`, `title`, `icon`, `href`, `params`, `target`, `sort`, `status`, `remark`, `create_time`, `update_time`, `delete_time`) VALUES
                                                                                                                                                                     (227, 99999999, '后台首页', 'fa fa-home', 'index/welcome', '', '_self', 0, 1, NULL, NULL, 1573120497, NULL),
                                                                                                                                                                     (228, 0, '系统管理', 'fa fa-cog', '', '', '_self', 0, 1, '', NULL, 1588999529, NULL),
                                                                                                                                                                     (234, 228, '菜单管理', 'fa fa-tree', 'system.menu/index', '', '_self', 10, 1, '', NULL, 1588228555, NULL),
                                                                                                                                                                     (244, 228, '管理员管理', 'fa fa-user', 'system.admin/index', '', '_self', 12, 1, '', 1573185011, 1588228573, NULL),
                                                                                                                                                                     (245, 228, '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', '', '_self', 11, 1, '', 1573435877, 1588228634, NULL),
                                                                                                                                                                     (246, 228, '节点管理', 'fa fa-list', 'system.node/index', '', '_self', 9, 1, '', 1573435919, 1588228648, NULL),
                                                                                                                                                                     (247, 228, '配置管理', 'fa fa-asterisk', 'system.config/index', '', '_self', 8, 1, '', 1573457448, 1588228566, NULL),
                                                                                                                                                                     (248, 228, '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', '', '_self', 0, 1, '', 1573542953, 1588228043, NULL),
                                                                                                                                                                     (249, 0, '商城管理', 'fa fa-list', '', '', '_self', 0, 1, '', 1589439884, 1642131544, 1642131544),
                                                                                                                                                                     (250, 249, '商品分类', 'fa fa-calendar-check-o', 'mall.cate/index', '', '_self', 0, 1, '', 1589439910, 1589439966, NULL),
                                                                                                                                                                     (251, 249, '商品管理', 'fa fa-list', 'mall.goods/index', '', '_self', 0, 1, '', 1589439931, 1589439942, NULL),
                                                                                                                                                                     (252, 228, '快捷入口', 'fa fa-list', 'system.quick/index', '', '_self', 0, 1, '', 1589623683, 1589623683, NULL),
                                                                                                                                                                     (253, 228, '日志管理', 'fa fa-connectdevelop', 'system.log/index', '', '_self', 0, 1, '', 1589623684, 1589623684, NULL),
                                                                                                                                                                     (254, 0, '会员', 'fa fa-user', '', '', '_self', 0, 1, '', 1642141737, 1642141737, NULL),
                                                                                                                                                                     (255, 254, '会员列表', 'fa fa-user-circle', 'user/index', '', '_self', 0, 1, '', 1642141787, 1642141787, NULL),
                                                                                                                                                                     (256, 254, '支付订单', 'fa fa-paypal', 'user.pay/index', '', '_self', 0, 1, '', 1642141825, 1642141825, NULL),
                                                                                                                                                                     (257, 0, '新闻广告', 'fa fa-align-justify', '', '', '_self', 0, 1, '', 1642141870, 1642141870, NULL),
                                                                                                                                                                     (258, 257, '新闻广告', 'fa fa-list', 'news/index', '', '_self', 0, 1, '', 1642141882, 1642141882, NULL),
                                                                                                                                                                     (259, 0, '线下活动', 'fa fa-list', '', '', '_self', 0, 1, '', 1642141908, 1642141908, NULL),
                                                                                                                                                                     (260, 259, '活动列表', 'fa fa-connectdevelop', 'event/index', '', '_self', 0, 1, '', 1642141935, 1642141935, NULL),
                                                                                                                                                                     (261, 0, '意见反馈', 'fa fa-list', '', '', '_self', 0, 1, '', 1642141955, 1642141955, NULL),
                                                                                                                                                                     (262, 261, '反馈列表', 'fa fa-align-center', 'feedback/index', '', '_self', 0, 1, '', 1642141997, 1642141997, NULL),
                                                                                                                                                                     (263, 254, '短信记录', 'fa fa-phone-square', 'send.code/index', '', '_self', 0, 1, '', 1642819765, 1642819765, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_system_node`
--

CREATE TABLE `ea_system_node` (
                                  `id` int UNSIGNED NOT NULL,
                                  `node` varchar(100) DEFAULT NULL COMMENT '节点代码',
                                  `title` varchar(500) DEFAULT NULL COMMENT '节点标题',
                                  `type` tinyint(1) DEFAULT '3' COMMENT '节点类型（1：控制器，2：节点）',
                                  `is_auth` tinyint UNSIGNED DEFAULT '1' COMMENT '是否启动RBAC权限控制',
                                  `create_time` int DEFAULT NULL COMMENT '创建时间',
                                  `update_time` int DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='系统节点表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ea_system_node`
--

INSERT INTO `ea_system_node` (`id`, `node`, `title`, `type`, `is_auth`, `create_time`, `update_time`) VALUES
                                                                                                          (1, 'system.admin', '管理员管理', 1, 1, 1589580432, 1589580432),
                                                                                                          (2, 'system.admin/index', '列表', 2, 1, 1589580432, 1589580432),
                                                                                                          (3, 'system.admin/add', '添加', 2, 1, 1589580432, 1589580432),
                                                                                                          (4, 'system.admin/edit', '编辑', 2, 1, 1589580432, 1589580432),
                                                                                                          (5, 'system.admin/password', '编辑', 2, 1, 1589580432, 1589580432),
                                                                                                          (6, 'system.admin/delete', '删除', 2, 1, 1589580432, 1589580432),
                                                                                                          (7, 'system.admin/modify', '属性修改', 2, 1, 1589580432, 1589580432),
                                                                                                          (8, 'system.admin/export', '导出', 2, 1, 1589580432, 1589580432),
                                                                                                          (9, 'system.auth', '角色权限管理', 1, 1, 1589580432, 1589580432),
                                                                                                          (10, 'system.auth/authorize', '授权', 2, 1, 1589580432, 1589580432),
                                                                                                          (11, 'system.auth/saveAuthorize', '授权保存', 2, 1, 1589580432, 1589580432),
                                                                                                          (12, 'system.auth/index', '列表', 2, 1, 1589580432, 1589580432),
                                                                                                          (13, 'system.auth/add', '添加', 2, 1, 1589580432, 1589580432),
                                                                                                          (14, 'system.auth/edit', '编辑', 2, 1, 1589580432, 1589580432),
                                                                                                          (15, 'system.auth/delete', '删除', 2, 1, 1589580432, 1589580432),
                                                                                                          (16, 'system.auth/export', '导出', 2, 1, 1589580432, 1589580432),
                                                                                                          (17, 'system.auth/modify', '属性修改', 2, 1, 1589580432, 1589580432),
                                                                                                          (18, 'system.config', '系统配置管理', 1, 1, 1589580432, 1589580432),
                                                                                                          (19, 'system.config/index', '列表', 2, 1, 1589580432, 1589580432),
                                                                                                          (20, 'system.config/save', '保存', 2, 1, 1589580432, 1589580432),
                                                                                                          (21, 'system.menu', '菜单管理', 1, 1, 1589580432, 1589580432),
                                                                                                          (22, 'system.menu/index', '列表', 2, 1, 1589580432, 1589580432),
                                                                                                          (23, 'system.menu/add', '添加', 2, 1, 1589580432, 1589580432),
                                                                                                          (24, 'system.menu/edit', '编辑', 2, 1, 1589580432, 1589580432),
                                                                                                          (25, 'system.menu/delete', '删除', 2, 1, 1589580432, 1589580432),
                                                                                                          (26, 'system.menu/modify', '属性修改', 2, 1, 1589580432, 1589580432),
                                                                                                          (27, 'system.menu/getMenuTips', '添加菜单提示', 2, 1, 1589580432, 1589580432),
                                                                                                          (28, 'system.menu/export', '导出', 2, 1, 1589580432, 1589580432),
                                                                                                          (29, 'system.node', '系统节点管理', 1, 1, 1589580432, 1589580432),
                                                                                                          (30, 'system.node/index', '列表', 2, 1, 1589580432, 1589580432),
                                                                                                          (31, 'system.node/refreshNode', '系统节点更新', 2, 1, 1589580432, 1589580432),
                                                                                                          (32, 'system.node/clearNode', '清除失效节点', 2, 1, 1589580432, 1589580432),
                                                                                                          (33, 'system.node/add', '添加', 2, 1, 1589580432, 1589580432),
                                                                                                          (34, 'system.node/edit', '编辑', 2, 1, 1589580432, 1589580432),
                                                                                                          (35, 'system.node/delete', '删除', 2, 1, 1589580432, 1589580432),
                                                                                                          (36, 'system.node/export', '导出', 2, 1, 1589580432, 1589580432),
                                                                                                          (37, 'system.node/modify', '属性修改', 2, 1, 1589580432, 1589580432),
                                                                                                          (38, 'system.uploadfile', '上传文件管理', 1, 1, 1589580432, 1589580432),
                                                                                                          (39, 'system.uploadfile/index', '列表', 2, 1, 1589580432, 1589580432),
                                                                                                          (40, 'system.uploadfile/add', '添加', 2, 1, 1589580432, 1589580432),
                                                                                                          (41, 'system.uploadfile/edit', '编辑', 2, 1, 1589580432, 1589580432),
                                                                                                          (42, 'system.uploadfile/delete', '删除', 2, 1, 1589580432, 1589580432),
                                                                                                          (43, 'system.uploadfile/export', '导出', 2, 1, 1589580432, 1589580432),
                                                                                                          (44, 'system.uploadfile/modify', '属性修改', 2, 1, 1589580432, 1589580432),
                                                                                                          (45, 'mall.cate', '商品分类管理', 1, 1, 1589580432, 1589580432),
                                                                                                          (46, 'mall.cate/index', '列表', 2, 1, 1589580432, 1589580432),
                                                                                                          (47, 'mall.cate/add', '添加', 2, 1, 1589580432, 1589580432),
                                                                                                          (48, 'mall.cate/edit', '编辑', 2, 1, 1589580432, 1589580432),
                                                                                                          (49, 'mall.cate/delete', '删除', 2, 1, 1589580432, 1589580432),
                                                                                                          (50, 'mall.cate/export', '导出', 2, 1, 1589580432, 1589580432),
                                                                                                          (51, 'mall.cate/modify', '属性修改', 2, 1, 1589580432, 1589580432),
                                                                                                          (52, 'mall.goods', '商城商品管理', 1, 1, 1589580432, 1589580432),
                                                                                                          (53, 'mall.goods/index', '列表', 2, 1, 1589580432, 1589580432),
                                                                                                          (54, 'mall.goods/stock', '入库', 2, 1, 1589580432, 1589580432),
                                                                                                          (55, 'mall.goods/add', '添加', 2, 1, 1589580432, 1589580432),
                                                                                                          (56, 'mall.goods/edit', '编辑', 2, 1, 1589580432, 1589580432),
                                                                                                          (57, 'mall.goods/delete', '删除', 2, 1, 1589580432, 1589580432),
                                                                                                          (58, 'mall.goods/export', '导出', 2, 1, 1589580432, 1589580432),
                                                                                                          (59, 'mall.goods/modify', '属性修改', 2, 1, 1589580432, 1589580432),
                                                                                                          (60, 'system.quick', '快捷入口管理', 1, 1, 1589623188, 1589623188),
                                                                                                          (61, 'system.quick/index', '列表', 2, 1, 1589623188, 1589623188),
                                                                                                          (62, 'system.quick/add', '添加', 2, 1, 1589623188, 1589623188),
                                                                                                          (63, 'system.quick/edit', '编辑', 2, 1, 1589623188, 1589623188),
                                                                                                          (64, 'system.quick/delete', '删除', 2, 1, 1589623188, 1589623188),
                                                                                                          (65, 'system.quick/export', '导出', 2, 1, 1589623188, 1589623188),
                                                                                                          (66, 'system.quick/modify', '属性修改', 2, 1, 1589623188, 1589623188),
                                                                                                          (67, 'system.log', '操作日志管理', 1, 1, 1589623188, 1589623188),
                                                                                                          (68, 'system.log/index', '列表', 2, 1, 1589623188, 1589623188),
                                                                                                          (69, 'user.pay', '会员支付', 1, 1, 1642132817, 1642132872),
                                                                                                          (70, 'user.pay/index', '列表', 2, 1, 1642132817, 1642132817),
                                                                                                          (71, 'user.pay/add', '添加', 2, 1, 1642132817, 1642132817),
                                                                                                          (72, 'user.pay/edit', '编辑', 2, 1, 1642132817, 1642132817),
                                                                                                          (73, 'user.pay/delete', '删除', 2, 1, 1642132817, 1642132817),
                                                                                                          (74, 'user.pay/export', '导出', 2, 1, 1642132817, 1642132817),
                                                                                                          (75, 'user.pay/modify', '属性修改', 2, 1, 1642132817, 1642132817),
                                                                                                          (76, 'event.join', '活动记录', 1, 1, 1642132817, 1642132885),
                                                                                                          (77, 'event.join/index', '列表', 2, 1, 1642132817, 1642132817),
                                                                                                          (78, 'event.join/add', '添加', 2, 1, 1642132817, 1642132817),
                                                                                                          (79, 'event.join/edit', '编辑', 2, 1, 1642132817, 1642132817),
                                                                                                          (80, 'event.join/delete', '删除', 2, 1, 1642132817, 1642132817),
                                                                                                          (81, 'event.join/export', '导出', 2, 1, 1642132817, 1642132817),
                                                                                                          (82, 'event.join/modify', '属性修改', 2, 1, 1642132817, 1642132817),
                                                                                                          (83, 'event', 'event', 1, 1, 1642132817, 1642132817),
                                                                                                          (84, 'event/index', '列表', 2, 1, 1642132817, 1642132817),
                                                                                                          (85, 'event/add', '添加', 2, 1, 1642132817, 1642132817),
                                                                                                          (86, 'event/edit', '编辑', 2, 1, 1642132817, 1642132817),
                                                                                                          (87, 'event/delete', '删除', 2, 1, 1642132817, 1642132817),
                                                                                                          (88, 'event/export', '导出', 2, 1, 1642132817, 1642132817),
                                                                                                          (89, 'event/modify', '属性修改', 2, 1, 1642132817, 1642132817),
                                                                                                          (90, 'feedback', 'feedback', 1, 1, 1642132817, 1642132817),
                                                                                                          (91, 'feedback/index', '列表', 2, 1, 1642132817, 1642132817),
                                                                                                          (92, 'feedback/add', '添加', 2, 1, 1642132817, 1642132817),
                                                                                                          (93, 'feedback/edit', '编辑', 2, 1, 1642132817, 1642132817),
                                                                                                          (94, 'feedback/delete', '删除', 2, 1, 1642132817, 1642132817),
                                                                                                          (95, 'feedback/export', '导出', 2, 1, 1642132817, 1642132817),
                                                                                                          (96, 'feedback/modify', '属性修改', 2, 1, 1642132817, 1642132817),
                                                                                                          (97, 'news', '新闻广告', 1, 1, 1642132817, 1642132860),
                                                                                                          (98, 'news/index', '列表', 2, 1, 1642132817, 1642132817),
                                                                                                          (99, 'news/add', '添加', 2, 1, 1642132817, 1642132817),
                                                                                                          (100, 'news/edit', '编辑', 2, 1, 1642132817, 1642132817),
                                                                                                          (101, 'news/delete', '删除', 2, 1, 1642132817, 1642132817),
                                                                                                          (102, 'news/export', '导出', 2, 1, 1642132817, 1642132817),
                                                                                                          (103, 'news/modify', '属性修改', 2, 1, 1642132817, 1642132817),
                                                                                                          (104, 'user', '用户信息', 1, 1, 1642132817, 1642132850),
                                                                                                          (105, 'user/index', '列表', 2, 1, 1642132817, 1642132817),
                                                                                                          (106, 'user/add', '添加', 2, 1, 1642132817, 1642132817),
                                                                                                          (107, 'user/edit', '编辑', 2, 1, 1642132817, 1642132817),
                                                                                                          (108, 'user/delete', '删除', 2, 1, 1642132817, 1642132817),
                                                                                                          (109, 'user/export', '导出', 2, 1, 1642132817, 1642132817),
                                                                                                          (110, 'user/modify', '属性修改', 2, 1, 1642132817, 1642132817),
                                                                                                          (111, 'send.code', 'send_code', 1, 1, 1642819728, 1642819728),
                                                                                                          (112, 'send.code/index', '列表', 2, 1, 1642819728, 1642819728),
                                                                                                          (113, 'send.code/add', '添加', 2, 1, 1642819728, 1642819728),
                                                                                                          (114, 'send.code/edit', '编辑', 2, 1, 1642819728, 1642819728),
                                                                                                          (115, 'send.code/delete', '删除', 2, 1, 1642819728, 1642819728),
                                                                                                          (116, 'send.code/export', '导出', 2, 1, 1642819728, 1642819728),
                                                                                                          (117, 'send.code/modify', '属性修改', 2, 1, 1642819728, 1642819728);

-- --------------------------------------------------------

--
-- Table structure for table `ea_system_quick`
--

CREATE TABLE `ea_system_quick` (
                                   `id` bigint UNSIGNED NOT NULL,
                                   `title` varchar(20) NOT NULL COMMENT '快捷入口名称',
                                   `icon` varchar(100) DEFAULT NULL COMMENT '图标',
                                   `href` varchar(255) DEFAULT NULL COMMENT '快捷链接',
                                   `sort` int DEFAULT '0' COMMENT '排序',
                                   `status` tinyint UNSIGNED DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
                                   `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
                                   `create_time` int DEFAULT NULL COMMENT '创建时间',
                                   `update_time` int DEFAULT NULL COMMENT '更新时间',
                                   `delete_time` int DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='系统快捷入口表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ea_system_quick`
--

INSERT INTO `ea_system_quick` (`id`, `title`, `icon`, `href`, `sort`, `status`, `remark`, `create_time`, `update_time`, `delete_time`) VALUES
                                                                                                                                           (1, '管理员管理', 'fa fa-user', 'system.admin/index', 0, 1, '', 1589624097, 1589624792, NULL),
                                                                                                                                           (2, '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', 0, 1, '', 1589624772, 1589624781, NULL),
                                                                                                                                           (3, '菜单管理', 'fa fa-tree', 'system.menu/index', 0, 1, NULL, 1589624097, 1643186099, 1643186099),
                                                                                                                                           (6, '节点管理', 'fa fa-list', 'system.node/index', 0, 1, NULL, 1589624772, 1643186104, 1643186104),
                                                                                                                                           (7, '配置管理', 'fa fa-asterisk', 'system.config/index', 0, 1, NULL, 1589624097, 1589624792, NULL),
                                                                                                                                           (8, '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', 0, 1, NULL, 1589624772, 1589624781, NULL),
                                                                                                                                           (10, '商品分类', 'fa fa-calendar-check-o', 'mall.cate/index', 0, 1, NULL, 1589624097, 1643186069, 1643186069),
                                                                                                                                           (11, '商品管理', 'fa fa-list', 'mall.goods/index', 0, 1, NULL, 1589624772, 1643186030, 1643186030),
                                                                                                                                           (12, '会员列表', 'fa fa-users', 'user.pay/index', 0, 1, '', 1643186137, 1643186137, NULL),
                                                                                                                                           (13, '订单列表', 'fa fa-paypal', 'user.pay/index', 0, 1, '', 1643186173, 1643186173, NULL),
                                                                                                                                           (14, '活动管理', 'fa fa-align-justify', 'event/index', 0, 1, '', 1643186209, 1643186209, NULL),
                                                                                                                                           (15, '意见反馈', 'fa fa-align-center', 'feedback/index', 0, 1, '', 1643186228, 1643186228, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_system_uploadfile`
--

CREATE TABLE `ea_system_uploadfile` (
                                        `id` int UNSIGNED NOT NULL COMMENT 'ID',
                                        `upload_type` varchar(20) NOT NULL DEFAULT 'local' COMMENT '存储位置',
                                        `original_name` varchar(255) DEFAULT NULL COMMENT '文件原名',
                                        `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
                                        `image_width` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
                                        `image_height` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
                                        `image_type` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
                                        `image_frames` int UNSIGNED NOT NULL DEFAULT '0' COMMENT '图片帧数',
                                        `mime_type` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
                                        `file_size` int UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小',
                                        `file_ext` varchar(100) DEFAULT NULL,
                                        `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
                                        `create_time` int DEFAULT NULL COMMENT '创建日期',
                                        `update_time` int DEFAULT NULL COMMENT '更新时间',
                                        `upload_time` int DEFAULT NULL COMMENT '上传时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='上传文件表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ea_system_uploadfile`
--

INSERT INTO `ea_system_uploadfile` (`id`, `upload_type`, `original_name`, `url`, `image_width`, `image_height`, `image_type`, `image_frames`, `mime_type`, `file_size`, `file_ext`, `sha1`, `create_time`, `update_time`, `upload_time`) VALUES
                                                                                                                                                                                                                                             (286, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/0a6de1ac058ee134301501899b84ecb1.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL),
                                                                                                                                                                                                                                             (287, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/46d7384f04a3bed331715e86a4095d15.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL),
                                                                                                                                                                                                                                             (288, 'alioss', 'image/x-icon', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/7d32671f4c1d1b01b0b28f45205763f9.ico', '', '', '', 0, 'image/x-icon', 0, 'ico', '', NULL, NULL, NULL),
                                                                                                                                                                                                                                             (289, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/28cefa547f573a951bcdbbeb1396b06f.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL),
                                                                                                                                                                                                                                             (290, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/2c412adf1b30c8be3a913e603c7b6e4a.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL),
                                                                                                                                                                                                                                             (296, 'txcos', '22243.jpg', 'https://easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com/upload/20191114/2381eaf81208ac188fa994b6f2579953.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1573712153, NULL, NULL),
                                                                                                                                                                                                                                             (303, 'local', '视频.png', 'http://127.0.0.1:3332/upload/20220118/583bd011ff9ef99960472b4c8d5c8b01.png', '', '', '', 0, 'image/png', 0, 'png', '', 1642488584, NULL, NULL),
                                                                                                                                                                                                                                             (304, 'local', '橙子.png', 'http://127.0.0.1:3332/upload/20220118/1c33f1b34962a6f908648b3868a3e1ae.png', '', '', '', 0, 'image/png', 0, 'png', '', 1642488602, NULL, NULL),
                                                                                                                                                                                                                                             (305, 'local', '1642860161984.jpg', 'http://127.0.0.1:3332/upload/20220122/c58fa40c7f8a1981c718177d741d8b0a.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1642860179, NULL, NULL),
                                                                                                                                                                                                                                             (306, 'local', '1642860161984.jpg', 'http://127.0.0.1:3332/upload/20220122/d60116937259434dced13b35f6be1efa.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1642860194, NULL, NULL),
                                                                                                                                                                                                                                             (307, 'local', '1642860161984.jpg', 'http://127.0.0.1:3332/upload/20220122/6f91c4683ac8b9799aceb44f8300d816.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1642860279, NULL, NULL),
                                                                                                                                                                                                                                             (308, 'local', '1642860161984.jpg', 'http://127.0.0.1:3332/upload/20220122/5277b0d078c54864ac38a4e795076839.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1642860658, NULL, NULL),
                                                                                                                                                                                                                                             (309, 'local', '1642860161984.jpg', 'http://127.0.0.1:3332/upload/20220122/9609236875bed1e293421ec0d26dd6ba.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1642860717, NULL, NULL),
                                                                                                                                                                                                                                             (310, 'local', '1.jpg', 'http://127.0.0.1:3332/upload/20220123/32d4364f3e3d0fbb9de6de7375325f89.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1642919757, NULL, NULL),
                                                                                                                                                                                                                                             (311, 'local', 'src=http___b-ssl.duitang.com_uploads_item_201806_27_20180627170853_UiVHh.thumb.700_0.jpeg&amp;refer=http___b-ssl.duitang.jpg', 'http://127.0.0.1:3332/upload/20220123/c37c27ce89ee27bce523b945d488b1f6.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1642920155, NULL, NULL),
                                                                                                                                                                                                                                             (312, 'local', 'detail_upgrade.jpg', 'http://127.0.0.1:3332/upload/20220126/1b0d5810b26d5273df993b665248931c.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1643182592, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_user`
--

CREATE TABLE `ea_user` (
                           `user_id` bigint UNSIGNED NOT NULL COMMENT '用户UID',
                           `username` varchar(64) NOT NULL COMMENT '用户名 {text}',
                           `phone` varchar(16) NOT NULL COMMENT '手机号 {text}',
                           `avatar` text COMMENT '头像照片 最多五张 {images}',
                           `remark` varchar(255) DEFAULT NULL COMMENT '个人介绍 {textarea}',
                           `longitude` varchar(255) DEFAULT NULL COMMENT '经度 {text}',
                           `dimension` varchar(255) DEFAULT NULL COMMENT '维度 {text}',
                           `edu` int DEFAULT NULL COMMENT '学历 {radio} (1:初中, 2:中专, 3:高中, 4:大专, 5:本科, 6:硕士, 7:博士, 8:博士后)',
                           `sex` int DEFAULT '0' COMMENT '性别 {radio} (0:未知, 1:男, 2:女)',
                           `birthday` date DEFAULT NULL COMMENT '生日 {text}',
                           `height` int DEFAULT NULL COMMENT '身高 {text}',
                           `city` varchar(255) DEFAULT NULL COMMENT '城市 {text}',
                           `address` varchar(255) DEFAULT NULL COMMENT '居住地 {text}',
                           `income` int DEFAULT NULL COMMENT '月收入 {radio} (1:3000元以内, 2:3000-5000元, 3:5000-10000元, 4:10000-30000元, 5:30000元以上)',
                           `marriage` int DEFAULT '1' COMMENT '婚姻状况 {radio} (1:未婚, 2:离异, 3:丧偶, 4:已婚)',
                           `children` int DEFAULT '0' COMMENT '子女状况 {radio} (0:没有, 1:有)',
                           `native` varchar(64) DEFAULT NULL COMMENT '籍贯 {text}',
                           `nation` varchar(32) DEFAULT NULL COMMENT '民族 {text}',
                           `blood` int DEFAULT '5' COMMENT '血型 {radio} (1:A, 2:B, 3:AB, 4:0, 5:其他)',
                           `weight` int DEFAULT NULL COMMENT '体重 {text}',
                           `occupation` varchar(32) DEFAULT NULL COMMENT '职业 {text}',
                           `school` varchar(255) DEFAULT NULL COMMENT '毕业学校 {text}',
                           `major` varchar(255) DEFAULT NULL COMMENT '所学专业 {text}',
                           `house` int DEFAULT NULL COMMENT '购房情况 {radio} (1:已购房无贷款, 2:已购房有贷款, 3:与父母同住, 4:暂未购房, 5:租房)',
                           `car_buy` int DEFAULT NULL COMMENT '购车情况 {radio} (1:已买车, 2:未买车)',
                           `status` int NOT NULL DEFAULT '1' COMMENT '会员状态',
                           `create_time` int DEFAULT NULL COMMENT '创建时间',
                           `update_time` int DEFAULT NULL COMMENT '更新时间',
                           `delete_time` int DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户信息表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ea_user`
--

INSERT INTO `ea_user` (`user_id`, `username`, `phone`, `avatar`, `remark`, `longitude`, `dimension`, `edu`, `sex`, `birthday`, `height`, `city`, `address`, `income`, `marriage`, `children`, `native`, `nation`, `blood`, `weight`, `occupation`, `school`, `major`, `house`, `car_buy`, `status`, `create_time`, `update_time`, `delete_time`) VALUES
                                                                                                                                                                                                                                                                                                                                                     (4, 'sclecon', '18583761997', 'http://127.0.0.1:3332/upload/20220118/1c33f1b34962a6f908648b3868a3e1ae.png', '', '116.371335', '39.938192', 5, 1, '2000-05-14', 175, '成都', '成都市', 3, 1, 0, '', '', 5, 0, '', '', '', 5, NULL, 1, 1642859694, 1643188930, NULL),
                                                                                                                                                                                                                                                                                                                                                     (12, '18583761997', '18583761997', 'http://127.0.0.1:3332/upload/20220126/1b0d5810b26d5273df993b665248931c.jpg|http://127.0.0.1:3332/upload/20220122/9609236875bed1e293421ec0d26dd6ba.jpg|http://127.0.0.1:3332/upload/20220122/5277b0d078c54864ac38a4e795076839.jpg|http://127.0.0.1:3332/upload/20220122/6f91c4683ac8b9799aceb44f8300d816.jpg', '个人介绍', '116.371335', '39.938192', 2, 1, '2000-01-26', 175, '成都市', '成都市', 3, 1, 0, '四川省成都市武侯区', '汉族', 3, 130, '美团外卖', '四川大学', '跑腿', 1, 1, 1, 1643188930, 1643189390, 1643189390);

-- --------------------------------------------------------

--
-- Table structure for table `ea_user_pay`
--

CREATE TABLE `ea_user_pay` (
                               `pay_id` bigint UNSIGNED NOT NULL COMMENT '数据ID',
                               `order_id` varchar(32) NOT NULL COMMENT '订单ID',
                               `user_id` bigint UNSIGNED NOT NULL COMMENT '下单会员ID',
                               `buy_user_id` bigint UNSIGNED NOT NULL COMMENT '购买会员ID',
                               `subject` varchar(255) NOT NULL COMMENT '订单标题 {text}',
                               `total` float(11,2) NOT NULL COMMENT '支付金额 {text}',
  `flag` int NOT NULL DEFAULT '0' COMMENT '支付状态 {radio} (1:支付完成, 0:未支付)',
  `status` int NOT NULL DEFAULT '1' COMMENT '数据状态',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `delete_time` int DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='VIP购买表' ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ea_user_pay`
--

INSERT INTO `ea_user_pay` (`pay_id`, `order_id`, `user_id`, `buy_user_id`, `subject`, `total`, `flag`, `status`, `create_time`, `update_time`, `delete_time`) VALUES
                                                                                                                                                                  (1, '1643101483776202', 4, 4, '查看联系方式', 0.10, 0, 1, NULL, NULL, NULL),
                                                                                                                                                                  (2, '1643102236436831', 4, 4, '查看联系方式', 0.10, 0, 1, 1643102236, NULL, NULL),
                                                                                                                                                                  (3, '1643185177957128', 4, 4, '查看联系方式', 0.10, 1, 1, 1643185177, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
                         `id` int NOT NULL,
                         `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `longitude` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `dimension` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `name`, `longitude`, `dimension`) VALUES
                                                                 (1, '我家', '104.056192243042', '30.632868951105078'),
                                                                 (2, '玉林生活广场', '104.05803760284425', '30.620442385335085'),
                                                                 (3, '银都花园', '104.05561288589479', '30.618355747573208'),
                                                                 (4, '玉林中学芳草校区', '104.05256589645387', '30.62511407493806'),
                                                                 (5, '香木林 永丰大厦', '104.04657920593263', '30.626665099887404'),
                                                                 (6, '锦里古街', '104.04981931442262', '30.645958510481847'),
                                                                 (7, '文庙后街31号', '104.06183561080934', '30.650813566569976'),
                                                                 (8, '佳兆业 天悦', '104.06971057647706', '30.651182762382412'),
                                                                 (9, '文殊院', '104.07226403945924', '30.675325106989675'),
                                                                 (10, '青羊体育中心', '104.05810197586061', '30.68093530791434'),
                                                                 (11, '永陵公园', '104.04728730911256', '30.674439256002053'),
                                                                 (12, '西南财经大学', '104.01415666336061', '30.667425982287668'),
                                                                 (13, '金牛体育中心', '104.03312524551393', '30.691305939602156'),
                                                                 (14, '北门车站', '104.08548196548463', '30.682706882606276'),
                                                                 (15, '太古里', '104.08372243637086', '30.653213314152378'),
                                                                 (16, '望江楼公园', '104.09299215072633', '30.629471653281172'),
                                                                 (17, '东湖国际', '104.09483751052858', '30.6153272729464'),
                                                                 (18, '金融城', '104.06389554733278', '30.582340313587725'),
                                                                 (19, '奥克斯广场', '104.06183561080934', '30.57642880987487'),
                                                                 (20, '中海国际中心', '104.05355294937135', '30.581712233431652'),
                                                                 (21, '铁橡寺水街', '104.04939016098024', '30.557546531602842'),
                                                                 (22, '大源中央公园', '104.0499051451111', '30.548750791446277'),
                                                                 (23, 'OCG国际中心', '104.06438907379152', '30.543169887599603'),
                                                                 (24, '携程信息技术大楼', '104.06441053146364', '30.5415158826201'),
                                                                 (25, '银泰城17栋写字楼', '104.0608914732361', '30.5404347579949');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ea_event`
--
ALTER TABLE `ea_event`
    ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `ea_event_join`
--
ALTER TABLE `ea_event_join`
    ADD PRIMARY KEY (`join_id`);

--
-- Indexes for table `ea_feedback`
--
ALTER TABLE `ea_feedback`
    ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `ea_mall_cate`
--
ALTER TABLE `ea_mall_cate`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`) USING BTREE;

--
-- Indexes for table `ea_mall_goods`
--
ALTER TABLE `ea_mall_goods`
    ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cate_id`);

--
-- Indexes for table `ea_news`
--
ALTER TABLE `ea_news`
    ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `ea_send_code`
--
ALTER TABLE `ea_send_code`
    ADD PRIMARY KEY (`send_id`);

--
-- Indexes for table `ea_system_admin`
--
ALTER TABLE `ea_system_admin`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`) USING BTREE,
  ADD KEY `phone` (`phone`);

--
-- Indexes for table `ea_system_auth`
--
ALTER TABLE `ea_system_auth`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`) USING BTREE;

--
-- Indexes for table `ea_system_auth_node`
--
ALTER TABLE `ea_system_auth_node`
    ADD PRIMARY KEY (`id`),
  ADD KEY `index_system_auth_auth` (`auth_id`) USING BTREE,
  ADD KEY `index_system_auth_node` (`node_id`) USING BTREE;

--
-- Indexes for table `ea_system_config`
--
ALTER TABLE `ea_system_config`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `group` (`group`);

--
-- Indexes for table `ea_system_log_202201`
--
ALTER TABLE `ea_system_log_202201`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_system_menu`
--
ALTER TABLE `ea_system_menu`
    ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `href` (`href`);

--
-- Indexes for table `ea_system_node`
--
ALTER TABLE `ea_system_node`
    ADD PRIMARY KEY (`id`),
  ADD KEY `node` (`node`) USING BTREE;

--
-- Indexes for table `ea_system_quick`
--
ALTER TABLE `ea_system_quick`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_system_uploadfile`
--
ALTER TABLE `ea_system_uploadfile`
    ADD PRIMARY KEY (`id`),
  ADD KEY `upload_type` (`upload_type`),
  ADD KEY `original_name` (`original_name`);

--
-- Indexes for table `ea_user`
--
ALTER TABLE `ea_user`
    ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `ea_user_pay`
--
ALTER TABLE `ea_user_pay`
    ADD PRIMARY KEY (`pay_id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ea_event`
--
ALTER TABLE `ea_event`
    MODIFY `event_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '活动ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ea_event_join`
--
ALTER TABLE `ea_event_join`
    MODIFY `join_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '数据ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ea_feedback`
--
ALTER TABLE `ea_feedback`
    MODIFY `feedback_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '数据ID', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ea_mall_cate`
--
ALTER TABLE `ea_mall_cate`
    MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ea_mall_goods`
--
ALTER TABLE `ea_mall_goods`
    MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ea_news`
--
ALTER TABLE `ea_news`
    MODIFY `news_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '新闻ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ea_send_code`
--
ALTER TABLE `ea_send_code`
    MODIFY `send_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '数据ID', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ea_system_admin`
--
ALTER TABLE `ea_system_admin`
    MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ea_system_auth`
--
ALTER TABLE `ea_system_auth`
    MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ea_system_auth_node`
--
ALTER TABLE `ea_system_auth_node`
    MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ea_system_config`
--
ALTER TABLE `ea_system_config`
    MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `ea_system_log_202201`
--
ALTER TABLE `ea_system_log_202201`
    MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=724;

--
-- AUTO_INCREMENT for table `ea_system_menu`
--
ALTER TABLE `ea_system_menu`
    MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT for table `ea_system_node`
--
ALTER TABLE `ea_system_node`
    MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `ea_system_quick`
--
ALTER TABLE `ea_system_quick`
    MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ea_system_uploadfile`
--
ALTER TABLE `ea_system_uploadfile`
    MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=313;

--
-- AUTO_INCREMENT for table `ea_user`
--
ALTER TABLE `ea_user`
    MODIFY `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户UID', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ea_user_pay`
--
ALTER TABLE `ea_user_pay`
    MODIFY `pay_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '数据ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
    MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
