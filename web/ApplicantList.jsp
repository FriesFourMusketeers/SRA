<%-- 
    Document   : blankpage
    Created on : Aug 24, 2016, 5:56:01 AM
    Author     : Eugene
--%>

<%@page import="entity.TicketRecruitment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TicketDAO"%>
<%@page import="dao.EmployeeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file= "blankpage.jsp" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Safeguard | Applicant List</title>


        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <!-- Site wrapper -->

        <div class="wrapper">
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
 
               <section class="content">
                    <div class="row">
                        <% TicketDAO ticket = new TicketDAO();
                            ArrayList<TicketRecruitment> templist = ticket.getMostComplained();
                            ArrayList<TicketRecruitment> ticketList = ticket.getFilteredComplaints(templist, 3);
                        %>
                        

                        <% EmployeeDAO personalInfo = new EmployeeDAO();%>
                        <% for (int i = 0; i < personalInfo.getTempPersonalInfo().size(); i++) {%>
                        <!-- Content Header (Page header) -->

                        <div class="column">

                            <div class="col-sm-3 col-xs-4">
                                <div class="list_group">
                                    <div class="box-body">
                                        <div class="col-sm-12">
                                            <h4 class="brief"><i>Digital Strategist</i></h4>
                                            <div class="left col-xs-7">
                                                <h2 id="applicantName<%=+i%>" id="applicantName<%=+i%>"><%=personalInfo.getTempPersonalInfo().get(i).getFirstName() + " "%><%=personalInfo.getTempPersonalInfo().get(i).getLastName()%></h2>
                                                <p><strong>About: </strong> Web Designer / UX / Graphic Artist / Coffee Lover </p>
                                                <ul class="list-unstyled">
                                                    <li><i class="fa fa-building"></i> Address: </li>
                                                    <li><i class="fa fa-phone"></i> Phone #: </li>
                                                </ul>
                                            </div>
                                            <div class="right col-xs-5 text-center">
                                                <img src="dist/img/user2-160x160.jpg" alt="" class="img-circle img-responsive">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 bottom text-center">
                                            <div class="col-xs-12 col-sm-6 emphasis">
                                                <p class="ratings">
                                                    <a>4.0</a>
                                                    <a href="#"><span class="fa fa-star"></span></a>
                                                    <a href="#"><span class="fa fa-star"></span></a>
                                                    <a href="#"><span class="fa fa-star"></span></a>
                                                    <a href="#"><span class="fa fa-star"></span></a>
                                                    <a href="#"><span class="fa fa-star-o"></span></a>
                                                </p>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 emphasis">
                                                <button type="button" class="btnSelect btn btn-success btn-xs" data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#ViewProfileNew<%=+i%>"> <i class="fa fa-user">
                                                    </i> <i class="fa fa-comments-o"></i> View Summary</button>

                                            </div>
                                            <div class="col-xs-12 col-sm-6 emphasis">
                                                <a href="viewApplicantProfile?id=<%=personalInfo.getTempPersonalInfo().get(i).getEmployeeID()%>" type="button" class="btn btn-primary btn-xs">View Profile</a>
                                                <i class="fa fa-user"> </i> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <br />
                            <%}%>
                        </div>


                        <% for (int i = 0; i < personalInfo.getTempPersonalInfo().size(); i++) {%>



                        <form role="form" action="initialDecision" method="post">
                            <!-- Modal ADD TICKET -->
                            <div class="container">
                                <!-- Trigger the modal with a button -->

                                <!-- Modal -->

                                <div class="modal fade bs-example-modal-lg" id="scheduleNotQualified" role="dialog">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Not Qualified</h4>
                                            </div>
                                            <div class="modal-body">
                                                <label>Reason</label>
                                                <input type="text" class="form-control" name="applicantReason" id="applicantReason" placeholder="He is not qualified because..">
                                                <div class="modal-footer pull-right-container">
                                                    <span style="float:right">
                                                        <button type="submit" class="btn btn-primary" id="applicantReasonSubmit" name ="first" value="notQualified" onclick="confirmation()">Submit</button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="modal fade bs-example-modal-lg" id="scheduleInterview" role="dialog">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Schedule Interview Date</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="col-xs-2">
                                                    <label>ID</label>
                                                    <text>3123</text>
                                                </div>
                                                <div class="form-group col-xs-3">
                                                    <label>Sched Date</label>
                                                    <div class="input-group date">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-calendar"></i>
                                                        </div>
                                                        <input type="date" min="1899-01-01" class="form-control pull-right" name="applicantSchedDate" id="applicantSchedDate">
                                                    </div>
                                                </div>
                                                <div class="col-xs-2">
                                                    <label>Time</label>
                                                    <select class="form-control select2" style="width:100%;" name="applicantSchedTime" id="applicantSchedTime">
                                                        <option>11:00-11:30</option>
                                                        <option>11:30-12:00</option>
                                                        <option>12:00-12:30</option>
                                                        <option>12:30-1:00</option>
                                                        <option>1:30-2:00</option>
                                                        <option>2:30-3:00</option>
                                                    </select>
                                                </div>
                                                <div class="modal-footer pull-right-container">
                                                    <span style="float:right">
                                                        <button type="button" class="btn btn-primary" data-dismiss="modal" id="Close">Close</button>
                                                    </span>
                                                    <span style="float:left">
                                                        <button type="submit" method="post" class="label-success btn btn-primary" name="second" value="scheduleInterview">Schedule Interview</button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal fade bs-example-modal-lg" tabindex="-1" id="ViewProfileNew<%=+i%>" role="dialog" name="ViewProfileNew<%=+i%>">
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
                                                                    <li class="active"><a href="#PersonalData<%=+i%>" data-toggle="tab">Data</a></li>
                                                                    <li><a href="#PersonalCharacteristics<%=+i%>" data-toggle="tab">Characteristics</a></li>
                                                                    <li><a href="#OfficialData<%=+i%>" data-toggle="tab">Official Data</a></li>
                                                                    <li><a href="#EmploymentBackground<%=+i%>" data-toggle="tab">Employment Background</a></li>
                                                                </ul>
                                                                <!-- /.tab-pane -->
                                                                <div class="tab-content">
                                                                    <div class="tab-pane active" id="PersonalData<%=+i%>">
                                                                        <table class="table table-striped" id="tblGrid">
                                                                            <thead id="tblHead">
                                                                                <tr>
                                                                                    <th class="text-left">Category</th>
                                                                                    <th class="text-left">Value</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td style="display:none">
                                                                                        <select name="applicantID" id="applicantID">
                                                                                            <option class ="ap-id"><%=personalInfo.getTempPersonalInfo().get(i).getEmployeeID()%></option>
                                                                                        </select>
                                                                                    </td>
                                                                                    <td class="text-left">Last Name:</td>
                                                                                    <td class="text-left"><%=personalInfo.getTempPersonalInfo().get(i).getLastName()%></td>

                                                                                </tr>

                                                                                <tr><td class="text-left">First Name:</td>
                                                                                    <td class="text-left"><%=personalInfo.getTempPersonalInfo().get(i).getFirstName()%></td>

                                                                                </tr>
                                                                                <tr><td class="text-left">Birth Date:</td>
                                                                                    <td class="text-left"><%=personalInfo.getTempPersonalInfo().get(i).getBirthday()%></td>

                                                                                </tr>
                                                                                <tr><td class="text-left">Age:</td>
                                                                                    <td class="text-left"><%=personalInfo.getTempPersonalInfo().get(i).getAge()%></td>

                                                                                </tr>
                                                                                <tr><td class="text-left">Sex:</td>
                                                                                    <td class="text-left"><%=personalInfo.getTempPersonalInfo().get(i).getSex()%></td>

                                                                                </tr>
                                                                                <tr><td class="text-left">Religion:</td>
                                                                                    <td class="text-left"><%=personalInfo.getTempPersonalInfo().get(i).getReligion()%></td>

                                                                                </tr>
                                                                                <tr><td class="text-left">Cellphone Number:</td>
                                                                                    <td class="text-left"><%=personalInfo.getTempPersonalInfo().get(i).getCellphoneNo()%></td>

                                                                                </tr>
                                                                                <tr><td class="text-left">Telephone Number:</td>
                                                                                    <td class="text-left"><%=personalInfo.getTempPersonalInfo().get(i).getTelephoneNo()%></td>

                                                                                </tr>
                                                                                <tr><td class="text-left">City</td>
                                                                                    <td class="text-left"><%=personalInfo.getTempPersonalInfo().get(i).getCity()%></td>

                                                                                </tr>


                                                                            </tbody>
                                                                        </table>

                                                                    </div>

                                                                    <!-- /.tab-pane -->
                                                                    <div class="tab-pane" id="PersonalCharacteristics<%=+i%>">


                                                                        <table class="table table-striped" id="tblGrid">
                                                                            <thead id="tblHead">
                                                                                <tr>
                                                                                    <th class="text-left">Category</th>
                                                                                    <th class="text-left">Value</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <tr><td class="text-left">Height:</td>
                                                                                    <td class="text-left"><%=personalInfo.getTempPhysicalInfo().get(i).getHeight()%></td>

                                                                                </tr>

                                                                                <tr><td class="text-left">Weight:</td>
                                                                                    <td class="text-left"><%=personalInfo.getTempPhysicalInfo().get(i).getWeight()%></td>

                                                                                </tr>
                                                                                <tr><td class="text-left">Sears or other distinguishing marks:</td>
                                                                                    <td class="text-left"><%=personalInfo.getTempPhysicalInfo().get(i).getSears()%></td>

                                                                                </tr>
                                                                                <tr><td class="text-left">Physical Defects:</td>
                                                                                    <td class="text-left"><%=personalInfo.getTempPhysicalInfo().get(i).getPhysicalDefects()%></td>

                                                                                </tr>
                                                                                <tr><td class="text-left">Recent Serious Illnesses:</td>
                                                                                    <td class="text-left"><%=personalInfo.getTempPhysicalInfo().get(i).getIllnesses()%></td>

                                                                                </tr>
                                                                                <tr><td class="text-left">Body Build:</td>
                                                                                    <td class="text-left"><%=personalInfo.getTempPhysicalInfo().get(i).getBodyBuild()%></td>

                                                                                </tr>
                                                                                <tr><td class="text-left">Skin Color:</td>
                                                                                    <td class="text-left"><%=personalInfo.getTempPhysicalInfo().get(i).getSkinColor()%></td>

                                                                                </tr>
                                                                                <tr><td class="text-left">State of Health:</td>
                                                                                    <td class="text-left"><%=personalInfo.getTempPhysicalInfo().get(i).getStateOfHealth()%></td>
                                                                                </tr>

                                                                            </tbody>
                                                                        </table>
                                                                    </div>

                                                                    <div class="tab-pane" id="OfficialData<%=+i%>">

                                                                        <table class="table table-striped" id="tblGrid">
                                                                            <thead id="tblHead">
                                                                                <tr>
                                                                                    <th class="text-left">Seminars/Trainings Attended</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td class="text-left"><%=personalInfo.getTempJobInfo2().get(i).getTrainingAttended()%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-left"><%=personalInfo.getTempJobInfo2().get(i).getTrainingAttended()%></td>
                                                                                </tr>
                                                                        </table>
                                                                    </div>


                                                                    <div class="tab-pane" id="EmploymentBackground<%=+i%>">
                                                                        <table class="table table-striped" id="tblGrid">
                                                                            <thead id="tblHead">
                                                                                <tr>
                                                                                    <th class="text-left">Type of Job</th>
                                                                                    <th class="text-left">Name of Employer</th>
                                                                                    <th class="text-left">Reason for Leaving</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td class="text-left"><%=personalInfo.getTempJobInfo2().get(i).getFormerJob()%></td>
                                                                                    <td class="text-left"><%=personalInfo.getTempJobInfo2().get(i).getFormerEmployer()%></td>
                                                                                    <td class="text-left"><%=personalInfo.getTempJobInfo2().get(i).getReasonForLeaving()%></td>
                                                                                </tr>

                                                                                <tr>
                                                                                    <td class="text-left"><%=personalInfo.getTempJobInfo2().get(i).getFormerJob()%></td>
                                                                                    <td class="text-left"><%=personalInfo.getTempJobInfo2().get(i).getFormerEmployer()%></td>
                                                                                    <td class="text-left"><%=personalInfo.getTempJobInfo2().get(i).getReasonForLeaving()%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-left"><%=personalInfo.getTempJobInfo2().get(i).getFormerJob()%></td>
                                                                                    <td class="text-left"><%=personalInfo.getTempJobInfo2().get(i).getFormerEmployer()%></td>
                                                                                    <td class="text-left"><%=personalInfo.getTempJobInfo2().get(i).getReasonForLeaving()%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="text-left"><%=personalInfo.getTempJobInfo2().get(i).getFormerJob()%></td>
                                                                                    <td class="text-left"><%=personalInfo.getTempJobInfo2().get(i).getFormerEmployer()%></td>
                                                                                    <td class="text-left"><%=personalInfo.getTempJobInfo2().get(i).getReasonForLeaving()%></td>
                                                                                </tr>

                                                                            </tbody>
                                                                        </table>
                                                                    </div>



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
                                                            <button type="button" class="btn btn-primary" data-dismiss="modal" id="NewTicketSubmit">Close</button>
                                                        </span>
                                                        <span style="float:left;">
                                                            <button type="button" class="label-danger btn btn-primary" data-toggle="modal" data-dismiss="modal" data-backdrop="static" data-target="#scheduleNotQualified">Not Qualified</button>
                                                            <button type="submit" method="post" class="label-primary btn btn-primary" name="third" value="waitlistApplicant">Waitlist Applicant</button>
                                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-dismiss="modal" data-backdrop="static" data-target="#scheduleInterview">Schedule Interview</button>
                                                        </span>
                                                    </div> 
                                                </div>
                                            </div> 
                                        </div>                                                        
                                    </div>                                                        
                                </div>     
                            </div>

                            <!-- /.control-sidebar -->
                            <!-- Add the sidebar's background. This div must be placed
                                 immediately after the control sidebar -->
                            <div class="control-sidebar-bg"></div>

                        </form>
                        <%}%>  
                    </div>
            </div>
        </section>
    </div>
</div>


<!-- ./wrapper -->


<script>
    $(document).ready(function () {
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var yyyy = today.getFullYear();
        if (dd < 10) {
            dd = '0' + dd
        }
        if (mm < 10) {
            mm = '0' + mm
        }

        today = yyyy + '-' + mm + '-' + dd;
        document.getElementById("applicantSchedDate").setAttribute("min", today);
    });


    $(document).ready(function () {
        // code to read selected table row cell data (values).

        $(".btnSelect").on('click', function () {
            var currentRow = $(this).closest("tr");
            var col1 = currentRow.find(".ap-id").html();

            document.getElementById("ap-id").value = col1;

        });
    });

    function confirmation() {
        var x;
        if (confirm("Press a button!") == true) {
            x = "You pressed OK!";
        } else {
            x = "You pressed Cancel!";
        }
    }
</script>


</body>
</html>
