<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="col-md-10 col-sm-9">
    <div class="row">
        <div class="col-md-5">
            <div class="index_rctx" id="area_one">
                <h5 class="index_title">
                    <span class="title">教学日志</span>
                </h5>
                <c:if test="${!empty teachlist}">
                    <c:forEach items="${teachlist}" var="elem">
                        <a class="list-group-item">
                            <span class="title_help" style="margin-right: 10px;">
                                    ${elem.getCname()}
                            </span>
                            <span class="sno_help" style="margin-right: 10px;">
                                    ${elem.getTeachtime()}
                            </span>

                            <span class="sno_help" style="margin-right: 10px;">
                                    ${elem.getLocation()}
                            </span>
                            <span class="sno_help" style="margin-right: 10px;">
                                    ${elem.getWeektime()}
                            </span>
                        </a>
                    </c:forEach>
                </c:if>
                <c:if test="${empty teachlist}">
                    <a class="list-group-item">
                        <span class="title_help">
                                当前没有授课信息
                        </span>
                    </a>
                </c:if>
            </div>
        </div>
        <div class="col-md-7">
            <div class="index_rctx" id="area_four">
                <h5 class="index_title"><span class="title">通知公告</span></h5>
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
    </div>
</div>
