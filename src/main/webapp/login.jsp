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
<link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/bootstrapValidator.css"/>
				<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>		
	
     <script type="text/javascript" src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/bootstrapValidator.js"></script>


	
<script language="javascript" type="text/javascript">
<!--登录-->
function submitForm(){
	var js=$('#login').serialize();
	var bootstrapValidator =$("#login").data('bootstrapValidator');
	console.info(bootstrapValidator.isValid());
	if(bootstrapValidator.isValid()){
	$.post("<%=request.getContextPath()%>/login.jspx",js,function(json){
		console.info(json.sta)
		if(json.sta==0){
			layer.open({
				  title: '提示',
				  content: '验证码错误'
				});  
		}else if(json.sta==1){
			layer.open({
				  title: '提示',
				  content: '账号或密码错误'
				}); 
		}else if(json.sta==2){
			location.href="/indexweb.jspx";
		}else{
			location.href="/main.jspx";
		}
		refreshCode();
	},"json");
	}
}
function refreshCode() {  
    var imgObj = document.getElementById("validationCode");  
    var index = imgObj.src.indexOf("?");  
    if(index != -1) {  
        var url = imgObj.src.substring(0,index + 1);  
        imgObj.src = url + Math.random();  
    } else {  
        imgObj.src = imgObj.src + "?" + Math.random();  
    }  
}
</script>

<script type="text/javascript">
		
