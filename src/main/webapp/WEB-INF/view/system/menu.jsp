<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/base.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/view/system/menu.js"></script>
</head>
<body>
 <table id="dg" title="菜单管理" class="easyui-treegrid" data-options="url:'${pageContext.request.contextPath}/menu.jspx?datagrid',method: 'get',rownumbers: true,idField: 'id',treeField: 'name',fitColumns: true,fit:true"	toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="menuName" width="50" align="left">名称</th>
   		<th field="menuCode" width="50" align="center">编码</th>
   		<th field="url" width="50" align="center">请求地址</th>
   		<th field="sequence" width="50" align="center">显示顺序</th>
   		<th field="statusStr" width="50" align="center">状态</th>
   	</tr>
   </thead>
 </table>
 <div id="tb">
 <div id="search">
 	</div>
 	<div>
 		<a href="javascript:openSaveOrUpdateMenu(false,'菜单管理',true)" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
 		<a href="javascript:openSaveOrUpdateMenu(true,'菜单管理')" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
 		<a href="javascript:deleteFunMenu('${pageContext.request.contextPath}/menu.jspx?delete')" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 	
 </div>
 
 <div id="saveOrUpdateDig" class="easyui-dialog" style="width:650px;height:220px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   <form id="fm" method="post" action="${pageContext.request.contextPath}/menu.jspx?saveOrUpdate">
   	<input type="hidden" name="id">
   	<table cellspacing="8px">
   		<tr>
   			<td>所属上级菜单：</td>
   			<td> <input id="parent" name="parentMenu.id">  
   			&nbsp;<font color="red">*</font></td>
   			<td>名称：</td>
   			<td><input type="text" name="menuName" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>编码：</td>
   			<td><input type="text" name="menuCode" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   			<td>请求地址：</td>
   			<td><input type="text" name="url" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>显示顺序：</td>
   			<td><input type="text" name="sequence" class="easyui-numberbox" data-options="min:1,precision:0" required="true"/>&nbsp;<font color="red">*</font></td>
	   		<td id="statusTd1">状态：</td>
	   		<td id="statusTd2"><input id="status" name="status"></td>
   		</tr>
   	</table>
   </form>
 </div>
 <div id="dlg-buttons">
 	<a href="javascript:submitSaveOrUpdateMenu()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:closeSaveOrUpdateDig()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div>
</body>
</html>
