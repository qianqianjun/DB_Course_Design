<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="footerID" class="footer" style="position: absolute;bottom: 0px;width: 100%;">
    <p>数据库原理课程设计  高谦   计科1601班 </p>
</div>
<style type="text/css">
    .icon-div {
        background-color: #48abea;
        color: #fff;
        font-size: 20px;
        font-weight: 600;
        text-align: center;
        width: 48px;
        height: 48px;
        line-height: 48px;
        border-radius: 100%;
        margin: auto;
    }
    .index_wdyy ul li h5{
        height: 60px;
        overflow: hidden;
    }

    .list-unstyled a{
        text-decoration: none;
    }
    .index_rctx{
        height:562px;
    }
    .index_rctx .table-responsive{
        height: 240px;
        overflow-y: hidden;
    }
</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.validate-min.css">
<script type="text/javascript">
    jQuery(function($){
        $('[data-toggle*="validation"]').trigger("validation");
    });
</script>
</body>
</html>
