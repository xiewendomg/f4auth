$(function(){
	$('#dson').dialog('close');
	$('#dd').dialog('close');	
	$('#ddson').dialog('close');
	$('#taskSaveOrUpdateDig').dialog('close');
	$('#ffdd').combobox({    
	    url:'/common.jspx?projectStatusCommobox',    
	    valueField:'key',    
	    textField:'value'
	}); 
});
var initOpenEdit=function(row){	
	console.info(row);
	$("#fm").find("#statusTd1").css("display","none");
	$("#fm").find("#statusTd2").css("display","none");
	$('#cc').combobox({    
	    url:'/project.jspx?projectCommoboxSite',    
	    valueField:'id',    
	    textField:'projectSite'
	});  
	$('#ll').combobox({    
	    url:'/project.jspx?projectCommoboxLevel',    
	    valueField:'id',    
	    textField:'level'
	}); 
	$("#fm").find('#cc').combobox("setValue",row.projectSiteIdId);
	$("#fm").find('#ll').combobox("setValue",row.levelIdId);
	
}

var initOpenAdd=function(){
	
	$('#cc').combobox({    
	    url:'/project.jspx?projectCommoboxSite',    
	    valueField:'id',    
	    textField:'projectSite' ,
	    editable:false
	});  
	$('#ll').combobox({    
	    url:'/project.jspx?projectCommoboxLevel',    
	    valueField:'id',    
	    textField:'level' ,
	    editable:false
	}); 
}


/**
 * 打开增加或修改的公共方法
 * isUpdate:是否为修改
 * url为保存的地址
 * title 弹出框的名字 只需要写功能名，不需要写新增或修改
 */
var taskOpenSaveOrUpdate=function(isUpdate,title){
	 
	var params=null;
	//如果为修改用户
	if(isUpdate){
		var selectedRows=$("#taskDg").datagrid("getSelections");
		 if(selectedRows.length!=1){
			 $.messager.alert("系统提示","请选择一条要编辑的数据！");
			 return;
		 }
		 var row=selectedRows[0];
		 $("#taskSaveOrUpdateDig").dialog({
			 title:"编辑"+title,
			 modal: true
		 }).dialog("open");
		 $("#taskFm").form("load",row);
		 console.info(row.status);
		 $("#statusId").val(row.status);
		 //状态下拉框
		 $("#taskFm").find('#status').combobox({    
			    url:'/common.jspx?baseStatusCommobox',    
			    valueField:'key',    
			    textField:'value'   
		});		 
	}else{
		 $("#taskFm").find("#statusTd1").css("display","none");
		 $("#taskFm").find("#statusTd2").css("display","none");		 
		$("#taskSaveOrUpdateDig").dialog({
			 title:"添加"+title,
			 modal: true			
		 }).dialog("open");
	}
}



/**
 * 提交增加或修改公共方法
 */
var taskSubmitSaveOrUpdate=function (){
	console.info($("#taskFm").get(0));		
	 $("#taskFm").form("submit",{
		onSubmit:function(){
			return $(this).form("validate");
			
		},
		success:function(result){
			if(result=="\"success\""){
				$.messager.alert("系统提示","保存成功！");
				$("#taskSaveOrUpdateDig").dialog("close");
				 $("#taskFm").form("reset");
				$("#taskDg").datagrid("reload");
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
var taskCloseSaveOrUpdateDig=function (){
	 $("#taskSaveOrUpdateDig").dialog("close");
	 $("#taskFm").form("reset");
}

/**删除*/
var taskDeleteFun=function (url){
	var selectedRows=$("#taskDg").datagrid("getSelections");
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
				$('#taskDg').datagrid('reload');
				$('#taskDg').datagrid('unselectAll');
			});
		} 
	 });
}

/**
 * 搜索公共方法
 */
