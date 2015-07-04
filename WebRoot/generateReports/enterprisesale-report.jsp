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
<title>生成客户产品交易金额报表</title>
<link href="${pageContext.request.contextPath}/styles/layout.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/styles/wysiwyg.css" rel="stylesheet" type="text/css" />
<!-- Theme Start -->
<link href="${pageContext.request.contextPath}/themes/blue/styles.css" rel="stylesheet" type="text/css" />
<!-- Theme End -->


<script type="text/javascript">
function createReport(){
	var inputyear=document.getElementById('inputyear').value;
	var enterpriseNamejsp=document.getElementById('enterpriseNamejsp').value;
	var showtype1=(document.getElementById('showtype1').checked==true)?document.getElementById('showtype1').value:null;
	var showtype2=(document.getElementById('showtype2').checked==true)?document.getElementById('showtype2').value:null;
	var showtype3=(document.getElementById('showtype3').checked==true)?document.getElementById('showtype3').value:null;
	var oActionValuePie=document.getElementById('actionValuePie').value;
	var oActionValueBar=document.getElementById('actionValueBar').value;
	var oActionValueLine=document.getElementById('actionValueLine').value;
	
	var oDivProReportPie=document.getElementById('enterprisesaleReportPie');
	var oDivProReportBar=document.getElementById('enterprisesaleReportBar');
	var oDivProReportLine=document.getElementById('enterprisesaleReportLine');
	//alert(showtype);
	
	if(inputyear==""){
		alert("请输入年份！");
		inputyear.focus();
		return;
	}
	else{
	
	     if(showtype1!=null)
	     {
		   var oAHrefPie=document.getElementById('linkPie');
		   var oImageReportPie=document.getElementById('imageReportPie');
		   oAHrefPie.href=oActionValuePie + '?inputyear=' + inputyear+'&enterpriseNamejsp='+enterpriseNamejsp+'&showtype1='+showtype1;
		   oImageReportPie.src=oActionValuePie +  '?inputyear=' + inputyear+'&enterpriseNamejsp='+enterpriseNamejsp+'&showtype1='+showtype1;
		   oImageReportPie.style.display='block';
		   
		}
		if(showtype2!=null)
	     {
		   var oAHrefBar=document.getElementById('linkBar');
		   var oImageReportBar=document.getElementById('imageReportBar');
		   oAHrefBar.href=oActionValueBar + '?inputyear=' + inputyear+'&enterpriseNamejsp='+enterpriseNamejsp+'&showtype2='+showtype2;
		   oImageReportBar.src=oActionValueBar +  '?inputyear=' + inputyear+'&enterpriseNamejsp='+enterpriseNamejsp+'&showtype2='+showtype2;
		   oImageReportBar.style.display='block';
		  
		}
		if(showtype3!=null)
	     {
		   var oAHrefLine=document.getElementById('linkLine');
		   var oImageReportLine=document.getElementById('imageReportLine');
		   oAHrefLine.href=oActionValueLine + '?inputyear=' + inputyear+'&enterpriseNamejsp='+enterpriseNamejsp+'&showtype3='+showtype3;
		   oImageReportLine.src=oActionValueLine +  '?inputyear=' + inputyear+'&enterpriseNamejsp='+enterpriseNamejsp+'&showtype3='+showtype3;
		   oImageReportLine.style.display='block';
		  
		}
		return;
	}
		
}
</script>

