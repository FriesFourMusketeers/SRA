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
        <title>Safeguard | Licenses</title>
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
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#allclient" data-toggle="tab">All Employees</a></li>
                                    <li><a href="#nearexpiry" data-toggle="tab">Near Expiration (1 Month)</a></li>
                                    <li><a href="#expired" data-toggle="tab">Expired</a></li>
                                </ul>
                            </div>
                            <br />
                            <!-- Main content -->
                            <div class="tab-content">
                                <div id="allclient" class="tab-pane active">
                                    <section class="content">
                                        <div class="row">
                                            <div class="col-xs-12">


                                                <div class="box">
                                                    <!-- /.box-header -->
                                                    <div class="box-body">
                                                        <table id="example1" class="table table-bordered table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>Employee Name</th>
                                                                    <th>Client Name</th>
                                                                    <th>License Start</th>
                                                                    <th>License End </th>
                                                                    <th>Days Remaining</th>
                                                                    <th>Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>

                                                                <% for (int i = 0; i < jobInfo.getAllEmployeeLicense().size(); i++) {%>

                                                                <tr>
                                                                    <td><a href="viewEmployeeProfile?id=<%=jobInfo.getAllEmployeeLicense().get(i).getEmployeeID()%>"><%=jobInfo.getAllEmployeeLicense().get(i).getFirstName() + " " + jobInfo.getAllEmployeeLicense().get(i).getLastName()%></a></td>
                                                                    <td><%=jobInfo.getAllEmployeeLicense().get(i).getAssignedTo()%></td>
                                                                    </td>
                                                                    <td>License Start</td>
                                                                    <td><%=jobInfo.getAllEmployeeLicense().get(i).getLicenseExpDate()%></td>
                                                                    <td><%=jobInfo.getAllEmployeeLicense().get(i).getNumberOfDays()%></td>
                                                                    <td><button type="submit" method="post" class="btn btn-primary" id="">Print</button></td>
                                                                </tr>
                                                                <%};%>
                                                            </tbody>
                                                            <tfoot>
                                                                <tr>
                                                                    <th>Employee Name</th>
                                                                    <th>Client Name</th>
                                                                    <th>License Start</th>
                                                                    <th>License End </th>
                                                                    <th>Days Remaining</th>
                                                                    <th>Action</th>
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


                                <div id="nearexpiry" class="tab-pane">
                                    <section class="content">
                                        <div class="row">
                                            <div class="col-xs-12">


                                                <div class="box">
                                                    <!-- /.box-header -->
                                                    <div class="box-body">
                                                        <table id="example2" class="table table-bordered table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>Employee Name</th>
                                                                    <th>Client Name</th>
                                                                    <th>License Start</th>
                                                                    <th>License End </th>
                                                                    <th>Days Remaining</th>
                                                                    <th>Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>

                                                                <% for (int i = 0; i < jobInfo.getNearExpirationEmployeeLicense().size(); i++) {%>

                                                                <tr>
                                                                    <td><a href="viewEmployeeProfile?id=<%=jobInfo.getNearExpirationEmployeeLicense().get(i).getEmployeeID()%>"><font color="#FFA500"><%=jobInfo.getNearExpirationEmployeeLicense().get(i).getFirstName() + " " + jobInfo.getNearExpirationEmployeeLicense().get(i).getLastName()%></font></a></td>
                                                                    <td><%=jobInfo.getNearExpirationEmployeeLicense().get(i).getAssignedTo()%>
                                                                    </td>
                                                                    <td>License Start</td>
                                                                    <td><%=jobInfo.getNearExpirationEmployeeLicense().get(i).getLicenseExpDate()%></td>
                                                                    <td><%=jobInfo.getNearExpirationEmployeeLicense().get(i).getNumberOfDays()%></td>
                                                                    <td><button type="submit" method="post" class="btn btn-primary" id="">Print   </button></td>
                                                                </tr>
                                                                <%};%>
                                                            </tbody>
                                                            <tfoot>
                                                                <tr>
                                                                    <th>Employee Name</th>
                                                                    <th>Client Name</th>
                                                                    <th>License Start</th>
                                                                    <th>License End </th>
                                                                    <th>Days Remaining</th>
                                                                    <th>Action</th>
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


                                <div id="expired" class="tab-pane">
                                    <section class="content">
                                        <div class="row">
                                            <div class="col-xs-12">


                                                <div class="box">
                                                    <div class="box-header">
                                                        <h3 class="box-title">Expired</h3>
                                                    </div>
                                                    <!-- /.box-header -->
                                                    <div class="box-body">
                                                        <table id="example3" class="table table-bordered table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>Employee Name</th>
                                                                    <th>Client Name</th>
                                                                    <th>License Start</th>
                                                                    <th>License End </th>
                                                                    <th>Days Remaining</th>
                                                                    <th>Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>

                                                                <% for (int i = 0; i < jobInfo.getExpiredEmployeeLicense().size(); i++) {%>

                                                                <tr>
                                                                    <td><a href="viewEmployeeProfile?id=<%=jobInfo.getExpiredEmployeeLicense().get(i).getEmployeeID()%>"> <font color="#FF0000"><%=jobInfo.getExpiredEmployeeLicense().get(i).getFirstName() + " " + jobInfo.getExpiredEmployeeLicense().get(i).getLastName()%></font></a></td>
                                                                    <td><%=jobInfo.getExpiredEmployeeLicense().get(i).getAssignedTo()%>
                                                                    </td>
                                                                    <td>License Start</td>
                                                                    <td><%=jobInfo.getExpiredEmployeeLicense().get(i).getLicenseExpDate()%></td>
                                                                    <td><%=jobInfo.getExpiredEmployeeLicense().get(i).getNumberOfDays()%></td>
                                                                    <td><button type="submit" method="post" class="btn btn-primary" id="">Print   </button></td>
                                                                </tr>
                                                                <%};%>
                                                            </tbody>
                                                            <tfoot>
                                                                <tr>
                                                                    <th>Employee Name</th>
                                                                    <th>Client Name</th>
                                                                    <th>License Start</th>
                                                                    <th>License End </th>
                                                                    <th>Days Remaining</th>
                                                                    <th>Action</th>
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

                            </div>
                        </div>
                    </div>

                </section> <!-- Additional -->
            </div>
            <!-- /.content-wrapper -->

        </div> <!-- Additional -->
        <!-- ./wrapper -->


        <!-- DataTables -->
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
        <!-- page script -->
        <script>
            
//            var table = $('#example1').DataTable();
//                
//                 $(function () {
//                $("#example1").DataTable();
//                $("#example2").DataTable();
//                $("#example3").DataTable();
//                });
//                
            $(function () {
                //Initialize Select2 Elements
                $(".select2").select2();

                $("#example1").DataTable();
                $("#example2").DataTable();
                $("#example3").DataTable();
            });
        </script>

    </body>
</html>
