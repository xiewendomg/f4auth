<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/base.jsp"/>


</head>
<body>
 <table id="taskDg" class="easyui-datagrid"
   fitColumns="true" pagination="true" 
   url="${pageContext.request.contextPath}/task.jspx?datagridById=${projectId}" fit="true"  toolbar="#tb2" style="height:400px" >
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>  		
   		<th field="taskSerialNumber" width="50" align="center">任务流水号</th>
   		<th field="taskRole" width="50" align="center">任务角色</th>  	
   		<th field="taskTime" width="50" align="center">任务时间</th>    		 	 
   		<th field="content" width="50" align="center">任务内容</th>   
   		<th field="taskAmount" width="50" align="center">任务金额</th>	
   		<th field="wqeqwe" width="50" align="center" formatter="formatTask">操作</th> 	
   	</tr>
   </thead>
 </table>
<div id="tb2">
 
 	<div>
 		<a href="javascript:taskOpenSaveOrUpdate(false,'任务管理')" class="easyui-linkbutton" iconCls="icon-add" plain="true" >添加</a>
 		<a href="javascript:taskOpenSaveOrUpdate(true,'任务管理')" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a> 		
 		<a href="javascript:taskDeleteFun('${pageContext.request.contextPath}/task.jspx?delete')" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 	
 </div>
 <!-- 新增&修改 -->
 <div id="taskSaveOrUpdateDig" class="easyui-dialog" style="width:320px;height:200px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons2">
   <form id="taskFm" method="post" action="${pageContext.request.contextPath}/task.jspx?saveOrUpdate">
   	<input type="hidden" name="id">
   	<input type="hidden" name="projectId.id" value="${projectId}">
   	<table cellspacing="8px">
	   
   		<tr>
   			<td>任务角色：</td>
   			<td><input type="text" name="taskRole" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		
   		<tr>
   			<td>任务金额：</td>
   			<td><input type="text" name="taskAmount" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>任务时间：</td>
   			<td><input type="text" class="easyui-datebox"  name="taskTime" size="20" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>任务内容：</td>
   			<td><input type="text" name="content" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td id="statusTd1" style="display: none;">状态：</td>
	   		<td id="statusTd2" style="display: none;"><input id="status" name="status"></td>
   		</tr>
   	</table>
   </form>
 </div>
 <div id="dlg-buttons2">
 	<a href="javascript:taskSubmitSaveOrUpdate()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:taskCloseSaveOrUpdateDig()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div> 	
 
 

</body>
</html>