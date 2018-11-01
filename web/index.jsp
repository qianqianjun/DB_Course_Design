<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>数据库原理课程设计</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/zftal-ui.css">
	<link rel="icon" href="http://jwglxt.buct.edu.cn/jwglxt/logo/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="http://jwglxt.buct.edu.cn/jwglxt/logo/favicon.ico" type="image/x-icon">
	<style type="text/css">
		.btn-lang{
			width: 76px;
    		border-color: #357ebd;
    		font-weight: bold;
    		height: 30px;
		}	
		.btn-lang-enabled {
			background-color: #428bca;
			color:#fff;
		}
		.btn-lang-disabled {
			background-color: #fff;
			color: #333;
		}
		.btn-lang-enabled:hover,.btn-lang-enabled:focus {
			color:#fff;
		}
		.btn-group>.btn-lang:last-child{
			border-top-right-radius: 3px;
			border-bottom-right-radius: 3px;
		}
	</style>
</head>
<body style="background:#fafafa;">
	<div class="container container_1170">
		<div class="row sl_log_top">
			<div class="col-sm-8 logo_1"><img src="images/logo_jw_d.png" style="margin-top:-3px">
				<span id="xtmc">北京化工大学教务管理系统</span>
			</div>
			<div class="col-sm-4 text-right hidden-xs">
			</div>
		</div>
		<div class="row sl_log_bor4">
			<div class="col-sm-8 hidden-xs sl_log_lf">
				<img class="img-responsive" src="images/login_bg_pic.jpg">
			</div>
			<div class="col-sm-4 sl_log_rt">
				<form class="form-horizontal" role="form" action="LoginServlet" method="post" name="myform">
					<h5>用户登录</h5>
					<input type="text" style="display: none;" autocomplete="off">
					<input type="password" style="display: none;" autocomplete="off">
						<p style="display: none;" id="tips" class="bg_danger sl_danger">
						</p>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon"><img src="images/log_ic01.png" width="16" height="16"></div>
							<input type="text" class="form-control" name="yhm" id="yhm" value="" placeholder="用户名" onblur="" autocomplete="off" required="required">
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon"><img src="images/log_ic02.png" width="16" height="16"></div>
							<%--<input type="password" name="mm" id="hidMm" style="display:none" autocomplete="off">--%>
							<input type="password" class="form-control" name="mm" id="mm" value="" placeholder="密码" autocomplete="off" required="required">
						</div>
					</div>
					<div class="form-group"> 
					</div>
					 <div class="form-group" id="myDiv">
						   <a href="#" target="_blank" onclick="alert('这也能忘？改不了，别找我！')">忘记密码了？</a>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block" id="dl">登 录</button>
					</div>		
				</form>
			</div>
		</div>
	</div>
<div id="footerID" class="footer">
	<p>数据库原理课程设计  高谦  计科1601班</p>
</div>
<script>

</script>
</body>
</html>