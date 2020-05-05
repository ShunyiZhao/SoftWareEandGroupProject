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
    client.subscribe("/BigEater");
    //test admin pass--will be del after connect with processing
    subLogin();
    //subChart();
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

function requireStop(payload){
  client.subscribe("/BigEater");
  message = new Paho.MQTT.Message(payload);
  message.destinationName = "/BigEater";
  client.send(message);
}

//This is test function for building json type
function buildLoginJson(name,password){
  let main = {
    username: name,
    password: password
  };
  return main;
}

function subChart(){
  var mainMsg = buildChartJson();
  data = buildMessage("chart",mainMsg)
  message = new Paho.MQTT.Message(data);
  message.destinationName = "/BigEater";
  client.send(message);
}

function subLogin(){
  var mainMsg = buildLoginJson("mz19460@bristol.ac.uk","1234567")
  data = buildMessage("admin",mainMsg)
  message = new Paho.MQTT.Message(data);
  message.destinationName = "/BigEater";
  client.send(message);
}

function buildChartJson(){
  let main = {
      score: 3,
      bonus:2,
      combo:5,
      salad: 1,
      pineapple: 0,
      fish: 2,
      virus: 3,
      crab: 10,
      eggplant: 0,
      cheese: 0
  };
  return main;
}