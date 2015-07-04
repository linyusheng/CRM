<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<s:form id="pageform">
	<s:hidden name="keyWord" />
	<s:hidden name="searchType" />
	<table width="100%">
		<tr>
			<s:if test="%{pageBean.currentPage == 1}">
				<td width="7%">
					<img src="${pageContext.request.contextPath}/img/first.png" />
					&nbsp;&nbsp;首页
				</td>
				<td width="8%">
					<img src="${pageContext.request.contextPath}/img/previous.png" />
					&nbsp;&nbsp;上一页
				</td>
			</s:if>
			<s:else>
				<td width="7%">
					<a href="javascript:void(0)" onclick="searchForPage(1);"><img
							src="${pageContext.request.contextPath}/img/first.png" />&nbsp;&nbsp;首页</a>&nbsp;
				</td>
				<td width="8%">
					<a href="javascript:void(0)"
						onclick='searchForPage(<s:property value="%{pageBean.currentPage-1}"/>);'><img
							src="${pageContext.request.contextPath}/img/previous.png" />&nbsp;&nbsp;上一页</a>
				</td>
			</s:else>
			<s:if test="%{pageBean.currentPage < pageBean.totalPage}">
				<td width="8%">
					<a href="javascript:void(0)"
						onclick='searchForPage(<s:property value="%{pageBean.currentPage+1}"/>);'><img
							src="${pageContext.request.contextPath}/img/next.png" />&nbsp;&nbsp;下一页</a>
				</td>
				<td width="7%">
					<a href="javascript:void(0)"
						onclick='searchForPage(<s:property value="pageBean.totalPage"/>);'><img
							src="${pageContext.request.contextPath}/img/last.png" />&nbsp;&nbsp;尾页</a>
				</td>
			</s:if>
			<s:else>
				<td width="8%">
					<img src="${pageContext.request.contextPath}/img/next.png" />
					&nbsp;&nbsp;下一页
				</td>
				<td width="7%">
					<img src="${pageContext.request.contextPath}/img/last.png" />
					&nbsp;&nbsp;尾页
				</td>
			</s:else>
			<td width="38%">
			</td>
			<td width="14%">
				共
				<s:property value="pageBean.totalPage" />
				页&nbsp;(&nbsp;
				<s:property value="pageBean.totalRow" />
				条记录&nbsp;)
			</td>
			<td width="10%">
				当前第
				<s:textfield id="currentpage" name="pageBean.currentPage"
					value="%{pageBean.currentPage}" size="3" cssClass="littlebox" />
				页

			</td>
			<td width="8%">
				<input type="button" class="btn" value="GO"
					onclick="searchForPage(document.pageform.currentpage.value);">
			</td>
		</tr>
	</table>
</s:form>