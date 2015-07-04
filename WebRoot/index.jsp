<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<link href="${pageContext.request.contextPath}/styles/layout.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/styles/wysiwyg.css" rel="stylesheet" type="text/css" />
<!-- Theme Start -->
<link href="${pageContext.request.contextPath}/themes/blue/styles.css" rel="stylesheet" type="text/css" />
</head>
<body id="homepage">
	<div id="header">
    	<a href="" title=""><img src="${pageContext.request.contextPath}/img/cp_logo.png" alt="四川铁航客户关系管理系统logo" class="logo" /></a>
    	<jsp:include flush="true" page="/include/clock.jsp" /> 
    </div>        
    <!-- Top Breadcrumb Start -->
    <div id="breadcrumb">
    	<!-- <ul>	
        	<li><img src="${pageContext.request.contextPath}/img/icons/icon_breadcrumb.png" alt="Location" /></li>
        </ul>
         -->
    </div>
    <!-- Top Breadcrumb End -->
     
    <!-- Right Side/Main Content Start -->
    <div id="rightside">

        <!-- Alternative Content Box Start -->
        <div class="contentcontainer">
            <div class="headings altheading">
                <h2>欢迎使用！</h2>
            </div>
            <div class="contentbox">
					<div align="center"
						style="height:320px;text-align:left;background:url('${pageContext.request.contextPath}/img/index_logo.png') no-repeat right ; background-size:30%">
						<div class="dropcap" align="left">
							创新、突破、发展、提升
						</div>
						<br />
						<br />
						<br />
						<br />
						<br />
						<h2 style="margin-bottom: 15px;">
							工作宣言:
						</h2>
						<ul class="list">
							<li>
								我是铁航人，我有梦想，我要创造，我要成功！我勇于接受挑战，我要努力成为优秀员工！
							</li>
							<li>
								我是我自己的主人，我更是卓越的铁航人！昨天的最好表现，是今天的最低要求。
							</li>
							<li>
								从这一刻起，我要热情工作，激情奉献！今天，我保证百分百完成全部工作！
							</li>
							<li>
								我能，我能，我一定能！立即行动、开始工作、全力以赴！
							</li>
						</ul>
					</div>
				</div>
        </div>
        <div style="clear:both;"></div>
        <div id="footer">&copy; Copyright 2013 R7-2X开发小组</div>

    </div>
    <!-- Right Side/Main Content End -->
    
    <!-- Left Dark Bar Start -->
    <div id="leftside">
    	<jsp:include flush="true" page="/include/user.jsp"></jsp:include> 
        <jsp:include flush="true" page="/include/menu.jsp"></jsp:include> 
        
	</div>
    <!-- Left Dark Bar End --> 
    
    <!-- Notifications Box/Pop-Up Start --> 
    
    <!-- Notifications Box/Pop-Up End --> 
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/enhance.js"></script>	
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/excanvas.js'></script>
	<script type='text/javascript' src='${pageContext.request.contextPath}/scripts/jquery.min.js'></script>
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/jquery-ui.min.js'></script>
	<script type='text/javascript' src='${pageContext.request.contextPath}/scripts/jquery.wysiwyg.js'></script>
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/visualize.jQuery.js'></script>
    <script type="text/javascript" src='${pageContext.request.contextPath}/scripts/functions.js'></script>
    <script type="text/javascript" src='${pageContext.request.contextPath}/scripts/javascript-function.js' charset="utf-8"></script>
    
</body>
</html>
