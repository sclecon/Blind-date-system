#### 服务Host
    https://xxx.xxx.com
#### 接口规范
##### request body
    {
        ... // 传递的各种参数数据
    }
##### request header
    {
        authentication: authentication // 用户登录成功token 所有和用户挂钩的接口都需要传递 反则则无需传递 
    }
##### response
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
        authentication: 用户登录成功token //接下来所有和用户相关的请求都需要放在header中
    }
##### 发送验证码
###### address
    post /user/login
###### request
    {
        phone: 手机号
    }
###### response json
    {
        code_id: 验证码ID
    }

#### 活动
##### 活动列表
###### response
    [
        {image:活动配图,event_id:活动ID,subject:活动标题,starttime:活动开始时间}
    ]
##### 活动详情
###### response
    {
        event_id: 活动ID
        image: 活动配图
        subject: 活动标题
        join_status: 加入状态 // 1=可加入 0=已结束 2=已加入
        message: 活动详情 // 富文本数据 需要用v-html进行输出
    }
    