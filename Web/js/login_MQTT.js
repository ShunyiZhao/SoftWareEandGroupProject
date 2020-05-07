function add_richtext() {
    window.location.href='/Web/index2.html';
}
// called when a message arrives
client.onMessageArrived = function (message){
    console.log("Theme: "+message.destinationName);
    console.log(message.payloadString);
    temp = jQuery.parseJSON(message.payloadString);
    if(temp.datatype == "admin"){
        $("#check").click (function () {
            if($('#inputEmail').val()==temp.main['username']&& $('#inputPassword').val()==temp.main['password']){
                    alert('Success Login!');
                    //dataStop  = buildMessage("stop_login","stop");
                    //requireStop(dataStop);
                    //subChart();
                    add_richtext();
                    return true;
            } else {
                    $('#inputEmail').val('');//clean
                    $('#inputPassword').val('');
                    alert('Fail Login');
                    return false;
            }
        });
    }
}