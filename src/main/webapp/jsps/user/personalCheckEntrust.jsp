<%@ page import="com.zhuoying.User.Bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>委托页面</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->

    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">

    </style>
</head>
<body>
<!-- 导航条 -->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1"
                    aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/getAllEntrust">校园帮</a>
        </div>


        <ul class="nav navbar-nav navbar-right">
            <li><a href="${pageContext.request.contextPath}/login1.pass"><span class="glyphicon glyphicon-user"></span></a>
            </li>
        </ul>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container-fluid">
    <div>
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">已发布委托</a>
            </li>
            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">待审核委托</a>
            </li>
        </ul>
        <%
            User session_user = (User) session.getAttribute("session_user");
            System.out.println(session_user.getUid());

        %>
        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="home">
                <div class="container-fluid">
                    <!-- c:foreach   5-6个-->
                    <c:forEach items="${entrustList}" var="entrust">
                        <div class="row" style="margin-top: 2rem;">
                            <a href="${pageContext.request.contextPath}/entrustInformation?enid=${entrust.enid}">
                                <div class="col-lg-1"><img src="${pageContext.request.contextPath}/${entrust.photo}"
                                                           alt="用户头像" class="img-circle" width="40px" height="50px"/>
                                    <p style="display: inline">${entrust.nickname}</p>
                                </div>
                                <div class="col-lg-10">
                                    <p style="color: #000000;">${entrust.title}</p>
                                    <p style="color: #000000;">${entrust.content}</p>
                                </div>
                                <div class="col-lg-1" style="text-align: right;">
                                        <%--填写状态 0是发布没人接 红色，1是有人接未完成橙色，2是已完成绿色--%>
                                    <c:if test="${entrust.state == 0}">
                                        <p style="color: red;margin: 1rem;">未接取</p>
                                    </c:if>
                                    <c:if test="${entrust.state == 1}">
                                        <p style="color: rgb(255,152,132);margin: 1rem;">未完成</p>
                                    </c:if>
                                    <c:if test="${entrust.state == 2}">
                                        <p style="color: greenyellow;margin: 1rem;">已完成</p>
                                    </c:if>

                                </div>
                            </a>
                        </div>
                        <hr>
                    </c:forEach>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="profile">
                <div class="container-fluid">
                    <!-- c:foreach   5-6个-->
                    <c:forEach items="${checkEntrustList}" var="entrust">

                        <div class="row" style="margin-top: 2rem;">
                            <a href="${pageContext.request.contextPath}/entrustCheckInformation?enid=${entrust.enid}">
                                <div class="col-lg-1"><img src="${pageContext.request.contextPath}/${entrust.photo}"
                                                           alt="用户头像" class="img-circle" width="40px" height="50px"/>
                                    <p style="display: inline">${entrust.nickname}</p>
                                </div>
                                <div class="col-lg-10">
                                    <p style="color: #000000;">${entrust.title}</p>
                                    <p style="color: #000000;">${entrust.content}</p>
                                </div>
                                <div class="col-lg-1" style="text-align: right;">
                                    <p style="color: rgb(255,152,132);margin: 1rem;">酬金${entrust.price}元</p>
                                </div>
                            </a>
                        </div>
                        <hr>
                    </c:forEach>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script>
    $('#myTabs a').click(function (e) {
        e.preventDefault()
        $(this).tab('show')
        $.ajax({
            type: "GET",
            url: "",
            dataType: "json",
            data: '',
            success: function (t) {
                if (t.code) {
                    alert(t.data)
                } else {
                    alert('没有数据')
                }
            }
        })
    })
</script>
</body>
</html>
