<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
    function check() {
        newpassword=document.getElementById("password1").value;
        oldpassword=document.getElementById("password2").value;
        if(newpassword==oldpassword)
            return true;
        else
            alert("两次密码不一致！请确认后再次输入")
            return false;
    }
</script>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix" style="margin: 5px;margin-top: 30px">
                <div class="col-md-4 column">
                    <h3 style="margin-bottom: 20px">
                        密码修改
                    </h3>
                    <form role="form" onsubmit="return check()" action="${pageContext.request.contextPath}/changePasswordServlet" method="post" style="padding-left: 20px">
                        <input type="hidden" value="<%=request.getParameter("type")%>" name="type">
                        <input type="hidden" value="<%=request.getParameter("account")%>" name="account">
                        <div class="form-group">
                            <label for="oldpassword">输入旧密码</label>
                            <input type="password" class="form-control" id="oldpassword" required="required" name="oldpassword"/>
                        </div>
                        <div class="form-group">
                            <label for="password1">输入新密码</label>
                            <input type="password" class="form-control" id="password1" required="required" name="newpassword"/>
                        </div>
                        <div class="form-group">
                            <label for="password2">确认新密码</label>
                            <input type="password" class="form-control" id="password2" required="required"/>
                        </div>
                        <button type="submit" class="btn btn-default" onsubmit="check()">提交修改</button>
                    </form>
                </div>
                <div class="col-md-4 column"></div><div class="col-md-4 column"></div>
            </div>
        </div>
    </div>
</div>
