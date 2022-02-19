define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'circle/index',
        add_url: 'circle/add',
        edit_url: 'circle/edit',
        delete_url: 'circle/delete',
        export_url: 'circle/export',
        modify_url: 'circle/modify',
        pk: 'circle_id',
        join_url: 'circle.join/index'
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},
                    {field: 'circle_id', title: '数据ID'},
                    {field: 'name', title: '圈子名称'},
                    {field: 'intro', title: '圈子说明'},
                    {field: 'join', title: '加入人数'},
                    {field: 'weight', title: '权重'},
                    {field: 'create_time', title: '创建时间'},
                    {width: 250, title: '操作', templet: ea.table.tool, operat: [
                            [{
                                class: 'layui-btn layui-btn-xs layui-btn-success',
                                method: 'open',
                                text: '参与记录',
                                auth: 'edit',
                                url: init.join_url,
                                extend: 'data-full="true"',
                                field: 'circle_id',
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