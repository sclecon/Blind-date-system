define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'event.join/index',
        add_url: 'event.join/add',
        edit_url: 'event.join/edit',
        delete_url: 'event.join/delete',
        export_url: 'event.join/export',
        modify_url: 'event.join/modify',
        pk: 'join_id'
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                toolbar: ['delete', 'export'],
                cols: [[
                    {type: 'checkbox'},
                    {field: 'join_id', title: '记录ID'},
                    {field: 'event_id', title: '活动ID'},
                    {field: 'user_id', title: '用户UID'},
                    {field: 'username', title: '用户名'},
                    {field: 'phone', title: '手机号'},
                    // {field: 'status', title: '数据状态', templet: ea.table.switch},
                    {field: 'create_time', title: '报名时间'},
                    {width: 250, title: '操作', templet: ea.table.tool, operat: ['delete']},
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