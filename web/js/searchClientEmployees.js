/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var guardDropDown = $("#GuardInvolved");
var clientDropDown = $("#Establishment");

getAllClients();
//getAllEmployees();


$(document).ready(function () {

    clientDropDown.change(function () {
        var client = $('#Establishment option:selected').val();
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
            $('#GuardInvolved').find('option').remove().end();
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
        url: "/SRA/GetAllClients",
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
    var s = "<option value = " + data.employeeID + ">" + data.lastName + ", " + data.firstName + "</option>";
    guardDropDown.append(s);
}
