<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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


		<script type="text/javascript">
		
		function productcategoryChange() {

		
		document.formedit.action = "<%=basePath%>getProducttmpActionEdit" ;
		document.formedit.submit();
		}

			
			function formSubmit(form){
			   if( 
		          validateLastTime('时效',form["lastTime"],document.getElementById("errormessage1_help"),'errormessage1')&&
                 //validateNonEmpty('签约金额',form["signMoney"],document.getElementById("errormessage3_help"),"errormessage3")&&
                 validateMoney('签约金额',form["signMoney"],document.getElementById("errormessage3_help"),'errormessage3')&&
                 //validateNonEmpty('违约金额',form["breakMoney"],document.getElementById("errormessage5_help"),"errormessage5")&&
                 validateMoney('违约金额',form["breakMoney"],document.getElementById("errormessage5_help"),'errormessage5')&&
                 validateNonEmpty('签约日期',form["signDate"],document.getElementById("errormessage7_help"),"errormessage7")&&
                 validateNonEmpty('生效日期',form["effectTime"],document.getElementById("errormessage8_help"),"errormessage8")&&
                 
                  validateLength('合同描述',1,230,form["compactDesc"],document.getElementById("errormessage11_help"),"errormessage11")&&
                  validateDate(form["signDate"].value,form["effectTime"].value,"合同的生效日期不能小于签约日期",document.getElementById("errormessage12_help"),"errormessage12")
                 ){
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
					修改合同信息
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
						修改合同信息
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
					<div class="status error" id="errormessage4" style="display: none;">
						<p>
							<img src="img/icons/icon_error.png" alt="Error" />
							<span id="errormessage4_help" class="smltxt red"></span>
						</p>
					</div>
					<div class="status error" id="errormessage5" style="display: none;">
						<p>
							<img src="img/icons/icon_error.png" alt="Error" />
							<span id="errormessage5_help" class="smltxt red"></span>
						</p>
					</div>
					<div class="status error" id="errormessage6" style="display: none;">
						<p>
							<img src="img/icons/icon_error.png" alt="Error" />
							<span id="errormessage6_help" class="smltxt red"></span>
						</p>
					</div>
					<div class="status error" id="errormessage7" style="display: none;">
						<p>
							<img src="img/icons/icon_error.png" alt="Error" />
							<span id="errormessage7_help" class="smltxt red"></span>
						</p>
					</div>
					<div class="status error" id="errormessage8" style="display: none;">
						<p>
							<img src="img/icons/icon_error.png" alt="Error" />
							<span id="errormessage8_help" class="smltxt red"></span>
						</p>
					</div>
					<div class="status error" id="errormessage9" style="display: none;">
						<p>
							<img src="img/icons/icon_error.png" alt="Error" />
							<span id="errormessage9_help" class="smltxt red"></span>
						</p>
					</div>
					<div class="status error" id="errormessage10"
						style="display: none;">
						<p>
							<img src="img/icons/icon_error.png" alt="Error" />
							<span id="errormessage10_help" class="smltxt red"></span>
						</p>
					</div>
					
					
					
					
					<div class="status error" id="errormessage11"
						style="display: none;">
						<p>
							<img src="img/icons/icon_error.png" alt="Error" />
							<span id="errormessage11_help" class="smltxt red"></span>
						</p>
					</div>
					
					<div class="status error" id="errormessage12"
						style="display: none;">
						<p>
							<img src="img/icons/icon_error.png" alt="Error" />
							<span id="errormessage12_help" class="smltxt red"></span>
						</p>
					</div>
					
					<div class="status success" id="successmessage"
						style="display: none;">
						<p>
							<img src="img/icons/icon_success.png" alt="Success" />
							<span>格式已符合要求！</span>
						</p>
					</div>

					<s:if
						test="enterprises.size()>0&&productcategorys.size()>0&&products.size()>0&&userses.size()>0">
						<s:form name="formedit" action="savecompact" method="post"
							enctype="multipart/form-data">
							<s:hidden name="compact.compactId" label="id" />
							<s:hidden name="compact.attachment" label="attachment" />
							<s:hidden name="compact.userByRegisterId.userId"
								value="%{#session.loginId}" />
							<table align="center">
								<tr>
									<td>
										<label for="textfield">
											<strong>合同编号：&nbsp;</strong>
										</label>
									</td>
									<td>
										<label for="textfield">
											<s:property value="compact.compactId" />
											&nbsp;
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
										<s:select name="compact.enterprise.enterpriseId"
											list="enterprises" listKey="enterpriseId"
											listValue="enterpriseName" cssClass="inputbox smallbox" />
											<span>*</span>
									</td>
								</tr>

								<tr>
									<td>
										<label for="textfield">
											<strong>产品类型：&nbsp;</strong>
										</label>
									</td>
									<td>

										<!--
                                <s:select name="compact.product.productcategory.productCategoryId" list="productcategorys" listKey="productCategoryId" listValue="categoryName"/> 
                                -->
										<s:select name="productcategoryId" list="productcategorys"
											cssClass="inputbox smallbox"
											value="compact.product.productcategory.productCategoryId"
											listKey="productCategoryId" listValue="categoryName"
											onchange="return productcategoryChange()" />
											<span>*</span>
									</td>
								</tr>

								<tr>
									<td>
										<label for="textfield">
											<strong>产品名称：&nbsp;</strong>
										</label>
									</td>
									<td>
										<s:select name="compact.product.productId" list="productsAL"
											listKey="productId" listValue="productName"
											cssClass="inputbox smallbox" />
											<span>*</span>
									</td>
								</tr>




								<tr>
									<td>
										<label for="textfield">
											<strong>时效（以月份为单位）：&nbsp;</strong>
											
										</label>
									</td>
									<td>
										<s:textfield id="lastTime" name="compact.lastTime"
											onblur="validateLastTime('时效',this,document.getElementById('errormessage1_help'),'errormessage1')"
											cssClass="inputbox smallbox" />
											<span>*</span>
									</td>
								</tr>

								<tr>
									<td>
										<label for="textfield">
											<strong>签约金额（以万元为单位）：&nbsp;</strong>
											
										</label>
									</td>
									<td>
										<s:textfield id="signMoney" name="compact.signMoney"
											onblur="validateMoney('签约金额',this,document.getElementById('errormessage3_help'),'errormessage3')"
											cssClass="inputbox smallbox" />
											<span>*</span>
									</td>
								</tr>

								<tr>
									<td>
										<label for="textfield">
											<strong>违约金额（以万元为单位）：&nbsp;</strong>
											
										</label>
									</td>
									<td>
										<s:textfield id="breakMoney" name="compact.breakMoney"
											onblur="validateMoney('违约金额',this,document.getElementById('errormessage5_help'),'errormessage5')"
											cssClass="inputbox smallbox" />
											<span>*</span>
									</td>
								</tr>

								<tr>
									<td>
										<label for="textfield">
											<strong>签约日期：&nbsp;</strong>
										</label>
									</td>
									<td>

										<s:textfield id="signDate" class="inputbox smallbox"
											name="compact.signDate" readonly="true"
											onclick="fPopCalendar(event,this,this)"
											onfocus="this.select()">
											<s:param name="value">
												<s:date name="compact.signDate" format="yyyy-MM-dd" />
											</s:param>
										</s:textfield>
										<span>*</span>
									</td>
								</tr>

								<tr>
									<td>
										<label for="textfield">
											<strong>生效日期：&nbsp;</strong>
										</label>
									</td>
									<td>
										<s:textfield id="effectTime" class="inputbox smallbox"
											name="compact.effectTime" readonly="true"
											onclick="fPopCalendar(event,this,this)"
											onfocus="this.select()">
											<s:param name="value">
												<s:date name="compact.effectTime" format="yyyy-MM-dd" />
											</s:param>
										</s:textfield>
										<span>*</span>
									</td>
								</tr>


								<tr>
									<td>
										<label for="textfield">
											<strong>付款方式：&nbsp;</strong>
										</label>
									</td>
									<td>
										<s:select name="compact.payWay"
											list="#{'1':'支票支付','2':'网上支付','3':'现金支付'}" listKey="value"
											listValue="value" cssClass="inputbox smallbox">
										</s:select>
										<span>*</span>
									</td>
								</tr>

								<tr>
									<td>
										<label for="textfield">
											<strong>销售人员：&nbsp;</strong>
										</label>
									</td>
									<td>
										<s:select name="compact.userBySellerId.userId" list="userses"
											listKey="userId" listValue="userName"
											cssClass="inputbox smallbox" />
											<span>*</span>
									</td>
								</tr>

								<tr>
									<td>
										<label for="textfield">
											<strong>登记人：&nbsp;</strong>
										</label>
									</td>
									<td>
										<!--   <s:select name="compact.userByRegisterId.userId" list="userres" listKey="userId" listValue="userName"/>-->
										<s:property value="%{#session.loginName}" />
									</td>
								</tr>

								<tr>
									<td>
										<label for="textfield">
											<strong>合同附件:&nbsp </strong>
										</label>
									</td>
									<td>
										<input type="button" class="btn" id="btn1"
											onclick="upload.click();" value="重传文件">
										<s:textfield type="text" id="input1" readonly="true"
											cssClass="inputbox smallbox" />
										<input type="file" name="upload" id="upload"
											onchange="input1.value=this.value" style="display: none"
											cssClass="inputbox smallbox">
											<span>*</span>
									</td>
								</tr>
								<tr>
									<td valign="top">
										<label for="textfield">
											<strong>合同描述:&nbsp;</strong>
										</label>
									</td>
									<td>
										<s:textarea id="compactDesc" name="compact.compactDesc"
											rows="10" cols="50"
											onblur="validateLength('合同描述',1,230,this,document.getElementById('errormessage11_help'),'errormessage11')"></s:textarea>
											<span>*</span>
									</td>
								</tr>
								<tr>
									<td>

									</td>
									<td>




										<input type="button" value="确认" class="btn"
											onclick="formSubmit(this.form)" />
											
										<s:if test="null == compact">
											<input type="reset" value="重置" class="btnalt" />
										</s:if>
										<s:else>
											<input type="button" value="返回" class="btnalt"
												onclick="{window.location.href='<s:url action="listcompact"></s:url>';}" />
										</s:else>

									</td>
								</tr>
							</table>
						</s:form>
					</s:if>

					<s:else>
						<s:if test="enterprises.size()<=0">
							<div style="text-align: center; font-size: 18px; padding: 20px;">
								不存在签约企业，请联系客户管理员增加签约企业！
							</div>

						</s:if>

						<s:if test="productcategorys.size()<=0">
							<div style="text-align: center; font-size: 18px; padding: 20px;">
								不存在产品类型，请联系业务人员增加产品类型！
							</div>

						</s:if>


						<s:if test="products.size()<=0">
							<div style="text-align: center; font-size: 18px; padding: 20px;">
								不存在产品，请联系业务人员增加产品！
							</div>

						</s:if>

						<s:if test="userses.size()<=0">
							<div style="text-align: center; font-size: 18px; padding: 20px;">
								不存在销售人员，请联系系统管理员增加销售人员！
							</div>

						</s:if>
						<div style="text-align: center;">
							<input type="button" value="返回" class="btnalt"
								onclick="{window.location.href='<s:url action="listcompact"></s:url>';}" />
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


			<ul id="nav">
				<ul class="navigation">
					<li class="heading selected" onclick="go('${pageContext.request.contextPath}/listcompact')">合同管理</li>
					<li>
						<a href="listoverduecompact" title="">查看过期合同</a>
					</li>
				</ul>

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