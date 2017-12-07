
//操作功能
function formatOper(val,row,index){  
    return '<input type="button" href="#" onclick="details('+row.id+')" value="查看详情">';
} 


//查看详情
function details(val){
 	 $('#dd').dialog({
     width: 800,
     height: 400,
     closed: false,
     cache: false,   
    href:"/withdrawals.jspx?find="+val,
     modal: true
     
	 }); 
 	
}

//审核功能
function Oper(val,row,index){  
	
	var status=row.status;
    if(status==1){
	   return '<a href="#" onclick="review('+row.status+','+row.id+')"  style="color:red">确认审核</a>';
    	
	 }
	 else{
		 return '已审核';
	 }
} 


//审核方法
function review(status,id){
	console.info(id)
	var data={
			id:id,
			updateStatus:status
	};
    $.post("withdrawals.jspx?updateStatus="+status,data,function(result){
    	if(result=="\"success\""){
			$.messager.alert("系统提示","审核成功！");		
		}else{
			$.messager.alert("系统提示","审核失败!\n"+result);
		}
    	$('#dd').dialog('close');
    	$('#dg').datagrid('reload');
	});
  	
}

function status(val,row,index){  
	var status=row.status;
    if(status==3){	 
	   return '已审核';
   } 
}
