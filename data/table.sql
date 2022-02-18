-- The create mysql table script file
-- user table
CREATE TABLE `ea_user` (
    `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户UID',
    `username` varchar(64) NOT NULL COMMENT '用户名 {text}',
    `phone` varchar(16) NOT NULL COMMENT '手机号 {text}',
    `avatar` text DEFAULT NULL COMMENT '头像照片 最多五张 {images}',
    `remark` varchar(255) DEFAULT NULL COMMENT '个人介绍 {textarea}',
    `longitude` varchar(255) DEFAULT NULL COMMENT '经度 {text}',
    `dimension` varchar(255) DEFAULT NULL COMMENT '维度 {text}',
    `edu` int(1) DEFAULT NULL COMMENT '学历 {radio} (1:初中, 2:中专, 3:高中, 4:大专, 5:本科, 6:硕士, 7:博士, 8:博士后)',
    `sex` int(1) DEFAULT 0 COMMENT '性别 {radio} (0:未知, 1:男, 2:女)',
    `birthday` date DEFAULT NULL COMMENT '生日  {date}(datetime)',
    `height` int(3) DEFAULT NULL COMMENT '身高 {text}',
    `city` varchar(255) DEFAULT NULL COMMENT '城市 {text}',
    `address` varchar(255) DEFAULT NULL COMMENT '居住地 {text}',
    `income` int(1) DEFAULT NULL COMMENT '月收入 {radio} (1:3000元以内, 2:3000-5000元, 3:5000-10000元, 4:10000-30000元, 5:30000元以上)',
    `marriage` int(1) DEFAULT 1 COMMENT '婚姻状况 {radio} (1:未婚, 2:离异, 3:丧偶, 4:已婚)',
    `children` int(1) DEFAULT 0 COMMENT '子女状况 {radio} (0:没有, 1:有)',

    `native` varchar(64) DEFAULT NULL COMMENT '籍贯 {text}',
    `nation` varchar(32) DEFAULT NULL COMMENT '民族 {text}',
    `blood` int(1) DEFAULT 5 COMMENT '血型 {radio} (1:A, 2:B, 3:AB, 4:0, 5:其他)',
    `weight` int(3) DEFAULT NULL COMMENT '体重 {text}',
    `occupation` varchar(32) DEFAULT NULL COMMENT '职业 {text}',
    `school` varchar(255) DEFAULT NULL COMMENT '毕业学校 {text}',
    `major` varchar(255) DEFAULT NULL COMMENT '所学专业 {text}',
    `house` int(1) DEFAULT NULL COMMENT '购房情况 {radio} (1:已购房无贷款, 2:已购房有贷款, 3:与父母同住, 4:暂未购房, 5:租房)',
    `car_buy` int(1) DEFAULT NULL COMMENT '购车情况 {radio} (1:已买车, 2:未买车)',

    `status` int(1) NOT NULL DEFAULT 1 COMMENT '会员状态',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT  CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户信息表';
-- php think curd -t user

-- news table
CREATE TABLE `ea_news` (
    `news_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
    `subject` varchar(255) NOT NULL COMMENT '新闻标题 {text}',
    `message` text NOT NULL COMMENT '新闻内容 {editor}',
    `status` int(1) NOT NULL DEFAULT 1 COMMENT '新闻状态',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT  CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='广告新闻表';
-- php think curd -t news

-- event table
CREATE TABLE `ea_event` (
    `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动ID',
    `subject` varchar(255) NOT NULL COMMENT '活动标题 {text}',
    `remark` varchar(255) DEFAULT NULL COMMENT '活动简介 {textarea}',
    `image` varchar(255) NOT NULL COMMENT '封面图 {image}',
    `message` text NOT NULL COMMENT '活动详情 {editor}',
    `total_fee` float(10,2) DEFAULT NULL COMMENT '活动参与价格 {text}',
    `address` varchar(255) DEFAULT NULL COMMENT '活动地址 {text}',
    `flag` int(1) NOT NULL DEFAULT 1 COMMENT '活动状态 {radio} (1:等待开始, 2:进行中, 3:已结束)',
    `start_time` datetime DEFAULT NULL COMMENT '活动开始时间 {date}(date)',
    `over_time` datetime DEFAULT NULL COMMENT '活动结束时间 {date}(date)',
    `status` int(1) NOT NULL DEFAULT 1 COMMENT '数据状态 {radio} (1:正常, 0:已删除)',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT  CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='活动数据表';
-- php think curd -t event -f 1
-- ALTER TABLE `ea_event` ADD `total_fee` FLOAT(10,2) NULL DEFAULT NULL COMMENT '活动参与价格 {text}' AFTER `message`;
-- ALTER TABLE `ea_event` ADD `address` VARCHAR(255) NULL DEFAULT NULL COMMENT '活动地址 {text}' AFTER `total_fee`;

-- event_join table
CREATE TABLE `ea_event_join` (
    `join_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据ID',
    `event_id` bigint(20) unsigned NOT NULL COMMENT '活动ID',
    `user_id` bigint(20) unsigned NOT NULL COMMENT '用户UID',
    `status` int(1) NOT NULL DEFAULT 1 COMMENT '数据状态',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`join_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT  CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='活动参与表';
-- php think curd -t event_join -r event --foreignKey=event_id --primaryKey=event_id -f 1

-- user_pay table
CREATE TABLE `ea_user_pay` (
    `pay_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据ID',
    `order_id` varchar(32) NOT NULL COMMENT '订单ID',
    `user_id` bigint(20) unsigned NOT NULL COMMENT '下单会员ID',
    `buy_user_id` bigint(20) unsigned NOT NULL COMMENT '购买会员ID',
    `subject` varchar(255) NOT NULL COMMENT '订单标题 {text}',
    `total` float(11,2) NOT NULL COMMENT '支付金额 {text}',
    `flag` int(1) NOT NULL DEFAULT 0 COMMENT '支付状态 {radio} (1:支付完成, 0:未支付)',
    `status` int(1) NOT NULL DEFAULT 1 COMMENT '数据状态',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT  CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='VIP购买表';
-- php think curd -t user_pay -r user --foreignKey=user_id --primaryKey=user_id -f 1

-- feedback table
CREATE TABLE `ea_feedback` (
    `feedback_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据ID',
    `user_id` varchar(32) NOT NULL COMMENT '用户ID',
    `phone` varchar(16) NOT NULL COMMENT '手机号 {text}',
    `message` varchar(255) NOT NULL COMMENT '反馈内容 {textarea}',
    `status` int(1) NOT NULL DEFAULT 1 COMMENT '数据状态',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT  CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='意见反馈表';
-- php think curd -t feedback

-- send_code table
CREATE TABLE `ea_send_code` (
    `send_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据ID',
    `phone` varchar(16) NOT NULL COMMENT '手机号 {text}',
    `code` int(6) NOT NULL COMMENT '验证码 {text}',
    `status` int(1) NOT NULL DEFAULT 0 COMMENT '数据状态 {radio} (1:验证完成, 0:等待验证)',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`send_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT  CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='短信发送记录表';
-- php think curd -t send_code

-- user_condition table
CREATE TABLE `ea_user_condition` (
    `condition_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据ID',
    `user_id` varchar(32) NOT NULL COMMENT '用户ID',
    `age` varchar(32) DEFAULT NULL COMMENT '年龄 {text}',
    `height` varchar(32) DEFAULT NULL COMMENT '身高 {text}',
    `edu` int(1) DEFAULT NULL COMMENT '学历 {radio} (1:初中, 2:中专, 3:高中, 4:大专, 5:本科, 6:硕士, 7:博士, 8:博士后)',
    `marriage` int(1) DEFAULT 1 COMMENT '婚姻状况 {radio} (1:未婚, 2:离异, 3:丧偶, 4:已婚)',
    `address` varchar(255) DEFAULT NULL COMMENT '居住地 {text}',
    `house` int(1) DEFAULT NULL COMMENT '购房情况 {radio} (1:已购房无贷款, 2:已购房有贷款, 3:与父母同住, 4:暂未购房, 5:租房)',
    `status` int(1) NOT NULL DEFAULT 0 COMMENT '数据状态 {radio} (1:正常, 0:已删除)',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`condition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT  CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户交友条件表';
-- php think curd -t user_condition

-- update user condition fields
ALTER TABLE `ea_user_condition` CHANGE `edu` `edu` VARCHAR(255) NULL DEFAULT NULL COMMENT '学历 {checkbox} (1:初中, 2:中专, 3:高中, 4:大专, 5:本科, 6:硕士, 7:博士, 8:博士后)';
ALTER TABLE `ea_user_condition` CHANGE `marriage` `marriage` VARCHAR(255) NULL DEFAULT NULL COMMENT '婚姻状况 {checkbox} (1:未婚, 2:离异, 3:丧偶, 4:已婚)';
ALTER TABLE `ea_user_condition` CHANGE `house` `house` VARCHAR(255) NULL DEFAULT NULL COMMENT '购房情况 {checkbox} (1:已购房无贷款, 2:已购房有贷款, 3:与父母同住, 4:暂未购房, 5:租房)';


-- send_code table
CREATE TABLE `ea_banner` (
    `banner_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据ID',
    `type` int(1) NOT NULL DEFAULT 1 COMMENT '投放位置 {radio} (1:首页Banner, 2:活动也Banner)',
    `url` char(255) NOT NULL COMMENT '图片 {image}',
    `str` varchar(255) NOT NULL COMMENT '文本 {text}',
    `status` int(1) NOT NULL DEFAULT 0 COMMENT '数据状态 {radio} (1:显示正常, 0:显示错误)',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT  CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统Banner广告图';
-- php think curd -t banner
ALTER TABLE `ea_banner` ADD `weight` INT(10) NOT NULL DEFAULT '0' COMMENT '权重 {text}' AFTER `str`;

-- user table add user score field
ALTER TABLE `ea_user` ADD `score` INT(3) NOT NULL DEFAULT '50' COMMENT '用户评分 {text}' AFTER `phone`;