//设置各个工具栏按钮的禁用规则
function setDisabled(type) {
	if ('user' === type) {
		var count = $('#user-query-tab').bootstrapTable('getSelections').length;
		//编辑按钮
		if (count === 1)
			$(".btn-user-edit")[0].removeAttribute("disabled");
		else
			$(".btn-user-edit")[0].setAttribute("disabled", "disabled");
		//删除按钮
		if (count > 0)
			$(".btn-user-remove")[0].removeAttribute("disabled");
		else
			$(".btn-user-remove")[0].setAttribute("disabled", "disabled");
		return this;
	}
	if ('meal' === type) {
		var count = $('#meal-list-tab').bootstrapTable('getSelections').length;
		//编辑按钮
		if (count === 1)
			$('.btn-meal-edit')[0].removeAttribute("disabled");
		else
			$('.btn-meal-edit')[0].setAttribute("disabled", "disabled");
		//删除按钮
		if (count > 0)
			$('.btn-meal-remove')[0].removeAttribute("disabled");
		else
			$('.btn-meal-remove')[0].setAttribute("disabled", "disabled");
		return this;
	}
	if ('order' === type) {
		var count = $('#order-list-tab').bootstrapTable('getSelections').length;
		//删除按钮
		if (count > 0)
			$('.btn-order-remove')[0].removeAttribute("disabled");
		else
			$('.btn-order-remove')[0].setAttribute("disabled", "disabled");
		return this;
	}
}