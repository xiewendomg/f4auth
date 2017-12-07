<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- basic styles -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.min.css" />

<!--[if IE 7]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome-ie7.min.css" />
		<![endif]-->

<!-- page specific plugin styles -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui-1.10.3.custom.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/chosen.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/datepicker.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-timepicker.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/daterangepicker.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/colorpicker.css" />

<!-- fonts -->

<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

<!-- ace styles -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/ace.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/ace-rtl.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/ace-skins.min.css" />

<!--[if lte IE 8]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace-ie.min.css" />
		<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->

<script src="${pageContext.request.contextPath}/js/ace-extra.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
		<script src="${pageContext.request.contextPath}/js/html5shiv.js"></script>
		<script src="${pageContext.request.contextPath}/js/respond.min.js"></script>
		<![endif]-->

<!-- basic scripts -->

<!--[if !IE]> -->

<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script> -->

<!-- <![endif]-->

<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

<!--[if !IE]> -->

<
<!-- script type="text/javascript">
			window.jQuery || document.write("<script src='${pageContext.request.contextPath}/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script> -->

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${pageContext.request.contextPath}/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath}/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->

<script
	src="${pageContext.request.contextPath}/js/date-time/bootstrap-datepicker.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jqGrid/jquery.jqGrid.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jqGrid/i18n/grid.locale-en.js"></script>

<!-- ace scripts -->

<script src="${pageContext.request.contextPath}/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath}/js/ace.min.js"></script>

<script type="text/javascript">
var userId=${sessionScope.keduoxSession.id}; 
var flag=0;
$(function(){
	$.post("<%=request.getContextPath()%>/FindBankcardList.jspx",{id:userId},function(data){
		
		if(data!=null){
			//有银行卡
			flag=1;
			$.each(data,function(index,data){
				$("#bankcard").append("<option   value="+data.id+" "+data.account+ ">" + "收款人:"+data.payee+" ["+data.accountType + "]"+" "+data.account+"</option>");
			}); 
		}
		else{
		//无银行卡
			//输出提示信息
			alert("请绑定银行卡","请绑定银行卡");
			
		}
		   //返回信息
	},"json");
});	
	
function submitFrom(){
	

	//判断输入的金额
var wmoney=$("#wmoney").val();
	
			
			if(wmoney%100!=0){
			//大于100+小于100
				alert("请输入100的整数倍数","请输入100的整数倍数");
			   
			}
			else{
				//100倍数+0
				if(wmoney==0){
					//为0
					alert("余额为0","余额为0");
					
				}
				else{
					//100整数倍，100x或200x
					//判断银行卡是否有,有卡可以提现
					if(flag==0){
						//无银行卡
						//输出提示信息
						alert("请绑定银行卡","请绑定银行卡");
						//跳转到添加银行卡
						 location.href="/addbankcard";
					}
					else{
						//提现100整数倍，100x或200x
						//接收处理
						//查询余额
					$.post("<%=request.getContextPath()%>/FindUserById",{id:userId},function(user){
						
						if(wmoney>user.moneyId.money){
							alert("输入的金额大于余额!","输入的金额大于余额!");

							//跳转首页
							location.href="/indexweb";
						}
						else{
							
						
							$.post("<%=request.getContextPath()%>/UpdateMoney",$("#defaultForm").serialize(),function(msg){
								if (msg) {
									
									alert('提现申请成功，财务安排转账!', '提现申请成功');
									
									//跳转首页
									location.href="/indexweb";
								} else {
									alert('提现申请失败，请重新输入!', '提现申请失败!');

								}
								
							});
							}
						
						},"json");	
					}
					
					
					
				}
				
			}
}	
			

 

</script>
<title>提现申请</title>
</head>

<body>
	<div class="container">
		<div class="row">
			<!-- form: -->
			<section>
			<div class="col-lg-8 col-lg-offset-2">
				

				<form id="defaultForm" method="post" class="form-horizontal">
					<div class="form-group">


						<div class="form-group">
							<label class="col-lg-3 control-label">提现金额(元)</label>
							<div class="col-lg-5">
								<input type="text" name="wmoney" class="form-control"
									id="wmoney"
									onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
									onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
								<!-- <input type="text" class="form-control" name="withdrawalsMoney" /> -->
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3 control-label"></label>
							<div class="col-lg-5">
								<select  name="bankcardid" class="form-control" id="bankcard">
									<option>---请选择账号---</option>
								</select>
							</div>
						</div><br/>
						<div class="form-group">
							<div class="col-lg-9 col-lg-offset-3">

								<button   type="button" class="btn btn-info"
									onclick="submitFrom()" id="validateBtn">申请提现</button>
								
							</div>
						</div>
						
				</form>
			</div>
			</section>
			<!-- :form -->
		</div>
	</div>
</body>
</html>