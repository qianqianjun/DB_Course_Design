<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>盗版教务系统</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<div class="wrap">
    <div class="container" style="max-width:none;">
        <div class="login_form">
            <form action="LoginServlet" method="post" class="loginForm">
                <span class="input-tips">用户登录</span>
                <div class="input-group" style="height:44px; margin-top: 5px;">
                    <input type="text" class="form-control " name="account" value="" placeholder="请输入学号/工号" style="height:44px;" required="required">
                </div>
                <div class="input-group input-password" style="height:44px;">
                    <input type="password" class="form-control " name="password" placeholder="请输入密码" style="height:44px" required="required">
                </div>
                <div class="form-group">
                    <select class="form-control" name="type">
                        <option value="student">学生</option>
                        <option value="teacher">教师</option>
                        <option value="root">管理员</option>
                    </select>
                </div>
                <div class="form-group" style=" margin-top: 5px;"></div>
                <div style="padding-bottom:20px;">
                    <input name="login-button" class="btn btn-warning col-lg-12"
                           style="font-size:18px;" value="登&nbsp;&nbsp;&nbsp;&nbsp;录" type="submit">
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 版权 -->
<!-- url -->
<footer class="footer">
    <div class="container">
        Copyright© 北京化工大学<br>
        地址：北京市朝阳区北三环东路15号 | 邮编：100029
    </div>
</footer>
</body>
</html>