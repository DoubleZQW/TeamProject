<%@ page contentType="text/html;charset=UTF-8" %>

<html>
	<head>
		<title>后台管理系统</title>
		<!-- Required Stylesheets -->
		<link href="resources/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
		<link href="resources/css/commons.css" rel="stylesheet">
		<%-- bootstrap-table --%>
		<link href="resources/bootstrap-table/bootstrap-table.css" rel="stylesheet">

		<!-- Required Javascript -->
		<script src="resources/jquery/jquery-3.2.1.js"></script>
		<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
		<%-- bootstrap-closable-tab.js --%>
		<script src="resources/bootstrap-closable-tab/closable-tab-div.js"></script>
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
		<div class="container">
			<div class="col-xs-12 text-center">
				<h2><em style="color: cornflowerblue">后台管理系统</em></h2>
				<h5><em style="color: gray">Version: 0.1-beta</em></h5>
			</div>

			<%--<div class="clearfix col-xs-1"></div>--%>
			<%--<div class="col-xs-2" style="border: solid dodgerblue; border-radius: 10px; padding: 20px; margin: 20px">--%>
			<div class="col-xs-2 well">
				<div class="text-center">
					<label><span class="glyphicon glyphicon-tasks"></span> 管理菜单</label>
				</div>

				<div class="text-center">
					<div class="btn-group-vertical" role="group">
						<div class="btn-group" role="group">
							<button type="button" class="btn dropdown-toggle" style="background-color: #FF6666;color: white"
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<span class="glyphicon glyphicon-user"></span> 用户管理
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="javascript:closableTab.addTab({id: 'queryUser',name: '查询用户',url: 'user-query',closable: true});">
									<span class="glyphicon glyphicon-search"></span> 查询
								</a></li>
							</ul>
						</div>

						<div class="btn-group" role="group">
							<button type="button" class="btn dropdown-toggle" style="background-color: #66CC66;color: white"
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<span class="glyphicon glyphicon-leaf"></span> 商品管理
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="javascript:closableTab.addTab({id: 'queryMeals',name: '查询商品',url: 'meals-list',closable: true});">
									<span class="glyphicon glyphicon-search"></span> 查询
								</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="javascript:closableTab.addTab({id: 'addMeal',name: '添加商品',url: 'meal-add',closable: true});">
									<span class="glyphicon glyphicon-plus"></span> 添加
								</a></li>
							</ul>
						</div>

						<div class="btn-group" role="group">
							<button type="button" class="btn dropdown-toggle" style="background-color: #0099CC;color: white"
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<span class="glyphicon glyphicon-list-alt"></span> 订单管理
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="javascript:closableTab.addTab({id: 'queryOrder',name: '查询订单',url: 'order-list',closable: true});">
									<span class="glyphicon glyphicon-search"></span> 查询
								</a></li>
							</ul>
						</div>

						<div class="btn-group" role="group">
							<button type="button" class="btn dropdown-toggle" style="background-color: #FFFF66"
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<span class="glyphicon glyphicon-thumbs-up"></span> 评价管理
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="#">
									<span class="glyphicon glyphicon-search"></span> 查询
								</a></li>
							</ul>
						</div>
					</div>
				</div>

			</div>

			<div class="col-xs-10">

				<!-- 高级选项卡主体 -->
				<ul class="nav nav-tabs" role="tablist"></ul>
				<div class="col-xs-12 well">
					<%-- 高级选项卡内容 --%>
					<div class="tab-content" style="height: 10%;width:100%;"></div>
				</div>
			</div>

		</div>

		<script type="text/javascript">
			var defaultTab={
				id: 'welcome',
				name: '欢迎页',
				url: 'welcome.jsp',
				closable: false
			};
			$("#btn_add").click(function () {
				$("#myModalLabel").text("新增");
				$('#myModal').modal();
			});
			$(closableTab.addTab(defaultTab));
		</script>

	</body>
</html>
