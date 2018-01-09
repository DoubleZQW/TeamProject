<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<title>Title</title>
	</head>
	<body>
		<%--<h2><em style="color: gray">查询用户...</em></h2>--%>

		<%--上方查询条件--%>
		<div class="col-xs-12 column">
			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="user_name">用户名</label>
					<input type="text" class="form-control" id="user_name" name="user_name"/>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="user_level">用户类型</label>
					<select class="form-control" name="user_level" id="user_level">
						<option value="">-请选择-</option>
						<option value="">普通</option>
						<option value="">管理员</option>
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
					<span class="label label-info">用户</span>
				</h4>
			</div>

			<div id="toolbar">&emsp;
				<a href="javascript:void(0);" class="btn btn-danger btn-xs" onclick="void(0);">
					<span class="glyphicon glyphicon-remove"></span>
					<%--<i class="icon iconfont">&#xe612;</i>--%>
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
					pageList: [1, 10, 25, 50, 100],
					//每页大小
					pageSize: 5,
					paginationLoop: false,
					//是否启用排序
					sortable: true,
					sortName: 'id',
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
					url: "user/query",
					//默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
					queryParamsType:'limit',
					//查询参数,每次调用是会带上这个参数，可自定义
					queryParams: function (params) {
						var userName = $('#user_name').val();
						return {
							rows: this.pageSize,
							page: this.pageNumber,
							sort: this.sortName,
							order: this.sortOrder,
							userName: userName
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
						{field:'userId',title:'编号',sortable: true,width: 20},
						{field:'userName',title:'用户名',sortable: true,width: 150},
						{field:'userStatus',title:'状态',sortable: true,width: 50},
						{field:'userPhone',title:'手机号',sortable: true,visible: false},
						{field:'userSex',title:'性别',sortable: true,visible: false},
						{field:'userEmail',title:'电子邮件',sortable: true,visible: false},
						{field:'userOthername',title:'昵称',sortable: true,width: 100},
						{field:'addrId',title:'地址',sortable: true,visible: false},
						{field:'created',title:'注册时间',sortable: true,visible: false,
							formatter: function(value, row, index) {
								return  moment(value).format("YYYY-MM-DD HH:mm:SS");
							}},
						{field:'updated',title:'更新时间',sortable: true,
						formatter: function(value, row, index) {
							return  moment(value).format("YYYY-MM-DD HH:mm:SS");
						}}]
				});
				//注册查询按钮的点击事件
				$('.cust_list_submit').click(function() {
					$('#bstab').bootstrapTable('refresh')
				});
			</script>

			<%--<table class="table">--%>
				<%--<thead>--%>
					<%--<tr>--%>
						<%--<th class="th th-primary" style="min-width: 60px">编号</th>--%>
						<%--<th>用户名</th>--%>
						<%--<th>手机号</th>--%>
						<%--<th>E-Mail</th>--%>
						<%--<th>身份</th>--%>
						<%--<th style="text-align: center;min-width: 100px">操作</th>--%>
					<%--</tr>--%>
				<%--</thead>--%>
				<%--<tbody id="listData">--%>
					<%--&lt;%&ndash; 已用jQuery-AJAX生成,见"list-index.jsp" &ndash;%&gt;--%>
				<%--</tbody>--%>
			<%--</table>--%>

			<%--Panel Footer--%>
			<div  id="listPage" class="panel-footer" style="text-align: center">
				<jsp:include page="page.jsp" flush="true" />
			</div>
		</div>
	</body>
</html>
