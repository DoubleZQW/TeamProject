function toPage(query, page, text) {
	if (text === "next") {
		page = parseInt(page);
		page ++;
		searchIndex(query, page);
	}
	if (text === "prev") {
		page = parseInt(page);
		page --;
		searchIndex(query, page);
	}
}

function searchIndex(query, page) {
	$.ajax({
		url: 'http://localhost:8887/TeamProject/meals/query',
		method: 'get',
		data: {
			keyword: query,
			page: page
		},
		success: function(data) {
			$("#div_main").html(data);
		}
	});
}