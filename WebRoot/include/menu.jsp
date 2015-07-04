<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<s:if test="#session.loginCategory=='销售人员'">
		<div class="notifications">
        	<s:form id="showwarnform" action="listsellswarn" method="post">
	            <s:hidden id="flag" name="flag" value="false" />
	        	<p class="notifycount"><a href="javascript:void(0)" onclick="{document.showwarnform.submit();}" title="" class="notifypop">New</a></p>
	            <p><a href="javascript:void(0)" onclick="{document.showwarnform.submit();}" title="" class="notifypop">销售提醒</a></p>
	            <p class="smltxt">(点击查看过期销售提醒)</p>
            </s:form>
        </div>
</s:if>
<ul id="nav">
	<li>
		<ul class="navigation">
			<s:if test="#session.loginCategory == '系统管理员'">
				<li >
				<a href="
				${pageContext.request.contextPath}/listuser
				">用户管理</a>
				</li>
			</s:if>			
			<s:elseif test="#session.loginCategory=='数据分析人员'">
				<li>
				<a href="
				${pageContext.request.contextPath}/productsale		
				">生成产品销售年度报表</a>
				</li>
				
				<li>
				<a href="
				${pageContext.request.contextPath}/achievement			
				">生成公司业绩年度报表</a>
				</li>
				
				<li>
				<a href="
				${pageContext.request.contextPath}/sellerreport		
				">生成销售人员合同统计报表</a>
				</li>
				
				<li>
				<a href="
				${pageContext.request.contextPath}/enterprisesale		
				">生成客户产品交易金额报表</a>
				</li>
				

			</s:elseif>
			<s:elseif test="#session.loginCategory=='疑难咨询处理人员'">
				<li>
				<a href="
				${pageContext.request.contextPath}/listproblem
				">疑难问题管理</a>
				</li>
			</s:elseif>			
			<s:elseif test="#session.loginCategory=='业务人员'">
				<li>
				<a href="
				${pageContext.request.contextPath}/listproduct
				">产品信息管理</a>
				</li>
					
				<li>
				<a href="
				${pageContext.request.contextPath}/listproductcate			
				">产品类别管理</a>
				</li>
			</s:elseif>			
			<s:elseif test="#session.loginCategory=='合同管理员'">
				<li>
				<a href="
				${pageContext.request.contextPath}/listcompact
				">合同管理</a>
				</li>
				
				<li>
				<a href="
				${pageContext.request.contextPath}/listoverduecompact
				">查看过期合同</a>
				</li>
			</s:elseif>
			<s:elseif test="#session.loginCategory=='客户服务人员'">
				<li>
				<a href="
				${pageContext.request.contextPath}/listcommonproblem
				">常见问题管理</a>
				</li>
				
				<li>
				<a href="
				${pageContext.request.contextPath}/listproblem
				">疑难问题管理</a>
				</li>
				
				<li>
				<a href="
				${pageContext.request.contextPath}/listcomplaint
				">投诉管理</a>
				</li>
			</s:elseif>		
			<s:elseif test="#session.loginCategory=='投诉处理人员'">
				<li>
				<a href="
				${pageContext.request.contextPath}/listcomplaint
				">投诉管理</a>
				</li>
			</s:elseif>	
			<s:elseif test="#session.loginCategory=='客户管理员'">
				<li>
				<a href="
				${pageContext.request.contextPath}/listenterprise
				">客户信息管理</a>
				</li>
			</s:elseif>				
			<s:elseif test="#session.loginCategory=='销售人员'">
				<li>
				<a href="
				${pageContext.request.contextPath}/listenterpriseforsell
				">查看客户信息</a>
				</li>
				
				<li>
				<a href="
				${pageContext.request.contextPath}/listcustomer
				">客户联系人管理</a>
				</li>
				
				<li>
				<a href="
				${pageContext.request.contextPath}/listcontactplan
				">客户联系计划管理</a>
				</li>
				
				<li>
				<a href="
				${pageContext.request.contextPath}/listcontactnote
				">客户联系记录管理</a>
				</li>
				
				<li>
				<a href="
				${pageContext.request.contextPath}/listsellsopportunity
				">销售机会管理</a>
				</li>
				
				<li>
				<a href="
				${pageContext.request.contextPath}/listsellswarn
				">销售提醒管理</a>
				</li>
				
				<li>
				<a href="
				${pageContext.request.contextPath}/listproductforsell
				">查看产品信息</a>
				</li>
			</s:elseif>
			
		</ul>
	</li>           
</ul> 