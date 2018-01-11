<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>Title</title>
	</head>
	<body>
	<form method="post" action="user/edit">
		<%--上方查询条件--%>
		<div class="col-xs-12 column">
			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="user_id">用户Id</label>
					<input type="text" id="user_id" name="user_id" value="${user.userId}" class="form-control input-sm"/>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="meal_status">状态</label>
					<select class="form-control input-sm" name="meal_status" id="meal_status">
						<option value="">-请选择-</option>
						<option selected="selected" value="1">上架</option>
						<option value="2">下架</option>
						<option value="3">删除</option>
					</select>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="meal_status">商品分类</label>
					<select class="form-control input-sm" name="meal_cat" id="meal_cat">
						<option value="">-请选择-</option>
						<option value="1">分类名1</option>
						<option value="2">分类名2</option>
						<option value="3">分类名3</option>
					</select>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="user_name">用户名</label>
					<input type="text" id="user_name" name="user_name" value="${user.userName}" class="form-control input-sm"/>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="meal_name">库存</label>
					<input type="text" id="meal_number" name="meal_number" class="form-control input-sm"/>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="meal_name">发布者</label>
					<input type="text" id="publisher" name="publisher" class="form-control input-sm"/>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="meal_name">商品描述</label>
					<input type="text" id="meal_intro" name="meal_intro" class="form-control input-sm"/>
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
						<button type="button" class="btn btn-info btn-sm meal-list-submit" onclick="void(0);">
							<span class="glyphicon glyphicon-send"></span> 提交
						</button>
					</div>
					<div class="btn-group" role="group">
						<button class="btn btn-warning btn-sm" onclick="reset(this);">
							<span class="glyphicon glyphicon-refresh"></span> 重置
						</button>
					</div>
				</div>
			</div>
		</div>
		<br>
	</form>
	</body>
</html>
