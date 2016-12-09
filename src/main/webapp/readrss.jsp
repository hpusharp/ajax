<%--
  Created by IntelliJ IDEA.
  User: shibo
  Date: 2016/12/8
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<input type="text"id="input">
<button id="btn">read rss</button>
<script>
    (function () {
       document.querySelector("#btn").onclick = function () {
           var xmlHttp = new XMLHttpRequest();
           xmlHttp.open("get","/rss.xml");
           xmlHttp.send();
       }


    })();
</script>
</body>
</html>
