/*
$(function(val,row,index){
	
	
});
function checkchange(){
	
}

function checkchange2(val,row){
	var row = $('#dg').datagrid('getSelections');
	if(row.length!=0){
	alert(row[0]);
	console.info(row);
	console.info(row[0].id);
	}else{
		alert("dsaaaaaaa");
	}
}

*/

function audited(url){
	var selectedRows=$("#hhShen").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要编辑的数据！");
		 return;
	 }	
	 var row=selectedRows[0];
	 
	 $.messager.confirm("系统提示","您确定这<font color=red>"+selectedRows.length+"</font>条已审核吗？",function(r){
		if(r){
			$.post(url+"="+row.status+"&id="+row.id, function(data) {
				if("\"success\""==data){
					 $.messager.alert("系统提示","审核通过！");
				}else{
					$.messager.alert("系统提示","失败！");
				}
				$('#hhShen').datagrid('reload');
				$('#hhShen').datagrid('unselectAll');
			});
		} 
	 });
}