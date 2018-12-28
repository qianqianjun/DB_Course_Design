<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="../include/htmlHead.jsp">
    <jsp:param name="title" value="课程分数"></jsp:param>
</jsp:include>
<div class="container padding-150">
    <div class="row" style="padding-top: 60px;padding-left:25px;">
        <div class="detail_title">
            课程学生分数管理
        </div>
        <div class="col-md-8 column">
            <div class="panel-group" id="panel-805813">
                <c:forEach items="${studentlist}" var="student">
                    <div class="panel panel-default" id="course-${student.getSno()}">
                        <div class="panel-heading">
                            <a class="panel-title collapsed" data-toggle="collapse"
                               data-parent="#panel-805813" href="#panel-element-${student.getSno()}">
                                <span>${student.getSno()}</span>
                                <span style="float: right;">${student.getSname()}</span>
                            </a>
                        </div>
                        <div id="panel-element-${student.getSno()}" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="course_cno"><span>课程号：</span>${student.getCno()}</div>
                                <div class="course_college"><span>学期：</span>${student.getSemester()}</div>
                                <div class="course_college" id="grade-${student.getSno()}"><span>分数：</span>${student.getGrade()}</div>
                                <c:if test="${student.getGrade()==null}">
                                    <input type="text" class="form-control" style="display: inline-block;width: 200px;" id="sub-${student.getSno()}">
                                    <button class="btn btn-default" style="float:right;"
                                            onclick="change('${student.getSno()}','${student.getSemester()}',
                                                    '${student.getCno()}','new',this)">提交分数</button>
                                </c:if>
                                <c:if test="${student.getGrade()!=null}">
                                    <input type="text"  value="${student.getGrade()}" id="sub-${student.getSno()}"
                                           class="form-control" style="display: inline-block;width: 200px;">
                                    <button class="btn btn-default" style="float:right;"
                                            onclick="change('${student.getSno()}','${student.getSemester()}',
                                                    '${student.getCno()}','fix',this)">修改分数</button>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty studentlist}">
                    <h3>当前课程无学生选课</h3>
                </c:if>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function change(sno,semester,cno,type,self) {
        var grade=document.getElementById("grade-"+sno);
        var input=document.getElementById("sub-"+sno);
        if(input.value.length==0)
        {
            alert("请您填好分数！");
            return false;
        }
        var gradeval=input.value;
        if(input.value<0||input.value>100)
        {
            alert("分数是不是填错了？");
            return false;
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/coursegrademanage",
            data:{sno:sno,semester:semester,cno:cno,grade:gradeval},
            type:"post",
            success:function (data,textStatus,XMLHttpRequest) {
                grade.innerHTML="<span>分数：</span>"+gradeval;
                if(type=="new")
                {
                    self.setAttribute("onclick","change('"+sno+"','"+semester+"','"+cno+"','fix',this)");
                    self.innerText="修改分数";
                    alert("提交成功！");
                }
                else
                {
                    alert("修改成功！");
                }
            },
            errorr:function () {
                alert("出错！");
            }
        })
    }
</script>