define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'circle.join/index',
        add_url: 'circle.join/add',
        edit_url: 'circle.join/edit',
        delete_url: 'circle.join/delete',
        export_url: 'circle.join/export',
        modify_url: 'circle.join/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},                    {field: 'join_id', title: '数据ID'},                    {field: 'circle_id', title: '圈子ID'},                    {field: 'user_id', title: '用户ID'},                    {field: 'intro', title: '加入说明'},                    {field: 'status', search: 'select', selectList: {"1":"等待审核","0":"审核失败","2":"审核通过"}, title: '审核状态', templet: ea.table.switch},                    {field: 'create_time', title: '创建时间'},                    {width: 250, title: '操作', templet: ea.table.tool},
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