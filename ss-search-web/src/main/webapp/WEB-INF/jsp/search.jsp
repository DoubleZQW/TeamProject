<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>搜索结果 - ${query}</title>
	</head>

	<body>
		<c:forEach items="${mealList}" var="item">
			<div>${item.mealName}</div>
			<div>${item.mealIntro}</div>
			<div>库存: ${item.mealNum}</div>
			<div>价格: ${item.mealPrice}</div>
			<img src="${item.mealPic}" />
			<br><br>
		</c:forEach>
	</body>
</html>
