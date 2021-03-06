<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>商品列表</title>

	<!-- Required Stylesheets -->
	<link href="resources/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
	<link href="resources/css/commons.css" rel="stylesheet">
	<%-- bootstrap-table --%>
	<link href="resources/bootstrap-table/bootstrap-table.css" rel="stylesheet">

	<!-- Required Javascript -->
	<script src="resources/jquery/jquery-3.2.1.js"></script>
	<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
	<%-- bootstrap-closable-tab.js --%>
	<%--<script src="resources/bootstrap-closable-tab/closable-tab-div.js"></script>--%>
	<%-- bootstrap-table --%>
	<script src="resources/bootstrap-table/bootstrap-table.js" rel="stylesheet"></script>
	<script src="resources/bootstrap-table/bootstrap-table-zh-CN.js" rel="stylesheet"></script>
	<%-- moment.js --%>
	<script src="resources/moment/moment.js" rel="stylesheet"></script>
	<script src="resources/moment/moment-with-locales.js" rel="stylesheet"></script>
	<script src="resources/sweet-alert/sweetalert.min.js" rel="stylesheet"></script>
	<%--<script src="https://sweetalert.js.org/assets/sweetalert/sweetalert.min.js"></script>--%>
	<%-- 自定义扩展的js --%>
	<script src="resources/js/commons.js"></script>
</head>
<body>
<%--上方查询条件--%>
<div class="col-xs-12 column">
	<div class="col-xs-6 column">
		<div class="form-group">
			<input type="text" id="orderId" name="orderId" class="form-control input-sm"/>
		</div>
	</div>

	<div class="col-xs-6 column">
		<div class="form-group">
			<label for="orderStatus">订单状态</label>
			<select class="form-control input-sm" name="orderStatus" id="orderStatus">
				<option value="">-全部-</option>
				<option value="1">已取消</option>
				<option value="2">交易成功</option>
				<option value="3">已删除</option>
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
				<button type="button" class="btn btn-info btn-sm order-list-submit" onclick="void(0);">
					<span class="glyphicon glyphicon-search"></span> 查询
				</button>
			</div>
			<div class="btn-group" role="group">
				<button class="btn btn-warning btn-sm" onclick="reset();">
					<span class="glyphicon glyphicon-refresh"></span> 重置
				</button>
			</div>
		</div>
	</div>
</div>
<br>

