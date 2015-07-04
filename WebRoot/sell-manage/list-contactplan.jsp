<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户联系计划管理</title>
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
            
          
            <li class="current">客户联系计划管理</li>
        </ul>
    </div>
    <!-- Top Breadcrumb End -->
     
    <!-- Right Side/Main Content Start -->
     <!-- Right Side/Main Content Start 表单那一块从这里开始复制-->
    <div id="rightside">

        <!-- Alternative Content Box Start -->
        <div class="contentcontainer">
            <div class="headings altheading">
                <h2>客户联系计划</h2>
            </div>
            <div class="contentbox">
                <table width="100%">
                    <thead>
                        <tr>
                            <th>
                                <input name="" type="checkbox" value="" id="id" />
                            </th>
                            <th>联系计划编号</th>
                            <th>企业名称</th>
                            <th>联系计划名称</th>
                    
                       
							
							 <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <s:if test="true == contactplanColl.isEmpty()">
                   <tr>
                  <td style="text-align: center;font-size:18px;padding:20px;" colspan="100%">找不到相关记录</td>
                   </tr>
                   </s:if>
                    <s:form id="removeform"action="removecontactplan" method="post">
                        <s:iterator status="st" value="contactplanColl">
											<tr <s:if test="#st.even">class="alt"</s:if>>
												<td>
													<input type="checkbox" name="ids" value='<s:property value="contactPlanId"/>'/>
												</td>
												<td><s:property value="contactPlanId"/></td>
												<td><s:property value="enterprise.enterpriseName"/></td>
												<td><s:property value="contactPlanName"/></td>
											
												<td>
												<a href='<s:url action="loadcontactplan"><s:param name="id" value="contactPlanId"/></s:url>'><img src="${pageContext.request.contextPath}/img/icons/icon_view.png" alt="Edit" />查看</a>
													<a href='<s:url action="editcontactplan"><s:param name="id" value="contactPlanId"/></s:url>'><img src="${pageContext.request.contextPath}/img/icons/icon_edit.png" alt="Edit" />修改</a>
													<a href='<s:url action="removecontactplan"><s:param name="ids" value="contactPlanId"/></s:url>' 
													onclick="return removeone();"><img src="${pageContext.request.contextPath}/img/icons/icon_delete.png" alt="Delete" />删除</a>
												</td>
											</tr>
										</s:iterator>
                    </tbody>
                </table>
                <div class="extrabottom">
                    <ul>
                        <li>
                            <a href='<s:url action="addcontactplan"></s:url>'><img src="${pageContext.request.contextPath}/img/icons/icon_add.png" alt="add" />增加</a>
                        </li>
                        <li>
                            <a href="#" onclick="removemore();"
													><img src="${pageContext.request.contextPath}/img/icons/icon_delete.png" alt="Delete" />删除</a>
                        </li>
                    </ul>
                     </s:form>  
                    <div class="bulkactions">
                       
                        
                        
						
						<s:form action="listcontactplan" method="post" id="searchForm">
								<s:hidden id="currentpage" name="pageBean.currentPage"
									></s:hidden>
								
								<input type="text"  placeholder="联系计划名称"  id="keyWord" Class="inputbox smallbox"
									name="keyWord" value="<s:property value="keyWord"/>" />&nbsp;&nbsp;
                        <a href="javascript:void(0)"
									onclick="keywordSearch('searchForm')"><img src="${pageContext.request.contextPath}/img/icons/icon_search.png"
										alt="Search" />查找</a>
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
    <!-- Right Side/Main Content End 到这里开始结束-->
    
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/javascript-function.js"></script>
    
    <!--[if IE 6]>
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/png_fix.js'></script>
    <script type='text/javascript'>
      DD_belatedPNG.fix('img, .notifycount, .selected');
    </script>
    <![endif]--> 
</body>
</html>
