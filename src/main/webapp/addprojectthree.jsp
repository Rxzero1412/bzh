<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%
           String path = request.getContextPath();
           String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + path + "/";
     %>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>首页</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body onload="init()">
<div style="margin-top: 10px;margin-left: 10px">
        <div class="input-group">
            <button type="button" style='font-size: 16px;'
                    class="btn btn-default" id="addAchievebtn"
                    onclick="addSelect(this.form,this.parentNode);">添加三级评审项目</button>
            <button type="button" style="font-size: 16px;margin-left: 10px"
                    class="btn btn-default" id="delAchievebtn" onclick="delSelect();">删除</button>
        </div>
        <br>
        <div id="root"></div>
        <script type="text/javascript">
            var number = 0;
            var projecttwo;
            var projectthreeid = new Array();
            function init() {
                var size=${size};
                projecttwo=${projecttwoid};
                var lists=${list};
                console.log(lists);
                for (var i=0;i<size;i++){
                    addSelects(lists[i].threename,lists[i].threef,lists[i].input2,lists[i].threeid);
                    console.log(lists[i].threename+lists[i].threef+lists[i].input2+lists[i].threeid);
                    //input, inputf,input2,threeid
                }
            }
            function insertAfter(newElement, targetElement) {
                var parent = targetElement.parentNode;
                if (parent.lastChild == targetElement) {
                    // 如果最后的节点是目标元素，则直接添加。因为默认是最后
                    parent.appendChild(newElement);
                } else {
                    parent.insertBefore(newElement, targetElement.nextSibling);
                    //如果不是，则插入在目标元素的下一个兄弟节点 的前面。也就是目标元素的后面。
                }
            }
            function addSelect(form, afterElement) {
                //定义新增序号
                number++;
                console.log(number);
                var myDate = new Date();
                projectthreeid[number]=myDate.getTime();
                var div = document.createElement("div");
                div.setAttribute("class", "panel panel-default");
                var div1 = document.createElement("div");
                div1.setAttribute("class", "panel-heading");
                div1.setAttribute("id", "select" + number);
                var div1_1 = document.createElement("div");
                div1_1.setAttribute("class", "col-lg-6 input-group");
                var input = document.createElement("input");
                input.setAttribute("class", "form-control");
                input.setAttribute("type", "text");
                input.setAttribute("placeholder", "请输入三级评审名");
                input.setAttribute("style", "width:90%");
                input.setAttribute("name", "input");

                var inputf = document.createElement("input");
                inputf.setAttribute("class", "form-control");
                inputf.setAttribute("type", "text");
                inputf.setAttribute("placeholder", "请输入分值");
                inputf.setAttribute("style", "width:90%");
                inputf.setAttribute("name", "inputf");

                var input2 = document.createElement("textarea");
                input2.setAttribute("class", "form-control");
                input2.setAttribute("type", "text");
                input2.setAttribute("placeholder", "请输入评审要素");
                input2.setAttribute("style", "width:90%;height:100px;margin-top: 5px");
                input2.setAttribute("name", "input2");
                // var form=document.createElement("form");
                // form.setAttribute("action", "../upload.do?id=" + projectthreeid[number]);
                // form.setAttribute("method", "post");
                // form.setAttribute("enctype", "multipart/form-data");
                // var forminput=document.createElement("input");
                // forminput.setAttribute("type", "file");
                // forminput.setAttribute("name", "uploadfile");
                // var button=document.createElement("button");
                // button.setAttribute("type", "submit");
                // button.innerHTML="上传";
                // form.appendChild(forminput);
                // form.appendChild(button);
                div1_1.appendChild(input);
                div1_1.appendChild(inputf);
                div1_1.appendChild(input2);
            //    div1_1.appendChild(form);
                div1.appendChild(div1_1);
                div.appendChild(div1);
                var root = document.getElementById("root");
                insertAfter(div, root);
                return false;
            }

            function addSelects(inputd, inputfd,input2d,threeid) {
                //定义新增序号
                number++;
                projectthreeid[number]=threeid;
                console.log("addSelects:"+number);
                var div = document.createElement("div");
                div.setAttribute("class", "panel panel-default");
                var div1 = document.createElement("div");
                div1.setAttribute("class", "panel-heading");
                div1.setAttribute("id", "select" + number);
                var div1_1 = document.createElement("div");
                div1_1.setAttribute("class", "col-lg-6 input-group");
                var inputf = document.createElement("input");
                inputf.setAttribute("class", "form-control");
                inputf.setAttribute("type", "text");
                inputf.setAttribute("value", inputfd);
                console.log(inputfd);
                inputf.setAttribute("style", "width:90%");
                inputf.setAttribute("name", "inputf");
                var input = document.createElement("input");
                input.setAttribute("class", "form-control");
                input.setAttribute("type", "text");
                input.setAttribute("value", inputd);
                input.setAttribute("style", "width:90%");
                input.setAttribute("name", "input");

                var input2 = document.createElement("textarea");
                input2.setAttribute("class", "form-control");
                input2.setAttribute("type", "text");
                input2.setAttribute("name", "input2");
                input2.setAttribute("value", input2d);
                input2.innerHTML=input2d;
                input2.setAttribute("style", "width:90%;height:100px;margin-top: 5px");
                div1_1.appendChild(input);
                div1_1.appendChild(inputf);
                div1_1.appendChild(input2);
                div1.appendChild(div1_1);
                div.appendChild(div1);
                var root = document.getElementById("root");
                insertAfter(div, root);
                return false;
            }
            function delSelect() {
                if (number > 0) { // If there's more than one text box
                    var node = document.getElementById("select" + number).parentNode;
                    node.parentNode.removeChild(node);
                    number--;
                }
            }
            function onclicks() {
                // var listinput =$("input[name='input']");
                // var listinput2 =$("input[name='input2']");
                // var listinput=document.getElementsByName("input");
                // var listinput2=document.getElementsByName("input2");
                var listinput =[];
                $("input[name='input']").each(function(){
                    listinput.push($(this).val());
                })
                var listinputf =[];
                $("input[name='inputf']").each(function(){
                    listinputf.push($(this).val());
                })
                var listinput2 =[];
                $("textarea[name='input2']").each(function(){
                    listinput2.push($(this).val());
                })
                var listinputs=listinput.toString();
                var listinputfs=listinputf.toString();
                var listinput2s=listinput2.toString();
                var projectthreeidlist="";
                // var projectthreeid2=projectthreeid.reverse();
                for (var i = number; i >0; i--) {
                    projectthreeidlist+=projectthreeid[i]+",";
                }
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/addprojectthreedate.do",
                    dataType: 'text',
                    data: {
                        "listinput":listinputs,
                        "listinputf":listinputfs,
                        "listinput2":listinput2s,
                        "projectthreeidlist":projectthreeidlist,
                        "projecttwoid":${projecttwoid}
                    },
                    success: function(msg){
                        console.log("success");
                        //window.location.href="../../OL_layui.jsp";
                        window.location.replace("../projectthreeshow.do?twoid="+projecttwo);
                    }
                });

            }
        </script>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default" style="margin-top: 10px" onclick="onclicks();">保存</button>
            </div>
        </div>
</div>
</body>
</html>