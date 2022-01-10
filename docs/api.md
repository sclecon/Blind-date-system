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
#### 用户详情
###### address 
    post /user/detail
###### request
    {
        user_id: user_id // 用户UID
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
#### 下单支付
###### address 
    post /user/pay
###### request
    {
        user_id: user_id // 购买的用户UID
    }
###### response
    {
        timeStamp: timeStamp
        nonceStr: nonceStr
        package: package
        signType: signType
        paySign: paySign
    }
#### 获取支付结果
###### address 
    post /user/pay_status
###### request
    {
        user_id: user_id // 购买的用户UID
    }
###### response
    {
        pay_user_id: pay_user_id // 被购买的用户ID
        pay_status: pay_status // 支付结果 1=已支付 0=未支付
    }
#### 修改头像
###### address 
    post /user/upload/avatar
###### request
    {
        avatar: file // 头像图片文件
    }
###### response
    {
        avatar: avatar // 新头像地址
    }
#### 编辑资料
###### address 
    post /user/update/profile
###### request
    {
        profile: profile // 资料信息数组 待定
    }
###### response
    {
        profile: profile // 新资料信息数组 待定
    }
#### 提交反馈
###### address 
    post /feedback/send
###### request
    {
        phone: phone // 联系电话
        message: message // 反馈信息
    }
###### response
    {
        feedback_id: feedback_id // 反馈ID
    }
#### 我参与的活动
###### address 
    post /user/event/list
###### request
    {}
###### response
    [
        {
            event_id: event_id // 活动ID
            subject: subject // 活动标题
        }，
        {
            event_id: event_id // 活动ID
            subject: subject // 活动标题
        }
    ]
#### 广告列表
###### address 
    post /ad/list
###### request
    {}
###### response
    [
        {
            ad_id: ad_id // 广告ID
            subject: subject // 广告标题
        }，
        {
            ad_id: ad_id // 广告ID
            subject: subject // 广告标题
        }
    ]
#### 广告详情
###### address 
    post /ad/detail
###### request
    {
        ad_id: ad_id // 广告ID
    }
###### response
    {
        ad_id: ad_id // 广告ID
        subject: subject // 广告标题
        message: message // 广告内容 html格式 需要用v-html进行渲染
    }
