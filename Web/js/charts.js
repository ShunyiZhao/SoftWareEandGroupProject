/* client.onMessageArrived = function (message) {
    console.log("Theme: "+message.destinationName);
    let msgObj = JSON.parse(message.payloadString);
    console.log(msgObj.datatype+"  "+msgObj.main['username']+msgObj.main['password']);
}

client.connect({onSuccess: function() {
    //submit user information when the button is clicked
    let messageBody = {
        username: username.value,
        password: password.value,
        status: 2
    };
    let message = buildMessage('web_login', messageBody);
        client.send(message);
}}); */

var result=new Array();
function getResult(path,result){
    $.ajax({
    type:"GET",
    url: path,
    dataType: "json",
    async: false,
    success:function(data){
            result.splice(0,result.length);
            $.each(data.main,function(name,value) {
                result.push(value)
            }); 
        }
    }); 
    return result;
}

$('#chart').click(function(){
    result = getResult("json/chart.json",result);
    result.shift()
    console.log(result)
    var myChart = echarts.init($('#mi-chart')[0]);
    var option1 = 
    {
        title: {
            text: 'User preference'
        },
        tooltip: {},
        xAxis: {
            data: ["salad","pineapple","fish","virus","crab","eggplant","cheese"]
        },
        yAxis: {},
        series: [{
        name: 'number',
        type: 'bar',
        data: result
        }],
        visualMap: {
            orient: 'horizontal',
            left: 'center',
            min: 0,
            max: 10,
            text: ['High Score', 'Low Score'],
            // Map the score column to color
            dimension: 0,
            inRange: {
                color: ['#D7DA8B', '#E15457']
            }
        },
        backgroundColor: 'rgba(248,241,230,0.7)'

    };
    myChart.setOption(option1);
});

    result = getResult("json/chart.json",result);
    result.shift()
    console.log(result)
    var myChart = echarts.init($('#mi-note')[0]);
    var option1 = 
    {
        title: {
            text: 'User Analysis'
        },
        tooltip: {},
        xAxis: {
            data: ["salad","pineapple","fish","virus","crab","eggplant","cheese"]
        },
        yAxis: {},
        series: [{
        name: 'number',
        type: 'bar',
        data: result
        }],
        visualMap: {
            orient: 'horizontal',
            left: 'center',
            min: 0,
            max: 10,
            text: ['High Score', 'Low Score'],
            // Map the score column to color
            dimension: 0,
            inRange: {
                color: ['#D7DA8B', '#E15457']
            }
        },
        backgroundColor: 'rgba(248,241,230,0.7)'

    };
    myChart.setOption(option1);
