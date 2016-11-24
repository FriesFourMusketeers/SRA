/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var guardDropDown = $("#example1 tbody");
var clientDropDown = $("#clientName");

getAllClients();
//getAllEmployees();

$(document).ready(function () {

    clientDropDown.change(function () {
        var client = $('#clientName option:selected').val();
        getEmployeeByClient(client);
    }
    );

}
);

function getEmployeeByClient(client) {

    $.ajax({
        type: "GET",
        url: "/SRA/GetEmployeesByClient?SelectedGuard=" + client,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            $('#example1').DataTable().destroy(false); // destroy first
            $('#example1 tbody').find('tr').remove().end();
            data.forEach(addEmployees);
            
            $("#example1").DataTable(); // populate again
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
        url: "GetAllClients",
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var s = "<option disabled selected value> -- select an option -- </option>";
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

function addEmployees(data) {

    console.log("Entered addGuard: " + data.lastName);
    guardDropDown.append('<tr><td><a href=viewEmployeeProfile?id=' + data.employeeID + '>' + data.lastName + ', ' + data.firstName + '</a><input type="hidden"  value="'+ data.employeeID +'" id="guardID" name="guardID"></td>' +
            '<td>Rover Guard</td>' +
            '<td><select class="form-control select2" style="width: 100%;" name="attendance" id="attendance">' +
            '<option value="5">On Time</option>' +
            '<option value="4">Late</option>' +
            '<option value="3">Absent</option>' +
            '<option value="0">Day-Off</option>' +
            '<option value="0">Leave</option>' +
            '</select></td>' +
            '<td>'+
            '<select class="form-control select2" style="width: 100%;" name="uniform" id="uniform">' +
            '<option value="5">Complete</option>' +
            '<option value="4">Incomplete</option>' +
            '</select>' +
            '<input type="checkbox" name="violation' + data.employeeID + '" id="violation' + data.employeeID + '" value="Uniform"> Proper Haircut <br>' +
            '<input type="checkbox" name="violation' + data.employeeID + '" id="violation' + data.employeeID + '" value="Shoes"> Good hygiene throughout the day <br>' +
            '<td> <input type="radiogroup" name="log' + data.employeeID + '" id="log' + data.employeeID + '" value="Rovered all floors"> Courteousness <br>' +
            '<input type="checkbox" name="log' + data.employeeID + '" id="log' + data.employeeID + '" value="Greets all tenants"> Greets all tenants </td>' +
            '</tr>'
            
            );
}
