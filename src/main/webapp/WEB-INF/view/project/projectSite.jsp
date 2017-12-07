<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/base.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/view/project/projectSite.js"></script>
</head>
<body>
 <table id="dg" title="站点管理" class="easyui-datagrid"
   fitColumns="true" pagination="true" 
   url="${pageContext.request.contextPath}/projectSite.jspx?datagrid" fit="true" toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="projectSite" width="50" align="center">站点名称</th>
   		<th field="locn" width="50" align="center">图标地址</th>   		
   	</tr>
   </thead>
 </table>
 <div id="tb">
 <div id="search">
 		&nbsp;站点名称：&nbsp;<input type="text" easyuiClass  name="projectSite" size="20"/>
 		&nbsp;图标地址：&nbsp;<input type="text" easyuiClass  name="locn" size="20"/>
 		<a href="javascript:pubSeach()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 	<div>
 		<a href="javascript:openSaveOrUpdate(false,'站点管理')" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
 		<a href="javascript:openSaveOrUpdate(true,'站点管理')" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a> 		
 		<a href="javascript:deleteFun('${pageContext.request.contextPath}/projectSite.jspx?delete')" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 	
 </div>
 
 <div id="saveOrUpdateDig" class="easyui-dialog" style="width:320px;height:200px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   <form id="fm" method="post" action="${pageContext.request.contextPath}/projectSite.jspx?saveOrUpdate">
   	<input type="hidden" name="id">
   	<table cellspacing="8px">
   		<tr>
   			<td>名称：</td>
   			<td><input type="text" name="projectSite" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   			<tr>
   			<td>编码：</td>
   			<td><input type="text" name="locn" class="easyui-validatebox" data-options="validType:'locn',required:true"/>&nbsp;<font color="red">*</font></td>
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