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
        <title>Safeguard | Assessment Form</title>
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

                            <div class ="col-xs-12" align="center">
                                <div class="form-group" style="width: 50%;"
                                     <label>Client:</label>
                                    <select class="form-control select2" id="clientName" name="clientName">
                                    </select>
                                </div>
                            </div>

                            <div class="tab-content">
                                <form role="form" action="addEveryday" method="post">

                                    <div id="assigned" class="tab-pane active">
                                        <div class="control-sidebar-bg"></div>
                                        <section class="content">
                                            <div class="row">
                                                <div class="question">


                                                </div>
                                                <div class="col-xs-12"></div>
                                                <div class="col-xs-12" >
                                                    <button style=" display: table; margin: 0 auto;" type="submit" class="btn btn-primary" method="post" id="submitEveryday">Submit</button>
                                                </div>
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

    </body>
    <script src="js/assessmentform.js"></script>
</html>
