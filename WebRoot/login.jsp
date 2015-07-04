<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登陆</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/md5.js"></script>
<link href="styles/login.css" rel="stylesheet" type="text/css" />
<!-- Theme Start -->
<link href="themes/blue/styles.css" rel="stylesheet" type="text/css" />
<!-- Theme End -->
<style type="text/css">
#footer {
	font-size: 12px;

	clear: both;
	background: url(../img/bg_footer.png) repeat-x bottom;
	text-shadow: 1px 1px 1px #fff;
	text-align:center;
}
</style>

</head>
<body>
	<div id="logincontainer">
    	<div id="loginbox">
        	<div id="loginheader">
            	四川铁航客户关系管理系统
            </div>
            <div id="innerlogin">
            	<s:form action="login" method="post" id="loginForm">                	
                	<p>账号:</p>
              		<s:textfield name="account" cssClass="logininput"/>                	
                    <p>密码:</p>                    
                   	<s:password name="password" cssClass="logininput" id="password"/>
                   	<p><s:property value="errorMessage"/></p>                 	                  	
                   	<p>
                   		<input type="submit" class="loginbtn" value="登陆" onclick="return do_md5('loginForm');" />
                		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                		<a href="${pageContext.request.contextPath}/index">
                			<img src="${pageContext.request.contextPath}/img/user.png"/>&nbsp;已登录
                		</a>
                	</p>
                	<p id="footer">                	                                   	
                	&copy; Copyright 2013 R7-2X开发小组
                   	</p>
                   	<p ></p>
                </s:form>
            </div>
        </div>
        <img src="img/login_fade.png" alt="Fade" />
    </div>
</body>
</html>