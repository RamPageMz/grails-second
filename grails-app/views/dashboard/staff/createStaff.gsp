<%@ page import="javax.servlet.ServletContext" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>人事管理</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <asset:stylesheet src="bootstrap/dist/css/bootstrap.min.css"/>
    <asset:stylesheet src="font-awesome/css/font-awesome.min.css"/>
    <asset:stylesheet src="Ionicons/css/ionicons.min.css"/>
    <asset:stylesheet src="dist/css/AdminLTE.min.css"/>
    <asset:stylesheet src="dist/css/skins/_all-skins.min.css"/>
    <asset:stylesheet src="bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css"/>
    <asset:stylesheet src="bootstrap-daterangepicker/daterangepicker.css"/>
    <asset:stylesheet src="bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"/>
    <asset:stylesheet src="timepicker/bootstrap-timepicker.css"/>
    <asset:stylesheet src="iCheck/all.css"/>
    <asset:stylesheet src="select2/dist/css/select2.min.css"/>

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
                    <img src="${resource(dir: 'assets/images', file: 'userImage.jpg')}" class="img-circle"
                         alt="User Image">
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
                        <li><a href=""><i class="fa fa-circle-o"></i> 部门简介</a></li>
                        <li><a href="../department/index"><i class="fa fa-circle-o"></i> 信息维护</a></li>
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
                        <li><a href=""><i class="fa fa-circle-o"></i> 批量处理</a></li>
                        <li><a href=""><i class="fa fa-circle-o"></i> 定时发放</a></li>
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
            <div class="box box-default">
                <div class="box-header with-border">
                    <i class="fa fa-search"></i>

                    <h3 class="box-title">上传照片</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                class="fa fa-minus"></i></button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-3">
                            <input type="file" class="form-control" id="thumbnail" name="thumbnail">
                        </div>

                    </div>
                </div>
            </div>
            <!-- Small boxes (Stat box) -->
            <div class="box box-default">
                <div class="box-header with-border">
                    <i class="fa fa-search"></i>

                    <h3 class="box-title">基本信息</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                class="fa fa-minus"></i></button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="row">
                        <form id="basicForm">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>姓名</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <input type="name" class="form-control" id="basic_name" name="basic_name" placeholder="Enter name">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>性别</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <select class="form-control select2" style="width: 100%;" id="basic_sex" name="basic_sex">
                                            <option selected="selected" value="">--请选择--</option>
                                            <option value="1">男</option>
                                            <option value="0">女</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label >出生日期</label>
                                    <div class="input-group">

                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control" id="basic_birth" name="basic_birth" value="">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>身份证号</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <input type="text" class="form-control" id="basic_card" name="basic_card" placeholder="id">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label >手机号码</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <input type="text" class="form-control" id="basic_mobilePhone" name="basic_mobilePhone" value="" placeholder="Enter mobilePhone">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label >民族</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <input type="text" class="form-control" id="basic_race" name="basic_race" value="" placeholder="民族">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>籍贯</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <input type="text" class="form-control" id="basic_origin" name="basic_origin" placeholder="Enter Native place">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>户籍类别</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <select class="form-control select2" style="width: 100%;" id="basic_householdType" name="basic_householdType">
                                            <option selected="selected" value="">--请选择--</option>
                                            <g:each in="${grails.second.SysCode.findAllByType('household')}">%{--从sysCode中取值--}%
                                                <option value="${it?.codeKey}">${it?.codeValue}</option>
                                            </g:each>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>是否有上海居住证</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <select class="form-control select2" style="width: 100%;" id="basic_haveShang" name="basic_haveShang">
                                            <option selected="selected" value="">--请选择--</option>
                                            <option value="0">没有</option>
                                            <option value="1">有</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>有效期</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <input type="text" class="form-control" id="basic_validityTime" name="basic_validityTime" value="">
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>政治面貌</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <select class="form-control select2" style="width: 100%;" id="basic_politic" name="basic_politic">
                                            <option selected="selected" value="">--请选择政治面貌--</option>
                                            <g:each in="${grails.second.SysCode.findAllByType('politic')}">%{--从sysCode中取值--}%
                                                <option value="${it?.codeKey}">${it?.codeValue}</option>
                                            </g:each>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>教育程度</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <select class="form-control select2" style="width: 100%;" id="basic_education" name="basic_education">
                                            <option selected="selected" value="">--请选择--</option>
                                            <g:each in="${grails.second.SysCode.findAllByType('education')}">%{--从sysCode中取值--}%
                                                <option value="${it?.codeKey}">${it?.codeValue}</option>
                                            </g:each>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>健康状况</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <select class="form-control select2" style="width: 100%;" id="basic_health" name="basic_health">
                                            <option selected="selected" value="">--请选择--</option>
                                            <g:each in="${grails.second.SysCode.findAllByType('health')}">%{--从sysCode中取值--}%
                                                <option value="${it?.codeKey}">${it?.codeValue}</option>
                                            </g:each>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>婚姻状况</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <select class="form-control select2" style="width: 100%;" id="basic_marriage" name="basic_marriage">
                                            <option selected="selected" value="">--请选择--</option>
                                            <g:each in="${grails.second.SysCode.findAllByType('marriage')}">%{--从sysCode中取值--}%
                                                <option value="${it?.codeKey}">${it?.codeValue}</option>
                                            </g:each>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>学习专业</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <input type="text" class="form-control" id="basic_major" name="basic_major" value="">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>毕业时间</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control" id="basic_graduationTime" name="basic_graduationTime" value="">
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>职称</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <input type="text" class="form-control" id="basic_proTitle" name="basic_proTitle" value="">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>部门</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-sitemap"></i>
                                        </div>
                                        <select class="form-control select2" style="width: 100%;" id="basic_departmentCode"  name="basic_departmentCode">
                                            <option selected="selected" value="">--请选择--</option>
                                            <g:each in="${grails.second.Department.all}">
                                                <option value="${it?.departmentCode}">${it?.name}</option>
                                            </g:each>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>工作职务</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <select class="form-control select2" style="width: 100%;" id="basic_duty"  name="basic_duty">
                                            <option selected="selected" value="">--请选择--</option>
                                            <g:each in="${grails.second.DutyCode.all}">
                                                <option value="${it?.codeKey}">${it?.codeValue}</option>
                                            </g:each>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>入职时间</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control" id="basic_hireTime" name="basic_hireTime" value="">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>本地住址</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <input type="text" class="form-control" id="basic_localAddress" name="basic_localAddress" value="">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>邮编</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <input type="text" class="form-control" id="basic_zipCode" name="basic_zipCode" value="">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>住宅电话</label>

                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>
                                        <input type="text" class="form-control" id="basic_homePhone" name="basic_homePhone" value="">
                                    </div>
                                </div>
                            </div>

                        </form>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button class="btn btn-primary" onclick="saveBasic()">保存</button>
                </div>
            </div>
            <!-- /.row (main row) -->

            <div class="box box-default">
                <div class="box-header with-border">
                    <i class="fa fa-search"></i>

                    <h3 class="box-title">家庭信息</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                class="fa fa-minus"></i></button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form id="homeForm">
                    <form id="familyForm" name="familyForm">
                    %{--<div class="row">--}%
                    <div id="loverDiv">

                       %{-- <g:uploadForm action="saveFile" method="post">
                            <input type="file" id="fileLoad" name="fileLoad"/>
                            <input type="submit" value="sub" />
                        </g:uploadForm>
                        <g:form controller="staff" action="saveFile" method="post" enctype="multipart/form-data">
                            <input type="file" name="myFile" />
                            <input type="submit" value="上&nbsp;&nbsp;&nbsp;传" />
                        </g:form>
                        <button onclick="saveFile()">upload</button>--}%
                    <!-- /.col -->
                        <strong><i class="fa  fa-venus-double"></i>&nbsp;配偶信息</strong><i class="fa  fa-plus-square-o" style="margin-left: 20px;" onclick="showLoverDiv()"></i>
                        <div id="loverDetail" style="margin-top: 10px;display: none;">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-user"></i>
                                            </div>
                                            <input type="text" class="form-control" id="family_lover_name" name="family_lover_name" value="" placeholder="姓名">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-user"></i>
                                            </div>
                                            <input type="text" class="form-control" id="family_lover_birth" name="family_lover_birth" value="" placeholder="出生日期">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-user"></i>
                                            </div>
                                            <input type="text" class="form-control" id="family_lover_origin" name="family_lover_origin" value="" placeholder="籍贯">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-user"></i>
                                            </div>
                                            <input type="text" class="form-control" id="family_lover_race" name="family_lover_race" value="" placeholder="民族">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-user"></i>
                                            </div>
                                            <input type="text" class="form-control" id="family_lover_workUnit" name="family_lover_workUnit" value="" placeholder="工作单位">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-user"></i>
                                            </div>
                                            <input type="text" class="form-control" id="family_lover_duty" name="family_lover_duty" value="" placeholder="工作职务">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-user"></i>
                                            </div>
                                            <select class="form-control select2" style="width: 100%;" id="family_lover_politic" name="family_lover_politic">
                                                <option selected="selected" value="">--请选择政治面貌--</option>
                                                <g:each in="${grails.second.SysCode.findAllByType('politic')}">%{--从sysCode中取值--}%
                                                    <option value="${it?.codeKey}">${it?.codeValue}</option>
                                                </g:each>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-user"></i>
                                            </div>
                                            <select class="form-control select2" style="width: 100%;" id="family_lover_degree" name="family_lover_degree">
                                                <option selected="selected" value="">--请选择学位--</option>
                                                <g:each in="${grails.second.SysCode.findAllByType('degree')}">%{--从sysCode中取值--}%
                                                    <option value="${it?.codeKey}">${it?.codeValue}</option>
                                                </g:each>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-user"></i>
                                            </div>
                                            <input type="text" class="form-control" id="family_lover_phone" name="family_lover_phone" value="" placeholder="联系方式">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="familyDiv" style="margin-top: 20px;">
                        <strong><i class="fa  fa-venus-double"></i> 家庭信息</strong><i class="fa  fa-plus-square-o" style="margin-left: 20px;" onclick="addFamily()"></i>
                        <div id="familyFrame" >
                            <div id="familyDetail" style="margin-top: 10px;">

                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-user"></i>
                                                    </div>
                                                    <input type="text" class="form-control" id="family_appellation1" name="family_appellation1" value="父亲" placeholder="称谓" disabled>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-user"></i>
                                                    </div>
                                                    <input type="text" class="form-control" id="family_name1" name="family_name1" value="" placeholder="姓名">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-user"></i>
                                                    </div>
                                                    <input type="text" class="form-control" id="family_birth1" name="family_birth1" value="" placeholder="出生日期">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-user"></i>
                                                    </div>
                                                    <input type="text" class="form-control" id="family_workUnit1" name="family_workUnit1" value="" placeholder="工作单位">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-user"></i>
                                                    </div>
                                                    <input type="text" class="form-control" id="family_duty1" name="family_duty1" value="" placeholder="工作职务">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-user"></i>
                                                    </div>
                                                    <select class="form-control select2" style="width: 100%;" id="family_politic1" name="family_politic1">
                                                        <option selected="selected" value="">--请选择政治面貌--</option>
                                                        <g:each in="${grails.second.SysCode.findAllByType('politic')}">%{--从sysCode中取值--}%
                                                            <option value="${it?.codeKey}">${it?.codeValue}</option>
                                                        </g:each>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-user"></i>
                                                    </div>
                                                    <input type="text" class="form-control" id="family_phone1" name="family_phone1" value="" placeholder="联系方式">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 15px;">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-user"></i>
                                                    </div>
                                                    <input type="text" class="form-control" id="family_appellation2" name="family_appellation2" value="母亲" placeholder="称谓" disabled>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-user"></i>
                                                    </div>
                                                    <input type="text" class="form-control" id="family_name2" name="family_name2" value="" placeholder="姓名">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-user"></i>
                                                    </div>
                                                    <input type="text" class="form-control" id="family_birth2" name="family_birth2" value="" placeholder="出生日期">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-user"></i>
                                                    </div>
                                                    <input type="text" class="form-control" id="family_workUnit2" name="family_workUnit2" value="" placeholder="工作单位">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-user"></i>
                                                    </div>
                                                    <input type="text" class="form-control" id="family_duty2" name="family_duty2" value="" placeholder="工作职务">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-user"></i>
                                                    </div>
                                                    <select class="form-control select2" style="width: 100%;" id="family_politic2" name="family_politic2">
                                                        <option selected="selected" value="">--请选择政治面貌--</option>
                                                        <g:each in="${grails.second.SysCode.findAllByType('politic')}">%{--从sysCode中取值--}%
                                                            <option value="${it?.codeKey}">${it?.codeValue}</option>
                                                        </g:each>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-user"></i>
                                                    </div>
                                                    <input type="text" class="form-control" id="family_phone2" name="family_phone2" value="" placeholder="联系方式">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3" hidden>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-user"></i>
                                                    </div>
                                                    <input type="text" hidden class="form-control" id="staffNumberHidden" name="staffNumberHidden" value="" placeholder="">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                    </form>
                    </form>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button class="btn btn-primary" onclick="saveHome()">保存</button>
                </div>
            </div>

            <div class="box box-default">
                <div class="box-header with-border">
                    <i class="fa fa-search"></i>

                    <h3 class="box-title">学习经历</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                class="fa fa-minus"></i></button>
                    </div>
                </div>
                <!-- /.box-header -->
                <form id="studyForm">
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>起止时间</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" id="study_date1" name="study_date1" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>学校</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-info-circle"></i>
                                    </div>
                                    <input type="text" class="form-control" id="study_school1" name="study_school1">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>专业</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-sitemap"></i>
                                    </div>
                                    <input type="text" class="form-control" id="study_major1" name="study_major1">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>职务</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-street-view"></i>
                                    </div>
                                    <input type="text" class="form-control" id="study_duty1" name="study_duty1">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>证明人</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-user"></i>
                                    </div>
                                    <input type="text" class="form-control" id="study_man1" name="study_man1">
                                </div>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                    <div class="row" style="margin-top: 15px;">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>起止时间</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" id="study_date2" name="study_date2" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>学校</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-info-circle"></i>
                                    </div>
                                    <input type="text" class="form-control" id="study_school2" name="study_school2">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>专业</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-sitemap"></i>
                                    </div>
                                    <input type="text" class="form-control" id="study_major2" name="study_major2">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>职务</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-street-view"></i>
                                    </div>
                                    <input type="text" class="form-control" id="study_duty2" name="study_duty2">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>证明人</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-user"></i>
                                    </div>
                                    <input type="text" class="form-control" id="study_man2" name="study_man2">
                                </div>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                    <div class="row" style="margin-top: 15px;">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>起止时间</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" id="study_date3" name="study_date3" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>学校</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-info-circle"></i>
                                    </div>
                                    <input type="text" class="form-control" id="study_school3" name="study_school3">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>专业</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-sitemap"></i>
                                    </div>
                                    <input type="text" class="form-control" id="study_major3" name="study_major3">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>职务</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-street-view"></i>
                                    </div>
                                    <input type="text" class="form-control" id="study_duty3" name="study_duty3">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>证明人</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-user"></i>
                                    </div>
                                    <input type="text" class="form-control" id="study_man3" name="study_man3">
                                </div>
                            </div>
                        </div>
                    <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                </form>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button class="btn btn-primary" onclick="saveStudy()">保存</button>
                </div>
            </div>

            <div class="box box-default">
                <div class="box-header with-border">
                    <i class="fa fa-search"></i>

                    <h3 class="box-title">工作经历</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                class="fa fa-minus"></i></button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>起止时间</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" id="work_date1" name="work_date1" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>工作单位</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-info-circle"></i>
                                    </div>
                                    <input type="text" class="form-control" id="work_unit1" name="work_unit1">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>部门</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-sitemap"></i>
                                    </div>
                                    <input type="text" class="form-control" id="work_department1" name="work_department1">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>职务</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-street-view"></i>
                                    </div>
                                    <input type="text" class="form-control" id="work_duty1" name="work_duty1">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>证明人</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-user"></i>
                                    </div>
                                    <input type="text" class="form-control" id="work_man1" name="work_man1">
                                </div>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                    <div class="row" style="margin-top: 15px;">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>起止时间</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" id="work_date2" name="work_date2" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>工作单位</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-info-circle"></i>
                                    </div>
                                    <input type="text" class="form-control" id="work_unit2" name="work_unit2">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>部门</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-sitemap"></i>
                                    </div>
                                    <input type="text" class="form-control" id="work_department2" name="work_department2">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>职务</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-street-view"></i>
                                    </div>
                                    <input type="text" class="form-control" id="work_duty2" name="work_duty2">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>证明人</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-user"></i>
                                    </div>
                                    <input type="text" class="form-control" id="work_man2" name="work_man2">
                                </div>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                    <div class="row" style="margin-top: 15px;">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>起止时间</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" id="work_date3" name="work_date3" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>工作单位</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-info-circle"></i>
                                    </div>
                                    <input type="text" class="form-control" id="work_unit3" name="work_unit3">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>部门</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-sitemap"></i>
                                    </div>
                                    <input type="text" class="form-control" id="work_department3" name="work_department3">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>职务</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-street-view"></i>
                                    </div>
                                    <input type="text" class="form-control" id="work_duty3" name="work_duty3">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>证明人</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-user"></i>
                                    </div>
                                    <input type="text" class="form-control" id="work_man3" name="work_man3">
                                </div>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="submit" class="btn btn-primary" onclick="saveWork()">保存</button>
                </div>
            </div>

            <div class="box box-default">
                <div class="box-header with-border">
                    <i class="fa fa-search"></i>

                    <h3 class="box-title">业绩信息</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                class="fa fa-minus"></i></button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>获奖时间</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" id="score_date1" name="score_date1" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>奖惩情况</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-info-circle"></i>
                                    </div>
                                    <input type="text" class="form-control" id="score_info1" name="score_info1">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>奖惩等级</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-sitemap"></i>
                                    </div>
                                    <input type="text" class="form-control" id="score_level1" name="score_level1">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label>奖惩单位</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-street-view"></i>
                                    </div>
                                    <input type="text" class="form-control" id="score_unit1" name="score_unit1">
                                </div>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                    <div class="row" style="margin-top: 15px;">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>获奖时间</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" id="score_date2" name="score_date2" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>奖惩情况</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-info-circle"></i>
                                    </div>
                                    <input type="text" class="form-control" id="score_info2" name="score_info2">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>奖惩等级</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-sitemap"></i>
                                    </div>
                                    <input type="text" class="form-control" id="score_level2" name="score_level2">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label>奖惩单位</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-street-view"></i>
                                    </div>
                                    <input type="text" class="form-control" id="score_unit2" name="score_unit2">
                                </div>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                    <div class="row" style="margin-top: 15px;">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>获奖时间</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" id="score_date3" name="score_date3" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>奖惩情况</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-info-circle"></i>
                                    </div>
                                    <input type="text" class="form-control" id="score_info3" name="score_info3">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label>奖惩等级</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-sitemap"></i>
                                    </div>
                                    <input type="text" class="form-control" id="score_level3" name="score_level3">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label>奖惩单位</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-street-view"></i>
                                    </div>
                                    <input type="text" class="form-control" id="score_unit3" name="score_unit3">
                                </div>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button class="btn btn-primary" onclick="saveScore()">保存</button>
                </div>
            </div>

            <div id="detailTemplate">

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
                                <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i>
                                </a>
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
    <asset:javascript src="jquery-2.2.0.min.js"/>
    <!-- jQuery UI 1.11.4 -->
    %{--<script src="bower_components/jquery-ui/jquery-ui.min.js"></script>--}%
    <asset:javascript src="jquery-ui/jquery-ui.min.js"/>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <asset:javascript src="Chart.min.js"/>
    <script>
        $.widget.bridge('uibutton', $.ui.button);
    </script>
    <asset:javascript src="bootstrap.min.js"/>
    <asset:javascript src="raphael/raphael.min.js"/>
    <asset:javascript src="morris.js/morris.min.js"/>
    <asset:javascript src="jquery-sparkline/dist/jquery.sparkline.min.js"/>
    <asset:javascript src="jvectormap/jquery-jvectormap-1.2.2.min.js"/>
    <asset:javascript src="jvectormap/jquery-jvectormap-world-mill-en.js"/>
    <asset:javascript src="jquery-knob/dist/jquery.knob.min.js"/>
    <asset:javascript src="input-mask/jquery.inputmask.js"/>
    <asset:javascript src="input-mask/jquery.inputmask.date.extensions.js"/>
    <asset:javascript src="input-mask/jquery.inputmask.extensions.js"/>
    <asset:javascript src="input-mask/jquery.inputmask.js"/>
    <asset:javascript src="moment/min/moment.min.js"/>
    <asset:javascript src="bootstrap-daterangepicker/daterangepicker.js"/>
    <asset:javascript src="bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"/>
    <asset:javascript src="jquery-slimscroll/jquery.slimscroll.min.js"/>
    <asset:javascript src="fastclick/lib/fastclick.js"/>
    <asset:javascript src="dist/js/adminlte.min.js"/>
    <asset:javascript src="dist/js/demo.js"/>
    <asset:javascript src="timepicker/bootstrap-timepicker.min.js"/>
    <asset:javascript src="iCheck/icheck.min.js"/>

    <script>
        var startDate;
        var endDate;
        var staffNumber;

        var study1_start;
        var study2_start;
        var study3_start;
        var study1_end;
        var study2_end;
        var study3_end;

        var work1_start;
        var work2_start;
        var work3_start;
        var work1_end;
        var work2_end;
        var work3_end;

        var scoreDate1;
        var scoreDate2;
        var scoreDate3;

        $(document).ready(function () {
            $('#basic_hireTime').daterangepicker({
                singleDatePicker: true,
                startDate: moment()
            });

            $('#basic_birth').daterangepicker({
                singleDatePicker: true,
                startDate: moment()
            });

            $('#basic_graduationTime').daterangepicker({
                singleDatePicker: true,
                startDate: moment()
            });

            $('#basic_validityTime').daterangepicker({
                singleDatePicker: true,
                startDate: moment()
            });

            $('#family_lover_birth').daterangepicker({
                singleDatePicker: true,
                startDate: moment()
            });

            $('#family_birth1').daterangepicker({
                singleDatePicker: true,
                startDate: moment()
            });

            $('#family_birth2').daterangepicker({
                singleDatePicker: true,
                startDate: moment()
            });

            $('#score_date1').daterangepicker({
                singleDatePicker: true,
                startDate: moment()
            });
            $('#score_date2').daterangepicker({
                singleDatePicker: true,
                startDate: moment()
            });
            $('#score_date3').daterangepicker({
                singleDatePicker: true,
                startDate: moment()
            });

            $("input[name='family_birth']").each(
                function(){
                    $(this).daterangepicker({
                        singleDatePicker: true,
                        startDate: moment()
                    });
                });


            $('#study_date1').daterangepicker({
                "startDate": "11/25/2017",
                "endDate": "12/01/2017"
            }, function (start, end, label) {
                study1_start = start.format('YYYY-MM-DD');
                study1_end = end.format('YYYY-MM-DD');
                console.log(start.format('YYYY-MM-DD') + " to " + end.format('YYYY-MM-DD'));
            });

            $('#study_date2').daterangepicker({
                "startDate": "11/25/2017",
                "endDate": "12/01/2017"
            }, function (start, end, label) {
                study2_start = start.format('YYYY-MM-DD');
                study2_end = end.format('YYYY-MM-DD');
                console.log(start.format('YYYY-MM-DD') + " to " + end.format('YYYY-MM-DD'));
            });

            $('#study_date3').daterangepicker({
                "startDate": "11/25/2017",
                "endDate": "12/01/2017"
            }, function (start, end, label) {
                study3_start = start.format('YYYY-MM-DD');
                study3_end = end.format('YYYY-MM-DD');
                console.log(start.format('YYYY-MM-DD') + " to " + end.format('YYYY-MM-DD'));
            });

            $('#work_date1').daterangepicker({
                "startDate": "11/25/2017",
                "endDate": "12/01/2017"
            }, function (start, end, label) {
                work1_start = start.format('YYYY-MM-DD');
                work1_end = end.format('YYYY-MM-DD');
                console.log(start.format('YYYY-MM-DD') + " to " + end.format('YYYY-MM-DD'));
            });

            $('#work_date2').daterangepicker({
                "startDate": "11/25/2017",
                "endDate": "12/01/2017"
            }, function (start, end, label) {
                work2_start = start.format('YYYY-MM-DD');
                work2_end = end.format('YYYY-MM-DD');
                console.log(start.format('YYYY-MM-DD') + " to " + end.format('YYYY-MM-DD'));
            });

            $('#work_date3').daterangepicker({
                "startDate": "11/25/2017",
                "endDate": "12/01/2017"
            }, function (start, end, label) {
                work3_start = start.format('YYYY-MM-DD');
                work3_end = end.format('YYYY-MM-DD');
                console.log(start.format('YYYY-MM-DD') + " to " + end.format('YYYY-MM-DD'));
            });
        });

        $(function () {
            //Initialize Select2 Elements
            $('.select2').select2()

            //Datemask dd/mm/yyyy
            $('#datemask').inputmask('dd/mm/yyyy', {'placeholder': 'dd/mm/yyyy'})
            //Datemask2 mm/dd/yyyy
            $('#datemask2').inputmask('mm/dd/yyyy', {'placeholder': 'mm/dd/yyyy'})
            //Money Euro
            $('[data-mask]').inputmask()

            //Date range picker
            $('#reservation').daterangepicker()
            //Date range picker with time picker
            $('#reservationtime').daterangepicker({
                timePicker: true,
                timePickerIncrement: 30,
                format: 'MM/DD/YYYY h:mm A'
            })
            //Date range as a button
            $('#daterange-btn').daterangepicker(
                {
                    ranges: {
                        'Today': [moment(), moment()],
                        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                        'This Month': [moment().startOf('month'), moment().endOf('month')],
                        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                    },
                    startDate: moment().subtract(29, 'days'),
                    endDate: moment()
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
                radioClass: 'iradio_minimal-blue'
            })
            //Red color scheme for iCheck
            $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
                checkboxClass: 'icheckbox_minimal-red',
                radioClass: 'iradio_minimal-red'
            })
            //Flat red color scheme for iCheck
            $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                checkboxClass: 'icheckbox_flat-green',
                radioClass: 'iradio_flat-green'
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

        function saveBasic() {
            $.post("/staff/createBasic",$("#basicForm").serializeArray(), function(data) {
                alert(data.backMessage);
                staffNumber=data.staffNumber;
                $("#staffNumberHidden").val(staffNumber);
                console.log("staffNumber:"+staffNumber);
            }, "json");
        }

        function showLoverDiv() {
            document.getElementById("loverDetail").style.display="";
        }
        
        function saveHome() {
            console.log("staffNumber:"+staffNumber);
            $.post("/staff/createHome",$("#homeForm").serializeArray(), function(data) {
                alert(data.backMessage);
            }, "json");
        }
        
        function saveStudy() {
            $.post("/staff/saveStudy",{
                study1_start:study1_start,study1_end:study1_end,study2_start:study2_start,study2_end:study2_end,study3_start:study3_start,study3_end:study3_end,
                study_school1:$('#study_school1').val(),study_major1:$('#study_major1').val(),study_duty1:$('#study_duty1').val(),study_man1:$("#study_man1").val(),
                study_school2:$('#study_school2').val(),study_major2:$('#study_major2').val(),study_duty2:$('#study_duty2').val(),study_man2:$("#study_man2").val(),
                study_school3:$('#study_school3').val(),study_major3:$('#study_major3').val(),study_duty3:$('#study_duty3').val(),study_man3:$("#study_man3").val()
            }, function(data) {
                alert(data.backMessage);
            }, "json");
        }

        function saveWork() {
            $.post("/staff/saveWork",{
                work1_start:work1_start,work1_end:work1_end,work2_start:work2_start,work2_end:work2_end,work3_start:work3_start,work3_end:work3_end,
                work_unit1:$('#work_unit1').val(),work_department1:$("#work_department1").val(),work_duty1:$("#work_duty1").val(),work_man1:$("#work_man1").val(),
                work_unit2:$('#work_unit2').val(),work_department2:$("#work_department2").val(),work_duty2:$("#work_duty2").val(),work_man2:$("#work_man2").val(),
                work_unit3:$('#work_unit3').val(),work_department3:$("#work_department3").val(),work_duty3:$("#work_duty3").val(),work_man3:$("#work_man3").val()
            }, function(data) {
                alert(data.backMessage);
            }, "json");
        }

        function saveScore() {
            $.post("/staff/saveScore",{
                score_date1:$("#score_date1").val(),score_date2:$("#score_date2").val(),score_date3:$("#score_date3").val(),
                score_info1:$('#score_info1').val(),score_level1:$("#score_level1").val(),score_unit1:$("#score_unit1").val(),
                score_info2:$('#score_info2').val(),score_level2:$("#score_level2").val(),score_unit2:$("#score_unit2").val(),
                score_info3:$('#score_info3').val(),score_level3:$("#score_level3").val(),score_unit3:$("#score_unit3").val()
            }, function(data) {
                alert(data.backMessage);
            }, "json");
        }

        function getObjectURL(file) {
            var url = null ;
            if (window.createObjectURL!=undefined) { // basic
                url = window.createObjectURL(file) ;
            } else if (window.URL!=undefined) { // mozilla(firefox)
                url = window.URL.createObjectURL(file) ;
            } else if (window.webkitURL!=undefined) { // webkit or chrome
                url = window.webkitURL.createObjectURL(file) ;
            }
            return url ;
        }

        $('#thumbnail').change(function() {
            var eImg = $('<img />');
            eImg.attr('src', getObjectURL($(this)[0].files[0])); // 或 this.files[0] this->input
            $(this).after(eImg);});

    </script>
</body>
</html>
