<%--
  Created by IntelliJ IDEA.
  User: 张振伟
  Date: 2018/1/10
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--上方查询条件--%>
<div class="col-xs-12 column">
    <div class="col-xs-6 column">
        <div class="form-group">
            <label for="meal_name">商品名</label>
            <input type="text" class="form-control" id="meal_name" name="meal_name"/>
        </div>
    </div>

    <div class="col-xs-6 column">
        <div class="form-group">
            <label for="meal_status">商品状态</label>
            <select class="form-control" name="meal_status" id="meal_status">
                <option value="">-请选择-</option>
                <option value="">上架</option>
                <option value="">下架</option>
                <option value="">删除</option>
            </select>
        </div>
    </div>
</div>

<%--搜索按钮--%>
<div class="row clearfix">
    <div class="col-xs-4 column">
    </div>
    <div class="col-xs-4 column">
        <div class="btn-group btn-group-justified" role="group">
            <div class="btn-group" role="group">
                <button type="button" class="btn btn-info meal-list-submit" onclick="save();">提交</button>
            </div>
            <div class="btn-group" role="group">
                <button class="btn btn-warning" onclick="location.reload();return false;">重置</button>
            </div>
        </div>
    </div>
</div>
<br>
<!-- Table -->
<%-- bootstrap-table演示 --%>
<table id="meal-list-tab"></table>
<script type="text/javascript">
    $("#meal-list-tab").bootstrapTable({
        //请求方法
        method: 'get',
        //是否显示行间隔色
        striped: true,
        //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        cache: false,

        //工具栏
        toolbar: '#meal-list-toolbar',
        toolbarAlign: 'left',
        //点击行时选中
        clickToSelect: true,
        //显示刷新按钮
        showRefresh: true,
        //显示视图切换按钮
        showToggle: true,
        //可切换详情视图
        detailView: false,
        //卡片视图
        cardView: false,
        //显示选择列按钮
        showColumns: true,
        url: "meal/query",
        //查询参数,每次调用是会带上这个参数，可自定义
        queryParams: function (params) {
            var mealName = $('#meal_name').val();
            return {
                rows: this.pageSize,
                page: this.pageNumber,
                sort: this.sortName,
                order: this.sortOrder,
                mealName: this.mealName
            };
        },


        //是否显示搜索框
        search: false,
        //搜索的严格匹配
        strictSearch: true,
        columns:[{checkbox: true, align: true},
            {field:'mealId',title:'商品编号',sortable: true,width: 20 },
            {field:'mealName',title:'商品名',sortable: true,width: 150},
            {field:'mealPrice',title:'商品价格',sortable: true,width: 50},
            {field:'mealNum',title:'商品库存',sortable: true,visible: false},
            {field:'createTme',title:'添加时间',sortable: true,visible: false,
                formatter: function(value, row, index) {
                    return  moment(value).format("YYYY-MM-DD HH:mm:SS");
                }},
            {field:'updatTime',title:'更新时间',sortable: true,
                formatter: function(value, row, index) {
                    return  moment(value).format("YYYY-MM-DD HH:mm:SS");
                }}]
    });
    //注册查询按钮的点击事件
    $('.meal-list-submit').click(function() {
        $('#meal-list-tab').bootstrapTable('refresh')
    });

    function update(){
        // var id = $('#meal-list-tab').bootstrapTable('getSelections');
        $('#meal-list-tab').bootstrapTable('updateByUniqueId',{
            // id : id[0].ID,这个是获得数组
            row : {
                filed : $('#mealId').val(),
                filed : $('#mealName').val(),
                filed : $('#mealNum').val(),
                filed : $('#mealPrice').val()
            }
        });
        // $('#myModal').modal('hide'); 模态框

    }

</script>

</div>

</body>
</html>

