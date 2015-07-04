<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>合同管理模块</title>
		<script type="text/javascript"
			src='${pageContext.request.contextPath}/scripts/javascript-function.js'
			charset="utf-8"></script>
		<link href="${pageContext.request.contextPath}/styles/layout.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/styles/wysiwyg.css"
			rel="stylesheet" type="text/css" />
		<!-- Theme Start -->
		<link href="${pageContext.request.contextPath}/themes/blue/styles.css"
			rel="stylesheet" type="text/css" />
		<!-- Theme End -->
	</head>
	<body id="homepage">
		<div id="header">
			<a href="" title=""><img
					src="${pageContext.request.contextPath}/img/cp_logo.png"
					alt="四川铁航客户关系管理系统logo" class="logo" />
			</a>
			<jsp:include flush="true" page="/include/clock.jsp" />
		</div>

		<!-- Top Breadcrumb Start -->
		<div id="breadcrumb">
			<ul>
				<li>
					<img
						src="${pageContext.request.contextPath}/img/icons/icon_breadcrumb.png"
						alt="Location" />
				</li>
				<li>
					<strong>合同管理模块:</strong>
				</li>
				<li>
					<strong>合同管理</strong>
				</li>
			</ul>
		</div>
		<!-- Top Breadcrumb End -->

		<!-- Right Side/Main Content Start -->
		<div id="rightside">

			<!-- Alternative Content Box Start -->
			<div class="contentcontainer">
				<div class="headings altheading">
					<h2>
						合同列表
					</h2>
				</div>
				<div class="contentbox">

					<s:form id="removeform" action="removecompact" method="post">
						<table width="100%">



							<thead>
								<tr>

									<th>
										<input type="checkbox" id="id" />
									</th>



									<th width="8%">
										合同编号
									</th>
									<th width="21%">
										签约企业名
									</th>
									<th width="10%">
										签约日期
									</th>
									<th width="10%">
										时效
									</th>
									<th width="10%">
										产品类别
									</th>
									<th width="10%">
										产品名
									</th>
									<th width="10%">
										销售人员
									</th>
									<th width="29%">
										操作
									</th>
								</tr>
							</thead>
							<tbody>
								<s:if test="true == compactALNotOver.isEmpty()">
									<tr>
										<td id="nofound" colspan="100">
											找不到相关记录
										</td>
									</tr>
								</s:if>
								<s:iterator status="st" value="compactALNotOver">
									<tr <s:if test="#st.even">class="alt"</s:if>>
										<td>
											<input type="checkbox" name="ids"
												value='<s:property value="compactId" />' />
										</td>
										<td>
											<s:property value="compactId" />
										</td>
										<td>
											<s:property value="enterprise.enterpriseName" />
										</td>
										<td>
											<s:date name="signDate" format="yyyy-MM-dd" />
										</td>
										<td>
											<s:property value="lastTime" />
										</td>
										<td>
											<s:property value="product.productcategory.categoryName" />
										</td>
										<td>
											<s:property value="product.productName" />
										</td>
										<td>
											<s:property value="userBySellerId.userName" />
										</td>

										<td>
											<a
												href='<s:url action="viewcompact"><s:param name="id" value="compactId"/></s:url>'><img
													src="${pageContext.request.contextPath}/img/icons/icon_view.png"
													alt="View" />查看</a>
											<a
												href='<s:url action="loadcompact"><s:param name="id" value="compactId" /></s:url>'><img
													src="${pageContext.request.contextPath}/img/icons/icon_edit.png"
													alt="Edit" />修改</a>
											<a
												href='<s:url action="removecompact"><s:param name="ids" value="compactId" /></s:url>'
												onclick="return removeone();"><img
													src="${pageContext.request.contextPath}/img/icons/icon_delete.png"
													alt="Delete" />删除</a>
										</td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					</s:form>
					<div class="extrabottom">
						<ul>
							<li>
								<a href='${pageContext.request.contextPath}/addcompact'> <img
										src="${pageContext.request.contextPath}/img/icons/icon_add.png"
										alt="add" />增加</a>
							</li>
							<li>
								<a href="javascript:void(0)" onclick="removemore();"><img
										src="${pageContext.request.contextPath}/img/icons/icon_delete.png"
										alt="Delete" />删除</a>
							</li>
						</ul>
						<div class="bulkactions">
							<s:form action="listcompact" method="post" id="searchForm">
								<s:hidden id="currentpage" name="pageBean.currentPage"></s:hidden>
								<input type="text" name="keyWord" placeholder="签约企业名"
									value="<s:property value="keyWord"/>" class="inputbox smallbox" />&nbsp;&nbsp;
							<a href="javascript:void(0)"
									onclick=
	keywordSearch('searchForm');;
> <img
										src="${pageContext.request.contextPath}/img/icons/icon_search.png"
										alt="Search" />查找 </a>
							</s:form>
						</div>
					</div>
					<jsp:include flush="true" page="../include/selectbypage.jsp"></jsp:include>
					<div style="clear: both;"></div>
				</div>

			</div>

			<div style="clear: both;"></div>

			<div id="footer">
				&copy; Copyright 2013 R7-2X开发小组
			</div>

		</div>
		<!-- Right Side/Main Content End -->

		<!-- Left Dark Bar Start -->
		<div id="leftside">
			<jsp:include flush="true" page="../include/user.jsp" />


			<ul id="nav">
				<ul class="navigation">
					<li class="heading selected" onclick="go('${pageContext.request.contextPath}/listcompact')">合同管理</li>
					<li>
						<a href="listoverduecompact" title="">查看过期合同</a>
					</li>
				</ul>
				<li>
					i
				</li>
			</ul>
		</div>
		<!-- Left Dark Bar End -->

		<!-- Notifications Box/Pop-Up Start -->

		<!-- Notifications Box/Pop-Up End -->

		<script type="text/javascript"
			src="${pageContext.request.contextPath}/scripts/enhance.js"></script>
		<script type='text/javascript'
			src='${pageContext.request.contextPath}/scripts/excanvas.js'></script>
		<script type='text/javascript'
			src='${pageContext.request.contextPath}/scripts/jquery.min.js'></script>
		<script type='text/javascript'
			src='${pageContext.request.contextPath}/scripts/jquery-ui.min.js'></script>
		<script type='text/javascript'
			src='${pageContext.request.contextPath}/scripts/jquery.wysiwyg.js'></script>
		<script type='text/javascript'
			src='${pageContext.request.contextPath}/scripts/visualize.jQuery.js'></script>
		<script type="text/javascript"
			src='${pageContext.request.contextPath}/scripts/functions.js'></script>
		<script type="text/javascript"
			src='${pageContext.request.contextPath}/scripts/javascript-function.js'
			charset="utf-8"></script>

		<!--[if IE 6]>
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/png_fix.js'></script>
    <script type='text/javascript'>
      DD_belatedPNG.fix('img, .notifycount, .selected');
    </script>
    <![endif]-->
	</body>
</html>
