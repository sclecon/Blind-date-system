define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'user/index',
        add_url: 'user/add',
        edit_url: 'user/edit',
        delete_url: 'user/delete',
        export_url: 'user/export',
        modify_url: 'user/modify',
                pk: 'user_id',
    };

    var Controller = {




        index: function () {
            ea.table.render({
                init: init,
                toolbar: ['refresh', 'delete', 'export'],
                cols: [[
                    {type: 'checkbox'},
                    {field: 'user_id', title: '用户UID'},
                    {field: 'username', title: '用户名'},
                    {field: 'phone', title: '手机号'},
                    {field: 'remark', title: '个人介绍', templet: ea.table.text},
                    // {field: 'longitude', title: '经度', show: false},
                    // {field: 'dimension', title: '维度'},
                    {field: 'edu', search: 'select', selectList: {"1":"初中","2":"中专","3":"高中","4":"大专","5":"本科","6":"硕士","7":"博士","8":"博士后"}, title: '学历'},
                    {field: 'sex', search: 'select', selectList: ["未知","男","女"], title: '性别'},
                    // {field: 'birthday', title: '生日'},
                    // {field: 'height', title: '身高'},
                    {field: 'city', title: '城市'},
                    // {field: 'address', title: '居住地'},
                    // {field: 'marriage', search: 'select', selectList: {"1":"未婚","2":"离异","3":"丧偶","4":"已婚"}, title: '婚姻状况'},
                    // {field: 'children', search: 'select', selectList: ["没有","有"], title: '子女状况'},
                    // {field: 'native', title: '籍贯'},
                    // {field: 'nation', title: '民族'},
                    // {field: 'blood', search: 'select', selectList: {"1":"A","2":"B","3":"AB","4":"0","5":"其他"}, title: '血型'},
                    // {field: 'weight', title: '体重'},
                    // {field: 'occupation', title: '职业'},
                    // {field: 'school', title: '毕业学校'},
                    // {field: 'major', title: '所学专业'},
                    // {field: 'house', search: 'select', selectList: {"1":"已购房无贷款","2":"已购房有贷款","3":"与父母同住","4":"暂未购房","5":"租房"}, title: '购房情况'},
                    // {field: 'car_buy', search: 'select', selectList: {"1":"已买车","2":"未买车"}, title: '购车情况'},
                    // {field: 'status', title: '会员状态', templet: ea.table.switch},
                    {field: 'create_time', title: '注册时间'},
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