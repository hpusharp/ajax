<%--
  Created by IntelliJ IDEA.
  User: shibo
  Date: 2016/12/10
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/animate.css/3.5.2/animate.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-5">
            <form id="loginForm" >
                <div class="form-group">
                    <div class=""></div>
                    <label >电子邮件</label>
                    <input type="text"name="mail"class="form-control"id="username">
                </div>
                <div class="form-group">
                    <label >密码</label>
                    <input type="password"name="password"class="form-control"id="password">
                </div>
                <div class="form-group">
                    <button type="button"class="btn btn-primary"id="loginBtn">登录</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/js/jquery.validate.min.js"></script>
<script>
    $(function () {
        //点击按钮，提交表单
        $("#loginBtn").click(function () {
            $("#loginForm").submit();
        });
        //表单验证
        $("#loginForm").validate({
            errorElement:"span",
            errorClass:"text-danger",
            rules:{
                mail:{
                    required:true,
                    email:true,
                    remote:"/checkemail"
                },

                password:{
                    required:true
                }
            },
            messages:{
                mail:{
                    required:"请输入邮箱账号",
                    email:"邮件格式错误",
                    remote:"邮件已被占用"
                },

                password:{
                    required:"请输入密码"
                }
            },
            submitHandler:function () {
                $.ajax({
                    url:"/login",
                    type:"post",
                    data:$("#loginForm").serialize(),
                    beforeSend:function(){
                      $("#loginBtn").append($("<i class='fa fa-spinner fa-spin'></i>")).attr("disabled","disabled");
                    },
                    complete:function() {
                        $("#loginBtn").html("登录").removeAttr("disabled");
                    },
                    success:function(data) {
                        if(data.state=="error" ) {
                            alert(data.message);
                        }else {
                            alert(data.message);
                        }
                    },
                    error:function() {
                        alert("服务器异常");
                    }
                });
            }
        });




    });
</script>
</body>
</html>
