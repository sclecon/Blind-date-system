define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'vip/index',
        add_url: 'vip/add',
        edit_url: 'vip/edit',
        delete_url: 'vip/delete',
        export_url: 'vip/export',
        modify_url: 'vip/modify',
        pk: 'vip_id',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},
                    {field: 'vip_id', title: '数据ID'},
                    {field: 'name', title: 'VIP套餐名称'},
                    {field: 'days', title: '有效天数'},
                    {field: 'numbers', title: '授权次数'},
                    {field: 'total_fee', title: '开通金额'},
                    {field: 'weight', title: '套餐权重'},
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