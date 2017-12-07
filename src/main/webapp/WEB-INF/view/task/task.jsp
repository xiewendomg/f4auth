<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/base.jsp"/>

</head>
<body>
 <table id="dg" title="站点管理" class="easyui-datagrid"
   fitColumns="true" pagination="true" 
   url="${pageContext.request.contextPath}/task.jspx?datagrid" fit="true" toolbar="#tb" >
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>  		
   		<th field="taskSerialNumber" width="50" align="center">任务流水号</th>
   		<th field="taskRole" width="50" align="center">任务角色</th>  	
   		<th field="taskTime" width="50" align="center">任务时间</th>    		 	 
   		<th field="content" width="50" align="center">任务内容</th>   
   		<th field="taskAmount" width="50" align="center">任务金额</th>		
   	</tr>
   </thead>
 </table>
 <div id="tb">
 <div id="search">
 		&nbsp;任务内容：&nbsp;<input type="text" easyuiClass  name="content" size="20"/>
 		
 		<a href="javascript:pubSeach()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 	<div>
 		<a href="javascript:openSaveOrUpdateAndInit(false,'任务管理')" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
 		<a href="javascript:openSaveOrUpdateAndInit(true,'任务管理')" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a> 		
 		<a href="javascript:deleteFun('${pageContext.request.contextPath}/task.jspx?delete')" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 	
 </div>
 <!-- 新增&修改 -->
 <div id="saveOrUpdateDig" class="easyui-dialog" style="width:320px;height:200px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   <form id="fm" method="post" action="${pageContext.request.contextPath}/task.jspx?saveOrUpdate">
   	<input type="hidden" name="id">
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
 <div id="dlg-buttons">
 	<a href="javascript:submitSaveOrUpdate()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:closeSaveOrUpdateDig()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div> 	
 
 

</body>
</html>