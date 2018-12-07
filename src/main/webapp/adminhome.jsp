<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
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
    <script>
        var url;
        var addprojecturl;
        $("#addproject").click(function(){
            addproject();

        });
        $("#adminhome").click(function(){
            adminhome();
        });
        function addproject() {
            var myDate = new Date();
            document.getElementById("adminhome").className="";
            document.getElementById("addproject").className="first";
            var urls=addprojecturl+"&projectid="+myDate.getTime();
            document.getElementById("iframe").src=urls;
        }
        function adminhome() {
            document.getElementById("adminhome").className="first";
            document.getElementById("addproject").className="";
            document.getElementById("iframe").src=url;
        }
        function init() {
            addprojecturl="../addproject.do?userid="+${userid};
            url="../homeiframe.do?userid="+${userid};
            document.getElementById("iframe").src=url;

        }
    </script>
    <style type="text/css">
    /*设置整体*/	*{
        padding: 0;
        margin: 0;
        font-family: "微软雅黑";
    }	/*设置header的div区*/
    .header{
        height: 50px ;
        background: #458fce ;
    }	/*设置logo的div区*/
    .header .logo{
        color: #fff ;
        font-size: 20px ;
        font-weight:500 ;
        line-height: 72px ;
        margin-left: 20px ;
        display:inline-block ;
        float: left ;/*左浮动*/
    }
    /*设置li标签里*/
    .header ul li{
        float: left ;
        color: #fff ;
        display: inline-block ;
        width: 10% ;
        height: 50px ;
        text-align: center ;
        line-height:72px ;
        cursor: pointer ;/*光标显示成小手型*/
    }
    /*细节调整*/
    ul li{
        list-style: none ;/*li的小圆点去掉*/
    }
    .header ul li.first{
        margin-left: 30px ;
        /*设置“首页”与“原创文字”间距*/
        background:#74b0e2 ;/*“首页”设置默认背景*/
    }		/*设置a链接标签*/
    a{
        color: #fff ;
        text-decoration: none ;
    }	/*设置导航添加hover事件*/
    .header ul li:hover{
        background:#74b0e2 ;
    }	/*设置登录、注册按钮*/
    .header .login{
        float: right ;
        color: #fff ;
        line-height: 72px ;
        margin-right: 20px ;
    }</style>
</head>
<body onload="init()">
<div class="header">
    <div class='logo'>标准化管理系统</div>
    <ul>
        <li id="adminhome" class="first"><a href="javascript:adminhome(0)">首页</a></li>
        <li id="addproject">
            <a href="javascript:addproject()">添加评审规则</a>
        </li>
        <li id="help">
            <a href="javascript:void(0)">帮助</a>
        </li>
    </ul>
    <div class="login">
        <span><a href="javascript:void(0)">${username}</a></span>
        <span>|</span>
        <span><a href="javascript:void(0)">退出</a></span>
    </div>
</div>
<iframe id="iframe" width="100%" height="100%" scrolling="no" />


</body>
</html>
