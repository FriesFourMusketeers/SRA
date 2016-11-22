$(document).ready(function () {
    var yearSelected = $("#yearSelect").find(":selected").text();
    console.log(yearSelected + " is selected");

    var clientID = document.getElementById("clientID").value;
    console.log(clientID);

    $.getJSON("viewClientEmployeeGrade", function (data) {

        setEmployeePie(data);
        console.log(data + "pumasok pie data");
    });

    $.ajax({
        url: "viewClientGrade",
        type: 'POST',
        dataType: "JSON",
        data: {
            yearSelected: yearSelected,
            clientID: clientID
        },
        success: function (data) {
            console.log(data + "docu ready11");
            if (data != null) {
                setEmployeeGrade(data);
            }

        }, error: function (XMLHttpRequest, textStatus, exception) {
            console.log(textStatus);
        }
    });

});

function setEmployeeGrade(print) {

    var data = [];
    var drilldownValues = [];
    var threshold = [];
    var month = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

    for (var x = 0; x < month.length; x++) {
        var totals = 0;
        item = {};
        item["name"] = month[x]; // x axis

        for (var i = 0; i < print[0].series.length; i++) {
            if (month [x] === print[0].series[i].clientMonth) {
                totals += print[0].series[i].clientScore;
                item["drilldown"] = month[x] // id

                var drilldownData = [];
                for (var j = 0; j < print[0].series.length; j++) {
                    if (print[0].series[j].clientMonth === print[0].series[i].clientMonth) {
                        item2 = {};
                        item2["name"] = print[0].series[i].clientMonth;
                        item2["id"] = print[0].series[i].clientMonth;
                        drilldownfirst = {};
                        drilldownfirst["name"] = print[0].series[j].clientWeek;
                        drilldownfirst["y"] = print[0].series[j].clientScore;
                        if (print[0].series[j].y <= 85) { // 75 (threshold) must be a variable from db
                            drilldownfirst['color'] = '#ff0000';
                        }
                        drilldownData.push(drilldownfirst);
                        item2["data"] = drilldownData;
                        drilldownValues.push(item2);
                    }
                }
            }
        }
        item["y"] = totals; // y axis
        if (totals <= 85) { // 75 (threshold) must be a variable from db
            item['color'] = '#ff0000';
        }

        data.push(item);

    }



//    for (var i = 0; i < print[0].series.length; i++) {
//        var totals = 0;
//        item = {};
//        item["name"] = print[0].series[i].clientMonth; //x axis
//        item["y"] = print[0].series[i].clientScore; // y axis
//        if (print[0].series[i].clientScore <= 85) {
//            item['color'] = '#ff0000';
//        }
//        data.push(item);
//    }
//
//    console.log(JSON.stringify(data));

    $('#clientGrade').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'spline',
            drilled: false,
        },
        title: {
            text: 'Client'
        },
        subtitle: {
            text: 'Click for further information'
        },
        xAxis: {
            type: 'category',
            tickWidth: 0,
            gridLineWidth: 1,
            labels: {
                align: 'left',
                x: 3,
                y: -3
            }
        },
        yAxis: [{// left y axis
                title: {
                    text: 'Score'
                },
                labels: {
                    align: 'left',
                    x: 3,
                    y: 16,
                    format: '{value:.,0f}'
                },
                plotLines: [{
                        color: '#FF0000',
                        width: 2,
                        value: 85,
                        zIndex: 5
                    }],
                showFirstLabel: false
            }],
        legend: {
            align: 'left',
            verticalAlign: 'top',
            y: 20,
            floating: true,
            borderWidth: 0
        },
        tooltip: {
            shared: true,
            crosshairs: true
        },
        plotOptions: {
            series: {
                cursor: 'pointer',
                events: {
                    click: function (e) {
                        // Log to console

//                        JSON.stringify(event.point);
//                        console.log(event.point.empID + "point");
//                        window.location.replace("GetEmployeesByClient?SelectedGuard=" + 29);
//                        window.location.href = "Ticketing.jsp";
                    }
                }
            }
        },
        series: [{
                name: 'Score',
                data: data
            }],
        drilldown: {
            series: drilldownValues
        }

    });
}

function setEmployeePie(print) {

    var data = [];
    for (var i = 0; i < print[0].series.length; i++) {
        var totals = 0;
        item = {};
        item["name"] = print[0].series[i].empID;
        item["y"] = print[0].series[i].score;
        item["url"] = print[0].series[i].url;
        if (print[0].series[i].score < 80) {
            item['color'] = '#ff0000';
            chart.series[i].data[i].setVisible(true);
//            item["name"].setVisible(false);
            console.log("false sya");
        }


        data.push(item);
    }

    console.log(JSON.stringify(data));

    $('#employeePie').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie',
            drilled: false,
            zoomType: 'xy',
            panning: true,
            panKey: 'shift'
        },
        title: {
            text: 'Licenses'
        },
        subtitle: {
            text: 'Click for further information'
        },
        xAxis: {
            type: 'category',
            tickWidth: 0,
            gridLineWidth: 1,
            labels: {
                align: 'left',
                x: 3,
                y: -3
            }
        },
        yAxis: [{// left y axis
                title: {
                    text: 'Score'
                },
                labels: {
                    align: 'left',
                    x: 3,
                    y: 16,
                    format: '{value:.,0f}'
                },
                showFirstLabel: false
            }],
        legend: {
            align: 'left',
            layout: 'vertical',
            verticalAlign: 'top',
            x: 40,
            floating: true,
            borderWidth: 0
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.y:.1f}</b>',
            shared: true,
            crosshairs: true
        },
        plotOptions: {
            series: {
                cursor: 'pointer',
                events: {
                    click: function (e) {
                        // Log to console

//                        JSON.stringify(event.point);
//                        console.log(event.point.empID + "point");
//                        window.location.replace("GetEmployeesByClient?SelectedGuard=" + 29);
                        window.location.href = "Ticketing.jsp";
                    }
                }
            },
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                showInLegend: true,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}: {point.y}',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
                name: 'Score',
                data: data
            }]

    });
}


/* To get the value of year dropdown in clientprofile.jsp */
$('#yearSelect').change(function () {
    var yearSelected = $(this).find(":selected").text();
    console.log(yearSelected);
    var clientID = document.getElementById("clientID").value;

    $.ajax({
        url: "viewClientGrade",
        type: 'POST',
        dataType: "JSON",
        data: {
            yearSelected: yearSelected,
            clientID: clientID
        },
        success: function (data) {
            //print = data;
            //chart(print);

            console.log(JSON.stringify(data) + "docu client profile ready");
            console.log(yearSelected + "yearselected");

            setEmployeeGrade(data);
        }, error: function (XMLHttpRequest, textStatus, exception) {
            alert(XMLHttpRequest.responseText);
        }
    });
});