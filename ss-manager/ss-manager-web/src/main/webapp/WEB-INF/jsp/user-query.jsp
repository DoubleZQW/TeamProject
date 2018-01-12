<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<title>用户查询</title>
	</head>
	<body>
		<%--上方查询条件--%>
		<div class="col-xs-12 column">
			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="user_name">用户名</label>
					<input id="user_name" name="user_name" type="text" class="form-control input-sm"/>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="user_level">用户类型</label>
					<select class="form-control input-sm" id="user_level" name="user_level" >
						<option value="">-请选择-</option>
						<option value="1">普通用户</option>
						<option value="2">管理员</option>
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
						<button type="button" class="btn btn-info btn-sm user-query-submit" onclick="void(0);">
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
			<div id="user-query-toolbar">&emsp;
				<h3 style="display: inline">
					<span class="label label-default"><em>用户查询结果</em></span>
				</h3>
				<div class="btn-group">
					<button class="btn btn-info btn-xs btn-user-edit" disabled="disabled" onclick="tabToEditUser();">
						<span class="glyphicon glyphicon-edit"></span>
						编辑
					</button>
					<button class="btn btn-danger btn-xs btn-user-remove" disabled="disabled" onclick="askRemove();">
						<span class="glyphicon glyphicon-remove"></span>
						删除
					</button>
				</div>
			</div>

			<!-- Table -->
			<%-- bootstrap-table演示 --%>
			<table id="user-query-tab"></table>
			<script type="text/javascript">
				$("#user-query-tab").bootstrapTable({
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
					sortName: 'userId',
					//排序方式
					sortOrder: "asc",
					idField: 'userId',
					height: 500,
					//工具栏
					toolbar: '#user-query-toolbar',
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
						return {
							rows: this.pageSize,
							page: this.pageNumber,
							sort: this.sortName,
							order: this.sortOrder
						};
					},
					//分页方式：client客户端分页，server服务端分页（*）
					sidePagination: "server",
					//是否显示搜索框
					search: false,
					//搜索的严格匹配
					strictSearch: true,
					//选中/取消选中行时去设置按钮的禁用状态
					onCheck: function() {setDisabled('user');},
					onUncheck: function() {setDisabled('user');},
					columns:[{checkbox: true, align: true},
						{field:'userId',title:'编号',sortable: true,width: 20},
						{field:'userName',title:'用户名',sortable: true,width: 150},
                        {field:'userLevel',title:'权限',sortable: true,width: 50,
                            formatter: function(value, row, index) {
                                switch (value) {
                                    case 1: return "用户";
                                    case 2: return "管理员";
                                    default: return "未知";
                                }
                            }},
						{field:'userStatus',title:'状态',sortable: true,width: 50,
                            formatter: function(value, row, index) {
                                switch (value) {
                                    case 1: return "<span class='glyphicon glyphicon-ok-sign'></span> 存在";
									case 0:  return "<span class='glyphicon glyphicon-remove-sign'></span> 删除";
                                    default:  return "<span class='glyphicon glyphicon-question-sign'></span> 未知";
                                }
                            }},
						{field:'userPhone',title:'手机号',sortable: true,visible: false},
						{field:'userSex',title:'性别',sortable: true,visible: false,
                            formatter: function(value, row, index) {
                                switch (value) {
                                    case 1: return "男";
                                    case 0: return "女";
                                    default: return "未知";
                                }
                            }},
						{field:'userEmail',title:'电子邮件',sortable: true,visible: false},
						{field:'userOthername',title:'昵称',sortable: true,width: 80},
						{field:'address',title:'地址',sortable: true,visible: false},
						{field:'created',title:'注册时间',sortable: true,align: 'center',visible: false,
							formatter: function(value, row, index) {return  moment(value).format("YYYY-MM-DD HH:mm:SS");}},
						{field:'updated',title:'更新时间',sortable: true,align: 'center',
						formatter: function(value, row, index) {return  moment(value).format("YYYY-MM-DD HH:mm:SS");}}]
				});

				//注册查询按钮的点击事件
				$('.user-query-submit').click(function() {
					var userName = $('#user_name').val();
					var userLevel= $('#user_level').val();
					$('#user-query-tab').bootstrapTable('refreshOptions',{
						pageNumber: 1,
						queryParams: function (params) {
							return {
								rows: this.pageSize,
								page: this.pageNumber,
								sort: this.sortName,
								order: this.sortOrder,
								userName: userName,
								userLevel: userLevel
							};
						}
					})
				})

				//重置按钮的功能
				function reset() {
					$('#user_name').val('');
					$('#user_level').val('');
					$('.user-query-submit').click();
				}

				//删除前的询问
                function askRemove() {
	                var selections = $('#user-query-tab').bootstrapTable('getSelections');
	                var ids = [];
	                var names = [];
	                //遍历选中的记录，将记录的id存放到js数组中
	                for (var i = 0; i < selections.length; i++) {
		                ids.push(selections[i].userId);
		                names.push(selections[i].userName);
	                }
	                //确定删除?
	                swal({
		                icon: 'warning',
		                title: selections.length + "位用户将被删除",
		                text: "你将和他们失去联系: " + names,
		                buttons: ["我再想想...", {text:"删除 !"}],
		                dangerMode: true,
	                })
						//判断用户选择
		                .then((val) => {
			                if (val) removeUsers(ids);
							else swal({
								icon: 'error',
								title: "不删了?",
								text: '你是该好好想想...',
								timer: 1500,buttons: false
							});
		                });
	                return;
                }
                //批量删除用户请求及回执信息
                function removeUsers(ids) {
					$.ajax({
						url: "user/remove",
						type: "post",
						data: {'ids[]': ids},
						datatype:'json',
						success: function (count) {
							if (count > 0)
								swal({
									icon: 'success',
									title: '删除成功',
									text: count +"位用户已和您拜拜~",
									timer: 2500,
									buttons: false
								});
							//重新加载数据
							$('.user-query-submit').click();
						}
					});
                }


                //直接去编辑
				function tabToEditUser() {
					var userId = $('#user-query-tab').bootstrapTable('getSelections')[0].userId;
					//非空检查
					if (! userId) {
						swal("数据为空,请刷新!", {timer: 2000});
						return;
					}
					closableTab.addTab({
						id: 'editUser',
						name: '编辑用户',
						url: 'user/edit/'+ userId,
						closable: true
					});
				}
			</script>
		</div>
	</body>
</html>
