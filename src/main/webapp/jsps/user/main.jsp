<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>校园帮内测中</title>
    <!-- Bootstrap -->
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">


    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <style>

        /*包含以下五种的链接*/
        a {
            text-decoration: none;
        }

        /*正常的未被访问过的链接*/
        a:link {
            text-decoration: none;
        }

        /*已经访问过的链接*/
        a:visited {
            text-decoration: none;
        }

        /*鼠标划过(停留)的链接*/
        a:hover {
            text-decoration: none;
        }

        /* 正在点击的链接，鼠标在元素上按下还没有松开*/
        a:active {
            text-decoration: none;
        }

        /* 获得焦点的时候 鼠标松开时显示的颜色*/
        a:focus {
            text-decoration: none;
        }

        /* 底部导航条高度50px */

    </style>
</head>
<body>
<!-- 导航条 -->
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
            <a class="navbar-brand" href="#">校园帮</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">关于我们 <span class="sr-only">(current)</span></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">联系我们 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">安阳师范学院</a></li>
                        <li><a href="#">&nbsp;软件学院</a></li>
                        <li><a href="#">其他</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">联系方式</a></li>
                        <li><a href="#">840052918@qq.com</a></li>
                    </ul>
                </li>
            </ul>
            <!--根据id查询 -->
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="查询个人信息">
                </div>
                <button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search"></i>&nbsp;查询
                </button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/login1.pass"><span
                        class="glyphicon glyphicon-user"></span></a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<!-- 轮播图 -->
<div class="container">
    <div id="myCarousel" class="carousel slide">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
        </ol>
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="${pageContext.request.contextPath}/img/3.jpg" alt="First slide">
            </div>
            <div class="item">
                <img src="${pageContext.request.contextPath}/img/2.jpg" alt="Second slide">
            </div>
        </div>
        <!-- 轮播（Carousel）导航 -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">上一个</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">下一个</span>
        </a>
    </div>
</div>
<!-- 广告 -->
<div class="row" style="border-top: #000000 solid 0.0625rem;border-bottom: #000000 solid 0.0625rem;">
    <span class="col-lg-12" style="color: blue;margin: 1rem;display: block;"><a href="" style="font-size: 2.0rem;">校园帮App正在火热内测中...</a></span>
</div>
<!-- 应用分类 -->
<div class="row" style="background-color: rgb(242,251,254);margin-top: 2rem;">
    <div class="col-lg-4" style="text-align: center;"><a href="${pageContext.request.contextPath}/getAllEntrust1"
                                                         rel="external" style="color: #000000;"><i
            class="glyphicon glyphicon-th-large" style="font-size: 40px;"></i>
        <p>悬赏列表</p></a></div>
    <div class="col-lg-4" style="text-align: center;"><a href="javascript:void(0)" onclick="diaoyong1()"
                                                         style="color: #000000;"><i class="glyphicon glyphicon-calendar"
                                                                                    style="font-size: 40px;"></i>
        <p>调查问卷</p></a></div>
    <div class="col-lg-4" style="text-align: center;"><a href="javascript:void(0);" onclick="diaoyong()"
                                                         style="color: #000000;"><i class="glyphicon glyphicon-check"
                                                                                    style="font-size: 40px;"></i>
        <p>每日打卡</p></a></div>
    <!-- 模态框 -->
    <!-- Small modal -->
    <button id="myModal" type="button" class="btn btn-primary hidden" data-toggle="modal"
            data-target=".bs-example-modal-sm">打卡
    </button>
    <div id="myModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
         aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <br>
                <p style="text-align: center;">签到成功！经验+3</p>
                <br>
            </div>
        </div>
    </div>

    <button id="myModal1" type="button" class="btn btn-primary hidden" data-toggle="modal"
            data-target=".bs-example-modal-lg">问卷
    </button>
    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <br>
                <p style="text-align: center;">暂时还未拥有任何调查问卷</p>
                <br>
            </div>
        </div>
    </div>
</div>
<!-- 提示 -->
<div class="row" style="display: block;">
    <div class="col-lg-12">
        <a href="${pageContext.request.contextPath}/getAllEntrust1" style="float: right;">更多&gt;</a>
        <p style="float: left;">推荐悬赏</p>
    </div>
</div>
<!-- 悬赏列表 -->

<!-- c:foreach   5-6个-->
<c:forEach items="${entrustList}" var="entrust">
    <c:if test="${entrust.state == 0 and entrust.uid != session_user.uid}">
        <div class="row" style="margin-bottom: 1.25rem;">
            <a href="${pageContext.request.contextPath}/entrustInformation?enid=${entrust.enid}" id="item">
                <div class="col-lg-1"><img src="${pageContext.request.contextPath}/${entrust.photo}" alt="用户头像"
                                           class="img-circle" width="40px" height="50px"/>
                    <p style="display: inline">${entrust.nickname}</p></div>
                <div class="col-lg-10"><p style="color: #000000;">${entrust.title}</p>
                    <p style="color: #000000;">${entrust.content}</p></div>
                <div class="col-lg-1" style="text-align: right;"><p
                        style="color: rgb(255,152,132);margin: 1rem;">${entrust.price}元</p></div>
            </a>
            <hr>
        </div>
    </c:if>
</c:forEach>

<br><br><br>
<!-- 底部导航条 -->
<nav class="navbar navbar-default navbar-fixed-bottom">
    <div class="container-fluid">
        <div class="row">
            <!-- 悬赏 -->
            <div class="col-lg-4" style="text-align: center;margin-top: 0.625rem;padding: 0;"><a href="#"><i
                    class="glyphicon glyphicon-globe" style="font-size: 2rem;"></i>
                <p>悬赏</p></a></div>
            <!-- 发布 -->
            <div class="col-lg-4" style="text-align: center;margin-top: 0.625rem;padding: 0;"><a
                    href="${pageContext.request.contextPath}/login.pass" style="color: #000000;"><i
                    class="glyphicon glyphicon-plus" style="font-size: 2rem;"></i>
                <p>发布</p></a></div>
            <!-- 我的 -->
            <div class="col-lg-4" style="text-align: center;margin-top: 0.625rem;padding: 0;"><a
                    href="${pageContext.request.contextPath}/login1.pass" style="color: #000000;"><i
                    class="glyphicon glyphicon-user" style="font-size: 2rem;"></i>
                <p>我的</p></a></div>
        </div>

    </div>
</nav>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script>
    function diaoyong() {
        var a = document.getElementById('myModal');
        a.click()
    }

    function diaoyong1() {
        var a = document.getElementById('myModal1');
        a.click()
    }
</script>
</body>
</html>