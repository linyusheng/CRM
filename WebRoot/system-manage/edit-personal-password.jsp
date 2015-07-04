<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户中心</title>
<link href="${pageContext.request.contextPath}/styles/layout.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/styles/wysiwyg.css" rel="stylesheet" type="text/css" />
<!-- Theme Start -->
<link href="${pageContext.request.contextPath}/themes/blue/styles.css" rel="stylesheet" type="text/css" />
<!-- Theme End -->
<script type="text/javascript">
function formSubmit(form){	
    //if(validateNonEmpty('旧密码',form["password"],document.getElementById('errormessage1_help'),'errormessage1')
	//&&validateNonEmpty('新密码',form["newPassword"],document.getElementById('errormessage2_help'),'errormessage2')
    if(validatePassword(form["password"],form["newPassword"],form["confirmPassword"],document.getElementById('errormessage3_help'),'errormessage3')
    ){
         var tof = confirm("确定要提交？");
         if(tof){
         	   var pwd1=form["password"].value;
         	   var pwd2=form["newPassword"].value;
         	   var pwd1_md5=hex_md5(pwd1);
         	   var pwd2_md5=hex_md5(pwd2);
         	   form["password"].value=pwd1_md5;
         	   form["newPassword"].value=pwd2_md5;
         	   form.submit();
         }
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
        	<li><strong>用户中心:</strong></li>        
			<li class="current">修改密码</li>
        </ul>
    </div>
    <!-- Top Breadcrumb End -->
     
    <!-- Right Side/Main Content Start -->
    <div id="rightside">
        
        <!-- Alternative Content Box End -->
        
         <div class="contentcontainer">
            <div class="headings alt">
                <h2>密码</h2>
            </div>
            <div class="contentbox">            
            	<s:if test="(errorMessage!=NULL)&&(''!=errorMessage)">
                    <div class="status error" id="errormessage1" style="display: block;">            
                		<p><img src="img/icons/icon_error.png" alt="Error" /><span id="errormessage1_help" class="smltxt red"><s:property value="errorMessage"/></span></p> 
            		</div>                    
                </s:if>
            	<div class="status error" id="errormessage1" style="display: none;">            
                	<p><img src="img/icons/icon_error.png" alt="Error" /><span id="errormessage1_help" class="smltxt red"></span></p> 
            	</div>
            	<div class="status error" id="errormessage2" style="display: none;">            
                	<p><img src="img/icons/icon_error.png" alt="Error" /><span id="errormessage2_help" class="smltxt red"></span></p> 
            	</div>
            	<div class="status error" id="errormessage3" style="display: none;">            
                	<p><img src="img/icons/icon_error.png" alt="Error" /><span id="errormessage3_help" class="smltxt red"></span></p> 
            	</div>
            	<s:form action="savepassword">
                    <table align="center">
                        <tr>                        	
                            <td>
                                <label for="textfield"> <strong>旧&nbsp;&nbsp;密&nbsp;&nbsp;码:&nbsp;</strong>                                </label>                            </td>
                            <td><label for="textfield">
                            <s:password name="password" cssClass="inputbox smallbox" id="password"
                            onblur="validateNonEmpty('旧密码',this,document.getElementById('errormessage1_help'),'errormessage1');"/>
                            <span>*</span></label></td>
                        </tr>
                        <tr>
                          <td><label for="textfield"> <strong>新&nbsp;&nbsp;密&nbsp;&nbsp;码:&nbsp;</strong> </label>                          </td>
                          <td><label for="textfield">
                            <s:password name="newPassword" cssClass="inputbox smallbox" id="newPassword"
                            onblur="validateNonEmpty('新密码',this,document.getElementById('errormessage2_help'),'errormessage2');"/>
                            <span>*</span></label></td>
                        </tr>
                        <tr>
                          <td><label for="textfield"> <strong>密码确认:&nbsp;</strong> </label>                          </td>
                          <td><label for="textfield">
                            <s:password cssClass="inputbox smallbox" id="confirmPassword" 
                            onblur="validateNonEmpty('新密码',form['newPassword'],document.getElementById('errormessage2_help'),'errormessage2')&&validatePassword(document.getElementById('password'),document.getElementById('newPassword'),this,document.getElementById('errormessage3_help'),'errormessage3')"/>
                          <span>*</span></label></td>
                        </tr>                        
                        <tr>
                          <td>&nbsp;</td>
                            <td>
                                                            
                          <input id="confirm" type="button" class="btn" value="确认" onclick="formSubmit(this.form)"/>
                          <input type="button" value="返回" class="btnalt" onclick="{window.location.href='${pageContext.request.contextPath}/viewpersonalmessage';}"/>                            </td>
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
                
        <jsp:include flush="true" page="../include/menu.jsp" />
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
    <script type="text/javascript" src='${pageContext.request.contextPath}/scripts/md5.js'></script>
    
</body>
</html>