function submitFottrm(){		
var js=$('#regForm').serialize();
var bootstrapValidator =$("#regForm").data('bootstrapValidator');
console.info(bootstrapValidator.isValid());
if(true){
$.post("<%=request.getContextPath()%>/reg.jspx?save",js,function(json){
	console.info(json.sta)
	if(json.sta==1){
		layer.open({
			  title: '提示',
			  content: json.massage
			});  
	}else if(json.sta==2){
		layer.open({
			  title: '提示',
			  content: json.massage
			}); 
		setTimeout(function(){
			location.href="/bindAccount.jspx";
		},1000);		
	}else{
		layer.open({
			  title: '提示',
			  content: json.massage
	});
	
	}	
},"json");
}		
}
</script>
		
		<script type="text/javascript">
		$(function () {
			
			 $('#login').bootstrapValidator({
//		        live: 'disabled',
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		        	"userName": {
		                validators: {
		                    notEmpty: {
		                        message: '账号不能为空!'
		                    }
		                }
		            },
		            "password": {
		                validators: {
		                    notEmpty: {
		                        message: '密码不能为空'
		                    }
		                }
		            },
		            "inputValidateCode": {
		                validators: {
		                    notEmpty: {
		                        message: '验证码不能为空'
		                    }
		                }
		            }
		        }
		     
		    });
		        // Validate the form manually
		        $('#denglu').click(function() {
		            $('#login').bootstrapValidator('validate');
		        });

		        $('#resetBtn').click(function() {
		            $('#login').data('bootstrapValidator').resetForm(true);
		        });    
			
			
			
	        $('#regForm').bootstrapValidator({
	            message: 'This value is not valid',
	            feedbackIcons: {
	                valid: 'glyphicon glyphicon-ok',
	                invalid: 'glyphicon glyphicon-remove',
	                validating: 'glyphicon glyphicon-refresh'
	            },
	            fields: {
	                userName: {	                    
	                    validators: {
	                        notEmpty: {
	                            message: '用户名不能为空'
	                        },
	                        stringLength: {
	                            min: 6,
	                            max: 28,
	                            message: '用户名长度必须在6到20位之间'
	                        },
	                        regexp: {
	                            regexp: /^[a-zA-Z0-9_]+$/,
	                            message: '用户名只能包含大写、小写、数字和下划线'
	                        },
	                        remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
	                            url: 'reg.jspx?findUserbyFieldName',//验证地址
	                            message: '用户已存在!',//提示消息
	                            delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
	                            type: 'POST'//请求方式
	                            /**自定义提交数据，默认值提交当前input value
	                             *  data: function(validator) {
	                                  return {
	                                      password: $('[name="passwordNameAttributeInYourForm"]').val(),
	                                      whatever: $('[name="whateverNameAttributeInYourForm"]').val()
	                                  };
	                               }
	                             */
	                        }
	                    }
	                },
	                email: {
	                    validators: {
	                        notEmpty: {
	                            message: '邮箱不能为空'
	                        },
	                        emailAddress: {
	                            message: '邮箱地址格式有误'
	                        },
	                        remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
	                            url: 'reg.jspx?findUserbyFieldEmail',//验证地址
	                            message: '邮箱已存在!',//提示消息
	                            delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
	                            type: 'POST'//请求方式
	                            /**自定义提交数据，默认值提交当前input value
	                             *  data: function(validator) {
	                                  return {
	                                      password: $('[name="passwordNameAttributeInYourForm"]').val(),
	                                      whatever: $('[name="whateverNameAttributeInYourForm"]').val()
	                                  };
	                               }
	                             */
	                        }
	                    }
	                },
	                nickName: {
	                	 validators: {
	 	                    notEmpty: {
	 	                        message: '昵称不能为空'
	 	                    },
	 	                    stringLength: {
	 	                        min: 2,
	 	                        max: 20,
	 	                        message: '真实姓名长度不能小于2大于6'
	 	                    }
	                }
	                },
	                realName: {
	                	 validators: {
		 	                    notEmpty: {
		 	                        message: '昵称不能为空'
		 	                    },
		 	                    stringLength: {
		 	                        min: 2,
		 	                        max: 6,
		 	                        message: '真实姓名长度不能小于2大于6'
		 	                    }
	                }	 },                          
	            password: {
	                validators: {
	                    notEmpty: {
	                        message: '密码不能为空'
	                    },
	                    stringLength: {
	                        min: 6,
	                        max: 20,
	                        message: '密码长度不能小于6大于20'
	                    },
	                    different: {
	                        field: 'userName',
	                        message: '密码不能和账号一样'
	                    }
	                }
	            },
	            confirmPassword: {
	                validators: {
	                    notEmpty: {
	                        message: '不能为空'
	                    },
	                    identical: {
	                        field: 'password',
	                        message: '两次输入密码不一致'
	                    }
	                }
	            },
	            'check': {
	                validators: {
	                    notEmpty: {
	                        message: '请勾选接受"用户协议"'
	                    }
	                }
	            }	            
	        }
	        });
	        
	        $('#reg').click(function() {
	            $('#regForm').bootstrapValidator('validate');
	        });        
	        $('#reset').click(function() {
	            $('#regForm').data('bootstrapValidator').resetForm(true);
	        });    
		
	    });	
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
												请输入您的信息
											</h4>

											<div class="space-6"></div>

											<form id="login">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="账号" name="userName"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="密码" name="password"/>
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>
													<label class="block clearfix" style="width:50%;float:left;margin-right: 5%" >
														<span class="block input-icon input-icon-right">
															<input id="inputValidateCode"  type="text" class="form-control" placeholder="请输入验证码" name="inputValidateCode" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>
													<img id="validationCode" alt="验证码图片" title="验证码图片" src="<%=request.getContextPath() %>/ValidationCodeServlet.png" onclick="refreshCode()" style="width:30%"/>
													<div class="space"></div>

													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" class="ace" />
															<span class="lbl"> 记住</span>
														</label>

														<button type="button" class="width-35 pull-right btn btn-sm btn-primary" onclick="submitForm()" id="denglu">
															<i class="ace-icon fa fa-key"></i>
															<span class="bigger-110">登录</span>
														</button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>

											<div class="social-or-login center">
												<span class="bigger-110">第三方登录</span>
											</div>

											<div class="space-6"></div>

											<div class="social-login center">
												<a class="btn btn-primary">
													<i class="ace-icon fa fa-facebook"></i>
												</a>

												<a class="btn btn-info">
													<i class="ace-icon fa fa-twitter"></i>
												</a>

												<a class="btn btn-danger">
													<i class="ace-icon fa fa-google-plus"></i>
												</a>
											</div>
										</div><!-- /.widget-main -->

										<div class="toolbar clearfix">
											<div>
												<a href="#" data-target="#forgot-box" class="forgot-password-link">
													<i class="ace-icon fa fa-arrow-left"></i>
													忘记密码
												</a>
											</div>

											<div>
												<a href="#" data-target="#signup-box" class="user-signup-link">
													注册
													<i class="ace-icon fa fa-arrow-right"></i>
												</a>
											</div>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->

								<div id="forgot-box" class="forgot-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="ace-icon fa fa-key"></i>
												找回密码
											</h4>

											<div class="space-6"></div>
											<p>
												输入您的电子邮件和接收指令
											</p>

											<form id="findMiMa">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>

													<div class="clearfix">
														<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
															<i class="ace-icon fa fa-lightbulb-o"></i>
															<span class="bigger-110">发送邮件</span>
														</button>
													</div>
												</fieldset>
											</form>
										</div><!-- /.widget-main -->

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												返回登录
												<i class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.forgot-box -->

								<div id="signup-box" class="signup-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="ace-icon fa fa-users blue"></i>
												用户注册
											</h4>

											<div class="space-6"></div>
											

											<form id="regForm" action="#">
												<fieldset>
													
													
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" name="userName" placeholder="用户名" />
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control"  name="nickName" placeholder="昵称" />
															<i class="ace-icon fa  fa-child"></i>
														</span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" name="realName" placeholder="真实姓名" required="true"/>
															<i class="ace-icon fa  fa-smile-o"></i>
														</span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control"  name="password" placeholder="密码" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control"  name="confirmPassword" placeholder="确认密码" />
															<i class="ace-icon fa fa-retweet"></i>
														</span>
													</label>
													<!-- 加框 -->
                                            		<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" name="email" placeholder="邮箱" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control"  name="otherInvitationCode" placeholder="邀请码" />
															<i class="ace-icon fa  fa-twitter"></i>
														</span>
													</label>
													
													<label class="block">
														<input type="checkbox" class="ace" name="check" />
														<span class="lbl">
															接受
															<a href="#">用户协议</a>
														</span>
													</label>

													<div class="space-24"></div>

													<div class="clearfix">
														<button type="reset" class="width-30 pull-left btn btn-sm" id="reset">
															<i class="ace-icon fa fa-refresh"></i>
															<span class="bigger-110">重置</span>
														</button>
<!-- <input type="button" value="提交" onclick="submitFottrm"> -->
														<button id="reg" type="button" onclick="submitFottrm()" class="width-65 pull-right btn btn-sm btn-success">
															<span class="bigger-110" >注册</span>

															<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
														</button>
													</div>
												</fieldset>
											</form>
										</div>

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												<i class="ace-icon fa fa-arrow-left"></i>
												返回登录
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.signup-box -->
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
		
		<!-- <![endif]-->

		<!--[if IE]>
<script src="assets/js/jquery.1.11.1.min.js"></script>
<![endif]-->

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
