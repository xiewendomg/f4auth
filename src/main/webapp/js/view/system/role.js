/**
 * 打开授权窗口
 */
var openAuth=function(){
	var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要编辑的数据！");
		 return;
	 }
	 var row=selectedRows[0];
		$("#saveAuth").dialog({
			 title:"菜单授权",
			 modal: true
		}).dialog("open");
		
		$('#tt').tree({    
		    url:'/role.jspx?loadMenuByRole&id='+row.id
		});  
	
		$("#fmAuth").find("#id").val(row.id);
};

/**
 * 关闭增加或修改的窗口
 */
function closeAuthDig(){
	 $("#saveAuth").dialog("close");
}
/**
 * 保存授权操作
 */
var saveAuth=function(){
	var nodes = $('#tt').tree('getChecked');
	var s = '';
	for(var i=0; i<nodes.length; i++){
		if (s != '') s += ',';
		s += nodes[i].id;
	}
	var id=$("#fmAuth").find("#id").val();
	
	var data={
			id:id,
			treeIds:s
	};
	$.post("/role.jspx?saveAuth",data,function(result){
		if(result=="\"success\""){
			$.messager.alert("系统提示","保存成功！");
		}else{
			$.messager.alert("系统提示","保存失败!\n"+result);
		}
	});
};
