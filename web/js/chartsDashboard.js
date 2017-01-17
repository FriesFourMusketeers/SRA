$(document).ready(function () {
    var yearSelected = $("#yearSelect").find(":selected").text();
    console.log(yearSelected + " is selected");
    $.getJSON("viewPerformanceClientBar", function (data) {

        setChartBar(data);
        console.log(data + "pumasok bar data");
    });
    $.getJSON("viewLicensePie", function (data) {

        setChartLicense(data);
        console.log(data + "pumasok pie data");
    });
    $.ajax({
        url: "viewPerformanceD",
        type: 'POST',
        dataType: "JSON",
        data: {
            yearSelected: yearSelected
        },
        success: function (data) {
            console.log(data + "docu ready1");
            if (data != null) {
                setChart(data);
            }

        }, error: function (XMLHttpRequest, textStatus, exception) {
            console.log(textStatus);
        }
    });
});
/* LINE CHART STARTS HERE */
// For dashboard performance as a whole
function setChart(print) {

    var data = [];
    var drilldownValues = [];
    var threshold = [];
    var month = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

    for (var x = 0; x < month.length; x++) {
        var totals = 0;
        item = {};
        item["name"] = month[x]; // x axis

        for (var i = 0; i < print[0].series.length; i++) {
            if (month [x] === print[0].series[i].month) {
                totals += print[0].series[i].y;
                item["drilldown"] = month[x] // id

                var drilldownData = [];
                for (var j = 0; j < print[0].drilldown.length; j++) {
                    if (print[0].drilldown[j].month === print[0].series[i].month) {
                        item2 = {};
                        item2["name"] = print[0].drilldown[i].month;
                        item2["id"] = print[0].drilldown[i].month;
                        drilldownfirst = {};
                        drilldownfirst["name"] = print[0].drilldown[j].weeks;
                        drilldownfirst["y"] = print[0].drilldown[j].y;
                        if (print[0].drilldown[j].y < 75) { // 75 (threshold) must be a variable from db
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
        if (totals < 75) { // 75 (threshold) must be a variable from db
            item['color'] = '#ff0000';
        }

        data.push(item);
    }


//    for (var i = 0; i < print[0].series.length; i++) {
//        var totals = 0;
//        item = {};
//        item["name"] = print[0].series[i].month; // x axis
//        item["drilldown"] = print[0].series[i].month; // id
//        item["y"] = print[0].series[i].y; // y axis
//        if (print[0].series[i].y < 75) { // 75 (threshold) must be a variable from db
//            item['color'] = '#ff0000';
//        }
//        data.push(item);
//
//    }
//    alert(data[0].name + " " + data[0].id + " " + data[0].y);



//    alert(data[1].name + " " + data[1].y);

    console.log(JSON.stringify(data));
    $('#container').highcharts({
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
            text: 'Performance as a Whole'
        },
        xAxis: {
            tickWidth: 0,
            type: 'category',
//            categories:['Jan','Feb', 'Mar', 'April', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'],

            rotation: 0,
            labels: {
                align: 'right'
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
                        id: 'passinggrade',
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
        plotOptions: {
            series: {
                cursor: 'pointer'
            }
        },
        series: [{
                name: 'Score',
                id: 'primary',
                type: 'spline',
                data: data,
                zones: threshold
            }, {
                name: 'Score Trendline',
                linkedTo: 'primary',
                showInLegend: true,
                enableMouseTracking: false,
                type: 'trendline',
                algorithm: 'linear'
            }, {
                color: '#FF0000',
                name: 'Passing Grade',
                marker: {
                    enabled: false
                }
//                ,
//                events: {
//                    // Event for showing/hiding plot line
//                    legendItemClick: function (e) {
//                        if (this.visible) {
//                            this.chart.yAxis[0].removePlotLine(passinggrade);
//                        }
//                        else {
//                            this.chart.yAxis[0].addPlotLine(passinggrade);
//                        }
//                    }
//                }
            }
        ],
        drilldown: {
            series: drilldownValues
        }
    });
}


/* LINE CHART ENDS HERE */

/* BAR CHART STARTS HERE */
// For dashboard client bar
function setChartBar(print) {

    //top level
//    for (int i = 0; i < size; i++) {
//        var item = {};
//        item["name"]; //name for display
//        item["drilldown"]; //value of id for drilldown
//        item["y"]; //value/amount to be shown
//    }
//    
//    //clicking a point from top level
//    for (int i = 0; i < size; i++) {
//        var item = {};
//        item["name"]; //name for display
//        item["id"]; //must be same with drilldown value
//        var drilldownValues = {};
//        for (int j = 0; j < size; j++) {
//            var itemDrilldown = {};
//            itemDrilldown["name"]; //name for display
//            itemDrilldown["y"]; //value/amount to be shown
//            itemDrilldown[""];
//            drilldownValues.push(itemDrilldown);
//        }
//        item["data"] = drilldownValues;
//    }

//    var data = [];
//    
//
//    for (var x = 0; x < scorebracket.length; x++) {
//        var count = 0;
//        item = {};
//        item["name"] = bracket[x]; // x axis 1st
//
//        for (var i = 0; i < print[0].series[i].length; i++) {
//            var drilldownData = [];
//            if (print[0].series[i].clientScore >= 96 && print[0].series[i].clientScore <= 100) {
//                item["drilldown"] = bracket[x];
//                count++;
//
//                item2 = {};
//                item2["name"] = print[0].series[i].type;
//                item2["id"] = print[0].drilldown[i].type;
//
//                drilldownfirst = {};
//            }
//            else if (print[0].series[i].clientScore >= 91 && print[0].series[i].clientScore <= 95) {
//                count++;
//
//            }
//            else if (print[0].series[i].clientScore >= 86 && print[0].series[i].clientScore <= 90) {
//                count++;
//
//            }
//            else if (print[0].series[i].clientScore >= 81 && print[0].series[i].clientScore <= 85) {
//                count++;
//
//            }
//            else if (print[0].series[i].clientScore >= 76 && print[0].series[i].clientScore <= 80) {
//                count++;
//
//            }
//            else if (print[0].series[i].clientScore >= 71 && print[0].series[i].clientScore <= 75) {
//                count++;
//
//            }
//        }
//
//        item["y"] = count; // y axis 1st
//        data.push(item);
//    }



    var data = [];
    var drilldownType = [];
    var drilldown1 = []; // this is one series. for getting the whole series of drilldown data

    var drilldownValues = []; // for 3rd drilldown
    var drilldown2 = []; // for 2nd series

    var firstCounter = 0;
    var secondCounter = 0;
    var thirdCounter = 0;
    var fourthCounter = 0;
    var fifthCounter = 0;
    var sixthCounter = 0;
    var seventhCounter = 0;
    var eigthCounter = 0;
    var firstCounterBank = 0;
    var firstCounterBasic = 0;
    var firstCounterMall = 0;
    var secondCounterBank = 0;
    var secondCounterBasic = 0;
    var secondCounterMall = 0;
    var thirdCounterBank = 0;
    var thirdCounterBasic = 0;
    var thirdCounterMall = 0;
    var fourthCounterBank = 0;
    var fourthCounterBasic = 0;
    var fourthCounterMall = 0;
    var fifthCounterBank = 0;
    var fifthCounterBasic = 0;
    var fifthCounterMall = 0;
    var sixthCounterBank = 0;
    var sixthCounterBasic = 0;
    var sixthCounterMall = 0;
    var seventhCounterBank = 0;
    var seventhCounterBasic = 0;
    var seventhCounterMall = 0;
    var eigthCounterBank = 0;
    var eigthCounterBasic = 0;
    var eigthCounterMall = 0

    var gradeBrackets = ['96-100', '91-95', '86-90', '81-85', '76-80', '71-75', '66-70', '61-65'];

    var types = ['Bank', 'Mall', 'Basic'];

    for (var x = 0; x < gradeBrackets.length; x++) {
        for (var v = 0; v < types.length; v++) {
            item = {};
            item["name"] = types[v];
            item["id"] = gradeBrackets[x] + types[v];
            var data2 = [];
            for (var i = 0; i < print[0].series.length; i++) {
                var grade;
                if (print[0].series[i].clientScore >= 96 && print[0].series[i].clientScore <= 100) {
                    var grade = "96-100";
                }
                if (print[0].series[i].clientScore >= 91 && print[0].series[i].clientScore <= 95) {
                    var grade = "91-95";
                }
                if (print[0].series[i].clientScore >= 86 && print[0].series[i].clientScore <= 89) {
                    var grade = "86-90";
                }
                if (print[0].series[i].clientScore >= 81 && print[0].series[i].clientScore <= 85) {
                    var grade = "81-85";
                }
                if (print[0].series[i].clientScore >= 76 && print[0].series[i].clientScore <= 80) {
                    var grade = "76-80";
                }
                if (print[0].series[i].clientScore >= 71 && print[0].series[i].clientScore <= 75) {
                    var grade = "71-75";
                }
                if (print[0].series[i].clientScore >= 66 && print[0].series[i].clientScore <= 70) {
                    var grade = "66-70";
                }
                if (print[0].series[i].clientScore >= 61 && print[0].series[i].clientScore <= 65) {
                    var grade = "61-65";
                }
                if (grade == gradeBrackets[x]) {
                    if (print[0].series[i].type == types[v]) {
                        drilldownsecond = {};
                        drilldownsecond["name"] = print[0].series[i].clientName;
                        drilldownsecond["y"] = print[0].series[i].clientScore;
                        drilldownsecond["id"] = grade + types[v];

                        drilldownsecond["clientID"] = print[0].series[i].clientID;

                        data2.push(drilldownsecond);

                        console.log(print[0].series[i].clientName + print[0].series[i].clientScore);
                    }
                }
//                    else if (print[0].series[i].type == "Basic") {
//                    }
//                    else if (print[0].series[i].type == "Mall") {
//                    }
            }
            if (data2.length === 0 || data2 == null) {
                drilldownsecond = {};
                drilldownsecond["name"] = "none";
                drilldownsecond["y"] = 0;
                data2.push(drilldownsecond);
            }
            console.log(data2.length + "length");
            item["data"] = data2;
            drilldown1.push(item);
        }

    }

    console.log(JSON.stringify(drilldown1) + "gradess");
    for (var i = 0; i < print[0].series.length; i++) {
        var totals = 0;
        item = {};
        item["name"] = print[0].series[i].clientName; //x axis
        item["y"] = print[0].series[i].clientScore; // y axis
//        console.log(print[0].series[i].clientID + "clientid");
        if (print[0].series[i].clientScore <= 85) {
            item['color'] = '#ff0000';
        }

        if (print[0].series[i].clientScore >= 96 && print[0].series[i].clientScore <= 100) {
            firstCounter++;
            if (print[0].series[i].type == "Bank") {
                firstCounterBank++;
                //item[]  put ung mag item name and y for 2nd drilldown
            }
            else if (print[0].series[i].type == "Basic") {
                firstCounterBasic++;
            }
            else if (print[0].series[i].type == "Mall") {
                firstCounterMall++;
            }
        }
        else if (print[0].series[i].clientScore >= 91 && print[0].series[i].clientScore <= 95) {
            secondCounter++;
            if (print[0].series[i].type == "Bank") {
                secondCounterBank++;
            }
            else if (print[0].series[i].type == "Basic") {
                secondCounterBasic++;
            }
            else if (print[0].series[i].type == "Mall") {
                secondCounterMall++;
            }
        }
        else if (print[0].series[i].clientScore >= 86 && print[0].series[i].clientScore <= 90) {
            thirdCounter++;
            if (print[0].series[i].type == "Bank") {
                thirdCounterBank++;
            }
            else if (print[0].series[i].type == "Basic") {
                thirdCounterBasic++;
            }
            else if (print[0].series[i].type == "Mall") {
                thirdCounterMall++;
            }
        }
        else if (print[0].series[i].clientScore >= 81 && print[0].series[i].clientScore <= 86) {
            fourthCounter++;
            if (print[0].series[i].type == "Bank") {
                fourthCounterBank++;
            }
            else if (print[0].series[i].type == "Basic") {
                fourthCounterBasic++;
            }
            else if (print[0].series[i].type == "Mall") {
                fourthCounterMall++;
            }

        }
        else if (print[0].series[i].clientScore >= 76 && print[0].series[i].clientScore <= 80) {
            fifthCounter++;
            if (print[0].series[i].type == "Bank") {
                fifthCounterBank++;
            }
            else if (print[0].series[i].type == "Basic") {
                fifthCounterBasic++;
            }
            else if (print[0].series[i].type == "Mall") {
                fifthCounterMall++;
            }
        }
        else if (print[0].series[i].clientScore >= 71 && print[0].series[i].clientScore <= 75) {
            sixthCounter++;
            if (print[0].series[i].type == "Bank") {
                sixthCounterBank++;
            }
            else if (print[0].series[i].type == "Basic") {
                sixthCounterBasic++;
            }
            else if (print[0].series[i].type == "Mall") {
                sixthCounterMall++;
            }
        }
        else if (print[0].series[i].clientScore >= 66 && print[0].series[i].clientScore <= 70) {
            seventhCounter++;
            if (print[0].series[i].type == "Bank") {
                seventhCounterBank++;
            }
            else if (print[0].series[i].type == "Basic") {
                seventhCounterBasic++;
            }
            else if (print[0].series[i].type == "Mall") {
                seventhCounterMall++;
            }
        }
        else if (print[0].series[i].clientScore >= 61 && print[0].series[i].clientScore <= 65) {
            eigthCounter++;
            if (print[0].series[i].type == "Bank") {
                eigthCounterBank++;
            }
            else if (print[0].series[i].type == "Basic") {
                eigthCounterBasic++;
            }
            else if (print[0].series[i].type == "Mall") {
                eigthCounterMall++;
            }
        }
    }
    // main chart
    item = {};
    item["name"] = "96-100";
    item['color'] = '#03bc09';
    item["y"] = firstCounter;
    item["drilldown"] = "first";
    data.push(item);
    // for drilldown type
    drillType = {};
    drillType["name"] = "type";
    drillType["id"] = "first";
    values = [];
    drillType2 = {};
    drillType2["name"] = "Bank";
    drillType2["y"] = firstCounterBank;
    drillType2["drilldown"] = "96-100Bank";
    drilldownType.push(drillType2);
    drillType2 = {};
    drillType2["name"] = "Basic";
    drillType2["y"] = firstCounterBasic;
    drillType2["drilldown"] = "96-100Basic";
    drilldownType.push(drillType2);
    drillType2 = {};
    drillType2["name"] = "Mall";
    drillType2["y"] = firstCounterMall;
    drillType2["drilldown"] = "96-100Mall";
    drilldownType.push(drillType2);
    drillType["data"] = values;
    drilldown1.push(drillType);
    //2nd
    item = {};
    item["name"] = "91-95";
    item['color'] = '#99ef67';
    item["y"] = secondCounter;
    item["drilldown"] = "second";
    data.push(item);
    //for drilldown type 2nd
    drillType = {};
    drillType["name"] = "type";
    drillType["id"] = "second";
    values = [];
    drillType2 = {};
    drillType2["name"] = "Bank";
    drillType2["y"] = secondCounterBank;
    drillType2["drilldown"] = "91-95Bank";
    values.push(drillType2);
    drillType2 = {};
    drillType2["name"] = "Basic";
    drillType2["y"] = secondCounterBasic;
    drillType2["drilldown"] = "91-95Basic";
    values.push(drillType2);
    drillType2 = {};
    drillType2["name"] = "Mall";
    drillType2["y"] = secondCounterMall;
    drillType2["drilldown"] = "91-95Mall";
    drilldownType.push(drillType2);
    drillType["data"] = values;
    drilldown1.push(drillType);
    // 3rd
    item = {};
    item["name"] = "86-90";
    item["y"] = thirdCounter;
    item["drilldown"] = "third";
    data.push(item);
    //for drilldown type 3rd
    drillType = {};
    drillType["name"] = "type";
    drillType["id"] = "third";
    values = [];
    drillType2 = {};
    drillType2["name"] = "Bank";
    drillType2["y"] = thirdCounterBank;
    drillType2["drilldown"] = "86-90Bank";
    values.push(drillType2);
    drillType2 = {};
    drillType2["name"] = "Basic";
    drillType2["y"] = thirdCounterBasic;
    drillType2["drilldown"] = "86-90Basic";
    values.push(drillType2);
    drillType2 = {};
    drillType2["name"] = "Mall";
    drillType2["y"] = thirdCounterMall;
    drillType2["drilldown"] = "86-90Mall";
    values.push(drillType2);
    drillType["data"] = values;
    drilldown1.push(drillType);
    // 4th
    item = {};
    item["name"] = "81-85";
    item["y"] = fourthCounter;
    item["drilldown"] = 'fourth';
    data.push(item);
    //for drilldown type 4th
    drillType = {};
    drillType["name"] = "type";
    drillType["id"] = 'fourth';
    values = [];
    drillType2 = {};
//    drillType["drilldown"] = "fourth";
    drillType2["name"] = "Bank";
    drillType2["y"] = fourthCounterBank;
    drillType2["drilldown"] = "81-85Bank";
//    drillType["id"] = "fourth";
    values.push(drillType2);
    drillType2 = {};
    drillType2["name"] = "Basic";
    drillType2["y"] = fourthCounterBasic;
    drillType2["drilldown"] = "81-85Basic";
    values.push(drillType2);
    drillType2 = {};
    drillType2["name"] = "Mall";
    drillType2["y"] = fourthCounterMall;
    drillType2["drilldown"] = "81-85Mall";
    values.push(drillType2);
    drillType["data"] = values;
    drilldown1.push(drillType);
    // fifth

    item = {};
    item["name"] = "76-80";
    item["y"] = fifthCounter;
    item['color'] = '#e8d829';
    item['drilldown'] = 'fifth'
    data.push(item);
    // for drilldown type 5th
    drillType = {};
    drillType["name"] = "type";
    drillType["id"] = "fifth";
    values = [];
    drillType2 = {};
    drillType2["name"] = "Bank";
    drillType2["y"] = fifthCounterBank;
    drillType2["drilldown"] = "76-80Bank";
    values.push(drillType2);
    drillType2 = {};
    drillType2["name"] = "Basic";
    drillType2["y"] = fifthCounterBasic;
    drillType2["drilldown"] = "76-80Basic";
    values.push(drillType2);
    drillType2 = {};
    drillType2["name"] = "Mall";
    drillType2["y"] = fifthCounterMall;
    drillType2["drilldown"] = "76-80Mall";
    values.push(drillType2);
    drillType["data"] = values;
    drilldown1.push(drillType);
    //sixth

    item = {};
    item["name"] = "71-75";
    item["y"] = sixthCounter;
    item['color'] = '#fca207';
    item['drilldown'] = 'sixth';
    data.push(item);
    // drilldown type 6th
    drillType = {};
    drillType["name"] = "type";
    drillType["id"] = "sixth";
    values = [];
    drillType2 = {};
    drillType2["name"] = "Bank";
    drillType2["y"] = sixthCounterBank;
    drillType2["drilldown"] = "71-75Bank";
    values.push(drillType2);
    drillType2 = {};
    drillType2["name"] = "Basic";
    drillType2["y"] = sixthCounterBasic;
    drillType2["drilldown"] = "71-75Basic";
    values.push(drillType2);
    drillType2 = {};
    drillType2["name"] = "Mall";
    drillType2["y"] = sixthCounterMall;
    drillType2["drilldown"] = "71-75Mall";
    values.push(drillType2);
    drillType["data"] = values;
    drilldown1.push(drillType);
    // seventh

    item = {};
    item["name"] = "66-69";
    item["y"] = seventhCounter;
    item['color'] = '#e56ed9';
    item['drilldown'] = 'seventh';
    data.push(item);
    // drilldown type 7th
    drillType = {};
    drillType["name"] = "type";
    drillType["id"] = "seventh";
    values = [];
    drillType2 = {};
    drillType2["name"] = "Bank";
    drillType2["y"] = seventhCounterBank;
    drillType2["drilldown"] = "66-70Bank";
    values.push(drillType2);
    drillType2 = {};
    drillType2["name"] = "Basic";
    drillType2["y"] = seventhCounterBasic;
    drillType2["drilldown"] = "66-70Basic";
    values.push(drillType2);
    drillType2 = {};
    drillType2["name"] = "Mall";
    drillType2["y"] = seventhCounterMall;
    drillType2["drilldown"] = "66-70Mall";
    values.push(drillType2);
    drillType["data"] = values;
    drilldown1.push(drillType);
    // eigth

    item = {};
    item["name"] = "61-65";
    item["y"] = eigthCounter;
    item['color'] = '#e52041';
    item['drilldown'] = 'eigth';
    data.push(item);
    // drilldown type 8th
    drillType = {};
    drillType["name"] = "type";
    drillType["id"] = "eigth";
    values = [];
    drillType2 = {};
    drillType2["name"] = "Bank";
    drillType2["y"] = eigthCounterBank;
    drillType2["drilldown"] = "61-65Bank";
    values.push(drillType2);
    drillType2 = {};
    drillType2["name"] = "Basic";
    drillType2["y"] = eigthCounterBasic;
    drillType2["drilldown"] = "61-65Basic";
    values.push(drillType2);
    drillType2 = {};
    drillType2["name"] = "Mall";
    drillType2["y"] = eigthCounterMall;
    drillType2["id"] = "61-65Mall";
    values.push(drillType2);


    drillType["data"] = values;
    drilldown1.push(drillType);


    var counter = 0; // for the getting of client ID in events below

    $('#clientBarChart').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'bar',
            drilled: false,
            events: {
                drilldown: function (e) {
                    counter++;
                },
                drillup: function (e) {
                    counter--;
                }
            }
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
                align: 'right'
            },
            scrollbar: {
                enabled: true
            }
        },
        yAxis: [{// left y axis
                title: {
                    text: 'Score'
                },
                labels: {
                    align: 'left',
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
            bar: {
                dataLabels: {
                    enabled: true
                }
            },
            series: {
                cursor: 'pointer',
                events: {
                    click: function (e) {
                        if (counter == 2) {
////                        // Log to console
////
//////                        JSON.stringify(event.point);
//////                        console.log(event.point.empID + "point");
//////                        window.location.replace("GetEmployeesByClient?SelectedGuard=" + 29);
////                        console.log(event.point.name);
                            window.location.href = "ChartRedirect?redirect=ClientProfile&clientID=" + event.point.clientID;
                        }
                    }
                }
            }
        },
        series: [{
                name: 'Score',
                data: data
            }],
        drilldown: {
            series: drilldown1
        }


    });
}



/* BAR CHART ENDS HERE */

/* PIE CHART STARTS HERE */
/* for dashboard license pie*/
function setChartLicense(print) {

    var data = [];
    for (var i = 0; i < print[0].series.length; i++) {
        var totals = 0;
        item = {};
        item["name"] = print[0].series[i].licenseType;
        item["y"] = print[0].series[i].count;
        item["url"] = print[0].series[i].url;
        if (print[0].series[i].count < 15) {
            item['color'] = '#ff0000';
        }
        data.push(item);
    }

    console.log(JSON.stringify(data));
    $('#licensePieChart').highcharts({
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
                        window.location.href = "EmployeeListNew.jsp";
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
                name: 'Count',
                data: data
            }]

    });
}


/* PIE CHART ENDS HERE */


/* To get the value of year dropdown in dashboard.jsp */
$('#yearSelect').change(function () {
    var yearSelected = $(this).find(":selected").text();
    console.log(yearSelected);
    $.ajax({
        url: "viewPerformanceD",
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
            setChart(data);
        }, error: function (XMLHttpRequest, textStatus, exception) {
            alert(XMLHttpRequest.responseText);
        }
    });
});

