<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:include page="include/htmlHead.jsp">
    <jsp:param name="title" value="个人信息维护"></jsp:param>
</jsp:include>
<%request.setCharacterEncoding("utf-8");%>
<style type="text/css">
    #general h3{
        line-height: 100px;
    }
    #course h3{
        line-height: 100px;
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
<c:if test="${userinfo.type=='teacher'}">
    <jsp:include page="include/teacherheader.jsp">
        <jsp:param name="tname" value="${userinfo.tname}"></jsp:param>
    </jsp:include>
</c:if>
<c:if test="${userinfo.type=='student'}">
    <jsp:include page="include/studentheader.jsp">
        <jsp:param name="sname" value="${userinfo.sname}"></jsp:param>
    </jsp:include>
</c:if>
<jsp:include page="include/managepersonalinfobody.jsp">
    <jsp:param name="haah" value="hehe"></jsp:param>
</jsp:include>
<%@include file="include/htmlFooter.jsp"%>