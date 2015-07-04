<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<script src="${pageContext.request.contextPath}/scripts/jquery.jclock.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/scripts/jquery.jclock-1.2.0.js.txt" type="text/javascript"></script>  
<script type="text/javascript">
$(function($) {
   	 	$('.jclock').jclock();
});
</script>

<div class="jclock" ></div>