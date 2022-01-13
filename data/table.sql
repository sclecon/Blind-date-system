-- The create mysql table script file
-- user table
CREATE TABLE `user` (
    `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COLLATE '用户UID',
    `username` varchar(64) NOT NULL COMMENT '用户名 {text}',
    'phone' varchar(16) NOT NULL COMMENT '手机号 {text}',
    'avatars' text DEFAULT NULL COMMENT '头像照片 最多五张 {images}',
    `remark` varchar(255) DEFAULT NULL COMMENT '个人介绍 {textarea}',
    `longitude` varchar(255) DEFAULT NULL COMMENT '经度 {text}',
    `dimension` varchar(255) DEFAULT NULL COMMENT '维度 {text}',
    `edu` int(1) DEFAULT NULL COMMENT '学历 {radio} (1:初中, 2:中专, 3:高中, 4:大专, 5:本科, 6:硕士, 7:博士, 8:博士后)',
    `sex` int(1) DEFAULT 0 COMMENT '性别 {radio} (0:未知, 1:男, 2:女)',
    `birthday` date DEFAULT NULL COMMENT '生日 {text}',
    `height` int(3) DEFAULT NULL COMMENT '身高 {text}',
    `city` varchar(255) DEFAULT NULL COMMENT '城市 {text}',
    `address` varchar(255) DEFAULT NULL COMMENT '居住地 {text}',
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

    'status' int(1) NOT NULL DEFAULT 1 COMMENT '会员状态',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT  CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户信息表';

-- news table
CREATE TABLE `news` (
    `news_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COLLATE '新闻ID',
    `subject` varchar(255) NOT NULL COMMENT '新闻标题 {text}',
    `message` text NOT NULL COMMENT '新闻内容 {editor}',
    'status' int(1) NOT NULL DEFAULT 1 COMMENT '新闻状态',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT  CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='广告新闻表';

-- event table
CREATE TABLE `event` (
    `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COLLATE '活动ID',
    `subject` varchar(255) NOT NULL COMMENT '活动标题 {text}',
    `image` varchar(255) NOT NULL COMMENT '封面图 {image}',
    `message` text NOT NULL COMMENT '活动内容 {editor}',
    `flag` int(1) NOT NULL DEFAULT 1 COMMENT '活动状态 {radio} (1:进行中, 0:已结束)',
    'status' int(1) NOT NULL DEFAULT 1 COMMENT '数据状态',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT  CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='活动数据表';

-- event_join table
CREATE TABLE `event_join` (
    `join_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COLLATE '数据ID',
    `event_id` bigint(20) unsigned NOT NULL COLLATE '活动ID',
    `user_id` bigint(20) unsigned NOT NULL COLLATE '用户UID',
    'status' int(1) NOT NULL DEFAULT 1 COMMENT '数据状态',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`join_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT  CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='活动参与表';

-- user_pay table
CREATE TABLE `user_pay` (
    `pay_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COLLATE '数据ID',
    `order_id` varchar(32) NOT NULL COLLATE '订单ID',
    `user_id` bigint(20) unsigned NOT NULL COLLATE '下单会员ID',
    `buy_user_id` bigint(20) unsigned NOT NULL COLLATE '购买会员ID',
    `subject` varchar(255) NOT NULL COMMENT '订单标题 {text}',
    `total` float(11,2) NOT NULL COLLATE '支付金额 {text}',
    `flag` int(1) NOT NULL DEFAULT 0 COMMENT '支付状态 {radio} (1:支付完成, 0:未支付)',
    'status' int(1) NOT NULL DEFAULT 1 COMMENT '数据状态',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT  CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='VIP购买表';

-- feedback table
CREATE TABLE `feedback` (
    `feedback_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COLLATE '数据ID',
    `user_id` varchar(32) NOT NULL COLLATE '用户ID',
    'phone' varchar(16) NOT NULL COMMENT '手机号 {text}',
    `message` varchar(255) NOT NULL COMMENT '反馈内容 {textarea}',
    'status' int(1) NOT NULL DEFAULT 1 COMMENT '数据状态',
    `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
    `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
    `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
    PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT  CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='意见反馈表';