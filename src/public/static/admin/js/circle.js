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
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},                    {field: 'circle_id', title: '数据ID'},                    {field: 'name', title: '圈子名称'},                    {field: 'intro', title: '圈子说明'},                    {field: 'join', title: '授权次数'},                    {field: 'weight', title: '权重'},                    {field: 'status', search: 'select', selectList: {"1":"数据正常","0":"数据已删除"}, title: '数据状态', templet: ea.table.switch},                    {field: 'create_time', title: '创建时间'},                    {width: 250, title: '操作', templet: ea.table.tool},
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