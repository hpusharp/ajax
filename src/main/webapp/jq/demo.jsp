<%--
  Created by IntelliJ IDEA.
  User: shibo
  Date: 2016/12/7
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<input type="text" id="username">
<span id="loading" style="display:none"><img src="/static/img/loading.gif" alt=""></span>

<span id="text"></span>
<script src="/static/js/jquery-1.11.3.min.js"></script>
<script>
   $(function () {
       $(document).ajaxSend(function () {
           $("#loading").show();
       });
       $(document).ajaxComplete(function() {
           $("#loading").hide();
       });


      $("#username").blur(function () {

          var name = $(this).val();
        //传入一个对象{}，里面有请求路径和访问方式 回调函数等一些方法
        $.ajax({
            url:"/ajax",
            type:"post",
            data:{"name":name,"age":23},
            success: function (data) {
              $("#text").text(data);
            },
            error: function () {
                alert("服务器异常");
            },
            timeout:15000,
            beforeSend:function () {
                //请求发送之前做的函数
                $("#loading").show();
                $("#text").text("");
            },
            complete:function () {
                //无论success 还是error 都会执行
                $("#loading").hide();
            }
        });
         /*   //另一种post方法
          $.post("/ajax",{"name":name,"age":23},function (data) {
              $("#text").text(data);
          });*/
         //链式调用，如果成功执行第一个done，如果失败执行第二个done
        /* $.post("/ajax",{"name":name,"age":23}).done(function (data) {
             $("#text").text(data);
         }).error(function () {
             alert("服务器错误");
         })*/
        $.get("/ajax",{"name":"ajax"},function (data) {
            alert(data);
        })

      });

   });
</script>
</body>
</html>
