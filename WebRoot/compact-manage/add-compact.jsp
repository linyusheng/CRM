<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

		
		document.formadd.action = "<%=basePath%>getProducttmpAction" ;
		document.formadd.submit();
		}

		function formSubmit(form){
		
		//var selectobj =document.getElementById("enterpriseIdselect");
		//var tmpselectvalues="";
		//for(var i=0;i<selectobj.length;i++){
		//if(selectobj.options[i].selected){
		//   tmpselectvalues+=selectobj.options[i].value;
		//	}
		//}
		
		
		
		
		//alert(
		 //"kkkskskk"+validateSelect("请选择签约公司名",form["enterpriseIdselect"],document.getElementById("errormessage13_help"),"errormessage13")
		//$("#enterpriseIdselect").value+"asdfsadf"
		//tmpselectvalues+"adsfadfasdf"
		//);
		//alert(
		//validateNonEmpty('合同签约公司名',form["enterpriseIdselect"],document.getElementById("errormessage13_help"),"errormessage13")
		//);
		
		      if(
                 validateLastTime('时效',form["lastTime"],document.getElementById("errormessage1_help"),'errormessage1')&&
                 //validateNonEmpty('签约金额',form["signMoney"],document.getElementById("errormessage3_help"),"errormessage3")&&
                 validateMoney('签约金额',form["signMoney"],document.getElementById("errormessage3_help"),'errormessage3')&&
                 //validateNonEmpty('违约金额',form["breakMoney"],document.getElementById("errormessage5_help"),"errormessage5")&&
                 validateMoney('违约金额',form["breakMoney"],document.getElementById("errormessage5_help"),'errormessage5')&&
                 validateNonEmpty('签约日期',form["signDate"],document.getElementById("errormessage7_help"),"errormessage7")&&
                 validateNonEmpty('生效日期',form["effectTime"],document.getElementById("errormessage8_help"),"errormessage8")&&
                 validateNonEmpty('合同附件',form["upload"],document.getElementById("errormessage9_help"),"errormessage9")&&
                 validateLength('合同描述',1,230,form["compactDesc"],document.getElementById("errormessage11_help"),"errormessage11")&&
                 validateDate(form["signDate"].value,form["effectTime"].value,"合同的生效日期不能小于签约日期",document.getElementById("errormessage12_help"),"errormessage12")&&
                // validateSelect("请选择签约公司名",tmpselectvalues,document.getElementById("errormessage13_help"),"errormessage13")
                 validateNonEmpty('合同签约公司名',form["enterpriseIdselect"],document.getElementById("errormessage13_help"),"errormessage13")&&
                 validateNonEmpty('合同的产品类型',form["productcategoryIdselect"],document.getElementById("errormessage14_help"),"errormessage14")&&
                 validateNonEmpty('合同的产品名称',form["productIdselect"],document.getElementById("errormessage15_help"),"errormessage15")&&
                  validateNonEmpty('合同的付款方式',form["payWayselect"],document.getElementById("errormessage16_help"),"errormessage16")&&
                   validateNonEmpty('合同的销售人员',form["userBySellerIdselect"],document.getElementById("errormessage17_help"),"errormessage17")
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
					新增合同信息
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
						新增合同信息
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
					
					<div class="status error" id="errormessage13"
						style="display: none;">
						<p>
							<img src="img/icons/icon_error.png" alt="Error" />
							<span id="errormessage13_help" class="smltxt red"></span>
						</p>
					</div>
					
					<div class="status error" id="errormessage14"
						style="display: none;">
						<p>
							<img src="img/icons/icon_error.png" alt="Error" />
							<span id="errormessage14_help" class="smltxt red"></span>
						</p>
					</div>
					<div class="status error" id="errormessage15"
						style="display: none;">
						<p>
							<img src="img/icons/icon_error.png" alt="Error" />
							<span id="errormessage15_help" class="smltxt red"></span>
						</p>
					</div>
					<div class="status error" id="errormessage16"
						style="display: none;">
						<p>
							<img src="img/icons/icon_error.png" alt="Error" />
							<span id="errormessage16_help" class="smltxt red"></span>
						</p>
					</div>
					<div class="status error" id="errormessage17"
						style="display: none;">
						<p>
							<img src="img/icons/icon_error.png" alt="Error" />
							<span id="errormessage17_help" class="smltxt red"></span>
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
						test="enterprises.size()>1&&productcategorys.size()>1&&products.size()>1&&userses.size()>1">
						<s:form name="formadd" action="savecompact" method="post"
							enctype="multipart/form-data">
							<s:hidden name="compact.compactId" label="id" />
							<s:hidden name="compact.userByRegisterId.userId"
								value="%{#session.loginId}" />
							<table align="center">
								<tr>
									<td>
										<label for="textfield">
											<strong>签约公司名：&nbsp;</strong>
										</label>
									</td>
									<td>

										<s:select id="enterpriseIdselect" name="compact.enterprise.enterpriseId"
											list="enterprisesAL" listKey="enterpriseId"
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
										<s:select id="productcategoryIdselect" name="productcategoryId" list="productcategorysAL"
											listKey="productCategoryId" listValue="categoryName"
											onchange="return productcategoryChange()"
											cssClass="inputbox smallbox" />
											<span>*</span>
										<!-- <select name="compact.product.productcategory.productCategoryId">
									<s:iterator value="productcategorys">
                                    <option value='<s:property value="productCategoryId" />' id="<s:property value="productCategoryId" />" 
                                    	onclick="window.location.href='<s:url action="addcompact" ><s:param name="productCategoryId" value="productCategoryId" /></s:url>'">
                                    	<s:property value="categoryName"/>
                                    </option>
                                    </s:iterator>
                                </select>
                                -->
									</td>
									</td>
								</tr>

								<tr>
									<td>
										<label for="textfield">
											<strong>产品名称：&nbsp;</strong>
										</label>
									</td>
									<td>
										<s:select id="productIdselect" name="compact.product.productId" list="productsAL"
											listKey="productId" listValue="productName"
											cssClass="inputbox smallbox" />
											<span>*</span>
										<!-- 
                            <select name="compact.product.productId">
									<s:iterator value="products">
									<s:if test="productcategory.productCategoryId==productCategoryId">
                                    <option value='<s:property value="productId" />' id="<s:property value="productId" />" 
                                    	onclick="window.location.href='<s:url action="listcompact" ><s:param name="productId" value="productId" /></s:url>'">
                                    	<s:property value="productName"/>
                                    </option>
                                   </s:if>
                                    </s:iterator>
                                </select>
                             -->
									</td>
								</tr>



								<tr>
									<td>
										<label for="textfield">
											<strong>时效（以月份为单位）：&nbsp;</strong>
											
										</label>
									</td>
									<td>
										<s:textfield cssClass="inputbox smallbox" id="lastTime"
											name="compact.lastTime"
											onblur="validateLastTime('时效',this,document.getElementById('errormessage1_help'),'errormessage1')" />
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

										<s:textfield id="signDate" cssClass="inputbox smallbox"
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

										<s:textfield id="effectTime" cssClass="inputbox smallbox"
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
										<s:select id="payWayselect" name="compact.payWay"
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

										<s:select id="userBySellerIdselect" name="compact.userBySellerId.userId" list="usersesAL"
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
										<s:property value="%{#session.loginName}" />


										<!--  <s:select name="compact.userByRegisterId.userId" list="userres" listKey="userId" listValue="userName"/>  -->
									</td>
								</tr>

								<tr>
									<td>
										<label for="textfield">
											<strong>合同附件:&nbsp;</strong>
										</label>
									</td>
									<td>
										<s:file id="upload" name="upload" label="选择文件"
											onblur="validateNonEmpty('合同附件',this,document.getElementById('errormessage9_help'),'errormessage9')" />
											<span>*</span>
										<br />
									</td>
								</tr>

								<tr>
									<td valign="top">
										<label for="textfield">
											<strong>合同描述:&nbsp;</strong>
										</label>
									</td>
									<td>
										<textarea id="compactDesc" name="compact.compactDesc"
											rows="10" cols="50"
											onblur="validateLength('合同描述',1,230,this,document.getElementById('errormessage11_help'),'errormessage11')"
											cssClass="inputbox smallbox"></textarea>
											<span>*</span>
									</td>
								</tr>
								<tr>
									<td>

									</td>
									<td>
										<input type="button" value="确认" class="btn"
											onclick="formSubmit(this.form)" />
										<input type="reset" value="重置" class="btnalt" />
									</td>
								</tr>
							</table>
						</s:form>
					</s:if>
					<s:else>
						<s:if test="enterprises.size()<=1">
							<div style="text-align: center; font-size: 18px; padding: 20px;">
								不存在签约企业，请联系客户管理员增加签约企业！
							</div>

						</s:if>

						<s:if test="productcategorys.size()<=1">
							<div style="text-align: center; font-size: 18px; padding: 20px;">
								不存在产品类型，请联系业务人员增加产品类型！
							</div>

						</s:if>


						<s:if test="products.size()<=1">
							<div style="text-align: center; font-size: 18px; padding: 20px;">
								不存在产品，请联系业务人员增加产品！
							</div>

						</s:if>

						<s:if test="userses.size()<=1">
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