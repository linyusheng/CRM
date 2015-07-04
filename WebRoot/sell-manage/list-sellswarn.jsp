<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>销售管理</title>
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
        	<li><strong>销售管理:</strong></li>
            <li class="current">销售提醒管理</li>
        </ul>
    </div>
    <!-- Top Breadcrumb End -->
    
    <!-- Right Side/Main Content Start -->
    <div id="rightside">

        <!-- Alternative Content Box Start -->
        <div class="contentcontainer">
            <div class="headings altheading">
                <h2>销售提醒 - <s:if test="true == flag">未过期</s:if><s:else>已过期</s:else></h2>
            </div>
            <div class="contentbox">
            	<s:form id="removeform" action="removesellswarn" method="post">
            		<table width="100%">
            			<thead>
            				<tr>
            					<th>
            						<input name="" type="checkbox" value="" id="id" />
            					</th>
            					<th>销售提醒编号</th>
            					<th>销售提醒名称</th>
            					<th>销售机会名称</th>
            					<th>客户联系人名称</th>
								<th>提醒时间</th>
	                            <th>操作</th>
            				</tr>
            			</thead>
            			<tbody>
            				<s:if test="true == sellswarnColl.isEmpty()">
            					<tr style="text-align: center;">
            						<td style="text-align: center;font-size:18px;padding:20px;" colspan="100%">找不到相关记录</td>
            					</tr>
            				</s:if>
            				<s:iterator value="sellswarnColl" status="st">
            					<tr <s:if test="true == isWarning[#st.getIndex()]">style="color: #FF0000;" </s:if>
            						<s:if test="#st.even">class="alt"</s:if>>
            						<td>
            							<input type="checkbox" name="ids" value='<s:property value="sellsWarnId" />' />
            						</td>
            						<td><s:property value="sellsWarnId" /></td>
            						<td><s:property value="sellsWarnName" /></td>
            						<td><s:property value="sellsopportunity.sellsOpportunityName" /></td>
            						<td><s:property value="sellsopportunity.customer.customerName " /></td>
            						<td><s:date name="warnDate" format="yyyy-MM-dd" /></td>
            						<td>
            							<a href='<s:url action="loadsellswarn"><s:param name="id" value="sellsWarnId" /></s:url>'>
            							<img src="${pageContext.request.contextPath}/img/icons/icon_view.png" alt="Edit" />查看</a>
            							<s:if test="true == flag">
            							<a href='<s:url action="editsellswarn"><s:param name="id" value="sellsWarnId" /></s:url>'>
            							<img src="${pageContext.request.contextPath}/img/icons/icon_edit.png" alt="Edit" />修改</a>
            							</s:if>
            							<a href='<s:url action="removesellswarn"><s:param name="ids" value="sellsWarnId" /></s:url>'
            							onclick="return removeone();">
            							<img src="${pageContext.request.contextPath}/img/icons/icon_delete.png" alt="Delete" />删除</a>
            						</td>
            					</tr>
            				</s:iterator>
            			</tbody>
            		</table>
            	</s:form>
               
                <div class="extrabottom">
                    <ul>
                        <li>
                            <a href="javascript:void(0)" onclick="removemore();"><img src="${pageContext.request.contextPath}/img/icons/icon_delete.png" alt="Delete" />删除</a>
                        </li>
                    </ul>
                    <ul>
	                    <s:form id="changeform" action="listsellswarn" method="post">
	                        <s:if test="true == flag">
	                        <s:hidden id="flag" name="flag" value="false" />
	                        <li>
	                        	<a href="javascript:void(0)" onclick="{document.changeform.submit();}">
	                        	<img src="${pageContext.request.contextPath}/img/icons/icon_outdated.png" alt="View" />显示已过期提醒</a>
	                        </li>
	                        </s:if>
	                        <s:else>
	                        <s:hidden id="flag" name="flag" value="true" />
	                        <li>
	                        	<a href="javascript:void(0)" onclick="{document.changeform.submit();}">
	                        	<img src="${pageContext.request.contextPath}/img/icons/icon_indate.png" alt="View" />显示未过期提醒</a>
	                        </li>
	                        </s:else>
                        </s:form>
                    </ul>
                    <div class="bulkactions">
                    	<s:form id="searchform" action="listsellswarn" method="post">
                    		<input type="text" class="inputbox smallbox" name="keyWord" placeholder="销售提醒名称" value="<s:property value='keyWord' />" />
                    		&nbsp;&nbsp;
                    		<a href="javascript:void(0)" onclick="keywordSearch('searchform');">
                    		<img src="${pageContext.request.contextPath}/img/icons/icon_search.png" alt="Search" />查找</a>
                    	</s:form>
                    </div>
                </div>
                <jsp:include flush="true" page="../include/selectbypage.jsp" />
                <div style="clear: both;"></div>
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
					<li><a href="${pageContext.request.contextPath}/listenterpriseforsell" title="">查看客户信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/listcustomer" title="">客户联系人管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/listcontactplan" title="">客户联系计划管理</a></li>
                    <li ><a href="${pageContext.request.contextPath}/listcontactnote" title="">客户联系记录管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/listsellsopportunity" title="">销售机会管理</a></li>
                    <li class="heading selected" onclick="go('${pageContext.request.contextPath}/listsellswarn');">销售提醒管理</li>
                    <li><a href="${pageContext.request.contextPath}/listproductforsell" title="">查看产品信息</a></li>
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
    <script type='text/javascript' src='../scripts/png_fix.js'></script>
    <script type='text/javascript'>
      DD_belatedPNG.fix('img, .notifycount, .selected');
    </script>
    <![endif]--> 
</body>
</html>