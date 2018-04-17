-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 08 月 20 日 07:46
-- 服务器版本: 5.5.20
-- PHP 版本: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `nfxdny`
--

-- --------------------------------------------------------

--
-- 表的结构 `nfx_ad`
--

CREATE TABLE IF NOT EXISTS `nfx_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `nfx_asset`
--

CREATE TABLE IF NOT EXISTS `nfx_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `nfx_auth_access`
--

CREATE TABLE IF NOT EXISTS `nfx_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- --------------------------------------------------------

--
-- 表的结构 `nfx_auth_rule`
--

CREATE TABLE IF NOT EXISTS `nfx_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='权限规则表' AUTO_INCREMENT=165 ;

--
-- 转存表中的数据 `nfx_auth_rule`
--

INSERT INTO `nfx_auth_rule` (`id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition`) VALUES
(1, 'Admin', 'admin_url', 'admin/content/default', NULL, '内容管理', 1, ''),
(2, 'Api', 'admin_url', 'api/guestbookadmin/index', NULL, '所有留言', 1, ''),
(3, 'Api', 'admin_url', 'api/guestbookadmin/delete', NULL, '删除网站留言', 1, ''),
(4, 'Comment', 'admin_url', 'comment/commentadmin/index', NULL, '评论管理', 1, ''),
(5, 'Comment', 'admin_url', 'comment/commentadmin/delete', NULL, '删除评论', 1, ''),
(6, 'Comment', 'admin_url', 'comment/commentadmin/check', NULL, '评论审核', 1, ''),
(7, 'Portal', 'admin_url', 'portal/adminpost/index', NULL, '新闻管理', 1, ''),
(8, 'Portal', 'admin_url', 'portal/adminpost/listorders', NULL, '文章排序', 1, ''),
(9, 'Portal', 'admin_url', 'portal/adminpost/top', NULL, '文章置顶', 1, ''),
(10, 'Portal', 'admin_url', 'portal/adminpost/recommend', NULL, '文章推荐', 1, ''),
(11, 'Portal', 'admin_url', 'portal/adminpost/move', NULL, '批量移动', 1, ''),
(12, 'Portal', 'admin_url', 'portal/adminpost/check', NULL, '文章审核', 1, ''),
(13, 'Portal', 'admin_url', 'portal/adminpost/delete', NULL, '删除文章', 1, ''),
(14, 'Portal', 'admin_url', 'portal/adminpost/edit', NULL, '编辑文章', 1, ''),
(15, 'Portal', 'admin_url', 'portal/adminpost/edit_post', NULL, '提交编辑', 1, ''),
(16, 'Portal', 'admin_url', 'portal/adminpost/add', NULL, '添加文章', 1, ''),
(17, 'Portal', 'admin_url', 'portal/adminpost/add_post', NULL, '提交添加', 1, ''),
(18, 'Portal', 'admin_url', 'portal/adminterm/index', NULL, '分类管理', 1, ''),
(19, 'Portal', 'admin_url', 'portal/adminterm/listorders', NULL, '文章分类排序', 1, ''),
(20, 'Portal', 'admin_url', 'portal/adminterm/delete', NULL, '删除分类', 1, ''),
(21, 'Portal', 'admin_url', 'portal/adminterm/edit', NULL, '编辑分类', 1, ''),
(22, 'Portal', 'admin_url', 'portal/adminterm/edit_post', NULL, '提交编辑', 1, ''),
(23, 'Portal', 'admin_url', 'portal/adminterm/add', NULL, '添加分类', 1, ''),
(24, 'Portal', 'admin_url', 'portal/adminterm/add_post', NULL, '提交添加', 1, ''),
(25, 'Portal', 'admin_url', 'portal/adminpage/index', NULL, '页面管理', 1, ''),
(26, 'Portal', 'admin_url', 'portal/adminpage/listorders', NULL, '页面排序', 1, ''),
(27, 'Portal', 'admin_url', 'portal/adminpage/delete', NULL, '删除页面', 1, ''),
(28, 'Portal', 'admin_url', 'portal/adminpage/edit', NULL, '编辑页面', 1, ''),
(29, 'Portal', 'admin_url', 'portal/adminpage/edit_post', NULL, '提交编辑', 1, ''),
(30, 'Portal', 'admin_url', 'portal/adminpage/add', NULL, '添加页面', 1, ''),
(31, 'Portal', 'admin_url', 'portal/adminpage/add_post', NULL, '提交添加', 1, ''),
(32, 'Admin', 'admin_url', 'admin/recycle/default', NULL, '回收站', 1, ''),
(33, 'Portal', 'admin_url', 'portal/adminpost/recyclebin', NULL, '文章回收', 1, ''),
(34, 'Portal', 'admin_url', 'portal/adminpost/restore', NULL, '文章还原', 1, ''),
(35, 'Portal', 'admin_url', 'portal/adminpost/clean', NULL, '彻底删除', 1, ''),
(36, 'Portal', 'admin_url', 'portal/adminpage/recyclebin', NULL, '页面回收', 1, ''),
(37, 'Portal', 'admin_url', 'portal/adminpage/clean', NULL, '彻底删除', 1, ''),
(38, 'Portal', 'admin_url', 'portal/adminpage/restore', NULL, '页面还原', 1, ''),
(39, 'Admin', 'admin_url', 'admin/extension/default', NULL, '扩展工具', 1, ''),
(40, 'Admin', 'admin_url', 'admin/backup/default', NULL, '备份管理', 1, ''),
(41, 'Admin', 'admin_url', 'admin/backup/restore', NULL, '数据还原', 1, ''),
(42, 'Admin', 'admin_url', 'admin/backup/index', NULL, '数据备份', 1, ''),
(43, 'Admin', 'admin_url', 'admin/backup/index_post', NULL, '提交数据备份', 1, ''),
(44, 'Admin', 'admin_url', 'admin/backup/download', NULL, '下载备份', 1, ''),
(45, 'Admin', 'admin_url', 'admin/backup/del_backup', NULL, '删除备份', 1, ''),
(46, 'Admin', 'admin_url', 'admin/backup/import', NULL, '数据备份导入', 1, ''),
(47, 'Admin', 'admin_url', 'admin/plugin/index', NULL, '插件管理', 1, ''),
(48, 'Admin', 'admin_url', 'admin/plugin/toggle', NULL, '插件启用切换', 1, ''),
(49, 'Admin', 'admin_url', 'admin/plugin/setting', NULL, '插件设置', 1, ''),
(50, 'Admin', 'admin_url', 'admin/plugin/setting_post', NULL, '插件设置提交', 1, ''),
(51, 'Admin', 'admin_url', 'admin/plugin/install', NULL, '插件安装', 1, ''),
(52, 'Admin', 'admin_url', 'admin/plugin/uninstall', NULL, '插件卸载', 1, ''),
(53, 'Admin', 'admin_url', 'admin/slide/default', NULL, '幻灯片', 1, ''),
(54, 'Admin', 'admin_url', 'admin/slide/index', NULL, '幻灯片管理', 1, ''),
(55, 'Admin', 'admin_url', 'admin/slide/listorders', NULL, '幻灯片排序', 1, ''),
(56, 'Admin', 'admin_url', 'admin/slide/toggle', NULL, '幻灯片显示切换', 1, ''),
(57, 'Admin', 'admin_url', 'admin/slide/delete', NULL, '删除幻灯片', 1, ''),
(58, 'Admin', 'admin_url', 'admin/slide/edit', NULL, '编辑幻灯片', 1, ''),
(59, 'Admin', 'admin_url', 'admin/slide/edit_post', NULL, '提交编辑', 1, ''),
(60, 'Admin', 'admin_url', 'admin/slide/add', NULL, '添加幻灯片', 1, ''),
(61, 'Admin', 'admin_url', 'admin/slide/add_post', NULL, '提交添加', 1, ''),
(62, 'Admin', 'admin_url', 'admin/slidecat/index', NULL, '幻灯片分类', 1, ''),
(63, 'Admin', 'admin_url', 'admin/slidecat/delete', NULL, '删除分类', 1, ''),
(64, 'Admin', 'admin_url', 'admin/slidecat/edit', NULL, '编辑分类', 1, ''),
(65, 'Admin', 'admin_url', 'admin/slidecat/edit_post', NULL, '提交编辑', 1, ''),
(66, 'Admin', 'admin_url', 'admin/slidecat/add', NULL, '添加分类', 1, ''),
(67, 'Admin', 'admin_url', 'admin/slidecat/add_post', NULL, '提交添加', 1, ''),
(68, 'Admin', 'admin_url', 'admin/ad/index', NULL, '网站广告', 1, ''),
(69, 'Admin', 'admin_url', 'admin/ad/toggle', NULL, '广告显示切换', 1, ''),
(70, 'Admin', 'admin_url', 'admin/ad/delete', NULL, '删除广告', 1, ''),
(71, 'Admin', 'admin_url', 'admin/ad/edit', NULL, '编辑广告', 1, ''),
(72, 'Admin', 'admin_url', 'admin/ad/edit_post', NULL, '提交编辑', 1, ''),
(73, 'Admin', 'admin_url', 'admin/ad/add', NULL, '添加广告', 1, ''),
(74, 'Admin', 'admin_url', 'admin/ad/add_post', NULL, '提交添加', 1, ''),
(75, 'Admin', 'admin_url', 'admin/link/index', NULL, '友情链接', 1, ''),
(76, 'Admin', 'admin_url', 'admin/link/listorders', NULL, '友情链接排序', 1, ''),
(77, 'Admin', 'admin_url', 'admin/link/toggle', NULL, '友链显示切换', 1, ''),
(78, 'Admin', 'admin_url', 'admin/link/delete', NULL, '删除友情链接', 1, ''),
(79, 'Admin', 'admin_url', 'admin/link/edit', NULL, '编辑友情链接', 1, ''),
(80, 'Admin', 'admin_url', 'admin/link/edit_post', NULL, '提交编辑', 1, ''),
(81, 'Admin', 'admin_url', 'admin/link/add', NULL, '添加友情链接', 1, ''),
(82, 'Admin', 'admin_url', 'admin/link/add_post', NULL, '提交添加', 1, ''),
(83, 'Api', 'admin_url', 'api/oauthadmin/setting', NULL, '第三方登陆', 1, ''),
(84, 'Api', 'admin_url', 'api/oauthadmin/setting_post', NULL, '提交设置', 1, ''),
(85, 'Admin', 'admin_url', 'admin/menu/default', NULL, '菜单管理', 1, ''),
(86, 'Admin', 'admin_url', 'admin/navcat/default1', NULL, '前台菜单', 1, ''),
(87, 'Admin', 'admin_url', 'admin/nav/index', NULL, '菜单管理', 1, ''),
(88, 'Admin', 'admin_url', 'admin/nav/listorders', NULL, '前台导航排序', 1, ''),
(89, 'Admin', 'admin_url', 'admin/nav/delete', NULL, '删除菜单', 1, ''),
(90, 'Admin', 'admin_url', 'admin/nav/edit', NULL, '编辑菜单', 1, ''),
(91, 'Admin', 'admin_url', 'admin/nav/edit_post', NULL, '提交编辑', 1, ''),
(92, 'Admin', 'admin_url', 'admin/nav/add', NULL, '添加菜单', 1, ''),
(93, 'Admin', 'admin_url', 'admin/nav/add_post', NULL, '提交添加', 1, ''),
(94, 'Admin', 'admin_url', 'admin/navcat/index', NULL, '菜单分类', 1, ''),
(95, 'Admin', 'admin_url', 'admin/navcat/delete', NULL, '删除分类', 1, ''),
(96, 'Admin', 'admin_url', 'admin/navcat/edit', NULL, '编辑分类', 1, ''),
(97, 'Admin', 'admin_url', 'admin/navcat/edit_post', NULL, '提交编辑', 1, ''),
(98, 'Admin', 'admin_url', 'admin/navcat/add', NULL, '添加分类', 1, ''),
(99, 'Admin', 'admin_url', 'admin/navcat/add_post', NULL, '提交添加', 1, ''),
(100, 'Admin', 'admin_url', 'admin/menu/index', NULL, '后台菜单', 1, ''),
(101, 'Admin', 'admin_url', 'admin/menu/add', NULL, '添加菜单', 1, ''),
(102, 'Admin', 'admin_url', 'admin/menu/add_post', NULL, '提交添加', 1, ''),
(103, 'Admin', 'admin_url', 'admin/menu/listorders', NULL, '后台菜单排序', 1, ''),
(104, 'Admin', 'admin_url', 'admin/menu/export_menu', NULL, '菜单备份', 1, ''),
(105, 'Admin', 'admin_url', 'admin/menu/edit', NULL, '编辑菜单', 1, ''),
(106, 'Admin', 'admin_url', 'admin/menu/edit_post', NULL, '提交编辑', 1, ''),
(107, 'Admin', 'admin_url', 'admin/menu/delete', NULL, '删除菜单', 1, ''),
(108, 'Admin', 'admin_url', 'admin/menu/lists', NULL, '所有菜单', 1, ''),
(109, 'Admin', 'admin_url', 'admin/setting/default', NULL, '设置', 1, ''),
(110, 'Admin', 'admin_url', 'admin/setting/userdefault', NULL, '个人信息', 1, ''),
(111, 'Admin', 'admin_url', 'admin/user/userinfo', NULL, '修改信息', 1, ''),
(112, 'Admin', 'admin_url', 'admin/user/userinfo_post', NULL, '修改信息提交', 1, ''),
(113, 'Admin', 'admin_url', 'admin/setting/password', NULL, '修改密码', 1, ''),
(114, 'Admin', 'admin_url', 'admin/setting/password_post', NULL, '提交修改', 1, ''),
(115, 'Admin', 'admin_url', 'admin/setting/site', NULL, '网站信息', 1, ''),
(116, 'Admin', 'admin_url', 'admin/setting/site_post', NULL, '提交修改', 1, ''),
(117, 'Admin', 'admin_url', 'admin/route/index', NULL, '路由列表', 1, ''),
(118, 'Admin', 'admin_url', 'admin/route/add', NULL, '路由添加', 1, ''),
(119, 'Admin', 'admin_url', 'admin/route/add_post', NULL, '路由添加提交', 1, ''),
(120, 'Admin', 'admin_url', 'admin/route/edit', NULL, '路由编辑', 1, ''),
(121, 'Admin', 'admin_url', 'admin/route/edit_post', NULL, '路由编辑提交', 1, ''),
(122, 'Admin', 'admin_url', 'admin/route/delete', NULL, '路由删除', 1, ''),
(123, 'Admin', 'admin_url', 'admin/route/ban', NULL, '路由禁止', 1, ''),
(124, 'Admin', 'admin_url', 'admin/route/open', NULL, '路由启用', 1, ''),
(125, 'Admin', 'admin_url', 'admin/route/listorders', NULL, '路由排序', 1, ''),
(126, 'Admin', 'admin_url', 'admin/mailer/default', NULL, '邮箱配置', 1, ''),
(127, 'Admin', 'admin_url', 'admin/mailer/index', NULL, 'SMTP配置', 1, ''),
(128, 'Admin', 'admin_url', 'admin/mailer/index_post', NULL, '提交配置', 1, ''),
(129, 'Admin', 'admin_url', 'admin/mailer/active', NULL, '邮件模板', 1, ''),
(130, 'Admin', 'admin_url', 'admin/mailer/active_post', NULL, '提交模板', 1, ''),
(131, 'Admin', 'admin_url', 'admin/setting/clearcache', NULL, '清除缓存', 1, ''),
(132, 'User', 'admin_url', 'user/indexadmin/default', NULL, '用户管理', 1, ''),
(133, 'User', 'admin_url', 'user/indexadmin/default1', NULL, '用户组', 1, ''),
(134, 'User', 'admin_url', 'user/indexadmin/index', NULL, '本站用户', 1, ''),
(135, 'User', 'admin_url', 'user/indexadmin/ban', NULL, '拉黑会员', 1, ''),
(136, 'User', 'admin_url', 'user/indexadmin/cancelban', NULL, '启用会员', 1, ''),
(137, 'User', 'admin_url', 'user/oauthadmin/index', NULL, '第三方用户', 1, ''),
(138, 'User', 'admin_url', 'user/oauthadmin/delete', NULL, '第三方用户解绑', 1, ''),
(139, 'User', 'admin_url', 'user/indexadmin/default3', NULL, '管理组', 1, ''),
(140, 'Admin', 'admin_url', 'admin/rbac/index', NULL, '角色管理', 1, ''),
(141, 'Admin', 'admin_url', 'admin/rbac/member', NULL, '成员管理', 1, ''),
(142, 'Admin', 'admin_url', 'admin/rbac/authorize', NULL, '权限设置', 1, ''),
(143, 'Admin', 'admin_url', 'admin/rbac/authorize_post', NULL, '提交设置', 1, ''),
(144, 'Admin', 'admin_url', 'admin/rbac/roleedit', NULL, '编辑角色', 1, ''),
(145, 'Admin', 'admin_url', 'admin/rbac/roleedit_post', NULL, '提交编辑', 1, ''),
(146, 'Admin', 'admin_url', 'admin/rbac/roledelete', NULL, '删除角色', 1, ''),
(147, 'Admin', 'admin_url', 'admin/rbac/roleadd', NULL, '添加角色', 1, ''),
(148, 'Admin', 'admin_url', 'admin/rbac/roleadd_post', NULL, '提交添加', 1, ''),
(149, 'Admin', 'admin_url', 'admin/user/index', NULL, '管理员', 1, ''),
(150, 'Admin', 'admin_url', 'admin/user/delete', NULL, '删除管理员', 1, ''),
(151, 'Admin', 'admin_url', 'admin/user/edit', NULL, '管理员编辑', 1, ''),
(152, 'Admin', 'admin_url', 'admin/user/edit_post', NULL, '编辑提交', 1, ''),
(153, 'Admin', 'admin_url', 'admin/user/add', NULL, '管理员添加', 1, ''),
(154, 'Admin', 'admin_url', 'admin/user/add_post', NULL, '添加提交', 1, ''),
(155, 'Admin', 'admin_url', 'admin/plugin/update', NULL, '插件更新', 1, ''),
(156, 'Admin', 'admin_url', 'admin/storage/index', NULL, '文件存储', 1, ''),
(157, 'Admin', 'admin_url', 'admin/storage/setting_post', NULL, '文件存储设置提交', 1, ''),
(158, 'Admin', 'admin_url', 'admin/slide/ban', NULL, '禁用幻灯片', 1, ''),
(159, 'Admin', 'admin_url', 'admin/slide/cancelban', NULL, '启用幻灯片', 1, ''),
(160, 'Admin', 'admin_url', 'admin/user/ban', NULL, '禁用管理员', 1, ''),
(161, 'Admin', 'admin_url', 'admin/user/cancelban', NULL, '启用管理员', 1, ''),
(162, 'Admin', 'admin_url', 'admin/variable/index', NULL, '变量管理', 1, ''),
(163, 'Portal', 'admin_url', 'portal/adminproduct/index', NULL, '产品管理', 1, ''),
(164, 'Portal', 'admin_url', 'portal/adminpicture/index', NULL, '图集管理', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `nfx_comments`
--

CREATE TABLE IF NOT EXISTS `nfx_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `nfx_common_action_log`
--

CREATE TABLE IF NOT EXISTS `nfx_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `nfx_guestbook`
--

CREATE TABLE IF NOT EXISTS `nfx_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `company_name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `company_address` varchar(255) NOT NULL COMMENT '公司地址',
  `company_tel` varchar(20) DEFAULT NULL COMMENT '公司电话',
  `company_fax` varchar(20) NOT NULL COMMENT '公司传真',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='留言表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `nfx_guestbook`
--

INSERT INTO `nfx_guestbook` (`id`, `full_name`, `company_name`, `company_address`, `company_tel`, `company_fax`, `email`, `title`, `msg`, `createtime`, `status`) VALUES
(1, '111', '111', '111', '111', '111', '111@qq.com', NULL, '111', '2016-08-20 13:14:48', 1);

-- --------------------------------------------------------

--
-- 表的结构 `nfx_links`
--

CREATE TABLE IF NOT EXISTS `nfx_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='友情链接表' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `nfx_menu`
--

CREATE TABLE IF NOT EXISTS `nfx_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='后台菜单表' AUTO_INCREMENT=165 ;

--
-- 转存表中的数据 `nfx_menu`
--

INSERT INTO `nfx_menu` (`id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder`) VALUES
(1, 0, 'Admin', 'Content', 'default', '', 0, 1, '内容管理', 'th', '', 30),
(2, 1, 'Api', 'Guestbookadmin', 'index', '', 1, 1, '所有留言', '', '', 0),
(3, 2, 'Api', 'Guestbookadmin', 'delete', '', 1, 0, '删除网站留言', '', '', 0),
(4, 1, 'Comment', 'Commentadmin', 'index', '', 1, 0, '评论管理', '', '', 0),
(5, 4, 'Comment', 'Commentadmin', 'delete', '', 1, 0, '删除评论', '', '', 0),
(6, 4, 'Comment', 'Commentadmin', 'check', '', 1, 0, '评论审核', '', '', 0),
(7, 1, 'Portal', 'AdminPost', 'index', '', 1, 1, '新闻管理', '', '', 1),
(8, 7, 'Portal', 'AdminPost', 'listorders', '', 1, 0, '文章排序', '', '', 0),
(9, 7, 'Portal', 'AdminPost', 'top', '', 1, 0, '文章置顶', '', '', 0),
(10, 7, 'Portal', 'AdminPost', 'recommend', '', 1, 0, '文章推荐', '', '', 0),
(11, 7, 'Portal', 'AdminPost', 'move', '', 1, 0, '批量移动', '', '', 1000),
(12, 7, 'Portal', 'AdminPost', 'check', '', 1, 0, '文章审核', '', '', 1000),
(13, 7, 'Portal', 'AdminPost', 'delete', '', 1, 0, '删除文章', '', '', 1000),
(14, 7, 'Portal', 'AdminPost', 'edit', '', 1, 0, '编辑文章', '', '', 1000),
(15, 14, 'Portal', 'AdminPost', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(16, 7, 'Portal', 'AdminPost', 'add', '', 1, 0, '添加文章', '', '', 1000),
(17, 16, 'Portal', 'AdminPost', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(18, 1, 'Portal', 'AdminTerm', 'index', '', 0, 1, '分类管理', '', '', 2),
(19, 18, 'Portal', 'AdminTerm', 'listorders', '', 1, 0, '文章分类排序', '', '', 0),
(20, 18, 'Portal', 'AdminTerm', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(21, 18, 'Portal', 'AdminTerm', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(22, 21, 'Portal', 'AdminTerm', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(23, 18, 'Portal', 'AdminTerm', 'add', '', 1, 0, '添加分类', '', '', 1000),
(24, 23, 'Portal', 'AdminTerm', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(25, 1, 'Portal', 'AdminPage', 'index', '', 1, 1, '页面管理', '', '', 3),
(26, 25, 'Portal', 'AdminPage', 'listorders', '', 1, 0, '页面排序', '', '', 0),
(27, 25, 'Portal', 'AdminPage', 'delete', '', 1, 0, '删除页面', '', '', 1000),
(28, 25, 'Portal', 'AdminPage', 'edit', '', 1, 0, '编辑页面', '', '', 1000),
(29, 28, 'Portal', 'AdminPage', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(30, 25, 'Portal', 'AdminPage', 'add', '', 1, 0, '添加页面', '', '', 1000),
(31, 30, 'Portal', 'AdminPage', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(32, 1, 'Admin', 'Recycle', 'default', '', 1, 1, '回收站', '', '', 4),
(33, 32, 'Portal', 'AdminPost', 'recyclebin', '', 1, 1, '文章回收', '', '', 0),
(34, 33, 'Portal', 'AdminPost', 'restore', '', 1, 0, '文章还原', '', '', 1000),
(35, 33, 'Portal', 'AdminPost', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(36, 32, 'Portal', 'AdminPage', 'recyclebin', '', 1, 1, '页面回收', '', '', 1),
(37, 36, 'Portal', 'AdminPage', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(38, 36, 'Portal', 'AdminPage', 'restore', '', 1, 0, '页面还原', '', '', 1000),
(39, 0, 'Admin', 'Extension', 'default', '', 0, 1, '扩展工具', 'cloud', '', 40),
(40, 39, 'Admin', 'Backup', 'default', '', 1, 1, '备份管理', '', '', 0),
(41, 40, 'Admin', 'Backup', 'restore', '', 1, 1, '数据还原', '', '', 0),
(42, 40, 'Admin', 'Backup', 'index', '', 1, 1, '数据备份', '', '', 0),
(43, 42, 'Admin', 'Backup', 'index_post', '', 1, 0, '提交数据备份', '', '', 0),
(44, 40, 'Admin', 'Backup', 'download', '', 1, 0, '下载备份', '', '', 1000),
(45, 40, 'Admin', 'Backup', 'del_backup', '', 1, 0, '删除备份', '', '', 1000),
(46, 40, 'Admin', 'Backup', 'import', '', 1, 0, '数据备份导入', '', '', 1000),
(47, 39, 'Admin', 'Plugin', 'index', '', 1, 0, '插件管理', '', '', 0),
(48, 47, 'Admin', 'Plugin', 'toggle', '', 1, 0, '插件启用切换', '', '', 0),
(49, 47, 'Admin', 'Plugin', 'setting', '', 1, 0, '插件设置', '', '', 0),
(50, 49, 'Admin', 'Plugin', 'setting_post', '', 1, 0, '插件设置提交', '', '', 0),
(51, 47, 'Admin', 'Plugin', 'install', '', 1, 0, '插件安装', '', '', 0),
(52, 47, 'Admin', 'Plugin', 'uninstall', '', 1, 0, '插件卸载', '', '', 0),
(53, 39, 'Admin', 'Slide', 'default', '', 1, 1, '幻灯片', '', '', 1),
(54, 53, 'Admin', 'Slide', 'index', '', 1, 1, '幻灯片管理', '', '', 0),
(55, 54, 'Admin', 'Slide', 'listorders', '', 1, 0, '幻灯片排序', '', '', 0),
(56, 54, 'Admin', 'Slide', 'toggle', '', 1, 0, '幻灯片显示切换', '', '', 0),
(57, 54, 'Admin', 'Slide', 'delete', '', 1, 0, '删除幻灯片', '', '', 1000),
(58, 54, 'Admin', 'Slide', 'edit', '', 1, 0, '编辑幻灯片', '', '', 1000),
(59, 58, 'Admin', 'Slide', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(60, 54, 'Admin', 'Slide', 'add', '', 1, 0, '添加幻灯片', '', '', 1000),
(61, 60, 'Admin', 'Slide', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(62, 53, 'Admin', 'Slidecat', 'index', '', 1, 1, '幻灯片分类', '', '', 0),
(63, 62, 'Admin', 'Slidecat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(64, 62, 'Admin', 'Slidecat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(65, 64, 'Admin', 'Slidecat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(66, 62, 'Admin', 'Slidecat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(67, 66, 'Admin', 'Slidecat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(68, 39, 'Admin', 'Ad', 'index', '', 1, 1, '网站广告', '', '', 2),
(69, 68, 'Admin', 'Ad', 'toggle', '', 1, 0, '广告显示切换', '', '', 0),
(70, 68, 'Admin', 'Ad', 'delete', '', 1, 0, '删除广告', '', '', 1000),
(71, 68, 'Admin', 'Ad', 'edit', '', 1, 0, '编辑广告', '', '', 1000),
(72, 71, 'Admin', 'Ad', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(73, 68, 'Admin', 'Ad', 'add', '', 1, 0, '添加广告', '', '', 1000),
(74, 73, 'Admin', 'Ad', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(75, 39, 'Admin', 'Link', 'index', '', 0, 1, '友情链接', '', '', 3),
(76, 75, 'Admin', 'Link', 'listorders', '', 1, 0, '友情链接排序', '', '', 0),
(77, 75, 'Admin', 'Link', 'toggle', '', 1, 0, '友链显示切换', '', '', 0),
(78, 75, 'Admin', 'Link', 'delete', '', 1, 0, '删除友情链接', '', '', 1000),
(79, 75, 'Admin', 'Link', 'edit', '', 1, 0, '编辑友情链接', '', '', 1000),
(80, 79, 'Admin', 'Link', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(81, 75, 'Admin', 'Link', 'add', '', 1, 0, '添加友情链接', '', '', 1000),
(82, 81, 'Admin', 'Link', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(83, 39, 'Api', 'Oauthadmin', 'setting', '', 1, 0, '第三方登陆', 'leaf', '', 4),
(84, 83, 'Api', 'Oauthadmin', 'setting_post', '', 1, 0, '提交设置', '', '', 0),
(85, 0, 'Admin', 'Menu', 'default', '', 1, 1, '菜单管理', 'list', '', 20),
(86, 85, 'Admin', 'Navcat', 'default1', '', 1, 1, '前台菜单', '', '', 0),
(87, 86, 'Admin', 'Nav', 'index', '', 1, 1, '菜单管理', '', '', 0),
(88, 87, 'Admin', 'Nav', 'listorders', '', 1, 0, '前台导航排序', '', '', 0),
(89, 87, 'Admin', 'Nav', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(90, 87, 'Admin', 'Nav', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(91, 90, 'Admin', 'Nav', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(92, 87, 'Admin', 'Nav', 'add', '', 1, 0, '添加菜单', '', '', 1000),
(93, 92, 'Admin', 'Nav', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(94, 86, 'Admin', 'Navcat', 'index', '', 1, 1, '菜单分类', '', '', 0),
(95, 94, 'Admin', 'Navcat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(96, 94, 'Admin', 'Navcat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(97, 96, 'Admin', 'Navcat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(98, 94, 'Admin', 'Navcat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(99, 98, 'Admin', 'Navcat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(100, 85, 'Admin', 'Menu', 'index', '', 1, 1, '后台菜单', '', '', 0),
(101, 100, 'Admin', 'Menu', 'add', '', 1, 0, '添加菜单', '', '', 0),
(102, 101, 'Admin', 'Menu', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(103, 100, 'Admin', 'Menu', 'listorders', '', 1, 0, '后台菜单排序', '', '', 0),
(104, 100, 'Admin', 'Menu', 'export_menu', '', 1, 0, '菜单备份', '', '', 1000),
(105, 100, 'Admin', 'Menu', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(106, 105, 'Admin', 'Menu', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(107, 100, 'Admin', 'Menu', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(108, 100, 'Admin', 'Menu', 'lists', '', 1, 0, '所有菜单', '', '', 1000),
(109, 0, 'Admin', 'Setting', 'default', '', 0, 1, '设置', 'cogs', '', 0),
(110, 109, 'Admin', 'Setting', 'userdefault', '', 0, 1, '个人信息', '', '', 0),
(111, 110, 'Admin', 'User', 'userinfo', '', 1, 1, '修改信息', '', '', 0),
(112, 111, 'Admin', 'User', 'userinfo_post', '', 1, 0, '修改信息提交', '', '', 0),
(113, 110, 'Admin', 'Setting', 'password', '', 1, 1, '修改密码', '', '', 0),
(114, 113, 'Admin', 'Setting', 'password_post', '', 1, 0, '提交修改', '', '', 0),
(115, 109, 'Admin', 'Setting', 'site', '', 1, 1, '网站信息', '', '', 0),
(116, 115, 'Admin', 'Setting', 'site_post', '', 1, 0, '提交修改', '', '', 0),
(117, 115, 'Admin', 'Route', 'index', '', 1, 0, '路由列表', '', '', 0),
(118, 115, 'Admin', 'Route', 'add', '', 1, 0, '路由添加', '', '', 0),
(119, 118, 'Admin', 'Route', 'add_post', '', 1, 0, '路由添加提交', '', '', 0),
(120, 115, 'Admin', 'Route', 'edit', '', 1, 0, '路由编辑', '', '', 0),
(121, 120, 'Admin', 'Route', 'edit_post', '', 1, 0, '路由编辑提交', '', '', 0),
(122, 115, 'Admin', 'Route', 'delete', '', 1, 0, '路由删除', '', '', 0),
(123, 115, 'Admin', 'Route', 'ban', '', 1, 0, '路由禁止', '', '', 0),
(124, 115, 'Admin', 'Route', 'open', '', 1, 0, '路由启用', '', '', 0),
(125, 115, 'Admin', 'Route', 'listorders', '', 1, 0, '路由排序', '', '', 0),
(126, 109, 'Admin', 'Mailer', 'default', '', 1, 1, '邮箱配置', '', '', 0),
(127, 126, 'Admin', 'Mailer', 'index', '', 1, 1, 'SMTP配置', '', '', 0),
(128, 127, 'Admin', 'Mailer', 'index_post', '', 1, 0, '提交配置', '', '', 0),
(129, 126, 'Admin', 'Mailer', 'active', '', 1, 1, '邮件模板', '', '', 0),
(130, 129, 'Admin', 'Mailer', 'active_post', '', 1, 0, '提交模板', '', '', 0),
(131, 109, 'Admin', 'Setting', 'clearcache', '', 1, 1, '清除缓存', '', '', 1),
(132, 0, 'User', 'Indexadmin', 'default', '', 1, 1, '用户管理', 'group', '', 10),
(133, 132, 'User', 'Indexadmin', 'default1', '', 1, 1, '用户组', '', '', 0),
(134, 133, 'User', 'Indexadmin', 'index', '', 1, 1, '本站用户', 'leaf', '', 0),
(135, 134, 'User', 'Indexadmin', 'ban', '', 1, 0, '拉黑会员', '', '', 0),
(136, 134, 'User', 'Indexadmin', 'cancelban', '', 1, 0, '启用会员', '', '', 0),
(137, 133, 'User', 'Oauthadmin', 'index', '', 1, 1, '第三方用户', 'leaf', '', 0),
(138, 137, 'User', 'Oauthadmin', 'delete', '', 1, 0, '第三方用户解绑', '', '', 0),
(139, 132, 'User', 'Indexadmin', 'default3', '', 1, 1, '管理组', '', '', 0),
(140, 139, 'Admin', 'Rbac', 'index', '', 1, 1, '角色管理', '', '', 0),
(141, 140, 'Admin', 'Rbac', 'member', '', 1, 0, '成员管理', '', '', 1000),
(142, 140, 'Admin', 'Rbac', 'authorize', '', 1, 0, '权限设置', '', '', 1000),
(143, 142, 'Admin', 'Rbac', 'authorize_post', '', 1, 0, '提交设置', '', '', 0),
(144, 140, 'Admin', 'Rbac', 'roleedit', '', 1, 0, '编辑角色', '', '', 1000),
(145, 144, 'Admin', 'Rbac', 'roleedit_post', '', 1, 0, '提交编辑', '', '', 0),
(146, 140, 'Admin', 'Rbac', 'roledelete', '', 1, 1, '删除角色', '', '', 1000),
(147, 140, 'Admin', 'Rbac', 'roleadd', '', 1, 1, '添加角色', '', '', 1000),
(148, 147, 'Admin', 'Rbac', 'roleadd_post', '', 1, 0, '提交添加', '', '', 0),
(149, 139, 'Admin', 'User', 'index', '', 1, 1, '管理员', '', '', 0),
(150, 149, 'Admin', 'User', 'delete', '', 1, 0, '删除管理员', '', '', 1000),
(151, 149, 'Admin', 'User', 'edit', '', 1, 0, '管理员编辑', '', '', 1000),
(152, 151, 'Admin', 'User', 'edit_post', '', 1, 0, '编辑提交', '', '', 0),
(153, 149, 'Admin', 'User', 'add', '', 1, 0, '管理员添加', '', '', 1000),
(154, 153, 'Admin', 'User', 'add_post', '', 1, 0, '添加提交', '', '', 0),
(155, 47, 'Admin', 'Plugin', 'update', '', 1, 0, '插件更新', '', '', 0),
(156, 39, 'Admin', 'Storage', 'index', '', 1, 0, '文件存储', '', '', 0),
(157, 156, 'Admin', 'Storage', 'setting_post', '', 1, 0, '文件存储设置提交', '', '', 0),
(158, 54, 'Admin', 'Slide', 'ban', '', 1, 0, '禁用幻灯片', '', '', 0),
(159, 54, 'Admin', 'Slide', 'cancelban', '', 1, 0, '启用幻灯片', '', '', 0),
(160, 149, 'Admin', 'User', 'ban', '', 1, 0, '禁用管理员', '', '', 0),
(161, 149, 'Admin', 'User', 'cancelban', '', 1, 0, '启用管理员', '', '', 0),
(162, 1, 'Admin', 'Variable', 'index', '', 1, 1, '变量管理', '', '', 0),
(163, 1, 'Portal', 'AdminProduct', 'index', '', 1, 1, '产品管理', '', '', 0),
(164, 1, 'Portal', 'AdminPicture', 'index', '', 1, 1, '图集管理', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `nfx_nav`
--

CREATE TABLE IF NOT EXISTS `nfx_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='前台导航表' AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `nfx_nav`
--

INSERT INTO `nfx_nav` (`id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path`) VALUES
(1, 1, 0, '首页', '', 'home', '', 1, 0, '0-1'),
(14, 2, 12, '垂钓中心', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"10";}}', '', 1, 1, '0-12-14'),
(15, 2, 12, '客房展示', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"11";}}', '', 1, 2, '0-12-15'),
(12, 2, 0, '休闲娱乐', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"9";}}', '', 1, 3, '0-12'),
(13, 2, 12, '特色餐饮', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"9";}}', '', 1, 0, '0-12-13'),
(4, 2, 0, '网站首页', '', 'home', '', 1, 0, '0-4'),
(5, 2, 0, '农庄简介', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"2";}}', '', 1, 1, '0-5'),
(6, 2, 5, '农庄简介', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"2";}}', '', 1, 0, '0-5-6'),
(7, 2, 5, '农庄文化', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"3";}}', '', 1, 0, '0-5-7'),
(8, 2, 5, '农庄摄影', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"3";}}', '', 1, 0, '0-5-8'),
(9, 2, 0, '农庄动态', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"4";}}', '', 1, 2, '0-9'),
(10, 2, 9, '农庄新闻', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"5";}}', '', 1, 0, '0-9-10'),
(11, 2, 9, '过往活动', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"6";}}', '', 1, 0, '0-9-11'),
(16, 3, 0, '水果品种', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"12";}}', '', 1, 0, '0-16'),
(17, 3, 16, '夏黑', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"13";}}', '', 1, 0, '0-16-17'),
(18, 3, 16, '美人指', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"14";}}', '', 1, 0, '0-16-18'),
(19, 3, 16, '巨峰', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"15";}}', '', 1, 0, '0-16-19'),
(20, 3, 16, '无核四号', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"16";}}', '', 1, 0, '0-16-20'),
(21, 3, 16, '杨梅', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"17";}}', '', 1, 0, '0-16-21'),
(22, 3, 16, '油桃', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"18";}}', '', 1, 0, '0-16-22'),
(23, 3, 16, '夏黑', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"19";}}', '', 1, 0, '0-16-23'),
(24, 3, 16, '樱桃', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"20";}}', '', 1, 0, '0-16-24'),
(25, 3, 0, '采摘知识', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"21";}}', '', 1, 1, '0-25'),
(26, 3, 0, '客户留言', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"4";}}', '', 1, 2, '0-26'),
(27, 3, 0, '联系方式', '', 'a:2:{s:6:"action";s:17:"Portal/Page/index";s:5:"param";a:1:{s:2:"id";s:1:"5";}}', '', 1, 3, '0-27');

-- --------------------------------------------------------

--
-- 表的结构 `nfx_nav_cat`
--

CREATE TABLE IF NOT EXISTS `nfx_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='前台导航分类表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `nfx_nav_cat`
--

INSERT INTO `nfx_nav_cat` (`navcid`, `name`, `active`, `remark`) VALUES
(1, '主导航', 1, '主导航'),
(2, '左侧菜单', 0, '左侧菜单'),
(3, '右侧菜单', 0, '右侧菜单');

-- --------------------------------------------------------

--
-- 表的结构 `nfx_oauth_user`
--

CREATE TABLE IF NOT EXISTS `nfx_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `nfx_options`
--

CREATE TABLE IF NOT EXISTS `nfx_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='全站配置表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `nfx_options`
--

INSERT INTO `nfx_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'member_email_active', '{"title":"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.","template":"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\"http:\\/\\/www.thinkcmf.com\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\"\\" href=\\"http:\\/\\/#link#\\" target=\\"_self\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>"}', 1),
(2, 'site_options', '{"site_name":"\\u5e74\\u4e30\\u73b0\\u4ee3\\u519c\\u4e1a","site_host":"http:\\/\\/127.0.0.1\\/","site_logo":"20160815\\/57b0a12968248.png","site_admin_url_password":"","site_tpl":"nfxdny","site_adminstyle":"flat","site_icp":"\\u82cfICP\\u590714001079\\u53f7-1","site_admin_email":"admin@admin.com","site_tongji":"","site_copyright":"\\u5f90\\u5dde\\u5609\\u665f\\u519c\\u4e1a\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8","site_seo_title":"\\u5e74\\u4e30\\u73b0\\u4ee3\\u519c\\u4e1a","site_seo_keywords":"\\u5e74\\u4e30\\u73b0\\u4ee3\\u519c\\u4e1a","site_seo_description":"\\u5e74\\u4e30\\u73b0\\u4ee3\\u519c\\u4e1a","urlmode":"0","html_suffix":"","comment_time_interval":0}', 1),
(3, 'cmf_settings', '{"banned_usernames":""}', 1);

-- --------------------------------------------------------

--
-- 表的结构 `nfx_plugins`
--

CREATE TABLE IF NOT EXISTS `nfx_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `nfx_posts`
--

CREATE TABLE IF NOT EXISTS `nfx_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Portal文章表' AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `nfx_posts`
--

INSERT INTO `nfx_posts` (`id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`) VALUES
(1, 1, '测试', '测试', '2016-08-15 00:43:44', '<p>测试测试</p>', '测试', '测试', 1, 1, '2016-08-15 00:43:20', NULL, 0, NULL, '', 0, '{"thumb":"20160815\\/57b09fbd3b048.jpg"}', 1, 0, 0, 0),
(2, 1, '农庄简介', NULL, '2016-08-15 11:21:14', '<table align="center" border="0" cellspacing="5" width="700"><tbody><tr class="firstRow"><td><p><span style="font-size: 9px"><span style="font-size: 10px"><span style="color: #268d22">&nbsp; ◇</span></span>　<span style="font-size: 12px">金色阳光生态园</span></span>（徐州嘉晟农业科技有限公司）座落在徐州市刘集生态观光园风景区，是集以葡萄为主的科研，生产，加工，繁育，推广，餐饮，垂钓及休闲观光为一体的科研单位和经济实体。公司现有面积200余亩，以上产鲜果，苗木为主，并有葡萄酒，葡萄汁，葡萄醋，发酵葡萄汁和葡萄盆景等，产品畅销全国。</p><p>&nbsp;</p><p><span style="font-size: 9px"><span style="color: #268d22"><span style="font-size: 9px"><span style="font-size: 10px"><span style="color: #268d22">&nbsp; ◇</span></span>　</span></span></span>近年来，刘集镇党委政府围绕“农业增效、农民增收”的目标，力争在“面上扩规模、在点上出精品”，全力打造生态观光品牌。</p></td><td align="center" valign="center"><img title="2014012309400585604.jpg" alt="2014012309400585604.jpg" src="http://127.0.0.1/data/upload/ueditor/20160815/57b1510b820b7.jpg" style="width: 361px; height: 225px"/></td></tr><tr><td colspan="2"><p><span style="font-size: 9px"><span style="color: #268d22"><span style="font-size: 9px"><span style="font-size: 10px"><span style="color: #268d22">&nbsp; ◇</span></span>　</span></span></span>目前，镇内两家企业被评为区级休闲农业与乡村旅游示范点，1个村被授予市级优秀农家乐示范村，金色阳光生态园被评为徐州“最美乡村旅游点”之一，刘集生态观光园被省旅游局授予四星级农家乐旅游点。<br/></p><p><br/>&nbsp; <span style="font-size: 9px"><span style="color: #268d22"><span style="font-size: 9px"><span style="font-size: 10px"><span style="color: #268d22">◇</span></span>　</span></span></span>刘集生态观光园占地3000多亩，核心区1000多亩，辐射区2000多亩；由刘集镇农业服务发展有限公司、徐州嘉晟农业科技有限公司联合其他四家同区农业企业联盟组成。在生态园的推动下，刘集镇现已打造成为徐州市铜山区都市现代型农业与乡村旅游观光农业的特色镇之一。</p></td></tr></tbody></table>', '农庄简介', '金色阳光生态园（徐州嘉晟农业科技有限公司）座落在徐州市刘集生态观光园风景区，是集以葡萄为主的科研，生产金色阳光生态园（徐州嘉晟农业科技有限公司）座落在徐州市刘集生态观光园风景区，是集以葡萄为主的科研，生产', 1, 1, '2016-08-15 11:20:27', NULL, 0, 2, '', 0, '{"template":"about","thumb":""}', 0, 0, 0, 0),
(3, 1, '农庄文化', NULL, '2016-08-15 11:21:28', '<p><img src="http://127.0.0.1/data/upload/ueditor/20160815/57b152e8cec52.jpg" style="" title="2014012309120793240.jpg"/></p><p><img src="http://127.0.0.1/data/upload/ueditor/20160815/57b152e8d8504.jpg" style="" title="2.jpg"/></p><p><img src="http://127.0.0.1/data/upload/ueditor/20160815/57b152e8e16e3.jpg" style="" title="3.jpg"/></p><p><img src="http://127.0.0.1/data/upload/ueditor/20160815/57b152e903349.jpg" style="" title="4.jpg"/></p><p><img src="http://127.0.0.1/data/upload/ueditor/20160815/57b152e90f4de.jpg" style="" title="5.jpg"/></p><p><img src="http://127.0.0.1/data/upload/ueditor/20160815/57b152e922b09.jpg" style="" title="6.jpg"/></p><p><br/></p>', '农庄文化', '农庄文化', 1, 1, '2016-08-15 11:21:16', NULL, 0, 2, '', 0, '{"template":"about","thumb":""}', 0, 0, 0, 0),
(4, 1, '客户留言', NULL, '2016-08-15 11:31:35', '<p>客户留言</p>', '客户留言', '客户留言', 1, 1, '2016-08-15 11:31:20', NULL, 0, 2, '', 0, '{"template":"book","thumb":""}', 0, 0, 0, 0),
(5, 1, '联系方式', NULL, '2016-08-15 11:31:51', '<table align="center" border="0" width="680"><tbody><tr class="firstRow"><td width="310"><p><strong>徐州嘉晟农业科技有限公司</strong></p><p>&nbsp;</p><p>联系人：钟经理<br/>\r\n					手　机：13805210685<br/>\r\n					电　话：0516-85099006&nbsp;<br/>\r\n					地　址：徐州市铜山区刘集镇车村村<br/>\r\n					网　址：<a target="_self" href="http://www.nfxdny.com">www.nfxdny.com</a></p></td><td width="380"><img title="2014012309500994301.jpg" src="http://127.0.0.1/data/upload/ueditor/20160815/57b14e0092576.jpg" alt="2014012309500994301.jpg" style="width: 380px; height: 233px"/></td></tr></tbody></table>', '联系方式', '联系方式', 1, 1, '2016-08-15 11:31:39', NULL, 0, 2, '', 0, '{"template":"contact","thumb":""}', 0, 0, 0, 0),
(6, 1, '农庄摄影', '', '2016-08-15 16:29:29', '<p>农庄摄影</p>', '农庄摄影', '农庄摄影', 1, 1, '2016-08-15 16:26:20', NULL, 0, NULL, '', 0, '{"thumb":"20160815\\/57b17ce77a51e.jpg","photo":[{"url":"20160815\\/57b17d5333c72.jpg","alt":"2014012309083860777"},{"url":"20160815\\/57b17d5a0f295.jpg","alt":"2014050816523356510"},{"url":"20160815\\/57b17d6133446.jpg","alt":"2014061414391768135"}]}', 5, 0, 0, 0),
(7, 1, '垂钓中心', '垂钓中心', '2016-08-15 16:41:11', '<p>垂钓中心</p>', '垂钓中心', '垂钓中心', 1, 1, '2016-08-15 16:39:20', NULL, 0, NULL, '', 0, '{"thumb":"20160815\\/57b1afc4897a0.jpg","photo":[{"url":"20160815\\/57b17ff4a461c.jpg","alt":"2014012308595240427"},{"url":"20160815\\/57b17ffcb8e9e.jpg","alt":"2014012309000436608"},{"url":"20160815\\/57b1800a22d30.jpg","alt":"2014012309001049215"},{"url":"20160815\\/57b1801806481.jpg","alt":"2014012312474269990"}]}', 0, 0, 0, 0),
(8, 1, '特色餐饮', '', '2016-08-15 17:17:36', '<p>特色餐饮</p>', '特色餐饮', '特色餐饮', 1, 1, '2016-08-15 17:16:37', NULL, 0, NULL, '', 0, '{"thumb":"20160815\\/57b188a60bd68.jpg","photo":[{"url":"20160815\\/57b1b01399afa.jpg","alt":"101"},{"url":"20160815\\/57b1b01baa482.jpg","alt":"102"},{"url":"20160815\\/57b1b023c4286.jpg","alt":"103"},{"url":"20160815\\/57b1b02a1f771.jpg","alt":"104"}]}', 0, 0, 0, 0),
(9, 1, '客房展示', '客房展示', '2016-08-15 20:03:33', '<p>客房展示</p>', '客房展示', '客房展示', 1, 1, '2016-08-15 20:00:08', NULL, 0, NULL, '', 0, '{"thumb":"20160815\\/57b1af917e6b2.jpg","photo":[{"url":"20160815\\/57b1af543b167.jpg","alt":"11"},{"url":"20160815\\/57b1af5a3ffc0.jpg","alt":"12"},{"url":"20160815\\/57b1af602ec93.jpg","alt":"13"},{"url":"20160815\\/57b1af670ee99.jpg","alt":"14"},{"url":"20160815\\/57b1af6cc2fd2.jpg","alt":"15"}]}', 0, 0, 0, 0),
(10, 1, '徐州嘉晟农业', '徐州嘉晟农业', '2016-08-20 11:18:56', '<p><span style="color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px;">葡萄采摘既不能毁坏葡萄也不能损害枝叶。</span><br style="margin: 0px; padding: 0px; line-height: 0px; height: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; white-space: normal;"/><span style="color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px;">　　</span><strong style="margin: 0px; padding: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px; white-space: normal;">所以在葡萄采摘时应注意：<br style="margin: 0px; padding: 0px; line-height: 0px; height: 0px;"/></strong><span style="color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px;">　　取摘心、抹除副梢等措施控制其生长，以减少养分的无效消耗，促使主蔓及被保留的副梢粗壮，芽体饱满充实。</span><br style="margin: 0px; padding: 0px; line-height: 0px; height: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; white-space: normal;"/><span style="color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px;">　　葡萄采摘首先要避免潮湿的葡萄，其次避免在一天内最热的时候采摘，最后葡萄串要轻轻的放在容量较小的容器里，避免挤在一起。</span><br style="margin: 0px; padding: 0px; line-height: 0px; height: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; white-space: normal;"/><span style="color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px;">　　葡萄采摘要对枝蔓进行合理的修剪，粗壮的枝多留，瘦弱的枝少留，过密枝、细弱枝、病虫枝应及早疏除。</span></p>', '徐州农家乐葡萄的采摘技巧', '徐州嘉晟农业徐州嘉晟农业徐州嘉晟农业徐州嘉晟农业徐州嘉晟农业徐州嘉晟农业徐州嘉晟农业徐州嘉晟农业徐州嘉晟农业徐州嘉晟农业', 1, 1, '2016-08-20 11:18:07', NULL, 0, NULL, '', 0, '{"thumb":""}', 9, 0, 0, 0),
(11, 1, '葡萄苗是健康的“指明灯”', '徐州嘉晟农业科技有限公司', '2016-08-20 11:19:49', '<p><span style="color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px;">而今葡萄早已是一种被大众们都喜欢的水果，它味道甘甜可口，种类甚多，而且晶莹漂亮。因为葡萄得到很多人的喜欢，所以葡萄苗的销售量每年都在不断的增加。</span><br style="margin: 0px; padding: 0px; line-height: 0px; height: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; white-space: normal;"/><span style="color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px;">　　本公司的葡萄苗品种众多，畅销市场。我们公司的葡萄苗品种都是各地最受欢迎的优秀品种。我们公司拥有占地面积很大的葡萄苗生产基地，而且我们也引进了很多的新品种，丰富了我公司的葡萄苗品种数量。我公司常年为各大葡萄园提供各种优质葡萄苗，已经与很多客户达成合作意向。</span><br style="margin: 0px; padding: 0px; line-height: 0px; height: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; white-space: normal;"/><span style="color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px;">　　我们在葡萄苗的培育方面经过多年的探索，研制出了葡萄苗成活的新领域技术，我们公司培育的葡萄苗成活率比其他同行业的葡萄苗高出几倍，得到了很多客户的称赞，我们已经不仅仅是为全国范围内的葡萄苗需求者供应产品，我们葡萄苗的培育技术也得到了很大的推广，而且有很多同行上门学习我们公司的葡萄苗培育新技术。</span><br style="margin: 0px; padding: 0px; line-height: 0px; height: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; white-space: normal;"/><span style="color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px;">　　面向未来面向新的世纪，我们全心全意的为种植户提供更先进的技术，更优良的葡萄苗以及更完善的服务，把真正的优良葡萄苗推广给种植户。我们种苗葡萄苗，采用无专业技术人的精心育苗，确保纯度和质量。我们欢迎各位朋友客户的光临与指导！</span></p>', '葡萄苗是健康的“指明灯”', '徐州嘉晟农业科技有限公司徐州嘉晟农业科技有限公司徐州嘉晟农业科技有限公司徐州嘉晟农业科技有限公司徐州嘉晟农业科技有限公司徐州嘉晟农业科技有限公司徐州嘉晟农业科技有限公司', 1, 1, '2016-08-20 11:19:25', NULL, 0, NULL, '', 0, '{"thumb":""}', 5, 0, 0, 0),
(12, 1, '如何给葡萄苗撑起“安全伞”', '徐州嘉晟农业科技有限公司', '2016-08-20 11:20:20', '<p><span style="color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px;">中国农林葡萄苗繁育基地本着保质保量的原则常年致力于新品种葡萄苗木的栽培，自基地创建之日起已经栽培了多种新品种葡萄苗，优质葡萄苗,为我国葡萄苗木培育行业树立了一面旗帜。基地位于中国葡萄沟之乡已有百年的葡萄种植历史。</span><br style="margin: 0px; padding: 0px; line-height: 0px; height: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; white-space: normal;"/><span style="color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px;">　　鲜红色极早熟巨大粒葡萄苗新品种。粒重，鲜红色，果肉的质感适中，香甜可口，品质极其的好，成熟后可以挂树一个月，没有裂开的果实，运输时也不会过多担心果肉的质量，是目前非常有前途的鲜红色巨大粒极早熟葡萄品种。</span><br style="margin: 0px; padding: 0px; line-height: 0px; height: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; white-space: normal;"/><span style="color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px;">　　葡萄苗木的消毒处理，是防止病虫害传统播的重要措施。秋冬季是葡萄苗木销售、采购的重要季节。因此，把好葡萄苗木的消毒处理关，是葡萄种植企业、农户必须高度重视的问题。现将消毒处理的办法作如下介绍：</span><br style="margin: 0px; padding: 0px; line-height: 0px; height: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; white-space: normal;"/><span style="color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px;">　　首先，针对虫害的消毒处理。我们要采用药剂，使用适量的敌敌畏，浸泡枝条或苗木，浸泡时间15分钟。浸泡后晾干，然后包装运输或随即种植。</span><br style="margin: 0px; padding: 0px; line-height: 0px; height: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; white-space: normal;"/><span style="color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px;">　　其次，采用熏蒸办法处理。用溴甲烷熏蒸，把苗木放在密闭的房间内，温度低的条件下可适当提高使用剂量，温度高的条件下适当减少使用剂量。熏蒸时，可使用电扇吹，促使空气流动，提高熏蒸效果。熏蒸时，要防止苗木脱水。</span><br style="margin: 0px; padding: 0px; line-height: 0px; height: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; white-space: normal;"/><span style="color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px;">　　最后，再针对虫害、病害的综合消毒处理。第一步，先将苗木放在43-45摄氏度的温水中浸泡2小时后，然后捞出放入硫酸铜和敌敌畏的配合溶液中去浸泡15分钟，浸泡后捞出晾干包装运输或栽种。硫酸铜和敌敌畏的配合溶液配制方法：每100公斤水加入1公斤硫酸铜、80%敌敌畏150毫升，混合搅拌的一定要均匀。</span><br style="margin: 0px; padding: 0px; line-height: 0px; height: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; white-space: normal;"/><span style="color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px;">　　我们把最大的实惠留给农民朋友，葡萄苗的口碑非常好，客户至上的原则，现面向全国欢迎您的关注，欢迎八方来客的参观、考察、选购！</span></p>', '如何给葡萄苗撑起“安全伞”', '徐州嘉晟农业科技有限公司徐州嘉晟农业科技有限公司徐州嘉晟农业科技有限公司徐州嘉晟农业科技有限公司徐州嘉晟农业科技有限公司徐州嘉晟农业科技有限公司', 1, 1, '2016-08-20 11:19:52', NULL, 0, NULL, '', 0, '{"thumb":""}', 3, 0, 0, 0),
(13, 1, '过往活动', '过往活动', '2016-08-20 11:20:59', '<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px; white-space: normal; text-align: center;"><img alt="" src="http://www.nfxdny.com/UploadFile/Photo/2014-1/2014012308463826525.jpg" style="margin: 0px; padding: 0px; border: 0px; width: 500px; height: 332px;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px; white-space: normal;">&nbsp;</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px; white-space: normal;">&nbsp;</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px; white-space: normal; text-align: center;"><img alt="" src="http://www.nfxdny.com/UploadFile/Photo/2014-1/2014012308465288569.jpg" style="margin: 0px; padding: 0px; border: 0px; width: 500px; height: 332px;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px; white-space: normal;">&nbsp;</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px; white-space: normal;">&nbsp;</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px; white-space: normal; text-align: center;"><img alt="" src="http://www.nfxdny.com/UploadFile/Photo/2014-1/2014012308470379772.jpg" style="margin: 0px; padding: 0px; border: 0px; width: 500px; height: 332px;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px; white-space: normal;">&nbsp;</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px; white-space: normal;">&nbsp;</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(69, 69, 69); font-family: 宋体; font-size: 12px; line-height: 24px; white-space: normal; text-align: center;"><img alt="" src="http://www.nfxdny.com/UploadFile/Photo/2014-1/2014012308471889308.jpg" style="margin: 0px; padding: 0px; border: 0px; width: 500px; height: 270px;"/></p><p><br/></p>', '过往活动', '过往活动', 1, 1, '2016-08-20 11:20:37', NULL, 0, NULL, '', 0, '{"thumb":""}', 1, 0, 0, 0),
(14, 1, '徐州葡萄采摘园注意事项', '徐州葡萄采摘园注意事项', '2016-08-20 11:21:34', '<p>随着采摘活动的盛行，现在很多人喜欢去农家乐进行葡萄采摘，但采摘也是技术活，是有方法，有技巧，下面为大家分享如何进行葡萄采摘工作？</p><p>　　采摘前准备工作：采收前，要在园内搭好遮阳棚，在地上铺好衬垫毯；准备好包装箱（一般为笨板箱）、周转筐及园内运输工具。采收时把握天气，采收时，一般选择晴朗天气，早晨天气凉爽时采摘，中午及下午气温过高时在遮阳棚下加工装箱。雨后和中午气温过高时不能采收。雨后也不能进行采摘，葡萄被雨水浇过后果实的甜度就会下降，影响口感和味道。</p><p>　　防晒：在出发之前，一定要注意防晒问题，葡萄采摘的季节还是夏季，露天的葡萄园虽然果实都是自然成熟，味道好，但阳光强烈的时候难免炎热难捱，因此要注意防晒。</p><p>　　着装：出发之前对穿着也有要求，采摘属于户外休闲活动，建议穿着徒步鞋、旅游休闲鞋，着便装；尽量避免与葡萄或枝条接触染上果汁！同时深色衣物也能防小虫叮咬。</p><p>　　采摘葡萄时，要配戴白色手套，挑选成熟果穗，应该用一只手托住葡萄的底部，另一只手用剪刀把葡萄的柄剪下来，这样可以避免损伤果树；</p><p>　　在采摘之前先尝一颗，看是否是自己喜欢的口味，如果喜欢的再摘，以免浪费。</p><p>　　采摘时，游客采摘时应注意安全，不要爬太高。在棚内不要奔跑，以免碰撞棚内的其他树枝及其他防护物品。注意剪刀不要伤到自己或他人；人与人之间不要贴的太近避免碰撞到彼此。</p><p>　　采摘完成后分级挑选装箱，果梗朝上倒装入笨板箱模具内，过秤，套葡萄专用保鲜膜后，倒扣入笨板箱内，保鲜膜敞开、扣箱盖，将箱子整齐摆放在凉棚下。走的时候就可以直接带走，这样放在里面的葡萄可以存放两天。</p><p><br/></p>', '徐州葡萄采摘园注意事项', '徐州葡萄采摘园注意事项', 1, 1, '2016-08-20 11:21:14', NULL, 0, NULL, '', 0, '{"thumb":""}', 1, 0, 0, 0),
(15, 1, '如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”', '2016-08-20 11:24:05', '<p>如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”</p>', '如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”', 1, 1, '2016-08-20 11:23:50', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(16, 1, '如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”', '2016-08-20 11:24:16', '<p>如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”</p>', '如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”', 1, 1, '2016-08-20 11:24:06', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(17, 1, '如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”', '2016-08-20 11:24:26', '<p>如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”</p>', '如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”', 1, 1, '2016-08-20 11:24:17', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(18, 1, '如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”', '2016-08-20 11:24:36', '<p>如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”</p>', '如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”', 1, 1, '2016-08-20 11:24:28', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(19, 1, '如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”', '2016-08-20 11:24:46', '<p>如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”</p>', '如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”', 1, 1, '2016-08-20 11:24:37', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(20, 1, '如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”', '2016-08-20 11:24:55', '<p>如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”</p>', '如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”如何给葡萄苗撑起“安全伞”', 1, 1, '2016-08-20 11:24:47', NULL, 0, NULL, '', 0, '{"thumb":""}', 2, 0, 0, 0),
(21, 1, '如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”', '2016-08-20 11:25:43', '<p>如何给葡萄苗撑起“安全伞”</p>', '如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”', 1, 1, '2016-08-20 11:25:37', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(22, 1, '如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”', '2016-08-20 11:25:51', '<p>如何给葡萄苗撑起“安全伞”</p>', '如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”', 1, 1, '2016-08-20 11:25:44', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(23, 1, '如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”', '2016-08-20 11:25:59', '<p>如何给葡萄苗撑起“安全伞”</p>', '如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”', 1, 1, '2016-08-20 11:25:52', NULL, 0, NULL, '', 0, '{"thumb":""}', 0, 0, 0, 0),
(24, 1, '如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”', '2016-08-20 11:26:07', '<p>如何给葡萄苗撑起“安全伞”</p>', '如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”', 1, 1, '2016-08-20 11:26:00', NULL, 0, NULL, '', 0, '{"thumb":""}', 15, 0, 0, 0),
(25, 1, '如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”', '2016-08-20 11:26:16', '<p>如何给葡萄苗撑起“安全伞”</p>', '如何给葡萄苗撑起“安全伞”', '如何给葡萄苗撑起“安全伞”', 1, 1, '2016-08-20 11:26:08', NULL, 0, NULL, '', 0, '{"thumb":""}', 1, 0, 0, 0),
(26, 1, '徐州绿色水果-夏黑', '徐州绿色水果-夏黑', '2016-08-20 12:39:07', '<h1 style="margin: 0px; padding: 0px; font-stretch: normal; font-size: 15px; line-height: 30px; font-family: 微软雅黑, 宋体; text-align: center; color: rgb(69, 69, 69); white-space: normal;">徐州绿色水果-夏黑</h1><p style="text-align: center;"><img src="http://127.0.0.1/data/upload/ueditor/20160820/57b7defc0524f.jpg" title="2014061414460167191.jpg" alt="2014061414460167191.jpg"/></p>', '徐州绿色水果-夏黑', '徐州绿色水果-夏黑', 1, 1, '2016-08-20 12:38:46', NULL, 0, NULL, '', 0, '{"thumb":"20160820\\/57b7dee2d2ac6.jpg"}', 7, 0, 0, 0),
(27, 1, '', '', '2016-08-20 12:50:35', '<p><img src="http://127.0.0.1/data/upload/ueditor/20160820/57b7e186d57fd.jpg" title="2014012217152949532.jpg" alt="2014012217152949532.jpg"/></p>', '铜山区农业产业化重点龙头企业', '铜山区农业产业化重点龙头企业', 1, 1, '2016-08-20 12:49:41', NULL, 0, NULL, '', 0, '{"thumb":"20160820\\/57b7e19846890.jpg"}', 5, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `nfx_role`
--

CREATE TABLE IF NOT EXISTS `nfx_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='角色表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `nfx_role`
--

INSERT INTO `nfx_role` (`id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder`) VALUES
(1, '超级管理员', 0, 1, '拥有网站最高管理员权限！', 1329633709, 1329633709, 0);

-- --------------------------------------------------------

--
-- 表的结构 `nfx_role_user`
--

CREATE TABLE IF NOT EXISTS `nfx_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- --------------------------------------------------------

--
-- 表的结构 `nfx_route`
--

CREATE TABLE IF NOT EXISTS `nfx_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `nfx_slide`
--

CREATE TABLE IF NOT EXISTS `nfx_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='幻灯片表' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `nfx_slide`
--

INSERT INTO `nfx_slide` (`slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder`) VALUES
(1, 1, '首页幻灯片1', '/data/upload/20160814/57b084d059b43.jpg', '#', '', '', 1, 0),
(2, 1, '首页幻灯片2', '/data/upload/20160814/57b084e52cef5.jpg', '#', '', '', 1, 0),
(3, 1, '首页幻灯片3', '/data/upload/20160814/57b084f409503.jpg', '#', '', '', 1, 0),
(4, 2, '内页幻灯片1', '/data/upload/20160815/57b13ef2e7e47.jpg', '#', '', '', 1, 0),
(5, 2, '内页幻灯片2', '/data/upload/20160815/57b13f04da08d.jpg', '#', '', '', 1, 0),
(6, 2, '内页幻灯片3', '/data/upload/20160815/57b13f11c08ca.jpg', '#', '', '', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `nfx_slide_cat`
--

CREATE TABLE IF NOT EXISTS `nfx_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `nfx_slide_cat`
--

INSERT INTO `nfx_slide_cat` (`cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status`) VALUES
(1, '首页轮播', 'index_slider', '首页轮播（1920*519）', 1),
(2, '内页幻灯片', 'inner_slider', '内页幻灯片（1920*379）', 1);

-- --------------------------------------------------------

--
-- 表的结构 `nfx_terms`
--

CREATE TABLE IF NOT EXISTS `nfx_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表' AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `nfx_terms`
--

INSERT INTO `nfx_terms` (`term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`) VALUES
(4, '农庄动态', '', 'article', '农庄动态', 0, 0, '0-4', '', '', '', 'news', 'news-detail', 0, 1),
(3, '农庄摄影', '', 'picture', '农庄摄影', 0, 0, '0-3', '', '', '', 'list-img', 'list-img', 0, 1),
(5, '农庄新闻', '', 'article', '农庄新闻', 4, 0, '0-4-5', '', '', '', 'news', 'news-detail', 0, 1),
(6, '过往活动', '', 'article', '过往活动', 4, 0, '0-4-6', '', '', '', 'news', 'news-detail', 0, 1),
(7, '休闲娱乐', '', 'picture', '休闲娱乐', 0, 0, '0-7', '', '', '', 'list-img', 'list-img', 0, 1),
(10, '垂钓中心', '', 'picture', '垂钓中心', 7, 0, '0-7-10', '', '', '', 'list-img', 'list-img', 0, 1),
(9, '特色餐饮', '', 'picture', '特色餐饮', 7, 0, '0-7-9', '', '', '', 'list-img', 'list-img', 0, 1),
(11, '客房展示', '', 'picture', '客房展示', 7, 0, '0-7-11', '', '', '', 'list-img', 'list-img', 0, 1),
(12, '水果品种', '', 'product', '水果品种', 0, 0, '0-12', '', '', '', 'product', 'product-detail', 0, 1),
(13, '夏黑', '', 'product', '夏黑', 12, 0, '0-12-13', '', '', '', 'product', 'product-detail', 0, 1),
(14, '美人指', '', 'product', '美人指', 12, 0, '0-12-14', '', '', '', 'product', 'product-detail', 0, 1),
(15, '巨峰', '', 'product', '巨峰', 12, 0, '0-12-15', '', '', '', 'product', 'product-detail', 0, 1),
(16, '无核四号', '', 'product', '无核四号', 12, 0, '0-12-16', '', '', '', 'product', 'product-detail', 0, 1),
(17, '杨梅', '', 'product', '杨梅', 12, 0, '0-12-17', '', '', '', 'product', 'product-detail', 0, 1),
(18, '油桃', '', 'product', '油桃', 12, 0, '0-12-18', '', '', '', 'product', 'product-detail', 0, 1),
(19, '夏黑', '', 'product', '夏黑', 12, 0, '0-12-19', '', '', '', 'product', 'product-detail', 0, 1),
(20, '樱桃', '', 'product', '樱桃', 12, 0, '0-12-20', '', '', '', 'product', 'product-detail', 0, 1),
(21, '采摘知识', '', 'article', '采摘知识', 0, 0, '0-21', '', '', '', 'news', 'news-detail', 0, 1),
(22, '农庄荣誉', '', 'product', '农庄荣誉', 0, 0, '0-22', '', '', '', 'lists', 'product-detail', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `nfx_term_relationships`
--

CREATE TABLE IF NOT EXISTS `nfx_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表' AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `nfx_term_relationships`
--

INSERT INTO `nfx_term_relationships` (`tid`, `object_id`, `term_id`, `listorder`, `status`) VALUES
(2, 1, 5, 0, 0),
(3, 6, 3, 0, 1),
(4, 7, 10, 0, 1),
(5, 8, 9, 0, 1),
(6, 9, 11, 0, 1),
(7, 10, 5, 0, 1),
(8, 11, 5, 0, 1),
(9, 12, 5, 0, 1),
(10, 13, 6, 0, 1),
(11, 14, 21, 0, 1),
(12, 15, 5, 0, 1),
(13, 16, 5, 0, 1),
(14, 17, 4, 0, 1),
(15, 18, 4, 0, 1),
(16, 19, 5, 0, 1),
(17, 20, 5, 0, 1),
(18, 21, 5, 0, 1),
(19, 22, 5, 0, 1),
(20, 23, 5, 0, 1),
(21, 24, 5, 0, 1),
(22, 25, 5, 0, 1),
(23, 26, 13, 0, 1),
(24, 27, 22, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `nfx_users`
--

CREATE TABLE IF NOT EXISTS `nfx_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `nfx_users`
--

INSERT INTO `nfx_users` (`id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile`) VALUES
(1, 'admin', '###8e18ab745accd409edc6f339ed7ae302', 'admin', 'admin@admin.com', '', NULL, 0, NULL, NULL, '127.0.0.1', '2016-08-20 11:17:58', '2016-08-14 10:44:04', '', 1, 0, 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `nfx_user_favorites`
--

CREATE TABLE IF NOT EXISTS `nfx_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `nfx_variable`
--

CREATE TABLE IF NOT EXISTS `nfx_variable` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '变量ID',
  `variableName` varchar(255) NOT NULL COMMENT '变量名',
  `variableValue` varchar(255) DEFAULT NULL COMMENT '变量值',
  `beizhu` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `listorder` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `variableName` (`variableName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `nfx_variable`
--

INSERT INTO `nfx_variable` (`id`, `variableName`, `variableValue`, `beizhu`, `listorder`) VALUES
(6, 'lianxiren', '钟经理', '联系人', 0),
(7, 'shouji', '13805210685', '联系手机', 0),
(8, 'dianhua', '0516-85099006', '固定电话', 0),
(9, 'address', '徐州市铜山区刘集镇车村村', '联系地址', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
