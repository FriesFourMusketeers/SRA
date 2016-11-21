<%-- 
    Document   : blankpage
    Created on : Aug 24, 2016, 5:56:01 AM
    Author     : Eugene
--%>

<%@page import="dao.EmployeeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file= "blankpage.jsp" %>
<html>
    <head>
        <title>Safeguard | Employee List</title>
        <!-- daterange picker -->
        <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
        <!-- DataTables -->
        <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">

    </head>
    <body>
        <!-- Site wrapper -->

        <div class="wrapper"> <!-- Additional -->
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">

                <section class="content"> <!-- Additional -->
                    <div class="row"> <!-- Additional -->
                        <!-- Content Header (Page header) -->

                        <% EmployeeDAO jobInfo = new EmployeeDAO();%>

                        <div class="box box-info">
                            <section class="content-header">
                                <h1>
                                    Employee list
                                </h1>
                            </section>
                            <br />
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#assigned" data-toggle="tab">Assigned Employees</a></li>
                                    <li><a href="#unassigned" data-toggle="tab">Unassigned Employees</a></li>
                                    <li><a href="#expireAmber" data-toggle="tab">Soon to Expire</a></li>
                                    <li><a href="#expireRed" data-toggle="tab">Expired</a></li>
                                    <li><a href="#onGoingRetraining" data-toggle="tab">Ongoing Retraining</a></li>
                                </ul>
                            </div>
                            <br />
                            <!-- Main content -->
                            <div class ="col-xs-4"></div>

                            <div class ="col-xs-4" align="center">
                                <div class="form-group">
                                    <label>Client:</label>
                                    <select class="form-control select2" name="clientName" id="clientName">

                                    </select>
                                </div>
                            </div>

                            <div class ="col-xs-4"></div>




                            <div class="tab-content">
                                <!-- PART 1 Assigned Employee START-->
                                <div id="assigned" class="tab-pane active">
                                    <section class="content">
                                        <div class="row">
                                            <div class="col-xs-12">


                                                <div class="box">
                                                    <div class="box-header">
                                                        <h3 class="box-title">Assigned Employees</h3>
                                                    </div>
                                                    <!-- /.box-header -->
                                                    <div class="box-body">
                                                        <table id="example1" class="table table-bordered table-striped">
                                                            <thead>
                                                                <tr>

                                                                    <th>Name</th>
                                                                    <th>Area</th>
                                                                    <th>Height</th>
                                                                    <th>Weight </th>
                                                                    <th>Body Build</th>
                                                                    <th>Skin Complexion</th>
                                                                    <th>Type of License</th>
                                                                    <th>Assigned to</th>
                                                                    <th>Position</th>
                                                                    <th>Grade</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>

                                                            </tbody>
                                                            <tfoot>
                                                                <tr>

                                                                    <th>Name</th>
                                                                    <th>Area</th>
                                                                    <th>Height</th>
                                                                    <th>Weight </th>
                                                                    <th>Body Build</th>
                                                                    <th>Skin Complexion</th>
                                                                    <th>Type of License</th>
                                                                    <th>Assigned to</th>
                                                                    <th>Position</th>
                                                                    <th>Grade</th>
                                                                </tr>
                                                            </tfoot>
                                                        </table>
                                                    </div>
                                                </div>
                                                <!-- /.box-body -->

                                                <!-- /.box -->
                                            </div>
                                            <!-- /.col -->
                                        </div>
                                        <!-- /.row -->
                                    </section>
                                </div>
                                <!-- PART 1 Assigned Employee END-->

                                <!-- PART 2 Unassigned Employee START-->
                                <div id="unassigned" class="tab-pane">
                                    <section class="content">
                                        <div class="row">
                                            <div class="col-xs-12">


                                                <div class="box">
                                                    <div class="box-header">
                                                        <h3 class="box-title">Unassigned Employees</h3>
                                                    </div>
                                                    <!-- /.box-header -->
                                                    <div class="box-body">
                                                        <table id="example1" class="table table-bordered table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>Name</th>
                                                                    <th>Area</th>
                                                                    <th>Height</th>
                                                                    <th>Weight </th>
                                                                    <th>Body Build</th>
                                                                    <th>Skin Complexion</th>
                                                                    <th>Type of License</th>
                                                                    <th>Assigned to</th>
                                                                    <th>Position</th>
                                                                    <th>Grade</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>Eugene See</td>
                                                                    <td>Manila
                                                                    </td>
                                                                    <td>180cm</td>
                                                                    <td>70kg</td>
                                                                    <td>Medium</td>
                                                                    <td>Fair</td>
                                                                    <td>Mall</td>
                                                                    <td>Alabang Town Center</td>
                                                                    <td>Mall Security</td>
                                                                    <td>Over 9000</td>
                                                                </tr>
                                                            </tbody>
                                                            <tfoot>
                                                                <tr>
                                                                    <th>Name</th>
                                                                    <th>Area</th>
                                                                    <th>Height</th>
                                                                    <th>Weight </th>
                                                                    <th>Body Build</th>
                                                                    <th>Skin Complexion</th>
                                                                    <th>Type of License</th>
                                                                    <th>Assigned to</th>
                                                                    <th>Position</th>
                                                                    <th>Grade</th>
                                                                </tr>
                                                            </tfoot>
                                                        </table>
                                                    </div>
                                                </div>
                                                <!-- /.box-body -->

                                                <!-- /.box -->
                                            </div>
                                            <!-- /.col -->
                                        </div>
                                        <!-- /.row -->
                                    </section>
                                </div>
                                <!-- PART 2 Unassigned Employee END-->

                                <!-- PART 3 Near Expiration License START-->
                                <div id="expireAmber" class="tab-pane">
                                    <section class="content">
                                        <div class="row">
                                            <div class="col-xs-12">


                                                <div class="box">
                                                    <div class="box-header">
                                                        <h3 class="box-title">Near Expiration License</h3>
                                                    </div>
                                                    <!-- /.box-header -->
                                                    <div class="box-body">
                                                        <table id="example1" class="table table-bordered table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>Name</th>
                                                                    <th>Area</th>
                                                                    <th>Height</th>
                                                                    <th>Weight </th>
                                                                    <th>Body Build</th>
                                                                    <th>Skin Complexion</th>
                                                                    <th>Type of License</th>
                                                                    <th>Assigned to</th>
                                                                    <th>Position</th>
                                                                    <th>Grade</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td><font color="#FFA500">John San Agustin</font></td>
                                                                    <td>Manila
                                                                    </td>
                                                                    <td>180cm</td>
                                                                    <td>70kg</td>
                                                                    <td>Medium</td>
                                                                    <td>Fair</td>
                                                                    <td>Mall</td>
                                                                    <td>Alabang Town Center</td>
                                                                    <td>Roving Guard</td>
                                                                    <td>Over 9000</td>
                                                                </tr>
                                                            </tbody>
                                                            <tfoot>
                                                                <tr>
                                                                    <th>Name</th>
                                                                    <th>Area</th>
                                                                    <th>Height</th>
                                                                    <th>Weight </th>
                                                                    <th>Body Build</th>
                                                                    <th>Skin Complexion</th>
                                                                    <th>Type of License</th>
                                                                    <th>Assigned to</th>
                                                                    <th>Position</th>
                                                                    <th>Grade</th>
                                                                </tr>
                                                            </tfoot>
                                                        </table>
                                                    </div>
                                                </div>
                                                <!-- /.box-body -->

                                                <!-- /.box -->
                                            </div>
                                            <!-- /.col -->
                                        </div>
                                        <!-- /.row -->
                                    </section>
                                </div>
                                <!-- PART 3 Near Expiration License END-->

                                <!-- PART 4 Expired License START-->
                                <div id="expireRed" class="tab-pane ">
                                    <section class="content">
                                        <div class="row">
                                            <div class="col-xs-12">


                                                <div class="box">
                                                    <div class="box-header">
                                                        <h3 class="box-title">Expired License Employees</h3>
                                                    </div>
                                                    <!-- /.box-header -->
                                                    <div class="box-body">
                                                        <table id="example1" class="table table-bordered table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>Name</th>
                                                                    <th>Area</th>
                                                                    <th>Height</th>
                                                                    <th>Weight </th>
                                                                    <th>Body Build</th>
                                                                    <th>Skin Complexion</th>
                                                                    <th>Type of License</th>
                                                                    <th>Assigned to</th>
                                                                    <th>Position</th>
                                                                    <th>Grade</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td><font color="#ff0000">JM Gonzales</font></td>
                                                                    <td>Manila
                                                                    </td>
                                                                    <td>180cm</td>
                                                                    <td>70kg</td>
                                                                    <td>Medium</td>
                                                                    <td>Fair</td>
                                                                    <td>Mall</td>
                                                                    <td>BPI</td>
                                                                    <td>Roving Guard</td>
                                                                    <td>Over 9000</td>
                                                                </tr>
                                                            </tbody>
                                                            <tfoot>
                                                                <tr>
                                                                    <th>Name</th>
                                                                    <th>Area</th>
                                                                    <th>Height</th>
                                                                    <th>Weight </th>
                                                                    <th>Body Build</th>
                                                                    <th>Skin Complexion</th>
                                                                    <th>Type of License</th>
                                                                    <th>Assigned to</th>
                                                                    <th>Position</th>
                                                                    <th>Grade</th>
                                                                </tr>
                                                            </tfoot>
                                                        </table>
                                                    </div>
                                                </div>
                                                <!-- /.box-body -->

                                                <!-- /.box -->
                                            </div>
                                            <!-- /.col -->
                                        </div>
                                        <!-- /.row -->
                                    </section>
                                </div>
                                <!-- PART 4 Expired License END-->

                                <!-- PART 5 Ongoing Retraining START-->
                                <div id="ongoingRetraining" class="tab-pane">
                                    <!-- /.control-sidebar -->
                                    <!-- Add the sidebar's background. This div must be placed
                                         immediately after the control sidebar -->
                                    <div class="control-sidebar-bg"></div>
                                    <div class="box box-info">
                                        <!-- /.box-header -->
                                        <!-- form start -->
                                        <div class="box-body">



                                        </div>
                                        <!-- here-->
                                    </div>
                                </div>
                                <!-- PART 5 Ongoing Retraining END-->

                            </div>
                        </div>


                    </div> <!-- Additional -->
                </section> <!-- Additional -->
            </div>
        </div>
        <!-- /.content-wrapper -->

        <!-- ./wrapper -->


        <!-- DataTables -->
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
        <script src="js/employeeList.js"></script>
        <!-- page script -->
        <script>
            var table = $('#example1').DataTable();

            $(function () {
                $("#example1").DataTable();
                $("#example2").DataTable();
                $("#example3").DataTable();
            });

            $(function () {
                //Initialize Select2 Elements
                $(".select2").select2();

            });
        </script>

    </body>
</html>
