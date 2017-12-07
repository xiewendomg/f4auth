/**
 * 打开增加或修改的公共方法
 * isUpdate:是否为修改
 * url为保存的地址
 * title 弹出框的名字 只需要写功能名，不需要写新增或修改
 */
function openSaveOrUpdate(isUpdate,title){
	var params=null;
	//如果为修改用户
	if(isUpdate){
		var selectedRows=$("#dg").datagrid("getSelections");
		 if(selectedRows.length!=1){
			 $.messager.alert("系统提示","请选择一条要编辑的数据！");
			 return;
		 }
		 var row=selectedRows[0];
		 $("#saveOrUpdateDig").dialog({
			 title:"编辑"+title,
			 modal: true
		 }).dialog("open");
		 $("#fm").form("load",row);
		 $("#fm").find('#status').combobox({    
			    url:'/common.jspx?baseStatusCommobox',    
			    valueField:'key',    
			    textField:'value'   
		});
		 $("#fm").find("#statusTd1").removeAttr("style");
		 $("#fm").find("#statusTd2").removeAttr("style");
	}else{
		 $("#fm").find("#statusTd1").css("display","none");
		 $("#fm").find("#statusTd2").css("display","none");
		$("#saveOrUpdateDig").dialog({
			 title:"添加"+title,
			 modal: true
		 }).dialog("open");
	}
}

/**
 * 打开增加或修改的公共方法
 * isUpdate:是否为修改
 * url为保存的地址
 * title 弹出框的名字 只需要写功能名，不需要写新增或修改
 * 调用初始化方法，统一名称为initOpenEdit和initOpenAdd
 */
function openSaveOrUpdateAndInit(isUpdate,title){
	var params=null;
	//如果为修改用户
	if(isUpdate){
		var selectedRows=$("#dg").datagrid("getSelections");
		 if(selectedRows.length!=1){
			 $.messager.alert("系统提示","请选择一条要编辑的数据！");
			 return;
		 }
		 var row=selectedRows[0];
		 $("#saveOrUpdateDig").dialog({
			 title:"编辑"+title,
			 modal: true
		 }).dialog("open");
		 $("#fm").form("load",row);
		 $("#fm").find('#status').combobox({    
			    url:'/common.jspx?baseStatusCommobox',    
			    valueField:'key',    
			    textField:'value'   
		});
		 $("#fm").find("#statusTd1").removeAttr("style");
		 $("#fm").find("#statusTd2").removeAttr("style");
		 $("#fm").find("#status").combobox('setValue', row.status);
		 initOpenEdit(row);
	}else{
		 $("#fm").find("#statusTd1").css("display","none");
		 $("#fm").find("#statusTd2").css("display","none");
		$("#saveOrUpdateDig").dialog({
			 title:"添加"+title,
			 modal: true
		 }).dialog("open");
		initOpenAdd();
	}
	
}

/**
 * 提交增加或修改公共方法
 */
function submitSaveOrUpdate(){
	 $("#fm").form("submit",{
		onSubmit:function(){
			return $(this).form("validate");
		},
		success:function(result){
			if(result=="\"success\""){
				$.messager.alert("系统提示","保存成功！");
				$("#saveOrUpdateDig").dialog("close");
				 $("#fm").form("reset");
				$("#dg").datagrid("reload");
			}else{
				$.messager.alert("系统提示","保存失败!\n"+result);
				return;
			}
		}
	 });
}
/**
 * 关闭增加或修改的窗口
 */
function closeSaveOrUpdateDig(){
	 $("#saveOrUpdateDig").dialog("close");
	 $("#fm").form("reset");
}

/**删除*/
function deleteFun(url){
	var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length==0){
		 $.messager.alert("系统提示","请选择要删除的数据！");
		 return;
	 }
	 var strIds=[];
	 for(var i=0;i<selectedRows.length;i++){
		 strIds.push(selectedRows[i].id);
	 }
	 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			$.post(url, {
				ids : JSON.stringify(strIds)
			}, function(data) {
				if("\"success\""==data){
					 $.messager.alert("系统提示","数据已成功删除！");
				}else{
					$.messager.alert("系统提示","数据删除失败，请联系系统管理员！");
				}
				$('#dg').datagrid('reload');
				$('#dg').datagrid('unselectAll');
			});
		} 
	 });
}

/**
 * 搜索公共方法
 */
function pubSeach(){
	var params=new Object();
	 var len=$("#search input").size();
	 $("#search input").each(function(i){
		 var obj=$(this);
		 var easyuiClass=obj.attr("class");
		 console.info(obj.attr("class"));
		 var values;
		 //判断是否为combobbox
		 if(easyuiClass==undefined||easyuiClass==null){
			 values=obj.val();
		 }
		 else if(easyuiClass.indexOf("easyui-combobox")!=-1){
			 values=obj.combobox("getValue");
		 }else if(easyuiClass.indexOf("easyui-datebox")!=-1){
			 values=obj.datebox("getValue");
		 }else{
			 values=obj.val();
		 }
		 var name=obj.attr("name");
		 if(name!=undefined&&name.length!=0){
			 if(values!=undefined&&values.length>0){
				 params[name]=values;
			 }
		 }
		 if(len-1==i){
			 $("#dg").datagrid('load',params);
		 }
	 });
}