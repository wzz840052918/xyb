<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>我的</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">

    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/getAllEntrust">校园帮</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="#">我的 <span class="sr-only">(current)</span></a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/login1.pass"><span
                        class="glyphicon glyphicon-user"></span></a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-1"></div>

        <c:if test="${session_user!=null}">
            <div class="col-lg-1"><img src="${pageContext.request.contextPath}/${session_user.photo}" alt="用户头像"
                                       class="img-circle" width="40px" height="50px"/></div>
            <div class="col-lg-10"><p>${session_user.nickname}</p><span>${session_user.allgrade}</span></div>
        </c:if>
        <c:if test="${session_user==null}">
            <a href="${pageContext.request.contextPath}/jsps/user/login1.jsp"><p>点击这里登录</p></a>
        </c:if>

    </div>
    <hr>
    <div class="row">
        <div class="col-lg-9">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation"><a href="${pageContext.request.contextPath}/getPersonalEntrustById"><i
                        class="glyphicon glyphicon-list"></i>&nbsp;&nbsp;&nbsp;未完成委托<i
                        class="glyphicon glyphicon-chevron-right" style="float: right;"></i></a></li>
                <hr>
                <li role="presentation"><a href="${pageContext.request.contextPath}/getPersonalEntrustById"><i
                        class="glyphicon glyphicon-list"></i>&nbsp;&nbsp;&nbsp;已完成委托<i
                        class="glyphicon glyphicon-chevron-right" style="float: right;"></i></a></li>
                <hr>
                <li role="presentation"><a href="${pageContext.request.contextPath}/getPersonalEntrustByUid"><i
                        class="glyphicon glyphicon-list"></i>&nbsp;&nbsp;&nbsp;已发布委托<i
                        class="glyphicon glyphicon-chevron-right" style="float: right;"></i></a></li>
                <hr>
            </ul>
        </div>
    </div>
    <!-- 空盒子 -->
    <div style="height: 2rem;background-color: gray;"></div>
    <div style="height: 2rem;background-color: white;" class="row">
        <div class="col-lg-9">
            <hr>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-9">
            <ul class="nav nav-pills nav-stacked">
                <c:if test="${session_user!=null}">
                    <li role="presentation"><a href="${pageContext.request.contextPath}/jsps/user/editPassword.jsp"><i
                            class="glyphicon glyphicon-wrench"></i>&nbsp;&nbsp;&nbsp;修改密码<i
                            class="glyphicon glyphicon-chevron-right" style="float: right;"></i></a></li>
                    <hr>
                </c:if>
                <li role="presentation"><a href="${pageContext.request.contextPath}/logout.do"><i
                        class="glyphicon glyphicon-new-window"></i>&nbsp;&nbsp;&nbsp;退出<i
                        class="glyphicon glyphicon-chevron-right" style="float: right;"></i></a></li>
                <hr>
            </ul>
        </div>
    </div>
</div>

<!-- 底部导航条 -->
<nav class="navbar navbar-default navbar-fixed-bottom">
    <div class="container-fluid">
        <div class="row">
            <!-- 悬赏 -->
            <div class="col-lg-4" style="text-align: center;margin-top: 0.625rem;padding: 0;"><a
                    href="${pageContext.request.contextPath}/getAllEntrust" style="color: #000000;"><i
                    class="glyphicon glyphicon-globe" style="font-size: 2rem;"></i>
                <p>悬赏</p></a></div>
            <!-- 发布 -->
            <div class="col-lg-4" style="text-align: center;margin-top: 0.625rem;padding: 0;"><a
                    href="${pageContext.request.contextPath}/login.pass" style="color: #000000;"><i
                    class="glyphicon glyphicon-plus" style="font-size: 2rem;"></i>
                <p>发布</p></a></div>
            <!-- 我的 -->
            <div class="col-lg-4" style="text-align: center;margin-top: 0.625rem;padding: 0;"><a
                    href="${pageContext.request.contextPath}/login1.pass"><i class="glyphicon glyphicon-user"
                                                                             style="font-size: 2rem;"></i>
                <p>我的</p></a></div>
        </div>

    </div>
</nav>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="../../js/jquery-3.5.1.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>

</body>
</html>