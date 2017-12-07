<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/base.jsp"/>


</head>
<body>

 <table id="taskSonDg" class="easyui-datagrid"
   fitColumns="true" pagination="true" 
   url="${pageContext.request.contextPath}/taskAudit.jspx?datagridBytaskId=${taskId}" fit="true"  style="height:400px" >
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>  		
   		<th field="statusStr" width="50" align="center">审核状态</th>
   		<th field="taskRegard" width="50" align="center">审核理由</th>  	   		   		 	
   	</tr>
   </thead>
 </table>
 
 

</body>
</html>