</head>
<body id="homepage" onload="start('inputyear')">
	<div id="header">
    	<a href="${pageContext.request.contextPath}/index" title=""><img src="${pageContext.request.contextPath}/img/cp_logo.png" alt="四川铁航客户关系管理系统logo" class="logo" /></a>
    	<jsp:include flush="true" page="/include/clock.jsp" />
    </div>
        
    <!-- Top Breadcrumb Start -->
   <div id="breadcrumb">
    	<ul>	
        	<li><img src="${pageContext.request.contextPath}/img/icons/icon_breadcrumb.png" alt="Location" /></li>
        	<li><strong>生成报表:</strong></li>
			<li class="current">生成客户产品交易金额报表</li>
			
        </ul>
    </div>
    <!-- Top Breadcrumb End -->
     
    <!-- Right Side/Main Content Start -->
    <div id="rightside">
        
        <!-- Alternative Content Box End -->
        
         <div class="contentcontainer">
            <div class="headings alt">
                <h2>生成客户产品交易金额报表</h2>
            </div>
            <div class="contentbox">
            	<s:form method="get" id="enterprisesale">
            	 <input id="actionValuePie" type="hidden" value="<%=basePath%>enterprisesalepiechart" />
            	 <input id="actionValueBar" type="hidden" value="<%=basePath%>enterprisesalebarchart" />
            	 <input id="actionValueLine" type="hidden" value="<%=basePath%>enterprisesalelinechart" />
                    <table align="center">
                        <tr>
                            <td>
                                <label for="textfield"> <strong>输&nbsp;&nbsp;入&nbsp;&nbsp;年&nbsp;&nbsp;份:</strong>
                                </label>
                            </td>
                            <td>
                                <label for="textfield">               
                             <select id="inputyear" name="inputyear"></select> 
                             </label>
                            </td>
                        </tr>
                       
                       

                        <tr>
                            <td>
                                <label for="textfield"> <strong>企&nbsp;&nbsp;业&nbsp;&nbsp;名&nbsp;&nbsp;称:</strong>
                                </label>
                            </td>

                            <td> <label for="textfield">  
                                 <s:select name="enterpriseNamejsp" list="enterpriseColl" listKey="enterpriseId" listValue="enterpriseName" id="enterpriseNamejsp"/></label>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <label for="textfield">
                                 <strong>请选择生成报表形式：</strong>
                                </label>
                                
                               
                               
                            </td>
                            
                            <td> <label for="textfield">  
                              <input type="checkbox" name="showtype1" id="showtype1" value="1" />饼状图
                              <input type="checkbox" name="showtype2" id="showtype2" value="2" />柱状图
                              <input type="checkbox" name="showtype3" id="showtype3" value="3" />折线图
                              </label>
                            </td>
                           
                        </tr>
                        
                       <tr>
                       
                            <td>
                                <label for="textfield"> <strong>&nbsp;</strong>
                                </label>
                            </td>
                            <td>
                                <input type="button" value="生成" class="btn"  onclick="createReport();"/>                          
                                                       
                            </td>
                        </tr>
                    </table>  
                     
                                         <div class="contentcontainer">
                    	<div class="headings alt">
                			<h2>饼状图
                			<div class="down">
            					<a href="#"><img id="down" onclick="turn(this,1)" src="${pageContext.request.contextPath}/img/icons/icon_down.png" /></a>
            				</div>
                			</h2>
            			</div>
            			<div style="display:block;" id="panel1">
	                    	<div id="enterprisesaleReportPie" >
	            				<a id="linkPie" ><img style="display:none" id="imageReportPie" /></a>
	                        </div>
                    	</div>
                    </div>
                    <div class="contentcontainer">
                    	<div class="headings alt">
                			<h2>柱状图
                			<div class="down">
            					<a href="#"><img id="down" onclick="turn(this,2)" src="${pageContext.request.contextPath}/img/icons/icon_down.png" /></a>
            				</div>
                			</h2>
                			
            			</div>
            			<div style="display: block; " id="panel2">
	                    	<div id="enterprisesaleReportBar" >
	            				<a id="linkBar" ><img style="display:none" id="imageReportBar" /></a>
	                        </div>
                    	</div>
                    </div>
                    <div class="contentcontainer">
                    	<div class="headings alt">
                			<h2>折线图
                			<div class="down">
            					<a href="#"><img id="down" onclick="turn(this,3)" src="${pageContext.request.contextPath}/img/icons/icon_down.png" /></a>
            				</div>
                			</h2>
                			
            			</div>
            			<div style="display: block; " id="panel3">
	                    	<div id="enterprisesaleReportLine" >
	                    		<a id="linkLine" ><img style="display:none" id="imageReportLine" /></a>
	                        </div>
                    	</div>
                    </div>
                       
                     
                   
                </s:form>         
            </div>
        </div>
        
        <div style="clear:both;">
        </div>

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
                    <li><a href=<s:url action="productsale" ></s:url>>生成产品销售年度报表</a></li>
                    
                </ul>
            </li>
            <li>
                <ul class="navigation">
                    <li><a href=<s:url action="achievement" ></s:url>>生成公司业绩年度报表</a></li>
                   
                </ul>
            </li>   
			<li>
                <ul class="navigation">
                    <li><a href=<s:url action="sellerreport" ></s:url>>生成销售人员合同统计报表</a></li>
                   
                </ul>
            </li> 
			<li>
                <ul class="navigation">
                    <li class="heading selected"  onclick="go('${pageContext.request.contextPath}/enterprisesale');">生成客户产品交易金额报表</li>
                   
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

</body>
</html>
