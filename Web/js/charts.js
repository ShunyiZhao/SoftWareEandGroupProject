var result=new Array();
function getResult(result){
    $.ajax({
    type:"GET",
    url: "json/chart.json",
    dataType: "json",
    async: false,
    success:function(data){
            var i=0;
            $.each(data,function(name,value) {
                result[i] = value;
                i++;
            }); 
        }
    });
    return result;
}
result = getResult(result);
var myChart = echarts.init($('#mi-chart')[0]);
        // 指定图表的配置项和数据
var option = 
{
            title: {
                text: 'User preference'
            },
            tooltip: {},
            legend: {
                data:['number']
            },
            xAxis: {
                data: ["salad","pineapple","fish","virus","crab","eggplant","cheese"]
            },
            yAxis: {},
            series: [{
                name: 'number',
                type: 'bar',
                data: result[0]
            }]
};
// show
myChart.setOption(option);