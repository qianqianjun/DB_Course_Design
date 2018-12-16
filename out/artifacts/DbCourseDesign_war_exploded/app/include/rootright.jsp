<%@ page import="model.Message" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%List<Message> helpList = (List<Message>) request.getAttribute("helpList");%>
<div class="col-md-10 col-sm-9">
    <div class="row">
        <div class="col-md-6">
            <div class="index_rctx" id="area_one">
                <h5 class="index_title">
                    <span class="title">学生求助</span>
                    <span class="more"><a href="${pageContext.request.contextPath}/studenthelp" class="right_more" target="_blank">更多</a></span>
                </h5>
                <c:if test="${!empty helpList}">
                <c:forEach items="${helpList}" var="elem">
                    <a class="list-group-item" href="${pageContext.request.contextPath}/searchhelp?id=${elem.getId()}" target="_blank">
                        <span class="title_help">
                            ${elem.getTitle()}
                        </span>
                        <span class="sno_help">
                            ${elem.getSno()}
                        </span>
                    </a>
                </c:forEach>
                </c:if>
                <c:if test="${empty helpList}">
                    <a class="list-group-item">
                        <span class="title">
                                当前没有学生请求
                        </span>
                    </a>
                </c:if>
            </div>
        </div>
        <div class="col-md-6">
            <div class="index_rctx" id="area_two">
                <h5 class="index_title">
                    <span class="title">新课申请</span>
                    <span class="more"><a href="${pageContext.request.contextPath}/newcourse" class="right_more" target="_blank">更多</a></span>
                </h5>
                <c:if test="${!empty newcourse}">
                    <c:forEach items="${newcourse}" var="course">
                        <a class="list-group-item" href="${pageContext.request.contextPath}/searchnew?cno=${course.getCno()}" target="_blank">
                        <span class="title_help">
                                ${course.getCname()}
                        </span>
                            <span class="sno_help">
                                    ${course.getSettno()}
                            </span>
                        </a>
                    </c:forEach>
                </c:if>
                <c:if test="${empty newcourse}">
                    <a class="list-group-item">
                        <span class="title">
                                当前没有老师提交新课的申请。
                        </span>
                    </a>
                </c:if>
            </div>
        </div>
    </div>
</div>
