<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  

    <jsp:include page="top.jsp"/>
   							<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
							<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="icon-home home-icon"></i>
								<a href="#">首页</a>
							</li>
							<li class="active">个人中心</li>
						</ul><!-- .breadcrumb -->

						<div class="nav-search" id="nav-search">
							<form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
									<i class="icon-search nav-search-icon"></i>
								</span>
							</form>
						</div><!-- #nav-search -->
					</div>

					<div class="page-content">
						

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->

								<div class="alert alert-block alert-success">
									<button type="button" class="close" data-dismiss="alert">
										<i class="icon-remove"></i>
									</button>

									<i class="icon-ok green"></i>

									欢迎使用
									<strong class="green">
										营销推广系统
										<small>(v1.0)</small>
									</strong>
									
								</div>

								<div class="row">
									<div class="space-6"></div>

									<div class="col-sm-7 infobox-container">
										<div class="infobox infobox-green  ">
											<div class="infobox-icon">
												<i class="icon-user"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number">会员名</span>
												<div id="userName" class="infobox-content"></div>
												
											</div>
											
											
											<div  id="level" class="badge badge-success">				
											</div>
											
											<!-- <span id="yqm" class="label-info"></span> -->
										</div>

										<div class="infobox infobox-blue  ">
										<div class="infobox-icon">
												<i class="icon-envelope"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number">邮箱</span>
												<div  id="email" class="infobox-content"></div>
												
											</div>
											<div class="badge badge-success">
												修改邮箱
												<i class="icon-edit"></i>
											</div>
										</div>

										<div class="infobox infobox-pink  ">
											<div class="infobox-icon">
												<i class="icon-mobile-phone"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number">手机</span>
												<div id="phone" class="infobox-content"></div>
											
											</div>
											<div class="badge badge-success">
												修改手机<a></a>
												<i class="icon-edit"></i>
											</div>
										</div>

										<div class="infobox infobox-red">
											<div class="infobox-icon">
												<i class="icon-money"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number">钱包</span>
												<div id="money" class="infobox-content"></div>
											</div>
											<div class="badge badge-success">
													<a  href="/withdrawalsMoney.jspx" id="tx1" style="color:white;">提现</a>
												
											</div>
										</div>

										
										<div class="infobox infobox-orange2  ">
											<div class="infobox-icon">
												<i class="icon-credit-card"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number">银行卡</span>
												<div id="bankcardCount" class="infobox-content"></div>
											</div>

											<div class="badge badge-success">
												<a  style="color:white;" href="/addbankcard.jspx">新增/删除</a>
												<!-- <i class="icon-double-angle-right"></i> -->
											</div>
										</div>

										<div class="infobox infobox-blue2  ">
											<div class="infobox-icon">
												<i class="icon-credit-card"></i>
											</div>
										
											<div class="infobox-data">
												<span class="infobox-text">待完成任务</span>

												<div id="undoneTaskCount" class="infobox-content">
													
												</div>
											</div>
											<div class="badge badge-success">
												
												<a  style="color:white;" href="/tasking.jspx">查看</a>
												<i class="icon-double-angle-right"></i>
											</div>
										</div>

										<div class="space-6"></div>

										<div class="infobox infobox-green infobox-small infobox-dark">
											<div class="infobox-progress">
												
											</div>

											<div class="infobox-data">
												<div class="infobox-content"><a  style="color:white;" href="/tasking.jspx">已完成任务</a></div>
												
											</div>
										</div>

										<div class="infobox infobox-blue infobox-small infobox-dark">
											<div class="infobox-chart">
												<span class="sparkline" data-values="3,4,2,3,4,4,2,2"></span>
											</div>

											<div class="infobox-data">
												<div class="infobox-content">得总奖金</div>
												<div  id ="money2" class="infobox-content"></div>
											</div>
										</div>

										<div class="infobox infobox-grey infobox-small infobox-dark">
											<div class="infobox-icon">
												<i class="icon-download-alt"></i>
											</div>

											<div class="infobox-data">
												<div class="infobox-content"><a  style="color:white;" href="/tasking.jspx">未完成任务</a></div>
												<div class="infobox-content">25</div>
											</div>
										</div>
									</div>

									<div class="vspace-sm"></div>

									<div class="col-sm-5">
										<div class="widget-box">
											<div class="widget-header widget-header-flat widget-header-small">
												<h5>
													<i class="icon-linkedin-sign"></i>
													绑定论坛账号
												</h5>

												<div class="badge badge-success">
												<a  style="color:white;" href="/bingdingluntan.jspx">修改绑定</a>
												<i class="icon-edit"></i>
											</div>
											</div>

											<div class="widget-body">
												<div class="widget-main">
													

													<!--  <div class="hr hr8 hr-double"></div> -->

													<div class="clearfix">
														<div class="grid3">
															<span class="grey">
																<i class="icon-facebook-sign icon-2x blue"></i>
																&nbsp; 百度
															</span>
															<h4 class="bigger pull-right">
																<img  height="34" width="100" src="${pageContext.request.contextPath}/images/logo/baidu.png">
															</h4>
														</div>

														<div class="grid3">
															<span class="grey">
																<i class="icon-twitter-sign icon-2x purple"></i>
																&nbsp; 新浪
															</span>
															<h4 class="bigger pull-right">
																<img  height="34" width="100" src="${pageContext.request.contextPath}/images/logo/sina.gif">
															</h4>
														</div>

														<div class="grid3">
															<span class="grey">
																<i class="icon-pinterest-sign icon-2x red"></i>
																&nbsp; 天涯
															</span>
															<h4 class="bigger pull-right">
															<img  height="34" width="100" src="${pageContext.request.contextPath}/images/logo/tianya.png">
															</h4>
														</div>
													</div>
												</div><!-- /widget-main -->
											</div><!-- /widget-body -->
										</div><!-- /widget-box -->
									</div><!-- /span -->
								</div><!-- /row -->

								<div class="hr hr32 hr-dotted"></div>

								<div class="row">
									<div class="col-sm-6">
										<div class="widget-box transparent">
											<div class="widget-header widget-header-flat">
												<h4 class="lighter">
													<i class="icon-credit-card orange"></i>
													绑定的银行卡
												</h4>

												 <div class="widget-toolbar">
													<a href="#" data-action="collapse">
														<i class="icon-chevron-up"></i>
													</a>
												</div> 
											</div>

											<div class="widget-body">
												<div class="widget-main no-padding">
													<table id="grid-table1"></table>
												</div><!-- /widget-main -->
											</div><!-- /widget-body -->
										</div><!-- /widget-box -->
									</div>

									<div class="col-sm-6">
										<div class="widget-box transparent">
											<div class="widget-header widget-header-flat">
												<h4 class="lighter">
													<i class="icon-money"></i>
													提现记录
												</h4>

												<div class="widget-toolbar">
													<a href="#" data-action="collapse">
														<i class="icon-chevron-up"></i>
													</a>
												</div>
											</div>

											<div class="widget-body">
												<div class="widget-main padding-4">
												<!-- 	<div id="sales-charts"></div> -->
													<table id="grid-table2"></table>
												</div><!-- /widget-main -->
											</div><!-- /widget-body -->
										</div><!-- /widget-box -->
									</div>
								</div>

								<div class="hr hr32 hr-dotted"></div>

								<div class="row">
										<div class="col-sm-6">
										<div class="widget-box transparent">
											<div class="widget-header widget-header-flat">
												<h4 class="lighter">
													<i class="icon-credit-card orange"></i>
													任务审核通知
												</h4>

												<div class="widget-toolbar">
													<a href="#" data-action="collapse">
														<i class="icon-chevron-up"></i>
													</a>
												</div>
											</div>

											<div class="widget-body">
												<div class="widget-main no-padding">
													<table id="grid-table3"></table>
												</div><!-- /widget-main -->
											</div><!-- /widget-body -->
										</div><!-- /widget-box -->
									</div>
									</div><!-- /span -->

									

															
															</div>
														</div>

													</div>

												</div><!-- /widget-main -->
											</div><!-- /widget-body -->
										</div><!-- /widget-box -->
									</div><!-- /span -->
								</div><!-- /row -->

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->

				<div class="ace-settings-container" id="ace-settings-container">
					<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
						<i class="icon-cog bigger-150"></i>
					</div>

					<div class="ace-settings-box" id="ace-settings-box">
						<div>
							<div class="pull-left">
								<select id="skin-colorpicker" class="hide">
									<option data-skin="default" value="#438EB9">#438EB9</option>
									<option data-skin="skin-1" value="#222A2D">#222A2D</option>
									<option data-skin="skin-2" value="#C6487E">#C6487E</option>
									<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
								</select>
							</div>
							<span>&nbsp; 选择皮肤</span>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
							<label class="lbl" for="ace-settings-navbar"> 固定导航条</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
							<label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
							<label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
							<label class="lbl" for="ace-settings-rtl">切换到左边</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
							<label class="lbl" for="ace-settings-add-container">
								切换窄屏
								<b></b>
							</label>
						</div>
					</div>
				</div><!-- /#ace-settings-container -->
			</div><!-- /.main-container-inner -->

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="icon-double-angle-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->


