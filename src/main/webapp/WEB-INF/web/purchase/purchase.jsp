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
                <input type="text" name="title" id="PurchaseName" lay-verify="title" autocomplete="off"
                       placeholder="进货编号" class="layui-input">
            </div>
            <a class="layui-btn" onclick="cl.list()"><i class="layui-icon">&#xe615;</i>搜索</a>

        </div>
        <a class="refer layui-btn " onclick="cl.addUser()">
            <i class="layui-icon">&#xe61f;</i>添加
        </a>
    </blockquote>

    <fieldset class="layui-elem-field">
        <legend>进货账单</legend>
        <div style="margin: 20px;">
            <table class="site-table layui-table table-hover ">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>年份</th>
                    <th>月份</th>
                    <th>日</th>
                    <th>本次进货编号</th>
                    <th>进货类型</th>
                    <th>进货总件数(单位：件)</th>
                    <th>进货单价(单位：元/件)</th>
                    <th>所属仓库</th>
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
        <td>{{item.purchase_year == undefined ? "暂无" : item.purchase_year+"年"}}</td>
        <th>{{item.purchase_month == undefined ? "暂无" : item.purchase_month+"月"}}</th>
        <th>{{item.purchase_day == undefined ? "暂无" : item.purchase_day+"日"}}</th>
        <th>{{item.purchase_code == undefined ? "暂无" : item.purchase_code}}</th>
        <th>{{item.parts_name == undefined ? "暂无" : item.parts_name}}</th>
        <th>{{item.purchase_capacity == undefined ? "暂无" : item.purchase_capacity+'件'}}</th>
        <th>{{item.purchase_pirce == undefined ? "暂无" : item.purchase_pirce+'元/件'}}</th>
        <th>{{item.storage_name == undefined ? "暂无" : item.storage_name}}</th>
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
    <form class="layui-form layui-form-pane" id="update-form" style="padding-left: 25%;padding-top: 3%;">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 200px;">年份：</label>
                <div class="layui-input-inline">
                    <select name="purchaseYear" lay-filter="aihao" id="year_ten">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 200px;">月份：</label>
                <div class="layui-input-inline">
                    <select name="purchaseMonth" lay-filter="aihao">
                        <option value="1" selected="">1月份</option>
                        <option value="2">2月份</option>
                        <option value="3">3月份</option>
                        <option value="4">4月份</option>
                        <option value="5">5月份</option>
                        <option value="6">6月份</option>
                        <option value="7">7月份</option>
                        <option value="8">8月份</option>
                        <option value="9">9月份</option>
                        <option value="10">10月份</option>
                        <option value="11">11月份</option>
                        <option value="12">12月份</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 200px;">日：</label>
                <div class="layui-input-inline">
                    <input type="text" name="purchaseDay" autocomplete="off" class="layui-input"
                           placeholder="几号">
                </div>
            </div>


            <div class="layui-inline">
                <label class="layui-form-label" style="width: 200px;">本次进货编号：</label>
                <div class="layui-input-inline">
                    <input type="text" name="purchaseCode" autocomplete="off" class="layui-input"
                           placeholder="本次进货编号">
                </div>
            </div>


        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 200px;">进货类型：</label>
                <div class="layui-input-inline">
                    <select name="purchasePartsId" lay-filter="aihao" id="purchasePartsId">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 200px;">进货总件数(单位：件)：</label>
                <div class="layui-input-inline">
                    <input type="text" name="purchaseCapacity" autocomplete="off" class="layui-input"
                           placeholder="进货总件数(单位：件)">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 200px;">进货单价(单位：元/件)：</label>
                <div class="layui-input-inline">
                    <input type="text" name="purchasePirce" autocomplete="off" class="layui-input"
                           placeholder="进货单价(单位：元/件)">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 200px;">所属仓库：</label>
                <div class="layui-input-inline">
                    <select name="purchaseStorageId" lay-filter="aihao" id="storageId">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-input-block" style="margin-left: 25%">
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
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree', 'upload'], function () {
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
                let purchaseCode = $("#PurchaseName").val();
                $.post("${pageContext.request.contextPath}/Purchase/findPurchase", {
                        currentIndex: currentIndex,
                        pageSize: pageSize,
                        userName: purchaseCode
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
                    title: '添加进货账单'
                    , content: $("#addUser"),
                    area: ['100%', '100%']
                });
            },
            addUserAjax: function () {
                let purchase = $("#update-form").serialize();
                $.post("${pageContext.request.contextPath}/Purchase/addPurchase", purchase, function (data) {
                    layer.msg(data.msg, {time: 500});
                    if (data.result) {
                        setTimeout("location.reload()", 1000);
                    }
                });
            },
            delete: function (id) {
                layer.confirm('确定删除？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post("${pageContext.request.contextPath}/Purchase/deletePurchase", {id: id},
                        function (data) {
                            layer.msg(data.msg, {time: 500});
                            if (data.result) {
                                setTimeout("location.reload()", 500);
                            }
                        });
                });
            },
            foreignKey: function () {
                $.post("${pageContext.request.contextPath}/Purchase/foreignKey",
                    function (data) {
                        $("#purchasePartsId").html("");
                        $("#customerId").html("");
                        $("#storageId").html("");
                        let customerce = data.customerce;
                        let parts = data.parts;
                        let storage = data.storage;

                        for (let i = 0; i < customerce.length; i++) {
                            $("#customerId").append(`<option value=` + customerce[i].id + `>` + customerce[i].customer_name + `</option>`)
                        }
                        for (let i = 0; i < storage.length; i++) {
                            $("#storageId").append(`<option value=` + storage[i].storage_code + `>` + storage[i].storage_name + `</option>`)
                        }
                        for (let i = 0; i < parts.length; i++) {
                            $("#purchasePartsId").append(`<option value=` + parts[i].parts_version + `>` + parts[i].parts_name + `</option>`)
                        }
                        form.render();
                    });
            }
        }
        $(function () {
            cl.list();
            cl.foreignKey();
        });
    });

    $(function () {
        $("#year_ten").html("");
        var myDate = new Date();
        var yearNow = myDate.getFullYear();
        for (let i = 0; i < 6; i++) {
            $("#year_ten").append(`<option value=` + (yearNow) + `>` + (yearNow--) + `年</option>`)
        }
    });

</script>

</html>
