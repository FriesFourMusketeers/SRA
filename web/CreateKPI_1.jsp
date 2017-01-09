<%-- 
    Document   : blankpage
    Created on : Aug 24, 2016, 5:56:01 AM
    Author     : Eugene
--%>

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
                                <h3 class="box-title"><strong><u>Create KPI</u></strong></h3>
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

                                <div class="col-xs-3">
                                    <label>Question Type</label>
                                    <select class="form-control select2" style="width: 100%;" name="assessmentformTypeOG" id="assessmentformTypeOG">
                                        <option>Default</option>
                                        <option>Default + custom</option>
                                        <option>Custom</option>
                                    </select>
                                </div>



                            </div>

                            <table class="table" id="tblDefault">
                                <tbody id="tbody1" name="tbody1">
                                    <tr class="tabRow">
                                        <td>
                                            <h4 class="box-title"><strong>Compliance to Rules and Regulations</strong></h4>

                                            <table class="table" id="tblGrid" CELLPADDING="3" CELLSPACING="3">
                                                <thead>
                                                    <tr>
                                                        <th class="text-left">Performance Measure</th>
                                                        <th class="text-left">Specify Weight</th>
                                                        <th><button class="fa fa-plus btn btn-success" id="addPM" type="button"></button></th>   
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="tabRow1">
                                                        <td class="text-left"><input name="defaultname" id="defaultname" class="form-control" placeholder="Insert Performance Measure"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td><button class="fa fa-close remove" type="button" ></button></td>
                                                    </tr>
                                                    <tr class="tabRow1">
                                                        <td class="text-left"><input class="form-control" name="defaultname" id="defaultname" readonly="readonly" placeholder="Company violations"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control weight" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td><button class="fa fa-close remove" type="button" ></button></td>
                                                    </tr>
                                                    <tr class="tabRow1">
                                                        <td class="text-left"><input class="form-control" name="defaultname" id="defaultname" readonly="readonly" placeholder="Client violations"></td>

                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control weight" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td><button class="fa fa-close remove" type="button" ></button></td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr class="tabRow">
                                        <td>
                                            <h4 class="box-title"><strong>Guard Grooming and Appearance</strong></h4>
                                            <table class="table" id="tblGrid" CELLPADDING="3" CELLSPACING="3">
                                                <thead>
                                                    <tr>
                                                        <th class="text-left">Performance Measure</th>
                                                        <th class="text-left">Specify Weight</th>
                                                        <th><button class="fa fa-plus btn btn-success" id="addPM" type="button"></button></th>   
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="tabRow1">
                                                        <td class="text-left"><input class="form-control" name="defaultname" id="defaultname" readonly="readonly" placeholder="Complete and Proper Uniform and Paraphenalias"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control weight" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td><button class="fa fa-close remove" type="button" ></button></td>
                                                    </tr>
                                                    <tr class="tabRow1">
                                                        <td class="text-left"><input class="form-control" name="defaultname" id="defaultname" readonly="readonly" placeholder="Proper Haircut"></td>

                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control weight" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td><button class="fa fa-close remove" type="button" ></button></td>
                                                    </tr>
                                                    <tr class="tabRow1">
                                                        <td class="text-left"><input class="form-control" name="defaultname" id="defaultname" readonly="readonly" placeholder="Proper Hygiene"></td>

                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control weight" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td><button class="fa fa-close remove" type="button" ></button></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr class="tabRow">
                                        <td>
                                            <h4 class="box-title"><strong>Attendance</strong></h4>
                                            <table class="table" id="tblGrid" CELLPADDING="3" CELLSPACING="3">
                                                <thead>
                                                    <tr>
                                                        <th class="text-left">Performance Measure</th>
                                                        <th class="text-left">Specify Weight</th>
                                                        <th><button class="fa fa-plus btn btn-success" id="addPM" type="button"></button></th>   
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="tabRow1">
                                                        <td class="text-left"><input class="form-control" name="defaultname" id="defaultname" readonly="readonly" placeholder="Complete Attendance"></td>


                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control weight" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td><button class="fa fa-close remove" type="button" ></button></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr class="tabRow">
                                        <td>
                                            <h4 class="box-title"><strong>Documentation</strong></h4>
                                            <table class="table" id="tblGrid" CELLPADDING="3" CELLSPACING="3">

                                                <thead>
                                                    <tr>
                                                        <th class="text-left">Performance Measure</th>
                                                        <th class="text-left">Specify Weight</th>
                                                        <th><button class="fa fa-plus btn btn-success" id="addPM" type="button"></button></th>   
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="tabRow1">
                                                        <td class="text-left"><input class="form-control" name="defaultname" id="defaultname" readonly="readonly" placeholder="Company violations"></td>


                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control weight" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td><button class="fa fa-close remove" type="button" ></button></td>
                                                    </tr>
                                                    <tr class="tabRow1">
                                                        <td class="text-left"><input class="form-control" name="defaultname" id="defaultname" readonly="readonly" placeholder="Client violations"></td>

                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control weight" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td><button class="fa fa-close remove" type="button" ></button></td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr class="tabRow">
                                        <td>
                                            <h4 class="box-title"><strong>Customer Relationship</strong></h4>
                                            <table class="table" id="tblGrid" CELLPADDING="3" CELLSPACING="3">
                                                <thead>
                                                    <tr>
                                                        <th class="text-left">Performance Measure</th>
                                                        <th class="text-left">Specify Weight</th>
                                                        <th><button class="fa fa-plus btn btn-success" id="addPM" type="button"></button></th>                                                        
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="tabRow1">
                                                        <td class="text-left"><input class="form-control" name="defaultname" id="defaultname" readonly="readonly" placeholder="Courteous"></td>

                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control weight" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td><button class="fa fa-close remove" type="button" ></button></td>
                                                    </tr>
                                                    <tr class="tabRow1">
                                                        <td class="text-left"><input class="form-control" name="defaultname" id="defaultname" readonly="readonly" placeholder="Answer Queries"></td>

                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control weight" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                        <td><button class="fa fa-close remove" type="button" ></button></td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="table" id="tblMain" name="tblMain">
                                <tbody>
                                    <tr class="tabRow">
                                        <td>
                                            <button class="fa fa-close removekpi" type="button" ></button>
                                            <input class ="col-xs-4"type="text" name="kpiname" class="form-control" id="kpikpiname" value="Insert Performance Indicator">
                                            <table class="table" id="tblGrid" CELLPADDING="3" CELLSPACING="3">
                                                <thead>
                                                    <tr>
                                                        <th class="text-left">Performance Measure</th>
                                                        <th class="text-left">Specify Weight</th>
                                                        <th><button class="fa fa-plus btn btn-success" id="addPM" type="button"></button></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="tabRow1">
                                                        <td class="text-left"><input name="name" id="name" class="form-control" placeholder="Insert Performance Measure"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="weight" id="weight"></td>
                                                        <td><button class="fa fa-close remove" type="button" ></button></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>


                            <div class="footer">
                                <span style="float:right;">
                                    <button type="button" class="btn btn-primary" id="addKPIcriteria" name="addKPIcriteria" style="float:right;">Add KPI</button>
                                    <br><br>
                                    <button type="submit" method="post" class="btn btn-primary" id="kpipost" name="kpipost">Create KPI</button>
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
                var kpidropdown = $("#assessmentformTypeOG");
                var clone = $("#tbody1").clone();
                $("#defaultname").prop('disabled', true);
                $("#defaultweight").prop('disabled', true);


                $(document).ready(function () {


                    $(document).on("click", "#addPM", function () {
                        $("#defaultname").prop('disabled', false);
                        $("#defaultweight").prop('disabled', false);
                        $("tr.tabRow1:first").clone(true).appendTo($(this).parents("thead").next("tbody"));
                        $(".tabRow1:last").children("td").children("input").each(function (index, element) {
                            $(element).val("");
                        });
                        $("#defaultname").prop('disabled', true);
                        $("#defaultweight").prop('disabled', true);
                    }
                    );
                    $(document).on("click", "button.remove", function () {
                        if ($(this).parents("tr").siblings("tr.tabRow1").length > 0) {
                            $(this).closest("tr.tabRow1").remove();
                        }
                        else {
                            alert("You cannot remove this measure. Please remove the KPI instead");
                        }
                    });

                    kpidropdown.change(function () {
                        var dropdown = $('#assessmentformTypeOG option:selected').val();
                        console.log(dropdown);
                        if (dropdown === "Default") {
                            $("#tblDefault").show();
                            $("#tblMain").hide();
                        }
                        if (dropdown === "Default + custom") {
//                            if ($('#tblDefault').is(":visible")) {
//                                $("#tblMain").show();
//                            }
//                            if($('#tblMain').is(":visible")) {
//                                $("#tblDefault").show();
//                            }
                            $("#tblMain").show();
                            $("#tblDefault").show();

                        }
                        if (dropdown === "Custom") {
                            $("#tblDefault").hide();
                            $("#tblMain").show();
                        }
                    }
                    );

                    $("#addKPIcriteria").click(function () {
                        $("#tblDefault tbody:first").append(
                                '<tr class="tabRow">' +
                                '<td>' +
                                '<button class="fa fa-close removekpi" type="button" ></button>' +
                                '<input class ="col-xs-4"type="text" name="kpiname" class="form-control" id="kpikpiname" value="Insert Performance Indicator">' +
                                '<table class="table" id="tblGrid" CELLPADDING="3" CELLSPACING="3">' +
                                '<thead>' +
                                '<tr>' +
                                '<th class="text-left">Performance Measure</th>' +
                                '<th class="text-left">Specify Weight</th>' +
                                '<th><button class="fa fa-plus btn btn-success" id="addPM" type="button"></button></th>' +
                                '</tr>' +
                                '</thead>' +
                                '<tbody>' +
                                '<tr class="tabRow"1>' +
                                '<td class="text-left"><input name="name" id="name" class="form-control" placeholder="Insert Performance Measure"></td>' +
                                '<td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>' +
                                '<td><button class="fa fa-close remove" type="button" ></button></td>' +
                                '</tr>' +
                                '</tbody>' +
                                '</table>' +
                                '</td>' +
                                '</tr>'
                                );
                    });
                });</script> 

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
