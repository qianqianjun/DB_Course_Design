<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%request.setCharacterEncoding("utf-8");%>
<div class="container" style="margin-top: 30px;padding-left: 40px;">
    <div class="row clearfix" style="margin-bottom: 30px;">
        <div class="col-md-6 column">
            <h3>
                <c:if test="${userinfo.type=='teacher'}"><b>教师工号:</b>${userinfo.tno}</c:if>
                <c:if test="${userinfo.type=='student'}"><b>学生学号:</b>${userinfo.sno}</c:if>
            </h3>
        </div>
        <div class="col-md-6 column">
            <h3>
                <c:if test="${userinfo.type=='teacher'}"><b>教师姓名:</b>${userinfo.tname}</c:if>
                <c:if test="${userinfo.type=='student'}"><b>学生姓名:</b>${userinfo.sname}</c:if>
            </h3>
        </div>
    </div>
    <c:if test="${userinfo.type=='student'}">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <ul class="nav nav-tabs">
                <li class="act" id="gene" onclick="change(this)">
                    <a href="#">基本信息</a>
                </li>
                <li>
                    <a href="#" id="cour" onclick="change(this)">其他信息</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="row clearfix" id="general" style="display: block;">
        <div class="col-md-4 column">
            <h3>
               学号：${userinfo.getSno()}
            </h3>
            <h3>
                学院：${userinfo.getCollege()}
            </h3>
            <h3>
                政治面貌：${userinfo.getPoliticalstatus()}
            </h3>
        </div>
        <div class="col-md-4 column">
            <h3>
                姓名：${userinfo.getSname()}
            </h3>
            <h3>
                专业：${userinfo.getMajor()}
            </h3>
            <h3>
                民族：${userinfo.getNation()}
            </h3>
        </div>
        <div class="col-md-4 column">
            <h3>
                性别：${userinfo.getSno()}
            </h3>
            <h3>
                班级：${userinfo.getKlass()}
            </h3>
            <h3>
                外语语种：${userinfo.getForeignlanguage()}
            </h3>
        </div>
    </div>
    <div class="row clearfix" id="course" style="display: none;">
        <div class="col-md-4 column">
            <h3>
                联系电话：${userinfo.getPhone()}
            </h3>
            <h3>
                微信：${userinfo.getWechat()}
            </h3>
            <h3>
                出生日期：${userinfo.getBirthday()}
            </h3>
        </div>
        <div class="col-md-4 column">
            <h3>
                QQ：${userinfo.getQq()}
            </h3>
            <h3>
                籍贯：${userinfo.getProvince()}
            </h3>
            <h3>
                毕业高中：${userinfo.getHighschool()}
            </h3>
        </div>
        <div class="col-md-4 column">
            <h3>
                邮箱：${userinfo.getEmail()}
            </h3>
            <h3>
                住址：${userinfo.getCity()}
            </h3>
        </div>
    </div>
    </c:if>
    <c:if test="${userinfo.type=='teacher'}">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <ul class="nav nav-tabs">
                    <li class="act" id="gene" onclick="change(this)">
                        <a href="#">基本信息</a>
                    </li>
                    <li>
                        <a href="#" id="cour" onclick="change(this)">其他信息</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row clearfix" id="general" style="display: block;">
            <div class="col-md-4 column">
                <h3>
                    工号：${userinfo.getTno()}
                </h3>
                <h3>
                    工作年份：${userinfo.getComeyear()}
                </h3>
                <h3>
                    毕业院校：${userinfo.getGraduateschool()}
                </h3>
            </div>
            <div class="col-md-4 column">
                <h3>
                    姓名：${userinfo.getTname()}
                </h3>
                <h3>
                    职称：${userinfo.getRank()}
                </h3>
                <h3>
                    学位：${userinfo.getDegree()}
                </h3>
            </div>
            <div class="col-md-4 column">
                <h3>
                    性别：${userinfo.getSex()}
                </h3>
                <h3>
                    部门：${userinfo.getTdept()}
                </h3>
                <h3>
                    办公室地址：${userinfo.getLocation()}
                </h3>
            </div>
        </div>
        <div class="row clearfix" id="course" style="display: none;">
            <div class="col-md-4 column">
                <h3>
                    联系电话：${userinfo.getPhone()}
                </h3>
                <h3>
                    邮箱：${userinfo.getEmail()}
                </h3>
                <h3>
                    研究方向：
                </h3>
            </div>
            <div class="col-md-4 column">
                <h3>
                    微信号：${userinfo.getWechat()}
                </h3>
                <h3>
                    籍贯：${userinfo.getProvince()}
                </h3>
            </div>
            <div class="col-md-4 column">
                <h3>
                    QQ号：${userinfo.getQq()}
                </h3>
                <h3>
                    家庭住址：${userinfo.getCity()}
                </h3>
            </div>
        </div>
    </c:if>
    <div class="row clearfix" style="margin-bottom: 30px;">
        <div class="col-md-2 column">
            <div class="form-group">
                <h3 style="margin-top: 10px;margin-bottom: 20px;">修改资料</h3>
                <c:if test="${userinfo.type=='student'}">
                <select class="form-control" id="kind">
                    <option value="sname">姓名</option>
                    <option value="politicalstatus">政治面貌</option>
                    <option value="phone">联系电话</option>
                    <option value="qq">QQ</option>
                    <option value="wechat">微信</option>
                    <option value="city">住址</option>
                </select>
                <input type="hidden" value="student" id="identity">
                <input type="hidden" value="${userinfo.getSno()}" id="account">
                </c:if>
                <c:if test="${userinfo.type=='teacher'}">
                    <select class="form-control" id="kind">
                        <option value="sname">姓名</option>
                        <option value="rank">职称</option>
                        <option value="location">办公室地址</option>
                        <option value="qq">QQ</option>
                        <option value="wechat">微信号</option>
                        <option value="phone">联系电话</option>
                        <option value="city">家庭住址</option>
                        <option value="direction">研究方向</option>
                    </select>
                    <input type="hidden" value="teacher" id="identity">
                    <input type="hidden" value="${userinfo.getTno()}" id="account">
                </c:if>
            </div>
        </div>
        <div class="col-md-2 column">
            <div class="form-group">
                <input class="form-control" type="text" id="value" placeholder="输入要修改的值" style="height: 34px;margin-top: 56px;">
            </div>
        </div>
        <div class="col-md-2 column">
            <div class="form-group">
                <input type="button"
                       value="提交修改"
                       class="btn btn-default" onclick="submit()"
                       style="height: 34px;margin-top: 56px;">
            </div>
        </div>
        <div class="col-md-6 column">
        </div>
    </div>
</div>
<script>
    function submit() {
        var valueval=$("#value").val();
        var kindval=$("#kind").val();
        var identityval=$("#identity").val();
        var accountval=$("#account").val();
        if(valueval=="")
        {
            alert("请您填入要修改的信息！");
        }
        else
        {
            $.ajax({
                url:"${pageContext.request.contextPath}/changeinfo",
                data:{kind:kindval,identity:identityval,value:valueval,account:accountval},
                type:'post',
                success:function(data,textStatus,XMLHttpRequest){
                    alert("修改成功！请重新登录更新信息！");
                },
                error: function(xhr,status,error) {
                    if (xhr.status == 500) {
                        alert("服务器异常！");
                    }
                    else{
                        alert("插入失败！");
                    }
                }
            });
        }
    }
</script>
