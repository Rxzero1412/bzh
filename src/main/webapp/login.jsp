<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!-- 引入JQuery  bootstrap.js-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style type="text/css">
        body{
            background: url("${pageContext.request.contextPath}/images/a.jpg")repeat;
        }
        #login-box {
            /*border:1px solid #F00;*/
            padding: 35px;
            border-radius:15px;
            background: #56666B;
            color: #fff;
        }

    </style>
</head>
<body>
<div class="container" id="top" style="margin-left: 10%;margin-right: 10%">
    <div class="row" style="margin-top: 280px; ">
        <div class="col-md-4"></div>
        <div class="col-md-4" id="login-box">
            <%--<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/user/submit.do" id="from1" method="post">--%>
            <form class="form-horizontal" role="form" id="from1">
                <div class="form-group">
                    <label for="firstname" class="col-sm-3 control-label">用户id</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="username" placeholder="请输入名字" name="username">
                    </div>
                </div>
                <div class="form-group">
                    <label for="lastname" class="col-sm-3 control-label">密码</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="password" placeholder="请输入密码" name="password">
                    </div>
                </div>

                <div class="form-group pull-right" style="margin-right: 15px;">
                    <div class="col-sm-offset-2 col-sm-10">
                        <%--<button type="submit" class="btn btn-default btn-info">登录</button>--%>
                        <button type="submit" class="btn btn-default btn-info" onclick="login()" style="margin-top: 10px">登录</button>
                    </div>

                </div>
                <div class="error"><c:if test="${errorMsg!=null }"><font color="red">${errorMsg}</font></c:if></div>
            </form>
        </div>
        <div class="col-md-4"></div>
    </div>
</div>
<script>
    function login() {
        var username = $("#username").val();
        var password = $("#password").val();
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/login.do",
            dataType: 'json',
            data: {
                "username":username,
                "password":password
            },
            success: function(msg){
                if(msg.result == 1){
                    //window.location.href="OL_layui.jsp";
                }/*else{
                    alert(msg.errorMsg);
                }*/
            }
        });

    }
</script>
</body>
</html>
