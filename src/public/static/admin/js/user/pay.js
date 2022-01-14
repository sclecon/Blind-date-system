define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'user.pay/index',
        add_url: 'user.pay/add',
        edit_url: 'user.pay/edit',
        delete_url: 'user.pay/delete',
        export_url: 'user.pay/export',
        modify_url: 'user.pay/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},                    {field: 'pay_id', title: '数据ID'},                    {field: 'order_id', title: '订单ID'},                    {field: 'user_id', title: '下单会员ID'},                    {field: 'buy_user_id', title: '购买会员ID'},                    {field: 'subject', title: '订单标题'},                    {field: 'total', title: '支付金额'},                    {field: 'flag', search: 'select', selectList: {"1":"支付完成","0":"未支付"}, title: '支付状态'},                    {field: 'status', title: '数据状态', templet: ea.table.switch},                    {field: 'create_time', title: '创建时间'},                    {field: 'user.user_id', title: '用户UID'},                    {field: 'user.username', title: '用户名'},                    {field: 'user.phone', title: '手机号'},                    {field: 'user.remark', title: '个人介绍', templet: ea.table.text},                    {field: 'user.longitude', title: '经度'},                    {field: 'user.dimension', title: '维度'},                    {field: 'user.edu', title: '学历'},                    {field: 'user.sex', title: '性别'},                    {field: 'user.birthday', title: '生日'},                    {field: 'user.height', title: '身高'},                    {field: 'user.city', title: '城市'},                    {field: 'user.address', title: '居住地'},                    {field: 'user.marriage', title: '婚姻状况'},                    {field: 'user.children', title: '子女状况'},                    {field: 'user.native', title: '籍贯'},                    {field: 'user.nation', title: '民族'},                    {field: 'user.blood', title: '血型'},                    {field: 'user.weight', title: '体重'},                    {field: 'user.occupation', title: '职业'},                    {field: 'user.school', title: '毕业学校'},                    {field: 'user.major', title: '所学专业'},                    {field: 'user.house', title: '购房情况'},                    {field: 'user.car_buy', title: '购车情况'},                    {field: 'user.status', title: '会员状态', templet: ea.table.switch},                    {field: 'user.create_time', title: '创建时间'},                    {width: 250, title: '操作', templet: ea.table.tool},
                ]],
            });

            ea.listen();
        },
        add: function () {
            ea.listen();
        },
        edit: function () {
            ea.listen();
        },
    };
    return Controller;
});