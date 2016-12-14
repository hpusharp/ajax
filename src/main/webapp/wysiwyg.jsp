<%--
  Created by IntelliJ IDEA.
  User: shibo
  Date: 2016/12/12
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/static/js/simditor/styles/simditor.css">
</head>
<body>
<div class="container">
    <form action="/send" method="post">
        <textarea name="message" id="editor" placeholder="请输入内容" autofocus></textarea>
        <button class="btn btn-primary">发布</button>
    </form>
</div>

<script type="application/javascript" src="/static/js/simditor/scripts/jquery.min.js"></script>
<script type="application/javascript" src="/static/js/simditor/scripts/module.js"></script>
<script type="application/javascript" src="/static/js/simditor/scripts/hotkeys.js"></script>
<script type="application/javascript" src="/static/js/simditor/scripts/uploader.js"></script>
<script type="application/javascript" src="/static/js/simditor/scripts/simditor.js"></script>
<script>
    $(function () {
        var editor = new Simditor({
            textarea:$("#editor"),
            toolbar:true,
            placeholder:"请输入文字",
            upload:{
                url:"http://up-z1.qiniu.com/",
                fileKey:"file",
                params:{"token":"${token}"},
                leaveConfirm:"文件正在上传，确定要离开此页吗？"
            }

        });

    });
</script>
</body>
</html>
