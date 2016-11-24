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
        <title>Safeguard | Everyday Page</title>
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

                        <div class="box box-info">

                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#assigned" data-toggle="tab">My Employees</a></li>
                                </ul>
                            </div>
                            <br />
                            <!-- Main content -->
                            <div class ="col-xs-4"></div>

                            <div class ="col-xs-4" align="center">
                                <div class="form-group">
                                    <label>Client:</label>
                                    <select class="form-control select2" id="clientName" name="clientName">
                                    </select>
                                </div>
                            </div>

                            <div class ="col-xs-4"></div>


                            <div class="tab-content">
                                <form role="form" action="addEveryday" method="post">

                                    <div id="assigned" class="tab-pane active">
                                        <div class="control-sidebar-bg"></div>
                                        <section class="content">
                                            <div class="row">
                                                <div class="col-xs-12">


                                                    <div class="box">
                                                        <div class="box-header">
                                                            <h3 class="box-title">Assigned Employees</h3>
                                                        </div>
                                                        <!-- /.box-header -->
                                                        <div class="box-body">
                                                            <table id="example1" name="example1" class="table table-bordered table-striped">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Name</th>
                                                                        <th>Attendance</th>
                                                                        <th>Grooming and Appearance</th>
                                                                        <th>Routine Log</th>
                                                                        <th>Courteousness</th>
                                                                        <th>Answers Customer Queries</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>

                                                                </tbody>
                                                                <tfoot>
                                                                    <tr>

                                                                        <th>Name</th>
                                                                        <th>Attendance</th>
                                                                        <th>Grooming and Appearance</th>
                                                                        <th>Routine Log</th>
                                                                        <th>Courteousness</th>
                                                                        <th>Answers Customer Queries</th>
                                                                    </tr>
                                                                </tfoot>
                                                            </table>
                                                            <button type="submit" class="btn btn-primary" style="float: right" method="post" id="submitEveryday">Submit</button>
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
                                </form>

                            </div>
                        </div>




                    </div> <!-- Additional -->
                </section> <!-- Additional -->
            </div>
            <!-- /.content-wrapper -->

        </div> <!-- Additional -->
        <!-- ./wrapper -->


        <!-- DataTables -->
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
        <script src="js/everydayClientEmployees.js"></script>

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
