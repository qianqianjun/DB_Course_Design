<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="../include/htmlHead.jsp">
    <jsp:param name="title" value="学生自主选课"></jsp:param>
</jsp:include>
<style>
    .temp{

    }
</style>
<div class="container padding-150">
    <div class="row" style="padding-top: 60px;padding-left:25px;">
        <div class="detail_title">
            学生自主选课
        </div>
        <div class="col-md-8 column">
            <div class="new_course_search_div">
                <input type="text" name="cno" class="form-control tno-search" id="cno"
                       placeholder="课程号" style="height: 34px;"/>
                <input type="text" name="cname" class="form-control tno-search" id="cname"
                       placeholder="课程名称" style="height: 34px;"/>
                <label style="line-height: 100%;margin-right: 10px;">开课学院: </label>
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
                <label style="line-height: 100%;margin-right: 10px;">有无余量: </label>
                <select class="form-control college-search" id="status" name="status">
                    <option value="all">全部课程</option>
                    <option value=">">有余量</option>
                    <option value="<=">无余量</option>
                </select>
                <button type="button" class="btn btn-default search_btn">查询</button>
            </div>
            <div class="panel-group" id="panel-805813">
                <c:forEach items="${courselist}" var="course">
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
                                <div class="course_college"><span>课程名称：</span>${course.getCname()}</div>
                                <div class="course_college"><span>任课教师：</span>${course.getTname()}</div>
                                <div class="course_college"><span>上课地点：</span>${course.getLocation()}</div>
                                <div class="course_college"><span>剩余容量：</span>${course.getCapacity()}</div>
                                <div class="course_description">
                                    <span>课程描述</span><br>
                                        ${course.getIntroduction()}
                                </div>
                                <c:if test="${course.getIsselected()==1}">
                                    <div class="course_cno" id="status-${course.getCno()}"><span>选课状态：已选课程</span></div>
                                    <div class="course_operation" id="operation-${course.getCno()}">
                                        <button class="btn btn-default"
                                                onclick="inputarrange('${course.getCno()}')">退选课程</button>
                                    </div>
                                </c:if>
                                <c:if test="${course.getIsselected()==0}">
                                    <div class="course_cno"><span>选课状态：未选课程</span></div>
                                    <div class="course_operation" id="operation-${course.getCno()}">
                                        <button class="btn btn-default"
                                                onclick="inputarrange('${course.getCno()}')">选择课程</button>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty courselist}">
                    <h3>当前不是选课时间！如有需要，请联系管理员！</h3>
                </c:if>
            </div>
        </div>
        <div class="col-md-3 column">
            <c:if test="${!empty courselist}">
                <h4>已选课程</h4>
                <ul>
                    <c:forEach items="${courselist}" var="course">
                        <c:if test="${course.getIsselected()==1}">
                            <li class="have_selected">
                                <div class="cname_have_selected">
                                        ${course.getCname()}
                                </div>
                                <button class="btn-default btn temp"
                                        onclick="cancle_select(${course.getCno()},${course.getSemester()},${userinfo.getSno()})">
                                    取消课程
                                </button>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </c:if>
        </div>
    </div>
</div>