<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="../include/htmlHead.jsp">
    <jsp:param name="title" value="授课信息查看"></jsp:param>
</jsp:include>
<div class="container padding-150">
    <div class="row" style="padding-top: 60px;padding-left:25px;">
        <div class="detail_title">
            授课信息查看
        </div>
        <div class="col-md-8 column">
            <div class="panel-group" id="panel-805813">
                <c:forEach items="${courselist}" var="course">
                    <div class="panel panel-default" id="course-${course.getCno()}">
                        <div class="panel-heading">
                            <a class="panel-title collapsed" data-toggle="collapse"
                               data-parent="#panel-805813" href="#panel-element-${course.getCno()}">
                                <span>${course.getCname()}</span>
                                <span style="float: right;">${course.getLocation()}</span>
                            </a>
                        </div>
                        <div id="panel-element-${course.getCno()}" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="course_cno"><span>课程号：</span>${course.getCno()}</div>
                                <div class="course_college"><span>教学学期：</span>${course.getSemester()}</div>
                                <div class="course_college"><span>教学周：</span>${course.getWeektime()}</div>
                                <div class="course_college"><span>课程容量：</span>${course.getCapacity()}</div>
                                <button class="btn btn-default" style="float:right;"
                                                onclick="runinfo('${course.getCno()}','${course.getSemester()}','${course.getWeektime()}')">授课时间表</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="col-md-3 column">
            <script>
                function runinfo(cnovalue,semesterval,weektime) {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/teachlist",
                        data:{cno:cnovalue,semester:semesterval},
                        type:'post',
                        success:function(data,textStatus,XMLHttpRequest){
                            document.getElementById("weektime").innerText=weektime;
                            document.getElementById("timelist").innerHTML="";
                            var jsonarr=JSON.parse(data);
                            var parent=document.getElementById("timelist");
                            for(var i=0;i<jsonarr.length;i++)
                            {
                                var newitem=document.createElement("div");
                                newitem.setAttribute("class","run-week");
                                newitem.innerText=jsonarr[i];
                                parent.append(newitem);
                            }
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
<%--下面是遮罩窗体--%>
<div class="col-md-12 column">
    <div class="modal fade" id="modal-container-28819" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="myModalLabel">
                        教学时间表
                    </h3>
                </div>
                <div class="modal-body">
                    <h4 id="weektime"></h4>
                    <div id="timelist">
                        <div class="run-week"></div>
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