<%--下方数据表格展示--%>
<div class="panel panel-default">
	<div id="order-list-toolbar">&emsp;
		<h3 style="display: inline">
			<span class="label label-default"><em>订单查询列表</em></span>
		</h3>
		<div class="btn-group">
			<button class="btn btn-danger btn-xs btn-order-remove" disabled="disabled" onclick="askRemove();">
				<span class="glyphicon glyphicon-remove"></span>
				删除
			</button>
		</div>
	</div>

	<!-- Table -->
	<%-- bootstrap-table演示 --%>
	<table id="order-list-tab"></table>
	<script type="text/javascript">
        $("#order-list-tab").bootstrapTable({
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
            pageList: [1, 5, 8, 10, 20, 30, 50, 75, 100],
            //每页大小
            pageSize: 8,
            paginationLoop: false,
            //是否启用排序
            sortable: true,
            sortName: 'orderId',
            //排序方式
            sortOrder: "asc",
            idField: 'orderId',
            height: 500,
            //工具栏
            toolbar: '#order-list-toolbar',
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
            showColumns: false,
            //搜索配置
            //这个接口需要处理bootstrap table传递的固定参数,并返回特定格式的json数据
            url: "order/query",
            //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
            queryParamsType:'limit',
            //查询参数,每次调用是会带上这个参数，可自定义
            queryParams: function (params) {
                return {
                    rows: this.pageSize,
                    page: this.pageNumber,
                    sort: this.sortName,
                    order: this.sortOrder,
                };},
            //分页方式：client客户端分页，server服务端分页（*）
            sidePagination: "server",
            //是否显示搜索框
            search: false,
            //搜索的严格匹配
            strictSearch: true,
            //选中/取消选中行时去设置按钮的禁用状态
            onCheck: function() {setDisabled('order');},
            onUncheck: function() {setDisabled('order');},
            columns:[{checkbox: true, align: true},
                {field:'orderCreated',title:'订单创建时间',sortable: true,
                    formatter: function(value) {return  moment(value).format("YYYY-MM-DD HH:mm:SS");}},
                {field:'orderId',title:'订单编号',sortable: true,width: 20},
                {field:'mealName',title:'商品名称',sortable: true,width: 20},
                {field:'orderStatus',title:'订单状态',sortable: true,width: 50,
                    formatter: function(value, row, index) {
                        switch (value) {
                            case 1: return "<span class='glyphicon glyphicon-remove-sign'></span> 已取消";
                            case 2: return "<span class='glyphicon glyphicon-ok-sign'></span> 交易成功";
                            case 3: return "<span class='glyphicon glyphicon-trash'></span> 已删除";
                            default: return "<span class='glyphicon glyphicon-question-sign'></span> 未知"
                        }}},
                {field:'mealPrice',title:'商品价格',sortable: true,width: 20,
                    formatter: function(value) {return "<span class='glyphicon glyphicon-yen'></span>"+ value/100;}
                },
                {field:'amount',title:'购买数量',sortable: true,width: 20},
                //{field:'mealNum',title:'商品库存',sortable: true,width: 20},
                {field:'payment',title:'实付金额',sortable: true,width: 150,formatter: function(value) {
                        return "<span class='glyphicon glyphicon-yen'></span>"+ value/100;
                    }},
                {field:'pName',title:'配送员姓名',sortable: true,width: 150,visible: false},
                {field:'pMobie',title:'配送员电话',sortable: true,width: 150,visible: false},
                {field:'userName',title:'用户姓名',sortable: true,width: 150},
                {field:'userPhone',title:'用户电话',sortable: true,width: 150},
                {field:'addrName',title:'地址',sortable: true,width: 150,visible: false},
                {field:'paymentType',title:'支付类型',sortable: true,width: 50,visible: false,
                    formatter: function(value, row, index) {
                        switch (value) {
                            case 1: return "在线支付";
                            case 2: return "货到付款";
                        }}},
                {field:'orderFree',title:'配送费',sortable: true,visible: false},

                {field:'orderFinished',title:'更新时间',sortable: true,visible: false,
                    formatter: function(value) {return  moment(value).format("YYYY-MM-DD HH:mm:SS");}}]
        });

        //注册查询按钮的点击事件
        $('.order-list-submit').click(function() {
            var orderId = $('#orderId').val();
            var orderStatus = $('#orderStatus').val();
            $('#order-list-tab').bootstrapTable('refreshOptions',{
                pageNumber: 1,
                queryParams: function (params) {
                    return {
                        rows: this.pageSize,
                        page: this.pageNumber,
                        sort: this.sortName,
                        order: this.sortOrder,
                        orderId: orderId,
                        orderStatus: orderStatus
                    };
                }
            })
        })

        //重置按钮的功能
        function reset() {
            $('#orderId').val('');
            $('#orderStatus').val('');
            $('.order-list-submit').click();
        }

        //删除前的询问
        function askRemove() {
            var selections = $('#order-list-tab').bootstrapTable('getSelections');
            var ids = [];
            var names = [];
            //遍历选中的记录，将记录的id存放到js数组中
            for (var i = 0; i < selections.length; i++) {
                ids.push(selections[i].orderId);
                names.push(selections[i].mealName);
            }
            //确定删除?
            swal({
                icon: 'warning',
                title: selections.length + "项订单将被删除",
                text: "你将删除这几项订单: " + names,
                buttons: ["我再想想...", {text: "删除 !"}],
                dangerMode: true,
            })
            //判断用户选择
                .then((val) => {
                    if (val) removeOrder(ids);
                    else swal({
                        icon: 'error',
                        title: "不删了?",
                        text: '你是该好好想想...',
                        timer: 1500, buttons: false
                    });
                });
            return;
        }
        //批量删除商品请求及回执信息
        function removeOrder(ids) {
            $.ajax({
                url: "order/remove",
                type: "post",
                data: {'ids[]': ids},
                datatype:'json',
                success: function (count) {
                    if (count > 0)
                        swal({
                            icon: 'success',
                            title: '删除成功',
                            text: count +"项订单已和您拜拜~",
                            timer: 2500,
                            buttons: false
                        });
                    //重新加载数据
                    $('.order-list-submit').click();
                }
            });
        }
	</script>
</div>
</div>
</body>
</html>