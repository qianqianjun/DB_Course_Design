<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="../include/htmlHead.jsp">
    <jsp:param name="title" value="学生信息查询"></jsp:param>
</jsp:include>
<style>
    .temp{
        height: 34px;
        position: relative;
        top: -2px;
    }
</style>
<div class="container padding-150">
    <div class="row" style="padding-top: 60px;padding-left:25px;">
        <div class="detail_title">
            学生信息查询
        </div>
        <div class="col-md-8 column">
            <div class="new_course_search_div">
                <form action="${pageContext.request.contextPath}/studentlist" method="post">
                    <label style="line-height: 100%;margin-right: 10px;">选择学生所在课程: </label>
                    <select class="form-control college-search" name="cno">
                        <c:forEach items="${courselist}" var="course">
                            <option value="${course.getCno()}-${course.getCname()}">${course.getCname()}</option>
                        </c:forEach>
                    </select>
                    <input type="text" name="sno" class="form-control tno-search" placeholder="搜索学生学号" style="height: 34px;
        position: relative;top: -2px;"/>
                    <button type="submit" class="btn btn-default search_btn">查询</button>
                </form>
            </div>
            <div class="panel-group" id="panel-805813">
                <c:forEach items="${studentlist}" var="student">
                    <div class="panel panel-default" id="course-${student.getSno()}">
                        <div class="panel-heading">
                            <a class="panel-title collapsed" data-toggle="collapse"
                               data-parent="#panel-805813" href="#panel-element-${student.getSno()}">
                                <span>${student.getSname()}</span>
                                <span style="float: right;">${student.getSno()}</span>
                            </a>
                        </div>
                        <div id="panel-element-${student.getSno()}" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="course_cno"><span>学号：</span>${student.getSno()}</div>
                                <div class="course_college"><span>姓名：</span>${student.getSname()}</div>
                                <div class="course_college"><span>性别：</span>${student.getSex()}</div>
                                <div class="course_college"><span>班级：</span>${student.getKlass()}</div>
                                <div class="course_college"><span>课程：</span>${student.getCname()}</div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="col-md-3 column">
        </div>
    </div>
</div>