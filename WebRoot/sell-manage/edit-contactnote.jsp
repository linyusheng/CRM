<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<script type="text/javascript">
function formSubmit(form){
    if(validateLength('联系记录名称',1,20,form["contactNoteName"],document.getElementById('errormessage1_help'),'errormessage1')&&
    	validateNonEmpty("联系记录时间",form["contactDate"],document.getElementById("errormessage2_help"),"errormessage2")&&
       validateLength('联系描述',0,255,form["contactDesc"],document.getElementById('errormessage3_help'),'errormessage3')
        && validateWarnDate("联系记录时间不能是未来时间",form["contactDate"].value,document.getElementById("errormessage4_help"),"errormessage4")){
        if(confirm("确定要提交？"))
            form.submit();
    }
    else{
        alert("表单上仍存在错误，请改正错误后再提交。");
    }
}
</script>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改客户联系记录</title>
<link href="${pageContext.request.contextPath}/styles/layout.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/styles/wysiwyg.css" rel="stylesheet" type="text/css" />
<!-- Theme Start -->
<link href="${pageContext.request.contextPath}/themes/blue/styles.css" rel="stylesheet" type="text/css" />
<!-- Theme End -->
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
        	<li><strong>客户联系管理:</strong></li>
               <li><a href=<s:url action="listcontactnote"></s:url>>客户联系记录管理</a></li>
			<li>/</li>
          
            <li class="current">修改客户联系记录</li>
        </ul>
    </div>
    <!-- Top Breadcrumb End -->
     
    <!-- Right Side/Main Content Start -->
    <div id="rightside">
        
        <!-- Alternative Content Box End -->
        
         <div class="contentcontainer">
            <div class="headings alt">
                <h2>客户联系记录</h2>
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
           <s:if test="enterprises.size() > 0">
            	 <s:form action="savecontactnote" method="post">
             <s:hidden id="contactNoteId" name="contactnote.contactNoteId" label="ID"></s:hidden>
             <s:hidden name="contactnote.user.userId" />
                    <table align="center">
                        <tr>
                            <td>
                                <label for="textfield"> <strong>联系记录名称:</strong>                                </label>                            </td>
                            <td><label for="textfield">
                                <s:textfield id="contactNoteName" name="contactnote.contactNoteName" Class="inputbox"  onblur="validateLength('联系记录名称',1,20,this,document.getElementById('errormessage1_help'),'errormessage1')"/><span>*<span></label>                        </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="textfield"> <strong>联系记录时间:</strong></label>                            </td>
                            <td><label for="textfield">
                            <s:textfield  readonly="true" id="contactDate" cssClass="inputbox smallbox" name="contactnote.contactDate"  onclick="fPopCalendar(event,this,this)" onfocus="this.select()" >
    <s:param name="value"><s:date name="contactnote.contactDate" format="yyyy-MM-dd"/></s:param>
</s:textfield><span>*<span> </label>
                                                        </td>
                        </tr>
                               <tr>
                             <td>
                                <label for="textfield"> <strong>企&nbsp;&nbsp;业&nbsp;&nbsp;名&nbsp;&nbsp;称：</strong></label>
                            </td>
                            <td>
                                <label for="textfield">
                                <s:select name="contactnote.enterprise.enterpriseId" list="enterprises" listKey="enterpriseId" listValue="enterpriseName"/><span>*<span></label>                      
                            </td>
                        </tr>

                      
                        <tr>
                            <td valign="top">
                                <label for="textfield"> <strong>联&nbsp;&nbsp;系&nbsp;&nbsp;描&nbsp;&nbsp;述:&nbsp;</strong>                                </label>                            </td>
                            <td><label for="textfield"><s:textarea id="contactDesc" cssClass="inputbox  textarea"  name="contactnote.contactDesc" rows="10" cols="50" onblur="validateLength('联系描述',0,255,this,document.getElementById('errormessage3_help'),'errormessage3')"  /> </textarea></label></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="textfield"> <strong>&nbsp;</strong>                                </label>                            </td>
                            <td>
                                <input type="button" value="确认" class="btn" onclick="formSubmit(this.form)"/>                            
                                <input type="button" value="返回" class="btnalt" onclick="{window.location.href='<s:url action="listcontactnote"></s:url>';}"/>                            </td>
                        </tr>
                    </table>      
                </s:form> 
                  </s:if>
            	   <s:else>
            	   <div style="text-align: center;font-size:18px;padding:20px;">企业不存在，请先增加企业！</div>
            		<div style="text-align: center;">
            			<input type="button" value="返回" class="btnalt" onclick="{window.location.href='<s:url action="listcontactnote"></s:url>';}"/>
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
                  
					<li><a href=<s:url action="listenterpriseforsell"></s:url>>查看客户信息</a></li>
                    <li><a href=<s:url action="listcustomer"></s:url>>客户联系人管理</a></li>
                    <li><a href=<s:url action="listcontactplan"></s:url>>客户联系计划管理</a></li>
					<li class="heading selected" onclick="go('${pageContext.request.contextPath}/listcontactnote');">客户联系记录管理</li>
                    <li><a href=<s:url action="listsellsopportunity"></s:url>>销售机会管理</a></li>
                    <li><a href=<s:url action="listsellswarn"></s:url>>销售提醒管理</a></li>
					<li><a href=<s:url action="listproductforsell"></s:url>>查看产品信息</a></li>
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
