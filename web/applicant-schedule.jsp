<%-- 
    Document   : blankpage
    Created on : Aug 24, 2016, 5:56:01 AM
    Author     : Eugene
--%>

<%@page import="entity.TicketRecruitment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TicketDAO"%>
<%@page import="dao.ScheduleDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.EmployeeDAO"%>
<!DOCTYPE html>
<%@include file= "blankpage.jsp" %>
<html>
    <head>
        <title>Safeguard | Applicant Schedule</title
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

                        

                        <!-- Tabs starts here -->
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#PendingApplicants" data-toggle="tab">Pending Applicants</a></li>
                                <li><a href="#WaitlistedApplicants" data-toggle="tab">Waitlisted Applicants</a></li>
                                <li><a href="#RejectedApplicants" data-toggle="tab">Rejected Applicants</a></li>
                                <li><a href="#SafeguardCriteria" data-toggle="tab">Safeguard Criteria</a></li>
                            </ul>
                        </div>


                        <form role ="form" action="finalDecision" method="post">
                            <div class="modal fade bs-example-modal-lg" id="scheduleNotQualified" role="dialog">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Not Qualified</h4>
                                        </div>
                                        <div class="modal-body">
                                            <label>Reason</label>
                                            <input type="text" class="form-control" name="applicantReason" id="applicantReason" placeholder="He is not qualified because..">
                                            <div class="modal-footer pull-right-container">
                                                <span style="float:right">
                                                    <button type="submit" method="post" class="label-danger btn btn-primary" name="second" value="notQualified">Not Qualified</button>
                                                    <input type="hidden" name="employeeID" id="employeeID">
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="tab-content">
                                <!-- PART 1 Pending Applicants START-->
                                <div id="PendingApplicants" class="tab-pane active">
                                    <div class="box">
                                        <div class="box-header">
                                            <h3 class="box-title">Pending Applicants</h3>
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body">



                                            <table id="example1" class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>Name</th>
                                                        <th>Schedule</th>
                                                        <th>Timeslot</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <% ScheduleDAO schedule = new ScheduleDAO();%>
                                                    <% for (int i = 0; i < schedule.getAllInterview().size(); i++) {%>
                                                    <tr>
                                                        <td style="display:none">

                                                            <select name="applicantID" id="applicantID">
                                                                <option class ="ap-id"><%=schedule.getAllInterview().get(i).getEmployeeID()%></option>
                                                            </select>

                                                        </td>
                                                        <td for="applicantName" id="applicantName<%=+i%>"><%=schedule.getAllInterview().get(i).getName()%></td>
                                                        <td for="scheduledDate" id="scheduledDate<%=+i%>"><%=schedule.getAllInterview().get(i).getScheduledDate()%></td>
                                                        

                                                        <td><button type="submit" method="post" class="btnSelect label-success btn btn-primary" name="first" value="Qualified">Qualified</button>
                                                            <button type="submit" method="post" class="btnSelect label-primary btn btn-primary" name="third" value="Waitlisted">WaitListed</button>
                                                            <button type="button" class="btnSelect label-danger btn btn-primary" data-toggle="modal" data-dismiss="modal" data-backdrop="static" data-target="#scheduleNotQualified">Not Qualified</button>
                                                        </td>    
                                                    </tr>
                                                    <%}%>
                                                </tbody>

                                            </table>

                                        </div>
                                        <!-- /.box-body -->
                                    </div>
                                    <!-- /.content-wrapper -->
                                </div>  
                                <!-- PART 1 Pending Applicants END-->

                                <!-- PART 2 Waitlisted Applicants START-->
                                <div id="WaitlistedApplicants" class="tab-pane">

                                    <div class="box">
                                        <div class="box-header">
                                            <h3 class="box-title">Waitlisted Applicants</h3>
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body">

                                            <table id="example2" class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>Waitlisted Applicant Name</th>

                                                    </tr>
                                                </thead>
                                                <tbody>    
                                                    <% EmployeeDAO employeeDAO = new EmployeeDAO();%>
                                                    <% for (int i = 0; i < employeeDAO.getAllWaitlisted().size(); i++) {%>
                                                    <tr>
                                                        <td><%=employeeDAO.getAllWaitlisted().get(i).getFirstName() + " " + employeeDAO.getAllWaitlisted().get(i).getLastName()%></td>
                                                    </tr>
                                                    <%}%>   
                                                </tbody>
                                            </table>



                                        </div>
                                        <!-- /.box-body -->
                                    </div>
                                    <!-- /.content-wrapper -->

                                </div>
                                <!-- PART 2 Waitlisted Applicants END-->

                                <!-- PART 3 Rejected Applicants START-->
                                <div id="RejectedApplicants" class="tab-pane">

                                    <div class="box">
                                        <div class="box-header">
                                            <h3 class="box-title">Rejected Applicants</h3>
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body">

                                            <table id="example2" class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>Rejected Applicant Name</th>
                                                        <th>Reason</th>
                                                    </tr>
                                                </thead>
                                                <tbody>    
                                                    <% EmployeeDAO employeeDAO2 = new EmployeeDAO();%>
                                                    <% for (int i = 0; i < employeeDAO2.getAllRejected().size(); i++) {%>
                                                    <tr>
                                                        <td><%=employeeDAO2.getAllRejected().get(i).getFirstName() + " " + employeeDAO2.getAllRejected().get(i).getLastName()%></td>
                                                        <td><%=employeeDAO2.getAllRejected().get(i).getDetails()%></td>
                                                    </tr>
                                                    <%}%>   
                                                </tbody>
                                            </table>



                                        </div>
                                        <!-- /.box-body -->
                                    </div>
                                    <!-- /.content-wrapper -->

                                </div>
                                <!-- PART 3 Rejected Applicants END-->        

                                <!-- PART 4 Safeguard Criteria START-->
                                <div id="SafeguardCriteria" class="tab-pane">
                                    
                                    <!-- /.control-sidebar -->
                                    <!-- Add the sidebar's background. This div must be placed
                                         immediately after the control sidebar -->
                                    <div class="control-sidebar-bg"></div>
                                    <div class="box box-info">
                                        <!-- /.box-header -->
                                        <!-- form start -->
                                        <div class="box-body">


                                            <div class="col-xs-2">
                                                <label>Minimum Age</label>
                                                <input type="number" min="0" max="99" class="form-control" name="ageMinCriteria" id="ageMinCriteria" placeholder="Enter Minimum Age" required>
                                                <br><br>
                                                <label>Maximum Age</label>
                                                <input type="number" min="0" max="99" class="form-control" name="ageMaxCriteria" id="ageMaxCriteria" placeholder="Enter Maximum Age" required>
                                            </div>

                                            <div class="col-sm-2">
                                                <label>Minimum Height</label>
                                                <br>
                                                <span><input type="number" name="heightMinCriteria" id="heightMinCriteria" placeholder="Enter Minimum Height" required> cm</span>
                                            </div>
                                            
                                            <div class="col-sm-2">
                                                <label>Minimum Weight</label>
                                                <br>
                                                <span><input type="number" name="weightMinCriteria" id="weightMinCriteria" placeholder="Enter Minimum Weight" required> kg</span>
                                                <br><br>
                                                <label>Maximum Weight</label>
                                                <br>
                                                <span><input type="number" name="weightMaxCriteria" id="weightMaxriteria" placeholder="Enter Maximum Weight" required> kg</span>
                                            </div>

                                            <div class="form-group col-xs-2">
                                                <label>Body Build</label>
                                                <select class="form-control select2" style="width: 100%;" name="bodyBuildCriteria" id="bodyBuildCriteria" required>
                                                    <option>Light</option>
                                                    <option>Medium</option>
                                                    <option>Heavy</option>
                                                    <option>Any</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-xs-3">
                                                <label>Trainings Attended</label>
                                                <select class="form-control select2" style="width: 100%;"
                                                        id = 'trainingCriteria' name = 'trainingCriteria' required onchange = "if ($('#trainingCriteria').val() == 'others') {
                                                                    $('#TrainingOthers').show();
                                                                } else {
                                                                    $('#TrainingOthers').hide();
                                                                }">
                                                    <option>Pre-licensing Training</option>
                                                    <option value="others">Others</option>
                                                </select>
                                                <input type = 'text' name = 'TrainingOthers' id = 'TrainingOthers' style="display:none"/>
                                            </div>
                                            <div class="form-group col-xs-3">
                                                <label>License Type</label>
                                                <select class="form-control select2" style="width: 100%;"
                                                        id = 'LicenseCriteria' name = 'LicenseCriteria' required>
                                                    <option>Security Guard</option>
                                                    <option>Security Officer</option>
                                                    <option>Either</option>
                                                    <option>None</option>
                                                </select>
                                            </div>
                                            
                                            <div class="footer" >
                                                <span style="float:right;">
                                                    <button type="submit" class="btn btn-primary" id="safeguardCriteriaUpdate" name="fourth" value="updateCriteria">Save</button>
                                                </span>
                                            </div>

                                        </div>
                                        <!-- here-->
                                    </div>
                                    
                                </div>
                                <!-- PART 4 Safeguard Criteria END-->
                       
                            </div>

                        </form>
                        <!-- /.tablinks -->

                    </div> <!-- Additional -->
                </section> <!-- Additional -->
            </div>
            <!-- /.content-wrapper -->

        </div> <!-- Additional -->


        <!-- all tabs end here -->

        <!-- /.box-body -->

        <!-- ./wrapper -->

        <!-- jQuery 2.2.3 -->
        <script src="dist/js/addapplicant.js"></script> <!-- addapplicant js -->
        <!-- InputMask -->
        <script src="plugins/input-mask/jquery.inputmask.js"></script>
        <script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
        <script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
        <!-- DataTables -->
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>

        <script>
            $(function () {
                //Initialize Select2 Elements
                $(".select2").select2();
            });
        </script>
        
        <script>

            function check() {
                var currentRow = $(this).closest("tr");
                var col1 = currentRow.find(".ap-id").html();

                document.getElementById("employeeID").value = col1;
                document.getElementById("employeeID").innerHTML = col1;

            }


            $(document).ready(function () {
                // code to read selected table row cell data (values).

                $(".btnSelect").on('click', function () {
                    var currentRow = $(this).closest("tr");
                    var col1 = currentRow.find(".ap-id").html();

                    document.getElementById("employeeID").value = col1;
                    document.getElementById("employeeID").innerHTML = col1;

                    alert(document.getElementById("employeeID").value);

                });
            });
        </script>
    </body>
</html>
