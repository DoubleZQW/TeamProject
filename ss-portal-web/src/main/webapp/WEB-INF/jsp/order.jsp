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
    <script type="text/javascript">
        $.ajax({
            url: "order/query",
            method: "get",
            success: function (result) {
                var objs = result.rows;
                for(var i=0; i<objs.length; i++){
                    $("#li_meal").append(objs[i].mealName);
                }
                alert($("#li_meal").val());
                // $.each(objs, function () {
                //     $("#li_meal").append("<span>" + this.mealName + "</span><span>"+this.amount+"</span>");
                // });
            }
        })
    </script>
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

        <c:choose>
            <c:when test="${sessionScope.sess.userId > 0}">
                <div style="background: rgba(157,157,157,0.28)">
                    <div>
                        <ul style="margin-left: 55px">
                            <li class="li_a">店家信息</li>
                            <li class="li_a">商品信息</li>
                            <li class="li_a">订单状态</li>
                            <li class="li_a">订单操作</li>
                        </ul>
                    </div>
                    <div class="div_d">
                            <%--放订单时间和查看详情--%>
                        <div class="div_e">2018-02-02</div>
                        <div class="div_f">
                            <ul  style="margin-left: 65px;">
                                    <%--商家图片--%>
                                <img src="images/1.png" alt="" style="width: 80px;height: 80px">
                                    <%--商家名称--%>
                                <li class="li_b" id="li_name">淮南牛肉汤</li>
                                    <%--商品名称+商品数量--%>
                                <li class="li_b" id="li_meal"></li>
                                <li class="li_b" id="li_amount">1</li>
                                    <%--订单状态--%>
                                <li  class="li_b" id="li_status">未付款</li>
                                    <%--订单操作--%>
                                <li  class="li_b" id="li_op">删除</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="text-center" style="font-size: 24px;font-weight: bolder;font-style: italic;color: gray">
                    用户未登录！
                </div>
            </c:otherwise>
        </c:choose>

    </div>
</div>

<script type="text/javascript">


</script>
</body>
</html>