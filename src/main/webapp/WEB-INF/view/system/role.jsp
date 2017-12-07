<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/base.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/view/system/role.js"></script>
</head>
<body>
 <table id="dg" title="角色管理" class="easyui-datagrid"
   fitColumns="true" pagination="true" 
   url="${pageContext.request.contextPath}/role.jspx?datagrid" fit="true" toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="roleName" width="50" align="center">名称</th>
   		<th field="roleCode" width="50" align="center">编码</th>
<!--    		<th field="lastLoginTime" width="50" align="center">最后修改时间</th>
 -->   		<th field="statusStr" width="50" align="center">状态</th>
   	</tr>
   </thead>
 </table>
 <div id="tb">
 <div id="search">
 		&nbsp;名称：&nbsp;<input type="text" easyuiClass  name="roleName" size="20"/>
 		&nbsp;编码：&nbsp;<input type="text" easyuiClass  name="roleCode" size="20"/>
 		<a href="javascript:pubSeach()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 	<div>
 		<a href="javascript:openSaveOrUpdate(false,'角色管理')" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
 		<a href="javascript:openSaveOrUpdate(true,'角色管理')" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
 		<a href="javascript:openAuth()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">菜单授权</a>
 		<a href="javascript:deleteFun('${pageContext.request.contextPath}/role.jspx?delete')" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 	
 </div>
 
 <div id="saveOrUpdateDig" class="easyui-dialog" style="width:320px;height:200px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   <form id="fm" method="post" action="${pageContext.request.contextPath}/role.jspx?saveOrUpdate">
   	<input type="hidden" name="id">
   	<table cellspacing="8px">
   		<tr>
   			<td>名称：</td>
   			<td><input type="text" name="roleName" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   			<tr>
   			<td>编码：</td>
   			<td><input type="text" name="roleCode" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
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
 
 <!-- 授权的窗口 -->
 <div id="saveAuth" class="easyui-dialog" style="width:320px;height:600px;padding: 10px 20px"
   closed="true" buttons="#auth-buttons">
   <form id="fmAuth" method="post" >
   		<input type="hidden" name="id" id="id">
   		<ul id="tt" class="easyui-tree" data-options="method:'get',animate:true,checkbox:true"></ul>
   </form>
 </div>
 <div id="auth-buttons">
 	<a href="javascript:saveAuth()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:closeAuthDig()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div>
</body>
</html>