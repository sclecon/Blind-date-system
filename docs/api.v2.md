# API文档 v2
## 服务HOST
    https://xxx.xxx.com

## 接口规范
### Method
    POST
### Request
#### Header
    {
        authentication: authentication // authentication是用户凭证 可以通过登录接口和注册接口获取
    }
#### FormData
    {
        ... // 各种需要传递的参数
    }
### Response
    {
        msg: 'success' // 接口返回提示信息
        code: 200 // 接口状态码 接口调用正常则返回的是200 其他数值均为出现错误并终止
        data: [] // 接口返回数据 不一定会存在
    }
## 接口列表
### 发送验证码
#### Address
    /utils/send_code
#### Header
    {}
#### FormData
    {
        phone:18583761234 // 手机号
    }
#### Response
    {
        "code_id": "6" // 验证码ID
    }

### 注册账号
#### Address
    /user/register
#### Header
    {}
#### FormData
    {
        phone:18583761234 // 手机号
        sex:1 // 性别 1男 2女
        msg_id:5 // 验证码ID 发送验证码接口返回的code_id
        code:966979 // 验证码
        longitude:116.371335 // 经度
        dimension:39.938192 // 纬度
    }
#### Response
    {
        "authentication": "zdGwfluKRoPHDVoAtUuXz3se7k89br7b4D3BCod/RBLBLMbA5L7KG5q6SmU7SzcWu4ssn8Cg0+PS3TCuiDhnUQ==", // 用户Token
        "profile": 0 // 用户资料完善情况 0=未完善 1=已完善
    }

### 登录账号
#### Address
    /user/login
#### Header
    {}
#### FormData
    {
        phone:18583761234 // 手机号
        msg_id:5 // 验证码ID 发送验证码接口返回的code_id
        code:966979 // 验证码
        longitude:116.371335 // 经度
        dimension:39.938192 // 纬度
    }
#### Response
    {
        "authentication": "zdGwfluKRoPHDVoAtUuXz3se7k89br7b4D3BCod/RBLBLMbA5L7KG5q6SmU7SzcWu4ssn8Cg0+PS3TCuiDhnUQ==", // 用户Token
        "profile": 0 // 用户资料完善情况 0=未完善 1=已完善
    }

### 活动列表
#### Address
    /event/list
#### Header
    {}
#### FormData
    {
        page:1 // 分页第几页 默认为1
        number:10 // 分页 一页多少条数据 默认为10
        flag:0 // 活动状态 1=未开始 2=已开始 3=已结束 默认为0 不限
    }
#### Response
    {
        "list": [
            {
                "event_id": 1,    // 活动ID
                "image": "http://127.0.0.1:3332/upload/20220122/9609236875bed1e293421ec0d26dd6ba.jpg",    // 活动封面
                "subject": "Coco 成都 2020/7/1国际动漫节 ",    // 活动标题
                "remark": "Coco 成都 2020/7/1国际动漫节 的简单介绍",    // 活动简介
                "start_time": "2022-01-24 00:00:00",    // 活动开始时间
                "over_time": "2022-01-31 00:00:00",     // 活动结束时间
                "flag": 1    // 活动状态 1=未开始 2=已开始 3=已结束
            }
        ]
    }

### 活动详情
#### Address
    /event/detail
#### Header
    {}
#### FormData
    {
        event_id:1    // 活动ID
    }
#### Response
    {
        "event_id": 1,    // 活动ID
        "image": "http://127.0.0.1:3332/upload/20220122/9609236875bed1e293421ec0d26dd6ba.jpg",    // 活动封面
        "subject": "Coco 成都 2020/7/1国际动漫节 ",    // 活动标题
        "remark": "Coco 成都 2020/7/1国际动漫节 的简单介绍",    // 活动简介
        "message": "&lt;p&gt;Coco 成都 2020/7/1国际动漫节&amp;nbsp;Coco 成都 2020/7/1国际动漫节&amp;nbsp; editor&lt;/p&gt;\n",    // 活动详情
        "start_time": "2022-01-24 00:00:00",    // 活动开始时间
        "over_time": "2022-01-31 00:00:00",    // 活动结束时间
        "flag": 1    // 活动状态 1=未开始 2=已开始 3=已结束
    }

### 参加活动
#### Address
    /event/join
