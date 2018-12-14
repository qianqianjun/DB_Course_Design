<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="../include/htmlHead.jsp">
    <jsp:param name="title" value="新课申请"></jsp:param>
</jsp:include>
<div class="container padding-150">
    <div class="row" style="padding-top: 60px;padding-left:25px;">
        <div class="detail_title">
            新课申请
        </div>
        <div class="col-md-8 column">
            <div class="new_course_search_div">
                <form action="${pageContext.request.contextPath}/searchnew" method="post">
                <input type="text" class="form-control tno-search" id="tno" placeholder="搜索教师工号"/>
                <label style="line-height: 100%;margin-right: 10px;">选择学院: </label>
                <select class="form-control college-search" id="college">
                    <option value="all">全部</option>
                    <option value="xinxi">信息科学与技术学院</option>
                    <option value="huagong">化工学院</option>
                    <option value="cailiao">材料学院</option>
                    <option value="jidian">机电学院</option>
                    <option value="li">理学院</option>
                    <option value="wenfa">文法学院</option>
                    <option value="jingguan">经济管理学院</option>
                </select>
                <button type="submit" class="btn btn-default search_btn">查询</button>
                </form>
            </div>
            <div class="panel-group" id="panel-805813">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-805813" href="#panel-element-348501">Collapsible Group Item #1</a>
                    </div>
                    <div id="panel-element-348501" class="panel-collapse collapse">
                        <div class="panel-body">
                            Anim pariatur cliche...
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-805813" href="#panel-element-249521">Collapsible Group Item #2</a>
                    </div>
                    <div id="panel-element-249521" class="panel-collapse collapse">
                        <div class="panel-body">
                            Anim pariatur cliche...
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 column">
        </div>
    </div>
</div>
<%@include file="../include/htmlFooter.jsp"%>