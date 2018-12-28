<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="../include/htmlHead.jsp">
    <jsp:param name="title" value="课程成绩管理"></jsp:param>
</jsp:include>
<div class="container padding-150">
    <div class="row" style="padding-top: 60px;padding-left:25px;">
        <div class="detail_title">
            课程成绩管理
        </div>
        <div class="col-md-8 column">
            <div class="panel-group" id="panel-805813">
                <c:forEach items="${gradelist}" var="course">
                    <div class="panel panel-default" id="course-${course.getCno()}">
                        <div class="panel-heading">
                            <a class="panel-title collapsed" data-toggle="collapse"
                               data-parent="#panel-805813" href="#panel-element-${course.getCno()}">
                                <span>${course.getCname()}</span>
                                <span style="float: right;">${course.getCno()}</span>
                            </a>
                        </div>
                        <div id="panel-element-${course.getCno()}" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="course_cno"><span>课程号：</span>${course.getCno()}</div>
                                <div class="course_college"><span>教学学期：</span>${course.getSemester()}</div>
                                <a class="btn btn-default" style="float:right;"
                                   href="${pageContext.request.contextPath}/coursegrademanage?cno=${course.getCno()}&semester=${course.getSemester()}">课程成绩管理</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty gradelist}">
                    <h3>当前不是给成绩的时间，如有需要请联系管理员老师修改！</h3>
                </c:if>
            </div>
        </div>
    </div>
</div>