#### Header
    {
        authentication:zdGwfluKRoPHDVoAtUuXz3se7k89br7b4D3BCod/RBKdWJRzC65dH9ZH9fbZk6MuUkZYGLbFBdU0UQ5VmkPO6Q==    // 用户Token
    }
#### FormData
    {
        event_id:1    // 活动ID
    }
#### Response
    {
        "join_id": 2    // 参加成功ID
    }

### 活动参与记录
#### Address
    /event/logs
#### Header
    {
        authentication:zdGwfluKRoPHDVoAtUuXz3se7k89br7b4D3BCod/RBKdWJRzC65dH9ZH9fbZk6MuUkZYGLbFBdU0UQ5VmkPO6Q==    // 用户Token
    }
#### FormData
    {}
#### Response
    {
        "list": [
            {
                "join_id": 2,    // 参加成功ID
                "user_id": 4,    // 用户ID
                "event_id": 1,    // 活动ID
                "join_time": "2022-01-26 15:28:32",    // 加入活动时间
                "subject": "Coco 成都 2020/7/1国际动漫节 ",    // 活动标题
                "image": "http://127.0.0.1:3332/upload/20220122/9609236875bed1e293421ec0d26dd6ba.jpg",    // 活动封面图
                "username": "sclecon",    // 用户名
                "phone": "18583761997"    // 用户手机号
            }
        ]
    }

### 提交反馈
#### Address
    /feedback/send
#### Header
    {
        authentication:zdGwfluKRoPHDVoAtUuXz3se7k89br7b4D3BCod/RBKdWJRzC65dH9ZH9fbZk6MuUkZYGLbFBdU0UQ5VmkPO6Q==    // 用户Token
    }
#### FormData
    {
        message:2.23的反馈内容2    // 反馈内容
    }
#### Response
    {
        "feedback_id": "4"    // 反馈成功ID
    }

### 上传图片
#### Address
    /utils/upload/image
#### Header
    {}
#### FormData
    {
        file:file    // 上传的图片文件
    }
#### Response
    {
        "url": "http://127.0.0.1:3332/upload/20220126/1b0d5810b26d5273df993b665248931c.jpg"    // 上传成功后的图片路径
    }

### 更新头像
#### Address
    /user/upgrade/avatar
#### Header
    {
        authentication:zdGwfluKRoPHDVoAtUuXz3se7k89br7b4D3BCod/RBKdWJRzC65dH9ZH9fbZk6MuUkZYGLbFBdU0UQ5VmkPO6Q==    // 用户Token
    }
#### FormData
    {
        avatar[]:http://127.0.0.1:3332/upload/20220118/1c33f1b34962a6f908648b3868a3e1ae.png    // 头像图片1
        avatar[]:http://127.0.0.1:3332/upload/20220118/1c33f1b34962a6f908648b3868a3e1ae.png    // 头像图片2
    }
#### Response
    {
        "avatar": [    // 更新的头像数据
            "http://127.0.0.1:3332/upload/20220118/1c33f1b34962a6f908648b3868a3e1ae.png",
            "http://127.0.0.1:3332/upload/20220118/1c33f1b34962a6f908648b3868a3e1ae.png"
        ]
    }

### 更新用户资料
#### Address
    /user/upgrade/profile
#### Header
    {
        authentication:zdGwfluKRoPHDVoAtUuXz3se7k89br7b4D3BCod/RBKdWJRzC65dH9ZH9fbZk6MuUkZYGLbFBdU0UQ5VmkPO6Q==    // 用户Token
    }
#### FormData
    {
        // profile list 下面这些参数均非必须传递 
        username: 'username',    // 用户名
        remark: '我是一个可爱的人儿',    // 个人简介
        edu: '1',    // 学历 1:初中, 2:中专, 3:高中, 4:大专, 5:本科, 6:硕士, 7:博士, 8:博士后
        sex: '1',    // 性别 1男 2女
        birthday: '2000-01-01',    // 生日 年月日date格式
        height: '175',        // 身高 单位cm
        city: '成都市',    // 工作城市
        address: '成都市',    // 居住城市
        income: '1',     // 月收入 1:3000元以内, 2:3000-5000元, 3:5000-10000元, 4:10000-30000元, 5:30000元以上
        marriage: '1',     // 婚姻情况 1:未婚, 2:离异, 3:丧偶, 4:已婚
        children: '1',     // 子女情况 0:没有, 1:有
        native: "四川省成都市武侯区**街道**小区**号",    // 籍贯
        nation: '汉族',    // 名族
        blood: '1',    // 1:A, 2:B, 3:AB, 4:0, 5:其他
        weight: '140',    // 体重 单位斤
        occupation: "程序员",     // 职业
        school: "四川大学",        // 毕业学校
        major: '计算机与应用',        // 所学专业
        house: '5',    // 购房情况 1:已购房无贷款, 2:已购房有贷款, 3:与父母同住, 4:暂未购房, 5:租房
        car_buy: '1'    // 买车情况 1:已买车, 2:未买车
    }
