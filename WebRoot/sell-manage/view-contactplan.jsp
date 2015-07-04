<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看客户联系计划</title>
<link href="${pageContext.request.contextPath}/styles/layout.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/styles/wysiwyg.css" rel="stylesheet" type="text/css" />
<!-- Theme Start -->
<link href="${pageContext.request.contextPath}/themes/blue/styles.css" rel="stylesheet" type="text/css" />
<!-- Theme End -->
</head>
<body id="homepage">
	<div id="header">
    	<a href="${pageContext.request.contextPath}/index" title=""><img src="${pageContext.request.contextPath}/img/cp_logo.png" alt="四川铁航客户关系管理系统logo" class="logo" /></a>
    	<jsp:include flush="true" page="/include/clock.jsp" />
    </div>
        
    <!-- Top Breadcrumb Start -->
    <div id="breadcrumb">
    	<ul>	
        	<li><img src="${pageContext.request.contextPath}/img/icons/icon_breadcrumb.png" alt="Location" /></li>
        	<li><strong>客户联系管理:</strong></li>
                <li><a href=<s:url action="listcontactplan"></s:url>>客户联系计划管理</a></li>
			<li>/</li>
          
          
            <li class="current">查看客户联系计划</li>
        </ul>
    </div>
    <!-- Top Breadcrumb End -->
     
    <!-- Right Side/Main Content Start -->
    <div id="rightside">
        
        <!-- Alternative Content Box End -->
        
         <div class="contentcontainer">
            <div class="headings alt">
                <h2>客户联系计划</h2>
            </div>
            <div class="contentbox">
            	<form action="#">
                    <table align="center">
					    <tr>
                            <td>
                                <label for="textfield"> <strong>联系计划编号:</strong>
                                </label>
                            </td>
                            <td><label for="textfield">
                               <s:property value="contactplan.contactPlanId"/>  </label>                
                            </td>
                        </tr>
						 <tr>
                            <td>
                                <label for="textfield"> <strong>企&nbsp;&nbsp;业&nbsp;&nbsp;名&nbsp;&nbsp;称:&nbsp;&nbsp;</strong>
                                </label>
                            </td>
                            <td><label for="textfield">
                                 <s:property value="contactplan.enterprise.enterpriseName"/></label>             
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="textfield"> <strong>联系计划名称:</strong>
                                </label>
                            </td>
                            <td><label for="textfield">
                               <s:property value="contactplan.contactPlanName"/>  </label>             
                            </td>
                        </tr>
                      
                      
                        <tr>
                            <td valign="top">
                                <label for="textfield"> <strong>联系计划内容:</strong>
                                </label>
                            </td>
                            <td><label for="textfield">
                                <s:textarea  cssClass="inputbox  textarea" readonly="true" name="contactplan.contactPlanDesc" rows="10" cols="50"/> </label> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="textfield"> <strong>&nbsp;</strong>
                                </label>
                            </td>
                            <td>                   
                                <input type="button" value="返回" class="btnalt" onclick="{window.location.href='<s:url action="listcontactplan"></s:url>';}" />                            
                            </td>
                        </tr>
                    </table>      
                </form>         
            </div>
        </div>
        
        <div style="clear:both;"></div>

        <div id="footer">&copy; Copyright 2013 R7-2X开发小组</div>
          
    </div>
    <!-- Right Side/Main Content End -->
    
        <!-- Left Dark Bar Start -->
    <div id="leftside">
    	<jsp:include flush="true" page="../include/user.jsp" />
       <div class="notifications">
        	<s:form id="showwarnform" action="listsellswarn" method="post">
	            <s:hidden id="flag" name="flag" value="false" />
	        	<p class="notifycount"><a href="javascript:void(0)" onclick="{document.showwarnform.submit();}" title="" class="notifypop">New</a></p>
	            <p><a href="javascript:void(0)" onclick="{document.showwarnform.submit();}" title="" class="notifypop">销售提醒</a></p>
	            <p class="smltxt">(点击查看过期销售提醒)</p>
            </s:form>
        </div>
        
        <ul id="nav">
        	<li>
                <ul class="navigation">
                    
					<li><a href=<s:url action="listenterpriseforsell"></s:url>>查看客户信息</a></li>
                    <li><a href=<s:url action="listcustomer"></s:url>>客户联系人管理</a></li>
                    <li class="heading selected" onclick="go('${pageContext.request.contextPath}/listcontactplan');">客户联系计划管理</li>
					<li><a href=<s:url action="listcontactnote"></s:url>>客户联系记录管理</a></li>
                    <li><a href=<s:url action="listsellsopportunity"></s:url>>销售机会管理</a></li>
                    <li><a href=<s:url action="listsellswarn"></s:url>>销售提醒管理</a></li>
					<li><a href=<s:url action="listproductforsell"></s:url>>查看产品信息</a></li>
                </ul>
            </li>          
        </ul>
    </div>
    <!-- Left Dark Bar End --> 
    
  
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/enhance.js"></script>	
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/excanvas.js'></script>
	<script type='text/javascript' src='${pageContext.request.contextPath}/scripts/jquery.min.js'></script>
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/jquery-ui.min.js'></script>
	<script type='text/javascript' src='${pageContext.request.contextPath}/scripts/jquery.wysiwyg.js'></script>
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/visualize.jQuery.js'></script>
    <script type="text/javascript" src='${pageContext.request.contextPath}/scripts/functions.js'></script>
     <script type="text/javascript" src='${pageContext.request.contextPath}/scripts/javascript-function.js'></script>
    
    <!--[if IE 6]>
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/png_fix.js'></script>
    <script type='text/javascript'>
      DD_belatedPNG.fix('img, .notifycount, .selected');
    </script>
    <![endif]--> 
</body>
</html>
