<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <%-- 引入JQ和Bootstrap --%>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/style.css" rel="stylesheet">
    <title>学生管理页面 - 首页</title>

    <script>
        $(function () {
            $("ul.pagination li.disabled a").click(function () {
                return false;
            });

            $("#addForm").submit(function () {
                var studentId = $("#studentID").val();
                if (!checkEmpty("studentID", "学号"))
                    return false;
                if (!checkEmpty("name", "姓名"))
                    return false;
                if (!checkEmpty("age", "年龄"))
                    return false;
                if (!checkEmpty("birthday","生日"))
                    return false;
                if (isExists(studentId)){
                    alert("该学号对应的学生已存在");
                    return false;
                }
                return true;
            })
        });

        function del() {
            var msg = "您真的确定要删除吗？\n\n请确认！";
            if (confirm(msg) == true) {
                return true;
            } else {
                return false;
            }
        }

        function checkEmpty(id, name) {
            var value = $("#" + id).val();
            if (value.length == 0) {
                alert(name + "不能为空");
                $("#" + id).focus();
                return false;
            }
            return true;
        }
        function isExists(studentId) {
            var studentIdArr=[];
            var tbody = document.getElementById("table-body");
            for(var i=0;i<tbody.childNodes.length;i++){
                if(tbody.childNodes[i].nodeType==1){
                    studentIdArr.push(tbody.childNodes[i].childNodes[1].innerHTML);
                }
            }
            if(studentIdArr.indexOf(studentId.toString())>-1){
                return true;
            }else{
                return false;
            }

        }
    </script>
</head>

<body>

<div class="listDIV">
    <table class="table table-striped table-bordered table-hover table-condensed">
        <caption>学生列表</caption>
        <%--共${page.total}人--%>
        <thead>
        <tr class="success">
            <th>学号</th>
            <th>姓名</th>
            <th>年龄</th>
            <th>性别</th>
            <th>出生日期</th>

            <th>编辑</th>
            <th>删除</th>
        </tr>
        </thead>

        <tbody id="table-body">
        <c:forEach items="${students}" var="s" varStatus="status">
            <tr>
                <td>${s.studentID}</td>
                <td>${s.name}</td>
                <td>${s.age}</td>
                <td>${s.sex}</td>
                <td>${s.birthday}</td>

                <td><a href="/StudentManager/editStudent?id=${s.id}"><span class="glyphicon glyphicon-edit"></span> </a></td>
                <td><a href="/StudentManager/deleteStudent?id=${s.id}" onclick="javascript:return del();"><span
                        class="glyphicon glyphicon-trash"></span> </a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>

<%--<nav class="pageDIV">--%>
    <%--<ul class="pagination">--%>
        <%--<li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>--%>
            <%--<a href="?page.start=0">--%>
                <%--<span>«</span>--%>
            <%--</a>--%>
        <%--</li>--%>

        <%--<li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>--%>
            <%--<a href="?page.start=${page.start-page.count}">--%>
                <%--<span>‹</span>--%>
            <%--</a>--%>
        <%--</li>--%>

        <%--<c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">--%>

            <%--<c:if test="${status.count*page.count-page.start<=30 && status.count*page.count-page.start>=-10}">--%>
                <%--<li <c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>--%>
                    <%--<a--%>
                            <%--href="?page.start=${status.index*page.count}"--%>
                            <%--<c:if test="${status.index*page.count==page.start}">class="current"</c:if>--%>
                    <%-->${status.count}</a>--%>
                <%--</li>--%>
            <%--</c:if>--%>
        <%--</c:forEach>--%>

        <%--<li <c:if test="${!page.hasNext}">class="disabled"</c:if>>--%>
            <%--<a href="?page.start=${page.start+page.count}">--%>
                <%--<span>›</span>--%>
            <%--</a>--%>
        <%--</li>--%>
        <%--<li <c:if test="${!page.hasNext}">class="disabled"</c:if>>--%>
            <%--<a href="?page.start=${page.last}">--%>
                <%--<span>»</span>--%>
            <%--</a>--%>
        <%--</li>--%>
    <%--</ul>--%>
<%--</nav>--%>

<div class="addDIV">

    <div class="panel panel-success">
        <div class="panel-heading">
            <div class="panel-title">增加学生</div>
        </div>
        <div class="panel-body">

            <form method="post" id="addForm" action="/StudentManager/addStudent" role="form">
                <table class="addTable">
                    <tr>
                        <td>学号：</td>
                        <td><input type="text" name="studentID" id="studentID" placeholder=""></td>
                    </tr>
                    <tr>
                        <td>姓名：</td>
                        <td><input type="text" name="name" id="name" placeholder=""></td>
                    </tr>
                    <tr>
                        <td>年龄：</td>
                        <td><input type="text" name="age" id="age" placeholder=""></td>
                    </tr>
                    <tr>
                        <td>性别：</td>
                        <td><input type="radio" checked class="radio radio-inline" name="radio" value="男"> 男
                            <input type="radio" class="radio radio-inline" name="radio" value="女"> 女
                        </td>
                    </tr>
                    <tr>
                        <td>出生日期：</td>
                        <td><input type="date" name="birthday" id="birthday" placeholder=""></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>

                    </tr>

                </table>
            </form>
        </div>
    </div>

</div>


</body>
</html>