#### Response
    {
        // 提交了那些需要更改的数据则返回对应更改成功的数据
        "city": "成都" // 更改工作城市成功
    }

### 获取我的信息
#### Address
    /user/detail
#### Header
    {
        authentication:zdGwfluKRoPHDVoAtUuXz3se7k89br7b4D3BCod/RBKdWJRzC65dH9ZH9fbZk6MuUkZYGLbFBdU0UQ5VmkPO6Q==    // 用户Token
    }
#### FormData
    {}
#### Response
    {
        "user_id": 4,    // 用户ID
        "username": "sclecon",    // 用户昵称
        "phone": "18583761997",    // 用户手机号
        "avatar": [    // 用户头像数组
            "http://127.0.0.1:3332/upload/20220118/1c33f1b34962a6f908648b3868a3e1ae.png"    // 用户头像1
        ],
        "remark": "",    // 个人简介
        "edu": 5,    // 学历
        "sex": 1,        // 性别
        "birthday": "2000-05-14", // 生日
        "height": 175, // 身高 单位cm
        "city": "成都",    // 工作地
        "address": "成都市", // 居住地
        "income": 3, // 月收入
        "marriage": 1, // 婚姻情况
        "children": 0, // 子女情况
        "native": "",    // 籍贯
        "nation": "", // 民族
        "blood": "5", // 血型
        "weight": 0, // 体重
        "occupation": "", // 职业
        "school": "", // 毕业学校
        "major": "", // 所学专业
        "house": 5, // 购房情况
        "car_buy": null, // 购车情况
        "create_time": "2022-01-22 21:54:54" // 注册时间
        "edu_str": "本科", //  学历明文
        "sex_str": "男", // 性别明文
        "income_str": "5000-10000元",    // 月收入明文
        "marriage_str": "未婚",   // 婚姻状态明文
        "children_str": "没有",   // 子女情况明文
        "blood_str": "其他",      // 血型明文
        "house_str": "租房",      // 购房情况明文
        "car_buy_str": "暂未选择",  // 购车情况明文
        "age": 22   // 年龄
    }

### 获取他人信息
#### Address
    /user/detail
#### Header
    {}
#### FormData
    {
        user_id: 1 // 用户ID
    }
#### Response
    {
        "user_id": 4,    // 用户ID
        "username": "sclecon",    // 用户昵称
        "phone": "18583761997",    // 用户手机号
        "avatar": [    // 用户头像数组
            "http://127.0.0.1:3332/upload/20220118/1c33f1b34962a6f908648b3868a3e1ae.png"    // 用户头像1
        ],
        "remark": "",    // 个人简介
        "edu": 5,    // 学历
        "sex": 1,        // 性别
        "birthday": "2000-05-14", // 生日
        "height": 175, // 身高 单位cm
        "city": "成都",    // 工作地
        "address": "成都市", // 居住地
        "income": 3, // 月收入
        "marriage": 1, // 婚姻情况
        "children": 0, // 子女情况
        "native": "",    // 籍贯
        "nation": "", // 民族
        "blood": "5", // 血型
        "weight": 0, // 体重
        "occupation": "", // 职业
        "school": "", // 毕业学校
        "major": "", // 所学专业
        "house": 5, // 购房情况
        "car_buy": null, // 购车情况
        "create_time": "2022-01-22 21:54:54" // 注册时间
        "edu_str": "本科", //  学历明文
        "sex_str": "男", // 性别明文
        "income_str": "5000-10000元",    // 月收入明文
        "marriage_str": "未婚",   // 婚姻状态明文
        "children_str": "没有",   // 子女情况明文
        "blood_str": "其他",      // 血型明文
        "house_str": "租房",      // 购房情况明文
        "car_buy_str": "暂未选择",  // 购车情况明文
        "age": 22   // 年龄
    }

### 获取用户列表
#### Address
    /user/list
