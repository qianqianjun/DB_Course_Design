<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="../include/htmlHead.jsp">
    <jsp:param name="title" value="提交反馈"></jsp:param>
</jsp:include>
<jsp:include page="../include/studentheader.jsp">
    <jsp:param name="sname" value="${userinfo.sname}"></jsp:param>
</jsp:include>
<jsp:include page="sendmessagebody.jsp">
    <jsp:param name="sno" value="${userinfo.sno}"></jsp:param>
</jsp:include>

