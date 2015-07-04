<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>合同管理模块</title>
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
				<li class="current">
					查看到期合同
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
						到期合同列表
					</h2>
				</div>
				<div class="contentbox">
					<s:form id="formoverdue" method="post">
						<table width="100%">
							<thead>

								<tr>
									<th width="8%">
										合同编号
									</th>
									<th width="13%">
										签约企业名
									</th>
									<th width="13%">
										签约日期
									</th>
									<th width="13%">
										生效日期
									</th>
									<th width="8%">
										时效
									</th>
									<th width="13%">
										到期时间
									</th>
									<th width="13%">
										产品类别
									</th>
									<th width="13%">
										销售人员
									</th>
									<th width="21%">
										操作
									</th>

								</tr>
							</thead>
							<tbody>
								<s:if test="true == compactALOver.isEmpty()">
									<tr style="text-align: center;">
										<td
											style="text-align: center; font-size: 18px; padding: 20px;"
											colspan="100%">
											找不到相关记录
										</td>
									</tr>
								</s:if>

								<s:iterator value="compactALOver" status="st">

									<tr <s:if test="#st.even">class="alt"</s:if>>
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
											<s:date name="effectTime" format="yyyy-MM-dd" />
										</td>
										<td>
											<s:property value="lastTime" />
										</td>
										<td>
											<s:iterator value="compactOutdueDate">

												<s:if test="key==compactId">
													<s:date name="value" format="yyyy-MM-dd" />
												</s:if>
											</s:iterator>


										</td>
										<td>
											<s:property value="product.productcategory.categoryName" />
										</td>
										<td>
											<s:property value="userBySellerId.userName" />
										</td>
										<td>
											<a
												href='<s:url action="viewoverduecompact"><s:param name="id" value="compactId"/></s:url>'><img
													src="${pageContext.request.contextPath}/img/icons/icon_view.png"
													alt="View" />查看</a> &nbsp;
										</td>
									</tr>
								</s:iterator>


							</tbody>
						</table>

						<div class="extrabottom">
					</s:form>
					<div class="bulkactions">
						<s:form id="searchForm" action="listoverduecompact" method="post">
							<s:hidden id="currentpage" name="pageBean.currentPage"></s:hidden>
							<TABLE class=table_search id=table1 cellSpacing=0 cellPadding=3
								width="100%">
								<tr>

									<td>
										<input type="text" name="keyWord"
											value="<s:property value="keyWord"/>"
											class="inputbox smallbox" placeholder="签约企业名" />
										<a href="javascript:void(0)"
											onclick=
	keywordSearch('searchForm');
> <img
												src="${pageContext.request.contextPath}/img/icons/icon_search.png"
												alt="Search" />查找 </a>
									</td>
								</tr>
							</TABLE>
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
					<li>
						<a href="listcompact" title="">合同管理</a>
					</li>
					
					<li class="heading selected" onclick="go('${pageContext.request.contextPath}/listoverduecompact')">查看到期合同</li>
				</ul>
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
			src="${pageContext.request.contextPath}/scripts/javascript-function.js"></script>
		<!--[if IE 6]>
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/png_fix.js'></script>
    <script type='text/javascript'>
      DD_belatedPNG.fix('img, .notifycount, .selected');
    </script>
    <![endif]-->
	</body>
</html>