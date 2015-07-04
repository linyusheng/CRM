<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div class="user">
	<img src="${pageContext.request.contextPath}/downloadPhoto" width="44" height="44" class="hoverimg" alt="Avatar" />
    <p><s:property value="#session.loginCategory"/></p>
    <p class="username"><s:property value="#session.loginName"/></p>    
    <p class="userbtn">
    <a href="${pageContext.request.contextPath}/viewpersonalmessage">用户中心</a></p>
    <p class="userbtn">
    <a href="${pageContext.request.contextPath}/logout">&nbsp;注&nbsp;&nbsp;&nbsp;销&nbsp;</a></p>

</div>