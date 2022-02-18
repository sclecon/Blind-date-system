define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'banner/index',
        add_url: 'banner/add',
        edit_url: 'banner/edit',
        delete_url: 'banner/delete',
        export_url: 'banner/export',
        modify_url: 'banner/modify',
        pk: 'banner_id',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},
                    {field: 'banner_id', title: '数据ID'},
                    {field: 'type', search: 'select', selectList: {"1":"首页Banner","2":"活动页Banner"}, title: '投放位置'},
                    {field: 'url', title: '图片', templet: ea.table.image},
                    {field: 'str', title: '文本'},
                    {field: 'weight', title: '权重值'},
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