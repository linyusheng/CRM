<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
		<!--link href='http://fonts.googleapis.com/css?family=Creepster|Audiowide' rel='stylesheet' type='text/css'-->
		<link href='${pageContext.request.contextPath}/styles/error.css' rel='stylesheet' type='text/css'>
		
		<title>错误页面-404</title>
	</head>
	<body>
		
		<p class="error-code">
			404
		</p>
		<p class="not-found"><br/>未找到</p>
		<div class="clear"></div>
		<div class="content">
			Sorry,找不到您想要访问的页面.<br/>
			<br/><a href="${pageContext.request.contextPath}/index">返回首页</a><br/>
			<br/>
			<a href="${pageContext.request.contextPath}/login">返回登录</a>
		</div>
	</body>
</html>
