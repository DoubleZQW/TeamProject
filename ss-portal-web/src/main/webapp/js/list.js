$(function(){
$("#addCdToFavInCon").hover(function(){
	if($(this).html()=="已收藏"){
		$(this).html("取消收藏");
	}
},function(){
	if($(this).html()=="取消收藏"){
		$(this).html("已收藏");
	}
});
$("#tizhi_zzbox_la").click(function(){
	var _this = $(this);
	var _ul = _this.next();
	_ul.animate({"margin-left":"0px"},400,function(){
		_ul.find("li").last().prependTo(_ul);
		_ul.css("margin-left","-130px");
	});
});
$("#tizhi_zzbox_ra").click(function(){
	var _this = $(this);
	var _ul = _this.prev();
	_ul.animate({"margin-left":"-260px"},400,function(){
		_ul.find("li").first().appendTo(_ul);
		_ul.css("margin-left","-130px");
	});
});
$(".tzyj_sc_item").hover(function(){
	$(this).siblings().removeClass("tzyj_sc_item_cur");
	$(this).addClass("tzyj_sc_item_cur");
},function(){
});
$(".tzyj_sc_tabitem span.title").mouseover(function(){
	if($(this).parent().hasClass("tzyj_sc_tabitem_cur")){
		//$(this).parent().removeClass("tzyj_sc_tabitem_cur");
	}else{
		$(this).parent().siblings().removeClass("tzyj_sc_tabitem_cur");
		$(this).parent().addClass("tzyj_sc_tabitem_cur");
	}
});
$(".left_arrow").click(function(){
	var _this = $(this);
	var _ul = _this.next().find("ul");
	
	_ul.animate({"margin-left":"0px"},400,function(){
		_ul.find("li").last().prependTo(_ul);
		_ul.css("margin-left","-130px");
	});
});
$(".right_arrow").click(function(){
	var _this = $(this);
	var _ul = _this.prev().find("ul");
	_ul.animate({"margin-left":"-260px"},400,function(){
		_ul.find("li").first().appendTo(_ul);
		_ul.css("margin-left","-130px");
	});
});
$(".filter_otherbtn").toggle(function(){
	var _this = $(this);
	_this.html("<< 收起");
	$(this).prev().find(".others").fadeIn(function(){
		
	});
},function(){
	var _this = $(this);
	_this.html("展开全部 >>");
	$(this).prev().find(".others").fadeOut(function(){
		
	});
});
$(".other_c").css("min-height",$("#listnav_con_c").height()+"px");
$("#fliterstyle1 dt").click(function(){
	var _this=$(this);
	if(_this.parent().hasClass("on")){
	}else{
		_this.parents(".tabcon").find("dl.on").find("dd").slideUp(function(){
		});
		_this.parents(".tabcon").find("dl.on").removeClass("on");
		_this.next().slideDown(function(){
			_this.parent().find(".long").slideDown();
		});
		_this.parent().addClass("on");
	}
});
$("#fliterstyle1 .tab li").click(function(){
	var po = $(this).attr("po");
	if(!$(this).hasClass("current")){
		$(this).siblings().removeClass("current");
		$(this).addClass("current");
	}
	$("#fliterstyle1 .tabcon").each(function(){
		if($(this).attr("po") == po){
			$(this).siblings(".tabcon").hide();
			$(this).show();
		}
	});
});
$("#cdlists li").click(function(){
	var _this = $(this);
	var po = _this.attr("po");
	if($("#cdlist .cdlist_w[po='"+po+"']").length>0){
		
		_this.siblings().removeClass("current");
		_this.addClass("current");
		$("#cdlist .loading").hide();
		$(".cdlist_w").removeClass("cdlist_w_current");
		$("#cdlist .cdlist_w[po='"+po+"']").addClass("cdlist_w_current");
	}else{
		$(".cdlist_w").removeClass("cdlist_w_current");
		$("#cdlist .loading").css("display","block");
		_this.siblings().removeClass("current");
		_this.addClass("current");
		
		$.post("ajax_cdlist.html", { name: "John", time: "2pm" },
			function(data){
				
				$(".cdlist_w").removeClass("cdlist_w_current");
			 	$("#cdlist .loading").hide();
			 	$("#cdlist").append(data);
			 	
		});
	}
});
    
});	