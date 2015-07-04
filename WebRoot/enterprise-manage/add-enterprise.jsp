<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>增加客户信息</title>
<link href="${pageContext.request.contextPath}/styles/layout.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/styles/wysiwyg.css" rel="stylesheet" type="text/css" />
<!-- Theme Start -->
<link href="${pageContext.request.contextPath}/themes/blue/styles.css" rel="stylesheet" type="text/css" />
<!-- Theme End -->
<script type="text/javascript">
function formSubmit(form){
	if(validateLength("代表人姓名",1,20,form["bossName"],document.getElementById("errormessage1_help"),"errormessage1")&&
		validateLength("企业名称",1,20,form["enterprsieName"],document.getElementById("errormessage2_help"),"errormessage2")&&
		validatePhoneNumber("联系电话",form["phoneNumber"],document.getElementById("errormessage3_help"),"errormessage3")&&
		validateFax("传真",form["fax"],document.getElementById("errormessage4_help"),"errormessage4")&&
		validateLength("地址",1,45,form["address"],document.getElementById("errormessage5_help"),"errormessage5")){
		if(confirm("确定要提交？"))
			form.submit();
	}
	else{
		alert("表单上仍存在错误，请改正错误后再提交。");
	}
}
function clearErrorMessage(){
	hiddenHTMLMark("errormessage1");
	hiddenHTMLMark("errormessage2");
	hiddenHTMLMark("errormessage3");
	hiddenHTMLMark("errormessage4");
	hiddenHTMLMark("errormessage5");
}
</script>
</head>
<body id="homepage">
    <div id="header">
        <a href="${pageContext.request.contextPath}/indexj" title="">
        	<img src="${pageContext.request.contextPath}/img/cp_logo.png" alt="四川铁航客户关系管理系统logo" class="logo" />
        </a>
        <jsp:include flush="true" page="../include/clock.jsp" />
    </div>
        
    <!-- Top Breadcrumb Start -->
    <div id="breadcrumb">
        <ul>    
            <li><img src="${pageContext.request.contextPath}/img/icons/icon_breadcrumb.png" alt="Location" /></li>
            <li><strong>客户管理:</strong></li>
            <li><a href="<%=request.getContextPath()%>/listenterprise" title="">客户信息管理</a></li>
            <li>/</li>
            <li class="current">增加客户信息</li>
        </ul>
    </div>
    <!-- Top Breadcrumb End -->
     
    <!-- Right Side/Main Content Start -->
    <div id="rightside">
        
        <!-- Alternative Content Box End -->
        
         <div class="contentcontainer">
            <div class="headings alt">
                <h2>客户信息</h2>
            </div>
            <div class="contentbox">
            	<div class="status error" id="errormessage1" style="display: none;">       		
                	<p><img src="img/icons/icon_error.png" alt="Error" /><span id="errormessage1_help" class="smltxt red"></span></p> 
         		</div>
         		<div class="status error" id="errormessage2" style="display: none;">       		
                	<p><img src="img/icons/icon_error.png" alt="Error" /><span id="errormessage2_help" class="smltxt red"></span></p> 
         		</div>
         		<div class="status error" id="errormessage3" style="display: none;">       		
                	<p><img src="img/icons/icon_error.png" alt="Error" /><span id="errormessage3_help" class="smltxt red"></span></p> 
         		</div>
         		<div class="status error" id="errormessage4" style="display: none;">       		
                	<p><img src="img/icons/icon_error.png" alt="Error" /><span id="errormessage4_help" class="smltxt red"></span></p> 
         		</div>
         		<div class="status error" id="errormessage5" style="display: none;">       		
                	<p><img src="img/icons/icon_error.png" alt="Error" /><span id="errormessage5_help" class="smltxt red"></span></p> 
         		</div>
         		<div class="status success" id="successmessage" style="display: none;">
        			<p><img src="img/icons/icon_success.png" alt="Success" /><span>格式已符合要求！</span></p>
        		</div>
                <s:form action="saveenterprise" method="post">
                	<s:hidden name="enterprise.enterpriseId" label="id" />
                    <table align="center">
                        <tr>
                            <td>
                                <label for="textfield"> <strong>代表人姓名:&nbsp;</strong>
                                </label>
                            </td>
                            <td>
                            	<label for="textfield">
                            		<s:textfield id="bossName" name="enterprise.bossName" cssClass="inputbox" onblur="validateLength('代表人姓名',1,20,this,document.getElementById('errormessage1_help'),'errormessage1')" />                       
                            		<span>*</span>
                            	</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="textfield"> <strong>企&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;名:&nbsp;</strong>
                                </label>
                            </td>
                            <td>
                            	<label for="textfield">
                            		<s:textfield id="enterprsieName" name="enterprise.enterpriseName" cssClass="inputbox" onblur="validateLength('企业名称',1,20,this,document.getElementById('errormessage2_help'),'errormessage2')" />                      
                            		<span>*</span>
                            	</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="textfield"> <strong>联&nbsp;系&nbsp;电&nbsp;话:&nbsp;</strong>
                                </label>
                            </td>
                            <td>
                            	<label for="textfield">
                            		<s:textfield id="phoneNumber" name="enterprise.phoneNumber" cssClass="inputbox" onblur="validatePhoneNumber('联系电话',this,document.getElementById('errormessage3_help'),'errormessage3')" />                       
                            		<span>*</span>
                            	</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="textfield"> <strong>传&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;真:&nbsp;</strong>
                                </label>
                            </td>
                            <td>
                            	<label for="textfield">
                                	<s:textfield id="fax" name="enterprise.fax" cssClass="inputbox" onblur="validateFax('传真',this,document.getElementById('errormessage4_help'),'errormessage4')" />                        
                            	</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="textfield"> <strong>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:&nbsp;</strong>
                                </label>
                            </td>
                            <td>	
                            	<label for="textfield">
                                 	<s:textfield id="address" name="enterprise.address" cssClass="inputbox" onblur="validateLength('地址',1,45,this,document.getElementById('errormessage5_help'),'errormessage5')" />                        
                            		<span>*</span>
                            	</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="textfield"> <strong>成&nbsp;立&nbsp;时&nbsp;间:&nbsp;</strong>
                                </label>
                            </td>
                            <td>
                            	<label for="textfield">
                                	<s:textfield name="enterprise.establishDate" cssClass="inputbox" onclick="fPopCalendar(event,this,this)" onfocus="this.select()" />                        
                            	</label>	
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                            	<label for="textfield">
                                	<input type="button" value="确认" class="btn" onclick="formSubmit(this.form)" />                            
                                	<input type="reset" value="重置" class="btnalt" onclick="clearErrorMessage()" />                            
                            	</label>
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
        <ul id="nav">
            <li>
                <ul class="navigation">
                    <li class="heading selected" onclick="go('${pageContext.request.contextPath}/listenterprise');">客户信息管理</li>
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
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/png_fix.js'></script>
    <script type='text/javascript'>
      DD_belatedPNG.fix('img, .notifycount, .selected');
    </script>
    <![endif]--> 
</body>
</html>
