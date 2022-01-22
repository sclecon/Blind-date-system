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
                    {type: 'checkbox'},
                    {field: 'event_id', title: '活动ID'},
                    {field: 'subject', title: '活动标题'},
                    {field: 'remark', title: '活动简介', templet: ea.table.text},
                    {field: 'image', title: '封面图', templet: ea.table.image},
                    {field: 'start_time', title: '活动开始时间'},
                    {field: 'over_time', title: '活动结束时间'},
                    {field: 'flag', search: 'select', selectList: {"1":"未开始","2":"进行中","3":"已结束"}, title: '活动状态'},
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