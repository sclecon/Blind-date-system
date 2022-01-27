define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'feedback/index',
        add_url: 'feedback/add',
        edit_url: 'feedback/edit',
        delete_url: 'feedback/delete',
        export_url: 'feedback/export',
        modify_url: 'feedback/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                toolbar: ['refresh', 'export'],
                cols: [[
                    {type: 'checkbox'},
                    {field: 'feedback_id', title: '数据ID'},
                    {field: 'user_id', title: '用户ID'},
                    {field: 'phone', title: '手机号'},
                    {field: 'message', title: '反馈内容'},
                    // {field: 'status', title: '数据状态', templet: ea.table.switch},
                    {field: 'create_time', title: '反馈时间'},
                    // {width: 250, title: '操作', templet: ea.table.tool},
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