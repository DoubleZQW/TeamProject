<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>用户</title>
    <!--用百度的静态资源库的cdn安装bootstrap环境-->
    <!-- Bootstrap 核心 CSS 文件 -->
    <link href="resources/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <!--font-awesome 核心我CSS 文件-->
    <link href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <%--<link href="resources/bootstrap-3.3.7-dist/css/font-awesome.css" rel="stylesheet">--%>
    <!-- 在bootstrap.min.js 之前引入 -->
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
    <!-- Bootstrap 核心 JavaScript 文件 -->
    <script src="resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <!--jquery.validate-->
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <style type="text/css">
        body {
            background: url("images/4.jpg") no-repeat;
            background-size: cover;
            font-size: 18px;
        }

        .form {
            background: rgba(255, 255, 255, 0.2);
            width: 600px;
            margin: 100px auto;
        }

        #login_form {
            display: block;
        }

        #register_form {
            display: none;
        }

        .fa {
            display: inline-block;
            top: 27px;
            left: 8px;
            position: relative;
            color: #ccc;
        }

        input[type="text"], input[type="password"] {
            padding-left: 38px;
        }

        .error, .correct {
            height: 20px;
            width: 20px;
            position: absolute;
            top: 19px;
            right: 9px;
            background: url("js/ICON_20.svg") no-repeat 0 -20px;
        }

        .error span {
            display: block;
            position: absolute;
            top: 30px;
            right: 20px;
            background: #fcc;
            border: 1px solid #f33;
            font-size: 12px;
            line-height: 16px;
            color: #600;
            padding: 6px 10px 4px 10px;
            border-radius: 5px;
            opacity: .8;
            white-space: nowrap;
            overflow: hidden;
        }

        .correct {
            background-position: 0 0;
        }

        .correct span {
            display: none;
        }

        .none {
            display: none;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form row">
        <div class="form-horizontal col-sm-offset-3 col-md-offset-3" id="login_form">
            <h3 style="margin-top: 20px;">注册页面</h3>
            <br>
            <div class="col-sm-9 col-md-9">
                <div class="form-group" id="line_userName">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control" type="text" placeholder=" 用户名" id="userName" name="userName"
                           autofocus="autofocus" maxlength="20"/>
                    <div class="none">
                        <span></span>
                    </div>
                </div>
                <div class="form-group" id="line_userPassword">
                    <%--表单组件图标i和文本框input--%>
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" type="password" placeholder=" 密码" id="userPassword" name="userPassword"
                           maxlength="8"/>
                    <%--该div为[错误消息提示框]--%>
                    <div class="none">
                        <span></span>
                    </div>
                </div>
                <div class="form-group" id="line_repassword">
                    <i class="fa fa-check fa-lg"></i>
                    <input class="form-control required" type="password" placeholder="确认密码" id="rpassword"
                           name="rpassword"/>
                    <div class="none">
                        <span></span>
                    </div>
                </div>
                <div class="form-group" id="line_email">
                    <i class="fa fa-envelope fa-lg"></i>
                    <input class="form-control eamil" type="text" placeholder="邮   箱" id="email" name="email"/>
                    <div class="none">
                        <span></span>
                    </div>
                </div>
                <div class="form-group" id="line_phone">
                    <i class="fa fa-envelope fa-lg"></i>
                    <input class="form-control mobie" type="text" placeholder="电   话" id="phone" name="phone"/>
                    <div class="none">
                        <span></span>
                    </div>
                </div>
                <div class="form-group">
                    <input type="submit" style="width:337px" id="login-button" class="btn btn-success pull-right" value="注 册"/>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-success pull-right" value="前往登陆" onclick="toLogin();"/>
                    <input type="submit" class="btn btn-info pull-left" id="back_btn" value="返回首页" onclick="toIndex();"/>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    // 转到登陆页面
    function toLogin() {
        window.location="login";
    }
    // 转到首页
    function toIndex(){
        window.location="index";
    }

    function lineState(name, state, msg) {
        //通过选择到[错误消息提示框]来自定义错误内容
        if (state == "none") {
            //置空
            $("#line_" + name + " div").attr("class", "none");
            return;
        }
        if (state == "correct") {
            //正确
            $("#line_" + name + " div").attr("class", "correct");
            return;
        }
        //默认使用错误提示
        $("#line_" + name + " span").text(msg);
        $("#line_" + name + " div").attr("class", "error");
    }

    // 验证用户名
    $("#userName").blur(function () {
    //  字母开头，允许5-16字节，允许字母数字下划线
        var regexName=/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;
        var name=$("#userName").val();
        if(regexName.test(name)){
            lineState("userName","correct","")
        }else{
            lineState("userName","error","用户名格式错误!");
        }
    });

    // 验证密码
    $("#userPassword").blur(function () {
        // 由6-21字母和数字组成
        var regexPwd=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,21}$/;
        var pwd=$("#userPassword").val();
        if(!regexPwd.test(pwd)){
            lineState("userPassword","error","由6-21字母和数字组成");
        }else{
            lineState("userPassword","correct","");
        }
    });

//    验证两次密码
    $("#")
</script>
</body>
</html>

