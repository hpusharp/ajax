
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form action="" id="" name="" method="post"enctype="application/x-www-form-urlencoded" type>sendRequest</form>
<input type="text" id="name">
<button id="btn">sendRquest</button>
<div id="result"></div>
<script>
    (function () {
        document.querySelector("#btn").onclick = function () {
          var name = document.querySelector("#name").value;
        };
    })();
</script>
</body>
</html>
