<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
    #general h3{
        line-height: 200px;
    }
    #course h3{
        line-height: 200px;
    }
    #course{
        padding-left: 30px;
    }
    #general{
        padding-left: 30px;
    }
    .act{
        font-weight: bolder;
    }
    .act a{
        color: #555;
        background-color: #fff;
        border: 1px solid #ddd;
        border-bottom-color: transparent;
    }
    .act a:hover{
        color: #555;
        background-color: #fff;
        border: 1px solid #ddd;
        border-bottom-color: transparent;
    }
</style>
<script type="text/javascript">
    function change(argu) {
        argu.setAttribute("class","act");
        if(argu.id=="gene") {
            document.getElementById("general").setAttribute("style", "display:block;");
            document.getElementById("course").setAttribute("style", "display:none;");
            document.getElementById("cour").setAttribute("class","no");
        }
        else {
            document.getElementById("course").setAttribute("style", "display:block;");
            document.getElementById("general").setAttribute("style","display:none;");
            document.getElementById("gene").setAttribute("class","no");
        }
    }
</script>
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
                    <a href="#" id="cour" onclick="change(this)">选课信息</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="row clearfix" id="general" style="display: block;">
        <div class="col-md-4 column">
            <h3>
                h3. 这是一套可视化布局系统.
            </h3>
            <h3>
                h3. 这是一套可视化布局系统.
            </h3>
        </div>
        <div class="col-md-4 column">
            <h3>
                h3. 这是一套可视化布局系统.
            </h3>
            <h3>
                h3. 这是一套可视化布局系统.
            </h3>
        </div>
        <div class="col-md-4 column">
            <h3>
                h3. 这是一套可视化布局系统.
            </h3>
            <h3>
                h3. 这是一套可视化布局系统.
            </h3>
        </div>
    </div>
    <div class="row clearfix" id="course" style="display: none;">
        <div class="col-md-4 column">
            <h3>
                课程信息
            </h3>
            <h3>
                课程信息
            </h3>
        </div>
        <div class="col-md-4 column">
            <h3>
                课程信息
            </h3>
            <h3>
                课程信息
            </h3>
        </div>
        <div class="col-md-4 column">
            <h3>
                课程信息
            </h3>
            <h3>
                课程信息
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
                        <a href="#" id="cour" onclick="change(this)">授课信息</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row clearfix" id="general" style="display: block;">
            <div class="col-md-4 column">
                <h3>
                    h3. 这是一套可视化布局系统.
                </h3>
                <h3>
                    h3. 这是一套可视化布局系统.
                </h3>
            </div>
            <div class="col-md-4 column">
                <h3>
                    h3. 这是一套可视化布局系统.
                </h3>
                <h3>
                    h3. 这是一套可视化布局系统.
                </h3>
            </div>
            <div class="col-md-4 column">
                <h3>
                    h3. 这是一套可视化布局系统.
                </h3>
                <h3>
                    h3. 这是一套可视化布局系统.
                </h3>
            </div>
        </div>
        <div class="row clearfix" id="course" style="display: none;">
            <div class="col-md-4 column">
                <h3>
                    教师课程信息
                </h3>
                <h3>
                    教师课程信息
                </h3>
            </div>
            <div class="col-md-4 column">
                <h3>
                    课程信息
                </h3>
                <h3>
                    课程信息
                </h3>
            </div>
            <div class="col-md-4 column">
                <h3>
                    课程信息
                </h3>
                <h3>
                    课程信息
                </h3>
            </div>
        </div>
    </c:if>
</div>
