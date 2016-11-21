<%-- 
    Document   : blankpage
    Created on : Aug 24, 2016, 5:56:01 AM
    Author     : Eugene
--%>

<%@page import="entity.PerformanceReviewScores"%>
<%@page import="java.util.Calendar"%>
<%@page import="entity.Ticket"%>
<%@page import="dao.TicketDAO"%>
<%@page import="entity.Client"%>
<%@page import="dao.EmployeeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ClientDAO"%>
<%@page import="entity.EmployeePhysicalInfo"%>
<%@page import="entity.EmployeeJobInfo"%>
<%@page import="entity.EmployeePersonalInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file= "blankpage.jsp" %>
<html>
    <head>
        <title>Safeguard | Employee Profile</title>

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

                <section class="content"> <!-- Additional -->
                    <div class="row"> <!-- Additional -->
                        <!-- Content Header (Page header) -->
                        <div id="content" class="clearfix">
                            <% EmployeePersonalInfo personalInfo = (EmployeePersonalInfo) session.getAttribute("EmployeePersonalInfo");
                                EmployeeJobInfo jobInfo = (EmployeeJobInfo) session.getAttribute("EmployeeJobInfo");
                                EmployeePhysicalInfo physicalInfo = (EmployeePhysicalInfo) session.getAttribute("EmployeePhysicalInfo");
