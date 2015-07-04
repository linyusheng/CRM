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
<script type="text/javascript">
function formSubmit(form){
	if(validateNonEmpty('下次联系时间',form["nextCallTime"],document.getElementById("errormessage1_help"),"errormessage1")&&
		validateLength('销售机会名称',1,20,form["sellsOpportunityName"],document.getElementById("errormessage2_help"),"errormessage2")&&
		validateLength('销售机会描述',0,200,form["sellsOpportunityDesc"],document.getElementById("errormessage3_help"),"errormessage3")&&
		validateWarnDateforsell("下次联系时间不能是过去时间",form["nextCallTime"].value,document.getElementById("errormessage4_help"),"errormessage4") ){
		if(confirm("确认要提交?"))
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
    	<a href="${pageContext.request.contextPath}/index" title=""><img src="${pageContext.request.contextPath}/img/cp_logo.png" alt="四川铁航客户关系管理系统logo" class="logo" /></a>
    	<jsp:include flush="true" page="/include/clock.jsp" />
    </div>
        
    <!-- Top Breadcrumb Start -->
    <div id="breadcrumb">
    	<ul>	
        	<li><img src="${pageContext.request.contextPath}/img/icons/icon_breadcrumb.png" alt="Location" /></li>
        	<li><strong>销售管理:</strong></li>
			<li><a href="${pageContext.request.contextPath}/listsellsopportunity" title="">销售机会管理</a></li>
            <li>/</li>
            <li class="current"><s:if test="null == sellsopportunity">增加销售机会</s:if><s:else>修改销售机会</s:else></li>
        </ul>
    </div>
    <!-- Top Breadcrumb End -->
     
    <!-- Right Side/Main Content Start -->
    <div id="rightside">
        
        <!-- Alternative Content Box End -->
        
         <div class="contentcontainer">
            <div class="headings alt">
                <h2>销售机会</h2>
            </div>
            <div class="contentbox">
            	<div class="status error" id="errormessage1" style="display: none;">
            		<p><img src="img/icons/icon_error.png" alt="Error" />
            		<span id="errormessage1_help" class="smltxt red"></span></p>
            	</div>
            	<div class="status error" id="errormessage2" style="display: none;">
            		<p><img src="img/icons/icon_error.png" alt="Error" />
            		<span id="errormessage2_help" class="smltxt red"></span></p>
            	</div>
            	<div class="status error" id="errormessage3" style="display: none;">
            		<p><img src="img/icons/icon_error.png" alt="Error" />
            		<span id="errormessage3_help" class="smltxt red"></span></p>
            	</div>
            	<div class="status error" id="errormessage4" style="display: none;">
            		<p><img src="img/icons/icon_error.png" alt="Error" />
            		<span id="errormessage4_help" class="smltxt red"></span></p>
            	</div>
            	<div class="status success" id="successmessage" style="display: none;">
                	<p><img src="img/icons/icon_success.png" alt="Success" /><span>格式已符合要求！</span></p>
            	</div>
            	<s:if test="customers.size() > 0">
            	<s:form id="form1" action="savesellsopportunity" method="post">
            	<s:hidden name="sellsopportunity.sellsOpportunityId" label="sellsOpportunityId"/>
            	<s:if test="null != sellsopportunity.sellswarn">
            	<s:hidden name="sellsopportunity.sellswarn.sellsWarnId" label="sellsWarnId"/>
            	</s:if>
            	<table align="center">
            		<s:if test="null != sellsopportunity.sellsOpportunityId">
            		<tr>
            			<td>
            				<label for="textfield"><strong>销售机会编号:&nbsp;</strong></label>
            			</td>
            			<td>
            				<s:label id="sellsOpportunityId" name="sellsopportunity.sellsOpportunityId" />
            			</td>
            		</tr>
            		</s:if>
            		<tr>
            			<td>
            				<label for="textfield"><strong>客户联系人名称:&nbsp;</strong></label>
            			</td>
            			<td>
            				<label for="textfield">
            					<s:select name="sellsopportunity.customer.customerId" list="customers" listKey="customerId" listValue="customerName" />
            				<span>*</span></label>
            			</td>
            		</tr>
            		<tr>
            			<td>
            				<label for="textfield"><strong>下次联系时间:&nbsp;</strong></label>
            			</td>
            			<td>
            				<label for="textfield">
	            				<s:textfield  id="nextCallTime" cssClass="inputbox smallbox" name="sellsopportunity.nextCallTime" 
	            				readonly="true" onclick="fPopCalendar(event,this,this)" onfocus="this.select()" 
	            				>
	            					<s:param name="value"><s:date name="sellsopportunity.nextCallTime" format="yyyy-MM-dd"/></s:param>
	            				</s:textfield>
            				<span>*</span></label>
            			</td>
            		</tr>
            		<tr>
            			<td>
            				<label for="textfield"><strong>销售机会名称:&nbsp;</strong></label>
            			</td>
            			<td>
            				<label for="textfield">
	            				<s:textfield id="sellsOpportunityName" name="sellsopportunity.sellsOpportunityName" cssClass="inputbox" 
	            				onblur="validateLength('销售机会名称',1,20,this,document.getElementById('errormessage2_help'),'errormessage2')" />
	            			<span>*</span></label>
            			</td>
            		</tr>
            		<tr>
            			<td>
            				<label for="textfield"><strong>销售机会描述:&nbsp;</strong></label>
            			</td>
            			<td>
            				<label for="textfield">
	            				<s:textarea cssClass="inputbox textarea" id="sellsOpportunityDesc" name="sellsopportunity.sellsOpportunityDesc" rows="10" cols="50" 
	            				onblur="validateLength('销售机会描述',0,200,this,document.getElementById('errormessage3_help'),'errormessage3')" />
            				</label>
            			</td>
            		</tr>
            		<tr>
            			<td></td>
            			<td>
            				<input type="button" value="确认" class="btn" onclick="formSubmit(this.form)" />
            				<s:if test="null == sellsopportunity"><input type="reset" value="重置" class="btnalt" /></s:if>
                            <s:else><input type="button" value="返回" class="btnalt" onclick="{window.location.href='<s:url action="listsellsopportunity"></s:url>';}"/></s:else>
            			</td>
            		</tr>
            	</table>
            	</s:form>
            	</s:if>
            	<s:else>
            		<div style="text-align: center;font-size:18px;padding:20px;">客户联系人不存在，请先增加客户联系人！</div>
            		<div style="text-align: center;">
            			<input type="button" value="返回" class="btnalt" onclick="{window.location.href='<s:url action="listsellsopportunity"></s:url>';}"/>
            		</div>
            	</s:else>
            </div>
        </div>
        <div style="clear:both;"></div>
        <div id="footer">&copy; Copyright 2013 R7-2X开发小组</div> 
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
					<li><a href="${pageContext.request.contextPath}/listenterpriseforsell" title="">查看客户信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/listcustomer" title="">客户联系人管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/listcontactplan" title="">客户联系计划管理</a></li>
                    <li ><a href="${pageContext.request.contextPath}/listcontactnote" title="">客户联系记录管理</a></li>
                    <li class="heading selected" onclick="go('${pageContext.request.contextPath}/listsellsopportunity');">销售机会管理</li>
                    <li><a href="${pageContext.request.contextPath}/listsellswarn" title="">销售提醒管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/listproductforsell" title="">查看产品信息</a></li>
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
    <script type="text/javascript" src='${pageContext.request.contextPath}/scripts/timeSelect.js'></script>
    <script type="text/javascript" src='${pageContext.request.contextPath}/scripts/javascript-function.js'></script>
    
    <!--[if IE 6]>
    <script type='text/javascript' src='../scripts/png_fix.js'></script>
    <script type='text/javascript'>
      DD_belatedPNG.fix('img, .notifycount, .selected');
    </script>
    <![endif]--> 
</body>
</html>