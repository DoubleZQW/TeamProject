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
            font-size: 16px;
        }

        .form {
            background: rgba(255, 255, 255, 0.2);
            width: 400px;
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
            left: 6px;
            position: relative;
            color: #ccc;
        }

        input[type="text"], input[type="password"] {
            padding-left: 30px;
        }
    </style>
</head>
<body>


<div class="container">
    <div class="form row">
        <div class="form-horizontal col-sm-offset-3 col-md-offset-3" id="login_form">
            <h3 style="margin-top: 20px;">登陆页面</h3>
            <br>
            <div class="col-sm-9 col-md-9">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" type="text" placeholder=" 用户名" id="userName" name="userName"
                           autofocus="autofocus" maxlength="20"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" type="password" placeholder=" 密码" id="userPassword" name="userPassword"
                           maxlength="8"/>
                </div>
                <br>
                <div class="form-group">
                    <input type="submit" style="width: 225px" id="login-button" class="btn btn-success pull-right" value=" 登陆 "/>
                </div>

                <div class="form-group">
                    <a href="register" style="margin-left:10px" class="">免费注册</a>
                    <a href="/TeamProject" style="margin-left: 70px" class="">返回首页</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/validate.js"></script>
<script type="text/javascript">
    $('#login-button').click(function(){
        $.ajax({
            url: 'user/login',
            method: 'post',
            data: {
                userName: $('#userName').val(),
                userPassword: $('#userPassword').val(),
            },
            success: function(data) {
                if (data == "4") {
                    window.location.href="/TeamProject";
                } else {
                    alert('用户名或密码错误!');
                    window.location.href="login";
                }
            }
        });
    });


</script>
</body>
</html>

