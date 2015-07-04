<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>投诉管理</title>
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
        	<li><strong>服务管理:</strong></li>
            <li class="current">投诉管理</li>
        </ul>
    </div>
    <!-- Top Breadcrumb End -->
     
    <!-- Right Side/Main Content Start -->
    <div id="rightside">

        <!-- Alternative Content Box Start -->
        <div class="contentcontainer">
            <div class="headings altheading">
                <h2>投诉列表</h2>
            </div>
            <div class="contentbox">
            <s:form id="removeform" action="removecomplaint" method="post">
                <table width="100%">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="id" />                            </th>
                            <th>投诉编号</th>
                            <th>投诉名称</th>                            
                            <th>投诉时间</th>
                            <th>登记人员</th>
                            <th>处理人员</th>
                            <th>投诉人</th>
                            <th>投诉人联系方式</th>
                            <th>处理状态</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <s:if test="true == complaintColl.isEmpty()">
					    <tr>
					        <td style="text-align: center;font-size:18px;padding:20px;" colspan="100%">找不到相关记录</td>
					    </tr>
					</s:if>
                    <s:iterator status="st" value="complaintColl">
                    	<tr <s:if test="#st.even">class="alt"</s:if>>
                    		<td>
                    			<input  type="checkbox" name="ids" value='<s:property value="complaintId" />'/>
                    		</td>
                    		<td><s:property value="complaintId" /></td>
                    		<td><s:property value="complaintProblem" /></td>
                    		<td><s:date name="complaintTime" format="yyyy-MM-dd"/></td>
                    		<td><s:property value="userByServerId.userName" /></td>
                    		<td><s:property value="userByUserId.userName" /></td>
                    		<td><s:property value="complaintName" /></td>                    		
                    		<td><s:property value="complaintNumber" /></td>
                    		<td><s:property value="CState" /></td>
                    		<td>                    			
                    			<a href='
                    			<s:url action="viewcomplaint"><s:param name="id" value="complaintId" /></s:url>
                    			'><img src="${pageContext.request.contextPath}/img/icons/icon_view.png" alt="View" />查看</a>                    			
                    			<s:if test="#session.loginCategory=='客户服务人员'">
                    			<a href='
                    			<s:url action="editcomplaint"><s:param name="id" value="complaintId" /></s:url>
                    			'><img src="${pageContext.request.contextPath}/img/icons/icon_edit.png" alt="Edit" />修改</a>
                    			</s:if>
                    			<a href='
                    			<s:url action="removecomplaint"><s:param name="ids" value="complaintId" /></s:url>
                    			' onclick="return removeone();"><img src="${pageContext.request.contextPath}/img/icons/icon_delete.png" alt="Delete" />删除</a>
                    			<s:if test="(#session.loginCategory=='投诉处理人员')&&(CState=='未处理')">
                    			<a href='
                    			<s:url action="signcomplaint">
                    			<s:param name="id" value="complaintId" />
                    			<s:param name="dealId" value="#session.loginId" /></s:url>
                    			'><img src="${pageContext.request.contextPath}/img/icons/icon_edit.png" alt="Edit" />标记为已处理</a>
                    			</s:if>
							</td>
                    	</tr>
                    </s:iterator>                                           
                    </tbody>
                </table>
                </s:form>
                <div class="extrabottom">
                    <ul>
                    	<s:if test="#session.loginCategory=='客户服务人员'">
                        <li>
                            <a href='
                            ${pageContext.request.contextPath}/addcomplaint                   			
                            '><img src="${pageContext.request.contextPath}/img/icons/icon_add.png" alt="add" />增加</a>
                        </li>
                        </s:if>
                        <li>
                            <a href="javascript:void(0)" onclick="removemore();"><img src="${pageContext.request.contextPath}/img/icons/icon_delete.png" alt="Delete" />删除</a>
                        </li>
                    </ul>
                    <div class="bulkactions">
                        <s:form action="listcomplaint" method="post" id="searchForm">                        	
                        	<input type="text" name="keyWord" placeholder="投诉名称" value="<s:property value="keyWord"/>" class="inputbox smallbox" />&nbsp;&nbsp;
							<a href="javascript:void(0)" onclick="keywordSearch('searchForm')">
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
    	<jsp:include flush="true" page="../include/user.jsp" />
                
        <ul id="nav">
        	<li>
        		<ul class="navigation">
        			<s:if test="#session.loginCategory=='客户服务人员'">
        			<li><a href=<s:url action="listcommonproblem"></s:url>>常见问题管理</a></li>
            		<li><a href=<s:url action="listproblem"></s:url>>疑难问题管理</a></li>       
                    </s:if>
                    <li class="heading selected" onclick="go('${pageContext.request.contextPath}/listcomplaint');">投诉管理</li>
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
    
</body>
</html>
