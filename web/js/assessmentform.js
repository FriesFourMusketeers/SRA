/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var clientDropDown = $("#clientName");
var employeetable = $(".question");
var sunday = new Date();
getAllClients();
//getAllEmployees();

    if (sunday.getDay() !== 0) {
        alert("Weekly assessment is only allowed on Sunday.");
    }

$(document).ready(function () {

    clientDropDown.change(function () {
        var client = $('#clientName option:selected').val();
        execute(client);
    }
    );
});

function execute(client) {
    $.ajax({
        url: getEmployees(client),
        success: function () {
            getQuestions(client);
        }
    });

}

function getEmployees(client) {

    $.ajax({
        type: "GET",
        url: "/SRA/GetEmployeesByClient?SelectedGuard=" + client,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            $(".col-xs-6").remove();
            data.forEach(addEmployee);

        },
        error: function (response) {
            console.log(response);
        }
    });
}

function getQuestions(client) {

    $.ajax({
        type: "GET",
        url: "GetPRT?Client=" + client,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            data.forEach(addQuestions);
            //getAllEmployees();

        },
        error: function (response) {
            console.log(response);
        }
    });
}

function getAllClients() {
    $.ajax({
        type: "GET",
        url: "GetAllClients",
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


function addEmployee(data) {
    console.log("Entered addGuard: " + data.employeeID);
    employeetable.append('<div class="col-xs-6">' +
            '<div class="box">' +
            '<div class="box-header">' +
            '<h3 class="box-title" value="' + data.employeeID + '">' + data.lastName + ',' + data.firstName + '</h3>' +
            '</div>' +
            '<div class="box-body">' +
            '<table id="example1" name="example1" class="table table-bordered table-striped">' +
            '<col style="width:30%">' +
            '<col style="width:70%">' +
            '<thead>' +
            '<tr>' +
            '<th>Question</th>' +
            '<th>Answer</th>' +
            '</tr>' +
            '</thead>' +
            '<tbody class="tbody">' +
            '<tr>' +
            '</tr>' +
            '</tbody>' +
            '<tfoot>' +
            '<tr>' +
            '<th>Question</th>' +
            '<th>Answer</th>' +
            '</tr>' +
            '</tfoot>' +
            '</div>' +
            '</div>'
            );
}

function addQuestions(data) {
    console.log("Entered addGuard: " + data.prtID);
    if (data.type.toString() === "radiobutton") {
        $('.tbody').append('<tr>' +
                ' <td><h5>' + data.question + '</h5></td>' +
                '<td>' +
                '<label class = "radio-inline">' +
                '<input type = "radio" value = "1"> Option 1' +
                '</label>' +
                '<label class = "radio-inline">' +
                '<input type = "radio" value = "2"> Option 2' +
                '</label>' +
                '<label class = "radio-inline">' +
                '<input type = "radio" value = "3"> Option 3' +
                '</label>' +
                '<label class = "radio-inline">' +
                '<input type = "radio" value = "4"> Option 4' +
                '</label>' +
                '<label class = "radio-inline">' +
                '<input type = "radio" value = "5"> Option 5' +
                '</label>' +
                '</td>' +
                '</tr>'
                );
    }
    if (data.type.toString() === "checkbox") {
        $('.tbody').append('<tr>' +
                ' <td><h5>' + data.question + '</h5></td>' +
                '<td>' +
                '<label class = "checkbox-inline">' +
                '<input type = "checkbox" value = "1"> Option 1' +
                '</label>' +
                '<label class = "checkbox-inline">' +
                '<input type = "checkbox" value = "2"> Option 2' +
                '</label>' +
                '<label class = "checkbox-inline">' +
                '<input type = "checkbox" value = "3"> Option 3' +
                '</label>' +
                '<label class = "checkbox-inline">' +
                '<input type = "checkbox" value = "4"> Option 4' +
                '</label>' +
                '<label class = "checkbox-inline">' +
                '<input type = "checkbox" value = "5"> Option 5' +
                '</label>' +
                '</td>' +
                '</tr>'
                );
    }
    if (data.type.toString() === "dropdown") {
        $('.tbody').append('<tr>' +
                ' <td><h5>' + data.question + '</h5></td>' +
                '<td>' +
                '<select class="form-control select2" id="dropdown" name="dropdown">' +
                '<option value = "1">Option 1</option>' +
                '<option value = "2">Option 2</option>' +
                '<option value = "3">Option 3</option>' +
                '<option value = "4">Option 4</option>' +
                '<option value = "5">Option 5</option>' +
                '</select>' +
                '</td>' +
                '</tr>'
                );
    }
}
                               