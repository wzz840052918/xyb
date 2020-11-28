<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>后台管理系统</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/jsps/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/jsps/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/jsps/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath}/jsps/vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- bootstrap-progressbar -->
    <link href="${pageContext.request.contextPath}/jsps/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
          rel="stylesheet">
    <!-- JQVMap -->
    <link href="${pageContext.request.contextPath}/jsps/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="${pageContext.request.contextPath}/jsps/vendors/bootstrap-daterangepicker/daterangepicker.css"
          rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/jsps/build/css/custom.min.css" rel="stylesheet">


</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>校园帮</span></a>
                </div>

                <div class="clearfix"></div>

                <!-- menu profile quick info -->
                <div class="profile clearfix">
                    <div class="profile_pic">
                        <img src="${pageContext.request.contextPath}/jsps/images/img.jpg" alt="..."
                             class="img-circle profile_img">
                    </div>
                    <div class="profile_info">
                        <span>Welcome,</span>
                        <h2>John Doe</h2>
                    </div>
                </div>
                <!-- /menu profile quick info -->

                <br>

                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section active">
                        <h3>General</h3>
                        <ul class="nav side-menu" style="">
                            <li class="active"><a><i class="fa fa-home"></i> 用户管理 <span
                                    class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu" style="display: block;">
                                    <li><a href="${pageContext.request.contextPath}/jsps/admin/adduser.jsp">添加用户</a>
                                    </li>
                                    <li class="current-page"><a href="#">修改用户</a></li>
                                </ul>
                            </li>
                            <li><a><i class="fa fa-bar-chart-o"></i> 委托管理 <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="${pageContext.request.contextPath}/getAllEntrusting">待审核委托</a></li>
                                    <li><a href="${pageContext.request.contextPath}/getAllEntrusted">已审核委托</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- top navigation -->
        <div class="top_nav">
            <div class="nav_menu">
                <div class="nav toggle">
                    <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                </div>
                <nav class="nav navbar-nav">
                    <ul class=" navbar-right">
                        <li class="nav-item dropdown open" style="padding-left: 15px;">
                            <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true"
                               id="navbarDropdown"
                               data-toggle="dropdown" aria-expanded="false">
                                <img src="${pageContext.request.contextPath}/jsps/images/img.jpg" alt="">John Doe
                            </a>
                            <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="javascript:;"> Profile</a>
                                <a class="dropdown-item" href="javascript:;">
                                    <span class="badge bg-red pull-right">50%</span>
                                    <span>Settings</span>
                                </a>
                                <a class="dropdown-item" href="javascript:;">Help</a>
                                <a class="dropdown-item" href="login.jsp"><i class="fa fa-sign-out pull-right"></i> Log
                                    Out</a>
                            </div>
                        </li>

                        <li role="presentation" class="nav-item dropdown open">
                            <a href="javascript:;" class="dropdown-toggle info-number" id="navbarDropdown1"
                               data-toggle="dropdown"
                               aria-expanded="false">
                                <i class="fa fa-envelope-o"></i>
                                <span class="badge bg-green">6</span>
                            </a>
                            <ul class="dropdown-menu list-unstyled msg_list" role="menu"
                                aria-labelledby="navbarDropdown1">
                                <li class="nav-item">
                                    <a class="dropdown-item">
                                        <span class="image"><img
                                                src="${pageContext.request.contextPath}/jsps/images/img.jpg"
                                                alt="Profile Image"/></span>
                                        <span>
													<span>John Smith</span>
													<span class="time">3 mins ago</span>
												</span>
                                        <span class="message">
													Film festivals used to be do-or-die moments for movie makers. They were where...
												</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="dropdown-item">
                                        <span class="image"><img
                                                src="${pageContext.request.contextPath}/jsps/images/img.jpg"
                                                alt="Profile Image"/></span>
                                        <span>
													<span>John Smith</span>
													<span class="time">3 mins ago</span>
												</span>
                                        <span class="message">
													Film festivals used to be do-or-die moments for movie makers. They were where...
												</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="dropdown-item">
                                        <span class="image"><img
                                                src="${pageContext.request.contextPath}/jsps/images/img.jpg"
                                                alt="Profile Image"/></span>
                                        <span>
													<span>John Smith</span>
													<span class="time">3 mins ago</span>
												</span>
                                        <span class="message">
													Film festivals used to be do-or-die moments for movie makers. They were where...
												</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="dropdown-item">
                                        <span class="image"><img
                                                src="${pageContext.request.contextPath}/jsps/images/img.jpg"
                                                alt="Profile Image"/></span>
                                        <span>
													<span>John Smith</span>
													<span class="time">3 mins ago</span>
												</span>
                                        <span class="message">
													Film festivals used to be do-or-die moments for movie makers. They were where...
												</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <div class="text-center">
                                        <a class="dropdown-item">
                                            <strong>See All Alerts</strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>


    </div>

    <div class="right_col" role="main">
        <div class="">
            <div class="page-title">
                <div class="title_left">
                    <h3>用户修改
                        <small>edit user</small>
                    </h3>
                </div>

                <div class="title_right">
                    <div class="col-md-5 col-sm-5   form-group pull-right top_search">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for...">
                            <span class="input-group-btn">
										<button class="btn btn-default" type="button">Go!</button>
									</span>
                        </div>
                    </div>
                </div>
            </div>


            <div class="clearfix"></div>

            <div class="col-md-12 col-sm-12  ">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>修改用户
                            <small>edit user</small>
                        </h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="#">Settings 1</a>
                                    <a class="dropdown-item" href="#">Settings 2</a>
                                </div>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>

                    <div class="x_content">


                        <div class="table-responsive">
                            <table class="table table-striped jambo_table bulk_action">
                                <thead>
                                <tr class="headings">
                                    <th class="column-title">学号</th>
                                    <th class="column-title">昵称</th>
                                    <th class="column-title">用户名</th>
                                    <th class="column-title">密码</th>
                                    <th class="column-title">星级评价</th>
                                    <th class="column-title no-link last"><span class="nobr">操作</span></th>
                                    <th class="bulk-actions" colspan="7">
                                        <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span
                                                class="action-cnt"> </span> )
                                            <i class="fa fa-chevron-down"></i></a>
                                        <button type="button" class="btn btn-round btn-success">批量删除</button>
                                    </th>

                                </tr>
                                </thead>
                                <c:set var="index" value="0" scope="page"/>
                                <tbody>
                                <c:forEach items="${userList}" var="user">
                                    <c:choose>
                                        <c:when test="${index == 0}">
                                            <tr class="even pointer">
                                                <td class=" ">${user.uid}</td>
                                                <td class=" ">${user.nickname} </td>
                                                <td class=" ">${user.username} <i
                                                        class="success fa fa-long-arrow-up"></i></td>
                                                <td class=" ">${user.password}</td>
                                                <td class=" ">${user.allgrade}</td>
                                                <td class=" last"><a
                                                        href="${pageContext.request.contextPath}/edituserInformation?uid=${user.uid}">修改</a>&nbsp;|&nbsp;
                                                    <a href="${pageContext.request.contextPath}/deleteUserInformation?uid=${user.uid}">删除</a>
                                                </td>
                                            </tr>
                                            <c:set var="index" value="1" scope="page"/>
                                        </c:when>
                                        <c:otherwise>
                                            <tr class="odd pointer">
                                                <td class=" ">${user.uid}</td>
                                                <td class=" ">${user.nickname} </td>
                                                <td class=" ">${user.username} <i
                                                        class="success fa fa-long-arrow-up"></i></td>
                                                <td class=" ">${user.password}</td>
                                                <td class=" ">${user.allgrade}</td>
                                                <td class=" last"><a
                                                        href="${pageContext.request.contextPath}/edituserInformation?uid=${user.uid}">修改</a>&nbsp;|&nbsp;
                                                    <a href="${pageContext.request.contextPath}/deleteUserInformation?uid=${user.uid}">删除</a>
                                                </td>
                                            </tr>
                                            <c:set var="index" value="0" scope="page"/>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>


                                </tbody>
                            </table>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->
