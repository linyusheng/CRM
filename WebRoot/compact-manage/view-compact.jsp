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
				<li>
					<a href="listcompact" title="">合同管理/</a>
				</li>
				<li class="current">
					查看合同信息
				</li>
			</ul>
		</div>
		<!-- Top Breadcrumb End -->

		<!-- Right Side/Main Content Start -->
		<div id="rightside">

			<!-- Alternative Content Box End -->

			<div class="contentcontainer">
				<div class="headings alt">
					<h2>
						合同信息
					</h2>
				</div>
				<div class="contentbox">
					<form action="download" method="post" enctype="multipart/form-data">
						<s:hidden name="compact.attachment"></s:hidden>
						<table align="center">
							<tr>
								<td>
									<label for="textfield">
										<strong>合同编号：&nbsp;</strong>
									</label>
								</td>
								<td>
									<label for="textfield">
										<strong><s:property value="compact.compactId" />&nbsp;</strong>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									<label for="textfield">
										<strong>签约公司名：&nbsp;</strong>
									</label>
								</td>
								<td>
									<label for="textfield">
										<strong><s:property
												value="compact.enterprise.enterpriseName" />&nbsp;</strong>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									<label for="textfield">
										<strong>签约日期：&nbsp;</strong>
									</label>
								</td>
								<td>
									<label for="textfield">
										<strong><s:date name="compact.signDate"
												format="yyyy-MM-dd" />&nbsp;</strong>
									</label>
								</td>
							</tr>

							<tr>
								<td>
									<label for="textfield">
										<strong>生效日期：&nbsp;</strong>
									</label>
								</td>
								<td>
									<label for="textfield">
										<strong><s:date name="compact.effectTime"
												format="yyyy-MM-dd" />&nbsp;</strong>
									</label>
								</td>
							</tr>

							<tr>
								<td>
									<label for="textfield">
										<strong>时效（以月份为单位）：&nbsp;</strong>
									</label>
								</td>
								<td>
									<label for="textfield">
										<strong><s:property value="compact.lastTime" />&nbsp;</strong>
									</label>
								</td>
							</tr>

							<tr>
								<td>
									<label for="textfield">
										<strong>签约金额（以万元为单位）：&nbsp;</strong>
									</label>
								</td>
								<td>
									<label for="textfield">
										<strong><s:property value="compact.signMoney" />&nbsp;</strong>
									</label>
								</td>
							</tr>

							<tr>
								<td>
									<label for="textfield">
										<strong>违约金额（以万元为单位）：&nbsp;</strong>
									</label>
								</td>
								<td>
									<label for="textfield">
										<strong><s:property value="compact.breakMoney" />&nbsp;</strong>
									</label>
								</td>
							</tr>

							<tr>
								<td>
									<label for="textfield">
										<strong>产品类型：&nbsp;</strong>
									</label>
								</td>
								<td>
									<label for="textfield">
										<strong><s:property
												value="compact.product.productcategory.categoryName" />&nbsp;</strong>
									</label>
								</td>
							</tr>

							<tr>
								<td>
									<label for="textfield">
										<strong>产品名称：&nbsp;</strong>
									</label>
								</td>
								<td>
									<label for="textfield">
										<strong><s:property
												value="compact.product.productName" />&nbsp;</strong>
									</label>
								</td>
							</tr>

							<tr>
								<td>
									<label for="textfield">
										<strong>付款方式：&nbsp;</strong>
									</label>
								</td>
								<td>
									<label for="textfield">
										<strong><s:property value="compact.payWay" />&nbsp;</strong>
									</label>
								</td>
							</tr>

							<tr>
								<td>
									<label for="textfield">
										<strong>销售人员：&nbsp;</strong>
									</label>
								</td>
								<td>
									<label for="textfield">
										<strong><s:property
												value="compact.userBySellerId.userName" />&nbsp;</strong>
									</label>
								</td>
							</tr>

							<tr>
								<td>
									<label for="textfield">
										<strong>登记人：&nbsp;</strong>
									</label>
								</td>
								<td>
									<label for="textfield">
										<strong><s:property
												value="compact.userByRegisterId.userName" />&nbsp;</strong>
									</label>
								</td>
							</tr>

							<tr>
								<td>
									<label for="textfield">
										<strong>合同附件:&nbsp;</strong>
									</label>
								</td>
								<td>
									<input type="submit" value="下载" class="btn" />
								</td>
							</tr>
							<tr>
								<td valign="top">
									<label for="textfield">
										<strong>合同描述:&nbsp;</strong>
									</label>
								</td>
								<td>
									<label for="textfield">
										<strong><s:property value="compact.compactDesc" />&nbsp;</strong>
									</label>
								</td>
							</tr>
							<tr>
								<td>

								</td>
								<td>
									<input type="button" value="返回" class="btnalt"
										onclick="{window.location.href='<s:url action="listcompact"></s:url>';}" />
								</td>
							</tr>
						</table>
					</form>
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
			src='${pageContext.request.contextPath}/scripts/timeSelect.js'></script>
		<!--[if IE 6]>
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/png_fix.js'></script>
    <script type='text/javascript'>
      DD_belatedPNG.fix('img, .notifycount, .selected');
    </script>
    <![endif]-->
	</body>
</html>