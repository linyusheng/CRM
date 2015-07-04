<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改常见问题</title>
<link href="${pageContext.request.contextPath}/styles/layout.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/styles/wysiwyg.css" rel="stylesheet" type="text/css" />
<!-- Theme Start -->
<link href="${pageContext.request.contextPath}/themes/blue/styles.css" rel="stylesheet" type="text/css" />
<!-- Theme End -->

<script type="text/javascript">
function formSubmit(form){
    if(validateLength('问题名称',1,20,form["commonProblemName"],document.getElementById('errormessage1_help'),'errormessage1')&&
    validateLength('问题描述',1,200,form["commonProblemDesc"],document.getElementById('errormessage2_help'),'errormessage2')&&
    validateLength('解决描述',1,200,form["commonSolutionDesc"],document.getElementById('errormessage3_help'),'errormessage3')){
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
        <a href="${pageContext.request.contextPath}/index.jsp" title=""><img src="img/cp_logo.png" alt="四川铁航客户关系管理系统logo" class="logo" /></a>
    <jsp:include flush="true" page="/include/clock.jsp" />
    </div>
        
    <!-- Top Breadcrumb Start -->
    <div id="breadcrumb">
        <ul>    
            <li><img src="img/icons/icon_breadcrumb.png" alt="Location" /></li>
            <li><strong>服务管理:</strong></li>
            <li><a href="${pageContext.request.contextPath}/listcommonproblem" title="">常见问题管理</a></li>
            <li>/</li>
            <li class="current">修改常见问题</li>
        </ul>
    </div>
    <!-- Top Breadcrumb End -->
     
    <!-- Right Side/Main Content Start -->
    <div id="rightside">
        
        <!-- Alternative Content Box End -->
        
         <div class="contentcontainer">
            <div class="headings alt">
                <h2>修改常见问题</h2>
            </div>
            <div class="contentbox">
            <div class="status error" id="errormessage1" style="display: none;">
						<p>
							<img
								src="${pageContext.request.contextPath}/img/icons/icon_error.png"
								alt="Error" />
							<span id="errormessage1_help" class="smltxt red"></span>
						</p>
					</div>
					<div class="status error" id="errormessage2" style="display: none;">
						<p>
							<img
								src="${pageContext.request.contextPath}/img/icons/icon_error.png"
								alt="Error" />
							<span id="errormessage2_help" class="smltxt red"></span>
						</p>
					</div>
					<div class="status error" id="errormessage3" style="display: none;">
						<p>
							<img
								src="${pageContext.request.contextPath}/img/icons/icon_error.png"
								alt="Error" />
							<span id="errormessage3_help" class="smltxt red"></span>
						</p>
					</div>
					<div class="status success" id="successmessage"
						style="display: none;">
						<p>
							<img
								src="${pageContext.request.contextPath}/img/icons/icon_success.png"
								alt="Success" />
							<span>格式已符合要求！</span>
						</p>
					</div>
                <form id="commonproblem_editform" action="savecommonproblem" method="post">
                <s:hidden name="commonproblem.commonProblemId" label="Id" />
                    <table align="center">
                        <tr>
                            <td>
                                <label for="textfield"> <strong>问题名称:&nbsp;</strong>
                                </label>
                            </td>
                            <td>
                            	<label for="textfield">
                            		<s:textfield id="commonProblemName" name="commonproblem.commonProblemName" cssClass="inputbox textarea" onblur="validateLength('问题名称',1,20,this,document.getElementById('errormessage1_help'),'errormessage1')"></s:textfield>
                            	<span>*<span></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="textfield"> <strong>问题描述:&nbsp;</strong>
                                </label>
                            </td>
                            <td>
                            	<label for="textfield">
                            		<s:textarea id="commonProblemDesc" name="commonproblem.commonProblemDesc" rows="10" cols="50" cssClass="inputbox textarea" onblur="validateLength('问题描述',1,200,this,document.getElementById('errormessage2_help'),'errormessage2')"/>                     
                            	<span>*<span></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="textfield"> <strong>解决描述</strong>
                                </label>
                            </td>
                            <td>
                            	<label for="textfield">
                            		<s:textarea id="commonSolutionDesc" name="commonproblem.commonSolutionDesc" rows="10" cols="50" cssClass="inputbox textarea" onblur="validateLength('解决描述',1,200,this,document.getElementById('errormessage3_help'),'errormessage3')"/> 
                            	<span>*<span></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="textfield"> <strong>&nbsp;</strong>
                                </label>
                            </td>
                            <td>
                                <input type="button" value="确认" class="btn" onclick="formSubmit(this.form)"/>                            
                                <input type="button" value="返回" onclick="{window.location.href='<s:url action="listcommonproblem" />'}" class="btnalt"/>                        
                            </td>
                        </tr>
                    </table>      
                </form>         
            </div>
        </div>
        
        <div style="clear:both;"></div>

        <div id="footer">
            &copy; Copyright 2013 R7-2X开发小组
        </div> 
          
    </div>
    <!-- Right Side/Main Content End -->
    
        <!-- Left Dark Bar Start -->
        
    	<!-- Left Dark Bar Start -->
		<div id="leftside">
			<jsp:include flush="true" page="../include/user.jsp" />

			<ul id="nav">
				<li>
					<ul class="navigation">
						<li class="heading selected" onclick="go('${pageContext.request.contextPath}/listucommonproblem');">常见问题管理</li>
						<li><a href=<s:url action="listproblem"></s:url>>疑难问题管理</a></li>
						<li><a href=<s:url action="listcomplaint"></s:url>>投诉管理</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- Left Dark Bar End -->
    
    
    <script type="text/javascript" src="scripts/enhance.js"></script>   
    <script type='text/javascript' src='scripts/excanvas.js'></script>
    <script type='text/javascript' src='scripts/jquery.min.js'></script>
    <script type='text/javascript' src='scripts/jquery-ui.min.js'></script>
    <script type='text/javascript' src='scripts/jquery.wysiwyg.js'></script>
    <script type='text/javascript' src='scripts/visualize.jQuery.js'></script>
    <script type="text/javascript" src='scripts/functions.js'></script>
    <script type="text/javascript" src='${pageContext.request.contextPath}/scripts/javascript-function.js'></script>
    <!--[if IE 6]>
    <script type='text/javascript' src='scripts/png_fix.js'></script>
    <script type='text/javascript'>
      DD_belatedPNG.fix('img, .notifycount, .selected');
    </script>
    <![endif]--> 
</body>
</html>

    
