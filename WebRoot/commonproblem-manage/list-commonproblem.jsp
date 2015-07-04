<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>常见问题管理</title>
		<link href="${pageContext.request.contextPath}/styles/layout.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/styles/wysiwyg.css"
			rel="stylesheet" type="text/css" />
		<!-- Theme Start -->
		<link href="${pageContext.request.contextPath}/themes/blue/styles.css"
			rel="stylesheet" type="text/css" />
		<!-- Theme End -->
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
					常见问题管理
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
						常用问题列表
					</h2>
				</div>
				<div class="contentbox">
					<s:form id="removeform" action="removecommonproblem" method="post">
						<table width="100%">
							<thead>
								<tr>
									<th>
										<input name="id" type="checkbox"
											value='<s:property value="commonProblemId" />' id="id" />
									</th>
									<th>
										问题编号
									</th>
									<th>
										问题问题
									</th>
									<th>
										基本操作
									</th>


								</tr>
							</thead>
							<tbody>
								<s:if test="true == commonproblemColl.isEmpty()">
									<tr>
										<td
											style="text-align: center; font-size: 18px; padding: 20px;"
											colspan="100%">
											找不到相关记录
										</td>
									</tr>
								</s:if>
								<s:iterator status="st" value="commonproblemColl">
									<tr <s:if test="#st.even">class="alt"</s:if>>
										<td>
											<input type="checkbox"
												value='<s:property value="commonProblemId" />' name="ids" />
										</td>
										<td>
											<s:property value="commonProblemId" />
										</td>
										<td>
											<s:property value="commonProblemName" />
										</td>
										<td>
											<a
												href='<s:url action="viewcommonproblem"><s:param name="id" value="commonProblemId" /></s:url>'
												title=""><img src="img/icons/icon_view.png" alt="Edit" />查看</a>
											&nbsp;
											<a
												href='<s:url action="loadcommonproblem"><s:param name="id" value="commonProblemId" /></s:url>'
												title=""><img src="img/icons/icon_edit.png" alt="Edit" />修改</a>
											&nbsp;
											<a
												href='<s:url action="removecommonproblem"><s:param name="ids" value="commonProblemId" /></s:url>'
												title="" onclick="return removeone();"><img
													src="img/icons/icon_delete.png" alt="Delete" />删除</a>
										</td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					</s:form>
					<div class="extrabottom">
						<ul>
							<li>
								<a href="${pageContext.request.contextPath}/addcommonproblem" title=""><img
										src="img/icons/icon_add.png" alt="add" />增加</a>
							</li>
							<li>
								<a href="javascript:void(0)" onclick="removemore();" title=""><img
										src="img/icons/icon_delete.png" alt="Delete" />删除</a>
							</li>
						</ul>
						<div class="bulkactions">
							<s:form id="searchForm" action="listcommonproblem.action"
								method="post">
								<s:hidden id="currentpage" name="pageBean.currentPage"
									label="ID" />
								<input type="text" name="keyWord" id="smallbox"
									class="inputbox smallbox" value="<s:property value="keyWord"/>" placeholder="问题描述内容"/>&nbsp;&nbsp;
                        <a href="javascript:void(0)"
									onclick=keywordSearch('searchForm'); ><img src="img/icons/icon_search.png" alt="Search" />查找</a>
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
						<li class="heading selected" onclick="go('${pageContext.request.contextPath}/listcommonproblem');">常见问题管理</li>
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
		<script type="text/javascript" src='scripts/javascript-function.js'></script>

		<!--[if IE 6]>
    <script type='text/javascript' src='scripts/png_fix.js'></script>
    <script type='text/javascript'>
      DD_belatedPNG.fix('img, .notifycount, .selected');
    </script>
    <![endif]-->
	</body>
</html>