//                                ArrayList<PerformanceReviewScores> scores;
//                                EmployeeDAO employeeDAO = new EmployeeDAO();
//                                PerformanceReviewScores prs = new PerformanceReviewScores();
//                                String empID = request.getParameter("employeeID");
//                                scores = employeeDAO.getPerformanceGradeByID(Integer.parseInt(empID));
//                                int empgrade = scores.get(Integer.parseInt(empID)).getScore();
                            %>

                            <h1 align="center"><%= personalInfo.getLastName() + ", "%><%= personalInfo.getFirstName()%></h1>


                            <div class="col-md-12 col-sm-12 col-xs-12 profile_details">
                                <div class="box-body">
                                    <div class="nav-tabs-custom">
                                        <ul class="nav nav-tabs">
                                            <li class="active"><a href="#PersonalData" data-toggle="tab">Personal Data</a></li>
                                            <li><a href="#PersonalCharacteristics" data-toggle="tab">Personal Characteristics</a></li>
                                            <li><a href="#OfficialDate" data-toggle="tab">Official Data</a></li>
                                            <li><a href="#EmploymentBackground" data-toggle="tab">Employment Background</a></li>
                                            <li><a href="#ScannedResume" data-toggle="tab">Scanned Resume</a></li>
                                            <li><a href="#EmploymentGrade" data-toggle="tab">Grade</a></li>
                                            <li><a href="#Attendance" data-toggle="tab">Attendance</a></li>
                                            <li><a href="#Complaints" data-toggle="tab">Complaints</a></li>
                                        </ul>
                                    </div>

                                    <div class="tab-content">
                                        <!-- PART 1 PERSONAL DATA END-->  
                                        <div id="PersonalData" class="tab-pane active">
                                            <!-- /.control-sidebar -->
                                            <!-- Add the sidebar's background. This div must be placed
                                                 immediately after the control sidebar -->
                                            <div class="control-sidebar-bg"></div>
                                            <div class="box box-info">
                                                <div class="box-header with-border">
                                                    <h3 class="box-title"><strong><u>I. Personal Data</u></strong></h3>
                                                </div>
                                                <!-- /.box-header -->
                                                <!-- form start -->
                                                <div class="box-body">
                                                    <div class="form-group col-xs-2">
                                                        <label for="employeeLastName">Last Name</label><br>
                                                        <text type="text" name="employeeLastName" id="employeeLastName"><%= personalInfo.getLastName()%>
                                                    </div>
                                                    <div class="form-group col-xs-2">

                                                        <label for="employeeFirstName">First Name</label><br>
                                                        <text type="text" name="employeeFirstName" id="employeeFirstName"><%= personalInfo.getFirstName()%>
                                                    </div>
                                                    <div class="form-group col-xs-2">
                                                        <label for="employeeMiddleName">Middle Name</label><br>
                                                        <text type="text" name="employeeMiddleName" id="employeeMiddleName"><%= personalInfo.getMiddleName()%>
                                                    </div>
                                                    <div class="form-group col-xs-2">
                                                        <label for="employeeNickname">Nickname</label><br>
                                                        <text type="text" name="employeeNickname" id="employeeNickname"><%= personalInfo.getNickname()%>
                                                    </div>
                                                    <!-- Date -->
                                                    <div class="form-group col-xs-2">
                                                        <label for="employeeBirthDate">Birth Date:</label><br>
                                                        <text type="text" name="employeeBirthDate" id="employeeBirthDate"><%= personalInfo.getBirthday()%>
                                                        <!-- /.input group -->
                                                    </div>
                                                    <div class="col-xs-1">
                                                        <label for="employeeAge">Age</label><br>
                                                        <text type="text" name="employeeAge" id="employeeBirthDate"><%= personalInfo.getAge()%>
                                                    </div>
                                                    <div class="col-xs-1">
                                                        <label>Sex</label><br>
                                                        <text type="text" name="employeeSex" id="employeeSex"><%= personalInfo.getSex()%>
                                                    </div>
                                                    <div class="col-xs-1">
                                                        <label>Status</label><br>
                                                        <text type="text" name="employeeStatus" id="employeeStatus"><%= personalInfo.getStatus()%>
                                                    </div>
                                                    <div class="form-group col-xs-1">
                                                        <label>Religion</label><br>
                                                        <text type="text" name="employeeReligion" id="employeeReligion"><%= personalInfo.getReligion()%>
                                                    </div>
                                                    <!-- phone mask -->
                                                    <div class="form-group col-xs-2">
                                                        <label>Cellphone No.</label><br>
                                                        <text type="text" name="employeeCPNo" id="employeeCPNo"><%= personalInfo.getCellphoneNo()%>
                                                    </div>
                                                    <!-- phone mask -->
                                                    <div class="form-group col-xs-2">
                                                        <label>Telephone No.</label><br>
                                                        <text type="text" name="employeeTelNo" id="employeeTelNo"><%= personalInfo.getTelephoneNo()%>
                                                    </div>
                                                    <div class="form-group col-xs-3">
                                                        <label>Educational Attainment</label><br>
                                                        <text type="text" name="employeeEducationalAttainment" id="employeeEducationalAttainment"><%= personalInfo.getEducation()%>
                                                    </div>
                                                    <div class="form-group col-xs-2">
                                                        <label>City</label><br>
                                                        <text type="text" name="employeeCity" id="employeeCity"><%= personalInfo.getCity()%>
                                                    </div>
                                                </div>
                                                <!-- here-->
                                            </div>
                                        </div>
                                        <!-- PART 1 PERSONAL DATA END-->    

                                        <!-- PART 2 PERSONAL CHARACTERISTICS START -->
                                        <div id="PersonalCharacteristics" class="tab-pane">
                                            <div class="box box-info">
                                                <div class="box-header with-border">
                                                    <h3 class="box-title"><strong><u>II. Personal Characteristics</u></strong></h3>
                                                </div>

                                                <div class="box-body">                        
                                                    <div class="col-sm-8">
                                                        <div class="col-sm-5">
                                                            <label>Height</label><br>
                                                            <text type="text" name="employeeHeight" id="employeeHeight"><%= physicalInfo.getHeight()%>
                                                            <br>
                                                            <label>Weight</label>
                                                            <text type="text" name="employeeWeight" id="employeeWeight"><%= physicalInfo.getWeight()%>
                                                        </div>
                                                        <div class="col-sm-5">
                                                            <label>Sears or other distinguishing marks</label><br>
                                                            <text type="text" name="employeeDistinguishingMarks" id="employeeDistinguishingMarks"><%= physicalInfo.getSears()%>
                                                            <br>
                                                            <label>Physical Defects</label><br>
                                                            <text type="text" name="employeePhysicalDefects" id="employeePhysicalDefects"><%= physicalInfo.getPhysicalDefects()%>
                                                            <br>
                                                            <label>Recent Serious Illness</label><br>
                                                            <text type="text" name="employeeRecentSeriousIllness" id="employeeRecentSeriousIllness"><%= physicalInfo.getIllnesses()%>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-4">

                                                        <label>Body Build</label><br>
                                                        <text type="text" name="employeeBodyBuild" id="employeeBodyBuild"><%= physicalInfo.getBodyBuild()%>
                                                        <label>Skin Complexion</label><br>
                                                        <text type="text" name="employeeSkinComplexion" id="employeeSkinComplexion"><%= physicalInfo.getSkinColor()%>
                                                        <label>State of Health</label><br>
                                                        <text type="text" name="employeeStateofHealth" id="employeeStateofHealth"><%= physicalInfo.getStateOfHealth()%>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- PART 2 PERSONAL CHARACTERISTICS END -->

                                        <!-- PART 3 OFFICIAL DATA START -->
                                        <div id="OfficialDate" class="tab-pane">
                                            <div class="box box-info">
                                                <div class="box-header with-border">
                                                    <h4 class="box-title"><strong><u>III. Official Data</u></strong></h4>
                                                </div>
                                                <div class="box-body">
                                                    <div class="col-xs-3">
                                                        <label>Driver's License No.</label><br>
                                                        <text type="text" name="employeeDriversLicense" id="employeeDriversLicense"><%= jobInfo.getDriversLicense()%>
                                                        </text>
                                                    </div>
                                                    <div class="col-xs-9">
                                                        <label>Expiry Date:</label><br>
                                                        <text type="text" name="employeeDriversLicenseExpiryDate" id="employeeDriversLicenseExpiryDate"><%= jobInfo.getDriversLicenseExpDate()%>
                                                        </text>
                                                    </div>


                                                    <div class="col-xs-3">
                                                        <label>Security License No.</label><br>
                                                        <text type="text" name="employeeSecurityLicense" id="employeeSecurityLicense"><%= jobInfo.getLicense()%></text>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label>Expiry Date</label><br>
                                                        <text type="text" name="employeeBadgeNoExpiryDate" id="employeeBadgeNoExpiryDate"><%= jobInfo.getLicenseExpDate()%></text>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label>Current Client</label><br>
                                                        <text type="text" name="employeeBadgeNoExpiryDate" id="employeeBadgeNoExpiryDate">Current Client</text>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label>Position</label><br>
                                                        <text type="text" name="employeeBadgeNoExpiryDate" id="employeeBadgeNoExpiryDate">Position</text>
                                                    </div>
                                                    <div class=" col-xs-3">
                                                        <button type="submit" class="btn btn-primary">Renew Security License</button>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                        <!-- PART 3 OFFICIAL DATA END -->

                                        <!-- PART 4 EMPLOYMENT BACKGROUND START -->
                                        <div id="EmploymentBackground" class="tab-pane">
                                            <div class="box box-info">
                                                <div class="box-header with-border">
                                                    <h3 class="box-title"><strong><u>IV. Employment Background</u></strong></h3>
                                                </div>
                                                <div class="box-body">
                                                    <div class="form-group col-xs-12">
                                                        <label>Seminars/Trainings Attended</label><br>
                                                        <ul>
                                                            <li>
                                                                <text type="text" name="employeeTrainings1" id="employeeTrainings1"><%= jobInfo.getTrainingAttended()%></text>
                                                            </li>
                                                            <li>
                                                                <text type="text" name="employeeTrainings2" id="employeeTrainings2"><%= jobInfo.getTrainingAttended()%></text>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="form-group col-xs-12">
                                                        <div>
                                                            <div class="form-group col-xs-2">
                                                                <label>Inclusive Dates</label><br>
                                                                <text type="text" name="employeeEmployerDate1" id="employeeEmployerDate1"><%= jobInfo.getInclusiveDate()%></text>
                                                            </div>
                                                            <div class="form-group col-xs-2">
                                                                <label>Type of Job</label><br>
                                                                <text type="text" name="employeeEmployerJob1" id="employeeEmployerJob1"><%= jobInfo.getFormerJob()%></text>
                                                            </div>
                                                            <div class="form-group col-xs-4">
                                                                <label>Name of Employer</label><br>
                                                                <input type="text" name="employeeEmployerName1" id="employeeEmployerName1"><%= jobInfo.getFormerEmployer()%>
                                                            </div>
                                                            <div class="form-group col-xs-4">
                                                                <label>Reason for Leaving</label><br>
                                                                <text type="text" name="employeeEmployerReason1" id="employeeEmployerReason1"><%= jobInfo.getReasonForLeaving()%></text>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- PART 4 EMPLOYMENT BACKGROUND END -->


                                        <!-- PART 5 Scanned Resume START-->
                                        <div id="ScannedResume" class="tab-pane">
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
                                        <!-- PART 5 Scanned Resume END-->


                                        <!-- PART 6 GRADE START -->
                                        <div id="EmploymentGrade" class="tab-pane">
                                            <div class="box box-info">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Year</label>
                                                        <select class="form-control" id="yearSelect">
                                                            <option>2013</option>
                                                            <option>2014</option>
                                                            <option>2012</option>
                                                        </select>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary" id="Retrain" >

                                                        Retrain</button> 
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-8">
                                                        <input type="hidden" id="employeeID" name="employeeID" value="<%= personalInfo.getEmployeeID()%>"/>
                                                        <div class="box-body no-padding" id="empGrade" name="empGrade"></div>
                                                    </div>
                                                    <!-- /.col -->
                                                </div>


                                            </div>
                                        </div>
                                        <!-- PART 6 GRADE END -->

                                        <!-- PART 7 ATTENDANCE START -->
                                        <div id="Attendance" class="tab-pane">
                                            <div class="box box-info">
                                                <div class="box-header with-border">
                                                    <h4 class="box-title"><strong><u>VII. Attendance</u></strong></h4>
                                                </div>
                                                <div class="box-body">
                                                    <!-- DONUT CHART -->
                                                    <div class="box box-danger">
                                                        <div class="box-header with-border">
                                                            <h3 class="box-title">Attendance</h3>

                                                            <div class="box-tools pull-right">
                                                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                                                </button>
                                                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                                            </div>
                                                            <!-- /.box-header -->
                                                            <div class="box-body">
                                                                <div class="row">
                                                                    <div class="col-md-8">
                                                                        <div class="box-body chart-responsive">
                                                                            <div class="chart" id="attendance" style="height: 200px; position: relative;"></div>

                                                                        </div>
                                                                        <!-- ./chart-responsive -->
                                                                    </div>
                                                                    <!-- /.col -->
                                                                    <div class="col-md-4">
                                                                        <ul class="chart-legend clearfix">
                                                                            <li><i class="fa fa-circle-o text-red"></i> Days Present</li>
                                                                            <li><i class="fa fa-circle-o text-orange"></i> Late</li>
                                                                            <li><i class="fa fa-circle-o text-aqua"></i> Absences</li>
                                                                        </ul>
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
                                            </div>
                                        </div>
                                        <!-- PART 7 ATTENDANCE END -->

                                        <!-- PART 8 COMPLAINTS START -->
                                        <div id="Complaints" class="tab-pane">
                                            <div class="box box-info">
                                                <div class="box-header with-border">
                                                    <h3 class="box-title"><strong><u>V. Complaints</u></strong></h3>
                                                </div>
                                                <div class="box-body">
                                                    <div class="form-group col-xs-12">
                                                        <label>Complaints (Click for more info)</label><br>
                                                        <ul>
                                                            <li>
                                                                <a href="#">Rape</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">Murder</a>
                                                            </li>
                                                        </ul>
                                                    </div>                                            
                                                </div>
                                            </div>



                                        </div>
                                        <!-- PART 8 COMPLAINTS END -->

                                    </div>

                                </div>
                            </div>

                        </div><!-- @end #content -->


                    </div> <!-- Additional -->
                </section> <!-- Additional -->
            </div>
            <!-- /.content-wrapper -->

        </div> <!-- Additional -->

        <!-- ./wrapper -->

        <script src="js/employeeProfile.js" type="text/javascript"></script>
        
    </body>
</html>
