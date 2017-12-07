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
 <table id="tg" title="提现审核" class="easyui-datagrid"
   fitColumns="true" pagination="true" 
   url="${pageContext.request.contextPath}/withdrawals.jspx?updateStatus" fit="true" toolbar="#bb">
   <thead>
   	<tr>
   		<th field="id" checkbox="true" align="center"></th>
   		<th field="withdrawalsSN" width="50" align="center">提现编号</th>
   		<th field="userNameStr" width="50" align="center">用户名</th>
   		<th field="realNameStr" width="50" align="center">真实姓名</th>
   		<th field="withdrawalsMoney" width="50" align="center">提现金额</th>
   		<th field="accountTypeStr" width="50" align="center">提现方式</th>
   		<th field="status" width="50" align="center" formatter="Oper">操作</th>
   		 		
   	</tr>
   	
   </thead>
	   <tr>
	   		<td>${withdrawals.id}</td>
	   		<td>${withdrawals.withdrawalsSN}</td>
	   		<td>${withdrawals.userNameStr}</td>
	   		<td>${withdrawals.realNameStr}</td>
	   		<td>${withdrawals.withdrawalsMoney}</td>
	   		<td>${withdrawals.accountTypeStr}</td>
	   <!-- <td><input type="button" value="操作" onclick="check(this)"</td>	-->	   					
 	   		<td>${withdrawals.status}</td>
 	   </tr>
 </table> 
 
</body>
</html>