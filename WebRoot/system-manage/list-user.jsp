<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
<script type="text/javascript" src='${pageContext.request.contextPath}/scripts/javascript-function.js' charset="utf-8"></script>
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
        	<li><strong>系统管理:</strong></li>
            <li class="current">用户管理</li>
        </ul>
    </div>
    <!-- Top Breadcrumb End -->
     
    <!-- Right Side/Main Content Start -->
    <div id="rightside">

        <!-- Alternative Content Box Start -->
        <div class="contentcontainer">
            <div class="headings altheading">
                <h2>用户列表</h2>
            </div>
            <div class="contentbox">
            <s:form id="removeform" action="removeuser" method="post">
                <table width="100%">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="id" />                            </th>
                            <th>人员编号</th>
                            <th>帐号</th>
                            <th>用户类别</th>
                            <th>用户名</th>
                            <th>性别</th>
                            <th>出生日期</th>
                            <th>籍贯</th>
                            <th>邮箱</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <s:if test="true == userColl.isEmpty()">
    				<tr>
        			<td id="nofound" colspan="100">找不到相关记录</td>
    				</tr>
					</s:if>
                    <s:iterator status="st" value="userColl">
                    	<tr <s:if test="#st.even">class="alt"</s:if>>
                    		<td>
                    			<input  type="checkbox" name="ids" value='<s:property value="userId" />'/>
                    		</td>
                    		<td><s:property value="userId" /></td>
                    		<td><s:property value="account" /></td>
                    		<td><s:property value="userCategory" /></td>
                    		<td><s:property value="userName" /></td>
                    		<td><s:property value="sex" /></td>
                    		<td><s:date name="birthday" format="yyyy-MM-dd"/></td>
                    		<td><s:property value="nativePlace" /></td>
                    		<td><s:property value="email" /></td>
                    		<td>
                    			<a href='
                    			<s:url action="edituser"><s:param name="id" value="userId" /></s:url>
                    			'><img src="${pageContext.request.contextPath}/img/icons/icon_edit.png" alt="Edit" />修改</a>
                    			<a href='
                    			<s:url action="removeuser"><s:param name="ids" value="userId" /></s:url>
                    			' onclick="return removeone();"><img src="${pageContext.request.contextPath}/img/icons/icon_delete.png" alt="Delete" />删除</a>
							</td>
                    	</tr>
                    </s:iterator>                                           
                    </tbody>
                </table>
                </s:form>
                <div class="extrabottom">
                    <ul>
                        <li>
                            <a href='${pageContext.request.contextPath}/adduser'>
                            <img src="${pageContext.request.contextPath}/img/icons/icon_add.png" alt="add" />增加</a>
                        </li>
                        <li>
                            <a href="javascript:void(0)" onclick="removemore();"><img src="${pageContext.request.contextPath}/img/icons/icon_delete.png" alt="Delete" />删除</a>
                        </li>
                    </ul>
                    <div class="bulkactions">
                        <s:form action="listuser" method="post" id="searchForm">
                        	<s:select name="searchType" list="#{'userCategory':'人员类别','userName':'用户名'}"
                        	listKey="key"	listValue="value" cssClass="inputbox smallbox"/>
                        	<input type="text" name="keyWord" placeholder="用户名" value="<s:property value="keyWord"/>" class="inputbox smallbox" />&nbsp;&nbsp;
							<a href="javascript:void(0)" onclick="keywordSearch('searchForm');">
                    		<img src="${pageContext.request.contextPath}/img/icons/icon_search.png" alt="Search" />查找
                    		</a>
                        </s:form>
                    </div>
                </div>
                <jsp:include flush="true" page="../include/selectbypage.jsp"></jsp:include>                
                <div style="clear: both;"></div>
            </div>

        </div>

        <div style="clear:both;"></div>

        <div id="footer">&copy; Copyright 2013 R7-2X开发小组</div>

    </div>
    <!-- Right Side/Main Content End -->
    
    <!-- Left Dark Bar Start -->
    <div id="leftside">
    	<jsp:include flush="true" page="../include/user.jsp"></jsp:include> 
        <ul id="nav">
        	<li>
                <ul class="navigation">
                    <li class="heading selected" onclick="go('${pageContext.request.contextPath}/listuser');">用户管理</li>
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
    <script type="text/javascript" src='${pageContext.request.contextPath}/scripts/javascript-function.js' charset="utf-8"></script>
    
    <!--[if IE 6]>
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/png_fix.js'></script>
    <script type='text/javascript'>
      DD_belatedPNG.fix('img, .notifycount, .selected');
    </script>
    <![endif]--> 
</body>
</html>
