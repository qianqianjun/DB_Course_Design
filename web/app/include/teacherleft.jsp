<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="col-md-2 col-sm-3">
    <div class="index_wdyy">
        <h3><span>我的应用</span><a href="" class="sz" id="wdyy_szbtn"></a></h3>
        <ul class="list-unstyled mCustomScrollbar _mCS_1 mCS_no_scrollbar" id="index_wdyy" style="height: 350px;">
            <li class="col-md-6 col-sm-6 col-xs-6">
                <a href="${pageContext.request.contextPath}/app/managepersonalinfo.jsp">
                    <img src="${pageContext.request.contextPath}/images/ico_but83.png">
                    <h5>个人信息维护</h5>
                </a>
            </li>
            <li class="col-md-6 col-sm-6 col-xs-6">
                <a href="${pageContext.request.contextPath}/app/changepassword.jsp">
                    <img src="${pageContext.request.contextPath}/images/ico_but28.png">
                    <h5>修改密码</h5>
                </a>
            </li>
            <li class="col-md-6 col-sm-6 col-xs-6">
                <a href="${pageContext.request.contextPath}/teachlist" target="_blank">
                    <img src="${pageContext.request.contextPath}/images/ico_but30.png">
                    <h5>授课查看</h5>
                </a>
            </li>
            <li class="col-md-6 col-sm-6 col-xs-6">
                <a href="${pageContext.request.contextPath}/app/addcourse.jsp">
                    <img src="${pageContext.request.contextPath}/images/ico_but31.png">
                    <h5>申请新课</h5>
                </a>
            </li>
            <li class="col-md-6 col-sm-6 col-xs-6">
                <a href="${pageContext.request.contextPath}/grademanage" target="_blank">
                    <img src="${pageContext.request.contextPath}/images/ico_but18.png">
                    <h5>成绩管理</h5>
                </a>
            </li>
            <li class="col-md-6 col-sm-6 col-xs-6">
                <a href="${pageContext.request.contextPath}/studentlist" target="_blank">
                    <img src="${pageContext.request.contextPath}/images/ico_but42.png">
                    <h5>学生信息查看</h5>
                </a>
            </li>
        </ul>
    </div>
</div>