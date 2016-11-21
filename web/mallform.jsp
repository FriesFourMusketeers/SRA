<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Preset Form</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>


        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <!-- Site wrapper -->
       <%@include file= "blankpage.jsp" %>


            <!-- =============================================== -->

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Blank page
                        <small>it all starts here</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">Examples</a></li>
                        <li class="active">Blank page</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">

                    <!-- Default box -->
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">Title</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fa fa-minus"></i></button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                    <i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body"><div class="form-bottom">
                                <form class="form-horizontal" action="addEvaluation">
                                    <input type="hidden" name="counter" value="0" id="counter">

                                    <fieldset>
                                        <script type="text/javascript">
                                            $(document).ready(function () {
                                                var counter1 = 1;
                                                var counter = 1;

                                                $("#counter").replaceWith('<input type="hidden" name="counter" value="' + counter + '" id="counter">');

                                                $("#addButton").click(function () {
                                                    var newTextBoxDiv = $(document.createElement('div'))
                                                            .attr("id", 'KpiDiv' + counter);
                                                    newTextBoxDiv.append(
                                                            '<div id="radio">' +
                                                            '<label>Performance Criteria #' + counter + ': </label>' +
                                                            '<input type="textbox"' +
                                                            ' id="selectKPItext' + counter + '" name="selectKPItext' + counter + '"><p></p>' +
                                                            '<label>Which of these corresponds to your question:</label>' +
                                                            '<select id = "selectKPIcross' + counter + '" name="selectKPIcross' + counter + '">' +
                                                            '<option value = "1" > Maliit </option>' +
                                                            '<option value = "2" > Titi </option>' +
                                                            '<option value = "3" > Ni Eugene </option>' +
                                                            '<option value = "4" > Ni John </option>' +
                                                            '<option value = "5" > Ni Bry </option>' +
                                                            '<option value = "6" > Ni JM </option>' +
                                                            '</select><p></p>' +
                                                            '<label>Weight:</label>' +
                                                            '<select id = "selectWeight' + counter + '" name="selectWeight' + counter + '">' +
                                                            '<option value = "1" > 5 % </option>' +
                                                            '<option value = "2" > 10 % </option>' +
                                                            '<option value = "3" > 15 % </option>' +
                                                            '<option value = "4" > 20 % </option>' +
                                                            '<option value = "5" > 25 % </option>' +
                                                            '<option value = "6" > 30 % </option>' +
                                                            '<option value = "7" > 35 % </option>' +
                                                            '<option value = "8" > 40 % </option>' +
                                                            '<option value = "9" > 45 % </option>' +
                                                            '<option value = "10" > 50 % </option>' +
                                                            '</select><p></p>' +
                                                            '<label for="radios">Score</label>' +
                                                            '<label class="radio-inline" for="radios-0">' +
                                                            '<input type = "radio" name = "radios" id = "kpi' + counter + '-radios-0" value = "1" checked = "checked" > 1' +
                                                            '</label>' +
                                                            '<label class="radio-inline" for="radios-0">' +
                                                            '<input type = "radio" name = "radios" id = "kpi' + counter + '-radios-0" value = "2" checked = "checked" > 2' +
                                                            '</label>' +
                                                            '<label class="radio-inline" for="radios-0">' +
                                                            '<input type = "radio" name = "radios" id = "kpi' + counter + '-radios-0" value = "3" checked = "checked" > 3' +
                                                            '</label>' +
                                                            '<label class="radio-inline" for="radios-0">' +
                                                            '<input type = "radio" name = "radios" id = "kpi' + counter + '-radios-0" value = "4" checked = "checked" > 4' +
                                                            '</label>' +
                                                            '<label class="radio-inline" for="radios-0">' +
                                                            '<input type = "radio" name = "radios" id = "kpi' + counter + '-radios-0" value = "5" checked = "checked" > 5' +
                                                            '</label>' +
                                                            '</div>'
                                                            );
                                                    newTextBoxDiv.appendTo("#FormGroup");
                                                    counter++;
                                                    $("#KpiDiv" + counter).replaceWith('<div id="KpiDiv' + counter + '" value="radio" name="KpiDiv' + counter + '">');

                                                });
                                                $("#addButton1").click(function () {
                                                    $("#counter").replaceWith('<input type="hidden" name="counter" value="' + counter + '" id="counter">');
                                                    var newTextBoxDiv = $(document.createElement('div'))
                                                            .attr("id", 'KpiDiv' + counter);
                                                    newTextBoxDiv.append(
                                                            '<div id="select">' +
                                                            '<label>Performance Criteria #' + counter + ': </label>' +
                                                            '<input type="textbox" id="selectKPItext' + counter + '" name="selectKPItext' + counter + '"><p></p>' +
                                                            '<label>Which of these corresponds to your question:</label>' +
                                                            '<select id = "selectKPIcross' + counter + '" name="selectKPIcross' + counter + '">' +
                                                            '<option value = "1" > Maliit </option>' +
                                                            '<option value = "2" > Titi </option>' +
                                                            '<option value = "3" > Ni Eugene </option>' +
                                                            '<option value = "4" > Ni John </option>' +
                                                            '<option value = "5" > Ni Bry </option>' +
                                                            '<option value = "6" > Ni JM </option>' +
                                                            '</select><p></p>' +
                                                            '<label>Weight:</label>' +
                                                            '<select id = "selectWeight' + counter + '" name="selectWeight' + counter + '" >' +
                                                            '<option value = "1" > 5 % </option>' +
                                                            '<option value = "2" > 10 % </option>' +
                                                            '<option value = "3" > 15 % </option>' +
                                                            '<option value = "4" > 20 % </option>' +
                                                            '<option value = "5" > 25 % </option>' +
                                                            '<option value = "6" > 30 % </option>' +
                                                            '<option value = "7" > 35 % </option>' +
                                                            '<option value = "8" > 40 % </option>' +
                                                            '<option value = "9" > 45 % </option>' +
                                                            '<option value = "10" > 50 % </option>' +
                                                            '</select><p></p>')

                                                    newTextBoxDiv.append(
                                                            '<div id="option">' +
                                                            '<label>Option #' + counter1 + ': </label>' +
                                                            '<input type="textbox" id="selectKPI' + counter1 + '"> <p></p>' +
                                                            '</div> <p></p>' +
                                                            ' </div>' +
                                                            '<input type="button" value="Add Option" id="addOption">'
                                                            )
                                                    newTextBoxDiv.appendTo("#FormGroup");
                                                    counter++;
                                                    $("#KpiDiv" + counter).replaceWith('<div id="KpiDiv' + counter + '" value="dropdown" name="KpiDiv' + counter + '">');
                                                });

                                                $("#addButton2").click(function () {
                                                    $("#counter").replaceWith('<input type="hidden" name="counter" value="' + counter + '" id="counter">');
                                                    var newTextBoxDiv = $(document.createElement('div'))
                                                            .attr("id", 'KpiDiv' + counter);
                                                    newTextBoxDiv.append(
                                                            '<div id="checkbox">' +
                                                            '<label>Performance Criteria #' + counter + ': </label>' +
                                                            '<input type="textbox" id="selectKPItext' + counter + '" name="selectKPItext' + counter + '"><p></p>' +
                                                            '<label>Which of these corresponds to your question:</label>' +
                                                            '<select id = "selectKPIcross' + counter + '" name= "selectKPIcross' + counter + '">' +
                                                            '<option value = "1" > Maliit </option>' +
                                                            '<option value = "2" > Titi </option>' +
                                                            '<option value = "3" > Ni Eugene </option>' +
                                                            '<option value = "4" > Ni John </option>' +
                                                            '<option value = "5" > Ni Bry </option>' +
                                                            '<option value = "6" > Ni JM </option>' +
                                                            '</select><p></p>' +
                                                            '<label>Weight:</label>' +
                                                            '<select id = "selectWeight' + counter + '" name="selectWeight' + counter + '">' +
                                                            '<option value = "1" > 5 % </option>' +
                                                            '<option value = "2" > 10 % </option>' +
                                                            '<option value = "3" > 15 % </option>' +
                                                            '<option value = "4" > 20 % </option>' +
                                                            '<option value = "5" > 25 % </option>' +
                                                            '<option value = "6" > 30 % </option>' +
                                                            '<option value = "7" > 35 % </option>' +
                                                            '<option value = "8" > 40 % </option>' +
                                                            '<option value = "9" > 45 % </option>' +
                                                            '<option value = "10" > 50 % </option>' +
                                                            '</select><p></p>' +
                                                            '<label><input type="checkbox" value="" id="selectKPI">Option 1</label><p></p>' +
                                                            '<label><input type="checkbox" value="" id="selectKPI">Option 2</label><p></p>' +
                                                            '</div>')
                                                    newTextBoxDiv.appendTo("#FormGroup");
                                                    counter++;
                                                    $("#KpiDiv" + counter).replaceWith('<div id="KpiDiv' + counter + '" value="checkbox" name="KpiDiv' + counter + '">');
                                                });

                                                $(document).on('click', '#addOption', function () {
                                                    counter1++;
                                                    $('#option').append('<label>Option #' + counter1 + ': </label>' +
                                                            '<input type="textbox" id="selectKPI' + counter1 + '">' +
                                                            '</div> <p></p>');
                                                });

                                                $("#removeButton").click(function () {
                                                    if (counter == 1) {
                                                        alert("Nothing more to remove");
                                                        return false;
                                                    }

                                                    counter--;
                                                    $("#KpiDiv" + counter).remove();
                                                });
                                                $("#getButtonValue").click(function () {
                                                    var msg = '';
                                                    for (i = 1; i < counter; i++) {
                                                        msg += "\n Textbox #" + i + " : " + $('#RadioLabel' + i).val();
                                                    }
                                                    alert(msg);
                                                });
                                            });
                                        </script>

                                        <div id='FormGroup'>
                                        </div>
                                        <input type='button' value='Add Radio Button' id='addButton'>
                                        <input type='button' value='Add Dropdown' id='addButton1'>
                                        <input type='button' value='Add CheckBox' id='addButton2'>
                                        <input type='button' value='Remove Button' id='removeButton'>
                                        <input type='button' value='Get TextBox Value' id='getButtonValue'>
                                        <div class="col-sm-8 col-sm-offset-6">                
                                            <!--<button action="addEvaluation" method="post">SUBMIT</button>-->
                                        </div>   
                                    </fieldset>
                                </form>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                Footer
                            </div>
                            <!-- /.box-footer-->
                        </div>
                        <!-- /.box -->

                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <footer class="main-footer">
                <div class="pull-right hidden-xs">
                    <b>Version</b> 2.3.6
                </div>
                <strong>Copyright &copy; 2014-2016 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
                reserved.
            </footer>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Create the tabs -->
                <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
                    <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>

                    <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <!-- Home tab content -->
                    <div class="tab-pane" id="control-sidebar-home-tab">
                        <h3 class="control-sidebar-heading">Recent Activity</h3>
                        <ul class="control-sidebar-menu">
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                                        <p>Will be 23 on April 24th</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon fa fa-user bg-yellow"></i>

                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                                        <p>New phone +1(800)555-1234</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                                        <p>nora@example.com</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <i class="menu-icon fa fa-file-code-o bg-green"></i>

                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                                        <p>Execution time 5 seconds</p>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <!-- /.control-sidebar-menu -->

                        <h3 class="control-sidebar-heading">Tasks Progress</h3>
                        <ul class="control-sidebar-menu">
                            <li>
                                <a href="javascript:void(0)">
                                    <h4 class="control-sidebar-subheading">
                                        Custom Template Design
                                        <span class="label label-danger pull-right">70%</span>
                                    </h4>

                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <h4 class="control-sidebar-subheading">
                                        Update Resume
                                        <span class="label label-success pull-right">95%</span>
                                    </h4>

                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <h4 class="control-sidebar-subheading">
                                        Laravel Integration
                                        <span class="label label-warning pull-right">50%</span>
                                    </h4>

                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">
                                    <h4 class="control-sidebar-subheading">
                                        Back End Framework
                                        <span class="label label-primary pull-right">68%</span>
                                    </h4>

                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <!-- /.control-sidebar-menu -->

                    </div>
                    <!-- /.tab-pane -->
                    <!-- Stats tab content -->
                    <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
                    <!-- /.tab-pane -->
                    <!-- Settings tab content -->
                    <div class="tab-pane" id="control-sidebar-settings-tab">
                        <form method="post">
                            <h3 class="control-sidebar-heading">General Settings</h3>

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Report panel usage
                                    <input type="checkbox" class="pull-right" checked>
                                </label>

                                <p>
                                    Some information about this general settings option
                                </p>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Allow mail redirect
                                    <input type="checkbox" class="pull-right" checked>
                                </label>

                                <p>
                                    Other sets of options are available
                                </p>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Expose author name in posts
                                    <input type="checkbox" class="pull-right" checked>
                                </label>

                                <p>
                                    Allow the user to show his name in blog posts
                                </p>
                            </div>
                            <!-- /.form-group -->

                            <h3 class="control-sidebar-heading">Chat Settings</h3>

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Show me as online
                                    <input type="checkbox" class="pull-right" checked>
                                </label>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Turn off notifications
                                    <input type="checkbox" class="pull-right">
                                </label>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Delete chat history
                                    <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                                </label>
                            </div>
                            <!-- /.form-group -->
                        </form>
                    </div>
                    <!-- /.tab-pane -->
                </div>
            </aside>
            <!-- /.control-sidebar -->
            <!-- Add the sidebar's background. This div must be placed
                 immediately after the control sidebar -->
            <div class="control-sidebar-bg"></div>
        </div>
        <!-- ./wrapper -->

        <!-- jQuery 2.2.3 -->
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <!-- SlimScroll -->
        <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <!-- FastClick -->
        <script src="plugins/fastclick/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/app.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="dist/js/demo.js"></script>
    </body>
</html>
