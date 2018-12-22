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
                    <span style="color:white;font-size:20px;">欢迎您，<%=request.getParameter("tname")%> 管理员老师</span>
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
                <li>
                    <a href="${pageContext.request.contextPath}/content">首页</a>
                </li>
                <li class="dropdown">
                    <a id="drop" href="" role="button" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">教务管理
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="drop1">
                        <li>
                            <a target="_blank" href="${pageContext.request.contextPath}/app/root/sendnotice.jsp">发布公告</a>
                        </li>
                        <li>
                            <a target="_blank" href="${pageContext.request.contextPath}/newcourse">新课审核</a>
                        </li>
                        <li>
                            <a target="_blank" href="${pageContext.request.contextPath}/studenthelp">学生求助</a>
                        </li>
                        <li>
                            <a target="_blank" href="${pageContext.request.contextPath}/app/root/addnewpeople.jsp">添加人员</a>
                        </li>
                        <li>
                            <a target="_blank" href="${pageContext.request.contextPath}/app/root/courseinfo.jsp">课程信息</a>
                        </li>
                        <li>
                            <a target="_blank" href="${pageContext.request.contextPath}/app/root/coursearrangement.jsp">课程安排</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a id="drop1" href="" role="button" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">选课控制
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="drop1">
                        <li>
                            <a target="_blank" href="${pageContext.request.contextPath}/app/root/createlist.jsp">创建清单</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/runingcontrol" target="_blank">运行控制</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>

