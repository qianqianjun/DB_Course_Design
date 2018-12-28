<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="col-md-2 col-sm-3">
    <div class="index_wdyy">
        <h3><span>我的应用</span><a href="" class="sz" id="wdyy_szbtn"></a></h3>
        <ul class="list-unstyled mCustomScrollbar _mCS_1 mCS_no_scrollbar" id="index_wdyy" style="height: 350px;">
            <li class="col-md-6 col-sm-6 col-xs-6">
                <a href="${pageContext.request.contextPath}/app/managepersonalinfo.jsp">
                    <img src="${pageContext.request.contextPath}/images/ico_but83.png" alt="学籍异动申请">
                    <h5>个人信息维护</h5>
                </a>
            </li>
            <li class="col-md-6 col-sm-6 col-xs-6">
                <a href="${pageContext.request.contextPath}/app/student/sendmessage.jsp" target="_blank">
                    <img src="${pageContext.request.contextPath}/images/ico_but28.png">
                    <h5>联系老师</h5>
                </a>
            </li>
            <li class="col-md-6 col-sm-6 col-xs-6">
                <a href="${pageContext.request.contextPath}/select_course" target="_blank">
                    <img src="${pageContext.request.contextPath}/images/ico_but30.png">
                    <h5>自主选课</h5>
                </a>
            </li>
            <li class="col-md-6 col-sm-6 col-xs-6">
                <a target="_blank" href="${pageContext.request.contextPath}/course_table">
                    <img src="${pageContext.request.contextPath}/images/ico_but31.png">
                    <h5>查看课表</h5>
                </a>
            </li>
            <li class="col-md-6 col-sm-6 col-xs-6">
                <a href="${pageContext.request.contextPath}/gradelist" target="_blank">
                    <img src="${pageContext.request.contextPath}/images/ico_but18.png">
                    <h5>成绩查询</h5>
                </a>
            </li>
        </ul>
    </div>
</div>
