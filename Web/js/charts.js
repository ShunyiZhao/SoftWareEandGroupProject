var title=new Array();
var result=new Array();
function getResult(result){
    $.ajax({
    type:"GET",
    url: "json/chart.json",
    dataType: "json",
    async: false,
    success:function(data){
            $.each(data,function(name,value) {
                result.push(value)
            }); 
        }
    });
    result.shift()
    return result;
}
$('#chart').click(function(){
    result = getResult(result);
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