<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document">
  <div class="modal-content">
  <div class="modal-header">
   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
   <h4 class="modal-title" id="myModalLabel">新增222</h4>
  </div>
  <div class="modal-body">

   <div class="form-group">
   <label for="txt_departmentname">新手机号码</label>
   <input type="text" name="txt_departmentname" class="form-control" id="txt_departmentname" placeholder="部门名称">
   </div>
   
  </div>
  <div class="modal-footer">
   <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
   <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>修改</button>
  </div>
  </div>
 </div>
 </div>

<!-- basic scripts -->

		<!--[if !IE]> -->

		<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script> -->

		<!-- <![endif]-->

		<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

		<!--[if !IE]> -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='${pageContext.request.contextPath}/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

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

		<script src="${pageContext.request.contextPath}/js/date-time/bootstrap-datepicker.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/jqGrid/jquery.jqGrid.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/jqGrid/i18n/grid.locale-en.js"></script>

		<!-- ace scripts -->

		<script src="${pageContext.request.contextPath}/js/ace-elements.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/ace.min.js"></script>

	<script type="text/javascript">
	$(function(){
			var grid_selector = "#grid-table1";
			var pager_selector = "#grid-pager";
			//绑定的银行卡
			$("#grid-table1").jqGrid({
				url:"<%=request.getContextPath()%>/FindBankcardList.jspx?id="+userId,
				datatype: "json",
				height: 250,
				colNames:[ '收款人','账号','账户类型','联系电话', '开户行'],
				colModel:[
					/* {name:'myac',index:'', width:80, fixed:true, resize:false,
						 formatter:'actions',  
						formatoptions:{ 
							keys:true
						}
					}, */
					{name:'payee',index:'payee', width:40, editable: true},
					{name:'account',index:'account', width:40,editable: true,editoptions:{size:"20",maxlength:"30"}},
					{name:'accountType',index:'accountType', width:40,editable: true,editoptions:{size:"20",maxlength:"30"}},
					{name:'number',index:'number', width:40,editable: true,editoptions:{size:"20",maxlength:"30"}},
					{name:'bankAccount',index:'bankAccount', width:40,editable: true,eeditoptions:{size:"20",maxlength:"30"}} 
				], 
		
				 viewrecords : true, 
				
				altRows: true,
				//toppager: true,
				
			
				//multikey: "ctrlKey",
		        multiboxonly: true,
		
				loadComplete : function() {
					var table = this;
					setTimeout(function(){
						/* styleCheckbox(table);
						
						updateActionIcons(table);
						updatePagerIcons(table); */
						/* enableTooltips(table); */
					}, 0);
				},
		
				autowidth: true,  
	             
				
			});
	//提现记录
			$("#grid-table2").jqGrid({
				url:"<%=request.getContextPath()%>/FindWithdrawalsList.jspx?id="+userId,
				datatype: "json",
				height: 250,
				colNames:['流水号','提现金额','账号','账号类型','申请日期', '打款日期'],
				colModel:[
				 	/* {name:'myac',index:'', width:80, fixed:true, sortable:false, resize:false,
						 formatter:'actions',  
						formatoptions:{ 
							keys:true
						}
					},  */
					
					{name:'withdrawalsSN',index:'withdrawalsSN', width:40},
					{name:'withdrawalsMoney',index:'withdrawalsMoney', width:40},
					{name:'account',index:'account', width:40},
					{name:'accountType',index:'account', width:40},
					{name:'createDatetime',index:'createDatetime', width:40},
					{name:'withdrawalsPayTime',index:'withdrawalsPayTime', width:40} 
				], 
		
				 viewrecords : true, 
				
				altRows: true,
				//toppager: true,
				
			/* 	multiselect: true, */
				//multikey: "ctrlKey",
		        multiboxonly: true,
		
				loadComplete : function() {
					var table = this;
					setTimeout(function(){
						/* styleCheckbox(table);
						
						updateActionIcons(table);
						updatePagerIcons(table); */
						/* enableTooltips(table); */
					}, 0);
				},
		
				autowidth: true,  
	             
				
			});
			//任务审核通知
			$("#grid-table3").jqGrid({
				url:"<%=request.getContextPath()%>/FindTaskAuditList.jspx?id="+userId,
				datatype: "json",
				height: 250,
				colNames:['任务编号','项目','项目站点','审核结果','理由'],
				colModel:[
				 	  
					
					{name:'taskSerialNumber',index:'taskSerialNumber', width:40},
					{name:'projectName',index:'projectName', width:40},
					{name:'projectSite',index:'projectSite', width:40},
					{name:'status',index:'status', width:40},
					{name:'taskRegard',index:'taskRegard', width:40}
					
				], 
		
				 viewrecords : true, 
				
				altRows: true,
				//toppager: true,
				
			/* 	multiselect: true, */
				//multikey: "ctrlKey",
		        multiboxonly: true,
		
				loadComplete : function() {
					var table = this;
					setTimeout(function(){
						/* styleCheckbox(table);
						
						updateActionIcons(table);
						updatePagerIcons(table); */
						/* enableTooltips(table); */
					}, 0);
				},
		
				autowidth: true,  
	             
				
			});
	function aceSwitch( cellvalue, options, cell ) {
		setTimeout(function(){
			$(cell) .find('input[type=checkbox]')
					.wrap('<label class="inline" />')
				.addClass('ace ace-switch ace-switch-5')
				.after('<span class="lbl"></span>');
		}, 0);
	}
	//enable datepicker
	function pickDate( cellvalue, options, cell ) {
		setTimeout(function(){
			$(cell) .find('input[type=text]')
					.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
		}, 0);
	}


	//navButtons
	jQuery(grid_selector).jqGrid('navGrid',pager_selector,
		{ 	//navbar options
			edit: true,
			editicon : 'icon-pencil blue',
			add: true,
			addicon : 'icon-plus-sign purple',
			del: true,
			delicon : 'icon-trash red',
			search: true,
			searchicon : 'icon-search orange',
			refresh: true,
			refreshicon : 'icon-refresh green',
			view: true,
			viewicon : 'icon-zoom-in grey',
		},
		{
			//edit record form
			//closeAfterEdit: true,
			recreateForm: true,
			beforeShowForm : function(e) {
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
				style_edit_form(form);
			}
		},
		{
			//new record form
			closeAfterAdd: true,
			recreateForm: true,
			viewPagerButtons: false,
			beforeShowForm : function(e) {
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
				style_edit_form(form);
			}
		},
		{
			//delete record form
			recreateForm: true,
			beforeShowForm : function(e) {
				var form = $(e[0]);
				if(form.data('styled')) return false;
				
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
				style_delete_form(form);
				
				form.data('styled', true);
			},
			onClick : function(e) {
				alert(1);
			}
		},
		{
			//search form
			recreateForm: true,
			afterShowSearch: function(e){
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
				style_search_form(form);
			},
			afterRedraw: function(){
				style_search_filters($(this));
			}
			,
			multipleSearch: true,
			/**
			multipleGroup:true,
			showQuery: true
			*/
		},
		{
			//view record form
			recreateForm: true,
			beforeShowForm: function(e){
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
			}
		}
	)


	
	function style_edit_form(form) {
		//enable datepicker on "sdate" field and switches for "stock" field
		form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
			.end().find('input[name=stock]')
				  .addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');

		//update buttons classes
		var buttons = form.next().find('.EditButton .fm-button');
		buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
		buttons.eq(0).addClass('btn-primary').prepend('<i class="icon-ok"></i>');
		buttons.eq(1).prepend('<i class="icon-remove"></i>')
		
		buttons = form.next().find('.navButton a');
		buttons.find('.ui-icon').remove();
		buttons.eq(0).append('<i class="icon-chevron-left"></i>');
		buttons.eq(1).append('<i class="icon-chevron-right"></i>');		
	}

	function style_delete_form(form) {
		var buttons = form.next().find('.EditButton .fm-button');
		buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
		buttons.eq(0).addClass('btn-danger').prepend('<i class="icon-trash"></i>');
		buttons.eq(1).prepend('<i class="icon-remove"></i>')
	}
	
	function style_search_filters(form) {
		form.find('.delete-rule').val('X');
		form.find('.add-rule').addClass('btn btn-xs btn-primary');
		form.find('.add-group').addClass('btn btn-xs btn-success');
		form.find('.delete-group').addClass('btn btn-xs btn-danger');
	}
	function style_search_form(form) {
		var dialog = form.closest('.ui-jqdialog');
		var buttons = dialog.find('.EditTable')
		buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'icon-retweet');
		buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'icon-comment-alt');
		buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'icon-search');
	}
	
	function beforeDeleteCallback(e) {
		var form = $(e[0]);
		if(form.data('styled')) return false;
		
		form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
		style_delete_form(form);
		
		form.data('styled', true);
	}
	
	function beforeEditCallback(e) {
		var form = $(e[0]);
		form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
		style_edit_form(form);
	}



	//it causes some flicker when reloading or navigating grid
	//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
	//or go back to default browser checkbox styles for the grid
	function styleCheckbox(table) {
	/**
		$(table).find('input:checkbox').addClass('ace')
		.wrap('<label />')
		.after('<span class="lbl align-top" />')


		$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
		.find('input.cbox[type=checkbox]').addClass('ace')
		.wrap('<label />').after('<span class="lbl align-top" />');
	*/
	}
	

	//unlike navButtons icons, action icons in rows seem to be hard-coded
	//you can change them like this in here if you want
	function updateActionIcons(table) {
		/**
		var replacement = 
		{
			'ui-icon-pencil' : 'icon-pencil blue',
			'ui-icon-trash' : 'icon-trash red',
			'ui-icon-disk' : 'icon-ok green',
			'ui-icon-cancel' : 'icon-remove red'
		};
		$(table).find('.ui-pg-div span.ui-icon').each(function(){
			var icon = $(this);
			var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
			if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
		})
		*/
	}
	
	//replace icons with FontAwesome icons like above
	function updatePagerIcons(table) {
		var replacement = 
		{
			'ui-icon-seek-first' : 'icon-double-angle-left bigger-140',
			'ui-icon-seek-prev' : 'icon-angle-left bigger-140',
			'ui-icon-seek-next' : 'icon-angle-right bigger-140',
			'ui-icon-seek-end' : 'icon-double-angle-right bigger-140'
		};
		$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
			var icon = $(this);
			var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
			
			if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
		});
	}
/* 
	function enableTooltips(table) {
		$('.navtable .ui-pg-button').tooltip({container:'body'});
		$(table).find('.ui-pg-div').tooltip({container:'body'});
	} */

	//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');


});
	

		</script>
</body>
</html>