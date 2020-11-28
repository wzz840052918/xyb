<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>发布</title>

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
                <li><a href="#">发布委托 <span class="sr-only">(current)</span></a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/login1.pass"><span
                        class="glyphicon glyphicon-user"></span></a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!-- 发布委托界面 -->
<div class="container">
    <form class="form-horizontal" id="form1" action="${pageContext.request.contextPath}/publish.do" method="post">
        <div class="form-group">
            <label for="title" class="col-sm-2 control-label">标题</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="title" placeholder="Title" name="title" value="">
            </div>
        </div>
        <div class="form-group">
            <label for="content" class="col-sm-2 control-label">委托内容</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="content" placeholder="Content" name="content" value="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">委托等级</label>
            <div class="col-sm-10">
                <select name="level" id="level">
                    <option value="0" selected="selected">简单</option>
                    <option value="1">中等</option>
                    <option value="2">困难</option>
                </select>
            </div>
            <!-- 对选择的 等级 和价格之间进行关联 -->
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">委托悬赏</label>
            <div class="col-sm-10">
                <input type="text" name="price" id="price" value="" placeholder="Price"/>
                <span style="color: red;">简单悬赏约1-2元，中等悬赏约2-5元，困难悬赏约5元及以上</span>&nbsp;&nbsp;<span
                    style="color: gray;font-size: 0.75rem;">（价位不匹配，审核不会通过）</span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default" onclick="publish()">发布</button>
            </div>
        </div>
        <label class="form-group" style="color: red;">${msg}</label>
    </form>
</div>

<!-- 底部导航条 -->
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
                    href="${pageContext.request.contextPath}/login.pass"><i class="glyphicon glyphicon-plus"
                                                                            style="font-size: 2rem;"></i>
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
    function publish() {
        var title = document.getElementById('title').value
        var content = document.getElementById('content').value
        var rank = document.getElementById('rank').value
        var price = document.getElementById('price').value
        console.log(title, content, rank, price)
        if (title == null) {
            alert('标题不能为空！')
        }
        if (content == null) {
            alert('内容不能为空！')
        }
        if (price == null) {
            alert('悬赏不能为空！')
        }
        if (rank == 0 && price < 0 && price > 1) {
            alert('价位不匹配！')
        }

        document.getElementById('form1').submit();
    }
</script>
</body>
</html>