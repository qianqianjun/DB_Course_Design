<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:include page="include/htmlHead.jsp">
    <jsp:param name="title" value="盗版教务管理系统"></jsp:param>
</jsp:include>
<c:if test="${!empty userinfo}">
    <c:if test='${userinfo.type=="student"}'>
        <jsp:include page="include/studentheader.jsp">
            <jsp:param name="sname" value="${userinfo.sname}"></jsp:param>
        </jsp:include>
        <div class="container padding-150">
            <div class="row">
                <%@include file="include/stuleft.jsp"%>
                <%@include file="include/sturight.jsp"%>
            </div>
        </div>
    </c:if>
    <c:if test='${userinfo.type=="teacher"}'>
        <jsp:include page="include/teacherheader.jsp">
            <jsp:param name="tname" value="${userinfo.tname}"></jsp:param>
        </jsp:include>
        <div class="container padding-150">
            <div class="row">
                <%@include file="include/teacherleft.jsp"%>
                <%@include file="include/teacherright.jsp"%>
            </div>
        </div>
    </c:if>
    <c:if test='${userinfo.type=="root"}'>
        <jsp:include page="include/rootheader.jsp">
            <jsp:param name="tname" value="${userinfo.tname}"></jsp:param>
        </jsp:include>
        <div class="container padding-150">
            <div class="row">
                <%@include file="include/rootleft.jsp"%>
                <%@include file="include/rootright.jsp"%>
            </div>
        </div>
    </c:if>
</c:if>
<c:if test="${empty userinfo}">
    <script type="text/javascript">
        window.location.href="${pageContext.request.contextPath}/index.jsp";
    </script>
</c:if>
<%@include file="include/htmlFooter.jsp"%>