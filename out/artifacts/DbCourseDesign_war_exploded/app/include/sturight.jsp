<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="col-md-10 col-sm-9">
    <div class="row">
        <div class="col-md-4">
            <div class="index_rctx" id="area_one">
                <h5 class="index_title">
                    <span class="title">课程信息</span>
                    <span class="more"><a href="#" class="right_more" target="_blank">更多</a></span>
                </h5>
                <a class="list-group-item">
                    <span class="title">
                      7-17周(11-13节)-星期一-面向对象程序设计-北区-A阶-303-江志英
                    </span>
                </a>
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
                    <span class="more"><a href="#" class="right_more" target="_blank">更多</a></span>
                </h5>
                <div class="list-group">
                    <a  class="list-group-item">
								<span class="title">
								2017-2018-2-专业选修-计算方法
								</span>
                        <span class="fraction float_r">A</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
