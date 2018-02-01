<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>美食达</title>
    <link rel="stylesheet" type="text/css" media="all" href="css/mystyle.css"/>
    <link href="resources/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/carts.css">
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
    <script src="resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
</head>
<body>
<div>
    <div class="container">
        <div class="col-xs-12" style="background: red">
            <div class="col-xs-3" style="padding: 10px">
                <span class="text-center"><a href="/TeamProject" class="logo"></a></span>
            </div>
            <div class="col-xs-6 text-center" style="padding-top: 50px">
                <div class="btn-group">
                    <button class="btn btn-lg input_inner" style="width: 170px;"><strong>所有订单</strong></button>
                    <button class="btn btn-lg input_inner" style="width: 170px;"><strong>待付款</strong></button>
                    <button class="btn btn-lg input_inner" style="width: 170px;"><strong>待评价</strong></button>
                </div>
            </div>
            <div class="col-xs-3" style="padding-top: 55px">
                <div class="input-group col-xs-12">
                    <input class="form-control input_inner" type="text">
                    <span class="input-group-btn">
                        <button class="btn btn-default input_inner" type="button"><strong>查询</strong></button>
                    </span>
                </div>
            </div>
        </div>
        <div class="">
            <table class="table_a">
                <thead>
                <tr class="text-center">
                    <td class="td_a" style="width: 200px">店家</td>
                    <td class="td_a">商品</td>
                    <td class="td_a">交易状态</td>
                    <td class="td_a">实付款</td>
                    <td class="td_a">商品操作</td>
                    <td class="td_a">交易操作</td>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${result.rows}" var="item">
                        <tr>
                            <td>${item.pName}</td>
                            <td>${item.mealName}</td>
                            <td>${item.orderStatus}</td>
                            <td>${item.payment}</td>
                            <td>
                                <button class="btn btn-sm btn-info">查看</button>
                                <button class="btn btn-sm btn-danger">删除</button>
                            </td>
                            <td>
                                <button class="btn btn-sm btn-default">退款</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div>
        <div class="div_c">
            <span>订单时间</span>
            <span>订单编号</span>
            <span>商家名</span>
        </div>
        <div class="div_c">商品名     数量</div>
        <div class="div_c">商品状态</div>
        <div class="div_c">付款金额</div>
        <div class="div_c">操作</div>
    </div>
</div>
</div>


</body>
</html>