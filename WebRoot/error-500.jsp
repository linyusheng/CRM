<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
		<link href='${pageContext.request.contextPath}/styles/error.css' rel='stylesheet' type='text/css' />
		
		<title>错误页面-500</title>
	</head>
	<body>
		
		<p class="error-code">
			500
		</p>
		<p class="not-found"><br/>服务器错误</p>
		<div class="clear"></div>
		<div class="content">
			Sorry,服务器内部出现了错误.<br/>


			<p>异常信息：<s:property value="exception.message" /></p>
			<p>异常堆栈：<s:property value="exception.stackTrace" /></p>
			<br/><a href="${pageContext.request.contextPath }/index" />返回首页</a><br/>
			<br/><a href="${pageContext.request.contextPath }/login" />返回登录</a> 


		</div>
		
	</body>
	
	<p>异常：<s:property value="exception.message"/></p>
</html>
