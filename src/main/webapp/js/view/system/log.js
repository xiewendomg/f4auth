

$(document).ready(function(){
	$("#dg").datagrid({
		view: detailview,
		detailFormatter: function(rowIndex, rowData){
			return '错误日志信息：'+rowData.errorMsg;
		}
	});
});