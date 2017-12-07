<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="top.jsp" />
<!-- basic styles -->
  <script src="${pageContext.request.contextPath}/js/jqGrid/i18n/grid.locale-cn.js"></script>
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!-- page specific plugin styles -->

		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui-1.10.3.full.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/datepicker.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ui.jqgrid.css" />

		<!-- fonts -->

	<!-- 	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" /> -->

		<!-- ace styles -->

		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace-skins.min.css" />

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
		
		
		<!-- <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.css"/> -->
    <link rel="stylesheet" href="dist/css/bootstrapValidator.css"/>
    <!-- Include the FontAwesome CSS if you want to use feedback icons provided by FontAwesome -->
    <!-- <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" /> -->

    <script type="text/javascript" src="vendor/jquery/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>
    
   
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

							<li>
								<a href="#">绑定的银行卡</a>
							</li>
							
						</ul><!-- .breadcrumb -->
						
					</div>

					<div class="page-content">
<div class="row">
									<div class="col-sm-12">
									<!-- 按钮触发模态框 -->
<button   class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">新增银行卡</button>
<!-- 模态框（Modal） -->
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
												<!-- <button id="delbank"  type="button" onclick="delbanks()">删除1</button> -->
											</div>

											<div class="widget-body">
												<div class="widget-main no-padding">
													<table id="grid-table"></table>
													<!-- <div id="grid-pager"></div> -->
												</div><!-- /widget-main -->
											</div><!-- /widget-body -->
										</div><!-- /widget-box -->
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

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
									var $path_base = "/";//this will be used in gritter alerts containing images
								</script>
<script type="text/javascript">
			
			jQuery(function($) {
				var grid_selector = "#grid-table";
				var pager_selector = "#grid-pager";
			
				
					//direction: "rtl",
					
				$("#grid-table").jqGrid({
				url:"<%=request.getContextPath()%>/FindBankcardList.jspx?id="+userId,
				datatype: "json",
				height: 250,
				colNames:['ID','收款人','账号','账户类型','联系电话', '开户行','操作'],
				colModel:[
					/*{name:'myac',index:'', width:80, fixed:true, resize:false,
						  formatter:'actions',  
						formatoptions:{ 
							deletebutton:false
						} 
					},*/
					{name:'id',index:'id', width:4, hidden:true,align:'center'},
					{name:'payee',index:'payee', width:40},
					{name:'account',index:'account', width:80},
					{name:'accountType',index:'accountType', width:40},
					{name:'number',index:'number', width:40},
					{name:'bankAccount',index:'bankAccount', width:40}, 
					{name:'status',index:'status', width:40,formatter:operateFormatter} 
				], 
			     rownumbers: true, // 显示行号  
					viewrecords : true,
					altRows: false,
					//toppager: true,
					  checkbox : true,
					multiselect: true,
					//multikey: "ctrlKey",
			        multiboxonly: true,
			
					loadComplete : function() {
						var table = this;
						setTimeout(function(){
							styleCheckbox(table);
							
							updateActionIcons(table);
							updatePagerIcons(table);
							/* enableTooltips(table); */
						}, 0);
					},
			
					editurl: $path_base+"/dummy.html",//nothing is saved
					caption: "个人中心",
			
					autowidth: true
			
				});
				
				
				function operateFormatter(value, row, index) {  
				    var delDef = "&nbsp;&nbsp;<button class=\"btn btn-primary btn-xs\" onclick=\"delbanks()\">删除</button>";  
				          
				    return delDef;  
				}  
				
				
				//enable search/filter toolbar
				//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
			
				//switch element when editing inline
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
					console.info("---------------------");
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-danger').prepend('<i class="icon-trash"></i>');
					buttons.eq(1).prepend('<i class="icon-remove"></i>');
					
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
					})
				}
			/* 
				function enableTooltips(table) {
					$('.navtable .ui-pg-button').tooltip({container:'body'});
					$(table).find('.ui-pg-div').tooltip({container:'body'});
				} */
			
				//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
			
			
			});
		</script>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加银行卡</h4>
            </div>
            <div class="modal-body">
            
    <div class="container">
        <div class="row">
            <!-- form: -->
            <section>
               <!--  <div class="col-lg-8 col-lg-offset-2"> -->
                    

                    <form id="bankcardForm" method="post" class="form-horizontal">
                     
                      <div class="form-group">
                            <label class="col-lg-1 control-label">账号</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control"  id="account" name="account" />
                            </div>
                        </div>
						<div class="form-group">
                            <label class="col-lg-1 control-label">收款人</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control" id="payee" name="payee" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">开户行</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control" name="bankAccount" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">联系电话</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control" name="number" />
                            </div>
                        </div>
                       
                    </form>
               <!--  </div> -->
            </section>
            <!-- :form -->
        </div>
    </div>
