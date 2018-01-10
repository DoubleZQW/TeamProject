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
                <button type="button" class="btn btn-info meal-list-submit" onclick="init();">查询</button>
            </div>
            <div class="btn-group" role="group">
                <button class="btn btn-warning" onclick="location.reload();return false;">重置</button>
            </div>
        </div>
    </div>
</div>
<br>

<%--下方数据表格展示--%>

<div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">
        <h3 style="display: inline">查询结果</h3>&emsp;
        <h4 style="display: inline">
            <span class="label label-info">商品</span>
        </h4>
    </div>

    <div id="meal-list-toolbar">&emsp;
        <a href="javascript:void(0);" class="btn btn-danger btn-xs" onclick="void(0);">
            <span class="glyphicon glyphicon-remove"></span>
            删除
        </a>
    </div>

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
            //是否显示分页（*）
            pagination: true,
            showPaginationSwitch: true,
            //可供选择的每页的行数（*）
            pageList: [1, 10, 25, 50, 100],
            //每页大小
            pageSize: 5,
            paginationLoop: false,
            //是否启用排序
            sortable: true,
            sortName: 'meal_id',
            //排序方式
            sortOrder: "asc",
            idField: 'meal_id',
            height: 400,
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
            //搜索配置
            //这个接口需要处理bootstrap table传递的固定参数,并返回特定格式的json数据
            url: "meal/query",
            //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
            queryParamsType:'limit',
            //查询参数,每次调用是会带上这个参数，可自定义
            queryParams: function (params) {
                var mealName = $('#meal_name').val();
                return {
                    rows: this.pageSize,
                    page: this.pageNumber,
                    sort: this.sortName,
                    order: this.sortOrder,
                    mealName: mealName
                };
            },
            // queryParams : function(params) {
            // 	//var subcompany = $('#subcompany option:selected').val();
            // 	//var name = $('#name').val();
            // 	return {
            // 		pageNumber: params.offset+1,
            // 		pageSize: params.limit
            // 		//companyId:subcompany,
            // 		//name:name
            // 	};
            // },
            //分页方式：client客户端分页，server服务端分页（*）
            sidePagination: "server",
            //是否显示搜索框
            search: false,
            //搜索的严格匹配
            strictSearch: true,
            columns:[{checkbox: true, align: true},
                {field:'mealId',title:'商品编号',sortable: true,width: 20},
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
    </script>

</div>
</body>
</html>
