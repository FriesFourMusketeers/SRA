/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var clientDropDown = $("#clientName");
var kpiDropdown = $("#assessmentformSelectKPI");
var measureDropdown = $(".assessmentformSelectPM");
var pm;

getAllClients();
//getAllEmployees();

$(document).ready(function () {

    clientDropDown.change(function () {
        var client = $('#clientName option:selected').val();
        $('.assessmentformSelectPM').find('option').remove().end();
        var s = "<option disabled selected value> <----- Select A KPI first -----> </option>";
        $('.assessmentformSelectPM').append(s);
        getKPI(client);
    }
    );

    $('.assessmentformSelectKPI').change(function () {
        var kpi = $(this).val();
        pm = $(this).closest('tr').children('td').children('.assessmentformSelectPM');
        getPM(kpi, pm);
    }
    );

}
);

function getPM(kpi, value) {

    $.ajax({
        type: "GET",
        url: "/SRA/getPMperKPI?SelectedKPI=" + kpi,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            value.find('option').remove().end();
            var s = "<option disabled selected value> <----- Select A KPI first -----> </option>";
            value.append(s);
            data.forEach(addPM);
            //getAllEmployees();

        },
        error: function (response) {
            console.log(response);
        }
    });
}

function getKPI(client) {

    $.ajax({
        type: "GET",
        url: "/SRA/getKPIperclient?SelectedClient=" + client,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            $(".assessmentformSelectKPI").find('option').remove().end();
            var s = "<option disabled selected value> <----- Select A Client first -----> </option>";
            $(".assessmentformSelectKPI").append(s);
            data.forEach(addKPI);
            //getAllEmployees();

        },
        error: function (response) {
            console.log(response);
        }
    });
}

//function getAllEmployees() {
//    $.ajax({
//        type: "GET",
//        url: "/SRA/GetAllEmployees",
//        dataType: 'json',
//        success: function (data) {
//            console.log(data);
//            var s = "<option disabled selected value> -- select an option -- </option>";
//            guardDropDown.append(s);
//            data.forEach(addEmployees);
//        },
//        error: function (response) {
//            console.log(response);
//        }
//    });
//}

function getAllClients() {
    $.ajax({
        type: "GET",
        url: "/SRA/GetAllClients",
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var s = "<option disabled selected value> <----- Select A Client -----> </option>";
            clientDropDown.append(s);
            data.forEach(addClient);
        },
        error: function (response) {
            console.log(response);
        }
    });
}

function addClient(data) {
    console.log("Entered addClient: " + data.clientName);
    var s = "<option value = " + data.clientID + ">" + data.clientName + "</option>";
    clientDropDown.append(s);
}

function addPM(data) {
    console.log("Entered addPM: " + data.customMeasure);
    var s = "<option value = " + data.customMeasure + ">" + data.performanceMeasure + "</option>";
    pm.append(s);
}


function addKPI(data) {
    console.log("Entered addGuard: " + data.performanceArea);
    var s = "<option value = " + data.customKPI + ">" + data.performanceArea + "</option>";
    $(".assessmentformSelectKPI").append(s);
}

