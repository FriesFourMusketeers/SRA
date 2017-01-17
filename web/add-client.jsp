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
        <title>Safeguard | Add Client</title>
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
                                Client Information
                            </h1>

                        </section>

                        <!-- Tabs starts here -->

                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#AddClient" data-toggle="tab">Add Client</a></li>
                                <li><a href="#ClientList" data-toggle="tab">Client List</a></li>
                                
                            </ul>
                        </div>
                        
                        <form role="form" action="addClient" method="post">
                        <!-- PART 1 ADD CLIENT START-->

                        
                            <div class="tab-content">
                                <div id="AddClient" class="tab-pane active">
                                    <!-- /.control-sidebar -->
                                    <!-- Add the sidebar's background. This div must be placed
                                         immediately after the control sidebar -->
                                    <div class="control-sidebar-bg"></div>
                                    <div class="box box-info">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"><strong><u>Add Client</u></strong></h3>
                                        </div>
                                        <!-- /.box-header -->
                                        <!-- form start -->
                                        <div class="box-body">
                                          
                                            <div class="form-group col-xs-3">
                                                <label for="clientName">Client Name</label>
                                                <input type="text" class="form-control" name="clientName" id="clientName" placeholder="Enter Client Name" required>
                                            </div>
                                            <div class="form-group col-xs-3">
                                                <label for="contactPerson">Contact Person</label>
                                                <input type="text" class="form-control" name="contactPerson" id="contactPerson" placeholder="Enter Contact Person" required>
                                            </div>
                                              
                                             
                                            
                                              <!-- phone mask -->
                                            <div class="form-group col-xs-3">
                                                <label>Contact Number</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-phone"></i>
                                                    </div>
                                                    <input type="text" name="contactNumber" id="contactNumber" class="form-control" data-inputmask='"mask": "(9999) 999-9999"' data-mask required>
                                                </div>
                                                <!-- /.input group -->
                                            </div>
                                              
                                           <div class="form-group col-xs-3">
                                                <label for="clientEmail">Client Email</label>
                                                <input type="text" class="form-control" name="clientEmail" id="clientEmail" placeholder="Enter Email" required>
                                            </div>
                                              
                                            <div class="form-group col-xs-3">
                                                <label for="clientAddress">Client Address</label>
                                                <input type="text" class="form-control" name="clientAddress" id="clientAddress" placeholder="Enter Address" required>
                                            </div>  
                                            
                                            <div class="form-group col-xs-2">
                                                <label>City</label>
                                                <select class="form-control select2" style="width: 100%;" name="clientCity" id="clientCity" required>
                                                    <option>City 1</option>
                                                    <option>City 2</option>
                                                    <option>City 3</option>
                                                    <option>City 4</option>
                                                    <option>City 5</option>
                                                </select>
                                            </div>  
                                              
                                            <div class="col-xs-2">
                                                <label>Number of Guards</label>
                                                <input type="number" min="1" max="99" class="form-control" name="numberOfGuards" id="numberOfGuards" placeholder="Enter Number of Guards" required>
                                            </div>  
                                     
                                               <div class="form-group col-xs-2">
                                                <label>City</label>
                                                <select class="form-control select2" style="width: 100%;" name="clientType" id="clientType" required>
                                                    <option>Basic</option>
                                                    <option>Bank</option>
                                                    <option>Mall</option>
                                                </select>
                                            </div>  
                                              <button type="submit" class="btn btn-primary" id="clientSubmit" onclick="checkFields()">Submit</button>
                                              
                                        </div>
                                        <!-- here-->

                                    </div>

                                </div>
                                <!-- PART 1 ADD CLIENT END-->   
                                
                                <!-- PART 2 CLIENT LIST START -->
                                <div id="ClientList" class="tab-pane">
                                    <div class="box box-info">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"><strong><u>II. Personal Characteristics</u></strong></h3>
                                        </div>

                                    </div>
                                </div>
                                <!-- PART 2 CLIENT LIST END -->
                            </div>
                        </form>
                                  
                                
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
                var clientName = document.getElementById('clientName').value;
                var contactPerson = document.getElementById('contactPerson').value;
                var contactNumber = document.getElementById('contactNumber').value;
                var email = document.getElementById('clientEmail').value;
                var address = document.getElementById('clientAddress').value;
                var city = document.getElementById('clientCity').value;
                var numberOfGuards = document.getElementById('numberOfGuards').value;
                var type = document.getElementById('clientType').value;
                
                
               

                if (clientName ==="" || contactPerson === "" || contactNumber === "" || email === "" || address === "" || city === ""
                        || numberOfGuards === "" || type === ""
                        ) {
                    alert("Complete All Details");

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
