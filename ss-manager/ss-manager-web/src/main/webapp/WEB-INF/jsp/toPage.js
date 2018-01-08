function toPage(page){

	if(page){
		$("#page").val(page);

	}
	document.customerForm.submit();

}

$(function(){
	var url="${pageContext.request.contextPath}/dict_findByCode.action";
	var params={"dict_type_code":"006"};
	$.post(url,params,function(data){
		//数据
		//alert(data);
		$(data).each(function(i,n){
			//alert(i+"...."+n.dict_item_name);

			var valId="${model.level.dict_id}";
			if(valId==n.dict_id){
				$("#levelId").append("<option value='"+n.dict_id+"' selected>"+n.dict_item_name+"</option>");
			}else{
				$("#levelId").append("<option value='"+n.dict_id+"'>"+n.dict_item_name+"</option>");
			}

		});


	},"json");

	//获取来源
	var params={"dict_type_code":"002"};
	$.post(url,params,function(data){
		//数据
		//alert(data);
		$(data).each(function(i,n){
			//alert(i+"...."+n.dict_item_name);
			var valId="${model.source.dict_id}";
			if(valId==n.dict_id){
				$("#sourceId").append("<option value='"+n.dict_id+"' selected>"+n.dict_item_name+"</option>");
			}else{
				$("#sourceId").append("<option value='"+n.dict_id+"'>"+n.dict_item_name+"</option>");
			}

		});


	},"json");


});