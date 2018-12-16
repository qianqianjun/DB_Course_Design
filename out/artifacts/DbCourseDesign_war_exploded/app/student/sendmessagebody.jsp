<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%request.setCharacterEncoding("utf-8");%>
<style>
    .content{
        width:80%;
        height: 300px;
        font-size: 15px;
    }
</style>
<script>
    function check() {
        var len=document.getElementById("Message").value.length;
        if(len==0)
        {
            alert("请您输入内容");
            return false;
        }
        else
        {
            return true;
        }
    }
</script>
<div class="container">
    <div class="row clearfix" style="margin-top: 30px;padding-left: 20px">
        <div class="col-md-12 column">
            <h3>
                输入反馈的内容
            </h3>
            <form role="form" method="post" onsubmit="return check()" action="${pageContext.request.contextPath}/sendMessageServlet">
                <input type="hidden" name="sno" value="<%=request.getParameter("sno")%>">
                <input type="text" name="title" class="help_message_title" placeholder="输入问题主题描述" required="required">
                <div class="form-group">
                    <textarea id="message" class="content" name="content" placeholder="输入问题详细描述" required="required"></textarea>
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
        </div>
    </div>
</div>
