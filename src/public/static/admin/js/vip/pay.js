define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'vip.pay/index',
        add_url: 'vip.pay/add',
        edit_url: 'vip.pay/edit',
        delete_url: 'vip.pay/delete',
        export_url: 'vip.pay/export',
        modify_url: 'vip.pay/modify',
        pk: 'pay_id',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                toolbar: ['refresh', 'delete', 'export'],
                cols: [[
                    {type: 'checkbox'},
                    {field: 'pay_id', title: '数据ID'},
                    {field: 'vip_id', title: 'VIP套餐ID'},
                    {field: 'user_id', title: '用户UID'},
                    {field: 'order_id', title: '订单号'},
                    {field: 'name', title: 'VIP套餐名称'},
                    {field: 'total_fee', title: '支付金额'},
                    {field: 'days', title: '有效天数'},
                    {field: 'numbers', title: '授权次数'},
                    {field: 'flag', search: 'select', selectList: {"1":"支付完成","0":"未支付"}, title: '支付状态'},
                    {field: 'status', search: 'select', selectList: {"1":"数据正常","0":"已失效"}, title: '数据状态', templet: ea.table.switch},
                    {field: 'create_time', title: '创建时间'},
                    {width: 250, title: '操作', templet: ea.table.tool},
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