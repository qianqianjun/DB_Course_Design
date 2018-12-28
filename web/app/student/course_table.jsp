<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="../include/htmlHead.jsp">
    <jsp:param name="title" value="学生课表查询"></jsp:param>
</jsp:include>
<div class="container padding-150">
    <div class="row" style="padding-top: 60px;padding-left:25px;">
        <div class="detail_title">
            学生课表查询
        </div>
        <div class="col-md-8 column">
            <div class="new_course_search_div">
                <label style="line-height: 100%;margin-right: 10px;">选择学期: </label>
                <select class="form-control temp" id="semester">
                    <c:forEach items="${semesterlist}" var="se">
                        <option value="${se}">${se}</option>
                    </c:forEach>
                </select>
                <button type="button"
                        class="btn btn-default search_btn" onclick="search()">查看课表</button>
            </div>
            <div class="course_list" id="course_list" style="width:80%;">
            </div>
        </div>
        <div class="col-md-4 column">
        </div>
    </div>
    <div class="row main"></div>
</div>
<script>
    function search() {
        var semester =document.getElementById("semester").value;
        var cname=document.getElementById("cname").value;
        var cno=document.getElementById("cno").value;
        $.ajax({
            url:"${pageContext.request.contextPath}/gradelist",
            data:{semester:semester,cname:cname,cno:cno},
            type:'post',
            success:function (data,textStatus,XMLHttpRequest) {
                var jsonarr=JSON.parse(data);
                var parent=document.getElementById("course_list");
                parent.innerHTML="";
                for(var i=0;i<jsonarr.length;i++)
                {
                    var item=document.createElement("div");
                    item.setAttribute("class","grade_item");
                    item.innerHTML="<div class='item semester'>"+jsonarr[i].semester+"</div>" +
                        "<div class='item cno'>"+jsonarr[i].cno+"</div>" +
                        "<div class='item cname'>"+jsonarr[i].cname+"</div>" +
                        "<div class='item grade'>"+jsonarr[i].grade+"</div>";
                    parent.append(item);
                }
                if(jsonarr.length==0)
                {
                    parent.innerHTML="<h2>没有查询到结果</h2>";
                }
            },
            error:function (xhr,status,error){
                alert("操作失败！");
            }
        });
    }
</script>
<style>
    .temp{
        display: inline-block;
        width: 22%;
        margin-right: 20px;
    }
</style>