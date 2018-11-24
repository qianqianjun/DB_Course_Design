<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:include page="include/htmlHead.jsp">
    <jsp:param name="title" value="修改密码"></jsp:param>
</jsp:include>
<c:if test="${!empty userinfo}">
    <c:if test="${userinfo.type=='student'}">
        <jsp:include page="include/studentheader.jsp">
            <jsp:param name="sname" value="${userinfo.sname}"></jsp:param>
        </jsp:include>
    </c:if>
    <c:if test="${userinfo.type=='teacher'}">
        <jsp:include page="include/teacherheader.jsp">
            <jsp:param name="tname" value="${userinfo.tname}"></jsp:param>
        </jsp:include>
    </c:if>
</c:if>
<c:if test="${empty userinfo}">
    <script type="text/javascript">
        window.location.href="${pageContext.request.contextPath}/index.jsp"
    </script>
</c:if>
<%@include file="include/htmlFooter.jsp"%>