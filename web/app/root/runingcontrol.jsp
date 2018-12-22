<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="../include/htmlHead.jsp">
    <jsp:param name="title" value="选课运行控制中心"></jsp:param>
</jsp:include>
<style>
    .temp{
        display: inline-block;
        width: 20%;
        margin-right: 20px;
    }
</style>
<script>
    var select_list;
    var majors=[["计算机科学与技术","信息科学与技术","测控技术与仪器","自动化","数字媒体"],["物理学","应用化学","电子科学与技术","数学","英语"],
        ["化学工程与工艺","能源化学工程","环境工程"],["安全工程","机械工程及其自动化","过程装备与控制过程","工业设计"],["材料学","材料加工工程","高分子物理与化学"]];
    function changeMajor(){
        var college=document.getElementById("college_search");
        var major=document.getElementById("major_search");
        var list=majors[college.selectedIndex-1];
        major.options.length=0;
        if(major!=null) {
            for (var i = 0; i < list.length; i++) {
                major.add(new Option(list[i], list[i]));
                major.children[0].setAttribute("selected", "selected");
            }
        }
    }
    function search_list() {
        var major=document.getElementById("major_search").value;
        var majorvalue="all"
        if(major.length!=0)
            majorvalue=major;
        var semesterval=document.getElementById("semester_search").value;
        var statusvalue=document.getElementById("status_search").value;
        $.ajax({
            url:"${pageContext.request.contextPath}/searchselectlist",
            data:{semester:semesterval,major:majorvalue,status:statusvalue},
            type:"post",
            success:function (data,textStatus,XMLHttpRequest) {
                jsonarr=JSON.parse(data);
                window.select_list=jsonarr;
                var course_list=document.getElementById("course_list");
                course_list.innerHTML="";
                for(var i=0;i<jsonarr.length;i++)
                {
                    select_list_item=document.createElement("div");
                    major_name=document.createElement("div");
                    semester_name=document.createElement("div");
                    control=document.createElement("div");
                    select_list_item.setAttribute("class","select_list_item");
                    major_name.setAttribute("class","major_name");
                    semester_name.setAttribute("class","semester_name");
                    control.setAttribute("class","select_list_control");
                    major_name.innerText=jsonarr[i].major;
                    semester_name.innerText=jsonarr[i].semester;
                    if(jsonarr[i].status==1)
                    {
                        stop_btn=document.createElement("button");
                        stop_btn.setAttribute("class","btn btn-default");
                        stop_btn.setAttribute("onclick","stoprun('"+jsonarr[i].semester+"','"+jsonarr[i].major+"',this)");
                        stop_btn.innerText="停止";
                        control.append(stop_btn);
                    }
                    else
                    {
                        start_btn=document.createElement("button");
                        start_btn.setAttribute("class","btn btn-default");
                        start_btn.setAttribute("onclick","startrun('"+jsonarr[i].semester+"','"+jsonarr[i].major+"',this)");
                        start_btn.innerText="运行";
                        control.append(start_btn);
                    }
                    del_btn=document.createElement("button");
                    del_btn.setAttribute("class","btn btn-default");
                    del_btn.setAttribute("onclick","delitem("+JSON.stringify(jsonarr[i])+",this)");
                    del_btn.setAttribute("style","margin-left:10px;")
                    del_btn.innerText="删除";
                    control.append(del_btn);
                    select_list_item.append(major_name);
                    select_list_item.append(semester_name);
                    select_list_item.append(control);
                    course_list.append(select_list_item);
                }
            },
            error:function (xhr,status,error){
                alert("操作失败！");
            }});
    }
</script>
<div class="container padding-150">
    <div class="row" style="padding-top: 60px;padding-left:25px;">
        <div class="detail_title">
            选课运行控制中心
        </div>
        <div class="col-md-8 column">
            <div class="new_course_search_div">
                <label style="line-height: 100%;margin-right: 10px;">选择学院: </label>
                <select class="form-control temp" id="college_search" onchange="changeMajor()">
                    <option value="none">请选择</option>
                    <option value="信息科学与技术学院">信息科学与技术学院</option>
                    <option value="理学院">理学院</option>
                    <option value="化工学院">化工学院</option>
                    <option value="机电学院">机电学院</option>
                    <option value="材料学院">材料学院</option>
                </select>
                <label style="line-height: 100%;margin-right: 10px;">专业: </label>
                <select class="form-control temp" id="major_search" required="required">
                </select>
                <label style="line-height: 100%;margin-right: 10px;">学期: </label>
                <select class="form-control temp" id="semester_search" required="required">
                    <option value="all">全部</option>
                    <c:forEach items="${semester}" var="se">
                        <option value="${se}">${se}</option>
                    </c:forEach>
                </select>
                <br>
                <label style="line-height: 100%;margin-right: 10px;">运行状态: </label>
                <select class="form-control temp" id="status_search" required="required">
                    <option value="all">全部</option>
                    <option value="1">正在进行</option>
                    <option value="0">已经结束</option>
                </select>
                <button type="button" style="float: right;"
                        class="btn btn-default search_btn" onclick="search_list()">搜索清单</button>
            </div>
            <div class="course_list" id="course_list">
                
            </div>
        </div>
        <div class="col-md-4 column">
        </div>
    </div>
</div>
<script>
    function stoprun(semester,major,self) {
        $.ajax({
           url:"${pageContext.request.contextPath}/managerun",
           data:{type:"stop",semester:semester,major:major},
           type:'post',
           success:function (data,textStatus,XMLHttpRequest) {
               alert("操作成功");
               self.innerText="运行";
               self.removeAttribute("onclick");
               self.setAttribute("onclick","startrun('"+semester+"','"+major+"',this)");
           },
            error:function (xhr,status,error){
                alert("操作失败！");
            }
        });
    }
    function startrun(semester,major,self) {
        $.ajax({
            url:"${pageContext.request.contextPath}/managerun",
            data:{type:"start",semester:semester,major:major},
            type:'post',
            success:function (data,textStatus,XMLHttpRequest) {
                alert("操作成功");
                self.innerText="停止";
                self.removeAttribute("onclick");
                self.setAttribute("onclick","stoprun('"+semester+"','"+major+"',this)");
            },
            error:function (xhr,status,error){
                alert("操作失败！");
            }
        });
    }
    function delitem(str) {
        alert("删除有风险，暂时未做！");
    }
</script>