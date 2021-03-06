<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<div style="margin-top: 10px;margin-left: 10px">
    <table width="500" height="296" border="1">
        <tr>
            <td>id</td>
            <td>三级评审名</td>
            <td>分值</td>
            <td>评审要素</td>
        </tr>
        <c:forEach items="${list}" var="t">
            <tr>
                <td><c:out value="${t.threeid}" /></td>
                <td><c:out value="${t.threename}" /></td>
                <td><c:out value="${t.threef}" /></td>
                <td><c:out value="${t.input2}" /></td>
            </tr>
        </c:forEach>

    </table>
</div>
</body>
</html>