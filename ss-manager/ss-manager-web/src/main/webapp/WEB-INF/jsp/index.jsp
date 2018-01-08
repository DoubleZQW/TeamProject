<%@ page contentType="text/html;charset=UTF-8" %>

<html>
	<head>
		<title>后台管理系统</title>
		<!-- Required Stylesheets -->
		<link href="resources/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
		<link href="resources/css/commons.css" rel="stylesheet">

		<!-- Required Javascript -->
		<script src="resources/jQuery/jquery-3.2.1.js"></script>
		<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
		<%--<script src="../bootstrap-closable-tab/bootstrap-closable-tab.js"></script>--%>
		<script src="resources/bootstrap-closable-tab/closable-tab-div.js"></script>

		<%--toPage算法--%>
		<script src="toPage.js"></script>

	</head>

	<body>
		<div class="container">
			<div class="col-md-12 text-center" style="padding-bottom: 20px">
				<h1><em style="color: cornflowerblue">后台管理系统</em></h1>
				<h4><em style="color: gray">Version: 0.1-beta</em></h4>
			</div>

			<%--<div class="col-md-2" style="border: solid dodgerblue; border-radius: 10px; padding: 20px; margin: 20px">--%>
			<div class="col-md-2">
				<div class="text-center">
					<label>管理菜单</label>
				</div>

				<div class="text-center">
					<div class="btn-group-vertical" role="group">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-info dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								用户管理 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="javascript:closableTab.addTab({id: 'editUser',name: '查询用户',url: 'user-query',closable: true});">查询</a></li>
								<li><a href="javascript:closableTab.addTab({id: 'addUser',name: '添加用户',url: 'user-add',closable: true});">添加</a></li>
							</ul>
						</div>
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-primary dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								商品管理 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="#">添加</a></li>
								<li><a href="#">修改</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">删除</a></li>
							</ul>
						</div>
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-success dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								评价管理 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="#">添加</a></li>
								<li><a href="#">修改</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">删除</a></li>
							</ul>
						</div>
					</div>
				</div>

			</div>

			<div class="col-md-10">
				<!-- 高级选项卡主体 -->
				<ul class="nav nav-tabs" role="tablist"></ul>
				<%-- 高级选项卡内容 --%>
				<div class="tab-content" style="height: 80%;width:100%;overflow-y: auto;"></div>
			</div>

		</div>

		<script type="text/javascript">
			var defaultTab={
				id: 'welcome',
				name: '欢迎页',
				url: 'welcome.jsp',
				closable: false
			};

			$(closableTab.addTab(defaultTab));
		</script>

	</body>
</html>