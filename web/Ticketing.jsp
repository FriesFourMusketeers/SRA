<%-- 
    Document   : blankpage
    Created on : Aug 24, 2016, 5:56:01 AM
    Author     : Eugene
--%>

<%@page import="entity.EmployeeSafeguardInfo"%>
<%@page import="java.util.Calendar"%>
<%@page import="entity.Client"%>
<%@page import="dao.ClientDAO"%>
<%@page import="entity.EmployeePersonalInfo"%>
<%@page import="dao.EmployeeDAO"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="entity.Ticket"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TicketDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file= "blankpage.jsp" %>
<html>
    <head>
        <title>Safeguard | Tickets</title>
        <!-- daterange picker -->
        <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
        <!-- DataTables -->
        <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">

        <script>
        function printContent(el){
        var restorepage = document.body.innerHTML;
        var printcontent = document.getElementById(el).innerHTML;
        document.body.innerHTML = printcontent;
        window.print();
        document.body.innerHTML = restorepage;
        }
        </script>

    </head>
    <body>
        <!-- Site wrapper -->
        <div class="wrapper"> <!-- Additional -->
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">

                <section class="content"> <!-- Additional -->
                    <div class="row"> <!-- Additional -->
                        <!-- Content Header (Page header) -->
                        <!-- TICKETS -->
                        <div class="box">
                            <div class="box-header">
                                <h3 class="box-title">Tickets</h3>
                            </div>

                            <!-- Modal ADD TICKET -->
                            <div class="container">
                                <!-- Trigger the modal with a button -->
                                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#AddTicket">Place New Ticket</button>
                                <!-- Modal -->
                                <div class="modal fade bs-example-modal-lg" tabindex="-1" id="AddTicket" role="dialog">
                                    <div class="modal-dialog modal-lg">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <form role="form" action="addTicket" method="post">
                                                <h3 style="display:none">                     

                                                </h3>
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">New Ticket</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <% TicketDAO ticketDao = new TicketDAO();
                                                        ArrayList<Ticket> ticketList = ticketDao.getAllTickets();
                                                        java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
                                                    %>

                                                    <div class="col-xs-2">
                                                        <label>Ticket ID</label>

                                                        <%if (ticketList != null && !ticketList.isEmpty()) {%>
                                                        <input type="text" class="form-control" disabled id="NewTicketID" name="NewTicketID" placeholder="TO<%=ticketList.get(ticketList.size() - 1).getTicketID() + 1%>">
                                                        <input type="hidden" name="TicketID" id="TicketID" value="<%=ticketList.get(ticketList.size() - 1).getTicketID() + 1%>"/>                                                
                                                        <% } else {%>
                                                        <input type="text" class="form-control" disabled id="NewTicketID" name="NewTicketID" placeholder="TO<%=ticketList.get(ticketList.size() - 1).getTicketID() + 1%>">
                                                        <input type="hidden" name="TicketID" id="TicketID" value="0"/>
                                                        <% }%>                                            
                                                    </div>
                                                    <div class="col-xs-2">
                                                        <label>Date Created</label>
                                                        <input type="text" class="form-control" disabled id="NewTicketDateCreated" name="NewTicketDateCreated" placeholder="<%=date%>">
                                                    </div>
                                                    <div class="form-group col-xs-2">
                                                        <label>Status</label>
                                                        <select class="form-control select2" id="TicketStatus" name="TicketStatus" disabled style="width: 100%;">
                                                            <option selected="selected" >*New</option>
                                                            <option>In Process</option>
                                                            <option>Resolved</option>
                                                            <option>Closed</option>
                                                        </select>
                                                        <input type="hidden" name="TicketStatus" value="*New"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <select class="form-control select2" style="width: 100%;"
                                                                id = 'TicketSubject2' name = 'TicketSubject' onchange = "if ($('#TicketSubject2').val() == 'others') {
                                                                            $('#TicketSubject').show();
                                                                        } else {
                                                                            $('#TicketSubject').hide();
                                                                        }">
                                                            <option>Attendance</option>
                                                            <option>Uniform</option>
                                                            <option>Manners</option>
                                                            <option value="others">Others</option>
                                                        </select>
                                                        <input type = 'text' name = 'TicketSubject' id = 'TicketSubject' style="display:none"/>
                                                    </div>
                                                    <div class="form-group col-xs-3">
                                                        <label>Client</label>
                                                        <% ClientDAO clientDAO = new ClientDAO();
                                                            ArrayList<Client> clientList = clientDAO.getAllClients();%>


                                                        <select class="form-control select2" style="width: 100%;"
                                                                id = 'Establishment' name = 'Establishment'>

                                                        </select>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label>Guard(s) Involved</label>

                                                            <select class="form-control select2" multiple="multiple" data-placeholder="Select Guard" id="GuardInvolved" name="GuardInvolved" style="width: 100%;">

                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!-- textarea -->
                                                    <div class="form-group col-xs-12">
                                                        <label>Details</label>
                                                        <textarea class="form-control" rows="3" id="NewTicketDetails" name="NewTicketDetails" placeholder="Enter Details"></textarea>
                                                    </div>


                                                    <div class="modal-footer pull-right-container" >
                                                        <span style="float:right;">
                                                            <button type="submit" method="post" class="btn btn-primary" id="NewTicketSubmit">Submit</button>
                                                        </span>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>            
                            </div>

                            <!-- Modal VIEW TICKET -->
                            <div class="container">
                                <!-- Modal -->
                                <form role="form" action="updateTicket" method="post">

                                    <% EmployeeDAO employeeDAO = new EmployeeDAO();
                                        ArrayList<EmployeePersonalInfo> employeeList = employeeDAO.getAllPersonalInfo(); %>

                                    <% for (int i = 0; i < ticketList.size(); i++) {%>
                                    <div class="modal fade bs-example-modal-lg" tabindex="-1" id="ViewTicket<%=+i%>" role="dialog">
                                        <div class="modal-dialog modal-lg">

                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">Ticket #TO<%=ticketList.get(i).getTicketID()%></h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="col-xs-2">
                                                        <label>Ticket ID</label>
                                                        <input type="text" class="form-control" name="ViewTicketID" disabled id="ViewTicketID" placeholder="TO<%=ticketList.get(i).getTicketID()%>">
                                                        <input type="hidden" name="ticketID" id="ticketID">
                                                    </div>
                                                    <div class="col-xs-2">
                                                        <label>Date Created</label>
                                                        <input type="text" class="form-control" name="ViewTicketDateCreated" disabled id="ViewTicketDateCreated" placeholder="<%= ticketList.get(i).getComplaintDate()%>">
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label>Subject</label>
                                                        <input type="text" class="form-control" name="ViewTicketSubject2" disabled id="ViewTicketSubject" placeholder="<%=ticketList.get(i).getSubject()%>" onchange = "if ($('#ViewTicketSubject2').val() == 'others') {
                                                                    $('#TicketSubject').show();
                                                                } else {
                                                                    $('#TicketSubject').hide();
                                                                }">
                                                        <input type = 'text' name = 'ViewTicketSubject' id = 'ViewTicketSubject' disabled style="display:none"/>

                                                    </div>
                                                    <div class="form-group col-xs-2">
                                                        <label>Status</label>
                                                        <select class="form-control select2" id="ViewTicketStatus" name="ViewTicketStatus" style="width: 100%;">
                                                            <%if (ticketList.get(i).getStatus().equalsIgnoreCase("*New")) {%>

                                                            <option value="*New"selected="selected">*New</option>
                                                            <option value="In Process">In Process</option>
                                                            <option value="Resolved">Resolved</option>
                                                            <option value="Closed">Closed</option>
                                                            <%}%>
                                                            <%if (ticketList.get(i).getStatus().equalsIgnoreCase("Action Taken")) {%>
                                                            <option value="*New"selected="selected">*New</option>
                                                            <option value="In Process">In Process</option>
                                                            <option value="Resolved">Resolved</option>
                                                            <option value="Closed">Closed</option>
                                                            <%}%>
                                                            <%if (ticketList.get(i).getStatus().equalsIgnoreCase("On-Going")) {%>
                                                            <option value="*New"selected="selected">*New</option>
                                                            <option value="In Process">In Process</option>
                                                            <option value="Resolved">Resolved</option>
                                                            <option value="Closed">Closed</option>
                                                            <%}%>
                                                            <%if (ticketList.get(i).getStatus().equalsIgnoreCase("Resolved")) {%>
                                                            <option value="*New"selected="selected">*New</option>
                                                            <option value="In Process">In Process</option>
                                                            <option value="Resolved">Resolved</option>
                                                            <option value="Closed">Closed</option>
                                                            <%}%>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-xs-3">
                                                        <label>Severity</label>
                                                        <select class="form-control select2" id="ViewTicketSeverity" name="ViewTicketSeverity" style="width: 100%;">

                                                            <%if (ticketList.get(i).getSeverity().equalsIgnoreCase("low")) {%>
                                                            <option class="label label-success" value="Low" selected="selected">Low</option>
                                                            <option class="label label-primary" value="Moderate">Moderate</option>
                                                            <option class="label label-warning" value="Major">Major</option>
                                                            <option class="label label-danger" value="Critical">Critical</option>
                                                            <%}%>

                                                            <%if (ticketList.get(i).getSeverity().equalsIgnoreCase("moderate")) {%>
                                                            <option class="label label-success" value="Low">Low</option>
                                                            <option class="label label-primary" value="Moderate" selected="selected">Moderate</option>
                                                            <option class="label label-warning" value="Major">Major</option>
                                                            <option class="label label-danger" value="Critical">Critical</option>
                                                            <%}%>

                                                            <%if (ticketList.get(i).getSeverity().equalsIgnoreCase("major")) {%>
                                                            <option class="label label-success" value="Low">Low</option>
                                                            <option class="label label-primary" value="Moderate">Moderate</option>
                                                            <option class="label label-warning" value="Major" selected="selected">Major</option>
                                                            <option class="label label-danger" value="Critical">Critical</option>
                                                            <%}%>

                                                            <%if (ticketList.get(i).getSeverity().equalsIgnoreCase("critical")) {%>
                                                            <option class="label label-success" value="Low">Low</option>
                                                            <option class="label label-primary" value="Moderate">Moderate</option>
                                                            <option class="label label-warning" value="Major">Major</option>
                                                            <option class="label label-danger" value="Critical" selected="selected">Critical</option>
                                                            <%}%>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-xs-3">
                                                        <label>Client</label>
                                                        <select class="form-control select2" disabled style="width: 100%;">
                                                            <option><<%=clientList.get(ticketList.get(i).getEstablishment()).getClientName()%></option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-xs-3">
                                                        <label>Guard(s)Involved</label>
                                                        <select class="form-control select2" disabled data-placeholder="Select Guard" style="width: 100%;">
                                                            <%if (ticketList != null && !ticketList.isEmpty()) {%>
                                                            <option><%=employeeList.get(ticketList.get(i).getGuardInvolved() - 1).getLastName()%>, <%=employeeList.get(ticketList.get(i).getGuardInvolved() - 1).getFirstName()%></option>
                                                            <% } else%>
                                                        </select>
                                                    </div>
                                                    <!-- textarea -->
                                                    <div class="form-group col-xs-12">
                                                        <label>Details</label>
                                                        <textarea class="form-control" disabled rows="3" id="ViewTicketDetails" placeholder="<%=ticketList.get(i).getComplaintDetails()%>"></textarea>
                                                    </div>
                                                    <!-- textarea -->
                                                    <div class="form-group col-xs-12">
                                                        <label>Action Taken</label>
                                                        <textarea class="form-control" rows="3" id="ViewTicketActionTaken"></textarea>
                                                    </div>
                                                    <div class="modal-footer pull-right-container hidden-print"  >
                                                        <span style="float:right;">
                                                            <button type="submit" class="btn btn-primary" method="post" id="ViewTicketUpdate">Update</button>
                                                        </span>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <% }%>
                                </form>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">



                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>Ticket ID</th>
                                            <th>Guard(s) Involved</th>
                                            <th>Subject</th>
                                            <th>Status</th>
                                            <th>Client</th>
                                            <th>Severity</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (int i = 0; i < ticketList.size(); i++) {
                                                if (ticketList != null && !ticketList.isEmpty()) {%>
                                        <tr class="table" data-target="#ViewTicket<%=+i%>" data-toggle="modal">
                                            <td class="table" style="display:none"><%=ticketList.get(i).getTicketID()%></td>
                                            <td>TO<%=ticketList.get(i).getTicketID()%></td>
                                            <td class="ap-id"><%=employeeList.get(ticketList.get(i).getGuardInvolved() - 1).getLastName()%>, <%=employeeList.get(ticketList.get(i).getGuardInvolved() - 1).getFirstName()%></td>
                                            <td><%=ticketList.get(i).getSubject()%></td>
                                            <td><span class="label label-danger"><%=ticketList.get(i).getStatus()%></span></td>
                                            <td><%=clientList.get(ticketList.get(i).getEstablishment()).getClientName()%></td>

                                            <%if (ticketList.get(i).getSeverity().equalsIgnoreCase("low")) {%>
                                            <td><span class="label label-success">Low</span></td>
                                            <%}%>

                                            <%if (ticketList.get(i).getSeverity().equalsIgnoreCase("moderate")) {%>
                                            <td><span class="label label-primary">Moderate</span></td>
                                            <%}%>

                                            <%if (ticketList.get(i).getSeverity().equalsIgnoreCase("major")) {%>
                                            <td><span class="label label-warning">Major</span></td>
                                            <%}%>

                                            <%if (ticketList.get(i).getSeverity().equalsIgnoreCase("critical")) {%>
                                            <td><span class="label label-danger">Critical</span></td>
                                            <%}%>

                                            <td><button onclick="printContent('ViewTicket<%=+i%>')" class="btn btn-primary" method="post" id="PrintTicket">Print</button></td>
                                            
                                        </tr>
                                        <% }
                                            }%>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Ticket ID</th>
                                            <th>Guard(s) Involved</th>
                                            <th>Subject</th>
                                            <th>Status</th>
                                            <th>Client</th>
                                            <th>Severity</th>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- /.box-body -->

                        </div>
                        <!-- /.box -->




                    </div> <!-- Additional -->
                </section> <!-- Additional -->
            </div>
            <!-- /.content-wrapper -->

        </div> <!-- Additional -->
        <!-- ./wrapper -->


        <!-- DataTables -->
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>

        <script src="/js/searchClientEmployees.js"></script>


        <script>
                                                            //Initialize Select2 Elements
                                                            $(".select2").select2();



                                                            var id = 0;

//                                                            $("tr.table").click(function () {
//                                                                var tableData = $(this).children("td").map(function () {
//                                                                    return $(this).text();
//                                                                }).get();
//
//                                                                document.getElementById("ticketID").innerHTML = $.trim(tableData[0]);
//                                                                document.getElementById("ticketID").value = $.trim(tableData[0]);
//
//                                                                alert(document.getElementById("ticketID").innerHTML);
//                                                            });

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