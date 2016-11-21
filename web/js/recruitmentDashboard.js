$(document).ready(function () {
    var yearSelected = $("#yearSelectApplicants").find(":selected").text();
    console.log(yearSelected + " is selected");


    $.getJSON("viewApplicantBar", function (data) {

        setApplicantsBar(data);
        console.log(data + "pumasok applicants bar data");
    });

    $.getJSON("viewApplicantPlaces", function (data) {

        setApplicantsPlaces(data);
        console.log(data + "pumasok applicants pie data");
    });


    $.ajax({
        url: "viewApplicantsHired",
        type: 'POST',
        dataType: "JSON",
        data: {
            yearSelected: yearSelected
        },
        success: function (data) {
            console.log(data + "docu ready1");
            if (data != null) {
                setApplicantsHired(data);
                console.log(data + "pumasok applicants hired data");
            }

        }, error: function (XMLHttpRequest, textStatus, exception) {
            console.log(textStatus);
        }
    });

});


// For recruitment dashboard applicants hired
function setApplicantsHired(print) {

    var data = [];
    var data2 = [];
    var threshold = [];
    var month = ['January', 'February', 'March', 'April', 'May', 'June', 'July' ,'August' ,'September', 'October' ,'November' ,'December'];

    for (var x = 0; x < month.length; x++) {
        var totals = 0;
        item = {};
        item["name"] = month[x]; // x axis
        
        for (var i = 0; i < print[0].series.length; i++) {
            if (month [x] == print[0].series[i].month) {
                totals += print[0].series[i].count;
                
            }
        }
        item["y"] = totals; // y axis
        if (totals > 5) { // 75 (threshold) must be a variable from db
            item['color'] = '#ff0000';
        }

        data.push(item);
        console.log(JSON.stringify(print[0].series) + "gian");

        var totals2 = 0;
        item2 = {};
        item2["name"] = month[x]; // x axis
        for (var i = 0; i < print[0].series2.length; i++) {


            for (var i = 0; i < print[0].series2.length; i++) {

                if (month [x] == print[0].series2[i].month) {
                    totals2 += print[0].series2[i].count;

                }
            }
            item2["y"] = totals2; // y axis
            if (totals2 < 2) { // 75 (threshold) must be a variable from db
                item2['color'] = '#ff0000';
            }
            data2.push(item2);
            console.log(JSON.stringify(print[0].series) + "gian2");
        }
    }
//    item2 = {};
//    item2["value"] = 75; // y axis
//    threshold.push(item2);
//    item2['color'] = '#0066ff'; // blue
//    threshold.push(item2);

    console.log(JSON.stringify(data));

    $('#applicantsHiredContainer').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'line',
            drilled: false,
            zoomType: 'xy',
            panning: true,
            panKey: 'shift'
        },
        title: {
            text: 'Number of Applicants per month in a year'
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
                value: 5,
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
                name: 'Number of Applicants',
                id: 'primary',
                type: 'spline',
                data: data2,
                zones: threshold
            },
            { name: 'Number of Hired',
                id: 'primary2',
                type: 'spline',
                data: data,
                zones: threshold
            }, 
            {
                name: 'Applicants Trendline',
                linkedTo: 'primary',
                showInLegend: true,
                enableMouseTracking: false,
                color: '#6babe9',
                type: 'trendline',
                algorithm: 'linear'
            }
            ,
            {
                name: 'Hired Trendline',
                linkedTo: 'primary2',
                showInLegend: true,
                enableMouseTracking: false,
                color: '#000000',
                type: 'trendline',
                algorithm: 'linear' 
        }

        ],
        

    });

}

function setApplicantsBar(print) {

    var data = [];
    for (var i = 0; i < print[0].series.length; i++) {
        var totals = 0;
        item = {};
        item["name"] = print[0].series[i].status; //x axis
        item["y"] = print[0].series[i].count; // y axis
        data.push(item);
    }

    console.log(JSON.stringify(data));

    $('#applicantBarChart').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'column',
            drilled: false,
        },
        title: {
            text: '# of recruits, interview left, hired, rejected'
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
                data: data
            }]

    }); 
}


function setApplicantsPlaces(print) {

    var data = [];
    for (var i = 0; i < print[0].series.length; i++) {
        var totals = 0;
        item = {};
        item["name"] = print[0].series[i].city;
        
        console.log(print[0].series[i].city + "it prints");
        item["y"] = print[0].series[i].count;
        if (print[0].series[i].count < 3) {
            item['color'] = '#ff0000';
        }
        data.push(item);
    }

    console.log(JSON.stringify(data + "cities"));

    $('#placesPieChart').highcharts({
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
            text: 'Places'
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
                name: 'Count',
                data: data
            }]

    });  
}






/* To get the value of year dropdown in recruitmentdashboard.jsp */
$('#yearSelectApplicants').change(function () {
    var yearSelected = $(this).find(":selected").text();
    console.log(yearSelected);


    $.ajax({
        url: "viewApplicantsHired",
        type: 'POST',
        dataType: "JSON",
        data: {
            yearSelected: yearSelected
        },
        success: function (data) {
            //print = data;
            //chart(print);

            console.log(JSON.stringify(data) + "docu ready3");
            console.log(yearSelected + "yearselected");

            setApplicantsHired(data);

        }, error: function (XMLHttpRequest, textStatus, exception) {
            alert(XMLHttpRequest.responseText);
        }
    });
});

