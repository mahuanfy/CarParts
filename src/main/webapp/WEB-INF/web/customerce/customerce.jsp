<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ include file="../../../page/tag.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Table</title>
    <link rel="stylesheet" href="${baseurl}/public/common/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${baseurl}/public/common/css/global.css" media="all">
    <link rel="stylesheet" href="${baseurl}/public/css/global.css" media="all">
    <link rel="stylesheet" href="${baseurl}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${baseurl}/public/css/table.css"/>
    <script type="text/javascript" src="${baseurl}/js/myjs/jquery.min.js"></script>
    <link rel="stylesheet" href="${baseurl}/public/css/eu_manage.css" media="all">
    <script type="text/javascript" src="${baseurl}/public/js/button_js.js" charset="utf-8"></script>
</head>
<style>
    .layui-table td, .layui-table th {
        text-align: center;
    }
</style>
<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<body>
<div class="admin-main">
    <blockquote class="layui-elem-quote">
        <div class="layui-inline">
            <div class="layui-input-inline">
                <input type="text" name="title" id="customerName" lay-verify="title" autocomplete="off"
                       placeholder="客户姓名" class="layui-input">
            </div>
            <a class="layui-btn" onclick="cl.list()"><i class="layui-icon">&#xe615;</i>搜索</a>

        </div>
        <a class="refer layui-btn " onclick="cl.addUser()">
            <i class="layui-icon">&#xe61f;</i>添加
        </a>
    </blockquote>

    <fieldset class="layui-elem-field">
        <legend>客户信息</legend>
        <div style="margin: 20px;">
            <table class="site-table layui-table table-hover ">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>手机号</th>
                    <th>电子邮件</th>
                    <th>所在公司</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody class="tr_1">

                </tbody>
            </table>
        </div>
        <div style="margin: 25px;" id="demo1"></div>
        <ul id="biuuu_city_list"></ul>
    </fieldset>
</div>
<script id="list-tpl" type="text/html">
    {{# layui.each(d.info, function(index, item){ }}
    <tr>
        <td>{{ index+1}}</td>
        <td>{{item.customer_name  == undefined ? "暂无" : item.customer_name}}</td>
        <th>{{item.customer_sex == undefined ? "暂无" : item.customer_sex}}</th>
        <th>{{item.customer_age == undefined ? "暂无" : item.customer_age}}</th>
        <th>{{item.customer_phone == undefined ? "暂无" : item.customer_phone}}</th>
        <th>{{item.customer_email == undefined ? "暂无" : item.customer_email}}</th>
        <th>{{item.customer_company == undefined ? "暂无" : item.customer_company}}</th>
        <td>
            <button data-id='1' data-opt='del' class='layui-btn layui-btn-danger layui-btn-small layui-icon'
                    onclick="cl.delete('{{item.id}}')">
                &#xe640;删除
            </button>
        </td>
    </tr>
    {{# }); }}
</script>

</body>
<div id="addUser" style="display: none">
    <form class="layui-form layui-form-pane" id="update-form" style="padding-left: 25%;padding-top: 10%;">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">客户姓名：</label>
                <div class="layui-input-inline">
                    <input type="text" name="customerName" autocomplete="off" class="layui-input" placeholder="客户姓名">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">年龄：</label>
                <div class="layui-input-inline">
                    <input type="text" name="customerAge" autocomplete="off" class="layui-input" placeholder="年龄">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别：</label>
            <div class="layui-input-block">
                <input type="radio" name="customerSex" value="男" title="男" checked>
                <input type="radio" name="customerSex" value="女" title="女">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">手机号：</label>
                <div class="layui-input-inline">
                    <input type="text" name="customerPhone" autocomplete="off" class="layui-input"
                           placeholder="手机号">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">电子邮件：</label>
                <div class="layui-input-inline">
                    <input type="text" name="customerEmail" autocomplete="off" class="layui-input"
                           placeholder="电子邮件">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">所在公司：</label>
                <div class="layui-input-inline">
                    <input type="text" name="customerCompany" autocomplete="off" class="layui-input"
                           placeholder="所在公司">
                </div>
            </div>
        </div>

        <div class="layui-input-block">
            <button class="layui-btn" onclick="cl.addUserAjax()">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>

    </form>
</div>
<script type="text/javascript">
    let totalSize = 10;
    let currentIndex = 1;
    let pageSize = 10;
    let cl;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree','upload'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;

        cl = {
            page: function () {
                layui.laypage({
                    cont: 'demo1',
                    pages: totalSize, //总页数
                    curr: currentIndex,
                    groups: 5,//连续显示分页数
                    skin: '#1E9FFF',
                    jump: function (obj, first) {
                        currentIndex = obj.curr;
                        if (!first) {
                            cl.list();
                        }
                    }
                });
            },
            list: function () {
                let userName = $("#customerName").val();
                $.post("${pageContext.request.contextPath}/Customerce/findCustomerce", {
                        currentIndex: currentIndex,
                        pageSize: pageSize,
                        userName:userName
                    },
                    function (data) {
                        if (data.result) {
                            currentIndex = data.page.currentIndex;
                            totalSize = data.page.totalSize;
                            cl.page();
                            laytpl($("#list-tpl").text()).render(data, function (html) {
                                $(".tr_1").html(html);
                            });
                            form.render();
                        }
                    },
                    "json"
                );
            },
            addUser: function () {
                layer.open({
                    type: 1,
                    title: '添加客户'
                    , content: $("#addUser"),
                    area: ['40%', '70%']
                });
            },
            addUserAjax: function () {
                let admin = $("#update-form").serialize();
                $.post("${pageContext.request.contextPath}/Customerce/addCustomerce", admin, function (data) {
                    layer.msg(data.msg, {time: 500});
                    if (data.result) {
                        setTimeout("location.reload()", 1000);
                    }
                });
            },
            delete:function (id) {
                layer.confirm('确定删除？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post("${pageContext.request.contextPath}/Customerce/deleteCustomerce", {id: id},
                        function (data) {
                            layer.msg(data.msg, {time: 500});
                            if (data.result) {
                                setTimeout("location.reload()", 500);
                            }
                        });
                });
            },
        }
        $(function () {
            cl.list();
        });
    });
</script>

</html>