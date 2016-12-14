<%--
  Created by IntelliJ IDEA.
  User: shibo
  Date: 2016/12/8
  Time: 17:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/4.0.0-alpha.5/css/bootstrap-flex.min.css">
    <link href="//cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/animate.css/3.5.2/animate.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <form id="loginForm" class="animated bounce">
        <div class="form-group">
            <label > 账号</label>
            <input type="text" class="form-control" name="username"id="username">
        </div>
        <div class="form-group">
            <label > 密码</label>
            <input type="password" class="form-control" name="password">
        </div>
        <button class="btn btn-primary" type="button" id="loginBtn">登录</button>
    </form>
</div>
<script src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/js/jquery.validate.min.js"></script>
<script>
    $(function () {
        $("#loginBtn").click(function () {
            $("#loginForm").submit();
        });

    $("#loginForm").validate({
        errorElement:"span",
        errorClass: "text-danger",
        rules:{
            username:{
                required:true
            },
            password:{
                required:true
            }
        },
        messages:{
            username:{
                required:"请输入账户"
            },
            password:{
                required:"请输入密码"
            }
        },
        submitHandler: function () {
            $.ajax({
                url:"/login",
                type:"post",
                data:$("#loginForm").serialize(),
                beforeSend:function () {
                    $("#loginBtn").append($("<i class='fa fa-spinner fa-spin'></i>")).attr("disabled","disabled");
                },
                complete:function () {
                    $("#loginBtn").html("登录").removeAttr("disabled");
                },
                success:function (data) {
                    if(data.state== "error") {
                        alert(data.message);
                    }if(data.state=="success") {
                        alert(data.message);
                    }
                },
                error:function () {
                    alert("服务器异常");
                }
                
            });
        }
    });

    });
</script>
</body>

</html>
