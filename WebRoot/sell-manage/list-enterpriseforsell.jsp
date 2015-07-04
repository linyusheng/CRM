<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看客户信息</title>
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
   
            <li class="current">查看客户信息</li>
        </ul>
    </div>
    <!-- Top Breadcrumb End -->
     
  <!-- Right Side/Main Content Start -->
            <div id="rightside">

        <!-- Alternative Content Box Start -->
        <div class="contentcontainer">
            <div class="headings altheading">
                <h2>客户信息</h2>
            </div>
            <div class="contentbox">
            <s:form id="removeform" action="removeenterprise" method="post">
                <table width="100%">
                    <thead>
                        <tr>
                          
                            <th>企业编号</th>
                            <th>企业名称</th>
                            <th>代表人姓名</th>
                            <th>联系电话</th>
                            <th>传真</th>
                            <th>地址</th>
                            <th>成立时间</th>
                       

                        </tr>
                    </thead>
                    
                    <tbody>
                    	<s:if test="true == enterpriseColl.isEmpty()">
    						<tr>
        						<td style="text-align: center;font-size:18px;padding:20px;" colspan="100%">找不到相关记录</td>
    						</tr>
						</s:if>
                    	<s:iterator status="st" value="enterpriseColl">
    						<tr <s:if test="#st.even">class="alt"</s:if>>
                    			
                            	<td><s:property value="enterpriseId" /></td>
                            	<td><s:property value="enterpriseName" /></td>
                            	<td><s:property value="bossName" /></td>
                            	<td><s:property value="phoneNumber" /></td>
                            	<td><s:property value="fax" /></td>
                            	<td><s:property value="address" /></td>
                            	<td><s:date name="establishDate" format="yyyy-MM-dd"/>    </td>
                            	<td><br /></td>
                            	
                    		</tr>
                    	</s:iterator>                       
                    </tbody>
                </table>
                </s:form>
                <div class="extrabottom">
                    
                    <div class="bulkactions">
                    <s:form action="listenterpriseforselltmp" method="post" id="searchform" >
                    <s:hidden id="currentpage" name="pageBaen.currentPage" label="ID"></s:hidden>                     
                        <s:textfield  name="keyWord" placeholder="企业名称" value='<s:property value="keyWord"/>' Class="inputbox smallbox"  >
                        	<s:param name="value"><s:property value="keyWord"/></s:param>
                        </s:textfield>&nbsp;&nbsp;
                        <a href="javascript:void(0)" onclick="keywordSearch('searchform')" ><img src="${pageContext.request.contextPath}/img/icons/icon_search.png" alt="Search" />查找</a>
                    </s:form>
                    </div>
                </div>
                	<jsp:include flush="true" page="../include/selectbypage.jsp"></jsp:include>
                <div style="clear: both;"></div>
            </div>

        </div>

        <div style="clear:both;"></div>

        <div id="footer">&copy; Copyright 2013 R7-2X 开发小组</div>

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
                  
					<li class="heading selected" onclick="go('${pageContext.request.contextPath}/listenterpriseforsell');">查看客户信息</a></li>
                    <li><a href=<s:url action="listcustomer"></s:url>>客户联系人管理</a></li>
                    <li><a href=<s:url action="listcontactplan"></s:url>>客户联系计划管理</a></li>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/javascript-function.js" charset="utf-8"></script>
    
    <!--[if IE 6]>
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/png_fix.js'></script>
    <script type='text/javascript'>
      DD_belatedPNG.fix('img, .notifycount, .selected');
    </script>
    <![endif]--> 
</body>
</html>
