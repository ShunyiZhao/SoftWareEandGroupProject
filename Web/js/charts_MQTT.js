client.onMessageArrived = function (message)  {
    console.log(message.payloadString);
    var temp = jQuery.parseJSON(message.payloadString);
    if(temp.datatype == "chart"){
        console.log("chart")
        console.log(temp.main)
        var result=getResult(temp);
        console.log(result)
        setPreference(result);
        setScore(result);
    }
}

function getResult(temp){
    var result=new Array();
    $.each(temp.main,function(name,value) {
        result.push(value)
    }); 
    return result;
}

function setScore(result){
    var score = result.slice(0,3)
    var max = Math.max(...score)+1
    var myChart = echarts.init($('#mi-score')[0]);
    var option = 
    {
            title: {
                text: 'User Score'
            },
            tooltip: {},
            xAxis: {
                data: ["score","bonus","combo"]
            },
            yAxis: {},
            series: [{
            name: 'number',
            type: 'bar',
            data: score
            }],
            visualMap: {
                orient: 'horizontal',
                left: 'center',
                min: 0,
                max: max,
                text: ['High Score', 'Low Score'],
                // Map the score column to color
                dimension: 0,
                inRange: {
                    color: ['#D7DA8B', '#E15457']
                }
            },
            backgroundColor: 'rgba(248,241,230,0.7)'
    
    };
    myChart.setOption(option);
}

function setPreference(result){
    result.shift()
    result.shift()
    result.shift()
    var max = Math.max(...result)+1
    var myChart = echarts.init($('#mi-chart')[0]);
    var option1 = 
    {
            title: {
                text: 'User Preference'
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
                max: max,
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
}


