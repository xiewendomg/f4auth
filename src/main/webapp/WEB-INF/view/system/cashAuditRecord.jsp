<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/base.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/view/system/withdrawals.js">

</script>
</head>
<body>
 <table id="rg" title="提现记录" class="easyui-datagrid"
   fitColumns="true" pagination="true" 
   url="${pageContext.request.contextPath}/record.jspx?findRecord" fit="true" toolbar="#gb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="withdrawalsSN" width="50" align="center">提现编号</th>
   		<th field="userNameStr" width="50" align="center">用户名</th>
   		<th field="realNameStr" width="50" align="center">真实姓名</th>
   		<th field="withdrawalsMoney" width="50" align="center">提现金额</th>
   		<th field="accountTypeStr" width="50" align="center">提现方式</th>
   		<th field="createDatetime" width="50" align="center">申请时间</th>
   		<th field="status" width="50" align="center" formatter="status">状态</th> 		
   	</tr>
   </thead>
 </table>
 <div id="gb">
 <div id="search">
 		&nbsp;用户名：&nbsp;<input type="text" easyuiClass  name="userName" size="20"/>
 		&nbsp;真实姓名：&nbsp;<input type="text" easyuiClass  name="realName" size="20"/>
 		<a href="javascript:pubSeach()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 	
 
 	
 </div>
 
</body>
</html>