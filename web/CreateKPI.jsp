<%-- 
   Document   : blankpage
   Created on : Aug 24, 2016, 5:56:01 AM
   Author     : Eugene
--%>

<%@page import="entity.Client"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ClientDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file= "blankpage.jsp" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>The Form</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <!-- Site wrapper -->
        <div class="wrapper">

            <header class="main-header">
                <!-- Logo -->
                <a href="index2.html" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"><b>SG</b></span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b>Safeguard</b></span>
                </a>
                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>

                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- Messages: style can be found in dropdown.less-->
                            <li class="dropdown messages-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-envelope-o"></i>
                                    <span class="label label-success">4</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="header">You have 4 messages</li>
                                    <li>
                                        <!-- inner menu: contains the actual data -->
                                        <ul class="menu">
                                            <li><!-- start message -->
                                                <a href="#">
                                                    <div class="pull-left">
                                                        <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                                                    </div>
                                                    <h4>
                                                        Support Team
                                                        <small><i class="fa fa-clock-o"></i> 5 mins</small>
                                                    </h4>
                                                    <p>Why not buy a new awesome theme?</p>
                                                </a>
                                            </li>
                                            <!-- end message -->
                                        </ul>
                                    </li>
                                    <li class="footer"><a href="#">See All Messages</a></li>
                                </ul>
                            </li>
                            <!-- Notifications: style can be found in dropdown.less -->
                            <li class="dropdown notifications-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-bell-o"></i>
                                    <span class="label label-warning">10</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="header">You have 10 notifications</li>
                                    <li>
                                        <!-- inner menu: contains the actual data -->
                                        <ul class="menu">
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-users text-aqua"></i> 5 new members joined today
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="footer"><a href="#">View all</a></li>
                                </ul>
                            </li>
                            <!-- Tasks: style can be found in dropdown.less -->
                            <li class="dropdown tasks-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-flag-o"></i>
                                    <span class="label label-danger">9</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="header">You have 9 tasks</li>
                                    <li>
                                        <!-- inner menu: contains the actual data -->
                                        <ul class="menu">
                                            <li><!-- Task item -->
                                                <a href="#">
                                                    <h3>
                                                        Design some buttons
                                                        <small class="pull-right">20%</small>
                                                    </h3>
                                                    <div class="progress xs">
                                                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                            <span class="sr-only">20% Complete</span>
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                            <!-- end task item -->
                                        </ul>
                                    </li>
                                    <li class="footer">
                                        <a href="#">View all tasks</a>
                                    </li>
                                </ul>
                            </li>
                            <!-- User Account: style can be found in dropdown.less -->
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                                    <span class="hidden-xs">Alexander Pierce</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                        <p>
                                            Alexander Pierce - Web Developer
                                            <small>Member since Nov. 2012</small>
                                        </p>
                                    </li>
                                    <!-- Menu Body -->
                                    <li class="user-body">
                                        <div class="row">
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Followers</a>
                                            </div>
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Sales</a>
                                            </div>
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Friends</a>
                                            </div>
                                        </div>
                                        <!-- /.row -->
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a href="#" class="btn btn-default btn-flat">Profile</a>
                                        </div>
                                        <div class="pull-right">
                                            <a href="#" class="btn btn-default btn-flat">Sign out</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>

            <!-- =============================================== -->

            <!-- Left side column. contains the sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="../../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>Alexander Pierce</p>
                            <a><i class="fa fa-circle text-orange"></i> <b>VPO</b></a>
                        </div>
                    </div>
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li>
                            <a href="dashboard.jsp">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li>
                            <a href="TheForm.jsp">
                                <i class="fa fa-pie-chart"></i> <span>Performance</span>
                            </a>
                        </li>
                        <li class="treeview">
                            <a href="add-applicant.jsp">
                                <i class="fa fa-user-plus"></i>
                                <span>Recruitment</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="ApplicantList.jsp"><i class="fa fa-circle-o"></i> Applicant Lists</a></li>
                                <li><a href="applicant-schedule.jsp"><i class="fa fa-circle-o"></i> Schedule</a></li>
                                <li><a href="#"><i class="fa fa-circle-o"></i> Rejected Applicants</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="allocation.jsp">
                                <i class="fa fa-users"></i>
                                <span>Allocation</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#"><i class="fa fa-circle-o"></i> idk</a></li>
                                <li><a href="#"><i class="fa fa-circle-o"></i> idk</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="Ticketing.jsp">
                                <i class="fa fa-calendar"></i> <span>Ticketing</span>
                            </a>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-comment-o"></i> <span>Licenses & Contracts</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#"><i class="fa fa-circle-o"></i> safasd</a></li>
                                <li><a href="#"><i class="fa fa-circle-o"></i> afad</a></li>
                            </ul>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>


            <!-- =============================================== -->

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <form class="form-horizontal box-body" action="addKPI" method="post">


                    <fieldset>
                        <div class="box box-info">
                            <div class="col-xs-12">
                                <br>
                                <h3 class="box-title"><strong><u>Performance Criteria</u></strong></h3>
                            </div>
                            <div class="box-header with-border count">



                                <% ClientDAO clientDAO = new ClientDAO();
                                    ArrayList<Client> clientList = clientDAO.getAllClients();%>

                                <div class="col-xs-3">
                                    <label>Client</label>
                                    <select class="form-control select2" name="clientName" id="clientName">
                                        <% for (int i = 0; i < clientList.size(); i++) {%>
                                        <option value="<%=clientList.get(i).getClientID()%>">  <%=clientList.get(i).getClientName()%></option>
                                        <% }%>
                                    </select>
                                </div>

                            </div>

                            <table class="table" id="tblDefault" name="tblDefault">
                                <tbody id="tbody1" name="tbody1">
                                    <tr class="tabRow1">
                                        <td>
                                            <table style="table-layout: fixed" class="table" id="tblGrid" CELLPADDING="3" CELLSPACING="3" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th class="text-left" style="width:285px;" >Performance Indicator</th>
                                                        <th class="text-left" >Performance Measure</th>
                                                        <th class="text-left" style="border-bottom: 1px solid green;" >Weekly Target</th> 
                                                        <th class="text-left" style="border-bottom: 1px solid gold;" >Below Target</th> 
                                                        <th class="text-left" style="border-bottom: 1px solid red; width:130px;" >Well Below Target</th> 
                                                        <th class="text-left" style="width:110px;">Specify Weight</th>
                                                        <th class="text-left" style="width:30px;"><button class="fa fa-refresh refresh btn btn-primary" type="button" ></button></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr name="tabkpi1" id="tabkpi1">
                                                        <td class="text-left" rowspan="3" name="kpi1" id="kpi1" value="2"><b>Compliance to Rules and Regulations</b></td>
                                                    </tr>
                                                    <tr class="tabPM1">
                                                        <td class="text-left" name="pm" id="pm" value="1"># of company violations</td>
                                                        <td class="text-left"><input readonly type="number" class="form-control" style="width: 40%; display: inline-block" placeholder="0"> - <input type="number" min="0" max="99" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="weeklytarget" id="weeklytarget"></td>
                                                        <td class="text-left"><input readonly type="number" min="0" max="99" class="form-control" style="width: 40%; display: inline-block" placeholder="0" name="belowtargetstart" id="belowtargetstart"> - <input type="number" min="0" max="99" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="belowtargetend" id="belowtargetend"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="wellbelowtarget" id="wellbelowtarget"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left" style="width:25px;"><button class="fa fa-close remove1" type="button" ></button></td>
                                                    </tr>
                                                    <tr class="tabPM1">
                                                        <td class="text-left" name="pm" id="pm" value="2"># of client violations</td>
                                                        <td class="text-left"><input readonly type="number" class="form-control" style="width: 40%; display: inline-block" placeholder="0"> - <input type="number" min="0" max="99" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="weeklytarget" id="weeklytarget"></td>
                                                        <td class="text-left"><input readonly type="number" min="0" max="99" class="form-control" style="width: 40%; display: inline-block" placeholder="0" name="belowtargetstart" id="belowtargetstart"> - <input type="number" min="0" max="99" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="belowtargetend" id="belowtargetend"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="wellbelowtarget" id="wellbelowtarget"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left" style="width:25px;"><button class="fa fa-close remove1" type="button" ></button></td>
                                                    </tr>
                                                    <tr  name="tabkpi2" id="tabkpi2">
                                                        <td class="text-left" rowspan="4" name="kpi2" id="kpi2" value="3"><b>Guard Grooming and Appearance</b></td>
                                                    </tr>
                                                    <tr class="tabPM2">
                                                        <td class="text-left" name="pm" id="pm" value="3">Complete and Proper Uniform and Paraphernalia (% of completeness)</td>
                                                        <td class="text-left"><input readonly type="number" class="form-control" style="width: 40%; display: inline-block" placeholder="100"> - <input type="number" min="0" max="99" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="weeklytarget" id="weeklytarget"></td>
                                                        <td class="text-left"><input readonly type="number" min="0" max="99" class="form-control" style="width: 40%; display: inline-block" placeholder="0" name="belowtargetstart" id="belowtargetstart"> - <input type="number" min="0" max="99" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="belowtargetend" id="belowtargetend"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="wellbelowtarget" id="wellbelowtarget"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left" style="width:25px;"><button class="fa fa-close remove2" type="button" ></button></td>
                                                    </tr>
                                                    <tr class="tabPM2">
                                                        <td class="text-left" name="pm" id="pm" value="4">Proper Haircut (Frequency in %)</td>
                                                        <td class="text-left"><input readonly type="number" class="form-control" style="width: 40%; display: inline-block" placeholder="100"> - <input type="number" min="0" max="99" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="weeklytarget" id="weeklytarget"></td>
                                                        <td class="text-left"><input readonly type="number" min="0" max="99" class="form-control" style="width: 40%; display: inline-block" placeholder="0" name="belowtargetstart" id="belowtargetstart"> - <input type="number" min="0" max="99" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="belowtargetend" id="belowtargetend"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="wellbelowtarget" id="wellbelowtarget"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left" style="width:25px;"><button class="fa fa-close remove2" type="button" ></button></td>
                                                    </tr>
                                                    <tr class="tabPM2">
                                                        <td class="text-left" name="pm" id="pm" value="5">Proper Hygiene (Frequency in %)</td>
                                                        <td class="text-left"><input readonly type="number" class="form-control" style="width: 40%; display: inline-block" placeholder="100"> - <input type="number" min="0" max="99" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="weeklytarget" id="weeklytarget"></td>
                                                        <td class="text-left"><input readonly type="number" min="0" max="99" class="form-control" style="width: 40%; display: inline-block" placeholder="0" name="belowtargetstart" id="belowtargetstart"> - <input type="number" min="0" max="99" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="belowtargetend" id="belowtargetend"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="wellbelowtarget" id="wellbelowtarget"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left" style="width:25px;"><button class="fa fa-close remove2" type="button" ></button></td>
                                                    </tr>
                                                    <tr  name="tabkpi3" id="tabkpi3">
                                                        <td class="text-left" rowspan="3" name="kpi3" id="kpi3" value="2"><b>Attendance</b></td>
                                                    </tr>
                                                    <tr class="tabPM3">
                                                        <td class="text-left" name="pm" id="pm" value="6"># of Absences</td>
                                                        <td class="text-left"><input readonly type="number" class="form-control" style="width: 40%; display: inline-block" placeholder="0"> - <input type="number" min="0" max="99" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="weeklytarget" id="weeklytarget"></td>
                                                        <td class="text-left"><input readonly type="number" min="0" max="99" class="form-control" style="width: 40%; display: inline-block" placeholder="0" name="belowtargetstart" id="belowtargetstart"> - <input type="number" min="0" max="99" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="belowtargetend" id="belowtargetend"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="wellbelowtarget" id="wellbelowtarget"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left" style="width:25px;"><button class="fa fa-close remove3" type="button" ></button></td>
                                                    </tr>
                                                    <!--lol-->
                                                    <tr class="tabPM3">
                                                        <td class="text-left" name="pm" id="pm" value="7"># of tardiness</td>
                                                        <td class="text-left"><input readonly type="number" class="form-control" style="width: 40%; display: inline-block" placeholder="0"> - <input type="number" min="0" max="99" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="weeklytarget" id="weeklytarget"></td>
                                                        <td class="text-left"><input readonly type="number" min="0" max="99" class="form-control" style="width: 40%; display: inline-block" placeholder="0" name="belowtargetstart" id="belowtargetstart"> - <input type="number" min="0" max="99" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="belowtargetend" id="belowtargetend"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="wellbelowtarget" id="wellbelowtarget"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left" style="width:25px;"><button class="fa fa-close remove3" type="button" ></button></td>
                                                    </tr>
                                                    <tr name="tabkpi4" id="tabkpi4">
                                                        <td class="text-left" rowspan="2" name="kpi4" id="kpi4" value="1"><b>Documentation</b></td>
                                                    </tr>
                                                    <tr class="tabPM4">
                                                        <td class="text-left" name="pm" id="pm" value="8">Completeness of Routine Logs (In percentage)</td>
                                                        <td class="text-left"><input readonly type="number" class="form-control" style="width: 40%; display: inline-block" placeholder="100"> - <input type="number" min="0" max="100" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="weeklytarget" id="weeklytarget"></td>
                                                        <td class="text-left"><input readonly type="number" min="0" max="99" class="form-control" style="width: 40%; display: inline-block" placeholder="0" name="belowtargetstart" id="belowtargetstart"> - <input type="number" min="0" max="99" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="belowtargetend" id="belowtargetend"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="wellbelowtarget" id="wellbelowtarget"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left" style="width:25px;"><button class="fa fa-close remove4" type="button" ></button></td>
                                                    </tr>
                                                    <tr  name="tabkpi5" id="tabkpi5">
                                                        <td class="text-left" rowspan="3" name="kpi5" id="kpi5" value="2"><b>Customer Relationship</b></td>
                                                    </tr>
                                                    <tr class="tabPM5">
                                                        <td class="text-left" name="pm" id="pm" value="9">Courteousness </td>
                                                        <td class="text-left"><input readonly type="number" class="form-control" style="width: 40%; display: inline-block" placeholder="100"> - <input type="number" min="0" max="99" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="weeklytarget" id="weeklytarget"></td>
                                                        <td class="text-left"><input readonly type="number" min="0" max="99" class="form-control" style="width: 40%; display: inline-block" placeholder="0" name="belowtargetstart" id="belowtargetstart"> - <input type="number" min="0" max="99" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="belowtargetend" id="belowtargetend"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="wellbelowtarget" id="wellbelowtarget"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left" style="width:25px;"><button class="fa fa-close remove5" type="button" ></button></td>
                                                    </tr>
                                                    <tr class="tabPM5">
                                                        <td class="text-left" name="pm" id="pm" value="10">Answerers Queries (Frequency in %)</td>
                                                        <td class="text-left"><input readonly type="number" class="form-control" style="width: 40%; display: inline-block" placeholder="100"> - <input type="number" min="0" max="99" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="weeklytarget" id="weeklytarget"></td>
                                                        <td class="text-left"><input readonly type="number" min="0" max="99" class="form-control" style="width: 40%; display: inline-block" placeholder="0" name="belowtargetstart" id="belowtargetstart"> - <input type="number" min="0" max="99" class="form-control" style="width: 49%; display: inline-block"  placeholder="Target" name="belowtargetend" id="belowtargetend"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="wellbelowtarget" id="wellbelowtarget"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left" style="width:25px;"><button class="fa fa-close remove5" type="button" ></button></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>


                            <table class="table" id="tblMain" name="tblMain">
                                <tbody> 

                                </tbody>
                            </table>


                            <div class="footer">
                                <span style="float:right;">
                                    <button type="button" class="btn btn-primary" id="addKPIcriteria" name="addKPIcriteria" style="float:right;">Add Custom KPI</button>
                                    <br><br>
                                    <button type="submit" style="float:right;" method="post" class="btn btn-primary" id="kpipost" name="kpipost">Create KPI</button>
                                </span>
                            </div>

                        </div>

                    </fieldset>
                </form>




                <!-- /.control-sidebar -->
                <!-- Add the sidebar's background. This div must be placed
                     immediately after the control sidebar -->
                <div class="control-sidebar-bg"></div>
            </div>
            <!-- ./wrapper -->

            <script type="text/javascript">
                var belowtarget1 = document.getElementById("belowtargetstart");

                $("#weeklytarget1").change(function () {
                    belowtarget1.value = parseInt(this.value, 10) + 1;
                });
                $("#weeklytarget1").keyup(function () {
                    belowtarget1.value = parseInt(this.value, 10) + 1;
                });


                $(document).ready(function () {

                    $("#addKPIcriteria").click(function () {
                        $("#tblMain tbody:first").append(
                                '<tr class="tabRow">' +
                                '<td>' +
                                '<button class="fa fa-close removekpi" type="button" ></button>' +
                                '<input class ="col-xs-4 form-control" type="text" name="kpiname" id="kpiname" value="Insert Performance Indicator" style="width: 50%">' +
                                '<table class="table" id="tblGrid" CELLPADDING="3" CELLSPACING="3">' +
                                '<thead>' +
                                '<tr class="head">' +
                                '<th class="text-left">Performance Measure</th>' +
                                '<th class="text-left" style="border-bottom: 1px solid green;" >Weekly Target</th>' +
                                '<th class="text-left" style="border-bottom: 1px solid gold;" >Below Target</th> ' +
                                '<th class="text-left" style="border-bottom: 1px solid red;" >Well Below Target</th> ' +
                                '<th class="text-left">Specify Weight</th>' +
                                '<th><button class="fa fa-plus btn btn-success" id="addPM" type="button"></button><input type="hidden" name="pmcount" id="pmcount" value="1"></th>' +
                                '</tr>' +
                                '</thead>' +
                                '<tbody class="custombody">' +
                                '<tr class="tabRow1">' +
                                '<td class="text-left"><input name="name" id="name" class="form-control" placeholder="Insert Performance Measure"></td>' +
                                '<td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Target Score" name="customtarget" id="customtarget"></td>' +
                                '<td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="custombelowtarget" id="custombelowtarget"></td>' +
                                '<td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="customwellbelowtarget" id="customwellbelowtarget"></td>' +
                                '<td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="customweight" id="customweight"></td>' +
                                '<td><button class="fa fa-close removepm" type="button" ></button></td>' +
                                '</tr>' +
                                '<tr class="tabOption">' +
                                '<td class="text-left" name="pm" id="pm">Linear Scale Question from 1 - 5</td>' +
                                '</tr>' +
                                '<tr class="tabOption">' +
                                '<td class="text-left" name="pm" id="pm">(5 being the highest and 1 being the lowest)</td>' +
                                '</tr>' +
                                '<tr class="tabOption">' +
                                '<td class="text-center"><input type="radio" class="iradio_minimal-grey" name="iCheck">1<input class="form-control" type="number" min="0" max="100" name="score" id="score" placeholder="Score" style="width: 93%; float: right;"></td>' +
                                '</tr>' +
                                '<tr class="tabOption">' +
                                '<td class="text-center"><input type="radio" class="iradio_minimal-grey" name="iCheck">2<input class="form-control" type="number" min="0" max="100" name="score" id="score" placeholder="Score" style="width: 93%; float: right;"></td>' +
                                '</tr>' +
                                '<tr class="tabOption">' +
                                '<td class="text-center"><input type="radio" class="iradio_minimal-grey" name="iCheck">3<input class="form-control" type="number" min="0" max="100" name="score" id="score" placeholder="Score" style="width: 93%; float: right;"></td>' +
                                '</tr>' +
                                '<tr class="tabOption">' +
                                '<td class="text-center"><input type="radio" class="iradio_minimal-grey" name="iCheck">4<input class="form-control" type="number" min="0" max="100" name="score" id="score" placeholder="Score" style="width: 93%; float: right;"></td>' +
                                '</tr>' +
                                '<tr class="tabOption">' +
                                '<td class="text-center"><input type="radio" class="iradio_minimal-grey" name="iCheck">5<input class="form-control" type="number" min="0" max="100" name="score" id="score" placeholder="Score" style="width: 93%; float: right;"></td>' +
                                '</tr>' +
                                '</tbody>' +
                                '</table>' +
                                '</td>' +
                                '</tr>'
                                );
                    });

                    $(document).on("click", "button.addOption", function () {
                        $(this).parents(".tabTarget").before(
                                $("tr.tabOption:first").clone(true)
                                );
                        $(".tabOption:last").children("td").children("input").each(function (index, element) {
                            $(element).val("");
                        });
                    }
                    );

                    $(document).on("click", "button.removeoption", function () {
                        if ($(this).parents("tr").siblings("tr.tabOption").length > 0) {
                            $(this).closest("tr.tabOption").remove();
                        }
                        else {
                            alert("You cannot remove this.");
                        }
                    });

                    $(document).on("click", "button.remove1", function () {
                        if ($(this).parents("tr").siblings("tr.tabPM1").length > 0) {
                            $(this).closest("tr.tabPM1").remove();
                            var kpi = $("#kpi1").attr("rowspan");
                            $("#kpi1").attr("rowspan", kpi - 1);
                            var kpival = $("#kpi1").attr("value");
                            $("#kpi1").attr("value", kpival - 1);
                        }
                        else {
                            $(this).closest("tr.tabPM1").remove();
                            $("#tabkpi1").remove();
                        }
                    });

                    $(document).on("click", "button.remove2", function () {
                        if ($(this).parents("tr").siblings("tr.tabPM2").length > 0) {
                            $(this).closest("tr.tabPM2").remove();
                            var kpi = $("#kpi2").attr("rowspan");
                            $("#kpi2").attr("rowspan", kpi - 1);
                            var kpival = $("#kpi2").attr("value");
                            $("#kpi2").attr("value", kpival - 1);
                        }
                        else {
                            $(this).closest("tr.tabPM2").remove();
                            $("#tabkpi2").remove();
                        }
                    });

                    $(document).on("click", "button.remove3", function () {
                        if ($(this).parents("tr").siblings("tr.tabPM3").length > 0) {
                            $(this).closest("tr.tabPM3").remove();
                            var kpi = $("#kpi3").attr("rowspan");
                            $("#kpi3").attr("rowspan", kpi - 1);
                            var kpival = $("#kpi3").attr("value");
                            $("#kpi3").attr("value", kpival - 1);
                        }
                        else {
                            $(this).closest("tr.tabPM3").remove();
                            $("#tabkpi3").remove();
                        }
                    });

                    $(document).on("click", "button.remove4", function () {
                        if ($(this).parents("tr").siblings("tr.tabPM4").length > 0) {
                            $(this).closest("tr.tabPM4").remove();
                            var kpi = $("#kpi4").attr("rowspan");
                            $("#kpi4").attr("rowspan", kpi - 1);
                            var kpival = $("#kpi4").attr("value");
                            $("#kpi4").attr("value", kpival - 1);
                        }
                        else {
                            $(this).closest("tr.tabPM4").remove();
                            $("#tabkpi4").remove();
                        }
                    });

                    $(document).on("click", "button.remove5", function () {
                        if ($(this).parents("tr").siblings("tr.tabPM5").length > 0) {
                            $(this).closest("tr.tabPM5").remove();
                            var kpi = $("#kpi5").attr("rowspan");
                            $("#kpi5").attr("rowspan", kpi - 1);
                            var kpival = $("#kpi5").attr("value");
                            $("#kpi5").attr("value", kpival - 1);
                        }
                        else {
                            $(this).closest("tr.tabPM5").remove();
                            $("#tabkpi5").remove();
                        }
                    });
                    
                    $(document).on("click", "button.removepm", function () {
                        $(".lol").remove();
                    });

                    $(document).on("click", "#addPM", function () {
                        var pmval = parseInt($(this).siblings().attr("value"));
                        $(this).siblings().attr("value", pmval + 1);
                        $(this).parents("thead").next("tbody").append(
                                '<tr class="tabRow1">' +
                                '<td class="text-left"><input name="name" id="name" class="form-control" placeholder="Insert Performance Measure"></td>' +
                                '<td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Target Score" name="belowtargetend" id="belowtargetend"></td>' +
                                '<td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="wellbelowtarget" id="wellbelowtarget"></td>' +
                                '<td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>' +
                                '<td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>' +
                                '<td><button class="fa fa-close remove" type="button" ></button></td>' +
                                '</tr>' +
                                '<tr class="tabOption">' +
                                '<td class="text-center"><input type="radio" class="iradio_minimal-grey" name="iCheck"><input class="form-control" type="number" min="0" max="100" name="score" id="score" placeholder="Option" style="width: 93%; float: right;"></td>' +
                                '<td class="text-center"><input class="form-control" type="number" min="0" max="100" name="score" id="score" placeholder="Option score" style="width: 93%; float: right;"></td>' +
                                '</tr>' +
                                '<tr class="tabOption">' +
                                '<td class="text-center"><input type="radio" class="iradio_minimal-grey" name="iCheck"><input class="form-control" type="number" min="0" max="100" name="score" id="score" placeholder="Option" style="width: 93%; float: right;"></td>' +
                                '<td class="text-center"><input class="form-control" type="number" min="0" max="100" name="score" id="score" placeholder="Option score" style="width: 93%; float: right;"></td>' +
                                '</tr>' +
                                '<tr class="tabOption">' +
                                '<td class="text-center"><input type="radio" class="iradio_minimal-grey" name="iCheck"><input class="form-control" type="number" min="0" max="100" name="score" id="score" placeholder="Option" style="width: 93%; float: right;"></td>' +
                                '<td class="text-center"><input class="form-control" type="number" min="0" max="100" name="score" id="score" placeholder="Option score" style="width: 93%; float: right;"></td>' +
                                '</tr>' +
                                '<tr class="tabOption">' +
                                '<td class="text-center"><input type="radio" class="iradio_minimal-grey" name="iCheck"><input class="form-control" type="number" min="0" max="100" name="score" id="score" placeholder="Option" style="width: 93%; float: right;"></td>' +
                                '<td class="text-center"><input class="form-control" type="number" min="0" max="100" name="score" id="score" placeholder="Option score" style="width: 93%; float: right;"></td>' +
                                '</tr>' +
                                '<tr class="tabOption">' +
                                '<td class="text-center"><input type="radio" class="iradio_minimal-grey" name="iCheck"><input class="form-control" type="number" min="0" max="100" name="score" id="score" placeholder="Option" style="width: 93%; float: right;"></td>' +
                                '<td class="text-center"><input class="form-control" type="number" min="0" max="100" name="score" id="score" placeholder="Option score" style="width: 93%; float: right;"></td>' +
                                '</tr>'
                                );
                    }
                    );
                });


            </script> 

            <!-- jQuery 2.2.3 -->
            <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
            <!-- Bootstrap 3.3.6 -->
            <script src="bootstrap/js/bootstrap.min.js"></script>
            <!-- SlimScroll -->
            <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
            <!-- FastClick -->
            <script src="plugins/fastclick/fastclick.js"></script>
            <!-- AdminLTE App -->
            <script src="dist/js/app.min.js"></script>
            <!-- AdminLTE for demo purposes -->
            <script src="dist/js/demo.js"></script>
    </body>
</html>