</div>
</body>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/jsps/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/jsps/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/jsps/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="${pageContext.request.contextPath}/jsps/vendors/nprogress/nprogress.js"></script>
<!-- Chart.js -->
<script src="${pageContext.request.contextPath}/jsps/vendors/Chart.js/dist/Chart.min.js"></script>
<!-- gauge.js -->
<script src="${pageContext.request.contextPath}/jsps/vendors/gauge.js/dist/gauge.min.js"></script>
<!-- bootstrap-progressbar -->
<script src="${pageContext.request.contextPath}/jsps/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath}/jsps/vendors/iCheck/icheck.min.js"></script>
<!-- Skycons -->
<script src="${pageContext.request.contextPath}/jsps/vendors/skycons/skycons.js"></script>
<!-- Flot -->
<script src="${pageContext.request.contextPath}/jsps/vendors/Flot/jquery.flot.js"></script>
<script src="${pageContext.request.contextPath}/jsps/vendors/Flot/jquery.flot.pie.js"></script>
<script src="${pageContext.request.contextPath}/jsps/vendors/Flot/jquery.flot.time.js"></script>
<script src="${pageContext.request.contextPath}/jsps/vendors/Flot/jquery.flot.stack.js"></script>
<script src="${pageContext.request.contextPath}/jsps/vendors/Flot/jquery.flot.resize.js"></script>
<!-- Flot plugins -->
<script src="${pageContext.request.contextPath}/jsps/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
<script src="${pageContext.request.contextPath}/jsps/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
<script src="${pageContext.request.contextPath}/jsps/vendors/flot.curvedlines/curvedLines.js"></script>
<!-- DateJS -->
<script src="${pageContext.request.contextPath}/jsps/vendors/DateJS/build/date.js"></script>
<!-- JQVMap -->
<script src="${pageContext.request.contextPath}/jsps/vendors/jqvmap/dist/jquery.vmap.js"></script>
<script src="${pageContext.request.contextPath}/jsps/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script src="${pageContext.request.contextPath}/jsps/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="${pageContext.request.contextPath}/jsps/vendors/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/jsps/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

<!-- Custom Theme Scripts -->
<script src="${pageContext.request.contextPath}/jsps/build/js/custom.min.js"></script>
</html>
