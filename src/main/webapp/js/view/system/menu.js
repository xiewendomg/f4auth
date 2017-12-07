/**
 * 菜单管理JS文件
 */

/**在新增菜单的时候初始化下拉框**/
var initOpenAdd=function(){
	$("#fm").find('#parent').combobox({    
	    url:'/menu.jspx?rootMenuCommobox',    
	    valueField:'id',    
	    textField:'menuName'   
	});  
	 $("#fm").find("#parent").combobox('readonly', false);
	 $("#fm").find("#statusTd1").css("display","none");
	 $("#fm").find("#statusTd2").css("display","none");
};

var initOpenEdit=function(){
	$("#fm").find('#parent').combobox({    
	    url:'/menu.jspx?rootMenuCommobox',    
	    valueField:'id',    
	    textField:'menuName'   
	});  
	 $("#fm").find("#parent").combobox('readonly', false);
	 $("#fm").find('#status').combobox({    
		    url:'/common.jspx?baseStatusCommobox',    
		    valueField:'key',    
		    textField:'value'   
	});  
	 $("#fm").find("#statusTd1").removeAttr("style");
	 $("#fm").find("#statusTd2").removeAttr("style");
}


/**
 * 提交增加或修改公共方法
 */
function submitSaveOrUpdateMenu(){
	 $("#fm").form("submit",{
		onSubmit:function(){
			return $(this).form("validate");
		},
		success:function(result){
			if(result=="\"success\""){
				$.messager.alert("系统提示","保存成功！");
				$("#saveOrUpdateDig").dialog("close");
				 $("#fm").form("reset");
				$("#dg").treegrid("reload");
			}else{
				$.messager.alert("系统提示","保存失败!\n"+result);
				return;
			}
		}
	 });
}


/**删除*/
function deleteFunMenu(url){
	var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length==0){
		 $.messager.alert("系统提示","请选择要删除的数据！");
		 return;
	 }
	 var strIds=[];
	 for(var i=0;i<selectedRows.length;i++){
		 strIds.push(selectedRows[i].id);
	 }
	 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？如删除一级菜单,所属下级菜单会级联删除！",function(r){
		if(r){
			$.post(url, {
				ids : JSON.stringify(strIds)
			}, function(data) {
				if("\"success\""==data){
					 $.messager.alert("系统提示","数据已成功删除！");
				}else{
					$.messager.alert("系统提示","数据删除失败，请联系系统管理员！");
				}
				$('#dg').treegrid('reload');
				$('#dg').treegrid('unselectAll');
			});
		} 
	 });
}


function openSaveOrUpdateMenu(isUpdate,title,flag){
	var params=null;
	//如果为修改用户
	if(isUpdate){
		var selectedRows=$("#dg").treegrid("getSelections");
		 if(selectedRows.length!=1){
			 $.messager.alert("系统提示","请选择一条要编辑的数据！");
			 return;
		 }
		 var row=selectedRows[0];
		 //如果为一级菜单，将无法修改为下级菜单
		 var hasChild=row.children.length;
		 $("#saveOrUpdateDig").dialog({
			 title:"编辑"+title,
			 modal: true
		 }).dialog("open");
		 $("#fm").form("load",row);
		 initOpenEdit();
		 if(hasChild!=0){
			 $("#fm").find("#parent").combobox('readonly', true);
		 }
		 $("#fm").find("#parent").combobox('setValue', row.parentId);
		 $("#fm").find("#status").combobox('setValue', row.status);
	}else{
		$("#saveOrUpdateDig").dialog({
			 title:"添加"+title,
			 modal: true
		 }).dialog("open");
		initOpenAdd();
	}
	
}