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
	if(validateLength('销售提醒名称',1,20,form["sellsWarnName"],document.getElementById("errormessage1_help"),"errormessage1")&&
		validateNonEmpty('提醒时间',form["warnDate"],document.getElementById("errormessage2_help"),"errormessage2")&&
		validateLength('提醒内容',0,200,form["warnDesc"],document.getElementById("errormessage3_help"),"errormessage3")&&
		validateWarnDateforsell("提醒时间不能是过去时间",form["warnDate"].value,document.getElementById("errormessage4_help"),"errormessage4")){
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
			<li>
				<s:if test="null == sellswarn.sellsWarnId"><a href="${pageContext.request.contextPath}/listsellsopportunity" title="">销售机会管理</a></s:if>
				<s:else><a href="${pageContext.request.contextPath}/listsellswarn" title="">销售提醒管理</a></s:else>
			</li>
            <li>/</li>
            <li class="current"><s:if test="null == sellswarn.sellsWarnId">增加销售提醒</s:if><s:else>修改销售提醒</s:else></li>
        </ul>
</div>
    <!-- Top Breadcrumb End -->
     
    <!-- Right Side/Main Content Start -->
    <div id="rightside">
        
        <!-- Alternative Content Box End -->
         <div class="contentcontainer">
            <div class="headings alt">
                <h2>销售提醒</h2>
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
            	<s:form id="form1" action="savesellswarn" method="post">
            	<s:hidden name="sellswarn.sellsWarnId" label="sellsWarnId"/>
            	<s:hidden name="sellswarn.sellsopportunity.sellsOpportunityId" label="sellsOpportunityId" />
            	<table align="center">
            		<s:if test="null != sellswarn.sellsWarnId">
            		<tr>
            			<td>
            				<label for="textfield"><strong>销售提醒编号:&nbsp;</strong></label>
            			</td>
            			<td>
            				<s:label id="sellsWarnId" name="sellswarn.sellsWarnId" />
            			</td>
            		</tr>
            		</s:if>
            		<tr>
            			<td>
            				<label for="textfield"><strong>销售机会编号:&nbsp;</strong></label>
            			</td>
            			<td>
            				<s:label id="sellsOpportunityId" name="sellswarn.sellsopportunity.sellsOpportunityId" />
            			</td>
            		</tr>
            		<tr>
            			<td>
            				<label for="textfield"><strong>销售提醒名称:&nbsp;</strong></label>
            			</td>
            			<td>
            				<label for="textfield">
	            				<s:textfield id="sellsWarnName" name="sellswarn.sellsWarnName" cssClass="inputbox" 
	            				onblur="validateLength('销售提醒名称',1,20,this,document.getElementById('errormessage1_help'),'errormessage1')" />
	            			<span>*</span></label>
            			</td>
            		</tr>
            		<tr>
            			<td>
            				<label for="textfield"><strong>提&nbsp;&nbsp;醒&nbsp;&nbsp;时&nbsp;&nbsp;间:&nbsp;</strong></label>
            			</td>
            			<td>
            				<label for="textfield">
	            				<s:textfield  id="warnDate" cssClass="inputbox smallbox" name="sellswarn.warnDate" 
	            				readonly="true" onclick="fPopCalendar(event,this,this)" onfocus="this.select()" 
	            				>
            						<s:param name="value"><s:date name="sellswarn.warnDate" format="yyyy-MM-dd"/></s:param>
            					</s:textfield>
            				<span>*</span></label>
            			</td>
            		</tr>
            		<tr>
            			<td>
            				<label for="textfield"><strong>提&nbsp;&nbsp;醒&nbsp;&nbsp;内&nbsp;&nbsp;容:&nbsp;</strong></label>
            			</td>
            			<td>
            				<label for="textfield">
	            				<s:textarea cssClass="inputbox textarea" id="warnDesc" name="sellswarn.warnDesc" rows="10" cols="50" 
	            				onblur="validateLength('提醒内容',0,200,this,document.getElementById('errormessage3_help'),'errormessage3')" />
            				</label>
            			</td>
            		</tr>
            		<tr>
            			<td></td>
            			<td>
            				<input type="button" value="确认" class="btn" onclick="formSubmit(this.form);"/>
            				<s:if test="null == sellswarn.sellsWarnId">
            				<input type="reset" value="重置" class="btnalt" />
                            </s:if>
                            <s:else>
                            <input type="button" value="返回" class="btnalt" onclick="{window.location.href='<s:url action="listsellswarn"></s:url>';}"/>
                            </s:else>
            			</td>
            		</tr>
            	</table>
            	</s:form>
            </div>
        </div>
        
        <div style="clear:both;"></div>

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
                    <s:if test="null == sellswarn.sellsWarnId">
                    <li class="heading selected" onclick="go('${pageContext.request.contextPath}/listsellsopportunity');">销售机会管理</li>
                    <li><a href="${pageContext.request.contextPath}/listsellswarn" title="">销售提醒管理</a></li>
                    </s:if>
                    <s:else>
                    <li><a href="${pageContext.request.contextPath}/listsellsopportunity" title="">销售机会管理</a></li>
                    <li class="heading selected" onclick="go('${pageContext.request.contextPath}/listsellswarn');">销售提醒管理</li>
                    </s:else>   
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