<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="col-md-2 col-sm-3">
    <div class="index_wdyy">
        <h3><span>我的应用</span><a href="" class="sz" id="wdyy_szbtn"></a></h3>
        <ul class="list-unstyled mCustomScrollbar _mCS_1 mCS_no_scrollbar" id="index_wdyy" style="height: 350px;">
            <li class="col-md-6 col-sm-6 col-xs-6">
                <a  target="_blank" href="${pageContext.request.contextPath}/app/root/sendnotice.jsp">
                    <img src="${pageContext.request.contextPath}/images/ico_but83.png">
                    <h5>发布公告</h5>
                </a>
            </li>
            <li class="col-md-6 col-sm-6 col-xs-6">
                <a target="_blank" href="${pageContext.request.contextPath}/runingcontrol">
                    <img src="${pageContext.request.contextPath}/images/ico_but28.png">
                    <h5>运行控制</h5>
                </a>
            </li>
            <li class="col-md-6 col-sm-6 col-xs-6">
                <a target="_blank" href="${pageContext.request.contextPath}/studenthelp">
                    <img src="${pageContext.request.contextPath}/images/ico_but30.png">
                    <h5>学生求助</h5>
                </a>
            </li>
            <li class="col-md-6 col-sm-6 col-xs-6">
                <a href="${pageContext.request.contextPath}/newcourse" target="_blank">
                    <img src="${pageContext.request.contextPath}/images/ico_but31.png">
                    <h5>新课审核</h5>
                </a>
            </li>
            <li class="col-md-6 col-sm-6 col-xs-6">
                <a  target="_blank" href="${pageContext.request.contextPath}/app/root/coursearrangement.jsp">
                    <img src="${pageContext.request.contextPath}/images/ico_but18.png">
                    <h5>课程安排</h5>
                </a>
            </li>
            <li class="col-md-6 col-sm-6 col-xs-6">
                <a target="_blank" href="${pageContext.request.contextPath}/app/root/createlist.jsp">
                    <img src="${pageContext.request.contextPath}/images/ico_but42.png">
                    <h5>创建选课</h5>
                </a>
            </li>
        </ul>
    </div>
</div>
