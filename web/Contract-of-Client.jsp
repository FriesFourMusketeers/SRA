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
        <title>Safeguard | Contracts</title>
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
                            <section class="content-header">
                                <h1>
                                    Contracts
                                </h1>
                            </section>
                            <br />
                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#allclient" data-toggle="tab">All Clients</a></li>
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
                                                    <div class="box-header">
                                                        <h3 class="box-title">All Clients</h3>
                                                    </div>
                                                    <!-- /.box-header -->
                                                    <div class="box-body">
                                                        <table id="example1" class="table table-bordered table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>Client Name</th>
                                                                    <th>Client Area</th>
                                                                    <th>Contract Start</th>
                                                                    <th>Contract End </th>
                                                                    <th>Days Remaining</th>
                                                                    <th>Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>Alabang Town Center</td>
                                                                    <td>Muntinlupa
                                                                    </td>
                                                                    <td>10-11-2016</td>
                                                                    <td>10-11-2017</td>
                                                                    <td>365</td>
                                                                    <td>  <button type="submit" method="post" class="btn btn-primary" id="">Print   </button></td>

                                                                </tr>
                                                            </tbody>
                                                            <tfoot>
                                                                <tr>
                                                                    <th>Client Name</th>
                                                                    <th>Client Area</th>
                                                                    <th>Contract Start</th>
                                                                    <th>Contract End </th>
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
                                                    <div class="box-header">
                                                        <h3 class="box-title">Near Expiration (1 month left)</h3>
                                                    </div>
                                                    <!-- /.box-header -->
                                                    <div class="box-body">
                                                        <table id="example1" class="table table-bordered table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>Client Name</th>
                                                                    <th>Client Area</th>
                                                                    <th>Contract Start</th>
                                                                    <th>Contract End </th>
                                                                    <th>Days Remaining</th>
                                                                    <th>Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td><font color="#FFA500">Madison Gardens</font></td>
                                                                    <td>Muntinlupa
                                                                    </td>
                                                                    <td>10-11-2016</td>
                                                                    <td>10-11-2017</td>
                                                                    <td>365</td>
                                                                    <th><button type="button" class="btn btn-warning">Renew</button>
                                                                </tr>
                                                            </tbody>
                                                            <tfoot>
                                                                <tr>
                                                                    <th>Client Name</th>
                                                                    <th>Client Area</th>
                                                                    <th>Contract Start</th>
                                                                    <th>Contract End </th>
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
                                                        <table id="example1" class="table table-bordered table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>Client Name</th>
                                                                    <th>Client Area</th>
                                                                    <th>Contract Start</th>
                                                                    <th>Contract End </th>
                                                                    <th>Days Remaining</th>
                                                                    <th>Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td><font color="#FF0000">Festival Mall</font></td>
                                                                    <td>Muntinlupa
                                                                    </td>
                                                                    <td>10-11-2016</td>
                                                                    <td>10-11-2017</td>
                                                                    <td>365</td>
                                                                    <th><button type="button" class="btn btn-danger">Renew</button>
                                                                </tr>
                                                            </tbody>
                                                            <tfoot>
                                                                <tr>
                                                                    <th>Client Name</th>
                                                                    <th>Client Area</th>
                                                                    <th>Contract Start</th>
                                                                    <th>Contract End </th>
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
            var table = $('#example1').DataTable();
                
                 $(function () {
                    $("#example1").DataTable();
                    $('#example2').DataTable({
                        "paging": true,
                        "lengthChange": false,
                        "searching": true,
                        "ordering": true,
                        "info": true,
                        "autoWidth": false,
                        "scrollX": true
                    });
                });
            
            $(function () {
                //Initialize Select2 Elements
                $(".select2").select2();
            });
        </script>
    </body>
</html>
