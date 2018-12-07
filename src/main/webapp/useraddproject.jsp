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
</head>
<body>
<div>
    <div class="form-group">
        <label for="projectname" class="col-sm-3 control-label">评审项目名</label>
        <div class="col-sm-9">
            <input type="text" class="form-control" id="projectname" placeholder="请输入评审项目名" name="projectname">
        </div>
    </div>
    <div class="form-group">
        <div class="col-lg-6">
            <div class="input-group">
                <input type="text" id="projects" class="form-control" placeholder="请输入项目类别">
                <div class="input-group-btn">
                    <button type="button" class="btn btn-default
                        dropdown-toggle" data-toggle="dropdown">请选择
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu pull-right">
                        <c:forEach items="${list}" var="g">
                            <li>
                                <a href="#" onclick="onclickchoose('${g.projectname}')"><c:out value="${g.projectname}"/></a>
                            </li>
                        </c:forEach>
                    </ul>
                </div><!-- /btn-group -->
            </div><!-- /input-group -->
        </div><!-- /.col-lg-6 -->
    </div>

    <div class="form-group pull-right" style="margin-right: 15px;">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default btn-info" onclick="update()" style="margin-top: 10px">下一步</button>
        </div>

    </div>

</div>
<script type="text/javascript">
    function onclickchoose(projectname) {
        $("#projects").val(projectname);
        console.log(projectname);
    }

    function update() {
        var projectname = $("#projectname").val();
        var projects = $("#projects").val();
        var userid = ${userid};
        var projectid=${projectid};
        console.log(projectname);
        console.log(projects);
        console.log(userid);
        console.log(projectid);
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/addnext.do",
            dataType: 'json',
            data: {
                "projectid":projectid,
                "userid":userid,
                "projectname":projectname,
                "projects":projects
            },
            success: function(msg){
                console.log("success");
                window.location.replace("${pageContext.request.contextPath}/showaddnext.do?projectid="+${projectid}+"&userid="+${userid});
            },
            error: function(msg){
                console.log("error");
                window.location.replace("${pageContext.request.contextPath}/showaddnext.do?projectid=${projectid}&userid=${userid}");
            }
        });
    }
</script>
</body>
</html>