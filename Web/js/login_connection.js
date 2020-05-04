function add_richtext() {
    window.location.href='index2.html';
}
// Create a client instance
client = new Paho.MQTT.Client("broker.mqttdashboard.com", 8000, "clientId");

// set callback handlers
client.onConnectionLost = onConnectionLost;
client.onMessageArrived = onMessageArrived;

// connect the client
client.connect({onSuccess:onConnect});

// called when the client connects
function onConnect() {
    // Once a connection has been made, make a subscription and send a message.
    console.log("onConnect");
    client.subscribe("Big Eater");
    message = buildMessage("admin","ug19091@bristol.ac.uk","123")
    message.destinationName = "Big Eater";
    client.send(message);
}

// called when the client loses its connection
function onConnectionLost(responseObject) {
    if (responseObject.errorCode !== 0) {
        console.log("onConnectionLost:"+responseObject.errorMessage);
    }
}

function buildMessage(datatype,name,password) {
    let dataObj = {
        datatype: datatype,
        main:{
            username: name,
            password: password
        }
    };
    let data = JSON.stringify(dataObj);
    let message = new Paho.MQTT.Message(data);
    return message;
}
// called when a message arrives
function onMessageArrived(message) {
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