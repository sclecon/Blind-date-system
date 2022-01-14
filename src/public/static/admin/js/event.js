define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'event/index',
        add_url: 'event/add',
        edit_url: 'event/edit',
        delete_url: 'event/delete',
        export_url: 'event/export',
        modify_url: 'event/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},                    {field: 'event_id', title: '活动ID'},                    {field: 'subject', title: '活动标题'},                    {field: 'image', title: '封面图', templet: ea.table.image},                    {field: 'flag', search: 'select', selectList: {"1":"进行中","0":"已结束"}, title: '活动状态'},                    {field: 'status', title: '数据状态', templet: ea.table.switch},                    {field: 'create_time', title: '创建时间'},                    {width: 250, title: '操作', templet: ea.table.tool},
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