<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加新的课程</title>
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
    <script type="text/javascript">
        function submits() {
            var tno=$("input[name='tno']").val();
            var pcno=$("input[name='pcno']").val();
            var dept=$("input[name='dept']").val();
            var capacity=$("input[name='capacity']").val();
            var runtime=$("input[name='runtime']").val();
            var cname=$("input[name='cname']").val();
            var cno=$("input[name='cno']").val();
            var introduce=$("textarea[name='introduce']").val();
            var weektime=$("input[name='weektime']").val();
            console.log(tno,pcno,dept,capacity,runtime,cname,cno,introduce,weektime);
        }
    </script>
</head>
<body class="body-container">
<!-- top -->
<c:if test="${empty userinfo}">
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
                    <span style="color:white;font-size:20px;">欢迎您，${userinfo.sname} 老师</span>
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
    <div class="row clearfix">
        <div class="col-md-1 column">
        </div>
        <div class="col-md-10 column">
            <h3>
                发布新的课程
            </h3><br>
            <p>
                各位老师在这里添加好相应的信息就可以发布新课程了。
            </p>
            <br>
            <form role="form">
                <div class="row">
                    <div class="col-md-4">
                        <h4>
                            任课教师相关信息
                        </h4><br>
                        <div class="form-group">
                            <label>教师工号</label>
                            <input type="text" class="form-control" name="tno" required="required"/>
                        </div>
                        <div class="form-group">
                            <label>开课学院</label>
                            <input type="email" class="form-control" required="required" name="dept"/>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <h4>
                            课程相关信息
                        </h4><br>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>课程号码</label>
                                    <input type="text" class="form-control" name="cno" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>课程名称</label>
                                    <input type="text" class="form-control" required="required" name="cname"/>
                                </div>
                                <div class="form-group">
                                    <label>课程容量</label>
                                    <input type="text" class="form-control" name="capacity" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>先修课程号</label>
                                    <input type="text" class="form-control" name="pcno" required="required"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>教学周起止</label>
                                    <input type="text" class="form-control" name="weektime" required="required" placeholder="例如：1-17"/>
                                </div>
                                <div class="form-group">
                                    <label>每周课程安排</label>
                                    <input type="text" class="form-control" required="required" name="runtime" placeholder="格式：周几-开始节-结束节，多个时间用 | 分隔"/>
                                </div>
                                <div class="form-group">
                                    <label>课程简介</label>
                                    <textarea type="text" class="form-control" name="introduce" required="required" style="height: 90px;"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="button" onclick="submits()" class="btn btn-default btn-info" style="width: 100px;height: 40px;font-size: 15px;">按钮</button>
            </form>
        </div>
        <div class="col-md-1 column">
        </div>
    </div>
</div>

<div id="footerID" class="footer" style="position: absolute;width: 100%;bottom: 0px;">
    <p>数据库原理课程设计  高谦   计科1601班 </p>
</div>
</c:if>
<c:if test="${!empty userinfo}">
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