var taskPubSeach=function(){
	var params=new Object();
	 var len=$("#taskSearch input").size();
	 $("#taskSearch input").each(function(i){
		 var obj=$(this);
		 var easyuiClass=obj.attr("class");
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
			 $("#taskDg").datagrid('load',params);
		 }
	 });
}
//操作功能
var formatOper=function (val,row,index){ 
	var str="";
	var str1='<input type="button" href="#" onclick="seeTask(\''+row.projectName+"\',"+row.id+','+row.status+')" value="查看详情" style="color:blue">&nbsp;&nbsp;';
	console.info(row.status)
	switch (row.status) {
	case 1:
		str='<input type="button" href="#" onclick="addTask(\''+row.projectName+"\',"+row.id+','+row.status+')" value="任务维护" style="color:red">&nbsp;&nbsp;<input type="button"  onclick="changeProjectStatusS('+row.id+','+2+')" value="发布项目" style="color:green">';
		break;
	case 2:
		str='<span style="color:blue"> 项目任务领取中</span>';
		break;
	case 3:
		str='<span style="color:blue"> 项目执行中</span>';
		break;	
	case 4:
		str='<input type="button" href="#" onclick="addTask(\''+row.projectName+"\',"+row.id+','+row.status+')" value="审核任务" style="color:red">&nbsp;&nbsp;<input type="button"  onclick="changeProjectStatusS('+row.id+','+5+')" value="一键审核" style="color:green">';
		break;
	case 5:
		str='<input type="button" href="#" onclick="addTask(\''+row.projectName+"\',"+row.id+','+row.status+')" value="查看详情" style="color:blue">';
		break;
	default:
		break;
	}		
    return str;  
} 
//添加项目任务
var addTask=function (name,val,status){	
 	console.info("status="+status);
 	console.info("val="+val);
 	console.info(status!=1);		
 	$('#dd').dialog({    
 	    title: name+'任务列表',    	   
 	});  	
 	 $('#dd').dialog("open");
 	 $('#taskProjectID').val(val);	
 	 $('#taskDg').datagrid({    
 	  url:'/task.jspx?datagridById='+val, 
 	  toolbar:"#tb23",
 	  pagination:true   
 	}); 	 
 	if(status==1){
 		$('#tb23').show();
 	}else{
 		$('#tb23').hide();
 	}
 	 
}

var formatTask=function(value,row,index){
	console.info(row);
	console.info(row.projectId.status);
	  var str="";
	switch (row.status) {
	case 4:
		str = '<input type="button" href="#" onclick="seeTaskAuditSon(\''+ row.taskName+ "\',"+ row.id+ ')" value="审核任务" style="color:red">&nbsp;&nbsp;<input type="button"  onclick="allTaskAuditSon(\''+ row.userName + "\'," + row.id+ ')" value="审核记录" style="color:green">';
		break;
	case 5:
		str = '<span style="color:blue"> 审核完成</span>&nbsp;&nbsp;<input type="button"  onclick="allTaskAuditSon(\''+ row.userName+ "\',"+ row.id+ ')" value="审核记录" style="color:green">';

		break;
	case 1:
		str = '<span style="color:blue"> 任务待发布</span>';
		break;
	case 2:
		str = '<span style="color:blue"> 任务已接收</span>';
		break;
	case 3:
		str = '<span style="color:blue"> 任务执行中</span>';
		break;	
	
}  	  
					
	    return str;   	    	   
   };
//发布项目 
var changeProjectStatusS=function(id,status){	
	    var str="";	    var str1="";
	
		if(status==5){
			str="一键审核";str1="确定要一键审核该项目下的所有任务吗？"
		}else if(status==2){
			str="发布项目";str1="确定要发布该项目吗？"
		}
        $.messager.confirm(str, str1, function (r) {
            if (r) {
                $.post('/project.jspx?changeProjectStatus='+status, {id:id}, function (result) {
                    if (result=="\"success\"") {
                    	 $.messager.show({     
                             title: '提示',
                             msg: result
                         }); 
                    	 $('#taskDg').datagrid('reload');
                         
                         $('#dg').datagrid('reload');
                    } else {
                        $.messager.show({     
                            title: '提示',
                            msg: result
                        });
                    }
                });              
            }
              
        });   
        
       
}
//查看所有任务审核列表
/*var  seeTask=function (name,val){
	console.info(name);
	console.info(val);
 	 $('#dd2').dialog({
     title: name+'的任务审核列表',
     width: 800,
     height: 500,
     closed: false,
     cache: false,   
     href:"/project.jspx?projectTaskAudit="+val,
     modal: true
	 }); 	
}*/



//处理单个任务审核
function seeTaskAuditSon(name,val){
	
    $('#taskId').val(val); 	
	$('#dson').dialog('open');			
}
//查看所有审核记录
var allTaskAuditSon=function(name,val){
	console.info(name+"+"+val);
	$('#ddson').dialog({    
 	    title: name+'的任务审核记录',    	   
 	});  
	$('#ddson').dialog('open');
	$('#taskSonDg').datagrid({    
	 	  url:"taskAudit.jspx?datagridBytaskId="+val, 
	 	   pagination:true,
	 	    pageSize:5,
	 	   pageList:[5,10,20],
	 	    columns:[[   
	 	    	{field:"cb" ,checkbox:"true", align:"center"}, 
	 	        {field:'statusStr',title:'审核状态',width:60},    
	 	        {field:'taskRegard',title:'审核理由',width:380},    	 	          	          
	 	      
	 	    ]]    
	 	});
}

var submitShenHe=function (){
	
	 $("#dSonfm").form("submit",{
		onSubmit:function(){
			return $(this).form("validate");
		},
		success:function(result){
			if(result=="\"success\""){
				$.messager.alert("系统提示","保存成功！");
				$("#dson").dialog("close");
				 $("#dSonfm").form("reset");
				$("#taskDg").datagrid("reload");
				$("#dg").datagrid("reload");
			}else{
				$.messager.alert("系统提示","保存失败!\n"+result);
				return;
			}
		}
	 });
}

