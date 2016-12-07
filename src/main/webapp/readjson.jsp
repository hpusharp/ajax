<%--
  Created by IntelliJ IDEA.
  User: shibo
  Date: 2016/12/7
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<button id="btn">load json</button>
<script>
    (function () {
        document.querySelector("#btn").onclick = function () {
          var xmlHttp = new XMLHttpRequest();
            xmlHttp.open("get","/data.json");
            //配置回调函数
            xmlHttp.onreadystatechange = function () {
              if(xmlHttp.readyState == 4) {

                  if(xmlHttp.status ==200) {
                      //拿到json的值 为字符串
                    var result = xmlHttp.responseText;
                      //把字符串转换为json
                      alert(result);
                      var json = JSON.parse(result);//注意此处的JSON全大写，是jsp内置对象
                      alert(json.length);


                      for(var i=0;i<json.length;i++) {
                          var user = json[i];
                          alert(user.username + user.id + user.address)



                      }

                  }else {
                      alert("服务器错误"+ xmlHttp.status)
                  }
              }else {

              }

            };
            xmlHttp.send();
        };



    })();
</script>
</body>
</html>
