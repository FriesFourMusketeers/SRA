<%-- 
    Document   : blankpage
    Created on : Aug 23, 2016, 5:41:11 PM
    Author     : bryan
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="entity.TicketRecruitment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TicketDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file= "blankpage.jsp" %>
<html>
    <head>
        <title>Safeguard | Operations & VPO Dashboard</title>

        <!-- DataTables -->
        <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">

        <!--<script src="Highstock-5.0.3/code/js/highstock.js" type="text/javascript"></script>-->
        <!--<script src="Highstock-5.0.3/code/highcharts-3d.js" type="text/javascript"></script>-->
        <script src="Highcharts/highcharts.js"></script>
        <script src="Highcharts/modules/data.js"></script>
        <script src="Highcharts/modules/drilldown.js"></script>
        <script src="Highcharts/modules/exporting.js"></script>
        <script src="technical-indicators-master/technical-indicators.src.js" type="text/javascript"></script>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body> <!-- changed to plain body -->
        <!-- Site wrapper -->
        <div class="wrapper"> <!-- Additional -->
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">

                <section class="content"> <!-- Additional -->
                    <div class="row"> <!-- Additional -->
                        <div class="col-md-12">
                            <% TicketDAO ticket = new TicketDAO();
                                ArrayList<TicketRecruitment> newList = ticket.getNewTicketsDashboard();
                                int newCount = ticket.getNewTicketsDashboardDetails();
                                ArrayList<TicketRecruitment> actionTakenList = ticket.getActionTakenTicketsDashboard();
                                int actionTakenCount = ticket.getActionTakenTicketsDashboardDetails();
                                ArrayList<TicketRecruitment> onGoingList = ticket.getOnGoingTicketsDashboard();
                                int onGoingCount = ticket.getOnGoingTicketsDashboardDetails();
                                ArrayList<TicketRecruitment> resolvedList = ticket.getResolvedTicketsDashboard();
                                int resolvedCount = ticket.getResolvedTicketsDashboardDetails();
                            %>
                            <!-- Info Boxes Style 2 -->
                            <div class="box-body no-padding">
                                <ul class="users-list clearfix">
                                    <li>
                                        <div class="info-box bg-red">
                                            <span class="info-box-icon"><i class="fa fa-ticket"></i></span>

                                            <div class="info-box-content">
                                                <span class="info-box-text"><b>New Tickets</b></span>
                                                <a href="Ticketing.jsp">
                                                    <% for (TicketRecruitment tempList1 : newList) {%>
                                                    <span class="info-box-number"><font color="#000000"><%= tempList1.getCount()%></font></span>
                                                        <% }%>
                                                </a>
                                                <div class="progress">
                                                    <div class="progress-bar" style="width: 100%"></div>
                                                </div>
                                                <span class="progress-description">
                                                    <i>
                                                        <%=newCount%> ticket(s) increase in 30 Days
                                                    </i>
                                                </span>
                                            </div>

                                            <!-- /.info-box-content -->
                                        </div>
                                    </li>
                                    <li>
                                        <!-- /.info-box -->
                                        <div class="info-box bg-aqua">
                                            <span class="info-box-icon"><i class="glyphicon glyphicon-wrench"></i></span>

                                            <div class="info-box-content">
                                                <span class="info-box-text"><b>Action Taken</b></span>
                                                <a href="Ticketing.jsp">
                                                    <% for (TicketRecruitment tempList2 : actionTakenList) {%>
                                                    <span class="info-box-number"><font color="#000000"><%= tempList2.getCount()%></font></span>
                                                        <% }%>
                                                </a>
                                                <div class="progress">
                                                    <div class="progress-bar" style="width: 100%"></div>
                                                </div>
                                                <span class="progress-description">
                                                    <i>
                                                        <%=actionTakenCount%> ticket(s) for the past 30 Days
                                                    </i>
                                                </span>
                                            </div>
                                        </div>
                                        <!-- /.info-box-content --> 
                                    </li>
                                    <li>
                                        <!-- /.info-box -->
                                        <div class="info-box bg-orange">
                                            <span class="info-box-icon"><i class="glyphicon glyphicon-refresh"></i></span>

                                            <div class="info-box-content">
                                                <span class="info-box-text"><b>On-Going</b></span>
                                                <a href="Ticketing.jsp">
                                                    <% for (TicketRecruitment tempList3 : onGoingList) {%>
                                                    <span class="info-box-number"><font color="#000000"><%= tempList3.getCount()%></font></span>
                                                        <% }%>
                                                </a>
                                                <div class="progress">
                                                    <div class="progress-bar" style="width: 100%"></div>
                                                </div>
                                                <span class="progress-description">
                                                    <i>
                                                        <%=onGoingCount%> ticket(s) for the past 30 Days
                                                    </i>
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                    </li>
                                    <li>
                                        <!-- /.info-box -->
                                        <div class="info-box bg-gray">
                                            <span class="info-box-icon"><i class="fa fa-check-square-o"></i></span>

                                            <div class="info-box-content">
                                                <span class="info-box-text"><b>Resolved</b></span>
                                                <a href="Ticketing.jsp">
                                                    <% for (TicketRecruitment tempList4 : resolvedList) {%>
                                                    <span class="info-box-number"><font color="#000000"><%= tempList4.getCount()%></font></span>
                                                        <% }%>
                                                </a>
                                                <div class="progress">
                                                    <div class="progress-bar" style="width: 100%"></div>
                                                </div>
                                                <span class="progress-description">
                                                    <i>
                                                        <%=resolvedCount%> ticket(s) for the past 30 Days
                                                    </i>
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>


                        <div class="col-md-6">
                            <!-- LINE CHART -->
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Year</label>
                                        <select class="form-control" id="yearSelect">
                                            <option>2013</option>
                                            <option>2014</option>
                                            <option>2012</option>
                                        </select>
                                    </div>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-dismiss="modal" data-backdrop="static" data-target="#retrain">Retrain</button>
                                </div>
                                <div class="col-md-11" > 
                                    <div class="box box-info">
                                        <div class="box-header with-border">
                                            <div class="box-tools pull-right">
                                                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div>
                                        <div class="box-body no-padding" id="container"></div>
                                    </div>                                        

                                </div>


                            </div>


                        </div>
                        <div class="col-md-6">
                            <!-- BAR CHART -->
                            <div class="row">

                                <div class="col-md-11" > 
                                    <div class="box box-info">
                                        <div class="box-header with-border">
                                            <div class="box-tools pull-right">
                                                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div>
                                        <div class="box-body no-padding" id="clientBarChart"></div>
                                    </div>                                        

                                </div>


                            </div>



                        </div>
                        <!-- /.col (RIGHT) -->
                        <div class="col-md-6" align ="center">
                            <!-- DONUT CHART -->
                            <div class="box box-danger">
                                <div class="box-header with-border">

                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="box-body no-padding" id="licensePieChart"></div>
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

                        <div class="modal fade bs-example-modal-lg" id="retrain" role="dialog">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Employees (low scores)</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="box">
                                            <!-- /.box-header -->
                                            <div class="box-body">
                                                <table id="example1" class="table table-bordered table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>Assigned to</th>
                                                            <th>Grade</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Eugene See</td>
                                                            <td>Alabang Town Center</td>
                                                            <td>77</td>
                                                            <td><button type="button" class="btn btn-primary">Retrain</button></td>
                                                        </tr>
                                                    </tbody>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>Assigned to</th>
                                                            <th>Grade</th>
                                                            <th></th>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col (LEFT) -->
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


