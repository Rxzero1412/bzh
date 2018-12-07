<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>首页</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

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
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="g">
            <tr class="active">
                <td><c:out value="${g.id}" /></td>
                <td><c:out value="${g.juanname}" /></td>
                <td><c:out value="${g.twoname}" /></td>
                <td><c:out value="${g.threename}" /></td>
                <td>
                    <c:choose>
                        <c:when test="${g.filename != null&&g.filename!=''}">
                            <a href="${pageContext.request.contextPath}/showpmb.do?threeid=${g.id}">
                                查看文件
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/fileupload.do?threeid=${g.id}&projectid=${projectid}&userid=${userid}">
                                上传文件
                            </a>
                        </c:otherwise>
                    </c:choose>

                    <a href="${pageContext.request.contextPath}/showpsys.do?threeid=${g.id}">
                        评审要求
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</form>
</div>
</body>
</html>