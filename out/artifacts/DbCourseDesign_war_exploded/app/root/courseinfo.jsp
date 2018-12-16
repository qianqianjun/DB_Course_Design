<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="../include/htmlHead.jsp">
    <jsp:param name="title" value="课程信息"></jsp:param>
</jsp:include>
<div class="container padding-150">
    <div class="row" style="padding-top: 60px;padding-left:25px;">
        <div class="detail_title">
            课程信息
        </div>
        <div class="col-md-8 column">
            <div class="new_course_search_div">
                <form action="${pageContext.request.contextPath}/searchclass" method="post">
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
                    <label style="line-height: 100%;margin-right: 10px;">课程状态: </label>
                    <select class="form-control college-search" id="status" name="status">
                        <option value="all">全部</option>
                        <option value="-1">未审核课程</option>
                        <option value="0">未运行课程</option>
                        <option value="1">已运行课程</option>
                    </select>
                    <button type="submit" class="btn btn-default search_btn">查询</button>
                </form>
            </div>
<%--以下为正式内容--%>
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
                    <div class="course_college"><span>开课学院：</span>${course.getDept()}</div>
                    <div class="course_description">
                        <span>课程描述</span><br>
                            ${course.getIntroduction()}
                    </div>
                    <c:if test="${course.getStatus()==0}">
                        <div class="course_cno"><span>课程状态：未运行课程</span></div>
                    </c:if>
                    <c:if test="${course.getStatus()==-1}">
                        <div class="course_cno"><span>课程状态：未审核课程</span></div>
                    </c:if>
                    <c:if test="${course.getStatus()==1}">
                        <div class="course_cno"><span>课程状态：已运行课程</span></div>
                        <div class="course_operation">
                            <button class="btn btn-default"
                                    onclick="runinfo('${course.getCno()}')">查看教学信息</button>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
            
            
            
            
            
            
            
            
            
            
            
        </div>
        <div class="col-md-3 column">
            <script>
                function runinfo(cnovalue) {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/runinfo",
                        data:{cno:cnovalue},
                        type:'post',
                        dataType:'json',
                        success:function(data,textStatus,XMLHttpRequest){
                            console.log(data);
                            $("#teacher").html(data[0][0]);
                            $("#tno").html(data[0][1]);
                            $("#run-week").html(data[0][2]);
                            var html="";
                            for(var i=1;i<data.length;i++)
                            {
                                html+="<span class='run-day'>"+data[i][0];
                                html+="</span><span class='run-jie'>"+data[i][1];
                                html+="</span><span class='run-location'>"+data[i][2];
                                html+="</span><br>";
                            }
                            $("#run-each").html(html);
                            document.getElementById("background").setAttribute("style","display:block;")
                            $("#modal-container-28819").addClass("in");
                            document.getElementById("modal-container-28819").setAttribute("style","display:block;");
                        },
                        error: function(xhr,status,error){
                            alert(error);
                        }
                    });
                }
                function closedetail() {
                    $("#modal-container-28819").removeClass("in");
                    document.getElementById("background").setAttribute("style","display:none;")
                    document.getElementById("modal-container-28819").setAttribute("style","display:none;");
                }
            </script>
        </div>
    </div>
</div>
<div class="col-md-12 column">
    <a id="modal-28819" href="#modal-container-28819" role="button" class="btn" data-toggle="modal">触发遮罩窗体</a>
    <div class="modal fade" id="modal-container-28819" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="myModalLabel">
                        课程运行信息
                    </h3>
                </div>
                <div class="modal-body">
                    <h4 class="info-item">任课教师：<span id="teacher"></span></h4>
                    <h4 class="info-item">教师工号：<span id="tno"></span></h4>
                    <div class="info-item">
                        <h4>课程安排：</h4>
                        <div class="run-week" id="run-week">
                        </div>
                        <div class="run-eachtime" id="run-each">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="closedetail()">关闭</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal-backdrop fade in" style="display: none;" onclick="closedetail()" id="background"></div>