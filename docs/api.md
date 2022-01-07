#### 服务Host
    https://xxx.xxx.com
#### 接口规范
###### request body
    {
        ... // 传递的各种参数数据
    }
###### request header
    {
        authentication: authentication // 用户登录成功token 所有和用户挂钩的接口都需要传递 反则则无需传递 
    }
###### response
    {
        msg: 'success' // 接口返回提示信息
        code: 200 // 接口状态码 目前来说正常返回 状态码均为200 反则则错误
        data: [] // 接口返回数据 不一定会存在
    }
#### 用户接口
##### 注册
###### address
    post /user/register
###### request
    {
        phone: 手机号
        sex: 性别 // 1=男 2=女
        msg_id: 验证码ID
        code: 验证码
    }
###### response
    {
        profile: 1 // 资料完善程度 1=已完善 0=未完善
        authentication: 用户登录成功token //接下来所有和用户相关的请求都需要放在header中
    }
##### 登录
###### address
    post /user/login
###### request
    {
        phone: 手机号
        msg_id: 验证码ID
        code: 验证码
    }
###### response
    {
        profile: 1 // 资料完善程度 1=已完善 0=未完善
        authentication: 用户登录成功token //接下来所有和用户相关的请求都需要放在header中
    }
##### 发送验证码
###### address
    post /utils/send_code
###### request
    {
        phone: 手机号
    }
###### response
    {
        code_id: 验证码ID
    }

#### 活动
##### 活动列表
###### address
    post /event/list
###### request
    {
        page: 1 // 第几页
        number: 10 // 一页多少条数据
    }
###### response
    [
        {
            image:image // 活动配图
            event_id:event_id //活动ID
            subject:subject // 活动标题
            starttime:starttime // 活动开始时间
        },
        {
            image:image // 活动配图
            event_id:event_id //活动ID
            subject:subject // 活动标题
            starttime:starttime // 活动开始时间
        }
    ]
##### 活动详情
###### address
    post /event/detail
###### request
    {
        event_id: 活动ID
    }
###### response
    {
        event_id: 活动ID
        image: 活动配图
        subject: 活动标题
        join_status: 加入状态 // 1=可加入 0=已结束 2=已加入
        message: 活动详情 // 富文本数据 需要用v-html进行输出
    }
#### 用户列表
###### address 
    post /user/list
###### request
    {
        sex: 1 // 1=男 2=女
        longitude: longitude // 定位中 经度
        dimension: dimension // 定位中 维度
        city: 成都 // 城市名称或城市ID
        sex: sex // 年龄（可选参数）
        height: height // 身高（可选参数）
        live_address: live_address // 居住地址（可选参数）
        work_address: work_address // 工作地址（可选参数）
        monthly_income: monthly_income // 月收入（可选参数）
        eduction: eduction // 学历（可选参数）
        marriage: marriage // 婚姻状态（可选参数）
        house_purchase: house_purchase // 购房状态（可选参数）
        search: search // 搜索框 搜索内容=手机号、用户昵称（可选参数）
    }
###### response
    [
        {
            user_id: user_id // 用户ID
            avatar: avatar // 用户头像
            vip: 1 // 是否为VIP 1=是 0=否
            verify: verify // 是否为认证用户 1=是 0=否
            username: username // 用户昵称
            age: age // 用户年龄
            sex: sex // 用户心别 1=男 2=女
            weight: weight // 用户权重
        }
    ]