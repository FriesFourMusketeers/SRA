<%-- 
    Document   : blankpage
    Created on : Aug 23, 2016, 5:41:11 PM
    Author     : bryan
--%>

<%@page import="dao.RecruitmentDashDAO"%>
<%@page import="entity.TicketRecruitment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TicketDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file= "blankpage.jsp" %>
<html>
    <head>
        <title>Safeguard | Recruitment Dashboard</title>
        <!-- DataTables -->
        <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">

        <script src="Highcharts/highcharts.js"></script>
        <script src="Highcharts/modules/data.js"></script>
        <script src="Highcharts/modules/drilldown.js"></script>
        <script src="Highcharts/modules/exporting.js"></script>
        <script src="technical-indicators-master/technical-indicators.src.js" type="text/javascript"></script>
    </head>
    <body>
        <!-- Site wrapper -->
        <div class="wrapper"> <!-- Additional -->
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">

                <div class="col-md-12">
                    <%  RecruitmentDashDAO counter = new RecruitmentDashDAO();
                        int avgClientCount = counter.getAverageNewClientsDetails();
                        int avgApplicantsCount = counter.getAverageApplicantsDetails();
                        int avgHiredApplicantsCount = counter.getAverageHiredApplicantsDetails();
                        int avgNeedToHireCount = counter.getApplicantsNeedToHireDetails();
                    %>
                    <!-- Info Boxes Style 2 -->
                    <div class="box-body no-padding">
                        <ul class="users-list clearfix">
                            <li>
                                <div class="info-box bg-red">
                                    <span class="info-box-icon"><i class="fa fa-plus"></i></span>

                                    <div class="info-box-content">
                                        <span class="info-box-text"><b>Average New Clients</b></span>
                                        <a href="Ticketing.jsp">
                                            <span class="info-box-number"><font color="#000000"><%= avgClientCount%></font></span>
                                        </a>
                                        <div class="progress">
                                            <div class="progress-bar" style="width: 100%"></div>
                                        </div>
                                        <span class="progress-description">
                                            <i>
                                                per month
                                            </i>
                                        </span>
                                    </div>

                                    <!-- /.info-box-content -->
                                </div>
                            </li>
                            <li>
                                <!-- /.info-box -->
                                <div class="info-box bg-aqua">
                                    <span class="info-box-icon"><i class="fa fa-users"></i></span>

                                    <div class="info-box-content">
                                        <span class="info-box-text"><b>Average Applicants</b></span>
                                        <a href="Ticketing.jsp">
                                            <span class="info-box-number"><font color="#000000"><%= avgApplicantsCount%></font></span>
                                        </a>
                                        <div class="progress">
                                            <div class="progress-bar" style="width: 100%"></div>
                                        </div>
                                        <span class="progress-description">
                                            <i>
                                                per month
                                            </i>
                                        </span>
                                    </div>
                                </div>
                                <!-- /.info-box-content --> 
                            </li>
                            <li>
                                <!-- /.info-box -->
                                <div class="info-box bg-orange">
                                    <span class="info-box-icon"><i class="fa fa-user-plus"></i></span>

                                    <div class="info-box-content">
                                        <span class="info-box-text"><b>Average Hired Applicants</b></span>
                                        <a href="Ticketing.jsp">
                                            <span class="info-box-number"><font color="#000000"><%= avgHiredApplicantsCount%></font></span>
                                        </a>
                                        <div class="progress">
                                            <div class="progress-bar" style="width: 100%"></div>
                                        </div>
                                        <span class="progress-description">
                                            <i>
                                                per month
                                            </i>
                                        </span>
                                    </div>
                                    <!-- /.info-box-content -->
                                </div>
                            </li>
                            <li>
                                <!-- /.info-box -->
                                <div class="info-box bg-gray">
                                    <span class="info-box-icon"><i class="fa fa-odnoklassniki"></i></span>

                                    <div class="info-box-content">
                                        <span class="info-box-text"><b>Applicants Need to Hire</b></span>
                                        <a href="Ticketing.jsp">
                                            <span class="info-box-number"><font color="#000000"><%= avgNeedToHireCount%></font></span>
                                        </a>
                                        <div class="progress">
                                            <div class="progress-bar" style="width: 100%"></div>
                                        </div>
                                        <span class="progress-description">
                                            <i>
                                                per month
                                            </i>
                                        </span>
                                    </div>
                                    <!-- /.info-box-content -->
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="modal fade bs-example-modal-lg" id="editCriteria" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Clients (low scores)</h4>
                            </div>
                            <div class="modal-body">
                                <div class="box">
                                    <div class="box-header">
                                        <h3 class="box-title">Assigned Employees</h3>
                                    </div>
                                    <!-- /.box-header -->
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
                                                <button type="submit" class="btn btn-primary" id="safeguardCriteriaUpdate">Save</button>
                                            </span>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <section class="content"> <!-- Additional -->
                    <div class="row"> <!-- Additional -->
                        <div class="row">
                            <div class="col-md-6">
                                <!-- LINE CHART -->
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Year</label>
                                            <select class="form-control" id="yearSelectApplicants">
                                                <option>2013</option>
                                                <option>2014</option>
                                                <option>2012</option>
                                            </select>
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-dismiss="modal" data-backdrop="static" data-target="#editCriteria">Edit Criteria</button>
                                        </div>
                                    </div>
                                    <div class="col-md-11" > 
                                        <div class="box box-info">
                                            <div class="box-header with-border">
                                                <div class="box-tools pull-right">
                                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                                </div>
                                            </div>
                                            <div class="box-body no-padding" id="applicantsHiredContainer"></div>
                                        </div>                                        
                                        </button> 
                                    </div>


                                </div>


                            </div>
                            <div class="col-md-6">
                                <!-- BAR CHART -->
                                <div class="row">

                                    <div class="col-md-11" > 
                                        <div class="box box-info">
                                            <div class="box-header with-border">
                                                <div class="box-tools pull-right">
                                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                                </div>
                                            </div>
                                            <div class="box-body no-padding" id="applicantBarChart"></div>
                                        </div>                                        
                                        </button> 
                                    </div>


                                </div>



                            </div>
                            <!-- /.col (RIGHT) -->

                            <div class="col-md-6" align ="center">
                                <!-- DONUT CHART -->
                                <div class="box box-danger">
                                    <div class="box-header with-border">
                                        <div class="box-tools pull-right">
                                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                            </button>
                                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <div class="box-body no-padding" id="placesPieChart"></div>
                                                </div>
                                                <!-- /.col -->
                                            </div>
                                            <!-- /.row -->
                                        </div>
                                    </div>


                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->

                            </div>
                            <!-- /.col (LEFT) -->

                            <!-- /.box -->
                        </div>
                        <!-- /.content-wrapper -->

                    </div> <!-- Additional -->
                </section> <!-- Additional -->
            </div>
            <!-- /.content-wrapper -->

        </div> <!-- Additional -->
        <!-- ./wrapper -->


        <!-- DataTables -->
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>


        <script src="js/recruitmentDashboard.js" type="text/javascript"></script>

        <script>
                                                        /* When the user clicks on the button,
                                                         toggle between hiding and showing the dropdown content */
                                                        function myFunction() {
                                                            $("#value").empty();
                                                            document.getElementById("myDropdown").classList.toggle("show");
                                                        }
                                                        function clearStorage() {
                                                            sessionStorage.clear();
                                                        }

// Close the dropdown if the user clicks outside of it
                                                        window.onclick = function (event) {
                                                            if (!event.target.matches('.dropbtn')) {
                                                                var dropdowns = document.getElementsByClassName("dropdown-content");
                                                                var i;
                                                                for (i = 0; i < dropdowns.length; i++) {
                                                                    var openDropdown = dropdowns[i];
                                                                    if (openDropdown.classList.contains('show')) {
                                                                        openDropdown.classList.remove('show');
                                                                    }
                                                                }
                                                            }
                                                        }
        </script>



        <script>
            $(function () {
                $("#example1").DataTable();
                $('#example2').DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "searching": false,
                    "ordering": true,
                    "info": true,
                    "autoWidth": false
                });
            });
        </script>
    </body>
</html>
