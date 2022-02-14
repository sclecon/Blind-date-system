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
        pk: 'event_id',
        join_url: 'event.join/index'
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},
                    {field: 'event_id', title: 'ID'},
                    {field: 'subject', title: '标题'},
                    {field: 'remark', title: '简介'},
                    {field: 'image', title: '封面图', templet: ea.table.image},
                    {field: 'total_fee', title: '价格'},
                    {field: 'address', title: '地址'},
                    {field: 'start_time', title: '开始时间'},
                    {field: 'over_time', title: '结束时间'},
                    {field: 'flag', search: 'select', selectList: {"1":"未开始","2":"进行中","3":"已结束"}, title: '活动状态'},
                    {field: 'create_time', title: '创建时间'},
                    {width: 250, title: '操作', templet: ea.table.tool, operat: [
                            [{
                                class: 'layui-btn layui-btn-xs layui-btn-success',
                                method: 'open',
                                text: '参与记录',
                                auth: 'edit',
                                url: init.join_url,
                                extend: 'data-full="true"',
                                field: 'event_id',
                            }],
                            'edit',
                            'delete'
                        ]
                    },
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