</div>
            <div class="modal-footer">
                <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <!-- <button type="submit" class="btn btn-primary" name="signup" value="Sign up">Sign up</button>
                                <button type="submit" class="btn btn-primary" name="signup2" value="Sign up 2">Sign up 2</button> -->
                                <button type="button" class="btn btn-info" onclick="submitForm();" id="validateBtn">提交</button>
                                <button type="button" class="btn btn-info" id="resetBtn">重置</button>
                            </div>
                        </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<script type="text/javascript">
$(document).ready(function() {
    // Generate a simple captcha
    function randomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    };
    $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));

    $('#bankcardForm').bootstrapValidator({
//        live: 'disabled',
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        
            account: {
                message: '账号无效!',
                validators: {
                    notEmpty: {
                        message: '账号不能为空!'
                    },
                    stringLength: {
                        min: 19,
                        max: 19,
                        message: '请输入19位银行卡号'
                    },
                    regexp: {
                        regexp: /^[0-9]*$/,
                        message: '请输入银行卡账号号码'
                    }
                }
            },
            payee: {
                message: '收款人无效!',
                validators: {
                    notEmpty: {
                        message: '收款人不能为空!'
                    }
                }
            }
        }
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#bankcardForm').bootstrapValidator('validate');
    });

    $('#resetBtn').click(function() {
        $('#bankcardForm').data('bootstrapValidator').resetForm(true);
    });
});

//添加用户提交方法
function submitForm() {
	
	//用户名是否重名
	$.post("<%=request.getContextPath()%>/FindBankcardByName", {
		account : $('#account').val()}, function(bankmsg){
		
		//返回信息
       if(bankmsg!=null && bankmsg!=""){
			
    	 	alert('账号已存在', '用户已存在！');
			$('#account').val('');
		}
		else{
			var bootstrapValidator =$("#bankcardForm").data('bootstrapValidator');
			 bootstrapValidator.validate();
             if(bootstrapValidator.isValid())
            	 
             {
            	 console.info("bootstrapValidator.isValid():"+bootstrapValidator.isValid());
            	 $.post("<%=request.getContextPath()%>/AddBankcard?id="+userId, $('#bankcardForm').serialize(), function(msg) {
					if (msg) {
					
						alert('添加成功!', '添加成功!');
						//关闭窗口
						 $('#myModal').modal('toggle'); 
						  window.location.reload();//刷新当前页面
						/* $("#grid-table").trigger("reloadGrid"); */
					} else {
						alert('添加失败!', '添加失败!');

					}
				});
			}
		}
	});
	
	
	
}

function delbanks(){
	/*  var ids = new Array();  */
	  var rows=$("#grid-table").getGridParam("selarrrow");
	 /*  $.each(rows, function(i, row) {  
          ids[i] = row['id'];  
      }); */
	 
	 
	  
	  if (rows.length == 0) {  
		 	alert("信息","请选择要删除的数据");
	        return;  
	    }else
	    	{
	    	var e=confirm("确认要删除选中的'" + rows.length + "'条数据吗?");
	    	  
	    	  
	    	       
	    	    	if (!e)         //点击取消，直接返回  
		                return; 
		           
		          
		           
		            $.post("<%=request.getContextPath()%>/DelBankcard.jspx",{ids : rows},function(data){  
		                     
		            	if (data){  
		                        alert("信息","删除成功");
		            	        $("#grid-table").trigger("reloadGrid");}
		                        else  
		                       		alert("信息","删除失败");
		                    });
	    	    }
	}


</script>
</body>
</html>
