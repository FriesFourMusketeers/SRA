<%-- 
    Document   : clientpage
    Created on : 01 16, 17, 1:05:59 PM
    Author     : see_h
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file= "blankpage.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Client Page</title>
    </head>
    <body>
        <div class="wrapper"> <!-- Additional -->
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">

                <section class="content"> <!-- Additional -->
                    <div class="row"> <!-- Additional -->
                        <!-- Content Header (Page header) -->

                        <section class="content-header">
                            <h1>
                                Personal Information Sheet
                            </h1>

                        </section>

                        <!-- Tabs starts here -->

                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#AcceptAllocation" data-toggle="tab">Accept Allocation</a></li>
                                <li><a href="#AnotherTab" data-toggle="tab">AnotherTab</a></li>
                            </ul>
                        </div>

                        

                        <form role="form" action="addApplicant" method="post" enctype="multipart/form-data">
                            <div class="tab-content">
                                <!-- PART 1-->
                                <div id="AcceptAllocation" class="tab-pane active">
                                    <!-- /.control-sidebar -->
                                    <!-- Add the sidebar's background. This div must be placed
                                         immediately after the control sidebar -->
                                    <div class="control-sidebar-bg"></div>
                                    <div class="box box-info">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"><strong><u>Accept Allocation</u></strong></h3>
                                        </div>
                                        <!-- /.box-header -->
                                        <!-- form start -->

                                    </div>

                                </div>

                                <!-- PART 1 END-->     

                                <!-- PART 2-->
                                <div id="AnotherTab" class="tab-pane">
                                    <!-- /.control-sidebar -->
                                    <!-- Add the sidebar's background. This div must be placed
                                         immediately after the control sidebar -->
                                    <div class="control-sidebar-bg"></div>
                                    <div class="box box-info">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"><strong><u>AnotherTab</u></strong></h3>
                                        </div>
                                        <!-- /.box-header -->
                                        <!-- form start -->

                                    </div>

                                </div>

                                <!-- PART 2 END-->
                                
                            </div>

                        </form>
                </section>
            </div>
        </div>



    </body>
</html>
