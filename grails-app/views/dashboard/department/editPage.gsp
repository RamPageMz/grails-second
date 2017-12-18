<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>人事管理-首页</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <asset:stylesheet src="bootstrap/dist/css/bootstrap.min.css" />
    <asset:stylesheet src="font-awesome/css/font-awesome.min.css"/>
    <asset:stylesheet src="Ionicons/css/ionicons.min.css" />
    <asset:stylesheet src="dist/css/AdminLTE.min.css" />
    <asset:stylesheet src="dist/css/skins/_all-skins.min.css" />
    <asset:stylesheet src="bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" />
    <asset:stylesheet src="bootstrap-daterangepicker/daterangepicker.css" />
    <asset:stylesheet src="bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" />
    <asset:stylesheet src="timepicker/bootstrap-timepicker.css" />
    <asset:stylesheet src="iCheck/all.css" />
    <asset:stylesheet src="select2/dist/css/select2.min.css" />

    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->
        <a href="" class="logo">

        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <!-- TODO 将下面的图片替换为user的头像 -->
                    <img src="${resource(dir: 'assets/images',file: 'userImage.jpg')}" class="img-circle" alt="User Image">
                </div>

                <div class="pull-left info">
                    <p>${session.getAttribute('username')}</p>
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>
            <!-- search form -->
            <form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                    <input type="text" name="q" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
                        <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i
                                class="fa fa-search"></i>
                        </button>
                    </span>
                </div>
            </form>
            <!-- /.search form -->
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">导航菜单</li>
                <li><a href="../index/index"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-files-o"></i>
                        <span>部门管理</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="../department/index"><i class="fa fa-circle-o"></i> 部门简介</a></li>
                        <li><a href="../department/editPage"><i class="fa fa-circle-o"></i> 信息维护</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-files-o"></i>
                        <span>员工管理</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="../staff/index"><i class="fa fa-circle-o"></i> 信息管理</a></li>
                        <li><a href="../staff/excelImport"><i class="fa fa-circle-o"></i> Excel导入/导出</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-files-o"></i>
                        <span>工资管理</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="pages/layout/top-nav.html"><i class="fa fa-circle-o"></i> 批量处理</a></li>
                        <li><a href="pages/layout/boxed.html"><i class="fa fa-circle-o"></i> 定时发放</a></li>
                    </ul>
                </li>
                <li><a href=""><i class="fa fa-calendar"></i> <span>日程安排</span></a></li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">

        </section>

        <!-- section-main -->
        <!-- Main content -->
        <section class="content">
        <!-- =========================================================== -->
        <div class="row">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">部门信息编辑</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>部门名称</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-user"></i>
                                    </div>
                                    <input type="text" class="form-control" id="department_name" value="${department?.name}">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>部门简称</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-info-circle"></i>
                                    </div>
                                    <input type="text" class="form-control" id="department_simpleName" value="${department?.simpleName}">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>上级部门</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-sitemap"></i>
                                    </div>
                                    <select class="form-control select2" style="width: 100%;" id="upper_department">
                                        <!--TODO 数据库选取部门列表-->
                                        <option selected="selected" value="">--请选择--</option>
                                        <g:each in="${departmentList}">
                                            <g:if test="${it?.departmentCode==department?.upperDepartment?.departmentCode}">
                                                <option selected value="${it?.departmentCode}">${it?.name}</option>
                                            </g:if>
                                            <g:else>
                                                <option value="${it?.departmentCode}">${it?.name}</option>
                                            </g:else>
                                        </g:each>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="submit" class="btn btn-info pull-right" onclick="saveDepartment()">保存</button>
                </div>
                <!-- /.box-footer -->
            </div>

            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">部门负责人编辑</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>现阶段负责人</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-user"></i>
                                    </div>
                                    <input type="text" class="form-control" id="search_name" value="${department?.staffInCharge?.staffBasic?.name}" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4" hidden>
                            <div class="form-group">
                                <label>隐藏</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-info-circle"></i>
                                    </div>
                                    <input type="text" class="form-control" id="idHidden" hidden value="${department?.id}">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>新负责人姓名</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-user"></i>
                                    </div>
                                    <input type="text" class="form-control" id="charge_name">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>新负责人工号</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-info-circle"></i>
                                    </div>
                                    <input type="text" class="form-control" id="charge_number">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>新负责人部门</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-sitemap"></i>
                                    </div>
                                    <select class="form-control select2" style="width: 100%;" id="charge_department">
                                        <!--TODO 数据库选取部门列表-->
                                        <option selected="selected" value="">--请选择--</option>
                                        <g:each in="${departmentList}">
                                            <g:if test="${it?.departmentCode==department?.departmentCode}">
                                                <option selected value="${it?.departmentCode}">${it?.name}</option>
                                            </g:if>
                                            <g:else>
                                                <option value="${it?.departmentCode}">${it?.name}</option>
                                            </g:else>
                                        </g:each>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 ">
                            <div class="form-group">
                                <label></label>
                                <div class="input-group col-md-5 col-md-offset-3" style="margin-top: 5px;">
                                    <button type="button" class="btn btn-block btn-info" onclick="searchInfo()">查询</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="box box-default">
                        <div class="box-header with-border">
                            <i class="fa fa-spinner"></i>
                            <h3 class="box-title">搜索结果</h3>
                        </div>
                        <div id="searchTemplate">

                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.col (right) -->
            </div>
            <!-- /.row -->
            <!-- =========================================================== -->
        </div>
    </section>
        <!-- /.content -->
        <!-- /.content-wrapper -->


        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Create the tabs -->
            <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
                <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
                <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
            </ul>
            <!-- Tab panes -->
            <div class="tab-content">
                <!-- Home tab content -->
                <div class="tab-pane" id="control-sidebar-home-tab">
                    <h3 class="control-sidebar-heading">Recent Activity</h3>
                    <ul class="control-sidebar-menu">
                        <li>
                            <a href="javascript:void(0)">
                                <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                                <div class="menu-info">
                                    <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                                    <p>Will be 23 on April 24th</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)">
                                <i class="menu-icon fa fa-user bg-yellow"></i>

                                <div class="menu-info">
                                    <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                                    <p>New phone +1(800)555-1234</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)">
                                <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

                                <div class="menu-info">
                                    <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                                    <p>nora@example.com</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)">
                                <i class="menu-icon fa fa-file-code-o bg-green"></i>

                                <div class="menu-info">
                                    <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                                    <p>Execution time 5 seconds</p>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <!-- /.control-sidebar-menu -->

                    <h3 class="control-sidebar-heading">Tasks Progress</h3>
                    <ul class="control-sidebar-menu">
                        <li>
                            <a href="javascript:void(0)">
                                <h4 class="control-sidebar-subheading">
                                    Custom Template Design
                                    <span class="label label-danger pull-right">70%</span>
                                </h4>

                                <div class="progress progress-xxs">
                                    <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)">
                                <h4 class="control-sidebar-subheading">
                                    Update Resume
                                    <span class="label label-success pull-right">95%</span>
                                </h4>

                                <div class="progress progress-xxs">
                                    <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)">
                                <h4 class="control-sidebar-subheading">
                                    Laravel Integration
                                    <span class="label label-warning pull-right">50%</span>
                                </h4>

                                <div class="progress progress-xxs">
                                    <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)">
                                <h4 class="control-sidebar-subheading">
                                    Back End Framework
                                    <span class="label label-primary pull-right">68%</span>
                                </h4>

                                <div class="progress progress-xxs">
                                    <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <!-- /.control-sidebar-menu -->

                </div>
                <!-- /.tab-pane -->
                <!-- Stats tab content -->
                <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
                <!-- /.tab-pane -->
                <!-- Settings tab content -->
                <div class="tab-pane" id="control-sidebar-settings-tab">
                    <form method="post">
                        <h3 class="control-sidebar-heading">General Settings</h3>

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Report panel usage
                                <input type="checkbox" class="pull-right" checked>
                            </label>

                            <p>
                                Some information about this general settings option
                            </p>
                        </div>
                        <!-- /.form-group -->

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Allow mail redirect
                                <input type="checkbox" class="pull-right" checked>
                            </label>

                            <p>
                                Other sets of options are available
                            </p>
                        </div>
                        <!-- /.form-group -->

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Expose author name in posts
                                <input type="checkbox" class="pull-right" checked>
                            </label>

                            <p>
                                Allow the user to show his name in blog posts
                            </p>
                        </div>
                        <!-- /.form-group -->

                        <h3 class="control-sidebar-heading">Chat Settings</h3>

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Show me as online
                                <input type="checkbox" class="pull-right" checked>
                            </label>
                        </div>
                        <!-- /.form-group -->

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Turn off notifications
                                <input type="checkbox" class="pull-right">
                            </label>
                        </div>
                        <!-- /.form-group -->

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Delete chat history
                                <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                            </label>
                        </div>
                        <!-- /.form-group -->
                    </form>
                </div>
                <!-- /.tab-pane -->
            </div>
        </aside>
        <!-- /.control-sidebar -->
        <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
        <div class="control-sidebar-bg"></div>
    </div>
    <!-- ./wrapper -->
    <asset:javascript src="jquery-2.2.0.min.js" />
    <!-- jQuery UI 1.11.4 -->
    %{--<script src="bower_components/jquery-ui/jquery-ui.min.js"></script>--}%
    <asset:javascript src="jquery-ui/jquery-ui.min.js" />
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <asset:javascript src="Chart.min.js" />
    <script>
        $.widget.bridge('uibutton', $.ui.button);
    </script>
    <asset:javascript src="bootstrap.min.js" />
    <asset:javascript src="raphael/raphael.min.js" />
    <asset:javascript src="morris.js/morris.min.js" />
    <asset:javascript src="jquery-sparkline/dist/jquery.sparkline.min.js" />
    <asset:javascript src="jvectormap/jquery-jvectormap-1.2.2.min.js" />
    <asset:javascript src="jvectormap/jquery-jvectormap-world-mill-en.js" />
    <asset:javascript src="jquery-knob/dist/jquery.knob.min.js" />
    <asset:javascript src="input-mask/jquery.inputmask.js" />
    <asset:javascript src="input-mask/jquery.inputmask.date.extensions.js" />
    <asset:javascript src="input-mask/jquery.inputmask.extensions.js" />
    <asset:javascript src="input-mask/jquery.inputmask.js" />
    <asset:javascript src="moment/min/moment.min.js" />
    <asset:javascript src="bootstrap-daterangepicker/daterangepicker.js" />
    <asset:javascript src="bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js" />
    <asset:javascript src="jquery-slimscroll/jquery.slimscroll.min.js" />
    <asset:javascript src="fastclick/lib/fastclick.js" />
    <asset:javascript src="dist/js/adminlte.min.js" />
    <asset:javascript src="dist/js/demo.js" />
    <asset:javascript src="timepicker/bootstrap-timepicker.min.js" />
    <asset:javascript src="iCheck/icheck.min.js" />

    <script>
        var startDate;
        var endDate;

        $(document).ready(function() {
            $('#config-demo').daterangepicker({
                "startDate": "11/25/2017",
                "endDate": "12/01/2017"
            }, function(start, end, label) {
                startDate=start.format('YYYY-MM-DD');
                endDate=end.format('YYYY-MM-DD');
                console.log(start.format('YYYY-MM-DD') + " to " + end.format('YYYY-MM-DD') );
            });
        });

        $(function () {
            //Initialize Select2 Elements
            $('.select2').select2()

            //Datemask dd/mm/yyyy
            $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
            //Datemask2 mm/dd/yyyy
            $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
            //Money Euro
            $('[data-mask]').inputmask()

            //Date range picker
            $('#reservation').daterangepicker()
            //Date range picker with time picker
            $('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A' })
            //Date range as a button
            $('#daterange-btn').daterangepicker(
                {
                    ranges   : {
                        'Today'       : [moment(), moment()],
                        'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                        'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
                        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                        'This Month'  : [moment().startOf('month'), moment().endOf('month')],
                        'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                    },
                    startDate: moment().subtract(29, 'days'),
                    endDate  : moment()
                },
                function (start, end) {
                    $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
                }
            )

            //Date picker
            $('#datepicker').datepicker({
                autoclose: true
            })

            //iCheck for checkbox and radio inputs
            $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
                checkboxClass: 'icheckbox_minimal-blue',
                radioClass   : 'iradio_minimal-blue'
            })
            //Red color scheme for iCheck
            $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
                checkboxClass: 'icheckbox_minimal-red',
                radioClass   : 'iradio_minimal-red'
            })
            //Flat red color scheme for iCheck
            $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                checkboxClass: 'icheckbox_flat-green',
                radioClass   : 'iradio_flat-green'
            })

            //Colorpicker
            $('.my-colorpicker1').colorpicker()
            //color picker with addon
            $('.my-colorpicker2').colorpicker()

            //Timepicker
            $('.timepicker').timepicker({
                showInputs: false
            })
        })

        function searchInfo() {
            var name = $("#charge_name").val();
            var number = $("#charge_number").val();
            var departmentCode = $("#charge_department").val();

            $.post("/department/searchPage",{name:name,staffNumber:number,departmentCode:departmentCode}, function(data) {
                $("#searchTemplate").html(data);
            }, "html");
        }

        function saveDepartment() {
            var name=$("#department_name").val();
            var simpleName=$("#department_simpleName").val();
            var upperCode=$("#upper_department").val();

            $.post("/department/saveDepartment",{name:name,simpleName:simpleName,upperCode:upperCode,departmentID:'${department?.id}'}, function(data) {
                alert(data.message);
            }, "json");
        }


    </script>
</body>
</html>
