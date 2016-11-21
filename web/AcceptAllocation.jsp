<%-- 
    Document   : AcceptAllocation
    Created on : Nov 2, 2016, 1:16:34 PM
    Author     : bryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file= "blankpage.jsp" %>
<html>
    <head>
        <title>Safeguard | Accept Allocation</title>

        <link rel="stylesheet" href="dist/css/addapplicant.css">
        <!-- DataTables -->
        <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
        
        <script>
        function printContent(el){
        var restorepage = document.body.innerHTML;
        var printcontent = document.getElementById(el).innerHTML;
//        $('#example2').DataTable({
//                    "paging": false,
//                    "lengthChange": false,
//                    "searching": false,
//                    "ordering": false,
//                    "info": false,
//                    "autoWidth": false
//                });
        document.body.innerHTML = printcontent;
        window.print();
        document.body.innerHTML = restorepage;
        }
        </script>

    </head>
    <body>
        <div class="wrapper"> <!-- Additional -->
            <!-- Site wrapper -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content"> <!-- Additional -->
                    <div class="row"> <!-- Additional -->

                        <div class="box box-info">
                            <section class="content-header">
                                <h1>
                                    Employee list
                                </h1>
                            </section>
                            <br />


                            <!-- Main content -->

                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Assigned Employees</h3>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <table id="example2" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>

                                                <th>Allocation #</th>
                                                <th>Client</th>
                                                <th>No. of Guards</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>     
                                            <tr  class="table" data-target="#ViewAssigned" data-toggle="modal">
                                                <td>1</td>
                                                <td>Alabang Town Center
                                                </td>
                                                <td>25</td>
                                                <td><button onclick="printContent('ViewAssigned')" class="btn btn-primary" method="post" id="PrintAllocation" style="float: right">Print</button></td>
                                                <td><button type="submit" class="btn btn-primary" id="SubmitAllocation">Accept</button>   </td>

                                            </tr>

                                        </tbody>
                                        <tfoot>
                                            <tr>

                                                <th>Allocation #</th>
                                                <th>Client</th>
                                                <th>No. of Guards</th>
                                                <th></th>

                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>

                            </div>

                            <!-- /.col -->
                        </div>

                        <div class="container">
                            <!-- Modal -->


                            <div class="modal fade bs-example-modal-lg" tabindex="-1" id="ViewAssigned" role="dialog">
                                <div class="modal-dialog modal-lg">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">List of Guards</h4>
                                        </div>
                                        <div class="modal-body">

                                            <table id="example1" class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>Guard Name</th>
                                                        <th>Position</th>
                                                        <th>Grade</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Bryan Talaban</td>
                                                        <td>Roving</td>
                                                        <td>99</td>                                   
                                                    </tr>
                                                    <tr>
                                                        <td>Eugene See</td>
                                                        <td>OIC</td>
                                                        <td>69</td>                                   
                                                    </tr>
                                                    <tr>
                                                        <td>John San Agustin</td>
                                                        <td>Entrance</td>
                                                        <td>99</td>                                   
                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>Guard Name</th>
                                                        <th>Position</th>
                                                        <th>Grade</th>
                                                        <th></th>
                                                    </tr>
                                                </tfoot>
                                            </table>


                                            <!-- textarea -->                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>




                    </div> <!-- Additional -->
                </section> <!-- Additional -->
            </div>
            <!-- ./wrapper -->

        </div> <!-- Additional -->


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
