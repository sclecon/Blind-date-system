-- The create mysql table script file
-- user table
CREATE TABLE `user` (
    `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COLLATE '用户UID',
    `username` varchar(64) NOT NULL COMMENT '用户名',
    'phone' varchar(16) NOT NULL COMMENT '手机号',
    'avatars' text DEFAULT NULL COMMENT '头像照片 最多五张',
    `remark` varchar(255) DEFAULT NULL COMMENT '个人介绍',
    `longitude` varchar(255) DEFAULT NULL COMMENT '经度',
    `dimension` varchar(255) DEFAULT NULL COMMENT '维度',
    `edu` int(11) DEFAULT NULL COMMENT '学历',
    `sex` int(1) DEFAULT 0 COMMENT '性别',
    `birthday` int(11) DEFAULT NULL COMMENT '生日',
    `height` int(11) DEFAULT NULL COMMENT '身高',
    `city` varchar(255) DEFAULT NULL COMMENT '城市',
    `address` varchar(255) DEFAULT NULL COMMENT '居住地',
    `marriage` int(11) DEFAULT NULL COMMENT '婚姻状况',
    `children` int(11) DEFAULT NULL COMMENT '子女状况',

    `native` varchar(11) DEFAULT NULL COMMENT '籍贯',
    `nation` varchar(32) DEFAULT NULL COMMENT '民族',
    `blood` varchar(32) DEFAULT NULL COMMENT '血型',
    `weight` varchar(32) DEFAULT NULL COMMENT '体重',
    `occupation` varchar(32) DEFAULT NULL COMMENT '职业',
    `school` varchar(255) DEFAULT NULL COMMENT '毕业学校',
    `major` varchar(255) DEFAULT NULL COMMENT '所学专业',
    `house` varchar(255) DEFAULT NULL COMMENT '购房情况',
    `constitute` varchar(255) DEFAULT NULL COMMENT '构成情况',

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