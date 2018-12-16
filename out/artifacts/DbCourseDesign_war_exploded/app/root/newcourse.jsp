<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="../include/htmlHead.jsp">
    <jsp:param name="title" value="新课审核"></jsp:param>
</jsp:include>
<div class="container padding-150">
    <div class="row" style="padding-top: 60px;padding-left:25px;">
        <div class="detail_title">
            新课审核
        </div>
        <div class="col-md-8 column">
            <div class="new_course_search_div">
                <form action="${pageContext.request.contextPath}/searchnew" method="post">
                    <input type="text" name="tno" class="form-control tno-search" id="tno" placeholder="搜索教师工号" style="height: 34px;"/>
                    <label style="line-height: 100%;margin-right: 10px;">选择学院: </label>
                    <select class="form-control college-search" id="college" name="college">
                        <option value="all">全部</option>
                        <option value="信息科学与技术学院">信息科学与技术学院</option>
                        <option value="化工学院">化工学院</option>
                        <option value="材料学院">材料学院</option>
                        <option value="机电学院">机电学院</option>
                        <option value="理学院">理学院</option>
                        <option value="文法学院">文法学院</option>
                        <option value="经济管理学院">经济管理学院</option>
                    </select>
                    <button type="submit" class="btn btn-default search_btn">查询</button>
                </form>
            </div>
            <div class="panel-group" id="panel-805813">
                <c:forEach items="${courselist}" var="course">
                    <div class="panel panel-default" id="course-${course.getCno()}">
                        <div class="panel-heading">
                            <a class="panel-title collapsed" data-toggle="collapse"
                               data-parent="#panel-805813" href="#panel-element-${course.getCno()}">
                                <span>${course.getCname()}</span>
                                <span style="float: right;">${course.getSettno()}</span>
                            </a>
                        </div>
                        <div id="panel-element-${course.getCno()}" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="course_cno"><span>课程号：</span>${course.getCno()}</div>
                                <div class="course_college"><span>开课学院：</span>${course.getDept()}</div>
                                <div class="course_description">
                                    <span>课程描述</span><br>
                                        ${course.getIntroduction()}
                                </div>
                                <div class="course_operation">
                                    <button class="btn btn-default" onclick="access('course-${course.getCno()}','${course.getCno()}')">通过申请</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <script type="text/javascript">
                    function access(id,idvalue) {
                        $.post("${pageContext.request.contextPath}/accessnewcourse",{cno:idvalue},function (data,status) {
                            if(status=="success")
                            {
                                alert("提交成功，该课程已经通过！");
                                document.getElementById(id).style.display="none";
                            }
                        })
                    }
                </script>
            </div>
        </div>
        <div class="col-md-3 column">
        </div>
    </div>
</div>
<%@include file="../include/htmlFooter.jsp"%>