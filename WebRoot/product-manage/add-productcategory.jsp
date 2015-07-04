<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>增加产品类别</title>
<link href="${pageContext.request.contextPath}/styles/layout.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/styles/wysiwyg.css" rel="stylesheet" type="text/css" />
<!-- Theme Start -->
<link href="${pageContext.request.contextPath}/themes/blue/styles.css" rel="stylesheet" type="text/css" />
<!-- Theme End -->

<script>
			function formSubmit(form){
    if(validateLength('产品名称',1,20,form["name"],document.getElementById('errormessage1_help'),'errormessage1')&&validateLength('产品描述',1,255,form["categoryDesc"],document.getElementById('errormessage2_help'),'errormessage2')){
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
        	<li><strong>产品管理:</strong></li>
			<li><a href="<%=request.getContextPath()%>/listproductcate.action" >产品类别管理</a></li>
			<li>/</li>
            <li class="current">增加产品类别</li>
           
        </ul>
    </div>
    <!-- Top Breadcrumb End -->
     
    <!-- Right Side/Main Content Start -->
    <div id="rightside">
        
        <!-- Alternative Content Box End -->
        
         <div class="contentcontainer">
            <div class="headings alt">
                <h2>增加产品类别</h2>
            </div>
            <div class="contentbox">
            <div class="status error" id="errormessage1" style="display: none;">       		
                <p><img src="img/icons/icon_error.png" alt="Error" /><span id="errormessage1_help" class="smltxt red"></span></p> 
         	</div>
         	<div class="status error" id="errormessage2" style="display: none;">       		
                <p><img src="img/icons/icon_error.png" alt="Error" /><span id="errormessage2_help" class="smltxt red"></span></p> 
         	</div>
         	<div class="status success" id="successmessage" style="display: none;">
        		<p><img src="img/icons/icon_success.png" alt="Success" /><span>格式已符合要求！</span></p>
        	</div>
            	<s:form  action="saveproductcate" method="post" id="form1">
            	
                    <table align="center">
                        <s:iterator>
                        <tr>
                            <td>
                                <label for="textfield"> <strong>产品类别名称:</strong>
                                </label>
                            </td>
                            <td><label for="textfield">
                                <s:textfield name="productcategory.categoryName"  id="name" cssClass="inputbox"  onblur="validateLength('产品类别名称',1,20,this,document.getElementById('errormessage1_help'),'errormessage1')" />           <span>*<span>                    
                           </label>
                            </td>
                        </tr>
                   
                        <tr>
                            <td valign="top">
                                <label for="textfield"> <strong>产品类别描述:</strong>
                                </label>
                            </td>
                            <td><label for="textfield"> 
                                <s:textarea cssClass="inputbox textarea" name="productcategory.productCategoryDesc"  id="categoryDesc" rows="10" cols="50"  onblur="validateLength('产品类别描述',1,30,this,document.getElementById('errormessage2_help'),'errormessage2')"></s:textarea>
                           <span>*<span>      </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="textfield"> <strong>&nbsp;</strong>
                                </label>
                            </td>
                            <td>
                                  <input type="button" value="确认"   onclick="formSubmit(this.form)" class="btn"/>                                
                                  <input type="reset" value="重置" class="btnalt" />                        
                            </td>
                        </tr>
                        </s:iterator>
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
                   <li><a href='<s:url action="listproduct" ></s:url>' title="" class="likelogin">产品信息管理</a></li>
                    
                </ul>
            </li>
            
                <ul class="navigation">
                     <li class="heading selected" onclick="go('${pageContext.request.contextPath}/listproductcate');">产品类别管理</li>
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
    <script type="text/javascript" src='${pageContext.request.contextPath}/scripts/javascript-function.js'></script>
    
    <!--[if IE 6]>
    <script type='text/javascript' src='scripts/png_fix.js'></script>
    <script type='text/javascript'>
      DD_belatedPNG.fix('img, .notifycount, .selected');
    </script>
    <![endif]--> 
</body>
</html>
