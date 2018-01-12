<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>商品列表</title>
    </head>
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
                    <label for="meal_status">状态</label>
                    <select class="form-control input-sm" id="meal_status" name="meal_status">
                        <option value="">-请选择-</option>
                        <option selected="selected" value="1">上架</option>
                        <option value="2">下架</option>
                        <option value="3">删除</option>
                    </select>
                </div>
            </div>

            <div class="col-xs-6 column">
                <div class="form-group">
                    <label for="meal_cat">商品分类</label>
                    <select class="form-control input-sm" id="meal_cat" name="meal_cat">
                        <option value="">-请选择-</option>
                        <option value="1">分类名1</option>
                        <option value="2">分类名2</option>
                        <option value="3">分类名3</option>
                    </select>
                </div>
            </div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="meal_price">价格</label>
					<input type="text" id="meal_price" name="meal_price" class="form-control input-sm"/>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="meal_number">库存</label>
					<input type="text" id="meal_number" name="meal_number" class="form-control input-sm"/>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="publisher">发布者</label>
					<input type="text" id="publisher" name="publisher" class="form-control input-sm"/>
				</div>
			</div>

			<div class="col-xs-6 column">
				<div class="form-group">
					<label for="meal_intro">商品描述</label>
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
                        <button type="button" class="btn btn-info btn-sm meal-add-submit" onclick="void(0);">
							<span class="glyphicon glyphicon-send"></span> 新增
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
			function reset(v) {
				v = $('body').find("[tabclose='tab_seed_addMeal']").eq(0);
				// console.log(v);
				//关闭该标签页
				closableTab.closeTab(v);
				//同时还原一个新的标签页
				closableTab.addTab({id: 'addMeal',name: '添加商品',url: 'meal-add',closable: true});
			}

			$('.meal-add-submit').click(function() {
				$.ajax({
					method: 'post',
					url: 'meal/add',
					data: {
						mealName: $('#meal_name').val(),
						mealStatus: $('#meal_status').val(),
						mealCat: $('#meal_cat').val(),
						mealPrice: $('#meal_price').val()*100,
						mealNum: $('#meal_number').val(),
						publisher: $('#publisher').val(),
						mealIntro: $('#meal_intro').val(),
					},
					success: function(data) {
						if(data > 0) {
							swal("修改成功!", {timer: 2000});
							$('body').find("[tabclose='tab_seed_addMeal']")[0].click();
							$('#meal-list-tab').bootstrapTable('refresh');
						} else
							swal("修改失败!", "稍后再试...", {timer: 2000});},
					dataType: 'json'
				});
			});
		</script>
    </body>
</html>
