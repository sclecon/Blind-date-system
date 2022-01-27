define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'news/index',
        add_url: 'news/add',
        edit_url: 'news/edit',
        delete_url: 'news/delete',
        export_url: 'news/export',
        modify_url: 'news/modify',
        pk: 'news_id'
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},
                    {field: 'news_id', title: '新闻广告ID'},
                    {field: 'subject', title: '新闻广告标题'},
                    {field: 'create_time', title: '发布时间'},
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