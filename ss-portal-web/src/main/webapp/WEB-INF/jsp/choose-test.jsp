<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>美食达</title>

    <![endif]-->
    <!--[if IE 6]>
    <script type="text/javascript" src="js/evpng.js"></script>
    <script language="javascript" type="text/javascript">EvPNG.fix(".pngFix,.pngFix:hover");</script><![endif]-->
    <link rel="stylesheet" type="text/css" media="all" href="css/ss_base.css"/>
    <link rel="stylesheet" type="text/css" media="all" href="css/main.css"/>
    <link rel="stylesheet" type="text/css" media="all" href="css/index.css"/>
    <script type="text/javascript" src="js/j.m.js"></script>
    <script type="text/javascript" src="js/list.js"></script>
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=100">
    <meta http-equiv="Expires" content="Tue, 16 Jan 2018 13:40:02 GMT">
    <script type="text/javascript" src="js/m.js"></script>

    <!-- Required Stylesheets -->
    <link href="resources/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <link href="resources/css/commons.css" rel="stylesheet">
    <%-- bootstrap-table --%>
    <link href="resources/bootstrap-table/bootstrap-table.css" rel="stylesheet">

    <!-- Required Javascript -->
    <script src="resources/jquery/jquery-3.2.1.js"></script>
    <script src="resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <%-- bootstrap-closable-tab.js --%>
    <script src="resources/bootstrap-closable-tab/closable-tab-div.js"></script>
    <%-- bootstrap-table --%>
    <script src="resources/bootstrap-table/bootstrap-table.js" rel="stylesheet"></script>
    <script src="resources/bootstrap-table/bootstrap-table-zh-CN.js" rel="stylesheet"></script>
    <%-- moment.js --%>
    <script src="resources/moment/moment.js" rel="stylesheet"></script>
    <script src="resources/moment/moment-with-locales.js" rel="stylesheet"></script>
    <script src="resources/sweet-alert/sweetalert.min.js" rel="stylesheet"></script>
    <%--<script src="https://sweetalert.js.org/assets/sweetalert/sweetalert.min.js"></script>--%>
    <%-- 自定义扩展的js --%>
    <script src="resources/js/commons.js"></script>

</head>
<body style="height: 1000px">

<div class="header">
    <div class="header_c">
        <a href="/TeamProject" class="logo pngFix"></a>
        <div class="main_search_top_w">
            <div class="suggestionsBox" id="suggestions" style="display:none;">
                <ul class="suggestionList" id="autoSuggestionsList"></ul>
            </div>
            <form class="search" action="#">
                <input type="text" class="text" name="q" defaultval="请输入菜名/商家名" x-webkit-speech=""
                       value="请输入菜名/商家名" autocomplete="off"
                       onfocus="if(this.value=='请输入菜名/商家名'){this.value='';}$(this).css('color','#333');"
                       onblur="if(this.value==''){this.value='请输入菜名/商家名';$(this).css('color','#999');}"
                       href="/ajax/ajaxtitle.php" id=""><input type="submit" class="submit" value="搜 索" style="margin-left: -18px;">
            </form>
        </div>


		<link rel="stylesheet" type="text/css" href="resources/drop-menu/css/style2.css" />
		<script src="resources/drop-menu/js/modernizr.custom.63321.js"></script>
		<%--<script src="http://www.jq22.com/jquery/1.8.3/jquery.min.js"></script>--%>
		<script type="text/javascript" src="resources/drop-menu/js/jquery.dropdown.js"></script>
		<%--导入我的common.js--%>
		<script type="text/javascript" src="resources/drop-menu/js/common.js"></script>
		<div class="cd-dropdown-position">
			<c:choose>
				<c:when test="${empty sess.userName}">
					<div class="log-reg-box">
						<button class="col-xs-6" onclick="show_login();">
							登录
						</button>
						<button class="col-xs-6" onclick="show_register();">
							注册
						</button>
					</div>
				</c:when>
				<c:otherwise>
					<div class="cd-dropdown-position">
						<select id="cd-dropdown" class="cd-select" style="height: 30px;width: 50px">
							<option value="-1" selected>${sess.userName}</option>
							<option value="1" class="glyphicon glyphicon-shopping-cart" onclick="alert(23423);">购物车</option>
							<option value="2" class="glyphicon glyphicon-list-alt">订单中心</option>
							<option value="3" class="glyphicon glyphicon-user">用户概览</option>
							<option value="4" class="glyphicon glyphicon-log-out">退出登录</option>
						</select>
					</div>
					<script type="text/javascript">
						$( function() {
							$( '#cd-dropdown' ).dropdown( {
								gutter : 5,
								delay : 100,
								random : true
							} );
						});
					</script>
				</c:otherwise>
			</c:choose>
		</div>

    </div>
</div>

</body>
</html>