<script src="js/chartsDashboard.js" type="text/javascript"></script>

<script>
    $(document).ready(function () {
        var value = null;
        var recent = 0;
//                                        setInterval(ajaxCall, 1000); // sets how many milliseconds the notification updates
        ajaxCall();
        function ajaxCall() {
            $.ajax({
                url: "NotificationServlet",
                type: 'POST',
                dataType: "json",
                success: function (data) {
                    value = data;
                    console.log(JSON.stringify(data));
                    if (typeof Storage !== "undefined") {
                        if (sessionStorage.data) {
                            var recent = JSON.parse(sessionStorage.data);
                            if (sessionStorage.data !== JSON.stringify(data)) {
                                $("#value").html(Math.abs(data.length - recent.length));
                            } else {
                                //do nothing
                            }
                            sessionStorage.data = JSON.stringify(data);
                        } else {
                            sessionStorage.data = JSON.stringify(data);
                            $("#value").html(data.length);
                        }
                    }
                    $("#myDropdown").empty();
                    if (data.length === 0) {
                        $("#value").empty();
                        $("#value").append("");
                        $("#myDropdown").append('\
                                                <li class="padding2" style="text-align:center;">No Notifications</li>');
                    }

                    for (var i = 0; i < data.length; i++) {
                        $("#myDropdown").append('<hr/>');
                        $("#myDropdown").append('<li class="padding2"><a class="approved" style="text-decoration:none;">'
                                + '</a><br/><h6 class="p"> ' + data[i].message + '<br/>' + data[i].date + '</h6></li>');
                    }



                }, error: function (XMLHttpRequest, textStatus, exception) {
                    console.log(XMLHttpRequest.responseText);
                }
            });
        }
        $('body').on('click', 'a.approved', function () {
            var formName = $(this).text();
            if (formName === "Enrollment in Public School") {
                window.location.replace("Servletname?redirect=reportsLibrary");
            } else if (formName === "Enrollment in Private School") {
                window.location.replace("ServletAccess?redirect=reportsLibrary");
            }
        });
    });
</script>

<script>
    /* When the user clicks on the button,
     toggle between hiding and showing the dropdown content */
    function myFunction() {
        $("#value").empty();
        document.getElementById("myDropdown").classList.toggle("show");
    }
    function clearStorage() {
        sessionStorage.clear();
    }

// Close the dropdown if the user clicks outside of it
    window.onclick = function (event) {
        if (!event.target.matches('.dropbtn')) {
            var dropdowns = document.getElementsByClassName("dropdown-content");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    }
</script>



<script>
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
