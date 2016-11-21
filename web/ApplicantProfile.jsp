<%-- 
    Document   : blankpage
    Created on : Aug 24, 2016, 5:56:01 AM
    Author     : Eugene
--%>

<%@page import="entity.EmployeePhysicalInfo"%>
<%@page import="entity.EmployeeJobInfo"%>
<%@page import="entity.EmployeePersonalInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file= "blankpage.jsp" %>
<html>
    <head>
        <title>Safeguard | Applicant Profile</title>
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

                            <% EmployeePersonalInfo tempPersonalInfo = (EmployeePersonalInfo) session.getAttribute("TempPersonalInfo");
                                EmployeeJobInfo tempJobInfo = (EmployeeJobInfo) session.getAttribute("TempJobInfo");
                                EmployeePhysicalInfo tempPhysicalInfo = (EmployeePhysicalInfo) session.getAttribute("TempPhysicalInfo");%>

                            <h1 align="center"><%= tempPersonalInfo.getLastName() + ", "%><%= tempPersonalInfo.getFirstName()%></h1>


                            <div class="col-md-12 col-sm-12 col-xs-12 profile_details">
                                <div class="box-body">
                                    <div class="nav-tabs-custom">
                                        <ul class="nav nav-tabs">
                                            <li class="active"><a href="#PersonalData" data-toggle="tab">Personal Data</a></li>
                                            <li><a href="#PersonalCharacteristics" data-toggle="tab">Personal Characteristics</a></li>
                                            <li><a href="#OfficialDate" data-toggle="tab">Official Date</a></li>                                    
                                            <li><a href="#EmploymentBackground" data-toggle="tab">Employment Background</a></li>                                   
                                        </ul>
                                    </div>

                                    <div class="tab-content">
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
                                                        <text type="text" name="employeeLastName" id="employeeLastName"><%= tempPersonalInfo.getLastName()%>
                                                    </div>
                                                    <div class="form-group col-xs-2">
                                                        <label for="employeeFirstName">First Name</label><br>
                                                        <text type="text" name="employeeFirstName" id="employeeFirstName"><%= tempPersonalInfo.getFirstName()%>
                                                    </div>
                                                    <div class="form-group col-xs-2">
                                                        <label for="employeeMiddleName">Middle Name</label><br>
                                                        <text type="text" name="employeeMiddleName" id="employeeMiddleName"><%= tempPersonalInfo.getMiddleName()%>
                                                    </div>
                                                    <div class="form-group col-xs-2">
                                                        <label for="employeeNickname">Nickname</label><br>
                                                        <text type="text" name="employeeNickname" id="employeeNickname"><%= tempPersonalInfo.getNickname()%>
                                                    </div>
                                                    <!-- Date -->
                                                    <div class="form-group col-xs-2">
                                                        <label for="employeeBirthDate">Birth Date:</label><br>
                                                        <text type="text" name="employeeBirthDate" id="employeeBirthDate"><%= tempPersonalInfo.getBirthday()%>
                                                        <!-- /.input group -->
                                                    </div>
                                                    <div class="col-xs-1">
                                                        <label for="employeeAge">Age</label><br>
                                                        <text type="text" name="employeeAge" id="employeeBirthDate"><%= tempPersonalInfo.getAge()%>
                                                    </div>
                                                    <div class="col-xs-1">
                                                        <label>Sex</label><br>
                                                        <text type="text" name="employeeSex" id="employeeSex"><%= tempPersonalInfo.getSex()%>
                                                    </div>
                                                    <div class="form-group col-xs-1">
                                                        <label>Religion</label><br>
                                                        <text type="text" name="employeeReligion" id="employeeReligion"><%= tempPersonalInfo.getReligion()%>
                                                    </div>
                                                    <!-- phone mask -->
                                                    <div class="form-group col-xs-2">
                                                        <label>Cellphone No.</label><br>
                                                        <text type="text" name="employeeCPNo" id="employeeCPNo"><%= tempPersonalInfo.getCellphoneNo()%>
                                                    </div>
                                                    <!-- phone mask -->
                                                    <div class="form-group col-xs-2">
                                                        <label>Telephone No.</label><br>
                                                        <text type="text" name="employeeTelNo" id="employeeTelNo"><%= tempPersonalInfo.getTelephoneNo()%>
                                                    </div>
                                                    <div class="form-group col-xs-3">
                                                        <label>Educational Attainment</label><br>
                                                        <text type="text" name="employeeEducationalAttainment" id="employeeEducationalAttainment"><%= tempPersonalInfo.getEducation()%>
                                                    </div>
                                                    <div class="form-group col-xs-2">
                                                        <label>City</label><br>
                                                        <text type="text" name="employeeCity" id="employeeCity"><%= tempPersonalInfo.getCity()%>
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
                                                            <text type="text" name="employeeHeight" id="employeeHeight"><%= tempPhysicalInfo.getHeight() + " cm"%>
                                                            <br>
                                                            <label>Weight</label>
                                                            <text type="text" name="employeeWeight" id="employeeWeight"><%= tempPhysicalInfo.getWeight() + " kg"%>
                                                        </div>
                                                        <div class="col-sm-5">
                                                            <label>Sears or other distinguishing marks</label><br>
                                                            <text type="text" name="employeeDistinguishingMarks" id="employeeDistinguishingMarks"><%= tempPhysicalInfo.getSears()%>
                                                            <br>
                                                            <label>Physical Defects</label><br>
                                                            <text type="text" name="employeePhysicalDefects" id="employeePhysicalDefects"><%= tempPhysicalInfo.getPhysicalDefects()%>
                                                            <br>
                                                            <label>Recent Serious Illness</label><br>
                                                            <text type="text" name="employeeRecentSeriousIllness" id="employeeRecentSeriousIllness"><%= tempPhysicalInfo.getIllnesses()%>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-4">

                                                        <label>Body Build</label><br>
                                                        <text type="text" name="employeeBodyBuild" id="employeeBodyBuild"><%= tempPhysicalInfo.getBodyBuild()%>
                                                        <label>Skin Complexion</label><br>
                                                        <text type="text" name="employeeSkinComplexion" id="employeeSkinComplexion"><%= tempPhysicalInfo.getSkinColor()%>
                                                        <label>State of Health</label><br>
                                                        <text type="text" name="employeeStateofHealth" id="employeeStateofHealth"><%= tempPhysicalInfo.getStateOfHealth()%>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- PART 2 PERSONAL CHARACTERISTICS END -->

                                        <!-- PART 3 OFFICIAL DATE START -->
                                        <div id="OfficialDate" class="tab-pane">
                                            <div class="box box-info">
                                                <div class="box-header with-border">
                                                    <h4 class="box-title"><strong><u>III. Official Data</u></strong></h4>
                                                </div>
                                                <div class="box-body">
                                                    <div class="col-xs-3">
                                                        <label>Driver's License No.</label><br>
                                                        <text type="text" name="employeeDriversLicense" id="employeeDriversLicense"><%= tempJobInfo.getDriversLicense()%>
                                                    </div>
                                                    <div class="form-group col-xs-9">
                                                        <label>Expiry Date:</label><br>
                                                        <text type="text" name="employeeDriversLicenseExpiryDate" id="employeeDriversLicenseExpiryDate"><%= tempJobInfo.getDriversLicenseExpDate()%>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label>Security License No.</label><br>
                                                        <text type="text" name="employeeSecurityLicense" id="employeeSecurityLicense"><%= tempJobInfo.getLicense()%>
                                                    </div>                        
                                                    <div class="form-group col-xs-6">
                                                        <label>Expiry Date</label><br>
                                                        <text type="text" name="employeeBadgeNoExpiryDate" id="employeeBadgeNoExpiryDate"><%= tempJobInfo.getLicenseExpDate()%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- PART 3 OFFICIAL DATE END -->



                                        <!-- PART 5 EMPLOYMENT BACKGROUND START -->
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
                                                                <text type="text" name="employeeTrainings1" id="employeeTrainings1"><%= tempJobInfo.getTrainingAttended()%></text>
                                                            </li>
                                                            <li>
                                                                <text type="text" name="employeeTrainings2" id="employeeTrainings2"><%= tempJobInfo.getTrainingAttended()%></text>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="form-group col-xs-12">
                                                        <div>
                                                            <div class="form-group col-xs-2">
                                                                <label>Inclusive Dates</label><br>
                                                                <text type="text" name="employeeEmployerDate1" id="employeeEmployerDate1"><%= tempJobInfo.getInclusiveDate()%>/text>
                                                            </div>
                                                            <div class="form-group col-xs-2">
                                                                <label>Type of Job</label><br>
                                                                <text type="text" name="employeeEmployerJob1" id="employeeEmployerJob1"><%= tempJobInfo.getFormerJob()%></text>
                                                            </div>
                                                            <div class="form-group col-xs-4">
                                                                <label>Name of Employer</label><br>
                                                                <text type="text" name="employeeEmployerName1" id="employeeEmployerName1"><%= tempJobInfo.getFormerEmployer()%></text>
                                                            </div>
                                                            <div class="form-group col-xs-4">
                                                                <label>Reason for Leaving</label><br>
                                                                <text type="text" name="employeeEmployerReason1" id="employeeEmployerReason1"><%= tempJobInfo.getReasonForLeaving()%></text>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- PART 5 EMPLOYMENT BACKGROUND END -->




                                    </div>

                                </div>
                            </div>

                        </div><!-- @end #content -->





                    </div> <!-- Additional -->
                </section> <!-- Additional -->
            </div>
            <!-- /.content-wrapper -->

        </div> <!-- Additional -->



    </body>
</html>
