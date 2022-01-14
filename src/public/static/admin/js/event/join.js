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
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},                    {field: 'join_id', title: '数据ID'},                    {field: 'event_id', title: '活动ID'},                    {field: 'user_id', title: '用户UID'},                    {field: 'status', title: '数据状态', templet: ea.table.switch},                    {field: 'create_time', title: '创建时间'},                    {field: 'event.event_id', title: '活动ID'},                    {field: 'event.subject', title: '活动标题'},                    {field: 'event.image', title: '封面图', templet: ea.table.image},                    {field: 'event.flag', title: '活动状态'},                    {field: 'event.status', title: '数据状态', templet: ea.table.switch},                    {field: 'event.create_time', title: '创建时间'},                    {width: 250, title: '操作', templet: ea.table.tool},
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