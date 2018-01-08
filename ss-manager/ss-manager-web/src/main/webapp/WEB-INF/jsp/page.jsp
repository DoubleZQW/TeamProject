<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ page contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	//String path = request.getContextPath();
	//String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>

		<%--该页面为纯jQuery/JS代码,没有固定的HTML--%>

		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript">
			//分页按钮的点击事件,让其更改currentIndex后再执行查询按钮的点击事件(见list-index.jsp的jQuery代码)
			function toPage(currentIndex){
				if(0 === currentIndex)
					return false;
				$("#currentIndex").val(currentIndex);
				$(".cust_list_submit").click();
			}

			//根据AJAX给出的json绘制分页按钮
			function list(json) {
				//定义上一页/下一页按钮的禁用状态
				var disabledPrevious = (1 >= json.currentIndex);
				var disabledNext = (json.totalPage <= json.currentIndex);
				//将之前的清除,并设置一个隐藏的input,用于提交请求的页码
				$("#listPage").html(
					"<input type='hidden' id='currentIndex' name='currentIndex' value="+ json.currentIndex +" />"
				)
				//绘制左边的[上一页]按钮
				.append(
					"<nav aria-label='...'>"+
						"<ul id='ul' class='pagination' style='margin: 0'>"+
							"<li class='"+ (disabledPrevious?"disabled":"") +"' >"+
								"<a href='javascript:toPage("+ (disabledPrevious?"0":(json.currentIndex - 1)) +")' aria-label='Previous'>"+
									"<span aria-hidden='true'>«</span>"+
								"</a>"+
							"</li>"
				);
				//循环绘制[中间]所有的页码
				for(var i = 1; i <= json.totalPage; i++) {
					//定义当前页码按钮的激活状态
					var activeButton = (i === json.currentIndex);
					$("#ul").append(
						"<li class='"+ (activeButton?"active":"") +"'>"+
							"<a type='button' href='javascript:toPage("+ i +");' >"+
								i +
							"</a>"+
						"</li>"
					)
				}
				//绘制右边的[下一页]按钮
				$("#ul").append(
							"<li class='"+ (disabledNext?"disabled":"") +"' >"+
								"<a href='javascript:toPage("+ (disabledNext?"0":(json.currentIndex + 1)) +")' aria-label='Next'>"+
									"<span aria-hidden='true'>»</span>"+
								"</a>"+
							"</li>"+
						"</ul>"+
					"</nav>"
				);
			}
		</script>

	</head>

</html>
