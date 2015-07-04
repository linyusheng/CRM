<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>疑难问题管理</title>
		<link href="${pageContext.request.contextPath}/styles/layout.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/styles/wysiwyg.css"
			rel="stylesheet" type="text/css" />
		<!-- Theme Start -->
		<link href="${pageContext.request.contextPath}/themes/blue/styles.css"
			rel="stylesheet" type="text/css" />
		<!-- Theme End -->
		<script language="javascript" type="text/javascript"
			src="JS/jquery-1.3.2.min.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){$(".btn-slide").click(function(){
		 	//当点击黄色块触发silideToggle
		 	$("#panel").slideToggle("slow");
		 	$(this).toggleClass("active");
		 	return false;//触发后然后改变小图标方向，css在.active定义的
		 });});
		</script>
	</head>

	<body id="homepage">
		<div id="header">
			<a href="${pageContext.request.contextPath}/index.jsp" title=""><img
					src="${pageContext.request.contextPath}/img/cp_logo.png"
					alt="四川铁航客户关系管理系统logo" class="logo" /> </a>
		<jsp:include flush="true" page="/include/clock.jsp" />
		</div>

		<!-- Top Breadcrumb Start -->
		<div id="breadcrumb">
			<ul>
				<li>
					<img src="img/icons/icon_breadcrumb.png" alt="Location" />
				</li>
				<li>
					<strong>服务管理:</strong>
				</li>
				<li class="current">
					疑难问题管理
				</li>
			</ul>
		</div>
		<!-- Top Breadcrumb End -->

		<!-- Right Side/Main Content Start -->
		<div id="rightside">

			<!-- Alternative Content Box End -->
			<div class="contentcontainer">
				<div class="headings altheading">
					<h2>
						疑难问题列表
					</h2>
				</div>
				<div class="contentbox">
					<s:form id="removeform" action="removeproblem" method="post">
						<table width="100%">
							<thead>
								<tr>
									<th>
									<s:if test=' #session.loginCategory == "客户服务人员" '>
										<input name="id" type="checkbox"
											value='<s:property value="problemId" />' id="id" />
									</s:if>
									</th>
									<th>
										问题名称
									</th>
									<th>
										登记时间
									</th>
									<th>
										登记人员
									</th>
									<th width="8%">
										状态
									</th>
									<th>
										基本操作
									</th>
								</tr>
							</thead>
							<tbody>
								<s:if test="true == problemsolutionColl.isEmpty()">
									<tr style="text-align: center;">
										<td
											style="text-align: center; font-size: 18px; padding: 20px;"
											colspan="100%">
											找不到相关记录
										</td>
									</tr>
								</s:if>
								<s:iterator status="st" value="problemsolutionColl">
									<tr <s:if test="#st.even">class="alt"</s:if>>
										<td>
										<s:if test=' #session.loginCategory == "客户服务人员" '>
											<input type="checkbox"
												value='<s:property value="problemId" />' name="ids" />
										</s:if>
										</td>
										<td>
											<s:property value="problemName" />
										</td>
										<td>
											<s:date name="submitDate" format="yyyy-MM-dd HH:mm:ss" />
										</td>
										<td>
											<s:property value="userByServerId.userName" />
										</td>
										<td>
											<s:property value="PState" />
										</td>
										<td>
											<s:if test='PState=="未处理"'>
												<a
													href='<s:url action="mulloadproblem"><s:param name="id" value="problemId" /></s:url>'
													title=""><img src="img/icons/icon_view.png" alt="Edit" />查看</a>
	                                &nbsp;
	                            	</s:if>
											<s:elseif test='PState=="处理中"'>
												<a
													href='<s:url action="mulloadproblem"><s:param name="id" value="problemId" /></s:url>'
													title=""><img src="img/icons/icon_view.png" alt="Edit" />查看</a>
	                                &nbsp;
	                            	</s:elseif>
											<s:else>
												<a
													href='<s:url action="mulloadproblem"><s:param name="id" value="problemId" /></s:url>'
													title=""><img src="img/icons/icon_view.png" alt="Edit" />查看</a>
	                                &nbsp;
	                            	</s:else>
		                            	<s:if test=' #session.loginCategory == "客户服务人员" '>
		                            		<a
													href='<s:url action="removeproblem"><s:param name="ids" value="problemId" /></s:url>'
													title="" onclick="return removeone();"><img
														src="img/icons/icon_delete.png" alt="Delete" />删除</a>
												&nbsp;
												<s:if test='PState=="未处理"'>
													<a
														href='<s:url action="loadproblem"><s:param name="id" value="problemId" /></s:url>'
														title=""><img src="img/icons/icon_edit.png" alt="Edit" />修改</a>
												&nbsp;
		                            	</s:if>
											
	                            	</s:if>
										</td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					</s:form>
					<div class="extrabottom">
						<ul>
						<s:if test=' #session.loginCategory == "客户服务人员" '>
							<li>
								<a
									href="${pageContext.request.contextPath}/addproblem"
									title=""><img src="img/icons/icon_add.png" alt="add" />登记疑难问题</a>
							</li>
							<li>
								<a href="javascript:void(0)" onclick="removemore();" title=""><img
										src="img/icons/icon_delete.png" alt="Delete" />删除</a>
							</li>
						</s:if>
						</ul>
						<div class="bulkactions">
							<s:form id="stateForm" action="listproblem.action" method="post">
								<select id="stateWord" name="stateWord" onchange=keywordSearch('stateForm');>
									<option>
										按状态筛选
									</option>
									<option>
										未处理
									</option>
									<option>
										处理中
									</option>
									<option>
										已处理
									</option>
									<option>
										所有
									</option>
								</select>
							</s:form>
							<s:form id="searchForm" action="listproblem.action" method="post">
								<s:hidden id="currentpage" name="pageBean.currentPage"
									label="ID" />
								<!--<strong>问题名称：&nbsp;</strong>-->
								<input type="text" name="keyWord" id="smallbox"
									class="inputbox smallbox" 
									value="<s:property value="keyWord"/>" placeholder="问题名称" />&nbsp;&nbsp;
		                        <a href="javascript:void(0)"
									onclick=keywordSearch('searchForm');> <img
										src="img/icons/icon_search.png" alt="Search" />查找</a>
							</s:form>
						</div>
					</div>
					<div style="clear: both;"></div>
					<jsp:include flush="true" page="../include/selectbypage.jsp"></jsp:include>
				</div>
			</div>

			<div style="clear: both;"></div>

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
						<s:if test=' #session.loginCategory == "客户服务人员" '>
							<li><a href=<s:url action="listcommonproblem"></s:url>>常见问题管理</a></li>
						</s:if>
	                    <li class="heading selected" onclick="go('${pageContext.request.contextPath}/listproblem');">疑难问题管理</li>
	                    <s:if test=' #session.loginCategory == "客户服务人员" '>
							<li><a href=<s:url action="listcomplaint"></s:url>>投诉管理</a></li>
						</s:if>
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
