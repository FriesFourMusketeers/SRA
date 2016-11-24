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
                                    <li><a href="#expireAmber" data-toggle="tab">Near Expiration (4 Months)</a></li>
                                    <li><a href="#expireRed" data-toggle="tab">Expired</a></li>
                                    <li><a href="#ongoingRetraining" data-toggle="tab">Ongoing Retraining</a></li>
                                </ul>
                            </div>
                            <br />
                            <!-- Main content -->

                            <div class="tab-content">
                                <!-- PART 1 Assigned Employee START-->
                                <div id="assigned" class="tab-pane active">

                                    <div class ="col-xs-4"></div>

                                    <div class ="col-xs-4" align="center">
                                        <div class="form-group">
                                            <label>Client:</label>
                                            <select class="form-control select2" name="clientName" id="clientName">

                                            </select>
                                        </div>
                                    </div>

                                    <div class ="col-xs-4"></div>

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
                                                    <!-- /.box-header -->
                                                    <div class="box-body">
                                                        <table id="example2" class="table table-bordered table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>Name</th>
                                                                    <th>City</th>
                                                                    <th>Education</th>
                                                                    <th>Age</th>
                                                                    <th>Height</th>
                                                                    <th>Weight</th>
                                                                    <th>Body Build</th>
                                                                    <th>Skin Complexion</th>
                                                                    <th>Marital Status</th>
                                                                    <th>Grade</th>
                                                                    <th>License</th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <% EmployeeDAO personalInfo = new EmployeeDAO();%>
                                                                <% for (int i = 0; i < personalInfo.getAllUnallocated().size(); i++) {%>
                                                                <tr>


                                                                    <td class="table"><%=personalInfo.getAllUnallocated().get(i).getLastName() + ", " + personalInfo.getAllUnallocated().get(i).getFirstName()%></td>   
                                                                    <td class="table"><%=personalInfo.getAllUnallocated().get(i).getCity()%></td>
                                                                    <td class="table"><%=personalInfo.getAllUnallocated().get(i).getEducation()%></td> 
                                                                    <td class="table"><%=personalInfo.getAllUnallocated().get(i).getAge()%></td>
                                                                    <td class="table"><%=personalInfo.getAllUnallocated().get(i).getHeight()%></td>  
                                                                    <td class="table"><%=personalInfo.getAllUnallocated().get(i).getWeight()%></td>  
                                                                    <td class="table"><%=personalInfo.getAllUnallocated().get(i).getBodyBuild()%></td>  
                                                                    <td class="table"><%=personalInfo.getAllUnallocated().get(i).getSkinColor()%></td> 
                                                                    <td class="table"><%=personalInfo.getAllUnallocated().get(i).getMarriageStatus()%></td>
                                                                    <td class="table">90</td>   <!-- hard coded score -->
                                                                    <td class="table"><%=personalInfo.getAllUnallocated().get(i).getLicense()%></td>  


                                                                    <%};%>
                                                                </tr>
                                                            </tbody>

                                                            <tfoot>
                                                                <tr>
                                                                    <th>Name</th>
                                                                    <th>City</th>
                                                                    <th>Education</th>
                                                                    <th>Age</th>
                                                                    <th>Height</th>
                                                                    <th>Weight</th>
                                                                    <th>Body Build</th>
                                                                    <th>Skin Complexion</th>
                                                                    <th>Marital Status</th>
                                                                    <th>Grade</th>
                                                                    <th>License</th>
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
                                <!-- PART 3 Near Expiration License END-->

                                <!-- PART 4 Expired License START-->
                                <div id="expireRed" class="tab-pane ">
                                    <section class="content">
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div class="box">
                                                    <!-- /.box-header -->
                                                    <div class="box-body">
                                                        <table id="example4" class="table table-bordered table-striped">
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
                                <!-- PART 4 Expired License END-->

                                <!-- PART 5 Ongoing Retraining START-->
                                <div id="ongoingRetraining" class="tab-pane">
                                    <section class="content">
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div class="box">
                                                    <!-- /.box-header -->
                                                    <div class="box-body">
                                                        <table id="example5" class="table table-bordered table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>Employee Name</th>
                                                                    <th>Retraining Start</th>
                                                                    <th>Retraining End </th>
                                                                    <th>Days Remaining</th>
                                                                    <th>Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>

                                                            </tbody>
                                                            <tfoot>
                                                                <tr>
                                                                    <th>Employee Name</th>
                                                                    <th>Retraining Start</th>
                                                                    <th>Retraining End </th>
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
                $("#example4").DataTable();
                $("#example5").DataTable();
            });

            $(function () {
                //Initialize Select2 Elements
                $(".select2").select2();

            });
        </script>

    </body>
</html>
