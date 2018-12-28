<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="navbar navbar-default navbar-static-top top1">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand logo_2">
                <img src="${pageContext.request.contextPath}/images/logo_jw_w.png" style="margin-top:-3px">
                <span id="xtmc">盗版教务管理系统</span>
            </a>
        </div>
        <ul class="nav navbar-nav navbar-right  hidden-xs">
            <li class="">
                <a class="dropdown-toggle grxx" data-toggle="dropdown" aria-expanded="false">
                    <span style="color:white;font-size:20px;">欢迎您，<%=request.getParameter("sname")%> 同学</span>
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
<div class="navbar_index">
    <div class="container" id="myDiv1">
        <nav id="cdNav" class="navbar-collapse bs-navbar-collapse collapse" role="navigation" aria-expanded="false">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="${pageContext.request.contextPath}/content">首页</a>
                </li>
                <li class="dropdown">
                    <a id="drop" href="" role="button" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">信息维护
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="drop1">
                        <li><a tabindex="-1" href="${pageContext.request.contextPath}/app/managepersonalinfo.jsp">个人信息维护</a></li>
                        <li><a tabindex="-1" href="${pageContext.request.contextPath}/app/changepassword.jsp">修改密码</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a id="drop2" href="" role="button" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">选课系统
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="drop1">
                        <li><a href="${pageContext.request.contextPath}/select_course" target="_blank">自主选课</a></li>
                        <li><a href="${pageContext.request.contextPath}/app/student/sendmessage.jsp">联系老师</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a id="drop1" href="" role="button" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">信息查询
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="drop1">
                        <li>
                            <a target="_blank" href="${pageContext.request.contextPath}/course_table">课表查看</a>
                        </li>
                        <li>
                            <a target="_blank" href="${pageContext.request.contextPath}/gradelist">成绩查询</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>
