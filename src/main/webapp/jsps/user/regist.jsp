<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>注册成新会员</title>

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
        body {
            background: url(${pageContext.request.contextPath}/img/regist.jpg) no-repeat;
            background-size: cover;
            font-size: 16px;
        }

        .form {
            background: rgba(255, 255, 255, 0.2);
            width: 400px;
            margin: 100px auto;
        }

        #register_form {
            display: block;
        }

        input[type="text"], input[type="password"] {
            padding-left: 26px;
        }

        .checkbox {
            padding-left: 21px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form row">

        <form class="form-horizontal" action="${pageContext.request.contextPath}/regist">
            <h3 style="text-align: center;">创建您的账户</h3>
            <br><br>
            <div class="form-group">
                <label for="inputEmail3" class="col-lg-3 control-label"><span style="color: red;">*</span>学号</label>
                <div class="col-lg-9">
                    <input type="text" class="form-control" name="uid" placeholder="id">
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-lg-3 control-label"><span style="color: red;">*</span>用户名</label>
                <div class="col-lg-9">
                    <input type="text" class="form-control" name="username" placeholder="Username">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-lg-3 control-label"><span style="color: red;">*</span>密码</label>
                <div class="col-lg-9">
                    <input type="password" class="form-control" name="password" placeholder="Password">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-lg-3 control-label">昵称</label>
                <div class="col-lg-9">
                    <input type="text" class="form-control" name="nickname" placeholder="Nickname">
                </div>
            </div>
            <br><br>
            <!-- 上传 -->
            <div class="form-group">
                <label for="exampleInputFile" class="col-lg-3 control-label"><span
                        style="color: red;">*</span>文件选择</label>
                <div class="col-lg-9">
                    <input type="file" id="exampleInputFile">
                    <p class="help-block">请上传jpg格式的校园卡照片</p>
                </div>
            </div>
            <!-- 提交 -->
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <button type="submit" class="btn btn-default" id="registBtn">注册</button>
                    <button type="reset" class="btn">重置</button>
                </div>
            </div>
            <div class="form-group">
                <p style="color: red">${msg}</p>
            </div>
        </form>
    </div>

</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>