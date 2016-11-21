<%-- 
    Document   : blankpage
    Created on : Aug 24, 2016, 5:56:01 AM
    Author     : Eugene
--%>

<%@page import="entity.Client"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ClientDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file= "blankpage.jsp" %>
<html>
    <head>
        <title>Safeguard | Create KPI</title>
        <script src="plugins/jQuery/jquery.min.js" type="text/javascript"></script>
    </head>
    <body>
        <!-- Site wrapper -->
        <div class="wrapper"> <!-- Additional -->
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">

                <section class="content"> <!-- Additional -->
                    <div class="row"> <!-- Additional -->
                        <form class="form-horizontal box-body" action="addKPI" method="post">

                            <fieldset>
                                <div class="box box-info">
                                    <div class="box-header with-border count">

                                        <% ClientDAO clientDAO = new ClientDAO();
                                            ArrayList<Client> clientList = clientDAO.getAllClients();%>

                                        <label>Client</label>
                                        <select class="form-control select2" style="width: 100%;" name="clientName" id="clientName">
                                            <% for (int i = 0; i < clientList.size(); i++) {%>
                                            <option value="<%=clientList.get(i).getClientID()%>">  <%=clientList.get(i).getClientName()%></option>
                                            <% }%>
                                        </select>
                                        <h3 class="box-title"><strong><u>Create KPI</u></strong></h3>

                                    </div>


                                    <table class="table" id="tblMain">
                                        <tbody>
                                            <tr class="tabRow1">
                                                <td>
                                                    <button class="fa fa-close removekpi" type="button" ></button>
                                                    <input class ="col-xs-4"type="text" name="kpiname" id="kpikpiname" value="Compliance to Rules and Regulations">
                                                    <table class="table" id="tblGrid" CELLPADDING="3" CELLSPACING="3">
                                                        <thead>
                                                            <tr>
                                                                <th class="text-left">Performance Measure</th>
                                                                <th class="text-left">Specify Target</th>
                                                                <th class="text-left">Specify Weight</th>
                                                                <th><button class="fa fa-plus btn btn-success" id="addPM" type="button"></button></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr class="tabRow">
                                                                <td class="text-left"><input name="name" id="name" placeholder="insert measure here"></td>
                                                                <td class="text-left"><select class="selection" name="operator" id="operator">
                                                                        <option value="=">=</option>
                                                                        <option value=">">></option>
                                                                        <option value="<"><</option>
                                                                    </select>
                                                                    <input name="target" id="target" placeholder="Enter Target"></td>
                                                                <td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="weight" id="weight"></td>
                                                                <td><button class="fa fa-close remove" type="button" ></button></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>


                                    <div class="footer">
                                        <span style="float:right;">
                                            <button type="button" class="btn btn-primary" id="addKPIcriteria" style="float:right;">Add KPI</button>
                                            <br><br>
                                            <button type="submit" method="post" class="btn btn-primary" id="kpipost" name="kpipost">Create KPI</button>
                                        </span>
                                    </div>

                                </div>

                            </fieldset>
                        </form>




                    </div> <!-- Additional -->
                </section> <!-- Additional -->
            </div>
            <!-- /.content-wrapper -->

        </div> <!-- Additional -->
        <!-- ./wrapper -->

        <script>
            $(function () {
                //Initialize Select2 Elements
                $(".select2").select2();
            });
        </script>

        <script type="text/javascript">

            $(document).ready(function () {

                $(document).on("click", "#kpipost", function () {
                    $('#tblGrid tbody').each(function () {
                        $(".count").append(
                                '<input type="hidden" name="measurecount" id="measurecount" value="' + $(this).find('tr').length + '">'
                                );
                    });
                }
                );

                $(document).on("click", "#addPM", function () {
                    $("tr.tabRow:first").clone(true).appendTo($(this).parents("thead").next("tbody"));
                    $(".tabRow:last").children("td").children("input").each(function (index, element) {
                        $(element).val("");
                    });
                }
                );
                $(document).on("click", "button.remove", function () {
                    if ($(this).parents("tr").siblings("tr.tabRow").length > 0) {
                        $(this).closest("tr.tabRow").remove();
                    }
                    else {
                        alert("You cannot remove this measure. Please remove the KPI instead");
                    }
                });

                $(document).on("click", "button.removekpi", function () {
                    if ($(this).parents("tr").siblings("tr.tabRow1").length > 0) {
                        $(this).closest("tr.tabRow1").remove();
                    }
                    else {
                        alert("You cannot remove this KPI");
                    }
                });

                $("#addKPIcriteria").click(function () {
                    $("#tblMain tbody:first").append(
                            '<tr class="tabRow1">' +
                            '<td>' +
                            '<button class="fa fa-close removekpi" type="button" ></button>' +
                            '<input class ="col-xs-4"type="text" name="kpiname" id="kpiname" value="">' +
                            '<table class="table" id="tblGrid" CELLPADDING="3" CELLSPACING="3">' +
                            '<thead>' +
                            '<tr>' +
                            '<th class="text-left">Performance Measure</th>' +
                            '<th class="text-left">Specify Target</th>' +
                            '<th class="text-left">Specify Weight</th>' +
                            '<th><button class="fa fa-plus btn btn-success" id="addPM" type="button"></button></th>' +
                            '</tr>' +
                            '</thead>' +
                            '<tbody>' +
                            '<tr class="tabRow">' +
                            '<td class="text-left"><input name="name" id="name" placeholder="insert measure here"></td>' +
                            '<td class="text-left"><select class="selection" name="operator" id="operator">' +
                            '<option value="=">=</option>' +
                            '<option value=">">></option>' +
                            '<option value="<"><</option>' +
                            '</select><input name="target" id="target" placeholder="Enter Target"></td>' +
                            '<td class="text-left"><input type="number" min="0" max="99" class="form-control" placeholder="Enter %" name="measure" id="measure"></td>' +
                            '<td><button class="fa fa-close remove" type="button" ></button></td>' +
                            '</tr>' +
                            '</tbody>' +
                            '</table>' +
                            '</td>' +
                            '</tr>'
                            );
                });
            });
        </script> 

    </body>
</html>
