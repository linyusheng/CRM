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
    if(validateLength('用户名',1,20,form["userName"],document.getElementById('errormessage1_help'),'errormessage1')
	&&validateLength('籍贯',0,20,form["nativePlace"],document.getElementById('errormessage2_help'),'errormessage2')
	&&validateEmail('邮箱',form["email"],document.getElementById('errormessage3_help'),'errormessage3')
	&&validateLength('邮箱',0,20,form["email"],document.getElementById('errormessage3_help'),'errormessage3')
	&&validateSuffix(form["myfile"].value,document.getElementById('errormessage4_help'),'errormessage4')
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
    	<a href="${pageContext.request.contextPath}/index" title=""><img src="${pageContext.request.contextPath}/img/cp_logo.png" alt="四川铁航客户关系管理系统logo" class="logo" /></a>
    	<jsp:include flush="true" page="/include/clock.jsp" />
    </div>
        
    <!-- Top Breadcrumb Start -->
    <div id="breadcrumb">
    	<ul>	
        	<li><img src="${pageContext.request.contextPath}/img/icons/icon_breadcrumb.png" alt="Location" /></li>
        	<li><strong>用户中心:</strong></li>        
			<li class="current">修改个人信息</li>
        </ul>
    </div>
    <!-- Top Breadcrumb End -->
     
    <!-- Right Side/Main Content Start -->
    <div id="rightside">
        
        <!-- Alternative Content Box End -->
        
         <div class="contentcontainer">
            <div class="headings alt">
                <h2>个人信息</h2>
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
            	
            	
            	<s:form id="form1" action="savemessage" method="post" enctype="multipart/form-data">

            	<s:hidden name="user.userId"/>
            	<s:hidden name="user.account"/>
            	<s:hidden name="user.password"/> 
            	<s:hidden name="user.userCategory"/>           	
            	<s:hidden name="user.photo"/> 
            	
            		<div class="photoChose">
                    	<h3>用户头像</h3>
                    	<img src="${pageContext.request.contextPath}/downloadPhoto" width="150" height="150" class="hoverimg" alt="Avatar" /><br/>
                    </div>
                    <table align="center">
                        <tr>
                            <td>
                                <label for="textfield"> <strong>人员编号:&nbsp;</strong>                                </label>                            </td>
                            <td>
                                <label for="textfield"><s:property value="user.userId" /> </label>                           </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="textfield"> <strong>帐&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:&nbsp;</strong>                                </label>                            </td>
                            <td>
                                <label for="textfield"><s:property value="user.account" /></label>                            </td>
                        </tr>
                        <tr>
                          <td><label for="textfield"> <strong>用户类别:&nbsp;</strong> </label>                          </td>
                          <td><label for="textfield">
                          
                          <s:property value="user.userCategory" />
                          </label>             
						  </td>
                        </tr>
                        <tr>
                            <td><label for="textfield"> <strong>用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;</strong>                                </label>                            </td>
                            <td><label for="textfield">
                            <s:textfield id="userName" cssClass="inputbox smallbox" name="user.userName" 
                            onblur="validateLength('用户名',1,20,this,document.getElementById('errormessage1_help'),'errormessage1')"/>
                            <span>*<span></label>
                            </td>
                        </tr>
                        <tr>
                          <td><label for="textfield"> <strong>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:&nbsp;</strong> </label>                          </td>
                          <td><label for="textfield">
                          <s:select name="user.sex" list="{'男','女'}" value="user.sex"/> 
                          </label>
                          </td> 
                        </tr>
                        <tr>
                          <td><label for="textfield"> <strong>出生日期:&nbsp;</strong> </label>                          </td>
                          <td><label for="textfield">
                         	<s:textfield  id="smallbox" cssClass="inputbox smallbox" name="user.birthday" readonly="true" onclick="fPopCalendar(event,this,this)" onfocus="this.select()">
                         		<s:param name="value"><s:date name="user.birthday" format="yyyy-MM-dd"/></s:param>
                         	</s:textfield> 
                         	</label>
        				  </td>
                        </tr>
                        <tr>
                          <td><label for="textfield"> <strong>籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;贯:&nbsp;</strong> </label>                          </td>
                          <td><label for="textfield">
                          <s:textfield id="nativePlace" cssClass="inputbox smallbox" name="user.nativePlace"
                          onblur="validateLength('籍贯',0,20,this,document.getElementById('errormessage2_help'),'errormessage2')"/>
                          </label></td>
                        </tr>
                        <tr>
                          <td><label for="textfield"> <strong>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:&nbsp;</strong> </label>                          </td>
                          <td><label for="textfield">
                          <s:textfield id="email" cssClass="inputbox smallbox" name="user.email"
                          onblur="validateEmail('邮箱',this,document.getElementById('errormessage3_help'),'errormessage3');
                          		  validateLength('邮箱',0,20,this,document.getElementById('errormessage5_help'),'errormessage5');"/>
                          </label></td>
                        </tr>    
                         <!--  tr>
                          <td><label for="textfield"> <strong>相&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;片:&nbsp;</strong> </label>                          </td>
                          <td><label for="textfield">
                           <s:file id="upload" name="upload" label="选择图片" /><br /> 
                          </label></td>
                        </tr>   -->  
                        <tr>
                        	<td><label for="textfield"> <strong>头&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像:&nbsp;</strong> </label> </td> 
                        	<td><label for="textfield"> <input type="text" id="input1" class="inputbox smallbox"></label></td>
                        	<td><label for="textfield"> <input type="button" id="btn1" class="btn" onclick="myfile.click();" value="选择"/></label></td>
							<input type="file" id="myfile" name="upload"  onchange="input1.value=this.value" style="display:none" />
                        </tr>      
                         
                        <tr>
                          <td>&nbsp;</td>
                            <td>
                                                            
                          <input type="button" class="btn" value="确认" onclick="formSubmit(this.form)"/>
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
    
</body>
</html>
