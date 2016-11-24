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
                                                        <th class="text-left" >Performance Indicator</th>
                                                        <th class="text-left" >Performance Measure</th>                                                        
                                                        <th class="text-left" style="border-bottom: 1px solid red;" >Well Below Target</th> 
                                                        <th class="text-left" style="border-bottom: 1px solid gold;" >Below Target</th> 
                                                        <th class="text-left" style="border-bottom: 1px solid green;" >Weekly Target</th> 
                                                        <th class="text-left" >Specify Weight</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="text-left" rowspan="3"><b>Compliance to Rules and Regulations</b></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left"># of company violations</td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left"># of client violations</td>                                           
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left" rowspan="4"><b>Guard Grooming and Appearance</b></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left">Complete and Proper Uniform and Paraphernalia (% of completeness)</td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left">Proper Haircut (Frequency in %)</td>                                           
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left">Proper Hygiene (Frequency in %)</td>                                           
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left" rowspan="3"><b>Attendance</b></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left"># of Absences</td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left"># of tardiness</td>                                           
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left" rowspan="2"><b>Documentation</b></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left">Completeness of Routine Logs (In percentage)</td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left" rowspan="3"><b>Customer Relationship</b></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left">Courteousness </td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-left">Answerers Queries (Frequency in %)</td>                                           
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter Target" name="defaultweight" id="defaultweight"></td>
                                                        <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="defaultweight" id="defaultweight"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="table" id="tblMain" name="tblMain">
                                <tbody>
                                    <tr class="tabRow1">
                                        <td>
                                            <button class="fa fa-close removekpi" type="button" ></button>
                                            <input class ="col-xs-4"type="text" name="kpiname" id="kpikpiname" value="Compliance to Rules and Regulations">
                                            <table class="table" id="tblGrid" CELLPADDING="3" CELLSPACING="3">
                                                <thead>
                                                    <tr>
                                                        <th class="text-left">Performance Measure</th>
                                                        <th class="text-left">Specify Target</th>
                                                        <th class="text-left">Specify Weight</th>
                                                        <th><button class="fa fa-plus btn btn-success" id="addPM" type="button"></button></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="tabRow">
                                                        <td class="text-left"><input name="name" id="name" placeholder="insert measure here"></td>
                                                        <td class="text-left"><select class="selection" name="operator" id="operator">
                                                                <option value="=">=</option>
                                                                <option value=">">></option>
                                                                <option value="<"><</option>
                                                            </select>
                                                            <input name="target" id="target" placeholder="Enter Target"></td>
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
                                    <button type="button" class="btn btn-primary" id="addKPIcriteria" style="float:right;">Add KPI</button>
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
                var kpidropdown = $('#assessmentformTypeOG');
                $("#tblDefault").show();
                $("#tblMain").hide();

                var clone = $("#tbody1").clone();


                $(document).ready(function () {

                    $(document).on("click", ".revert", function () {
                        $("#tbody1").remove();
                        $("#tblDefault").append(clone);
                    }
                    );

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

                    $(document).on("click", "#kpipost", function () {
                        $('#tblGrid tbody').each(function () {
                            $(".count").append(
                                    '<input type="hidden" name="measurecount" id="measurecount" value="' + $(this).find('tr').length + '">'
                                    );
                        });
                    }
                    );

                    $(document).on("click", "#addPM", function () {
                        $("tr.tabRow:first").clone(true).appendTo($(this).parents("thead").next("tbody"));
                        $(".tabRow:last").children("td").children("input").each(function (index, element) {
                            $(element).val("");
                        });
                    }
                    );
                    $(document).on("click", "button.remove", function () {
                        if ($(this).parents("tr").siblings("tr.tabRow").length > 0) {
                            $(this).closest("tr.tabRow").remove();
                        }
                        else {
                            alert("You cannot remove this measure. Please remove the KPI instead");
                        }
                    });

                    $(document).on("click", "button.remove1", function () {
                        if ($(this).parents("tr").siblings("tr").length > 0) {
                            $(this).closest("tr").remove();
                        }
                        else {
                            alert("You cannot remove this measure. Please remove the KPI instead");
                        }
                    });

                    $(document).on("click", "button.removekpi", function () {
                        if ($(this).parents("tr").siblings("tr.tabRow1").length > 0) {
                            $(this).closest("tr.tabRow1").remove();
                        }
                        else {
                            alert("You cannot remove this KPI");
                        }
                    });

                    $("#addKPIcriteria").click(function () {
                        $("#tblMain tbody:first").append(
                                '<tr class="tabRow1">' +
                                '<td>' +
                                '<button class="fa fa-close removekpi" type="button" ></button>' +
                                '<input class ="col-xs-4"type="text" name="kpiname" id="kpiname" value="">' +
                                '<table class="table" id="tblGrid" CELLPADDING="3" CELLSPACING="3">' +
                                '<thead>' +
                                '<tr>' +
                                '<th class="text-left">Performance Measure</th>' +
                                '<th class="text-left">Specify Target</th>' +
                                '<th class="text-left">Specify Weight</th>' +
                                '<th><button class="fa fa-plus btn btn-success" id="addPM" type="button"></button></th>' +
                                '</tr>' +
                                '</thead>' +
                                '<tbody>' +
                                '<tr class="tabRow">' +
                                '<td class="text-left"><input name="name" id="name" placeholder="insert measure here"></td>' +
                                '<td class="text-left"><select class="selection" name="operator" id="operator">' +
                                '<option value="=">=</option>' +
                                '<option value=">">></option>' +
                                '<option value="<"><</option>' +
                                '</select><input name="target" id="target" placeholder="Enter Target"></td>' +
                                '<td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="measure" id="measure"></td>' +
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
