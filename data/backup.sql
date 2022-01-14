-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2022-01-14 14:35:44
-- 服务器版本： 5.7.28
-- PHP 版本： 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `blind`
--

-- --------------------------------------------------------

--
-- 表的结构 `ea_event`
--

CREATE TABLE `ea_event` (
  `event_id` bigint(20) UNSIGNED NOT NULL COMMENT '活动ID',
  `subject` varchar(255) NOT NULL COMMENT '活动标题 {text}',
  `image` varchar(255) NOT NULL COMMENT '封面图 {image}',
  `message` text NOT NULL COMMENT '活动内容 {editor}',
  `flag` int(1) NOT NULL DEFAULT '1' COMMENT '活动状态 {radio} (1:进行中, 0:已结束)',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动数据表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `ea_event_join`
--

CREATE TABLE `ea_event_join` (
  `join_id` bigint(20) UNSIGNED NOT NULL COMMENT '数据ID',
  `event_id` bigint(20) UNSIGNED NOT NULL COMMENT '活动ID',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户UID',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动参与表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `ea_feedback`
--

CREATE TABLE `ea_feedback` (
  `feedback_id` bigint(20) UNSIGNED NOT NULL COMMENT '数据ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `phone` varchar(16) NOT NULL COMMENT '手机号 {text}',
  `message` varchar(255) NOT NULL COMMENT '反馈内容 {textarea}',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见反馈表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `ea_mall_cate`
--

CREATE TABLE `ea_mall_cate` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(20) NOT NULL COMMENT '分类名',
  `image` varchar(500) DEFAULT NULL COMMENT '分类图片',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `ea_mall_cate`
--

INSERT INTO `ea_mall_cate` (`id`, `title`, `image`, `sort`, `status`, `remark`, `create_time`, `update_time`, `delete_time`) VALUES
(9, '手机', 'http://admin.host/upload/20200514/98fc09b0c4ad4d793a6f04bef79a0edc.jpg', 0, 1, '', 1589440437, 1589440437, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ea_mall_goods`
--

CREATE TABLE `ea_mall_goods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cate_id` int(11) DEFAULT NULL COMMENT '分类ID',
  `title` varchar(20) NOT NULL COMMENT '商品名称',
  `logo` varchar(500) DEFAULT NULL COMMENT '商品logo',
  `images` text COMMENT '商品图片 以 | 做分割符号',
  `describe` text COMMENT '商品描述',
  `market_price` decimal(10,2) DEFAULT '0.00' COMMENT '市场价',
  `discount_price` decimal(10,2) DEFAULT '0.00' COMMENT '折扣价',
  `sales` int(11) DEFAULT '0' COMMENT '销量',
  `virtual_sales` int(11) DEFAULT '0' COMMENT '虚拟销量',
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `total_stock` int(11) DEFAULT '0' COMMENT '总库存',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品列表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `ea_mall_goods`
--

INSERT INTO `ea_mall_goods` (`id`, `cate_id`, `title`, `logo`, `images`, `describe`, `market_price`, `discount_price`, `sales`, `virtual_sales`, `stock`, `total_stock`, `sort`, `status`, `remark`, `create_time`, `update_time`, `delete_time`) VALUES
(8, 10, '落地-风扇', 'http://admin.host/upload/20200514/a0f7fe9637abd219f7e93ceb2820df9b.jpg', 'http://admin.host/upload/20200514/95496713918290f6315ea3f87efa6bf2.jpg|http://admin.host/upload/20200514/ae29fa9cba4fc02defb7daed41cb2b13.jpg|http://admin.host/upload/20200514/f0a104d88ec7dc6fb42d2f87cbc71b76.jpg|http://admin.host/upload/20200514/3b88be4b1934690e5c1bd6b54b9ab5c8.jpg', '<p>76654757</p>\n\n<p><img alt=\"\" src=\"http://admin.host/upload/20200515/198070421110fa01f2c2ac2f52481647.jpg\" style=\"height:689px; width:790px\" /></p>\n\n<p><img alt=\"\" src=\"http://admin.host/upload/20200515/a07a742c15a78781e79f8a3317006c1d.jpg\" style=\"height:877px; width:790px\" /></p>\n', '599.00', '368.00', 0, 594, 0, 0, 675, 1, '', 1589454309, 1589567016, NULL),
(9, 9, '电脑', 'http://admin.host/upload/20200514/bbf858d469dec2e12a89460110068d3d.jpg', 'http://admin.host/upload/20200514/f0a104d88ec7dc6fb42d2f87cbc71b76.jpg', '<p>477</p>\n', '0.00', '0.00', 0, 0, 115, 320, 0, 1, '', 1589465215, 1589476345, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ea_news`
--

CREATE TABLE `ea_news` (
  `news_id` bigint(20) UNSIGNED NOT NULL COMMENT '新闻ID',
  `subject` varchar(255) NOT NULL COMMENT '新闻标题 {text}',
  `message` text NOT NULL COMMENT '新闻内容 {editor}',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '新闻状态',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告新闻表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `ea_system_admin`
--

CREATE TABLE `ea_system_admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `auth_ids` varchar(255) DEFAULT NULL COMMENT '角色权限ID',
  `head_img` varchar(255) DEFAULT NULL COMMENT '头像',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(40) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `remark` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) UNSIGNED DEFAULT '0' COMMENT '登录次数',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用,)',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `ea_system_admin`
--

INSERT INTO `ea_system_admin` (`id`, `auth_ids`, `head_img`, `username`, `password`, `phone`, `remark`, `login_num`, `sort`, `status`, `create_time`, `update_time`, `delete_time`) VALUES
(1, NULL, '/static/admin/images/head.jpg', 'admin', 'a33b679d5581a8692988ec9f92ad2d6a2259eaa7', NULL, '', 1, 0, 1, 1642130832, 1642131362, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ea_system_auth`
--

CREATE TABLE `ea_system_auth` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(20) NOT NULL COMMENT '权限名称',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统权限表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `ea_system_auth`
--

INSERT INTO `ea_system_auth` (`id`, `title`, `sort`, `status`, `remark`, `create_time`, `update_time`, `delete_time`) VALUES
(1, '管理员', 1, 1, '测试管理员', 1588921753, 1589614331, NULL),
(6, '游客权限', 0, 1, '', 1588227513, 1589591751, 1589591751);

-- --------------------------------------------------------

--
-- 表的结构 `ea_system_auth_node`
--

CREATE TABLE `ea_system_auth_node` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `auth_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT '角色ID',
  `node_id` bigint(20) DEFAULT NULL COMMENT '节点ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与节点关系表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `ea_system_auth_node`
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
-- 表的结构 `ea_system_config`
--

CREATE TABLE `ea_system_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `value` text COMMENT '变量值',
  `remark` varchar(100) DEFAULT '' COMMENT '备注信息',
  `sort` int(10) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `ea_system_config`
--

INSERT INTO `ea_system_config` (`id`, `name`, `group`, `value`, `remark`, `sort`, `create_time`, `update_time`) VALUES
(41, 'alisms_access_key_id', 'sms', '填你的', '阿里大于公钥', 0, NULL, NULL),
(42, 'alisms_access_key_secret', 'sms', '填你的', '阿里大鱼私钥', 0, NULL, NULL),
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
(65, 'logo_title', 'site', 'EasyAdmin', 'LOGO标题', 0, NULL, NULL),
(66, 'logo_image', 'site', '/favicon.ico', 'logo图片', 0, NULL, NULL),
(68, 'site_name', 'site', 'EasyAdmin后台系统', '站点名称', 0, NULL, NULL),
(69, 'site_ico', 'site', '填你的', '浏览器图标', 0, NULL, NULL),
(70, 'site_copyright', 'site', '填你的', '版权信息', 0, NULL, NULL),
(71, 'site_beian', 'site', '填你的', '备案信息', 0, NULL, NULL),
(72, 'site_version', 'site', '2.0.0', '版本信息', 0, NULL, NULL),
(75, 'sms_type', 'sms', 'alisms', '短信类型', 0, NULL, NULL),
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
(87, 'qnoss_domain', 'upload', '填你的', '访问域名', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ea_system_log_202201`
--

CREATE TABLE `ea_system_log_202201` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `admin_id` int(10) UNSIGNED DEFAULT '0' COMMENT '管理员ID',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `method` varchar(50) NOT NULL COMMENT '请求方法',
  `title` varchar(100) DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) DEFAULT '' COMMENT 'User-Agent',
  `create_time` int(10) DEFAULT NULL COMMENT '操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台操作日志表 - 202201' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `ea_system_log_202201`
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
(654, 1, '/admin/system.menu/add?id=261', 'post', '', '{\"id\":\"261\",\"pid\":\"261\",\"title\":\"反馈列表\",\"href\":\"feedback\\/index\",\"icon\":\"fa fa-align-center\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 1642141997);

-- --------------------------------------------------------

--
-- 表的结构 `ea_system_menu`
--

CREATE TABLE `ea_system_menu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pid` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `remark` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统菜单表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `ea_system_menu`
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
(262, 261, '反馈列表', 'fa fa-align-center', 'feedback/index', '', '_self', 0, 1, '', 1642141997, 1642141997, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ea_system_node`
--

CREATE TABLE `ea_system_node` (
  `id` int(11) UNSIGNED NOT NULL,
  `node` varchar(100) DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) DEFAULT NULL COMMENT '节点标题',
  `type` tinyint(1) DEFAULT '3' COMMENT '节点类型（1：控制器，2：节点）',
  `is_auth` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '是否启动RBAC权限控制',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统节点表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `ea_system_node`
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
(110, 'user/modify', '属性修改', 2, 1, 1642132817, 1642132817);

-- --------------------------------------------------------

--
-- 表的结构 `ea_system_quick`
--

CREATE TABLE `ea_system_quick` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(20) NOT NULL COMMENT '快捷入口名称',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `href` varchar(255) DEFAULT NULL COMMENT '快捷链接',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统快捷入口表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `ea_system_quick`
--

INSERT INTO `ea_system_quick` (`id`, `title`, `icon`, `href`, `sort`, `status`, `remark`, `create_time`, `update_time`, `delete_time`) VALUES
(1, '管理员管理', 'fa fa-user', 'system.admin/index', 0, 1, '', 1589624097, 1589624792, NULL),
(2, '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', 0, 1, '', 1589624772, 1589624781, NULL),
(3, '菜单管理', 'fa fa-tree', 'system.menu/index', 0, 1, NULL, 1589624097, 1589624792, NULL),
(6, '节点管理', 'fa fa-list', 'system.node/index', 0, 1, NULL, 1589624772, 1589624781, NULL),
(7, '配置管理', 'fa fa-asterisk', 'system.config/index', 0, 1, NULL, 1589624097, 1589624792, NULL),
(8, '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', 0, 1, NULL, 1589624772, 1589624781, NULL),
(10, '商品分类', 'fa fa-calendar-check-o', 'mall.cate/index', 0, 1, NULL, 1589624097, 1589624792, NULL),
(11, '商品管理', 'fa fa-list', 'mall.goods/index', 0, 1, NULL, 1589624772, 1589624781, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ea_system_uploadfile`
--

CREATE TABLE `ea_system_uploadfile` (
  `id` int(20) UNSIGNED NOT NULL COMMENT 'ID',
  `upload_type` varchar(20) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `original_name` varchar(255) DEFAULT NULL COMMENT '文件原名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `image_width` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `image_height` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `image_type` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `image_frames` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `mime_type` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `file_size` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小',
  `file_ext` varchar(100) DEFAULT NULL,
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int(10) DEFAULT NULL COMMENT '创建日期',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `upload_time` int(10) DEFAULT NULL COMMENT '上传时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传文件表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `ea_system_uploadfile`
--

INSERT INTO `ea_system_uploadfile` (`id`, `upload_type`, `original_name`, `url`, `image_width`, `image_height`, `image_type`, `image_frames`, `mime_type`, `file_size`, `file_ext`, `sha1`, `create_time`, `update_time`, `upload_time`) VALUES
(286, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/0a6de1ac058ee134301501899b84ecb1.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL),
(287, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/46d7384f04a3bed331715e86a4095d15.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL),
(288, 'alioss', 'image/x-icon', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/7d32671f4c1d1b01b0b28f45205763f9.ico', '', '', '', 0, 'image/x-icon', 0, 'ico', '', NULL, NULL, NULL),
(289, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/28cefa547f573a951bcdbbeb1396b06f.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL),
(290, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/2c412adf1b30c8be3a913e603c7b6e4a.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL),
(296, 'txcos', '22243.jpg', 'https://easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com/upload/20191114/2381eaf81208ac188fa994b6f2579953.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1573712153, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ea_user`
--

CREATE TABLE `ea_user` (
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户UID',
  `username` varchar(64) NOT NULL COMMENT '用户名 {text}',
  `phone` varchar(16) NOT NULL COMMENT '手机号 {text}',
  `avatar` text COMMENT '头像照片 最多五张 {images}',
  `remark` varchar(255) DEFAULT NULL COMMENT '个人介绍 {textarea}',
  `longitude` varchar(255) DEFAULT NULL COMMENT '经度 {text}',
  `dimension` varchar(255) DEFAULT NULL COMMENT '维度 {text}',
  `edu` int(1) DEFAULT NULL COMMENT '学历 {radio} (1:初中, 2:中专, 3:高中, 4:大专, 5:本科, 6:硕士, 7:博士, 8:博士后)',
  `sex` int(1) DEFAULT '0' COMMENT '性别 {radio} (0:未知, 1:男, 2:女)',
  `birthday` date DEFAULT NULL COMMENT '生日 {text}',
  `height` int(3) DEFAULT NULL COMMENT '身高 {text}',
  `city` varchar(255) DEFAULT NULL COMMENT '城市 {text}',
  `address` varchar(255) DEFAULT NULL COMMENT '居住地 {text}',
  `marriage` int(1) DEFAULT '1' COMMENT '婚姻状况 {radio} (1:未婚, 2:离异, 3:丧偶, 4:已婚)',
  `children` int(1) DEFAULT '0' COMMENT '子女状况 {radio} (0:没有, 1:有)',
  `native` varchar(64) DEFAULT NULL COMMENT '籍贯 {text}',
  `nation` varchar(32) DEFAULT NULL COMMENT '民族 {text}',
  `blood` int(1) DEFAULT '5' COMMENT '血型 {radio} (1:A, 2:B, 3:AB, 4:0, 5:其他)',
  `weight` int(3) DEFAULT NULL COMMENT '体重 {text}',
  `occupation` varchar(32) DEFAULT NULL COMMENT '职业 {text}',
  `school` varchar(255) DEFAULT NULL COMMENT '毕业学校 {text}',
  `major` varchar(255) DEFAULT NULL COMMENT '所学专业 {text}',
  `house` int(1) DEFAULT NULL COMMENT '购房情况 {radio} (1:已购房无贷款, 2:已购房有贷款, 3:与父母同住, 4:暂未购房, 5:租房)',
  `car_buy` int(1) DEFAULT NULL COMMENT '购车情况 {radio} (1:已买车, 2:未买车)',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '会员状态',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `ea_user_pay`
--

CREATE TABLE `ea_user_pay` (
  `pay_id` bigint(20) UNSIGNED NOT NULL COMMENT '数据ID',
  `order_id` varchar(32) NOT NULL COMMENT '订单ID',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '下单会员ID',
  `buy_user_id` bigint(20) UNSIGNED NOT NULL COMMENT '购买会员ID',
  `subject` varchar(255) NOT NULL COMMENT '订单标题 {text}',
  `total` float(11,2) NOT NULL COMMENT '支付金额 {text}',
  `flag` int(1) NOT NULL DEFAULT '0' COMMENT '支付状态 {radio} (1:支付完成, 0:未支付)',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='VIP购买表' ROW_FORMAT=COMPACT;

--
-- 转储表的索引
--

--
-- 表的索引 `ea_event`
--
ALTER TABLE `ea_event`
  ADD PRIMARY KEY (`event_id`);

--
-- 表的索引 `ea_event_join`
--
ALTER TABLE `ea_event_join`
  ADD PRIMARY KEY (`join_id`);

--
-- 表的索引 `ea_feedback`
--
ALTER TABLE `ea_feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- 表的索引 `ea_mall_cate`
--
ALTER TABLE `ea_mall_cate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`) USING BTREE;

--
-- 表的索引 `ea_mall_goods`
--
ALTER TABLE `ea_mall_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cate_id`);

--
-- 表的索引 `ea_news`
--
ALTER TABLE `ea_news`
  ADD PRIMARY KEY (`news_id`);

--
-- 表的索引 `ea_system_admin`
--
ALTER TABLE `ea_system_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`) USING BTREE,
  ADD KEY `phone` (`phone`);

--
-- 表的索引 `ea_system_auth`
--
ALTER TABLE `ea_system_auth`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`) USING BTREE;

--
-- 表的索引 `ea_system_auth_node`
--
ALTER TABLE `ea_system_auth_node`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_system_auth_auth` (`auth_id`) USING BTREE,
  ADD KEY `index_system_auth_node` (`node_id`) USING BTREE;

--
-- 表的索引 `ea_system_config`
--
ALTER TABLE `ea_system_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `group` (`group`);

--
-- 表的索引 `ea_system_log_202201`
--
ALTER TABLE `ea_system_log_202201`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ea_system_menu`
--
ALTER TABLE `ea_system_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `href` (`href`);

--
-- 表的索引 `ea_system_node`
--
ALTER TABLE `ea_system_node`
  ADD PRIMARY KEY (`id`),
  ADD KEY `node` (`node`) USING BTREE;

--
-- 表的索引 `ea_system_quick`
--
ALTER TABLE `ea_system_quick`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ea_system_uploadfile`
--
ALTER TABLE `ea_system_uploadfile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_type` (`upload_type`),
  ADD KEY `original_name` (`original_name`);

--
-- 表的索引 `ea_user`
--
ALTER TABLE `ea_user`
  ADD PRIMARY KEY (`user_id`);

--
-- 表的索引 `ea_user_pay`
--
ALTER TABLE `ea_user_pay`
  ADD PRIMARY KEY (`pay_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `ea_event`
--
ALTER TABLE `ea_event`
  MODIFY `event_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '活动ID';

--
-- 使用表AUTO_INCREMENT `ea_event_join`
--
ALTER TABLE `ea_event_join`
  MODIFY `join_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '数据ID';

--
-- 使用表AUTO_INCREMENT `ea_feedback`
--
ALTER TABLE `ea_feedback`
  MODIFY `feedback_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '数据ID';

--
-- 使用表AUTO_INCREMENT `ea_mall_cate`
--
ALTER TABLE `ea_mall_cate`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `ea_mall_goods`
--
ALTER TABLE `ea_mall_goods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `ea_news`
--
ALTER TABLE `ea_news`
  MODIFY `news_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '新闻ID';

--
-- 使用表AUTO_INCREMENT `ea_system_admin`
--
ALTER TABLE `ea_system_admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `ea_system_auth`
--
ALTER TABLE `ea_system_auth`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `ea_system_auth_node`
--
ALTER TABLE `ea_system_auth_node`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- 使用表AUTO_INCREMENT `ea_system_config`
--
ALTER TABLE `ea_system_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- 使用表AUTO_INCREMENT `ea_system_log_202201`
--
ALTER TABLE `ea_system_log_202201`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=655;

--
-- 使用表AUTO_INCREMENT `ea_system_menu`
--
ALTER TABLE `ea_system_menu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;

--
-- 使用表AUTO_INCREMENT `ea_system_node`
--
ALTER TABLE `ea_system_node`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- 使用表AUTO_INCREMENT `ea_system_quick`
--
ALTER TABLE `ea_system_quick`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `ea_system_uploadfile`
--
ALTER TABLE `ea_system_uploadfile`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=303;

--
-- 使用表AUTO_INCREMENT `ea_user`
--
ALTER TABLE `ea_user`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户UID';

--
-- 使用表AUTO_INCREMENT `ea_user_pay`
--
ALTER TABLE `ea_user_pay`
  MODIFY `pay_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '数据ID';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
