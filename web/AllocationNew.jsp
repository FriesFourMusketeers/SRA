<%-- 
    Document   : AcceptAllocation
    Created on : Nov 2, 2016, 1:16:34 PM
    Author     : bryan
--%>

<%@page import="entity.TicketRecruitment"%>
<%@page import="dao.TicketDAO"%>
<%@page import="entity.Client"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.EmployeeDAO"%>
<%@page import="dao.ClientDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file= "blankpage.jsp" %>
<html>
    <head>
        <title>Safeguard | Allocation</title>

        <!-- DataTables -->
        <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
        <!-- daterange picker -->
        <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">

    </head>
    <body>
        <div class="wrapper"> <!-- Additional -->
            <!-- Site wrapper -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content"> <!-- Additional -->
                    <div class="row"> <!-- Additional -->
                        <div class="box box-info">
                            <!-- Content Header (Page header) -->
                            <section class="content-header">
                                <% TicketDAO ticket = new TicketDAO();
                                    ArrayList<TicketRecruitment> templist = ticket.getMostComplained();
                                    ArrayList<TicketRecruitment> ticketList = ticket.getFilteredComplaints(templist, 3);
                                %>
                                <% for (TicketRecruitment tempList1 : ticketList) {%>
                                <div class="col-xs-12">
                                    <label><big><i>*Allocate better in the field of <%= tempList1.getSubject()%> </i></big></label>
                                </div>
                                <% } %>
                                <h1 align="center">
                                    Allocation
                                </h1>
                            </section>
                            <br />
                            <form role="form" action="addAllocation" method="post">

                                <!-- Main content -->
                                <div class ="col-xs-4"></div>

                                <div class ="col-xs-4" align="center">
                                    <div class="form-group">
                                        <label>Client</label>
                                        <% ClientDAO clientDAO = new ClientDAO();
                                            ArrayList<Client> clientList = clientDAO.getNoAllocationClients();%>

                                        <select class="form-control select2" id="Establishment" name="Establishment" style="width: 100%;">
                                            <% for (int i = 0; i < clientList.size(); i++) {%>
                                            <option value="<%=clientList.get(i).getClientID()%>">  <%=clientList.get(i).getClientName()%></option>
                                            <% }%>
                                        </select>
                                    </div>
                                </div>

                                <div class ="col-xs-4"></div>

                                <div class ="col-xs-12">
                                    <h3>Specifications:</h3>
                                </div>



                                <section class="content">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="box">

                                                <div class="box">
                                                    <div class="box-header">
                                                        <h3 class="box-title">Data Table With Full Features</h3>
                                                    </div>
                                                    <!-- /.box-header -->
                                                    <table border="0" cellspacing="5" cellpadding="5">
                                                        <tbody><tr>
                                                                <td>Minimum age:</td>
                                                                <td><input type="text" id="minAge" name="minAge">
                                                                    <input type="hidden" name="applicantID" id="applicantID">
                                                                    <input type="hidden" name="employeeArrayHTML" id="employeeArrayHTML"></td>
                                                                <td>Maximum age:</td>
                                                                <td><input type="text" id="maxAge" name="maxAge"></td>
                                                            </tr>

                                                            <tr>
                                                                <td>Minimum Height:</td>
                                                                <td><input type="text" id="minHeight" name="minHeight"></td>
                                                                <td>Maximum Height:</td>
                                                                <td><input type="text" id="maxHeight" name="maxHeight"></td>
                                                            </tr>

                                                            <tr>
                                                                <td>Minimum Weight:</td>
                                                                <td><input type="text" id="minWeight" name="minWeight"></td>
                                                                <td>Maximum Weight:</td>
                                                                <td><input type="text" id="maxWeight" name="maxWeight"></td>
                                                            </tr>

                                                        </tbody>
                                                    </table>



                                                    <table id="example1" class="table table-bordered table-striped display nowrap" cellspacing="0" width="100%" >
                                                        <thead>
                                                            <tr>
                                                                <th width="1%">ID</th>
                                                                <th>Name</th>
                                                                <th>City</th>
                                                                <th>Education</th>
                                                                <th>Age</th>
                                                                <th>Height</th>
                                                                <th>Weight</th>
                                                                <th>Body Build</th>
                                                                <th>Skin Complexion</th>
                                                                <th>Marital Status</th>
                                                                <th>Grade</th>
                                                                <th>License</th>


                                                            </tr>
                                                        </thead>
                                                        <tfoot>
                                                            <tr>
                                                                <th width="1%">ID</th>
                                                                <th>Name</th>
                                                                <th>City</th>
                                                                <th>Education</th>
                                                                <th>Age</th>
                                                                <th>Height</th>
                                                                <th>Weight</th>
                                                                <th>Body Build</th>
                                                                <th>Skin Complexion</th>
                                                                <th>Marital Status</th>
                                                                <th>Grade</th>
                                                                <th>License</th>

                                                            </tr>
                                                        </tfoot>
                                                        <tbody>
                                                            <% EmployeeDAO personalInfo = new EmployeeDAO();%>
                                                            <% for (int i = 0; i < personalInfo.getAllUnallocated().size(); i++) {%>
                                                            <tr class="table" width="100%">


                                                                <td class="table""><%=personalInfo.getAllUnallocated().get(i).getEmployeeID()%></td>            
                                                                <td class="table"><%=personalInfo.getAllUnallocated().get(i).getLastName() + ", " + personalInfo.getAllUnallocated().get(i).getFirstName()%></td>   
                                                                <td class="table"><%=personalInfo.getAllUnallocated().get(i).getCity()%></td>
                                                                <td class="table"><%=personalInfo.getAllUnallocated().get(i).getEducation()%></td> 
                                                                <td class="table"><%=personalInfo.getAllUnallocated().get(i).getAge()%></td>
                                                                <td class="table"><%=personalInfo.getAllUnallocated().get(i).getHeight()%></td>  
                                                                <td class="table"><%=personalInfo.getAllUnallocated().get(i).getWeight()%></td>  
                                                                <td class="table"><%=personalInfo.getAllUnallocated().get(i).getBodyBuild()%></td>  
                                                                <td class="table"><%=personalInfo.getAllUnallocated().get(i).getSkinColor()%></td> 
                                                                <td class="table"><%=personalInfo.getAllUnallocated().get(i).getMarriageStatus()%></td>
                                                                <td class="table">90</td>  
                                                                <td class="table"><%=personalInfo.getAllUnallocated().get(i).getLicenseType()%></td>  


                                                                <%};%>
                                                            </tr>
                                                        </tbody>

                                                    </table>

                                                </div>
                                                <!-- /.box-body -->
                                            </div>
                                            <!-- /.box -->
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                    <!-- /.row -->
                                </section>

                                <div class="box-footer">

                                    <div class="col-md-4"><button type="submit" class="btn btn-primary">Allocate</button></div>

                                </div>
                            </form>
                        </div>
                        <div class="container">
                            <!-- Modal -->


                            <div class="modal fade bs-example-modal-lg" tabindex="-1" id="ViewTicket" role="dialog">
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
            });
        </script>

        <!-- page script -->
        <script>
            var employeeArray = [];

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

            //SEARCH BARS
            $(document).ready(function () {
//    
                // Setup - add a text input to each footer cell
                $('#example1 tfoot th').each(function () {
                    var title = $(this).text();
                    $(this).html('<input type="text" placeholder="Search ' + title + '" />');
                });




                // Apply the search
                table.columns().every(function () {
                    var that = this;

                    $('input', this.footer()).on('keyup change', function () {

                        if (that.search() !== this.value) {
                            that
                                    .search(this.value)
                                    .draw();
                        }
                    });
                });


            });

            //MIN & MAX SEARCH
            $.fn.dataTable.ext.search.push(
                    function (settings, data, dataIndex) {
                        var minAge = parseInt($('#minAge').val(), 10);
                        var maxAge = parseInt($('#maxAge').val(), 10);
                        var age = parseFloat(data[4]) || 0; // use data for the age column

                        if ((isNaN(minAge) && isNaN(maxAge)) ||
                                (isNaN(minAge) && age <= maxAge) ||
                                (minAge <= age && isNaN(maxAge)) ||
                                (minAge <= age && age <= maxAge))
                        {
                            return true;
                        }
                        return false;
                    }

            );
            $.fn.dataTable.ext.search.push(
                    function (settings, data, dataIndex) {
                        var minHeight = parseInt($('#minHeight').val(), 10);
                        var maxHeight = parseInt($('#maxHeight').val(), 10);
                        var height = parseFloat(data[5]) || 0; // use data for the age column

                        if ((isNaN(minHeight) && isNaN(maxHeight)) ||
                                (isNaN(minHeight) && height <= maxHeight) ||
                                (minHeight <= height && isNaN(maxHeight)) ||
                                (minHeight <= height && height <= maxHeight))
                        {
                            return true;
                        }
                        return false;
                    }
            );

            $.fn.dataTable.ext.search.push(
                    function (settings, data, dataIndex) {
                        var minWeight = parseInt($('#minWeight').val(), 10);
                        var maxWeight = parseInt($('#maxWeight').val(), 10);
                        var weight = parseFloat(data[6]) || 0; // use data for the age column

                        if ((isNaN(minWeight) && isNaN(maxWeight)) ||
                                (isNaN(minWeight) && weight <= maxWeight) ||
                                (minWeight <= weight && isNaN(maxWeight)) ||
                                (minWeight <= weight && weight <= maxWeight))
                        {
                            return true;
                        }
                        return false;
                    }
            );

            $(document).ready(function () {
                var table = $('#example1').DataTable();

                // Event listener to the two range filtering inputs to redraw on input
                $('#minAge, #maxAge').keyup(function () {
                    table.draw();
                });

            });
            $(document).ready(function () {
                var table = $('#example1').DataTable();

                // Event listener to the two range filtering inputs to redraw on input
                $('#minHeight, #maxHeight').keyup(function () {
                    table.draw();
                });

            });
            $(document).ready(function () {
                var table = $('#example1').DataTable();

                // Event listener to the two range filtering inputs to redraw on input
                $('#minWeight, #maxWeight').keyup(function () {
                    table.draw();
                });

            });

//                



            //GET VALLUE 
            $("tr.table").click(function () {

                function removeItem(array, item) {
                    for (var i in array) {
                        if (array[i] === item) {
                            array.splice(i, 1);
                            break;
                        }
                    }
                }

                var tableData = $(this).children("td").map(function () {
                    return $(this).text();
                }).get();
                if (!($(this).hasClass('selected'))) {
                    $(this).addClass('selected');
                    employeeArray.push($.trim(tableData[0]));
                } else if ($(this).hasClass('selected')) {
                    $(this).removeClass('selected');
                    removeItem(employeeArray, $.trim(tableData[0]));
                }


                document.getElementById("employeeArrayHTML").value = employeeArray;


            });




        </script>

    </body>
</html>
