$(document).ready(function () {
    var employeeID = document.getElementById("employeeID").value;
    console.log(employeeID);
    var yearSelected = $("#yearSelect").find(":selected").text();
    console.log(yearSelected + " is selected");


    $.ajax({
        url: "viewEmployeeGrade",
        type: 'POST',
        dataType: "JSON",
        data: {
            employeeID: employeeID,
            yearSelected: yearSelected
        },
        success: function (data) {
            console.log(data + "employeeID ready");
            if (data != null) {
                setEmployeeGrade(data);

            }

            if (data[0].series[data[0].series.length - 1].score > 75) {
                $('#Retrain').show();
                console.log("sda");
            }
            else {
                $('#Retrain').hide();
                console.log("sade");
            }

        }, error: function (XMLHttpRequest, textStatus, exception) {
            console.log(textStatus + "textStatus");
        }
    });
});


// For employee Grade
function setEmployeeGrade(print) {

    var data = [];
    var threshold = [];


    for (var i = 0; i < print[0].series.length; i++) {
        var totals = 0;

        item = {};
        item["name"] = print[0].series[i].month; // x axis
        item["y"] = print[0].series[i].score; // y axis
        if (print[0].series[i].y < 75) { // 75 (threshold) must be a variable from db
            item['color'] = '#ff0000';
        }
        data.push(item);

    }

//    item2 = {};
//    item2["value"] = 75; // y axis
//    threshold.push(item2);
//    item2['color'] = '#0066ff'; // blue
//    threshold.push(item2);

    console.log(JSON.stringify(data));



    var empchart = new Highcharts.Chart({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'line',
            renderTo: 'empGrade',
            drilled: false,
            zoomType: 'xy',
            panning: true,
            panKey: 'shift'
        },
        title: {
            text: 'Employee'
        },
        xAxis: {
            tickWidth: 0,
            type: 'category',
//            categories:['Jan','Feb', 'Mar', 'April', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'],

            rotation: -45,
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
                tickInterval: 10,
                title: {
                    text: null
                },
                labels: {
                    align: 'left',
                    x: 3,
                    y: 16,
                    format: '{value:.,0f}'
                },
                plotLines: [{
                        color: '#FF0000', // passing grade
                        width: 2,
                        value: 75,
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
        series: [{
                name: 'Score',
                id: 'primary',
                type: 'spline',
                data: data,
                zones: threshold
            }, {
                name: 'Linear Trendline',
                linkedTo: 'primary',
                showInLegend: true,
                enableMouseTracking: false,
                type: 'trendline',
                algorithm: 'linear'
            }

        ]

    });

}
/* To get the value of year dropdown in dashboard.jsp */
$('#yearSelect').change(function () {
    var yearSelected = $(this).find(":selected").text();
    console.log(yearSelected);
    var employeeID = document.getElementById("employeeID").value;
    $.ajax({
        url: "viewEmployeeGrade",
        type: 'POST',
        dataType: "JSON",
        data: {
            employeeID: employeeID,
            yearSelected: yearSelected
        },
        success: function (data) {
            //print = data;
            //chart(print);

            console.log(JSON.stringify(data) + "docu ready3");
            console.log(yearSelected + "yearselected");
            setEmployeeGrade(data);
        }, error: function (XMLHttpRequest, textStatus, exception) {
            alert(XMLHttpRequest.responseText);
        }
    });
});
