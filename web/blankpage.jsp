<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
        <!-- jQuery 2.2.3 -->
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>

        <!-- Select2 -->
        <link rel="stylesheet" href="plugins/select2/select2.min.css">
    </head>

    <body class="hold-transition skin-blue sidebar-mini fixed">
        <form action ="logoutServlet" method="post">
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
                                                            <!-- <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image"> -->
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

                                <!--NOTIFICATIONS HIDDEN-->
                                <input type="hidden" id="yearImport" />

                                <a href="#" class="dropdown-toggle" id="dropdownClicked" data-toggle="dropdown">
                                    <i class="fa fa-bell-o"></i>
                                    <span class="label label-danger" id="value"></span></a>
                                <ul class="dropdown-menu notification_drop">
                                    <li class="header">Notifications</li>
                                    <li id="myDropdown">
                                        <!--CONTENT HERE-->
                                    </li>
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
                                        <!-- <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image"> -->
                                        <span class="hidden-xs" id="username" name="username"><%=session.getAttribute("username")%></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <!-- User image -->
                                        <li class="user-header">
                                            <!--  <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image"> -->

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
                                                <button type="submit" value="submit" class="btn btn-default btn-flat">Sign out</button>
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
                                <!-- <img src="../../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image"> -->
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
                                <a href="AllocationNew.jsp">
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





            </div>
        </form>


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
        <!-- Select2 -->
        <script src="plugins/select2/select2.full.min.js"></script>

        <script>
            $(document).ready(function () {
                var value = null;
                var recent = 0;
//                                        setInterval(ajaxCall, 1000); // sets how many milliseconds the notification updates
                ajaxCall();
                function ajaxCall() {
                    $.ajax({
                        url: "NotificationServlet",
                        type: 'POST',
                        dataType: "json",
                        success: function (data) {
                            value = data;
                            console.log(JSON.stringify(data));
                            if (typeof Storage !== "undefined") {
                                if (sessionStorage.data) {
                                    var recent = JSON.parse(sessionStorage.data);
                                    if (sessionStorage.data !== JSON.stringify(data)) {
                                        $("#value").html(Math.abs(data.length - recent.length));
                                    } else {
                                        //do nothing
                                    }
                                    sessionStorage.data = JSON.stringify(data);
                                } else {
                                    sessionStorage.data = JSON.stringify(data);
                                    $("#value").html(data.length);
                                }
                            }
                            $("#myDropdown").empty();
                            if (data.length === 0) {
                                $("#value").empty();
                                $("#value").append("");
                                $("#myDropdown").append('\
                                                      <li class="padding2" style="text-align:center;">No Notifications</li>');
                            }

                            for (var i = 0; i < data.length; i++) {
                                $("#myDropdown").append('<hr/>');
                                $("#myDropdown").append('<li class="padding2"><a class="approved" style="text-decoration:none;">'
                                        + '</a><br/><h6 class="p"> ' + data[i].message + '<br/>' + data[i].date + '</h6></li>');
                            }



                        }, error: function (XMLHttpRequest, textStatus, exception) {
                            console.log(XMLHttpRequest.responseText);
                        }
                    });
                }
                $('body').on('click', 'a.approved', function () {
                    var formName = $(this).text();
                    if (formName === "Enrollment in Public School") {
                        window.location.replace("Servletname?redirect=reportsLibrary");
                    } else if (formName === "Enrollment in Private School") {
                        window.location.replace("ServletAccess?redirect=reportsLibrary");
                    }
                });
            });
        </script>
    </body>
</html>
