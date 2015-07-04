<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
<link href="${pageContext.request.contextPath}/styles/layout.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/styles/wysiwyg.css" rel="stylesheet" type="text/css" />
<!-- Theme Start -->
<link href="${pageContext.request.contextPath}/themes/blue/styles.css" rel="stylesheet" type="text/css" />
<!-- Theme End -->
<script type="text/javascript">
function formSubmit(form){	
    if(validateLength('投诉名称',1,20,form["complaintProblem"],document.getElementById('errormessage1_help'),'errormessage1')
	&&validateLength('投诉人',0,20,form["complaintName"],document.getElementById('errormessage2_help'),'errormessage2')
	&&validatePersonalNumber('投诉人联系方式',form["complaintNumber"],document.getElementById('errormessage3_help'),'errormessage3')
	&&validateLength('投诉描述',1,255,form["complaintProblemDesc"],document.getElementById('errormessage4_help'),'errormessage4')
    ){
            if(confirm("确定要提交？"))form.submit();            
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
        	<li><strong>服务管理:</strong></li>
            <li><a href="
			${pageContext.request.contextPath}/listcomplaint 
			" title="">投诉管理</a></li>
			<li>/</li>
			<li class="current">增加投诉信息</li>
        </ul>
    </div>
    <!-- Top Breadcrumb End -->
     
    <!-- Right Side/Main Content Start -->
    <div id="rightside">
        
        <!-- Alternative Content Box End -->
        
         <div class="contentcontainer">
            <div class="headings alt">
                <h2>投诉信息</h2>
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
            	<div class="status success" id="successmessage" style="display: none;">
                	<p><img src="img/icons/icon_success.png" alt="Success" /><span>格式已符合要求！</span></p>
            	</div>
            	<s:form id="form1" action="savecomplaint" method="post">
            	<s:hidden name="complaint.complaintId"/>           		
            	<s:hidden name="complaint.CState" value="未处理"/>            	
            	<s:hidden name="complaint.complaintTime"/>  	
                    <table align="center">
                        <tr>
                            <td>
                                <label for="textfield"> 
                                <strong>&nbsp;投&nbsp;&nbsp;&nbsp;诉&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;&nbsp;称:&nbsp;</strong>                                </label>                            </td>
                            <td><label for="textfield">
                            <s:textfield id="complaintProblem" cssClass="inputbox smallbox" name="complaint.complaintProblem" 
                            onblur="validateLength('投诉名称',1,20,this,document.getElementById('errormessage1_help'),'errormessage1')"/>
                            <span>*</span></label></td>
                        </tr>                        
                        <tr>
                            <td>
                                <label for="textfield"> <strong>&nbsp;投&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;诉&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;人:&nbsp;</strong>                                </label>                            </td>
                            <td><label for="textfield">
                                <s:textfield id="complaintName" cssClass="inputbox smallbox" name="complaint.complaintName" 
                                onblur="validateLength('投诉人',0,20,this,document.getElementById('errormessage2_help'),'errormessage2')"/>
                            </label></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="textfield"> <strong>投诉人联系方式:&nbsp;</strong>                                </label>                            </td>
                            <td><label for="textfield">
                                <s:textfield id="complaintNumber" cssClass="inputbox smallbox" name="complaint.complaintNumber" 
                                onblur="validatePersonalNumber('投诉人联系方式',this,document.getElementById('errormessage3_help'),'errormessage3')"/>
                            </label></td>
                        </tr>                        
                        <tr>
                            <td><label for="textfield"> 
                                <strong>&nbsp;投&nbsp;&nbsp;&nbsp;诉&nbsp;&nbsp;&nbsp;描&nbsp;&nbsp;&nbsp;述:&nbsp;</strong>                                </label>                            </td>
                            <td><label for="textfield"> 
                            	<s:textarea id="complaintProblemDesc" cssClass="inputbox textarea" name="complaint.complaintProblemDesc" rows="10" cols="50" 
                            	onblur="validateLength('投诉描述',1,255,this,document.getElementById('errormessage4_help'),'errormessage4')"/>                            	
                            <span>*</span></label></td>
                        </tr>                   
                        <tr>
                          <td>&nbsp;</td>
                            <td>
                                                            
                          <input type="button" class="btn" value="确认" onclick="formSubmit(this.form)"/>
                          <input type="button" value="返回" class="btnalt" onclick="{window.location.href='${pageContext.request.contextPath}/listcomplaint';}"/>                            </td>
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
                    <s:if test="#session.loginCategory=='客户服务人员'">
        			<li><a href=<s:url action="listcommonproblem"></s:url>>常见问题管理</a></li>
            		<li><a href=<s:url action="listproblem"></s:url>>疑难问题管理</a></li>       
                    </s:if>
                    <li class="heading selected" onclick="go('${pageContext.request.contextPath}/listcomplaint');">投诉管理</li>
                </ul>
            </li>           
        </ul>
    </div>
    <!-- Left Dark Bar End --> 
    
    <!-- Notifications Box/Pop-Up Start --> 
    
    <!-- Notifications Box/Pop-Up End --> 
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/enhance.js"></script>	
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/excanvas.js'></script>
	<script type='text/javascript' src='${pageContext.request.contextPath}/scripts/jquery.min.js'></script>
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/jquery-ui.min.js'></script>
	<script type='text/javascript' src='${pageContext.request.contextPath}/scripts/jquery.wysiwyg.js'></script>
    <script type='text/javascript' src='${pageContext.request.contextPath}/scripts/visualize.jQuery.js'></script>
    <script type="text/javascript" src='${pageContext.request.contextPath}/scripts/functions.js'></script>
    <script type="text/javascript" src='${pageContext.request.contextPath}/scripts/timeSelect.js'></script>
    <script type="text/javascript" src='${pageContext.request.contextPath}/scripts/javascript-function.js'></script>
    
    
</body>
</html>
