<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="../include/htmlHead.jsp">
    <jsp:param name="title" value="课程信息"></jsp:param>
</jsp:include>
<div class="container padding-150">
    <div class="row" style="padding-top: 60px;padding-left:25px;">
        <div class="detail_title">
            课程安排
        </div>
        <div class="col-md-8 column">
            <div class="new_course_search_div">
                <form action="${pageContext.request.contextPath}/searcharrange" method="post">
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
                                    <div class="course_cno" id="status-${course.getCno()}"><span>课程状态：未运行课程</span></div>
                                    <div class="course_operation" id="operation-${course.getCno()}">
                                        <button class="btn btn-default"
                                                onclick="inputarrange('${course.getCno()}')">安排课程</button>
                                    </div>
                                </c:if>
                                <c:if test="${course.getStatus()==-1}">
                                    <div class="course_cno"><span>课程状态：未审核课程</span></div>
                                </c:if>
                                <c:if test="${course.getStatus()==1}">
                                    <div class="course_cno"><span>课程状态：已运行课程</span></div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="col-md-3 column">
            <script>
                function arrange() {
                    var cnovalue=$("#arrange_cno").val();
                    var tnovalue=$("#arrange_tno").val();
                    var capacityvalue=$("#arrange_capacity").val();
                    var start=$("#startweek").val();
                    var end=$("#endweek").val();
                    var locationvalue=$("#location").val();
                    var rtime=$("#runtime").val();
                    if(cnovalue==""||tnovalue==""||capacityvalue==""||start==""||end==""||locationvalue==""||rtime=="")
                        alert("请您填写完整信息");
                    else{
                        $.ajax({
                            url:"${pageContext.request.contextPath}/arrangecourse",
                            data:{cno:cnovalue,tno:tnovalue,capacity:capacityvalue,startweek:start,
                                endweek:end,location:locationvalue,runtime:rtime},
                            type:'post',
                            success:function(data,textStatus,XMLHttpRequest){
                                alert("安排上了！");
                                value1="#operation-"+cnovalue;
                                value2="#status-"+cnovalue;
                               $(value1).css("display","none");
                               $(value2).html("<span>课程状态：已运行课程</span>");
                               closedetail();
                            },
                            error: function(xhr,status,error) {
                                if (xhr.status == 500) {
                                    alert("服务器异常！");
                                }
                                else if (xhr.status == 301) {
                                    alert("请检查学期表！");
                                }
                                else if (xhr.status == 404) {
                                    alert("没有找到老师的相关信息")
                                }
                            }
                        });
                    }
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
<script>
    function inputarrange(cno) {
        $("#arrange_cno").val(cno);
        document.getElementById("background").setAttribute("style","display:block;")
        $("#modal-container-28819").addClass("in");
        document.getElementById("modal-container-28819").setAttribute("style","display:block;");
    }
</script>
<div class="col-md-12 column">
    <%--<a id="modal-28819" href="#modal-container-28819" role="button" class="btn" data-toggle="modal">触发遮罩窗体</a>--%>
    <div class="modal fade" id="modal-container-28819" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="myModalLabel">
                        课程安排
                    </h3>
                </div>
                <div class="modal-body">
                        <input type="hidden" name="arrange_cno" value=""  id="arrange_cno"/>
                        <input type="text" name="arrange_tno" class="form-control arragementinfo"
                               placeholder="输入教师工号" style="height: 34px;" id="arrange_tno" required="required"/>
                        <input type="text" name="capacity" class="form-control arragementinfo"
                               placeholder="输入班级容量" style="height: 34px;" id="arrange_capacity" required="required"/>
                        <input type="text" name="startweek" class="form-control arragementinfo" id="startweek"
                               placeholder="教学起始周" style="height: 34px;width: 37%;margin-right: 5%;display: inline-block"
                               required="required" />
                        <input type="text" name="endweek" class="form-control arragementinfo" id="endweek"
                               placeholder="教学结束周" style="height: 34px; width: 37%;display: inline-block" required="required"/>
                        <input type="text" name="location" class="form-control arragementinfo" id="location"
                               placeholder="上课地点" style="height: 34px;" required="required"/>
                        <input type="text" name="runtime" class="form-control arragementinfo" id="runtime"
                               placeholder="1-3-5 表示周一第三节课到第五节课，一周多节用 % 分开" style="height: 34px;"
                               required="required"/>
                        <div style="text-align: right;">
                            <button class="btn btn-default"
                                    onclick="arrange()">安排课程</button>
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