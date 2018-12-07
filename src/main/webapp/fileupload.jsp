<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>首页</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div>
    <%--// var form=document.createElement("form");--%>
    <%--// form.setAttribute("action", "../upload.do?id=" + projectthreeid[number]);--%>
    <%--// form.setAttribute("method", "post");--%>
    <%--// form.setAttribute("enctype", "multipart/form-data");--%>
    <%--// var forminput=document.createElement("input");--%>
    <%--// forminput.setAttribute("type", "file");--%>
    <%--// forminput.setAttribute("name", "uploadfile");--%>
    <%--// var button=document.createElement("button");--%>
    <%--// button.setAttribute("type", "submit");--%>
    <%--// button.innerHTML="上传";--%>
    <%--// form.appendChild(forminput);--%>
    <%--// form.appendChild(button);--%>
    <div>id:${threeid}</div>
    <div>三级评审名:${threename}</div>
    <form action="${pageContext.request.contextPath}/upload.do?id=${threeid}&projectid=${projectid}&userid=${userid}" method="post" enctype="multipart/form-data">
        <input type="file" name="uploadfile">
        <button type="submit">上传</button>
    </form>
</div>

</body>
</html>
