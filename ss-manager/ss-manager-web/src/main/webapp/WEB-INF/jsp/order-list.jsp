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
            <label for="order_id">订单名</label>
            <input type="text" class="form-control" id="order_id" name="orderId"/>
        </div>
    </div>

    <%--搜索按钮--%>
    <div class="row clearfix">
        <div class="col-xs-4 column">
        </div>
        <div class="col-xs-4 column">
            <div class="btn-group btn-group-justified" role="group">
                <div class="btn-group" role="group">
                    <button type="button" class="btn btn-info cust_list_submit" onclick="init();">查询</button>
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
                <span class="label label-info">订单</span>
            </h4>
        </div>

        <div id="toolbar">&emsp;
            <a href="javascript:void(0);" class="btn btn-danger btn-xs" onclick="orderDelete()">
                <span class="glyphicon glyphicon-remove"></span>
                删除
            </a>
        </div>

        <!-- Table -->
        <%-- bootstrap-table演示 --%>
        <table id="bstab"></table>
        <script type="text/javascript">
            $("#bstab").bootstrapTable({
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
                pageList: [1, 5, 10, 25, 50, 100],
                //每页大小
                pageSize: 5,
                paginationLoop: false,
                //是否启用排序
                sortable: true,
                sortName: 'orderId',
                //排序方式
                sortOrder: "asc",
                idField: 'id',
                height: 400,
                //工具栏
                toolbar: '#toolbar',
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
                url: "orderList",
                //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
                queryParamsType:'limit',
                //查询参数,每次调用是会带上这个参数，可自定义
                queryParams: function (params) {
                    var userName = $('#user_name').val();
                    var userLevel= $('#user_level').val();
                    return {
                        rows: this.pageSize,
                        page: this.pageNumber,
                        sort: this.sortName,
                        order: this.sortOrder,


                    };
                },


                sidePagination: "server",
                //是否显示搜索框
                search: false,
                //搜索的严格匹配
                strictSearch: true,
                columns:[{checkbox: true, align: true},
                    {field:'orderId',title:'订单编号',sortable: true,width: 20},
                    {field:'payment',title:'实付金额',sortable: true,width: 150},
                    {field:'orderStatus',title:'支付类型',sortable: true,width: 50,
                        formatter: function(value, row, index) {
                            switch (value) {
                                case 1 :
                                    return "未付款";
                                    break;
                                case 2:
                                    return "已付款";
                                    break;
                                case 3:
                                    return "付款成功";
                                    break;
                                case 4:
                                    return "交易成功"
                                    break;
                            }
                        }},
                    {field:'paymentType',title:'支付类型',sortable: true,width: 50,
                        formatter: function(value, row, index) {
                            switch (value) {
                                case 1 :
                                    return "在线支付";
                                    break;
                                case 2:
                                    return "货到付款";//删除的在查询时已经被排除了
                                    break;

                            }
                        }},
                    {field:'orderFree',title:'配送费',sortable: true,visible: false},


                    {field:'address',title:'地址',sortable: true,visible: false},
                    {field:'orderCreated',title:'订单创建时间',sortable: true,visible: false,
                        formatter: function(value, row, index) {
                            return  moment(value).format("YYYY-MM-DD HH:mm:SS");
                        }},
                    {field:'orderFinished',title:'更新时间',sortable: true,
                        formatter: function(value, row, index) {
                            return  moment(value).format("YYYY-MM-DD HH:mm:SS");
                        }}]
            });
            //注册查询按钮的点击事件
            $('.cust_list_submit').click(function() {
                $('#bstab').bootstrapTable('refresh')
            });

            function orderDelete() {
                var selections= $('#bstab').bootstrapTable('getSelections');
                if (selections.length == 0) {
                    //客户没有选择记录
                    alert('请至少选中一条记录！');
                    return;
                }
                var msg = "您真的确定要删除吗？";
                if (confirm(msg) == true) {
                    var ids = [];
                    //遍历选中的记录，将记录的id存放到js数组中
                    for (var i = 0; i < selections.length; i++) {
                        ids.push(selections[i].userId);
                    }
                    //alert(ids);
                    $.ajax({
                        url: "order/delete",
                        type: "post",
                        data: {'ids[]': ids},
                        datatype:'json',
                        success: function (data) {
                            //alert('成功后的刷新');
                            //重新加载数据
                            $('#bstab').bootstrapTable('refresh');
                        }
                    });
                }
            }

        </script>

    </div>
</div>
</body>
</html>