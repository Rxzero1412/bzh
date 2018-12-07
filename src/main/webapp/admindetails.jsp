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
        <thead>
        <tr>
            <th>id</th>
            <th>卷名</th>
            <th>二级评审名</th>
            <th>三级评审名</th>
            <th>评审分值</th>
            <th>评审要素</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${palllist}" var="g">
            <tr class="active">
                <td><c:out value="${g.id}" /></td>
                <td><c:out value="${g.juanname}" /></td>
                <td><c:out value="${g.twoname}" /></td>
                <td><c:out value="${g.threename}" /></td>
                <td><c:out value="${g.threef}" /></td>
                <td>
                    <c:choose>
                        <c:when test="${g.input2 != null&&g.input2!=''}">
                            <a href="${pageContext.request.contextPath}/showpsys.do?threeid=${g.id}">
                                <c:out value="${g.input2}" />
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/fileupload.do?threeid=${g.id}&projectid=${projectid}">
                                上传模板
                            </a>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
