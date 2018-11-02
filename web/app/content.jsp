<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>北京化工大学教务管理系统</title>
    <link rel="icon" href="http://jwglxt.buct.edu.cn/jwglxt/logo/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="http://jwglxt.buct.edu.cn/jwglxt/logo/favicon.ico" type="image/x-icon">
    <style type="text/css">
        .active{font-weight: bolder;}
        #navbar-tabs li{ margin-top: 2px;}
        #navbar-tabs li a{ border-top: 2px solid transparent;}
        #navbar-tabs li.active a{border-top: 2px solid #0770cd;}
    </style>
    <!--jQuery核心框架库 -->
    <script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/error.css">
    <link rel="stylesheet" type="text/css" href="../css/zftal-ui.css">
    <script type="text/javascript" src="../js/bootstrap.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/jquery.extends.contact-min.js" charset="utf-8"></script>
</head>
<body class="body-container">
<!-- top -->
<c:if test="${!empty userinfo}">
<div class="navbar navbar-default navbar-static-top top1">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand logo_2">
                <img src="../images/logo_jw_w.png" style="margin-top:-3px">
                <span id="xtmc">北京化工大学教务管理系统</span>
            </a>
        </div>
        <ul class="nav navbar-nav navbar-right  hidden-xs">
            <li class="">
                <a class="dropdown-toggle grxx" data-toggle="dropdown" aria-expanded="false">
                    <span style="color:white;font-size:20px;">欢迎您，${userinfo.sname}</span>
                </a>
                <ul class="dropdown-menu">
                    <li class="divider"></li>
                    <li>
                        <a href="${pageContext.request.contextPath}/LogoutServlet" id="exit">
                            <i class="top_png tc"></i>退出
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- 菜单  -->
<div class="navbar_index">
    <div class="container" id="myDiv1">
        <nav id="cdNav" class="navbar-collapse bs-navbar-collapse collapse" role="navigation" aria-expanded="false">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a id="drop1" href="" role="button" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">信息维护
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="drop1">
                        <li>
                            <a tabindex="-1">专业方向确认
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a id="drop1" href="" role="button" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">选课
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="drop1">
                        <li>
                            <a tabindex="-1">自主选课</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a id="drop1" href="" role="button" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">信息查询
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="drop1">
                        <li>
                            <a tabindex="-1" target="_blank">教学执行计划查看</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- 主体 -->
