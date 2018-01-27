//用于给任意div,用ajax技术展示所需要的任意页面
function show_div(url, div_id) {
	$.ajax({
		url: url,
		method: 'get',
		success: function(data) {
			$('#'+ div_id).html(data);
			//console.log('向#'+ div_id +'展示url:'+ url +'页面完成.');
		}
	});
}

function show_login(div_id) {
	show_div('login', div_id);
}

function show_register(div_id) {
	show_div('register', div_id);
}

function clean_index() {
	$('#div_main').removeClass('nav');

	var a = $('#bottom_back_top_top');
	var b = $('#divbody');
	if (a.length > 0)
		a.remove();
	if (b.length > 0)
		b.remove();
}

//用于登陆后的下拉菜单的功能
function show_div_proxy(text) {
	clean_index();
	if (text === '购物车')
		show_div('cart', 'div_main');
	if (text === '订单中心')
		show_div('order-list', 'div_main');
	if (text === '用户中心')
		show_div('user-info', 'div_main');
	if (text === '退出登录')
		//ajax退出...
		alert('退出等张振伟写');
}