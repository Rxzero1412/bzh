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

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        var number = 0;
        var projectid;

        var projecttwoid = new Array();
        function init() {
            // var myDate = new Date();
            // projectid=myDate.getTime();
            projectid=${projectid};
            var size=${size};
            var lists=${list};
            console.log(lists);
            for (var i=0;i<size;i++){
                addSelects(lists[i].projectid,lists[i].twoid,lists[i].twoname,lists[i].twof,lists[i].juanname);
                //projectid, twoid,twoname,twof,juanname
            }
        }
        //var projecttwoid[];
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
        function addSelects(projectid, twoid,twoname,twof,juanname) {
            //定义新增序号
            number++;
            projecttwoid[number]=twoid;
            var div = document.createElement("div");
            div.setAttribute("class", "panel panel-default");
            var div1 = document.createElement("div");
            div1.setAttribute("class", "panel-heading");
            div1.setAttribute("id", "select" + number);
            var div2 = document.createElement("div");
            div2.setAttribute("class", "panel-collapse collapse");
            div2.setAttribute("id", "collapse"+number);
            div2.setAttribute("style", "width:100%;height:300px");
            var iframe = document.createElement("iframe");
            iframe.setAttribute("src", "${pageContext.request.contextPath}/addprojectthree.do?projecttwoid="+projecttwoid[number]);
            iframe.setAttribute("style", "width:100%;height:300px");
            iframe.setAttribute("scrolling", "auto");
            var div1_1 = document.createElement("div");
            div1_1.setAttribute("class", "col-lg-6 input-group");
            var input = document.createElement("input");
            input.setAttribute("class", "form-control");
            input.setAttribute("type", "text");
            input.setAttribute("value", juanname);
            input.setAttribute("name","juanname")
            input.setAttribute("style", "width:50%");

            var input2 = document.createElement("input");
            input2.setAttribute("class", "form-control");
            input2.setAttribute("type", "text");
            input2.setAttribute("placeholder", "请输入二级评审名");
            input2.setAttribute("value",twoname);
            input2.setAttribute("name","twoname");
            input2.setAttribute("style", "width:50%");
            var button = document.createElement("input");
            button.setAttribute("class", "btn btn-default");
            button.setAttribute("type", "button");
            button.setAttribute("value", "添加三级评审项目");
            button.setAttribute("style", "margin-left:10px;width:130px;height:30px");
            button.setAttribute("data-toggle", "collapse");
            button.setAttribute("data-parent", "#accordion");
            button.setAttribute("href", "#collapse"+number);

            var span = document.createElement("span");
            span.setAttribute("class", "input-group-btn");
            span.setAttribute("style", "width:60px;height:30px");

            span.appendChild(button);

            div1_1.appendChild(input);
            div1_1.appendChild(input2);
            div1_1.appendChild(span);
            div1.appendChild(div1_1);
            div2.appendChild(iframe);
            div.appendChild(div1);
            div.appendChild(div2);
            var root = document.getElementById("root");
            insertAfter(div, root);
            return false;

        }

        function addSelect(form, afterElement) {
            //定义新增序号
            number++;
            var myDate = new Date();
            projecttwoid[number]=myDate.getTime();
            var div = document.createElement("div");
            div.setAttribute("class", "panel panel-default");
            var div1 = document.createElement("div");
            div1.setAttribute("class", "panel-heading");
            div1.setAttribute("id", "select" + number);
            var div2 = document.createElement("div");
            div2.setAttribute("class", "panel-collapse collapse");
            div2.setAttribute("id", "collapse"+number);
            div2.setAttribute("style", "width:100%;height:300px");
            var iframe = document.createElement("iframe");
            iframe.setAttribute("src", "${pageContext.request.contextPath}/addprojectthree.do?projecttwoid="+projecttwoid[number]);
            iframe.setAttribute("style", "width:100%;height:300px");
            iframe.setAttribute("scrolling", "auto");
            var div1_1 = document.createElement("div");
            div1_1.setAttribute("class", "col-lg-6 input-group");
            var input = document.createElement("input");
            input.setAttribute("class", "form-control");
            input.setAttribute("type", "text");
            input.setAttribute("placeholder", "请输入卷名");
            input.setAttribute("name","juanname")
            input.setAttribute("style", "width:50%");

            var input2 = document.createElement("input");
            input2.setAttribute("class", "form-control");
            input2.setAttribute("type", "text");
            input2.setAttribute("placeholder", "请输入二级评审名");
            input2.setAttribute("name","twoname");
            input2.setAttribute("style", "width:50%");
            var button = document.createElement("input");
            button.setAttribute("class", "btn btn-default");
            button.setAttribute("type", "button");
            button.setAttribute("value", "添加三级评审项目");
            button.setAttribute("style", "margin-left:10px;width:130px;height:30px");
            button.setAttribute("data-toggle", "collapse");
            button.setAttribute("data-parent", "#accordion");
            button.setAttribute("href", "#collapse"+number);

            var span = document.createElement("span");
            span.setAttribute("class", "input-group-btn");
            span.setAttribute("style", "width:60px;height:30px");

            span.appendChild(button);

            div1_1.appendChild(input);
            div1_1.appendChild(input2);
            div1_1.appendChild(span);
            div1.appendChild(div1_1);
            div2.appendChild(iframe);
            div.appendChild(div1);
            div.appendChild(div2);
            var root = document.getElementById("root");
            insertAfter(div, root);
            return false;

        }

        function delSelect() {
            if (number > 0) { // If there's more than one text box
                // Remove the last one added
                var node = document.getElementById("select" + number).parentNode;
                projecttwoid[number]=0;
                node.parentNode.removeChild(node);
                number--;
            }
        }
        function projectonclicks() {
            if(number>0){
                var juannameinput =[];
                $("input[name='juanname']").each(function(){
                    juannameinput.push($(this).val());
                })
                var twonameinput =[];
                $("input[name='twoname']").each(function(){
                    twonameinput.push($(this).val());
                })
                var juannameinputs=juannameinput.toString();
                var twonameinputs=twonameinput.toString();
                var projecttwoidlist="";
                for (var i = number; i >0; i--) {
                    projecttwoidlist+=projecttwoid[i]+",";
                }
                var projectnamestr = document.getElementById(('projectname')).value;
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/addprojecttwodate.do",
                    dataType: 'json',
                    data: {
                        "projectname":projectnamestr,
                        "projecttwoid":projecttwoidlist,
                        "projectid":projectid,
                        "juanname":juannameinputs,
                        "twoname":twonameinputs,
                        "userid":${userid}
                    },
                    success: function(msg){
                        console.log("success");
                        window.location.replace("../homeiframe.do?userid="+${userid});
                    },
                    error: function(msg){
                        console.log("error");
                        window.location.replace("../homeiframe.do?userid="+${userid});
                    }
                });
            }else {
            }
        }
    </script>

</head>
<body onload="init()">
<div style="margin-left: 10px;margin-top: 10px">

        <div class="form-group">
            <label for="projectname" class="col-sm-2 control-label">标准名</label>
            <div class="col-sm-10">
                <input type="text" value="${projectname}" class="form-control" id="projectname" style="width: 50%;margin-right: 50%">
            </div>
        </div>
        <div class="input-group">
            <button type="button" style='font-size: 16px;'
                    class="btn btn-default" id="addAchievebtn"
                    onclick="addSelect(this.form,this.parentNode);">添加卷</button>
            <button type="button" style="font-size: 16px;margin-left: 10px"
                    class="btn btn-default" id="delAchievebtn" onclick="delSelect();">删除卷</button>
        </div>
        <br>
        <div id="root"></div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default" style="margin-top: 10px" onclick="projectonclicks();">保存</button>
            </div>
        </div>

</div>
</body>
</html>