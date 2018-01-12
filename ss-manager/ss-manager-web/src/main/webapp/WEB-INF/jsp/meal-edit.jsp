<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>Title</title>
	</head>
	<body>
		<%--填写字段--%>
		<div class="col-xs-12 column">
			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="mealId">商品Id</label>
					<input type="text" id="mealId" class="form-control input-sm" disabled="disabled"/>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="mealName">商品名</label>
					<input type="text" id="mealName" class="form-control input-sm"/>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="mealStatus">上架状态</label>
					<select class="form-control input-sm" id="mealStatus">
						<option value="1">上架中</option>
						<option value="2">已下架</option>
						<option value="3">已删除</option>
					</select>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="mealPrice">价格</label>
					<input type="text" id="mealPrice" class="form-control input-sm"/>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="mealNum">库存</label>
					<input type="text" id="mealNum" class="form-control input-sm"/>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="mealIntro">介绍</label>
					<input type="text" id="mealIntro" class="form-control input-sm"/>
				</div>
			</div>
		</div>

		<script type="text/javascript">
			$(function() {
				//向input中注入各种值
				if("true"==="${not empty meal.mealId}") {
					$('#mealId').val("${meal.mealId}");
					$('#mealName').val("${meal.mealName}");
					$('#mealStatus').val("${meal.mealStatus}");
					const price = ${meal.mealPrice}/100;
					$('#mealPrice').val(price);
					$('#mealNum').val("${meal.mealNum}");
					$('#mealIntro').val("${meal.mealIntro}");
				}
			});
		</script>

		<%--提交按钮--%>
		<div class="row clearfix">
			<div class="col-xs-4 column">
			</div>
			<div class="col-xs-4 column">
				<div class="btn-group btn-group-justified" role="group">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-info btn-sm meal-edit-submit" onclick="void(0);">
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

		<script type="text/javascript">
			$('.meal-edit-submit').click(function() {
				$.ajax({
					method: 'post',
					url: 'meal/update',
					data: {
						mealId: $('#mealId').val(),
						mealName: $('#mealName').val(),
						mealStatus: $('#mealStatus').val(),
						mealPrice: $('#mealPrice').val()*100,
						mealNum: $('#mealNum').val(),
						mealIntro: $('#mealIntro').val(),
					},
					success: function(data) {
						if(data > 0) {
							swal("修改成功!", {timer: 2000});
							$('body').find("[tabclose='tab_seed_editMeal']")[0].click();
							$('#meal-list-tab').bootstrapTable('refresh');
						} else
							swal("修改失败!", "稍后再试...", {timer: 2000});
					},
					dataType: 'json'
				});
			});
		</script>
	</body>
</html>
