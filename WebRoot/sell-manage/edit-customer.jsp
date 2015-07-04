<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>修改客户联系人</title>
		<link href="${pageContext.request.contextPath}/styles/layout.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/styles/wysiwyg.css"
			rel="stylesheet" type="text/css" />
		<!-- Theme Start -->
		<link href="${pageContext.request.contextPath}/themes/blue/styles.css"
			rel="stylesheet" type="text/css" />
		<!-- Theme End -->
		<script type="text/javascript">
function formSubmit(form){
	if(validateLength("客户姓名",1,20,form["customerName"],form["errormessage1_help"],"errormessage1")&&
		validatePersonalNumber("私人电话",form["personalNumber"],form["errormessage2_help"],'errormessage2')){
		if(confirm("确定要提交？"))
			form.submit();
	}
	else{
		alert("表单上仍存在错误，请改正错误后再提交。");
	}
}

</script>
	</head>
	<body id="homepage">
		<div id="header">
			<a href="${pageContext.request.contextPath}/index" title=""><img
					src="${pageContext.request.contextPath}/img/cp_logo.png"
					alt="四川铁航客户关系管理系统logo" class="logo" />
			</a>
			<jsp:include flush="true" page="../include/clock.jsp" />
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
					<strong>销售管理:</strong>
				</li>
				<li>
					<a href="<%=request.getContextPath()%>/listcustomer" title="">客户联系人管理</a>
				</li>
				<li>
					/
				</li>
				<li class="current">
					修改客户联系人
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
						客户联系人
					</h2>
				</div>
				<div class="contentbox">
					<div class="status error" id="errormessage1" style="display: none;">
						<p>
							<img src="img/icons/icon_error.png" alt="Error" />
							<span id="errormessage1_help" class="smltxt red"></span>
						</p>
					</div>
					<div class="status error" id="errormessage2" style="display: none;">
						<p>
							<img src="img/icons/icon_error.png" alt="Error" />
							<span id="errormessage2_help" class="smltxt red"></span>
						</p>
					</div>
					<div class="status success" id="successmessage"
						style="display: none;">
						<p>
							<img src="img/icons/icon_success.png" alt="Success" />
							<span>格式已符合要求！</span>
						</p>
					</div>
					<s:if test="enterpriseColl.size() > 0">
						<s:form action="savecustomer" id="customerEditForm">
							<s:hidden name="customer.customerId" />
							<s:hidden name="customer.user.userId" />
							<table align="center">
								<tr>
									<td>
										<label for="textfield">
											<strong>企&nbsp;业&nbsp;名&nbsp;称:&nbsp;</strong>
										</label>
									</td>
									<td>
										<label for="textfield">
											<s:select name="customer.enterprise.enterpriseId"
												list="enterpriseColl" listKey="enterpriseId"
												listValue="enterpriseName" />
												<span>*</span>
										</label>
									</td>
								</tr>
								<tr>
									<td>
										<label for="textfield">
											<strong>联系人姓名:&nbsp;</strong>
										</label>
									</td>
									<td>
										<label for="textfield">
											<s:textfield id="customerName" cssClass="inputbox"
												name="customer.customerName"
												onblur="validateLength('客户姓名',1,20,this,document.getElementById('errormessage1_help'),'errormessage1')"/>
											<span>*</span>
										</label>
									</td>
								</tr>
								<tr>
									<td>
										<label for="textfield">
											<strong>私&nbsp;人&nbsp;电&nbsp;话:&nbsp;</strong>
										</label>
									</td>
									<td>
										<label for="textfield">
											<s:textfield id="personalNumber" cssClass="inputbox"
												name="customer.personalNumber"
												onblur="validatePersonalNumber('私人电话',this,document.getElementById('errormessage2_help'),'errormessage2')" />
											<span>*</span>
										</label>
									</td>
								</tr>

								<tr>
									<td>
										<label for="textfield">
											<strong>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位:&nbsp;</strong>
										</label>
									</td>
									<td>
										<label for="textfield">
											<s:textfield cssClass="inputbox" name="customer.position" />
										</label>
									</td>
								</tr>

								<tr>
									<td>
										<label for="textfield">
											<strong>爱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;好:&nbsp;</strong>
										</label>
									</td>
									<td>
										<label for="textfield">
											<s:textfield cssClass="inputbox" name="customer.hobby" />
										</label>
									</td>
								</tr>
								<tr>
									<td>
										<label for="textfield">
											<strong>&nbsp;</strong>
										</label>
									</td>
									<td>
										<label for="textfield">
											<input type="button" value="确认" class="btn"
												onclick="formSubmit(this.form)" />
											<input type="button" value="返回" class="btnalt"
												onclick="{window.location.href='<s:url action="listcustomer"></s:url>';}" />
										</label>
									</td>
								</tr>
							</table>
						</s:form>
					</s:if>
					<s:else>
						<div style="text-align: center; font-size: 18px; padding: 20px;">
							客户不存在，请先增加客户！
						</div>
						<div style="text-align: center;">
							<input type="button" value="返回" class="btnalt"
								onclick="{window.location.href='<s:url action="listcustomer"></s:url>';}" />
						</div>
					</s:else>
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
			<div class="notifications">
				<s:form id="showwarnform" action="listsellswarn" method="post">
					<s:hidden id="flag" name="flag" value="false" />
					<p class="notifycount">
						<a href="javascript:void(0)"
							onclick="{document.showwarnform.submit();}" title=""
							class="notifypop">New</a>
					</p>
					<p>
						<a href="javascript:void(0)"
							onclick=
	{
		document.showwarnform.submit();
	};
title=""
							class="notifypop">销售提醒</a>
					</p>
					<p class="smltxt">
						(点击查看过期销售提醒)
					</p>
				</s:form>
			</div>

			<ul id="nav">
				<li>
					<ul class="navigation">
						<li>
							<a
								href="${pageContext.request.contextPath}/listenterpriseforsell">查看客户信息</a>
						</li>
						<li class="heading selected"  onclick="go('${pageContext.request.contextPath}/listcustomer');">
							客户联系人管理
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/listcontactplan">客户联系计划管理</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/listcontactnote">客户联系记录管理</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/listsellsopportunity">销售机会管理</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/listsellswarn">销售提醒管理</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/listproductforsell">查看产品信息</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- Left Dark Bar End -->

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
			src='${pageContext.request.contextPath}/scripts/javascript-function.js'></script>

		<!--[if IE 6]>
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/png_fix.js'></script>
    <script type='text/javascript'>
      DD_belatedPNG.fix('img, .notifycount, .selected');
    </script>
    <![endif]-->
	</body>
</html>
