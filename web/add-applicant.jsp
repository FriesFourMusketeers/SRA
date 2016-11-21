<%-- 
    Document   : blankpage
    Created on : Aug 24, 2016, 5:56:01 AM
    Author     : Eugene
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file= "blankpage.jsp" %>
<html>
    <head>
        <title>Safeguard | Add Applicant</title>
        <!-- daterange picker -->
        <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
    </head>
    <body>
        <!-- Site wrapper -->
        <div class="wrapper"> <!-- Additional -->
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">

                <section class="content"> <!-- Additional -->
                    <div class="row"> <!-- Additional -->
                        <!-- Content Header (Page header) -->

                        <section class="content-header">
                            <h1>
                                Personal Information Sheet
                            </h1>

                        </section>

                        <!-- Tabs starts here -->

                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#PersonalData" data-toggle="tab">Personal Data</a></li>
                                <li><a href="#PersonalCharacteristics" data-toggle="tab">Personal Characteristics</a></li>
                                <li><a href="#OfficialData" data-toggle="tab">Official Data</a></li>
                                <li><a href="#EmploymentBackground" data-toggle="tab">Employment Background</a></li>
                            </ul>
                        </div>
                        <!-- PART 1 PERSONAL DATA START-->

                        <form role="form" action="addApplicant" method="post" enctype="multipart/form-data">
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

                                            <div class="form-group col-xs-3">
                                                <label for="applicantResume">Applicant Resume</label>
                                                <input type="file" name="applicantResume" id="applicantResume" required>
                                            </div>
                                            <div class="form-group col-xs-3">
                                                <label for="applicantPhoto">Applicant Photo</label>
                                                <input type="file" name="applicantPhoto" id="applicantPhoto" required>
                                            </div>
                                            <div class="form-group col-xs-3">
                                                <label for="applicantLastName">Last Name</label>
                                                <input type="text" class="form-control" name="applicantLastName" id="applicantLastName" placeholder="Enter Last Name" required>
                                            </div>
                                            <div class="form-group col-xs-3">
                                                <label for="applicantFirstName">First Name</label>
                                                <input type="text" class="form-control" name="applicantFirstName" id="applicantFirstName" placeholder="Enter First Name" required>
                                            </div>
                                            <div class="form-group col-xs-3">
                                                <label for="applicantMiddleName">Middle Name</label>
                                                <input type="text" class="form-control" name="applicantMiddleName" id="applicantMiddleName" placeholder="Enter Middle Name" required>
                                            </div>
                                            <div class="form-group col-xs-3">
                                                <label>Nickname</label>
                                                <input type="text" class="form-control" name="applicantNickname" id="applicantNickname" placeholder="Enter Nickname" required>
                                            </div>
                                            <div class="form-group col-xs-2">
                                                <label>Status</label>
                                                <select class="form-control select2" style="width: 100%;" name="marriageStatus" id="marriageStatus" required>
                                                    <option>Single</option>
                                                    <option>Married</option>
                                                    <option>Divorced</option>
                                                    <option>Widowed</option>
                                                </select>
                                            </div>
                                            <!-- Date -->
                                            <div class="form-group col-xs-3">
                                                <label>Birth Date:</label>
                                                <div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input type="date" class="form-control pull-right" name="BirthDate"id="BirthDate" required>
                                                </div>
                                                <!-- /.input group -->
                                            </div>
                                            <div class="col-xs-2">
                                                <label>Age</label>
                                                <input type="number" min="0" max="99" class="form-control" name="applicantAge" id="applicantAge" placeholder="Enter Age" required>
                                            </div>
                                            <div class="form-group col-xs-2">
                                                <label>Sex</label>
                                                <select class="form-control select2" style="width: 100%;" name="applicantSex" id="applicantSex" required>
                                                    <option>Male</option>
                                                    <option>Female</option>
                                                </select>
                                            </div>
                                            <div class="col-xs-12"><label></label></div>
                                            <div class="form-group col-xs-2">
                                                <label>Religion</label>
                                                <select class="form-control select2" style="width: 100%;" name="applicantReligion" id="applicantReligion" required>
                                                    <option>Catholic</option>
                                                    <option>Christian</option>
                                                    <option>Muslim</option>
                                                    <option>Atheist</option>
                                                    <option>Buddhist</option>
                                                </select>
                                            </div>
                                            <!-- phone mask -->
                                            <div class="form-group col-xs-3">
                                                <label>Cellphone No.</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-phone"></i>
                                                    </div>
                                                    <input type="text" name="applicantCellNo" id="applicantCellNo" class="form-control" data-inputmask='"mask": "(9999) 999-9999"' data-mask required>
                                                </div>
                                                <!-- /.input group -->
                                            </div>
                                            <!-- phone mask -->
                                            <div class="form-group col-xs-3">
                                                <label>Telephone No.</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-phone"></i>
                                                    </div>
                                                    <input type="text" name="applicantTelNo" id="applicantTelNo" class="form-control" data-inputmask='"mask": "(99) 999-9999"' data-mask required>
                                                </div>
                                                <!-- /.input group -->
                                            </div>
                                            <div class="form-group col-xs-3">
                                                <label>Educational Attainment</label>
                                                <select class="form-control select2" style="width: 100%;" name="applicantEducation" id="applicantEducation" required>
                                                    <option>College Graduate</option>
                                                    <option>Undergraduate</option>
                                                    <option>High School Graduate</option>
                                                    <option>Elementary Graduate</option>
                                                </select>
                                            </div>
                                            <div class="col-xs-12"></div>
                                            <div class="form-group col-xs-2">
                                                <label>City</label>
                                                <select class="form-control select2" style="width: 100%;" name="applicantCity" id="applicantCity" required>
                                                    <option>City 1</option>
                                                    <option>City 2</option>
                                                    <option>City 3</option>
                                                    <option>City 4</option>
                                                    <option>City 5</option>
                                                </select>
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
                                                    <label>Height</label>
                                                    <br>
                                                    <span><input type="number" name="applicantHeight" id="applicantHeight" placeholder="Enter Height" required> cm</span>
                                                    <br>
                                                    <label>Weight</label>
                                                    <br>
                                                    <span><input type="number" name="applicantWeight" id="applicantWeight" placeholder="Enter Weight" required> kg</span>
                                                </div>
                                                <div class="col-sm-5">
                                                    <label>Sears or other distinguishing marks</label>
                                                    <input type="text" class="form-control" name="applicantDistinguishingMarks" id="applicantDistinguishingMarks" placeholder="Enter Sears or other distinguishing marks" required>
                                                    <br>
                                                    <label>Physical Defects</label>
                                                    <input type="text" class="form-control" name="applicantPhysicalDefects" id="applicantPhysicalDefects" placeholder="Enter Physical Defects" required>
                                                    <br>
                                                    <label>Recent Serious Illness</label>
                                                    <input type="text" class="form-control" name="applicantRecentSeriousIllness" id="applicantRecentSeriousIllness" placeholder="Enter Recent Serious Illness" required>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">

                                                <label>Body Build</label>

                                                <div class="radio">   
                                                    <label>
                                                        <input type="radio" name="buildRadios" id="buildRadios1" value="Light" required>
                                                        Light
                                                    </label>
                                                    <label>
                                                        <input type="radio" name="buildRadios" id="buildRadios2" value="Medium" required>
                                                        Medium
                                                    </label>
                                                    <label>
                                                        <input type="radio" name="buildRadios" id="buildRadios3" value="Heavy" required>
                                                        Heavy
                                                    </label>
                                                </div>

                                                <label>Skin Complexion</label>
                                                <div class="radio">   
                                                    <label>
                                                        <input type="radio" name="skinRadios" id="skinRadios1" value="Dark" required>
                                                        Dark
                                                    </label>
                                                    <label>
                                                        <input type="radio" name="skinRadios" id="skinRadios2" value="Fair" required>
                                                        Fair
                                                    </label>
                                                    <label>
                                                        <input type="radio" name="skinRadios" id="skinRadios3" value="Light" required>
                                                        Light
                                                    </label>
                                                </div>

                                                <label>State of Health</label>

                                                <div class="radio">   
                                                    <label>
                                                        <input type="radio" name="healthRadios" id="healtRadios1" value="Poor" required>
                                                        Poor
                                                    </label>
                                                    <label>
                                                        <input type="radio" name="healthRadios" id="healthRadios2" value="Good" required>
                                                        Good
                                                    </label>
                                                    <label>
                                                        <input type="radio" name="healthRadios" id="healthRadios3" value="Excellent" required>
                                                        Excellent
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- PART 2 PERSONAL CHARACTERISTICS END -->

                                <!-- PART 3 OFFICIAL DATA START -->
                                <div id="OfficialData" class="tab-pane">
                                    <div class="box box-info">
                                        <div class="box-header with-border">
                                            <h4 class="box-title"><strong><u>III. Official Data</u></strong></h4>
                                        </div>
                                        <div class="box-body">
                                            <div class="col-xs-3">
                                                <label>Driver's License No.</label>
                                                <input type="text" class="form-control" name="applicantDriversLicenseNo" id="applicantDriversLicenseNo" placeholder="Enter Driver's License No." required>
                                            </div>
                                            <div class="form-group col-xs-3">
                                                <label>Expiry Date:</label>

                                                <div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input type="date" class="form-control pull-right" name="driverslicenseexpirydate" id="driverslicenseexpirydate" required>
                                                </div>
                                                <!-- /.input group -->
                                            </div>
                                            <div class="col-xs-3">
                                                <label>Security License No.</label>
                                                <input type="text" class="form-control" name="applicantSecurityLicenseNo" id="applicantSecurityLicenseNo" placeholder="Enter Security License No." required>
                                            </div>
                                            <div class="form-group col-xs-3">
                                                <label>Expiry Date</label>

                                                <div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input type="date" class="form-control pull-right" name="securitylicenseexpirydate" id="securitylicenseexpirydate" required>
                                                </div>
                                                <!-- /.input group -->
                                            </div>
                                            <div class="col-xs-3">
                                                <label>TIN No.</label>
                                                <input type="text" class="form-control" name="applicantTINNo" id="applicantTINNo" placeholder="Enter Security License No." required>
                                            </div>
                                            <div class="form-group col-xs-3">
                                                <label>Expiry Date</label>

                                                <div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input type="date" class="form-control pull-right" name="applicantTINexpirydate" id="applicantTINexpirydate" required>
                                                </div>
                                                <!-- /.input group -->
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- PART 3 OFFICIAL DATA END -->

                                <!-- PART 4 EMPLOYMENT BACKGROUND START -->
                                <div id="EmploymentBackground" class="tab-pane">
                                    <div class="box box-info">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"><strong><u>V. Employment Background</u></strong></h3>
                                        </div>
                                        <div class="box-body">
                                            <div class="form-group col-xs-6">
                                                <label>Trainings Attended</label>
                                                <select class="form-control select2" style="width: 100%;"
                                                        id = 'applicantTrainings' name = 'applicantTrainings' required onchange = "if ($('#applicantTrainings').val() == 'others') {
                                                                    $('#TrainingOthers').show();
                                                                } else {
                                                                    $('#TrainingOthers').hide();
                                                                }">
                                                    <option>Pre-licensing Training</option>
                                                    <option value="others">Others</option>
                                                </select>
                                                <input type = 'text' name = 'TrainingOthers' id = 'TrainingOthers' style="display:none"/>
                                            </div>

                                            <input type = 'text' name = 'TicketSubject' id = 'TicketSubject' style="display:none"/>

                                            <div class="form-group col-xs-6">
                                                <label>Training:</label>
                                                <div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input type="date" class="form-control pull-right" name="TrainingDate1"id="TrainingDate1">
                                                </div>
                                            </div>
                                            <div class="form-group col-xs-12">
                                                <div>
                                                    <div class="form-group col-xs-2">
                                                        <label>Inclusive Dates</label>
                                                        <div class="input-group date">
                                                            <div class="input-group-addon">
                                                                <i class="fa fa-calendar"></i>
                                                            </div>
                                                            <input type="date" class="form-control pull-right" name="applicantEmployerDate1" id="applicantEmployerDate1" >
                                                        </div>
                                                        <div class="input-group date">
                                                            <div class="input-group-addon">
                                                                <i class="fa fa-calendar"></i>
                                                            </div>
                                                            <input type="date" class="form-control pull-right" name="applicantEmployerDate2" id="applicantEmployerDate2">
                                                        </div>
                                                        <div class="input-group date">
                                                            <div class="input-group-addon">
                                                                <i class="fa fa-calendar"></i>
                                                            </div>
                                                            <input type="date" class="form-control pull-right" name="applicantEmployerDate3" id="applicantEmployerDate3">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-xs-2">
                                                        <label>Type of Job</label>
                                                        <input type="text" class="form-control" name="applicantEmployerJob1" id="applicantEmployerJob1" placeholder="" >
                                                        <input type="text" class="form-control" id="applicantEmployerJob2" id="applicantEmployerJob2" placeholder="">
                                                        <input type="text" class="form-control" id="applicantEmployerJob3" id="applicantEmployerJob3" placeholder="">
                                                    </div>
                                                    <div class="form-group col-xs-4">
                                                        <label>Name of Employer</label>
                                                        <input type="text" class="form-control" name="applicantEmployerName1" id="applicantEmployerName1" placeholder="Enter Name of Employer" >
                                                        <input type="text" class="form-control" id="applicantEmployerName2" id="applicantEmployerName2" placeholder="Enter Name of Employer">
                                                        <input type="text" class="form-control" id="applicantEmployerName3" id="applicantEmployerName3" placeholder="Enter Name of Employer">
                                                    </div>
                                                    <div class="form-group col-xs-4">
                                                        <label>Reason for Leaving</label>
                                                        <input type="text" class="form-control" name="applicantEmployerReason1" id="applicantEmployerReason1" placeholder="" >
                                                        <input type="text" class="form-control" id="applicantEmployerReason2" id="applicantEmployerReason2" placeholder="">
                                                        <input type="text" class="form-control" id="applicantEmployerReason3" id="applicantEmployerReason3" placeholder="">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="footer" >
                                                <span style="float:right;">
                                                    <button type="submit" class="btn btn-primary" id="applicantSubmit" onclick="checkFields()">Submit</button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- PART 4 EMPLOYMENT BACKGROUND END -->


                            </div>
                        </form>
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

        <script>
                                                        function confirmation() {
                                                            var x;
                                                            if (confirm("Press a button!") == true) {
                                                                x = "You pressed OK!";
                                                            } else {
                                                                x = "You pressed Cancel!";
                                                            }
                                                        }
        </script>
        <script>


            function checkFields() {
                var resume = document.getElementById('applicantResume').value;
                var photo = document.getElementById('applicantPhoto').value;
                var lastName = document.getElementById('applicantLastName').value;
                var firstName = document.getElementById('applicantFirstName').value;
                var middleName = document.getElementById('applicantMiddleName').value;
                var nickname = document.getElementById('applicantNickname').value;
                var birthday = document.getElementById('BirthDate').value;
                var age = document.getElementById('applicantAge').value;
                var sex = document.getElementById('applicantSex').value;
                var religion = document.getElementById('applicantReligion').value;
                var cellno = document.getElementById('applicantCellNo').value;
                var telno = document.getElementById('applicantTelNo').value;
                var education = document.getElementById('applicantEducation').value;
                var city = document.getElementById('applicantCity').value;
                var height = document.getElementById('applicantHeight').value;
                var weight = document.getElementById('applicantWeight').value;
                var marks = document.getElementById('applicantDistinguishingMarks').value;
                var defects = document.getElementById('applicantPhysicalDefects').value;
                var illness = document.getElementById('applicantRecentSeriousIllness').value;

                var radios = document.getElementsByName("buildRadios");
                var build;

                if (radios[0].checked || radios[1].checked || radios[2].checked) {
                    build = true;
                }
                else {
                    build = false;
                }


                var radios2 = document.getElementsByName("skinRadios");
                var skin;

                if (radios2[0].checked || radios2[1].checked || radios2[2].checked) {
                    skin = true;
                }
                else {
                    skin = false;
                }


                var radios3 = document.getElementsByName("healthRadios");
                var health;

                if (radios3[0].checked || radios3[1].checked || radios3[2].checked) {
                    health = true;
                }
                else {
                    health = false;
                }


                var driversLicense = document.getElementById('applicantDriversLicenseNo').value;
                var driversDate = document.getElementById('driverslicenseexpirydate').value;
                var securityLicense = document.getElementById('applicantSecurityLicenseNo').value;
                var securityDate = document.getElementById('securitylicenseexpirydate').value;
                var TIN = document.getElementById('applicantTINNo').value;
                var TINDate = document.getElementById('applicantTINexpirydate').value;
                var marriage = document.getElementById('marriageStatus').value;
                var seminar = document.getElementById('applicantTrainings').value;
                var employerDate = document.getElementById('applicantEmployerDate1').value;
                var employerJob = document.getElementById('applicantEmployerJob1').value;
                var employerName = document.getElementById('applicantEmployerName1').value;
                var employerReason = document.getElementById('applicantEmployerReason1').value;

                if (photo === "" || lastName === "" || firstName === "" || middleName === "" || nickname === ""
                        || birthday === "" || age === "" || sex === "" || religion === "" || cellno === ""
                        || telno === "" || education === "" || city === "" || height === "" || weight === ""
                        || marks === "" || defects === "" || illness === "" || build === false || skin === false || health === false
                        || driversLicense === "" || driversDate === "" || securityLicense === "" || securityDate === ""
                        || marriage === "" || seminar === "" || employerDate === "" || employerJob === "" || employerName === ""
                        || employerReason === "") {
                    alert("Complete All Details" + build + "" + skin + "" + health);

                }
            }
            $(function () {
                //Initialize Select2 Elements
                $(".select2").select2();

                //Datemask dd/mm/yyyy
                $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
                //Datemask2 mm/dd/yyyy
                $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
                //Money Euro
                $("[data-mask]").inputmask();

                //Date range picker
                $('#reservation').daterangepicker();

                //Date picker
                $('#residence1date').datepicker({
                    autoclose: true
                });
                //Date picker
                $('#residence2date').datepicker({
                    autoclose: true
                });
                //Date picker
                $('#residence3date').datepicker({
                    autoclose: true
                });

                //Date range picker with time picker
                $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
                //Date range as a button
                $('#daterange-btn').daterangepicker(
                        {
                            ranges: {
                                'Today': [moment(), moment()],
                                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                                'This Month': [moment().startOf('month'), moment().endOf('month')],
                                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                            },
                            startDate: moment().subtract(29, 'days'),
                            endDate: moment()
                        },
                function (start, end) {
                    $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                }
                );



                //Date picker
                $('#BirthDate').datepicker({
                    autoclose: true
                });
                //Date picker
                $('#datepicker').datepicker({
                    autoclose: true
                });
                //Date picker
                $('#driverslicenseexpirydate').datepicker({
                    autoclose: true
                });
                //Date picker
                $('#securitylicenseexpirydate').datepicker({
                    autoclose: true
                });
                //Date picker
                $('#ctcdateissued').datepicker({
                    autoclose: true
                });
                //Date picker
                $('#insuranceexpirydate').datepicker({
                    autoclose: true
                });
                //Date picker
                $('#spousebirthdate').datepicker({
                    autoclose: true
                });
                //Date picker
                $('#dateofmarriage').datepicker({
                    autoclose: true
                });
                //Date picker
                $('#child1birthdate').datepicker({
                    autoclose: true
                });
                //Date picker
                $('#child2birthdate').datepicker({
                    autoclose: true
                });
                //Date picker
                $('#child3birthdate').datepicker({
                    autoclose: true
                });
                //Date picker
                $('#fatherbirthdate').datepicker({
                    autoclose: true
                });
                //Date picker
                $('#motherbirthdate').datepicker({
                    autoclose: true
                });

                //Date picker
                $('#TrainingDate1').datepicker({
                    autoclose: true
                });//Date picker
                $('#SeminarDate2').datepicker({
                    autoclose: true
                });//Date picker
                $('#SeminarDate3').datepicker({
                    autoclose: true
                });

                //iCheck for checkbox and radio inputs
                $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
                    checkboxClass: 'icheckbox_minimal-blue',
                    radioClass: 'iradio_minimal-blue'
                });
                //Red color scheme for iCheck
                $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
                    checkboxClass: 'icheckbox_minimal-red',
                    radioClass: 'iradio_minimal-red'
                });
                //Flat red color scheme for iCheck
                $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                    checkboxClass: 'icheckbox_flat-green',
                    radioClass: 'iradio_flat-green'
                });

                //Colorpicker
                $(".my-colorpicker1").colorpicker();
                //color picker with addon
                $(".my-colorpicker2").colorpicker();

                //Timepicker
                $(".timepicker").timepicker({
                    showInputs: false
                });
            });
        </script>
    </body>
</html>
