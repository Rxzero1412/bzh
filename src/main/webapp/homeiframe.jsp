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
    <table class="table table-hover">
        <h4 style="margin-left: 10px">评审规则:</h4>
        <thead>
        <tr>
            <th>id</th>
            <th>评审标准名</th>
            <th>评审总分</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${projectlist}" var="g">
            <tr class="active">
                <td><c:out value="${g.projectid}" /></td>
                <td><c:out value="${g.projectname}" /></td>
                <td><c:out value="${g.projectf}" /></td>
                <td>
                    <c:choose>
                        <c:when test="${userid==0}">
                            <a href="${pageContext.request.contextPath}/admindetails.do?projectid=${g.projectid}">详情</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/showaddnext.do?userid=${userid}&projectid=${g.projectid}">详情</a>
                        </c:otherwise>
                    </c:choose>

                    <a href="${pageContext.request.contextPath}/addproject.do?userid=${userid}&projectid=${g.projectid}">修改</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
