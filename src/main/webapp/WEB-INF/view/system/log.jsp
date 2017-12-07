<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/base.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datagrid-detailview.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/view/system/log.js"></script>
</head>
<body>
 <table id="dg" title="日志管理" class="easyui-datagrid"
   fitColumns="true" pagination="true" 
   url="${pageContext.request.contextPath}/log.jspx?datagrid" fit="true" toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="level" width="50" align="center">日志类型</th>
   		<th field="category" width="50" align="center">来源类别</th>
   		<th field="thread" width="50" align="center">操作线程</th>
   		<th field="time" width="50" align="center">执行时间</th>
   		<th field="message" width="50" align="center">操作信息</th>
   		<th field="userName" width="50" align="center">操作人</th>
   	</tr>
   </thead>
 </table>
 <div id="tb">
 <div id="search">
 		&nbsp;日志类型：&nbsp;<input type="text" class="easyui-combobox"  data-options="valueField:'key',textField:'value',url:'${pageContext.request.contextPath}/common.jspx?logLevelCommbox'"  name="level" size="20"/>
 		&nbsp;执行时间：&nbsp;<input type="text" class="easyui-datebox"  name="startDate" size="20"/>~<input type="text" class="easyui-datebox"  name="endDate" size="20"/>
 		&nbsp;操作人：&nbsp;<input type="text" easyuiClass  name="user.loginName" size="20"/>
 		<a href="javascript:pubSeach()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 	<div>
 		<a href="javascript:deleteFun('${pageContext.request.contextPath}/log.jspx?delete')" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 	
 </div>
 
 <div id="saveOrUpdateDig" class="easyui-dialog" style="width:320px;height:250px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   <form id="fm" method="post" action="${pageContext.request.contextPath}/log.jspx?saveOrUpdate">
   	<input type="hidden" name="id">
   	<table cellspacing="8px">
   		<tr>
   			<td>类型：</td>
   			<td><input type="text" name="type" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
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