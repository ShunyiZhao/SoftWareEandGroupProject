// Create a client instance, we create a random id so the broker will allow multiple sessions

client = new Paho.MQTT.Client("broker.mqttdashboard.com", 8000, "clientId" + makeid(3)) ;

// set callback handlers
client.onConnectionLost = onConnectionLost;
client.onMessageArrived = onMessageArrived;

// connect the client
client.connect({onSuccess:onConnect});

var checkBoxContainer = document.getElementsByClassName('checkBoxContainer')[0];
var copyCheckBoxContainer = checkBoxContainer.cloneNode();
var checkBoxButton = checkBoxContainer.getElementsByClassName("checkBoxButton")[0];
checkBoxButton.addEventListener('click', checkTickedItems);

function checkTickedItems () {
  let Text = [];
  var getFoodCategory = checkBoxContainer.getElementsByClassName("foodCategory");
  for (var i = 0; i < getFoodCategory.length; i++) {
      var reviewCheckBox = getFoodCategory[i].getElementsByClassName("checkBox")
      var getImgAltTag = getFoodCategory[i].getElementsByClassName("checkBoxImage");
      for (var j = 0; j < reviewCheckBox.length; j++) {
          var getAltName = getImgAltTag[j].getAttribute("alt");
          if (reviewCheckBox[j].checked == true) {
              Text.push(getAltName);
          }
      }
  }
  onSubmit(JSON.stringify(Text));
  location.reload();
}

// called when the client connects
function onSubmit(payload) {
  // Once a connection has been made, make a subscription and send a message.
  console.log("onSubmit");
  client.subscribe("Big Eater");
  message = new Paho.MQTT.Message(payload);
  message.destinationName = "Big Eater";
  client.send(message);
}

function updateTable(payload){
	var tr;
	tr = $('<tr/>');
	tr.append("<td>" + json[0].order_id + "</td>");
	tr.append("<td>" + json[1].status + "</td>");
	tr.append("<td>" + json[4].delivery_address + "</td>");
	$('table').append(tr);
}

// called when the client connects
function onConnect() {
  // Once a connection has been made report.
  console.log("Connected");
}

// called when the client loses its connection
function onConnectionLost(responseObject) {
  if (responseObject.errorCode !== 0) {
    console.log("onConnectionLost:"+responseObject.errorMessage);
  }
}

// called when a message arrives
function onMessageArrived(message) {
  console.log("Message is " + message);
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
