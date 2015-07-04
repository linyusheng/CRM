<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>查看疑难问题</title>
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
	var value = document.getElementById("PState").value;
	value = value.replace(/^\s*/, "").replace(/\s*$/, "");
    if((value == "已处理") && (document.getElementById("solutionDesc").value == "")){
        alert('"已处理"状态需要填写处理描述信息');
    }
    else{
    	if(confirm("确定要提交？"))
            form.submit();
    }
}
</script>
		
	</head>
	<body id="homepage">
		<div id="header">
			<a href="${pageContext.request.contextPath}/index.jsp" title=""><img src="img/cp_logo.png"
					alt="四川铁航客户关系管理系统logo" class="logo" /> </a>
		<jsp:include flush="true" page="/include/clock.jsp" />
		</div>

		<!-- Top Breadcrumb Start -->
		<div id="breadcrumb">
			<ul>
				<li>
					<img src="img/icons/icon_breadcrumb.png" alt="Location" />
				</li>
				<li>
					<strong>服务管理:</strong>
				</li>
				<li>
					<li>
						<a href="${pageContext.request.contextPath}/listproblem" title="">疑难问题管理</a>
					</li>
				</li>
				<li>
					/
				</li>
				<li class="current">
					查看疑难问题管理
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
						问题详细信息
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
					<div class="status error" id="errormessage3" style="display: none;">
						<p>
							<img src="img/icons/icon_error.png" alt="Error" />
							<span id="errormessage3_help" class="smltxt red"></span>
						</p>
					</div>
					<div class="status success" id="successmessage"
						style="display: none;">
						<p>
							<img src="img/icons/icon_success.png" alt="Success" />
							<span>格式已符合要求！</span>
						</p>
					</div>
					<form id="problem_view" action="changestate" method="post">
						<s:hidden name="problemsolution.problemId" label="Id" />
						<table align="center">
							<tr>
								<td>
									<label for="textfield">
										<strong>问题名称:&nbsp;</strong>
									</label>
								</td>
								<td>
									<label for="textfield">
										<s:property
												value="problemsolution.problemName" />&nbsp;
									</label>
									<s:hidden id="problemName" name="problemsolution.problemName"></s:hidden>
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="textfield">
										<strong>登记人员:&nbsp;</strong>
									</label>
								</td>
								<td>
									<label for="textfield">
										<strong><s:property
												value="problemsolution.userByServerId.userName" />&nbsp;</strong>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									<label for="textfield">
										<strong>登记时间:&nbsp;</strong>
									</label>
									<s:hidden id="userByServerId"
										name="problemsolution.userByServerId.userId"></s:hidden>
								</td>
								<td>
									<s:date name="problemsolution.submitDate" format="yyyy-MM-dd HH:mm:ss" />
									<s:hidden id="submitDate"
										name="problemsolution.submitDate"></s:hidden>
								</td>
							</tr>
							<tr>
								<td>
									<label for="textfield">
										<strong>处理人员:&nbsp;</strong>
									</label>
								</td>
								<td>
									<label for="textfield">
										<s:property
												value="problemsolution.userByProSolverId.userName" />&nbsp;
									</label>
									<s:hidden id="userByProSolverId"
										name="problemsolution.userByProSolverId.userId"></s:hidden>
								</td>
							</tr>
							<tr>
								<td>
									<label for="textfield">
										<strong>问题描述:&nbsp;</strong>
									</label>
								</td>
								<td>
									<s:textarea id="problemDesc" name="problemsolution.problemDesc" cssClass="inputbox textarea"
										readonly="true" rows="10" cols="50" ></s:textarea>
									<s:hidden id="problemDesc" name="problemsolution.problemDesc"></s:hidden>
								</td>
							</tr>
							<s:if test=' #session.loginCategory == "疑难咨询处理人员" '>
								<tr>
								<td>
									<label for="textfield">
										<strong>处理描述:&nbsp;</strong>
									</label>
								</td>
								<td>
									<label for="textfield">
										<textarea id="solutionDesc" name="problemsolution.solutionDesc" class="inputbox textarea"
											rows="10" cols="50"  onblur="validateLength('处理描述',0,200,this,document.getElementById('errormessage3_help'),'errormessage3')"></textarea>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									<label for="textfield">
										<strong>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:&nbsp;</strong>
									</label>
								</td>
								<td>
									<select id="PState" name="problemsolution.PState" >
										<option>
											未处理
										</option>
										<option>
											处理中
										</option>
										<option>
											已处理
										</option>
									</select>
								</td>
							</tr>
							</s:if>
							
							<tr>
								<td>
									<label for="textfield">
										<strong>&nbsp;</strong>
									</label>
								</td>
								<td>
								<s:if test=' #session.loginCategory == "疑难咨询处理人员" '>
									<input type="button" value="确认" class="btn" onclick="formSubmit(this.form)"/>
								</s:if>
									<input type="button" value="返回"
										onclick="{window.location.href='<s:url action="listproblem" />'}"
										class="btnalt" />
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
				<li>
					<ul class="navigation">
						<s:if test=' #session.loginCategory == "客户服务人员" '>
							<li><a href=<s:url action="listcommonproblem"></s:url>>常见问题管理</a></li>
						</s:if>
	                    <li class="heading selected" onclick="go('${pageContext.request.contextPath}/listproblem');">疑难问题管理</li>
	                    <s:if test=' #session.loginCategory == "客户服务人员" '>
							<li><a href=<s:url action="listcomplaint"></s:url>>投诉管理</a></li>
						</s:if>
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
    <script type='text/javascript' src='scripts/png_fix.js'></script>
    <script type='text/javascript'>
      DD_belatedPNG.fix('img, .notifycount, .selected');
    </script>
    <![endif]-->
	</body>
</html>
