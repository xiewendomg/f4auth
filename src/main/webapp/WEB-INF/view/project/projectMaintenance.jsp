<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/base.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/view/project/project.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/vl.js"></script>

</head>
<body>
 <table id="dg" title="项目管理" class="easyui-datagrid"
   fitColumns="true" pagination="true" 
   url="${pageContext.request.contextPath}/project.jspx?datagrid" fit="true" toolbar="#tb" singleSelect="true">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="projectNumber" width="50" align="center">项目编号</th>
   		<th field="projectName" width="50" align="center">项目名称</th>  
   		<th field="projectSiteIdStr" width="50" align="center">项目站点</th>
   		<th field="levelIdStr" width="50" align="center">项目等级</th>  
   		<th field="sumMoney" width="50" align="center">项目金额</th>
   		<th field="statusStr" width="50" align="center">项目状态</th> 
   		<th field="totalTask" width="50" align="center">任务总数</th>	   		
   		<th field="wqeqwe" width="200" align="left" formatter="formatOper">操作</th>    		
   	</tr>
   </thead>
 </table>
 <div id="tb">
   <div id="search"> 
 		&nbsp;项目名称：&nbsp;<input type="text"   name="projectName" size="20"/>
 		&nbsp;项目编号：&nbsp;<input type="text" class="easyui-numberbox"  name="projectNumber" size="20"/>
 		&nbsp;项目状态：&nbsp;<input id="ffdd" type="text" name="status" size="7"/>
 		<a href="javascript:pubSeach()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 	<div>
 		<a href="javascript:openSaveOrUpdateAndInit(false,'项目管理')" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
 		<a href="javascript:openSaveOrUpdateAndInit(true,'项目管理')" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a> 		
 		<a href="javascript:deleteFun('${pageContext.request.contextPath}/project.jspx?delete')" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 	
 </div>
 <!-- 新增&修改 -->
 <div id="saveOrUpdateDig" class="easyui-dialog" style="width:500px;height:300px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   <form id="fm" method="post" action="${pageContext.request.contextPath}/project.jspx?saveOrUpdate">
   	<input type="hidden" name="id">
   	<table cellspacing="8px">
	   	<tr>
	   		<td>项目编号：</td>
	   		<td><input type="text"  name="projectNumber" class="easyui-numberbox" data-options="validType:['minLength[3]','remote'],required:true" />&nbsp;<font color="red">*</font></td>
	   	</tr>
   		<tr>
   			<td>项目名称：</td>
   			<td><input type="text" name="projectName" class="easyui-validatebox" data-options="validType:'minLength[2]',required:true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   			<tr>
   			<td>项目站点：</td>
   			<td><input id="cc" type="text" name="projectSiteId.id" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>项目等级：</td>
   			<td><input type="text" id="ll" name="levelId.id"  required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>链接地址：</td>
   			<td><input type="text" name="link" class="easyui-validatebox" data-options="validType:'minLength[10]',required:true"/>&nbsp;<font color="red">*</font></td>
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
<!--  新页面 -->
<div id="dd" class="easyui-dialog" style="height:440px;"   
        data-options="iconCls:'icon-save',resizable:true,modal:true">   
     
    <div id="tb23" style="display:none;" >
 	<div>
 		<a href="javascript:taskOpenSaveOrUpdate(false,'任务管理')" class="easyui-linkbutton" iconCls="icon-add" plain="true" >添加</a>
 		<a href="javascript:taskOpenSaveOrUpdate(true,'任务管理')" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a> 		
 		<a href="javascript:taskDeleteFun('${pageContext.request.contextPath}/task.jspx?delete')" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 </div>
 <table id="taskDg" class="easyui-datagrid"   style="width:800px;height: 400px"  >
   	<thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>  		
   		<th field="taskSerialNumber" width="100" align="center">任务流水号</th>
   		<th field="taskRole" width="100" align="center">任务角色</th>  	
   		<th field="userName" width="100" align="center">任务执行人</th>
   		<th field="taskTime" width="100" align="center">任务时间</th>    		 	 
   		<th field="content" width="100" align="center">任务内容</th>   
   		<th field="taskAmount" width="100" align="center">任务金额</th>  		 
   		<th field="wqeqwe" width="200" align="center" formatter="formatTask">操作</th> 
   	</tr>
   </thead>
 </table>  
     
     
        
</div>  


 <div id="dd2"></div>
 <div id="ddson" class="easyui-dialog" style="width:500px;height:250px;" data-options="iconCls:'icon-save',resizable:true,modal:true">
 <table id="taskSonDg" class="easyui-datagrid" style="width:500px;height:200px">
 	
 	
 </table>
 
 </div>
 <div id="dson" class="easyui-dialog" title="审核任务" style="width:400px;height:200px;padding:10px;" >
 <form id="dSonfm" method="post" action="${pageContext.request.contextPath}/taskAudit.jspx?saveOrUpdate">
   	<input type="hidden" name="id">
   	<input type="hidden" name="taskId.id" id="taskId" >
   	<table cellspacing="8px">
	   	<tr>
	   		<td>通过<input type="radio" name="status" checked="checked" value="1"/></td>
	   		<td>
	   		未通过<input type="radio" name="status"  value="2"/>
	   		</td>
	   	</tr>
   		<tr>
   			<td>审核理由：</td>
   			<td><textarea rows="" cols="" required="true" name="taskRegard" class="easyui-validatebox" ></textarea>&nbsp;<font color="red">*</font></td>
   		</tr>
  		<tr>
   			
   			<td><input type="button" value="提交" onclick="submitShenHe()"></td>
   		</tr>			   		
   	</table>
   </form>
 
 </div>
 
 <!-- 新增任务 -->
  <!-- 新增&修改 -->
 <div id="taskSaveOrUpdateDig" class="easyui-dialog" style="width:700px;height:450px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons2">
   <form id="taskFm" method="post" action="${pageContext.request.contextPath}/task.jspx?saveOrUpdate">
   	<input type="hidden" name="id">
   	<input type="hidden" name="status"  id="statusId">
   	<input type="hidden" name="projectId.id" id="taskProjectID">
   	<table cellspacing="8px">
	    
   		<tr>
   			<td>任务角色：</td>
   			<td><input type="text" name="taskRole" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		
   		<tr>
   			<td>任务金额：</td>
   			<td><input type="text" name="taskAmount" class="easyui-numberbox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>任务时间：</td>
   			<td><input type="text" class="easyui-datetimebox"  name="taskTime" size="20" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>任务内容：</td>
   			<td><textarea rows="10" cols="50" name="content" class="easyui-validatebox" required="true"></textarea></td>
   		</tr>
   		<tr>
   			<td id="taskStatusTd1" style="display: none;">状态：</td>
	   		<td id="taskSstatusTd2" style="display: none;"><input id="status" name="status"></td>
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

