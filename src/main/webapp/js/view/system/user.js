
/**
 * 初始打开的窗口
 */
var initOpenAdd=function(){
	$("#fm").find('#role').combobox({    
	    url:'/role.jspx?roleCommobox',    
	    valueField:'id',    
	    textField:'roleName'   
	});  
}


var initOpenEdit=function(row){
	$("#fm").find('#role').combobox({    
	    url:'/role.jspx?roleCommobox',    
	    valueField:'id',    
	    textField:'roleName'   
	});
	$("#fm").find('#role').combobox("setValue",row.idStr);
}