<div class="container padding-150">
    <div class="row">
        <div class="col-md-3 col-sm-4">
            <div class="index_wdyy">
                <h3><span>我的应用</span><a href="" class="sz" id="wdyy_szbtn"></a></h3>
                <ul class="list-unstyled mCustomScrollbar _mCS_1 mCS_no_scrollbar" id="index_wdyy" style="height: 350px;">
                    <li class="col-md-4 col-sm-4 col-xs-6">
                        <a  title="学籍异动申请">
                            <img src="../images/ico_but83.png" alt="学籍异动申请">
                            <h5>学籍异动申请</h5>
                        </a>
                    </li>
                    <li class="col-md-4 col-sm-4 col-xs-6">
                        <a title="辅修报名">
                            <img src="../images/ico_but28.png" alt="辅修报名">
                            <h5>辅修报名</h5>
                        </a>
                    </li>
                    <li class="col-md-4 col-sm-4 col-xs-6">
                        <a title="学生学业情况查询">
                            <img src="../images/ico_but30.png" alt="学生学业情况查询">
                            <h5>学生学业情况查询</h5>
                        </a>
                    </li>
                    <li class="col-md-4 col-sm-4 col-xs-6">
                        <a title="重修报名">
                            <img src="../images/ico_but31.png" alt="重修报名">
                            <h5>重修报名</h5>
                        </a>
                    </li>
                    <li class="col-md-4 col-sm-4 col-xs-6">
                        <a title="免推申请报名">
                            <img src="../images/ico_but18.png" alt="免推申请报名">
                            <h5>免推申请报名</h5>
                        </a>
                    </li>
                    <li class="col-md-4 col-sm-4 col-xs-6">
                        <a title="教学项目报名">
                            <img src="../images/ico_but19.png" alt="教学项目报名">
                            <h5>教学项目报名</h5>
                        </a>
                    </li>
                    <li class="col-md-4 col-sm-4 col-xs-6">
                        <a title="自主选课(一致版)">
                            <img src="../images/ico_but46.png" alt="自主选课(一致版)">
                            <h5>自主选课(一致版)</h5>
                        </a>
                    </li>
                    <li class="col-md-4 col-sm-4 col-xs-6">
                        <a title="学生成绩查询">
                            <img src="../images/ico_but36.png" alt="学生成绩查询">
                            <h5>学生成绩查询</h5>
                        </a>
                    </li>
                    <li class="col-md-4 col-sm-4 col-xs-6">
                        <a title="学生选题">
                            <img src="../images/ico_but42.png" alt="学生选题">
                            <h5>学生选题</h5>
                        </a>
                    </li>
                </ul>

            </div>

        </div>
        <div class="col-md-9 col-sm-8">
            <div class="row">
                <div class="col-md-6">
                    <div class="index_rctx" id="area_one">
                        <h5 class="index_title">
                            <span class="title">课表</span>
                        </h5>
                        <a class="list-group-item">
							<span class="title">
							  7-17周(11-13节)-星期一-面向对象程序设计-北区-A阶-303-江志英
							</span>
                        </a>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="index_rctx mCustomScrollbar _mCS_2 mCS_no_scrollbar" id="area_two">
                        <div id="mCSB_2" class="mCustomScrollBox mCS-dark-3 mCSB_vertical mCSB_inside" tabindex="0">
                            <div id="mCSB_2_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
                                <style type="text/css">
                                    .index_rctx .list-group-item .time {
                                        float: right;
                                        margin-left: 10px;
                                        color: #858585;
                                        font: normal 12px/39px SimSun;
                                    }
                                </style>
                                <h5 class="index_title"><span class="title">文件</span></h5>
                                <div class="list-group">

                                </div>
                            </div>
                            <div id="mCSB_2_scrollbar_vertical" class="mCSB_scrollTools mCSB_2_scrollbar mCS-dark-3 mCSB_scrollTools_vertical" style="display: none;">
                                <a  class="mCSB_buttonUp" oncontextmenu="return false;"></a>
                                <div class="mCSB_draggerContainer">
                                    <div id="mCSB_2_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; height: 0px; top: 0px;" oncontextmenu="return false;">
                                        <div class="mCSB_dragger_bar" style="line-height: 30px;">

                                        </div>
                                    </div>
                                    <div class="mCSB_draggerRail">

                                    </div>
                                </div>
                                <a class="mCSB_buttonDown" oncontextmenu="return false;"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="index_rctx" id="area_three">
                        <h5 class="index_title"><span class="title">消息</span></h5>
                        <div class="list-group">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="index_rctx" id="area_four">
                        <h5 class="index_title"><span class="title">成绩</span></h5>
                        <div class="list-group">
                            <a  class="list-group-item">
								<span class="title">
								2017-2018-2-专业选修-计算方法
								</span>
                                <span class="fraction float_r">A-</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="footerID" class="footer">
    <p>数据库原理课程设计  高谦   计科1601班 </p>
</div>
</c:if>
<c:if test="${empty userinfo}">
    <script type="text/javascript">
        window.location.href="${pageContext.request.contextPath}/index.jsp";
    </script>
</c:if>
<style type="text/css">
    .icon-div {
        background-color: #48abea;
        color: #fff;
        font-size: 20px;
        font-weight: 600;
        text-align: center;
        width: 48px;
        height: 48px;
        line-height: 48px;
        border-radius: 100%;
        margin: auto;
    }
    .index_wdyy ul li h5{
        height: 60px;
        overflow: hidden;
    }

    .list-unstyled a{
        text-decoration: none;
    }
    .index_rctx{
        height:280px;
    }
    .index_rctx .table-responsive{
        height: 240px;
        overflow-y: hidden;
    }
</style>
<link rel="stylesheet" type="text/css" href="../css/jquery.validate-min.css">
<script type="text/javascript">
    jQuery(function($){
        $('[data-toggle*="validation"]').trigger("validation");
    });
</script>
</body>
</html>