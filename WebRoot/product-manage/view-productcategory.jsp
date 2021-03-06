<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看产品类别详细信息</title>
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
        	<li><strong>产品管理:</strong></li>
			<li><a href="<%=request.getContextPath()%>/listproductcate.action" title="">产品类别管理</a></li>
			<li>/</li>          
            <li class="current">查看产品类别详细信息</li>
           
        </ul>
    </div>
    <!-- Top Breadcrumb End -->
     
    <!-- Right Side/Main Content Start -->
    <div id="rightside">
        
        <!-- Alternative Content Box End -->
        
         <div class="contentcontainer">
            <div class="headings alt">
                <h2>查看产品类别详细信息</h2>
            </div>
            <div class="contentbox">
            	<s:form  action="" method="post" id="form1">
            	
                    <table align="center">
					<tr>
                            <td>
                                <label for="textfield"> <strong>产品类别编号:</strong>
                                </label>
                            </td>
                            <td>
                             <label for="textfield"> <s:property value="productcategory.productCategoryId"/>&nbsp;</label>
                                                   
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="textfield"> <strong>产品类别名称:</strong>
                                </label>
                            </td>
                            <td>
                             <label for="textfield"> <s:property value="productcategory.categoryName"/>&nbsp;</label>  
                                <!--   <s:textfield id="name" name="productcategory.categoryName" cssClass="inputbox" readonly="true" />                        
                           <s:textfield id="id" name="productcategory.productCategoryId" cssClass="inputbox"  readonly="true" />    
                           
                           -->
                           
                           
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <label for="textfield"> <strong>产品类别描述:</strong>
                                </label>
                            </td>
                            <td><label for="textfield">
                                <s:textarea cssClass="inputbox  textarea"  name="productcategory.productCategoryDesc" rows="10" cols="50" readonly="true"> </s:textarea>
                          </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="textfield"> <strong>&nbsp;</strong>
                                </label>
                            </td>
                            <td>
                                                   
                                <input type="button" value="返回" class="btnalt"  onclick="{window.location.href='<%=request.getContextPath()%>/listproductcate.action';}" />                            
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
       
        
       <ul id="nav">
        	
            <li>
                
                 <ul class="navigation">
                   <li><a href='<s:url action="listproduct" ></s:url>' title="" class="likelogin">产品信息管理</a></li>
                    
                </ul>
            </li>
            
                <ul class="navigation">
                     <li class="heading selected"  onclick="go('${pageContext.request.contextPath}/listproductcate');">产品类别管理</li>
                </ul>
            </li>            
        </ul>
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
      <script type="text/javascript" src='${pageContext.request.contextPath}/scripts/javascript-function.js'></script>
    
    <!--[if IE 6]>
    <script type='text/javascript' src='scripts/png_fix.js'></script>
    <script type='text/javascript'>
      DD_belatedPNG.fix('img, .notifycount, .selected');
    </script>
    <![endif]--> 
</body>
</html>
