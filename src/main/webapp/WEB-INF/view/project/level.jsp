<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/base.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/view/project/level.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/vl.js"></script>
</head>
<body>
 <table id="dg" title="等级管理" class="easyui-datagrid"
   fitColumns="true" pagination="true" 
   url="${pageContext.request.contextPath}/level.jspx?datagrid" fit="true" toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="level" width="50" align="center">等级</th>
   		<th field="orderr" width="50" align="center">顺序</th>   		
   	</tr>
   </thead>
 </table>
 <div id="tb">
 <div id="search">
 		&nbsp;等级：&nbsp;<input type="text" easyuiClass  name="level" size="20"/>
 		&nbsp;顺序：&nbsp;<input type="text" easyuiClass  name="orderr" size="20"/>
 		<a href="javascript:pubSeach()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 	<div>
 		<a href="javascript:openSaveOrUpdate(false,'等级管理')" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
 		<a href="javascript:openSaveOrUpdate(true,'等级管理')" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a> 		
 		<a href="javascript:deleteFun('${pageContext.request.contextPath}/level.jspx?delete')" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 	
 </div>
 
 <div id="saveOrUpdateDig" class="easyui-dialog" style="width:320px;height:200px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   <form id="fm" method="post" action="${pageContext.request.contextPath}/level.jspx?saveOrUpdate">
   	<input type="hidden" name="id">
   	<table cellspacing="8px">
   		<tr>
   			<td>等级：</td>
   			<td><input type="text" name="level" class="easyui-validatebox" data-options="validType:'level',required:true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   			<tr>
   			<td>顺序：</td>
   			<td><input type="text" name="orderr" class="easyui-numberbox" data-options="validType:'orderr',required:true"/>&nbsp;<font color="red">*</font></td>
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