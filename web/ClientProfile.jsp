<%-- 
    Document   : blankpage
    Created on : Aug 24, 2016, 5:56:01 AM
    Author     : Eugene
--%>

<%@page import="entity.Client"%>
<%@page import="entity.Charts"%>
<%@page import="dao.EmployeeDAO"%>
<%@page import="entity.EmployeePhysicalInfo"%>
<%@page import="entity.EmployeeJobInfo"%>
<%@page import="entity.EmployeePersonalInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file= "blankpage.jsp" %>
<html>
    <head>
        <title>Safeguard | Client Profile</title>

        <!-- DataTables -->
        <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">

        <script src="Highcharts/highcharts.js"></script>
        <script src="Highcharts/modules/data.js"></script>
        <script src="Highcharts/modules/drilldown.js"></script>
        <script src="Highcharts/modules/exporting.js"></script>
        <script src="technical-indicators-master/technical-indicators.src.js" type="text/javascript"></script>
    </head>
    <body>
        <!-- Site wrapper -->


        <% EmployeeDAO clientEmployeeList = new EmployeeDAO();%>

        <!-- =============================================== -->

        <div class="wrapper"> <!-- Additional -->
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">

                <section class="content"> <!-- Additional -->
                    <div class="row"> <!-- Additional -->
                        <!-- Content Header (Page header) -->
                        <div id="content" class="clearfix">


                            <h1 align="center">BDO</h1>


                            <div class="col-md-12 col-sm-12 col-xs-12 profile_details">
                                <div class="box-body">
                                    <div class="nav-tabs-custom">
                                        <ul class="nav nav-tabs">
                                            <li class="active"><a href="#Grade" data-toggle="tab">Grade</a></li>
                                            <li><a href="#EmployeeList" data-toggle="tab">Employee List</a></li>
                                            <li><a href="#AllocationCriteria" data-toggle="tab">Allocation Criteria</a></li>
                                            <li><a href="#ScannedAllocation" data-toggle="tab">Scanned Allocation</a></li>
                                            <li><a href="#SLA" data-toggle="tab">SLA</a></li>
                                        </ul>
                                    </div>

                                    <div class="tab-content">
                                        <div id="Grade" class="tab-pane active">
                                            <!-- /.control-sidebar -->
                                            <!-- Add the sidebar's background. This div must be placed
                                                 immediately after the control sidebar -->
                                            <div class="control-sidebar-bg"></div>
                                            <div class="box box-info">
                                                <!-- /.box-header -->
                                                <!-- form start -->
                                                <div class="box-body">

                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label>Year</label>
                                                            <select class="form-control" id="yearSelect">
                                                                <option>2013</option>
                                                                <option>2014</option>
                                                                <option>2015</option>
                                                                <option>2016</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <% String clientID = (String) request.getAttribute("clientID");%>
                                                    <input type="text" value = "<%=clientID%>" id = "clientID">
                                                    <div class="col-md-11" > 

                                                        <div class="box-body no-padding" id="clientGrade"></div>

                                                    </div>
                                                    <div class="col-md-11" > 
                                                        <div class="box-body no-padding" id="employeePie"></div>
                                                    </div>
                                                </div>
                                                <!-- here-->
                                            </div>
                                        </div>
                                        <!-- PART 1 Grade END-->    

                                        <!-- PART 2 Employee List START -->
                                        <div id="EmployeeList" class="tab-pane">
                                            <div class="box box-info">

                                                <section class="content">
                                                    <div class="row">
                                                        <div class="col-xs-12">


                                                            <div class="box">
                                                                <div class="box-header">
                                                                    <h3 class="box-title">Assigned Employees</h3>
                                                                </div>
                                                                <!-- /.box-header -->
                                                                <div class="box-body">
                                                                    <table id="example1" class="table table-bordered table-striped">
                                                                        <thead>
                                                                            <tr>

                                                                                <th>Name</th>
                                                                                <th>Area</th>
                                                                                <th>Height</th>
                                                                                <th>Weight </th>
                                                                                <th>Body Build</th>
                                                                                <th>Skin Complexion</th>
                                                                                <th>Type of License</th>
                                                                                <th>Assigned to</th>
                                                                                <th>Position</th>
                                                                                <th>Grade</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>

                                                                            <% for (int i = 0; i < clientEmployeeList.getAllAllocatedByClientID(Integer.parseInt(request.getParameter("clientID"))).size(); i++) {%>

                                                                            <tr>
                                                                                <td><a href="viewEmployeeProfile?id=<%=clientEmployeeList.getAllAllocatedByClientID(Integer.parseInt(request.getParameter("clientID"))).get(i).getEmployeeID()%>"><%=clientEmployeeList.getAllAllocatedByClientID(Integer.parseInt(request.getParameter("clientID"))).get(i).getFirstName() + " " + clientEmployeeList.getAllAllocatedByClientID(Integer.parseInt(request.getParameter("clientID"))).get(i).getLastName()%></a></td>
                                                                                <td><%=clientEmployeeList.getAllAllocatedByClientID(Integer.parseInt(request.getParameter("clientID"))).get(i).getCity()%>
                                                                                </td>
                                                                                <td><%=clientEmployeeList.getAllAllocatedByClientID(Integer.parseInt(request.getParameter("clientID"))).get(i).getHeight()%></td>
                                                                                <td><%=clientEmployeeList.getAllAllocatedByClientID(Integer.parseInt(request.getParameter("clientID"))).get(i).getWeight()%></td>
                                                                                <td><%=clientEmployeeList.getAllAllocatedByClientID(Integer.parseInt(request.getParameter("clientID"))).get(i).getBodyBuild()%></td>
                                                                                <td><%=clientEmployeeList.getAllAllocatedByClientID(Integer.parseInt(request.getParameter("clientID"))).get(i).getSkinColor()%></td>
                                                                                <td><%=clientEmployeeList.getAllAllocatedByClientID(Integer.parseInt(request.getParameter("clientID"))).get(i).getLicense()%></td>
                                                                                <td><%=clientEmployeeList.getAllAllocatedByClientID(Integer.parseInt(request.getParameter("clientID"))).get(i).getAssignedTo()%> </td>
                                                                                <td>what position</td>
                                                                                <td>grade</td>



                                                                            </tr>
                                                                            <%};%>
                                                                        </tbody>
                                                                        <tfoot>
                                                                            <tr>

                                                                                <th>Name</th>
                                                                                <th>Area</th>
                                                                                <th>Height</th>
                                                                                <th>Weight </th>
                                                                                <th>Body Build</th>
                                                                                <th>Skin Complexion</th>
                                                                                <th>Type of License</th>
                                                                                <th>Assigned to</th>
                                                                                <th>Position</th>
                                                                                <th>Grade</th>
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
                                        <!-- PART 2 Employee List END -->

                                        <!-- PART 3 Allocation Criteria START-->
                                        <div id="AllocationCriteria" class="tab-pane">
                                            <!-- /.control-sidebar -->
                                            <!-- Add the sidebar's background. This div must be placed
                                                 immediately after the control sidebar -->
                                            <div class="control-sidebar-bg"></div>
                                            <div class="box box-info">
                                                <!-- /.box-header -->
                                                <!-- form start -->
                                                <div class="box-body">
                                                    <div class="form-group col-xs-3">
                                                        <label>Minimum Age</label>
                                                        <input type="number" min="0" max="99" class="form-control" name="ageMinCriteria" id="ageMinCriteria" placeholder="Enter Minimum Age"  disabled> 
                                                    </div>

                                                    <div class="form-group col-xs-3">
                                                        <label>Maximum Age</label>
                                                        <input type="number" min="0" max="99" class="form-control" name="ageMaxCriteria" id="ageMaxCriteria" placeholder="Enter Maximum Age"  disabled>
                                                    </div>

                                                    <div class="form-group col-xs-3">
                                                        <label>Minimum Height</label>

                                                        <input type="number" name="heightMinCriteria" class="form-control" id="heightMinCriteria" placeholder="Enter Minimum Height (cm)"  disabled> 


                                                    </div>

                                                    <div class="form-group col-xs-3">
                                                        <label>Maximum Height</label>

                                                        <input type="number" name="heightMaxCriteria" class="form-control" id="heightMaxCriteria" placeholder="Enter Maximum Height(cm)"  disabled> 
                                                    </div>

                                                    <div class="form-group col-xs-3">
                                                        <label>Minimum Weight</label>

                                                        <input type="number" name="weightMinCriteria" class="form-control" id="weightMinCriteria" placeholder="Enter Minimum Weight (kg)"  disabled> 
                                                    </div>

                                                    <div class="form-group col-xs-3">
                                                        <label>Maximum Weight</label>

                                                        <input type="number" name="weightMaxCriteria" class="form-control" id="weightMaxriteria" placeholder="Enter Maximum Weight (kg)"  disabled> 
                                                    </div>

                                                    <div class="form-group col-xs-3">
                                                        <label>Minimum Grade</label>

                                                        <input type="number" min="0" max="100" class="form-control" name="gradeMinCriteria" id="gradeMinCriteria" placeholder="Enter Minimum Grade"  disabled>

                                                    </div>

                                                    <div class="form-group col-xs-3">
                                                        <label>Maximum Grade</label>

                                                        <input type="number" min="0" max="100" class="form-control" name="gradeMaxCriteria" id="gradeMaxCriteria" placeholder="Enter Maximum Grade"  disabled>
                                                    </div>

                                                    <div class="form-group col-xs-2">
                                                        <label>City</label>
                                                        <select class="form-control select2" style="width: 100%;" name="cityCriteria" id="cityCriteria"  disabled>
                                                            <option>City 1</option>
                                                            <option>City 2</option>
                                                            <option>City 3</option>
                                                            <option>City 4</option>
                                                            <option>City 5</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-group col-xs-2">
                                                        <label>Sex</label>
                                                        <select class="form-control select2" style="width: 100%;" name="sexCriteria" id="sexCriteria"  disabled>
                                                            <option>Male</option>
                                                            <option>Female</option>
                                                            <option>Either</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-group col-xs-2">
                                                        <label>Status</label>
                                                        <select class="form-control select2" style="width: 100%;" name="marriageStatusCriteria" id="marriageStatusCriteria"  disabled>
                                                            <option>Single</option>
                                                            <option>Married</option>
                                                            <option>Divorced</option>
                                                            <option>Widowed</option>
                                                            <option>Single or Married</option>
                                                            <option>Any</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-group col-xs-2">
                                                        <label>Body Build</label>
                                                        <select class="form-control select2" style="width: 100%;" name="bodyBuildCriteria" id="bodyBuildCriteria"  disabled>
                                                            <option>Light</option>
                                                            <option>Medium</option>
                                                            <option>Heavy</option>
                                                            <option>Any</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-group col-xs-2">
                                                        <label>Skin Complexion</label>
                                                        <select class="form-control select2" style="width: 100%;" name="skinComplexionCriteria" id="skinComplexionCriteria"  disabled> 
                                                            <option>Dark</option>
                                                            <option>Fair</option>
                                                            <option>Light</option>
                                                            <option>Any</option>
                                                        </select>
                                                    </div>



                                                    <div class="form-group col-xs-12" align="right">
                                                        <button type="submit" class="btn btn-primary" id="clientCriteriaUpdate" data-target="#CriteriaModal" data-toggle="modal">Edit Preferences</button>
                                                    </div>



                                                </div>
                                                <!-- here-->
                                            </div>
                                        </div>
                                        <!-- PART 3 Allocation Criteria END-->

                                        <!-- PART 4 Scanned Allocation START-->
                                        <div id="ScannedAllocation" class="tab-pane">
                                            <!-- /.control-sidebar -->
                                            <!-- Add the sidebar's background. This div must be placed
                                                 immediately after the control sidebar -->
                                            <div class="control-sidebar-bg"></div>
                                            <div class="box box-info">
                                                <!-- /.box-header -->
                                                <!-- form start -->
                                                <div class="box-body">



                                                </div>
                                                <!-- here-->
                                            </div>
                                        </div>
                                        <!-- PART 4 Scanned Allocation END-->

                                        <!-- PART 5 SLA START-->
                                        <div id="SLA" class="tab-pane">
                                            <!-- /.control-sidebar -->
                                            <!-- Add the sidebar's background. This div must be placed
                                                 immediately after the control sidebar -->
                                            <div class="control-sidebar-bg"></div>
                                            <div class="box box-info">
                                                <!-- /.box-header -->
                                                <!-- form start -->
                                                <div class="box-body">



                                                </div>
                                                <!-- here-->
                                            </div>
                                        </div>
                                        <!-- PART 5 SLA END-->
                                    </div>

                                </div>
                            </div>


                        </div><!-- @end #content -->
                        <div class="container">



                            <div class="modal fade bs-example-modal-lg" tabindex="-1" id="CriteriaModal" role="dialog" name="CriteriaModal">
                                <div class="modal-dialog modal-lg">

                                    <!-- Modal content-->
                                    <div class="modal-content">

                                        <div class="modal-header">
                                            <div class="modal-body">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <!-- START TABS -->
                                                <h2 class="page-header"></h2>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <!-- Custom Tabs -->
                                                        <div class="nav-tabs-custom">

                                                            <ul class="nav nav-tabs">
                                                                <li class="active"><a href="#ClientCriteria" data-toggle="tab">Data</a></li>
                                                            </ul>
                                                            <!-- /.tab-pane -->
                                                            <div class="tab-content">
                                                                <div class="tab-pane active" id="ClientCriteria">
                                                                    <table class="table table-striped" id="tblGrid">
                                                                        <thead id="tblHead">
                                                                            <tr>
                                                                                <th class="text-left">Category</th>
                                                                                <th class="text-left">Value</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                
                                                                                <td class="text-left">Minimum Age:</td>
                                                                                <td class="text-left"><input type="number" min="0" max="99" class="form-control" name="ageMinCriteria" id="ageMinCriteria" placeholder="Enter Minimum Age" required > </td>

                                                                            </tr>

                                                                            <tr><td class="text-left">Maximum Age:</td>
                                                                                <td class="text-left"><input type="number" min="0" max="99" class="form-control" name="ageMaxCriteria" id="ageMaxCriteria" placeholder="Enter Maximum Age" required ></td>

                                                                            </tr>
                                                                            <tr><td class="text-left">Minimum Height:</td>
                                                                                <td class="text-left"> <input type="number" name="heightMinCriteria" class="form-control" id="heightMinCriteria" placeholder="Enter Minimum Height (cm)" required > </td>

                                                                            </tr>
                                                                            <tr><td class="text-left">Maximum Height</td>
                                                                                <td class="text-left"><input type="number" name="heightMaxCriteria" class="form-control" id="heightMaxCriteria" placeholder="Enter Maximum Height(cm)" required > </td>

                                                                            </tr>
                                                                            <tr><td class="text-left">Minimum Weight</td>
                                                                                <td class="text-left"><input type="number" name="weightMinCriteria" class="form-control" id="weightMinCriteria" placeholder="Enter Minimum Weight (kg)" required > </td>

                                                                            </tr>
                                                                            <tr><td class="text-left">Maximum Weight</td>
                                                                                <td class="text-left"><input type="number" name="weightMaxCriteria" class="form-control" id="weightMaxriteria" placeholder="Enter Maximum Weight (kg)" required > </td>

                                                                            </tr>
                                                                            <tr><td class="text-left">Minimum Grade:</td>
                                                                                <td class="text-left">    <input type="number" min="0" max="100" class="form-control" name="gradeMinCriteria" id="gradeMinCriteria" placeholder="Enter Minimum Grade" required ></td>

                                                                            </tr>
                                                                            <tr><td class="text-left">Maximum Grade:</td>
                                                                                <td class="text-left"><input type="number" min="0" max="100" class="form-control" name="gradeMaxCriteria" id="gradeMaxCriteria" placeholder="Enter Maximum Grade" required ></td>

                                                                            </tr>
                                                                            <tr>
                                                                                <td class="text-left">City</td>
                                                                                <td class="text-left">
                                                                                    <select class="form-control select2" style="width: 100%;" name="cityCriteria" id="cityCriteria"  required>
                                                                                        <option>City 1</option>
                                                                                        <option>City 2</option>
                                                                                        <option>City 3</option>
                                                                                        <option>City 4</option>
                                                                                        <option>City 5</option>
                                                                                    </select>
                                                                                </td>

                                                                            </tr>
                                                                            <tr>
                                                                                <td class="text-left">Sex</td>
                                                                                <td class="text-left">
                                                                                    <select class="form-control select2" style="width: 100%;" name="sexCriteria" id="sexCriteria"  required>
                                                                                        <option>Male</option>
                                                                                        <option>Female</option>
                                                                                        <option>Either</option>
                                                                                    </select>
                                                                                </td>

                                                                            </tr>
                                                                            <tr>
                                                                                <td class="text-left">Status</td>
                                                                                <td class="text-left">
                                                                                    <select class="form-control select2" style="width: 100%;" name="marriageStatusCriteria" id="marriageStatusCriteria"  required>
                                                                                        <option>Single</option>
                                                                                        <option>Married</option>
                                                                                        <option>Divorced</option>
                                                                                        <option>Widowed</option>
                                                                                        <option>Single or Married</option>
                                                                                        <option>Any</option>
                                                                                    </select>
                                                                                </td>

                                                                            </tr>
                                                                            <tr>
                                                                                <td class="text-left">Body Build</td>
                                                                                <td class="text-left">
                                                                                    <select class="form-control select2" style="width: 100%;" name="bodyBuildCriteria" id="bodyBuildCriteria"  required>
                                                                                        <option>Light</option>
                                                                                        <option>Medium</option>
                                                                                        <option>Heavy</option>
                                                                                        <option>Any</option>
                                                                                    </select>
                                                                                </td>

                                                                            </tr>
                                                                            <tr>
                                                                                <td class="text-left">Skin Complexion</td>
                                                                                <td class="text-left">
                                                                                    <select class="form-control select2" style="width: 100%;" name="skinComplexionCriteria" id="skinComplexionCriteria"  required> 
                                                                                        <option>Dark</option>
                                                                                        <option>Fair</option>
                                                                                        <option>Light</option>
                                                                                        <option>Any</option>
                                                                                    </select>
                                                                                </td>

                                                                            </tr>






                                                                        </tbody>
                                                                    </table>

                                                                </div>


                                                                <!-- /.tab-pane -->



                                                            </div>                                                  
                                                            <!-- /.tab-content -->

                                                        </div>                                                           
                                                        <!-- nav-tabs-custom -->
                                                    </div>                                                       
                                                    <!-- /.col -->
                                                </div>                                                        
                                                <!-- /.row -->
                                                <!-- END TABS -->
                                                <div class="modal-footer pull-right-container" >
                                                    <span style="float:right;">
                                                        <button type="button" class="btn btn-primary" data-dismiss="modal" id="CloseCriteria">Close</button>
                                                        <button type="button" class="btn btn-primary"  id="SaveCriteria">Save</button>
                                                    </span>
                                                </div> 
                                            </div>
                                        </div> 
                                    </div>                                                        
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


        <script src="js/clientProfile.js" type="text/javascript"></script>

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
