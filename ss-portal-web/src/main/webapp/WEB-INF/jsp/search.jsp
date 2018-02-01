<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link type="text/css" rel="stylesheet" href="resources/css/search-common.css">
<script type="text/javascript" src="resources/js/search-common.js"></script>

<div class="col-xs-2"></div>
<div class="well col-xs-8">
	<%-- 展示商品结果 --%>
	<div style="display: flex;flex-wrap: wrap;justify-content: center">
		<c:forEach items="${mealList}" var="item">
			<div style="margin: auto 10px 20px 10px;">
				<%-- 图片 --%>
				<img src="${item.mealPic}" class="img img-thumbnail item-float" style="width: 170px;height: 170px;margin-bottom: 5px" />
				<%-- 上部分文字 --%>
				<div style="display: flex;justify-content: space-between">
					<div style="font-size: 16px;font-weight: bold">${item.mealName}</div>
					<div style="font-size: 16px;font-weight: bolder">
						<i class="glyphicon glyphicon-yen"></i>
							${item.mealPrice/100}
					</div>
				</div>
				<%-- 下部分文字 --%>
				<div style="display: flex;justify-content: space-between">
					<div style="font-size: 12px;font-weight: normal">${item.mealIntro}</div>
					<div style="font-size: 12px;font-weight: normal">剩余: ${item.mealNum}</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<%-- 展示分页按钮 --%>
	<div class="text-center">
		<c:choose>
			<c:when test="${recordCount == 0}">
				<%-- 不显示分页按钮 --%>
				<h3 style="font-style: italic;color: #9c9c9c">没有找到你要的商品~</h3>
			</c:when>
			<c:when test="${recordCount <= 5}">
				<h3 style="font-style: italic;color: #9c9c9c">结果较少, 尝试调整关键字~</h3>
			</c:when>
			<c:when test="${recordCount > 0}">
				<%-- 绘制按钮 --%>
				<div class="clearfix">
					<div id="btns-page" class="btn-group">
						<button id="btn-prev" class="btn btn-default" onclick="toPage('${query}', '${page}', 'prev');">&lt;</button>
						<c:forEach var="i" begin="1" end="${totalPages}">
							<button class="btn btn-default" onclick="searchIndex('${query}', ${i});">${i}</button>
						</c:forEach>
						<button id="btn-next" class="btn btn-default" onclick="toPage('${query}', '${page}', 'next');">&gt;</button>
					</div>
				</div>
				<%-- 初始化分页按钮组 --%>
				<script type="text/javascript">
					$(function() {
						var a = $("#btns-page").find(":contains('${page}')").addClass('btn-info');
						a[0].setAttribute('disabled','disabled');
						if ('${page == 1}' === 'true')
							$('#btn-prev')[0].setAttribute('disabled','disabled');
						if ('${page == totalPages}' === 'true')
							$('#btn-next')[0].setAttribute('disabled','disabled');
					});
				</script>
			</c:when>
			<c:otherwise>
				<%-- 不显示分页按钮 --%>
				<h3 style="font-style: italic;color: #9c9c9c">没有找到你要的商品~</h3>
			</c:otherwise>
		</c:choose>
	</div>

</div>

<div class="col-xs-2"></div>