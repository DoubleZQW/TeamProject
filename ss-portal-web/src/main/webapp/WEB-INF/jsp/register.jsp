<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>用户</title>
    <!--用百度的静态资源库的cdn安装bootstrap环境-->
    <!-- Bootstrap 核心 CSS 文件 -->
    <link href="resources/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <!--font-awesome 核心我CSS 文件-->
    <link href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
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

        /*#register_form {*/
            /*display: none;*/
        /*}*/

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

		.input {
			position: relative;
		}
        .error, .correct {
            height: 20px;
            width: 20px;
            position: absolute;
            top: 25px;
            right: 9px;
            background: url("js/ICON_20.svg") no-repeat 0 -20px;
        }

        .error span {
            display: block;
            position: absolute;
            top: 20px;
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

		.line_input_icon {
			top: 26px;
			left: 8px;
			color: #2aabd2;
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
					<div class="input">
						<%--<i class="fa fa-user fa-lg"></i>--%>
						<i class="glyphicon glyphicon-user line_input_icon"></i>
						<input class="form-control" type="text" placeholder="用户名" id="userName" name="userName"
							   autofocus="autofocus" maxlength="20" onblur="vali_userName();" onkeyup="vali_userName();"/>
						<div class="none">
							<span></span>
						</div>
					</div>
                </div>

                <div class="form-group" id="line_userPassword">
					<div class="input">
						<%--表单组件图标i和文本框input--%>
						<%--<i class="fa fa-lock fa-lg"></i>--%>
						<i class="glyphicon glyphicon-lock line_input_icon"></i>
						<input class="form-control required" type="password" placeholder="密   码" id="userPassword"
							   name="userPassword" maxlength="21" onblur="vali_password();" onkeyup="vali_password();"/>
						<%--该div为[错误消息提示框]--%>
						<div class="none">
							<span></span>
						</div>
					</div>
                </div>

                <div class="form-group" id="line_repassword">
					<div class="input">
						<%--<i class="fa fa-check fa-lg"></i>--%>
						<i class="glyphicon glyphicon-check line_input_icon"></i>
						<input class="form-control required" type="password" placeholder="确认密码" id="repassword"
							   name="repassword" maxlength="21" onblur="vali_repassword();"/>
						<div class="none">
							<span></span>
						</div>
                    </div>
                </div>

                <div class="form-group" id="line_email">
					<div class="input">
						<%--<i class="fa fa-envelope fa-lg"></i>--%>
						<i class="glyphicon glyphicon-envelope line_input_icon"></i>
						<input class="form-control email" type="text" placeholder="邮   箱" id="email" name="email"
							onblur="vali_email();"/>
						<div class="none">
							<span></span>
						</div>
                    </div>
                </div>

                <div class="form-group" id="line_phone">
					<div class="input">
						<%--<i class="fa fa-envelope fa-lg"></i>--%>
						<i class="glyphicon glyphicon-phone line_input_icon"></i>
						<input class="form-control mobie" type="text" placeholder="电   话" id="phone" name="phone"
							onblur="vali_phone();" onkeyup="vali_phone();"/>
						<div class="none">
							<span></span>
						</div>
                    </div>
                </div>

                <div class="form-group">
                    <input type="button" style="width:337px" id="reg-btn" class="btn btn-success pull-right"
						   disabled="disabled" value="注 册"/>
                </div>

                <div class="form-group">
                    <input type="button" class="btn btn-success pull-right" value="前往登陆" onclick="toLogin();"/>
                    <input type="button" class="btn btn-info pull-left" id="back_btn" value="返回首页" onclick="toIndex();"/>
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
        window.location="/TeamProject";
    }

    //定义验证结果集
    var flags = [false, false, false, false, false];

    function lineState(name, state, msg) {
        //通过选择到[错误消息提示框]来自定义错误内容
	    var $errorMsgBox = $("#line_" + name + " .input div");

	    if (state === 'error') {
		    //默认使用错误提示
			setFlags(name, state);
		    $errorMsgBox.attr("class", "error").find('span').text(msg);
	    }
	    if (state === "none") {
            //置空
		    setFlags(name, state);
            $errorMsgBox.attr("class", "none");
            return;
        }
        if (state === "correct") {
	        //正确
			setFlags(name, state);
	        $errorMsgBox.attr("class", "correct");
        }
        //console.log(flags);
        //console.log(vail_flags());
        if (vail_flags())
        	$('#reg-btn').removeAttrs('disabled');
	    else
	        $('#reg-btn').attr('disabled', 'disabled');

    }

    //设置每一个输入框的验证值
    function setFlags(name, state) {
    	switch (name) {
			case ('userName'):
				if (state === 'correct')
					flags[0] = true;
				else
					flags[0] = false;
				break;
			case ('userPassword'):
				if (state === 'correct')
					flags[1] = true;
				else
					flags[1] = false;
				break;
			case ('repassword'):
				if (state === 'correct')
					flags[2] = true;
				else
					flags[2] = false;
				break;
			case ('email'):
				if (state === 'correct')
					flags[3] = true;
				else
					flags[3] = false;
				break;
			case ('phone'):
				if (state === 'correct')
					flags[4] = true;
				else
					flags[4] = false;
				break;
		}
	}

	//从验证结果集中得到最终结果
	function vail_flags() {
    	if (flags[0] && flags[1] && flags[2] && flags[3] && flags[4])
    		return true;
    	else
    		return false;
	}

    // 验证用户名
	function vali_userName() {
		//  字母开头，允许5-16字节，允许字母数字下划线
		var regexName=/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;
		var name=$("#userName").val();
		if(regexName.test(name)){
            lineState("userName","correct","");
            $.ajax({
				url:"user/checkName",
				data:{"userName":name},
				type:"get",
				success:function (data) {
					if(data=="true"){
                        lineState("userName","correct","");
					}else{
                        lineState("userName","error","用户名已存在!");
					}
                }
			});
		}

		else
			lineState("userName","error","用户名格式错误!");
	}

    // 验证密码
	function vali_password() {
		// 由6-21字母和数字组成
		var regexPwd=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,21}$/;
		var pwd=$("#userPassword").val();
		if(!regexPwd.test(pwd))
			lineState("userPassword","error","由6-21字母和数字组成");
		else
			lineState("userPassword","correct","");
	}

	//密码的二次验证
	function vali_repassword() {
    	var pwd = $('#userPassword').val();
    	var repwd = $('#repassword').val();
    	if (pwd != repwd)
    		lineState('repassword','error','密码不一致');
    	else
    		lineState('repassword','correct','');
	}

	//邮箱的验证
	function vali_email() {
    	var regexEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    	var email = $('#email').val();
		if (! regexEmail.test(email))
			lineState('email','error','邮箱格式有误!');
		else
			lineState('email','correct','');
	}

	//手机号的验证
	function vali_phone() {
    	var regexPhone = /^1[34578]\d{9}$/;
    	var phone = $('#phone').val();
    	if (! regexPhone.test(phone))
    		lineState('phone','error','手机号格式有误!')
		else
			lineState('phone','correct','');
	}
	
//	注册按钮事件
	$("#reg-btn").click(function () {
	    $.ajax({
			url:"user/add",
			data:
				{
				    "userName": $('#userName').val(),
					'userPassword': $('#userPassword').val(),
					'userEmail': $('#email').val(),
					'userPhone': $('#phone').val()
			},
			method: 'post',
			success: function(data) {
			    if (data === 'true') {
                    alert('注册成功！');
                    window.location = "login";
                }
			    else
			        alert('注册失败！');
			}
		})
	});

</script>
</body>
</html>

