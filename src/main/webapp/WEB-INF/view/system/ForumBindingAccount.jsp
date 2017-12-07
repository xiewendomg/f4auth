<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/base.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/view/system/ForumBindingAccount.js"></script>
</head>
<body>
 <table id="hhShen" title="论坛绑定审核" class="easyui-datagrid"
   fitColumns="true" pagination="true" 
   url="${pageContext.request.contextPath}/postbarAccount.jspx?findList" fit="true" toolbar="#db"> 
   <thead><tr>
   		<th field="cb" checkbox="true" align="40"></th>
   		<th field="createDatetime" width="40" align="center">申请绑定日期</th>
   		<th field="userNameStr" width="40" align="center">申请人</th>
   		<th field="projectSiteName" width="40" align="center">论坛</th>
   		<th field="bindAccount" width="40" align="center">论坛账户</th>
   	</tr>
   
 </table>
 <div id="db">
 <div id="search">
 		&nbsp;论坛：&nbsp;<input type="text" easyuiClass  name="projectSiteName" size="20"/>
 		<a href="javascript:pubSeach()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 	<div>
 <a href="javascript:openSaveOrUpdateAndInit(true,'论坛账号审核')" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">未通过</a> 
 <a href="javascript:audited('${pageContext.request.contextPath}/postbarAccount.jspx?updateStatus')" class="easyui-linkbutton" iconCls="icon-ok" plain="true">已审核</a>  
 	</div>
 	
 </div>

</body>
</html>