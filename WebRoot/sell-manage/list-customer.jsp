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
        <a href="${pageContext.request.contextPath}/index" title="">
        	<img src="${pageContext.request.contextPath}/img/cp_logo.png" alt="四川铁航客户关系管理系统logo" class="logo" />
        </a> 
        <jsp:include flush="true" page="../include/clock.jsp" />   
    </div>
        
    <!-- Top Breadcrumb Start -->
    <div id="breadcrumb">
        <ul>    
            <li><img src="${pageContext.request.contextPath}/img/icons/icon_breadcrumb.png" alt="Location" /></li>
            <li><strong>销售管理:</strong></li>         
            <li class="current">客户联系人管理</li>
        </ul>
    </div>
    <!-- Top Breadcrumb End -->
     
    <!-- Right Side/Main Content Start -->
     <!-- Right Side/Main Content Start 表单那一块从这里开始复制-->
    <div id="rightside">

        <!-- Alternative Content Box Start -->
        <div class="contentcontainer">
            <div class="headings altheading">
                <h2>客户联系人</h2>
            </div>
            <div class="contentbox">
            <s:form id="removeform" action="removecustomer" method="post">
                <table width="100%">
                    <thead>
                        <tr>
                            <th>
                                <input name="" type="checkbox" value="" id="id" />                        
                            </th>
                            <th>客户联系人编号</th>
                            <th>企业编号</th>
                            <th>企业名称</th>
                            <th>联系人姓名</th>
                            <th>私人电话</th>
                            <th>职位</th>
                            <th>爱好</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<s:if test="true == customerColl.isEmpty()">
    						<tr>
        						<td style="text-align: center;font-size:18px;padding:20px;" colspan="100%">找不到相关记录</td>
    						</tr>
						</s:if>
                        <s:iterator status="st" value="customerColl">
    					  <tr <s:if test="#st.even">class="alt"</s:if>>
                            <td>
                                <input type="checkbox" value="<s:property value="customerId"/>" name="ids" />
                            </td>
                            <td><s:property value="customerId"/></td>
                            <td><s:property value="enterprise.enterpriseId"/></td>
                            <td><s:property value="enterprise.enterpriseName"/></td>
                            <td><s:property value="customerName"/></td>
                            <td><s:property value="personalNumber"/></td>
                            <td><s:property value="position"/></td>
                            <td><s:property value="hobby"/></td>
                            <td>
                                <a href="<s:url action="loadcustomer"><s:param name="id" value="customerId"/></s:url>" title=""><img src="${pageContext.request.contextPath}/img/icons/icon_edit.png" alt="Edit" />修改</a>
                                &nbsp;
                                <a href="<s:url action="removecustomer"><s:param name="ids" value="customerId"/></s:url>" title="" onclick="return removeone();"><img src="${pageContext.request.contextPath}/img/icons/icon_delete.png" alt="Delete" />删除</a>
                            </td>
                          </tr>
                        </s:iterator>

                    </tbody>
                </table>
                </s:form>
                <div class="extrabottom">
                    <ul>
                        <li>
                            <a href="<%=request.getContextPath()%>/addcustomer" title=""><img src="${pageContext.request.contextPath}/img/icons/icon_add.png" alt="add" />增加</a>
                        </li>
                        <li>
                            <a href="javascript:void(0)" onclick="removemore()" title=""><img src="${pageContext.request.contextPath}/img/icons/icon_delete.png" alt="Delete" />删除</a>
                        </li>
                    </ul>
                    <div class="bulkactions">
                    <s:form action="listcustomer" method="post" id="searchform">                                        
                        <s:textfield  name="keyWord" placeholder="联系人姓名"  cssClass="inputbox smallbox"  >               
                        </s:textfield>&nbsp;&nbsp;
                        
                        <a href="javascript:void(0)" onclick="keywordSearch('searchform')">
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
                    <li><a href="${pageContext.request.contextPath}/listenterpriseforsell">查看客户信息</a></li>
                    <li class="heading selected" onclick="go('${pageContext.request.contextPath}/listcustomer');">客户联系人管理</li>
                    <li><a href="${pageContext.request.contextPath}/listcontactplan">客户联系计划管理</a></li>
                    <li ><a href="${pageContext.request.contextPath}/listcontactnote">客户联系记录管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/listsellsopportunity">销售机会管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/listsellswarn">销售提醒管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/listproductforsell">查看产品信息</a></li>
                </ul>
            </li>          
        </ul>
    </div>
    <!-- Left Dark Bar End --> 
    
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/javascript-function.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/enhance.js"></script>    
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/excanvas.js'></script>
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/jquery.min.js'></script>
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/jquery-ui.min.js'></script>
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/jquery.wysiwyg.js'></script>
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/visualize.jQuery.js'></script>
    <script type="text/javascript" src='${pageContext.request.contextPath}/scripts/functions.js'></script>
    
    <!--[if IE 6]>
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/png_fix.js'></script>
    <script type='text/javascript'>
      DD_belatedPNG.fix('img, .notifycount, .selected');
    </script>
    <![endif]--> 
</body>
</html>
