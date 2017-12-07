<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script type="text/javascript">
var userId=${sessionScope.keduoxSession.id}; 

$(function(){
	$('#myModal2').modal('show')
	$.post("<%=request.getContextPath()%>/FindProjectSite.jspx",function(data){
		if(data!=null){
			//有站点数据
			$.each(data,function(index,da){
				
				$("#site").append("<option   value="+da.id+ ">"+da.projectSite+"</option>");
			}); 
		}
	},"json");
});
//绑定论坛提交方法
function  siteSubmit(){

	$.post("<%=request.getContextPath()%>/FindBindAccount.jspx",$("#defaultSite").serialize(),function(msg){

		if (msg=='true') {
			
			alert('账号已经绑定此论坛!', '账号已经绑定此论坛');
			
		} else {
			var bal=$("#bindAccount").val().length;
		console.info(bindAccount);
		if(bal<6){
			alert('论坛账号最小长度6位,请重新填写!', '请重新填写');
		}else{
			$.post("<%=request.getContextPath()%>/UpdateBindAccount.jspx",$("#defaultSite").serialize(),function(msg2){
				
				if (msg2=='true') {
					
					alert('论坛账号绑定站点,申请成功!', '论坛账号绑定站点,申请成功!');
					//跳转首页
					location.href="/indexweb.jspx";
					}
				else
					{
					alert('论坛账号绑定站点申请失败!', '论坛账号绑定站点申请失败!');
					}
				});
			}
		}
	});
}


</script>



<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					绑定论坛账号
				</h4>
			</div>
			<div class="modal-body">
			
				<form id="defaultSite" name="defaultSite" method="post" class="form-horizontal">
					<div class="form-group">

						<div class="form-group">
							<label class="col-lg-3 control-label">选择论坛</label>
							<div class="col-lg-5">
								<select  name="projectSiteId" class="form-control" id="site">
									<option>---请选择站点---</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3 control-label">绑定账号</label>
							<div class="col-lg-5">
								<input type="text" name="bindAccount" class="form-control"
									id="bindAccount">
									
							</div>
						</div>
						
				</form>





			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button  onclick="siteSubmit()" type="button" class="btn btn-primary">
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</body>
</html>
