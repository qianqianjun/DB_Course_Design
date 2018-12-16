<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="../include/htmlHead.jsp">
    <jsp:param name="title" value="公告详情"></jsp:param>
</jsp:include>
<div class="container padding-150">
    <div class="row" style="padding-top: 60px;padding-left:25px;">
        <div class="detail_title">
            公告详情
        </div>
        <div class="col-md-1 column">
        </div>
        <div class="col-md-10 column">
            <c:forEach items="${noticelist}" var="notice">
            <h1 style="text-align: center;">${notice.getTitle()}</h1>
            <div class="fu-title">
                <div class="people-account">
                    <span>发布人</span>
                    <span>root</span>
                </div>
                <div class="send-time">
                    <span>发布时间</span>
                    <span>${notice.getSendtime()}</span>
                </div>
            </div>
            <div class="article-content">
<pre>
${notice.getContent()}
</pre>
            </div>
            </c:forEach>
        </div>
        <div class="col-md-1 column">
        </div>
    </div>
</div>