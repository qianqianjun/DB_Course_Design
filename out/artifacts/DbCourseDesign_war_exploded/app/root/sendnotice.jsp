<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="../include/htmlHead.jsp">
    <jsp:param name="title" value="发布公告"></jsp:param>
</jsp:include>
<div class="container">
    <div class="row clearfix" style="margin-top: 30px;padding-left: 20px">
        <div class="col-md-12 column">
            <h3>
                输入公告的内容
            </h3>
            <form role="form" method="post" action="${pageContext.request.contextPath}/sendnotice">
                <input type="text" name="title" class="help_message_title" placeholder="输入公告主题描述" required="required">
                <div class="form-group">
                    <textarea id="message" class="content" name="content" placeholder="输入公告详细内容" required="required"></textarea>
                </div>
                <button type="submit" class="btn btn-default">发布公告</button>
            </form>
        </div>
    </div>
</div>
<%@include file="../include/htmlFooter.jsp"%>