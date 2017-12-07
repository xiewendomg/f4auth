var find=function(row){
	$("#fm").find('#projectSiteName').combobox({    
	    url:'/bindAccount.jspx?projectSiteNameCommobox',    
	    valueField:'id',    
	    textField:'projectSiteName'   
	});
	$("#fm").find('#projectSiteName').combobox("setValue",row.id);
}



/**
 * 提交增加或修改公共方法
 */
function submitSave(){
	 $("#fm").form("submit",{
		onSubmit:function(){
			return $(this).form("validate");
		},
		success:function(result){
			if(result=="\"success\""){
				$.messager.alert("系统提示","保存成功！");
				 $("#fm").form("reset");
				
			}else{
				$.messager.alert("系统提示","保存失败!\n"+result);
				return;
			}
		}
	 });
}