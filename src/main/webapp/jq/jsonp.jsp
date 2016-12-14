<%--
  Created by IntelliJ IDEA.
  User: shibo
  Date: 2016/12/10
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<button id="btn">jsonp</button>
<script src="/static/js/jquery-1.11.3.min.js"></script>
<script>
    $(function () {
        $("#btn").click(function () {
            $.getJSON("/jsonp?method=?").done(function (data) {
               for(var i =0;i<data.length;i++) {
                   alert(data.username + "->" + data.address);
               }
            }).error(function () {
                alert("服务器异常");
            });
        });
        
        
    });
</script>

</body>
</html>
