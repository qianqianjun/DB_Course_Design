<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="col-md-10 col-sm-9">
    <div class="row">
        <div class="col-md-4">
            <div class="index_rctx" id="area_one">
                <h5 class="index_title">
                    <span class="title">课程信息</span>
                    <span class="more"><a href="${pageContext.request.contextPath}/course_table" class="right_more" target="_blank">更多</a></span>
                </h5>
                <c:if test="${!empty noticelist}">
                    <c:forEach items="${course_table_list}" var="elem">
                        <a class="list-group-item">
                            <span class="title_help">
                                    ${elem.getCname()}
                            </span>
                            <span class="sno_help">
                                    ${elem.getLocation()}
                            </span>
                        </a>
                    </c:forEach>
                </c:if>
                <c:if test="${empty noticelist}">
                    <a class="list-group-item">
                        <span class="title_help">
                                当前没有相关课程信息
                        </span>
                    </a>
                </c:if>
            </div>
        </div>
        <div class="col-md-4">
            <div class="index_rctx" id="area_two">
                <h5 class="index_title">
                    <span class="title">通知公告</span>
                </h5>
                <div class="list-group">
                    <c:if test="${!empty noticelist}">
                        <c:forEach items="${noticelist}" var="elem">
                            <a class="list-group-item" href="${pageContext.request.contextPath}/searchnotice?id=${elem.getId()}" target="_blank">
                                <span class="title_help">
                                        ${elem.getTitle()}
                                </span>
                                <span class="sno_help">
                                        ${elem.getSendtime()}
                                </span>
                            </a>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty noticelist}">
                        <a class="list-group-item">
                        <span class="title_help">
                                当前没有公告
                        </span>
                        </a>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="index_rctx" id="area_three">
                <h5 class="index_title">
                    <span class="title">成绩一览</span>
                    <span class="more"><a href="${pageContext.request.contextPath}/gradelist" class="right_more" target="_blank">更多</a></span>
                </h5>
                <div class="list-group">
                    <c:if test="${!empty grade_list}">
                        <c:forEach items="${grade_list}" var="elem">
                            <a class="list-group-item">
                                <span class="title_help">
                                        ${elem.getCname()}
                                </span>
                                <span class="sno_help">
                                        ${elem.getGrade()}
                                </span>
                            </a>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty grade_list}">
                        <a class="list-group-item">
                        <span class="title_help">
                                当前没有成绩的相关信息。
                        </span>
                        </a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
