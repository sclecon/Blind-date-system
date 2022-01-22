define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'send.code/index',
        add_url: 'send.code/add',
        edit_url: 'send.code/edit',
        delete_url: 'send.code/delete',
        export_url: 'send.code/export',
        modify_url: 'send.code/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},                    {field: 'send_id', title: '数据ID'},                    {field: 'phone', title: '手机号'},                    {field: 'code', title: '验证码'},                    {field: 'status', search: 'select', selectList: {"1":"验证完成","0":"等待验证"}, title: '数据状态', templet: ea.table.switch},                    {field: 'create_time', title: '创建时间'},                    {width: 250, title: '操作', templet: ea.table.tool},
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