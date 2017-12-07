<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/base.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/view/system/user.js"></script>
</head>
<body>
 <table id="dg" title="用户管理" class="easyui-datagrid"
   fitColumns="true" pagination="true" 
   url="${pageContext.request.contextPath}/user.jspx?datagrid" fit="true" toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="userName" width="50" align="center">用户名</th>
   		<th field="nickName" width="50" align="center">昵称</th>
   		<th field="realName" width="50" align="center">真实姓名</th>
   		<th field="roleNameStr" width="50" align="center">所属角色</th>
   		<th field="phone" width="50" align="center">电话号码</th>
   		<th field="lastLoginTime" width="50" align="center">最后登录时间</th>
   		<th field="statusStr" width="50" align="center">状态</th>
   	</tr>
   </thead>
 </table>
 <div id="tb">
 <div id="search">
 		&nbsp;用户名：&nbsp;<input type="text" easyuiClass  name="userName" size="20"/>
 		&nbsp;真实姓名：&nbsp;<input type="text" easyuiClass  name="realName" size="20"/>
 		<a href="javascript:pubSeach()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 	<div>
 		<a href="javascript:openSaveOrUpdateAndInit(false,'用户管理')" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
 		<a href="javascript:openSaveOrUpdateAndInit(true,'用户管理')" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
 		<a href="javascript:deleteFun('${pageContext.request.contextPath}/user.jspx?delete')" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 	
 </div>
 
 <div id="saveOrUpdateDig" class="easyui-dialog" style="width:650px;height:220px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   <form id="fm" method="post" action="${pageContext.request.contextPath}/user.jspx?saveOrUpdate">
   	<input type="hidden" name="id">
   	<table cellspacing="8px">
   		<tr>
   			<td>用户名</td>
   			<td> <input type="text" name="userName" class="easyui-validatebox" required="true"/> 
   			&nbsp;<font color="red">*</font></td>
   			<td>真实姓名：</td>
   			<td><input type="text" name="realName" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>昵称</td>
   			<td> <input type="text" name="nickName" class="easyui-validatebox" required="true"/> 
   			&nbsp;<font color="red">*</font></td>
   			<td>电话号码：</td>
   			<td><input type="text" name="phone" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>密码：</td>
   			<td><input type="password" name="password" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   			<td>所属角色：</td>
   			<td><input id="role" name="roleId.id">&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
	   		<td id="statusTd1">状态：</td>
	   		<td id="statusTd2"><input id="status" name="status"></td>
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