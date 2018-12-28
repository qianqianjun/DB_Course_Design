<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="../include/htmlHead.jsp">
    <jsp:param name="title" value="学生课表查询"></jsp:param>
</jsp:include>
<style>
    .temp{display: inline-block;width: 22%;margin-right: 20px;}
    .main{background-color: #00d9ff0d;position:relative;}
    .jie{width:4%;display: inline-block;text-align: center; float:left;border: 0.5px solid #b7bec3;padding-top:5px;padding-bottom:5px;}
    .stage{width:5%;display: inline-block;text-align: center;float:left;border: 0.5px solid #b7bec3;padding-top:5px;padding-bottom:5px;}
    .weekhead{width:13%;float:left;display: inline-block;text-align: center;border: 0.5px solid #b7bec3;padding-top:5px;padding-bottom:5px;}
    .title{margin-bottom:20px;}

    .day{height:500px;}
    .evening{height:360px;}
    .day_title{text-align:center;width:5%;font-size:20px;float: left;display: inline-block;height:500px;line-height: 250px;font-size:30px;border: 0.5px solid #b7bec3;}
    .evening_title{text-align:center;width:5%;font-size:20px;float: left;display: inline-block;height:300px;line-height: 150px;font-size:30px;border: 0.5px solid #b7bec3;}
    .even_numset{width:4%;float:left;height:300px;border: 0.5px solid #b7bec3;}
    .numset{width:4%;float:left;height:500px;border: 0.5px solid #b7bec3;}
    .jie-item{height:100px;border-bottom: 0.5px solid #b7bec3;line-height: 100px;text-align: center;font-size:20px;font-weight:bolder;}
    .item-col{height:500px;width:13%;border: 0.5px solid #b7bec3;float:left;display: inline-block;}
    .item-col-evening{height:300px;width:13%;border: 0.5px solid #b7bec3;float:left;display: inline-block;}
    .each-col{position:absolute;top:77px;height:1300px;width:13%;}

    .item-class{position: absolute;width: 100%;height: 200px;text-align: center;border-top: 0.3px solid #b7bec3;border-bottom: 0.3px solid #b7bec3;}
    .content-class{width: 90%;display: inline-block;text-align: left;height: 140px;overflow: hidden;}
    .content-row{margin-top: 10px;}
    .content_tip{font-weight: bolder;}
</style>
<div class="container padding-150" id="body">
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
        </div>
    </div>
    <div id="tip">
        <h2>查询你的课表</h2>
    </div>
    <div class="row main" id="table" style="display: none;">
        <h3 class="title">2017-2018学年第一学期</h3>
        <div class="header">
            <div class="stage">时间段</div>
            <div class="jie">节次</div>
            <div class="weekhead">星期一</div>
            <div class="weekhead">星期二</div>
            <div class="weekhead">星期三</div>
            <div class="weekhead">星期四</div>
            <div class="weekhead">星期五</div>
            <div class="weekhead">星期六</div>
            <div class="weekhead">星期日</div>
        </div>
        <div class="day">
            <div class="day_title">
                上<br>午
            </div>
            <div class="numset">
                <div class="jie-item">1</div>
                <div class="jie-item">2</div>
                <div class="jie-item">3</div>
                <div class="jie-item">4</div>
                <div class="jie-item">5</div>
            </div>
            <div class="item-col">
                <div class="each-col" id="col-1">
                    <div class="item-class">
                        <div class="content-class">
                            <h5>名称</h5>
                            <div class="content-row"><span class='content_tip'>时间：</span></div>
                            <div class="content-row"><span class='content_tip'>地点：</span></div>
                            <div class="content-row"><span class='content_tip'>教师：</span></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item-col">
                <div class="each-col" id="col-2"></div>
            </div>
            <div class="item-col">
                <div class="each-col" id="col-3"></div>
            </div>
            <div class="item-col">
                <div class="each-col" id="col-4"></div>
            </div>
            <div class="item-col">
                <div class="each-col" id="col-5"></div>
            </div>
            <div class="item-col">
                <div class="each-col" id="col-6"></div>
            </div>
            <div class="item-col">
                <div class="each-col" id="col-7"></div>
            </div>
        </div>
        <div class="day">
            <div class="day_title">
                下<br>午
            </div>
            <div class="numset">
                <div class="jie-item">6</div>
                <div class="jie-item">7</div>
                <div class="jie-item">8</div>
                <div class="jie-item">9</div>
                <div class="jie-item">10</div>
            </div>
            <div class="item-col"></div>
            <div class="item-col"></div>
            <div class="item-col"></div>
            <div class="item-col"></div>
            <div class="item-col"></div>
            <div class="item-col"></div>
            <div class="item-col"></div>
        </div>
        <div class="evening">
            <div class="evening_title">
                晚<br>上
            </div>
            <div class="even_numset">
                <div class="jie-item">11</div>
                <div class="jie-item">12</div>
                <div class="jie-item">13</div>
            </div>
            <div class="item-col-evening"></div>
            <div class="item-col-evening"></div>
            <div class="item-col-evening"></div>
            <div class="item-col-evening"></div>
            <div class="item-col-evening"></div>
            <div class="item-col-evening"></div>
            <div class="item-col-evening"></div>
        </div>
    </div>

</div>
<script>
    function search() {
        var semester =document.getElementById("semester").value;
        var sno="${userinfo.getSno()}";
        $.ajax({
            url:"${pageContext.request.contextPath}/course_table",
            data:{semester:semester,sno:sno},
            type:'post',
            success:function (data,textStatus,XMLHttpRequest) {
                var jsonarr=JSON.parse(data);
                console.log(jsonarr);
                console.log(data);
                var colset=new Array();
                for(var i=1;i<=7;i++)
                    colset.push(document.getElementById("col-"+i));
                for(var i=0;i<jsonarr.length;i++)
                    colset[i].innerHTML="";
                if(jsonarr.length==0)
                {
                    document.getElementById("table").style.display="none";
                    var h3=document.createElement("h3");
                    h3.innerText="没有找到相关信息";
                    var tip=document.getElementById("tip");
                    tip.innerHTML="";
                    tip.style.display="block";
                    tip.appendChild(h3);
                }
                else
                {
                    document.getElementById("table").style.display="block";
                    document.getElementById("tip").style.display="none";
                    for(var i=0;i<colset.length;i++)
                        colset[i].innerHTML="";
                    for(var i=0;i<jsonarr.length;i++)
                    {
                        var div=document.createElement("div");
                        div.setAttribute("class","item-class");
                        var height=(jsonarr[i].endtime-jsonarr[i].begintime+1)*100;
                        var top=(jsonarr[i].begintime-1)*100;
                        div.style.height=""+height+"px";
                        div.style.top=""+top+"px";
                        var margintop=(height-140)/2;
                        var content_class=document.createElement("div");
                        content_class.setAttribute("class","content-class");
                        content_class.style.marginTop=""+margintop+"px";
                        var time="("+jsonarr[i].begintime+"-"+jsonarr[i].endtime+"节) ";
                        time+=""+jsonarr[i].weekbegin+"-"+jsonarr[i].weekend+"周";
                        content_class.innerHTML="<h5>"+jsonarr[i].cname+"</h5>" +
                            "<div class='content-row'><span class='content_tip'>时间：</span>"+time+"</div>" +
                            "<div class='content-row'><span class='content_tip'>地点：</span>"+jsonarr[i].location+"</div>" +
                            "<div class='content-row'><span class='content_tip'>教师：</span>"+jsonarr[i].tname+"</div>";
                        div.append(content_class);
                        var insertid=jsonarr[i].runday-1;
                        colset[insertid].append(div);
                    }
                }
            },
            error:function (xhr,status,error){
                alert("操作失败！");
            }
        });
    }
</script>