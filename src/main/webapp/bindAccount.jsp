<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>登录页面</title>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/bootstrapValidator.css"/>

    <!-- Include the FontAwesome CSS if you want to use feedback icons provided by FontAwesome -->
    <!--<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" />-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
		
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/font-awesome/4.2.0/css/font-awesome.min.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="assets/fonts/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="assets/css/ace.min.css" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->

	<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>		
     <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/bootstrapValidator.js"></script>
	
<script type="text/javascript">
$(document).ready(function() { 
    $('#login').bootstrapValidator({
//        live: 'disabled',
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"projectSiteId.id": {
                validators: {
                    notEmpty: {
                        message: '站点不能为空!'
                    }
                }
            },
            "bindAccount": {
                validators: {
                    notEmpty: {
                        message: '绑定333账号不能为空'
                    }
                }
            }
        }
    });
        // Validate the form manually
        $('#bangding').click(function() {
            $('#login').bootstrapValidator('validate');
        });

        $('#resetBtn').click(function() {
            $('#login').data('bootstrapValidator').resetForm(true);
        });    
    });



</script>

<script language="javascript" type="text/javascript">

	$(function(){
		$.post("<%=request.getContextPath()%>/project.jspx?projectCommoboxSite",function(data){									
				$.each(data,function(index,data){
					$("#bankcard").append("<option   value="+data.id+">" +data.projectSite+"</option>");
				}); 
			
			   //返回信息
		},"json");
	});

	
	
function submitForm(){
	var js=$('#login').serialize();
	
	var bootstrapValidator =$("#login").data('bootstrapValidator');
	console.info(bootstrapValidator.isValid());
	if(bootstrapValidator.isValid()){
		
	
	$.post("<%=request.getContextPath()%>/bindAccount.jspx?saveOrUpdate",js,function(json){		
		if(json.sta==1){
			layer.open({
				  title: '提示',
				  content: json.massage
				});  
		}else if(json.sta==3){
			layer.open({
				  title: '提示',
				  content: json.massage
				});									
		}else {
			layer.open({
				  title: '提示',
				  content: json.massage
				}); 
			setTimeout(function(){
				location.href="/indexweb.jspx";
			},1000);
			
		}
		
	},"json");
	}
}

function subForm(){
	location.href="/indexweb.jspx";
}
</script>
	</head>

	<body class="login-layout">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="ace-icon fa fa-leaf green"></i>
									<span class="red">营销</span>
									<span class="white" id="id-text2">推广系统</span>
								</h1>
								<h4 class="blue" id="id-company-text">&copy; 科多F5</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="ace-icon fa fa-coffee green"></i>
												请输入您的绑定账号
											</h4>

											<div class="space-6"></div>

											<form id="login"  >
											    <input type="hidden" name=userId.id value="${sessionScope.keduoxSession.id}">
											
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
														<select  name="projectSiteId.id" class="form-control" id="bankcard">
																							<option value="">---请选择站点---</option>
														</select>															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="请输入论坛账号" name="bindAccount" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>
													
													<div class="space"></div>

													<div class="clearfix">
													<button type="button" class="width-35 pull-right btn btn-sm btn-primary" onclick="subForm()" style="margin-left: 20%">
															<i class="ace-icon fa fa-key"></i>
															<span class="bigger-110">跳过</span>
														</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<button type="button" class="width-35 pull-right btn btn-sm btn-primary" onclick="submitForm()" id="bangding">
															<i class="ace-icon fa fa-key"></i>
															<span class="bigger-110">绑定</span>
														</button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>

											

											<div class="space-6"></div>

										</div><!-- /.widget-main -->
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->

								
							</div><!-- /.position-relative -->

							<div class="navbar-fixed-top align-right">
								<br />
								&nbsp;
								<a id="btn-login-dark" href="#">Dark</a>
								&nbsp;
								<span class="blue">/</span>
								&nbsp;
								<a id="btn-login-blur" href="#">Blur</a>
								&nbsp;
								<span class="blue">/</span>
								&nbsp;
								<a id="btn-login-light" href="#">Light</a>
								&nbsp; &nbsp; &nbsp;
							</div>
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

		<!-- basic scripts -->


		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
			 $(document).on('click', '.toolbar a[data-target]', function(e) {
				e.preventDefault();
				var target = $(this).data('target');
				$('.widget-box.visible').removeClass('visible');//hide others
				$(target).addClass('visible');//show target
			 });
			});
			
			
			
			//you don't need this, just used for changing background
			jQuery(function($) {
			 $('#btn-login-dark').on('click', function(e) {
				$('body').attr('class', 'login-layout');
				$('#id-text2').attr('class', 'white');
				$('#id-company-text').attr('class', 'blue');
				
				e.preventDefault();
			 });
			 $('#btn-login-light').on('click', function(e) {
				$('body').attr('class', 'login-layout light-login');
				$('#id-text2').attr('class', 'grey');
				$('#id-company-text').attr('class', 'blue');
				
				e.preventDefault();
			 });
			 $('#btn-login-blur').on('click', function(e) {
				$('body').attr('class', 'login-layout blur-login');
				$('#id-text2').attr('class', 'white');
				$('#id-company-text').attr('class', 'light-blue');
				
				e.preventDefault();
			 });
			 
			});
		</script>
		<div style="text-align:center;">
</div>
	</body>
</html>
