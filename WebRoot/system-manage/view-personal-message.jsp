	<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户中心</title>
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
        	<li><strong>用户中心:</strong></li>        
			<li class="current">查看个人信息</li>
        </ul>
    </div>
    <!-- Top Breadcrumb End -->
     
    <!-- Right Side/Main Content Start -->
    <div id="rightside">
        
        <!-- Alternative Content Box End -->
        
         <div class="contentcontainer">
            <div class="headings alt">
                <h2>个人信息</h2>
            </div>
            <div class="contentbox">
            	<s:form id="form1" action="" method="get">
            	<s:hidden name="user.userId"/>
            	<s:hidden name="user.account"/>
            	<s:hidden name="user.password"/> 
            	
            	<div class="photoChose">
                    	<h3>用户头像</h3>
                    	<img src="${pageContext.request.contextPath}/downloadPhoto" width="150" height="150" class="hoverimg" alt="Avatar" /><br/>
                    </div> 	
                    <table align="center">
                        <tr>
                            <td>
                                <label for="textfield"> <strong>人员编号:&nbsp;</strong>                                </label>                            </td>
                            <td>
                                <label for="textfield"><s:property value="user.userId" /> </label>                           </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="textfield"> <strong>帐&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:&nbsp;</strong>                                </label>                            </td>
                            <td>
                                <label for="textfield"><s:property value="user.account" /></label>                            </td>
                        </tr>
                        <tr>
                          <td><label for="textfield"> <strong>用户类别:&nbsp;</strong> </label>                          </td>
                          <td>
                          <s:property value="user.userCategory" />                                       
						  </td>
                        </tr>
                        <tr>
                            <td><label for="textfield">
								<strong>用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;</strong>                                
                            </label></td>
                            <td><label for="textfield">
                            <s:property value="user.userName" />                                       
						  	</label></td>
                        </tr>
                        <tr>
                          <td><label for="textfield"> <strong>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:&nbsp;</strong> </label>                          </td>
                          <td><label for="textfield">
                          <s:property value="user.sex"/>
                          </label></tr>
                        <tr>
                          <td><label for="textfield"> <strong>出生日期:&nbsp;</strong> </label>                          </td>
                          <td><label for="textfield">
                         	<s:date name="user.birthday" format="yyyy-MM-dd"/>
        				  </label></td>
                        </tr>
                        <tr>
                          <td><label for="textfield"> <strong>籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;贯:&nbsp;</strong> </label>                          </td>
                          <td><label for="textfield">
                          <s:property value="user.nativePlace"/>
                          </label></td>
                        </tr>
                        <tr>
                          <td><label for="textfield"> <strong>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:&nbsp;</strong> </label>                          </td>
                          <td><label for="textfield">
                          <s:property value="user.email"/>
                          </label></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input name="submit2" type="button" class="btn" value="修改信息" onclick="{window.location.href='${pageContext.request.contextPath}/editpersonalmessage';}" />                            
                                <input name="submit" type="button" class="btn" value="修改密码" onclick="{window.location.href='${pageContext.request.contextPath}/editpersonalpassword';}"/>    
                          		<input type="button" value="返回" class="btnalt" onclick="{window.location.href='${pageContext.request.contextPath}/index';}"/>                            
                          	</td>
                        </tr>
                    </table>      
                </s:form>         
            </div>
        </div>
        
        <div style="clear:both;"></div>

        <div id="footer">
        	&copy; Copyright 2013 R7-2X开发小组
        </div> 
          
    </div>
    <!-- Right Side/Main Content End -->
    
        <!-- Left Dark Bar Start -->
    <div id="leftside">
    	<jsp:include flush="true" page="../include/user.jsp" />
                
        <jsp:include flush="true" page="../include/menu.jsp" />
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
    <script type="text/javascript" src='${pageContext.request.contextPath}/scripts/timeSelect.js'></script>
    <script type="text/javascript" src='${pageContext.request.contextPath}/scripts/javascript-function.js'></script>
    
</body>
</html>
