<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>营销推广系统</title>
		<meta name="keywords" content="营销推广系统" />
		<meta name="description" content="营销推广系统" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">

    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ui.jqgrid.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui-1.8.16.custom.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.jqGrid.src.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jqGrid/i18n/grid.locale-cn.js"></script>
		 
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace-skins.min.css" />
		<script src="${pageContext.request.contextPath}/js/ace-extra.min.js"></script>
	
	
		<script type="text/javascript"> -->
		
		
		 var userId=${sessionScope.keduoxSession.id}; 
	
		$(function(){
			$.post("<%=request.getContextPath()%>/FindUserById.jspx?id="+userId,function(data){
				//json 转 ==象
				
			    var user= JSON.parse(data); 
				
			   //页面赋值
			    $("#userName").html(user.userName);
				$("#email").html(user.email);
				$("#phone").html(user.phone);
				$("#money").html(user.moneyId.money);
				$("#money2").html(user.moneyId.totalAmount);
				$("#level").html("等级:"+user.levelId.level+'级');
				$("#yqm").html(user.invitationCode);
				
				}); 
		
		
		$.post("<%=request.getContextPath()%>/FindBankcardCount.jspx?id="+userId,function(bankcardCount){
			   $("#bankcardCount").html(bankcardCount+"张");
			});
		


		$.post("<%=request.getContextPath()%>/FindUndoneTaskCount.jspx?id="+userId,function(undoneTaskCount){
			   $("#undoneTaskCount").html("剩余"+undoneTaskCount+"个");
			});
		//页面加载完成之后执行
		
      });
	
		</script>
	
	</head>

	<body>
		<div class="navbar navbar-default" id="navbar">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
						<small>
							<i class="icon-leaf"></i>
							营销推广系统
						</small>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->

				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						

						

					

						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="${pageContext.request.contextPath}/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>欢迎光临,</small>
									Jason
								</span>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="#">
										<i class="icon-cog"></i>
										设置
									</a>
								</li>

								<li>
									<a href="#">
										<i class="icon-user"></i>
										个人资料
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="#">
										<i class="icon-off"></i>
										退出
									</a>
								</li>
							</ul>
						</li>
					</ul><!-- /.ace-nav -->
				</div><!-- /.navbar-header -->
			</div><!-- /.container -->
		</div>

		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>

				<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>

					<div class="sidebar-shortcuts" id="sidebar-shortcuts">
						<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
							<button class="btn btn-success">
								<i class="icon-signal"></i>
							</button>

							<button class="btn btn-info">
								<i class="icon-pencil"></i>
							</button>

							<button class="btn btn-warning">
								<i class="icon-group"></i>
							</button>

							<button class="btn btn-danger">
								<i class="icon-cogs"></i>
							</button>
						</div>

						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>

							<span class="btn btn-info"></span>

							<span class="btn btn-warning"></span>

							<span class="btn btn-danger"></span>
						</div>
					</div><!-- #sidebar-shortcuts -->

					<ul class="nav nav-list">

						<li>
							<a href="/indexweb.jspx">
								<i class="icon-user"></i>
								<span class="menu-text"> 个人中心 </span>
							</a>
						</li>

						<li>
							<a href="/projected.jspx" class="dropdown-toggle">
								<i class="icon-desktop"></i>
								<span class="menu-text"> 任务中心 </span>
								<b class="arrow icon-angle-down"></b>
							</a>

						</li>
						<li>
							<a href="/task/tasking.jspx">

								<i class="icon-file-alt"></i>
								<span class="menu-text"> 执行中任务 </span>
							</a>
						</li>
						<li>
						
							<a href="/projected.jspx">

							


								<i class="icon-list-alt"></i>
								<span class="menu-text"> 已完成任务 </span>
							</a>
						</li>
						<li>
							<a href="/taskaudit.jspx">
								<i class="icon-edit"></i>
								<span class="menu-text"> 任务审核通知 </span>
							</a>
						</li>
					</ul><!-- /.nav-list -->

					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>

					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>
	