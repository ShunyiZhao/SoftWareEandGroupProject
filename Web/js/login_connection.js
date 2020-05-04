function add_richtext() {
    window.location.href='index2.html';
}
// called when a message arrives
client.onMessageArrived = function (message)  {
    console.log("Theme: "+message.destinationName);
    temp = jQuery.parseJSON(message.payloadString);
    if(temp.datatype == "admin"){
        $("#check").click (function () {
        if($('#inputEmail').val()==temp.main['username']&& $('#inputPassword').val()==temp.main['password']){
                alert('Success Login!');
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