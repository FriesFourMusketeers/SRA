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
        <title>Safeguard | SSER</title>
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
                                    <li class="active"><a href="#assigned" data-toggle="tab"></a></li>
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
                                                            <h3 class="box-title">Insert Client name Here</h3>
                                                        </div>
                                                        <!-- /.box-header -->
                                                        <div class="box-body">
                                                            <table id="example1" class="table table-bordered table-striped">
                                                                <thead>
                                                                    <tr>

                                                                        <th>Question</th>
                                                                        <th>Answer</th>


                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td><h5>Interest and Attention to Duty</h5></td>  
                                                                        <td>
                                                                            <label class="radio-inline">
                                                                                <input type="radio" name="optradio">1
                                                                            </label>
                                                                            <label class="radio-inline">
                                                                                <input type="radio" name="optradio">2
                                                                            </label>
                                                                            <label class="radio-inline">
                                                                                <input type="radio" name="optradio">3
                                                                            </label>
                                                                            <label class="radio-inline">
                                                                                <input type="radio" name="optradio">4
                                                                            </label>
                                                                            <label class="radio-inline">
                                                                                <input type="radio" name="optradio">5
                                                                            </label>
                                                                        </td>  
                                                                    </tr>
                                                                    
                                                                     <tr>
                                                                            <td><h5>Discipline</h5></td>  
                                                                            <td>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">1
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">2
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">3
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">4
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">5
                                                                                </label>
                                                                            </td>  
                                                                        </tr>

                                                                        <tr>
                                                                            <td><h5>Public Relations</h5></td>  
                                                                            <td>

                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">1
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">2
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">3
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">4
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">5
                                                                                </label>                                                      
                                                                            </td>  
                                                                        </tr>
                                                                        <tr>
                                                                            <td><h5>Personal Appearance</h5></td>  
                                                                            <td>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">1
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">2
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">3
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">4
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">5
                                                                                </label>
                                                                            </td>  
                                                                        </tr>

                                                                        <tr>
                                                                            <td><h5>Physical Fitness</h5></td>  
                                                                            <td>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">1
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">2
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">3
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">4
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">5
                                                                                </label>
                                                                            </td>  
                                                                        </tr>

                                                                        <tr>
                                                                            <td><h5>Knowledge of the Job</h5></td>  
                                                                            <td>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">1
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">2
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">3
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">4
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">5
                                                                                </label>                                                     
                                                                            </td>  
                                                                        </tr>
                                                                        <tr>
                                                                            <td><h5>Reliability and Efficiency</h5></td>  
                                                                            <td>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">1
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">2
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">3
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">4
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">5
                                                                                </label>
                                                                            </td>  
                                                                        </tr>

                                                                        <tr>
                                                                            <td><h5>Alertness</h5></td>  
                                                                            <td>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">1
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">2
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">3
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">4
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">5
                                                                                </label>
                                                                            </td>  
                                                                        </tr>

                                                                        <tr>
                                                                            <td><h5>Attendance and Punctuality</h5></td>  
                                                                            <td>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">1
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">2
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">3
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">4
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">5
                                                                                </label>                                                     
                                                                            </td>  
                                                                        </tr>
                                                                        <tr>
                                                                            <td><h5>Honesty and Integrity</h5></td>  
                                                                            <td>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">1
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">2
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">3
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">4
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">5
                                                                                </label>
                                                                            </td>  
                                                                        </tr>

                                                                        <tr>
                                                                            <td><h5>Common Sense</h5></td>  
                                                                            <td>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">1
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">2
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">3
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">4
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="optradio">5
                                                                                </label>
                                                                            </td>  
                                                                        </tr>
                                                                </tbody>
                                                                <tfoot>
                                                                    <tr>

                                                                        <th>Question</th>
                                                                        <th>Answer</th>

                                                                    </tr>
                                                                </tfoot>
                                                            </table>


                                                        </div>
                                                    </div>
                                                    <!-- /.box-body -->

                                                    <!-- /.box -->
                                                </div>


                                                <!-- /.box-body -->

                                                <!-- /.box -->
                                                <div class="col-xs-4"></div>
                                            <div class="col-xs-4" align="center">
                                                <button type="submit" class="btn btn-primary" method="post" id="submitEveryday">Submit</button>
                                            </div>

                                            <div class="col-xs-4"></div>
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

<!-- page script -->
<script>
    $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();
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
