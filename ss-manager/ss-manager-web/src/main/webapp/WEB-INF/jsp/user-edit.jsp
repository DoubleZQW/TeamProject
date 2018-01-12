<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>--%>
<html>
	<head>
		<title>Title</title>
	</head>
	<body>
		<%--填写字段--%>
		<div class="col-xs-12 column">
			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="userId">用户Id</label>
					<input type="text" id="userId" name="userId" class="form-control input-sm" disabled="disabled"/>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="userName">用户名</label>
					<input type="text" id="userName" name="userName" class="form-control input-sm"/>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="userStatus">状态</label>
					<select class="form-control input-sm" id="userStatus" name="userStatus">
						<option value="1">存在</option>
						<option value="2">删除</option>
					</select>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="userLevel">权限</label>
					<select class="form-control input-sm" id="userLevel" name="userLevel">
						<option value="1">用户</option>
						<option value="2">管理员</option>
					</select>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="userSex">性别</label>
					<select class="form-control input-sm" id="userSex" name="userSex">
						<option value="0">女</option>
						<option value="1">男</option>
					</select>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="userPhone">手机号</label>
					<input type="text" id="userPhone" name="userPhone" class="form-control input-sm"/>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="userEmail">电子邮件</label>
					<input type="text" id="userEmail" name="userEmail" class="form-control input-sm"/>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="userOthername">昵称</label>
					<input type="text" id="userOthername" name="userOthername" class="form-control input-sm"/>
				</div>
			</div>

			<div class="col-xs-12 column">
				<div class="form-group">
					<label for="address">地址</label>
					<input type="text" id="address" name="address" class="form-control input-sm"/>
				</div>
			</div>

		</div>

			<script type="text/javascript">
				$(function() {
					//向input中注入各种值
					if("true"==="${not empty user.userId}") {
						$('#userId').val("${user.userId}");
						$('#userName').val("${user.userName}");
						$('#userStatus').val("${user.userStatus}");
						$('#userLevel').val("${user.userLevel}");
						$('#userSex').val("${user.userSex}");
						$('#userPhone').val("${user.userPhone}");
						$('#userEmail').val("${user.userEmail}");
						$('#userOthername').val("${user.userOthername}");
						<%--$('#address').val(${user.address});--%>
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
						<button type="button" class="btn btn-info btn-sm user-edit-submit" onclick="void(0);">
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
			$('.user-edit-submit').click(function() {
				$.ajax({
					method: 'post',
					url: 'user/update',
					data: {
						userId: "${user.userId}",
						userName: $('#userName').val(),
						userStatus: $('#userStatus').val(),
						userLevel: $('#userLevel').val(),
						userSex: $('#userSex').val(),
						userPhone: $('#userPhone').val(),
						userEmail: $('#userEmail').val(),
						userOthername: $('#userOthername').val(),
						// address: $('#address').val(),
					},
					success: function(data) {
						if(data > 0) {
							swal("修改成功!", {timer: 2000});
							$('body').find("[tabclose='tab_seed_editUser']")[0].click();
							$('#user-query-tab').bootstrapTable('refresh');
						} else
							swal("修改失败!", "稍后再试...", {timer: 2000});
					},
					dataType: 'json'
				});
			});
		</script>
	</body>
</html>