#### Header
    {
        authentication:zdGwfluKRoPHDVoAtUuXz3se7k89br7b4D3BCod/RBKdWJRzC65dH9ZH9fbZk6MuUkZYGLbFBdU0UQ5VmkPO6Q==    // 用户Token
    }
#### FormData
    {
        sex:1    // 性别 1男 2女 必须传递
        city:成都市 // 工作城市 必须传递
        longitude:1 // 经度 必须传递
        dimension:2 // 维度 必须传递
        age:18-30 // 年龄范围 非必传
        height:160-180 // 身高范围 非必传
        address:成都市 // 居住地 非必传
        income:1 // 月收入 非必传
        edu:5 // 学历 非必传
        marriage:1 // 婚姻情况 非必传
        house:5 // 购房情况 非必传
        search:sclecon 搜索手机号或用户名 非必传
        page: 1 // 分页 非必传 默认1
        number: 10 // 每页多少条数据 非必传 默认10
    }
#### Response
    {
        "list": [
            {
                "user_id": 4, // 用户ID
                "username": "sclecon", // 用户名
                "avatar": [ // 头像数组
                    "http://127.0.0.1:3332/upload/20220118/1c33f1b34962a6f908648b3868a3e1ae.png"
                ],
                "remark": "", // 个人简介
                "sex": "男",    // 性别
                "location": "12001.814千米", // 距离
                "height": "175",    // 身高
                "birthday": "2000-05-14",   // 生日
                "age": 22   // 年龄
            }
        ]
    }

### 获取新闻广告列表
#### Address
    /news/list
#### Header
    {}
#### FormData
    {
        page:1    // 分页 默认1
        number:10 // 每页数量 默认10
    }
#### Response
    {
        "list": [
            {
                "news_id": 1,    // 新闻广告ID
                "subject": "新闻标题", // 新闻广告标题
                "create_time": "2021-03-28 21:15:46" // 发布时间
            }
        ]
    }

### 获取新闻广告详情
#### Address
    /news/detail
#### Header
    {}
#### FormData
    {
        news_id: 1    // 新闻广告ID
    }
#### Response
    {
        "news_id": 1,    // 新闻广告ID
        "subject": "新闻标题",    // 新闻广告标题
        "message": "新闻内容",    // 新闻广告内容
        "create_time": "2021-03-28 21:15:46" // 发布时间
    }

### 创建订单
#### Address
    /order/create
#### Header
    {
        authentication:zdGwfluKRoPHDVoAtUuXz3se7k89br7b4D3BCod/RBKdWJRzC65dH9ZH9fbZk6MuUkZYGLbFBdU0UQ5VmkPO6Q==    // 用户Token
    }
#### FormData
    {
        user_id: 1    // 被购买的用户ID
        code: "..."     // 当前用户微信授权code
    }
#### Response
    {
        "pay_id": "3",    // 系统自定义支付ID
        "order_id": "1643185177957128",    // 订单号
        "config": {    // 小程序支付所需数据
            "appId": "wx26e025fee547cd1b",
            "timeStamp": "1643185178",
            "nonceStr": "61f1041a11d93",
            "package": "prepay_id=wx26161937984975603cb1b852b31c090000",
            "signType": "MD5",
            "paySign": "4C92B810B839BB64391DBCF1612F8836"
        }
    }

### 获取支付状态
#### Address
    /order/status
#### Header
    {
        authentication:zdGwfluKRoPHDVoAtUuXz3se7k89br7b4D3BCod/RBKdWJRzC65dH9ZH9fbZk6MuUkZYGLbFBdU0UQ5VmkPO6Q==    // 用户Token
    }
#### FormData
    {
        order_id: 1643185177957128    // 订单号
    }
#### Response
    {
        "order_id": "1643185177957128",    // 订单号
        "status": 0    // 支付状态 1=已支付 0=未支付
    }

### 查询用户购买情况
#### Address
    /order/query
#### Header
    {
        authentication:zdGwfluKRoPHDVoAtUuXz3se7k89br7b4D3BCod/RBKdWJRzC65dH9ZH9fbZk6MuUkZYGLbFBdU0UQ5VmkPO6Q==    // 用户Token
    }
#### FormData
    {
        user_id: 1    // 被购买的用户ID
    }
#### Response
    {
        "user_id": "3",    // 被购买的用户ID
        "status": 0        // 购买状态 0未购买 1已购买
    }
    