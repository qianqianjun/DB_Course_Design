<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="../include/htmlHead.jsp">
    <jsp:param name="title" value="学生求助"></jsp:param>
</jsp:include>
<div class="container padding-150">
    <div class="row" style="padding-top: 60px;padding-left:25px;">
        <div class="detail_title">
            学生求助
        </div>
        <div class="col-md-8 column">
            <div class="new_course_search_div">
                <form action="${pageContext.request.contextPath}/searchhelp" method="post">
                    <input type="text" name="sno" class="form-control tno-search" placeholder="搜索学生学号" style="height: 34px;"/>
                    <label style="line-height: 100%;margin-right: 10px;">选择状态: </label>
                    <select class="form-control college-search" id="college" name="status">
                        <option value="all">全部</option>
                        <option value="1">已经处理</option>
                        <option value="0">暂未处理</option>
                    </select>
                    <button type="submit" class="btn btn-default search_btn">查询</button>
                </form>
            </div>
            <div class="panel-group" id="panel-805813">
                <c:forEach items="${helplist}" var="help">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="panel-title collapsed" data-toggle="collapse"
                               data-parent="#panel-805813" href="#panel-element-${help.getId()}">
                                <span>${help.getTitle()}</span>
                                <span style="float: right;">${help.getSno()}</span>
                            </a>
                        </div>
                        <div id="panel-element-${help.getId()}" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="course_cno"><span>反馈学生：</span>${help.getSno()}</div>
                                <div class="course_college"><span>反馈时间：</span>${help.getSendtime()}</div>
                                <div class="course_description">
                                    <span>问题描述</span><br>
                                        ${help.getContent()}
                                </div>
                                <c:if test="${help.getStatus()==0}">
                                    <div class="course_operation" id="help-${help.getId()}">
                                        <button class="btn btn-default" onclick="access('help-${help.getId()}','${help.getId()}')">完成处理</button>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <script type="text/javascript">
                    function access(id,idvalue) {
                        $.post("${pageContext.request.contextPath}/handlehelp",{helpid:idvalue},function (data,status) {
                            if(status=="success")
                            {
                                alert("操作成功!");
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