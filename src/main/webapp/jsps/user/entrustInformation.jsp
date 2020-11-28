<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>委托详细信息</title>

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
<!-- 导航栏 -->
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
                <li><a href="#">委托详情 <span class="sr-only">(current)</span></a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/login1.pass"><span
                        class="glyphicon glyphicon-user"></span></a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!-- 内容 -->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-10"><h1>${entrustInformation.title}</h1></div>
        <div class="col-lg-2" style="text-align: right;"><h3 style="color: rgb(255,152,132);margin: 1rem;">
            悬赏${entrustInformation.price}元</h3></div>
    </div>
    <hr>
    <div class="row">
        <h4>${entrustInformation.content}</h4>
    </div>
    <div class="row" style="height: 2.5rem;background-color: rgb(249, 249, 249)"></div>
    <!-- 用户头像,昵称 -->
    <div class="row">
        <ul>
            <li>
                <div class="col-lg-1"></div>
                <div class="col-lg-11">
                    <div>
                        <img src="${pageContext.request.contextPath}/${entrustInformation.photo}" class="img-circle"
                             style="height: 50px;width: 50px"/>
                    </div>
                    <div>
                        <p>${entrustInformation.nickname}</p>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <!-- 委托内容 -->
    <hr>
    <article>
        <!-- 文字描述 -->
        <p>${entrustInformation.content}</p>
        <hr>
        <hr>

    </article>
    <!-- 底部报名条 -->
    <%-- 以 已接取委托 进入页面：不显示下方的 footer  判断条件为：enturst.eid = session_user.uid
          以 已发布委托 进入页面(发布者的身份),显示下方为 完成委托（完结） 判断条件为：entrust.uid = session_user.uid
          以 待审核委托 进入页面（发布者的身份），下方什么都不显示 判断条件为： state==0，因为不通过审核就不会有人接取
     --%>
    <%--如果 接取人不是登录者，且发布人不是登录者，正常显示--%>
    <c:if test="${entrustInformation.eid != session_user.uid and entrustInformation.uid != session_user.uid}">
        <footer class="navbar-fixed-bottom">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row no-gap text-align-center text-fon16">
                            <input type="submit" id="btn-signup" onclick="beginSubmit()" value="立即报名"
                                   class="col bg-color-blue text-color-white"
                                   style="height:42px;width: 100%;background-color: dodgerblue;text-decoration-color: white;">
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </c:if>
    <%--完成委托--%>
    <c:if test="${entrustInformation.uid == session_user.uid and entrustInformation.state ==1}">
        <footer class="navbar-fixed-bottom">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row no-gap text-align-center text-fon16">
                            <input type="submit" id="btn-signup" onclick="wanjie()" value="完成委托"
                                   class="col bg-color-blue text-color-white"
                                   style="height:42px;width: 100%;background-color: dodgerblue;text-decoration-color: white;">
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </c:if>
    <%--删除委托--%>
    <c:if test="${entrustInformation.uid == session_user.uid and entrustInformation.state ==0}">
        <footer class="navbar-fixed-bottom">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row no-gap text-align-center text-fon16">
                            <input type="submit" id="btn-signup" onclick="deleteThis()" value="删除委托"
                                   class="col bg-color-blue text-color-white"
                                   style="height:42px;width: 100%;background-color: dodgerblue;text-decoration-color: white;">
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </c:if>


    <%--接取委托模态框--%>
    <!-- 按钮触发模态框 -->
    <button class="btn btn-primary btn-lg hidden" id="modalButton" data-toggle="modal" data-target="#myModal">开始演示模态框
    </button>
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">恭喜</h4>
                </div>
                <div class="modal-body">您已抢下，请迅速完成任务</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="tiaozhuan1()">关闭
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <%--完成委托模态框--%>
    <!-- 按钮触发模态框 -->
    <button class="btn btn-primary btn-lg hidden" id="modalButton1" data-toggle="modal" data-target="#myModal1">
        开始演示模态框
    </button>
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">信息</h4>
                </div>
                <div class="modal-body">委托已完成</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="tiaozhuan()">关闭</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <%--删除委托模态框--%>
    <!-- 按钮触发模态框 -->
    <button class="btn btn-primary btn-lg hidden" id="modalButton2" data-toggle="modal" data-target="#myModal1">
        开始演示模态框
    </button>
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">信息</h4>
                </div>
                <div class="modal-body">委托已删除</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="tiaozhuan()">关闭</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script type="text/javascript">
    function beginSubmit() {
        $.ajax({
            url: '${pageContext.request.contextPath}/getEntrust.do',
            type: 'POST',
            data: {enid:${entrustInformation.enid}},
            success: function (data) {
                var a = document.getElementById('modalButton')
                a.click()
            }
        })
    }

    //完结委托
    function wanjie() {
        $.ajax({
            url: '${pageContext.request.contextPath}/finishEntrust.do',
            type: 'POST',
            data: {enid:${entrustInformation.enid}},
            success: function (data) {
                var a = document.getElementById('modalButton1')
                a.click()
            }
        })
    }

    //删除委托
    function deleteThis() {
        $.ajax({
            url: '${pageContext.request.contextPath}/deleteEntrust.do',
            type: 'POST',
            data: {enid:${entrustInformation.enid}},
            success: function (data) {
                var b = document.getElementById("modalButton2")
                b.click()
            }
        })
    }

    //关闭模态框之后跳转页面
    function tiaozhuan() {
        window.location.href = "${pageContext.request.contextPath}/getPersonalEntrustByUid"
    }

    function tiaozhuan1() {
        window.location.href = "${pageContext.request.contextPath}/getPersonalEntrustById"
    }
</script>
</body>
</html>