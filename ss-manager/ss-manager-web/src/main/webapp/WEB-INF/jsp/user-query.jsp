<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<title>Title</title>

		<script type="text/javascript">
			//绑定查询按钮的的点击事件,让其使用AJAX提交并返回给表格
			$(function(){
				$(".cust_list_submit").on("click",function() {
					$.ajax({
						url:"user/query",
						type:"POST",
						// data:$("#customerForm").serialize(),
						dataType:"json",
						success:function(json) {
							//清除以前表格中的数据
							$("#listData").text("");
							$(json.data).each(
								function(i, user) {
									$("#listData").append(
										"<tr>"+
											"<td style='min-width: 100px;word-break: break-all;word-wrap: break-word'>"+ user.userId +"</td>"+
											"<td style='max-width: 100px;word-break: break-all;word-wrap: break-word'>"+ user.userName +"</td>"+
											"<td style='max-width: 100px;word-break: break-all;word-wrap: break-word'>"+ user.userPhone +"</td>"+
											"<td style='max-width: 100px;word-break: break-all;word-wrap: break-word'>"+ user.userEmail +"</td>"+
											"<td style='max-width: 100px;word-break: break-all;word-wrap: break-word'>"+ user.userOthername +"</td>"+
											"<td>"+
												"<div class='btn-group'>"+
													"<button type='button' class='btn btn-info btn-xs'>修改</button>"+
													"<button type='button' class='btn btn-warning btn-xs'>删除</button>"+
												"</div>"+
											"</td>"+
										"</tr>"
									);
								}
							);
							list(json);
						}
					})
				});
			});

		</script>
	</head>
	<body>
		<%--<h2><em style="color: gray">查询用户...</em></h2>--%>

		<%--<div id="box">box的默认值</div>--%>
		<%--<script type="text/javascript">--%>
			<%--$(--%>
				<%--$.ajax({--%>
						<%--type: 'GET',--%>
						<%--url: 'user/query',--%>
						<%--success: function(response) {--%>
							<%--$('#box').html(response);--%>
						<%--},--%>
						<%--dataType: 'text'--%>
					<%--}--%>
				<%--)--%>
			<%--);--%>
		<%--</script>--%>

		<%--上方查询条件--%>
		<div class="col-xs-12 column">
			<br>
			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="cust_name">用户名</label>
					<input type="text" class="form-control" id="cust_name" name="cust_name"/>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="cust_level">用户类型</label>
					<select class="form-control" name="cust_level" id="cust_level">
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
						<button type="button" class="btn btn-info cust_list_submit">查询</button>
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
					<%--<span class="label label-default">--%>
						<%--<em style="font-weight: 400">每页显示:</em>--%>
						<%--<select name="pageSize" id="pageSize">--%>
							<%--<option value="1">1</option>--%>
							<%--<option value="2">2</option>--%>
							<%--<option value="3" selected="selected">3</option>--%>
							<%--<option value="4">4</option>--%>
							<%--<option value="5">5</option>--%>
							<%--<option value="6">6</option>--%>
							<%--<option value="7">7</option>--%>
							<%--<option value="8">8</option>--%>
							<%--<option value="9">9</option>--%>
							<%--<option value="10">10</option>--%>
						<%--</select>--%>
						<%--<button type="button" class="btn btn-info btn-xs cust_list_submit">查询</button>--%>
					<%--</span>--%>
					<a href="javascript:closableTab.addTab({id: 'editUser',name: '添加用户',url: 'user-add.jsp',closable: true});" style="float: right">
						<button type="button" class="btn btn-sm btn-info">添加用户</button>
					</a>
				</h4>
			</div>

			<!-- Table -->
			<table class="table table-view">
				<thead>
					<tr>
						<th class="th th-primary" style="min-width: 60px">编号</th>
						<th>用户名</th>
						<th>手机号</th>
						<th>E-Mail</th>
						<th>身份</th>
						<th style="text-align: center;min-width: 100px">操作</th>
					</tr>
				</thead>

				<tbody id="listData">
					<%-- 已用jQuery-AJAX生成,见"list-index.jsp" --%>
				</tbody>
			</table>

			<%--Panel Footer--%>
			<div  id="listPage" class="panel-footer" style="text-align: center">
				<jsp:include page="page.jsp" flush="true" />
			</div>
		</div>

		<script type="text/javascript">
			//页面加载后自动展示数据表格
			$(function(){
				$('.cust_list_submit').click();
			});
		</script>
	</body>
</html>
