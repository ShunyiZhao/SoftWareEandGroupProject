// Create a client instance, we create a random id so the broker will allow multiple sessions

client = new Paho.MQTT.Client("broker.mqttdashboard.com", 8000, "clientId" + makeid(3)) ;

// set callback handlers
client.onConnectionLost = onConnectionLost;
client.onMessageArrived = onMessageArrived;

// connect the client
client.connect({onSuccess:onConnect});


// called when the client connects
function onConnect() {
    // Once a connection has been made report.
    console.log("onConnect_init");
    //test admin pass--will be del after connect with processing
    client.subscribe("Big Eater");
    var mainMsg = buildLoginJson("mz19460@bristol.ac.uk","123")
    data = buildMessage("admin",mainMsg)
    message = new Paho.MQTT.Message(data);
    message.destinationName = "Big Eater";
    client.send(message);
}

// called when the client loses its connection
function onConnectionLost(responseObject) {
  if (responseObject.errorCode !== 0) {
    console.log("onConnectionLost:"+responseObject.errorMessage);
  }
}

// called when a message arrives
function onMessageArrived(message) {
  console.log("onMessageArrived:"+message.payloadString);
}

// called to generate the IDs
function makeid(length) {
    var result           = '';
    var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for ( var i = 0; i < length; i++ ) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}

function buildMessage(datatype,main) {
  let dataObj = {
      datatype: datatype,
      main:main
  };
  let data = JSON.stringify(dataObj);
  return data;
}

//This is test function for building json type
function buildLoginJson(name,password){
  let main = {
    username: name,
    password: password
  };
  return main;
}
