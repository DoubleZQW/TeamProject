<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>商品列表</title>
    </head>
    <body>
    <%--上方查询条件--%>
        <div class="col-xs-12 column">
            <div class="col-xs-6 column">
                <div class="form-group">
                    <label for="meal_name">商品名</label>
                    <input type="text" id="meal_name" name="meal_name" class="form-control input-sm"/>
                </div>
            </div>

            <div class="col-xs-6 column">
                <div class="form-group">
                    <label for="meal_status">商品状态</label>
                    <select class="form-control input-sm" name="meal_status" id="meal_status">
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
                        <button type="button" class="btn btn-info btn-sm meal-list-submit" onclick="void(0);">查询</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button class="btn btn-warning btn-sm" onclick="location.reload();return false;">重置</button>
                    </div>
                </div>
            </div>
        </div>
        <br>

        <%--下方数据表格展示--%>

        <div class="panel panel-default">
			<div id="meal-list-toolbar">&emsp;
				<h3 style="display: inline">
					<span class="label label-default"><em>商品查询列表</em></span>
				</h3>
				<div class="btn-group">
					<a href="javascript:void(0);" class="btn btn-info btn-xs" onclick="askEdit()">
						<span class="glyphicon glyphicon-pencil"></span>
						编辑
					</a>
					<a href="javascript:void(0);" class="btn btn-danger btn-xs" onclick="askRemove()">
						<span class="glyphicon glyphicon-remove"></span>
						删除
					</a>
				</div>
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
                    pageList: [1, 5, 8, 10, 20, 30, 50, 75, 100],
                    //每页大小
                    pageSize: 8,
                    paginationLoop: false,
                    //是否启用排序
                    sortable: true,
                    sortName: 'meal_id',
                    //排序方式
                    sortOrder: "asc",
                    idField: 'meal_id',
                    height: 500,
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
                        return {
                            rows: this.pageSize,
                            page: this.pageNumber,
                            sort: this.sortName,
                            order: this.sortOrder,
                        };
                    },
                    //分页方式：client客户端分页，server服务端分页（*）
                    sidePagination: "server",
                    //是否显示搜索框
                    search: false,
                    //搜索的严格匹配
                    strictSearch: true,
                    columns:[{checkbox: true, align: true},
                        {field:'mealId',title:'编号',sortable: true,width: 20},
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
	                var mealName = $('#meal_name').val();
                    $('#meal-list-tab').bootstrapTable('refreshOptions',{
                    	pageNumber: 1,
						queryParams: function (params) {
                    		return {
                    			rows: this.pageSize,
								page: this.pageNumber,
								sort: this.sortName,
								order: this.sortOrder,
								mealName: mealName
							};
						}
					})
                })
				//页面加载后立即查询一次
					.click();

                //删除前的询问
                function askRemove() {
	                var selections = $('#meal-list-tab').bootstrapTable('getSelections');
	                //没有选中任何数据报错
	                if (selections.length < 1) {
		                swal({
			                title: "未选中!",
			                text: '我找不到你的选择...',
			                timer: 1500,
			                buttons: false,
			                icon: 'warning'
		                });
		                return;
	                }

	                var ids = [];
	                var names = [];
	                //遍历选中的记录，将记录的id存放到js数组中
	                for (var i = 0; i < selections.length; i++) {
		                ids.push(selections[i].mealId);
		                names.push(selections[i].mealName);
	                }
	                //确定删除?
	                swal({
		                icon: 'warning',
		                title: selections.length + "种商品将被删除",
		                text: "你将失去这几种美食: " + names,
		                buttons: ["我再想想...", {text:"删除 !"}],
		                dangerMode: true,
	                })
						//判断用户选择
		                .then((val) => {
			                if (val) removeMeals(ids);
			                else swal({
				                icon: 'error',
				                title: "不删了?",
				                text: '你是该好好想想...',
				                timer: 1500,buttons: false
			                });
		                });
	                return;
                }
                //批量删除商品请求及回执信息
                function removeMeals(ids) {
	                $.ajax({
		                url: "meal/remove",
		                type: "post",
		                data: {'ids[]': ids},
		                datatype:'json',
		                success: function (count) {
			                if (count > 0)
				                swal({
					                icon: 'success',
					                title: '删除成功',
					                text: count +"种商品已和您拜拜~",
					                timer: 2500,
									buttons: false
				                });
			                //重新加载数据
			                $('.meal-list-submit').click();
		                }
	                });
                }


                //给出编辑的确认信息框
				function askEdit() {
					var selections = $('#meal-list-tab').bootstrapTable('getSelections');
					//没有选中任何数据报错
					if (selections.length < 1) {
						swal({
							icon: 'warning',
							title: "未选中!",
							text: '我找不到你的选择...',
							timer: 1500,
							buttons: false,
						});
						return;
					}
					if (selections.length > 1) {
						swal({
							icon: 'warning',
							title: '无法编辑多种商品!',
							text: '我只要唯一的选择~',
							timer: 2500,
							buttons: false,
						});
					}
					editMeal(selections[0].userId);
				}
				function editMeal(mealId) {

				}
			</script>

        </div>
    </body>
</html>
