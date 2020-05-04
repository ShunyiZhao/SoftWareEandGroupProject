client.onMessageArrived = function (message)  {
    console.log(message.payloadString);
    var temp = jQuery.parseJSON(message.payloadString);
    if(temp.datatype == "chart"){
        console.log("chart")
        console.log(temp.main)
        var result=getResult(temp);
        //console.log(result)
        setScore(result);
        setPreference(result);
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
    console.log(score)
    var myChart1 = echarts.init($('#mi-score')[0]);
    var option = 
    {
            title: {
                text: 'User Score'
            },
            tooltip: {},
            xAxis: {
                data: ["score","bonus","combo"]
            },
            yAxis: {
                min: 0,
                max: max,
            },
            series: [{
                name: 'number',
                type: 'bar',
                data: score
            }],
            visualMap: {
                type: 'continuous',
                orient: 'horizontal',
                left: 'center',
                min: 0,
                max: max,
                text: ['High Score', 'Low Score'],
                // Map the score column to color
                dimension: 1,
                inRange: {
                    color: ['#D7DA8B', '#E15457']
                },
            },
            backgroundColor: 'rgba(248,241,230,0.7)'
    
    };
    myChart1.setOption(option);
}

function setPreference(result){
    result.shift()
    result.shift()
    result.shift()
    var max = Math.max(...result)+1
    console.log(max)
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
            yAxis: {
                min: 0,
                max: max
            },
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
                dimension: 1,
                inRange: {
                    color: ['#D7DA8B', '#E15457']
                }
            },
            backgroundColor: 'rgba(248,241,230,0.7)'
    
    };
    myChart.setOption(option1);
}


