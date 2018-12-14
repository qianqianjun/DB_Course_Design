<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="../include/htmlHead.jsp">
    <jsp:param name="title" value="查看详情"></jsp:param>
</jsp:include>
<div class="container padding-150">
    <div class="row" style="padding-top: 60px;">
        <div class="detail_title">
            详 情
        </div>
        <div class="col-md-1 column">
        </div>
        <div class="col-md-6 column">
            <h1>${message.getTitle()}</h1>
            <div class="fu-title">
                <div class="people-account">
                    <span>提交学生: </span>
                    <span>${message.getSno()}</span>
                </div>
                <div class="send-time">
                    <span>提交时间: </span>
                    <span>${message.getSendtime()}</span>
                </div>
                <div class="mess-status">
                    <span>状态: </span>
                    <c:if test="${message.getStatus()==0}">
                        <span>未处理</span>
                    </c:if>
                    <c:if test="${message.getStatus()!=0}">
                        <span>已处理</span>
                    </c:if>
                </div>
            </div>
            <div class="article-content">
                ${message.getContent()}
            </div>
            <div class="operation" id="operation">
                <c:if test="${message.getStatus()==0}">
                    <input type="button" value="完成处理" onclick="send()">
                </c:if>
            </div>
        </div>
        <div class="col-md-4 column">
            <script type="text/javascript">
                function send()
                {
                    $.post("${pageContext.request.contextPath}/handlehelp",{helpid:${message.getId()}},
                        function(data,status){
                            alert("状态已经改变！");
                            document.getElementById("operation").style.display="none";
                        });
                }
            </script>
        </div>
    </div>
</div>
<%@include file="../include/htmlFooter.jsp"%>