<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="include/htmlHead.jsp">
    <jsp:param name="title" value="添加新课程"></jsp:param>
</jsp:include>
<c:if test="${!empty userinfo}">
<jsp:include page="include/teacherheader.jsp">
    <jsp:param name="tname" value="${userinfo.tname}"></jsp:param>
</jsp:include>
<!-- 主体 -->
<div class="container padding-150">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form role="form" action="${pageContext.request.contextPath}/AddCourseServlet" method="post">
                <div class="row">
                    <div class="col-md-8">
                        <h4>
                            课程相关信息
                        </h4><br>
                        <div class="row">
                            <div class="col-md-6">
                                <input type="hidden" value="${userinfo.tno}" name="settno">
                                <div class="form-group">
                                    <label>课程号码</label>
                                    <input type="text" class="form-control" name="cno" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>课程名称</label>
                                    <input type="text" class="form-control" required="required" name="cname"/>
                                </div>
                                <div class="form-group">
                                    <label>先修课程号</label>
                                    <input type="text" class="form-control" name="pcno"/>
                                </div>
                                <div class="form-group">
                                    <label>开课学院</label>
                                    <select name="dept" class="form-control">
                                        <option value="信息科学与技术学院">信息科学与技术学院</option>
                                        <option value="化学工程学院">化工学院</option>
                                        <option value="材料科学与工程学院">材料学院</option>
                                        <option value="机电工程学院">机电学院</option>
                                        <option value="文法学院">文法学院</option>
                                        <option value="经济管理学院">经济管理学院</option>
                                        <option value="理学院">理学院</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>课程简介</label>
                                    <textarea type="text" class="form-control" name="introduce" required="required" style="height: 90px;"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-default btn-info" style="width: 100px;height: 40px;font-size: 15px;">提交申请</button>
            </form>
        </div>
    </div>
</div>
</c:if>
<c:if test="${empty userinfo}">
    <script type="text/javascript">
        window.location.href="${pageContext.request.contextPath}/index.jsp";
    </script>
</c:if>
<%@include file="include/htmlFooter.jsp"%>