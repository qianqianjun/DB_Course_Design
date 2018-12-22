<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%= request.getParameter("title")%></title>
    <style type="text/css">
        .active{font-weight: bolder;}
        #navbar-tabs li{ margin-top: 2px;}
        #navbar-tabs li a{ border-top: 2px solid transparent;}
        #navbar-tabs li.active a{border-top: 2px solid #0770cd;}
    </style>
    <!--jQuery核心框架库 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/error.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/zftal-ui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.extends.contact-min.js" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/add.css">
</head>
<body class="body-container">
<c:if test="${empty userinfo}">
<script type="text/javascript">
    alert("登录已经过期！");
    window.location.href="${pageContext.request.contextPath}/index.jsp";
</script>
</c:if>
