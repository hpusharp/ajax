<%--
  Created by IntelliJ IDEA.
  User: shibo
  Date: 2016/12/8
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<button id="btn">load JSON</button>
<script src="/static/js/jquery-1.11.3.min.js"></script>
<script>
    $(function() {
        $("#btn").click(function() {
            $.getJSON("/data.json").done(function (json) {
                for(var i =0;i<json.length;i++) {
                    var user = json[i];
                    alert(user.username +"->" +user.address);
                }
            }).error(function () {
                alert("服务器异常");
            });
        });
       /* $("#btn").click(function () {
            $.get("/data.json").done(function (data) {
                for(var i =0;i<data.length;i++) {
                    var user = data[i];
                    alert(user.username + "->"+user.address );

                }
            }).error(function () {
                alert("服务器异常");
            });
        });*/
    

    });
</script>
</body>
</html>
