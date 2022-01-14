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
                    {type: 'checkbox'},                    {field: 'pay_id', title: '数据ID'},                    {field: 'order_id', title: '订单ID'},                    {field: 'user_id', title: '下单会员ID'},                    {field: 'buy_user_id', title: '购买会员ID'},                    {field: 'subject', title: '订单标题'},                    {field: 'total', title: '支付金额'},                    {field: 'flag', search: 'select', selectList: {"1":"支付完成","0":"未支付"}, title: '支付状态'},                    {field: 'status', title: '数据状态', templet: ea.table.switch},                    {field: 'create_time', title: '创建时间'},                    {field: 'event.event_id', title: '活动ID'},                    {field: 'event.subject', title: '活动标题'},                    {field: 'event.image', title: '封面图', templet: ea.table.image},                    {field: 'event.flag', title: '活动状态'},                    {field: 'event.status', title: '数据状态', templet: ea.table.switch},                    {field: 'event.create_time', title: '创建时间'},                    {width: 250, title: '操作', templet: ea.table.tool},
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