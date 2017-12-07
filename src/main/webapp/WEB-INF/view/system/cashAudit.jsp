<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/base.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/view/system/withdrawals.js"></script>

</head>
<body>
 <table id="dg" title="提现审核" class="easyui-datagrid"
   fitColumns="true" pagination="true" 
   url="${pageContext.request.contextPath}/withdrawals.jspx?datagrid" fit="true" toolbar="#sb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="withdrawalsSN" width="50" align="center">提现编号</th>
   		<th field="userNameStr" width="50" align="center">用户名</th>
   		<th field="withdrawalsMoney" width="50" align="center">提现金额</th>
   		<th field="createDatetime" width="50" align="center">申请时间</th>
   		<th field="option" width="50" align="center" formatter="formatOper">操作</th>
   		 		
   	</tr>
   </thead>
 </table>
 <div id="sb">
 <div id="search">
 		&nbsp;用户名：&nbsp;<input type="text" easyuiClass  name="userId.userName" size="20"/>
 		&nbsp;真实姓名：&nbsp;<input type="text" easyuiClass  name="userId.realName" size="20"/>
 		<a href="javascript:pubSeach()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 	
 	<div id="dd">
 	
 	</div>
 	
 </div>
 
</body>
</html>