<%-- 
    Document   : blankpage
    Created on : Aug 24, 2016, 5:56:01 AM
    Author     : Eugene
--%>

<%@page import="dao.KpiDAO"%>
<%@page import="entity.KPI"%>
<%@page import="entity.Client"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ClientDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Assessment Form</title>
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
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

        <script src="plugins/jQuery/jquery.min.js"></script>

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
                <a href="../../index2.html" class="logo">
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
                                                        <img src="../../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
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
                                    <img src="../../dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                                    <span class="hidden-xs">Alexander Pierce</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="../../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

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
                <form class="form-horizontal box-body" action="addPRT" method="post">
                    <div class="box-header with-border">
                        <div class="col-xs-12">
                            <div class="col-xs-3">

                                <label>Client</label>
                                <select class="form-control select2" style="width: 100%;" name="clientName" id="clientName">
                                </select>
                            </div>
                            <div class="col-xs-3">
                                <label>Question Type</label>
                                <select class="form-control select2" style="width: 100%;" name="assessmentformTypeOG" id="assessmentformQuestionTypeOG">
                                    <option>Default + custom</option>
                                    <option>Custom</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <fieldset>

                        <!-- Form Name -->

                        <!-- Select Basic -->


                        <table class="table" id="tblGrid">
                            <td>
                                <table class="table" id="tblGrid2" CELLPADDING="3" CELLSPACING="3">
                                    <thead id="tblHead">
                                        <tr>
                                            <th class="text-left">Question</th>
                                            <th class="text-left">Select Question Type</th>
                                            <th class="text-left">Select KPI</th>
                                            <th class="text-left">Select Performance Measure</th>
                                            <th><button class="fa fa-plus btn btn-success" id="addPM" type="button"></button></th>
                                        </tr>
                                    </thead>
                                    <tbody>                                  
                                        <tr class="tabRow">
                                            <td class="text-left"><input name="question" id="question" placeholder="insert question here"></td>
                                            <td>
                                                <select class="form-control select2" style="width: 100%;" name="assessmentformQuestionType" id="assessmentformQuestionType1">
                                                    <option>RadioButton</option>
                                                    <option>Checkbox</option>
                                                    <option>Dropdown</option>
                                                </select>
                                            </td>
                                            <td>
                                                <select class="form-control select2 assessmentformSelectKPI" style="width: 100%;" name="assessmentformSelectKPI" id="assessmentformSelectKPI">
                                                    <option><----- Select A Client first -----></option>
                                                </select>
                                            </td>
                                            <td class="PM" >
                                                <select class="form-control select2 assessmentformSelectPM" style="width: 100%;" name="assessmentformSelectPM" id="assessmentformSelectPM">
                                                    <option><----- Select A KPI first -----></option>
                                                </select>
                                            </td>
                                            <td><button class="fa fa-close remove" type="button" ></button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>



                        </table>



                        <div class="modal-footer pull-right-container" >
                            <span style="float:right;">
                                <button type="submit" class="btn btn-primary" id="EvalSubmitBtn" method="post">Submit</button>
                            </span>
                        </div>



                    </fieldset>
                </form>

                <script type="text/javascript">

                    $(document).ready(function () {

                        $(document).on("click", "#addPM", function () {
                            $("tr.tabRow:first").clone(true).appendTo($(this).parents("thead").next("tbody"));
                            $(".tabRow:last").children("td").children("input").each(function (index, element) {
                                $(element).val("");
                            });
                            var pm = $(".tabRow:last").children('td').children('.assessmentformSelectPM');
                            pm.find("option").remove();
                            var s = "<option disabled selected value> <----- Select A KPI first -----> </option>";
                            pm.append(s);
                        }
                        );
                        $(document).on("click", "button.remove", function () {
                            if ($(this).parents("tr").siblings("tr.tabRow").length > 0) {
                                $(this).closest("tr.tabRow").remove();
                            }
                            else {
                                alert("You cannot remove this.");
                            }
                        });
                    });
                </script> 

                <!-- /.control-sidebar -->
                <!-- Add the sidebar's background. This div must be placed
                     immediately after the control sidebar -->
                <div class="control-sidebar-bg"></div>
            </div>
            <!-- ./wrapper -->

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
            <script src="/SRA/js/searchClientKPI.js"></script>
    </body>
</html>
