<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="../include/htmlHead.jsp">
    <jsp:param name="title" value="创建选课清单"></jsp:param>
</jsp:include>
<style>
    .temp{
        display: inline-block;
        width: 20%;
        margin-right: 20px;
    }
</style>
<script>
    var selection_set=new Array();
    var majors=[["计算机科学与技术","信息科学与技术","测控技术与仪器","自动化","数字媒体"],["物理学","应用化学","电子科学与技术","数学","英语"],
    ["化学工程与工艺","能源化学工程","环境工程"],["安全工程","机械工程及其自动化","过程装备与控制过程","工业设计"],["材料学","材料加工工程","高分子物理与化学"]];
    function changeMajor(){
        var college=document.getElementById("college_create");
        var major=document.getElementById("major_create");
        var list=majors[college.selectedIndex-1];
        major.options.length=0;
        if(major!=null) {
            for (var i = 0; i < list.length; i++) {
                major.add(new Option(list[i], list[i]));
                major.children[0].setAttribute("selected", "selected");
            }
        }
    }
    function cancle_select(id) {
        window.selection_set=window.selection_set.remove(window.selection_set.indexOf(id));
        document.getElementById("selection_list").removeChild(document.getElementById(id));
        console.log(window.selection_set);
    }
    function submit_to_db() {
        var num=document.getElementById("major_create").value.length;
        if(window.selection_set.length==0||num==0)
        {
            if(num==0)
                alert("请选择专业！");
            else
                alert("您没有选择任何的课程，请至少选择一门课程！");
        }
        else
        {
            var majorvalue=document.getElementById("major_create").value;
            $.ajax({
                url:"${pageContext.request.contextPath}/addselectlist",
                data:{semester:window.data_temp_global[0].semester,cno:JSON.stringify(window.selection_set),major:majorvalue},
                type:"post",
                success:function (data,textStatus,XMLHttpRequest) {
                    alert("创建成功，可以到运行控制界面进行查看！");
                    window.location.href="${pageContext.request.contextPath}/app/root/createlist.jsp";
                },
                error:function (xhr,status,error){
                    if(xhr.status==500)
                    {
                        alert("服务器故障，请联系开发者！");
                    }
                    else
                    {
                        alert("添加失败 !");
                    }
                }
            });
        }
    }
</script>
<div class="container padding-150">
    <div class="row" style="padding-top: 60px;padding-left:25px;">
        <div class="detail_title">
            创建选课清单
        </div>
        <div class="col-md-8 column">
            <div class="new_course_search_div">
                <label style="line-height: 100%;margin-right: 10px;">选择学院: </label>
                <select class="form-control temp" id="college_create" onchange="changeMajor()">
                    <option value="none">请选择</option>
                    <option value="信息科学与技术学院">信息科学与技术学院</option>
                    <option value="理学院">理学院</option>
                    <option value="化工学院">化工学院</option>
                    <option value="机电学院">机电学院</option>
                    <option value="材料学院">材料学院</option>
                </select>
                <label style="line-height: 100%;margin-right: 10px;">专业: </label>
                <select class="form-control temp" id="major_create" required="required">
                </select>
                <button type="button" class="btn btn-default search_btn" onclick="submit_to_db()">创建</button>
            </div>
            <div class="selection_list">
                <ul id="selection_list"></ul>
            </div>
            <input type="text" class="form-control tno-search" id="cno"
                   placeholder="课程号" style="height: 34px;"/>
            <input type="text" class="form-control tno-search" id="cname"
                   placeholder="课程名称" style="height: 34px;"/>
            <label style="line-height: 100%;margin-right: 10px;">开课学院: </label>
            <select class="form-control college-search" id="college">
                <option value="all">全部</option>
                <option value="信息科学与技术学院">信息科学与技术学院</option>
                <option value="化工学院">化工学院</option>
                <option value="材料学院">材料学院</option>
                <option value="机电学院">机电学院</option>
                <option value="理学院">理学院</option>
                <option value="文法学院">文法学院</option>
                <option value="经济管理学院">经济管理学院</option>
            </select>
            <button type="button" class="btn btn-default search_btn" onclick="getcourseinfo()">查询</button>
            <div class="add_title">
                <h3>学期</h3>
                <h3>课程号码</h3>
                <h3>课程名称</h3>
                <h3>容量</h3>
            </div>
            <div class="course_list" id="course_list">
            </div>
        </div>
        <div class="col-md-4 column">
        </div>
    </div>
</div>
<script>
    var data_temp_global;
    function add_to_selection_list(i) {
        if (window.selection_set.indexOf(window.data_temp_global[i].cno) == -1) {
            window.selection_set.push(window.data_temp_global[i].cno)
            var selection_list = document.getElementById("selection_list");
            Li = document.createElement("li");
            Li.innerText = window.data_temp_global[i].cname;
            Li.setAttribute("id", window.data_temp_global[i].cno);
            Li.setAttribute("onclick", "cancle_select(this.id)");
            selection_list.append(Li);
        }
        else {
            alert("您已经添加了该课程！");
        }
    }
    function getcourseinfo() {
        var cnovalue=$("#cno").val();
        var collegevalue=$("#college").val();
        var cnamevalue=$("#cname").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/getcourseinfo",
            data:{cno:cnovalue,college:collegevalue,cname:cnamevalue},
            type:'post',
            success:function(data,textStatus,XMLHttpRequest){
                var jsonarr=JSON.parse(data);
                window.data_temp_global=jsonarr;
                var course_list=document.getElementById("course_list");
                course_list.innerHTML="";
                for(var i=0;i<jsonarr.length;i++)
                {
                    var course_item=document.createElement("div");
                    var add_semester=document.createElement("div");
                    var add_cno=document.createElement("div");
                    var add_cname=document.createElement("div");
                    var add_capacity=document.createElement("div");
                    course_item.setAttribute("class","course_item");
                    course_item.setAttribute("onclick","add_to_selection_list("+i+")");
                    add_capacity.setAttribute("class","add_capacity");
                    add_cname.setAttribute("class","add_cname");
                    add_cno.setAttribute("class","add_cno");
                    add_semester.setAttribute("class","add_semester");
                    add_semester.innerText=jsonarr[i].semester;
                    add_cname.innerText=jsonarr[i].cname;
                    add_cno.innerText=jsonarr[i].cno;
                    add_capacity.innerText=jsonarr[i].capacity;
                    course_item.append(add_semester);
                    course_item.append(add_cno);
                    course_item.append(add_cname);
                    course_item.append(add_capacity);
                    document.getElementById("course_list").append(course_item);
                }
                if(jsonarr.length==0)
                {
                    alert("没有找到相关信息！");
                }
            },
            error: function(xhr,status,error) {
                if (xhr.status == 500) {
                    alert("服务器异常！");
                }
                else
                {
                    alert("操作失败！");
                }
            }
        });
    }
</script>